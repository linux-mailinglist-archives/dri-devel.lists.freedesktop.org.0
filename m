Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E484C045E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 23:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD48D10E3D6;
	Tue, 22 Feb 2022 22:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8BD10E3D6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 22:10:20 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id p9so47147286ejd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 14:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MwFKzwhh8vOvVeS07pTWz4ZTdQ5Z+NLOUhpyVBv4D9Q=;
 b=O/jITcbrb5aoH7sPwYaBWxEd+YJ1x5KXbkQkrtCB64fkBBeXrwXPwYjpNDLLVqLhLE
 6P0xsF4mDd7F1fKigupRlFmDpfR0WeyGmbS0FOt+X0dNG1Hek8yTglcMvfFxiWjE0hib
 JI1CvKC/XX+jb6fFHdB6lGrJYWiPMqlROrssQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MwFKzwhh8vOvVeS07pTWz4ZTdQ5Z+NLOUhpyVBv4D9Q=;
 b=zruzE8e2eqyKcU1GDl7LAO10kY4Nts99KCrQjEAnX0hIbfwGNIsueiExIXIi+VAscM
 d89OKebVE9qPJqp6PAuOhLQMLxEWSW04jmzB3I5nHPMyfCEiMANYsJ/o9D2vX6MEPhE4
 Q3xQ9onOJnIBHGSqGvJvS2w/FKOv6OqNPx0Z1bYolDy+XxMqdRgXDe2Pf4f0thTG1Dvr
 tenqYda2+190Y295t1zIS6sfrEquEn35OTwxnGCFtvM0fvq7kbsw0meDyQKpGOIApwj5
 fRCxTNTMeJ4KQDmddFfchntuW2idLubZzENe9NlVGVddrqyoRuuIXVW7BZJ5iY7myYTT
 GJcQ==
X-Gm-Message-State: AOAM532Il4sZT0shiDrwmOZoJt/0ILjvgB2D+Q7A8C3gAjoMyGJ5uDkV
 By3L6SmdRLz+Fo4PBkS9fAZVueIWrQsuJqAelwg=
X-Google-Smtp-Source: ABdhPJwOOvEtutQwxhJyiPsqRfko1fFGInPSbmd00iKYxHrCebrCKvlAXUx/FUzqSvkUny3TELIvgg==
X-Received: by 2002:a17:906:a4b:b0:6d0:fbdd:7cb5 with SMTP id
 x11-20020a1709060a4b00b006d0fbdd7cb5mr13500654ejf.152.1645567819191; 
 Tue, 22 Feb 2022 14:10:19 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46])
 by smtp.gmail.com with ESMTPSA id dz8sm10720353edb.96.2022.02.22.14.10.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:10:18 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id p4so2297913wmg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 14:10:18 -0800 (PST)
X-Received: by 2002:a05:600c:228e:b0:37c:2eef:7bf with SMTP id
 14-20020a05600c228e00b0037c2eef07bfmr4903688wmf.73.1645567818110; Tue, 22 Feb
 2022 14:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20220217144136.v3.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
In-Reply-To: <20220217144136.v3.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 14:10:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XmqG13QuyxpcS9sN2UCtPWDyhD_T1xjkDf8tp-_bSOWw@mail.gmail.com>
Message-ID: <CAD=FV=XmqG13QuyxpcS9sN2UCtPWDyhD_T1xjkDf8tp-_bSOWw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: analogix_dp: Grab runtime PM reference
 for DP-AUX
To: Brian Norris <briannorris@chromium.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, "# 4.0+" <stable@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 17, 2022 at 2:42 PM Brian Norris <briannorris@chromium.org> wrote:
>
> If the display is not enable()d, then we aren't holding a runtime PM
> reference here. Thus, it's easy to accidentally cause a hang, if user
> space is poking around at /dev/drm_dp_aux0 at the "wrong" time.
>
> Let's get a runtime PM reference, and check that we "see" the panel.
> Don't force any panel power-up, etc., because that can be intrusive, and
> that's not what other drivers do (see
> drivers/gpu/drm/bridge/ti-sn65dsi86.c and
> drivers/gpu/drm/bridge/parade-ps8640.c.)
>
> Fixes: 0d97ad03f422 ("drm/bridge: analogix_dp: Remove duplicated code")
> Cc: <stable@vger.kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> Changes in v3:
> - Avoid panel power-up; just check for HPD state, and let the rest
>   happen "as-is" (e.g., time out, if the caller hasn't prepared things
>   properly)
>
> Changes in v2:
> - Fix spelling in Subject
> - DRM_DEV_ERROR() -> drm_err()
> - Propagate errors from un-analogix_dp_prepare_panel()
>
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug
