Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED3A2B4DB6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593726E9F8;
	Mon, 16 Nov 2020 17:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5684E89FED
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k2so19702693wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3yKXccTq4RQml8AaT9zp7DsIehEAA7Cw2xDOtV48iYo=;
 b=Z4HwkZNcwa5jwVBqtO868Oti/4mRDTj3PsEnbA681wpGYPCwsRjObQJnxRfXliZQaY
 vc7oFU5DAWujWdiXZ0C6rumJoAbS3YkpNzFM1QXAfG42OAZqPv85T0Plwmja14RlZ3al
 xD0uxE2BO4c4ocCIddXqvFeUFEcqfAkMSoSUf9IqsUs3p/ajB0iKERvvf49d380U2qHa
 tFdccMpqSYgrd8IKH4FrZ/Jd/wAXTwCB9inNdXVt0wCoLJ3/PhKfnuaVsvmjieBGmzPI
 TQbg8r+l+jHh1OuelXM+aj9qw11AKj3oFJjDyxwz3Jr0DsJNbd5w3Ru0OHUWBQ/dMGtF
 rcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3yKXccTq4RQml8AaT9zp7DsIehEAA7Cw2xDOtV48iYo=;
 b=A4hKtwt39HgwnjwbsNN5bjENmK2MbAETy25jwjwBY5Wxb3gmzl+xMqNPZyxE4Rfphu
 66SzFuHmKk2olAEzR0qYS5/02ojszrAZPxrHGMb2Ye7qCo4NP11wioEvBXYJlxzDIbNN
 +uekluJJz8lXPua5TQV1Q3B9FtsfghNju1rh29tjCREynU/JBL0tOUvPuO4kRSLXRyb/
 ualw9jgcKYVj0m1cMoaS8rofbkt4bS8n9RA4JHX4wxo+74OZKoSmn26sOrfK+dyyOQhQ
 qV0VrKKkJjkqZIy/KQ41z4EcUa/6/hoMOb2JAvgD0qdSKtmes9eEOyizh3C4CTjfPGx4
 k6xg==
X-Gm-Message-State: AOAM530VGxGo69XlofRx/R/jqXvFXDuP6WjYcxHeBYzm5dFouIySMDXt
 8pr4xr/qTmXlEPZD9EvpAGTFxg==
X-Google-Smtp-Source: ABdhPJwINg/ac/HzXNmMAXKy2lkQiCTdKUFax/vtf42+MajVaIC/uOHsaxPcQHd5B36XPKPbQ/fE2Q==
X-Received: by 2002:adf:a3d1:: with SMTP id m17mr19678094wrb.289.1605548502077; 
 Mon, 16 Nov 2020 09:41:42 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/42] drm/msm/disp/mdp5/mdp5_crtc: Make local function
 'mdp5_crtc_setup_pipeline()' static
Date: Mon, 16 Nov 2020 17:40:46 +0000
Message-Id: <20201116174112.1833368-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
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
ZXNAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IEFiaGluYXYgS3VtYXIgPGFiaGluYXZrQGNvZGVh
dXJvcmEub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY3J0Yy5j
IHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jcnRj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYwppbmRleCA3OWRk
NTZmYWYzZGUwLi4wYzhmOWY4ODMwMWZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvbWRwNS9tZHA1X2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRw
NS9tZHA1X2NydGMuYwpAQCAtNTc4LDkgKzU3OCw5IEBAIHN0YXRpYyB2b2lkIG1kcDVfY3J0Y19h
dG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAltZHA1X2NydGMtPmVuYWJsZWQg
PSB0cnVlOwogfQogCi1pbnQgbWRwNV9jcnRjX3NldHVwX3BpcGVsaW5lKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywKLQkJCSAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZSwK
LQkJCSAgICAgYm9vbCBuZWVkX3JpZ2h0X21peGVyKQorc3RhdGljIGludCBtZHA1X2NydGNfc2V0
dXBfcGlwZWxpbmUoc3RydWN0IGRybV9jcnRjICpjcnRjLAorCQkJCSAgICBzdHJ1Y3QgZHJtX2Ny
dGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlLAorCQkJCSAgICBib29sIG5lZWRfcmlnaHRfbWl4ZXIp
CiB7CiAJc3RydWN0IG1kcDVfY3J0Y19zdGF0ZSAqbWRwNV9jc3RhdGUgPQogCQkJdG9fbWRwNV9j
cnRjX3N0YXRlKG5ld19jcnRjX3N0YXRlKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
