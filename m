Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2AC824EC7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 07:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAC510E36D;
	Fri,  5 Jan 2024 06:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B4210E36D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 06:53:15 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so132786666b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 22:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704437594; x=1705042394; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BFOGLpcjoXzhR6JSGe3noB3vFxJi6+WAnSOC6t0PX4w=;
 b=kV8K4zh2RHdNY394lZhCoil89slOt7fGmTaasb5t/QR/KAfUavR2OytFxuT7R9u7Bd
 Qgh62/bRogrP6Z3k3vyER2QJwS6Eb4O/M6XR3irxbLYxWCDQ+/z9A8Wp58FmJ2FD3/vL
 nvIn+UNMlguOFpjCviRyiYCIhiqyUk2xk12eqW5H7FbB0mn7ruaUPQsLbUFkiYFc1lZ4
 FREDe+ofKY8RiE85X6v14WKPlCGclvz3EfwJJqlLEJxAr5FloQ27ZxkDKti0Ouz5kNIF
 dk9vyn7TT4xGw+8jcvsqsQF70NxTvrCJBtiCrqBqsAoHN0xqZ5YBnzMsVZ5RTW3SrTf5
 xQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704437594; x=1705042394;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BFOGLpcjoXzhR6JSGe3noB3vFxJi6+WAnSOC6t0PX4w=;
 b=Qu8J0HOPT/Kz4DpzP81kTXbWDnxHYhaFH0nSx/pBdimtZ0Rm64TBJX+k3gMtaYlVt6
 23BBRPvqo4U2HRppv9AW935IzTIfG6waqecFP2FGw26R7nBUOA3G5SMiK3e9ZH0EXGwE
 o60rMmDIuz6x/zNkK8dBol+vLkJKUpJbzrWCVLOXAIf9+5B7NDwWn6Uj+5ao+wjer9qE
 StV+d8MUrBQGsbhOj6Mm/4xOXPL3zBSooDmQpqfCipnm69cssAgu0RAqHC44h6IG5U21
 hd1O26H9hmMM4n0AZGrjiviF9Q6perEc/zNtByYL+x6MTwE9vDcdgjSnFZll5L3TGsZ9
 gsTw==
X-Gm-Message-State: AOJu0YxE5C9fRvhmwfB3yGG3xxBUz1GDPsMpOxegZUMnhPonAq2RPaH7
 FAXvNL3Laxaz7vGyfZUupq0=
X-Google-Smtp-Source: AGHT+IH/RNoXjBd4MiyX0OLCTI5AmDJmvW3GwmGcu9xsZwFnO7vK/7pdJD2sx5+J69mSkoxXKkB3TQ==
X-Received: by 2002:a17:906:2ac7:b0:a27:b918:5eba with SMTP id
 m7-20020a1709062ac700b00a27b9185ebamr777907eje.72.1704437594258; 
 Thu, 04 Jan 2024 22:53:14 -0800 (PST)
Received: from hex.my.domain (83.11.207.119.ipv4.supernova.orange.pl.
 [83.11.207.119]) by smtp.gmail.com with ESMTPSA id
 g23-20020a17090669d700b00a28e2b72db2sm518809ejs.56.2024.01.04.22.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 22:53:13 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v2 0/2] Fix panel polarity mixup in S6D7AA0 panel driver
 and Galaxy Tab 3 8.0 DTSI
Date: Fri, 05 Jan 2024 07:53:00 +0100
Message-Id: <20240105-tab3-display-fixes-v2-0-904d1207bf6f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEynl2UC/32NQQqDMBBFryKz7pSMtal01XsUFxMTdUCNJBIq4
 t2beoAu3/+8/3eILoiL8Cx2CC5JFD9nKC8FtAPPvUOxmaFUZaVIEa5sbmglLiNv2MnHRdR30p0
 ymokJsrgEdxbZezeZB4mrD9v5keiX/p1LhArr+mG4ssaSNq9+YhmvrZ+gOY7jC6NvFfa0AAAA
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704437592; l=871;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=wxEs5SLA0q7BDvi+NHXyhorcl91KbDNYCzif/6ZAkt4=;
 b=Sc7I1CZY2lJP8MxzHRgpRaD31yeQNY6wZgwzLCYkbJfFTTLBbNIjbqBuuSI+0mGf+1P+f6ndf
 JUdiql2J12/AcfvnW9Sd5sjckGu/Vx11UeAoMAW2xkOnpKIFCqHhJIN
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Artur Weber <aweber.kernel@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two small one-line patches to address a mixup in the Samsung S6D7AA0
panel driver and the Samsung Galaxy Tab 3 8.0 board it was initially
added for.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Add "Fixes" tag to both commits.
- Link to v1: https://lore.kernel.org/r/20240101-tab3-display-fixes-v1-0-887ba4dbd16b@gmail.com

---
Artur Weber (2):
      ARM: dts: exynos4212-tab3: add samsung,invert-vclk flag to fimd
      drm/panel: samsung-s6d7aa0: drop DRM_BUS_FLAG_DE_HIGH for lsl080al02

 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: fa4131df22d181c0f721bfc6a68addb8fc62c03d
change-id: 20240101-tab3-display-fixes-6516f0b6a1a1

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

