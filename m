Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D206E7D6D81
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 15:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D6A10E65A;
	Wed, 25 Oct 2023 13:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4349710E65C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:43:06 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1qve9u-0002YC-Np; Wed, 25 Oct 2023 15:42:54 +0200
Message-ID: <c1f50467-1524-40a3-b0ae-44795990a912@leemhuis.info>
Date: Wed, 25 Oct 2023 15:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
Content-Language: en-US, de-DE
To: Huacai Chen <chenhuacai@kernel.org>
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
 <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
 <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
 <ZSO9uArAtsPMPeTP@debian.me>
 <CAAhV-H5GbidUx8YanUc7S9oGqBkDd53xeT=2O4aCuX7KpM-+8A@mail.gmail.com>
 <c9b79a69-bdc1-4457-900d-709a15d99568@leemhuis.info>
 <CAAhV-H4qQW_fOdkTxmT1xbvo4LOapzw_tOw7Kma47xmh0PvpPA@mail.gmail.com>
 <ZTWoDSPxGO-ApR4r@P70.localdomain>
 <82f1b533-3bd8-4418-843a-718d9a6b5786@leemhuis.info>
 <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1698241387;
 f0c448bc; 
X-HE-SMSGID: 1qve9u-0002YC-Np
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jaak Ristioja <jaak@ristioja.ee>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Evan Preston <x.arch@epreston.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.10.23 15:23, Huacai Chen wrote:
> On Wed, Oct 25, 2023 at 6:08 PM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>>
>> Javier, Dave, Sima,
>>
>> On 23.10.23 00:54, Evan Preston wrote:
>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
>>>> On Fri, Oct 20, 2023 at 5:35 PM Linux regression tracking (Thorsten
>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>> On 09.10.23 10:54, Huacai Chen wrote:
>>>>>> On Mon, Oct 9, 2023 at 4:45 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
>>>>>>>> On Tue, Sep 26, 2023 at 10:31 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>>>>>>>>> On Tue, Sep 26, 2023 at 7:15 PM Linux regression tracking (Thorsten
>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
>>>>>>>>>>>
>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank
>>>>>>>>>>> screen after boot until the display manager starts... if it does start
>>>>>>>>>>> at all. Using the nomodeset kernel parameter seems to be a workaround.
>>>>>>>>>>>
>>>>>>>>>>> I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from device_initcall to
>>>>>>>>>>> subsys_initcall_sync").
>>>>>>>>>>
>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fine
>>>>>>>> again. So I guess the reason:
>>>>>
>>>>> Well, this to me still looks a lot (please correct me if I'm wrong) like
>>>>> regression that should be fixed, as DRM_SIMPLEDRM was enabled beforehand
>>>>> if I understood things correctly. Or is there a proper fix for this
>>>>> already in the works and I just missed this? Or is there some good
>>>>> reason why this won't/can't be fixed?
>>>>
>>>> DRM_SIMPLEDRM was enabled but it didn't work at all because there was
>>>> no corresponding platform device. Now DRM_SIMPLEDRM works but it has a
>>>> blank screen. Of course it is valuable to investigate further about
>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's effort because
>>>> I don't have a same machine.
>>
>> Side note: Huacai, have you tried working with Jaak to get down to the
>> real problem? Evan, might you be able to help out here?
> No, Jaak has no response after he 'fixed' his problem by disabling SIMPLEDRM.

Yeah, understood, already suspected something like that, thx for confirming.

>> But I write this mail for a different reason:
>>
>>> I am having the same issue on a Lenovo Thinkpad P70 (Intel
>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) i7-6700HQ).
>>> Upgrading from Linux 6.4.12 to 6.5 and later results in only a blank
>>> screen after boot and a rapidly flashing device-access-status
>>> indicator.
>>
>> This additional report makes me wonder if we should revert the culprit
>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But I guess that
>> might lead to regressions for some users? But the patch description says
>> that this is not a common configuration, so can we maybe get away with that?
>>From my point of view, this is not a regression, 60aebc9559492c
> doesn't cause a problem, but exposes a problem.

From my understanding of Linus stance in cases like this I think that
aspect doesn't matter. To for example quote
https://lore.kernel.org/lkml/CAHk-=wiP4K8DRJWsCo=20hn_6054xBamGKF2kPgUzpB5aMaofA@mail.gmail.com/

""
But it ended up exposing another problem, and as such caused a kernel
upgrade to fail for a user. So it got reverted.
"""

For other examples of his view see the bottom half of
https://docs.kernel.org/process/handling-regressions.html

We could bring Linus in to clarify if needed, but I for now didn't CC
him, as I hope we can solve this without him.

> So we need to fix the
> real problem (SIMPLEDRM has a blank screen on some conditions). This
> needs Jaak or Evan's help.

I'm all for solving the real problem, but if that is not possible within
a reasonable timeframe (which seems to be the case here) I assume Linus
in cases like this would want the culprit to be reverted. Unless of
cause that itself might cause a regression (which is possible, as the
commit made it into 6.5), then things become tricky.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

>>>>>>>> When SIMPLEDRM takes over the framebuffer, the screen is blank (don't
>>>>>>>> know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: Move
>>>>>>>> sysfb_init() from device_initcall to subsys_initcall_sync") there is
>>>>>>>> no platform device created for SIMPLEDRM at early stage, so it seems
>>>>>>>> also "no problem".
>>>>>>> I don't understand above. You mean that after that commit the platform
>>>>>>> device is also none, right?
>>>>>> No. The SIMPLEDRM driver needs a platform device to work, and that
>>>>>> commit makes the platform device created earlier. So, before that
>>>>>> commit, SIMPLEDRM doesn't work, but the screen isn't blank; after that
>>>>>> commit, SIMPLEDRM works, but the screen is blank.
>>>>>>
>>>>>> Huacai
>>>>>>>
>>>>>>> Confused...
>>>>>>>
>>>>>>> --
>>>>>>> An old man doll... just what I always wanted! - Clara
>>>>>>
>>>>>>
>>>
>>>
> 
> 
