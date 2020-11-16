Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B622B4D4E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDEA6E9DF;
	Mon, 16 Nov 2020 17:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171D46E09F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c17so19606208wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z5yx6D1LL1mWDIdbOcLaEDy3+e3cP8sILj2hqS9Zmtc=;
 b=L+oMJVXx9EMl4mh+bUkSyWc6ZsznYzTN9o/3eRri4X0NRlvMNWNqnxBqBkwgRByrAo
 S0YBk/0ZbUbEgQC33LIHX6VsvjaegjdE31kUMTrHVZbJAGoKJeY31+/chdLLZkmZhXyh
 IKrFDhsb/E3Mo7AcvEE05zKwMPDR2yHeiAFTAQmWXdEa7mlcKJ7fWIzJdrg/NHw4uCTR
 UirIeKolIisdhu4AO1Vgop6f8jxP5LHeQu6Wq57KGlZ9Ghl9UY6EIeeLQpRKhaoHdgZE
 7solyMQ6JcSANJehQQrpPE9xiw2u/hn5rmtbWnd02b0KPSibjLJQDvttOjd9bFF11BcI
 m8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z5yx6D1LL1mWDIdbOcLaEDy3+e3cP8sILj2hqS9Zmtc=;
 b=mFiJPHBnrRsCSVxI9CHSfKaNfcFkzyExMTbf1Jc/BxYL/4mXnrJJvjNS6ezL0yaMO9
 uT8JOAw6cAfcwlAU+A/GI5Wjm7n8jAP/J9gSiSVwxavCNCjMGimn2aQRPz+VKqjtC1PM
 GHu6kQj6PfK8TBOTmcHY5BBG4oVqs+2MzOiPprxDD5xO///0fyzc8ZXHwHLLun0yBcap
 q8Vkpc3Oc0RGZgEPCbs+yt8OPTKFEbIqMKDPXJZDxIUiPsnSTy9O86ygxSoTc3qFQLkw
 OutBVMHVK4Fvcp1z8627AGiSLdMDTjcwvQzQiuXA8qCw4stdj9+bwi5TJoeEgVi7oVGB
 zYFA==
X-Gm-Message-State: AOAM530DBK56bgqZD+Am5ayw0M+d+08hu+YI08FDHDUf9rY8fJafbfAq
 fzr+rIH/G3N8lnK8s8HVrcxXgLfNv7VKl4fL
X-Google-Smtp-Source: ABdhPJyi2ReCriIud7MCXtXYkZHOGLof/ScXRjgAQdEXSy8wOpvAJaJLGydwXG32pJHwmlLOSJsjpA==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr20002425wrw.43.1605548275782; 
 Mon, 16 Nov 2020 09:37:55 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:55 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 38/43] drm/radeon/cik: Move 'Move 'cik_sdma_*()'s prototypes
 to shared header
Date: Mon, 16 Nov 2020 17:36:55 +0000
Message-Id: <20201116173700.1830487-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9jaWtfc2RtYS5jOjMzMTo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBw
cm90b3R5cGUgZm9yIOKAmGNpa19zZG1hX2VuYWJsZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
CiAzMzEgfCB2b2lkIGNpa19zZG1hX2VuYWJsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwg
Ym9vbCBlbmFibGUpCiB8IF5+fn5+fn5+fn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9j
aWtfc2RtYS5jOjUyODo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGNp
a19zZG1hX3Jlc3VtZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiA1MjggfCBpbnQgY2lrX3Nk
bWFfcmVzdW1lKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogfCBefn5+fn5+fn5+fn5+fn4K
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrX3NkbWEuYzo1NTc6Njogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhjaWtfc2RtYV9maW5p4oCZIFstV21pc3NpbmctcHJvdG90
eXBlc10KIDU1NyB8IHZvaWQgY2lrX3NkbWFfZmluaShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dikKIHwgXn5+fn5+fn5+fn5+fgoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9y
Zz4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFy
by1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgfCAzIC0t
LQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuaCB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2Npay5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYwppbmRleCBj
ZWYwZjMxMTFjZDNhLi4yYWY3NjQ2MzkwNmFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL2Npay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMKQEAgLTEyOSw5
ICsxMjksNiBAQCBNT0RVTEVfRklSTVdBUkUoInJhZGVvbi9tdWxsaW5zX3JsYy5iaW4iKTsKIE1P
RFVMRV9GSVJNV0FSRSgicmFkZW9uL211bGxpbnNfc2RtYS5iaW4iKTsKIAogc3RhdGljIHUzMiBj
aWtfZ2V0X2N1X2FjdGl2ZV9iaXRtYXAoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBz
ZSwgdTMyIHNoKTsKLWV4dGVybiBpbnQgY2lrX3NkbWFfcmVzdW1lKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKLWV4dGVybiB2b2lkIGNpa19zZG1hX2VuYWJsZShzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiwgYm9vbCBlbmFibGUpOwotZXh0ZXJuIHZvaWQgY2lrX3NkbWFfZmluaShzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiBleHRlcm4gdm9pZCB2Y2VfdjJfMF9lbmFibGVfbWdj
ZyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgYm9vbCBlbmFibGUpOwogc3RhdGljIHZvaWQg
Y2lrX3JsY19zdG9wKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHN0YXRpYyB2b2lkIGNp
a19wY2llX2dlbjNfZW5hYmxlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2Npay5oCmluZGV4IDQyMDIwN2QxOWRlNTIuLmQxYmY1NDFkYTU5MjMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9j
aWsuaApAQCAtMzQsNCArMzQsNyBAQCB2b2lkIGNpa19pbml0X2NwX3BnX3RhYmxlKHN0cnVjdCBy
YWRlb25fZGV2aWNlICpyZGV2KTsKIHUzMiBjaWtfZ2V0X2NzYl9zaXplKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KTsKIHZvaWQgY2lrX2dldF9jc2JfYnVmZmVyKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2LCB2b2xhdGlsZSB1MzIgKmJ1ZmZlcik7CiAKK2ludCBjaWtfc2RtYV9yZXN1bWUo
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwordm9pZCBjaWtfc2RtYV9lbmFibGUoc3RydWN0
IHJhZGVvbl9kZXZpY2UgKnJkZXYsIGJvb2wgZW5hYmxlKTsKK3ZvaWQgY2lrX3NkbWFfZmluaShz
dHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiAjZW5kaWYgICAgICAgICAgICAgICAgICAgICAg
ICAgLyogX19DSUtfSF9fICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
