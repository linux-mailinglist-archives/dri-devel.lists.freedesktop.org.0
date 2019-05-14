Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B5C1C3DC
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0AA89263;
	Tue, 14 May 2019 07:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6BE892AA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 07:36:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 882062B6;
 Tue, 14 May 2019 09:35:58 +0200 (CEST)
Date: Tue, 14 May 2019 10:35:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Subject: Re: [PATCH] drm/bridge: Remove duplicate header
Message-ID: <20190514073542.GA4969@pendragon.ideasonboard.com>
References: <5cda6ee2.1c69fb81.2949b.d3e7@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cda6ee2.1c69fb81.2949b.d3e7@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557819358;
 bh=nolBExI+DWiS8pK5x3HhfK+hZ9kk42aFw2lSkjS8Nh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oTMqPVjtXKUfpi1KBEi5RChx30hzmziJFFeKC14+oQlD3zipyBNFMKlcvX1Aqg8Dd
 c7LOV+/rXlfrHtGWnTuU5NvcFtlEg7pRVQnoukwFE+YmLcf/7ol724o4sDVN+u5pcb
 Fx0y6fbHqWBP8AdnCXPIXNGEh0H0IGbdMdfsZzpk=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: architt@codeaurora.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jrdr.linux@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FieWFzYWNoaSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVHVlLCBNYXkgMTQs
IDIwMTkgYXQgMDE6MDE6NDFQTSArMDUzMCwgU2FieWFzYWNoaSBHdXB0YSB3cm90ZToKPiBSZW1v
dmUgZHJtL2RybV9wYW5lbC5oIHdoaWNoIGlzIGluY2x1ZGVkIG1vcmUgdGhhbiBvbmNlCj4gCj4g
U2lnbmVkLW9mZi1ieTogU2FieWFzYWNoaSBHdXB0YSA8c2FieWFzYWNoaS5saW51eEBnbWFpbC5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyB8IDEgLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKPiBpbmRl
eCA3Y2JhYmEyLi40MDJiMzE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
cGFuZWwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwo+IEBAIC0xNSw3
ICsxNSw2IEBACj4gICNpbmNsdWRlIDxkcm0vZHJtX2NydGNfaGVscGVyLmg+Cj4gICNpbmNsdWRl
IDxkcm0vZHJtX2VuY29kZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fbW9kZXNldF9oZWxwZXJf
dnRhYmxlcy5oPgo+IC0jaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgoKV2hpY2ggdHJlZSBpcyB0
aGlzIGFnYWluc3QgPyBUaGUgcGF0Y2ggYXBwbGllcyBvbiBuZWl0aGVyIGRybS1uZXh0IG5vcgpk
cm0tbWlzYy1uZXh0LgoKV2hpbGUgYXQgaXQsIGNvdWxkIHlvdSB5b3UgcmVvcmRlciB0aGUgb3Ro
ZXIgaGVhZGVyIGFscGhhYmV0aWNhbGx5IHRvCm1ha2UgdGhpcyBraW5kIG9mIGlzc3VlIGVhc2ll
ciB0byBub3RpY2UgPwoKPiAgCj4gIHN0cnVjdCBwYW5lbF9icmlkZ2Ugewo+ICAJc3RydWN0IGRy
bV9icmlkZ2UgYnJpZGdlOwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
