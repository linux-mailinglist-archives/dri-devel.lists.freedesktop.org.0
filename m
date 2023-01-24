Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14451679ED7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 17:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD6D10E09D;
	Tue, 24 Jan 2023 16:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2558310E09D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 16:36:53 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-12c8312131fso18278838fac.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 08:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YYLWRA9vPd9yfXbJ7a0ET2/hrKjiJdd0fue5/twRuaA=;
 b=GQwD5Bwp3MFGx44dLBSYLWzCseidhTd7gKA3j+Eq6KWogLaHZ5uDhu/0noSzkyp355
 DxUSBr/aA3bi6NQzv4Ztojwruh6BE0LN/IrS1FSAABIrVT7LHbNYzihDD9KwAEPq9fH4
 4rhD+p4rrjKY+AMIAVaMZbOtwXUchWng7wbSgOzSIbgCqbAtrSavw727yAxQj4O5C1dh
 tF5H8r/aheZgS9TyIjpV+quB3pd2SHEChq6QEfh5/0LsOLiFB34JykAEFIWYWe137f3e
 f31VrXfB445g7yoBftcSg9Rcr0VXbfkd0U1jbida695qQIiOKtnrK5AJeolWs5YE/nOl
 GQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YYLWRA9vPd9yfXbJ7a0ET2/hrKjiJdd0fue5/twRuaA=;
 b=L21GXtIzOJ1xa84GZgWtQS3mLUKcUvcwuA4eJbQ9VyD9uJ6VtRK4VJH8hT8t6YjtX9
 IPL2YrR7qUjltBE8094PSwwYHaUvYy6vcLUag7DsUqz/op0N55WWwGZZ6rSxYUFpo9hz
 LeYw3XD07/UStv6Ljc/TrrIaR3G/U05Y3whfADXgFywgwJ+MnGTqIt+63Gd1qHS9ALNV
 wgkR6yd/HaSebrOdaZJasXLBuPM6a6jW3DRyM/DFhGrLb2iMQXZAET47CmeKFLhtnobI
 usKF/6CgVtJ6Dn3egoiYHeq/A1gp36yPJGvEEJVyNGSPgK5IyRF8RJ/5uo1ACHBjD4pt
 pNVQ==
X-Gm-Message-State: AFqh2kpoUlK33elKpkz+Bq1VNytt5Z0lSoK1bqO4bdxS+SbN7RHB5OR1
 MwfRrrj8x6T5BGpF/R+oHvkECMSpWYASweJ2ExkCo4CFhR8=
X-Google-Smtp-Source: AMrXdXvyTGBiCqmYUmS6ZFTDvibcOHjq8zVLrDLhs6+RKkrGo1FUawxc0chWtvvWPynDyfCijRbxqR8azn4Ud1pVoIo=
X-Received: by 2002:a05:6870:7a18:b0:15f:5509:9a0d with SMTP id
 hf24-20020a0568707a1800b0015f55099a0dmr2657757oab.46.1674578212402; Tue, 24
 Jan 2023 08:36:52 -0800 (PST)
MIME-Version: 1.0
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <04384589-3bb3-bbb6-ba0d-7a223555c5f4@suse.de>
In-Reply-To: <04384589-3bb3-bbb6-ba0d-7a223555c5f4@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Jan 2023 11:36:41 -0500
Message-ID: <CADnq5_PBZd8k8Q2ZTuOeuZOWfqScTaQWXpn__0FTeUFjRQdhQQ@mail.gmail.com>
Subject: Re: Amdgpu module is references even after unbinding the vtcon
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, "Slivka,
 Danijel" <Danijel.Slivka@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 11:15 AM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>
> Hi
>
> Am 24.01.23 um 15:12 schrieb Christian K=C3=B6nig:
> > Hi Thomas,
> >
> > we ran into a problem with the general fbcon/fbdev implementation and
> > though that you might have some idea.
> >
> > What happens is the following:
> > 1. We load amdgpu and get our normal fbcon.
> > 2. fbcon allocates a dump BO as backing store for the console.
> > 3. GDM/X/Applications start, new framebuffers are created BOs imported,
> > exported etc...
> > 4. Somehow X or GDM iterated over all the framebuffer objects the
> > kernels knows about and export them as DMA-buf.
> > 5. Application/X/GDM are stopped, handles closed, framebuffers released
> > etc...
> > 6. We unbind vtcon.
> >
> > At this point the amdgpu module usually has a reference count of 0 and
> > can be unloaded, but since GDM/X/Whoever iterated over all the known
> > framebuffers and exported them as DMA-buf (for whatever reason idk) we
> > now still have an exported DMA-buf and with it a reference to the modul=
e.
> >
> > Any idea how we could prevent that?
>
> No real clue, sorry.
>
> But does it change if you use a shadow buffer on top of the amdgpu BO?
> Set prefer_shadow_fbdev =3D 1. [1]   I once tried to run generic fbdev
> without prefer_shadow_fbdev and it never worked. I suspected that some
> reference counting got wrong, but could never pin it down.  Maybe your
> issue is similar.

Is that equivalent to setting mode_config.prefer_shadow =3D 1?  If so,
we already do that.

Alex

>
> That said, generic fbdev is not so super-optimal for TTM-based drivers.
> I'm working on improving that, but it's not there yet.
>
> Best regards
> Thomas
>
>
> [1]
> https://elixir.bootlin.com/linux/v6.0/source/include/drm/drm_mode_config.=
h#L890
>
> >
> > Thanks,
> > Christian.
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
