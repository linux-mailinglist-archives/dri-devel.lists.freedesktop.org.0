Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13985A1CF88
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 02:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF01010E269;
	Mon, 27 Jan 2025 01:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="r/953LiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1010E269
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 01:46:16 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-215770613dbso47283755ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 17:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737942376; x=1738547176; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NA7wKBO87PvXb6QKp4pIB3Osn0PMM68GgUBC7RaoEEo=;
 b=r/953LiUEhW3ppxP1Y8BFmO1MLprxvXZchGp3bz1zK+HwfG6PwQDgrRxjL6+IyiwzD
 1DXCyeA5MQBfAxrInGa8pXK2q1wy2AcmI3RQ+1lcsuEQGkpphY9tL+4I1KJuAZ3PEJep
 9G1huvxE6AeH2VWc3FXdqHeySAcsL6gw9pIVx/ATebKqWxUeibWAj6KglOSl/04eYqVB
 8m8XuqSQ5Cf8BBcmj6AOGCfW7AACmJaM+vlJ831FYi4mfzhJ3tydeTKGJwYvg5WRdfS/
 IFlPUAHLkbtKH53J6ch3MlopNQo4If7MH7aQlQR1bCZ5j1QEwpNfCdd4s5BeyqM4hpBI
 8MJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737942376; x=1738547176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NA7wKBO87PvXb6QKp4pIB3Osn0PMM68GgUBC7RaoEEo=;
 b=eazaSagD7t+zlHCqWC7LJsvpRZ2CWg74HMZEPhcN3NHvPreDVkFG3+1Xw6J4gEsbRM
 PFuxO2dult4T43s411vr1dq43NvMYq1GfMVsewW9EfeAJso2epNxDRr9Hdp17rVwAw68
 TitiQ+04KrsbatheWeZwOxcTvNPbjbSer8A5yP4aeK0CzrV3CiGVd0eC+LCGXctxnXD5
 VPb43HLH0l8nievuS5/RF346BdSSJd4XdaaxFTRPpslmIPPpFyOZqEtgqO+b5fcu7gUE
 INunjlTvIdReD3w3ypefrrTd8+BMBYCGHMQUWm79bJB2iNOWhXIkXcocWYjp+9VDwrbd
 HBug==
X-Gm-Message-State: AOJu0Yx/pNdkALMy6AeVZ0AyWgmnF5pZoXCZHMC/Bi7LEvkx+nC/EjPb
 G92qjLrEZMXpjZcq5UR+gJ6T2BjokBk4QMyPzmgVEuLXyN1KaQYDMIFj/7LsvKk=
X-Gm-Gg: ASbGncuXT9hmtH61o7chugVRC9B8bS0LHCTXU4V6K9sPoDwaFyyuuqH8TMNmxwqdUJn
 FoFU6cW3rxl8inE1ajSTvmgh1ZPr6hws2MkTXgxrb4nvKuk7dVMXc71WsQpzyE+XH/kP3c4NJAB
 yrN7KaMQn+tZACx8GoL4OFoVM/hMoBo+wGjNfNF7QU5cKVuoPG1hqViUZM/mMtc8ZrGMBPy3S4l
 PFwf7lBhRXSYFPhWyyrzfbL9pBQ/z4dWEOOOS9DZP8eauhXg34Zj0uZmI1sEJXHKglwIZJva+Ok
 b3zAzM4AFi3oqIk8N4pXHKvjB7TWxylazpJxYuMy1VAIbk77CHdS
X-Google-Smtp-Source: AGHT+IH0uZF5AODFynHTgUaUBorthCEqjrHNoE1C3l49jyAq57+dY5GGyo/NlsxeAFS2tYr1CuX9GQ==
X-Received: by 2002:a17:902:f78e:b0:20f:aee9:d8b8 with SMTP id
 d9443c01a7336-21c3550d748mr592180685ad.20.1737942376552; 
 Sun, 26 Jan 2025 17:46:16 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da4141f93sm51344205ad.147.2025.01.26.17.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 17:46:16 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] dt-bindings: display: panel: Add compatible for CSOT
 PNA957QT1-1
Date: Mon, 27 Jan 2025 09:46:04 +0800
Message-Id: <20250127014605.1862287-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250127014605.1862287-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250127014605.1862287-1-yelangyan@huaqin.corp-partner.google.com>
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

Add a new compatible for the panel CSOT PNA957QT1-1. This panel
uses HX83102 IC, so add the compatible to the hx83102 binding files.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index c649fb085833..d876269e1fac 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -18,6 +18,8 @@ properties:
       - enum:
           # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
           - boe,nv110wum-l60
+          # CSOT pna957qt1-1 10.95" WUXGA TFT LCD panel
+          - csot,pna957qt1-1
           # IVO t109nw41 11.0" WUXGA TFT LCD panel
           - ivo,t109nw41
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
-- 
2.34.1

