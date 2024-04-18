Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28178A98EC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 13:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE479113BF5;
	Thu, 18 Apr 2024 11:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y+r9HD4d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC7B10FC15
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 11:48:26 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so638784276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713440905; x=1714045705; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NuxTFXDlrm+BFnpHmLBiKm3zNo8+3C9CrzDgCHuzRNk=;
 b=Y+r9HD4dux/vcjrjQDJpuFnr4QtA1yAlN/7LqJVTpEdJZ77GO1Jv11Ts7o/BTuI4t4
 ZRkD7jcVvvWA+FBpEDUyr7tt3mt2Z2QqM4pTIi+BYfm7goGPExe4oK8RtYb9gqJfy873
 QpFq4hV0OmA1Ee0Cw3XmlFM2JB42oVCDLtdh5WGnUCVLmDgaxepRKo+wHDItdTB2stE1
 2wInlnjnoEQW4EOgb6m5Lr9bsz49xYUPbPay2zDJC8ZsR3Yyie+NoSq6ybNwdMTe47/A
 vEHrRgi41Rfam6GeY6DkUv5rf1Ukb+ykwHzPkKzSFeTJXNDzW/uwwulElIr7ImEeLNS0
 wKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713440905; x=1714045705;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NuxTFXDlrm+BFnpHmLBiKm3zNo8+3C9CrzDgCHuzRNk=;
 b=k7TiDUJy2uP1Ov2+OMCjElKkmFsuVLC3F8JFHe37ObRoxBGfJ9vjdTKQ5i6JGFeYqq
 qP2Op0A0Rn8/l5buXsbIjJB1hJAfWkPfK0qUzGwb6F91SrS95DZYprqbd78kiU6tdc0Z
 fFdbTc6O/MgJwaaH0J08MLT3jwQOdcCiNvSZt9SlROfp0QXNquoDGr9ZapKj8h/JN+XS
 qkhb1cuk1uLXat1CfZkd6ZI5rNUidv4cx+Af1EjqF8qYuDAdyeLZY2yY6N9WJqu5gMb6
 C7JitXulBuVSe/wYGTHxMemc32cSdeF/nUuv+A1pR+iL5ZJ2yDHGeyWPkVcDAVvmycd9
 Q9Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHbLTv6E3SzHhIgEObfl/TexBXha6R+cLBS3hvUwkjkeGc3u+fp2gjjpgkboCg8CUJtdSsa2LuLQNljsB/WQEwZObZvjJt9LZNoyZQ1djx
X-Gm-Message-State: AOJu0Yws51SQ7/Zx+jmDb/j1kBCKDNmjBUUsY0UbKH5Vlk+uRku5x0LU
 BXTOTYFj1SDVBA1UBlV5NcZcxLafro0ecrsU4YEoTeyBgPCcZb2S2vKU1cOeB8E0ATQBHEHOhbT
 94dK1l7+0kYK1dpgZd4uSdEVgARfigwlLdUn72w==
X-Google-Smtp-Source: AGHT+IGKBPlfH5drQwVfSarXKWibHJIXInY29SG6VZ1jJJB3cdumDdDbAMYX6JlD836WHkNKoYSwv0xG3WG+/ElPO7w=
X-Received: by 2002:a25:b121:0:b0:dc6:d1a9:d858 with SMTP id
 g33-20020a25b121000000b00dc6d1a9d858mr1686669ybj.8.1713440904861; Thu, 18 Apr
 2024 04:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-3-c84f820b7e5b@linaro.org>
 <hi7vzqm5ebypzs6m6bw64ghgfwsdzuaxy65jpah37iw5ww7fku@n3c5sucic27i>
 <bfd6aa32-a28e-47a4-82c7-76c5dd99a44d@linaro.org>
 <7ynodjzjuxwwqkjgns5jtnkckw52qyldfpsqpjh7645swva4xk@7wucftyjyyy3>
 <2b5f33ba-2108-464c-b4d2-eff2cc6e59cf@linaro.org>
In-Reply-To: <2b5f33ba-2108-464c-b4d2-eff2cc6e59cf@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Apr 2024 14:48:13 +0300
Message-ID: <CAA8EJpqW-YxJdw-+QDEdhqjwAPK1dzmW1dW6=18wcRQgp+Oq6w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] drm/msm/adreno: Implement SMEM-based speed bin
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
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

On Thu, 18 Apr 2024 at 14:31, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 18.04.2024 1:07 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 18, 2024 at 11:51:16AM +0200, Konrad Dybcio wrote:
> >> On 18.04.2024 1:43 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Apr 17, 2024 at 10:02:55PM +0200, Konrad Dybcio wrote:
> >>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> >>>> abstracted through SMEM, instead of being directly available in a fuse.
> >>>>
> >>>> Add support for SMEM-based speed binning, which includes getting
> >>>> "feature code" and "product code" from said source and parsing them
> >>>> to form something that lets us match OPPs against.
> >>>>
> >>>> Due to the product code being ignored in the context of Adreno on
> >>>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
> >>
> >> [...]
> >>
> >>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >>>> @@ -6,6 +6,8 @@
> >>>>   * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
> >>>>   */
> >>>>
> >>>> +#include <linux/soc/qcom/socinfo.h>
> >>>> +
> >>>
> >>> Stray leftover?
> >>
> >> Looks like
> >>
> >> [...]
> >>
> >>>> +
> >>>> +#ifdef CONFIG_QCOM_SMEM
> >>>
> >>> Please extract to a separate function and put the function under ifdef
> >>> (providing a stub otherwise). Having #ifndefs inside funciton body is
> >>> frowned upon.
> >>
> >> Hm, this looked quite sparse and straightforward, but I can do that.
> >>
> >> [...]
> >>
> >>>> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> >>>> +#define ADRENO_SKU_ID_FCODE               GENMASK(15, 0)
> >>>> +#define ADRENO_SKU_ID(fcode)      (SOCINFO_PC_UNKNOWN << 16 | fcode)
> >>>
> >>> If we got rid of PCode matching, is there a need to actually use
> >>> SOCINFO_PC_UNKNOWN here? Or just 0 would be fine?
> >>
> >> The IDs need to stay constant for mesa
> >>
> >> I used the define here to:
> >>
> >> a) define the SKU_ID structure so that it's clear what it's comprised of
> >> b) make it easy to add back Pcode in case it becomes useful with future SoCs
> >> c) avoid mistakes - PC_UNKNOWN happens to be zero, but that's a lucky
> >>    coincidence
> >>
> >> We don't *match* based on PCODE, but still need to construct the ID properly
> >>
> >> Another option would be to pass the real pcode and add some sort of
> >> "pcode_invalid" property that if found would ignore this part of the
> >> SKU_ID in mesa, but that sounds overly and unnecessarily complex.
> >
> > It's fine, just add a comment please. Maybe we can rename PC_UNKNOWN to
> > PC_PRODUCTION?
>
> I don't think that's right. The SoC "product code" may actually mean something
> (again, not necessarily for Adreno specifically), and with Adreno in mind, it
> being only meaningful for engineering samples may change in the future.

Ack


-- 
With best wishes
Dmitry
