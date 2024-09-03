Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23115969591
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B580110E40F;
	Tue,  3 Sep 2024 07:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HRYsh4zs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6D210E40F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:32:52 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-533488ffaddso6221733e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725348770; x=1725953570; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7FqpAKPzV4buH+ZI1vofCGLlOfNoJm00tc4Xp0bqlQ=;
 b=HRYsh4zsSOihXfMwdCnAdYgheM3DkTSbTS8x/VJBoRjGxJEy+YJXhRsLEtmGC++Gow
 L43I3hnkp4fVZ0zIAHezUaA3jfVmY0SDo1TqZbB/tCxityj02tUyBEpij42OzVw4j6sU
 U+1Em54IRgXBluHlMVcFuM7NOo0RA7KbNr/sIlyoyUSylYl6Lagi/vSv6tITFnRtAG7w
 vIz1ITCIVp/nOXf9cCsiICrzPG/fPqXUsRZ86p3nAKys9t0lw+xeFEjCGuIEWSNAXRSf
 tAk2vrxhcIA2KIkMJMDcj9/YA4coDJXc+Srx3sl7i1NG7dYuFxwc5oKj53z+Y00PxoHe
 aN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725348770; x=1725953570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U7FqpAKPzV4buH+ZI1vofCGLlOfNoJm00tc4Xp0bqlQ=;
 b=MD2sE692k7nRkzct7dvGcz/qvpriDayyeZ+phDSG+aaukv8MejGsuppXJkpVtgnhzu
 DCTqPFSOr8jaf56xHqmZ+vlv5vW4Y4KT0Kerqb23OaJqMEicQa0o9cEUEo0GySCkXJ6u
 qFxTPVb8sHY9AE16h4Osfyx0rO+R98ptsLNqTFms5IuPcf6RYMfdSEFZJ1iUyun/2rPB
 DtnxOcgzPvqFcviJLE4CVFrRx++MKbwKWIMEBCgW/Y8QMpelC1m6tlFBzrpbNELtrhbd
 Xc+htgsk+Qh9Zk5VYBh3IadDY58rbDM72HCg46Ccf/dR40P4CCz73qAoWyZQQd7HPZzV
 nbkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy5P7PMP3ih8CRvvRy0ydSNbdJzbshZBdYM6vYdV60eOmxHzRL5LJq0310Tjr3r0lX55FBXmXttYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygHVA7iIHNKhNUJcA/cv0mrp3Wy4l+IhFEgiO508J5oZd9EYdX
 GoTsag+cphWhmgW5W3pB52UYSmOi8kw6ducaJuwIs0mtza6s3ILbgS5UkEL2TYmptIo047B94sI
 tAttHfr5H/Wcnv1c3xw+qz+O8kKs6BWQOIuPNgQ==
X-Google-Smtp-Source: AGHT+IHrFPfCS/BVC8UCkjCGmyI7i7/wfoGrPytiT60dSKpQkQEML/b4+Lrc3MCNMZfPCyT+5uqmLNbJH1mOjM56rKk=
X-Received: by 2002:a05:6512:3b11:b0:52c:e054:4149 with SMTP id
 2adb3069b0e04-53546b052fdmr9233089e87.15.1725348770143; Tue, 03 Sep 2024
 00:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
 <CAA8EJpp_LWmuN8CFuQEAME-O44_wJXUKsR1QwahuigzSss5Rqw@mail.gmail.com>
In-Reply-To: <CAA8EJpp_LWmuN8CFuQEAME-O44_wJXUKsR1QwahuigzSss5Rqw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:32:38 +0800
Message-ID: <CABymUCPXDTCVeeC0s+1UyuqYF0XNW55qtOBV9--BOoSjAzVjkg@mail.gmail.com>
Subject: Re: [PATCH 02/21] drm/msm/dsi: fix DSC width for the bonded DSI case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:54=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > For the bonded DSI case, DSC pic_width and timing calculations should u=
se
> > the width of a single panel instead of the total combined width.
>
> What is a "single panel"? Please rephrase the commit message so that
> it reads logically.

Yeah, it is a bit confusing without the usage case explanation. "single DSI
interface" shall be much better here. Because bonded-DSI can work with
a single panel with 2 DSI, or with 2 panels with one DSI on each panel.
>
> >
> > Bonded DSI can be used to drive a single panel having two input
> > channels, or to drive two panels with a input channel on every panel th=
at
> > behave like single panel for display controller.
>
> Missing actual action. See Documentation/process/submitting-patches.rst
>
> >
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>
> As pointed out during internal review, missing Fixes tag. Any reason
> for ignoring it?

Sorry, it is missed by mistaken. I am just more familiar with
"Signed-off-by" than
"Fixes:" tag, so not sensitive to Fixed tag and miss it when you
mention it. Will
add it.
