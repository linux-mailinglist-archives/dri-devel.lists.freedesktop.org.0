Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67360359F74
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 15:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876DB6EC18;
	Fri,  9 Apr 2021 13:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8DF6E49D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 13:01:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id mh7so8496558ejb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 06:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AjH2D9ygaThMD1dtUFhVHVOUbEbRI4BYB74LUWVz+ik=;
 b=GmOJPUdUx2JYS8Hyprmwc7ya45CV92zfZyG8PJQ2jeaMBqj+/EPrisq1rVDwVD8i0y
 azvMYXGPIDzAc2edatj97ynXpr/NDk0Wd+u6eue/fVMKgPi6HFczEY/W3i6U3JbVq/Np
 lzF+azvznFif4itbSzXYBwyn8k94Q/vM1b1N9TxDY0QWGQV/F1s8YIUAazinWp7RofRB
 WSwULAyd0QXj83o5RjbfiokOFUsbdcyNsM1GwXG/uXAryxQ7P2r8JxOvq+wfpUUn8poM
 3aVVKxXgdi5r3kbVMBcqh0qQ5zsjcgqhDcyHr6mtBmVrzSonKzCZBrgoArPem63ZyKmk
 vZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AjH2D9ygaThMD1dtUFhVHVOUbEbRI4BYB74LUWVz+ik=;
 b=aDVFJOL/wkrerOPHjVii7e0y8NG+m/U8xR2bJxdSa/9fP4ZUabqE2AB+Ur2OeXsMWe
 lQgVM+kqzfCPe9rjC6qIGlO0OZuqSFekkervCOFWcu8E0KEP/xAHGQS85To/BvKYNNL4
 84NHXW3pfea1YkXBKdbpIW6g/JMyz5Y0PTneYZjKr4R5ftLg6cpm8xEjJSQc2lGOpdLO
 h4W40vqSuyyoKHGJZJVo20iAk48TqUsMQYTIiFBkzZiLu/WX+HIOKxEePbysCONFLPTz
 CowLxMrMb07pc7hcX33/p7Wm+yb43lNMfH/qKCFxmMtqzAFePRL+2mx8vrd0n0/sw8Ea
 8AKA==
X-Gm-Message-State: AOAM530SR5xSXSCm4YFPgfW9OKZza9VG5yMrBblc/u2zojHpOEBqlv9e
 hs7Oor0hR7JJl3zN6Yp8fFvN5nuAH58=
X-Google-Smtp-Source: ABdhPJyjsvdUWnW64LuyOXT9VrGw90yA0NMA1wPUgUHtOOJphQAiPxh2CTlo9Y27WQ8Rj7Es/Kr0RA==
X-Received: by 2002:a17:906:7d02:: with SMTP id
 u2mr559755ejo.249.1617973275770; 
 Fri, 09 Apr 2021 06:01:15 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:228e:f109:19e6:f9c6])
 by smtp.gmail.com with ESMTPSA id r17sm1455072edx.1.2021.04.09.06.01.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 06:01:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: re-add debugs tt_shrink file
Date: Fri,  9 Apr 2021 15:01:13 +0200
Message-Id: <20210409130113.1459-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409130113.1459-1-christian.koenig@amd.com>
References: <20210409130113.1459-1-christian.koenig@amd.com>
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

VGhhdCBnb3QgbG9zdCB3aGVuIHdlIG1vdmVkIGJhY2sgdG8gYSBzdGF0aWMgbGltaXQuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyB8IDIwICsrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCmluZGV4
IDdkNDc5MDk1ZGNmOC4uNGQ4NDk4YTNkNjQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV90dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKQEAgLTM4OSw2
ICszODksMjEgQEAgdm9pZCB0dG1fdHRfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRl
diwgc3RydWN0IHR0bV90dCAqdHRtKQogCXR0bS0+cGFnZV9mbGFncyAmPSB+VFRNX1BBR0VfRkxB
R19QUklWX1BPUFVMQVRFRDsKIH0KIAorI2lmZGVmIENPTkZJR19ERUJVR19GUworCisvKiBUZXN0
IHRoZSBzaHJpbmtlciBmdW5jdGlvbnMgYW5kIGR1bXAgdGhlIHJlc3VsdCAqLworc3RhdGljIGlu
dCB0dG1fdHRfZGVidWdmc19zaHJpbmtfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRh
dGEpCit7CisJc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsgZmFsc2UsIGZhbHNlIH07
CisKKwlzZXFfcHJpbnRmKG0sICIlZFxuIiwgdHRtX2dsb2JhbF9zd2Fwb3V0KCZjdHgsIEdGUF9L
RVJORUwpKTsKKwlyZXR1cm4gMDsKK30KK0RFRklORV9TSE9XX0FUVFJJQlVURSh0dG1fdHRfZGVi
dWdmc19zaHJpbmspOworCisjZW5kaWYKKworCiAvKioKICAqIHR0bV90dF9tZ3JfaW5pdCAtIHJl
Z2lzdGVyIHdpdGggdGhlIE1NIHNocmlua2VyCiAgKgpAQCAtMzk2LDYgKzQxMSwxMSBAQCB2b2lk
IHR0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0
ICp0dG0pCiAgKi8KIHZvaWQgdHRtX3R0X21ncl9pbml0KHVuc2lnbmVkIGxvbmcgbnVtX3BhZ2Vz
LCB1bnNpZ25lZCBsb25nIG51bV9kbWEzMl9wYWdlcykKIHsKKyNpZmRlZiBDT05GSUdfREVCVUdf
RlMKKwlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJ0dF9zaHJpbmsiLCAwNDAwLCB0dG1fZGVidWdmc19y
b290LCBOVUxMLAorCQkJICAgICZ0dG1fdHRfZGVidWdmc19zaHJpbmtfZm9wcyk7CisjZW5kaWYK
KwogCWlmICghdHRtX3BhZ2VzX2xpbWl0KQogCQl0dG1fcGFnZXNfbGltaXQgPSBudW1fcGFnZXM7
CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
