Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591BE48DC33
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 17:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16AF10E26B;
	Thu, 13 Jan 2022 16:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 309 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jan 2022 16:49:19 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432EE10E26B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642092557;
 bh=+GT3R0iprMihU+thXl1YC3ClEpv0BXdo+4Olk8WRQdE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=A84yqC6fjcJuAF2HdEF39ncvySdjcBzAqVVg9+ekOREtyQ6Mkl2iNblGSLPAZbYxo
 +ILRaZvJOb+4/hH+0Sg9FHSmncCndIQlUzu2RnQoFLpH7FyCbcoTdb6rcivKen9rDD
 u1fUIzO4Vw8eJIP9MxePwL/4AoXV+IBpPCq/03So=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.168.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9yc-1mqvlG05D8-00IF42; Thu, 13
 Jan 2022 17:44:04 +0100
Message-ID: <078e9d59-d6b5-797b-5701-6292fc588bef@gmx.de>
Date: Thu, 13 Jan 2022 17:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/7] agp: Various minor fixes
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel.vetter@ffwll.ch, arnd@arndb.de, gregkh@linuxfoundation.org,
 James.Bottomley@HansenPartnership.com
References: <20211201114645.15384-1-tzimmermann@suse.de>
 <aba1a416-cfec-dadb-fff6-48b95346173d@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <aba1a416-cfec-dadb-fff6-48b95346173d@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XW0GanP14yP4WB70CLBZJK+JNRUnOz4GIsF5A+XX1QUATxOpwK0
 21NOOiqaSFWKHqRgIZEddksnyG2cfBrkqO3oKqxQ1PXtunv71V09QxxabzPNH/yKco/sOlW
 wYVoyRNgIZAaPZIvsYnSN8U2MErKsALvchez1duUDT0ozftVPDr3aGwHpMKJsEtwFsIJOio
 CE6E1cAUn4lw+U0bF+1Xg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XujB1KYAjuU=:4/yEeLPslREqhUJ5UXm583
 pLWYJ9s29hwQM2pUZoFhiWrX8mXz23IuY6OwBEA75RLak/Kaglro0o267dkBm0U/FQLDa9I1l
 UDUVEB2SvcAWfm2k49GPcrmY7szfQMkgkPWdopJ24PjEHTwksLsVN8X73c3C9YjIFCx7ZNDwH
 crdKJP9YismHrOb1Lk4VZe3Ym8VRs1DB+x9mG3QbT0ekiCm8nXxBjuDTVmwxN3DO4oF8HjRUC
 ugAUOzXT04GiyeuPZl0csdrs2vr6QonrwTTvDxGv0geCqkIbSqVZbWhhPyck/VFJURnihGMrK
 6jl+m1W0uHQivhWbiWQQU8+gsZZhEdLz3PtuG94WwHrwnvqjEDtGK4b5+ugPcEJVeFP2Jkqnb
 Qqxyqq2v5fIHdMABgTroFuK6xKsRuzPJ1kbakWeEI2svAWRsQEjAegL43fr8KQHxY3iaETFT5
 redMowDHfH9BLuNB1vdaNoLczWDwfa+KHMV4+Q8YPw6Xr9ar75BsiHCL4yo72kp/xmVRvbaQ3
 YCsEYa6vol8VfeOjCinLWM8bzD7VE1p9ztmGFgj8gj7ufz6BIuqV2P/RIadMNyalxWnQifTN0
 4dc2t9c/9x5omIf6wfo2LT7n0mZzXintDg4j/QQSiMORGxfyTrFUkJXRiInm/rTKQNp9sPF3U
 FFRV0/5xiGaFryPge4u5maPPLY1q7NYqtC5QBO9cdChUHxi1LyRmezuSNwQOTUwLCSuBHzSxt
 0SgHYf6CBsnVc/srMf1NajVaeOxzTX8/RRiyu+/rtznnxySqFZTKtiInl3pS5n1lwPsgXfNX6
 to5m7jPWxXR3cr2odKvkSNwDUJedsI6J9LbRfkwnsyDtgjxZYdBeyZ54BXx9TZVvr54F8uIQz
 EupMZvFzsQfu7Rlh8nF+hVU8nWVP2+8fu2HuI3rRFDBoaDKJ/2rn13zFk4nKJkdPt+b30pxeg
 lbGx5FhFjYTz9rEYwkEsFj/PClA1JTtj5YaE3BRFILBMfVd2Wu5w/8RLbhXm1+Sl34+XvCSTi
 /HiJx5/vaYyGhdmx6CoazBIsf2H3IoeqW0d0ODiLVPQJOC2hAztLnOEjWUhsTjR5IqSoTd/ZE
 fv6ZzShQg3lwfM=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/22 09:51, Thomas Zimmermann wrote:
> ping!
>
> This patchset got lost. Patches 4 and 5 still need a review.

for patches 4 & 5:
Acked-by: Helge Deller <deller@gmx.de>

Helge

>
> Am 01.12.21 um 12:46 schrieb Thomas Zimmermann:
>> Fix a number of compiler warnings in the AGP drivers. No functional
>> changes.
>>
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* ati-agp: free page in error branch (Helge)
>> =C2=A0=C2=A0=C2=A0=C2=A0* nvidia-agp: Mark temp as __maybe_unused (Helg=
e)
>>
>> Thomas Zimmermann (7):
>> =C2=A0=C2=A0 agp: Remove trailing whitespaces
>> =C2=A0=C2=A0 agp: Include "compat_ioctl.h" where necessary
>> =C2=A0=C2=A0 agp: Documentation fixes
>> =C2=A0=C2=A0 agp/ati: Return error from ati_create_page_map()
>> =C2=A0=C2=A0 agp/nvidia: Declare value returned by readl() as unused
>> =C2=A0=C2=A0 agp/sworks: Remove unused variable 'current_size'
>> =C2=A0=C2=A0 agp/via: Remove unused variable 'current_size'
>>
>> =C2=A0 drivers/char/agp/ati-agp.c=C2=A0=C2=A0=C2=A0 | 8 ++++++--
>> =C2=A0 drivers/char/agp/backend.c=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 drivers/char/agp/frontend.c=C2=A0=C2=A0 | 4 +++-
>> =C2=A0 drivers/char/agp/nvidia-agp.c | 3 ++-
>> =C2=A0 drivers/char/agp/sworks-agp.c | 5 +----
>> =C2=A0 drivers/char/agp/via-agp.c=C2=A0=C2=A0=C2=A0 | 3 ---
>> =C2=A0 6 files changed, 14 insertions(+), 11 deletions(-)
>>
>>
>> base-commit: 6a8f90ec433e2f5de5fc16d7a4839771b7027cc0
>> --
>> 2.34.0
>>
>

