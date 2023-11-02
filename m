Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2CC7DF41A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A0410E8BD;
	Thu,  2 Nov 2023 13:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2AE10E8BD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 13:42:22 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9d23be183c6so155550566b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 06:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698932540; x=1699537340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5ij4W2R7Rk89TAWTRo2Z11H1sJFKrF9K18A1hdSCONQ=;
 b=MFwOfiDaxmowMkLvve3m/xFiLlP7OL2j5FrdO0C0C4yzra+yCSLTREHRLpOgJMba8p
 tXJ0SsGrfiLL45PtkyvblUqkuF+3AwY+KBxHO73BdYUaWWObPBOKN4a9k7Ca/QoLeWwG
 IsQsQNJaKWOou64k7bEKgpzKjoYcGiwkpUngqir2vZBZ+LsrHP56ZnYYUYGvXpKzs/4G
 991ir/6IlQvrtPaV7GfbKI6RNGq19pDVxMDWoWor3A1EX0em7LAxMTvnLGaXEPHWLeTu
 KUu0fcC2xepgJaVvKXLmTyvkwUoYD7W4BhC5yKqFOzJtQW3JDlguKMid5h85xSF9QTWO
 BhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698932540; x=1699537340;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ij4W2R7Rk89TAWTRo2Z11H1sJFKrF9K18A1hdSCONQ=;
 b=fBUH4/lSPnO5uWMujdOdXyGLj3DOTWWqopfWs9QgpR2PWOJW3y6zjHqZHV3dkFsoj0
 DN59sFFLNjZqoP8nVmrBHsqYFmPZotrLXmEqVdvnXd6oeWtTtgJ9fmjhPtLctOg5ytCk
 A6EmtSxa/CzUMvSA+UoISwL+tP7aHRX+H58eF9vXZEp1QblsN8S/UJjDwQ1pNRzNWqAd
 Q8ZY3BFDZ4TPgLR9CiKgH1cHIaG2SJ4MTU3GG5BFpslmx6LzOUiqxGZ8fZ1vvt9fpRHC
 h8S3Jz78G6Ismf/0VQW21JA434j0bQoCop4A8y6z8rV4xITapiE3rYo3wv5IuGRc9dLu
 Md1g==
X-Gm-Message-State: AOJu0Ywn7IA6Za0BmeUVtTr6UBR6IdvvjFNHp8EJ0RzluxxqY78TKvcz
 zM4vgeQynFQue/m03E1+WjM=
X-Google-Smtp-Source: AGHT+IF6LP+ml1ogEFi5qh8KFdD9Bqg3MegxZWCzvRijCiVmpR9CqHGHL0atdCUWnRBs0neVN5QPqg==
X-Received: by 2002:a17:907:60ca:b0:9c7:4d51:af08 with SMTP id
 hv10-20020a17090760ca00b009c74d51af08mr4508255ejc.43.1698932540595; 
 Thu, 02 Nov 2023 06:42:20 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a170906278800b009be14e5cd54sm1153220ejc.57.2023.11.02.06.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 06:42:20 -0700 (PDT)
Message-ID: <bb5cac77-a705-738e-13ae-667ea87f1cb1@gmail.com>
Date: Thu, 2 Nov 2023 14:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 3/4] drm/rockchip: rk3066_hdmi: Remove useless output format
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

The Rk3066 hdmi output format is hard coded to RGB. Remove
all useless code related to colorimetry and enc_out_format.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 0e7aae341960..f2b1b2faa096 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -23,8 +23,6 @@

 struct hdmi_data_info {
 	int vic; /* The CEA Video ID (VIC) of the current drm display mode. */
-	unsigned int enc_out_format;
-	unsigned int colorimetry;
 };

 struct rk3066_hdmi_i2c {
@@ -200,14 +198,7 @@ static int rk3066_hdmi_config_avi(struct rk3066_hdmi *hdmi,
 	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
 						      &hdmi->connector, mode);

-	if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV444)
-		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
-	else if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV422)
-		frame.avi.colorspace = HDMI_COLORSPACE_YUV422;
-	else
-		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
-
-	frame.avi.colorimetry = hdmi->hdmi_data.colorimetry;
+	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 	frame.avi.scan_mode = HDMI_SCAN_MODE_NONE;

 	return rk3066_hdmi_upload_frame(hdmi, rc, &frame,
@@ -329,15 +320,6 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 	struct drm_display_info *display = &hdmi->connector.display_info;

 	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);
-	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
-
-	if (hdmi->hdmi_data.vic == 6 || hdmi->hdmi_data.vic == 7 ||
-	    hdmi->hdmi_data.vic == 21 || hdmi->hdmi_data.vic == 22 ||
-	    hdmi->hdmi_data.vic == 2 || hdmi->hdmi_data.vic == 3 ||
-	    hdmi->hdmi_data.vic == 17 || hdmi->hdmi_data.vic == 18)
-		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_601;
-	else
-		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_709;

 	hdmi->tmdsclk = mode->clock * 1000;

--
2.39.2

