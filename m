Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136602B1C53
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059C36E529;
	Fri, 13 Nov 2020 13:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401F06E511
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:23 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h62so8560181wme.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d6lq2kh1bZp3yhcGfeiEHDwnp2cd/bsKGg4wlUbbQco=;
 b=liXP1wPmh8wR4oCpiWLxjCT2ucLqXmhJW9hBhLmCuS2Dw+DxXfaS3Nhq+rOb69vSw+
 wua+tblw52CIqa1EEgbkMfUTv51OsuRqFGxnMUXf/FVRJ69Fj1YlCvRUwqIrCAeY8SyV
 jGDkpGrlt2UsQKML1I6Ztdj0/Y9sZxdmmU4WiYIcOWDf6w8QYcKvAe3ryVMgC5LhnkXS
 iImRStUf1I50U6tw56MEwasDaAirLNzUTDRUImy927MNB6VA4og5IOp6C8B2QNO6W1df
 H5FEfc9/OqdcuKLM4Q6qAg4JRSq9mPJgH/Utrlt7d48G7wN+snqKZX1pVytc3fzlrp2a
 XFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d6lq2kh1bZp3yhcGfeiEHDwnp2cd/bsKGg4wlUbbQco=;
 b=g5S4OI6CQnNX5yqeUrP6OOmslZTh6grY+YSC0rIMllnwtl4pimo4KK9USwekuokOsQ
 Z/3Bi6NjsLzuXt6JyYYSczDLjX6Qv65Ju9s+lWGPj2bjAaDhyZO/PSBiPEhGfRH+pVF5
 2MxC6kxek0OSpHCsxboaxD3R3r2+DLfr0NAtcMRnvyU8Ts2ml/uchmubCW4xWyV5y797
 JHlgHhx044LCZ5hZwx/vk4j7Vz6Y7Eht9kQ0Wg6+hmPytwdzag3tUFOZPTG4q3BsWPTU
 xQM91mj3nhLpVyyyYhi5RV6SHGCPOJpUZG2/1r5+wzVYoLeY0do+aWnWL92ucz2rWo87
 owrw==
X-Gm-Message-State: AOAM533F72Bkm7wTZ3lu0NC9DhOzdfXaY/9P4/PP8xl0tel3SBSCfW/d
 IrtuaS+EyWnNUN3qEuMQPHeasQ==
X-Google-Smtp-Source: ABdhPJwPa1pit579Xq6kQ/E4Sbx3I4WTKhrO1w9SYQ9TNstqb4RqB6CPSGlqJPfhNK+IoC4qO99TVg==
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr2663287wmc.186.1605275421972; 
 Fri, 13 Nov 2020 05:50:21 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 32/40] drm/msm/disp/mdp5/mdp5_crtc: Make local function
 'mdp5_crtc_setup_pipeline()' static
Date: Fri, 13 Nov 2020 13:49:30 +0000
Message-Id: <20201113134938.4004947-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jcnRjLmM6NTgxOjU6IHdhcm5pbmc6IG5vIHBy
ZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYbWRwNV9jcnRjX3NldHVwX3BpcGVsaW5l4oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KCkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+CkNj
OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGZyZWVkcmVu
b0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2Ny
dGMuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVf
Y3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jcnRjLmMKaW5kZXgg
NzlkZDU2ZmFmM2RlMC4uMGM4ZjlmODgzMDFmYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL21kcDUvbWRwNV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L21kcDUvbWRwNV9jcnRjLmMKQEAgLTU3OCw5ICs1NzgsOSBAQCBzdGF0aWMgdm9pZCBtZHA1X2Ny
dGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJbWRwNV9jcnRjLT5lbmFi
bGVkID0gdHJ1ZTsKIH0KIAotaW50IG1kcDVfY3J0Y19zZXR1cF9waXBlbGluZShzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsCi0JCQkgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3Rh
dGUsCi0JCQkgICAgIGJvb2wgbmVlZF9yaWdodF9taXhlcikKK3N0YXRpYyBpbnQgbWRwNV9jcnRj
X3NldHVwX3BpcGVsaW5lKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKKwkJCQkgICAgc3RydWN0IGRy
bV9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZSwKKwkJCQkgICAgYm9vbCBuZWVkX3JpZ2h0X21p
eGVyKQogewogCXN0cnVjdCBtZHA1X2NydGNfc3RhdGUgKm1kcDVfY3N0YXRlID0KIAkJCXRvX21k
cDVfY3J0Y19zdGF0ZShuZXdfY3J0Y19zdGF0ZSk7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
