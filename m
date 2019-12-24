Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A32112A3E5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 19:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2176E353;
	Tue, 24 Dec 2019 18:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54636E34E;
 Tue, 24 Dec 2019 18:28:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u2so3056569wmc.3;
 Tue, 24 Dec 2019 10:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uhGUHnDh5rpp8BlIG1rSIy/C1tEp5bgOG/mxqLnC1Pg=;
 b=L3UeNVv5q7vykcJO0fo0WvJS5nzrL+n2gPus+iCSZZOPag4mJ0riMvrn/EDbUPjhZi
 B+ccrRO87tCL1c5VpdGjWwTmBhXSNZj/FwRFCOYDplQJJ/5MEwZt8Pmk3tDW3SmV4uGI
 Z0RwoU0Y/dAxZ2NrR0h2w3ha9VVqlDHwCecMa36VJ+6frAJYwAzgzpBGSDKhN/I5sRnU
 2juHZpfWpskEjDuBeNUOsuEHr+R9fswxvdEK8FB/5c8XJhz1DpH2X6erKrGoxWpOLYE0
 r+ZBcUq2dlP30dVL+LWnyuRBl2qk34dhuqbFgj7HBADgFuej0W5hdmPXoUUodb2KkUlO
 cIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uhGUHnDh5rpp8BlIG1rSIy/C1tEp5bgOG/mxqLnC1Pg=;
 b=s57O/H1b/Ouf8H8cMaN/csmd3WLH7j6q5DrAnHJFh/ED/kupp9S3Mj6gWX6cFGQbJq
 lXdButqSgDbDny1d304uSn3nk9GzufJ7Ghf90L9p/89hBwZHXYWNKKrRV9/QQSRY+88m
 pwl1t98hEfLSsF0viv7gb+hk74KIH+iw+f/H6jVs68x0M3v2qAvDWLuFGHDbapw9Kjwc
 Q/btTq6kjlti4Zd6YC9H7c/tPueU07gJXXGMwKWY8TWFNi1cggAVKhGZJuAzLwPSUWNb
 8Jw+j6KhboTsHCZzUeVPi2yBKHLfJdDxCtVowvUXcBXy6iBI9qqaa7XyVECGxtus0+OX
 GfeQ==
X-Gm-Message-State: APjAAAWECpaT3GvqjJ7bOuqPHPDKWdN7Z3Jc7uLBMYSNqS9TTIONKJ2H
 msXYsnW/xeK38NSwqV9N+JRImDy59opwdwQIXBk=
X-Google-Smtp-Source: APXvYqwrhIOd7nG31Twl8cRa3D5hKNq475kyHFD6uCPCaBT67pzgw20KEfsIXigB8dNf7KaBl2hHXJYAwp+Lr5HkSL4=
X-Received: by 2002:a1c:f210:: with SMTP id s16mr5177248wmc.57.1577212100261; 
 Tue, 24 Dec 2019 10:28:20 -0800 (PST)
MIME-Version: 1.0
References: <1577153294-111684-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1577153294-111684-1-git-send-email-zhengbin13@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Dec 2019 13:28:07 -0500
Message-ID: <CADnq5_Pq+Xa6VDRNaVUFBNhMn1eZfk-2RCD=pKgw4pQvWc+_MA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: use true,
 false for bool variable in vega20_hwmgr.c
To: zhengbin <zhengbin13@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 24, 2019 at 9:30 AM zhengbin <zhengbin13@huawei.com> wrote:
>
> Fixes coccicheck warning:
>
> drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c:875:1-31: WARNING: Assignment of 0/1 to bool variable
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
> index 5bcf0d6..3b3ec56 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
> @@ -872,7 +872,7 @@ static int vega20_override_pcie_parameters(struct pp_hwmgr *hwmgr)
>                 "[OverridePcieParameters] Attempt to override pcie params failed!",
>                 return ret);
>
> -       data->pcie_parameters_override = 1;
> +       data->pcie_parameters_override = true;
>         data->pcie_gen_level1 = pcie_gen;
>         data->pcie_width_level1 = pcie_width;
>
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
