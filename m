Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978308CCFC1
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 11:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2108310E13B;
	Thu, 23 May 2024 09:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="akjktMtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1908B10E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 09:58:20 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-620390308e5so22765597b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716458299; x=1717063099; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y1sOYJIvzvzoC2yvl9zoEh4JKtXSdU2JwzVDJiDmqfo=;
 b=akjktMtUs7igTwFVFWeoxbOrun/mpAa2pF8lQmofCkter4PikyOaBQ4j284SqaU4I1
 36yiiyXvW56fRovNVfEbyROk3px0YzHk7B6sF77JTFYiIN5BTHT/pvhDok3B15U5+6Oj
 ilCO5SFIKC4a58Ydu1BpbLvqPDvx0iN1Cr0n1cGPh/GKS/zDVSsK2/532I1E1I06v7po
 yv6nAO+bmcKXyYpuqQWKKv9OAgz7ZbwEAFX4ZBTibNBHh97ujeFKpVJCIZMzskOnWhMp
 C+cM9szVrv3CPVJXI8r+x+yT2FpkfqLPbv6EcIqmAYwy3PnXJwV6BzxUCBKTTQu3LxWP
 A3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716458299; x=1717063099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y1sOYJIvzvzoC2yvl9zoEh4JKtXSdU2JwzVDJiDmqfo=;
 b=Q4okC0dv6zJ5mH/Zv2Ede6QW+RnGp16dvQxFhBEM9BkBjUDZULqW7BDUzFjVCOfDwl
 zjTyQ/gGdghz+HYl+ofUfSTSr3vMSYLS8ARQdvva26nTAC8Be99zoghbd1aJ7wgYXbwt
 7YWnT/+i5n/PSjHgItWVNS0ON0g7Hg/J4vdiy6KTUKRmRqxUOakYckFNKzqxungBiMyv
 nC14p0f0FGSTpwI37i45A+vo2YEZa7PAOVkUQ9gofBTbXAbc2iayXO8dUy7zlKz5r+QI
 nUY+oAs6LoeAAw9ehHHksRLR+xUsQRoYJ38h/ZxQ7zfDK2zPiupwhDlx6vT+Oqv6UGhO
 GOxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM71YoYxz0WVssM9Rjzop1q5vtbgnBg3qi1qEBabmSf94iYzmtTkvFpxOn+IvENajaoyRExq75jlzD100TgpkEGBBXPAdbfZGZsRaqNK6+
X-Gm-Message-State: AOJu0Yx6a3Kupq8ahdUZvLz12XHZUMUJrle+jObI+wcyDRLST9360QoY
 yg0dM9bv7Oj6lBFXd5EKJSTyenIfgB1Fm1KmASwpNv89MWNk7JG4trbUdy4nnHYwTmrGmpZnt+R
 hxdxh/2ffbD1pDiNAj/Ubx8hyps0BDaHpsQ4GmQ==
X-Google-Smtp-Source: AGHT+IFSx7eH9OK/hI8iq0vTScgxcbZqJWA8/FXYjaRvJCffCTFJs80i56nCHfpAt38cyIIYw5RoPljn2ZLPu/XiJlY=
X-Received: by 2002:a0d:e206:0:b0:61b:3304:cdc7 with SMTP id
 00721157ae682-627e4824bc6mr43478167b3.29.1716458298915; Thu, 23 May 2024
 02:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
 <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
 <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
In-Reply-To: <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 May 2024 12:58:07 +0300
Message-ID: <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
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

On Thu, 23 May 2024 at 02:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/22/2024 1:05 PM, Dmitry Baryshkov wrote:
> > On Wed, 22 May 2024 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> >>> Command mode panels provide TE signal back to the DSI host to signal
> >>> that the frame display has completed and update of the image will not
> >>> cause tearing. Usually it is connected to the first GPIO with the
> >>> mdp_vsync function, which is the default. In such case the property can
> >>> be skipped.
> >>>
> >>
> >> This is a good addition overall. Some comments below.
> >>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
> >>>    1 file changed, 16 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> >>> index 1fa28e976559..c1771c69b247 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> >>> @@ -162,6 +162,21 @@ properties:
> >>>                    items:
> >>>                      enum: [ 0, 1, 2, 3 ]
> >>>
> >>> +              qcom,te-source:
> >>> +                $ref: /schemas/types.yaml#/definitions/string
> >>> +                description:
> >>> +                  Specifies the source of vsync signal from the panel used for
> >>> +                  tearing elimination. The default is mdp_gpio0.
> >>
> >> panel --> command mode panel?
> >>
> >>> +                enum:
> >>> +                  - mdp_gpio0
> >>> +                  - mdp_gpio1
> >>> +                  - mdp_gpio2
> >>
> >> are gpio0, gpio1 and gpio2 referring to the vsync_p, vsync_s and vsync_e
> >> sources?
> >
> > No idea, unfortunately. They are gpioN or just mdp_vsync all over the
> > place. For the reference, in case of the SDM845 and Pixel3 the signal
> > is routed through SoC GPIO12.
> >
>
> GPIO12 on sdm845 is mdp_vsync_e.
>
> Thats why I think its better we use mdp_vsync_p/s/e instead of mdp_gpio0/1/2

Sure. This matches pins description. Are you fine with changing
defines in DPU driver to VSYNC_P / _S / _E too ?

>
> >> In that case wouldnt it be better to name it like that?
> >>
> >>> +                  - timer0
> >>> +                  - timer1
> >>> +                  - timer2
> >>> +                  - timer3
> >>> +                  - timer4
> >>> +
> >>
> >> These are indicating watchdog timer sources right?
> >
> > Yes.
> >
> >>
> >>>        required:
> >>>          - port@0
> >>>          - port@1
> >>> @@ -452,6 +467,7 @@ examples:
> >>>                              dsi0_out: endpoint {
> >>>                                       remote-endpoint = <&sn65dsi86_in>;
> >>>                                       data-lanes = <0 1 2 3>;
> >>> +                                   qcom,te-source = "mdp_gpio2";
> >>
> >> I have a basic doubt on this. Should te-source should be in the input
> >> port or the output one for the controller? Because TE is an input to the
> >> DSI. And if the source is watchdog timer then it aligns even more as a
> >> property of the input endpoint.
> >
> > I don't really want to split this. Both data-lanes and te-source are
> > properties of the link between the DSI and panel. You can not really
> > say which side has which property.
> >
>
> TE is an input to the DSI from the panel. Between input and output port,
> I think it belongs more to the input port.

Technically we don't have in/out ports. There are two ports which
define a link between two instances. For example, if the panel
supports getting information through DCS commands, then "panel input"
also becomes "panel output".

>
> I didnt follow why this is a link property. Sorry , I didnt follow the
> split part.

There is a link between the DSI host and the panel. I don't want to
end up in a situation when the properties of the link are split
between two different nodes.

>
> If we are unsure about input vs output port, do you think its better we
> make it a property of the main dsi node instead?

No, it's not a property of the DSI node at all. If the vendor rewires
the panel GPIOs or (just for example regulators), it has nothing to do
with the DSI host.

--
With best wishes
Dmitry
