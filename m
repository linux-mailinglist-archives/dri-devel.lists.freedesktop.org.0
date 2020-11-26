Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4892C5614
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D4F6E95D;
	Thu, 26 Nov 2020 13:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310CC6E957
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p22so2194337wmg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4AJIopnyfhF0y4BTkzIBWxHJHanpp5V1ikes9pxc/Xc=;
 b=p/G/xj32n4i/rb4oTibOM955Wb2c2JuAT8/JEPsK6Cet/M6nBAM0aqReY56K/J5Et7
 amy2F2/m374sjvAeSfHZ8NLJgd13zRPeaQUlDXgMF1RhJwaEI4iiddP5r//znBH0/s5c
 TiI6Okc/1wVVTlo3aEA7Hw5I/qlTKkG4SUsXYGRMPQSpCLbvg3c/N5Zp05LXoZUmogOx
 Q4vmRAs7ruIFA1BW/PIWhKhEpRtw0Sd1GVCt9I66oXJHblxbu+IPgisDe2ydduSg6sI2
 AG33/49mDz/9ILeFURIg75jJR2NGWpP06Mlv6OdF08VX9CNy61y0qHqdhlQcX05y+4yZ
 1gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4AJIopnyfhF0y4BTkzIBWxHJHanpp5V1ikes9pxc/Xc=;
 b=RtDBmsoGMeqInf29KUeofC7cu7kTxuEM8cvK1rQzp51rrkdJkq/y9Ap+1sCWmOUw0N
 06sbceCh2m1FVzMWM9wlKqb3p5NZRbP+YfjBxBwg7hAvJbwNf0EBT85B/b0GdpUPyqLM
 CX/ffA6nea/X5nOQqbdu1XlpwF/PQXHHI9EGHoyLuuRflZIucmel8DDXKgJiT6KMU4iY
 Aqdpb0bgrjk494ASsUUVWTF2BkQMYM/LLzMJqc33Gr5XsVcYHRMP4ON477SXeX8nDNAA
 R+X31XQfY+p0ZIQo02sUywqnitDvy1mRkh6kFIqzMx9c/5xrpAprl3qLgqXcSxeJnSiE
 Atkw==
X-Gm-Message-State: AOAM532HFAkIF+z5aGA2WLJ7tQSf+BeLFPtPXneM7hoGWlfIFUGO5lMF
 J6ETNeU/8l0nwvHChCwpSw3w5g==
X-Google-Smtp-Source: ABdhPJzsbr1E7lN9PNWNLgjwKyJigQPxpav65eXlV0+KrkMgaazvVNZF2wODZ0Otr3NRGQHQfQJMCw==
X-Received: by 2002:a7b:cf0a:: with SMTP id l10mr3530508wmg.103.1606398182874; 
 Thu, 26 Nov 2020 05:43:02 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/40] drm/amd/pm/powerplay/hwmgr/ppevvmath: Place variable
 declaration under same clause as its use
Date: Thu, 26 Nov 2020 13:42:11 +0000
Message-Id: <20201126134240.3214176-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3BwZXZ2bWF0aC5oOiBJ
biBmdW5jdGlvbiDigJhmTXVsdGlwbHnigJk6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBldnZtYXRoLmg6MzM2OjIyOiB3YXJuaW5nOiB2YXJpYWJs
ZSDigJhZX0xlc3NUaGFuT25l4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdt
Z3IvcHBldnZtYXRoLmg6MzM2Ojc6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmFhfTGVzc1RoYW5PbmXi
gJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBFdmFu
IFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93
ZXJwbGF5L2h3bWdyL3BwZXZ2bWF0aC5oIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBldnZtYXRoLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3Bvd2VycGxheS9od21nci9wcGV2dm1hdGguaAppbmRleCA4ZjUwYTAzODM5NmNlLi5kYWMy
OWZlNmNmYzZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9o
d21nci9wcGV2dm1hdGguaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9o
d21nci9wcGV2dm1hdGguaApAQCAtMzMzLDE0ICszMzMsMTQgQEAgc3RhdGljIGZJbnQgZk11bHRp
cGx5IChmSW50IFgsIGZJbnQgWSkgLyogVXNlcyA2NC1iaXQgaW50ZWdlcnMgKGludDY0X3QpICov
CiB7CiAJZkludCBQcm9kdWN0OwogCWludDY0X3QgdGVtcFByb2R1Y3Q7CisKKwkvKlRoZSBmb2xs
b3dpbmcgaXMgZm9yIGEgdmVyeSBzcGVjaWZpYyBjb21tb24gY2FzZTogTm9uLXplcm8gbnVtYmVy
IHdpdGggT05MWSBmcmFjdGlvbmFsIHBvcnRpb24qLworCS8qIFRFTVBPUkFSSUxZIERJU0FCTEVE
IC0gQ0FOIEJFIFVTRUQgVE8gSU1QUk9WRSBQUkVDSVNJT04KIAlib29sIFhfTGVzc1RoYW5PbmUs
IFlfTGVzc1RoYW5PbmU7CiAKIAlYX0xlc3NUaGFuT25lID0gKFgucGFydGlhbC5yZWFsID09IDAg
JiYgWC5wYXJ0aWFsLmRlY2ltYWwgIT0gMCAmJiBYLmZ1bGwgPj0gMCk7CiAJWV9MZXNzVGhhbk9u
ZSA9IChZLnBhcnRpYWwucmVhbCA9PSAwICYmIFkucGFydGlhbC5kZWNpbWFsICE9IDAgJiYgWS5m
dWxsID49IDApOwogCi0JLypUaGUgZm9sbG93aW5nIGlzIGZvciBhIHZlcnkgc3BlY2lmaWMgY29t
bW9uIGNhc2U6IE5vbi16ZXJvIG51bWJlciB3aXRoIE9OTFkgZnJhY3Rpb25hbCBwb3J0aW9uKi8K
LQkvKiBURU1QT1JBUklMWSBESVNBQkxFRCAtIENBTiBCRSBVU0VEIFRPIElNUFJPVkUgUFJFQ0lT
SU9OCi0KIAlpZiAoWF9MZXNzVGhhbk9uZSAmJiBZX0xlc3NUaGFuT25lKSB7CiAJCVByb2R1Y3Qu
ZnVsbCA9IFguZnVsbCAqIFkuZnVsbDsKIAkJcmV0dXJuIFByb2R1Y3QKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
