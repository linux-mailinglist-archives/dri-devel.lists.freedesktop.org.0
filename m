Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102BD2B4D4C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275F96E075;
	Mon, 16 Nov 2020 17:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980FA6E8E7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m125so22430wmm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RFkz09HHg8XjVV8DdlQiV5ZmST/9B9izgfFwLsHrImI=;
 b=kH1BKC//wSZb3AKFDqYNzlpJHp967MUaPmKrCtKH4g9gvuaOhCFOB+bqmmVsBfJp6Y
 IRFKDFJr0NyQzl1AeiqaSKli+a3YmpMGqWEGze33mB487RpiarUWtucYnXzoWoqpwd7A
 qx5TQJV2CDRomdZE8xN48p2tGpBgTnkL7Myt/S49GRT4zyEP2KYH/BnX8zmnLGjZnHeK
 n9uQD8axbidJE2t3gHCmX1lIn++JBHCYOpFyy2kau/q16LLE7DV2v4Ahl/3kMiCJKU76
 i60I5VMbQWJkSXUxtjztOUlRblW0zJ9D5hN7FE9Ht1Xh7QJwe0MrDRErQqC/6CA+M+BP
 u8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RFkz09HHg8XjVV8DdlQiV5ZmST/9B9izgfFwLsHrImI=;
 b=CBiXu74zWo/sMAAzX1DcqN0RO8IMMOB8xuXVRTK1e2lI1E/3Pqz+pkxh2v8PGmq2sA
 6va9pAlRyzI8/e5DJqotFLyuIxFaUL2WxiebxAlKFymRyuGqCwnB+ZVlzTK5dyNE73On
 VhdmfWniBhW5MHxDQl+YI0mrNBCVv5YSle6qwkgMR8V4NOQik9jge+eQuwKmrRvWnWV7
 2XjsqGhVT/tbNXVbYZnAnNcjyk7j8gGXRYjoWFFDOlaK0W7D15ISBkCUAljOh3wdWu1S
 6ht4+57X7ZkSNoLCAwEfO49eWGb4/JcdzLp4PvyQWWkSCc+XEJTRToJUB+pn8QeOj/KR
 ohUg==
X-Gm-Message-State: AOAM530J9rp3NsgvFX74H69WLz/B+oA5eiDPTAuVkoUQ0eeD9Eqytm9B
 KO62riBhdUJ7ENT2Ns8OzxPtyA==
X-Google-Smtp-Source: ABdhPJwC9/+3SUbWpobqPivqrvsp22GrpEgM9PhprEf6eKffR7Y/olS1qwqch2we9TXXEGQQPqTdiQ==
X-Received: by 2002:a1c:c203:: with SMTP id s3mr16953543wmf.77.1605548273156; 
 Mon, 16 Nov 2020 09:37:53 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:52 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 36/43] drm/radeon/evergreen: Move 'cik_*()'s prototypes to
 shared header
Date: Mon, 16 Nov 2020 17:36:53 +0000
Message-Id: <20201116173700.1830487-37-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9jaWsuYzo2NDEzOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3Ig4oCYY2lrX2luaXRfY3BfcGdfdGFibGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQogNjQxMyB8IHZvaWQgY2lrX2luaXRfY3BfcGdfdGFibGUoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Np
ay5jOjY2NzA6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhjaWtfZ2V0
X2NzYl9zaXpl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIDY2NzAgfCB1MzIgY2lrX2dldF9j
c2Jfc2l6ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIHwgXn5+fn5+fn5+fn5+fn5+fgog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYzo2NzAyOjY6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYY2lrX2dldF9jc2JfYnVmZmVy4oCZIFstV21pc3NpbmctcHJvdG90
eXBlc10KIDY3MDIgfCB2b2lkIGNpa19nZXRfY3NiX2J1ZmZlcihzdHJ1Y3QgcmFkZW9uX2Rldmlj
ZSAqcmRldiwgdm9sYXRpbGUgdTMyICpidWZmZXIpCiB8IF5+fn5+fn5+fn5+fn5+fn5+fgoKQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5oICAgICAgIHwgMyArKysKIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vZXZlcmdyZWVuLmMgfCA1ICstLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL2Npay5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuaAppbmRleCA2NjMwYjlk
YTllN2FhLi40MjAyMDdkMTlkZTUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2Npay5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmgKQEAgLTMwLDUgKzMwLDgg
QEAgdm9pZCBjaWtfZXhpdF9ybGNfc2FmZV9tb2RlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2
KTsKIGludCBjaV9tY19sb2FkX21pY3JvY29kZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
CiB2b2lkIGNpa191cGRhdGVfY2coc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBibG9j
aywgYm9vbCBlbmFibGUpOwogdTMyIGNpa19ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldik7Cit2b2lkIGNpa19pbml0X2NwX3BnX3RhYmxlKHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2KTsKK3UzMiBjaWtfZ2V0X2NzYl9zaXplKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKK3ZvaWQgY2lrX2dldF9jc2JfYnVmZmVyKHN0cnVjdCByYWRlb25fZGV2aWNl
ICpyZGV2LCB2b2xhdGlsZSB1MzIgKmJ1ZmZlcik7CiAKICNlbmRpZiAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBfX0NJS19IX18gKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vZXZlcmdyZWVuLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jCmluZGV4
IDQ1NzVlNDQ4ZTU5ZGYuLjhlOWU4OGJmMWY0M2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vZXZlcmdyZWVuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3Jl
ZW4uYwpAQCAtMzEsNiArMzEsNyBAQAogCiAjaW5jbHVkZSAiYXRvbS5oIgogI2luY2x1ZGUgImF2
aXZvZC5oIgorI2luY2x1ZGUgImNpay5oIgogI2luY2x1ZGUgIm5pLmgiCiAjaW5jbHVkZSAicnY3
NzAuaCIKICNpbmNsdWRlICJldmVyZ3JlZW4uaCIKQEAgLTIxNywxMCArMjE4LDYgQEAgc3RhdGlj
IHZvaWQgZXZlcmdyZWVuX2dwdV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHZv
aWQgZXZlcmdyZWVuX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogdm9pZCBldmVy
Z3JlZW5fcGNpZV9nZW4yX2VuYWJsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB2b2lk
IGV2ZXJncmVlbl9wcm9ncmFtX2FzcG0oc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwotdm9p
ZCBjaWtfaW5pdF9jcF9wZ190YWJsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Ci0KLWV4
dGVybiB1MzIgY2lrX2dldF9jc2Jfc2l6ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Ci1l
eHRlcm4gdm9pZCBjaWtfZ2V0X2NzYl9idWZmZXIoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYs
IHZvbGF0aWxlIHUzMiAqYnVmZmVyKTsKIAogc3RhdGljIGNvbnN0IHUzMiBldmVyZ3JlZW5fZ29s
ZGVuX3JlZ2lzdGVyc1tdID0KIHsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
