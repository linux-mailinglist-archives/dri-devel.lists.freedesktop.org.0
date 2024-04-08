Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6689BAC5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF761122CC;
	Mon,  8 Apr 2024 08:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LIJzlvsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8081122CC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 08:48:53 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso4031278276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712566132; x=1713170932; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F7NI1a3KJOYbUdllvSAieuMW0BytOpwEyZTxcjSweC0=;
 b=LIJzlvsEQe36jdxAshThIzUwRw7pQqM+ZU2LZSGka2WAY/27gFrSc6YEIFb1Bhdyp8
 jcb9/5Do/Lx9eNQYZk5Mb96N+F1DEsjrV8XEEElSkDkTBiyqc/6aBKTfJHv2hj8gIMks
 YQ2BsQ6P0P7FEpyf5j8Hbx0szdvps2trNfauQFsrBJsD1eMjPNWQYgxhu53MFXkOnHUg
 BZOBM370k6sl+5jytwvNwk3WcVh2hGEzAHOFbFVGwKyob3n4h01XZIeY5g3E4+tgi3go
 uW6X0sO6lw31LqlCrqDAcwtgCAY9LS3xFSee27ZB+whuIuJWviX6cdEwYLdUafq7zMoJ
 e7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712566132; x=1713170932;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F7NI1a3KJOYbUdllvSAieuMW0BytOpwEyZTxcjSweC0=;
 b=S8PIcYy8x3RTjEkVAh9E41/FWeoNC7OEGe8ELB1oRnJ2/+alBdc7XdRIUrfkku902U
 zMfHtRcIu1ZI3V5iG+dnBBqCPwXqY3pd5KtugAfzuRjvVLzuR+pHHY55T0GX8Z+jDohb
 1kSfG2Ya+JU8kDxrJ1sIPTh9AJ6L2vqycflW1kOnM55V47Bo6xxtv5shbDtoxtXFREBB
 VwYz4KLMgSOS9PrDg/ftD4D/qwmFX8WeWKWhYMMRaobtPJEUmRrhhtmE6fn5fNBEp2AV
 5O9g1WndiJ/KJzaEGV95+AKBQgqoKhpfqmkj581PZHu9zIPxXdGg7N5rwd+5MjRGJ3YF
 PQpg==
X-Gm-Message-State: AOJu0YxgYp9Ao6s1FprswGOb01QmRPVfQHaNv9dhCp4BhOcTuEvIZlGT
 SGDwhop6ck/rbbUSVxXKaF1bVVif4x2aJoBsdS4MNPlOwVqkTunIpS3XM5epovryPyV9i7lAUer
 1tc/bMkshiqbp35hA9+xWtbF85IRE+ETj14GmUw==
X-Google-Smtp-Source: AGHT+IEQeHmk38rLUm1S6f8awpQg2EktVcFZ4Lukaa8kZida8w/IUtZcOLqQzNPzXn2oIiDTfj5wNOxJrG7cDph37d8=
X-Received: by 2002:a05:6902:2b04:b0:dca:c369:fac2 with SMTP id
 fi4-20020a0569022b0400b00dcac369fac2mr6609762ybb.3.1712566132588; Mon, 08 Apr
 2024 01:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240405092907.2334007-1-jani.nikula@intel.com>
 <eondf5x3wz3nccxpnqxtb7gtvf3k5u3bz4qwhn3gbcy5pj73ku@fue4tej3xgnq>
 <87frvwb7i5.fsf@intel.com>
In-Reply-To: <87frvwb7i5.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Apr 2024 11:48:41 +0300
Message-ID: <CAA8EJpr9cEv6Yi1q+8u-+mU2V3yp=C9rtpnCu+pyouozukYQ=g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: convert all pixel format logging to use %p4cc
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Aishwarya TCV <aishwarya.tcv@arm.com>
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

On Mon, 8 Apr 2024 at 11:09, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Fri, 05 Apr 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Fri, Apr 05, 2024 at 12:29:07PM +0300, Jani Nikula wrote:
> >> Logging u32 pixel formats using %4.4s format string with a pointer to
> >> the u32 is somewhat questionable, as well as dependent on byte
> >> order. There's a kernel extension format specifier %p4cc to format 4cc
> >> codes. Use it across the board in msm for pixel format logging.
> >>
> >> This should also fix the reported build warning:
> >>
> >>   include/drm/drm_print.h:536:35: warning: '%4.4s' directive argument is
> >>   null [-Wformat-overflow=]
> >>
> >> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
> >> Closes: https://lore.kernel.org/r/2ac758ce-a196-4e89-a397-488ba31014c4@arm.com
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >> ---
> >>
> >> Tip: 'git show --color-words -w' might be the easiest way to review.
> >> ---
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  8 +++----
> >>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  2 +-
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  4 ++--
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 24 +++++++++----------
> >>  drivers/gpu/drm/msm/msm_fb.c                  | 10 ++++----
> >>  5 files changed, 24 insertions(+), 24 deletions(-)
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Thanks! Do you take this via the msm tree?

Yes, I will


-- 
With best wishes
Dmitry
