Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F179C77A9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D8410E731;
	Wed, 13 Nov 2024 15:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="exVoYcqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1774310E72D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 15:48:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso57100335e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 07:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731512919; x=1732117719; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MYgorZqVj//jSCtpavrg/mr2FgdZEzdtGqebNEGgTJA=;
 b=exVoYcqdmDOlwr4iqwj7fA+ct+pBCS6adVjW250W8uG7rWnASkXEW1v8PPeV5yi9ts
 2FkSjnRHzWJD98qkMB/vn3rLXb6NvYasf9RFwyeCQCmK5UlGHlYagjHwrtw6xB7ZnwyY
 lAat4vJ0XjxfxhGQDp95ArGi9LMINcsHshPkw8v8VNhPHPfqc1gdZVy/GNKtis+vsnl2
 gJEsM5aTQ6r2K+Igh30nScFG2RoZdI1kWdQa4yzFKH080RcWvPrStEuOxDEBefLHveVf
 c62SaXkIB7C1ijY0ZPyTHd/0m+kgyPmxi8DExqZJvd2Pq9Pf0QiShpMELaIwbsy0wn/7
 CdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731512919; x=1732117719;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MYgorZqVj//jSCtpavrg/mr2FgdZEzdtGqebNEGgTJA=;
 b=KHgE2UWE4uWFu5hjIALs4UWpXQpPDMFU2q/HXtDU2nuTBzNi86Jg86ZbnVwwkReUMp
 pTNdMf/cpfjK838hb5Tm9n8WaT1MvGw8+LiT6JpjL8D1UVxbTsBkKfRlqVF7KuErDWev
 SSUXAR1LfEI+dgvyV3f5iYMMrISryc5sz0DAFEPZwrTYMnt//l9CHy7BgQrj6PWXrPIf
 b/dP7lBCt+ZKbT/9it0RD17G7pAF/hLwvjN4jso+YZdvwBzetbF7uMRKY0jhOgj1VeAn
 wbGfJISbhKtRtcXKb1upBGill+w/KP8hqzRM/zbarT93mHtaUFN8G8devosChYSSRrKi
 FQzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9tEuOIIBAPUmxrcESTafOp14QFZlUboARW4Ku0SobkmOaSi28jzBig3HJaW665prgH7u+vZWlgco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSYNBzE3jpShlSAyMBmVphNCLgzCz+RC+mjVQYDCPWsFW23r6d
 EqDP+8t84lkOQ3eevBttX6uSKb5nzN9nfZPhAdAnLSoRzy1rIWEJ9DF7Zi9g1nY=
X-Google-Smtp-Source: AGHT+IHeLTMxkPgSACljqc19ZYiCIniT4Dacaxb+WTFPif5Ms5xZ/QJCxJ5pXbokuRv4jP8Z850fGg==
X-Received: by 2002:a05:600c:1d20:b0:426:5e91:3920 with SMTP id
 5b1f17b1804b1-432b751dec4mr174729075e9.29.1731512919454; 
 Wed, 13 Nov 2024 07:48:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f772asm28445345e9.18.2024.11.13.07.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:48:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 13 Nov 2024 16:48:28 +0100
Subject: [PATCH RFC 2/8] drm/msm: adreno: add GMU_BW_VOTE quirk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-topic-sm8x50-gpu-bw-vote-v1-2-3b8d39737a9b@linaro.org>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=S8er2zpAgkVlTHhkotrTwlgtCETFbiARMQlfIq+QwTc=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBnNMpQOeiIcMjqHR2KvYcUx08gX1tb63FMLKPWSCxz
 PVAGLauJAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzTKUAAKCRB33NvayMhJ0fKID/
 YwgWibEuUTJ4sILD3uV52lDBr3oWa3ORvTaszDNR0MHQTEveaGOCWjCV/Zl9BiMuwBZY0wu2tUPHhy
 MSAjEQp0JQkCj2m2gvhYUpwSGDX7bzR87ruDfpiiZmjJRhN9r94KBrVFl5oA3yBMJcJLoG17XCh+Ud
 yaybWbNp6y48tEoABElb9M8ZmJW9Z/UIh5AsozPYOXbZ1WbC354GZf8N838tWoHJ35iSiLc7edKChn
 +96jymC/FEZw8h91/M96pXZolXOGArIcqXqePSfIxZrpl2APnIzGf5vpYrFwGZC7j2facSMWmZc2+R
 qKJ2KrSUBYJehIlH24P2xGHM4AOVoX1PauBn+4Fmyill1eUxc2U2Wy6VNwwBOXBRsF0QtAka97UI4J
 HTcUmKrctleegagPq6fy4SwKU1hgoHB6QoeqHXz+9AK3D3aFoVTRcRsGAWjZgYfk+pJonq8FqIC2wY
 dbZ0ZdIsPDCpKrmAiqEQeDVq3Pcp2geUZdXyrMNCR5qEuGnGMWwwxM7qxU3wSfi/FWcdUXO9u7AfOW
 XJa1E5fNvj5OQmb0Bv8jbVFehhfB5SdUSLm+Y6uFg00VaIGiNQ9DP0cYF8CGbZOPoNw0k6J5UUrYM2
 dLhTa6yvbDshQPNFneSeN2/HE98u/TH7HDrVZTtys/ai9GvabHdLR+E0kP
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
along the Frequency and Power Domain level, but by default we leave the
OPP core vote for the interconnect ddr path.

While scaling via the interconnect path was sufficient, newer GPUs
like the A750 requires specific vote paremeters and bandwidth to
achieve full functionality.

Add a new Quirk enabling DDR Bandwidth vote via GMU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e71f420f8b3a8e6cfc52dd1c4d5a63ef3704a07f..20b6b7f49473d42751cd4fb4fc82849be42cb807 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -57,6 +57,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
+#define ADRENO_QUIRK_GMU_BW_VOTE		BIT(6)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.

-- 
2.34.1

