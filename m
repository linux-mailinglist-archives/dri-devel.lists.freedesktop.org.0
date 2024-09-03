Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5701196A31E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E5610E1C3;
	Tue,  3 Sep 2024 15:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qT6bJmHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B855110E1C3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 15:45:46 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f3e071eb64so1511831fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725378344; x=1725983144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lvLFRuyWoi+K6FtpRUCVpbWJKizzVnbzbq+sI/tpAWs=;
 b=qT6bJmHUrK/P0kCKd0Ag1uGfDU/EvNUt0XudK2Fbg8yQc1xPr3bk2smkdo9YGzq7uP
 kIcQAjXfUDGElPEecLOcuGkXdGtFmCW8iUvhokBun9td1++uug0P/4uWFfFzgZUl7ajy
 NQ5SzU5UXR5FJanF+RxCw55/nyAslPVc8aaXtvi95V8jOGfC5HzpI0n3OLZ6uiMePChA
 8SkwxnDLdDL5SBR6GzFb9S2lHcuhjX26LYQFjNc+r34OUBPKMmhmqxEnboFe+K9dmxYk
 cBQX48+x0tFlGW0ZTrDyffYRcUKPRx+mAbJtijTp16VxHkDo4xLQRCF/kpIlDdif1QkT
 byMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725378344; x=1725983144;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lvLFRuyWoi+K6FtpRUCVpbWJKizzVnbzbq+sI/tpAWs=;
 b=Wu7Ts2SLnnYZnFatOoGoTLryeQV23HYskI3R/xRpmdzCvbem1m6yjFlmYV19E8VUx7
 Lm9/QJaQSrsd7dxi6l+geOIbGBE1dRyVGvSmdAdcxuDnl+tqVACDYlrzu37WvE6R+IYC
 T4tDKJQMye+cFfsoy2EbSUQu8v59tmCkifNwaFGjYOLwpCtfjepilVogI42NQzRHacQL
 CRubosq4yw/idiUqTP1hDtE2EzM7zeH6Y6l4A7lDe0yqz9SjNedd5x7oTtq/f175j2tm
 5U58b2yiB2yIa7vjLLqc7KFVc2oFwa4DfpRafV0HTnVLZD8U5RfLQuanZolzQNmurCMH
 igqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9otb7oSEaNp4GrLxlo9D01L269WVp9HMGiLR+fOXT3K9aozaqGC+KNG0S2bqSoj7NH8kijXYX8ns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8gikyrGbKL/5yqaRj+ApTNHS0Xzp+CL45ljxO0v4tPMMOUomr
 /2kemLhGW7xBEUNW/CGWgWbwgjCPWrlCeB2JUzz+vvdA3B/Wk7Ekw6EY0qX8dSQAhh/grjBXNel
 or5Pyy1ReDAj3qyq20atmd89pdu3ll4MneMheRg==
X-Google-Smtp-Source: AGHT+IFZ2z10mUsHuIeTi5fGP7ImtWV0HNYj0otnbACk3A17lbvrUv4JGfz1TWIR0kU9riHTx1cIgtjOKQUelny19Sc=
X-Received: by 2002:a05:651c:b0f:b0:2f3:e9fb:6d5a with SMTP id
 38308e7fff4ca-2f6105d755amr166291761fa.13.1725378344000; Tue, 03 Sep 2024
 08:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
 <rspuwp3zpnzwfe26hv2yezy5ad5o7wliq7ucpobyaheytvcs3j@qtshf6cewb2f>
 <p6xw4newsbrpog5ftclvgi2mpg3hn3ujfukmtilqewz7kbjhqh@6geosjawh3ul>
In-Reply-To: <p6xw4newsbrpog5ftclvgi2mpg3hn3ujfukmtilqewz7kbjhqh@6geosjawh3ul>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 23:45:31 +0800
Message-ID: <CABymUCOji3BUyBhSRz-FXh0tge=kwUTiRN5aLhf=O4MUh_4Y3g@mail.gmail.com>
Subject: Re: [PATCH 02/21] drm/msm/dsi: fix DSC width for the bonded DSI case
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
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

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2024=E5=B9=B49=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=BA=8C 19:51=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2024-09-03 11:50:36, Marijn Suijten wrote:
> > On 2024-08-29 18:17:31, Jun Nie wrote:
> > > From: Jonathan Marek <jonathan@marek.ca>
> > >
> > > For the bonded DSI case, DSC pic_width and timing calculations should=
 use
> > > the width of a single panel instead of the total combined width.
> >
> > When this patch was originally proposed we already discussed [1] that t=
his is
> > **not** universally true.  On my hardware a single bonded panel always =
receives
> > the full width, at least on downstream kernels, and it works [2].
> >
> > [1]: https://lore.kernel.org/linux-arm-msm/eanx45rnasj7lu3r2tfhtg4qkqkc=
idd6zctsz6ci6jlklu4fgi@3nf73w2ka4li/T/#u
> > [2]: https://gitlab.freedesktop.org/drm/msm/-/issues/41
> >
> > Can we please figure this out before landing this patch?
>
> For completeness I've picked this patch, together with the following
> mis-squashed change from patch 03/21:
>
>         diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm=
/msm/dsi/dsi_host.c
>         index 7a4d9c071be5a..5abade8f26b88 100644
>         --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>         +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>         @@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_h=
ost *msm_host, bool is_bonded_dsi)
>                                 return;
>                         }
>
>         -               dsc->pic_width =3D mode->hdisplay;
>         +               dsc->pic_width =3D hdisplay;
>                         dsc->pic_height =3D mode->vdisplay;
>                         DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_heig=
ht);
>
> And this is what it looks like on a bonded DSI CMD-mode display:
> https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2553207
> https://gitlab.freedesktop.org/-/project/2206/uploads/dc5c53d09ecb635fdc9=
f190fbc9b37ac/1000027079.jpg
>
> That's a clear regression :)
>
> - Marijn

Surely we should figure out what's going on here before we land this
patch. Please help me to understand
your setup first. Your panel works well on mainline kernel with
2:2:2(?) topology, and you see issue with applying
the change here, right?
There are several parameter that impact the issue, video/command DSI
mode, single panel with 2 DSI vs
2 panels with single DSI on each panel, 4:4:2 topology on my device vs
your topology. Let's list all of them
before further discussion.

-Jun
