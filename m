Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593688CB7C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 19:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7F310F1BE;
	Tue, 26 Mar 2024 18:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CP7fp39N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF5610F1BC;
 Tue, 26 Mar 2024 18:05:01 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-29de2dd22d8so3207120a91.2; 
 Tue, 26 Mar 2024 11:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711476300; x=1712081100; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7eMWpGiB38YJtVZd9B9lRA2TBkHD9tD0FrImJN6Sv8A=;
 b=CP7fp39NekN57gwfNpYzpOYcArmw5hamQZqEFgXjNzQAjQ776/EawH3+d5IMpLPFxb
 gs4ULbaqgl5ksiRMKGNqxPlpLch9EdBYDsqlHexWuwxsU0B1s+hSoYAiBXQtiR/0sT7T
 jPP5Kjugh4rNaJL7U+BSrfrdx7IpKnBHMin2/ub3qEwNP9u8PDpwLQcO9BPqxgSlA0sx
 08Be5GZIZVu/Ad6oU02NnjHtqD2/rWrm3fPXOF1DbbEko66xbZGkA1+QMEVVgl10jHbo
 zT3nnhr+iRIip/I1jZ7w3yhtJZoFmU/IbqfF141qx78BYm29kV+G4KchDFruv5kFnb62
 PUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711476300; x=1712081100;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7eMWpGiB38YJtVZd9B9lRA2TBkHD9tD0FrImJN6Sv8A=;
 b=OmbyJlORgFoijMpGhOaZFg5ICIhjxTx6Ld/mFGpA3ag4fgN1DCAD53bVzQv6fau2b4
 6wsxGqZpsNEAm72VVhY+KW6rsf5SdwmjZ+e6tspFEoRpsaEg48ddl8IbiL+zvUfIk2yS
 nS5FzTbS89XQVXx9UlUhH971oxGu1JwnE7jbUwInYMGWJ2P/UQfZtwg3j7YXz6mIRXOi
 CVmTbX+0c9ZF6XIrhVLSp8iPZDIq4bCeF9+wVYAI+ZoSYRE/6RC0HzLORM/CNMXJoylP
 ODAxFSR3nh2XBb+3lXWNM620+Qv1rT4i8DETo6yFIW/wPqZToV/HSjeIWYlkb2EPIVvS
 F6kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSeVVMDOgsKNM7L9KyZiI9pJX/ULNwkrBaZyvmbxgNR6JESmypXmCv9S79a7jufs2nB4gxQNE/b9eMozkDMo6HaO6qY2qJEgNbpWwBmLXOHSBmopp7QY/5RxIKYe5Xg4FcrHu1Pms72YwaHtOqZPRG
X-Gm-Message-State: AOJu0YyvK6Me9WQ9cTapG3S0HLIc3ucMaj2KVmWTwYsFspBnXi5Issuq
 fXfedzkAt0Kmz8KJx7aVjO8iO7UZB1yiHlalwVIg9PvSoExj95PdTz9L3wN1Xm2Wfs28HqH4YBr
 iVlbWVHxwOjYu1OmeGYKt8/Cc7yY=
X-Google-Smtp-Source: AGHT+IGvvgt2+h25XM0X3VAXSRyRgKXJ48v9Kzeutnr3W8gcWQwcEQKbgUgAeAh3qw6Qfjc+OoTfXR99bSWeh+7bAwo=
X-Received: by 2002:a17:90a:d150:b0:2a0:4a33:c3a6 with SMTP id
 t16-20020a17090ad15000b002a04a33c3a6mr3012373pjw.44.1711476300538; Tue, 26
 Mar 2024 11:05:00 -0700 (PDT)
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 Mar 2024 19:04:33 +0100
Message-ID: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
Subject: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
 'out' set but not used
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

In today's next, I got:

    drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
'out' set but not used [-Werror,-Wunused-but-set-variable]

`out` seems to be there since commit 64d6255650d4 ("drm/msm: More
fully implement devcoredump for a7xx").

Untested diff below assuming `dumper->iova` is constant -- if you want
a formal patch, please let me know.

Cheers,
Miguel

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 1f5245fc2cdc..a847a0f7a73c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
             (block->type << 8) | i);

         in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
-            block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
+            block->size, out);

         out += block->size * sizeof(u32);
     }
