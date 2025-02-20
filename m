Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11DA3DFAA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5159810E1E8;
	Thu, 20 Feb 2025 16:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NHwxNu71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B07B10E1C7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 16:01:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-54529eeb38aso907533e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 08:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740067281; x=1740672081; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=D7uMaJ+RwChO01hxZjoaxGW4+xIyMJhwhgQfBtPgKqQ=;
 b=NHwxNu719TiCmoa/8lJQMnrOz7AzHdiGuNAbuIkwz/5oc/QFr4WyzjJvx0+gmtWbMg
 RVIGNReIw+97cnXeY8HCoFkwL8HDh8xQTBsKtQo36Q0UvbJScZPt8jHeZ7V6J6NivJE+
 w4t4O9DzDi6uj+fusS+hD/RgWLCauDRFdl4L4T9OhmRsvfHRh92K6QQFD6pb2tNDR9k5
 Dc03+rxPZPvCFQEr6/65biFoQDEb2zmqO6oxURrvFGJtAXCeESqh8EcU3m3j9k9pA7D2
 OWy6TsX5NnPIOlhiCKFQiZDPGgmex7nzvU2SJ0EXAa6tQ/aF/h5xJYx7u/M6Nrakw6NO
 Mp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740067281; x=1740672081;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D7uMaJ+RwChO01hxZjoaxGW4+xIyMJhwhgQfBtPgKqQ=;
 b=IUteH3OAKky59n8JuJFQvcavUvxYLTyGzCiVBGB5MEVkZzlMMsAWlesV1AO9wEBIFL
 cDtRwR4auGtbcuTp3Fo3Xr8vGm7QuqH8rDPZuhSB0/Et2vp470T2tdC7ZlmAi/sSq201
 LFnF3uUmbWd223J7AXXKCxx8qfi0BXh56++/4eD/bdyN7IlkjRkXt6jDXduBXyWDRi25
 ro4rE7f9lWxGCCnf161qLp+xwfgqjI8Eaou0QIC+tFtoG4XvFRM2FYNgcG/Cv+npZrzz
 25Nxn2NQmj4A+x5XKu7juzwvrQ9JXfsmkzGl7787qF7PvsZXVFuy2LEQ/LFTT3ylX9Qz
 7xog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPDHFKrlZRKwj5p/VTZTLDMrRR9RoBWi428LZNtjYYdVdz9Azk/aY3u4wNqz4uZLbeckZ8dyI7KHo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj37/zYaeE5JSSFROtUij8VDlqQZCTY9nMm/8nwHDK5jK0/uVj
 gtBYWgQwt4/k1msRU1Gv3E6McH9/Pcz5SQU3Go1zH+tyZdYtn4hMegtkOoCpHTQ=
X-Gm-Gg: ASbGncs/p9jdkbq7iEkY7+xjEHOk6LPYttrvMsQmGoNa7FRAE8CED8YZ0A9gFxvcGnN
 ZYhE0RDS242qPQl/NKgDoI45LTqLR8jXvSsCehm1RRtXjmCkadEuDf2sG6+eAcocuCS93xf4YRy
 UVXEXKiu+DC5f9oDTAI1GPrX/bOEgfXwbDxRyzXGys2ay5Veoos8e1H2asdQX0ie6yFchS7ydxt
 mGl30aQOqRW5tHTb4GyVQenos6+UjsV6ySvA77biBjbUYPN4WEVNB7FpTQCGbcHfqWGsfDleMtU
 WbQ365hiQvG6wG9wDPs3udpDQc78bBCdvCLv4eEKCpxbbhY2jDeb7aG9XeB9Tc2nZdOfBZY=
X-Google-Smtp-Source: AGHT+IHqMDlC+H8RZoqVWnhQETDl2ri4FVZvFzP/vWvYk8fuNuwIU7s64KnfHdGE7ogyzQwh4s67sQ==
X-Received: by 2002:a05:6512:b0a:b0:545:1bd:a0e7 with SMTP id
 2adb3069b0e04-5462eef45c3mr3472174e87.23.1740067279884; 
 Thu, 20 Feb 2025 08:01:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531db6e08sm1733027e87.217.2025.02.20.08.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 08:01:18 -0800 (PST)
Date: Thu, 20 Feb 2025 18:01:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: display/msm: dsi-controller-main:
 Document dual panel property
Message-ID: <dqbosrbwgbeii26wwj3tfsqnjgvq7har7nvs2ifato6nmxqbie@2cexn4xyyh3p>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-4-6c0038d5a2ef@linaro.org>
 <grdadzunaabzg5jxpsiasgzbioy24tctlhhyxg6zwdkpv5vjwe@7k2di2myu4k6>
 <CABymUCMn+USbm21agBZbe=JmV-FzLdVD4s0xgg0CPU=M9jvC9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMn+USbm21agBZbe=JmV-FzLdVD4s0xgg0CPU=M9jvC9w@mail.gmail.com>
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

On Thu, Feb 20, 2025 at 11:40:03PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月20日周四 18:33写道：
> >
> > On Thu, Feb 20, 2025 at 06:07:55PM +0800, Jun Nie wrote:
> > > The DSI interface can be connected to a panel that has a dual DSI channel,
> > > or to two separate panels, each equipped with a single DSI channel. To
> > > prevent the DSC configuration for the dual panel setup from disrupting the
> > > current configuration of a single panel with a dual DSI channel, add a dual
> > > panel property to support the use of two panels.
> >
> > Please use the terms from the standard. The "channel" is mostly used for
> > the "Virtual Channel" or the "logical channel".
> 
> OK, will use DSI link for all later description.
> >
> > Also I don't follow how DSC configuration for a dual panel setup can
> > disrupt current (?) configuration of a single panel.
> 
> For the disruption, Marijn mentioned it in the last post.
> https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2411541

So, why is it happening?

> 
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > > index ffbd1dc9470e2091b477b0c88392d81802119f48..e3f2eabde27609a66d6d81fafcb14e1bc014613c 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > > @@ -88,9 +88,15 @@ properties:
> > >    qcom,dual-dsi-mode:
> > >      type: boolean
> > >      description: |
> > > -      Indicates if the DSI controller is driving a panel which needs
> > > +      Indicates if the DSI controller is driving display device which needs
> >
> > Unrelated change
> >
> > >        2 DSI links.
> > >
> > > +  qcom,dual-panel:
> > > +    type: boolean
> > > +    description: |
> > > +      Indicates if the DSI controller is driving display device that composed
> > > +      with 2 independent panels and needs 2 DSI links.
> >
> > How is tht different from qcom,dual-dsi-mode?
> 
> Your questioning is right. The dual panel case is a subset of
> dual-dsi-mode, not parallel with
> dual-dsi-mode. It is single panel with 2 DSI link by default, and 2
> panel with 1 DSI link in
> each panel if property dual-panel is present.

And what if it is one panel having two 'logical' panels inside?
I'm trying to point out that this should be a property of the
struct mipi_dsi_device (or an option in the struct drm_dsc_config).
There is no need to describe this in DT.

> >
> > > +
> > >    qcom,master-dsi:
> > >      type: boolean
> > >      description: |
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
