Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DAE1AE6D0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 22:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22EB6EA63;
	Fri, 17 Apr 2020 20:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAC36EA63
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:32:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBDD597D;
 Fri, 17 Apr 2020 22:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587155527;
 bh=1RvHnw1ZKhlevuDKfvQm0YMBAgl2taaV6W32cNSeN90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M6wUmW99K5brWfnux+9+uX/q440cDm4Sw56pfg/pbcdca7cCpAkjAyMPXvZNBf8uD
 2GzsiMlqiByDl3fydpDeVkMMVog46ibW0UPuH8ItugJG4tkOyZD18WyBGJG9ic5T9A
 niZfeQ5d/keJ/13kFEXc7sHVeab6LhPkhVl6kvEs=
Date: Fri, 17 Apr 2020 23:31:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
Message-ID: <20200417203154.GK5861@pendragon.ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-3-digetx@gmail.com>
 <20200417193018.GI5861@pendragon.ideasonboard.com>
 <0acc35fd-a74b-e726-7a16-55db13265c39@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0acc35fd-a74b-e726-7a16-55db13265c39@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKT24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMTA6NDE6NTlQTSArMDMwMCwgRG1p
dHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDE3LjA0LjIwMjAgMjI6MzAsIExhdXJlbnQgUGluY2hhcnQg
0L/QuNGI0LXRgjoKPiAuLi4KPiA+PiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+Cj4gPj4g
KyNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+ID4gCj4gPiBZb3UgY291bGQgYWRkIGEgZm9y
d2FyZCBkZWNsYXJhdGlvbiBvZiBzdHJ1Y3QgZHJtX2JyaWRnZSBpbnN0ZWFkLCB0aGF0Cj4gPiBj
YW4gbG93ZXIgdGhlIGNvbXBpbGF0aW9uIHRpbWUgYSBsaXR0bGUgYml0Lgo+IAo+IFRoaXMgaW5j
bHVkZSBpcyBub3Qgb25seSBmb3IgdGhlIHN0cnVjdCwgYnV0IGFsc28gZm9yIHRoZQo+IGRybV9i
cmlkZ2VfYXR0YWNoKCkuIEl0IGxvb2tzIHRvIG1lIHRoYXQgaXQgc2hvdWxkIGJlIG5pY2VyIHRv
IGtlZXAgdGhlCj4gaW5jbHVkZSBoZXJlLgoKZHJtX2JyaWRnZV9hdHRhY2goKSBpcyBjYWxsZWQg
ZnJvbSAuYyBmaWxlcy4gSW4gdGhlIC5oIGZpbGUgeW91IGNhbiB1c2UKYSBmb3J3YXJkIGRlY2xh
cmF0aW9uLiBJdCdzIGVudGlyZWx5IHVwIHRvIHlvdSwgYnV0IGFzIGEgZ2VuZXJhbCBydWxlLCBJ
CnBlcnNvbmFsbHkgdHJ5IHRvIHVzZSBmb3J3YXJkIHN0cnVjdHVyZSBkZWNsYXJhdGlvbnMgaW4g
LmggZmlsZXMgYXMgbXVjaAphcyBwb3NzaWJsZS4KCj4gLi4uCj4gPj4gKwlwb3J0ID0gb2ZfZ2V0
X2NoaWxkX2J5X25hbWUob3V0cHV0LT5vZl9ub2RlLCAicG9ydCIpOwo+ID4gCj4gPiBEbyB5b3Ug
bmVlZCB0byBjaGVjayBmb3IgdGhlIHByZXNlbmNlIG9mIGEgcG9ydCBub2RlIGZpcnN0ID8gQ2Fu
IHlvdQo+ID4ganVzdCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlIG9mIGRybV9vZl9maW5kX3BhbmVs
X29yX2JyaWRnZSgpLCBhbmQgZmFsbAo+ID4gYmFjayB0byAibnZpZGlhLHBhbmVsIiBpZiBpdCBy
ZXR1cm5zIC1FTk9ERVYgPwo+IAo+IFdpdGhvdXQgdGhlIGNoZWNrLCB0aGUgZHJtX29mX2ZpbmRf
cGFuZWxfb3JfYnJpZGdlKCkgcHJpbnRzIGEgdmVyeSBub2lzeQo+IGVycm9yIG1lc3NhZ2UgYWJv
dXQgbWlzc2luZyBwb3J0IG5vZGUgZm9yIGV2ZXJ5IG91dHB1dCB0aGF0IGRvZXNuJ3QgaGF2ZQo+
IGEgZ3JhcGggc3BlY2lmaWVkIGluIGEgZGV2aWNlLXRyZWUgKEhETUksIERTSSBhbmQgZXRjKS4K
PiAKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS43LXJjMS9zb3VyY2UvZHJp
dmVycy9vZi9wcm9wZXJ0eS5jI0w2MjEKCkFoIHllcyBpbmRlZWQuIFRoYXQncyBub3QgdmVyeSBu
aWNlLgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
