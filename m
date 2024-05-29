Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CB08D41D5
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 01:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CC010E286;
	Wed, 29 May 2024 23:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DVgr5/Bz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BC611A968
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:12:34 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52ab11ecdbaso339978e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717024353; x=1717629153; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TkMzRYwH0rVG++I7PNZai1lbvWhZpzJwskrcS26a0W8=;
 b=DVgr5/Bztnr2E18DnNj38kvegFLM4t9kEttjwXFnQ5EW5AyrkmvTX2QldV6DByVt4g
 8ZwAEn+MG31r6Hz6I8I0d77cJRlA8TQ6z7S5IqDKKDeNPxsklO/cEvwNFsHDs1Bj0k9y
 zxc2REPoXIvAfGDwmaxvCBRXy4+gsYXaODLoHG9wvRfthRlxXRUH5jDbIpk65pOdsRyq
 3J14fendmbik7hskoXtUgnJiKpVFk5sJta3qhO+1QhAeRsNd//miwzAC8PK+arJdvQsE
 z3gNKobC268pS690ffZmkbzZJVYiJj7UmQWL19ZNEp5hn/yFA5EeUy7QzJeUw3lNc65R
 2YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717024353; x=1717629153;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TkMzRYwH0rVG++I7PNZai1lbvWhZpzJwskrcS26a0W8=;
 b=k/uzidATyhCw25nA4mEeekJWLA5MBaubqSzYo84p1BIrQQPH/LuZw9JDJwkVikODN7
 DD3eDw3YaD++O4VqrI4Ef/RaKuu6kJHAlrK6uyVrk66xnNYZ0bGJI0vKGr4n4e7qdpFK
 z3JQIGA5K8qhWpYsRRRvhrEQMZsdjw2AG0CBpiSrQKKXTnnyHLAF2RNyzSSyehYib1HU
 zVTlEMsTWLuHbHEoy25ek0ZdGSOGTSccsbk9yY/Vmb2H2Uf2RCk0loQ46hV0wbg1IwCb
 Vsr581b13ksObqABqQpDNENUT+X7EDCnap4DbCISXWLf9kgjXDOARusyX652wocSbvu3
 8yAg==
X-Gm-Message-State: AOJu0Yw/SjhmGLd2NxXDtHwATnbGqFwBSzfQCF7//y6bl7wGF6X4Td7G
 MNuzBh4MLmm9yBOgraV4ayob9I/cU9uqIPP9aaTin9x7sYRzWdZjvm424QGYkco=
X-Google-Smtp-Source: AGHT+IGmn4vLOr1MpA4C9QZUwUHy3hAdOgzgBEcF4Qehtqq74DHO6cH6XT1OjA7Xg6kiavbvMjoCdg==
X-Received: by 2002:a05:6512:48d7:b0:52b:51f9:a37d with SMTP id
 2adb3069b0e04-52b7d48dbaamr287163e87.56.1717024352703; 
 Wed, 29 May 2024 16:12:32 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529acea1ea8sm1015998e87.276.2024.05.29.16.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 16:12:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 02:12:29 +0300
Subject: [PATCH v3 6/7] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-bridge-hdmi-connector-v3-6-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
In-Reply-To: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JXbaAkUfXwOLePC7VJ3jRbdq5WguoXJxRCdZfMDCGD0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmV7ZbQzkUf+QwXevZVgVGcnoXh6v/BnUkVpyoc
 TiWtOs/RsmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZle2WwAKCRCLPIo+Aiko
 1aJICACGzEbeaqCcKTsoSOiXZTVsNiRuecSSJPWPE015VnX/qerF5K3/E+W4puR/itA39pQ+bcq
 XkmAGajulOanAgaEFLW5+CgQs/hK19qo2bLZ0VI1iB60zzfsnVU4feOKWnKvESKWOpDNhVhsVgB
 M0Feb0yG+pNYFPlh8uYHaU2PONT8HFdj3kzXJ4drgba2WdWRpUG6zR0BcfrkWkRlAkkVr4nAidl
 ZC2F20SCwLa6EsGFmKm0XbHJayCT52ncDPTRcpHGdSpwUo72VagG341Lyerufqww2nTTO3csU5t
 gcLLxlZ7++W071qCfiOGgJ4h2YcoefYvJPvuv5MuyJklXkyh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The GENERIC0_UPDATE field is a single bit. Redefine it as boolean to
simplify its usage in the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 6c81581016c7..fc711a842363 100644
--- a/drivers/gpu/drm/msm/registers/display/hdmi.xml
+++ b/drivers/gpu/drm/msm/registers/display/hdmi.xml
@@ -131,7 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		 -->
 		<bitfield name="GENERIC0_SEND" pos="0" type="boolean"/>
 		<bitfield name="GENERIC0_CONT" pos="1" type="boolean"/>
-		<bitfield name="GENERIC0_UPDATE" low="2" high="3" type="uint"/> <!-- ??? -->
+		<bitfield name="GENERIC0_UPDATE" pos="2" type="boolean"/>
 		<bitfield name="GENERIC1_SEND" pos="4" type="boolean"/>
 		<bitfield name="GENERIC1_CONT" pos="5" type="boolean"/>
 		<bitfield name="GENERIC0_LINE" low="16" high="21" type="uint"/>

-- 
2.39.2

