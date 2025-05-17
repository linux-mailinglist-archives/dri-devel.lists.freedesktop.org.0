Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD980ABAAAB
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 16:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D424010E18A;
	Sat, 17 May 2025 14:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WeGYfjNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3C910E18A;
 Sat, 17 May 2025 14:22:14 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-4e1432aaa68so1167570137.1; 
 Sat, 17 May 2025 07:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747491734; x=1748096534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebHBn70fzOohxHKMogpU/QpljeY1CIw36z0/V7swSqU=;
 b=WeGYfjNFFAccK3G/tP9LyFVV2REd2m7qg2uy8HmVBQEbN6HDFj+4sdvVl7RDb5zVGK
 Y4jjDAmOkRseB8sZxlsnWyQK9eqJQWgVez7BWfDbvh14WEyx5THV0BLeL7/edYLsiBBD
 ITgFdkRELNsOHHzQn1CyTGzqotSjQHxOrlqHeMnvNtffcMw+YSrFbKnepeh9LW7Og5yG
 etnNcD5rKQUvf7OrB01xOwJPJaGANYM3LjngRdknUGp9NXDuVTzfr/hlp2O7KMIA9xlj
 lLb9vcscMOnRcIsVZXwgD/Q785Pia2w3xyCfyBmSF6JuBWFYBTa0w65NC6h0vOqAabPH
 rm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747491734; x=1748096534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ebHBn70fzOohxHKMogpU/QpljeY1CIw36z0/V7swSqU=;
 b=Gd291D8UCnYmS9vdi7mdasRb0rC31hgVrKnAOWTVNEAfe14j0kyW0HTMFim28fC9PY
 N/6M3Yf+FKV2MiiJUWT8CWAE4JNcmYufEolSybM6wb3G5pYoG63EGNGcBBWDHrXBB0ko
 a1J5DwI1LennnfRcImb2Wjo0ybxr9BeVDgTKzBT3+Nr/CE7nwbz2PjDmZLlrUvsZm2L+
 P3mW9HgiVPvdb4+Ksu64lVUoVi7ioswu4LmuhLlHb29Yhp+j9HbM1AjqVAo0YyAWRM2b
 lGqd1XstkzFEa1zrUB7s6kZSPFXGYoZstR+tfJA0Gyj1a2+8bTFS6qSlgrgXsz/D0SlH
 zvzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgDLfNkXECGL4lddrSgOu9YLZ1Ix1roaNTnbcW+ZqnXo5kO/PCOXYR0nc6Ov9MoDVWnP1Xp4ss1iHF@lists.freedesktop.org,
 AJvYcCXJJSzlTlUj6mmsvSmi/fCHCKa9zSjh4Z5oaBe82UbBDMEq5CB5Fexd28fiCNJnik8gHNMMdvvQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu7vm502y6/W5T/0Sjm3ZNXUJKEMubhKJtVtkl830HAOmkQ7Qq
 /8s4IX1noLCXhGGAssojg2rUYU28Nx8yvLeJpVCGMjb10+MXLhPT81HJ
X-Gm-Gg: ASbGnctIlYRUNxMH1oXdqTvH8vaUye99GS/PfJy79Jk+Fy5oYXY4YpqQCGyqH0oBedT
 9Bb/SQQ8tuWHNvlkD5ECP3CeFSFd3OTHqYZrH312/nZPuO6XL9KKkCCqnXbxJZFEvOescLpPggW
 rYcUgfR6EpXgark7Pa0ZnOgVR7D1qSINS7NdQCzbT87UnBf3yyaImHtjRTBUggFpus7nC0W4eyk
 2ozZ7Cv+iipZOyc8etXvyVJrXr7ktwfDUvstu1NjLgKb2YXHnONClLOWfXKiOqfyc+lMMv2XlcB
 CKNZNMJQIItTEmXV2QJiG9Vr2RPB7Mxxqs9hUoim/q7Z5fmP/JUDnyLho+nkqZl5Psbp0Fwvefg
 rSR0N3gUDupXLRwdFdLYj
X-Google-Smtp-Source: AGHT+IHIf5S9A8MU8z6syCw5JmoYSwgXuc/5SluE36UbN0rCFyYsvEe/4oGqwjB2QwnwlNfyZlgqQQ==
X-Received: by 2002:a05:6102:5e84:b0:4bb:e14a:9451 with SMTP id
 ada2fe7eead31-4dfa6c7cc25mr8668858137.20.1747491733674; 
 Sat, 17 May 2025 07:22:13 -0700 (PDT)
Received: from xodo-linux.tailb46509.ts.net
 ([2804:1b1:f983:1b4a:2975:d863:b306:345f])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87bec1ef3a8sm3349819241.21.2025.05.17.07.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 07:22:13 -0700 (PDT)
From: Leonardo Gomes <leonardodasigomes@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: derick.william.moraes@gmail.com,
 Leonardo Gomes <leonardodasigomes@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2 RESEND] drm/amd/display: Adjust set_value function with
 prefix to help in ftrace
Date: Sat, 17 May 2025 11:20:55 -0300
Message-ID: <20250517142114.140016-2-leonardodasigomes@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250517142114.140016-1-leonardodasigomes@gmail.com>
References: <20250517142114.140016-1-leonardodasigomes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adjust set_value function in hw_hpd.c file to have
prefix to help in ftrace, the name change from
'set_value' to 'dal_hw_hpd_set_value'

Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
index 886dd05b012f..01ec451004f7 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
@@ -85,7 +85,7 @@ static enum gpio_result dal_hw_hpd_get_value(
 	return dal_hw_gpio_get_value(ptr, value);
 }
 
-static enum gpio_result set_config(
+static enum gpio_result dal_hw_hpd_set_config(
 	struct hw_gpio_pin *ptr,
 	const struct gpio_config_data *config_data)
 {
@@ -106,7 +106,7 @@ static const struct hw_gpio_pin_funcs funcs = {
 	.open = dal_hw_gpio_open,
 	.get_value = dal_hw_hpd_get_value,
 	.set_value = dal_hw_gpio_set_value,
-	.set_config = set_config,
+	.set_config = dal_hw_hpd_set_config,
 	.change_mode = dal_hw_gpio_change_mode,
 	.close = dal_hw_gpio_close,
 };
-- 
2.43.0

