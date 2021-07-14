Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD63C8A55
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 19:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EA96E479;
	Wed, 14 Jul 2021 17:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B4F6E439;
 Wed, 14 Jul 2021 17:59:05 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 37125C8007F;
 Wed, 14 Jul 2021 19:59:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id xHflDaGA-OXn; Wed, 14 Jul 2021 19:59:03 +0200 (CEST)
Received: from [IPv6:2003:e3:7f13:3500:839f:11f6:c93a:c68b]
 (p200300E37F133500839f11f6c93ac68b.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f13:3500:839f:11f6:c93a:c68b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 7718FC80042;
 Wed, 14 Jul 2021 19:59:03 +0200 (CEST)
Subject: Re: [PATCH v4 12/17] drm/uAPI: Add "preferred color format" drm
 property as setting for userspace
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-13-wse@tuxedocomputers.com>
 <20210622101516.6a53831c@eldfell>
 <jIDQ2rRRMWlhDDPf08Z8xZlEE8HTBx7fHsylFdK0joSSFVyES8D444Giyiji9zbIm7dU4QpbsXZLvIDTbGW0wEoUWKsMEI4evizn0UdGMvM=@emersion.fr>
 <20210629141712.21f00c38@eldfell>
 <6d8716e0-e68a-e7b7-a341-a7471c413e9c@tuxedocomputers.com>
 <20210630114133.47397e2f@eldfell>
 <d3674d49-8bca-7ecf-1735-7bff2d9d526e@tuxedocomputers.com>
 <20210701110714.61f3e2af@eldfell>
 <b7144386-a98b-faf9-b425-c1157d9d0241@tuxedocomputers.com>
 <20210701162446.14f4f577@eldfell>
 <102bf05f-7081-c53b-ab0b-f2698c7540e9@tuxedocomputers.com>
 <20210706100942.3754a8e3@eldfell>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <40121889-739f-84bf-0222-497a0999ddf2@tuxedocomputers.com>
Date: Wed, 14 Jul 2021 19:59:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706100942.3754a8e3@eldfell>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.07.21 um 09:09 schrieb Pekka Paalanen:
> On Mon, 5 Jul 2021 17:49:42 +0200
> Werner Sembach <wse@tuxedocomputers.com> wrote:
>
>> Am 01.07.21 um 15:24 schrieb Pekka Paalanen:
>>> On Thu, 1 Jul 2021 14:50:13 +0200
>>> Werner Sembach <wse@tuxedocomputers.com> wrote:
>>>   
>>>> Am 01.07.21 um 10:07 schrieb Pekka Paalanen:
>>>>   
>>>>> On Wed, 30 Jun 2021 11:20:18 +0200
>>>>> Werner Sembach <wse@tuxedocomputers.com> wrote:
>>>>>     
>>>>>> Am 30.06.21 um 10:41 schrieb Pekka Paalanen:
>>>>>>     
>>>>>>> On Tue, 29 Jun 2021 13:39:18 +0200
>>>>>>> Werner Sembach <wse@tuxedocomputers.com> wrote:
>>>>>>>       
>>>>>>>> Am 29.06.21 um 13:17 schrieb Pekka Paalanen:
>>>>>>>>> On Tue, 29 Jun 2021 08:12:54 +0000
>>>>>>>>> Simon Ser <contact@emersion.fr> wrote:
>>>>>>>>>          
>>>>>>>>>> On Tuesday, June 22nd, 2021 at 09:15, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>>>>>>>>          
>>>>>>>>>>> yes, I think this makes sense, even if it is a property that one can't
>>>>>>>>>>> tell for sure what it does before hand.
>>>>>>>>>>>
>>>>>>>>>>> Using a pair of properties, preference and active, to ask for something
>>>>>>>>>>> and then check what actually worked is good for reducing the
>>>>>>>>>>> combinatorial explosion caused by needing to "atomic TEST_ONLY commit"
>>>>>>>>>>> test different KMS configurations. Userspace has a better chance of
>>>>>>>>>>> finding a configuration that is possible.
>>>>>>>>>>>
>>>>>>>>>>> OTOH, this has the problem than in UI one cannot tell the user in
>>>>>>>>>>> advance which options are truly possible. Given that KMS properties are
>>>>>>>>>>> rarely completely independent, and in this case known to depend on
>>>>>>>>>>> several other KMS properties, I think it is good enough to know after
>>>>>>>>>>> the fact.
>>>>>>>>>>>
>>>>>>>>>>> If a driver does not use what userspace prefers, there is no way to
>>>>>>>>>>> understand why, or what else to change to make it happen. That problem
>>>>>>>>>>> exists anyway, because TEST_ONLY commits do not give useful feedback
>>>>>>>>>>> but only a yes/no.
>>>>>>>>>> By submitting incremental atomic reqs with TEST_ONLY (i.e. only changing one
>>>>>>>>>> property at a time), user-space can discover which property makes the atomic
>>>>>>>>>> commit fail.
>>>>>>>>> That works if the properties are independent of each other. Color
>>>>>>>>> range, color format, bpc and more may all be interconnected,
>>>>>>>>> allowing only certain combinations to work.
>>>>>>>>>
>>>>>>>>> If all these properties have "auto" setting too, then it would be
>>>>>>>>> possible to probe each property individually, but that still does not
>>>>>>>>> tell which combinations are valid.
>>>>>>>>>
>>>>>>>>> If you probe towards a certain configuration by setting the properties
>>>>>>>>> one by one, then depending on the order you pick the properties, you
>>>>>>>>> may come to a different conclusion on which property breaks the
>>>>>>>>> configuration.
>>>>>>>> My mind crossed another point that must be considered: When plugin in
>>>>>>>> a Monitor a list of possible Resolutions+Framerate combinations is
>>>>>>>> created for xrandr and other userspace (I guess by atomic checks? but
>>>>>>>> I don't know).
>>>>>>> Hi,
>>>>>>>
>>>>>>> I would not think so, but I hope to be corrected if I'm wrong.
>>>>>>>
>>>>>>> My belief is that the driver collects a list of modes from EDID, some
>>>>>>> standard modes, and maybe some other hardcoded modes, and then
>>>>>>> validates each entry against all the known limitations like vertical
>>>>>>> and horizontal frequency limits, discarding modes that do not fit.
>>>>>>>
>>>>>>> Not all limitations are known during that phase, which is why KMS
>>>>>>> property "link-status" exists. When userspace actually programs a mode
>>>>>>> (not a TEST_ONLY commit), the link training may fail. The kernel prunes
>>>>>>> the mode from the list and sets the link status property to signal
>>>>>>> failure, and sends a hotplug uevent. Userspace needs to re-check the
>>>>>>> mode list and try again.
>>>>>>>
>>>>>>> That is a generic escape hatch for when TEST_ONLY commit succeeds, but
>>>>>>> in reality the hardware cannot do it, you just cannot know until you
>>>>>>> actually try for real. It causes end user visible flicker if it happens
>>>>>>> on an already running connector, but since it usually happens when
>>>>>>> turning a connector on to begin with, there is no flicker to be seen,
>>>>>>> just a small delay in finding a mode that works.
>>>>>>>       
>>>>>>>> During this drm
>>>>>>>> properties are already considered, which is no problem atm because as
>>>>>>>> far as i can tell there is currently no drm property that would make
>>>>>>>> a certain Resolutions+Framerate combination unreachable that would be
>>>>>>>> possible with everything on default.
>>>>>>> I would not expect KMS properties to be considered at all. It would
>>>>>>> reject modes that are actually possible if the some KMS properties were
>>>>>>> changed. So at least going forward, current KMS property values cannot
>>>>>>> factor in.
>>>>>> At least the debugfs variable "force_yuv420_output" did change the
>>>>>> available modes here:
>>>>>> https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L5165
>>>>>> before my patch
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=68eb3ae3c63708f823aeeb63bb15197c727bd9bf
>>>>> Hi,
>>>>>
>>>>> debugfs is not proper UAPI, so we can just ignore it. Display servers
>>>>> cannot be expected to poke in debugfs. Debugfs is not even supposed to
>>>>> exist in production systems, but I'm sure people use it for hacking
>>>>> stuff. But that's all it is for: developer testing and hacking.
>>>> e.g. Ubuntu has it active by default, but only read (and writable) by root.
>>> Hi,
>>>
>>> that's normal, yes. Root can do damage anyway, and it's useful for
>>> debugging. KMS clients OTOH often do not run as root.
>>>   
>>>>>     
>>>>>> Forcing a color format via a DRM property in this function would
>>>>>> reintroduce the problem.
>>>>> The property would need to be defined differently because its presence
>>>>> could otherwise break existing userspace. Well, I suppose it could
>>>>> break existing userspace no matter what, so we would need the generic
>>>>> "reset to sane defaults" mechanism first IMO.
>>>>>
>>>>> DRM has client caps for exposing video modes that old userspace might
>>>>> not expect, to avoid breaking old userspace. Care needs to be taken
>>>>> with all new UAPI, because if a kernel upgrade makes something wrong,
>>>>> it's the kernel's fault no matter what userspace is doing, in principle.
>>>> Can you give me a link describing how I define this caps?
>>> I don't have any, but you can find all the existing ones by grepping
>>> for DRM_CLIENT_CAP_.
>>>
>>> I'm not saying that we need it, but mentioning them as a possible
>>> workaround if userspace breakage seems imminent or is proven.
>>>   
>>>>> Debugfs has no problem breaking userspace AFAIU, since it's not proper
>>>>> UAPI.
>>>>>     
>>>>>> And I think i915 driver works similar in this regard.
>>>>>>     
>>>>>>>       
>>>>>>>> However for example forcing YCbCr420 encoding would limit the
>>>>>>>> available resolutions (my screen for example only supports YCbCr420
>>>>>>>> on 4k@60 and @50Hz and on no other resolution or frequency (native is
>>>>>>>> 2560x1440@144Hz).
>>>>>>>>
>>>>>>>> So would a "force color format" that does not get resetted on
>>>>>>>> repluging/reenabling a monitor break the output, for example, of an
>>>>>>>> not updated xrandr, unaware of this new property?
>>>>>>> Yes, not because the mode list would be missing the mode, but because
>>>>>>> actually setting the mode would fail.
>>>>>> Well, like described above, I think the mode would actually be missing,
>>>>>> which is also an unexpected behavior from a user perspective.
>>>>> I think that is not how the property should work.
>>>>>
>>>>> If KMS properties would affect the list of modes, then userspace would
>>>>> need to set the properties for real (TEST_ONLY cannot change anything)
>>>>> and re-fetch the mode lists (maybe there is a hotplug event, maybe
>>>>> not). That workflow just doesn't work.
>>>> The properties are set before the list is created in the first place.
>>>> Because, in my example, the properties get set before the monitor is
>>>> plugged in and the list can only be created as soon as the monitor is
>>>> plugged in.
>>> That's just an accident, it's not what I mean.
>>>
>>> What I mean is, we cannot have the KMS properties affect the list of
>>> modes, because then userspace that want to use specific values on those
>>> properties would have to program those properties first, and then get
>>> the list of modes. KMS UAPI does not work that way AFAIK.
>>>
>>> If the initial mode list is created on hotplug like you say, then the
>>> initial list could already be missing some modes that would be valid if
>>> some KMS properties had different values.
>> Depends if the mode list is created by TEST_ONLY:
> Hi,
>
> I'm pretty sure it's not created by any kind of atomic test probing,
> exactly because some properties might affect the result. Also because
> of legacy: the mode lists predate atomic by far. It just doesn't make
> sense to prune the mode list based on current arbitrary property values.

I implemented a buggy prototype for "force color format" and it doesn't 
make modes disappear as I feared.

It does successfully prevent setting a color format that is unsupported 
by the currently connected monitor.

However, if no monitor is connected and the property is set or the 
monitor is switched to another one that doesn't support currently the 
selected mode, the screen might stay black.

I don't think this should be the intended behavior, but the only 2 
sollutions i come up with violate the principle of not having a 
decentralized reset:

1. On monitor connect always reset the property to auto

     - alternatively: set on disconnect and don't allow to change 
without a connected monitor

2. On monitor connect, try the current setting and reset to auto if it 
fails (basically a one time "preferred color format" until the monitor 
capabilities are known).

>
> The function drm_helper_probe_single_connector_modes() looks relevant
> to me. It has a big comment that seems to point towards more things to
> look at.
>
>
> Thanks,
> pq
>
>> - The force properties should return false on TEST_ONLY
>>
>> - The force properties should not prevent the mode from showing up in the list
>>
>> If the list is created by TEST_ONLY both things can't be fulfilled at the same time obviously.
>>
>> I hope some can give more insights or has an idea how the properties could work best.
>>
>>>   
>>>>> A very interesting question is when should link-status failure not drop
>>>>> the current mode from the mode list, if other KMS properties affect the
>>>>> bandwidth etc. requirements of the mode. That mechanism is engineered
>>>>> for old userspace that doesn't actually handle link-status but does
>>>>> handle hotplug, so the hotplug triggers re-fetching the mode list and
>>>>> userspace maybe trying again with a better luck since the offending
>>>>> mode is gone. How to keep that working when introducing KMS properties
>>>>> forcing the cable format, I don't know.
>>>>>
>>>>> As long as the other affecting KMS properties are all "auto", the
>>>>> driver will probably exhaust all possibilities to make the mode work
>>>>> before signalling link-status failure and pruning the mode.
>>>>> Theoretically, as I have no idea what drivers actually do.
>>>> Isn't that exactly how the "preferred color format" property works in
>>>> my patchset now?
>>> There was an argument that "preferred" with no guarantees is not
>>> useful enough. So I'm considering the force property instead.
>>> The problem is, "auto" is not the only possible value.
>>>
>>> When the value is not "auto", should link failure drop the mode or not?
>>> Userspace might change the value back to "auto" next time. If you
>>> dropped the mode, it would be gone. If you didn't drop the mode,
>>> userspace might be stuck picking the same non-working mode again and
>>> again if it doesn't know about the force mode property.
>>>
>>> You could argue that changing the value back to "auto" needs to reset
>>> the mode list, but that only gets us back to the "need to set
>>> properties before getting mode list".
>>>
>>> Maybe there needs to be an assumption that if "force color format" is
>>> not "auto", then link failure does not drop modes and userspace knows
>>> to handle this. Messy.
>>>
>>> I'm afraid I just don't know to give any clear answer. It's also
>>> possible that, as I'm not a kernel dev, I have some false assumptions
>>> here.
>>>
>>>
>>> Thanks,
>>> pq
>>> _______________________________________________
>>> amd-gfx mailing list
>>> amd-gfx@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
