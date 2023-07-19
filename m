Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 737407598BA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 16:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30EC10E4B9;
	Wed, 19 Jul 2023 14:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CCC10E4B9;
 Wed, 19 Jul 2023 14:42:34 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-56661fe27cbso4374271eaf.3; 
 Wed, 19 Jul 2023 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689777753; x=1692369753;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6xRuIs5eE+li5LEspd/uqDVdxyxGYMRY+5qaC71F82w=;
 b=L8r9oEP1ZyU6QlcUn2O6roGd1MuQKPhfaMHIu0TVSo3w9ZPLIFV2/QFGSBuokHKzDH
 PBYpjOSRGc865kBg/kQAt4Kk/sjgACgkAc81AeKcNOgUak5XIsV4cFDrbCmQBvZbeRxc
 M+zJ82MYAZwmMI4K7A6mOvcpLGxdOWVq7UzpHRFsf8+ZTdk1dTWdmmre5WaMNMv2HUWR
 wOjn/ibVZQR/Wdi06MMw4HRVdw7uhl737ZffWS4aOJKI+QWfMKSNFdtia3CTgdb5SISU
 HDEg2v64RFGKqQDy1oXXqfQAl2sGD65+mdYx8wMJeZokVuttYJULzO3YIYq8s7dNOBU1
 fWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689777753; x=1692369753;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6xRuIs5eE+li5LEspd/uqDVdxyxGYMRY+5qaC71F82w=;
 b=OngShJ9DRsvgwTXjno5BAtcjZ6VWKQFn7YiKtLb0U8auOd0bkxfT7DfpkwVSrpNkrA
 bI9ZOhAPkd1iPg8vEJH1puBLPpk7y1o/s4J3FAhYJGdb5nI1SYSr+Ce2uls/dpjZ1vRb
 jJHg9gsTGYMuCyFPa0X3+GoLXd4nJtQCITc7JQp+m4gcDSy6X/lQCDiTFKm7B77vibmj
 UgaHf1bzUuADFZNh9dCJ5UKh69QAAsaN5GlQO7CCMe1HnClSLx9wn806nxVskF+47Zbs
 ZbkpabTREF42TZ8TcPuyLF/Znh0XeXbNxVXUrnNAZ3m2wGL6NCgXKTBWBB23LRoNh8g+
 QDSg==
X-Gm-Message-State: ABy/qLaKLQVuseNCW/bCJw+M/0vu7TSSMNeEmKW77UI7FFovb1dchuIY
 A9rJtm/1cvnNvS0Pnp5c4I+F1MhGkeZPrSj4IwQ=
X-Google-Smtp-Source: APBJJlEJwOI05e/ZJ9MQ6f7pTuB7wrtMvnBWQbZdf+Ww6Il1MvB2Wt+yllxrR39rA6xnE0ELIO0NTvIxZxAy40YuPPA=
X-Received: by 2002:a05:6808:1829:b0:3a4:2c16:da70 with SMTP id
 bh41-20020a056808182900b003a42c16da70mr23192275oib.24.1689777752888; Wed, 19
 Jul 2023 07:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230414143810.572237-1-l.stach@pengutronix.de>
 <CAH9NwWfAuyLenoQHHdSZb2O87HHxu53JziL6Ro05F6yHdnZ+8A@mail.gmail.com>
 <CAH9NwWcf9tYG9Ua_b-TvvQHRY-j_VsAtGdkPBqwh4KH37B2qjQ@mail.gmail.com>
In-Reply-To: <CAH9NwWcf9tYG9Ua_b-TvvQHRY-j_VsAtGdkPBqwh4KH37B2qjQ@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 19 Jul 2023 16:42:21 +0200
Message-ID: <CAH9NwWd5TjfeYDCyaUDveGDz=QdUWKyB9UKpnDms3Hom-J3X5g@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix dumping of active MMU context
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Am Mi., 21. Juni 2023 um 17:44 Uhr schrieb Christian Gmeiner
<christian.gmeiner@gmail.com>:
>
> Hi Lucas,
>
> Am Mo., 17. Apr. 2023 um 19:42 Uhr schrieb Christian Gmeiner
> <christian.gmeiner@gmail.com>:
> >
> > Hi Lucas
> >
> > >
> > > gpu->mmu_context is the MMU context of the last job in the HW queue, which
> > > isn't necessarily the same as the context from the bad job. Dump the MMU
> > > context from the scheduler determined bad submit to make it work as intended.
> > >
> >
> > Good catch!
> >
>
> I think this patch did not land yet. Do you have plans to add it to
> etnaviv/next?
>

I have seen you added it today - great!

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
