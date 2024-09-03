Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82669969889
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 11:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4439F10E425;
	Tue,  3 Sep 2024 09:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uM8SNbmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FFA10E425
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 09:17:19 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6d47d860fc4so26734027b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725355039; x=1725959839; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iHxPh6R8OUIMs2u3yUx/BuQ1WH7I4Ubp5ptPzIFLou8=;
 b=uM8SNbmBSN0oc9YRgwK/jUx3hUwC3wAzbi0EFy8nb+74DtByxOmubqR1WRbrTkW3zz
 wLGP2XhZFMHqqFFZPfIWRFXIpQugYXXQ099xbPvQmPaE4rM/x6s+YcbMbMTa6dKckVOU
 QBbOO13lm4zwqHNbrxpXE2A7+r8DgqkysQhWdgOcryJWGRgMLS5fWeA+pwCv68cPsz+5
 m45HLfTYUrFZ+9y3Hk8uPlLo7dx0420G7T/KNJPFqpL5EaZMOCXJMccRx69kzkZgFLAG
 U6Pbr99SC+FL7B/DrdMf+opciIZG9J/9JbyOnrKufBKxEbz3Y1xDRe2q0G+D9na7a3vq
 YmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725355039; x=1725959839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHxPh6R8OUIMs2u3yUx/BuQ1WH7I4Ubp5ptPzIFLou8=;
 b=jEPam2uBaikaE63rYEE4sF/kFatcDyB6hlihen6W+U55iCNJ5aDygNTFsIv+7R+p4B
 Ze6WdMwUT3D8kOBtCQxrj+A9EGEcCCuYte5HQA0vQvVqsigZmeaJv5d0SERhClSd1wQI
 gPDMczx/fNVuzQcnowHTHOBTWRmVth7DoJebH8a/Sbz99ZXKQ0BEj7gPbPB8xnnABrsP
 Ff/hwoj0u/0F/l+BOVEQ9MEqyUaqYYzL+3oH2edqvxntbGe6bfELZpMeKUn2+Lmv/2tz
 tnCamELLozYIRN083lUOICaO32j/bXEocp4znOtnVGy/0BBEpWwqB3FvLl269EmUoElp
 c1Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNsDKHH0zRizwNPu4QsIbdrnQxpTPbwCCZ/1lOvrg/faBdskyZavxYQOCpaPpjQ3neMzl4S0vSpDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPAoMqY6RmWldNY74c8v8ExJIFzqRy9AoyZImrI1csHTqaw1sO
 ELXRyi/T8p9Us2z557/si9edJG972+aVOAXw6cIVobD2XujQJqXiOU05dNPzMv+JvXagrqfTyTf
 3AeJRUZQ66eU4DVaoPAU8nIgquGVTaSytAfuszg==
X-Google-Smtp-Source: AGHT+IG81YDgPBRq6/EYuW4vKT6fy1SFqxRv2KyQLs6HLXZ1o9IbzXMNe+6OWbwaOtbCurnbVfpd3OtZMgL5A8LguhM=
X-Received: by 2002:a05:690c:81:b0:6b0:d9bc:5a29 with SMTP id
 00721157ae682-6d40f62dcf0mr167802017b3.32.1725355038732; Tue, 03 Sep 2024
 02:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
 <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com>
 <CABymUCPEnU2ReAve=P6yzndZy5-=YQRB60bixxHGeoQK4cWTAw@mail.gmail.com>
In-Reply-To: <CABymUCPEnU2ReAve=P6yzndZy5-=YQRB60bixxHGeoQK4cWTAw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 12:17:07 +0300
Message-ID: <CAA8EJppZvWH1y-WeNW+9zSonoR7vem7N7q0o94ZymiZfvvUfJQ@mail.gmail.com>
Subject: Re: [PATCH 01/21] drm/msm/dsi: add support to DSI CTRL v2.8.0
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

On Tue, 3 Sept 2024 at 11:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:35=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > From: Jonathan Marek <jonathan@marek.ca>
> > >
> > > Add support to DSI CTRL v2.8.0 with priority support
> >
> > Proper description is missing
>
> Actually, there is no clear doc for this register. Any URL or
> doc key word to search?

Do you have a corresponding change in the vendor driver? If not, where
does this come from? What does it fix? What doesn't work if the
register isn't programmed? Answers to such questions should be a part
of the commit message.

> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >
> > Several tags are missing here.
>
> Co-develop and SoB tag, right?

yep

> >
> > Also, how is this patch related to quadpipe?
>
> It is a must per test. Maybe it is just related to dual-DSI.
> We can have answer if 2:2:2 is enabled.

Tests are a separate story. You can send a separate series and mention
it in the cover letter. However this is not a part of the quad-pipe
support per se.

--=20
With best wishes
Dmitry
