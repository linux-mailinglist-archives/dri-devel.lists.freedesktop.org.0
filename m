Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF1F83BC26
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 09:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC53A10E67C;
	Thu, 25 Jan 2024 08:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A6F10F488
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 20:22:53 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6dd84fe7aebso1669695b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706127710; x=1706732510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMwNi5kNbBjiibbpUwYiOJds2nMSzlktlZQe4MVPO8Q=;
 b=RxrKfKBPUY1Lhae9dtUCxgFiXt2pbKJFA+rltX5Waf338PPxaLXGd/Dgw7FzsHIWAX
 CJjRdPOD20kyx+mQ01vly4crqCCKUnKnkuX6ei0V2iM1uf6Q+oPVQlqdIiGkAUEnkJOG
 U9Ww0trefErpNJOqDnDsaK8Z9XTKyvGvXtGQKgT5/q42Rdl7oluGY4Uk2jR9IPQl3uKq
 0Hx4gcUy/dhWpkCGlG4VJk8Zk0qQQ6FNSBzH1DkfNXNeL9zCJbnmDdbJdQloebon9aYR
 w303UAgOHISOTdNRrVsXMpEia+XYc3zTFuRilTzZidWMyfgm15uyAEWBTJRaz4l7SVEO
 ddkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706127710; x=1706732510;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gMwNi5kNbBjiibbpUwYiOJds2nMSzlktlZQe4MVPO8Q=;
 b=m2q1v81kAS+gxklBNOr83RMAs3CvqCn6ALyAz2OakpNWOeWUt5Sl3bNyuPgmI6pUIk
 pj0kUrZ4jiXVf1pgK2ADH0IebueRx40wiim2PBXghYaL0VGZ0cpkZgNaTgIRK6efkc5t
 kHUQMTz8JcAa+NVfFBT7yWRmRiJd9LptqcUBjdOM1/GF9E++6CL28+QPE83nDpgUFouR
 UoW/Mam72ea/3+iI/gXZTdus14KtHSJR2fLw5qNGyYw9hi3N3/0icFVlBv29vp7jW9CE
 RxfSlmXj9oZXqCsCvkiIEN8QiF7BaHbbRxzw/MBPuBUJ6HYE8j5BOpnxbUnQla4J31MC
 kpUw==
X-Gm-Message-State: AOJu0YwdhnjDizYey10fVJtghvqiKgq+SzNoEKh9ZMAT2QJl6W466LVd
 ZAGou6v8woynL/qJkdzSa3nZwMdXjG8ZccW5iufgUCgLU82J1sJxR4GMRpXZiX1r3GZIT4VvY3p
 G3cB0bw2G49IaX2h3qo9oXajsMCU=
X-Google-Smtp-Source: AGHT+IGDX6D0oFWtuFmABbjGrfo2fIBX+9sdMbFAJJSPrhHlAu3U99NIGliSiXlr+T1LZUpUf+2FYFbJk2PC6b5dWag=
X-Received: by 2002:aa7:9a11:0:b0:6db:e5d6:68c5 with SMTP id
 w17-20020aa79a11000000b006dbe5d668c5mr126236pfj.7.1706127710103; Wed, 24 Jan
 2024 12:21:50 -0800 (PST)
MIME-Version: 1.0
References: <CADBGO79JycAycKXm9A46pLrGZHTsySV4NH+yvV7VFU-8reMF=Q@mail.gmail.com>
In-Reply-To: <CADBGO79JycAycKXm9A46pLrGZHTsySV4NH+yvV7VFU-8reMF=Q@mail.gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Wed, 24 Jan 2024 13:21:23 -0700
Message-ID: <CADBGO78cNfZZFA_iDbjatiyvSwF3G7DjbddqTpQyw4zMoyC5ZQ@mail.gmail.com>
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

I forgot to say what graphics driver I'm using. It is amdgpu.

p.s. Sorry for the bad formatting in my previous email, it has been a while
since I posted to LKML.

Thanks,
Paul

On Wed, Jan 24, 2024 at 12:47=E2=80=AFPM Paul Zimmerman <pauldzim@gmail.com=
> wrote:
>
> When I attempt to connect via VNC or RDP to my Ubuntu desktop, the Waylan=
d
> server seems to hang. The desktop GUI no longer works either locally or
> remotely. I can still log in via ssh, so the system is still alive,
> but the GUI is
> frozen. If I boot into Xorg instead, everything works fine. Kernel 6.7
> works fine
> also.
>
> I bisected this to commit f7fe64ad0f22 "drm/sched: Split free_job into
> own work item".
> That commit does not revert cleanly however.
>
> I don't see anything in dmesg when this happens. Here is a snippet from
> journalctl when it happens:
> Jan 23 16:14:30 paulz-Precision-5820-Tower systemd[2826]: Started
> Tracker metadata extractor.
> Jan 23 16:14:55 paulz-Precision-5820-Tower systemd[2826]: Started
> Application launched by gnome-session-binary.
> Jan 23 16:16:47 paulz-Precision-5820-Tower
> gnome-remote-desktop-daemon[4158]: [16:16:47:810] [4158:4896]
> [ERROR][com.freerdp.core.peer] - Incorrect RDP header.
> Jan 23 16:16:47 paulz-Precision-5820-Tower
> gnome-remote-desktop-daemon[4158]: [16:16:47:810] [4158:4896]
> [ERROR][com.freerdp.core.peer] - peer_recv_callback:
> CONNECTION_STATE_ACTIVE - peer_recv_pdu() fail
> Jan 23 16:16:47 paulz-Precision-5820-Tower
> gnome-remote-desktop-daemon[4158]: [16:16:47:810] [4158:4896]
> [ERROR][com.freerdp.core.transport] - transport_check_fds:
> transport->ReceiveCallback() - -1
> Jan 23 16:16:47 paulz-Precision-5820-Tower gnome-remote-de[4158]:
> Unable to check file descriptor, closing connection
> Jan 23 16:16:47 paulz-Precision-5820-Tower systemd[1]:
> run-user-1001-gnome\x2dremote\x2ddesktop-cliprdr\x2d9Tp4LD.mount:
> Deactivated successfully.
>
> This is on an x86_64 Xeon system running Ubuntu 22.04.3.  Any hints on ho=
w to
> debug this further? Is there a way to turn on additional debug prints for=
 this?
>
> Thanks,
> Paul
