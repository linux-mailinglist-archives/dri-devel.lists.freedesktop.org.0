Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7EE9982A3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 11:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC7F10E8B7;
	Thu, 10 Oct 2024 09:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kbNp1rui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51E110E8B7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 09:43:16 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e290333a62cso594186276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728553395; x=1729158195; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1CATrtMWn6F5QT6eZk/r0oyiPtlYTjTAFuFuazZn49I=;
 b=kbNp1rui4EtOatlYpxBYyIjT8Tqw3H/ap5Q/r+20W6P/uDOnYi/1G711Ge2gnUSAjl
 xQC0qfUh54XYs55R6gPc9ygdq2+9xBI+6Gso1jR2zcPVvCfo3rnFMKOc/ulvdoOWZ6aL
 VXuGmYy1sCql3eSQ3ZztRmTBVeVttEaHMUnP6oMSMkU/tWc6aJleL2u6W0AHqypzTzmn
 ibU79yFHFm3npsrWLHqPF0yFhG+VDrLQ7DBKnuw5/uE5j/RsC/q/EVnLexbOykt2TJ39
 84t/5wQNrij2eyU17/Y1ynAKw1XScj7hgKb09/KjWDKsBVlpO6cVonSqoE01AF9khE6S
 2GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728553395; x=1729158195;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1CATrtMWn6F5QT6eZk/r0oyiPtlYTjTAFuFuazZn49I=;
 b=YTevsHT/VfrQS2RNQ1VT73NWJG/12ys3OrWLrnpDQJVC911pT+mVypV7FtjXi1uA/w
 vIzxahm9xosXRhnxg8huWCvIoG9IhsdiT2o+zXv5AHnVWi7pgfsSUGL0dMPKcQHkdyAN
 GxtbR9WbJnprfqWdT6w/2Pd1uGPUuiok6/oCqpZ5rdK+4mdLF5++/05aSVBogba29dsN
 ph66j1AGogHOxFp9gbH5Cqv+ma2gGAfVebmGOZtzZ6FA5+kR6N0ZLu4rGkqalPCm/3Jf
 5V9pqhYDmtCCIJ0xWJ3GMykPKNhC0aU3bIZzOc9M5oBFnS/Q9IdQH6PQsitVmjF9mfdq
 eyZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6LgQgY6eRQhd+h16P5bn1sZnMu6rlTNspiIg/Ffbccd6kBfrbmfbqpGW9i1l65dPxd/czdQmDhEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKdymYFha/b7K8F97GZWzC1A3tBBXMgwFTSZrxb/daOzacZehc
 wxWYFFh6kIJhSt77eesemckr9qh3jNnASk9zKt6j8L+YGwF28WQwxgRvrjnVZM1kcbcvs78VKuz
 4pCZzfkL8r1KHyBW2GY4XaJmIIAbhSpe5J0maUw==
X-Google-Smtp-Source: AGHT+IGQsfLmiQXBMuj7PPXTmXpl+pQHwqsX8qRdNSbosQyMcl6gJbMDDqLIOVBG7FvEH8rByhIg4jNfV7DhdN8whp8=
X-Received: by 2002:a05:690c:6507:b0:6dc:c105:6d84 with SMTP id
 00721157ae682-6e3221d4ec1mr58123967b3.12.1728553395610; Thu, 10 Oct 2024
 02:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com>
In-Reply-To: <20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 12:43:04 +0300
Message-ID: <CAA8EJprWLOX+TcByO_UFx77HxBX2Gi5y5QComvdRb_Jcyyv_pA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: don't always program merge_3d block
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, 10 Oct 2024 at 06:46, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Only program the merge_3d block for the video phys encoder when the 3d
> blend mode is not NONE

Please describe why, not what.

>
> Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ba8878d21cf0e1945a393cca806cb64f03b16640..c5e27eeaff0423a69fad98122ffef7e041fbc68e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -302,7 +302,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>         intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>         intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>         intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> -       if (phys_enc->hw_pp->merge_3d)
> +       if (intf_cfg.mode_3d && phys_enc->hw_pp->merge_3d)
>                 intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>
>         spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>
> ---
> base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
> change-id: 20240828-merge3d-fix-1a8d005e3277
>
> Best regards,
> --
> Jessica Zhang <quic_jesszhan@quicinc.com>
>


-- 
With best wishes
Dmitry
