Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C160C43D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E6610E12A;
	Tue, 25 Oct 2022 06:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B4410E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666628700;
 bh=yEBLDeFnz8EfQ7kKMHjmF2KmCVxvaeuLLjYTy9QKjDc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:Reply-To:
 In-Reply-To;
 b=GzRcxznNwqrcOv1GNlBRuXlNdyOPl8Z6NeJ521fR3EU0t5e9xX4iGoz0lCtlpEDrt
 2ZyAQBdruU/O6vSADOB4il9s1r/rUG4w3PZJnauDqXT1FPKGEgZChLF3HHjI6ZG4H0
 QQv3LxeuMauv3+07gpws4F9rWjm/9s8z3n10oEdw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.179] ([91.141.38.147]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mxm3Q-1p0ewS1MR4-00zDVO; Mon, 24
 Oct 2022 18:19:18 +0200
Message-ID: <70e16994-6f5b-d648-0848-2eb7e3ad641a@gmx.net>
Date: Mon, 24 Oct 2022 18:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [Regression] CPU stalls and eventually causes a complete system
 freeze with 6.0.3 due to "video/aperture: Disable and unregister sysfb
 devices via aperture helpers"
Content-Language: de-AT
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <bbf7afe7-6ed2-6708-d302-4ba657444c45@leemhuis.info>
 <668a8ffd-ffc7-e1cc-28b4-1caca1bcc3d6@suse.de>
 <958fd763-01b6-0167-ba6b-97cbd3bddcb6@leemhuis.info>
 <Y1Z2sq9RyEnIdixD@kroah.com> <51651c2e-3706-37d7-01e7-5d473a412850@suse.de>
From: Andreas Thalhammer <andreas.thalhammer-linux@gmx.net>
In-Reply-To: <51651c2e-3706-37d7-01e7-5d473a412850@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BRwFxW5WQgw3ZgRuOhBNRWSsccGlAcy6n5B66EBbfseS4rkhTw9
 21baYB1HQqsrnCm5pD1/B3L35HuQ7y0Meqr/WKqoSjv3x2drjnaEkRVUH8fUfn3DqM29ni2
 eDtumUnpqv9Z7vnmJIxA2OIYarh++Vj4UX1KDnqgoOrKjillriC2UnHvJYkSHO/20WT6p2s
 zWW62wOnnO11Ja8wWiPvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2cTq1MUtiSY=:GXOn98qrNnHL8B7CLHnlWx
 l+cKMfIst7Ew484SdQ+yzP6bgYAMMPjNfbc2VyQDdDWvoCwpif3MTf4X5p0Jv2RL7lDo+1tiM
 9xHz0ZFw1Fqk+HQakrEEWLFFDl0xCZVReh7Se7FWVJk1AiCAMB/Epo45aQTzq7cv2nFa6SQo8
 imI2H/6oTJcciptqn92tSNs8R+72+VNNTEbCR02cEVvCfYerUAYY1Go48sPB6+NljXqkRL/YR
 oMFO4t8g30E8JLH71vM+WhQvnZgBLVmYYVKIB9gnGKEjSD6azRWDYVWh28lr/0yMxL3a5lTNW
 dDbBgK0lWhLWkD1pwbLvNCh5yaBvSWUkDQZ2VYcxopLLTALHgCEsTx5UmxXWvojP3s54hZ0vG
 1T2eRKZ9WfcffUnXTDg8NORP7Raf/z1/VC8nP/7jjMXaiPadcJPeYeObyFfmyLHB6+unT7oHF
 WDXfG0aov7HeFbOaU/n/q61nLot3lyOLOWiOQ66LyJTbw+QxLSEUvY8gr45a+l3h2E9RpCDRA
 4dOSibgS0RIyoBijhaiZP6er0wig6/4BHdIoGGfhitaXx9Dro3ou4nkToadf7vWNDEtMf6umE
 kOApY0yJhkkZ9OujlyxDCeLxgblbda2676iVIjAXTKGkvCta4DPNplKz5GJ4r8hqVerE9u//z
 C6Lex89cMqAQ4A8+y3PsyMr7A50z6RS9Gql4bgTnFzLHDXZeIEBmPyyut0UqNVE5RNJz47xw1
 L1JsGmyPOHp/pLWWYKvUtoOXrxQYE2msaFDQiYlnJUI7g4iu5GcxKDda+OJlmOhE3tWDob+Ao
 r9o62+8XDI4Qq5kw/20w77FSNRJrDc3hyT0paYOv2TEd8zBCi/cZSUUg+jxTlwCx3KeLVsm2s
 fWGqPNdOebhLGhM1kbTagyny8suMI6Kbn/xIvFzWAbCDyhKgkLUr5RVhaT27Ie9+FoP7F3NRA
 06h+0SHWJUYD5TroTnqCSGYnT54kGskRrv/rR64JI2dzFZA7ZNM+jLHa5CupkKNfvb90v/4bV
 oxaCfLjQSAaDAMjH7Iy5NdKf3kMvpoqkthIgsEHiUPsWpo3RmDb+PB6ndc7LjdBmHsoQbq4jj
 I2wEmLwd0QpNQ3IrOK1lC2G0A+iF97VruU9dD0kd+SdNWrjJJbQEUwudt6srBPWb9/lvGw339
 JnPUkViBoh0gkQ9tPEqafJB+3Oi/QuNaIT46XywAgdIw5ie1ZOQ/buGI+9hmVpEMyvPdI0L39
 En2by+sAVTdSprgC3zrKOKxxIupTBu6ey97ADtQ/00AqsCQF8o/2dy13l4wHtdQpDj8NVBKhF
 4EioluXuApxYJMBa76Dc47fpH5Stf2xwr11cvEM3PbP4J0Wf42dO8UCftyIkI4nNQWVUnzwkL
 UyJO4tT3ybIgunyAkCmE3jUeip9N0fqYNFKdu0qZ8ySX46nyu3W75lDFc617lMo4OORjbDKuM
 j+5PC5MTc32zxsTJx2fn4siB/eu3LHnRc/0xb4GoQCw6HK3p65OAjpoV6ugtOy/e6kaJY9IuA
 ei0PlBLkfHiUbdNygtEWKvn2/3UKPHFS8EC/UDgn64BF5aI01muA9h16Z1wHIsFmlpQ==
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:02 +0000
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
Reply-To: andreas.thalhammer@linux.com
Cc: Sasha Levin <sashal@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.10.22 um 13:31 schrieb Thomas Zimmermann:
> Hi
>
> Am 24.10.22 um 13:27 schrieb Greg KH:
>> On Mon, Oct 24, 2022 at 12:41:43PM +0200, Thorsten Leemhuis wrote:
>>> Hi! Thx for the reply.
>>>
>>> On 24.10.22 12:26, Thomas Zimmermann wrote:
>>>> Am 23.10.22 um 10:04 schrieb Thorsten Leemhuis:
>>>>>
>>>>> I noticed a regression report in bugzilla.kernel.org. As many (most?=
)
>>>>> kernel developer don't keep an eye on it, I decided to forward it by
>>>>> mail. Quoting from
>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=3D216616=C2=A0 :
>>>>>
>>>>>> =C2=A0=C2=A0 Andreas 2022-10-22 14:25:32 UTC
>>>>>>
>>>>>> Created attachment 303074 [details]
>>>>>> dmesg
>>>>
>>>> I've looked at the kernel log and found that simpledrm has been loade=
d
>>>> *after* amdgpu, which should never happen. The problematic patch has
>>>> been taken from a long list of refactoring work on this code. No wond=
er
>>>> that it doesn't work as expected.
>>>>
>>>> Please cherry-pick commit 9d69ef183815 ("fbdev/core: Remove
>>>> remove_conflicting_pci_framebuffers()") into the 6.0 stable branch an=
d
>>>> report on the results. It should fix the problem.
>>>
>>> Greg, is that enough for you to pick this up? Or do you want Andreas t=
o
>>> test first if it really fixes the reported problem?
>>
>> This should be good enough.=C2=A0 If this does NOT fix the issue, pleas=
e let
>> me know.
>
> Thanks a lot. I think I can provided a dedicated fix if the proposed
> commit doesn't work.
>
> Best regards
> Thomas
>
>>
>> thanks,
>>
>> greg k-h
>

Thanks... In short: the additional patch did NOT fix the problem.

I don't use git and I don't know how to /cherry-pick commit/
9d69ef183815, but I found the patch here:
https://patchwork.freedesktop.org/patch/494609/

I hope that's the right one. I reintegrated
v2-07-11-video-aperture-Disable-and-unregister-sysfb-devices-via-aperture-=
helpers.patch
and also applied
v2-04-11-fbdev-core-Remove-remove_conflicting_pci_framebuffers.patch,
did a "make mrproper" and thereafter compiled a clean new 6.0.3 kernel
(same .config).

Now the system doesn't even boot to a console. The first boot got me to
a rcu_shed stall on CPUs/tasks, same as above, but this time with:
Workqueue: btrfs-cache btrfs_work_helper

I booted a second time with the same kernel, and it got stuck after
mounting the root btrfs filesystem (what looked like a total freeze, but
when it didn't show a rcu_stall message after ~2 min I got impatient and
wanted to see if I had just busted my root filesystem...)

I booted 6.0.2 and everything is fine. (I'm very glad! I definitely
should update my backup right away!)

I will try 6.1-rc1 next, bear with...

