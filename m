Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BEB8860AE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 19:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0624F10FD56;
	Thu, 21 Mar 2024 18:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gGyqDdJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA0110FE11
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 18:44:10 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-ddaad2aeab1so10248276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 11:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711046649; x=1711651449; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wl+oGM7xBpGJ1G8vzSX1N4Tg+wB3JNqlo4iK0nt+DCE=;
 b=gGyqDdJgpI1othsV9oESsyOnI0eGqjvOuntmbS2DpO3vHdUCrUUmINy3vQ2tx0ZEML
 47/54Q116eYg01DFC+ZLjOpdwX7N12HZxRZW/ORs2Q+GUuEC9lOcnUZFPIpuIAfW8M44
 fHuq2gLzqrI/ZrN2yOsoUZ1fDSQ3xkwJMZIcsvqH+SpFVh4zbFjrvzRw6KAa425tHc6H
 aJ8fJHZV1IPUszJPlgxFYJTnDuef+R571NS8YsdUSTjfmgEB5FGonyS21kNMu0pqpPVd
 N1hlQXPOWX83tedQ+9UPqR3nVshixrwow1oD3//osJUjk99zvnshgY7zKVh6rLhj4Xm7
 8jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711046649; x=1711651449;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wl+oGM7xBpGJ1G8vzSX1N4Tg+wB3JNqlo4iK0nt+DCE=;
 b=H9DtfBQx4v8S2ulo/i44UIMKi4J91ekSPi1KWP6uOMO4ySsiAWzWjfZVzOQy/YCF5z
 gI3E7egFma8rD+mUCTiTenEVyEvQi0ot6tU5L5VCkyX3e/dT8rqgCn5c0YEmwYdfbnuR
 ZJoAs7EKD0Z+HQjwG82NKJXvnCsln47GdawYN/FS7UmOcZfH+kM6YA+webOIykjQT0au
 GD6nH6aQySiXIxKlmRe+VQAdzEJUxMnU5CU2ptRMh+BicQJSSgauYBFQKIrqCPumMHQn
 Ibi+/0engMeaTuWQP6iseb992fUGI7zWvSYWHhc7CUZJ7VfJzk0GINwD4yNmq0DJtJhC
 63DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOuICgR9D6onwgLl1ZBlzcEnfKRlrAsVDETmHE2BUoJU4iS/faZM1uGghqJZviyaV51WV0U16GwAIiODczpeEgy2FIcX8ZG/cNe6tDXi3F
X-Gm-Message-State: AOJu0YxKDAsnIWH7pa0DFJ/jU0O3YMdyuj/hRFpcc+nW3m6hlogpfpiB
 GrsexL/4LwnGkqTe3lbfgr1MelRiNs3FTxLyh4xk9cF8Loj1LX5eAemv74zoAlTPoilyOryC6/M
 8md4t7nG1Eer1Bm0iVxqKvMMC5dAy1nh3FQzXlg==
X-Google-Smtp-Source: AGHT+IFe03RC3nVeodEdT7bU8JoK4NpydonqfbIUHt0GiBTobSGhc2F+x/+N2a9UtT/JIbzibPnfAA+Y9ys6bgQHi8I=
X-Received: by 2002:a25:ab09:0:b0:dca:59a7:896b with SMTP id
 u9-20020a25ab09000000b00dca59a7896bmr3462ybi.50.1711046649346; Thu, 21 Mar
 2024 11:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
 <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
 <CAA8EJpqxkY=Bk8_iAq6Yj6VGNO2UYmF2Hm6XOeE5EhJFKUpaPQ@mail.gmail.com>
 <9bac0e8c-d14d-a759-dc02-2e38301e4ef1@quicinc.com>
 <CAA8EJpruKjwOoRU8UP-b__n77Z18WQpJMUWdqgry4vZsQ5-QZw@mail.gmail.com>
 <0c1aab88-8e0b-5f2a-fdc9-2a9e01628fc5@quicinc.com>
In-Reply-To: <0c1aab88-8e0b-5f2a-fdc9-2a9e01628fc5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 20:43:57 +0200
Message-ID: <CAA8EJppqvV=-P4g6ADVh4_CxO13sty+sDPEE1BBg3BA629rVeQ@mail.gmail.com>
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

On Thu, 21 Mar 2024 at 20:28, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/21/2024 11:09 AM, Dmitry Baryshkov wrote:
> > On Thu, 21 Mar 2024 at 19:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/21/2024 8:43 AM, Dmitry Baryshkov wrote:
> >>> On Fri, 23 Feb 2024 at 22:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
> >>>>> The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
> >>>>> Extend it to also support 4:2:2 and 4:4:4 plat formats.
> >>>>>
> >>>>
> >>>> I checked myself and also internally on this. On sm8250, the DPU planes
> >>>> do not support YUV444 and YUV422 (and the corresponding YVU formats).
> >>>>
> >>>> May I know what was the reference to add these formats to DPU
> >>>> considering that even downstream sources didn't add them?
> >>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>> Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
> >>>>> the clock inefficiency factor from 105 to 117. I'm not sure that it is a
> >>>>> correct way to handle it, so I'm sending this as an RFC. If we agree
> >>>>> that bumping the .clk_inefficiency_factor is a correct way, I'll send
> >>>>> v2, including catalog changes.
> >>>>>
> >>>>> I had no such issues for the YV16/YU16 formats.
> >>>>
> >>>> We don't support this too on sm8250. But interesting it worked.
> >>>
> >>> I have been cross-checking DPU formats list against the format list
> >>> from the display overview docs.
> >>> The DPU (and SDE FWIW) drivers supported NV16/61 and
> >>> UYVY/YUY2/YVYU/VYUY formats for ages, although overview does not
> >>> mention these semi-planar formats at all and interleaved YUV formats
> >>> are marked as unsupported.
> >>>
> >>> For reference, NV24 and NV42 also seem to work.
> >>>
> >>
> >> Thanks for the update.
> >>
> >> I cross-checked sm8250 format list in our internal docs to make sure
> >> there is no discrepancy between those and the display overview doc.
> >>
> >> NV16 / NV61 (linear) are marked "NOT supported" by DPU.
> >>
> >> UYVY/YUY2/YVYU/VYUY (linear) are also marked "NOT supported".
> >
> > But all of these image formats are handled by the DPU _driver_ as supported.
> >
>
> Ok, I see where this discrepancy is happening now.
>
> So I took another chipset, sc8280xp and checked these formats.
>
> Those are marked "supported" in that.
>
> Our dpu_formats listed in the driver is not chipset specific and that is
> causing this discrepancy between the display overview docs and what is
> in the driver.
>
> I will plan to move the formats list to the catalog to eliminate this
> and prioritize that change.

Well, from my side, disabling of interleaved YUV formats is going to
be NAKed. They are heavily used by video players for output. So,
disabling them will harm user experience.

>
> Till then, I think we should stick to the display overview doc in terms
> which formats should be validated on which chipsets.
>
> >> So the markings are correct.
> >>
> >> If you notice a discrepancy between our dpu formats list in the driver
> >> and what is marked as "supported" in the display overview docs, that is
> >> something we can investigate and get fixed.
> >>
> >> If you are running some standalone tests and reporting that formats
> >> marked as "unsupported" in the display overview docs still work, we
> >> cannot simply add those formats on the basis of your modetest validation
> >> as your validation alone shall not supersede the marking of the design
> >> teams as the system level validation of those formats is what we have to
> >> go by.
> >>
> >> The formats marked unsupported shall remain unsupported by the driver
> >> and QC shall not ack adding any of those.

Ok, I have a significantly different background here. Because
beforehand my code was frequently based on rev-eng, on the incomplete
support by the hardware vendors and the frequently incomplete docs,
the argument "work" still prevails in my head compared to "claimed to
be supported by the vendor". In the end my goal was always to get more
from the hardware than the vendor has even thought about.


-- 
With best wishes
Dmitry
