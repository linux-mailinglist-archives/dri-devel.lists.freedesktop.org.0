Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66E396970E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EDD10E396;
	Tue,  3 Sep 2024 08:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OJyqXWIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4985F10E35F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:30:22 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6cdae28014dso36743737b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725352221; x=1725957021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JLA6SwNTAG/M4bSvCUM1V19PPQJ03NHMutZLhv2tcE=;
 b=OJyqXWIMzIgKcLTnlKpZviI4TRod0g/F38uIVe+emM2VhGmQzOIbmeZpylUoshi9xx
 aAHZQUZV9CkFexcwJNwH6QV1ibZEUWV1XGSxURapjlDEceT7PJAoREOGIkQseY0TrLQy
 ZVDymM++RjhGSRiu8ewJnTid0tWMIR7UwnwWB011Uuk4vlqmUdxKaUopb3JrwDY9FyB8
 3T6cU9ay4c/WcCpFpxc2kVgzFeqzFZ7pHUA9BHHSLjCGNLzuqz+ugsH35ohECKWRNt+4
 WlSVnWm4EIU/7uOnUoh1pb9M/cFvTcB7h9ABNXPEqm38N6aY4m/lfF1Tb38BNWI1stNS
 jyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725352221; x=1725957021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7JLA6SwNTAG/M4bSvCUM1V19PPQJ03NHMutZLhv2tcE=;
 b=bgUr4NgBChC2UzRrf0y9JktyHgMxzWkl3Tn/3Ni8R2fnWN3crGyLpgN0hPlIwjH+zw
 ShKyBkHiMg9oxvC8zXquKPNPKwdqRPWEiEk2952iAy/4HFDYESPFaLHp28CxRss5NtXP
 lqwzXRT7LygFkJwn4tW9PAru+RsRJ43wfirP+LKaoO2KDHkJKdS0mZ3ORkKc+MfqwTdf
 N3gAVgJ1e0xMX5suxloWIoqajXqBN51vXSDqAxzNqBDor8WOdEL2qYGmeRz5qkRzg2XY
 4n0onell4OxnZIsTvaCvqjGnd2euSiO+qXO8EUfONqaneSiHSOR2fbIdKiZC2CLtYyg/
 qoGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaB5GBml41z7SK5e64RmZNmGc/4urYWo663t84ClLvliT1C5+95YrNNdB7k2kg4UAI5ezhJ9G1Cc0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyNjnyzwrAfr/ScGLt8x3LNGLTseUpND6ZN1Cjyh4iukIjgxqU
 NYhKnGPB1zArdpMsF41fH5kCgMFpdKbxgXSGKmc67Br4kzNfUEQRpaCZoa/nBwRgyVRmO9L9Jfv
 2smu5gCE235XP8+Jdouy3FGCNErORoKH+YO3gcg==
X-Google-Smtp-Source: AGHT+IE6+IuJbo/Qa4C+ke6jr8gGlhel248tosjzF6z+OPZUMgyyXNzVAr6RoXE16AWMpicsRKxNkqNsZU1ZeXemP1I=
X-Received: by 2002:a05:690c:f02:b0:6c7:a120:e104 with SMTP id
 00721157ae682-6d3f7fabc73mr125792017b3.4.1725352221035; Tue, 03 Sep 2024
 01:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
 <CAA8EJpp_LWmuN8CFuQEAME-O44_wJXUKsR1QwahuigzSss5Rqw@mail.gmail.com>
 <CABymUCPXDTCVeeC0s+1UyuqYF0XNW55qtOBV9--BOoSjAzVjkg@mail.gmail.com>
In-Reply-To: <CABymUCPXDTCVeeC0s+1UyuqYF0XNW55qtOBV9--BOoSjAzVjkg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 11:30:09 +0300
Message-ID: <CAA8EJppMkd4QmQHiFGNQNRyCh6S3BGqcQ7Deoag25AjH9rJwdA@mail.gmail.com>
Subject: Re: [PATCH 02/21] drm/msm/dsi: fix DSC width for the bonded DSI case
To: Jun Nie <jun.nie@linaro.org>
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

On Tue, 3 Sept 2024 at 10:32, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:54=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > From: Jonathan Marek <jonathan@marek.ca>
> > >
> > > For the bonded DSI case, DSC pic_width and timing calculations should=
 use
> > > the width of a single panel instead of the total combined width.
> >
> > What is a "single panel"? Please rephrase the commit message so that
> > it reads logically.
>
> Yeah, it is a bit confusing without the usage case explanation. "single D=
SI
> interface" shall be much better here. Because bonded-DSI can work with
> a single panel with 2 DSI, or with 2 panels with one DSI on each panel.

Yes, it sounds much better.

> >
> > >
> > > Bonded DSI can be used to drive a single panel having two input
> > > channels, or to drive two panels with a input channel on every panel =
that
> > > behave like single panel for display controller.
> >
> > Missing actual action. See Documentation/process/submitting-patches.rst
> >
> > >
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >
> > As pointed out during internal review, missing Fixes tag. Any reason
> > for ignoring it?
>
> Sorry, it is missed by mistaken. I am just more familiar with
> "Signed-off-by" than
> "Fixes:" tag, so not sensitive to Fixed tag and miss it when you
> mention it. Will
> add it.

Well, the regular rule of reviews applies: if you don't agree or don't
understand, please reply first.

--=20
With best wishes
Dmitry
