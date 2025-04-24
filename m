Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5CFA9A1E8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 08:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428A610E734;
	Thu, 24 Apr 2025 06:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fl1RlASD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0434210E773
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 06:26:20 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-525da75d902so272226e0c.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745475979; x=1746080779; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMv4c1/Q9VX8Vvz5zwaSAHnAfwzaBXlvUpbLZFKDOcQ=;
 b=Fl1RlASDFEAIY6DA9IbqBtq5weV4d6Xho2sjV1Eh7eMbVPdPfjHtv7q9UiFAOLMQHd
 CgfORX+JYp+D2+CuV/8LZDCHH2qEBXR/+LdsYx4DH5A5LwarC8DzZJLUvvlhh0Jq/C4v
 JrZvVVuXv6vKNWWHvGjLgkgA0dXZTJzzbXX0yGkRHVbYcOAeGCu3bZ3Pk3KJkiJc34ew
 QmXeUaztSsSFZ5fUDHrBBucoaRlpffGcjkjmowINw/IzIq5lzQ9rHc8tpXDMR+ycnhM3
 uSCOFIEe6Bh+Dlet1bV/mkMrq1oABI/8ZH87FZvvgqh9UtNHzyBVEk7Xk1DNbal4GiBO
 kGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745475979; x=1746080779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMv4c1/Q9VX8Vvz5zwaSAHnAfwzaBXlvUpbLZFKDOcQ=;
 b=V29V34hKUw6OaGesxA78Upwk9stF2V51gda4KYVVpEM0I+uTNjsJwmkFZ1Ga0br0LO
 MFIUTaUrADKm0az7abG9iOxp/zdQzUCYM9A2G1w29IAL73KmWa3wTAK0Qp9zBcsNjNHa
 oTb8hPsHyhgUNeLuaJ6fb/OoxlIrqgnqGggCJFbkwffEVHNlIfIXuaPQw3FBiaEdeBTn
 dsIXZ/ZgH9X9x/GLqTOFEHqmKojd2dYSJHnNRBzCV6wmpspcHgrFLskzCIqW7UL3+NMR
 jxhGeD0DQDjoJzH+wH1D0+807LuFLYEr6Ppqo1y29WtzMGpQG7wW2k3WytmHfo5nHdut
 ohyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8k3ahsBZ2U7Za6mkJqukTZ6dIRpWJkkBtsDfX3JYI97vfJ2+MUJXrtP3lS6ukaiRLWYJTezeEnhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXqNifpe5ocJFuqMlTzGgLC3hVe1fhhQlacN8WvZy+Vu1DG8KK
 a/D4VU6MWsahjv0jXmaoEiK31w1PBSIwvrT1og6+yYryZMR++/X303hXcYf75IG/PWdwGHNBa9G
 /cxSODIjhP3os49ijiUVE9zDc22o=
X-Gm-Gg: ASbGncvaj3ln6dkrQg9Cbvapc05NenAkoBZn6/cs/A4BzLxf7Gl0jI+LTdnz2DNVfnZ
 jswo5AK6+XfISFFFUYqYUEk+azEURg5/Rm/6fDWl4x4cYkoU7MEcWrLgGfM19IuLPguR4tM/Gbu
 R/3Nl3QJ6/07Hbfd7XXEM62DM=
X-Google-Smtp-Source: AGHT+IFwlcmc9LSA/lKPl8K/Zk+Q6oHIusATENRHLiSOclNzazuyKq4pAE5MXmjhYb4KSZNiWmw2XfSs26Ye/7rvltE=
X-Received: by 2002:a05:6102:5249:b0:4bb:9b46:3f87 with SMTP id
 ada2fe7eead31-4d38d51db10mr1047165137.6.1745475978891; Wed, 23 Apr 2025
 23:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250421085907.24972-1-jagathjog1996@gmail.com>
 <a6c2baa7-521f-4c9f-b6f8-ff18e35dd941@igalia.com>
In-Reply-To: <a6c2baa7-521f-4c9f-b6f8-ff18e35dd941@igalia.com>
From: Jagath Jog J <jagathjog1996@gmail.com>
Date: Thu, 24 Apr 2025 11:56:07 +0530
X-Gm-Features: ATxdqUFk-Lgc7k7cHFmyxZCIPXCwPjxJlmDIoxYJDLFDYfVAvkL6VXrWucDgk6E
Message-ID: <CAM+2EuLPp8wNn8o8uqvryAVojg5wr3ZCjpSLEFoXKv-cE_QHWg@mail.gmail.com>
Subject: Re: [RFC 0/1] drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
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

Hi Ma=C3=ADra,

On Wed, Apr 23, 2025 at 4:22=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> Hi Jagath,
>
> On 21/04/25 05:59, Jagath Jog J wrote:
> > This patch updates the MIPI DBI driver to use drm_device.debugfs_root
> > instead of drm_minor for creating debugfs files. The debugfs setup is n=
ow
> > done earlier in probe(), before drm_dev_register(), and the drivers can
> > avoid using the .debugfs_init callback.
> >
> > This is an initial version, and only a few drivers are updated for now.
> >
> > I noticed that some newer drivers or patches still use
> > drm_debugfs_create_files(), which relies on drm_minor. I was wondering =
if
> > there is a specific reason for this, or if there's a plan to switch to
> > drm_debugfs_add_files? I can send patches to update more drivers if
> > that helps.
>
> Yes, there was a plan to switch to drm_debugfs_add_files(), as it
> centers the debugfs files management on the drm_device instead of
> drm_minor.
>
> But, in the end, we concluded that we needed a few more changes in the
> infrastructure to make things more generic. Here are some discussions
> [1][2] and this was my plan to make things more generic [3], which
> needed some improvements.
>
> It would be create if you help us to cleanup debugfs and feel free to
> use my patches as a base for it.
>
> [1]
> https://lore.kernel.org/dri-devel/20230209081838.45273-1-christian.koenig=
@amd.com/
> [2] https://lore.kernel.org/dri-devel/87eds0gm9b.fsf@intel.com/
> [3]
> https://lore.kernel.org/dri-devel/20230131195825.677487-1-mcanal@igalia.c=
om/

Thanks for sharing the links. I had missed these discussions.
I will go through them and get back soon. Since these touch core DRM infra,
I will study the changes more closely before proceeding.
Thanks for sharing your patches as a base, that should help a lot.


Regards
Jagath

>
> Best Regards,
> - Ma=C3=ADra
>
> >
> > This patch helps move toward the debugfs cleanup task listed here:
> > https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support
> >
> > Looking forward to your feedback.
> >
> > Jagath Jog J (1):
> >    drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor and
> >      .debugfs_init
> >
> >   drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
> >   drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
> >   drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
> >   include/drm/drm_mipi_dbi.h            | 4 ++--
> >   4 files changed, 10 insertions(+), 8 deletions(-)
> >
>
