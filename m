Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947E63076DC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 14:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4D86E851;
	Thu, 28 Jan 2021 13:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961556E193
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 13:16:09 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id j13so6570046edp.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 05:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TPllcLdHc9R0gFH2IaodwuaP8IM62xNxne+xCUr/PQ8=;
 b=J3KY/9okxpotZ51ztVNi8uUvJlv/Gd3bwb2LQuJRmXe51HxMQ7rzT9cf0kEYsdegIv
 A9/ABrViXRdMtEnx4gl0xMBZZM8EGX6Rg8wfDK5Rlh64JZJzc05I2aSKU5wtl4ZVBuxu
 AWRu0cZaA0044NhzIZQv71uxltBTbWGsfRDIZLTm5C3akAo/sncbbmBiamM9yfVgfhOD
 wrg9y1le3rzj7h3rFbvrbOeLdUIjP5AEotzzmJLiGQ9HTYngToy8YoU+RDvL9+/eygwe
 JvtBat3ER0lINPJOiM7ZaZTOs605SpmSPHZhBjAZ1yWBA9TlCDx3ZzTpqcR/n/oPVJD+
 qHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TPllcLdHc9R0gFH2IaodwuaP8IM62xNxne+xCUr/PQ8=;
 b=a7ErnCOYXOk86Jmq9Z0xujJ8H9DDHPvB0EPXwMD2gc1RfRx+MqqN/mkcrV5SOBsYnr
 1c/U2HbOTa12BiX/IwXwMilEPc72qpHxTYI72zdKrjJ2wTTSZXmSIjGrUbQZwAeTooml
 vd79RJAzYDicEVQKB5djQCCM5Ptu4rtYNWcHGGoDpp5fxY0Wggg49QJQ/Hw5d4rvgZl6
 soT/wNf55Sn+nYOtxiT6Szz4M7vc5JmUMKxz4+UR/9hy8ffy6T+meW6mL04L9tC/QmYX
 fvGhm0cMoQtbhAeDTWjbM6oAcqOXDYoFw7AfTmK4B57NmX2kl1k393ea3CsYEsI4S5Tb
 UMCw==
X-Gm-Message-State: AOAM531MxngOIdwoKOiCDugoVZA2Aa1PPZszc+Ey1umwkNtEwNpqdptQ
 eEnSWGALA/IWs9rxs7erT6A=
X-Google-Smtp-Source: ABdhPJxmt5m49JZ9hu9ulHlFprUaJD6B9BNvoNRRhZDjKQvOAkCDg1PUPYtjdjkLBs3ukZI5cQ5aWw==
X-Received: by 2002:aa7:d4d2:: with SMTP id t18mr14452022edr.238.1611839768284; 
 Thu, 28 Jan 2021 05:16:08 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4cad:1c2d:4a6c:1a92])
 by smtp.gmail.com with ESMTPSA id q4sm2302059ejx.8.2021.01.28.05.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 05:16:07 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sroland@vmware.com, zackr@vmware.com, daniel@ffwll.ch,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/ttm: drop sysfs directory
Date: Thu, 28 Jan 2021 14:16:04 +0100
Message-Id: <20210128131604.149660-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128131604.149660-1-christian.koenig@amd.com>
References: <20210128131604.149660-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IHVzZWQgYW55IG1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbW9kdWxl
LmMgfCA1MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fbW9kdWxlLmggfCAgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCA1MiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5jCmluZGV4IGY2NTY2NjAzYTYwZi4uNTZiMGVmZGJh
MWE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYwpAQCAtMzcsNjYgKzM3LDE2IEBACiAKICNp
bmNsdWRlICJ0dG1fbW9kdWxlLmgiCiAKLXN0YXRpYyBERUNMQVJFX1dBSVRfUVVFVUVfSEVBRChl
eGl0X3EpOwotc3RhdGljIGF0b21pY190IGRldmljZV9yZWxlYXNlZDsKIHN0cnVjdCBkZW50cnkg
KnR0bV9kZWJ1Z2ZzX3Jvb3Q7CiAKLXN0YXRpYyBzdHJ1Y3QgZGV2aWNlX3R5cGUgdHRtX2RybV9j
bGFzc190eXBlID0gewotCS5uYW1lID0gInR0bSIsCi0JLyoqCi0JICogQWRkIHBtIG9wcyBoZXJl
LgotCSAqLwotfTsKLQotc3RhdGljIHZvaWQgdHRtX2RybV9jbGFzc19kZXZpY2VfcmVsZWFzZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCi17Ci0JYXRvbWljX3NldCgmZGV2aWNlX3JlbGVhc2VkLCAxKTsK
LQl3YWtlX3VwX2FsbCgmZXhpdF9xKTsKLX0KLQotc3RhdGljIHN0cnVjdCBkZXZpY2UgdHRtX2Ry
bV9jbGFzc19kZXZpY2UgPSB7Ci0JLnR5cGUgPSAmdHRtX2RybV9jbGFzc190eXBlLAotCS5yZWxl
YXNlID0gJnR0bV9kcm1fY2xhc3NfZGV2aWNlX3JlbGVhc2UKLX07Ci0KLXN0cnVjdCBrb2JqZWN0
ICp0dG1fZ2V0X2tvYmoodm9pZCkKLXsKLQlzdHJ1Y3Qga29iamVjdCAqa29iaiA9ICZ0dG1fZHJt
X2NsYXNzX2RldmljZS5rb2JqOwotCUJVR19PTihrb2JqID09IE5VTEwpOwotCXJldHVybiBrb2Jq
OwotfQotCiBzdGF0aWMgaW50IF9faW5pdCB0dG1faW5pdCh2b2lkKQogewotCWludCByZXQ7Ci0K
LQlyZXQgPSBkZXZfc2V0X25hbWUoJnR0bV9kcm1fY2xhc3NfZGV2aWNlLCAidHRtIik7Ci0JaWYg
KHVubGlrZWx5KHJldCAhPSAwKSkKLQkJcmV0dXJuIHJldDsKLQotCWF0b21pY19zZXQoJmRldmlj
ZV9yZWxlYXNlZCwgMCk7Ci0JcmV0ID0gZHJtX2NsYXNzX2RldmljZV9yZWdpc3RlcigmdHRtX2Ry
bV9jbGFzc19kZXZpY2UpOwotCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCi0JCWdvdG8gb3V0X25v
X2Rldl9yZWc7Ci0KIAl0dG1fZGVidWdmc19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJ0dG0i
LCBOVUxMKTsKIAlyZXR1cm4gMDsKLW91dF9ub19kZXZfcmVnOgotCWF0b21pY19zZXQoJmRldmlj
ZV9yZWxlYXNlZCwgMSk7Ci0Jd2FrZV91cF9hbGwoJmV4aXRfcSk7Ci0JcmV0dXJuIHJldDsKIH0K
IAogc3RhdGljIHZvaWQgX19leGl0IHR0bV9leGl0KHZvaWQpCiB7Ci0JZHJtX2NsYXNzX2Rldmlj
ZV91bnJlZ2lzdGVyKCZ0dG1fZHJtX2NsYXNzX2RldmljZSk7Ci0KLQkvKioKLQkgKiBSZWZ1c2Ug
dG8gdW5sb2FkIHVudGlsIHRoZSBUVE0gZGV2aWNlIGlzIHJlbGVhc2VkLgotCSAqIE5vdCBzdXJl
IHRoaXMgaXMgMTAwJSBuZWVkZWQuCi0JICovCi0KLQl3YWl0X2V2ZW50KGV4aXRfcSwgYXRvbWlj
X3JlYWQoJmRldmljZV9yZWxlYXNlZCkgPT0gMSk7CiAJZGVidWdmc19yZW1vdmUodHRtX2RlYnVn
ZnNfcm9vdCk7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVs
ZS5oIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbW9kdWxlLmgKaW5kZXggMmYwM2MyZmNmNTcw
Li5kN2NhYzVkNGI4MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVs
ZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5oCkBAIC0zMywxMCArMzMs
OCBAQAogCiAjZGVmaW5lIFRUTV9QRlggIltUVE1dICIKIAotc3RydWN0IGtvYmplY3Q7CiBzdHJ1
Y3QgZGVudHJ5OwogCi1leHRlcm4gc3RydWN0IGtvYmplY3QgKnR0bV9nZXRfa29iaih2b2lkKTsK
IGV4dGVybiBzdHJ1Y3QgZGVudHJ5ICp0dG1fZGVidWdmc19yb290OwogCiAjZW5kaWYgLyogX1RU
TV9NT0RVTEVfSF8gKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
