Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 479342EF89B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295FC6E8C4;
	Fri,  8 Jan 2021 20:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC9C6E8C8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a12so10119847wrv.8
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O/JKS4Z9qKDOKy5sO9nbCc5XSxxopAD1h4qHJfgSdqg=;
 b=wBSjRd6hUt3BDerrolAnKVhQ503TF7vDvG8dtbt/o8U9vNcsSGQEhFuSmNBOZGNp10
 PIzT2j7v23x8tNl3mkHGXOcF+GrbyDeTlpsSGDgKmSEcKYq0dab/m2KdmmOB57EVyCpI
 r/A8Jpxw89BpPtpwDjyN5aPAuMZ6s/KjgVgcsFPBXl9ioick3mKTDMbOEZOEwxasDz6g
 kl+0YEl+Xa46pYow7bex/TCbi1vZ4ecASb12ivzYiyc1CtI38PubzyDvHvhdXqR3IFIm
 7hlsKs/zBlnsTrpiIEgwVdlZk1DB0zjTg9F3/sQC5vQghrwIso0dr5KcEZBs+6wROCj1
 YPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O/JKS4Z9qKDOKy5sO9nbCc5XSxxopAD1h4qHJfgSdqg=;
 b=oDsRTjSVTxwt29r7PxLIu0/j0ZG5HEtkLzn+tYMsOpaCpM/wv7Qjg+Lg1AWdW73U7w
 uWVjKigVCCPZeccn1CooWlrnjSq//8SpH2yTWXnzU5Lsug2PY1PiGWEdvhxhiPXVG/ra
 C29YBPBa/ufyyZpMZfPT+PT/MM2NIBUR0TJuElTsLPcgYyZGOlHKm00tlIqvkPIF6BNX
 OmF6Rg9tpCo255VjxR895etZHPYPWedslXV6dX/7jO9Xge+F0EL8OB7poVNBA5bjV4P8
 WWECl3ELwNjonmBS8iXPhJOe2bD/qgI6eRIHdO07Ge/niri042bUAD2OMK0YIudXy/Sm
 mJ7Q==
X-Gm-Message-State: AOAM5333UDJKsoU5ZyhCCTf8lBmunTiYA1NQL6tDalQjhPF1Yxb2d7bn
 rORQ0kLon4QlGLgXkTIpmX2EaQ==
X-Google-Smtp-Source: ABdhPJxbhB+24hC60aHyeAnKIacOXED/VpuqohB/XOtKWtR3SUXj9zKBQgJMyNVeGBh14t7z/3fisA==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr5306753wrn.296.1610136908812; 
 Fri, 08 Jan 2021 12:15:08 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/40] drm/msm/dp/dp_display: Remove unused variable 'hpd'
Date: Fri,  8 Jan 2021 20:14:20 +0000
Message-Id: <20210108201457.3078600-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmM6IEluIGZ1bmN0aW9uIOKAmGRwX2Rpc3BsYXlf
dXNicGRfYXR0ZW50aW9uX2Ni4oCZOgogZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5
LmM6NDk2OjE5OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhocGTigJkgc2V0IGJ1dCBub3QgdXNlZCBb
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IEt1b2dlZSBIc2llaCA8a2hzaWVoQGNvZGVhdXJvcmEub3JnPgpDYzogbGludXgtYXJtLW1zbUB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGZy
ZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3Bs
YXkuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfZGlzcGxheS5jCmluZGV4IDZlOTcxZDU1MjkxMWYuLjYzN2E1NTg1YzJmZDggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jCkBAIC00OTMsNyArNDkzLDYgQEAgc3RhdGlj
IGludCBkcF9kaXNwbGF5X3VzYnBkX2F0dGVudGlvbl9jYihzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJ
aW50IHJjID0gMDsKIAl1MzIgc2lua19yZXF1ZXN0OwogCXN0cnVjdCBkcF9kaXNwbGF5X3ByaXZh
dGUgKmRwOwotCXN0cnVjdCBkcF91c2JwZCAqaHBkOwogCiAJaWYgKCFkZXYpIHsKIAkJRFJNX0VS
Uk9SKCJpbnZhbGlkIGRldlxuIik7CkBAIC01MDcsOCArNTA2LDYgQEAgc3RhdGljIGludCBkcF9k
aXNwbGF5X3VzYnBkX2F0dGVudGlvbl9jYihzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldHVybiAt
RU5PREVWOwogCX0KIAotCWhwZCA9IGRwLT51c2JwZDsKLQogCS8qIGNoZWNrIGZvciBhbnkgdGVz
dCByZXF1ZXN0IGlzc3VlZCBieSBzaW5rICovCiAJcmMgPSBkcF9saW5rX3Byb2Nlc3NfcmVxdWVz
dChkcC0+bGluayk7CiAJaWYgKCFyYykgewotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
