Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A48D56050D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 17:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104F810E206;
	Wed, 29 Jun 2022 15:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5650810E206;
 Wed, 29 Jun 2022 15:59:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so4970875wmb.1; 
 Wed, 29 Jun 2022 08:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YNly1dfG4RY5ld91Tin+FHgAbZbcnCeyfevD6nD1vfc=;
 b=ZgK2yec9C4SmTv4WPvJao1de+26SSYJi9rBk2Rm5tsjBhm84Yai0AaWoHnwo8hxldR
 9klx9J26g4poB1ilLULPFvjpYmbTXZgqjR5jBDuDaCXRnejPGxTL9FQWDJQjwvm9d62Z
 wqrON8mV1zO7WtefS2+bi0tYsSsq+R3gxgRt3JZCnSWKxoiX/1wD1l/9G48Nyv48fyK1
 esV/Tfz4nn6Zw1aHdKtTzQgu7Eaic0SxMRHB/Y9gbcJby4fgGAluUiP08MTXcISxD9qO
 +x6hejlvzv8jO2GDoURMi9RpPIAHWVsYCRCbuzEwSmi6pn55/C/vppZqg/HNESGFxliO
 oRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YNly1dfG4RY5ld91Tin+FHgAbZbcnCeyfevD6nD1vfc=;
 b=XcBZ4eeNpPDm6iN9R2wxwlCsgsV9YWlCH9OTdI20d1DEcOMJQd9NBXzqebrojk1v5g
 MI/NfclXnKh5wR5YJ3riuM16aZbwbpH2vtm16eNqFNNhAfZVJtUaZp8wU/cZ/yNk7k9s
 1uKgj0sx0/O549/FzjoBYLmoFU9aKRNkdaFO/HFdbGe2jNMmAva7Q2pg85UIBDZHbwdK
 GkYDGM8FT+ur5atp2Lx16ufSv5adcKcYspH8sDAdEIgSKxdxDPr8ngulcl1KIOkqtk8C
 FI2CIds2cFcAtxH33tuNdTwsf8Qizmmme1iz/WncxwzWqmgJRJ8EhYbvH6j5+zVFCk//
 f9pA==
X-Gm-Message-State: AJIora8cc+AccPxTQipOXqo24S+zuH0NscJGbyYij0rrmXlKeF4rat4Z
 vA+jMwDjcC7leIB44G/JvAR7AT/mx6w6AyPjNRg=
X-Google-Smtp-Source: AGRyM1tAAlS4kM+nsw/NsoxnqWVB7y/vftH9UCWhq7jvEEfRS+sgsPnvHp0EazC+wGHRC5cFIqKQzo9Y/BNHvxxfINU=
X-Received: by 2002:a05:600c:3516:b0:39c:8091:31b6 with SMTP id
 h22-20020a05600c351600b0039c809131b6mr6732490wmq.164.1656518376833; Wed, 29
 Jun 2022 08:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220510132256.v2.1.Ibf12c1b99feecc4130f1e3130a3fc4ddd710a2e9@changeid>
 <YrvVPiLQL6d4MrFV@builder.lan>
 <654c8819-5721-838e-4148-6fbdc5fc2dcd@quicinc.com>
In-Reply-To: <654c8819-5721-838e-4148-6fbdc5fc2dcd@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 29 Jun 2022 08:59:50 -0700
Message-ID: <CAF6AEGuV=sF2sLfQ53AJ4pQYFCjMH3-ephwyGW_HQqnkKRm5MQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: Add support for a new 7c3 sku
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 10:32 PM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 6/29/2022 9:59 AM, Bjorn Andersson wrote:
> > On Tue 10 May 02:53 CDT 2022, Akhil P Oommen wrote:
> >
> >> Add a new sku to the fuse map of 7c3 gpu.
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > Is this series still needed/wanted? I've been waiting for patch 1 to be
> > merged in the driver so that I can pick up the dts change.

It just missed the previous merge window by a couple of days.. I was
planning to pick it up for the upcoming merge window

but I don't think the dt bit should depend on the driver bit in this case

> >
> > Regards,
> > Bjorn
> Internally, this sku is on hold. So we can drop this series for now. I
> will resend it if required in future.

ok, I'll hold off for now

BR,
-R

> -Akhil.
>
> >
> >> ---
> >>
> >> (no changes since v1)
> >>
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index 841e47a..61bb21d 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -1771,6 +1771,8 @@ static u32 adreno_7c3_get_speed_bin(u32 fuse)
> >>              return 0;
> >>      else if (fuse == 190)
> >>              return 1;
> >> +    else if (fuse == 96)
> >> +            return 2;
> >>
> >>      return UINT_MAX;
> >>   }
> >> --
> >> 2.7.4
> >>
>
