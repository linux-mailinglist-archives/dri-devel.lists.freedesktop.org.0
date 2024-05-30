Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FA8D422D
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 02:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923B311A9D4;
	Thu, 30 May 2024 00:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uDGiKs8V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBC311A9D4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 00:02:14 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-df4dda88ce9so194340276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 17:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717027333; x=1717632133; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NvCvENUTAje0d0xqX/6uhzjSsEvx44+QZd9MHY//obs=;
 b=uDGiKs8VEw9Ekd9cUF/kg8dLx03y8hUCDXbzz9gjPFD6uGzgZVD2VAHBn79z6PbxBb
 TxCqVYnXJ63LbxRJmdSggVcf+otggvcm+tru1uEYcCOB5ohruMKshgA3qHAEFWSR5PYp
 wQtdt3uUafVDY/1jIApCHAPKzH3TFm4/XqfRLyQfjXyxI2/FpZOWoFNGkn6MwbFrjmf4
 UFCA9PtzHKJxIpFwUmRpx3LkKXAB93sAzCjz7g3Pi8EStqgpu9Fnmx18JMDSMwBErkcr
 zWZTd7CllWmr4GyoRTIPVMncuBJZ+ALqbse0hP2xQSHJNHhluN3so/o4quGq1FJSLMPr
 kLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717027333; x=1717632133;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NvCvENUTAje0d0xqX/6uhzjSsEvx44+QZd9MHY//obs=;
 b=Hx8wP/joi4uLlG/GQqNdqEEuzWiLFZfN3Y6rDs63nYxbUfl15HMUnfU67iHMGYc5kZ
 2FhEdcdgGn44qG44YkX7m956AHsHXfoneoAC5qjWhje4F73JC+AOS/ll8P+ybSUuEX2H
 /AD0dFjiOeExzZtURhGAPV7MN1xQrrHOzZeT5FKZpunq8s9H/mkSBHLMv8iG6R7ktPuK
 kUdOU/GIsFc/uwKizRHuTm0YCuJPU24dOkL5NKJ8b3DxAfVH7xdlUlhAvSTjK7pUkGGR
 LFlNiuR4PKvOuLP4d+19l+GJjSL7O3O24TlSx5pNgEOHFc9I8SZwhmyByiC4D5W9UqOJ
 1sIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx36+Cse9GUxfE0fICDFGbfySb95uvJnOUYO4ClkduV3XAAYY1o4i8qykUvstDtTRG4apTfgr/ESRx7uMzr45u69Qf+6Kfq/YCIysfJnpy
X-Gm-Message-State: AOJu0YxTC5DrgmYLGWtg6m6atFPrk2xA/s3Ei/oV8JBRtAcR7eLAtpQd
 sddVKFqLv3bqHwE+EjJ7QF3ARh7dOZTZvY4CWQLDuJvcrgfSN3bxSloVH0VFODan7HhhWGzf70d
 qdaTH3nS/7tK5oz64nVilllr8BtSpWcTv3CjAKA==
X-Google-Smtp-Source: AGHT+IFYdmWW4XyzEhR7RCeL4FHY44Ivo2xAE6JFSy0L1b8dhxbY9b8I0NwrBrauh28gxmwFWEo6F4Fb0cO/TGYIWIU=
X-Received: by 2002:a25:838c:0:b0:df7:7065:24c5 with SMTP id
 3f1490d57ef6-dfa5a7ce236mr684804276.62.1717027333333; Wed, 29 May 2024
 17:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
 <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
 <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
 <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
 <d1a9be5d-b0a0-73bc-c66f-6d45049fbaf1@quicinc.com>
In-Reply-To: <d1a9be5d-b0a0-73bc-c66f-6d45049fbaf1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 02:02:02 +0200
Message-ID: <CAA8EJppFZQTghtyweGG_8zSqqZpEp=ho0bXuRxgyU2qGL4+ppA@mail.gmail.com>
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

On Thu, 30 May 2024 at 00:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/23/2024 2:58 AM, Dmitry Baryshkov wrote:
> > On Thu, 23 May 2024 at 02:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/22/2024 1:05 PM, Dmitry Baryshkov wrote:
> >>> On Wed, 22 May 2024 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> >>>>> Command mode panels provide TE signal back to the DSI host to signal
> >>>>> that the frame display has completed and update of the image will not
> >>>>> cause tearing. Usually it is connected to the first GPIO with the
> >>>>> mdp_vsync function, which is the default. In such case the property can
> >>>>> be skipped.
> >>>>>
> >>>>
> >>>> This is a good addition overall. Some comments below.
> >>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>     .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
> >>>>>     1 file changed, 16 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> >>>>> index 1fa28e976559..c1771c69b247 100644
> >>>>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> >>>>> @@ -162,6 +162,21 @@ properties:
> >>>>>                     items:
> >>>>>                       enum: [ 0, 1, 2, 3 ]
> >>>>>
> >>>>> +              qcom,te-source:
> >>>>> +                $ref: /schemas/types.yaml#/definitions/string
> >>>>> +                description:
> >>>>> +                  Specifies the source of vsync signal from the panel used for
> >>>>> +                  tearing elimination. The default is mdp_gpio0.
> >>>>
> >>>> panel --> command mode panel?
> >>>>
> >>>>> +                enum:
> >>>>> +                  - mdp_gpio0
> >>>>> +                  - mdp_gpio1
> >>>>> +                  - mdp_gpio2
> >>>>
> >>>> are gpio0, gpio1 and gpio2 referring to the vsync_p, vsync_s and vsync_e
> >>>> sources?
> >>>
> >>> No idea, unfortunately. They are gpioN or just mdp_vsync all over the
> >>> place. For the reference, in case of the SDM845 and Pixel3 the signal
> >>> is routed through SoC GPIO12.
> >>>
> >>
> >> GPIO12 on sdm845 is mdp_vsync_e.
> >>
> >> Thats why I think its better we use mdp_vsync_p/s/e instead of mdp_gpio0/1/2
> >
> > Sure. This matches pins description. Are you fine with changing
> > defines in DPU driver to VSYNC_P / _S / _E too ?
> >
>
> Sorry for the delay in responding.
>
> As per the software docs, the registers still use GPIO0/1/2.
>
> Only the pin descriptions use vsync_p/s/e.
>
> Hence I think we can make DPU driver to use 0/1/2.

OK, what about the DT? I like the vsync_p/_s/_e idea.

>
> >>
> >>>> In that case wouldnt it be better to name it like that?
> >>>>
> >>>>> +                  - timer0
> >>>>> +                  - timer1
> >>>>> +                  - timer2
> >>>>> +                  - timer3
> >>>>> +                  - timer4
> >>>>> +
> >>>>
> >>>> These are indicating watchdog timer sources right?
> >>>
> >>> Yes.
> >>>
>
> ack.
>
> >>>>
> >>>>>         required:
> >>>>>           - port@0
> >>>>>           - port@1
> >>>>> @@ -452,6 +467,7 @@ examples:
> >>>>>                               dsi0_out: endpoint {
> >>>>>                                        remote-endpoint = <&sn65dsi86_in>;
> >>>>>                                        data-lanes = <0 1 2 3>;
> >>>>> +                                   qcom,te-source = "mdp_gpio2";
> >>>>
> >>>> I have a basic doubt on this. Should te-source should be in the input
> >>>> port or the output one for the controller? Because TE is an input to the
> >>>> DSI. And if the source is watchdog timer then it aligns even more as a
> >>>> property of the input endpoint.
> >>>
> >>> I don't really want to split this. Both data-lanes and te-source are
> >>> properties of the link between the DSI and panel. You can not really
> >>> say which side has which property.
> >>>
> >>
> >> TE is an input to the DSI from the panel. Between input and output port,
> >> I think it belongs more to the input port.
> >
> > Technically we don't have in/out ports. There are two ports which
> > define a link between two instances. For example, if the panel
> > supports getting information through DCS commands, then "panel input"
> > also becomes "panel output".
> >
>
> The ports are labeled dsi0_in and dsi0_out. Putting te source in
> dsi0_out really looks very confusing to me.

dsi0_in is a port that connects DSI and DPU, so we should not be
putting panel-related data there.

I see two ports: mdss_dsi0_out and panel_in. Neither of them is
logical from this point of view. The TE source likewise isn't an input
to the panel, so we should not be using the panel_in port.

>
> >>
> >> I didnt follow why this is a link property. Sorry , I didnt follow the
> >> split part.
> >
> > There is a link between the DSI host and the panel. I don't want to
> > end up in a situation when the properties of the link are split
> > between two different nodes.
> >
>
> It really depends on what the property denotes. I do not think this
> should be the reason to do it this way.

It denotes how the panel signals DPU that it finished processing the
data (please excuse me for possibly inaccurate description). However
there is no direct link between the panel and the DPU. So we should be
using a link between DSI host and the panel.

>
> >>
> >> If we are unsure about input vs output port, do you think its better we
> >> make it a property of the main dsi node instead?
> >
> > No, it's not a property of the DSI node at all. If the vendor rewires
> > the panel GPIOs or (just for example regulators), it has nothing to do
> > with the DSI host.
>
> Ack to this.
>
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
