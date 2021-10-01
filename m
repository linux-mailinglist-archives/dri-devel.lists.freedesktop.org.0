Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AAF41F6D9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 23:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7C16E566;
	Fri,  1 Oct 2021 21:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC826E566
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 21:23:42 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 o59-20020a9d2241000000b0054745f28c69so13091723ota.13
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 14:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQO+lMXU6VmqpbbuMNNIj4s/iSRqxxtzgzbizBnbLmk=;
 b=iSh459FN5Z6Hqy9OYQZTytx3xm7vgeROeRrUA3KkjbSpJr6gHBeJtPg+IG1UktWtKi
 j0nWzggnhcvpJsq6Oc90kySnuaUsE8mLUC3eHw503Ya41vqpbvJSsWuEN9YKwUQQAQ2f
 ku+ZlpxCosstDPHAfe22bGGCKuGlOe0VgHbA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQO+lMXU6VmqpbbuMNNIj4s/iSRqxxtzgzbizBnbLmk=;
 b=a8G6X321wPIBMcGnrMmal81mtwJ8nZXgWCzY8kQzFjWIHAhUnUShLGnQ3HE789DpRJ
 RUx3ZNl9WkohGBs3PluQpjpONeLtPUHXvWsTEHdywRKAkEeaCM7jg/Z1CICCkNhiBMeI
 /6rj4BIJVxiUerJe74FS8T5Kkb24Tbx9sZ/0Osgb8YHJw54kjwUKARaoa/J6fcUdySsI
 TVNvo/Gww+iB4oyNQDyMMoh6If8BEB6Ph7P+xeUfy6oupqWAjCQM+q2Aoe++HyM9bwKa
 eeFlL2PVOxWoncDlMBur+WjWhzBb7BJDlRALZLkZs3ZJq75NoJad6n02vbblGV0yz0ws
 uZug==
X-Gm-Message-State: AOAM530vPOyBlbRhtiSM1sgAkBpDu+ONuCiv2TezJ0TrVmY0hKNxGOfr
 V+a4X1ujpBc7xqKMJlqk4Z3RYIDOa7j3Fw==
X-Google-Smtp-Source: ABdhPJwYvma6IuEEJypt51e0GcIiYN9MvRNVToPDhVtM0VXq7OURhiQMrPvTxnP6q4BAoVRN/bnTSw==
X-Received: by 2002:a9d:4e04:: with SMTP id p4mr43901otf.375.1633123421679;
 Fri, 01 Oct 2021 14:23:41 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
 [209.85.210.47])
 by smtp.gmail.com with ESMTPSA id t17sm1429031otl.56.2021.10.01.14.23.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 14:23:41 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so13133884otq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 14:23:40 -0700 (PDT)
X-Received: by 2002:a05:6830:112:: with SMTP id
 i18mr82821otp.186.1633123420525; 
 Fri, 01 Oct 2021 14:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210929144010.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
 <20211001203722.GZ2515@art_vandelay>
In-Reply-To: <20211001203722.GZ2515@art_vandelay>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 1 Oct 2021 14:23:29 -0700
X-Gmail-Original-Message-ID: <CA+ASDXNqwGWLHV5sPeUebd1AzPzLJva5hWm-385A+5vgQYMvVQ@mail.gmail.com>
Message-ID: <CA+ASDXNqwGWLHV5sPeUebd1AzPzLJva5hWm-385A+5vgQYMvVQ@mail.gmail.com>
Subject: Re: [PATCH] drm/brdige: analogix_dp: Grab runtime PM reference for
 DP-AUX
To: Sean Paul <sean@poorly.run>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Linux Kernel <linux-kernel@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, stable <stable@vger.kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 1, 2021 at 1:37 PM Sean Paul <sean@poorly.run> wrote:
> On Wed, Sep 29, 2021 at 02:41:03PM -0700, Brian Norris wrote:
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > @@ -1632,8 +1632,23 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
> >                                      struct drm_dp_aux_msg *msg)
> >  {
> >       struct analogix_dp_device *dp = to_dp(aux);
> > +     int ret, ret2;
> >
> > -     return analogix_dp_transfer(dp, msg);
> > +     ret = analogix_dp_prepare_panel(dp, true, false);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(dp->dev, "Failed to prepare panel (%d)\n", ret);
>
> s/DRM_DEV_ERROR/drm_err/

Sure. Now that I'm looking a second time, I see the header recommends this.

> > +             return ret;
> > +     }
> > +
> > +     pm_runtime_get_sync(dp->dev);
> > +     ret = analogix_dp_transfer(dp, msg);
> > +     pm_runtime_put(dp->dev);
> > +
> > +     ret2 = analogix_dp_prepare_panel(dp, false, false);
> > +     if (ret2)
> > +             DRM_DEV_ERROR(dp->dev, "Failed to unprepare panel (%d)\n", ret2);
>
> What's the reasoning for not propagating unprepare failures? I feel like that
> should be fair game.

I suppose the underlying reason is laziness, sorry. But a related
reason is the we probably should prefer propagating the
analogix_dp_transfer() error, if it's non-zero, rather than the
unprepare error. That's not too hard to do though, even if it's
slightly more awkward.

> > +
> > +     return ret;
> >  }
> >
> >  struct analogix_dp_device *

v2 coming.

Regards,
Brian
