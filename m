Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD39AA06A73
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 02:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706DC10E220;
	Thu,  9 Jan 2025 01:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J7cHUI1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801ED10E220;
 Thu,  9 Jan 2025 01:51:55 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3eb9a0a2089so222615b6e.1; 
 Wed, 08 Jan 2025 17:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736387455; x=1736992255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vTQXQ88z6zCYwAtzCdJiZfz8OLcokO/zYH3FfJ1Du5Q=;
 b=J7cHUI1x/tAqcWf9raqK+FmkDDFqO5HmJmoq/vz5x0MWS698zIizt8mzsxlMuYM68v
 6Vedvr7V5j8MPz6r7ldKqin04Ue+P12p+rtp2+zgY9t1xbt4LgQu/rO4KzrNnNWS4U+O
 8fKEKqwORiGzAaxTzn2YkDOb/1wrkBbsou+tHrsK9FEt2iF7+isJItDC9SgFXlYtYo+S
 h5LZ9JzmNFDtfcYRFReBrLlXB10rK1nxTP+GqlpJVJJx/JREG+rfkb8S/ZdXDB+TWTCA
 JtN4i360IGxVdcbqGA3T0ii1GNH46PPO8lTzN/CKnH5vCHan70W0VXIyzNAgZ8GfX930
 /Anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736387455; x=1736992255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vTQXQ88z6zCYwAtzCdJiZfz8OLcokO/zYH3FfJ1Du5Q=;
 b=iRi+hNuAh3rnAUi3d9Y0YDnwVGedgpk3TRyOCn3y2Cv0H5xBd9sLCRmaHP/4HBpibg
 X8bKZCMM5sJJpAh1K/rjKjKCjEWYJAGVAKZ0qpTBn3azxFV5pm8SObBRGKzcDDFTEWBG
 0jEVOhhcoviLLt+ou/YsAab06MNICFeLG8cZRv5bg5NQdujNEGrI8Mo1RCeeJf6sO9a2
 H+UD1iJyRrSonRK1FRG7F9ne5fFcIPdVIq95pr26I79F7D0vbMsuoCeF6i75YXWgH7Js
 IjGyqjVTyXVRmPOlO8zqiK7XClqomtaNV1C8pxs/CYwi/RMTH853Ipdoa1Z6XVnHPsaW
 ApZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKoNcfRiNka3N0GDTA5tRbBp6tWwscSFapB033xKgpmI7x/UNkoFJ8sqJAbjKxm5CQTmMZuPSOuJlo@lists.freedesktop.org,
 AJvYcCUqQbO9Vld0ObeHhlS7Yfnw2wtQlcwX1Cqrr6ssgpBe8jWiEdE6eDtnyroqoLJGWSWLYHs+XaztFC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNqKqqf4XGi0vUZhR3q5FvO+nfJf5ldMNHZkhsmwaD1yrxBBFC
 wJtvq+sG2J2rDHsECucNQ2/GdEPiraPjcKGTlvje35WZEcWMZ1ljyv3twVU1Dv9XV0Q/iAI5JNp
 pp+NSW/cI+Mac3OZi+ZtMCVFuP378sg==
X-Gm-Gg: ASbGnct0Gzf92cnJK4ET3xw7g+sgFR7TpjtO0odqIEyqcvYLEU95MjN8FaaFv02Ktcu
 ozuNO9TojyzO9tH6utrIS4Qysy0XUAZUilZ8ajw==
X-Google-Smtp-Source: AGHT+IGBEnxLiqQwEwqCLiJMvA30J+8yT00wj3VykLNsaPq0HBxMd+8svgTY3q2CD3uP4yGSIaNaRv07o8fUgHbMTz4=
X-Received: by 2002:a05:6e02:12ce:b0:3a7:e0c0:5f0d with SMTP id
 e9e14a558f8ab-3ce3a9a4fd2mr43044545ab.3.1736387146356; Wed, 08 Jan 2025
 17:45:46 -0800 (PST)
MIME-Version: 1.0
References: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
In-Reply-To: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 Jan 2025 17:45:34 -0800
X-Gm-Features: AbW1kvb-J3B0kavNpLCK8O885MCz48UcexWGb0twwfPbSZkvjRUax-a3vTyGwW8
Message-ID: <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Force disabling commits to take non-async
 path
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
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

On Wed, Jan 8, 2025 at 2:58=E2=80=AFPM Jessica Zhang <quic_jesszhan@quicinc=
.com> wrote:
>
> Force commit that are disabling a plane in the async_crtc to take the
> non-async commit tail path.
>
> In cases where there are two consecutive async cursor updates (one
> regular non-NULL update followed by a disabling NULL FB update), it is
> possible for the second NULL update to not be queued (due to the
> pending_crtc_mask check) or otherwise not be run before the cursor FB is
> deallocated by drm_atomic_helper_cleanup_planes(). This would cause a
> context fault since the hardware would try to fetch the old plane state
> with the stale FB address.
>
> Avoid this issue by forcing cursor updates that will disable the cursor
> plane to be blocking commits. This will ensure that hardware clears and
> stops fetching the FB source address before the driver deallocates the FB
>
> Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_a=
tomic.c
> index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34ca631dd=
28d4cdc2b8c7dc0 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_state *sta=
te,
>         struct drm_connector_state *connector_state;
>         struct drm_connector *connector;
>         struct drm_crtc_state *crtc_state;
> +       struct drm_plane_state *plane_state;
>         struct drm_crtc *crtc;
>         int i, num_crtcs =3D 0;
>
> @@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_state *st=
ate,
>                 *async_crtc =3D crtc;
>         }
>
> +       /*
> +        * Force a blocking commit if the cursor is being disabled. This =
is to
> +        * ensure that the registers are cleared and hardware doesn't try=
 to
> +        * fetch from a stale address.
> +        */
> +       if (*async_crtc) {
> +               plane_state =3D drm_atomic_get_new_plane_state(state,
> +                                                            (*async_crtc=
)->cursor);
> +               if (plane_state && !plane_state->fb)
> +                       return false;

hmm, I suppose we want the same even if the fb changes?  Or
alternatively somewhere hold an extra ref to the backing obj until hw
has finished scanout?

BR,
-R

> +       }
> +
>         return true;
>  }
>
>
> ---
> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> change-id: 20250108-async-disable-fix-cc1b9a1d5b19
>
> Best regards,
> --
> Jessica Zhang <quic_jesszhan@quicinc.com>
>
