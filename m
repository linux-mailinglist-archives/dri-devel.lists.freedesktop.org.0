Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDDAA2A954
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C1E10E456;
	Thu,  6 Feb 2025 13:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="BFuNc82k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AC310E2FE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 13:13:17 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2f9d3d0f55dso1252186a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 05:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1738847597; x=1739452397; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KR6bvb5577L4rReraIvZgFjKc18SS0Qabaw0b2hBG1U=;
 b=BFuNc82kDMlStGkSB+qGo3X3eY6iIGOQRySSg+QRWNlwEpXHwj8OYAz4wn5MwmLgOp
 z/YvjwNl27Qzo3Rh5P3ITOdu1ep8EegcfqzNcoyTDcHlKKD53+i4nGDAzMfKezQRk9DR
 HGbNoRkHjG2DtSPbVpyBQcIPSwLd5PSQP4tQM3KelrWc8lTodqYf/NYsDo/NecorWGbK
 1kPcM5r1sbTeYHnml1Dy41v5MJsj+J1xA9LZ5RZOT+MhYbvxts0OdHz0fTbsjpllP3UR
 8EQDOBP9hEQiENeO1MIEJHQFKzY63M5t7ONwsp7ajdS6ZNbYIhYo7J9G4bVZVH2uA5uk
 wmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847597; x=1739452397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KR6bvb5577L4rReraIvZgFjKc18SS0Qabaw0b2hBG1U=;
 b=QMEDs1qKERFPrvFyxmyFCFZDBNWFrOriiH0Zbgraba/waCQ/odaZboCZ46zgv7MQWj
 VNBlXpn8lWjHbEbtO4rCnyJDUBIlaCJu3OVyHaCQGpTL9PiswOvv9UqeqFLOHYVDKbGD
 nPLzn2645jOGcQzIOCp5x2jVhFNvpztLhiD6DWJB1391rWOr17tAlCpJXurR3jb5EgQH
 26PYv4azCBwiC4/p7hByaoqWXIMdz3+yWrgR7HerFvU/7PmQECEnY0ksp4T5XrKmvEgb
 rfbzQhAWCxI/dcLpAS8UfdsIu1P8SICKbDpk73LFSUei8uBqa3r6CvaEPulgjtHPu/UV
 YY8Q==
X-Gm-Message-State: AOJu0YyLiCCE5RLRI6mi/vBv0t4jTAj+ukyE8zNURyxSV+2RjEf5UwKe
 AmKtfeT16Uc00Zs4Wugh5ah/4NXdjsec/nV6Th28E+RDSKTQoC9t9aetWtD37vs=
X-Gm-Gg: ASbGncuoCWf0oYBpidTdWq416fbzuzkubOECctcDJWWO79rRMo3t6mOC8RepWIOz+t+
 Umw8MZubq2zYEYVWTanoKAGrKwSIT18SslpKIO1HM5dD5vn4ywKKAhqKy452RJuJwaVqgHEkVhr
 TvSDlfB582RvQSN/eaUd11MwmeN7oRUpZSw2mt2qRgvLhxzGdLoHP+YK1DQVHTAxMDyC/ysfgjU
 IUrwW3Bq5y9jQHNLE5aApiO3qUU+oDgtTdpxdtobfwBygL945mH2i5Ns+8Y2iSgC1SGUeIe0d2g
 LJdZfG0TISphphn7GPdK26+azUWuRrFMiV1DZJuV7Gbu6cJOmjCbx9gn6GMgkno=
X-Google-Smtp-Source: AGHT+IEeP4W9/tywc5ydRSYsXCTBvBKkM6gGNs7RhK3amCq8atrSM8kmtYxSMdc0gY5vOMT2Nun1AA==
X-Received: by 2002:a17:90b:394e:b0:2ee:44ec:e524 with SMTP id
 98e67ed59e1d1-2f9e0834a1fmr10732218a91.35.1738847596801; 
 Thu, 06 Feb 2025 05:13:16 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653afc2sm12237925ad.62.2025.02.06.05.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 05:13:16 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 2/3] dt-bindings: display: panel: Add compatible for CSOT
 PNA957QT1-1
Date: Thu,  6 Feb 2025 21:12:59 +0800
Message-Id: <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
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

Add a new compatible for the panel CSOT PNA957QT1-1. This panel uses
HX83102 IC, so add the compatible to the hx83102 binding files.

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

