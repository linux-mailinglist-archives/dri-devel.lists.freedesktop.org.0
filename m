Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E987D909F93
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 21:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1A810E02D;
	Sun, 16 Jun 2024 19:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="A501xJVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D0610E02D;
 Sun, 16 Jun 2024 19:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718567842; x=1719172642; i=w_armin@gmx.de;
 bh=mSBqJPwoMHwMcHUq155VApWC4yQ2tgj8HbOx+YW3mEk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=A501xJVAMFKaMqD3vTlspAbtHk8RfIQ3jesFCm5JvZ2jXQngOkzSCowcD4/+IDPI
 JQdqBul+PQ9AjsT40HEeBMKxsVpEklQOdOy5b/topoQP5nPL+eR0cSg1nuXYfqWEb
 sjdlTcj5hzPDoqg/w/t2z6fvsDlZLlJJzrJdiF8y4cNWHhKmv7P3remthSWJ5aqow
 QFyiFMQeXaZw/MkbTAOZA3Mf524pWnx8T4C7veztcvEUdH9/791nT8dvzQTF6Oe/u
 Qn/dOIw9xHOn1Froha7IX08Ul+Ymq6PRRAj/bH4S2O7WSXauwaNC/L2bzGLu/YoOS
 R1LrR+174zJz+fsdDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQJ5-1slzt72TYN-00pp0I; Sun, 16
 Jun 2024 21:57:22 +0200
Message-ID: <361fcdd0-8e53-462d-99ef-61a5907822dc@gmx.de>
Date: Sun, 16 Jun 2024 21:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 5.15.150 black screen with AMD Raven/Picasso GPU
To: Greg KH <greg@kroah.com>
Cc: Barry Kauler <bkauler@gmail.com>, Alex Deucher <alexdeucher@gmail.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, stable@vger.kernel.org
References: <CABWT5yiejGABNXicsS7u-daKnBBjK6YTDVgaQOqwGYn8P20D8Q@mail.gmail.com>
 <6580c2d4-b084-470f-80a0-aa09f1ab880d@gmx.de>
 <CABWT5yiD110qmJcRsoGVMevULAVmYpyiW4w9MtmNjp7E0rDQ8A@mail.gmail.com>
 <CABWT5yg5jG7eMiDp7QN2yhFj6983qF9zN7eHOprH4eEjwQJLBQ@mail.gmail.com>
 <c3205455-7ad2-487e-8954-52102754e154@gmx.de>
 <CADnq5_PM_FuBE4913Z4bxiMTDYtRS+VJgLW6gfDU1qnQQ=FDzA@mail.gmail.com>
 <d04105ea-0f8a-4f0b-b4f2-bc8407d37c73@gmx.de>
 <CABWT5yibc52CTUWeCWxYQb4ooi4dsbvBWxJAJCDrG+8405RPTg@mail.gmail.com>
 <7ec6faf8-d9c1-436b-98c8-473e7ff395b3@gmx.de>
 <2024052321-revolver-timid-3056@gregkh>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2024052321-revolver-timid-3056@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nSbEZyvZnd9+Rcq8AV3G9zX1XRcQHBWNVHINMs+VXQgii/R8V5o
 4s/fiZ5pz3e51Gi41RpWN8ILLwjJW/8BD3oT6MpsjwW2Nh9j6tZVOc9nyoWg4cKgFadfzI0
 Nb1DS0j07ZRJxKlFyJZGSv4SvMGG+C+W9emWeENofQfkIae/B4ORrjOnpoOw3a5CSamsuAM
 xDwTQqm9HH18nAzHi2eaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xkCTYHCuC00=;PTzdxUPWVWiW6+g7isHSpQd6jW6
 gLW/R5/DIjRHfaQf7O4Y3QTDlYidYF6bevvYFoC4MqHzZJFFBxLECGucZtcp6QYT321HlOtqZ
 waMN1qnVbuvE7jzMVhCEqA/oohAoVx7hSsf2o2LcHV2weHN8Zw5biouLD0T6qssHGj2dcAiG+
 J3X45ssSVakTCVV2AtAAVoki3FGhtsAHM8ZZrWl071a7uJ3zWXi1CnAVy+EEqKeKUKwLjcCJ8
 06bJ0oLAh9yN0OeK0MOOpEOiI/yE8diZJpsR4WVYuk647YmqfZFC4l0TzNWDPJ1KUKF4BEhF6
 bUrtH2fTt/zF9bTePL1oaiR/rMkwFcX3D422jK5QvQpAXDkQCImkeGUrhn2+1qU06md1A+3qr
 Jf4gXnI/vMUf+E3Sw7oOg8G+n3t3qogmYWJUX/SZeHYVq/PSrKzSLa0pqn2m5ABnUVpZ+Zd05
 Vv1qeY1CA2noxP3ehh17byZfTYU9jI1PzU4++bkLZi+/SWpdVnQPM3FqgX5yRla+Tv8Lp6/2K
 3+akx13JIzqU+jzH/uCq2Zm0xWwUQfmyz1j8LkVS8Yb/oywVoUR4o/SxvTqmbKeEGAVMfqTjN
 Xe2lECZI3D1VZlJh/OMYb+TdPk+7Xa2xv3hHn/mMXrMeuvvwXEj8SMJDACK76HmXc2AFyKyL2
 apUcAqQBs63WJFTzDXGvFrt8/rKH8StFHodyE/eKSL94inQDQhNLLOEg3N2TWGRy4ux5HbRCP
 wbQsUU/AQJ7ovdOthCy681KQHfBAnOIHcELG0WGH/6RE7joSPIusVFl5joP0klKRAVMdthcz+
 DG5AMlqwj+m3000/D7o6Bn6uGVes0QgsAVnJBPxPRqys4=
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

Am 23.05.24 um 18:29 schrieb Greg KH:

> On Thu, May 23, 2024 at 05:59:39PM +0200, Armin Wolf wrote:
>> Am 23.05.24 um 15:13 schrieb Barry Kauler:
>>
>>> On Wed, May 22, 2024 at 12:58=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> w=
rote:
>>>> Am 20.05.24 um 18:22 schrieb Alex Deucher:
>>>>
>>>>> On Sat, May 18, 2024 at 8:17=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> =
wrote:
>>>>>> Am 17.05.24 um 03:30 schrieb Barry Kauler:
>>>>>>
>>>>>>> Armin, Yifan, Prike,
>>>>>>> I will top-post, so you don't have to scroll down.
>>>>>>> After identifying the commit that causes black screen with my gpu,=
 I
>>>>>>> posted the result to you guys, on May 9.
>>>>>>> It is now May 17 and no reply.
>>>>>>> OK, I have now created a patch that reverts Yifan's commit, compil=
ed
>>>>>>> 5.15.158, and my gpu now works.
>>>>>>> Note, the radeon module is not loaded, so it is not a factor.
>>>>>>> I'm not a kernel developer. I have identified the culprit and it i=
s up
>>>>>>> to you guys to fix it, Yifan especially, as you are the person who=
 has
>>>>>>> created the regression.
>>>>>>> I will attach my patch.
>>>>>>> Regards,
>>>>>>> Barry Kauler
>>>>>> Hi,
>>>>>>
>>>>>> sorry for not responding to your findings. I normally do not work w=
ith GPU drivers,
>>>>>> so i hoped one of the amdgpu developers would handle this.
>>>>>>
>>>>>> I CCeddri-devel@lists.freedesktop.org  and amd-gfx@lists.freedeskto=
p.org so that other
>>>>>> amdgpu developers hear from this issue.
>>>>>>
>>>>>> Thanks you for you persistence in finding the offending commit.
>>>>> Likely this patch should not have been ported to 5.15 in the first
>>>>> place.  The IOMMU requirements have been dropped from the driver for
>>>>> the last few kernel versions so it is no longer relevant on newer
>>>>> kernels.
>>>>>
>>>>> Alex
>>>> Barry, can you verify that the latest upstream kernel works on you de=
vice?
>>>> If yes, then the commit itself is ok and just the backporting itself =
was wrong.
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>> Armin,
>>> The unmodified 6.8.1 kernel works ok.
>>> I presume that patch was applied long before 6.8.1 got released and
>>> only got backported to 5.15.x recently.
>>>
>>> Regards,
>>> Barry
>>>
>> Great to hear, that means we only have to revert commit 56b522f46681 ("=
drm/amdgpu: init iommu after amdkfd device init")
>> from the 5.15.y series.
>>
>> I CCed the stable mailing list so that they can revert the offending co=
mmit.
> Please submit the patch/revert that you wish to have applied to the tree
> so we can have the correct information in it.  I have no idea what to do
> here with this deep response thread as-is, sorry.
>
> thanks,
>
> greg k-h

Hi,

the new 5.15.161 kernel finally contains the necessary patch (many thanks =
to the stable team :)).

Barry, can you test this kernel version and report if the issue is now gon=
e?

Thanks,
Armin Wolf

