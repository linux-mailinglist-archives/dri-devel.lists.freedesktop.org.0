Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F38C2AF824
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39756E0C4;
	Wed, 11 Nov 2020 18:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACCD6E0C5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:36:11 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s13so3242008wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wcR9SHA/hLxAo0DjnBJYKl1ZjLgHXt+Q6E2OPcU6TRk=;
 b=ZppS/pPTRTgdttLh54xP750Kj6wz+Skcp0gIoIgehdUbqo2zKnEjGa/yiqC1zsRVT1
 RojNDkdIIOVwEH/cxzrfw4IzVBy+MNQX717cjqzVcQD/DhZ7iqciX6SM6vWljUD9C7vy
 INmw17RivPboOAMS7Evvldk4WAubEVgS4S/nkTyULsmgnbzDLjGxfJfy+SxvxwbIOBkd
 Z8BJJPyj9Xo5ParXgCKw1BIgyM1MPmCqIDQXge0PR3SNWPVIVb1bugXxBYfp9WDf+xld
 Hhidwk+ywKJksPFcW9w+HUDn2U5kjpbYCXXweJoLxXkIhKaCfiQqoIVuzgh6iYP2RRo0
 amRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wcR9SHA/hLxAo0DjnBJYKl1ZjLgHXt+Q6E2OPcU6TRk=;
 b=VjT9fFFLYHANnmSefs7exBD6zgM8HckUR+P4Y0PNQGY8U5XCYgb42P0A0p1yBDRGgR
 puMCo/jaY0zUyp1ZGP0XRkq5w4xgDFlXgY7qOF3v5NXLK2cejcXDevQzGd5jjtkEPN+d
 DYIKBJdSgrLAvGxUv2kdXDa45Ygi1mqasiwgqUqjf7kjqKrn7HcdPNmFhH7XdTBMrlLN
 qCh5sYM68/2yFfP30s2U+8+sI/hWWFvSpp1YDGthJBwgnUU44rGrk1TejAz+z2wnqWsJ
 8fmvl3SuJlqFLTGaEalfpBT4iHY+UFUNfgJXWJjxXtY9sGEM9XS4mYN65uikkYbI/9e9
 Mi5g==
X-Gm-Message-State: AOAM530G3I66AVYHWfkDX29/hNxyPZYYs05Pj9uTZtgEm1VWo+TayKXm
 LwcmLLOvMwUzo1ZAOInGzFli/CrZFHksUrGa
X-Google-Smtp-Source: ABdhPJwRT4ieJ2l8ug/xaqNwACgL0ytg+jIjEVoXnmY/kQp/b2J6n2NQ7oxNVQnCZou2JirHx9ehsw==
X-Received: by 2002:a1c:b0c4:: with SMTP id z187mr2725638wme.113.1605119770340; 
 Wed, 11 Nov 2020 10:36:10 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:36:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/19] drm/radeon/ci_dpm: Move 'si_*()'s prototypes to shared
 header
Date: Wed, 11 Nov 2020 18:35:41 +0000
Message-Id: <20201111183545.1756994-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYzozODAyOjQ6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3Ig4oCYc2lfZ2V0X2RkcjNfbWNsa19mcmVxdWVuY3lfcmF0aW/igJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQogMzgwMiB8IHU4IHNpX2dldF9kZHIzX21jbGtfZnJlcXVlbmN5X3Jh
dGlvKHUzMiBtZW1vcnlfY2xvY2spCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jOjM4MTU6NDogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhzaV9nZXRfbWNsa19mcmVxdWVuY3lfcmF0aW/igJkgWy1X
bWlzc2luZy1wcm90b3R5cGVzXQogMzgxNSB8IHU4IHNpX2dldF9tY2xrX2ZyZXF1ZW5jeV9yYXRp
byh1MzIgbWVtb3J5X2Nsb2NrLCBib29sIHN0cm9iZV9tb2RlKQogfCBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmM6Mzg5Nzo2OiB3YXJu
aW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHNpX3RyaW1fdm9sdGFnZV90YWJsZV90
b19maXRfc3RhdGVfdGFibGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogMzg5NyB8IHZvaWQg
c2lfdHJpbV92b2x0YWdlX3RhYmxlX3RvX2ZpdF9zdGF0ZV90YWJsZShzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiwKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoK
Q2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2NpX2RwbS5jIHwgNiArLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vc2lfZHBtLmggfCA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL2NpX2RwbS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaV9kcG0uYwppbmRleCBh
OWZjMGE1NTI3MzZjLi4wZGZiMGVkOWFmODlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL2NpX2RwbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lfZHBtLmMKQEAg
LTMzLDYgKzMzLDcgQEAKICNpbmNsdWRlICJyYWRlb24uaCIKICNpbmNsdWRlICJyYWRlb25fYXNp
Yy5oIgogI2luY2x1ZGUgInJhZGVvbl91Y29kZS5oIgorI2luY2x1ZGUgInNpX2RwbS5oIgogCiAj
ZGVmaW5lIE1DX0NHX0FSQl9GUkVRX0YwICAgICAgICAgICAweDBhCiAjZGVmaW5lIE1DX0NHX0FS
Ql9GUkVRX0YxICAgICAgICAgICAweDBiCkBAIC0xNTMsMTEgKzE1NCw2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgY2lfcHRfY29uZmlnX3JlZyBkaWR0X2NvbmZpZ19jaVtdID0KIGV4dGVybiB1OCBy
djc3MF9nZXRfbWVtb3J5X21vZHVsZV9pbmRleChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
CiBleHRlcm4gaW50IG5pX2NvcHlfYW5kX3N3aXRjaF9hcmJfc2V0cyhzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiwKIAkJCQkgICAgICAgdTMyIGFyYl9mcmVxX3NyYywgdTMyIGFyYl9mcmVxX2Rl
c3QpOwotZXh0ZXJuIHU4IHNpX2dldF9kZHIzX21jbGtfZnJlcXVlbmN5X3JhdGlvKHUzMiBtZW1v
cnlfY2xvY2spOwotZXh0ZXJuIHU4IHNpX2dldF9tY2xrX2ZyZXF1ZW5jeV9yYXRpbyh1MzIgbWVt
b3J5X2Nsb2NrLCBib29sIHN0cm9iZV9tb2RlKTsKLWV4dGVybiB2b2lkIHNpX3RyaW1fdm9sdGFn
ZV90YWJsZV90b19maXRfc3RhdGVfdGFibGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCi0J
CQkJCQkgICAgIHUzMiBtYXhfdm9sdGFnZV9zdGVwcywKLQkJCQkJCSAgICAgc3RydWN0IGF0b21f
dm9sdGFnZV90YWJsZSAqdm9sdGFnZV90YWJsZSk7CiBzdGF0aWMgaW50IGNpX2dldF9zdGRfdm9s
dGFnZV92YWx1ZV9zaWRkKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAogCQkJCQkgc3RydWN0
IGF0b21fdm9sdGFnZV90YWJsZV9lbnRyeSAqdm9sdGFnZV90YWJsZSwKIAkJCQkJIHUxNiAqc3Rk
X3ZvbHRhZ2VfaGlfc2lkZCwgdTE2ICpzdGRfdm9sdGFnZV9sb19zaWRkKTsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3NpX2RwbS5oCmluZGV4IDEwMzJhNjhiZTc5MmIuLmFhODU3OTA2ZWY5M2QgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9zaV9kcG0uaApAQCAtMjM0LDUgKzIzNCwxMCBAQCBzdHJ1Y3Qgc2lfcG93ZXJfaW5mbyB7
CiAjZGVmaW5lIFNJU0xBTkRTX0NHVUxWUEFSQU1FVEVSX0RGTFQgICAgICAgICAgICAgICAgICAg
IDB4MDAwNDAwMzUKICNkZWZpbmUgU0lTTEFORFNfQ0dVTFZDT05UUk9MX0RGTFQgICAgICAgICAg
ICAgICAgICAgICAgMHgxZjAwNzU1MAogCit1OCBzaV9nZXRfZGRyM19tY2xrX2ZyZXF1ZW5jeV9y
YXRpbyh1MzIgbWVtb3J5X2Nsb2NrKTsKK3U4IHNpX2dldF9tY2xrX2ZyZXF1ZW5jeV9yYXRpbyh1
MzIgbWVtb3J5X2Nsb2NrLCBib29sIHN0cm9iZV9tb2RlKTsKK3ZvaWQgc2lfdHJpbV92b2x0YWdl
X3RhYmxlX3RvX2ZpdF9zdGF0ZV90YWJsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKKwkJ
CQkJICAgICAgdTMyIG1heF92b2x0YWdlX3N0ZXBzLAorCQkJCQkgICAgICBzdHJ1Y3QgYXRvbV92
b2x0YWdlX3RhYmxlICp2b2x0YWdlX3RhYmxlKTsKIAogI2VuZGlmCi0tIAoyLjI1LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
