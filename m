Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E419521A13
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 15:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5828710E191;
	Tue, 10 May 2022 13:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03AD10E191
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 13:49:36 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1noQF4-0005ba-Pv; Tue, 10 May 2022 15:49:34 +0200
Message-ID: <236d9fca-8689-aa9a-ac25-b5696296b073@leemhuis.info>
Date: Tue, 10 May 2022 15:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: 5.18 vmwgfx seems to break booting VirtualBox VMs
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>
References: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
 <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
 <087a0754-422c-0d88-a5ed-c03f2b5906c2@redhat.com>
 <41AD6A60-9C2C-4545-8A62-114B07C0383F@vmware.com>
 <3d8f7aa0-0846-436d-7fe1-e8f8af7eaff5@leemhuis.info>
 <5F7AE997-3B4A-4E62-A1F7-ADC80D4EE0DB@vmware.com>
 <ddf6eadd-c96f-f52c-55e8-7a2095c2d965@leemhuis.info>
 <1a406c301679d0311c63dffb1f2959660b21e6e5.camel@vmware.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <1a406c301679d0311c63dffb1f2959660b21e6e5.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1652190576;
 4fac2893; 
X-HE-SMSGID: 1noQF4-0005ba-Pv
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
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.05.22 15:30, Zack Rusin wrote:
> On Tue, 2022-05-10 at 14:44 +0200, Thorsten Leemhuis wrote:
>> On 10.05.22 14:26, Zack Rusin wrote:
>>>> On May 10, 2022, at 7:06 AM, Thorsten Leemhuis
>>>> <regressions@leemhuis.info> wrote:
>>>> On 10.05.22 02:12, Zack Rusin wrote:
>>>>>> On May 9, 2022, at 6:57 AM, Hans de Goede
>>>>>> <hdegoede@redhat.com>
>>>>>> wrote: On 4/11/22 16:24, Zack Rusin wrote:
>>>>>>> On Mon, 2022-04-11 at 10:52 +0200, Hans de Goede wrote:
>>>>>>>>
>>>>>>>> Fedora has received a bug report here:
>>>>>>>>
>>>>>>>> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2072556&amp;data=05%7C01%7Czackr%40vmware.com%7Cb9226bb1368e4f33671a08da3282c85d%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637877834559681630%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=uqLgrc3fYw93qu1Gwdvc1YhCsFjejAy%2B4B%2BSgKzLil0%3D&amp;reserved=0
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>> That Fedora rawhide VMs no longer boot under the VirtualBox
>>>>>>>> hypervisor after the VM has been updated to a 5.18-rc#
>>>>>>>> kernel.
>>>>>>>>
>>>>>>>> Switching the emulated GPU from vmwaregfx to
>>>>>>>> VirtualBoxSVGA
>>>>>>>> fixes this, so this seems to be a vmwgfx driver
>>>>>>>> regression.
>>>>>>>>
>>>>>>>> Note I've not investigated/reproduced this myself due to
>>>>>>>> -ENOTIME.
>>>>>>>
>>>>>>> Thanks for letting us know. Unfortunately we do not support
>>>>>>> vmwgfx on VirtualBox. I'd be happy to review patches
>>>>>>> related to
>>>>>>> this, but it's very unlikely we'd have to time to look at
>>>>>>> this
>>>>>>> ourselves.
>>>>>>
>>>>>> I somewhat understand where you are coming from, but this is
>>>>>> not 
>>>>>> how the kernels "no regressions" policy works.
>>>>
>>>> Hans, many thx for writing your mail, I once intended to write
>>>> something
>>>> similar, but then forgot about it. :-/
>>>>
>>>>>> For the end user a regression is a regression and as
>>>>>> maintainers we
>>>>>> are supposed to make sure any regressions noticed are fixed
>>>>>> before
>>>>>> a new kernel hits end user's systems.
>>>>>
>>>>> I think there’s a misunderstanding here - the vmwgfx driver
>>>>> never
>>>>> supported VirtualBox. VirtualBox implementation of the svga
>>>>> device
>>>>> lacks a bunch of features,
>>>>
>>>> Which from the kernel's point of view is irrelevant. If the Linux
>>>> kernel's vmwgfx driver ever supported the VirtualBox
>>>> implementation then
>>>> things shouldn't regress with later versions.
>>> It never did. vmwgfx is just a driver for VMware's SVGA device, it
>>> never supported anything else. 
>>
>> Now I'm curious and would like to understand the issue properly, if
>> you
>> have a minute. :-D
>>
>> I didn't mean "supported" as in "officially supported", I meant as in
>> "it ran (as in automatically bonded) on VirtualBox in one of the
>> modes
>> one could configure in VirtualBox for virtual GPU". And the latter is
>> the case here afaics, or isn't it?
> 
> I wouldn't know that. But if the claim is that anyone lying about the
> type of device they are can hijack development then we'll need Linus to
> clarify that,

Feel free to ask, I doubt that will work out, but yes, in the end it's
Linus decision.

> i.e. if I create a PCI device that identifies itself as a
> random AMD GPU

That's not the case and thus a misleading example afaics. Here someone
created a virtual PCI device that seems to be compatible to the original
(just like someone created a virtual cirrus device with Qemu that worked
with the original cirrus drivers -- with the difference in this case
that both original and compatible devices are virtual). And it seemed
like that compatible virtual device worked fine with the driver for the
original device for people. Then by kernel standards you are not allowed
to break this setup with any changes you make to the driver, even if the
driver was only meant for the original device. Not sure, maybe that is
even not to hard by using quirks or something if the compatible GPU can
be detected (in this case the one from VirtualBox)?

> and crashes as soon you try to do any register access is
> AMD gpu driver development done now? Clearly addition of any AMD gpu
> driver would regress my device.

Ciao, Thorsten
