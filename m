Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84349913E6F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 23:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E704310E31E;
	Sun, 23 Jun 2024 21:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bQdZcUZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0435810E31E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 21:15:59 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52cdf4bc083so1675640e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 14:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719177358; x=1719782158; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=npqBqrsZNAIwVwMzRpL1TmQcfMoNbDQggbKHwWlSbcg=;
 b=bQdZcUZvtieg/LlmGmc80vyH3bdYzG8ZKhaGIcW8Dk3S65WuRc333Yz7+LEP65IMCq
 KFv7k6NOsDwHA4vWqjwDSVQTKaPWmpvqs0ap6QHOjyt+W67GOkaxCTbKmX6AeegSm10R
 sRzbU5KlY2gSZBh+WasvXvZiGgh7vfKIEH9cvzj+826TIYNgYeIhonkLw6yfRszGGUB5
 DuqN20F0GIxqHRKs3hZdKVL+/iXp7Wc0Esh344uFuq+utM1Y9wFQWEjd36ldpOT0MTDk
 NQCe4SHZDXPPMDa0qJWFtZ8jF1jeiNY7OXx62WJcXVjqqVLzJWGP4Hv0zXMD+9sV2NPG
 X/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719177358; x=1719782158;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=npqBqrsZNAIwVwMzRpL1TmQcfMoNbDQggbKHwWlSbcg=;
 b=Izr+HOpyIvMblI8neU0tBg89440hjJBcE5nKYG8hQAbzkEvuI/GhhGp12UbikzhGdX
 TCyQELvVa4icH5i29cyzHxCz8DARsObxyYwYFHKGYWbl/HmgWJ9TekB5/YVzVAHcMU93
 MEOXprtkJGHd+OwafeSCfLnQ0qpwREu6dKHIfMzrkDvoGerB/0DIyyUQJIxCV3qDDodq
 xjYzKJNojOR0tVXf2M+K8enxIzzuIyQ/3hRXWrv+8uAE//MsxECSTkJdSewTlmfbFlJq
 CV9bOMdi5jcPFip2WSYXB8P4hOYic7J6MHldXwSoNrx/pjRtuzeXRQKTCJk+Av1a52ku
 TE/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ9MG0ZxcZyEitKNCBJp7cUs17SCYn67d7Pb+qDVQJH6ox3m3MALBYPCz+BbDsaqbEzKGVODDSQpjIg5l9XsPCRLZTzQiO7zmN6XNS4Ndn
X-Gm-Message-State: AOJu0YzXg2IIKpVHf6JWY3O/uiMw/FZIZdpXL3k9lC+FWShbcwTkecjn
 /rQwCz9IwgcPdtkcT9dh+zxH7Ow1EcQqF9jd26lCwlRxxf/WYguzRMNjdccfvrg=
X-Google-Smtp-Source: AGHT+IH5kNGocu2dFm65gFsoVZhigJ6nemG+so7J1Pq+CT/tsTHpWdQ8xhhme3ais5shulJS0U/Jrw==
X-Received: by 2002:a05:6512:4004:b0:52c:dfe1:44ea with SMTP id
 2adb3069b0e04-52ce0610526mr2776983e87.6.1719177357863; 
 Sun, 23 Jun 2024 14:15:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce98c1a27sm3079e87.253.2024.06.23.14.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 14:15:57 -0700 (PDT)
Date: Mon, 24 Jun 2024 00:15:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
Message-ID: <l276ykxey3qvct7rwkngyby4ohy3bl5cl77ldvo6zqco57d6xn@4mkwdabfabtf>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
 <20240623-dsi-v1-2-4ab560eb5bd9@gmail.com>
 <hzslz54iq5sjmfhcbuj3my7cbjsu73acxeelih3jekr6rznz44@qie4c4w5lt2d>
 <CAGsSOWUDbvUMW95Xnjrg4z7TJ9=tj7_KHyek3xTuzbDP2_VhHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsSOWUDbvUMW95Xnjrg4z7TJ9=tj7_KHyek3xTuzbDP2_VhHw@mail.gmail.com>
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

On Sun, Jun 23, 2024 at 12:48:53PM GMT, Barnabás Czémán wrote:
> On Sun, Jun 23, 2024 at 7:59 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Sun, Jun 23, 2024 at 01:25:52AM GMT, Barnabás Czémán wrote:
> > > From: Daniil Titov <daniilt971@gmail.com>
> > >
> > > Add the mdp5_cfg_hw entry for MDP5 version v1.14 found on msm8937.
> > >
> > > Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> > > Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 89 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > > index c5179e4c393c..6413c0d3e237 100644
> > > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > > @@ -1011,6 +1011,94 @@ static const struct mdp5_cfg_hw msm8917_config = {
> > >       .max_clk = 320000000,
> > >  };
> > >
> > > +static const struct mdp5_cfg_hw msm8937_config = {
> > > +     .name = "msm8937",
> > > +     .mdp = {
> > > +             .count = 1,
> > > +             .caps = MDP_CAP_CDM |
> > > +                     MDP_CAP_SRC_SPLIT,
> >
> > Could you please point out the SRC_SPLIT reference?
> Is this would be qcom,mdss-has-source-split in downstream, because if

Yes, IIRC.

> it is i think it is a mistake and it is wrong at msm8953 also.

Please send a fix.

> >
> > Other than that LGTM
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
