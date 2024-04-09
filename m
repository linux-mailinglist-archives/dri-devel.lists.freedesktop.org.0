Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E9289E130
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47886112E4C;
	Tue,  9 Apr 2024 17:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Swi3xEuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8469A112E4B;
 Tue,  9 Apr 2024 17:12:14 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-56e477db7fbso4951370a12.3; 
 Tue, 09 Apr 2024 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712682732; x=1713287532; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=avtQoYEPbu2+Jr0W5m1ghEuAGynrnjvGqeyVENfv9tU=;
 b=Swi3xEuVJ5XUVtKvoQi1m0rxKuCu+gBCGXaMCnIhfnJPoUbONoJvBl7LRN7A6eEWSH
 mJvUNax9tM9aHEo6qfRv+ZM24B4zGSIPPcO9MvuMdfQn4a6TMia6SPj7uaVFOhpG8O1H
 R15tXsLX1BbPgKWNriEcoCtGcqoJvT2YijbT3nAPmJ15w6BCEGaMhC4Vb+NlHI1H76lw
 ZDpRDfPPTyoe+lxqwitVO2BWl7z/y7ihGiWUdEPKbehkr0zQSqSFitBvdFLstR/nfEGr
 B4Cc9LqxEU/f/gJkzr3BT4e0+Vne5PKZMCkgMzWV9ESgVVgwiJN8sowrJzosx10Cuyc6
 5egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712682732; x=1713287532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=avtQoYEPbu2+Jr0W5m1ghEuAGynrnjvGqeyVENfv9tU=;
 b=qSIIHsFwoG07ILV3Xah269Ik3wnV70s4+0iHqpZj2AMJn3JaoYRJew3e4tCWJ5E4l6
 In0fmRR91f7RCMk0LgcstbeXh2/r568ajslLSh85BOwudpXcMrdLO97ddl6JknXHZfw4
 J4r5D4KzceN+uxPZOXlXWJ/kioYHJOFAFVsWCFX0+z1wlxbcs1yGplQ4YQJDlKfITSCT
 pp6JqOTVztGnD6kE2yTqcMoZQ4+K7L8gl4aJd8AQmk4EpjCH9oNh/FTqogPv0b3qkWot
 89QesaHOHQu3oKlMvV3z0k99G0P2f3rLAyshsGYJG/RoPpxvSepo9xtTEU13dliTCf/c
 Vd0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7GD3KCuCsEsbBRYCZQmUtH3rBhnBMVD7Jl1IPLREKD0ty4Ie6HmP7IQQVQ8O8PmUEgsOnD12LR9esijK4UXU5rvZtuOmdlRnebgpXULwvcYzzwsnfpPzujlZNX7DHpbyG/TU2n57LWrx8cEhXUNDE
X-Gm-Message-State: AOJu0Yy2/SP+CtUnqE0k7kI4NCuJ4Ta8WbU+TEACGYtc9dpaK//sZEQC
 4HoZQsgnD/IA4c86YH3pO69RjK1aR8+KBV5loeIVxaYE0P7FxHCwYiVuYHKipyu6OJs7LXpDh3e
 tQocSHHAPpH6z2aK8i3WPQzeXRfE=
X-Google-Smtp-Source: AGHT+IHDsDzpN80Q+dT8Z1O9ekHUAbkM8i2z9y0uAzBM2Co9XDpeUNjqG0qPrG/s7Ymg03pkuU0oARufzvBH2JCkaX0=
X-Received: by 2002:a50:c305:0:b0:568:b622:f225 with SMTP id
 a5-20020a50c305000000b00568b622f225mr85452edb.30.1712682732145; Tue, 09 Apr
 2024 10:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
 <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
 <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org>
 <tkcbl2iwcy3feoggbk737gx32qsxe5p4ad6lfrujy2pazccrhm@kif3guuzay6h>
In-Reply-To: <tkcbl2iwcy3feoggbk737gx32qsxe5p4ad6lfrujy2pazccrhm@kif3guuzay6h>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 9 Apr 2024 10:12:00 -0700
Message-ID: <CAF6AEGsg2xCCC27t_Gqu=MMQ6tckVw=Zj90p4x7EuOm+VKA=ig@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
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

On Tue, Apr 9, 2024 at 8:23=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
> >
> >
> > On 4/6/24 04:56, Dmitry Baryshkov wrote:
> > > On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
> > > > From: Neil Armstrong <neil.armstrong@linaro.org>
> > > >
> > > > Usually, speedbin 0 is the "super SKU", a.k.a the one which can clo=
ck
> > > > the highest. Falling back to it when things go wrong is largely
> > > > suboptimal, as more often than not, the top frequencies are not
> > > > supposed to work on other bins.
> > >
> > > Isn't it better to just return an error here instead of trying to gue=
ss
> > > which speedbin to use?
> >
> > Not sure. I'd rather better compatibility for e.g. booting up a new
> > laptop with just dt.
>
> New speedbin can have lower max speed, so by attempting to run it at
> higher freq you might be breaking it.

Usually there are some OPPs in common to all speedbins, so picking a
freq from that set would seem like the safe thing to do

BR,
-R

>
> >
> > >
> > > If that's not the case, I think the commit should be expanded with
> > > actually setting default_speedbin for the existing GPUs.
> >
> > I think that should be addressed, although separately.
>
> I'd prefer to have it as a part of this patch, but I'd not NAK it just
> for this reason.
>
> --
> With best wishes
> Dmitry
