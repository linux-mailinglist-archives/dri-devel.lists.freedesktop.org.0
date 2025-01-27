Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B0CA1FF9F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 22:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7106C10E232;
	Mon, 27 Jan 2025 21:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SrLRga5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA5610E232
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 21:23:51 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-540201cfedbso4808623e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 13:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738013028; x=1738617828;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9z27C3d28PfQDN7/0L4qi1vnTUImbSxfX+feBp7f9s=;
 b=SrLRga5y1Zn2HGd8sJvA9gGnAiA1zhf8dsZOZbTbmcQZv3FHCKSYEjeK49Fii+7Q5T
 FgjMIY81JBhXPVJbt950xBkepXqGG4pdBr0nD8tytDDn8uiDfU4QFvJJS8RZZ+orbv93
 qHRxm2jp4KqUSis0/KKVFAgIfx0ES5IqBxW8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738013028; x=1738617828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K9z27C3d28PfQDN7/0L4qi1vnTUImbSxfX+feBp7f9s=;
 b=vLAgPKhSHvKlJyIACsPeBLti6Lx/8N4xzf/Cdl8O5jxxkQyj0QEIIFODhnQyUX/D4x
 /WvXZ1oPjDv5sLJIovwGL38a4SB5yXtSQqprW6D28uoS1dtYq2uA7OXunMQ2b7I8X1ma
 rqRhhVqybN9hqxtH7OriQ4DPX/5M/8CN4uL22Tu6ZnulSQf2fsJYlASotih0lK7ILeMb
 /vEhTlbwUctTf4+dDJ/Dn0I2ytsHfjQUNrerfPNA4pB8zpRwKDe5VYKWmDFAWiqxKrda
 wb8kRa67c+sfZdGwP0ftPKmPY0PbPQQJnd9XZNgUnE4yLMkoySuelZXYDdmd6JJAhcuu
 r/rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqXmG8gSAsdaBtP/kyk89i5pC5JV3qhOm6JzdVcegWfEPNLiGeoRz4dn7tChm/cWqAZ0VzmUcOSRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8Zr5iOOfCDisZd9230BAuMa2H7bQgStiKHybbTi+mhgm8zdXo
 YqMY85xAKbP8fL60I0pRCyy8tgRaODrbLL2+bVgQ/hlIfKwd4QEB8gtC+rg9TMXJhnJNbh8zN3x
 0uS3N
X-Gm-Gg: ASbGncuYF8+FJnDU8XIfMoBVs0vv88CAXFqaelDhRj64mvYnW9db7bJIxp8ZK9CTk11
 FcZc9j/tz9BPutkYt5yy7CHEhH992ISM8V+unZJihSO+L7usk/dwyBvCcufhFdEygNytCK25tQu
 3paT3OByKmNjr9VePCo9+Li+z1PDdAiUuW+G8643ScjhmzOnPYXKNpEsIl6ugQGOEIPO7sqGJI0
 nsmixtWOoJvi7RAWBikCA/xbMRVF/JieBkurZcvUDRBi7FPw74WsI6T3rDHX71v7vxTq0jOe4Us
 IBwIkfiM4VIV1FRlVVueWL7/5acj0a27wF4umem42GJD
X-Google-Smtp-Source: AGHT+IH8IVfWTlALamN4DCTUvwQojCC/tQjthMeTNdRz1UQ4XNlwq2VARRsr27di4dGJu8bpsemhXQ==
X-Received: by 2002:a05:6512:33cf:b0:542:2e04:edb4 with SMTP id
 2adb3069b0e04-5439c23f3d6mr14671848e87.13.1738013028330; 
 Mon, 27 Jan 2025 13:23:48 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8227306sm1409828e87.45.2025.01.27.13.23.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:23:47 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-540201cfedbso4808591e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 13:23:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUdVkAexVPDgtAq12oAi1cdk9Xy5s6dqHK2jU4yhFRogRfDMdG1BFRl3KUJ+GRp7VUsVbSGsAoVito=@lists.freedesktop.org
X-Received: by 2002:ac2:4142:0:b0:543:9a61:a2e7 with SMTP id
 2adb3069b0e04-5439c285a52mr12377284e87.48.1738013027148; Mon, 27 Jan 2025
 13:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>
 <Z5c7vk_oa8HGt7sS@ninjato>
 <hywmnv4jf6ix2ziabdftd5zcjqnkfq6pmqxqzw6spc76camrxz@jn5vr4mgj37v>
In-Reply-To: <hywmnv4jf6ix2ziabdftd5zcjqnkfq6pmqxqzw6spc76camrxz@jn5vr4mgj37v>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Jan 2025 13:23:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V_cs1mc-6LJ21OYbTc8=_3RQYEOBACOSE1iX2woa7nXg@mail.gmail.com>
X-Gm-Features: AWEUYZnx38IXHrmZ6BFesBeUqpYTbDF-scbQFr7zXddXc-88xwqYhvygpTf_3Tc
Message-ID: <CAD=FV=V_cs1mc-6LJ21OYbTc8=_3RQYEOBACOSE1iX2woa7nXg@mail.gmail.com>
Subject: Re: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
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

On Mon, Jan 27, 2025 at 7:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Jan 27, 2025 at 08:54:38AM +0100, Wolfram Sang wrote:
> > Hi Dmitry,
> >
> > thanks for the review!
> >
> > > > The I2C core now offers a debugfs-directory per client. Use it and
> > > > remove the custom handling in drm bridge drivers. I don't have the
> > > > hardware, so I hope I can find people willing to test here. Build b=
ots
> > > > are happy. And for it6505, it even fixes a problem. See the patch
> > > > description there.
> > >
> > > I'd say, it should be done in a slightly different way: bridges have =
the
> > > debugfs_init() callback, which is used by drm_bridge_connector (and c=
an
> > > be used by other bridge-created connetors) in order to create per-bri=
dge
> > > debugfs data. Please consider using it to create per-bridge debugfs d=
ata.
> >
> > ACK.
> >
> > > Note, that callbacks gets connector's dentry as an argument, so bridg=
es
> > > still should probably create a subdir for their own stuff.
> >
> > I wonder if this is necessary (I just looked at the code and have no
> > hardware to test this, sadly). It looks to me as:
> >
> > - DRM has already debugfs infrastructure, yet those drivers don't use i=
t

Yeah, I think ti-sn65dsi86's debugfs code is a bit older (2019) and
predates the debugfs infrastructure in drm_bridge (2022). I only added
the debugfs code to drm bridge in order to get it for panels because I
wanted it in panel-edp, but glad it's useful for other cases. ;-)


> > - but they should
> > - the new I2C client debugfs infrastructure is, thus, not needed here

I don't personally have a strong opinion between using the i2c client
infra vs. the drm_bridge infra. Both seem better than how we're doing
it right now on ti-sn65dsi86 and just putting the debugfs directory at
the top level. ;-) If Dmitry wants it to use the drm_bridge infra that
sounds good to me.


> > - DRM provides a dentry to the callbacks which drivers can "just use"
> > - all drivers I looked at just put files there and never clean up
> >   (because the subsystem does it)
> >
> > So, from that, I should switch to the debugfs_init() callback and just
> > use the dentry provided?
>
> Yes, please. Create a per-bridge subdir under that dentry, but I think
> that was the case anyway.

FWIW, when I look for the debugfs file created for panel-edp.c on my
system, I see:

/sys/kernel/debug/dri/ae01000.display-controller/eDP-1/panel/detected_panel

The "panel" directory gets created in
"drivers/gpu/drm/bridge/panel.c", so if a bridge created a file
straight in the dentry passed it would have gone straight to
"/sys/kernel/debug/dri/ae01000.display-controller/eDP-1". ...so you'd
want some type of directory under there. In ti-sn65dsi86's case you
could presumably keep the existing behavior where it creates a
directory under there called "1-002c".

-Doug
