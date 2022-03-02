Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C80B14C9ADC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 03:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A6F10E15B;
	Wed,  2 Mar 2022 02:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D73D10E15B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 02:03:32 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 k9-20020a056830242900b005ad25f8ebfdso413119ots.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 18:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MVhWLewea9Kbp4+jmYh/qLY6kiLHJdrGhuGIPKoejkU=;
 b=j8ELH0UmrgvS6wz6hFWYrb/ptIXj4OGBI3/IaaFFymBS4/SwuKvJkbVHGxtUrDuqNl
 hsRVUnkrI/hS3ZjBNA/xRs6w4ipPsKjosZOLqYfRttj+FFWg6iZAoKACkvXpm4wlE9Nn
 D5bUXfQGOrXXat87sRQg//iOucEnAnZ+EYa0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVhWLewea9Kbp4+jmYh/qLY6kiLHJdrGhuGIPKoejkU=;
 b=7cP6nh4nNmWLy25WSKp9t4OPmSqo7Vvwmo9NGSy19ZG+cIRBgQ+q9qCnAm//8gzM8f
 J+58vguSTymO04q5j73cVl+hJX550yc5vYkFpl+iaZbHLjJd8q+2yhND7Ag9y1zaUqJ0
 yel78pBWu41idrcH/6BmyXQzx0r0LHFcYs9WnO8pu+w081/kGSC/LdppjedTC+6xK5Bo
 szGXVPNmLOmaHWnGgKi0zqbUBTa8DC1ubeEoz6f6iph/3bN0t+9NIOafcrJI560KXxMN
 W8vNS0cMBUJmmDBxG1FuCUIG3ki+ajZHSwwBwFwWB0JuAwmU4mlRE+KGlanhrvPeSC7A
 53tQ==
X-Gm-Message-State: AOAM5304DSdtBQ7wFr6ltXj5Wc7xsl/VVypGBGpUAlE1fy14AxZapdYQ
 lcPG9r+GmTSn5q2mBdvnoooKctXwLbcfwA==
X-Google-Smtp-Source: ABdhPJy58a/uuYsk+qa5/kRy4LNS0s80TfJeDiBBor4YN9Zq85kIhTJtXxRJ8smzIvpWEi3hswZBnA==
X-Received: by 2002:a05:6830:1518:b0:5af:5aa1:4dc1 with SMTP id
 k24-20020a056830151800b005af5aa14dc1mr14439114otp.284.1646186610933; 
 Tue, 01 Mar 2022 18:03:30 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com.
 [209.85.167.177]) by smtp.gmail.com with ESMTPSA id
 j9-20020a4aa649000000b0031ca80c6e60sm6970237oom.24.2022.03.01.18.03.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 18:03:29 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id y7so497880oih.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 18:03:29 -0800 (PST)
X-Received: by 2002:a05:6808:18a3:b0:2d5:7ce7:d456 with SMTP id
 bi35-20020a05680818a300b002d57ce7d456mr17402856oib.77.1646186609133; Tue, 01
 Mar 2022 18:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20220217144136.v3.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
 <20220217144136.v3.2.I48b18ab197c9b649d376cf8cfd934e59d338f86d@changeid>
 <CAD=FV=UudBo7aZqD8oGHAu94LEYovMtFq7hjwOG2_8yxUeNi_w@mail.gmail.com>
In-Reply-To: <CAD=FV=UudBo7aZqD8oGHAu94LEYovMtFq7hjwOG2_8yxUeNi_w@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 1 Mar 2022 18:03:18 -0800
X-Gmail-Original-Message-ID: <CA+ASDXPGpJystb0uFNT8f+FSzERC0-YxVfGLRo-U1uoTRMHY6Q@mail.gmail.com>
Message-ID: <CA+ASDXPGpJystb0uFNT8f+FSzERC0-YxVfGLRo-U1uoTRMHY6Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: analogix_dp: Enable autosuspend
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 2:10 PM Doug Anderson <dianders@chromium.org> wrote:
> On Thu, Feb 17, 2022 at 2:42 PM Brian Norris <briannorris@chromium.org> wrote:
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > @@ -1121,7 +1121,7 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
> >
> >                 pm_runtime_get_sync(dp->dev);
> >                 edid = drm_get_edid(connector, &dp->aux.ddc);
> > -               pm_runtime_put(dp->dev);
> > +               pm_runtime_put_autosuspend(dp->dev);
>
> So I think you can fully get rid of these ones now and rely on the
> ones in the aux transfer, right?

Yep, good catch.

> >                 if (edid) {
> >                         drm_connector_update_edid_property(&dp->connector,
> >                                                            edid);
> > @@ -1642,7 +1642,7 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
> >
> >         ret = analogix_dp_transfer(dp, msg);
> >  out:
> > -       pm_runtime_put(dp->dev);
> > +       pm_runtime_put_autosuspend(dp->dev);
> >
> >         return ret;
> >  }
> > @@ -1775,6 +1775,8 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> >         if (ret)
> >                 return ret;
> >
> > +       pm_runtime_use_autosuspend(dp->dev);
> > +       pm_runtime_set_autosuspend_delay(dp->dev, 100);
>
> It's explicitly listed in the Documentation that you need the
> corresponding pm_runtime_dont_use_autosuspend(). Specifically, it
> says:
>
> > Drivers in ->remove() callback should undo the runtime PM changes done
> > in ->probe(). Usually this means calling pm_runtime_disable(),
> > pm_runtime_dont_use_autosuspend() etc.
>
> Not that it's very common to see anyone actually get it right, but I
> seem to remember running into an issue when I didn't do it. I think
> ti-sn65dsi86 still has it wrong since I found out about this later.
> Need to write a patch up for that... Basically you want to put it
> right before the two calls in your driver to pm_runtime_disable().

Ack.

Speaking of API misfeatures that we missed: I've failed to call
pm_runtime_mark_last_busy(). I'll add that in the next rev, for the
cases where we weren't already calling *_put_sync() (i.e., presumably
we don't really care to wait around for autosuspend).

*gripe* What a silly API. *gripe*

Brian
