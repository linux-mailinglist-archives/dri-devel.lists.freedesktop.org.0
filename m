Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 013D4297DDA
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6D16E154;
	Sat, 24 Oct 2020 17:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF946E154
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Oct 2020 17:47:27 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id a12so4042702ybg.9
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Oct 2020 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=8ecMWNY+NoIcQ0QjfG3ajjtWoLUU6bkCGpdkuJczaBQ=;
 b=g485thhR2PtFPltTGhautEjnE7Hhpo6+ExZncAZxH+Q50DVFuEjx5a6JQ+L4P06S2X
 UYR3KhJjRiNBrAeGwYji991GcdSn0vXuyhUGmg7uISZ6LSyaVm8cBj9LpUAwvF2vbNef
 IZsMBj5GlNmzeurIXx9Xu09kBEiJoN7L0Gkf5Sgwd77RHlfQXkiinsz4jVKheFpqFLvW
 pQFZntKx7BSpti7a2pOLUrvt/OxHqq9FwhtLSg7Myo7kzzoX4uRddJp9XkK/2JTzfO05
 JQzw4fDGL74oWhZ+Zm8mAueS7Wh4nuTJEAToYftt55YUKthR+eG5t3cwsVZ+PbVHOqvQ
 FsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=8ecMWNY+NoIcQ0QjfG3ajjtWoLUU6bkCGpdkuJczaBQ=;
 b=T1qxHpphBKhidRQLiOzs6vZODOo8hB7Nll8yzIkPqXd53Hc4dMrd+tvkXcnpdZ1xeX
 0nbZTwNAs/jFDWfTHW/WfoEsIrjRP8m/DkgJ/hccqYtYOipTzwgbX+PSQmGYhIfsc/mS
 iPrkd/LGh3B5rn4g+3plkk4h6/3uE2ZmyZmR6oOjirWcYJZJLjXB3oInZf8I9UHDkGeb
 6fvSPaEuXlGCp+ffAv6zaDTmkrHee+QbPvKqqjmAfw4aKHiHNE2I+OX9Hh1vrVzPhm+5
 Eu1KJOeCoQJOrzobfkMUa/ZfR1668xeWzSkNghbL9Fb/Y7na0/DmPcrFbgpwYlUJw6h8
 dsLw==
X-Gm-Message-State: AOAM532OG4/SWBL105i/rzsI+co8S35RIM69lJjri44nRm0S6S1Ec5IF
 q7cSoRrlgn6QV7q0wgPYfhf5BnJMZuGvAFVKnng=
X-Google-Smtp-Source: ABdhPJx9ALKpPqmMJlcYydk8NB0UHB3LOIy+rXnccOBq3t75OazHqmwJePi3+KqQ6OsoOJIwZiY/KHHr69djVP+u5d8=
X-Received: by 2002:a25:bfcf:: with SMTP id q15mr10938055ybm.103.1603561646692; 
 Sat, 24 Oct 2020 10:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <9faa1070-d46e-5340-f6a2-5826614f306b@gmail.com>
In-Reply-To: <9faa1070-d46e-5340-f6a2-5826614f306b@gmail.com>
From: Sandeep <sandy.8925@gmail.com>
Date: Sat, 24 Oct 2020 23:17:16 +0530
Message-ID: <CAGPDPzA3+NFO5meR-YHByaRc+unQvPOU-2sjGkpBEkwcdsJwWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/radeon: Add new callback that exposes vddc
To: "Deucher, Alexander" <alexander.deucher@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I've resent the patches in the correct format. Please review.

- Sandeep

On Fri, 9 Oct 2020 at 13:14, Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>
> This patch adds a callback for reporting vddc, to the dpm field of the radeon_asic structure.
>
> Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
>
> ---
>  drivers/gpu/drm/radeon/radeon.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index cc4f58d16589..85a1cafdf303 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -1992,6 +1992,7 @@ struct radeon_asic {
>                 int (*get_fan_speed_percent)(struct radeon_device *rdev, u32 *speed);
>                 u32 (*get_current_sclk)(struct radeon_device *rdev);
>                 u32 (*get_current_mclk)(struct radeon_device *rdev);
> +               u16 (*get_current_vddc)(struct radeon_device *rdev);
>         } dpm;
>         /* pageflipping */
>         struct {
> --
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
