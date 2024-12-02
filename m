Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D043B9DFE1C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74C810E698;
	Mon,  2 Dec 2024 10:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OKiaJMa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4819410E69D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 10:06:45 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ffd711274dso45387311fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 02:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733134003; x=1733738803; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tpP/jDICY2hpp1Wi2eVuCCK8pET/RTw6Zo8ra1xdvcU=;
 b=OKiaJMa31TkafQVZ9DingqRJ8ySBBG5HkWQUnBuqjpZ4wqJBxoyK8o9Gy60M3LXpt3
 2MRxYWV/mzvCqv6qYttFW5FZeItCyAAaHyJIcukJCQpOXPLmtr5JkzcHfDX97bixCBI5
 YtwlHEmI8pnDJLc8GCpgIfXBE2nF9wT6keWqmS3QX/j2fUqjfnvfoYgbtRs9pfZREbMN
 i8rrLViPcqCur4c24ecSHTmbxZsAjOYnanEtwUWc3DzOoa17fGZ951bVtVXW9aGpbBMq
 L+TPc9dom2P8mn/dTvRuSNgvLSc0LulsXytQjzGj6MvgfQ3zFdjmcN94vhyQ2cD28MtF
 XViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733134003; x=1733738803;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tpP/jDICY2hpp1Wi2eVuCCK8pET/RTw6Zo8ra1xdvcU=;
 b=u9l+piW5FDypSlIDZ6m58d9B8sgz1/W+z1lBbudHhJKAPoxDHWK+1KtWQ+sZGtzXt9
 F9WcWwVdGliWsLzSASyUcSYAj0HdPRnvctZLRlxwItTZuWpl7XoLHZ4YYo7XTRNbEflL
 KUSBALdFOT1GFlVFNgCBJC3xd7sttQa21HxrFBiBVrJY6JC2wX3ggCHQPZi07Ur8HA86
 AtX8TA82HIhv5Ay0+rhHkmEFPj3PEaV3xc4/529WvrtkE368vyBGwZlNtuk48FP16B59
 8ISKOJoQFgLg1Oe0PGNb5GnCMcRbhyjAIji3HzZik6ZYKKb8zctvO9zwwD3m0R4FLVnZ
 iPsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiosMS0tylV5HbCJaf1uLLiHiVDSxlv5VKDc0eL9zt7wjCS7ytqT8C+qymjlOq/TqH37PKdmVn0rs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHIzmd1vG3x2K54FVItrId09/UfSCT7hlhT7OTl+VMnATsTMhN
 BKVHQ12oPADU0ITN1q/dNYb1MPeiIoztYi9dm6nzneG1xhClfDO/73dGrpxbbpQ=
X-Gm-Gg: ASbGncupjmKkJwJJl9cMXUzb2w/6TR9O2Z6OPxfqv5MC9K+K7l/iRjydyowyXx3DKb5
 KSNMat+/rfrVFNDWNUk0vS0iguGLGQnE+yVN9COt2ZqhzTrlCa2HyuClXHTKWbIgnyOQ31EwkQ7
 7wbaewjsTqROKxPWqQxAw4k0yanmqCwzsPGRBmw0bjJ+8mwVMXR+5X0JrCc4YNRja8qyhLvYvuv
 4EJ70sVtY2W+yZBF8k1MoXFUh6SjMFetfJrVBRj6EqR0U8nTOT8StLIsw==
X-Google-Smtp-Source: AGHT+IHR1XbTCgy2WlNGTzdkokyS02qyiNwD8cSSXZMg2NLjd+KSaeHQUq34euLM0FAR+CHBZ3OXzw==
X-Received: by 2002:a05:6512:1048:b0:53d:fa8e:4527 with SMTP id
 2adb3069b0e04-53dfa8e4618mr4381179e87.18.1733134002837; 
 Mon, 02 Dec 2024 02:06:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:06:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:31 +0200
Subject: [PATCH v2 01/14] drm/msm/dp: set safe_to_exit_level before printing it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-1-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=seU/qFWMvLHvWiegGcXpCvQCH3cViw/am9kIPpe7Qr4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYasoqQkSYAgQkH6Oq8RJFLU+slePXaZWDFJx
 hQ7SxVKrKuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrAAKCRCLPIo+Aiko
 1UgJB/0YLDxXIUrtc4QQ30IMt8vb2S3Kjbb8rYT88XXuS2mARVxvKcvmrvu+z9aqqpI/Z/UIKjV
 OBvyR5H5lrRgLb8stPFwaBZWJZdJM4j6nNyQrb298uJRMs3NjBf1jZy2HOQcFn1+7OeLjMH2hO3
 H28Nxu7uPIOxvEOHltVa2I1vJu4pzi26csFUwyGnlm+TI6fv4xsc86ET5fDW0pMjPugYEJ+N3Qr
 333EZkQstqPePjfg7HbctJoARDjXkL9hpU9sef34b6B1iAfBYbjQsoAcCrpqXLSEZAJCZNde1eM
 urLUW3D7xmS6ZE6GS0OZPNVYz5uuIF0yVRt5Z3cYBeQO/1ek
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

