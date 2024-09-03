Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90C969628
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0AE10E42B;
	Tue,  3 Sep 2024 07:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aiGvISGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD7D10E42B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:53:08 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53438aa64a4so6013739e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725349986; x=1725954786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DiVkizWabhW4BL7IbVoWILVMwDmACqtcboQ3xYY4DBk=;
 b=aiGvISGAmK+GJkgIrJWeLeXMxSa/1kq4pBDkl6ETJK/Obx5EUxeD1KroJShJMNw49S
 qiCUvAuXst1q34ApO8wUg2W0NO2xOjgK1xkh5F1V/KF1oACedrR3DKA//mMhaabHsk3K
 PjSETKaf1JznmwtoJOIoHy8coA2uYi8sf74q47Hw7lZm3nUbhKtez/I6OzUC63+5Ohz5
 VLFnn9qk0HfpABdTJ6OeiAks2cgQJqn7ggLpMdZADjaKfYnRwaIq/pvjSAKNJi0+kGSX
 s8C0fAaABcnNYZ+yP/c6/qwxugCJ8fMRcvr8qX0JXRGYgMSP9gnVO8WdQ+pcanNvvDXy
 pLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725349986; x=1725954786;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DiVkizWabhW4BL7IbVoWILVMwDmACqtcboQ3xYY4DBk=;
 b=KfZ+orCaHpkRe8FoJPIdHKZK7HtNbH2oNOexvvL04RP0CxHjCMMUTCK+kO1G0JiLb6
 +wlzx7oRH7pk0eRYhpZ4YZwcERaTO6yUc9pAO/FiUucXQWAwVLs67oxnOIlzYlLxIb56
 f0czD87c3mrp9SCPvRoFRfE6O0Y2lHEme0OHLVr1V5Qji8TJ/LrIxjgLgyHq3H6KNJ/J
 WJQ6AU5U5kJsBqlM12xM9FEwWYejIZE4SjP9v24aqDoXKYtIaZml1pNicH8/2RZp/b0M
 XEd3AwToaFGq561xK+0v/ikTq+eWXwtRjg89Ca+R0dhYq8GB24fYJMXy8cRw4ym7Dnld
 q+tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkqYFIVFPqG31cRJb76OYHDhORpDv7VtU9Y/PlMU8fzYa2yhibAHAmpLHfYlL4D22Y6omNM4+RCcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuhBasohXYy4FoXSsz4C8tWa+sn59QwbpS9gEl7QBE7IBlecP4
 nXZ0woC3hc47Ft0SXF4fLqLKtZgxtx8DU5ozViSbFYm28009O/VTtFM2vR6xFZ0kOCYes5J1xh+
 MOfWetP+lJf/eGO1mOEQcbt/nQBu5SDZX4XVEtw==
X-Google-Smtp-Source: AGHT+IH1q5Z6V/0gz6i1XwUHY5lw0kjrgLo7e/m69HtmgNlP0Tr4SSEr2P/btmdUC6xBDN4Zm7O5IJeNrckeE0iUpyI=
X-Received: by 2002:a05:6512:2206:b0:52e:7448:e137 with SMTP id
 2adb3069b0e04-53546af928amr9748127e87.6.1725349986272; Tue, 03 Sep 2024
 00:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-14-bdb05b4b5a2e@linaro.org>
 <CAA8EJpp5TwzCZ6bpQQzzVBpEwhi28s-fX9wwOtrasCAGDBdykA@mail.gmail.com>
In-Reply-To: <CAA8EJpp5TwzCZ6bpQQzzVBpEwhi28s-fX9wwOtrasCAGDBdykA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:52:54 +0800
Message-ID: <CABymUCOWXUMgA-x8z3DonANYnUqTyJYgoekXTxALK05ihE+tGA@mail.gmail.com>
Subject: Re: [PATCH 14/21] drm/msm/dpu: Support quad-pipe in SSPP checking
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:38=E5=86=99=E9=81=93=EF=BC=9A
>
> > @@ -1033,13 +1030,10 @@ static int dpu_plane_atomic_check(struct drm_pl=
ane *plane,
> >                         return -E2BIG;
> >                 }
> >
> > -               /*
> > -                * Use multirect for wide plane. We do not support dyna=
mic
> > -                * assignment of SSPPs, so we know the configuration.
> > -                */
> >                 pipe->multirect_index =3D DPU_SSPP_RECT_0;
> >                 pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> >
> > +               r_pipe->sspp =3D pipe->sspp;
>
> NAK
>
I do not understand what's your point here. If multi-rectangle mode is
used, the 2 sw_pipe share a
SSPP structure. Otherwise the right half of mixer pair does not work
and no display on that side,
because there is no SSPP to handle in r_pipe setup.

>
> --
> With best wishes
> Dmitry
