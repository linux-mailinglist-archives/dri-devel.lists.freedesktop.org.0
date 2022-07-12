Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F35715F8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 11:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58B811B0F1;
	Tue, 12 Jul 2022 09:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C81410FA3F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 09:43:00 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id g9so2173607qvq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YoZBYZy41JFnQOGO3Hk17+jt5jdA+Ko/TmjpBwiSidA=;
 b=Mp56ho49ONCB9YdoaKjrcHN9VWBBj/JQHylIy8Y66ZDWzu6613aEVMlt4rXLr4xbnT
 /EAd5UzTDUYiryhZdDscI62gJ5lqGH6tOEoClYAJwYKjdWHqTtnEzRM7gY5AfpO6KvfJ
 IdcWdko+YQZQjfCIa7XmsgynjbgkayMyaVnVEybhLgR0nwoUN9uHpzAa61o2YvQAROu9
 9XKte3wpeBCxjHFQ+HRDKFbY2VKQMtC6xLwMlqGrDUVx79hrhUrjEhCjDMhlgFb5d3EE
 hPb+EZyqgDTxqoG8689V7XSNtZ2AbdDG+swssRacz8vsQ3qM+byfPSmjl+zwRPTsES5T
 C5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YoZBYZy41JFnQOGO3Hk17+jt5jdA+Ko/TmjpBwiSidA=;
 b=A7fMcdqQQ3BFOOTHj4tOS8K9es2u8HiPwfiRDoXeAp1NOym50vc7l8RCSKEtm9b6en
 u9sVKfiGz2OVzQ7DBxN9/VGzBkRKdcPBEYwr2MGH1OxU06A77gCugGgnS2pWRI2wn0Ek
 ROYPWhmdkwV/yjhR/i2EtzqK4h9WPg3aWRuzFB6wx2JHWBOhKwsCMB5KD4Do7PmaieNu
 N3bP/cE6tzImEQBL1ud2r+tJyqF8x4MBvAOKUCAvmwhtPOQ+QPSZi4R9xKGEAewAZt+J
 pnDenbxh8naK1fBB38TMRcUaQxZha1ohoj42o8/q7MmiGw/niknzqqO4ZM1vJLgv53Rx
 I6kA==
X-Gm-Message-State: AJIora9Zo9tJ6xpsHxTehiLyauHIHSRDCQ0OyOI+yYzI9dXm6y9SjzVf
 s9+tpraZ+z11Nh6JLHwJpAk5FOhw1b+jn8qsCu6dSA==
X-Google-Smtp-Source: AGRyM1tHoH02JA0eu1BvlGmolAYocWBMRLvOM+ZDeFF0Ju9sWVnKd2I++G5vKn9D8D1RhgOguQYeeGDqDOcrYk768oM=
X-Received: by 2002:a0c:8ecc:0:b0:473:2fa4:df7c with SMTP id
 y12-20020a0c8ecc000000b004732fa4df7cmr16692462qvb.55.1657618979170; Tue, 12
 Jul 2022 02:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
 <20220711231638.GA449827-robh@kernel.org>
In-Reply-To: <20220711231638.GA449827-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Jul 2022 12:42:48 +0300
Message-ID: <CAA8EJpoHKewcM3upa9GvNhUyKNC3sjqYa2rA-zQk5m1TpZmAtg@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
To: Rob Herring <robh@kernel.org>
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
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Jul 2022 at 02:16, Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Jul 10, 2022 at 11:41:32AM +0300, Dmitry Baryshkov wrote:
> > Document missing definitions for opp-table (DP controller OPPs), aux-bus
> > (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 391910d91e43..52cbf00df0ba 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -70,9 +70,21 @@ properties:
> >    operating-points-v2:
> >      maxItems: 1
> >
> > +  opp-table: true
> > +
> >    power-domains:
> >      maxItems: 1
> >
> > +  aux-bus:
> > +    $ref: /schemas/display/dp-aux-bus.yaml#
> > +
> > +  data-lanes:
>
> But this is the wrong location for 'data-lanes'. It belongs in an
> endpoint node.

Ack. Then I'll drop this for v3.

>
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 4
> > +    items:
> > +      maximum: 3
> > +
> >    "#sound-dai-cells":
> >      const: 0
> >
> > --
> > 2.35.1
> >
> >



-- 
With best wishes
Dmitry
