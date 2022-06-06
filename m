Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9653F5BA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 07:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A36212A9A4;
	Tue,  7 Jun 2022 05:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AEE10F6BD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 21:59:49 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id f12so12936816ilj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PZWlGVKRX/uGDq1klGm7cZ425jsoKJd+GykOkOiCdck=;
 b=RvXuuZl2YAQeMBRe0zzyF0NNKB1GFs2AYvdUMR+qmr3lTh8v9l3JzGLKVU1HsTHRFv
 HBi7A1oMDoCWnFWSPTaENFi3NPkVHMOzJ5ib7YNoK6FneL0Mx4uyPTzuMeOVedUe6D6o
 bn9CL8HqZdbG4VRLk2Yk9zS3xtf+VVEE50JLY4mw4+OMTzoJ9NJJXnxw6va+wrjdnX9X
 vwd4JbR/uZUebKTnqfykUN4t3Dzk8scD7TK2vshn/JSwru6Gjc629w7MMBUO9UTwE/FH
 dzu+sJFahtL+WEFY3z/eoSFt+RWfUu2bbPJm5I+R3Zfp66h4VEtYGDlhrFjQibRqiwOI
 yNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PZWlGVKRX/uGDq1klGm7cZ425jsoKJd+GykOkOiCdck=;
 b=AQ3rwXqLmdGa1BCikXEwtZAOgPCwxdV0P682je/kexFsJ0Y/0Go8+HQeDRvYPt/Hq+
 GEQ3XfABlY0QL8PZ29plYEj/zmYb8UC+keqjUoxgvI89o8h6XtWkdQKy83oYSoKOSD1+
 jC9Bo68FMlIoZ1m7fQmZwwIcgJYeltp3WIrgo/lwW8Z7r2GnhdUjE90n8xsM0Cl5aUry
 NBhnW6xy7Hp0LggcnPm0/RERYc/soDbpYxTHfdX9FhBkzdl43zFyO2k71IR7dDgsuYNa
 aM8wAADxUo0FdQMT3/VSV+HZaR+aFt5gNvjnWbU6amB9HNhbYPq36IPeUHgHHu8ANWEf
 xUbQ==
X-Gm-Message-State: AOAM531I4PJFeGFDdSvzSCgZzOBQa0bzcnZ2OCVr0wsDQ7RWd/2rUDXZ
 yTtq+Jbjjc5stVOGsPNWC+jrwg7h7XvlBEg6Mf9knA==
X-Google-Smtp-Source: ABdhPJxygdlanxVHU8Pgud1E6Xtr81aLOh/Q6GHXP7TGbQau29lt/1psaHC34MuiNq473rijnTOkyAiRu0I2n41aoJQ=
X-Received: by 2002:a92:cd8b:0:b0:2d4:74b0:f1b4 with SMTP id
 r11-20020a92cd8b000000b002d474b0f1b4mr9201560ilb.108.1654552788507; Mon, 06
 Jun 2022 14:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220506001822.890772-1-jshargo@chromium.org>
 <Ynku/J0KuplmKJ23@phenom.ffwll.local>
In-Reply-To: <Ynku/J0KuplmKJ23@phenom.ffwll.local>
From: Jim Shargo <jshargo@google.com>
Date: Mon, 6 Jun 2022 17:59:37 -0400
Message-ID: <CACmi3jE+g_GdPXTc7+uWzhPky2ak2rYwknXndeaEj7_vL802Cw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] drm/vkms: ConfigFS support
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 07 Jun 2022 05:55:10 +0000
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Melissa Wen <melissa.srw@gmail.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jim Shargo <jshargo@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for taking a look! Sorry for the delay in response, I've been
moving house and prototyping locally.

On Mon, May 9, 2022 at 11:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, May 06, 2022 at 12:18:20AM +0000, Jim Shargo wrote:
> > Hi!
> >
> > I wanted to send this patch out early to get some feedback on the layou=
t
> > of the code and new ConfigFS directory. I intend to follow this up with
> > a more complete patch set that uses this to, for instance, add more
> > connectors and toggle feature support.
> >
> > A few questions I had as someone new to kernel dev:
> >
> > 1. Would you prefer laying out all the objects right now or add them
> > as-needed? IMO it=E2=80=99s nice to lay things out now to make future w=
ork that
> > much easier.
> >
> > 2. Is the layout of /config/vkms/<type>s/<id>/<attributes> OK? If VKMS
> > would eventually want to support installing multiple devices, we could
> > do something like /config/vkms/card<N>/<type>s/<id>/<attributes>.
> >
> > 3. Should I split out the documention into a separate change?
> >
> > 4. Any other style / design thoughts?
> >
> > Thanks! I am excited to be reaching out and contributing.
>
> So the overall idea here is that a lot of these things cannot be changed
> once the vkms_device instance is created, due to how drm works. This is
> why struct vmks_config has been extracted. The rough flow would be:
>
> 1. you create a new directory in the vkms configfs directory when creatin=
g
> a new instance. This then gets populated with all the properties from
> vkms_config
>
> 2. user sets these properts through configfs
>
> 3. There is a special property called "registered" or similar, which
> starts out as 0/false. When set to 1/true the vkms_device will be
> registered with the vkms_config that's been prepared. After that point
> further changes to vkms_config are not allowed anymore at all (this might
> change later on for connector hotplug, which really is the only thing a
> drm_device can change at runtime).

I think this allows for a slightly easier initialization, too, where
we don't keep a half-built drm device around or need to manage ids in
any special way.

I'll get things working and send out a new patch set.

I'm also thinking that, to make life easier, we'll create the regular
default device during init and register it automatically, so unless
someone starts actively adding virtual devices things behavior remains
the same.

>
> 4. removal of the vkms_device could perhaps be done simply be deleting th=
e
> entire directory? I think that would be a nice clean interface.

Yep! I just got that wired up locally.

>
> So in other words, basing the configfs interface on drm objects doesn't
> work, because once the drm objects exist you cannot change the
> configuration anymore.

I wasn't 100% sure how much trouble we'd get into if we tried to set
DRM device properties at run time, but with this confirmation I think
that this staging/registration approach is the best.

> Cheers, Daniel
> >
> >
> > Jim Shargo (1):
> >   drm/vkms: Add basic support for ConfigFS to VKMS
> >
> >  Documentation/gpu/vkms.rst           |  23 +++++
> >  drivers/gpu/drm/Kconfig              |   1 +
> >  drivers/gpu/drm/vkms/Makefile        |   1 +
> >  drivers/gpu/drm/vkms/vkms_configfs.c | 129 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_drv.c      |  10 +++
> >  drivers/gpu/drm/vkms/vkms_drv.h      |  25 ++++++
> >  drivers/gpu/drm/vkms/vkms_output.c   |   2 +
> >  drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
> >  8 files changed, 193 insertions(+)
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> >
> > --
> > 2.36.0.512.ge40c2bad7a-goog
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
