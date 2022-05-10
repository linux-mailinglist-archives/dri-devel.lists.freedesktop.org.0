Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5715452132C
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 13:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC4810F590;
	Tue, 10 May 2022 11:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF19810F590
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 11:07:00 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1noNhj-0000RL-6L; Tue, 10 May 2022 13:06:59 +0200
Message-ID: <3d8f7aa0-0846-436d-7fe1-e8f8af7eaff5@leemhuis.info>
Date: Tue, 10 May 2022 13:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, Hans de Goede <hdegoede@redhat.com>
References: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
 <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
 <087a0754-422c-0d88-a5ed-c03f2b5906c2@redhat.com>
 <41AD6A60-9C2C-4545-8A62-114B07C0383F@vmware.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: 5.18 vmwgfx seems to break booting VirtualBox VMs
In-Reply-To: <41AD6A60-9C2C-4545-8A62-114B07C0383F@vmware.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1652180820;
 cf0581fa; 
X-HE-SMSGID: 1noNhj-0000RL-6L
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker.

On 10.05.22 02:12, Zack Rusin wrote:
>> On May 9, 2022, at 6:57 AM, Hans de Goede <hdegoede@redhat.com>
>> wrote: On 4/11/22 16:24, Zack Rusin wrote:
>>> On Mon, 2022-04-11 at 10:52 +0200, Hans de Goede wrote:
>>>> 
>>>> Fedora has received a bug report here:
>>>> 
>>>> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2072556&amp;data=05%7C01%7Czackr%40vmware.com%7C89c5a1adfffd434f102c08da31aaabcc%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637876906347789531%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=L3rfwX0R0XXgEJbI88kY%2B7SrIqyJtuC7VLcN97NUSuk%3D&amp;reserved=0
>>>>
>>>>
>>>> 
That Fedora rawhide VMs no longer boot under the VirtualBox
>>>> hypervisor after the VM has been updated to a 5.18-rc# kernel.
>>>> 
>>>> Switching the emulated GPU from vmwaregfx to VirtualBoxSVGA
>>>> fixes this, so this seems to be a vmwgfx driver regression.
>>>> 
>>>> Note I've not investigated/reproduced this myself due to
>>>> -ENOTIME.
>>> 
>>> Thanks for letting us know. Unfortunately we do not support
>>> vmwgfx on VirtualBox. I'd be happy to review patches related to
>>> this, but it's very unlikely we'd have to time to look at this
>>> ourselves.
>> 
>> I somewhat understand where you are coming from, but this is not 
>> how the kernels "no regressions" policy works.

Hans, many thx for writing your mail, I once intended to write something
similar, but then forgot about it. :-/

>> For the end user a regression is a regression and as maintainers we
>> are supposed to make sure any regressions noticed are fixed before
>> a new kernel hits end user's systems.
> 
> I think there’s a misunderstanding here - the vmwgfx driver never
> supported VirtualBox. VirtualBox implementation of the svga device
> lacks a bunch of features,

Which from the kernel's point of view is irrelevant. If the Linux
kernel's vmwgfx driver ever supported the VirtualBox implementation then
things shouldn't regress with later versions.

> vmwgfx has been put on denylists

/me wonders what exactly is meant by "denylists" here in the upstream
context(¹), but whatever, doesn't matter much now afaics.

(¹) Did the users that reported the issue do anything unusual (like
writing telling the driver to load with a pciid that is normally doesn't
support) to be enable vmwgfx for this hardware?

> before
> due to bugs in VirtualBox implementation of it, we just didn’t feel
> like playing games like having the driver query the hypervisor “are
> you really from VMware?” and refuse to load.
> 
> In this case it’s their lack of mksStats interfaces that’s the issue.
> We can’t stop development of vmwgfx because our competitor was trying
> to reuse our work and didn’t implement the features we have. vmwgfx
> patches are now months ahead on drm-misc-next which should give
> anyone working on that device in VirtualBox plenty of time to fix it.

As Hans said: 'this is not how the kernels "no regressions" policy
works.' For details see these documents, esp. the quotes from Linus.

https://www.kernel.org/doc/html/latest/admin-guide/reporting-regressions.html
https://www.kernel.org/doc/html/latest/process/handling-regressions.html

> I’m happy to spend my spare time reviewing patches that would make it
> work but it’s just not reasonable to expect anyone to spend their
> time in the office working on a directly competing product.

No, but maintaining the driver in the kernel also means that you can't
break a directly competing product, otherwise Linus might revert the
commits that cause this, unless someone fixes the breakage.

>> At a minimum it would have been good if you had tried to at least 
>> reproduce this bug by installing Fedora rawhide inside an actual 
>> vmware VM. I've just spend a couple of hours debugging this and the
>> bug definitely impacts vmware VMs too; and thus very likely also
>> reproduces there.
> 
> We’re always running Fedora, it should always just work on vmwgfx.
> 
>> I've a patch fixing this, which I will send out right after this 
>> email.

Many thx for taking care of this, Hans!

> That looks like a back porting issue. drm-misc/drm-misc-next is
> continuously tested on Fedora with vmwgfx so any breaks should never
> last more than a day. I’ll back port some patches tomorrow when
> drm-misc-next-fixes opens (because it’s after rc6). I’m sorry you had
> to deal with this, just send me an email next time, I should always
> have a pretty good handle on any issues with Fedora with latest
> vmwgfx.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
