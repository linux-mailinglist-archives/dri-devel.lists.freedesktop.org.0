Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1B0907A57
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E72810E110;
	Thu, 13 Jun 2024 17:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GW3aZ+Yb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911E510E15C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:55:27 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dfac121b6a6so1088831276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718301320; x=1718906120; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Egm3XUTXXMactRvvK1SHa1gZTWtD5TN12FoLc8NaGlk=;
 b=GW3aZ+YbWey+cB2qVL0Whywj34sHuXP0uJe6+5V6jCBoHInvP6S4UOVpY6WNwnKEyp
 KjJgXC4Z7S3gRkxSZtknlLUFERZDXZBI+cl1yxZvcWUzXt90TQ0+KNeSKNrgBcA2nrbb
 H5Pkub5ChneF17Tkd/ipusQ09DxW91ppj6Td14f1WTi+yFrdTrGQi6ZL6L/vgF6vRKq8
 TxyPCkWvP7RQw9abWkaHjgFxGxsd0Blb8pzy9yV1udB4tKQSouQ6k64y5NLdLAVU83CK
 mmkPUNWA7B6W2aTiC5aJhnolKt5Nk+XxSZ/fj/PGU1j5b4TuoC3q/RVl8KNIzcaEMgfu
 geZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718301320; x=1718906120;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Egm3XUTXXMactRvvK1SHa1gZTWtD5TN12FoLc8NaGlk=;
 b=l0FbY4a2nbBJvNIc4YiQbF2qp4ogK7DRwdk8f2TtVUkISR7mlZw/Fs1L1SDn6ffC4w
 u1+jhS4vQyW7b3NiBNp8M9sR/Rvv/ubG0u/1lyXzjImD3jvLraEldogNpk410u0jHkfm
 fbzFLAAw91mj2pPSQ3/I+dqPe49rSKhG0RSmprcFBcnpOWEs312X40Kd71Sybp601eqV
 WEZ8vfbI+XIGV3VBv5BcaItC3hPH4dMWd7sfFEhOfg+OPtVoppVQA8i+TNSxvG3qPMHb
 R+NHejDn1e33AcbMdbbB5HphQWGuchHMxu9ztlUHVcpn9LV8F9G3yAyGFzm+QuWMjbre
 56Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVogTVvNHmXXdLv9b1rg8/4OJ1MW2ll7aLNtRETZIh2JFwuSj1lriAcfH+/+YVbFir6ZGJj0OeUeQv92CY4VMoVcn2szVjSVAv0PiuP17J7
X-Gm-Message-State: AOJu0Yy0XObq3cVaIPEbYzDe6kcjIL+jcT/Sa1WnAOgRvq3vC+ANUAqv
 43jRsp9iUisbOL0CYNi2DjiE91tIKYzdJXbCpZhf77OijA+rrKAZMR9x9ElGkn/OI2kOOVuTq9T
 AYHlkMhfUYxnx/wRCvDsKP/R3mMAorqjbznNkYA==
X-Google-Smtp-Source: AGHT+IF76nlQfftP79Eh69ExQvNjCEbwUkZM8145hBHocV2VPUCI+0i3mln+vSFpa/yE2GkSIhSsluLedfBw764rtXM=
X-Received: by 2002:a25:9384:0:b0:dfe:6bc4:9eda with SMTP id
 3f1490d57ef6-dfefec06946mr2090425276.13.1718301320427; Thu, 13 Jun 2024
 10:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240613-msm-pass-addfb25-bad-modifier-v1-1-23c556e96c8a@linaro.org>
 <8aa99c1d-ca6a-a26b-96b5-82fc35cea0fa@quicinc.com>
In-Reply-To: <8aa99c1d-ca6a-a26b-96b5-82fc35cea0fa@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:55:08 +0300
Message-ID: <CAA8EJpr5r=5MP8DqGPV7Ndz0zKy4Ar3u+RiqocLyt6eZWuifnw@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as
 passing on msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, 13 Jun 2024 at 20:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/13/2024 9:33 AM, Dmitry Baryshkov wrote:
> > The commit b228501ff183 ("drm/msm: merge dpu format database to MDP
> > formats") made get_format take modifiers into account. This makes
> > kms_addfb_basic@addfb25-bad-modifier pass on MDP4 and MDP5 platforms.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 1 -
> >   drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 1 -
> >   2 files changed, 2 deletions(-)
> >
>
> Would be good to also give a link to the CI for the CI maintainers.
>
> But otherwise, LGTM
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Yes, good idea: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/119

>
>
> > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > index 3dfbabdf905e..6e7fd1ccd1e3 100644
> > --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > @@ -4,7 +4,6 @@ device_reset@unbind-cold-reset-rebind,Fail
> >   device_reset@unbind-reset-rebind,Fail
> >   dumb_buffer@invalid-bpp,Fail
> >   kms_3d,Fail
> > -kms_addfb_basic@addfb25-bad-modifier,Fail
> >   kms_cursor_legacy@forked-move,Fail
> >   kms_cursor_legacy@single-bo,Fail
> >   kms_cursor_legacy@torture-bo,Fail
> > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> > index 23a5f6f9097f..46ca69ce2ffe 100644
> > --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> > @@ -4,6 +4,5 @@ device_reset@unbind-cold-reset-rebind,Fail
> >   device_reset@unbind-reset-rebind,Fail
> >   dumb_buffer@invalid-bpp,Fail
> >   kms_3d,Fail
> > -kms_addfb_basic@addfb25-bad-modifier,Fail
> >   kms_lease@lease-uevent,Fail
> >   tools_test@tools_test,Fail
> >
> > ---
> > base-commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439
> > change-id: 20240613-msm-pass-addfb25-bad-modifier-c461fd9c02bb
> >
> > Best regards,



-- 
With best wishes
Dmitry
