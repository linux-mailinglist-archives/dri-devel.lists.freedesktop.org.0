Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8F59EDBE2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C5710EC73;
	Wed, 11 Dec 2024 23:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h3wBJZIE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F39F10EC73
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 23:41:52 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30225b2586cso12268151fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 15:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960510; x=1734565310; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BHlgw7iUBFM+rdSv9p/feyEV8lTt3noMeNdx9ahcPGs=;
 b=h3wBJZIE4DQl+kleae1XGfqsp3tCkeWR3v2NOYCpwQfRu8fDY/28cyIaIUHgtQBYKs
 fnLFbnhdA9jw7V8Iz/4iKWMjyi7erlC9zDasCcjlNByJm2LvRhgdJ1tOd7CLmUTgpXVk
 mUfN/E2f76M3cpRkIKLNnsMqqeFDGFlv5STlYLOq01iRzeU3fxe0l0tkmsSOwiL0VgOt
 EiDbU+TOyqU2w/1t9gPu7vhidzI7YJReeORQFxhe7ynB6EIbbg6FBka0KZ7D8tS5KU+M
 JNp+fzTOxM1lpwE9pFiSTSq6ZPy4ensaN9HoUYJDa14V62aVARofHirqlS+zFYJAyqgK
 Qq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960510; x=1734565310;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHlgw7iUBFM+rdSv9p/feyEV8lTt3noMeNdx9ahcPGs=;
 b=EBApPbe2Ag9UcAA40bBs/j+tQNaYlI3r6li8yTw1f1yYZWthWKr2X6hMzpoCnbG5Tl
 y9rx8Yb0ahzNkbjWBdpNBvzoqaWu+3e6SviAvYBz+a8yDdhyZ4f2trp3qmJvLNm6DOqw
 vgjFXH6V75OoGYOsZlGFVL4l2qjvYZNx1FzhTzg8JPLJZpbgEbaVwYMz3ET9e3Te7Xg0
 5sujX14k2GwgfjCtflekTVHb4Yk6Hoc9JWPyORSwr98BVloJ8INokFGKjTq+v6m4WKc9
 6HQWIReJt58netiN+pDSj2J0TXOe4hmAK1SQ3nCn8TZi12n0o0gOhRF+yU1uTnW036nd
 534A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKlPraH7AwFRDgFhEMxV0dLgV5+BV9OWOKd0LwCyo7WlJfY7ZZc4sC8Zt5iAGY+rjE1CPTkNr6Fuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG5ypSYKg7rvG4Z902dH5GIvU3P30gTW0IUed6Hf696uOXq6iY
 OkB2QiuErgITeO06uTYKzZIjCQzHi5Q9w6lOGum1z23X97gBw6pjo6ldrbtLtQ8=
X-Gm-Gg: ASbGncvYHFtZi2pMOIjgCLvsz90JCkh2Ne8mX8TAJK+qkMHhb0yMxfdAHSmIOa5ieCW
 syMlQ/CkrpNLqKNmhyACqvs4BFN/Vnl2Me1smD2/7DjRX+D97u4nhB5W58WR3aC1TEcuLrscj0x
 B9waSaZe9sYXdC5J+29kFNaUXT/MwiOk1zPXTC0XIlPyzr/ZIBFwT2nfJo+CLsACwzo3roJEi6A
 gIz/A2HE+HL9ghUJ6pnO30KwbKI+ohiMC4jIX/XaHXP1IOlONDW8a8QfG7F0Q==
X-Google-Smtp-Source: AGHT+IGLZruVnHdmTYclHw1ZlfaHU0nRcZrow0QrWzRIjs7hRZq8O+mQVj9gR8FjZc9UdO1Ewapdug==
X-Received: by 2002:a05:6512:3b82:b0:540:1bc3:1061 with SMTP id
 2adb3069b0e04-5402f96533fmr370626e87.11.1733960510529; 
 Wed, 11 Dec 2024 15:41:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:41:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:36 +0200
Subject: [PATCH v3 01/14] drm/msm/dp: set safe_to_exit_level before printing it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-1-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LBDq9dTy0DOxlRiv3jpt/Rd85VVmGCc+rFm7abUVNTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM3jCuKKj3zGknTJDllEMvmNanhKlf3tuvon
 j4/uxVgHdCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojNwAKCRCLPIo+Aiko
 1d/eB/4kyZzY6bSyBKDGs78I9tbZCJIBNlibHzxBEZECigDxPCoBpCmODNEfx8u3bMOVW/bqt2f
 zeyIIMf0+Z6cJt6tHApkIiF5A0SH6DHiPvAWI/SV4DYk0Q4s+VAX9TiWb/GzLYttjcYkxJyeWIk
 5U5UmUmrEWMf/dYpXYdpelPt16zrlNC+Z5kONm6YF4DKt0RLFxioEQbj9rwKFPPTnUrzwAY4HRg
 zaoO0x4oKx5fTU3zgmWlDPIFgeoSAADkg5sr1e4THD1Xpzex8uNt8Gj3cDQF68gCKKl6T8RHwDh
 bNkFAVSfOJHYd9dlfxpTRrHELiVYWOUQoljM9jckVPWaPeLL
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

Rather than printing random garbage from stack and pretending that it is
the default safe_to_exit_level, set the variable beforehand.

Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 74e01a5dd4195d5e0e04250663886f1116f25711..5cbb11986460d1e4ed1890bdf66d0913e013083c 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -329,10 +329,10 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 		safe_to_exit_level = 5;
 		break;
 	default:
+		safe_to_exit_level = 14;
 		drm_dbg_dp(audio->drm_dev,
 				"setting the default safe_to_exit_level = %u\n",
 				safe_to_exit_level);
-		safe_to_exit_level = 14;
 		break;
 	}
 

-- 
2.39.5

