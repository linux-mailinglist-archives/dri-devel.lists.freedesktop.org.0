Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7C4A3DEDC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A2410E1B1;
	Thu, 20 Feb 2025 15:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zbd/BCJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9624B10E161
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:40:16 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6f74b78df93so10098797b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 07:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740066015; x=1740670815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UuoPq2e93XPbKnAaHkR9ErZM40sqwUWhuIwAQ7Wv18c=;
 b=Zbd/BCJM9mpLHPzRCFSG1cBnXbEAcD8NKPRBFzfHmjZWli+QpC6N90YWtK2Qr3Mcxd
 88zzTGGPOQFCJLUOg7QIVad+jCnrYRM6y9ZsEu5vb09uB4CLgL32uYK7WuwQo+OnI0Q3
 zIW61Zrg+QbHQAh2ULCAo0WFIanRuuwZ3FI4R1j9p/SEhGdhh/CkKtP6k0eF15MqHiXr
 Jlb8MHUNZz3txc88OuHgbpoGAeBdXk3f6/RhzLlFefRKjkKEn9njqRc8X+lxkYYU7rFX
 AnZ6N8y+ou/4Ai8s3kQ+gR+4XbD3ZqF7Nh2q6HfrvG14r7Ubq4MEclfMv23s+hIrZ0jI
 WyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740066015; x=1740670815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UuoPq2e93XPbKnAaHkR9ErZM40sqwUWhuIwAQ7Wv18c=;
 b=UsP4o2i639yTaNVlw0ov0U9mSvkLdvW1abl1/7s4/ZxRTxkhv8z5KiZx6UNduei9qu
 a0yA1KccgAkF3+awM1UkW5N/NRVSkmdrrPMmiC7tVAR0p74B8m4YYLiGLBHXjikXxHbU
 13tq027uBNdckzKk4WgXoWVCG5ve+YL6LR1CVBTOz9dmAeKltqCMsfczN+WCH1AP2ZVl
 +4sZNo4NgYp+LKuUScwh5NwNMeS8M4d6kj9z74eRRjrSiyn0xPLGOoOJoY3JgTP6macE
 dmp7W/8VXFbe/55VRSORS57u/EreqfkX3BTtrLCIfkj9Go837lyJsPktrhvvqtrXB4Pm
 5ILg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5llfAjW+Qo0XhphsNuZGOe0Hb4wt6gVRU9I329Au+CMg5KEwysrFvS929LnZCMq2KHXIVC+HGruI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0STupM6f09aq8vvl0FEeprLicrOwDlEznT2gCTNq8Iz6nC9Wo
 tXaSd4volYuQIvIZSBsaQpL2G0B9D1n3wv7ll9URp5VTyTr0ekb4DNGVTjfaGqBqqQqNuVE6AaD
 CEmUwbGzZ6QGPsJ6qJIe3rg2a+PxBFk606HPfwA==
X-Gm-Gg: ASbGncu/lXZLzJSkTMkn9WXe5PiVeZDc7QC9vhT160EHCMblQrTomwZxxGkf9CmK4+x
 +HyiLnsr4fAESSoxy1ca4NuhKVsW3gUaZteQdeLO9ErVr3Q6t/6lsawrz5ZLwPQYDK2a0FGe2Au
 sj
X-Google-Smtp-Source: AGHT+IHtHZhFj6w8a+w7dVjeZYWKiittrIVs8CqnEw31ZTbZ6uSF2vKph0PXxTGqAHFiH+3dzNT93tQlYHmsEeOEsb4=
X-Received: by 2002:a05:690c:fcc:b0:6f9:82a8:e5dd with SMTP id
 00721157ae682-6fba579f34dmr76095757b3.29.1740066013981; Thu, 20 Feb 2025
 07:40:13 -0800 (PST)
MIME-Version: 1.0
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-4-6c0038d5a2ef@linaro.org>
 <grdadzunaabzg5jxpsiasgzbioy24tctlhhyxg6zwdkpv5vjwe@7k2di2myu4k6>
In-Reply-To: <grdadzunaabzg5jxpsiasgzbioy24tctlhhyxg6zwdkpv5vjwe@7k2di2myu4k6>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 23:40:03 +0800
X-Gm-Features: AWEUYZnHnOuixko96mQ2117kijVCx6xdBgICQdXQ3HuBcopAGGxNVlm-TLHVG9A
Message-ID: <CABymUCMn+USbm21agBZbe=JmV-FzLdVD4s0xgg0CPU=M9jvC9w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: display/msm: dsi-controller-main:
 Document dual panel property
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8820=E6=97=A5=E5=91=A8=E5=9B=9B 18:33=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Feb 20, 2025 at 06:07:55PM +0800, Jun Nie wrote:
> > The DSI interface can be connected to a panel that has a dual DSI chann=
el,
> > or to two separate panels, each equipped with a single DSI channel. To
> > prevent the DSC configuration for the dual panel setup from disrupting =
the
> > current configuration of a single panel with a dual DSI channel, add a =
dual
> > panel property to support the use of two panels.
>
> Please use the terms from the standard. The "channel" is mostly used for
> the "Virtual Channel" or the "logical channel".

OK, will use DSI link for all later description.
>
> Also I don't follow how DSC configuration for a dual panel setup can
> disrupt current (?) configuration of a single panel.

For the disruption, Marijn mentioned it in the last post.
https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2411541

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 8 =
+++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controll=
er-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main.yaml
> > index ffbd1dc9470e2091b477b0c88392d81802119f48..e3f2eabde27609a66d6d81f=
afcb14e1bc014613c 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
.yaml
> > @@ -88,9 +88,15 @@ properties:
> >    qcom,dual-dsi-mode:
> >      type: boolean
> >      description: |
> > -      Indicates if the DSI controller is driving a panel which needs
> > +      Indicates if the DSI controller is driving display device which =
needs
>
> Unrelated change
>
> >        2 DSI links.
> >
> > +  qcom,dual-panel:
> > +    type: boolean
> > +    description: |
> > +      Indicates if the DSI controller is driving display device that c=
omposed
> > +      with 2 independent panels and needs 2 DSI links.
>
> How is tht different from qcom,dual-dsi-mode?

Your questioning is right. The dual panel case is a subset of
dual-dsi-mode, not parallel with
dual-dsi-mode. It is single panel with 2 DSI link by default, and 2
panel with 1 DSI link in
each panel if property dual-panel is present.
>
> > +
> >    qcom,master-dsi:
> >      type: boolean
> >      description: |
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
