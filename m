Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603027DF414
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF0510E8BB;
	Thu,  2 Nov 2023 13:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C7C10E8BB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 13:41:51 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so1627769a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698932510; x=1699537310; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=525ntZUU9IDbVV4Jw2CWfdlqQxiLo8Ec66BuDOeD0GA=;
 b=VSZTcq6iBrVzla8h93rtVURWR9YUkwcVfVUnK7Pq5VB+WFVJP3nJny17mw+2jOrcvA
 q2eUR1NqJdUe5RxId72fo3JTPFff56jWm8XPRA3+poEChiCI0cov31HGsyOMUXp1a0Gb
 NlsL1XuN3/fp3ZkhIf8wWq5Gbzjzn6W6PrCT3VJkqvztnXatG+j7aV8uSV3wpGP8DWH0
 x85l+6zvr1zk8ppm2AyHgXH2/d/O8wjz50x6S5bVFvflaKij/Sp4qhgF6vv6TEE1at/q
 UZav1phaCP9DBhXOaVXWyUk3DH3Z1zvEqlfTHPzk68qdpp8ALhX91HjBdy0yHCZzievK
 cZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698932510; x=1699537310;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=525ntZUU9IDbVV4Jw2CWfdlqQxiLo8Ec66BuDOeD0GA=;
 b=GO25oqvDrPjf/1hc2EeKDj+MZ3Hjh/JkBcSfnud4HPIBke8v3ciEtH4fKCg8wimk95
 61lLxYYVYlUC/0rBZO4HUYwSoxQvifrmu5KTkT41JyHIs68cNJjb2r6pROoeJiYXcErW
 2mQHyIBj3HxDlzXf641VIiFxTEBfE9VfbLO9yR2WHrmeWgdPJZW70rUiG+wOZ2BCXRyg
 RRpI2oFgCBJHvmYCl9/Em59pJ0JoJaWp26AWX3EXBvlsuf8beDcbQSU2H5G0NeG2qBKP
 G2xQPdxkXlDv9Z7aVFbbLmeiQhfhTXE5hfOCf2R+0UHaA65yF+ACY/YPbWqJqZalIdLy
 g+bA==
X-Gm-Message-State: AOJu0Yz5nX2xCHTf2uYbAtSwip/dYHzW1JOKxLfZwFShRnsbow3oW2nI
 gw/BF3X+0VQKPIO+rLmSr74=
X-Google-Smtp-Source: AGHT+IH973wFt6bqHW7cDZN0wKW+UkKsLKCaRg36hSJokndjWn786idIO5cQuLHCEfTXF8UIDskt1w==
X-Received: by 2002:a17:906:eec3:b0:9b2:b153:925 with SMTP id
 wu3-20020a170906eec300b009b2b1530925mr3895676ejb.21.1698932509891; 
 Thu, 02 Nov 2023 06:41:49 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 hb9-20020a170906b88900b009adcb6c0f0esm1157638ejb.193.2023.11.02.06.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 06:41:49 -0700 (PDT)
Message-ID: <5649ac03-db92-42a9-d86a-76dfa1af7c64@gmail.com>
Date: Thu, 2 Nov 2023 14:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 1/4] drm/rockchip: rk3066_hdmi: Remove useless mode_fixup
To: hjc@rock-chips.com, heiko@sntech.de
References: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
Content-Language: en-US
In-Reply-To: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
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
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode_fixup implementation doesn't do anything, so we can simply
remove it.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index fa6e592e0276..5c269081c691 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -434,14 +434,6 @@ static void rk3066_hdmi_encoder_disable(struct drm_encoder *encoder)
 	rk3066_hdmi_set_power_mode(hdmi, HDMI_SYS_POWER_MODE_A);
 }

-static bool
-rk3066_hdmi_encoder_mode_fixup(struct drm_encoder *encoder,
-			       const struct drm_display_mode *mode,
-			       struct drm_display_mode *adj_mode)
-{
-	return true;
-}
-
 static int
 rk3066_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 				 struct drm_crtc_state *crtc_state,
@@ -459,7 +451,6 @@ static const
 struct drm_encoder_helper_funcs rk3066_hdmi_encoder_helper_funcs = {
 	.enable       = rk3066_hdmi_encoder_enable,
 	.disable      = rk3066_hdmi_encoder_disable,
-	.mode_fixup   = rk3066_hdmi_encoder_mode_fixup,
 	.mode_set     = rk3066_hdmi_encoder_mode_set,
 	.atomic_check = rk3066_hdmi_encoder_atomic_check,
 };
--
2.39.2

