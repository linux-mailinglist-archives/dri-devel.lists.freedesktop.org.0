Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05186988E99
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 10:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F2010E090;
	Sat, 28 Sep 2024 08:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 473 seconds by postgrey-1.36 at gabe;
 Sat, 28 Sep 2024 08:50:03 UTC
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E6F10E090
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 08:50:03 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4XG16R4Jbxz9sSK;
 Sat, 28 Sep 2024 10:42:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcEHH360jGYl; Sat, 28 Sep 2024 10:42:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4XG16R3Wyhz9sRy;
 Sat, 28 Sep 2024 10:42:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 66F6A8B766;
 Sat, 28 Sep 2024 10:42:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yxf-oHR6bVmE; Sat, 28 Sep 2024 10:42:07 +0200 (CEST)
Received: from [192.168.232.146] (unknown [192.168.232.146])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0804E8B765;
 Sat, 28 Sep 2024 10:42:06 +0200 (CEST)
Message-ID: <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
Date: Sat, 28 Sep 2024 10:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FSL P5040 board doesn't boot after DRM updates
 (drm-next-2024-09-19)
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alex Deucher <alexander.deucher@amd.com>
References: <CADnq5_MM6UYOwFSPkZRauAyckFaUjCRGT97cVhsK=xZ9CzuXVw@mail.gmail.com>
 <20EA4BE5-B349-4406-89EA-3D442717EC03@xenosoft.de>
 <48f59b5b-b26e-49c5-9b58-1c877bea394d@xenosoft.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <48f59b5b-b26e-49c5-9b58-1c877bea394d@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Christian,

Le 28/09/2024 à 09:40, Christian Zigotzky a écrit :
> On 28 September 2024 at 09:21am, Christian Zigotzky wrote:
>  >
>  >> ﻿On Sun, Sep 22, 2024 at 12:28 AM Christian Zigotzky
>  >> <chzigotzky@xenosoft.de> wrote:
>  >>>
>  >>> Hi All,
>  >>>
>  >>> The lastest Git kernel doesn't boot anymore after the latest DRM 
> updates
>  >>> (drm-next-2024-09-19). [1]
>  >>>
>  >>> I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD
>  >>> Radeon HD 5870 (Cypress XT).
>  >>>
>  >>> I reverted the DRM updates and after that the kernel boots without any
>  >>> problems.
>  >>>
>  >>> Please note: Due to a lack of time, I can't do a bisect.
>  >>>
>  >>> Please check the latest DRM updates.
> ------------
>  >>
>  >> Can you attach your dmesg output?  There was a regression in the dma
>  >> subsystem what was fixed by this commit:
>  >>
>  >> commit b348b6d17fd1d5d89b86db602f02be
>  >> a54a754bd8
>  >> Author: Leon Romanovsky <leon@kernel.org>
>  >> Date:   Sun Sep 22 21:09:48 2024 +0300
>  >>
>  >>    dma-mapping: report unlimited DMA addressing in IOMMU DMA path
>  >>
>  >> Alex
>  >>
> 
> ------------
> Hi Alex,
> 
> I tested the latest Git kernel on my FSL P5040 board today and it 
> doesn't boot. Our FSL P5020 boards boot without any problems.
> 
> I connected my FSL P5040 board with a serial cable to my PC for getting 
> error messages. Unfortunately there aren't any error messages after the 
> loading of the uImage.
> 
> This means, that the dma-mapping patch doesn't solve the boot issue.
> 
> Please check the latest DRM updates.

Can you bisect the problem ?

Christophe
