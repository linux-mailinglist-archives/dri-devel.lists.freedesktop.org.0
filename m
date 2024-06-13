Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA1907B46
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 20:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6804C10EB55;
	Thu, 13 Jun 2024 18:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NuOPisBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB8110EB55
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 18:28:48 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-630de00f3a6so13844287b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718303327; x=1718908127; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U+WGFNDC6mtg/f9cHnSYOLXVNUvNyEN8oDHQ1rCjvO4=;
 b=NuOPisBzDbeW29t+dbrJk+qoL/JF5iF1ReNxLg1127zx68It68K9NXpbyqZhBPzaVW
 GiObl4pHdAi1MJzqtXrxZ+aiaBzJHA4eRB0NVh43K6/4Dkdp5Zlv7Kyjf9p5nXUJOzjL
 UFXcHTTrq1bnQ8VwwmbsDqxx/IsUXxnUcxDlB2k37qbefvmI7JgAWz+fd8SV5TSH1ksR
 +knx/II626hymH/NeBGAD7dOh0S+FPehmN+1F+RP7A+qqNfVxlu+oua5Ia05U5nwaVHv
 24lrX6X3MyLxY0shxsNfG4CrUBj57W87TxL6vS4zqu87bg87w+W2eeGa7achG00hECfu
 M1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718303327; x=1718908127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U+WGFNDC6mtg/f9cHnSYOLXVNUvNyEN8oDHQ1rCjvO4=;
 b=hbs5lfGY/2bh1rhC0LnK0e9IXigu2puIGapAv4mySWUxdE4n4O0h44fGMqHPds2N5s
 fGbqQxdqnOdfVPGlKJBQbw5RoZRbY8eqnAKASTilSliLWTVM/j/MtGRT5M2k6RQVgEJP
 oZgwBb2yCcVGoPKpRPntneIci+lvMgcI3XYwBxU+DYSFhr2v/V3x1cOSTUTrWw7Lzg25
 BD48Mr7Xo4VE/7Itwn7rj8kkF6GdgSpkSpHWdf5cj/GEqT7/iT409PuKmCG22ymiO6SB
 J1+xAMoQEu7WSrbqS5DbYnFORLZtA+r122sKe9gitaF9phVJW9ZVIBrhKU5U6cN5Dhg0
 TYVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5kg4uV/k2hh2I3NhL1eqZpfwLCyGlCsSpeg3/osfBHIDI2zeZ4x2dYv6PPwOx48I8ERx26v6bc02CvQ9+8QC67Ado4eQpYP8Fczn2QGTf
X-Gm-Message-State: AOJu0YwEZpVcbaEZXi4VEYimkHMRWHHF0OGDuXNstFLpRqIRPfn6dqDH
 fRJVzsK5RxOSP/2+wK61qfVRFpuJv4E6yeKBaIHFMs97ObPsuH0H7lf89QfT/QF3IaAVFLqP5I9
 DKsg2moRJ350sCDsqVE7M/0WBygAY5h0pIj9gWg==
X-Google-Smtp-Source: AGHT+IG/LogtiqjFGi3ralediT2FCQjdnE/2k+qtPlJDqZS6gSIOLoajvxRo0WA2CCSBHqASlSsXhclFFYUs/1jkrbE=
X-Received: by 2002:a25:accb:0:b0:dfa:7513:59d7 with SMTP id
 3f1490d57ef6-dff15500d87mr278860276.65.1718303327456; Thu, 13 Jun 2024
 11:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-1-67a0116b5366@linaro.org>
 <y2zzgi4m377rziplwtycijbbdqaaqgyenlrv6v43bpkkt6247y@2uen44jhbv5v>
In-Reply-To: <y2zzgi4m377rziplwtycijbbdqaaqgyenlrv6v43bpkkt6247y@2uen44jhbv5v>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 21:28:36 +0300
Message-ID: <CAA8EJpqrJFAaS86s5S4uV_3b9h8Pi1rTE1KxOyvMSbrho4oQyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm/dsi: allow specifying TE
 source
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Thu, 13 Jun 2024 at 21:16, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2024-06-13 20:05:04, Dmitry Baryshkov wrote:
> > Command mode panels provide TE signal back to the DSI host to signal
> > that the frame display has completed and update of the image will not
> > cause tearing. Usually it is connected to the first GPIO with the
> > mdp_vsync function, which is the default. In such case the property can
> > be skipped.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/display/msm/dsi-controller-main.yaml       | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > index 1fa28e976559..e1cb3a1fee81 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > @@ -162,6 +162,22 @@ properties:
> >                  items:
> >                    enum: [ 0, 1, 2, 3 ]
> >
> > +              qcom,te-source:
> > +                $ref: /schemas/types.yaml#/definitions/string
> > +                description:
> > +                  Specifies the source of vsync signal from the panel used for
> > +                  tearing elimination.
> > +                default: mdp_vsync_p
> > +                enum:
> > +                  - mdp_vsync_p
> > +                  - mdp_vsync_s
> > +                  - mdp_vsync_e
>
> When discussing that these should be renamed, was it also documented what the
> suffix means?  I can only guess something like primary/secondary/e...?

external. Note, these names match the name in the datasheets.

>
> Are the mdp_intfX variants missing here that you're handling in patch 7/8?

I didn't test them, so I didn't document them.

>
> > +                  - timer0
> > +                  - timer1
> > +                  - timer2
> > +                  - timer3
> > +                  - timer4
> > +
> >      required:
> >        - port@0
> >        - port@1
> > @@ -452,6 +468,7 @@ examples:
> >                            dsi0_out: endpoint {
> >                                     remote-endpoint = <&sn65dsi86_in>;
> >                                     data-lanes = <0 1 2 3>;
> > +                                   qcom,te-source = "mdp_vsync_e";
> >                            };
> >                    };
> >             };
> >
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
