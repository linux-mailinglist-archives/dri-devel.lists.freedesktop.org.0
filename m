Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E304E50E6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31B710E68E;
	Wed, 23 Mar 2022 11:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9400B10E25D;
 Mon, 21 Mar 2022 12:08:12 +0000 (UTC)
Received: from [127.0.0.1] (unknown [90.59.133.218])
 (Authenticated sender: eric.valette@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 589AF13F8A7;
 Mon, 21 Mar 2022 13:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647864490;
 bh=xXEkKhP21j6z3maIS8t4Sjhtp6NJrateRL7U0XZ9/V8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Xaw0Xqk+UU939Tv2bOs7/Hca8R7E5RZtlT3zPkxnGDBqBN4y8m6IMwQ8c8kWSaEPX
 DqwgRGIIDvwYsN8XxC3tlong7FPxyVk9x/j16ADm4Jf3MccTgFFCVRlrckl5yiUiod
 7c0EpRy+4wR8jFsMKFbVFgzlcD9HDATJjlaI8qd4sapoyXC21kWC+VY19n61+p9WBq
 +34ld9Wtw7uuE84DIZoSAaNa7yBUQFPT37j3b0KaZ1kprb59Y3FLEC5S/WE49Z16Dx
 EUwR9W/d2v3oSGdbIVc+SYxwHFryUm0ZQZQnIXYgyQZq0/8ke+t6ZWU8DKcHCZm4aB
 EvLEZ2cdHsDWg==
Date: Mon, 21 Mar 2022 12:07:51 +0000 (UTC)
From: =?UTF-8?Q?=C3=89ric_Valette?= <eric.valette@free.fr>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Message-ID: <ba7faa48-68a5-41f9-9192-f843e17c5a07@free.fr>
In-Reply-To: <61c2b2ce-d749-3723-ad27-f40e1c49d967@leemhuis.info>
References: <Ygf7KuWyc0d4HIFu@eldamar.lan>
 <CADnq5_MfR99OhjumQESCO7Oq+JVOHOVgyVQHX4FpGFDnPu6CyQ@mail.gmail.com>
 <5164225.DI6hChFYCN@ylum> <c62d4ba9-2214-ca7d-ee78-ee19a9bf51e6@free.fr>
 <CADnq5_MWqz7-XhOS4zfuzi3=_nKa72iYaO0BcKNcVDwEvZ+YHw@mail.gmail.com>
 <61c2b2ce-d749-3723-ad27-f40e1c49d967@leemhuis.info>
Subject: Re: Regression from 3c196f056666 ("drm/amdgpu: always reset the
 asic in suspend (v2)") on suspend?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <ba7faa48-68a5-41f9-9192-f843e17c5a07@free.fr>
X-Mailman-Approved-At: Wed, 23 Mar 2022 11:01:41 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, 1005005@bugs.debian.org,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dominique Dumont <dod@debian.org>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

My problem has never been fixed. The proposed patch has been applied to 5.1=
5. I do not remerber which version 28 maybe.

I still have =C3=A0 RIP in pm_suspend. Did not test the Last two 15 version=
s.

I can leave with 5.10 est using own compiled kernels.

Thanks for asking.

21 mars 2022 09:58:01 Thorsten Leemhuis <regressions@leemhuis.info>:

> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
>=20
> Dominique/Salvatore/Eric, what's the status of this regression?
> According to the debian bug tracker the problem is solved with 5.16 and
> 5.17, but was 5.15 ever fixed?
>=20
> Ciao, Thorsten
>=20
> On 21.02.22 15:16, Alex Deucher wrote:
>> On Mon, Feb 21, 2022 at 3:29 AM Eric Valette <eric.valette@free.fr> wrot=
e:
>>>=20
>>> On 20/02/2022 16:48, Dominique Dumont wrote:
>>>> On Monday, 14 February 2022 22:52:27 CET Alex Deucher wrote:
>>>>> Does the system actually suspend?
>>>>=20
>>>> Not really. The screens looks like it's going to suspend, but it does =
come
>>>> back after 10s or so. The light mounted in the middle of the power but=
ton does
>>>> not switch off.
>>>=20
>>>=20
>>> As I have a very similar problem and also commented on the original
>>> debian bug report
>>> (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1005005), I will a=
dd
>>> some information here on another amd only laptop (renoir AMD Ryzen 7
>>> 4800H with Radeon Graphics + Radeon RX 5500/5500M / Pro 5500M).
>>>=20
>>> For me the suspend works once, but after the first resume (I do know
>>> know if it is in the suspend path or the resume path I see a RIP in the
>>> dmesg (see aditional info in debian bug))=C2=A0 and later suspend do no=
t
>>> work: It only go to the kde login screen.
>>>=20
>>> I was unable due to network connectivity to do a full bisect but tested
>>> with the patch I had on my laptop:
>>>=20
>>> 5.10.101 works, 5.10 from debian works
>>> 5.11 works
>>> 5.12 works
>>> 5.13 suspend works but when resuming the PC is dead I have to reboot
>>> 5.14 seems to work but looking at dmesg it is full of RIP messages at
>>> various places.
>>> 5.15.24 is a described 5.15 from debian is behaving identically
>>> 5.16 from debian is behaving identically.
>>>=20
>>>>> Is this system S0i3 or regular S3?
>>>=20
>>> For me it is real S3.
>>>=20
>>> The proposed patch is intended for INTEl + intel gpu + amdgpu but I hav=
e
>>> dual amd GPU.
>>=20
>> It doesn't really matter what the platform is, it could still
>> potentially help on your system, it depends on the bios implementation
>> for your platform and how it handles suspend. You can try the patch,
>> but I don't think you are hitting the same issue.=C2=A0 I bisect would b=
e
>> helpful in your case.
>>=20
>> Alex
