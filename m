Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202049EA072
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 21:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A6810E568;
	Mon,  9 Dec 2024 20:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O6QGu3Ke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E92110E568
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 20:40:55 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7f43259d220so3218204a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 12:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733776855; x=1734381655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFk/8lTOXAJBBD0iMswUxwnGCPazYsTsiH7Y9OBU+PA=;
 b=O6QGu3Keomr04CApQTU7swR4in+tUE7meJPv47CNzyKthtYDoamvOIdGACANML2oI+
 IHfRwQiKGKvJ/jsPKWSM2syRzpCwXYIZfYZ1eKcmDOQDpnHEIDcc0W+T6nhyGkAfsOTd
 FElpPHHyKdVt87vNZjyU4qo3qK16WFRJJHSQ+JB3nWrUXEypri6KoTLvztHmrKMKjPK3
 3lqjFG2TnxLII56OiRzphtwQi1W9Yi4u8EqOFckSANcm0vVO0UBMTIyaTsE50o0iRwRN
 cortdie2m3ORnY0aqjqnWBYFQi3Jyt7VRkL6Se1SNrMv/KEmHCVQniAukKNek1pHhKEM
 BURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733776855; x=1734381655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UFk/8lTOXAJBBD0iMswUxwnGCPazYsTsiH7Y9OBU+PA=;
 b=og+wmLaCZvPiF+elvd/m4eAr66uKIKtsungoJ05VLNWnHAo6DroIT/SuGgPssWnorl
 CV27PzhfGkheP5xLs+mdIBVgFc8fFv1Tc493H2mUBVZgDD36fLhp50oOTG3+QnB/0VgR
 tUFEIaooHBgu32s+AR/JUTaP2biFlPFguaEOcxSK+dX4vsuffHZI8bKeeydm/K1T+9tm
 fs5K81bt5Zdh4EpejvFffbwni0x2xn7txnw5jKVKmWODWw/oQz8ZrGAyA+FVJNYkrHGc
 vjqByF3zsGZstNMKuzUvjY+YfGrcn4BJrk0HTHoIqZQYBNpi6ZhqFRyMONB3WeCZ3Lrs
 3ggQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRsIRLLnjewFKd5i6buRUoOnR6iVCziVjdTRlvPNJ/iq/SoryBA07WCSLX+tSlT6nxNtwSB6Ws+O4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvihLUpbIA4iYrxUQ/Z+KsNZNQBF59mlu5HQk+xvYSHMw61syH
 A6T/ZHMICaJJFg3yrYpRWYosc3PYnKTbrlbA4pP6ZLX/XMl7r5GY
X-Gm-Gg: ASbGncsjf9PXa2tTVK19Il/hBHwK4TSPEns+kQXhfb1LuEh8kgZ94eNnjE2FmH1yCnM
 nqkE+djOfdZQcJbeT3apw+3SzWjhb4vZbCOmvlDh9tFK6YwYzQEXD1ibgt0lwl4FIsdvA3u8JYM
 1WRI25cuI6VDzJP0lJU0Hov90WW6S8DeTJa4LA3eC3fNuxnMdG8/EHWBZJr0Zz2BRuis4aJ00MG
 VSJ066L3r/3SlBeTTurhSH+X2IVXiJHv9JtfjoKwW7KQpMIuRoHBQO/lL9EqWM=
X-Google-Smtp-Source: AGHT+IGkseJIUwCnXZApvQxM0FacDoY5qnz7kx/Zk4ZEw+I0M4KgH3VzNxAAY/RYu9/pFD3vDsUdGg==
X-Received: by 2002:a17:90b:1f85:b0:2ee:b6c5:1def with SMTP id
 98e67ed59e1d1-2efcf10d3fdmr2974170a91.8.1733776854833; 
 Mon, 09 Dec 2024 12:40:54 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d7c4:c4a9:e35:ccbf])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd5207528csm1707219a12.36.2024.12.09.12.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 12:40:54 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] arm64: dts: imx8mm-phg: Add LVDS compatible string
Date: Mon,  9 Dec 2024 17:40:03 -0300
Message-Id: <20241209204003.1295503-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209204003.1295503-1-festevam@gmail.com>
References: <20241209204003.1295503-1-festevam@gmail.com>
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

From: Fabio Estevam <festevam@denx.de>

The imx8mm-phg board has an AUO G084SN05 V9 8.4" 800x600 LVDS panel.

Improve the devicetree description by passing the LVDS compatible
string to fix the following dt-schema warning:

imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of
['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05',
'chunghwa,claa070wp03xg','edt,etml0700z9ndha', 'hannstar,hsd101pww2',
'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
index 75bbedc6164c..a134b1833649 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
@@ -82,7 +82,7 @@ reg_usdhc2_vmmc: regulator-vmmc {
 	};
 
 	panel {
-		compatible = "panel-lvds";
+		compatible = "auo,g084sn05", "panel-lvds";
 		width-mm = <170>;
 		height-mm = <28>;
 		data-mapping = "jeida-18";
-- 
2.34.1

