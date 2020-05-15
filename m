Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB64E1D4A82
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 12:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E816EC3F;
	Fri, 15 May 2020 10:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B806EC56;
 Fri, 15 May 2020 10:10:09 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id o8so424591vkd.12;
 Fri, 15 May 2020 03:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lhigMlxhzrJnKPEuZs499FlSgqJIMriFF+MKS12l+uA=;
 b=gp63hVTHYVuojW36b06JYhiTReOtH2+pg7/v0FgV+Ta6hcdtZGvwPDyvoqSOxSGDtN
 oP4ZHdDKFOvyHJR10A/6nYElof0kMVJDPAoNTgKZxEIGa+nCyCfwHCiI7lFXwc0qaMzA
 QAfKbSJ13sKqc8f+OXYJ9n35j/TnMdw1ZWoDyj9c/ixU0QS+YJHW8nSU546+3aSOA6Ux
 XF8IKhCQyLoOHK9JXy+j+yExcJ6wrEbHiSh9Z0DxkEif/uCZ5Z55ljyO0QHaypYZ3Us0
 8oC9LXlPJzcj52ZMtS73p+KmzpCK5aGkyR/IadwzfCicaErtAohw9QYfP8bff+OpX50s
 iKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lhigMlxhzrJnKPEuZs499FlSgqJIMriFF+MKS12l+uA=;
 b=PNnTNhJbgjKD4guvKep4RszXCOfu9dXjz9iqwkNjkpfSqchDn3nl5uUQQ3PeCMBHx7
 WVmFFxOKJoa5dXa72xFueBJBOKCU4wmUWrOve/ttZ5sXr2tiitVUn1H4j6kc1uMLmEYh
 70pc7KxeqxsWG1GxuDggIZvwSKOzmzxNLYyFj+7LiXffGr4j4BWB3Z2vWoARVwJCKIBT
 S6blg94E+JZF01r/IMmD2OgjcCEV3qE3pr4UWzAyxwVP2sY0XcQSl3L6aWxutvlRB07O
 kW8qTuDgZh2oeCiUI+dzbW9ZIN9t5U5JXBgLfijW0jQWJJd3+wiLBctxXoeF4QJ4lBHT
 jl0A==
X-Gm-Message-State: AOAM531aUvCJOAuByUvUlxVTVh+aKUA4FGjFuZ392YkUzhjJEVeoB7Dj
 PNoBqw+f08LeAMhq1YaxVICA1RBZAvpmRiYuKBM=
X-Google-Smtp-Source: ABdhPJzaNbylRYStH6B+ZztSv24YNQNGSipyPFdD8gsTBnMBMP46eaL7d0io05RZRZvcuJ3Mg3DYYVRNdgElHQ0yNRE=
X-Received: by 2002:a1f:cd06:: with SMTP id d6mr1918886vkg.94.1589537408919;
 Fri, 15 May 2020 03:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200511123846.96594-1-christian.gmeiner@gmail.com>
In-Reply-To: <20200511123846.96594-1-christian.gmeiner@gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 15 May 2020 12:09:57 +0200
Message-ID: <CAH9NwWcJNhUVkzd0KAfJyxNZJ9a71KLzipW+qRwhgEWUmnnxmg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix perfmon domain interation
To: LKML <linux-kernel@vger.kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>, stable@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mo., 11. Mai 2020 um 14:38 Uhr schrieb Christian Gmeiner
<christian.gmeiner@gmail.com>:
>
> The GC860 has one GPU device which has a 2d and 3d core. In this case
> we want to expose perfmon information for both cores.
>
> The driver has one array which contains all possible perfmon domains
> with some meta data - doms_meta. Here we can see that for the GC860
> two elements of that array are relevant:
>
>   doms_3d: is at index 0 in the doms_meta array with 8 perfmon domains
>   doms_2d: is at index 1 in the doms_meta array with 1 perfmon domain
>
> The userspace driver wants to get a list of all perfmon domains and
> their perfmon signals. This is done by iterating over all domains and
> their signals. If the userspace driver wants to access the domain with
> id 8 the kernel driver fails and returns invalid data from doms_3d with
> and invalid offset.
>
> This results in:
>   Unable to handle kernel paging request at virtual address 00000000
>
> On such a device it is not possible to use the userspace driver at all.
>
> The fix for this off-by-one error is quite simple.
>
> Reported-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Paul Cercueil <paul@crapouillou.net>
> Fixes: ed1dd899baa3 ("drm/etnaviv: rework perfmon query infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index e6795bafcbb9..35f7171e779a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -453,7 +453,7 @@ static const struct etnaviv_pm_domain *pm_domain(const struct etnaviv_gpu *gpu,
>                 if (!(gpu->identity.features & meta->feature))
>                         continue;
>
> -               if (meta->nr_domains < (index - offset)) {
> +               if ((meta->nr_domains - 1) < (index - offset)) {
>                         offset += meta->nr_domains;
>                         continue;
>                 }
> --
> 2.26.2
>

ping

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
