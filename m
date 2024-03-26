Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7119988CD73
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 20:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB6A10EA8C;
	Tue, 26 Mar 2024 19:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XIF4cE8V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F51210E6EE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 19:47:42 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dcbd1d4904dso6019724276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 12:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711482461; x=1712087261; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+qyPM89Y10g6lsVDwvjAhw3OysernPxYLdybxWGA1Ik=;
 b=XIF4cE8V4TgU3IKs06pdtU8d+VPUpbglh7Lei9oC9sVgmtW0mD8Bm9rNfip/AizPk4
 KLpS9ebQjwRLkXm9l3fQeZr8yR3whSEzKufAcpc8a7EWouW6+Kge4pmaVXjvOW8uaxVq
 /xAxoanXZFFzlSwRQYB/uMhNP74MW6VdSci3I0HiHv2hK6wUYz7SaiQX3oyFSNKF8mfO
 MJvLDdJHY3mzYGSHLS+MwRsB6vLbJ6wdJQZ7HbgKZyftNDkiNHfnm449eHqgKvrS+wvD
 +uKq0WK557gzYdTEODP1rRHK9rvxUfZN/lIcQ7YOIou2W/OBYGRnU+a+CZzrCbugxZbx
 qjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711482461; x=1712087261;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+qyPM89Y10g6lsVDwvjAhw3OysernPxYLdybxWGA1Ik=;
 b=veAaiz5b9ehtHxVUXzmKSZEiAh1eUEAjoE5aGhGBZVIqgg8ajM9b7lMCIdTMuQZ3w4
 KG55gBy0UVIoXobY7q7m8EfTb94kcghU625aN3C+z50fuPVzKXMUEAGi7O+UJ4XUR57H
 4zkvyGs9+CFuELCoVovHWankfEjA4cL7QhF9YwM+PfemSp7+ZNdiWso8u/BOdiW+DXDA
 1IShpp3Kn1UevDGpwUTAsciun9eNc9DquFhez6BqdKVlimTCnP7Wh/f3xzrOhQWVguPx
 010kLPwt3Mge4iJjRC83MUQFwxuKQGAsI0XFo50V6XfQ6ya8yU18Yrati1oYnaOyZNf3
 UqQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCgH3r8INyQcS7Vr/nj7/wMr/dw2zROj573TTHOE8ijE3qF4uCmK8/8SR4aF0HDVKxXB3I8kQc6EFa/hCeSO8qbgs43mz6rWDmHBOtXSPX
X-Gm-Message-State: AOJu0YwWKzuOYwnTnhlbiEFwHW4UahWtzL2GitzMqUye9zozSxUcH0Zg
 i7ZGEQrVt1Cx7IOUDK7jFskJ/6bW24oOL3hRxmqx4ppJNjqAHqbM5/DVihbYVjMj/FUgk5xoBpX
 VBouZ7F/QD5zPCVq0nhhmpPZZn6oKavpOtc8IxA==
X-Google-Smtp-Source: AGHT+IEDgs+miE1gX6ZQTUPVvtQ4tAfLoH8Z/nDmvJIeTUqUSoM57Xw13la+OqnoQDXlV9aokZwVCnZHBuAHWvDS4Lc=
X-Received: by 2002:a25:aa4d:0:b0:dc7:8c3a:4e42 with SMTP id
 s71-20020a25aa4d000000b00dc78c3a4e42mr8948827ybi.30.1711482461135; Tue, 26
 Mar 2024 12:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
 <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
 <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
 <CAA8EJppqrF10J1qExM=gopiF4GPDt7v4TB6LrQxx5OGyAL9hSg@mail.gmail.com>
 <671d2662-df4e-4350-0084-476eb1671cc1@quicinc.com>
In-Reply-To: <671d2662-df4e-4350-0084-476eb1671cc1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 21:47:30 +0200
Message-ID: <CAA8EJpppre8ibYqN7gZObyvzR08yVbTevC6hDEDCKQVf8gRVRg@mail.gmail.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
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

On Tue, 26 Mar 2024 at 21:32, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/26/2024 12:10 PM, Dmitry Baryshkov wrote:
> > On Tue, 26 Mar 2024 at 20:31, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/26/2024 11:19 AM, Dmitry Baryshkov wrote:
> >>> On Tue, 26 Mar 2024 at 20:05, Miguel Ojeda
> >>> <miguel.ojeda.sandonis@gmail.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> In today's next, I got:
> >>>>
> >>>>       drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
> >>>> 'out' set but not used [-Werror,-Wunused-but-set-variable]
> >>>>
> >>>> `out` seems to be there since commit 64d6255650d4 ("drm/msm: More
> >>>> fully implement devcoredump for a7xx").
> >>>>
> >>>> Untested diff below assuming `dumper->iova` is constant -- if you want
> >>>> a formal patch, please let me know.
> >>>
> >>> Please send a proper patch that we can pick up.
> >>>
> >>
> >> This should be fixed with https://patchwork.freedesktop.org/patch/581853/.
> >
> > Is that a correct fix? If you check other usage locations for
> > CRASHDUMP_READ, you'll see that `out` is the last parameter and it is
> > being incremented.
> >
>
> Right but in this function out is not the last parameter of CRASHDUMP_READ.

Yes. I think in this case the patch from this email is more correct.

>
> Maybe you or Rob can correct me but I thought the fix looked sane
> although noone commented on that patch.

>
> >>
> >> We can pickup that one with a Fixes tag applied.
> >>
> >>>>
> >>>> Cheers,
> >>>> Miguel
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >>>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >>>> index 1f5245fc2cdc..a847a0f7a73c 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >>>> @@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
> >>>>                (block->type << 8) | i);
> >>>>
> >>>>            in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
> >>>> -            block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
> >>>> +            block->size, out);
> >>>>
> >>>>            out += block->size * sizeof(u32);
> >>>>        }
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
