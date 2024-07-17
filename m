Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D818933A30
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 11:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8F110EA2B;
	Wed, 17 Jul 2024 09:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MHH1dRcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C7310E9FA;
 Wed, 17 Jul 2024 09:40:38 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1fb4a332622so33231785ad.2; 
 Wed, 17 Jul 2024 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721209238; x=1721814038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZT2Up7rkixj135YDsGbBv1AEK5yIre5c4SXPmq/8CE=;
 b=MHH1dRcpZKoQeK7ViO0WGziZrSyfmTt/GlCjSCF8kSF1dCT7G1clPd27JLmTXr1nPP
 CS26xFyC2Km8MEa7OJK1LEpakOWZoSWgbZhdjQq7JM2JRBfz6ILtQByvLh0zOx8dDhs9
 oNuAv+78njVvClPsLlICDuBQpzAlJI22Kvdy9XdsTppc1X2jfMgY5UDzi8qKMTc6SdLE
 mPPrAKTYH/iGGhGVNv+6fI8vglFXKDYzRFBOpXD2PMpdjoAS9uzj9/6/Lev2eSzVQf6x
 wcr6DeX9T5gsLUNW9oensMXwB0HODkD0Y/YCjonLpsR4phu9pGs7cCWYjhk8LuxxnY7U
 /e9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721209238; x=1721814038;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZT2Up7rkixj135YDsGbBv1AEK5yIre5c4SXPmq/8CE=;
 b=Mn1QsqFoNUkjpG3tc647sbxiY8j1POj89/vVEb658bgFMbaoycfdJRgHD5Pq9GyKGP
 1oRxwPsBcxgUH2e0N5y1oGoe9IbCKxlJ6VCiLGBCIASrp2vAp4L1Irt4ZkdoaJVreQx7
 +fatfhI6sGRcdYu3DFXyBzzTHBh/9zWuWGEPc+IXycXkDX5cf7jszKg2f8qzYjXZN6JQ
 6iOavsvkkCMbPqZGWJwkS6L7g6/nJmxrDVhtVB8IVjUKzmL8bswh7U5L7TqV4KaADBpL
 JL4kCEr1E2uCKrhW1aVk/l4Cn9i9NTEgA6JPHbauG8hj+I5ushinVKz/UVxDAuWKbykQ
 x8OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjc3JKsTmdHGj/f04T9felcTIrzwikL6BopwhUMScYcNfL/afmdhQnfM87LMYbawcFRxp9JgmBQL7NdoU7q9DGJxXXByxvaVP6SidjLOrrWeoDIxLI7mN9AQtKoPqSd+47XaxnpF4udMy7nzl4MTdb
X-Gm-Message-State: AOJu0YyNSwL8lBlOvI17VSzEGfkpfPzKFUxzQ4biJYo9XxGU6dvtVQfb
 ucEKRAEdZExBPbfbTURuTsY4k0m6yI0nade1TFS2t7/x3b+90yIQ1qrjZxVFzMSKx+eTywle0HB
 CAATs4aMSBw4hhGKVXLgp+Vp6Gao=
X-Google-Smtp-Source: AGHT+IHS92ooffGhwo6QwDnJzDTyj0c6jnCY662I7sKXoxhFBlLCKT0n4+VIMY+tB98bU2E3VvfgvXG02LZhehf59pw=
X-Received: by 2002:a17:90b:148f:b0:2cb:4c5b:2d8a with SMTP id
 98e67ed59e1d1-2cb526928c0mr749820a91.12.1721209237984; Wed, 17 Jul 2024
 02:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
In-Reply-To: <20240711100038.268803-1-vladimir.lypak@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 17 Jul 2024 10:40:26 +0100
Message-ID: <CACu1E7HROtx1Zgyy0EJuHj_HWE8Nd6OtFnxTcrDrHP+2HA5o6A@mail.gmail.com>
Subject: Re: [PATCH 0/4] fixes for Adreno A5Xx preemption
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 11, 2024 at 11:10=E2=80=AFAM Vladimir Lypak
<vladimir.lypak@gmail.com> wrote:
>
> There are several issues with preemption on Adreno A5XX GPUs which
> render system unusable if more than one priority level is used. Those
> issues include persistent GPU faults and hangs, full UI lockups with
> idling GPU.
>
> ---
> Vladimir Lypak (4):
>   drm/msm/a5xx: disable preemption in submits by default
>   drm/msm/a5xx: properly clear preemption records on resume
>   drm/msm/a5xx: fix races in preemption evaluation stage
>   drm/msm/a5xx: workaround early ring-buffer emptiness check
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 18 ++++++++++----
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 12 ++++++---
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 30 ++++++++++++++++++++---
>  3 files changed, 47 insertions(+), 13 deletions(-)
> ---
> base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
> --
> 2.45.2
>

Hi Vladimir,

While looking at preemption on a7xx, where the overall logic is pretty
much the same, and I've been seeing the same "soft lockups". However
even after porting patch 3, it turns out that's not enough because
there's a different race. The sequence of events is something like
this:

1. Medium-prio app A submits to ring 2.
2. Ring 0 retires its last job and we start a preemption to ring 2.
3. High-prio app B submits to ring 0. It sees the preemption from step
2 ongoing and doesn't write the WTPR register or try to preempt.
4. The preemption finishes and we update WPTR.
5. App A's submit retires. We try to preempt, but the submit and
ring->cur write from step 3 happened on a different CPU and the write
hasn't landed yet so we skip it.

It's a bit tricky because write reordering is involved, but this seems
to be what's happening - everything except my speculation about the
delayed write to ring->cur being the problem comes straight from a
trace of this happening.

Rob suggested on IRC that we make retire handling happen on the same
workqueue as submissions, so that preempt_trigger is always
serialized, which IIUC would also make patch 3 unnecessary. What do
you think?

Best regards,

Connor
