Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87437F1F9F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B4310E1F8;
	Mon, 20 Nov 2023 21:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E2410E1F4;
 Mon, 20 Nov 2023 21:46:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso16966675e9.3; 
 Mon, 20 Nov 2023 13:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516801; x=1701121601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQ/FEK2mYsIsrLAMj1ftUkEFHG7z/MaBn+ksqWZD4+o=;
 b=g2VGKZCHnM9MRIzFnsZO74hK3fBmdQCXooZU1YNvCMJsOqBDcyf42H1V8kUmhtjsRd
 KvivgzT4f9lv2Tf0fNUqBBo5PrZcS36IYeukbuiSpqalfnf1tL/PMrWzSOXNv98i2ZWS
 ofWerhdRyCY+yYvQTZNEVivjxPBGGBrRSbhO/CXDGfU0DY00Yli6Otf6PvCmiBJnrTP4
 IvyMitwqVuVKfHPq6mESIPq+BcxHubDmwkyU/D10uUDGA2k4Xd6OuP50uNhArUMFeOqy
 Mpjb/LkQiJTZLneTWkmeamaeBF+lIpZdqVFHGwgWUCtlSaFFVYgvrWAE69BLAT2V6Mck
 LlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516801; x=1701121601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EQ/FEK2mYsIsrLAMj1ftUkEFHG7z/MaBn+ksqWZD4+o=;
 b=v3NeBmzy9nLYjwT6FZWjl7D2blMkRZFoYB24ZvZqbGoPJ5HmMb+iQ3RF5KxaH/3gA6
 W7DC4I/Fx5vTPLZ9H1u1/IPDD0HIZ97504SD74hCpb4OY5EbNDbDaZ7ImubVzgMqWLf6
 RHIvTjEFyKl05XTXI7ObhGF04jn9oY8AofYM0zSqV8C+hcJwoNM1xTz51krzqqwFSocT
 cyMThxT6YC8bR0e5Ptkfl19OoHVLQ5MZQs45Xu+qkEC5dmuknfH1Zf6KCU4EcTIHWk95
 TdbmFuEZkJ9l2Aksh4T1vJYiH5KXqDVuzYLf/+Jqru5fQm5jdRprSr6vn0fp+mPT/2Md
 7iew==
X-Gm-Message-State: AOJu0Yy/XXdut0v6rVfP7U8sYXZ/9KZCZZ92BlmLUMhWq/7KjnUaEyJ7
 S/s1k41iUMKohNVMXIWaxOw=
X-Google-Smtp-Source: AGHT+IEJmFFE3EHKXQ4RGWFBYumObm40aSlus52AgE+TXXlh+CCacbrX+eglWn0cbPoyet+nNAcCRg==
X-Received: by 2002:a05:6000:4010:b0:332:c1da:4cca with SMTP id
 cp16-20020a056000401000b00332c1da4ccamr4845981wrb.14.1700516800595; 
 Mon, 20 Nov 2023 13:46:40 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:40 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH v4 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:17 +0100
Message-ID: <20231120214624.9378-15-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index de182c004..7aa500d24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -249,7 +249,6 @@ struct i2c_adapter *msm_hdmi_i2c_init(struct hdmi *hdmi)
 
 
 	i2c->owner = THIS_MODULE;
-	i2c->class = I2C_CLASS_DDC;
 	snprintf(i2c->name, sizeof(i2c->name), "msm hdmi i2c");
 	i2c->dev.parent = &hdmi->pdev->dev;
 	i2c->algo = &msm_hdmi_i2c_algorithm;

