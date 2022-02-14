Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852F24B5D4A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 22:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368F710E2FA;
	Mon, 14 Feb 2022 21:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BEC10E2F7;
 Mon, 14 Feb 2022 21:52:38 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id m10so18933197oie.2;
 Mon, 14 Feb 2022 13:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5zmZMNg8yirylbypUIIKEO/EPeXpVI509iUbW2YvzzY=;
 b=fPfvpg6iu+DE1UjGM06KRdvsHlYCBjpXnM+qLTt9zo8a/r2MjOmsrxXUdY6KBrj/RK
 BtQe8Ph4IzCbya/WerKt8rmQy60UVxTmSLFYVFpcS0ZoAZxXg4H92peuRNGcjyUegGnQ
 e8G8YQ5Dwp6OPnyCO/QTspf2dYhEiTZVXTe/yQDelafJvHg78pQqymlyLEM+9coslaBJ
 yTS2v740JPRRx8H6bqPhzWaRulVwuK0YZI4WY5MDxhxGtyw0sQ0FHZ8jNaS0Rpw+nNP5
 n6trpn8ogmloXG4d3l9wj7v5l0J7gS/G8Oj/yQpoNp32kDmkJ2hfoaaesoc8TuHW7SEC
 zfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zmZMNg8yirylbypUIIKEO/EPeXpVI509iUbW2YvzzY=;
 b=Mlps9yJEUskvzGdqP3DgI4d+uIzjTh97rPT8Spx2/FY1+wpIT5aNEn5KO96T5q8IhU
 w6NO3noSzQv3usSdE/acfr44GWBLmMZu4RLNYg9rZ/UifjhlBfEEg7vHhawuO8zGcu1v
 3q92feLXAy0oPrJnMKnGSEXHxGlo3M1lN5ozRic0xx8Ct06B0JR2t9oVZsQW9zg2dL8F
 DKfi91vkeM53svzxktPqoUJGVQ5C0BToOAj0TaHAox/ALtukBgCE5aYfJFhvgb/ubyRl
 TRrRIZFRQgZte0krt1fuMCH6jgRXhmortTKrFYs+/0mnG48cnL+5WMo/5mhmTqOuUE2j
 bJ4A==
X-Gm-Message-State: AOAM5312Vka9sAY8Kav+YmTnF6x1w0xa2QQjPAeCjf3nIGCec3AVAXGj
 v96FD4a696t1tVwUtazrZVquHokCxMROfhSlB5s=
X-Google-Smtp-Source: ABdhPJzA3uzspnOYFs6i9DW+fiv36kgx3jpnJcTh6jp5Esnikv18hVw4BUzWj0HpJxRzAX/q+tTul5ga/gaDmADiO9w=
X-Received: by 2002:a05:6808:159e:: with SMTP id
 t30mr414528oiw.132.1644875558252; 
 Mon, 14 Feb 2022 13:52:38 -0800 (PST)
MIME-Version: 1.0
References: <Ygf7KuWyc0d4HIFu@eldamar.lan>
In-Reply-To: <Ygf7KuWyc0d4HIFu@eldamar.lan>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Feb 2022 16:52:27 -0500
Message-ID: <CADnq5_MfR99OhjumQESCO7Oq+JVOHOVgyVQHX4FpGFDnPu6CyQ@mail.gmail.com>
Subject: Re: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic
 in suspend (v2)") on suspend?
To: Salvatore Bonaccorso <carnil@debian.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sasha Levin <sashal@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, 1005005@bugs.debian.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dominique Dumont <dod@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 12, 2022 at 1:23 PM Salvatore Bonaccorso <carnil@debian.org> wrote:
>
> Hi Alex, hi all
>
> In Debian we got a regression report from Dominique Dumont, CC'ed in
> https://bugs.debian.org/1005005 that afer an update to 5.15.15 based
> kernel, his machine noe longer suspends correctly, after screen going
> black as usual it comes back. The Debian bug above contians a trace.
>
> Dominique confirmed that this issue persisted after updating to 5.16.7
> furthermore he bisected the issue and found
>
>         3c196f05666610912645c7c5d9107706003f67c3 is the first bad commit
>         commit 3c196f05666610912645c7c5d9107706003f67c3
>         Author: Alex Deucher <alexander.deucher@amd.com>
>         Date:   Fri Nov 12 11:25:30 2021 -0500
>
>             drm/amdgpu: always reset the asic in suspend (v2)
>
>             [ Upstream commit daf8de0874ab5b74b38a38726fdd3d07ef98a7ee ]
>
>             If the platform suspend happens to fail and the power rail
>             is not turned off, the GPU will be in an unknown state on
>             resume, so reset the asic so that it will be in a known
>             good state on resume even if the platform suspend failed.
>
>             v2: handle s0ix
>
>             Acked-by: Luben Tuikov <luben.tuikov@amd.com>
>             Acked-by: Evan Quan <evan.quan@amd.com>
>             Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>             Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>          drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 ++++-
>          1 file changed, 4 insertions(+), 1 deletion(-)
>
> to be the first bad commit, see https://bugs.debian.org/1005005#34 .
>
> Does this ring any bell? Any idea on the problem?

Does the system actually suspend?  Putting the GPU into reset on
suspend shouldn't cause any problems since the power rail will
presumably be cut by the platform.  Is this system S0i3 or regular S3?
 Does this patch help by any chance?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e55a3aea418269266d84f426b3bd70794d3389c8

Alex


>
> Regards,
> Salvatore
