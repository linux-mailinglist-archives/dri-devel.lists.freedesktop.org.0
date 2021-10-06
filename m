Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354B424A05
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 00:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413DD6E560;
	Wed,  6 Oct 2021 22:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449386E560
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 22:45:22 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id b78so4636070iof.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 15:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U8M1dbFOi9vkEKSXXtpgGgRcXsxEcCDZd9Id5Kn3KAI=;
 b=Uhk8XSdYNn5h631zIYLqXzX59plnecs521+YuO/NTKZH6E/AX58IiUEAjOq3QynJxs
 dMvFokV/kZuzna/vkHp59E0MLrFlUruxIdNrCMYk9kEVpFHYcivMVwa9wDxXyO34OquZ
 fOtMiNcvQKkSNxhyUkPoOtLnics+MqHxA7y2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U8M1dbFOi9vkEKSXXtpgGgRcXsxEcCDZd9Id5Kn3KAI=;
 b=cCP+ejkiWWDk1w5m7YdPBx4uDsMfx8G0TMY3tkLaVOapzoMOsRdjLdLOSHreeAJPt7
 yk4pRuVt99zgVba3WnBiJXYugq2PdSkhjuw0jZM4lEMRqQCHxaGewlFCg2k58MzGdDzq
 ZKNkjSfSQJJTVbu/FXHgxbwJY+2eCidOl1mbNzOO95rvjGXcnr4j2PR0Nh7F01YGfhNj
 OhYH0ouNkrGmQsfUueiICm4RjGstN2S2AOZt+mz9E00icYfyAqrPaHNbgIBLVIlAM42N
 VcRFgIFTzaP+y0tkza1037As37E8OY1HSdgb750AfX2Ow7dP7hAh7PA+E3wJsnIX/OQp
 v+og==
X-Gm-Message-State: AOAM5332r3WSsxnCFODij3tiQEeKCS45vB4bBni8iDtvduMTQ4miaLU9
 KYggJ7hd9jeZKF3CZdTAZWTDFLIehOjwgA==
X-Google-Smtp-Source: ABdhPJyXY6EYICmZjS75MAFbOzSmL4GIP1+xrGBCqYcIs9zIOOtnJIgkWRDVEdBwk73DMeSKTK2xGg==
X-Received: by 2002:a5e:8803:: with SMTP id l3mr755453ioj.12.1633560321338;
 Wed, 06 Oct 2021 15:45:21 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173])
 by smtp.gmail.com with ESMTPSA id h3sm10145099ili.87.2021.10.06.15.45.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 15:45:20 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id y17so4420832ilb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 15:45:19 -0700 (PDT)
X-Received: by 2002:a05:6e02:1847:: with SMTP id
 b7mr591808ilv.180.1633560319430; 
 Wed, 06 Oct 2021 15:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211005192905.v2.1.Ib059f9c23c2611cb5a9d760e7d0a700c1295928d@changeid>
In-Reply-To: <20211005192905.v2.1.Ib059f9c23c2611cb5a9d760e7d0a700c1295928d@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Oct 2021 15:45:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XP6TFVn=uxRYr0fXzK9s-uh=a06kZBA5Y6Sj99OCeCXQ@mail.gmail.com>
Message-ID: <CAD=FV=XP6TFVn=uxRYr0fXzK9s-uh=a06kZBA5Y6Sj99OCeCXQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/edid: In connector_bad_edid() cap num_of_ext by
 num_blocks read
To: dri-devel <dri-devel@lists.freedesktop.org>
Cc: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>, 
 alexander.deucher@amd.com, "Wentland, Harry" <Harry.Wentland@amd.com>, 
 Kuogee Hsieh <khsieh@codeaurora.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>
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

On Tue, Oct 5, 2021 at 7:29 PM Douglas Anderson <dianders@chromium.org> wro=
te:
>
> In commit e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid
> corruption test") the function connector_bad_edid() started assuming
> that the memory for the EDID passed to it was big enough to hold
> `edid[0x7e] + 1` blocks of data (1 extra for the base block). It
> completely ignored the fact that the function was passed `num_blocks`
> which indicated how much memory had been allocated for the EDID.
>
> Let's fix this by adding a bounds check.
>
> This is important for handling the case where there's an error in the
> first block of the EDID. In that case we will call
> connector_bad_edid() without having re-allocated memory based on
> `edid[0x7e]`.
>
> Fixes: e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid corrupt=
ion test")
> Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
> This problem report came up in the context of a patch I sent out [1]
> and this is my attempt at a fix. The problem predates my patch,
> though. I don't personally know anything about DP compliance testing
> and what should be happening here, nor do I apparently have any
> hardware that actually reports a bad EDID. Thus this is just compile
> tested. I'm hoping that someone here can test this and make sure it
> seems OK to them.
>
> Changes in v2:
> - Added a comment/changed math to help make it easier to grok.
>
>  drivers/gpu/drm/drm_edid.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Pushed this to drm-misc-fixes since the commit it fixes is fairly old.

fdc21c35aaa1 drm/edid: In connector_bad_edid() cap num_of_ext by num_blocks=
 read

-Doug
