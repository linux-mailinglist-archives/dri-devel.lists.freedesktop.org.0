Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51783BC25
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 09:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FE210E0D8;
	Thu, 25 Jan 2024 08:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09E010EA73
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 21:59:24 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so5988168b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 13:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706133504; x=1706738304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUJUOs+bThK9dGxB+Sx01k3VOX9ACqMj4VBsHio7vIM=;
 b=VkN6Rg1SmNBt61+ZBeD3sxdlhH9diSfzE/mt6Covg0xjulEZC8u1YdVLzR08Oz/61Z
 PaYv2U4nc9vutsKJX35Mxgq3FwDYDgG+zDZ082b02oOQiCULbmc5MR95id8zpj4+oCie
 Z84qxjAkhKdFyGRqaSojxii9VwRx0jZTl0C1fvEGIvb+m75BGytl4K6rnFesK7GyJaH4
 srKRwFQutaXF3Jzyt9qiQKNGHiWN/+DvJBQSOrnLhFFzYtuS5P9ekRxllkNjA+jSkMQ3
 8Id/jDMxys9UvAArim8vn5OSkVdXOKzsjG4nq2gnMbKxkTEuDNCrV4CJdVR6KI00tWnP
 vwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706133504; x=1706738304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gUJUOs+bThK9dGxB+Sx01k3VOX9ACqMj4VBsHio7vIM=;
 b=feA/Fogh0qxNJ6gvoixQdWMDqoKyg7ltDQ4LXNfYSRaj2IAKBYvHAm5CYGLja3aYao
 DCW6qPc3qC19c5aceoRMiayilNk96t036BhR/jT6Q4HIREsBGcuhmmmiFR3qjcv76nlb
 T7c8luZfa86X8oQQe7kB9Alcy2YCMdDkfnoLT4846L/8rizq7FWn/VkADEI7wH5d6joY
 G+UwKaAHZDjWbL44OsiNIWfu3ztoShOD+VmNZe9G6hLFyX7d1EPrz2l0w94o/rvjUnpi
 NRlYEaRVvF5vnoj+4qyltzJ2xu1Gt/QQE3N/On8DuNhYztJnwz+esWmIH8SdX4u8KL2G
 cAlw==
X-Gm-Message-State: AOJu0YzudiEbbtXjYgglXnx4Z7Kt8b4X37I4d4/eKQvaYv8vnkbruH2J
 26gU3M5wnuUR3ZyBeoWt2weeh1Y/bvIaE2PqBvcKyQOtYlhk349cH+kpdvrrNz0GuHQrckWEgoG
 r3VbuIWUpdJAdYBKa99ADb3t05Xw=
X-Google-Smtp-Source: AGHT+IFS8OnYe/kdTuuc/r51cDQZoMJ66CNFtnW1grppwVuSlq7ouq9zzRmTg7Lg6fCVCce6JM9z/uXvqOy1GcaYpVI=
X-Received: by 2002:a05:6a20:a889:b0:19c:62d5:32d4 with SMTP id
 ca9-20020a056a20a88900b0019c62d532d4mr75685pzb.99.1706133504389; Wed, 24 Jan
 2024 13:58:24 -0800 (PST)
MIME-Version: 1.0
References: <CADBGO79JycAycKXm9A46pLrGZHTsySV4NH+yvV7VFU-8reMF=Q@mail.gmail.com>
 <CADBGO78cNfZZFA_iDbjatiyvSwF3G7DjbddqTpQyw4zMoyC5ZQ@mail.gmail.com>
In-Reply-To: <CADBGO78cNfZZFA_iDbjatiyvSwF3G7DjbddqTpQyw4zMoyC5ZQ@mail.gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Wed, 24 Jan 2024 14:57:57 -0700
Message-ID: <CADBGO7-V40=pw+UjAptYu4fAQiDoGequbZLmpO=HoAyXs3hYaQ@mail.gmail.com>
Subject: Re: [REGRESSION BISECTED] 6.8-rc1 - Wayland hangs when connecting via
 VNC or RDP
To: Luben Tuikov <ltuikov89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 25 Jan 2024 08:37:05 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah, I see that Mario already posted a patch for a "frozen desktop" problem =
here:

https://lore.kernel.org/lkml/CAOVeLGSczkyhj61T8SZc2cK1Cjy2izV6URVa2422kcfy8=
ONYFw@mail.gmail.com/T/#t

and I can confirm that patch fixes my problem as well. Sorry for the noise.

Thanks,
Paul

On Wed, Jan 24, 2024 at 1:21=E2=80=AFPM Paul Zimmerman <pauldzim@gmail.com>=
 wrote:
>
> I forgot to say what graphics driver I'm using. It is amdgpu.
>
> p.s. Sorry for the bad formatting in my previous email, it has been a whi=
le
> since I posted to LKML.
>
> Thanks,
> Paul
>
> On Wed, Jan 24, 2024 at 12:47=E2=80=AFPM Paul Zimmerman <pauldzim@gmail.c=
om> wrote:
> >
> > When I attempt to connect via VNC or RDP to my Ubuntu desktop, the Wayl=
and
> > server seems to hang. The desktop GUI no longer works either locally or
> > remotely. I can still log in via ssh, so the system is still alive,
> > but the GUI is
> > frozen. If I boot into Xorg instead, everything works fine. Kernel 6.7
> > works fine
> > also.
> >
> > I bisected this to commit f7fe64ad0f22 "drm/sched: Split free_job into
> > own work item".
> > That commit does not revert cleanly however.
> >
> > I don't see anything in dmesg when this happens. Here is a snippet from
> > journalctl when it happens:
> > Jan 23 16:14:30 paulz-Precision-5820-Tower systemd[2826]: Started
> > Tracker metadata extractor.
> > Jan 23 16:14:55 paulz-Precision-5820-Tower systemd[2826]: Started
> > Application launched by gnome-session-binary.
> > Jan 23 16:16:47 paulz-Precision-5820-Tower
> > gnome-remote-desktop-daemon[4158]: [16:16:47:810] [4158:4896]
> > [ERROR][com.freerdp.core.peer] - Incorrect RDP header.
> > Jan 23 16:16:47 paulz-Precision-5820-Tower
> > gnome-remote-desktop-daemon[4158]: [16:16:47:810] [4158:4896]
> > [ERROR][com.freerdp.core.peer] - peer_recv_callback:
> > CONNECTION_STATE_ACTIVE - peer_recv_pdu() fail
> > Jan 23 16:16:47 paulz-Precision-5820-Tower
> > gnome-remote-desktop-daemon[4158]: [16:16:47:810] [4158:4896]
> > [ERROR][com.freerdp.core.transport] - transport_check_fds:
> > transport->ReceiveCallback() - -1
> > Jan 23 16:16:47 paulz-Precision-5820-Tower gnome-remote-de[4158]:
> > Unable to check file descriptor, closing connection
> > Jan 23 16:16:47 paulz-Precision-5820-Tower systemd[1]:
> > run-user-1001-gnome\x2dremote\x2ddesktop-cliprdr\x2d9Tp4LD.mount:
> > Deactivated successfully.
> >
> > This is on an x86_64 Xeon system running Ubuntu 22.04.3.  Any hints on =
how to
> > debug this further? Is there a way to turn on additional debug prints f=
or this?
> >
> > Thanks,
> > Paul
