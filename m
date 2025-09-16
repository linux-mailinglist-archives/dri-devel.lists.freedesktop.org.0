Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDDEB5A45C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9952110E174;
	Tue, 16 Sep 2025 21:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ixtB8OQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D789C10E174
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:57:10 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-624fdf51b44so7173940a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758059829; x=1758664629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vcCSpX2Li+qXvKe8Kp7Skf6goKInsBALwmyVB8RNzM=;
 b=ixtB8OQg6lRgoJ0fjY3NFte747BHF8MjK4+gwB53RxwIzbNsCc8qMjyI+lTMm6iRpI
 CgGSitpO8spzsEjChkPDjpQ33uwR2iDAr/gBebuVmI7RFC1nxuDcoFfbzBBVcosZXQE1
 V+UG5cQ3JvBGwSfzgaqpsDpu8WKxFrwV/NQOGziI0wknublfUF8A9agcRh4VOrIyYMip
 zDlRWmWguugBA+/ruPUvyGGg9KDI17Gmx5ax7j2d5T4I5aw0L62iTyFUR7NF9tqdUieg
 hxC7d2aCunoIUuJMTA+yTFu+31FVpLIi+POECvCzfZD/awx4ZWcutoz04S2Z05HXpXJl
 cdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758059829; x=1758664629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6vcCSpX2Li+qXvKe8Kp7Skf6goKInsBALwmyVB8RNzM=;
 b=kwMAHrYIChE7qqaMK54DsXlYkDDp/RS0iM2E1gUu5D41xgppmjlJl4Kr8r58LcXC+D
 nxH4MpFIOEUqxUYmiSu3w1NtIzfZTnr48e4cFtXw8SXzzQPjPO7qFZTwOe7ioxU8aZJr
 JMbOc3Ez16pBH/B4T5kdsdIQ/lmtiJCEn3BxRU22tBfUW9uM29SvrORjEwQLZjCkmwNT
 LSGgWdSUw+bl0lixbip5bseK8xP1nj5NQWW3b/E/lBWEge/lL4oU1drssErKR49/VnTg
 nstDujMKPcOhRKJIrMTMgjUlrJJzrE1rbuP5IBAP0agKl+7c6EOmA2RcH82eiOveSC0d
 u0fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg00QbHbu6Pc3TUamFBI+AjG0p5gQ+DQ3qgl1fJzp1r1rDfrQ3uLb2BE9f2N6Z1c7yqVwH1VtMBs8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhvTfjAAk0f/OT9cGKWwJd6cJJG4kc4GzzO3KJ5IpS0UFzoBgv
 ++QEH/1uE8d5cApu/OwIeDuXw7Im7Fj2p3db972+EdLG9aNj38+UUBZSloG+fu51ECcYuKGqgSw
 EsTHxWizcUYkI5kp0yRJ/+LxcKwYtLgo=
X-Gm-Gg: ASbGncsKyUha+MbuQw9mR/xqH5weGCZ8i9MQJN5R6DStbC8lQY5KIBoaFUBwdm58lTh
 4JvS8UvAa5RzKquHAawC9pxquZj/TN0zZwnNk5RL6wERWLSdOntiHKzyhynCwEewIpd1np4cZpy
 53uHwXXa5Mi/DyckbcNSY3DYgtcIrWWVWXvjTmSu9s8rwhK2q/HOax70UYnoudoV4BY+9jMbOG5
 BZPz05lDxSC6UZV6xLTLpyqOEkMD5l0yYih8uKJug==
X-Google-Smtp-Source: AGHT+IF7kRP4Neo46TWnzdfobHZ2NOSwQx3rFbJLrHvuHRiL4z6S7dUNbmb7dxut+4Nf7YutIR659NbvLRhqx4Br00M=
X-Received: by 2002:a17:906:5806:b0:b09:2331:f149 with SMTP id
 a640c23a62f3a-b0923d9cb57mr1007850566b.65.1758059829056; Tue, 16 Sep 2025
 14:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
 <d52ec8d7-cc5e-4801-bc04-096504a131b7@mailbox.org>
In-Reply-To: <d52ec8d7-cc5e-4801-bc04-096504a131b7@mailbox.org>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Tue, 16 Sep 2025 23:56:57 +0200
X-Gm-Features: AS18NWAznwe4yNX7QnjbgqSRpw2HVsYQEdR2SwNC8IgmIZbD16CIQQKGV2e2Lxc
Message-ID: <CAFZQkGzWUK5BP_f=zyOM8_pzvv6xYOaVdqN4RAULArvEmD4wUg@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Derek Foreman <derek.foreman@collabora.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>, 
 harry.wentland@amd.com, Mario.Limonciello@amd.com, victoria@system76.com, 
 seanpaul@google.com, Sunpeng.Li@amd.com, dri-devel@lists.freedesktop.org
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

Am Mo., 15. Sept. 2025 um 17:49 Uhr schrieb Michel D=C3=A4nzer
<michel.daenzer@mailbox.org>:
>
> On 15.09.25 17:37, Derek Foreman wrote:
> > On 9/15/25 5:01 AM, Michel D=C3=A4nzer wrote:
> >> On 12.09.25 15:45, Derek Foreman wrote:
> >>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
> >>>> Introduce a DRM interface for DRM clients to further restrict the
> >>>> VRR Range within the panel supported VRR range on a per-commit
> >>>> basis.
> >>>>
> >>>> The goal is to give DRM client the ability to do frame-doubling/
> >>>> ramping themselves, or to set lower static refresh rates for power
> >>>> savings.
> >>> I'm interested in limiting the range of VRR to enable HDMI's QMS/Cine=
maVRR features - ie: switching to a fixed rate for media playback without i=
ncurring screen blackouts/resyncs/"bonks" during the switch.
> >>>
> >>> I could see using an interface such as this to do the frame rate limi=
ting, by setting the lower and upper bounds both to a media file's framerat=
e. However for that use case it's not precise enough, as video may have a r=
ate like 23.9760239... FPS.
> >>>
> >>> Would it be better to expose the limits as a numerator/denominator pa=
ir so a rate can be something like 24000/1001fps?
> >> I was thinking the properties could allow directly specifying the mini=
mum and maximum number of total scanlines per refresh cycle, based on the a=
ssumption the driver needs to program something along those lines.
> >
> > Surprisingly, this would also not be precise enough for exact media pla=
yback, as the exact intended framerate might not result in an integer numbe=
r of scan lines. When that happens a QMS/CinemaVRR capable HDMI source is e=
xpected to periodically post a frame with a single extra scan line to minim=
ize the error.
>
> Interesting, maybe your suggestion of numerator / denominator properties =
is better then.
API wise, I'd much prefer just using nanoseconds instead of two
properties that compositors will in practice just use the same way.

> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
