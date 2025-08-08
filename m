Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FCFB1E944
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E04F10E938;
	Fri,  8 Aug 2025 13:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="kwe5RroF";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="z+GyQF24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF6310E938;
 Fri,  8 Aug 2025 13:30:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754659817; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=hep1b6AE477RjVcDGZUXoHkaTIIDTunHvYhalbdOwKMRBddWFV5v9AqUrcUacm+QVG
 GdcEgyx8Xc16a+BByOwZK/9EjEFH3KMR1nRx3fgNott5tEEMRQdTepyvrTryHLpMQSW1
 oKWsWPdEBq8xgjyY8iKNYlIslSfHaND4RW7YNMhl0mGCB8oX7t+SxujSxqK8xU26XPG2
 NTJttXTG6euC0pDeNYg6PY0qtjdP9mFF2YEEcgXPUwx+AHuhXA42wZKz+3RftzhcNqk3
 5TksXo3HonVcnB+es415Siz4XAKu8pyRBGpMLVTM3m4+AgtmD157SXBVzgt+zWynPdvw
 a2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754659817;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=szxC9HtsLathAsiBUge4AOh28xZOX235WGFzuZVindU=;
 b=TEPKajmrokiXkQrTkDvh1XHhFugEzFYRFw5tjJdsQyiSTU5r7rydeGgkMBhm/GdOgv
 6Vo/qY9ePeL2Vd4A5Wummkp1uCYUtyaL6/fb4cgMjBiDwz0RYs8SZJsqN/s/jK1T4Wuc
 7cmevKXyQasFpZ9cn4Ed3XruHfxdB9gBA4qbJ8D+Uu1gUZyBjEo20A0aoAs9SMRQtdft
 js4tPmJFdgacpxApBFadJ0+OlxRiGZEmoGhaFs2fJjgvS6nG4Ze/NJviPEaeHXDJIU5D
 jm710w41q8u7DhScoK4yVcpayvECIiyRs/DI4eBjD4/ddKx1NqaJ45DewbFqE71id2aj
 M/Ww==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754659817;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=szxC9HtsLathAsiBUge4AOh28xZOX235WGFzuZVindU=;
 b=kwe5RroF6dj2gY0kv8G7NJGTAKEciD3aR7a1GfyiLRT7s/qVYYsXD4FN6Oy6XehDuN
 aqo+IbH+qpF5CRThSaR/uhm+A7I+RpAl96m3HS1+20QwISoBwpkwvo9bePKbqUR3o07T
 OIMVXOgR5oUOTT2G9T+KBWvX+XXn5JTgofP8Tne1884Y5tlEo7lsMjxcgOIWG9ppZ4Zu
 RrLeBxnVEizyZxYECSKOzHyOK/Goaf/FMnZyW2eK25963X70mM8m/f98R0j0qdNDGrTD
 f/i11c8kk/clapJ33a0h46uK0zpJfLeV+2N9OzicGolV9AHGcE6fmKH/9XQlotl0BTEy
 UurQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754659817;
 s=strato-dkim-0003; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=szxC9HtsLathAsiBUge4AOh28xZOX235WGFzuZVindU=;
 b=z+GyQF246kRXw4tvalcO3ZXLlp2olBKyTxJdGcxCDPT115MQNBndbckfB1Ilpt8Qh2
 waHMUp+CYlwG92H0VAAA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m2s3nHCn4174Rhb0mYyao0unG2oENUO6LNlA=="
Received: from smtpclient.apple by smtp.strato.de (RZmta 52.1.2 AUTH)
 with ESMTPSA id e6066c178DUG7Dn
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 8 Aug 2025 15:30:16 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: radeon_fbdev_river_fbdev: failed to initialize framebuffer and
 setup emulation
Date: Fri, 8 Aug 2025 15:30:05 +0200
Message-Id: <DA926904-FB40-4826-B0F1-729DF181CE05@xenosoft.de>
References: <CADnq5_PMu0tqCaGccdL2JDZuHqSb2Q2mgo12Cba-pDAL9bAmBw@mail.gmail.com>
Cc: Mario Limonciello <superm1@kernel.org>,
 mad skateman <madskateman@gmail.com>, ville.syrjala@linux.intel.com,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, bhelgaas@google.com,
 benato.denis96@gmail.com, Yijun_Shen@dell.com,
 David Perry <David.Perry@amd.com>, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
In-Reply-To: <CADnq5_PMu0tqCaGccdL2JDZuHqSb2Q2mgo12Cba-pDAL9bAmBw@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailer: iPhone Mail (22G86)
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



> On 08 August 2025 at 02:56 pm, Alex Deucher <alexdeucher@gmail.com> wrote :=

>=20
> =EF=BB=BFOn Fri, Aug 8, 2025 at 7:48=E2=80=AFAM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>>=20
>>=20
>>=20
>>>> On 08 August 2025 um 01:23 pm, Mario Limonciello <superm1@kernel.org> w=
rote:
>>>=20
>>> =EF=BB=BF
>>>=20
>>>> On 8/8/25 2:36 AM, Christian Zigotzky wrote:
>>>> On 07 August 2025 at 04:21 pm, Limonciello, Mario <Mario.Limonciello@am=
d.com> wrote:
>>>> Does applying
>>>> https://github.com/torvalds/linux/commit/907a7a2e5bf40c6a359b2f6cc53d6f=
dca04009e0
>>>> help?
>>>> - - -
>>>> Hello Mario,
>>>> Thanks a lot for your patch.
>>>> I tested it today but unfortunately it doesn=E2=80=99t solve the issue w=
ith the Radeon framebuffer.
>>>> I have created two kernels with and without the drm-next-2025-07-30 upd=
ates [1] because of the issue with the Radeon graphics framebuffer device #1=
5. [2]
>>>> Download and further information: https://github.com/chzigotzky/kernels=
/releases/tag/v6.17.0-alpha5
>>>> I have tested both kernels this week and I can definitely confirm, that=
 the issue is somewhere in the commit drm-next-2025-07-30 updates [1].
>>>> The Radeon graphics framebuffer doesn't work with the kernel with the d=
rm-next-2025-07-30 updates [1]. Without these updates, the framebuffer works=
.
>>>> I bisected yesterday. [2]
>>>> There are some other user reports:
>>>> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60606#p606=
06
>>>> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60595#p605=
95
>>>> They use other Radeon graphics chips.
>>>> @All
>>>> Please check the drm-next-2025-07-30 updates [1]
>>>> Thanks,
>>>> Christian
>>>> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D260f6f4fda93c8485c8037865c941b42b9cba5d2
>>>> [2] https://github.com/chzigotzky/kernels/issues/15
>>>=20
>>> I think there is a mistake in your bisect, which I notice from looking a=
t your other user reports.
>>>=20
>>> The original commit you identified in your bisect and thus CC'ed me came=
 in 6.16-rc1.
>>>=20
>>> =E2=9D=AF git describe --contains 4d4c10f763d7808fbade28d83d237411603bca=
05
>>> v6.16-rc1~50^2~19^2
>>>=20
>>> There absolutely was a regression for that was raised, but this was fixe=
d in 6.16-rc3.
>>>=20
>>> =E2=9D=AF git describe --contains 907a7a2e5bf40c6a359b2f6cc53d6fdca04009=
e0
>>> v6.16-rc3~13^2~1
>>>=20
>>> Users in your forums posts talk about 6.16 final working fine.  So I thi=
nk that when you bisected you ran into multiple confounding issues and repli=
cated in a similar fashion.  You should check every single bisect step to se=
e if 4d4c10f763d7808fbade28d83d237411603bca05 is applied.  If it's applied b=
ut 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0 is not applied in that step you s=
hould apply 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0.
>>>=20
>>> Hopefully that will get you down to the real cause.
>>=20
>> Thanks for the hint. Unfortunately I don=E2=80=99t have more time for fig=
uring out the issue.
>=20
> Does this patch help?
> https://patchwork.kernel.org/project/dri-devel/patch/20250805175752.690504=
-4-imre.deak@intel.com/
>=20
> Alex

Yes, it helps. The Radeon framebuffer works again.

Thank you=

