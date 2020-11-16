Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654B52B4D41
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BBD6E9A0;
	Mon, 16 Nov 2020 17:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1D96E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d12so19598652wrr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/Zj5V7ntHFWoK7hDL0KY4UUjT17GXd4P0At2oNvDPk=;
 b=TFBPvHxiNg0J66sXloeHlwrOB5eWbndg3GWxnxNUY/l85QSylm74QsaOu6c9V0sLmG
 gsrnImQVGr/vzI1O7BgbeoRNaysARDN0yLvRIL+qaCWtSVIL3Dki7e9FEDW8asTZVwZ6
 +KbfAcOKEr1hxQUuXN22cD2h5KNqAixBIbRYq2Qf8CZUofHYwO2YGcYYuXget9TsJXwS
 sSWUlQBWfMX4tksJumaQpklKT/jTnTL3slInD2HfyyF2gVExiphw0nn20uXiUWBwEc4T
 9naALP835/24p4ry/5XCk+jssfHvQcCihUPctJQpGv51yNSp70AKMXPK/mHf3HRNuU1n
 5s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/Zj5V7ntHFWoK7hDL0KY4UUjT17GXd4P0At2oNvDPk=;
 b=Kqur1M6ogquHgl9CvSoO7VfLnzWkEJZN+N9GvBGtKkrdaYAe8ou3WxnZqhB0nEzrqY
 xVHjSAfQsFjCWcmGoagbjUfRCmmkaCuZpzre7+y1pRuJHBjdZlEGuazncPV28kSWk7t4
 pbI88ztEfKvfnfElKGk+dbCohr2wVVunE3CSeND7mJPmfedRTVQlceeG0z+b/TLLbxu2
 uIKP2HEpHvVlMXwi+hW4MaXNGWDxomQX1gYOZ2iRkVXyv1vn40CDmyBzCmfq8VCXfM9p
 H7DSOj3BLFJnFJEWRXFxYxc7qCLW/Dokj7yMablxS1Tqee3Om2o5ommGJCRly9REsopN
 Ytcw==
X-Gm-Message-State: AOAM531k14k+uzsX0puK8Wd0dP3IaLiJ2fChWRG6P4xUIWhaSRCOZepf
 +/WEL8wPWM0g1siT4O/5kdU47w==
X-Google-Smtp-Source: ABdhPJyMK0Ji9phYwLd+YAD9fkz+za+2JWzXtRjSfGXUX56GVCuCSEw3Ah5D19tYN5hkRyKDaHQNxA==
X-Received: by 2002:adf:e512:: with SMTP id j18mr21789945wrm.390.1605548266827; 
 Mon, 16 Nov 2020 09:37:46 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/43] drm/radeon/cik: Move 'si_*()'s prototypes to shared
 header
Date: Mon, 16 Nov 2020 17:36:48 +0000
Message-Id: <20201116173700.1830487-32-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9zaS5jOjQxODY6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhzaV92cmFtX2d0dF9sb2NhdGlvbuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
CiA0MTg2IHwgdm9pZCBzaV92cmFtX2d0dF9sb2NhdGlvbihzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldiwKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn4KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2ku
Yzo1MTg2OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYc2lfaW5pdF91
dmRfaW50ZXJuYWxfY2figJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogNTE4NiB8IHZvaWQgc2lf
aW5pdF91dmRfaW50ZXJuYWxfY2coc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiB8IF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmM6NTgwMTo2OiB3
YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHNpX3JsY19yZXNldOKAmSBbLVdt
aXNzaW5nLXByb3RvdHlwZXNdCiA1ODAxIHwgdm9pZCBzaV9ybGNfcmVzZXQoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYpCiB8IF5+fn5+fn5+fn5+fgoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
Y2lrLmMgfCA0ICstLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuaCAgfCA0ICsrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2Npay5jCmluZGV4IGFlMDIwYWQ3YjMxODUuLmNlZjBmMzExMWNkM2EgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9j
aWsuYwpAQCAtNDAsNiArNDAsNyBAQAogI2luY2x1ZGUgInJhZGVvbl9hc2ljLmgiCiAjaW5jbHVk
ZSAicmFkZW9uX2F1ZGlvLmgiCiAjaW5jbHVkZSAicmFkZW9uX3Vjb2RlLmgiCisjaW5jbHVkZSAi
c2kuaCIKIAogI2RlZmluZSBTSF9NRU1fQ09ORklHX0dGWF9ERUZBVUxUIFwKIAlBTElHTk1FTlRf
TU9ERShTSF9NRU1fQUxJR05NRU5UX01PREVfVU5BTElHTkVEKQpAQCAtMTI3LDkgKzEyOCw2IEBA
IE1PRFVMRV9GSVJNV0FSRSgicmFkZW9uL211bGxpbnNfbWVjLmJpbiIpOwogTU9EVUxFX0ZJUk1X
QVJFKCJyYWRlb24vbXVsbGluc19ybGMuYmluIik7CiBNT0RVTEVfRklSTVdBUkUoInJhZGVvbi9t
dWxsaW5zX3NkbWEuYmluIik7CiAKLWV4dGVybiB2b2lkIHNpX3ZyYW1fZ3R0X2xvY2F0aW9uKHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcmFkZW9uX21jICptYyk7Ci1leHRlcm4g
dm9pZCBzaV9ybGNfcmVzZXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwotZXh0ZXJuIHZv
aWQgc2lfaW5pdF91dmRfaW50ZXJuYWxfY2coc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwog
c3RhdGljIHUzMiBjaWtfZ2V0X2N1X2FjdGl2ZV9iaXRtYXAoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYsIHUzMiBzZSwgdTMyIHNoKTsKIGV4dGVybiBpbnQgY2lrX3NkbWFfcmVzdW1lKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2KTsKIGV4dGVybiB2b2lkIGNpa19zZG1hX2VuYWJsZShzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgYm9vbCBlbmFibGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9zaS5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5oCmluZGV4
IGExNzUxYWU1NjBmMDIuLmY0ODNhNjRkMTcwNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vc2kuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmgKQEAgLTI1LDgg
KzI1LDEyIEBACiAjZGVmaW5lIF9fU0lfSF9fCiAKIHN0cnVjdCByYWRlb25fZGV2aWNlOworc3Ry
dWN0IHJhZGVvbl9tYzsKIAogaW50IHNpX21jX2xvYWRfbWljcm9jb2RlKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KTsKIHUzMiBzaV9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9u
X2RldmljZSAqcmRldik7Cit2b2lkIHNpX3ZyYW1fZ3R0X2xvY2F0aW9uKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcmFkZW9uX21jICptYyk7Cit2b2lkIHNpX3JsY19yZXNldChz
dHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cit2b2lkIHNpX2luaXRfdXZkX2ludGVybmFsX2Nn
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIAogI2VuZGlmICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIF9fU0lfSF9fICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
