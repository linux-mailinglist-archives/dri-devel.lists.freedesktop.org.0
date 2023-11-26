Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A93BC7F9266
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 11:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F0410E0F0;
	Sun, 26 Nov 2023 10:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909D210E0F0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 10:56:57 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a00f67f120aso444647366b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 02:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700996216; x=1701601016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ea1jLeAmnQSy9N/+din3DyjLsbvTIXpsAIcN3X7QL+4=;
 b=GUMInql1FIoqWuFDCF8FKOT1EWdejc54FqCp7xdFulV692DXOc8PtqxcMPeFlVKH8n
 RZKTkVzWTLBNkSNzt2NodsJVelzoPjSUZVeNBf9tIXe9HKoUU2TbNKa7vlHxS9+d59CC
 p0KhtVvFpPbujIT8Rn6/WGQFDZITTSYdy74LrUvN4bdWiiHcakdWMaMIceOynawHkhqg
 DK1rALD01SezH7IxKOVhCwkb7MkoGwNaiebz2KTJnetQd/xFjGEpJnX1dSehOkfzLnh8
 SEfhOnVgW5oWCbmlF1//erR0HnEpPaAI6AU9Eq52ZSTb9ULwy1mv1HmJATyjW0JHg+GE
 OkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700996216; x=1701601016;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ea1jLeAmnQSy9N/+din3DyjLsbvTIXpsAIcN3X7QL+4=;
 b=D8tm1hObn8byIMslWOxrAjpAZ7RRdhggvvra/RRz/P37w+4KC/dFqsOpg7OeFGnXIF
 z/eAfzTO63h0F0UckA2h3yALNMOoEenOsyflO17srJTJ58EghrQEk92nl+BnLnD6UbOw
 ERfi9M7v3RU74Hf7J8bXs0xHTww5StWD+rXQJVELf3ij5c4m8xPWX5s7lPrayJNUyCBu
 sERcxp173kZIJn0xxWXMhpGGkga/OzCcoi312UCjtNAhRbsl/YghyO6I5tPkdlSwHbHv
 CYU7ntAIyZ8dNZooTlODq3oL2z7e4GIza6r0MdTDG6wRzCPpX9bPFkZ9Ol+zvpaw3CfH
 2UoQ==
X-Gm-Message-State: AOJu0YzfAc2dbWzZYTJoJtKRY75T3kYI39/Q0U9TWWrujNIid0dFCql6
 kLGSY9kS77VynpYyV3AsgNs=
X-Google-Smtp-Source: AGHT+IG+GOdWj/VLVzcj/3gp7NPqtTAhePXdP862ib2/pBvG9jdmpQQQJ8+1VOz5rXcM4Gp99vR+SA==
X-Received: by 2002:a17:906:4557:b0:9e6:38f2:8439 with SMTP id
 s23-20020a170906455700b009e638f28439mr6350967ejq.60.1700996215660; 
 Sun, 26 Nov 2023 02:56:55 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a170906145100b00a0949d4f66fsm3083431ejc.54.2023.11.26.02.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 02:56:55 -0800 (PST)
Message-ID: <a32406eb-1a3b-f8ce-9b74-1f5f09bb5f1e@gmail.com>
Date: Sun, 26 Nov 2023 11:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 3/3] drm/rockchip: inno_hdmi: Remove unused drm device
 pointer
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

The drm_dev field in the inno_hdmi struct stores a pointer to the DRM
device but is never used anywhere in the driver. Let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 535cca30c256..ff7fa11dbc61 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -48,7 +48,6 @@ struct inno_hdmi_i2c {

 struct inno_hdmi {
 	struct device *dev;
-	struct drm_device *drm_dev;

 	int irq;
 	struct clk *pclk;
@@ -821,7 +820,6 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		return -ENOMEM;

 	hdmi->dev = dev;
-	hdmi->drm_dev = drm;

 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
--
2.39.2

