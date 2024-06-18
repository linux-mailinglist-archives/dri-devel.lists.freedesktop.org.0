Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3729490DE7B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 23:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8D710E7D4;
	Tue, 18 Jun 2024 21:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="P+rvhIxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7DC10E7D6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 21:34:17 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dff0712ede2so6353040276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718746455; x=1719351255;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ji2+efuOAd6wBtWA0zFIRf6hUgNxX8IdSNdDWlzGrZQ=;
 b=P+rvhIxdJCbHpwFdLvh9XnY9mRcYMIfeeACNQ5JsO7PskEGzlsPLTwdQoZf9mYVLqH
 yLJbz6Taz9yk/JQfNki1GR969tUdmILOsJfPhoMm9sOM3I3onmtOowno3SmHC4oH3x1K
 WK3QWQjBqR2J7MxaPRO4uuKcZ65j1MLQbgrOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746455; x=1719351255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ji2+efuOAd6wBtWA0zFIRf6hUgNxX8IdSNdDWlzGrZQ=;
 b=FOpY0zm6G77s2avF/TCozu+VMj9X6eDCtNdAovwc17MXGTmUeJBQY7KZJReDgmAf24
 ENvpsVDgrffDvM6OpsozoVr4Bs4MLazsjoOQvlRjSh6+wvuUnztcgW32FyQJlk8SCYae
 CU907A/xrvFD06GOfMirWaGKIhUkMoaxIAzQ17Lj54Ayrp5oqX2BOdLxlPLWs11IRexy
 jdR3RPkWuyykdizJYx0W5stcVfkP6ii3YOvkZMwS0RyHVVWAxjFLVZuoU/t2OptcYEpF
 YH8LYbQRpCLzTaE3bfIwWOkgK2izLjJYTO49oeOnRvz/VLY4sRrwEUQyDY2JhWT5yeqN
 JI5g==
X-Gm-Message-State: AOJu0Yxorf73Q3UD+OHG4LqBvZeXHMebRI60iOpBK0Y/j68pcWVAxecP
 mTQtNKQwo/Jtdrmhx3xnmPH5fiPIe3gf8IaKq/QRviTumop+ndNwRfkNSUGLdWrzVkz2a1NXlv0
 =
X-Google-Smtp-Source: AGHT+IE3+yTNIKRdHihQAfpPnWP0N9hIJAm/7EHbJK1UuuOlukq5tV7oRYlxNT6zAJ8uii+xO0vjBA==
X-Received: by 2002:a25:ab68:0:b0:e02:b46b:d6e1 with SMTP id
 3f1490d57ef6-e02be2304f0mr1060634276.60.1718746454874; 
 Tue, 18 Jun 2024 14:34:14 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5f10490sm70086416d6.141.2024.06.18.14.34.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 14:34:13 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-44056f72257so112451cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:34:13 -0700 (PDT)
X-Received: by 2002:ac8:5748:0:b0:441:630e:110a with SMTP id
 d75a77b69052e-444aa409525mr298631cf.17.1718746453359; Tue, 18 Jun 2024
 14:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152752.v2.8.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
 <CADnq5_PbqE0E2pP26mGD94cdc=tLZZsF10e7ZZWeC5AU-LS8vw@mail.gmail.com>
In-Reply-To: <CADnq5_PbqE0E2pP26mGD94cdc=tLZZsF10e7ZZWeC5AU-LS8vw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jun 2024 14:34:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJAiVGFn_Tqs_JNo1fQKFys3m=hH9MwmMot93gkdg=Qw@mail.gmail.com>
Message-ID: <CAD=FV=XJAiVGFn_Tqs_JNo1fQKFys3m=hH9MwmMot93gkdg=Qw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Candice Li <candice.li@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Le Ma <le.ma@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Victor Lu <victorchengchi.lu@amd.com>, amd-gfx@lists.freedesktop.org, 
 chenxuebing <chenxb_99091@126.com>, linux-kernel@vger.kernel.org
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


On Mon, Jun 17, 2024 at 8:01=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Wed, Jun 12, 2024 at 6:37=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > Based on grepping through the source code this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > time. Among other things, this means that if a panel is in use that it
> > won't be cleanly powered off at system shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart comes straight out of the kernel doc "driver
> > instance overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This commit is only compile-time tested.
> >
> > ...and further, I'd say that this patch is more of a plea for help
> > than a patch I think is actually right. I'm _fairly_ certain that
> > drm/amdgpu needs this call at shutdown time but the logic is a bit
> > hard for me to follow. I'd appreciate if anyone who actually knows
> > what this should look like could illuminate me, or perhaps even just
> > post a patch themselves!
>
> I'm not sure this patch makes sense or not.  The driver doesn't really
> do a formal tear down in its shutdown routine, it just quiesces the
> hardware.  What are the actual requirements of the shutdown function?
> In the past when we did a full driver tear down in shutdown, it
> delayed the shutdown sequence and users complained.

The "inspiration" for this patch is to handle panels properly.
Specifically, panels often have several power/enable signals going to
them and often have requirements that these signals are powered off in
the proper order with the proper delays between them. While we can't
always do so when the system crashes / reboots in an uncontrolled way,
panel manufacturers / HW Engineers get upset if we don't power things
off properly during an orderly shutdown/reboot. When panels are
powered off badly it can cause garbage on the screen and, so I've been
told, can even cause long term damage to the panels over time.

In Linux, some panel drivers have tried to ensure a proper poweroff of
the panel by handling the shutdown() call themselves. However, this is
ugly and panel maintainers want panel drivers to stop doing it. We
have removed the code doing this from most panels now [1]. Instead the
assumption is that the DRM modeset drivers should be calling
drm_atomic_helper_shutdown() which will make sure panels get an
orderly shutdown.

For a lot more details, see the cover letter [2] which then contains
links to even more discussions about the topic.

[1] https://lore.kernel.org/r/20240605002401.2848541-1-dianders@chromium.or=
g
[2] https://lore.kernel.org/r/20240612222435.3188234-1-dianders@chromium.or=
g
