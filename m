Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E523B2E0C68
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 16:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862596E87A;
	Tue, 22 Dec 2020 15:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6376E879;
 Tue, 22 Dec 2020 15:08:34 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id x13so15062592oic.5;
 Tue, 22 Dec 2020 07:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9iX58YMx8qY2LSjohdfZ3DU1IKC59lgYW43Efd3MkEI=;
 b=p1CZSIKxfXhHNUVOHLNAuoSWLjD2CRJNrxIzcW7j2SJxYk2YNkLEyF/IRbHKlfhLix
 Oj3dFbJACsvuBfeeSKwn6i3sgHpLoGJIlD9x1UN6wtBOKF3fPB8/ADH5clxzQu0GcoJb
 vPXZqhWWjYjEYvOD8UDoqremOPyKwbNAV6Y4uhf4H6tsppnZDPgUuUk3mIcIMWdcao3+
 7cGE7KAq9SN0xt3YGu6OQHqjWVNUKywvCkOOc+pBxXcYsuOZtkwBL0TFpsYW6LuL86qi
 CsRhb7Plhinl8Aqs07yyMz0sA323oS+Ik7DppPVpYgU6c/4+rO4chkYrQu5VVujqwACw
 d+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9iX58YMx8qY2LSjohdfZ3DU1IKC59lgYW43Efd3MkEI=;
 b=tlzln8JXPqEqZPT1ltcfAeu9z+FsdWoT0gtMHDEZ84DgrzaWZD8M+qH6zdrqcNR3Z2
 /UG9qe6AE3NI28nCLfP8jd6W/xgCZkmGC3ozU4yViibOuhNDjRSKOMuZ9tqTfFuuhkV9
 UUYo7p9OIKa5TpmV3D5R3Xqwd+pq11SzihtiD4IR36db4EANiGM3bMueenxcWTUbNvwr
 wdJeLpe1fckxpToYE4wRbFfKP4x7O9stiOQCCXLZ9M97Q/6ki7j9WWudV3AVz3OsOQtt
 ADR9E8t9fEcU7ifchxA6svHyn4fqk83eJ+WR4ecvRF7krcbWcu+S5h7vmQihWKYPQUxr
 B5Lw==
X-Gm-Message-State: AOAM533xqmPFX4i/BVV9bRZzmGu/ZcsVCGKL/aHBYD9tP05i6SzafVWW
 8mvTP5JZzxz0JnSwHbZ5ZDKGsgKwrmgKmJgfhD+DGGog
X-Google-Smtp-Source: ABdhPJy19Ods0aRD/JDrJl5ZdgsTjfLu8fnSZO6MPFsqsu0ylwodKntXg6ma9XB4AnxVPc0aNvmdHonLoCQxKzOK2E8=
X-Received: by 2002:a54:4083:: with SMTP id i3mr14464839oii.120.1608649713481; 
 Tue, 22 Dec 2020 07:08:33 -0800 (PST)
MIME-Version: 1.0
References: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
In-Reply-To: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Dec 2020 10:08:22 -0500
Message-ID: <CADnq5_PVm+04LqPJoQ6mPHf0YM6jEeR_Xh_Bkap7Nuw+Fo6sgw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/amd/display: Adjustments for dc_create()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Chiawen Huang <chiawen.huang@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Yongqiang Sun <yongqiang.sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 20, 2020 at 6:10 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 19 Dec 2020 18:30:56 +0100
>
> Two update suggestions were taken into account
> from static source code analysis.
>

Applied.  Thanks!

Alex


> Markus Elfring (2):
>   Return directly after a failed kzalloc()
>   Use common error handling code
>
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
