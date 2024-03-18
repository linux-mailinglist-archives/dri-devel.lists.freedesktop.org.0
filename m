Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B8587F07C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 20:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA9F10F443;
	Mon, 18 Mar 2024 19:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Jag6n3cG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6040610F667
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 19:37:54 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-42e29149883so19978501cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 12:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710790671; x=1711395471;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CI084V8cwdZvQyXNROxkn3IbY00cnN+dX3japdJLysk=;
 b=Jag6n3cGAQC53NHmoQ7lzGik1FxCsvoVlPY5V0fSXl85AtN04ApLXBduTK+sOFTgAr
 tofXq7MdWbygvgSUsDAxBnIIhrmRmTsjcOWQ34c3buF/tRFeSpbPqObNGQSdrHaYPo28
 +n09p3JCDg1XOVZABZ9yG8SDn97BJNruSWHBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710790671; x=1711395471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CI084V8cwdZvQyXNROxkn3IbY00cnN+dX3japdJLysk=;
 b=jTdT+Sz/HMYmA5FfiiITAjvL5yrHBeMA+wrCugcfYM1qA+haBZrPfnm/dJxQm2ammI
 DS7FvWCVPrAMw+UdzK0NZnvx0Tq12L5ok/47oE4+pzPzS/rjNiPpW9TjcjZPi3WiZHHf
 uNAklHtOCEx0mYLBTMAFic7FehuNqI5gHJTp59uJSurP8hhYqvlGGfgf9z8R5QU6ksrJ
 4E0qNuPRM0lqethLULJusgE2uF/+Vvizz4O3cG/izz/cjhKsnfiwWc5VHuXKdobyvWXf
 +P6XphC3z6RUu+Tt7k1z3wsJbJmPw9Hg1sYG3lnfrjxuugb0bFtEaauEyGsDKsc9jLk1
 uomQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwH1hg0HKwgb6tDYEgbSGT0CI7562s0C/xs3xzn16louTtNNdXd5XxuOj/Qb3FNy+++9Ci1UkXAEHgpNk4p1Oh5E0g5olFhsOgWiG5afl+
X-Gm-Message-State: AOJu0Ywd71Fv3QTdo/SHWOTXH1a+OT67xTm7A6ZJS0m9uJVd3ZScCC/M
 UdzjwMUaMJ+7WGmeSn4oy4/pVhvivlKuUlPon7+kF/1EiA/qBMj//uaE/kCn7S7johAQgTiOW9k
 =
X-Google-Smtp-Source: AGHT+IGSVGh6qfEF/w1Oik1eF8lJYwDVhl9KHYS6RBWzyIqmleV3S0/42SuMD55/sHWFqQyr6w6stg==
X-Received: by 2002:a05:622a:490:b0:430:a20e:270f with SMTP id
 p16-20020a05622a049000b00430a20e270fmr13272069qtx.40.1710790670814; 
 Mon, 18 Mar 2024 12:37:50 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 eh14-20020a05622a578e00b0042f2130cd0csm1917593qtb.34.2024.03.18.12.37.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 12:37:33 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-428405a0205so63151cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 12:37:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKhCJ4EbCrGXsgEqGrCqF8AZvgm1GLx2hYsyFJq90x8xWUJr3lmb5AYjj+qJs2rHjhZ4nDq/Bi808NIGnUWdBDtyKxrCNednSxSnf5bnto
X-Received: by 2002:ac8:7fd0:0:b0:430:9ee1:a8 with SMTP id
 b16-20020ac87fd0000000b004309ee100a8mr5892qtk.3.1710790652484; 
 Mon, 18 Mar 2024 12:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
 <CAE-0n51baqN8cEubSqDegqDwL7O6=iEfN5Ho2OykqjmkjQDcvQ@mail.gmail.com>
In-Reply-To: <CAE-0n51baqN8cEubSqDegqDwL7O6=iEfN5Ho2OykqjmkjQDcvQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Mar 2024 12:37:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+kD852eCOxeJ97_483FMCXBZn+eaPPyb2VrXiGm6V1g@mail.gmail.com>
Message-ID: <CAD=FV=U+kD852eCOxeJ97_483FMCXBZn+eaPPyb2VrXiGm6V1g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Fix typo in static function (ststus =>
 status)
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi,

On Mon, Mar 18, 2024 at 12:26=E2=80=AFPM Stephen Boyd <swboyd@chromium.org>=
 wrote:
>
> Quoting Douglas Anderson (2024-03-15 14:36:32)
> > This is a no-op change to just fix a typo in the name of a static funct=
ion.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - ("Fix typo in static function (ststus =3D> status)") new for v2.
>
> This was sent at
> https://lore.kernel.org/r/20240306193515.455388-1-quic_abhinavk@quicinc.c=
om

Whoops! I guess we both noticed it at about the same time. My patch
should be dropped then. The rest of my series (patches #1 - #3) are
still relevant. I won't repost them since they can be applied just
fine even if this patch is dropped.

-Doug
