Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CFB484E8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFE089267;
	Mon, 17 Jun 2019 14:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 523 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2019 14:07:28 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1E689265;
 Mon, 17 Jun 2019 14:07:28 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id F14C65C04DF;
 Mon, 17 Jun 2019 15:58:43 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 17 Jun 2019 15:58:43 +0200
From: Stefan Agner <stefan@agner.ch>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 15/59] drm/fsl-dcu: Drop drm_gem_prime_export/import
In-Reply-To: <20190614203615.12639-16-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-16-daniel.vetter@ffwll.ch>
Message-ID: <57ea243c6e034407387e77848a87f199@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1560779923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/Q4idLo02AfEPc1nXkpiE2tiIrkYX2YazxlVyMGAIs=;
 b=wJZP8A1u/jgKUQEG/7PiPctnVIuPwzmHltVLs+g2gm9j8NJuvHC9l+LIr4DTn00YIfEGJf
 6PM1b2GCxqM3RJDhpXsiQ0YiO8GRNBQVM2mEKfFQc8A5osoJ/c7KuNgi0e/XF6jL4AqH/D
 prMxQMuLELPxGBoKXTTjkgnYMIU+eCo=
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alison Wang <alison.wang@nxp.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQuMDYuMjAxOSAyMjozNSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBUaGV5J3JlIHRoZSBk
ZWZhdWx0Lgo+IAo+IEFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0Y2ggdGhlIG90
aGVycyBvdmVyIHRvCj4gZHJtX2dlbV9vYmplY3RfZnVuY3MuCgpBY2tlZC1ieTogU3RlZmFuIEFn
bmVyIDxzdGVmYW5AYWduZXIuY2g+CgotLQpTdGVmYW4KCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IFN0ZWZhbiBBZ25lciA8
c3RlZmFuQGFnbmVyLmNoPgo+IENjOiBBbGlzb24gV2FuZyA8YWxpc29uLndhbmdAbnhwLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fZHJ2LmMgfCAyIC0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZnNsLWRjdS9mc2xfZGN1X2RybV9kcnYuYwo+IGIvZHJpdmVycy9ncHUvZHJt
L2ZzbC1kY3UvZnNsX2RjdV9kcm1fZHJ2LmMKPiBpbmRleCBkMThmZjcyOWQ3ZjYuLjY2MTcyNWQ4
ZjdkYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZnNsLWRjdS9mc2xfZGN1X2RybV9k
cnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX2Rydi5jCj4g
QEAgLTE0Myw4ICsxNDMsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZnNsX2RjdV9kcm1f
ZHJpdmVyID0gewo+ICAJLmdlbV92bV9vcHMJCT0gJmRybV9nZW1fY21hX3ZtX29wcywKPiAgCS5w
cmltZV9oYW5kbGVfdG9fZmQJPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKPiAgCS5wcmlt
ZV9mZF90b19oYW5kbGUJPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwKPiAtCS5nZW1fcHJp
bWVfaW1wb3J0CT0gZHJtX2dlbV9wcmltZV9pbXBvcnQsCj4gLQkuZ2VtX3ByaW1lX2V4cG9ydAk9
IGRybV9nZW1fcHJpbWVfZXhwb3J0LAo+ICAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUJPSBkcm1f
Z2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUsCj4gIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJs
ZSA9IGRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9zZ190YWJsZSwKPiAgCS5nZW1fcHJpbWVfdm1h
cAkJPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
