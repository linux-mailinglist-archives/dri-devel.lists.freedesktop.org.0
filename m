Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D3D752909
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFF710E042;
	Thu, 13 Jul 2023 16:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBE710E060
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 16:48:39 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-765942d497fso81780085a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689266918; x=1691858918;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zuZZdpDlXu2E+ps9F16vASGwEyrMSuGUChzbHgZ0Zbs=;
 b=Ogwo7zVaqznAygJZ64nNImcrzVqyHaNv1JhPNxCXMoYrn0vRt8xhbcP4qLsA/hHaCr
 6YqgywJHZLKtAZ3Xi+JFu9W82Iv59mNGnx8UQgHPfUIKlB7cq+ZRuGSIwskgs+8PP0me
 bCLT31PX1RJOdqyTZl490fK+v4f/x9LBvXlVA5Vqkp357+/ru6ASnkg3+S+pzWdXeWQj
 khN23h7A6iGMRVSJ29G8BsWlwtUAnE0s1RlbPMuoDi13f50rIIiIwJ5/R6WUJ46U9Bpp
 8Hk99ouZpIetg22Y1sn+jcXCPABe0lcId4t3tBbtC3K2fTu6Gbl7aVyMWW/FMOXNjKKc
 1f6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266918; x=1691858918;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zuZZdpDlXu2E+ps9F16vASGwEyrMSuGUChzbHgZ0Zbs=;
 b=lc6B9C0DhyWqhCI3+OfrbyTjg6e80HYm/k+wElmpYTW+YK0H55t4hSWN2yFc2LuJ2M
 TrL5qBEGpIuWaD1Gd6yjt4KeedCHTSI7ecaT9aYW7xTzYXHfqUmFsGb9fOW/PhMRXjW9
 MledUz0eLe5wvQb0JlA7b+2AC8OqE7rF2ZWLQB+DfMrz4V4FlLYMQVjX5UxyEmZ81SFT
 1Csuhb67PH9OsvdHaRSkZ3m3LPyiCFA5z/iQrns8dHb9q/oKg1Cq8dKEI+icbtrdqZcz
 O6+nDniyBx6O1QkgFVtvOUlNdYWAifkUYIG0/oFuKBaewpQOuehjRFZgtnG1KQbF1qcL
 mviQ==
X-Gm-Message-State: ABy/qLbc5XKuxW1EFr+ZWmBBWJeIW3Ym8Ikne2xh9jHVeaXMGOmo3K6J
 CjGbXdTQSuGp4CNIZEy16HYi3l61n/6G0wHs5v0Cag==
X-Google-Smtp-Source: APBJJlHZwOI2tfJYeqnIeiHgdRI9RlwmUCq3/HcwtNHtwOl/71PhsX6rco20RR1e9u0i0qN9ydSDmR92GEl8DF+4B7U=
X-Received: by 2002:a0c:e0c9:0:b0:635:dfe1:c203 with SMTP id
 x9-20020a0ce0c9000000b00635dfe1c203mr1754444qvk.64.1689266918558; Thu, 13 Jul
 2023 09:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230712130215.666924-1-amit.pundir@linaro.org>
 <3b677200-a201-680b-391f-fbf73064496a@linaro.org>
 <CAMi1Hd003r1kJ6e4r2urFtN1BEnCRatLcQ1Q7Eh5wBdj=2WDFA@mail.gmail.com>
 <CAA8EJpp6yprRL3qzM9pHt2uJ6sb-nPhwas5qm9aDthegSaw7DQ@mail.gmail.com>
In-Reply-To: <CAA8EJpp6yprRL3qzM9pHt2uJ6sb-nPhwas5qm9aDthegSaw7DQ@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 13 Jul 2023 22:18:02 +0530
Message-ID: <CAMi1Hd14Y4bByO9abr-nFppS2m5CiSyLVQ9ev7+bx55rRL5GjA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: qcom,sdm845-mdss: add
 memory-region property
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Conor Dooley <conor+dt@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>,
 dt <devicetree@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Jul 2023 at 21:13, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 13 Jul 2023 at 18:34, Amit Pundir <amit.pundir@linaro.org> wrote:
> >
> > On Wed, 12 Jul 2023 at 18:45, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On 12/07/2023 16:02, Amit Pundir wrote:
> > > > Add and document the reserved memory region property
> > > > in the qcom,sdm845-mdss schema.
> > > >
> > > > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > > > ---
> > > >   .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > > > index 6ecb00920d7f..3ea1dbd7e317 100644
> > > > --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > > > @@ -39,6 +39,11 @@ properties:
> > > >     interconnect-names:
> > > >       maxItems: 2
> > > >
> > > > +  memory-region:
> > > > +    maxItems: 1
> > > > +    description:
> > > > +      Phandle to a node describing a reserved memory region.
> > > > +
> > >
> > > Please add it to mdss-common.yaml instead
> >
> > mdss-common.yaml didn't like this property at all and
> > I ran into a lot of new dtbs_check warnings:
> > https://www.irccloud.com/pastebin/raw/pEYAeaB1
> >
> > I need some help in decoding these please.
>
> I'm not sure what happened there (and it's hard to understand without
> seeing your patch).

Yup.. It was my broken patch. I used "For example:" in the property
description and it tripped off the checks. Didn't realise that
casually used ":" can break yaml parsing until now. Sorry for all the
noise.

Regards,
Amit Pundir

> But after applying your patch to mdss-common.yaml,
> `make dt_binding_check' passes:
>
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index ccd7d6417523..924fe383e4a1 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -77,6 +77,11 @@ properties:
>      items:
>        - description: MDSS_CORE reset
>
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to a node describing a reserved memory region.
> +
>  required:
>    - reg
>    - reg-names
>
>
> >
> > Regards,
> > Amit Pundir
> >
> > >
> > > >   patternProperties:
> > > >     "^display-controller@[0-9a-f]+$":
> > > >       type: object
> > >
> > > --
> > > With best wishes
> > > Dmitry
> > >
>
>
>
> --
> With best wishes
> Dmitry
