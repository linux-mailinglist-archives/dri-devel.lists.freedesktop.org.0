Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893B886053
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 19:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4136910F711;
	Thu, 21 Mar 2024 18:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z5rUh31x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5283610F711
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 18:09:20 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dcc73148611so1417730276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711044559; x=1711649359; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HkajwP7ngpIx4/g/7669hjMnrAnMPQAVj88YL0Lbi1s=;
 b=Z5rUh31xi3FWfg+I3lmzeWTLR7HFrwqiZ2deh44h3tntlB15KlxVTu6/3MUAEi2E4F
 qPAXFerLSZd0C5tYrRKBv52sQ+CmWyELx/m3xK+InZqEkNEeffwQGKmJeMOs1Xi56faT
 4OlAmf1kTLcN/xoqn+jORLKJPwmC2vi664scd29LxGWuhnQrd6WMd5doBf1rNt8jNGdi
 qIyfLhgPTKtTINJL2eVti32MiZ7P+VBZKsOZChiEIX/J4bvvMgYEsr02poJ9vqMx5G/A
 uSpHC83ab4QdCCfWkbz97+FPAE+E33qAhPEkQ4fBBxHs+mNFTLiW3fNCziES1Pgap5U6
 FViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711044559; x=1711649359;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HkajwP7ngpIx4/g/7669hjMnrAnMPQAVj88YL0Lbi1s=;
 b=pUypDPgouRCZq4JxjhLI1kOYsUrDCSkjA/AqDipvI1d7iDgsHUmOwsm1OVSEo7tYoM
 X0Ktzn+My8G7ztpeLnviU6mwWR/jOYRMDYYUOLZPjkmffH6pG2aiCQXlTlRE3+vgbvuu
 dUrybd5jVipnIKrsfA1IPu1sh45MccSqZ/tKC61156F5Ogc1Kp6PsQEiTwhM/iXpNZGQ
 JGRWx1f2WYR+TC9E7DM4AqjQM1BG4+ZVI5waztCyjTT/NB1CqgtXxov2AX8g8Tk11RXR
 kbfe7ngBk38/qzrgzmlKDnd1jjzER2B0QzADRleTEi7Hqo+aXDuHxJDANy7eD9HMp0vg
 Sg7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUanaGE+HueHqCimsgCP1a2GwKvD9YK4VjFkyg76qE6SY+wVX+J3Ab3JYcuRHwUzd48kfF0t/sXIFP2MaBYVZUtN3RbyX6OFaW5wel2FR/M
X-Gm-Message-State: AOJu0Ywzsd6DUjz3nXKHL4WGc7isa8MiO0ol0jYN3cBEvMB/zK09xMYN
 5R2ifgHyie52ZOygcTiZme7XfVm18DFLCvy7KmSabVgtO95eEQVl1WLzfvY4XohtM9rTjUWGRQK
 JeWimAIvnZgxEKbGOgD2bARunTFyVMuLWt8Rqxw==
X-Google-Smtp-Source: AGHT+IEgb1tC3yh3Dm97jZ9sCyMK4fU9umiqVxwlyvlLkNMpl72fRixe5DGR195Bp+bKcT7S9CZXtACGQPj4cFP6z0Q=
X-Received: by 2002:a25:830b:0:b0:dc6:ff32:aaea with SMTP id
 s11-20020a25830b000000b00dc6ff32aaeamr19005880ybk.24.1711044558949; Thu, 21
 Mar 2024 11:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
 <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
 <CAA8EJpqxkY=Bk8_iAq6Yj6VGNO2UYmF2Hm6XOeE5EhJFKUpaPQ@mail.gmail.com>
 <9bac0e8c-d14d-a759-dc02-2e38301e4ef1@quicinc.com>
In-Reply-To: <9bac0e8c-d14d-a759-dc02-2e38301e4ef1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 20:09:07 +0200
Message-ID: <CAA8EJpruKjwOoRU8UP-b__n77Z18WQpJMUWdqgry4vZsQ5-QZw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Thu, 21 Mar 2024 at 19:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/21/2024 8:43 AM, Dmitry Baryshkov wrote:
> > On Fri, 23 Feb 2024 at 22:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
> >>> The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
> >>> Extend it to also support 4:2:2 and 4:4:4 plat formats.
> >>>
> >>
> >> I checked myself and also internally on this. On sm8250, the DPU planes
> >> do not support YUV444 and YUV422 (and the corresponding YVU formats).
> >>
> >> May I know what was the reference to add these formats to DPU
> >> considering that even downstream sources didn't add them?
> >>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>> Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
> >>> the clock inefficiency factor from 105 to 117. I'm not sure that it is a
> >>> correct way to handle it, so I'm sending this as an RFC. If we agree
> >>> that bumping the .clk_inefficiency_factor is a correct way, I'll send
> >>> v2, including catalog changes.
> >>>
> >>> I had no such issues for the YV16/YU16 formats.
> >>
> >> We don't support this too on sm8250. But interesting it worked.
> >
> > I have been cross-checking DPU formats list against the format list
> > from the display overview docs.
> > The DPU (and SDE FWIW) drivers supported NV16/61 and
> > UYVY/YUY2/YVYU/VYUY formats for ages, although overview does not
> > mention these semi-planar formats at all and interleaved YUV formats
> > are marked as unsupported.
> >
> > For reference, NV24 and NV42 also seem to work.
> >
>
> Thanks for the update.
>
> I cross-checked sm8250 format list in our internal docs to make sure
> there is no discrepancy between those and the display overview doc.
>
> NV16 / NV61 (linear) are marked "NOT supported" by DPU.
>
> UYVY/YUY2/YVYU/VYUY (linear) are also marked "NOT supported".

But all of these image formats are handled by the DPU _driver_ as supported.

> So the markings are correct.
>
> If you notice a discrepancy between our dpu formats list in the driver
> and what is marked as "supported" in the display overview docs, that is
> something we can investigate and get fixed.
>
> If you are running some standalone tests and reporting that formats
> marked as "unsupported" in the display overview docs still work, we
> cannot simply add those formats on the basis of your modetest validation
> as your validation alone shall not supersede the marking of the design
> teams as the system level validation of those formats is what we have to
> go by.
>
> The formats marked unsupported shall remain unsupported by the driver
> and QC shall not ack adding any of those.


-- 
With best wishes
Dmitry
