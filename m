Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B256920CE1
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 18:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F8F89149;
	Thu, 16 May 2019 16:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50E189149
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:25:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0A042FD;
 Thu, 16 May 2019 18:25:55 +0200 (CEST)
Date: Thu, 16 May 2019 19:25:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Subject: Re: [PATCH v2] drm/bridge: Remove duplicate header
Message-ID: <20190516162539.GM14820@pendragon.ideasonboard.com>
References: <5cdd8109.1c69fb81.6e003.b84b@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cdd8109.1c69fb81.6e003.b84b@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558023955;
 bh=OeMvK4hxpeHY0MVypA/a1HjA/ZZfVlDkOTjFiew+YOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RKLkr5ZExVqS/O7bEpCPtl/7UIg8ZdC4ZJwTdaIQQTQ5iJfZo/E7zoivEpXPnhfl2
 KOXq7uSR36agQKxpbKPo6JXTG7z0zRPUKVwpIxpenOXyHtmi7N4Su3s2wT+lG/cfgV
 6pIGi2zE49bIGHYFyEAO9B63GX3NT/6/RrxSpO+o=
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

SGVsbG8gU2FieWFzYWNoaSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBNYXkg
MTYsIDIwMTkgYXQgMDg6NTU6NTZQTSArMDUzMCwgU2FieWFzYWNoaSBHdXB0YSB3cm90ZToKPiBS
ZW1vdmUgZHVwbGljYXRlIGhlYWRlciB3aGljaCBpcyBpbmNsdWRlZCB0d2ljZQo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFNhYnlhc2FjaGkgR3VwdGEgPHNhYnlhc2FjaGkubGludXhAZ21haWwuY29tPgoK
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KCj4gLS0tCj4gdjI6IHJlYmFzZWQgdGhlIGNvZGUgYWdhaW5zdCBkcm0gLW5leHQg
YW5kIGFycmFuZ2VkIHRoZSBoZWFkZXJzIGFscGhhYmV0aWNhbGx5Cj4gCj4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvcGFuZWwuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9wYW5lbC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCj4gaW5kZXggMzhl
ZWFmOC4uMDAwYmE3YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVs
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKPiBAQCAtOSwxMyArOSwx
MiBAQAo+ICAgKi8KPiAgCj4gICNpbmNsdWRlIDxkcm0vZHJtUC5oPgo+IC0jaW5jbHVkZSA8ZHJt
L2RybV9wYW5lbC5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cj4gICNp
bmNsdWRlIDxkcm0vZHJtX2Nvbm5lY3Rvci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVy
Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaD4KPiAtI2lu
Y2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3BhbmVs
Lmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+ICAKPiAgc3RydWN0IHBh
bmVsX2JyaWRnZSB7Cj4gIAlzdHJ1Y3QgZHJtX2JyaWRnZSBicmlkZ2U7CgotLSAKUmVnYXJkcywK
CkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
