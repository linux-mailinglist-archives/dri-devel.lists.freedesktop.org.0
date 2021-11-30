Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF54630EB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 11:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D4B6EB38;
	Tue, 30 Nov 2021 10:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073E16EB3C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 10:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638267772;
 bh=axlQgmPmHpysZyf887u13cmx6tmECclmmde5H7/SPQQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jQqC6nI67oqCQh2kyQ14dWl1Cl9Mzvb/5bpjYubXIjp6OmOVUaArfrzpU89qntW6u
 sBGQhq6VLfWXUwcozoPj2XBdchzSrYVHlr7aAwR+ds9gR7immXZjwIWuZm8hg2+I02
 eHs1/ivg6tUy29IoLkh1TGbwr3MNWXGrZkt206tE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.145.109]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMGNC-1n8z5e1j6c-00JJf6; Tue, 30
 Nov 2021 11:17:40 +0100
Message-ID: <55d4f046-fe7a-aa06-ae36-b7dd342a96a3@gmx.de>
Date: Tue, 30 Nov 2021 11:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/7] agp: Various minor fixes
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel.vetter@ffwll.ch, arnd@arndb.de, gregkh@linuxfoundation.org,
 James.Bottomley@HansenPartnership.com
References: <20211112141628.12904-1-tzimmermann@suse.de>
 <f84bc3ce-5a9e-6f3a-0e23-eb8adc05b13f@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <f84bc3ce-5a9e-6f3a-0e23-eb8adc05b13f@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HU2dw3Dxou26Ie13FzlnuvNQw9/wtn1FxtYaNxvdYUM2aDwOgVe
 MUKjfgwGCZkmHj+pDt3KAEzRuMkGi6SXqFYo92SZBZFg74uP7FMLCQpspIpRdwM+FkGts0X
 G3sl34T8oTJc5559knafMIwoBUFGa1jbvFm0hzHhLy7gfybdUsoFJBnAlRGj3UVoP/bI7nZ
 c8O/TP4oy5WgrVFM8SewA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YKoNLPK1wmM=:effbbPX5UPWZ6IPhDXA6c4
 rOfnLXxGKRO6W9+7xhcQKikJ+4V0c9K5nRXaaXq4wJ3Mw1OG90MYKXtDWmshyQFDbUpjwVH0Y
 /XaY/SmBC1AF98k2zam1xdVGrPXGOCgGtf1/2pPEhExzTGQp3tLOJwqwKa/TrhWaFgXKKwDJZ
 GMGBicHOg80zlBLFbhRGhbmtJU/naaTMsWeVkBqH4ocW7T/foNORJkjSGlRI8msUNBE8CVjtr
 3it4jV4dksqcIbITvs6H+Mom6oWYZst45VIOdllMENGfyf8owMXvNx7WQYHuOfXGiMFwFEU/Z
 kWccfzUdTeWnEXF9rlOY5K5+sJoIYv/e6tDKytE/Ryj1wrCRPoGjcBUJfFpJ8Nr4B3aYy2GB2
 rYIKpaaI/uCJBk2VYQ7R8sP9gN0sHfkjZy+54qO7wSCG8Rf30GV6KnjjJIe1QpwnZ6xIrprOt
 RjBhATgLBb3V1WGFQjak8NCdCAHLY1kLKa1YsFL5EBV1TvCowJ6eoTIVTH96YUUk+9By2YeGy
 QQreRK9nFTcSczEo0aBbHLtXVsquqDwaI2/5aejF3ibOaSBIueBUvZhOSaUai9+6xvcYM8MRN
 RoM0DwTxCE3qukzVVP87+1G19EnZqDXj/w10WmVyV8PcfCsSllbhd3rU5dYwpYDHXHUEHzyiQ
 TT4pRA1rx9BCHzzwabYtWwmHYlDcSg3rh7Hj2cLhMo9b2bpULfDTvNdFPHIO1gGW39G9GEIFr
 u5eTtQi/v9xf0SPJdWtSWDC95xHoZXqmyQOfBsHgL2841KzSB1iFFWYikWG64mLExaI9P1Od5
 J49d5GGv6KPPcXRIKMy4Yrdl8HaHPehEkYhCeiRvoca29H0lHyoCFsYj0168r05uadbVn9FVe
 pyzfJnRc6VS2yaLWvDvSbNX5ireSvvYg/EitGVfevQoSql9NOH4FssCaiyhWaZdYDKzawxBar
 VZLRmG/rToxSCZt6y05Njzz1X5S0uEj7qGPBEdwRRJ9BuwqJC7K+sinkdTlsm4J0mIpINvbim
 atFzT+VV0c22A8fsHmzTawevJH9pVO6utr0LnET5Y2VGj4l1Pa06xNxi4O6azcCuEW299fDOJ
 mlC0lSAHvzebO0=
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

On 11/30/21 11:03, Thomas Zimmermann wrote:
> Ping! Any feedback on these patches?

I just reviewed those patches, and sent some feedback.
The others are:
Acked-by: Helge Deller <deller@gmx.de>

Helge

> Am 12.11.21 um 15:16 schrieb Thomas Zimmermann:
>> Fix a number of compiler warnings in the AGP drivers. No functional
>> changes.
>>
>> Thomas Zimmermann (7):
>> =C2=A0=C2=A0 agp: Remove trailing whitespaces
>> =C2=A0=C2=A0 agp: Include "compat_ioctl.h" where necessary
>> =C2=A0=C2=A0 agp: Documentation fixes
>> =C2=A0=C2=A0 agp/ati: Return error from ati_create_page_map()
>> =C2=A0=C2=A0 agp/nvidia: Ignore value returned by readl()
>> =C2=A0=C2=A0 agp/sworks: Remove unused variable 'current_size'
>> =C2=A0=C2=A0 agp/via: Remove unused variable 'current_size'
>>
>> =C2=A0 drivers/char/agp/ati-agp.c=C2=A0=C2=A0=C2=A0 | 10 ++++++++--
>> =C2=A0 drivers/char/agp/backend.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>> =C2=A0 drivers/char/agp/frontend.c=C2=A0=C2=A0 |=C2=A0 4 +++-
>> =C2=A0 drivers/char/agp/nvidia-agp.c |=C2=A0 6 +++---
>> =C2=A0 drivers/char/agp/sworks-agp.c |=C2=A0 5 +----
>> =C2=A0 drivers/char/agp/via-agp.c=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ---
>> =C2=A0 6 files changed, 17 insertions(+), 13 deletions(-)
>>
>> --
>> 2.33.1
>>
>

