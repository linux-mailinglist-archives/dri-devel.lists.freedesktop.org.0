Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5A3D1B12
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 23:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733786E330;
	Wed,  9 Oct 2019 21:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD3A6E330
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 21:40:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30B774FF;
 Wed,  9 Oct 2019 23:40:35 +0200 (CEST)
Date: Thu, 10 Oct 2019 00:40:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH 3/4] drm/omap: Remove set but not used variable 'err' in
 hdmi5_audio_config
Message-ID: <20191009214034.GT22998@pendragon.ideasonboard.com>
References: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
 <1570518949-47574-4-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570518949-47574-4-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570657235;
 bh=KaKBeCbx48ofDudScq2Ff7nNn5U2kFPTsDiV/A6Ttg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=flk4Fce9KJGRbnpqQMv11mLiRr0VjPjjUTLlFzBVpPZL0A3A6pvxe7gFTyfn1I4X9
 +DKCqb3R4ENX6gvCRIvLpiDVZbzVeadDYP83pKr9G5ochIqgTDpaKtnlef5KTKknmL
 T05NHamJNMkVEDID8GPpgx5afxjOJrmO/ZsprUyY=
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
Cc: airlied@linux.ie, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWmhlbmdiaW4sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFR1ZSwgT2N0IDA4LCAy
MDE5IGF0IDAzOjE1OjQ4UE0gKzA4MDAsIHpoZW5nYmluIHdyb3RlOgo+IEZpeGVzIGdjYyAnLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPiAKPiBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvaGRtaTVfY29yZS5jOiBJbiBmdW5jdGlvbiBoZG1pNV9hdWRpb19jb25maWc6Cj4g
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk1X2NvcmUuYzo4MTI6Njogd2FybmluZzog
dmFyaWFibGUgZXJyIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
Cj4gCj4gSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IGY1YmFiMjIyOTE5MCAoIk9NQVBEU1M6
Cj4gSERNSTogQWRkIE9NQVA1IEhETUkgc3VwcG9ydCIpCj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsg
Um9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVu
Z2JpbjEzQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9o
ZG1pNV9jb3JlLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2hkbWk1X2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNV9jb3Jl
LmMKPiBpbmRleCA3NDAwZmI5Li4wYjc5ZmYwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL2Rzcy9oZG1pNV9jb3JlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvaGRtaTVfY29yZS5jCj4gQEAgLTc5OCw3ICs3OTgsNyBAQCBpbnQgaGRtaTVfYXVkaW9f
Y29uZmlnKHN0cnVjdCBoZG1pX2NvcmVfZGF0YSAqY29yZSwgc3RydWN0IGhkbWlfd3BfZGF0YSAq
d3AsCj4gIAlzdHJ1Y3QgaGRtaV9hdWRpb19mb3JtYXQgYXVkaW9fZm9ybWF0Owo+ICAJc3RydWN0
IGhkbWlfYXVkaW9fZG1hIGF1ZGlvX2RtYTsKPiAgCXN0cnVjdCBoZG1pX2NvcmVfYXVkaW9fY29u
ZmlnIGNvcmVfY2ZnOwo+IC0JaW50IGVyciwgbiwgY3RzLCBjaGFubmVsX2NvdW50Owo+ICsJaW50
IG4sIGN0cywgY2hhbm5lbF9jb3VudDsKPiAgCXVuc2lnbmVkIGludCBmc19ucjsKPiAgCWJvb2wg
d29yZF9sZW5ndGhfMTZiID0gZmFsc2U7Cj4gCj4gQEAgLTg0MSw3ICs4NDEsNyBAQCBpbnQgaGRt
aTVfYXVkaW9fY29uZmlnKHN0cnVjdCBoZG1pX2NvcmVfZGF0YSAqY29yZSwgc3RydWN0IGhkbWlf
d3BfZGF0YSAqd3AsCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAl9Cj4gCj4gLQllcnIgPSBoZG1p
X2NvbXB1dGVfYWNyKHBjbGssIGZzX25yLCAmbiwgJmN0cyk7Cj4gKwloZG1pX2NvbXB1dGVfYWNy
KHBjbGssIGZzX25yLCAmbiwgJmN0cyk7CgpJZGVhbGx5IHdlIHNob3VsZCBwcm9wYWdhdGUgdGhl
IGVycm9yIGJhY2ssIGJ1dCB3ZSB3b3VsZCBlbmQgdXAgaW4KaGRtaTVfYnJpZGdlX2VuYWJsZSgp
IHRoYXQgaXMgYSB2b2lkIGZ1bmN0aW9uLCBzbyB0aGVyZSdzIGxpdHRsZSBwb2ludAppbiBkb2lu
ZyBzby4gRnVydGhlbW9yZSB0aGUgZXJyb3JzIHJlcG9ydGVkIGJ5IGhkbWlfY29tcHV0ZV9hY3Io
KSByZWFsbHkKY2FuJ3QgaGFwcGVuLCBzbyB0aGlzIGlzIHNhZmUuCgpSZXZpZXdlZC1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKPiAgCWNv
cmVfY2ZnLm4gPSBuOwo+ICAJY29yZV9jZmcuY3RzID0gY3RzOwo+IAoKLS0gClJlZ2FyZHMsCgpM
YXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
