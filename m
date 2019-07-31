Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3A7C7A1
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AF989FC0;
	Wed, 31 Jul 2019 15:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F035289F41;
 Wed, 31 Jul 2019 15:52:57 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 201so49579999qkm.9;
 Wed, 31 Jul 2019 08:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ncnmY9aTrcAW3wfwWiq91DK9wslQ3PB1TYL8VfjolEA=;
 b=pRz2rEbSym88S2jFFJcCjIMOrn4ekHlZSwGnwf29YQBTeGSZOXx27Ugfd1yRgNms6W
 WMAJe+qny87m5SL7taIQYudDNfAGybsnGuB91t3KdYnHGFMiwCvRnD1eHSyIvk3G7bYV
 EhKzELTpAKMr4ViG0/XmO5bP7kwU1ZFYOoZuJVLAqgjePP/gweezzHfORlEcMB1pGFwd
 zpQ2A86M4aQ0vw8DqBKZ7u0aWnb5tvLaUGF4SKuvc7a8xdaR1wd//kzLHANZ54yTYzpA
 mzFFK7gJHZJvGFOYDdeL0efHaUacsTt/jwSD7r9gJi1hQjNjeBVqbxsDUq0y+3CnSe+3
 U41Q==
X-Gm-Message-State: APjAAAUWPxL+18vsuPSarRipi7ZsoSRIqOtaLTh0oVIimfZLaYfm0F/s
 rjfHWZJUPB2xydhqwQa4uBuVyC/y
X-Google-Smtp-Source: APXvYqwquqxPahIU8O8X0u8G9yn6SdRNaXr0ZrkQBylTkD8BGQdvB3WIwWlSj46ayhvPFGoE6Ll9Xg==
X-Received: by 2002:a37:a358:: with SMTP id m85mr59016011qke.190.1564588376902; 
 Wed, 31 Jul 2019 08:52:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id v17sm38020296qtc.23.2019.07.31.08.52.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:52:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/amdgpu: drop drmP.h from nv.c
Date: Wed, 31 Jul 2019 10:52:43 -0500
Message-Id: <20190731155246.20603-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731155246.20603-1-alexander.deucher@amd.com>
References: <20190731155246.20603-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ncnmY9aTrcAW3wfwWiq91DK9wslQ3PB1TYL8VfjolEA=;
 b=JBPg2j+QZC5P7JRT+4sDzNQ7s28hZMh+d29Y5p+70YQVnY0koj3Xg5vBYNiD5sQ5ri
 5J4APPF1j2vBuMjgUBpdlUcHqKtQ+psk5fT/9jSZk3ZZZT7GLcdd3+pYSkHPIYCBqQxO
 ik1SacCdcGdxmcS8IFWNPtJfoe6jhlwL5+/pHXAK4UEpmozK8uRBIFSsgUUjb75xr0Pz
 fs8Hbr5w5O6c6fqTCXH86Zw+TQueyOQE9DVKm1LI1p5/cvAdwr74gHWDZiotJaH5CZLY
 McfOwffB40a3OpBWNQHGbuGIEe3j5pvMzlJW2pJfhKvIVSl054atHwVCWeTLNpZLiece
 4W2A==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kIGZpeCB1cCB0aGUgZmFsbG91dC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9u
di5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRleCBlNDg4NWUyZDI4MWEuLjU5NWE5MDdmNGVh
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBAIC0yMyw3ICsyMyw4IEBACiAjaW5jbHVkZSA8
bGludXgvZmlybXdhcmUuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGlu
dXgvbW9kdWxlLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KKyNpbmNsdWRlIDxsaW51eC9wY2ku
aD4KKwogI2luY2x1ZGUgImFtZGdwdS5oIgogI2luY2x1ZGUgImFtZGdwdV9hdG9tYmlvcy5oIgog
I2luY2x1ZGUgImFtZGdwdV9paC5oIgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
