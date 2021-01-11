Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B246B2F1EEB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D2689F63;
	Mon, 11 Jan 2021 19:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F3A89EEB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:20:04 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 3so285398wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VihTPCTNoey/JKY1Z4Geihy/+CpWTn44EgwyKVU/So4=;
 b=zm4hqUDYRKWhOH93S0m6OzMUm2UG0kbFx1gdPzIUP19LFjdloPHHu0sy2fhop86XTG
 lMCU33kWxfEz2L2MA9+m4H0OjD6rNFqjxqyf+fTeirC+7Y3E2TazSeF3rksQrfnfUJsd
 N87z5kKXvI2t/VK2m80dg7kK4749/ktGuBUBgpxi65KVqgbhjv1q9D2USLW6HEUY56+h
 zr5Md/jQvtZvIJZlamRiRiCxmqZIVxD5XQT/gbHuAi4gvU9+NeyMewqq1vPRXEODaPDt
 yFdthHeJA9zUM2cvKd25q75bYxtpHj8wkDRxbn6o1JPPDZtZmxaiqLbGNJjvJ7SCcGcP
 r44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VihTPCTNoey/JKY1Z4Geihy/+CpWTn44EgwyKVU/So4=;
 b=Fk+LI2RQS6kw7rNaGDocT+GW6MV5L5927Qc65feVehbE2H5dYSTWDOr/Z79ZMiY3UW
 ctxXWuPmrBvziVZwxEyVb69UYAGBHlGYSghDAUo8jhHrGU2fIYp61UDcQFzqSGyObnAK
 wMINBjxvyWiDiRtbK1Sqi7jz79/Pxmx+vviEozVH28+104KhXC7CxVmg7j+rM83aTGuR
 GrW/pm+raMrcjAB99DAQNSslp7Ue19aXbmiwgvD40EfGKgmGXr95zlFfhG1QjBZ2Lep5
 D449z5iVh1xfgNSxbaIloNiQymKaTmSXqTDX/DZyRyIksqhIEtziTG2ffRsaRcvfZBkV
 RR6Q==
X-Gm-Message-State: AOAM533zxjVnHe1pp+DCJdnDzFEBdoWjgg/V+4JZQGYZNetKqwlKOrLs
 79OeCB6QtRUD4KN2tIwTkOuMB26t6dxjPQT6
X-Google-Smtp-Source: ABdhPJyuY1crJf1/MyIUDIjKfK4vqay/fxwN7aDKwMYf344cjO3m1/QVr+kzefbcgvBB12e1iwilCg==
X-Received: by 2002:a1c:bd56:: with SMTP id n83mr291291wmf.72.1610392802992;
 Mon, 11 Jan 2021 11:20:02 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:20:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/40] drm/amd/display/dc/dce120/dce120_timing_generator:
 Remove unused function 'dce120_timing_generator_get_position'
Date: Mon, 11 Jan 2021 19:19:11 +0000
Message-Id: <20210111191926.3688443-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3RpbWluZ19n
ZW5lcmF0b3IuYzo2MDI6MTM6IHdhcm5pbmc6IOKAmGRjZTEyMF90aW1pbmdfZ2VuZXJhdG9yX2dl
dF9wb3NpdGlvbuKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCgpD
YzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KQ2M6IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0t
LQogLi4uL2RjL2RjZTEyMC9kY2UxMjBfdGltaW5nX2dlbmVyYXRvci5jICAgICAgIHwgNDMgLS0t
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3RpbWlu
Z19nZW5lcmF0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNl
MTIwX3RpbWluZ19nZW5lcmF0b3IuYwppbmRleCBkMDJlY2I5ODNjOWNkLi5iNTdjNDY2MTI0ZTc2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEy
MF90aW1pbmdfZ2VuZXJhdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZTEyMC9kY2UxMjBfdGltaW5nX2dlbmVyYXRvci5jCkBAIC01ODksNDkgKzU4OSw2IEBAIHN0
YXRpYyB2b2lkIGRjZTEyMF90aW1pbmdfZ2VuZXJhdG9yX3NldF9kcnIoCiAJfQogfQogCi0vKgot
ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqCi0gKiAgRnVuY3Rpb246IGRjZTEyMF90aW1pbmdfZ2VuZXJh
dG9yX2dldF9wb3NpdGlvbgotICoKLSAqICBAYnJpZWYKLSAqICAgICBSZXR1cm5zIENSVEMgdmVy
dGljYWwvaG9yaXpvbnRhbCBjb3VudGVycwotICoKLSAqICBAcGFyYW0gW291dF0gcG9zaXRpb24K
LSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKgotICovCi1zdGF0aWMgdm9pZCBkY2UxMjBfdGltaW5nX2dl
bmVyYXRvcl9nZXRfcG9zaXRpb24oc3RydWN0IHRpbWluZ19nZW5lcmF0b3IgKnRnLAotCXN0cnVj
dCBjcnRjX3Bvc2l0aW9uICpwb3NpdGlvbikKLXsKLQl1aW50MzJfdCB2YWx1ZTsKLQlzdHJ1Y3Qg
ZGNlMTEwX3RpbWluZ19nZW5lcmF0b3IgKnRnMTEwID0gRENFMTEwVEdfRlJPTV9URyh0Zyk7Ci0K
LQl2YWx1ZSA9IGRtX3JlYWRfcmVnX3NvYzE1KAotCQkJdGctPmN0eCwKLQkJCW1tQ1JUQzBfQ1JU
Q19TVEFUVVNfUE9TSVRJT04sCi0JCQl0ZzExMC0+b2Zmc2V0cy5jcnRjKTsKLQotCXBvc2l0aW9u
LT5ob3Jpem9udGFsX2NvdW50ID0gZ2V0X3JlZ19maWVsZF92YWx1ZSgKLQkJCXZhbHVlLAotCQkJ
Q1JUQzBfQ1JUQ19TVEFUVVNfUE9TSVRJT04sCi0JCQlDUlRDX0hPUlpfQ09VTlQpOwotCi0JcG9z
aXRpb24tPnZlcnRpY2FsX2NvdW50ID0gZ2V0X3JlZ19maWVsZF92YWx1ZSgKLQkJCXZhbHVlLAot
CQkJQ1JUQzBfQ1JUQ19TVEFUVVNfUE9TSVRJT04sCi0JCQlDUlRDX1ZFUlRfQ09VTlQpOwotCi0J
dmFsdWUgPSBkbV9yZWFkX3JlZ19zb2MxNSgKLQkJCXRnLT5jdHgsCi0JCQltbUNSVEMwX0NSVENf
Tk9NX1ZFUlRfUE9TSVRJT04sCi0JCQl0ZzExMC0+b2Zmc2V0cy5jcnRjKTsKLQotCXBvc2l0aW9u
LT5ub21pbmFsX3Zjb3VudCA9IGdldF9yZWdfZmllbGRfdmFsdWUoCi0JCQl2YWx1ZSwKLQkJCUNS
VEMwX0NSVENfTk9NX1ZFUlRfUE9TSVRJT04sCi0JCQlDUlRDX1ZFUlRfQ09VTlRfTk9NKTsKLX0K
LQotCiBzdGF0aWMgdm9pZCBkY2UxMjBfdGltaW5nX2dlbmVyYXRvcl9nZXRfY3J0Y19zY2Fub3V0
cG9zKAogCXN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICp0ZywKIAl1aW50MzJfdCAqdl9ibGFua19z
dGFydCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
