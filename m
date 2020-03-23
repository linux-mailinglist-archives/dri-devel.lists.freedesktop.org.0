Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D419718F88F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 16:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C88689FE8;
	Mon, 23 Mar 2020 15:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF3C89EB8;
 Mon, 23 Mar 2020 15:27:34 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F359A20753;
 Mon, 23 Mar 2020 15:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584977254;
 bh=xOqq5EJpB2o23tf+pBi8nz8OCf2xIoR5Zn3xOcpr0ME=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=etDD57T95D/vZj3yBXVyHTy8IQCvVvHnrtJ6hjVG+hyU/IuDpJthwkx4L6vW61Q/1
 Q99fxJJc7eYU8oDz/pzVRu/kFbfHBRuSXQbYZE9I+WOSecmAwXKscTDRGWqKORikF2
 L+3vyfVoKSQuVyDZfHBvEq4BiYhgL3aicphl0uig=
Received: by mail-ed1-f49.google.com with SMTP id cf14so7449316edb.13;
 Mon, 23 Mar 2020 08:27:33 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3Ln/yxSqK4CIjRmbSRqfl7DcJ1aPItYT2REf0OYCHIelC2Na5k
 20hFpKLk67SK9bIqcxPaESS+hBaFLVyxzX6RdQ==
X-Google-Smtp-Source: ADFU+vuDI8KNnRoKFSAstx1hucdlMjn74a2jaPiJd130QBNI4t9EZyPzdDEiL5VbY4BkKn+02JECg5pudnlDcsjFpzk=
X-Received: by 2002:a17:906:2102:: with SMTP id
 2mr6384275ejt.201.1584977252392; 
 Mon, 23 Mar 2020 08:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
 <20200323144950.3018436-41-daniel.vetter@ffwll.ch>
In-Reply-To: <20200323144950.3018436-41-daniel.vetter@ffwll.ch>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Mar 2020 23:27:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Hy6OiJ7-qaitaudOqJ4VdYqRBnuG+wfzaCr9=bN2U+w@mail.gmail.com>
Message-ID: <CAAOTY_9Hy6OiJ7-qaitaudOqJ4VdYqRBnuG+wfzaCr9=bN2U+w@mail.gmail.com>
Subject: Re: [PATCH 40/51] drm/mtk: Drop explicit drm_mode_config_cleanup call
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4g5pa8IDIwMjDlubQz5pyIMjPm
l6Ug6YCx5LiAIOS4i+WNiDEwOjUx5a+r6YGT77yaCj4KPiBJdCdzIHJpZ2h0IGFib3ZlIHRoZSBk
cm1fZGV2X3B1dCgpLgo+Cj4gVGhpcyBpcyBtYWRlIHBvc3NpYmxlIGJ5IGEgcHJlY2VlZGluZyBw
YXRjaCB3aGljaCBhZGRlZCBhIGRybW1fCj4gY2xlYW51cCBhY3Rpb24gdG8gZHJtX21vZGVfY29u
ZmlnX2luaXQoKSwgaGVuY2UgYWxsIHdlIG5lZWQgdG8gZG8gdG8KPiBlbnN1cmUgdGhhdCBkcm1f
bW9kZV9jb25maWdfY2xlYW51cCgpIGlzIHJ1biBvbiBmaW5hbCBkcm1fZGV2aWNlCj4gY2xlYW51
cCBpcyBjaGVjayB0aGUgbmV3IGVycm9yIGNvZGUgZm9yIF9pbml0KCkuCj4KPiBBc2lkZTogQW5v
dGhlciBkcml2ZXIgd2l0aCBhIGJpdCBtdWNoIGRldm1fa3phbGxvYywgd2hpY2ggc2hvdWxkCj4g
cHJvYmFibHkgdXNlIGRybW1fa3phbGxvYyBpbnN0ZWFkIC4uLgo+Cj4gdjI6IEV4cGxhaW4gd2h5
IHRoaXMgY2xlYW51cCBpcyBwb3NzaWJsZSAoTGF1cmVudCkuCj4KPiB2MzogVXNlIGRybW1fbW9k
ZV9jb25maWdfaW5pdCgpIGZvciBtb3JlIGNsYXJpdHkgKFNhbSwgVGhvbWFzKQo+CgpBY2tlZC1i
eTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IEFja2VkLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCA5ICsr
KystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBpbmRleCAwNTYzYzY4
MTMzMzMuLjJlYWE5MDgwZDI1MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jCj4gQEAgLTE2Miw3ICsxNjIsOSBAQCBzdGF0aWMgaW50IG10a19kcm1fa21zX2luaXQo
c3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiAgICAgICAgIH0KPiAgICAgICAgIHByaXZhdGUtPm11
dGV4X2RldiA9ICZwZGV2LT5kZXY7Cj4KPiAtICAgICAgIGRybV9tb2RlX2NvbmZpZ19pbml0KGRy
bSk7Cj4gKyAgICAgICByZXQgPSBkcm1tX21vZGVfY29uZmlnX2luaXQoZHJtKTsKPiArICAgICAg
IGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiAgICAgICAgIGRybS0+
bW9kZV9jb25maWcubWluX3dpZHRoID0gNjQ7Cj4gICAgICAgICBkcm0tPm1vZGVfY29uZmlnLm1p
bl9oZWlnaHQgPSA2NDsKPiBAQCAtMTc5LDcgKzE4MSw3IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9r
bXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQo+Cj4gICAgICAgICByZXQgPSBjb21wb25l
bnRfYmluZF9hbGwoZHJtLT5kZXYsIGRybSk7Cj4gICAgICAgICBpZiAocmV0KQo+IC0gICAgICAg
ICAgICAgICBnb3RvIGVycl9jb25maWdfY2xlYW51cDsKPiArICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIFdlIGN1cnJlbnRseSBzdXBwb3J0IHR3
byBmaXhlZCBkYXRhIHN0cmVhbXMsIGVhY2ggb3B0aW9uYWwsCj4gQEAgLTI1NSw4ICsyNTcsNiBA
QCBzdGF0aWMgaW50IG10a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiAg
ICAgICAgICAgICAgICAgZG1hX2Rldi0+ZG1hX3Bhcm1zID0gTlVMTDsKPiAgZXJyX2NvbXBvbmVu
dF91bmJpbmQ6Cj4gICAgICAgICBjb21wb25lbnRfdW5iaW5kX2FsbChkcm0tPmRldiwgZHJtKTsK
PiAtZXJyX2NvbmZpZ19jbGVhbnVwOgo+IC0gICAgICAgZHJtX21vZGVfY29uZmlnX2NsZWFudXAo
ZHJtKTsKPgo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+IEBAIC0yNzIsNyArMjcyLDYgQEAg
c3RhdGljIHZvaWQgbXRrX2RybV9rbXNfZGVpbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCj4g
ICAgICAgICAgICAgICAgIHByaXZhdGUtPmRtYV9kZXYtPmRtYV9wYXJtcyA9IE5VTEw7Cj4KPiAg
ICAgICAgIGNvbXBvbmVudF91bmJpbmRfYWxsKGRybS0+ZGV2LCBkcm0pOwo+IC0gICAgICAgZHJt
X21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKPiAgfQo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZmlsZV9vcGVyYXRpb25zIG10a19kcm1fZm9wcyA9IHsKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
