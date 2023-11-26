Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF617F9261
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 11:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3C410E0E5;
	Sun, 26 Nov 2023 10:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD4010E0E5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 10:56:12 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54b18dbf148so1402115a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 02:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700996171; x=1701600971; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mN5h4JeQlyNJ6i5AWUS6aIyGqp9DnO+inxm6CANO/d4=;
 b=GivMo8FIVUv9TzwHLrfXQ79aNtOQ35csdA5h/Mxgt6fxcJ9Wa3oNb7g42DzjI7Ze4u
 ckMFU+mypz+ZwSCjiBrOj7XR/PxtQvYFo7zXWyG5pPi9v319OJjow5k/gg5+6Tbp02na
 1pJcTcAJrKGwdPH3PWrSKlcgU4+2cr5/gzDvEnvC1gGK1WLOpidrMhaN7GsuV4vX/bFV
 DKz06AQ+LYLm/SGh2LfXBIazuRNvxFae8elaPkrsTe0wJAWCFws4fs0b1XarmlG3RUqz
 GsXAKHfVCrs80JYmpaan8ctfpPy3eDIO0vkCzHtBXMiXN+u0s7Dlqo9Bs+zS7NpUor/a
 haCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700996171; x=1701600971;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mN5h4JeQlyNJ6i5AWUS6aIyGqp9DnO+inxm6CANO/d4=;
 b=KLDMso4xnzv3Bc722ny+XI6s5DvH/4Bs7+ni7yIxv7ZJqxd89ZcaI8yE7cFV67jmP9
 YqPMpwqFgGD9D6WjHlTsqgmPBbLGHBWHD7QacGB4KImrH+qSZL2MfNyyD2Hjc+HLuWiE
 BpdwqS2bCaVCHRCBVtI0huZFaAV3uC+ajGFslNNd8rRGOBLDwsWPMDUVL4Rvif+0jqlV
 OoBPpfPAnQMEUnXiWNSTgyKOzK6tCOKqUk88Tr/qCkagUnKwEKG99iZJqaz6M62hbowu
 5AFCoxva2Aia0dwab4aBQuOyKQ7LuChg3ACdLQSwsLCTVTWaEww+WUOIHE/BiCS6S096
 NTWw==
X-Gm-Message-State: AOJu0YxEYHKEnKHeCbYuYT/ITcCW3oEySoNSZmC4KIVaOwyAwq7oOR7r
 PtFFhrJlABFroq9FCrQorKg=
X-Google-Smtp-Source: AGHT+IEOyqWMk44eN134q8IBZJzyDe7wGYih+f76HdhbtNuQJ+hi/1cY0IEENQqhqYe0kBJwSUOqgQ==
X-Received: by 2002:a50:8d4c:0:b0:543:5c2f:e0e6 with SMTP id
 t12-20020a508d4c000000b005435c2fe0e6mr5900684edt.17.1700996170898; 
 Sun, 26 Nov 2023 02:56:10 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a508d19000000b0054ae9d77989sm3281586eds.64.2023.11.26.02.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 02:56:10 -0800 (PST)
Message-ID: <1ae0d08b-4f99-39a2-d692-d0cb1efaef7e@gmail.com>
Date: Sun, 26 Nov 2023 11:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 1/3] drm/rockchip: inno_hdmi: Remove useless mode_fixup
To: hjc@rock-chips.com, heiko@sntech.de
References: <2601b669-c570-f39d-8cf9-bff56c939912@gmail.com>
Content-Language: en-US
In-Reply-To: <2601b669-c570-f39d-8cf9-bff56c939912@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode_fixup implementation doesn't do anything, so we can simply
remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 6e5b922a121e..cc48cbf85f31 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -517,13 +517,6 @@ static void inno_hdmi_encoder_disable(struct drm_encoder *encoder)
 	inno_hdmi_set_pwr_mode(hdmi, LOWER_PWR);
 }

-static bool inno_hdmi_encoder_mode_fixup(struct drm_encoder *encoder,
-					 const struct drm_display_mode *mode,
-					 struct drm_display_mode *adj_mode)
-{
-	return true;
-}
-
 static int
 inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_crtc_state *crtc_state,
@@ -540,7 +533,6 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
 	.enable     = inno_hdmi_encoder_enable,
 	.disable    = inno_hdmi_encoder_disable,
-	.mode_fixup = inno_hdmi_encoder_mode_fixup,
 	.mode_set   = inno_hdmi_encoder_mode_set,
 	.atomic_check = inno_hdmi_encoder_atomic_check,
 };
--
2.39.2

