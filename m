Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3FF9E8093
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21FE10E141;
	Sat,  7 Dec 2024 16:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IWz9WGc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E437D10E141;
 Sat,  7 Dec 2024 16:17:17 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-21583cf5748so28851235ad.1; 
 Sat, 07 Dec 2024 08:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588237; x=1734193037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CV+uCFA2JDB1hhyvgSiWVaEfg9viIwNK4A1DQTOi2r8=;
 b=IWz9WGc/akabDinQdZGzUpQ0ZqG0hzS3yoXNX/aUNouipnKjjogvTe2aGEQ+CESsin
 QcBdBFDZoMGK21ucZlnrwSjP2AuDieH/QxNcwpQi/VBcagr5fmwD6w5zksn2NwRvJkoD
 EgSrqN96TIC+3T0anWRGumQy0aivGmGzYiBZeMKBVj1VBKpNoo61c65dDcUWHIge42me
 5MrJ85yeoMCKNrgbj8abxM3nGfn5ahQDa5DnZRZdCwdB6dl0YsW1nLJJhJFOagsPvm8S
 NeXE9G4CvpFn3Mc6wOgiae10YRNnUlMHj+gbAexGw2DriaUY9ST6g3oLMLXqeuYJB9iN
 uf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588237; x=1734193037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CV+uCFA2JDB1hhyvgSiWVaEfg9viIwNK4A1DQTOi2r8=;
 b=DLN9OSIL/hFuGxn25EgOBi0Z8PNkt8W6+cY6aDvG/4g5JMn47o5fG6EDXL1xAZt+lN
 e9l1kwP8aT2KL+6xzBIYy2RnEvR6jZrFj/YSG6BdCvvrmgkZVoP3bedJ91eNT7P0LIDi
 NLIe47OW3WffnWRZiS8i0M7wtECkQz8ZOm7jaM1KL9sCMMl6ug54cnHQ+zmSxHUMLDFX
 rgv+DMsxhEXim1QQvkJxznTVG/dAM9tmNkspiAS5kBAyKG2jzQZJqNzQAtBlc/mQzCXy
 7rFIw62VVWaMyueOLcJMp0CSs/uJ06/bc0Xlsq5to4ZQWk7mXn3cvA9+RnSZVuaF+aCv
 Gsnw==
X-Gm-Message-State: AOJu0YwXPPSFjzWU8CDK9xRzHF5er3cvAAV9SOoP7qqnW2tKX4CXlWmw
 AVtuUtNBwSZTfGp6sLDBgfgeW9+V6n0c8bhqFPltj4YN+W0kLH1F35GmjQ==
X-Gm-Gg: ASbGncvH5Y1ci4GT6Nnm9mDQGq0ztXerb3tsy7QY2w7VHXJ3K4TYtpK3b2s74llP+t8
 jvGy3ib0NKcQZ99CKqC5nKxMJr/qa39v24PojxuwQzEVorVDcs50uh1aBnYTYDI+l7GGIuqq8+0
 FguPyDerTryBRnqKdDsk8ASweWm9dKVdoOjtychhtzMN8fS4EqyjfpgUExRKgQaaO3drlZ2/Ymr
 dtsTuxjIEE4qeNx9GtvBzHpfqg0yQgaA2QlH3mwpY1wBEoCEUk4aZmTm0N5B8ht3abdAutTEjos
 Shb3wvwF
X-Google-Smtp-Source: AGHT+IGNSol+D/hLnPJGlFtYh26C30xz0pG81ohsKLL4K621B+zkYYXAaBZbDE8Vu91JRUJH2MTVhg==
X-Received: by 2002:a17:902:e548:b0:215:b087:5d5b with SMTP id
 d9443c01a7336-21614dd1b7amr107402935ad.40.1733588237059; 
 Sat, 07 Dec 2024 08:17:17 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21630fee27bsm10627515ad.269.2024.12.07.08.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:17:16 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC 01/24] HACK: drm/msm: Disable shrinker
Date: Sat,  7 Dec 2024 08:15:01 -0800
Message-ID: <20241207161651.410556-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

The WIP VM_BIND patches don't yet support shrinker..

Not-signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2aefb8becda0..6bc6f67825ce 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -267,7 +267,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_deinit_vram;
 
-	ret = msm_gem_shrinker_init(ddev);
+//	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
 		goto err_msm_uninit;
 
-- 
2.47.1

