Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36A99C954
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 13:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56CE10E250;
	Mon, 14 Oct 2024 11:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UtWJEqg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AC910E250
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 11:50:01 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5369f1c7cb8so5182616e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 04:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728906600; x=1729511400; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iew+RP5Fy2E/40HugkpA9EDa/gYy4wZkIO70iXxUijM=;
 b=UtWJEqg+8wvZRQxxK40ZEOH6c5vLmIHmBXvqo+bDAE+kdmgOrUo4kFrERwxVE+hP4V
 87+CcQDnL3LIbbbOBBRugbrDKlRUrBeIm3juOYoaeruWxU7M2nfq7oOeUz3rz6j5bkn7
 dRIjLRfBiE6bMCA8HQ+3kKN06b4mHymlvW9Fb5IUYuW1rxuxhZEls6kcKRusC38XA/QJ
 GpJcw1T3ciFN3Lij/NuTXvtrLbC1nxkI9I8QARFW9l0R2Y/0aaDPX15RW6ck1Zh6+vxm
 vf4iH7hVEYVA5J8vyZYfJ6c7CdvIi76aCYwqk7m/UkDgeLtqV6g8k1J4HDtUuXejJF/k
 HrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728906600; x=1729511400;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iew+RP5Fy2E/40HugkpA9EDa/gYy4wZkIO70iXxUijM=;
 b=cPDxOFql8uz/iDiy26zzNzfanBp3QVk/R/hjjQvr+IYoNUnumuc2GCVrJRMjKs3jfL
 ihxt+maUufzkzRlQQN5fWfxvIl+MqETC2gzjsxrHagGYc5xujjA2XneFUtgqHZvIcpEy
 eEYUkQCSXMiOTed4esZX6tmZyTwX5l8DtAH5vr2e1XED/tgMTmb45SuWga4NQiGwjDrh
 Cd+b7Z3ztJUKzYqMyPvqDupub+LEj8Gsw+nOlPEE1/glXfRfTo/m7lvXJXCKdqacp6L0
 gGN9A+uDLFmiCcyFq5ZogaVqLPGoPWkKNBhf1Z1wxvaWWCiNliR1ha17sYcZpRX7UbxA
 ddoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSQm56SOKZr3Gs//lDY4w8iTgW1GZzNdTm3+6pOaYe7RFjJC8z4D1VgjzJ2F0OP+VxP0PPQXaNMBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy76dGPQ4HukHNYAha6tajK/j3Peg/kwk5Kd6zHQi+deiS2zrHo
 7YQObtl1e59CEUQaXeKS4r0vPBxg0EXstZPMf+3gVfxpZcqs+coMvfkKnSRyNP4=
X-Google-Smtp-Source: AGHT+IHeZFlUvv6UeKWga3KrcKpVyfEpfE58+7vHUSg0GUxX8MLLjQZt1fSXn5N5ExlcM614tFbcJA==
X-Received: by 2002:a05:6512:ad3:b0:539:d428:fbdd with SMTP id
 2adb3069b0e04-539e574b00emr2705259e87.53.1728906599992; 
 Mon, 14 Oct 2024 04:49:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539efe446c7sm585904e87.271.2024.10.14.04.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:49:59 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:49:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen Chen <allen.chen@ite.com.tw>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 01/10] drm/bridge: it6505: Change definition of
 AUX_FIFO_MAX_SIZE
Message-ID: <2wi23no7jee5hpiyplipjhdmze6a2rulnmhrmukchlp3zui4np@c5yacstbzuxl>
References: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
 <20241001064305.32180-2-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001064305.32180-2-Hermes.Wu@ite.com.tw>
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

On Tue, Oct 01, 2024 at 02:43:00PM +0800, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The hardware AUX FIFO is 16 bytes
> Change definition of AUX_FIFO_MAX_SIZE to 16
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
