Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D86B0733
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 13:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50EE10E5CB;
	Wed,  8 Mar 2023 12:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C43510E11C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 12:35:24 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id e82so14422975ybh.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678278923;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Te0Wm1LBiLHbyjBQ4apLHzIYIeF5VCMITHqDeFoeL3c=;
 b=wjrI5GBxcLK2TpY/oAthDy4jtf1z+fsJuQ9xjcbxHaIlP6smp1deqrOVtdOkNnjFIA
 2UrygRCRUkSvYhYIP206gLrLjl0xPM+AD4S5GNdOAcW4d8tIqfe3pZYgXtRsu5Y6lGcH
 j16ROAYlk8/QmUFivnX7oGT1kpc1TF2IyACh3W9NPSJUUaFMKuOvXh7itExrkzx08ERc
 PyntbpEt932gCKkR86biuXCM/rCAdWH4X1ofg+KEsTel8id7WapS80VxZU77UhUOU/Rw
 e70eEtSpzO80RkRXAQg+49btgEFiOrqzTapKjhJrIL/0rBejgJQOCpfPh+HJmAmXw0Xc
 tW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678278923;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Te0Wm1LBiLHbyjBQ4apLHzIYIeF5VCMITHqDeFoeL3c=;
 b=EKRpvyJPstdhXTsA8e+SdR9kGlH/tFpYAfT9KXTrY/EizwSMmF5lEljyYMR7leGllw
 r2C5jcY4J8YnIcY+A/tC4HaGYT4+p0C8jjuZhSArpzVXq9IEAb0lQzxsZH6U/Dd95oTg
 7rqOBlXMxiG4BxduZXBtQOoFGh2XcID66RmoFplm9J77nsRiV1sHOzos14M5v1E9Dh8W
 YN5CqsA6RCVv+nxzD7dLWNDWZnPnlnh9iSfqvaORS0aKvdPUL2Enk7yUimKcEgNsUfEq
 oCSVKmiVnkhP7Ibkcz64dxi2HuLVSiOHpn7pnNwMWJu1XtYS4+s7MRuPAa/VUSjvM42p
 tvqw==
X-Gm-Message-State: AO0yUKW04lTW7Jum/vsI88mI58PEnIYi2rmihDh0mfQqn1NRGtNPc0WC
 p2eTEdxSt1KU2MagGbACVKrbpMW3slnx8SL+UoOGgw==
X-Google-Smtp-Source: AK7set+wT84PGBj+94QLZa9jjubNNjq68RKKqm41jG5BChuSqdm07c0307nCBlq5YlWDhnsqSvsRE1NW+v6KzhRiMcM=
X-Received: by 2002:a5b:70c:0:b0:a30:38fb:a0b8 with SMTP id
 g12-20020a5b070c000000b00a3038fba0b8mr11038426ybq.9.1678278923492; Wed, 08
 Mar 2023 04:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20221102180705.459294-6-dmitry.baryshkov@linaro.org>
 <ZAhhrG6CliC83Oxr@hovoldconsulting.com>
In-Reply-To: <ZAhhrG6CliC83Oxr@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 8 Mar 2023 14:35:12 +0200
Message-ID: <CAA8EJprKDXYjd2zUdAGZkUEVt++XtA03RnCoYAfb-gJUz7tMsg@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drm/msm/hdmi: stop using
 drm_bridge_connector_en/disable_hpd()
To: Johan Hovold <johan@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Mar 2023 at 12:20, Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Nov 02, 2022 at 09:07:03PM +0300, Dmitry Baryshkov wrote:
> > The functionality of drm_bridge_connector_enable_hpd() and
> > drm_bridge_connector_disable_hpd() is provided automatically by the
> > drm_kms_poll helpers. Stop calling these functions manually.
>
> I stumbled over this one when investigating a hotplug-related crash in
> the MSM DRM driver which this series prevents by moving hotplug
> notification enable to drm_kms_helper_poll_enable().
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > index 93fe61b86967..a540c45d4fd3 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -348,8 +348,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> >               goto fail;
> >       }
> >
> > -     drm_bridge_connector_enable_hpd(hdmi->connector);
> > -
> >       ret = msm_hdmi_hpd_enable(hdmi->bridge);
> >       if (ret < 0) {
> >               DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
>
> It looks like you are now enabling hotplug events before the DRM driver
> is ready to receive them (i.e. msm_hdmi_hpd_enable() is called before
> drm_bridge_connector_enable_hpd()).
>
> Could this not lead to missed events or is the state being setup
> correctly somewhere else?
>
> Shouldn't the call to msm_hdmi_hpd_enable() be moved to when HPD is
> enabled either way (e.g. by being converted to a hpd_enable callback)?

Eventually I'll get to it (hopefully during this weekend). There is
one item which needs to be investigated, see [1]. I have to check if
this is applicable to earlier generations, which also means
resurrecting the msm8974 HDMI PHY patchset posted ages ago. I think
the initial status is determined correctly using the .detect(). At
least I saw no issues with this patchset. However, thanks for the
pointer.

[1] https://git.codelinaro.org/linaro/qcomlt/kernel/-/commit/6ae2c308555f470ba63f90b7171519a242f96a67


-- 
With best wishes
Dmitry
