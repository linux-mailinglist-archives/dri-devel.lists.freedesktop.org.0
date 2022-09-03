Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562635ABEB7
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 13:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4CB10E9AE;
	Sat,  3 Sep 2022 11:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D8C10E9AE;
 Sat,  3 Sep 2022 11:16:56 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qh18so8353303ejb.7;
 Sat, 03 Sep 2022 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=2awJnvzg80kHaK9GkpoYgVAO7zYSHwTiiBNZbOvF4aI=;
 b=XI+c5McA3dizsm6fZCGiITKNiybSQzrNraXfk2IlPWV4nRcjuKqF//FwwEDS8lK8lB
 DIcb+j9zyu5XRQXXZB6/UpiBpgBiMHS80n488dgSmq0XCOdpo+Svb2usI33xk759giU3
 GpVTdgZ+spuoe8x95AGIETQth+Ta0SBfhSxdcc4f+7PE6u4PoxjXQCz13xEYy4yfMuWO
 5GsKeZ5IiRL1ryq4+M/U5zQInWW2lFV9ipRISP+ow9UUjMpqD0E0YKToKfw3eUmXCOVk
 Lo0aB4+/FhVK6gSHMGgM1NrmQne9wjoXs5lpiupaiBE8m2MEqTpHnjk0VOJ3+xueZ9+q
 suvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=2awJnvzg80kHaK9GkpoYgVAO7zYSHwTiiBNZbOvF4aI=;
 b=1An/7HuA7a2QCKu0hXIFjMP405C8QZ2jrCJdSuftpUQxSxb4raUqnLJAs/eS8qBX6H
 U8XvB4pZki4WsQwfoYaa2/BHrVxHBJrf+VjE7jsOsAjPVTleefZyDoU7nTDHADN+zlli
 DqhYuA3Zk5cfrQf+En+tAvtsv9thh9RKI9HOVO9hDQQFHrBb8eq7YdYc6gW6dyg3bfVR
 hDHG2ZYTyNo6TKgTZ4UHcHb9BRHAdNA2tdssr0fjPWdL3yq/1OE/YGT3sfJuTcVgr2YV
 zUc8u7I0akcSk/oJtictvLXCWSrUV2ClXyyGQrnvj3/N2Vy0eTECQ2HU9lTmqaEaMAKP
 aPcQ==
X-Gm-Message-State: ACgBeo3FIVGF7UX9BtA0jNvKrEPepfv9tBFcacJD13yWmNxFZwMtLKnc
 duAayPGzmToiVffZ8K0brzQMCsf36tePPInTVQY=
X-Google-Smtp-Source: AA6agR6S8YvBSw95AGMo4y6mLXD2eFo0L6WwDUm5OxWY2zB3dGTmILtHEMIbNUc0s1LU9oCPccztzdWibHuXBjdFo+o=
X-Received: by 2002:a17:907:7215:b0:741:416f:fb59 with SMTP id
 dr21-20020a170907721500b00741416ffb59mr24265089ejc.150.1662203814640; Sat, 03
 Sep 2022 04:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220826190728.3213793-1-l.stach@pengutronix.de>
In-Reply-To: <20220826190728.3213793-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 3 Sep 2022 13:16:43 +0200
Message-ID: <CAH9NwWc46-gggmK0_qkpiHxMnbGiCJJ2jwc4ogFvK-62PabeFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/etnaviv: add HWDB entry for GC7000 r6203
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all

Am Fr., 26. Aug. 2022 um 21:07 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> From: Marco Felsch <m.felsch@pengutronix.de>
>
> The GPU is found on the NXP i.MX8MN SoC. The feature bits are taken from
> the NXP downstream kernel driver 6.4.3.p2.
>

Can we stop adding new entries to the kernel hwdb and start to
establish a hwdb in the userspace aka mesa?
The kernel provides all the needed information to the user space so
"all" that's left is to add the mesa side. You might
ask why? It is much simpler to maintain such a database in the user
space (thanks to stable patch releases of mesa) than
forcing users to update their kernels to get this new database entry.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
