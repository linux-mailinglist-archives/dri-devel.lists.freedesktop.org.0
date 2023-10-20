Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5CF7D0C00
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 11:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE0C899C7;
	Fri, 20 Oct 2023 09:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6136899C7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 09:35:47 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1qtlut-0003Mz-MB; Fri, 20 Oct 2023 11:35:39 +0200
Message-ID: <c9b79a69-bdc1-4457-900d-709a15d99568@leemhuis.info>
Date: Fri, 20 Oct 2023 11:35:38 +0200
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
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAAhV-H5GbidUx8YanUc7S9oGqBkDd53xeT=2O4aCuX7KpM-+8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1697794555;
 edf067ed; 
X-HE-SMSGID: 1qtlut-0003Mz-MB
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jaak Ristioja <jaak@ristioja.ee>, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09.10.23 10:54, Huacai Chen wrote:
> On Mon, Oct 9, 2023 at 4:45 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
>>> On Tue, Sep 26, 2023 at 10:31 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>>>> On Tue, Sep 26, 2023 at 7:15 PM Linux regression tracking (Thorsten
>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
>>>>>>
>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank
>>>>>> screen after boot until the display manager starts... if it does start
>>>>>> at all. Using the nomodeset kernel parameter seems to be a workaround.
>>>>>>
>>>>>> I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
>>>>>> ("drivers/firmware: Move sysfb_init() from device_initcall to
>>>>>> subsys_initcall_sync").
>>>>>
>>>>> Hmmm, no reaction since it was posted a while ago, unless I'm missing
>>>>> something.
>>>>>
>>>>> Huacai Chen, did you maybe miss this report? The problem is apparently
>>>>> caused by a commit of yours (that Javier applied), you hence should look
>>>>> into this.
>>>> I'm sorry but it looks very strange, could you please share your config file?
>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fine
>>> again. So I guess the reason:
>>
>> Did Jaak reply privately? It should have been disclosed in public
>> ML here instead.
> Yes, he replied privately, and disabling DRM_SIMPLEDRM was suggested by me.

Well, this to me still looks a lot (please correct me if I'm wrong) like
regression that should be fixed, as DRM_SIMPLEDRM was enabled beforehand
if I understood things correctly. Or is there a proper fix for this
already in the works and I just missed this? Or is there some good
reason why this won't/can't be fixed?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

>>> When SIMPLEDRM takes over the framebuffer, the screen is blank (don't
>>> know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: Move
>>> sysfb_init() from device_initcall to subsys_initcall_sync") there is
>>> no platform device created for SIMPLEDRM at early stage, so it seems
>>> also "no problem".
>>
>> I don't understand above. You mean that after that commit the platform
>> device is also none, right?
> No. The SIMPLEDRM driver needs a platform device to work, and that
> commit makes the platform device created earlier. So, before that
> commit, SIMPLEDRM doesn't work, but the screen isn't blank; after that
> commit, SIMPLEDRM works, but the screen is blank.
> 
> Huacai
>>
>> Confused...
>>
>> --
>> An old man doll... just what I always wanted! - Clara
> 
> 
