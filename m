Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0E9C3FAF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 14:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED51B10E4B4;
	Mon, 11 Nov 2024 13:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PmxK8WfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0184310E4B4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 13:42:29 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6ea50585bf2so42526667b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731332549; x=1731937349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOVU60syZuDHp0JNrqJ7EWmh83zOgByqn90mAhZeuHI=;
 b=PmxK8WfHstc4lOHhT+uqEl/xjFBAHFpaMoH4BKXChHWV6i+sDv7AcZEewCsyF7vg+q
 a9WoOOmf24s0em0ErwD7/zgXFhS3BGuu1jybp0sUn7OZleJhN47Rr9PL57N5/+F4c0KD
 v+5VwohYOT7iC+LDye5O8o0PVj7iTyE/eQnF1AFlp7aiZlXIApXkMLgE13ZWJk5edZal
 A8IXflNDEsLDkUNOanESbuBdlImcQ5i0LX2L8qFIKA8140Fa7j6utZrh1XQ75n2hFQX9
 p1s6yneb7F1GO5+iiG1agYubfvdjrWQo2Kikwv84Ex4jRDVp/WPZ2yCWvJU3itAfcpvU
 dJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731332549; x=1731937349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TOVU60syZuDHp0JNrqJ7EWmh83zOgByqn90mAhZeuHI=;
 b=In6C4cnDCAtWErLiUDT76KvHuqZCExMtFI5s1MCzYnn9PY1unYE18YtFOo6zj/eb+/
 Y3+NZ4B8f8JAu+bbIY9hOXMr2Q+RRZMCMZipUf7MhfGM793MEoJKGYqkbRtiTkjhbRlF
 FrCZqV6kwtyKq/nIDFXq3WYnsKliVFjLhktDhlqEimplM4dk3ifZUZPVC135oiYYz7lz
 Kfp2QsiBn7xKaqvCn38nDOkK/vptljpTJMLKT9A9BKh0g+n7uoGFDe7y7xeMEvHvHTlm
 ibI2SkxxaPBeL2PoM9OtYxfBrnXhf5qBlkMRpXUMZT5pEid7N9KGe6oRhOzaa0SqS85B
 vXLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoA5+IXDECtanY3klyK+M5vWwVqBQQ56Oz7jOLL0OWNPhTJa0x+kJGSP0MiT1HbLpgrmVn6K3ajKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz75ookvarEnfzAxKqyaYpvvv2apmtabATppI+ZzCKz7O9geu2F
 kxWGUF5MkLFwFDztzBSR9O/MOujTQqBbau8uPMNyEYqJN8eY5LeIutGaI2hMfs55jEBgKXA7fiT
 7D//+lxqFBVq6ZNoL+6Vs4Wr5nYA=
X-Google-Smtp-Source: AGHT+IEvkAyFNa0HaZCEuLW8IXvn4B7Ev3wlVuFC2U6An17+S2XLaxjQuC63dbErNk+gcYBt8OjC0lWJedOAoiUZG6A=
X-Received: by 2002:a05:690c:c96:b0:6ea:4b85:7a13 with SMTP id
 00721157ae682-6eaddd861d2mr115856877b3.3.1731332548770; Mon, 11 Nov 2024
 05:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20220621104617.8817-1-tzimmermann@suse.de>
 <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info>
 <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
In-Reply-To: <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Mon, 11 Nov 2024 13:42:16 +0000
Message-ID: <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
Subject: Re: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
 Linux kernel regressions list <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Linux Framebuffer <linux-fbdev@vger.kernel.org>
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

On Mon, Nov 11, 2024 at 1:22=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> The patch in question changes the whole memory management of the
> affected code. It's also noteworthy that most of it has been reworked
> for the upcoming v6.12. Maybe this already fixed the problem. Kernel
> v6.11-rc7 added commit 5a498d4d06d6 ("drm/fbdev-dma: Only install
> deferred I/O if necessary"), which possibly fixes the problem as well.
>
> But there's no explicit fix for this problem and I have not seen any
> other related reports. Any further information is welcome.

Issue was present since 5ab91447aa13b8b98bc11f5326f33500b0ee2c48 and
tested until 6.12-rc3.
Is there any suggestion on how to dig down?

Thanks
