Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5072455966
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5E36E239;
	Tue, 25 Jun 2019 20:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E906E239
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:50:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D59D220021;
 Tue, 25 Jun 2019 22:50:11 +0200 (CEST)
Date: Tue, 25 Jun 2019 22:50:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/7] drm/fb-helper: use gem_bo.resv, not dma_buf.resv in
 prepare_fb
Message-ID: <20190625205010.GB19279@ravnborg.org>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
 <20190625204208.5614-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625204208.5614-2-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=-VAfIpHNAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=8AQNI-AmChTmNO6_R9sA:9
 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22 a=srlwD-8ojaedGGhPAyx8:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6NDI6MDJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXaXRoCj4gCj4gY29tbWl0IDVmNmVkOTg3OWE0MTQ2MzY0MDVhMmJkNzdmMTIyODgx
Njk1OTU5ZTQKPiBBdXRob3I6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cj4gRGF0ZTogICBGcmkgSnVuIDE0IDIyOjM1OjU3IDIwMTkgKzAyMDAKPiAKPiAgICAgZHJtL3By
aW1lOiBhdXRvbWF0aWNhbGx5IHNldCBnZW1fb2JqLT5yZXN2IG9uIGltcG9ydAo+IAo+IHdlIGNv
bnNpc3RlbnRseSBzZXQgZHJtX2dlbV9iby5yZXN2IGZvciBpbXBvcnRlZCBidWZmZXJzLiBXaGlj
aCBtZWFucwo+IHdlIGRvbid0IG5lZWQgdG8gY2hlY2sgdG8gY2hlY2sgdGhlIGRtYS1idWYgaW4g
dGhlIHByZXBhcmVfZmIgaGVscGVyLApjaGVja2VkIGEgYml0IHRvbyBtdWNoPwo+IGJ1dCBjYW4g
Z2VuZXJhbGl6ZSB0aGVtIHNvIHRoZXkncmUgYWxzbyB1c2VmdWwgZm9yIGRpc3BsYXkrcmVuZGVy
Cj4gZHJpdmVycyB3aGljaCB1c2UgZ2VtX2JvLnJlc3YgdG8gdHJhY2sgdGhlaXIgb3duIHJlbmRl
cmluZyBmb3IgdGhlaXIKPiBvd24gc2Nhbm91dCBidWZmZXJzLgo+IAo+IENjOiBFbWlsIFZlbGlr
b3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0Bh
bmhvbHQubmV0Pgo+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
