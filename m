Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10DC752747
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 17:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418CA10E6FE;
	Thu, 13 Jul 2023 15:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB0A10E6FE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 15:34:34 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-44358c019ddso373090137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689262473; x=1691854473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8yGwM2jMm6HeybAOlBLR6sZSi/DPAG/Mi6HWsPsP/EI=;
 b=lOgFlERPhwtGjicLF2QHVlqBk2xSDjijmmistC6wxT3hqdtQKIp2OgtKqSDsPAiizS
 wYQJQbXgXaCcxecOQofQ0NQysSDneQdw+H/6NYICtdMdrXApRr/VJmoKQm7+lqxz5CU9
 7HKYEPG6Y7/vU/zy5asXo1RDZ57mV1rxJ4y90qbj11a79ceBVOuzDB33KSgDy0rN+mwi
 0a9Ii2XIlGFExp3+2n6C/bBF8rtotem8PhWb1HeJSt7j+04dznqXCjeaK4i/v9L+b0pf
 7gqFXvkVYT0gF2Gi1kf5amM7r4mq+0iDjg8T1vwPyROs/edZA8/yCHdovfdf9v1AbJiH
 JfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689262473; x=1691854473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8yGwM2jMm6HeybAOlBLR6sZSi/DPAG/Mi6HWsPsP/EI=;
 b=d9ManTzue1BQCrHirBN81drycsWS522/8SewjWkjTPPZkwYzWw+j+R/TjR6Ev3r7Pz
 kQz/7nLHJvmdvxfm8vRs8/J0wiVagl2zLn/3wGk5vnPpQ5yBseM+tqguIdoJZ7acttWB
 advX7ioX1ZKZPpqJRDVOE1/pgVGVi1m/WfxfFTXmUkkRvdqXRYZzm0lCqqCEhUbzIA7b
 gjVonfsfkY1DhHqdd0XCGrr4kramuJ+R69WU128GdOmW1QFN0p93ldvHpszS9rh6kg+q
 cGYfo8aw8gUsNWJK3PwnfTRrHnQagYtsceQBEkgNW4LVNTvPSwS8Is7KSpGW/379/Et0
 xjdg==
X-Gm-Message-State: ABy/qLboE+PMp4PPUhKPkzJaI9sMq71Hl+TvZhkjpiNOwjXLmDS8y4x8
 jYrDMWoPzF0j13jXlcbSRQ/ETyDpRyS9ONK2/neTaw==
X-Google-Smtp-Source: APBJJlGb1jVO/ngXjXmOiFV9ZYbghh/vfhZZW7PYWNC1fUiGbkak2hA/lfD7wwvwjJJq8+zZv1gdSRqmyIer2LH0nno=
X-Received: by 2002:a05:6102:389:b0:444:c7fa:1aad with SMTP id
 m9-20020a056102038900b00444c7fa1aadmr1171134vsq.17.1689262472963; Thu, 13 Jul
 2023 08:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230712130215.666924-1-amit.pundir@linaro.org>
 <3b677200-a201-680b-391f-fbf73064496a@linaro.org>
In-Reply-To: <3b677200-a201-680b-391f-fbf73064496a@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 13 Jul 2023 21:03:56 +0530
Message-ID: <CAMi1Hd003r1kJ6e4r2urFtN1BEnCRatLcQ1Q7Eh5wBdj=2WDFA@mail.gmail.com>
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

On Wed, 12 Jul 2023 at 18:45, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/07/2023 16:02, Amit Pundir wrote:
> > Add and document the reserved memory region property
> > in the qcom,sdm845-mdss schema.
> >
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
> >   .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > index 6ecb00920d7f..3ea1dbd7e317 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > @@ -39,6 +39,11 @@ properties:
> >     interconnect-names:
> >       maxItems: 2
> >
> > +  memory-region:
> > +    maxItems: 1
> > +    description:
> > +      Phandle to a node describing a reserved memory region.
> > +
>
> Please add it to mdss-common.yaml instead

mdss-common.yaml didn't like this property at all and
I ran into a lot of new dtbs_check warnings:
https://www.irccloud.com/pastebin/raw/pEYAeaB1

I need some help in decoding these please.

Regards,
Amit Pundir

>
> >   patternProperties:
> >     "^display-controller@[0-9a-f]+$":
> >       type: object
>
> --
> With best wishes
> Dmitry
>
