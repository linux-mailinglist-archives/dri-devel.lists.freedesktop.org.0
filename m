Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD7588CBE0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 19:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C05310EF3E;
	Tue, 26 Mar 2024 18:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PylrJUeq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B521210EF3E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 18:19:13 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dcc71031680so5261234276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711477153; x=1712081953; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qOkXmyl/X1aGG4AnOp91IyV31wzedhnJYqHOnnSV7Nc=;
 b=PylrJUeq1+VXqRhyGyPbwfkRVNTDBoS5SCLnbJuRJTaDtW7aIzR0yFvfDB+TpISt0I
 XY4aoBYQ8MvcixbsTDUabesK8bN6vgcMCquIaR2+QjYxWnhuhZhYvePUxpRtY8IylZOP
 NcfFSyUz169xQyQrfKzSZqCgCP5q04h0yPsqczL+mN7dpsOS0coIFr/rhqt6SRGsAYv9
 eHj8USN3hl2mD3GQ24Iktycu9QQnUa2tlUKqjvjjr5l79fSA8VmS3D31eh5zcNbh45dj
 sQhkMUubi3rl1MvJ2/kDjQp0c+EEKI+8IUNN9Tef8/b99JG6l41QpmXAAK+C6wBO6bQi
 EJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711477153; x=1712081953;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qOkXmyl/X1aGG4AnOp91IyV31wzedhnJYqHOnnSV7Nc=;
 b=fPM01C6ritxKoOxPjIip4QTRRCw2Dw01HhLdBYgEP58zueBLid2ffPYXW1M2yZCzpz
 8BnJgGoAQcq2lC5wpcchuvB4B4tvf94zXaMHU+sJHKTxj3un8YBLD92Sk8IXHKxgMe+R
 jxTi7goRZEaLV2b/C1BK/M9Y/kHd5M+3zuhiaYPt0Nu0wZT6MOQMAQnl7Ab3GEwh91QA
 W2chuC8RAngaWynGXyzh32GSbhOPUO3gUJD96L4YaPh1kHOM86+6bqxS7/sJyFUF0eBY
 ejfA/ANr3So7v2VGYBChR1c16+dLzpqWqSrZYpFpvgps9FXk4BgNLIaAGKqLyN/wfTz1
 PDBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX58WXZ1VKyZ9qFpZ5sERWehvD4ofUR3rGBF60TXd3+aetxRBX5O1cJ4MlMQDQzgDFvXlpB8opsrYAs/0/YZNlDkXSr9c9xcKim2noeID6g
X-Gm-Message-State: AOJu0YxXYMSnPJc9eueDY/ZS6qZ8LAUQYql0zr/kgmPxD/mnqnqiO6+n
 BNzs3e9t9mWYBknk6UnEjASOrw5Plz97R3ZSHtgAFZE8MPA/timKza0mUq1hkUtc6t8AJPOEvqn
 ytYk8SfZx0b1esOluuM0ubUAhf4nUWpgvKv40zA==
X-Google-Smtp-Source: AGHT+IFMp3OMawqOBv0a8n7GbzvaXu6Kp6vGmhRT4WskjxEebuGXOrN6fvoyGzz6SGmREGfuoZ6gKvGOsfAU2TMNBoo=
X-Received: by 2002:a25:820e:0:b0:dc6:d093:8622 with SMTP id
 q14-20020a25820e000000b00dc6d0938622mr491441ybk.15.1711477152723; Tue, 26 Mar
 2024 11:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
In-Reply-To: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 20:19:01 +0200
Message-ID: <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
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

On Tue, 26 Mar 2024 at 20:05, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi,
>
> In today's next, I got:
>
>     drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
> 'out' set but not used [-Werror,-Wunused-but-set-variable]
>
> `out` seems to be there since commit 64d6255650d4 ("drm/msm: More
> fully implement devcoredump for a7xx").
>
> Untested diff below assuming `dumper->iova` is constant -- if you want
> a formal patch, please let me know.

Please send a proper patch that we can pick up.

>
> Cheers,
> Miguel
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 1f5245fc2cdc..a847a0f7a73c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
>              (block->type << 8) | i);
>
>          in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
> -            block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
> +            block->size, out);
>
>          out += block->size * sizeof(u32);
>      }



-- 
With best wishes
Dmitry
