Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75341A06CB7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 05:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6375710ECD6;
	Thu,  9 Jan 2025 04:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UXXzbDEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FA610ECD6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 04:20:26 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3a81324bbdcso3018725ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 20:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736396366; x=1737001166;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LD2fDRTNhQYFtCJ+BOChwfFayvwLv5iHFRRj4Z0igDI=;
 b=UXXzbDEqhDiIg3aETdtbfo3julg64JnirSEjFmj9uujU5A2T2iohZhNYRKefAoBA+I
 32IU/s3Q3rVgTYrDfb8gY5uG71J7XlHhfbgD7FPEm5s4qwVosW1QMb6UcmxLuC0PBIGQ
 55RhQZv0ge+dpieC4TI2c82gmriomnUei+88o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736396366; x=1737001166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LD2fDRTNhQYFtCJ+BOChwfFayvwLv5iHFRRj4Z0igDI=;
 b=YLibFkUHk+n9JsevmI755EjZsBqWNDKZvq1KLcNAgS+ksRPDjMpIB5m2fv+ES3RBUp
 d00sqaVMQXPun9ooRWgxmWSMaRPKvQ+siZtCTVKQm1Xr+mJu7CDIwQ6sbsCwcV/dnOci
 lPrcMcR2HbP3acCBXzOcuZ80lXL9dgO8HtcmTR3yXBA9oeFB8cHSIxfYqVSRHaEDl1a9
 cQ0ExPeq5gMjdW5iNpDSKGLFkruOt6RKN935UFa3Ctxy9Be50CrtBn/rLxx9eBtrG2P1
 Q2ukmjTNyxAYeEErox/zO1DkssqHTF4BKRTCyJDTNe7Le22WyZ49S1p8HNfRWvK9siAq
 OzEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNizVhx6p4G2XbHZ+Yql2Kq8Sa23AAOhUy4yEyrBlXmAnLC9iz6yCbkNsgqR5CHz/hT2DTinUqj9U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRvo/NUBcAS4FClzO2bqRW1SCe6PBMoKJbmcMycpDiCupyPJ14
 W6eVSs5e87AvN+8RB/nSc3O13I1npER328hUrFU65LnQdrmtq/FfpKnE3iWXNMLZI0V5cU+FBAE
 gt7SkvStNLK0YxzMGdVrZYVPQFH4aVTngXOaXCNcp+D2GGkdq7A==
X-Gm-Gg: ASbGncuCQjkkbJkrYV3kf31zrSgeLJnIF2PhJNp73qhH1FQ0RTwVOsQDBgJll7MGziZ
 uBXiUxSYLefon10++nC1cTKqFsOSALGaEt0bPbuEeithkPYgrw+iH3bH8kj8hRcnLiQ==
X-Google-Smtp-Source: AGHT+IFZVfkysXuaUToIJd7wwAJ6NkICB7YiNGOrz3XkzAeDda5DPhxMr8gz13udjJeC7AcgQbMkZz7LNnRv08EHejg=
X-Received: by 2002:a05:6808:11c3:b0:3eb:5dcc:67aa with SMTP id
 5614622812f47-3ef2ebeec7fmr3396226b6e.2.1736394972156; Wed, 08 Jan 2025
 19:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20250108-fix-hdcp-v-comp-v1-1-9404811825cd@ite.com.tw>
 <lu2haon4sj3kvge6cowqgratgnoxg26kiwrjyjdgh7pt5v2hwi@v3xulffewwy6>
 <cb8f9927d2874ef29bdea3f16c4a9de1@ite.com.tw>
In-Reply-To: <cb8f9927d2874ef29bdea3f16c4a9de1@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 9 Jan 2025 11:56:01 +0800
X-Gm-Features: AbW1kvYCXp9w9rwF63NI7WY1YluYTMgnnUMIe7qbf-rPuwC_uapYJjqjFunzcTA
Message-ID: <CAEXTbpfCEhKXOqhWRYqV2Q_Z8AEsoyFXyvBxd3xN2vmGdggYnw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
To: Hermes.Wu@ite.com.tw
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, angelogioacchino.delregno@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw
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

Hi Hermes,

On Thu, Jan 9, 2025 at 10:36=E2=80=AFAM <Hermes.Wu@ite.com.tw> wrote:
>
> hi
> >
> >-----Original Message-----
> >From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >Sent: Wednesday, January 8, 2025 6:43 PM
> >To: Hermes Wu (=E5=90=B3=E4=BD=B3=E5=AE=8F) <Hermes.Wu@ite.com.tw>
> >Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstr=
ong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.=
pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec=
 <jernej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.int=
el.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann=
@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch=
>; AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>; dr=
i-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Pet Weng (=E7=
=BF=81=E7=8E=89=E8=8A=AC) <Pet.Weng@ite.com.tw>; Kenneth Hung (=E6=B4=AA=E5=
=AE=B6=E5=80=AB) <Kenneth.Hung@ite.com.tw>; treapking@chromium.org
> >Subject: Re: [PATCH] drm/bridge: it6505: fix HDCP V match check is not p=
erformed correctly
> >
> >On Wed, Jan 08, 2025 at 01:45:14PM +0800, Hermes Wu via B4 Relay wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >>
> >> The loop of V compare is expected to iterate for 5 times which compare
> >> V array form av[0][] to av[4][].
> >> It should check loop counter reach the last statement before return
> >> true
> >>
> >> Fixes: 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V
> >> matching")
> >>
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >
> >No empty lines between tags, please.
> >
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 9 ++++++---
> >>  1 file changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c
> >> b/drivers/gpu/drm/bridge/ite-it6505.c
> >> index
> >> 88ef76a37fe6accacdd343839ff2569b31b18ceb..e87247aea1d2ffbdad192e241056
> >> d34fdfb32163 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> >> @@ -2254,9 +2254,12 @@ static bool it6505_hdcp_part2_ksvlist_check(str=
uct it6505 *it6505)
> >>                      if (bv[i][3] !=3D av[i][0] || bv[i][2] !=3D av[i]=
[1] ||
> >>                          av[i][1] !=3D av[i][2] || bv[i][0] !=3D av[i]=
[3])
> >>                              break;
> >> -
> >> -                    DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d"=
, retry, i);
> >> -                    return true;
> >> +                    if (i =3D=3D 4) {
> >
> >I think there was a similar patch yesteday.
>
> I can't find patch for it6505, would you provide link?
> If it also fixes this bug, should I just drop this patch?

I believe Dmitry is referring to
https://lore.kernel.org/all/20250107110740.42892-1-dheeraj.linuxdev@gmail.c=
om/

You can upload a v2 for this and CC Dheeraj on your next patch.
>
> >Anyway, I have exactly the same feedback: please pull this out of the lo=
op, this is how it's usually checked / done.
> >
> I will move it out the loop,
>
> Thanks.
>
> >> +                            DRM_DEV_DEBUG_DRIVER(dev,
> >> +                                                 "V' all match!! %d",
> >> +                                                 retry);
> >> +                            return true;
> >> +                    }
> >>              }
> >>      }
> >>
> >>
> >> ---
> >> base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
> >> change-id: 20250107-fix-hdcp-v-comp-3ba8e3d7adf3
> >>
> >> Best regards,
> >> --
> >> Hermes Wu <Hermes.wu@ite.com.tw>
> >>
> >>
> >
> >--
> >With best wishes
> >Dmitry
> >
>
> BR,
> Hermes

Regards,
Pin-yen
