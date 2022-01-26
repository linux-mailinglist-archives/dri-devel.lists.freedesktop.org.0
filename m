Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6C649CF05
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F216C10E4CA;
	Wed, 26 Jan 2022 15:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC7910E4CA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643212548;
 bh=E7ISE7GQD0/qoufruRmrS+ak1BLXOdtSXna02CfJuqE=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=Cror795FglamWfFgkSa+Z07laV66Fm+edlkcYlRiOJAYHlObebVw3UN20jJvzujlj
 RbWvksoKzHnfTdndb7GMRXreo5Bx+6bQhUUzg4lVBU0zZ8wL60fX5aH+TJcGEcyxtp
 Z4uwxeHeFkSvegc9qtizTzZyRioE6AL+90jMiRT4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.57]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCOE-1mrnUG2sdQ-00NE5d; Wed, 26
 Jan 2022 16:55:48 +0100
Message-ID: <ac4e7277-d18d-fe2a-6bc8-9a003b21d5d0@gmx.de>
Date: Wed, 26 Jan 2022 16:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <75a10e6f-ade7-01d9-9523-9a1936f8a2cc@suse.de>
 <YfFNhsPr4kS2/LXa@smile.fi.intel.com>
 <df377b35-8913-a8c6-760b-073f462780cc@suse.de>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
In-Reply-To: <df377b35-8913-a8c6-760b-073f462780cc@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wLeX3lW85cf04BQA7+bhtz676rHQMTVZ4yZFry1X8quEdLDGNDN
 80kzr00Fs9Gk7oyOQx3m49TbT83qHKm9jCXlRejPx8sqILNasEeWRYrzBAg04s0HXuNdLAu
 SqK7z87HbjY0Sh6ddxF+xL/xhDTK1x335kBGwuVj2SyzCnDOqua9W8PXmG4yLG21n8ruotj
 AYP/XvyPGa6/7cJsOdViQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lrySdbHoy2s=:fa2jRWfRaC0uf7ZMaZzVFT
 xlqbQBSc7+Eerzi9kGXMhWjtJyxQ17EO63VknZkTGaB+j4SWSxJfVDBuDefsIl0d/xwjZOqtO
 Nc6DoM7Im4XpjDd+FPDyqJwm006y3WkPqbPqJLhHc9S55QaWL78/sTNuNvYbWKo99sRw1HuCq
 APb+oyT10QK3w5cpEnOGXjEzV3RdnlNmAtqz1zC5Y4RTTsZqmrN732uo8u5KpSn6mjRiMR7NV
 XTasq+WI8fx0g9ip/TuDsOboemx6H8dgh2kzLy8IcANGXijoCWrFo75exsuq/VC2OI4OqwB9z
 ajjgcf5+Ddj+85MttPofixjdpCC8Dme2YVBk1RP4HHSx4mzojM81gsNwgPxglNYqgWKMQcKTP
 FIN2Ei9P6KyM3BPL0V29XTq6JfUFg0B/C1i5JlmfvfG2E0U5SYnMpd7kzYu0OLElvZ5g6fenG
 p8HCDAA+TlKAOqAd5crJdFfV2W+DJ/AbH5oxD3aRhfRqwG/W8L3W79qiiIHNTZczV4hg+Qt2+
 h5kSrHKr+O0lg2pbTDTVRImQ1JNjKP3FV/ew+/sKQhMUpcD8kBvKAhXhGYoiZsiOtPYM5RkOb
 e+m7q7idd7ciOP20QNl2xuvWhifohWTLN3TICeeF2xL0myw8JfA8g+o+ANg20uveTs9x0Oo9k
 N2galMyIMPUzlrWWepiKOXw2d3nGZt3PAy49/hpwVpya3aehtp8m2E6vIbPHlirTN2WtIKQuD
 ApeSOQzY7fnCNWNthnHaBjZc8dczGXSBXyzleh/Ie60a9WnJhU620pzW1QmQJKO669U1AocgU
 JZAdVLN0rcrkh0lJFLFOHVLvkzBCC3I2kEM8N+/ZImfMIwODAmdlkOgdkdQCJJatzG2GZOtU/
 TGNm1j87iWiDVfRL29ohBSiahVpWrd6zVF/I/NCOQA7ZkHVbPCNuhZ6EuaBfALmuTfiFHNlfx
 VRdJUWNFzhyEkENP58ilTZXLIGtSTZL3aOAJs/O60ADzGXoQ2Y+aEiBLqEnXfTmgJnkZnISqP
 79TnNQEsmlXMMTHFM2xlfAYZSEMk0ni38bEEc+19fYKt00kfqkIzWn7Geb/cqE0qiSW1mnbIn
 D1UQB+8wjWo/EA=
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 16:02, Thomas Zimmermann wrote:
> Hi
>
> Am 26.01.22 um 14:32 schrieb Andy Shevchenko:
>> On Wed, Jan 26, 2022 at 12:41:41PM +0100, Thomas Zimmermann wrote:
>>> Am 26.01.22 um 11:59 schrieb Helge Deller:
>>
>> ...
>>
>>
>>> It's always for the same reason: the hw is old and devs have moved on.
>>
>> It's pity to have a working system with an old hardware that no one in
>> the kernel community gives a shit about because simply they are not in
>> the same boat. Try to be on the people's position...
>
> Yes, I do care about old hardware.

Yes, I know. I saw various articles about it.

> I made helpers for converting fbdev drivers to DRM. I even made the
> initial commits for those drivers where I could find the HW on Ebay. [1]=
> [1] https://gitlab.freedesktop.org/tzimmermann/linux/-/tree/fbconv-plus-=
drivers

Just out of curiosity, does the tgui driver you patched there
is now supported by DRM? I couldn't find it (just the tridentfb fbdev driv=
er),
so I assume it's somehow handled by simpledrm instead?

> I made sure that every single of them at least gets fbcon onto the
> screen. So interested devs could start immediately. Yet, no one ever
> showed up to convert even a single driver.
Both Geert wrote about that he was trying to convert a driver. The same
is true for Sven where he came up with a prelimarary visualizefx driver...
Both had issues which currently prevent that those drivers get finished.

> As it stands, 90s PCI hardware is currently supported by DRM's
> simpledrm as long as the device has VESA.

Good. Some of the drivers in fbdev are for non-x86 architectures
and don't have a VESA BIOS. Is is possible that simpledrm could (theoretic=
ally)
support those too?

> The performance is at least usable on AthlonXP-era computers. Now the
> owners of these devices at least have a chance of using modern
> graphics userspace.
Yes.

> That userspace is important: graphics drivers don't live in a vacuum.
> There's no point in having one if it requires extra support from all
> other components. And there's more:
>
> =C2=A0* Occasionally, fbdev gets in the way of DRM. Just this week, we f=
ixed a related bug. [2]
>
> =C2=A0* Fbdev's mmap semantics is the reason why it's hard to do fast in=
 DRM.
>
> =C2=A0* Maintaining both stacks, DRM and fbdev, adds work to kernel, use=
rspace and distro devs.
>
> Therefore, anything we do that keeps fbdev alive is a step backwards and=
 a burden on the overall Linux graphics community.

That's understood and I don't disagree.
The earlier drivers are converted to DRM the better.
I probably don't even have any issues with dropping fbdev & drivers for th=
e
x86, ARM64, s390x & ppc64 platforms - I think many older cards aren't used=
 either
used (anymore),
or your simpledrm may cover the most common cards.
I think the patches we currently jointly develop to disable fbcon accelera=
tion
is exactly going into this direction.

The problems I see are mostly on non-x86 architectures or corner-case usag=
es
like embedded devices or special machines. They may be oldish, but still b=
eing used.
Those machines would completely loose their console without fbdev.

> Please excuse my ranting, but fbdev proponents seem to be ignorant to
> all these points. It's apparently all about 'my console is slow'.

Your ranting is fair, but I wouldn't say I'm ignorant to your arguments.
Of course performance is relevant, or would you exchange your car which
today is capable to drive 100 mph with another car which only
drives a maximum 10 mph?  (Yes, that's around the factor of speed decrease=
 I see).
Or even worse: suddenly not being allowed/able to drive your car at all?

Helge
