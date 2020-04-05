Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A111919F100
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A95D6E2D7;
	Mon,  6 Apr 2020 07:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F156D6E1E0
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 11:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1586087364; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KxJphrR8Liumkzi00BHwWA0qkPnbC0I71+WAOZAMF6s=;
 b=ln3IEtjNoRgLzEi6pZ1kp6yOmkVIMpiSZPxZoU13fGkr410lYTDQEZFtYNJYOXMJ8+VoDl
 CMW/KWaMsmw+RLLc9wS/NyjbCvGW2LoWAbeU3oX8hXjL3xoMkj/7Z3ONaxYg5ya+2erEcD
 kG3WpPTjR8GqGpulik1Ahn3+Mct04Ik=
Date: Sun, 05 Apr 2020 13:49:12 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in
 ingenic_drm_probe()
To: Markus Elfring <Markus.Elfring@web.de>
Message-Id: <1UCB8Q.TC6CW4K2D9X72@crapouillou.net>
In-Reply-To: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpMZSBkaW0uIDUgYXZyaWwgMjAyMCDDoCAxMTozMCwgTWFya3VzIEVsZnJpbmcgPE1hcmt1
cy5FbGZyaW5nQHdlYi5kZT4gYSAKw6ljcml0IDoKPiBGcm9tOiBNYXJrdXMgRWxmcmluZyA8ZWxm
cmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gRGF0ZTogU3VuLCA1IEFwciAyMDIwIDExOjI1
OjMwICswMjAwCj4gCj4gVGhlIGZ1bmN0aW9uIOKAnHBsYXRmb3JtX2dldF9pcnHigJ0gY2FuIGxv
ZyBhbiBlcnJvciBhbHJlYWR5Lgo+IFRodXMgb21pdCBhIHJlZHVuZGFudCBtZXNzYWdlIGZvciB0
aGUgZXhjZXB0aW9uIGhhbmRsaW5nIGluIHRoZQo+IGNhbGxpbmcgZnVuY3Rpb24uCj4gCj4gVGhp
cyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcgdGhlIENvY2NpbmVsbGUgc29mdHdhcmUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9y
Z2UubmV0PgoKUmV2aWV3ZWQtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0
PgoKQ2hlZXJzLAotUGF1bAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5p
Yy1kcm0uYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2Vu
aWMtZHJtLmMgCj4gYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCj4gaW5k
ZXggOWRmZTdjYjUzMGUxLi4wNmNhNzUyYjc2ZWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmlj
L2luZ2VuaWMtZHJtLmMKPiBAQCAtNjYxLDEwICs2NjEsOCBAQCBzdGF0aWMgaW50IGluZ2VuaWNf
ZHJtX3Byb2JlKHN0cnVjdCAKPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAl9Cj4gCj4gIAlp
cnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+IC0JaWYgKGlycSA8IDApIHsKPiAtCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgcGxhdGZvcm0gaXJxIik7Cj4gKwlpZiAoaXJxIDwg
MCkKPiAgCQlyZXR1cm4gaXJxOwo+IC0JfQo+IAo+ICAJaWYgKHNvY19pbmZvLT5uZWVkc19kZXZf
Y2xrKSB7Cj4gIAkJcHJpdi0+bGNkX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJsY2QiKTsKPiAt
LQo+IDIuMjYuMAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
