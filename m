Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA0E56C121
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 21:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01B510E227;
	Fri,  8 Jul 2022 19:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6E410E227
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 19:51:47 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10bec750eedso22816701fac.8
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 12:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/gjPq+VtGqMyAx5uOhmiX/uYDdGj2/BayEk8UBg9x5U=;
 b=EMlmWFkf2LyyZsQ5T1TsVdwR8rDVGGi3xwaulrUugfDD6FWcRkZvti0JpiRvGrz2rc
 ugAb9GSwRyIUafQaLitKKtGSTwVYwPQ32cl2bg1KM/kaBM7zQ8k1poRPWCk/qaXdx1lN
 hLPD6MSbtz9+I0C+57durvBHXqAK1oScchki4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/gjPq+VtGqMyAx5uOhmiX/uYDdGj2/BayEk8UBg9x5U=;
 b=QipDcYZd90+nUYpdN27gf7RIpZi0puZL2n7kws8qZOxdZ8rZCJvB6Ri32obq7DhP9H
 iXLrLJro2d1HZflTDcxK3Qt1DY17+SvjB9ws5ID3yfJxhYi754lDnjiQISHuOrugUtHN
 kJ6ZDA3eUcsss/h2YNdOJa1B3D6ke11EAsdki1gImKcFJo/ZYsAkcEUP65B7eVWdq82h
 w50Fw42auBDpiaCxark52V9JIcVH5jAyF8JKCdbGl3VYLe2GSAsQgGAO4DQjwfuZS6GE
 q0K25fQnGm/zD5WnGrOwK21IxeIpvOCAU8ZpUhEggKZ1DyRo3lThQAy7Btjmsm5YEMTl
 t3HA==
X-Gm-Message-State: AJIora9WKtiXdNeT1YSwP6A+7Nz4ZM7HPEGa852XSwthsjJJO2bzmNQz
 uOvfhwyK7zGFgRok1wF2zvO+odDhNAYbZqZ87gCn/rzKDpU=
X-Google-Smtp-Source: AGRyM1ssYBzg3aw7EgpsvaBBCDRNrYkf2xVI0tLWP0CzvvlIHFIxz3sX3z3EmX3zGt2Lb4rzOjeEU3+B74yyqCcdFnI=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr942418oap.63.1657309907213; Fri, 08 Jul
 2022 12:51:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Jul 2022 12:51:46 -0700
MIME-Version: 1.0
In-Reply-To: <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
 <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
 <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
 <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 8 Jul 2022 12:51:46 -0700
Message-ID: <CAE-0n51YV7Oo1HSsoyL-9F=h_wVZh210cScB55qLDD9CM2vXKg@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-07-08 12:38:09)
> + kuogee
>
> On 7/8/2022 12:27 PM, Stephen Boyd wrote:
> >
> > Yes I see the same address for P1 on sc7280. Maybe it's a typo? Abhinav,
> > can you confirm?
>
> P1 block does exist on sc7280 and yes its address is same as the address
> mentioned in sc7180. So its not a typo.

Thanks!

>
> Yes, we are not programming this today but I would prefer to keep this
> as optional.
>
> I did sync up with Kuogee on this change this morning, we will check a
> few things internally on the P1 block's usage as to which use-cases we
> need to program it for and update here.
>
> The idea behind having this register space listed in the yaml is thats
> how the software documents have the blocks listed so dropping P1 block
> just because its unused seemed wrong to me. Optional seems more appropriate.
>

It doesn't sound optional on sc7180 or sc7280. It exists in the
hardware, so we should list the reg property. My understanding of
optional properties is for the case where something could be different
in the hardware design, like an optionally connected pin on a device.
