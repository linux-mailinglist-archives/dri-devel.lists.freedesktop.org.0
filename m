Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6208C56C10F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 21:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE6210E117;
	Fri,  8 Jul 2022 19:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A3210E05A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 19:24:31 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id w83so28162758oiw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 12:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=WEH0jKAhMg/R/ZAtXcmhJHyQlTHAR3FwpDaho4cHgOY=;
 b=InH2K7dH2NjuGoaeuhMHZJKkEoIt8KoqlBs0E+Q3TTBS5RZRETLKTZRZT3Y0z2Gv/r
 2khUzoWLTbkefDeaKsc6pHYPsvYpONGBlM58vaEqm98vTDeKmrMelIOsi+LNxKzJ++6F
 HaSvWuREHYxyFwh4AjtzoLhPQruLwmmGLLxKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=WEH0jKAhMg/R/ZAtXcmhJHyQlTHAR3FwpDaho4cHgOY=;
 b=2PpIlwANzIHpoF9ab12IY5h2W2Xv7oFqHEJ+eAJtdfNS6t5AyuXENTYeEAfCG9Y5Wq
 s/kWG+mqTGbeMR2Rh5yfJ6zkSFI5Sj5iUgIla4c0Dh5OOsD/UT/N6vL5js9NxXC0C/AC
 GMj6LLs3J4C1amkbLsxgpjYJmivUAMhRwOwkdC4FMPH80Naw5XOCp6Fbjxc/6B4aNn92
 UzDjG9Pd+R3kSJu7i6nV7my9uuGI2DPq5gUh1TpxxplNEdLSuzFVHWMHp0m3W2LhTwOW
 KazH1DD5D6zlLxyushTXJT1Hsaf0tmvBFLURkV5wd5JRwivEZvbOZAKg+nA5sv5h3ZeA
 ZCCg==
X-Gm-Message-State: AJIora/UUdAyFe2JguMYWzh1mnqmCX1DyyOQ935FTLoARVDX3OhFPgQT
 K0pRucKwmGbYZCnAVh4ecbp9Dxy0sH6wuGzjfW0Aew==
X-Google-Smtp-Source: AGRyM1ux2p5+c4xtdy4iOeVBnPoqwt4uYj+n6OsML6osTpvAhyLCATU4q8jvRdoE/W3LIwJY4+8mxYJs/1atXzH8xbs=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr831806oib.63.1657308270538; Fri, 08
 Jul 2022 12:24:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Jul 2022 12:24:29 -0700
MIME-Version: 1.0
In-Reply-To: <36a3490f-5c94-0c54-caa4-1b381dae7745@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-6-dmitry.baryshkov@linaro.org>
 <CAE-0n53An_S5H-jj7GPorLg0Q4jW=KqEn5CCrfqs6fn6LBtGNA@mail.gmail.com>
 <36a3490f-5c94-0c54-caa4-1b381dae7745@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 8 Jul 2022 12:24:29 -0700
Message-ID: <CAE-0n53GJANJT5uXzffPqFZuKu4YkzfrhyaCL15vq1VQrDzSag@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: msm/dp: account for clocks specific for
 qcom, sc7280-edp
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

Quoting Dmitry Baryshkov (2022-07-07 20:59:02)
> On 08/07/2022 04:32, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2022-07-07 14:32:00)
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> index f00eae66196f..1ef845005b14 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> @@ -119,6 +111,50 @@ required:
> >>     - power-domains
> >>     - ports
> >>
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - qcom,sc7280-edp
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: XO clock
> >
> > What is this for? I would guess it's for the eDP phy, but that isn't
> > part of the eDP controller, so probably it can be removed.
>
> Good question. I was documenting what is present in the sc7280-edp
> controller DT entry. Could you please check if we can drop them? I don't
> have the hardware at hand.
>

eDP works fine without those two clks on CRD (hoglin). They can be
dropped from the dtsi file.
