Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EA57F05DC
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283B610E1E3;
	Sun, 19 Nov 2023 11:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F5510E1DF;
 Sun, 19 Nov 2023 11:28:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-548696eac92so1644377a12.3; 
 Sun, 19 Nov 2023 03:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393322; x=1700998122; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
 b=g1ufn48LKTMX0XvhRNy21Y8eGJzKCWeKORKNa5V2XuW5Ttk8VOysaDWWZOyv7Yl5kF
 NN9WhRw0VFJST2VmAkvRkF4F5hXefbQ7Vp7ce4Sp54TV+aGJuiL3fSXvGaY77ZmxOc9N
 ZapiC9/+TiHM1qlby4bHSUETo0wJc4PCes1FFF80+yCpLHogsA7FL2/boLWF7V89KjIN
 o4YTLsuQU7bES9mJYDp2qhS+clPJZ05ftgbEZZa585xnQ7ABhZUbTMPZd7BfHsanhjY4
 L/Nbl+XZTLXws7f07XCEL//f5HtnAEkRa5kAhv7/xPYdkvxQQY+UTVJAv6QYIamxB2VG
 hXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393322; x=1700998122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
 b=ABax4eiV4CG7BazLgvPz+0vjT2c5kQgxFUop56sFHKywrezQlSv76H3pO2CfAbhamH
 7SmpG+jqVASKH5hmhKi2sziksrMzNg3oGnGvIb6zPrPCOBcQRiRUg9A1Hkr2Cb3MEtFc
 FeBnRKVwaEZARHa85baqJ3f4uH4puBtj+fubOKhRJHbn6OY54EnHQR/BADu8Mlv263gq
 qtelG2fTtj0x4qvkzKRz8NS+mniZx64CG7WvrobpV+R5oI/gF7XxU5QeDIdTghZ4CbHW
 dJBwCmKvtVYI2cVBJSfZ6mfGbWyJVgssIpVvYxI+LtGAvhJkGB9gnjgU8yynclgeok4i
 KKrg==
X-Gm-Message-State: AOJu0YwzspED0h5t1DUKe84LYdL8IyhNXtCpJ6CFrKWlxJTjT5rXPQZ4
 dz7xy2gJk2i8LST6zXMjwOA=
X-Google-Smtp-Source: AGHT+IErpTouVgXqlh3TisiJyv9Y7lrxQ2t5uB7O/C5V8sCHaKfqSNKhBvmGLqTZ7BYeJj6wkdbyzQ==
X-Received: by 2002:a17:906:1099:b0:9fb:d7cb:6e03 with SMTP id
 u25-20020a170906109900b009fbd7cb6e03mr1924992eju.20.1700393321970; 
 Sun, 19 Nov 2023 03:28:41 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:41 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:19 +0100
Message-ID: <20231119112826.5115-15-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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

