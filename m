Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D94F4143CA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A30C6EB08;
	Wed, 22 Sep 2021 08:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF286EB08
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:31:06 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i4so8918865lfv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqUXF97FHokHFaspS5N9NpS5oQqTS9/8sAEl8M8vLYY=;
 b=iqFu3rPScomjBTMytMjc5RandB29d5qnn97lRvae7EtZrnHV+4TbcsdPPNVni6i9AS
 hajdjIBYy15HRW7h7jBeUyVUMTPErjCHkxOBtbI/0+LLzvDxacMBBZdvRDmWIdJkgBOJ
 KLZluGodoifQtlCgsxJc+XqoHcx4e2PZ083IADEJkqo54WajfZTdSMfpXu09sMGIQUY5
 cYmqWgv4DZVhHpDdTOzGDjSzS7jIcHPb6HBa5BIKtqpjZZIQFHyZzdIvTa1dTag/wmna
 yyhE2dX+s13R0kbVnuYE8m22jPJ8uSkMF9SKRRvVIoOihB3kwJELf174yWIxxabDlJCc
 M3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqUXF97FHokHFaspS5N9NpS5oQqTS9/8sAEl8M8vLYY=;
 b=nyGKNT17841iFPaNNMOJYViIVZf1dQ1fR5gU906J98kqNJMdD4A2r7ZMXHdc5Qdtzx
 7kNN7AtFEH8hV7rnmahkl9WfateHpdT6EX5Sm/dLZ8V7twdrpFYsLnipyMIVrNJp4oi6
 mcZOaSASCU3zjy+wmfGG/witThLOhJB+ByC0tI/eg2dXbUFvX2aNdyu9Psp32AMRQcGl
 djgga+qvnNYBTRRnMZaup6UIbatpwP/G7MJmDgDYjPOdIJSxLcyDZHQBwQdwYz18Zd4C
 SdP22coH7jd8oFKpmXjSedjdkTv3uZGHsQgwX4AbQtVURfhPJ+aqwBFUgzZLA3COa9kH
 KJ4g==
X-Gm-Message-State: AOAM531gDDtKIjQM8b7OosPaazyXhjgEdJ2eUCmUf8AwsTeUgt0gUbKc
 As31VLVrgAgy/ek6O1oB3UK6bnVAN4m8KA24pSQ=
X-Google-Smtp-Source: ABdhPJywVc2SZRfJcsGbClpDvwCi3MLO8/5THBL69UHUuFajpBYUR2yjbXa+hUSBvIS7ay5CX3e8eVedjRwt/bP/Mro=
X-Received: by 2002:a05:6512:3d05:: with SMTP id
 d5mr25679953lfv.78.1632299464916; 
 Wed, 22 Sep 2021 01:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210910130941.1740182-1-maxime@cerno.tech>
 <20210910130941.1740182-2-maxime@cerno.tech>
 <CAMeQTsaFdqVQt5+FhWL1VeBpLvpCPgKX6R5tEc_jzAFVRWH5Vg@mail.gmail.com>
 <20210922082257.3cjhwvexatvpigp5@gilmour>
In-Reply-To: <20210922082257.3cjhwvexatvpigp5@gilmour>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 22 Sep 2021 10:30:53 +0200
Message-ID: <CAMeQTsYZTA1SZ7_KjZ5DjfbgxDty9jsWi65Yj9mn5Mmuf8J0Dw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: Add a function to abstract away panels
To: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Wed, Sep 22, 2021 at 10:23 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Patrik,
>
> On Tue, Sep 21, 2021 at 02:47:49PM +0200, Patrik Jakobsson wrote:
> > On Fri, Sep 10, 2021 at 3:10 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Display drivers so far need to have a lot of boilerplate to first
> > > retrieve either the panel or bridge that they are connected to using
> > > drm_of_find_panel_or_bridge(), and then either deal with each with ad-hoc
> > > functions or create a drm panel bridge through drm_panel_bridge_add.
> > >
> > > In order to reduce the boilerplate and hopefully create a path of least
> > > resistance towards using the DRM panel bridge layer, let's create the
> > > function devm_drm_of_get_next to reduce that boilerplate.
> >
> > Hi Maxime,
> >
> > This patch creates a dependency error for me:
> >
> > depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper
> > depmod: ERROR: Cycle detected: cec
> > depmod: ERROR: Found 2 modules in dependency cycles!
>
> I just pushed a fix to drm-misc-fixes that should address it

Great, thanks!

>
> Maxime
