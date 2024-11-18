Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761329D134B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 15:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DF610E4EA;
	Mon, 18 Nov 2024 14:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CJr8ndpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C50C10E4EB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 14:39:50 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e38158560d4so1641914276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 06:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731940789; x=1732545589; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r9ByUzP6+73RBqmQ54+FUS5a2RqUQJq8/v72072Hlm4=;
 b=CJr8ndpMF1n59wiQZd4MkJYoy3wgkriCK7ztjwo0MxZ0qoMuUP0SuJISvWPBKNzA0t
 L76kqtMXOD80UNAVk7XbhxxwQXjVfCcTQ6Ds0x0ALnFyW760T8kLURHCAzCiZaCCzBbv
 ls9CjWC1Ca7k0Kmo3Vosdb98ryaY1qvaykNBeJIfd03ZLNA4RHzHXSNy3AJ6o2D/s+MV
 FZl1RdCjgB7vhuu0wF+ApYypHvh3zccvfhitwYuVwmGlwQSMABaO3wqtJrAyABFnzcsY
 RRLgIgKz6R7QwdjcBCf4DuvK8RC1aX80JLDiI+CcrW63tfenc43IhLyPxfU4Fadgqcm9
 itzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731940789; x=1732545589;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r9ByUzP6+73RBqmQ54+FUS5a2RqUQJq8/v72072Hlm4=;
 b=QCpokQkVifky86eor9vKB0+QKqrnBnhRtWaGT+hw2g/Iyi7cbytR0Ql7VikOewVgzk
 JLPrm1y0x19/nDIUbBHwTAiJP34H3zSC8vFqgWMEY6Qb6tNDC/2dP/iwBAHNrYrzHAES
 Q0XQUiVa9sAFEXXGrinr7myWzls3H36qKYfQ1IN7YqOeusJd5cOsWRF+IaUB9H9ZV/Ff
 hay60/isvEMW8825ThljPMQ6pDNhl2x1SQI9H40kpEn91oHqTv3usWiBwXph5kEyiLP9
 WN+CKyZg/AFvrZmZkc5Fl6HLdvsER8xbH5qEaoQeJRP0Pca8CUf2ZtQwzw7Z9SDfznfQ
 dDtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP03E4SeTYTSxfdZlQdVlLIZDeTYusaH9haZr0dNMNDxskweyBWqfODR55H8A2vxnxrFzjTs35Ie0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjeoJ1nZsbnPYwnOwWE+S3gocsWshze7pRRUFCLFqTHGEUvHHE
 P3QPRZekdLzu3fBL7OdwLQFS1CsE0RU0t3CRUvhNCqHxVf5IANUBuf8J29W+fqiKyCQXS5MvzqB
 DE8Lbk4k6TzYHmzwoJ2ySpGhwqPBVn0e6FiVaww==
X-Google-Smtp-Source: AGHT+IEEpyD2A4JYQ5Rg/9zTZnt5t5baJqVCTEDDP7vQeL7ALYKTj4alMmxiJWSoMJkT89RKqFeUMQC/HuG0OMTqlRs=
X-Received: by 2002:a05:6902:3381:b0:e30:c76e:960d with SMTP id
 3f1490d57ef6-e3826176347mr9019615276.27.1731940789418; Mon, 18 Nov 2024
 06:39:49 -0800 (PST)
MIME-Version: 1.0
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-6-3b8d39737a9b@linaro.org>
 <nw2sqnxmhntvizzvygfho6nhiwfni4xfquwst5gd5g2tel6pnr@h66d4mw46jcf>
 <8df952a8-3599-4198-9ff0-f7fac6d5feaf@linaro.org>
 <p4pqswgaxbx2aji6y5v2qngn3xp4gdlruthhbzpb4cgfs2earz@mo7zbsgqwc4b>
 <e76a2531-a96a-441d-ac2d-bc1557370aa5@linaro.org>
In-Reply-To: <e76a2531-a96a-441d-ac2d-bc1557370aa5@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Nov 2024 16:39:38 +0200
Message-ID: <CAA8EJpoO6sE8noSvvn0s7bu4Vi6-3YZ=kuxnv4+Vn_MfM3hSaw@mail.gmail.com>
Subject: Re: [PATCH RFC 6/8] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
To: neil.armstrong@linaro.org
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

On Mon, 18 Nov 2024 at 15:43, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 15/11/2024 15:39, Dmitry Baryshkov wrote:
> > On Fri, Nov 15, 2024 at 10:20:01AM +0100, Neil Armstrong wrote:
> >> On 15/11/2024 08:33, Dmitry Baryshkov wrote:
> >>> On Wed, Nov 13, 2024 at 04:48:32PM +0100, Neil Armstrong wrote:
> >>>> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
> >>>> is in place, let's declare the Bus Control Modules (BCMs) and
> >>>
> >>> s/let's //g
> >>>
> >>>> it's parameters in the GPU info struct and add the GMU_BW_VOTE
> >>>> quirk to enable it.
> >>>
> >>> Can we define a function that checks for info.bcm[0].name isntead of
> >>> adding a quirk?
> >>
> >> Probably, I'll need ideas to how design this better, perhaps a simple
> >> capability bitfield in a6xx_info ?
> >
> > I'm not sure if I follow the question. I think it's better to check for
> > the presens of the data rather than having a separate 'cap' bit in
> > addition to that data.
>
> I don't fully agree here, I just follow the other features (CACHED_COHERENT/APRIV/...)
> nothing fancy.
> I'll introduce a features bitfield, so we don't mix them with quirks

SGTM

>
> >
> >> There's other feature that are lacking, like ACD or BCL which are not supported
> >> on all a6xx/a7xx gpus.
> >
> > Akhil is currently working on ACD, as you have seen from the patches.
>
> Yep I've tested and reviewed the patches
>
> >
> >>
> >>>
> >>>>
> >>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++--
> >>>>    1 file changed, 24 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..014a24256b832d8e03fe06a6516b5348a5c0474a 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>> @@ -1379,7 +1379,8 @@ static const struct adreno_info a7xx_gpus[] = {
> >>>>                    .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >>>>                    .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> >>>>                              ADRENO_QUIRK_HAS_HW_APRIV |
> >>>> -                    ADRENO_QUIRK_PREEMPTION,
> >>>> +                    ADRENO_QUIRK_PREEMPTION |
> >>>> +                    ADRENO_QUIRK_GMU_BW_VOTE,
> >>>>                    .init = a6xx_gpu_init,
> >>>>                    .zapfw = "a740_zap.mdt",
> >>>>                    .a6xx = &(const struct a6xx_info) {
> >>>> @@ -1388,6 +1389,16 @@ static const struct adreno_info a7xx_gpus[] = {
> >>>>                            .pwrup_reglist = &a7xx_pwrup_reglist,
> >>>>                            .gmu_chipid = 0x7020100,
> >>>>                            .gmu_cgc_mode = 0x00020202,
> >>>> +                  .bcm = {
> >>>> +                          [0] = { .name = "SH0", .buswidth = 16 },
> >>>> +                          [1] = { .name = "MC0", .buswidth = 4 },
> >>>> +                          [2] = {
> >>>> +                                  .name = "ACV",
> >>>> +                                  .fixed = true,
> >>>> +                                  .perfmode = BIT(3),
> >>>> +                                  .perfmode_bw = 16500000,
> >>>
> >>> Is it a platform property or GPU / GMU property? Can expect that there
> >>> might be several SoCs having the same GPU, but different perfmode_bw
> >>> entry?
> >>
> >> I presume this is SoC specific ? But today the XXX_build_bw_table() are
> >> already SoC specific, so where should this go ?
> >
> > XXX_build_bw_table() are GPU-specific. There are cases of several SoCs
> > sharing the same GPU on them.
>
> So it's gpu-specific
>
> >
> >> Downstream specifies this in the adreno-gpulist.h, which is the equivalent
> >> here.
> >
>


-- 
With best wishes
Dmitry
