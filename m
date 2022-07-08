Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F7C56C112
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 21:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82A210E09F;
	Fri,  8 Jul 2022 19:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A98110E05A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 19:27:27 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10c0430e27dso18933036fac.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 12:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=nb54qYULM0vTsfoEr7Cgmm5gQnfLelqJiQLdthiv74w=;
 b=D/+DcpfH0jUz0UsYC43QGWVbL2V/iV2tPM39nWkKun2O+TzQU/iFYfFp6BL8IVrVlp
 bpz79YOq5TrNK3DqJAz16WF8vfx7cBZ/oBPPAI/PkBna+a2odWqP2EG5Bv8/kdTy8nhz
 JqMdy0IYlsCuop0krC1KCGQTDnSFLM71u6XhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=nb54qYULM0vTsfoEr7Cgmm5gQnfLelqJiQLdthiv74w=;
 b=zAss/Q2xHkfGsOVd9bETW/rPP3nxBESRaYdWZhDqG4bgtyy3/MEuPkJBABHDpxFrkQ
 G4g2hJEttf1wHC0zV/oFbMU4BiemQM7HyQcrnP1jkDUZeyNXVlodVgod/nBxzYK+Rxyv
 pl/km8iPwMIYqPcRiaAByS0b6lWyrDhK2WW2cfP8vUObsZFUhLQ8aMhH1WO3ckqYrSBL
 IMxDC0oQQw8rsnqviO6Bj8seuvVsdn9kPlOqPSROBHj9P96HC4U44TgeHUovFtjZQzSn
 7DE4bADdiQIcyGOjL77eEh4AT3XSYaQKHisKl8K6FgajmJBHwAGLQ6xNGgh4ODmIeJHg
 bu0Q==
X-Gm-Message-State: AJIora/0MZVpzovHpK2L8rdBjHQJxnqtrat0p2RCZsYRob3vkXVBMKxa
 F4dtR0x+BVKsFOBqkhnp1PNeQR4zu3buPowboS73sw==
X-Google-Smtp-Source: AGRyM1vWz0fkrGew2h/UaZYoqGkwYKUnte/wQFFmA/erT7vfCPThAI2cVqmWJbI4fa7+R6xFCtz07OHf3t06kAfGQCs=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr888548oap.63.1657308446479; Fri, 08 Jul
 2022 12:27:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Jul 2022 12:27:26 -0700
MIME-Version: 1.0
In-Reply-To: <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
 <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 8 Jul 2022 12:27:25 -0700
Message-ID: <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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

Quoting Dmitry Baryshkov (2022-07-07 20:46:43)
> On 08/07/2022 04:28, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
> >> The p1 region was probably added by mistake, none of the DTS files
> >> provides one (and the driver source code also doesn't use one). Drop it
> >> now.
> >
> > Yes, looks like the driver doesn't use it.
> >
> >>
> >> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> index 94bc6e1b6451..d6bbe58ef9e8 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> @@ -29,7 +29,6 @@ properties:
> >>         - description: aux register block
> >>         - description: link register block
> >>         - description: p0 register block
> >> -      - description: p1 register block
> >
> > The p1 registers exist on sc7180. They start where the example starts,
> > at 0xae91400.
>
> Do they exist on e.g. sc7280? In other words, should we add the region
> to the DTS? For now I'm going to mark it as optional.
>

Yes I see the same address for P1 on sc7280. Maybe it's a typo? Abhinav,
can you confirm?
