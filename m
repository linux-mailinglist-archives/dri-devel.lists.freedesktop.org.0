Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827739E6C4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 20:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BA16E222;
	Mon,  7 Jun 2021 18:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0FE6E222
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 18:40:37 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id p1so10243310uam.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 11:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zN+Q8dgsMzp5svrusLksGWwBggAOjvLUcL+jRhmL2dI=;
 b=SQVA8E6RjJLNBOL9dbK69hBHUkKdfRviB4kGidz9fKEEiBJ6C5ZZjhfjIdB1lfvKMI
 QWGNtGaV1E7wraHhURiulfcu4vYnfkdMdJqXR2b0BfUOFdBQdc8wGaqFuTJEdujkAGx4
 n2k+Evx8s5Cqhdn47fmyOjzQtQQW4WVifnuo5k4HWsCcJiETqIDldhAhRtyfPyE8iQB5
 3++KbIcSDtIrL+QJ27kLeiE9oz3PHIG1yA3PvDNB0/LnqMKrRfs6iI9shhxN0SmfZB/P
 Nx0ECO+UjFzcKKTww2Bu6Ace9rab1PQOB4BCI2mwbJ6u9GDzqw+b2uwQlMnkKhtosu9T
 fr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zN+Q8dgsMzp5svrusLksGWwBggAOjvLUcL+jRhmL2dI=;
 b=O+DipIlbzn64nYrO/0L5EZJOBFiakrHL1AFZXKooWSi7eZtFqHX8xDpd2PuWTjIbp6
 T1SdGTMfuJKpcW0/wlxhDMq49SSTSc2ytfPhHlCIwL0MePEr2eV/6bTQNiRzVRZ3Isoq
 kzhURkSo4tJey6MtADogBQjX4u6tD82n7oz06FPEahqr0fAi32Mgxl5871lTetPxfZj6
 uVJvnWzrEboEINjnFJZGjiovVdpXbgv0f8gebgf6+508KHJAJurKFtVO5h6mOOU6/Ee5
 +CX6Lg2sPPJk7gwvjhTns/4EtdC3H9BVHXQgsr98VdARbSHoJk5Ccf7rmPj5AdAiF1I6
 fhsA==
X-Gm-Message-State: AOAM532OlWZkHq6a+Xq0TsRwUmuyA0bqKRg4yPqxpv4JyF6k5VWD4qbD
 4PpsFQcVKSpMhORumnkmRuMHd9KwXU33/JAggmc=
X-Google-Smtp-Source: ABdhPJzmoZOJiKTKN2ANcor0bAuDPWhU5HM92R3OmDGVNSrGSdQr6wQRhWdD5xKfwOVxUsMyDCBnTWnkBESl93cfZD8=
X-Received: by 2002:a9f:31b1:: with SMTP id v46mr10684948uad.22.1623091236278; 
 Mon, 07 Jun 2021 11:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210602080212.4992-1-jrdr.linux@gmail.com>
 <8027801c-5260-8b1b-c758-fdfb8c18e9a7@arm.com>
In-Reply-To: <8027801c-5260-8b1b-c758-fdfb8c18e9a7@arm.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 8 Jun 2021 00:10:24 +0530
Message-ID: <CAFqt6zYh+tAdpDzwQY7KhUSq2t-ZkMJW7P51pX6SnYACRETofQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: defined struct rockchip_dp_dt_ids[] under
 CONFIG_OF
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: David Airlie <airlied@linux.ie>, hjc@rock-chips.com,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 2, 2021 at 3:37 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-06-02 09:02, Souptick Joarder wrote:
> > Kernel test robot throws below warning when CONFIG_OF
> > is not set.
> >
> >>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:457:34:
> > warning: unused variable 'rockchip_dp_dt_ids' [-Wunused-const-variable]
> >     static const struct of_device_id rockchip_dp_dt_ids[] = {
> >
> > Fixed it by defining rockchip_dp_dt_ids[] under CONFIG_OF.
>
> I think the __maybe_unused annotation is generally preferred over
> #ifdefs these days. However, since these drivers only work with
> devicetree anyway, it probably makes more sense to just remove the
> of_match_ptr() uses which lead to these warnings in the first place.

Ok. Will remove of_match_ptr().
>
> Robin.
>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > ---
> >   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > index ade2327a10e2..9b79ebaeae97 100644
> > --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > @@ -454,12 +454,14 @@ static const struct rockchip_dp_chip_data rk3288_dp = {
> >       .chip_type = RK3288_DP,
> >   };
> >
> > +#ifdef CONFIG_OF
> >   static const struct of_device_id rockchip_dp_dt_ids[] = {
> >       {.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
> >       {.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
> >       {}
> >   };
> >   MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
> > +#endif
> >
> >   struct platform_driver rockchip_dp_driver = {
> >       .probe = rockchip_dp_probe,
> >
