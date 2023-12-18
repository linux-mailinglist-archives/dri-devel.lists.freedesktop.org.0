Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35809817A0E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E944810E3C7;
	Mon, 18 Dec 2023 18:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A0110E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:47:52 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-54ba86ae133so3171840a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702925271; x=1703530071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nKUBapAjhj0X0B96M3zAwIkjMB25EHCfu9hZ082V30o=;
 b=cGWHcLPgxj6BQzB24GdaBjVgOTFwyPWAYb5zJxlTwpxiOGgP14u5wZw+NcnJsFcJA4
 fu0XUEjksLcAxPe/SgQ96jM6x95P3dTyw+Mh3IOcCZtQPtug5ynxMNhgdgdqBNRCnOPq
 Toe82ZWqfp63Zxj7mbUbguTnTQquwaftXzeQ/KFebAQuhU0Cskxf0SDbZeo9xh7LKVnL
 KBf/z0UIdlgYhbgtxjdBxlIb+UP9IY7ye7DrO2NWP+z6Y2ey5AEJ9beiTOIZKkvK293q
 8rqlB9h/GJWyXyucEsXbzAxDKtBzCTXCB2cU05jbj46OA3Bb5brFmK61UrjmfLCjdsLf
 NNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925271; x=1703530071;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKUBapAjhj0X0B96M3zAwIkjMB25EHCfu9hZ082V30o=;
 b=gAaMcyEFIEINzpVb8wPVlerFmbqoez+NLAkMg2NwNkcdLTl2OEXfRsjp1lAI8edngf
 27OV5v23WH8/+jkV7qPFEPPvssyFU4CoF8dL8rAjK3ADRdtDalslbHmGB7/6Rijhi3cj
 5MhYQIs0qWp7ZsjXX+qVQ5wkgY6KhwEdZrYRcpSb95nL4SYcuPb9IXVn8hJlXI6wN/BH
 FCp2WkIFVqIbsz0U8uWA6neZoPLQlW+GjV/uHhJGX7uUZz6K47s8ihCzUQpI6hjD/V7N
 KvMRwZXv7zqA/jyVD5HJL/HICeaGPDsP2qqIJH2KdQrSF6gS1y0WVQOClVoDBQFdUhh0
 DQmg==
X-Gm-Message-State: AOJu0Yz2CNuMp8LUxYa/2Q58hf+zpt+feh8IB/vXt3ty9LP55WzCVKL4
 sNxb/3BsZIzSVB11VJ/CJMhm4Vb3Xd0=
X-Google-Smtp-Source: AGHT+IG6VzyjvQH34+G4mZe3J8X6d+shURJPU4OY3fo8K/ff+S+V8abQzu8/HpzcKzta+X+jlpzp8Q==
X-Received: by 2002:a17:906:7399:b0:a23:6c6e:6b4b with SMTP id
 f25-20020a170906739900b00a236c6e6b4bmr282667ejl.45.1702914522076; 
 Mon, 18 Dec 2023 07:48:42 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 vq6-20020a170907a4c600b00a19b7362dcfsm14334325ejc.139.2023.12.18.07.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 07:48:41 -0800 (PST)
Message-ID: <745f84db-dc9b-81b2-6171-4d8d86a96966@gmail.com>
Date: Mon, 18 Dec 2023 16:48:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 1/2] drm/rockchip: rk3066_hdmi: remove unused drm device
 pointer
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com
References: <f86ec29f-194a-800d-0aaf-9e16e551b37d@gmail.com>
Content-Language: en-US
In-Reply-To: <f86ec29f-194a-800d-0aaf-9e16e551b37d@gmail.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 mripard@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_dev field in the rk3066_hdmi struct stores a pointer to the DRM
device but is never used anywhere in the driver. Let's remove it.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 62e6d8187de7..0dac6d133767 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -40,7 +40,6 @@ struct rk3066_hdmi_i2c {

 struct rk3066_hdmi {
 	struct device *dev;
-	struct drm_device *drm_dev;
 	struct regmap *grf_regmap;
 	int irq;
 	struct clk *hclk;
@@ -752,7 +751,6 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 		return -ENOMEM;

 	hdmi->dev = dev;
-	hdmi->drm_dev = drm;
 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
--
2.39.2

