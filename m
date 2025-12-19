Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A713ACD0ED9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 17:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32EE10F047;
	Fri, 19 Dec 2025 16:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="XWnQFMMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B182D10F042
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:41:22 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b73a9592fb8so405439466b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1766162481; x=1766767281; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O0HzFaVjwMvZjTaaJOfxP1smFpIabOwZw0I+saghW9I=;
 b=XWnQFMMoAIyYcPzw/pQxxI2zK9w21dY4I4WvMOhZ2EkubAEibsVty7vDXDeWeCKQMI
 xhyZicAvCc9ct/61Kns/oIjcYhRSPbx7yEX03JQgu1WLWztXq5GtybLPOeZGgmA5ZsiC
 QA5Tvhuypn7X7EXQWn8NPwFWNYdEsmLyJNMWbDIyp6yJ66PM17YYNzQXTXioA+H4d6OW
 7lo3VYaPfVPoyj0Xddq/eI0EBw35rPSKjUjxkz0ugoZf6Fm+q1QMu9JPjP7Bs3ttdJY7
 bzYgWJ4q5MLIoQIRvcBNBW0IkoG08a+2z8FwAHtp7he9MUKd0LE74OYA7zypP3vp6K0+
 qAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766162481; x=1766767281;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=O0HzFaVjwMvZjTaaJOfxP1smFpIabOwZw0I+saghW9I=;
 b=SswOMVW3QXsF0Kq+aPwM4R2bTPr1C8lWD/alJDlrZXtrDDLkEqcNLdgkJxUoU7OP8c
 rMxDoLutVGwWRTwNaG7xL9RsqbnbjFfhvKJhGdJooSQg1gztBIbrxXXt4SmBj3y1IA+H
 rIAGZ2WqM74ofDmGd5cj/1KSeziNw3GbnIVZq07+A00KgHtYNLwsNVIRXBsDRy7f3t9V
 wljpFgSedrzWXkKSUDtZTpfbqRwy3gT9CFXAZZGqLKfyxS0vL1xycXDvQOYozzPjOX7i
 ZipbCe4+ee+AwFfNYQID0yv+nVPfPg8HxvzYv/SshdbWt6jNq4w1dGxrOQf4Xe1b5/WM
 hijA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTKLOexcmHWQAiJhBpZLrwl4Si/FztJAXeomeIHFQR2DHOOCB17ObOJGNlReAVb+onD38/m8X7qZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvgSIJ2NEli1vTdNRlKQJMAOQt2pf3Sxx174X/o5GfDmWNavWO
 p9ISDiJ3xMRaqgUFO4bhObeAiu4QLQL6dPj1SKPDPlZr1Q8E58h3ueKTAnbLBuG2A9lj6eXqEq1
 kXLuTadQorDRo
X-Gm-Gg: AY/fxX7NenOORUI90Wc8iYgcVZctuij63KOGXEPvZY7/uHfN9MRrSxjYNrR/li9adRL
 DJ6CUSYfJ8m0E/Mm9NlDFKLa4C4ADqVJXU/s4EEN3cUD88Sd1/OSFKuuMlLT0NGsNr8ZV5oql8A
 1HA4wK2239m8PQAmq4H3rnsCsQAI2aQRVG8bJcRYkXffo6Nejr0hGGe1TYWRAH6xiXydqoHii4r
 yjjkGSz7KSgNd1f1nOhlNcQ7NfaTiNJVMB56mhzrDhpblPKlpAI0vxOa7U4IScSBjvN/V913geI
 R9uEeeQzwt0oEIeWHAtYNrZYGwNidKnsti5/uMzBvdycn9K79XDGEJq96866a/22YxvPsupfYpA
 tVOEwp7skO2q4hClaMJcKvS2qfnGS5m334vPIbGWo3wknb/NTRUKzJrNKHWhIPnviXO0zRGxw3P
 ypbF4/q3FkEi/dIBFhEVtUVhQGD7bBW02uiUv2NCJFnTWfB90/Kq98eRqGEq1KplKzrp9IkwliX
 sci7SAAVj6a0y36mUWkRQ1kkj3HZI7hYR4=
X-Google-Smtp-Source: AGHT+IHWxjRwTQlRafEaSyCGoH5228OD0CyKH8COwa1Vo5glIpgVUvP069JTSjZ+iajU/yCWxg/e+Q==
X-Received: by 2002:a17:907:7e9f:b0:b80:16:850b with SMTP id
 a640c23a62f3a-b803542da8cmr453536766b.0.1766162481221; 
 Fri, 19 Dec 2025 08:41:21 -0800 (PST)
Received: from [192.168.178.182]
 (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:3b89:c600:71a4:84f:6409:1447])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 08:41:20 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:09 +0100
Subject: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=1078;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tR/wcXsSRSmMC9AuE79DxiyAbWm/TId46OBOFeIFTQM=;
 b=C/2rJj/g80rHDRnltiMZEOcEAploGDh4/PX6r35eRIe0loQrjOFjPL/YrpppAgkRC0l/xHDie
 gbCJGLNqIaUDU0TzwF33KUnK8+cnJflwNKYcC2qUTOOC7gLTx5KaxHG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Add support for MDSS on Milos.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c04..aa63c079d730 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -535,6 +535,10 @@ static void mdss_remove(struct platform_device *pdev)
 	msm_mdss_destroy(mdss);
 }
 
+static const struct msm_mdss_data data_14k = {
+	.reg_bus_bw = 14000,
+};
+
 static const struct msm_mdss_data data_57k = {
 	.reg_bus_bw = 57000,
 };
@@ -553,6 +557,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.52.0

