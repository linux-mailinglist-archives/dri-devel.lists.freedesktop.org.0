Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9709E3E49B8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 18:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEAB898BF;
	Mon,  9 Aug 2021 16:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F3E898BF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 16:22:22 +0000 (UTC)
Date: Mon, 09 Aug 2021 18:22:12 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Letux-kernel] [PATCH 8/8] drm/ingenic: Attach bridge chain to
 encoders
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
 linux-mips <linux-mips@vger.kernel.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 list@opendingux.net, Sam Ravnborg <sam@ravnborg.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Message-Id: <0TYKXQ.YAJ6UYG2GTXS1@crapouillou.net>
In-Reply-To: <5DADB00D-1E0E-4B3A-86CE-4E98A5DC04DE@goldelico.com>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-9-paul@crapouillou.net>
 <2AEC5953-FE54-4DD5-88B7-783C4D9E23B2@goldelico.com>
 <4OBJXQ.DA6PDYNSVNYV1@crapouillou.net>
 <2C83670F-3586-435B-8374-C3CC1C791391@goldelico.com>
 <137A13EE-9E0E-469E-BE43-677349478A58@goldelico.com>
 <5DADB00D-1E0E-4B3A-86CE-4E98A5DC04DE@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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

Hi Nikolaus,

Le lun., ao=FBt 9 2021 at 13:14:03 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
> quick feedback: our HDMI on top compiles fine after fixing 2 merge=20
> conflicts, but dos not yet work.
> Will need some spare time with access to the CI20 board to research=20
> the issue, i.e. can not give feedback immediately.

Alright, no problem. I'll be back home in about 2 weeks and then I can=20
test on my CI20 as well.

Cheers,
-Paul

> BR and thanks,
> Nikolaus
>=20
>>  Am 08.08.2021 um 21:12 schrieb H. Nikolaus Schaller=20
>> <hns@goldelico.com>:
>>=20
>>=20
>>=20
>>>  Am 08.08.2021 um 21:06 schrieb H. Nikolaus Schaller=20
>>> <hns@goldelico.com>:
>>>=20
>>>=20
>>>=20
>>>>  Am 08.08.2021 um 21:04 schrieb Paul Cercueil=20
>>>> <paul@crapouillou.net>:
>>>>=20
>>>>  Hi Nikolaus,
>>>>=20
>>>>  Le dim., ao=FBt 8 2021 at 20:57:09 +0200, H. Nikolaus Schaller=20
>>>> <hns@goldelico.com> a =E9crit :
>>>>>  Hi Paul,
>>>>>  all other patches apply cleanly but this one fails on top of=20
>>>>> v5.14-rc4.
>>>>>  What base are you using?
>>>>>  BR and thanks,
>>>>>  Nikolaus
>>>>=20
>>>>  The base is drm-misc (https://cgit.freedesktop.org/drm/drm-misc),=20
>>>> branch drm-misc-next.
>>>=20
>>>  Ok, fine!
>>=20
>>  Contains 3 patches for drm/ingenic and after taking them first, I=20
>> can apply the series.
>>=20
>>  Again, BR and thanks,
>>  Nikolaus
>>=20
>>  _______________________________________________
>>  https://projects.goldelico.com/p/gta04-kernel/
>>  Letux-kernel mailing list
>>  Letux-kernel@openphoenux.org
>>  http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel
>=20


