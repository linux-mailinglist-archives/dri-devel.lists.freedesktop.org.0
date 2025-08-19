Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B96EB2C062
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5565210E5AA;
	Tue, 19 Aug 2025 11:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pe/gV2nY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0FB10E5AA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:28:43 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e934c8f961aso1923324276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1755602923; x=1756207723;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIpLciw+1XEu/4gPMiZnJGMUt60j6UkGL0YXIEPs+TY=;
 b=pe/gV2nYIaIuBfoBJ2kx5fc5AoZV9e3zkxY7ARMz4LAbOZTwaLGZZcWZ28A16yyimz
 1o7vWNEdoPaKGRtw6MhnsjieeXnfOpcv3T/GG+5QIOh30JxTRSfMnESc1nJxUBBQuGSG
 F7+1C/OjqVBCw3fz4wXvEyKljlZr1zYBKsWF87a26McZ2KMy3y8QAm0vH1RRNRBiuVKl
 9hzOK5a7wYsAcm6ryXYnWwVsklawT9EUYgS7EFAxk/gPBQofcQNWcdxrY0Us9DaJhv2C
 fhrLZISYFf6dvkiOy/R6KCSkMv5NGAaGiaS5RJMQWaHr/Aw9dMF48LoDA8ZU7aigc+4S
 8WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755602923; x=1756207723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AIpLciw+1XEu/4gPMiZnJGMUt60j6UkGL0YXIEPs+TY=;
 b=lcwsCZwSs2TcJPIFhx8yRyYaRLAqzdyHcBWY/QnKdfP7TwhIQc6vHma0ynLpYX8301
 vyFgJyw7kt7GXl8ebMGQex5oDJWYkC3jjGhe2qEWEaD4V0/FujuDUV9ruFG6vhnt9H0A
 fPocHaV2M+Ds7/GTEUEOczLTg3/AlEyyEGtVhvTTptyBw/y3UIPj4HAsqN7wWbo6I4wf
 5KK75T6y6T+yxzrNoHosUFuKRElJWKzGLqnkIM3fM2e3YS75skoJcUlk8H1emzPH6wEj
 qBUlt/BWBtgbUVtlRBijh7BMi56I5tlHV+M+X0wWLUAMu/e0v1dUQZFXUK6oZoYTkGfg
 Hhtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnyYYwh+oc0OSXiz+ggbDHUiWrmjyMhpzf0B/61v8qxbXO0dmo9/3c4t5SLJKn7NSJ+JaT2Y5vSBg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEXLMv2MgdAwf5d0JX6Z7DLjt3SveC5eLeVyZMnFUJcqthF0gA
 86ecO5nrjrMKBhbBnxkj1CZ1lF3CqzBQhsQ6Y3ZcED4Bln3qwg1j3/yG1m55P7hITQZIKL2X3pj
 Pa+cfezOfDN6KyZGktYsp0nVz1FcfuHt+6r8lRzuIQA==
X-Gm-Gg: ASbGnctgklMlJLnl8SXBPkGBVZ/7kNRjB/NfOpRo31+3x9NZiSwsJjG9jN6vgOV97nn
 wcosiMT47hLZ3wn5o8OHlKmOaRPZkkdf+onJjAuUENhpMNoqvKTUM5QfeDf9cm+4WWJd+g6nmH3
 uLyJ5cydLEEoi27TZ3VtvoFLnXgI4zlGAFKzqH/Y4uOGaF9+YxkRhI4tw62/RYMUS68l4GFxkb3
 8qGiV2zvoBi+7Vg6bYF4Mxqe7sw5jJSm6eSMRQ4tFOGQ9M7cQ==
X-Google-Smtp-Source: AGHT+IG/wHjJd0uy/3FLG7fBMCiAI52cyNR0ZLVdEi2rD6nkFaQbn6okYNWT8up2/jc1S+MzYBUHsR02oAJoY8whuEI=
X-Received: by 2002:a05:690c:7209:b0:714:268:a9f8 with SMTP id
 00721157ae682-71f9d61d74cmr22846967b3.27.1755602922860; Tue, 19 Aug 2025
 04:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250807-drm-vc4-extra-formats-v2-0-fadc93844551@raspberrypi.com>
 <26f31ab8-1b9f-466e-aa9e-2b76bec7a364@collabora.com>
In-Reply-To: <26f31ab8-1b9f-466e-aa9e-2b76bec7a364@collabora.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Aug 2025 12:28:24 +0100
X-Gm-Features: Ac12FXx3lj2u6gCEsaioe_ILwD0hCHIhxZB4MQMwCNCYBCspDHiMigskd6GA-ew
Message-ID: <CAPY8ntDJEyexsrQAWmzaunECxnT3F0zDzVhwe5gHmA_zAnW_8g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm: vc4: Add support for additional 10/12/16bit
 YUV plane formats
To: Robert Mader <robert.mader@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Robert

On Mon, 18 Aug 2025 at 11:46, Robert Mader <robert.mader@collabora.com> wro=
te:
>
> On 07.08.25 15:28, Dave Stevenson wrote:
> > We'd been asked if the S01x YUV formats could be supported on Pi5 as so=
me
> > software codecs produce them.
> > The answer was yes, so this patch adds them and the P01x formats.
>
> I tested this with the Gstreamer MR from 1 and can confirm that the
> formats P010, P012, P016, S010 and S012 work as expected.
>
> Unfortunately S016 is not supported by Gstreamer yet - however chances
> seem high that it works as well.
>
> Thus the series is:
>
> Tested-by: Robert Mader <robert.mader@collabora.com>

Thanks for testing.

In combination with my MR to libdrm/modetest to support these
formats[1], I'm happy that S016 works.
Your testing through Gstreamer gives me confidence that I haven't
messed up both my kernel patch and modetest setup in the same way :-)

Thanks again
  Dave

[1] https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/425

> 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/85=
40
>
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> > Changes in v2:
> > - Swapped from adding an extra bool hvs6_only to having a min_gen for
> >    each format (suggested by Ma=C3=ADra)
> > - Link to v1: https://lore.kernel.org/r/20250724-drm-vc4-extra-formats-=
v1-1-67fa80597fad@raspberrypi.com
> >
> > ---
> > Dave Stevenson (2):
> >        drm/vc4: plane: Flag formats as having a minimum generation
> >        drm/vc4: plane: Add support for P01[026] and S01[026] formats
> >
> >   drivers/gpu/drm/vc4/vc4_plane.c | 56 ++++++++++++++++++++++++++++++++=
+++------
> >   drivers/gpu/drm/vc4/vc4_regs.h  |  9 +++++++
> >   2 files changed, 58 insertions(+), 7 deletions(-)
> > ---
> > base-commit: d2b48f2b30f25997a1ae1ad0cefac68c25f8c330
> > change-id: 20250724-drm-vc4-extra-formats-1f53e6491cc1
> >
> > Best regards,
>
> --
> Robert Mader
> Consultant Software Developer
>
> Collabora Ltd.
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718
>
