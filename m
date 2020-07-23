Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C76422BEF7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 09:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9224C6E928;
	Fri, 24 Jul 2020 07:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4308E6E239
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 17:26:25 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f19c7c50000>; Thu, 23 Jul 2020 10:24:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 23 Jul 2020 10:26:24 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 23 Jul 2020 10:26:24 -0700
Received: from [172.20.40.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 17:26:23 +0000
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Daniel Vetter <daniel@ffwll.ch>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <20200402113925.2zvatduiyqld7pj2@wunner.de>
 <fafd3a20-7da4-f370-0356-576bca565bd1@nvidia.com>
 <CAKMK7uEx3YTVNryAcJii67YdtyJOpzh+h-Sg1XD1sqpaVOPcJA@mail.gmail.com>
 <2634a841-a114-c65f-1dab-30deedb0fa05@nvidia.com>
 <CAKMK7uGBZdFoUGDR3c_+xPoo4fOzvSJ03md3ej6g91hbdV41kg@mail.gmail.com>
 <51fe5d97-1482-c93a-5b6f-04e2f6ccad78@nvidia.com>
 <20200428101413.GF3456981@phenom.ffwll.local>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <ba78cd19-45ad-b17e-5174-256cc11f36c2@nvidia.com>
Date: Thu, 23 Jul 2020 12:28:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428101413.GF3456981@phenom.ffwll.local>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595525062; bh=psktn0T0i21c+0FPr1lLmztlYCPZ3OnB1sJUxeOz0Wg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=MgTGkm6h69ss4EjoOT+fUPLOhDyVnWyNnwH1c2Da5kHncdzEgBTj5B+mTL4jQVXlQ
 15q8Dx+cQHtjfLnwIrhaygRsY/XxpFJtfRQYK3k4k2txfvUXujNkO2/Tc5iHHoYPb4
 I5Il5cI1jK2/VnPGdkd3rzz8C9ObyuXUo9ApyAz/XIPp/s9zh59zSSP65t4OF3h/Ue
 GRxiCHS3eKeKB/5HR9wI20G7EGiX0zr6hXoM0dehcvlPQgJhkZ9fFg4uSpqcGiDq/V
 bZSrJMNJPjMJrv3xPxENJhuHJ729tRHeEmP7b4tHeh51qgIEO0jy9EtVsfjbR69bw4
 Y5PKGGKVtv8VQ==
X-Mailman-Approved-At: Fri, 24 Jul 2020 07:21:47 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for letting this stagnate. I have some patches ready for 
discussion which I'll send shortly, but wanted to follow up on some of 
the previous conversation:

On 4/28/20 5:14 AM, Daniel Vetter wrote:
>
> On Wed, Apr 22, 2020 at 05:04:54PM -0500, Daniel Dadap wrote:
>> On 4/3/20 2:59 PM, Daniel Vetter wrote:
>>> On Fri, Apr 3, 2020 at 8:06 PM Daniel Dadap <ddadap@nvidia.com> wrote:
>>>> On 4/3/20 2:16 AM, Daniel Vetter wrote:
>>>>> On Fri, Apr 3, 2020 at 8:54 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>>>>>> On 4/2/20 6:39 AM, Lukas Wunner wrote:
>>>>>>
>>>>>>
>>>>>> On Fri, Mar 27, 2020 at 04:25:19PM -0500, Daniel Dadap wrote:
>>>>>>>> A number of hybrid GPU notebook computer designs with dual (integrated plus
>>>>>>>> discrete) GPUs are equipped with multiplexers (muxes) that allow display
>>>>>>>> panels to be driven by either the integrated GPU or the discrete GPU.
>>>>>>>> Typically, this is a selection that can be made at boot time as a menu
>>>>>>>> option in the system firmware's setup screen, and the mux selection stays
>>>>>>>> fixed for as long as the system is running and persists across reboots until
>>>>>>>> it is explicitly changed. However, some muxed hybrid GPU systems have
>>>>>>>> dynamically switchable muxes which can be switched while the system is
>>>>>>>> running.
>>>>>>> As you may be aware, there's drivers/gpu/vga/vga_switcheroo.c (of which
>>>>>>> I'm listed as a reviewer in MAINTAINERS) to support such hardware.
>>>>>>>
>>>>>>> It also supports muxed configurations, including those that support
>>>>>>> switching at runtime (and not only at boot) such as the MacBook Pro,
>>>>>>> which uses drivers/platform/x86/apple-gmux.c to interface between
>>>>>>> vga_switcheroo and the hardware mux.
>>>>>>>
>>>>>>> However, so far switching only actually works on LVDS-based MacBook Pros,
>>>>>>> i.e. all pre-retina machines introduced between Late 2008 and Mid 2012,
>>>>>>> because that hardware is capable of switching the DDC pins separately
>>>>>>> from the display, so we lock and switch them when probing the EDID.
>>>>>> I have observed that on at least some systems, the EDID for the internal
>>>>>> panel can be read via the ACPI _DDC method regardless of whether it's
>>>>>> actively muxed in. I don't know whether that's true for all systems
>>>>>> where the DDC line can't be switched independently, but maybe
>>>>>> vga_switcheroo could also export an interface for GPU drivers to cache
>>>>>> EDIDs so that a muxed-away GPU can read an EDID that was previously read
>>>>>> by another GPU? I guess the utility of that would depend on how
>>>>>> prevalent the combination of no DDC muxing + no ACPI EDID reads turns
>>>>>> out to be.
>>>>>>
>>>>>>
>>>>>>> The retina machines introduced from Mid 2012 onward use eDP and run
>>>>>>> into the issues you're describing:  The AUX channel cannot be switched
>>>>>>> separately from the display, so link training fails unless the entire
>>>>>>> display is switched.  Nevertheless macOS can switch the panel seamlessly.
>>>>>>> So how are they doing it?
>>>>>>>
>>>>>>> Well, I don't own a retina MacBook Pro, hence never got very far with
>>>>>>> supporting them, but I did some research and experiments in the 2015/2016
>>>>>>> time frame which a colleague, Bruno Bierbaumer, tested on his machine:
>>>>>>>
>>>>>>> First of all, there's DPCD byte 3 bit 6 (NO_AUX_HANDSHAKE_LINK_TRAINING)
>>>>>>> which is documented as follows:
>>>>>>>
>>>>>>>         Does not require AUX CH handshake when the link configuration is
>>>>>>>         already known. [...] The known-good drive current and pre-emphasis
>>>>>>>         level (or those used in the last "full" link training with AUX CH
>>>>>>>         handshake) must be used when the link training is performed without
>>>>>>>         AUX CH handshake.
>>>>>>>
>>>>>>> That bit is set on the MacBook Pros in question.
>>>>>> I'll check one of the eDP-based systems I've been experimenting on to
>>>>>> see if setting the VGA_SWITCHER_NEEDS_EDP_CONFIG capability in the
>>>>>> handler is sufficient to make i915 avoid poking the AUX channel when
>>>>>> it's mux-switched away. (This would be in addition to hacking the
>>>>>> can_switch() callback in the GPU drivers to allow switching while there
>>>>>> are still active KMS clients for the purposes of this experiment, unless
>>>>>> somebody can point me to a tree with the WIP per-output switching Daniel
>>>>>> Vetter mentioned.
>>>>> Two things: I thought (but not sure) that for the output switching
>>>>> muxes we'd run vgaswitcheroo in a different mode, where it doesn't
>>>>> check whether whether the driver can be killed. Because it wont. On a
>>>>> quick search only thing I've found is the ddc-only switching done by
>>>>> vga_switcheroo_lock/unlock_ddc. Maybe misremembering, but I thought
>>>>> there was more. But been a while I last looked at this all in detail.
>>>>>
>>>>> Wrt per-output switching WIP branch. That would be something you'd
>>>>> need to type ofc, I was just laying out what I think would make sense
>>>>> as a possible path to integrate this into upstream.
>>>>> -Daniel
>>>> Okay. I misunderstood. When you said that vga-switcheroo could switch
>>>> individual outputs and do so without powering down the
>>>> switched-away-from GPU, I took that to mean that this feature had
>>>> already been implemented somewhere, despite appearances to the contrary
>>>> upstream. I agree that adding per-output switching support to
>>>> vga-switcheroo would be a sensible path.
>>> So I looked again, and maybe another clarification. What I think is
>>> already there is the use-case of switching one integrated panel. I
>>> checked the code now, this is supported with
>>> DRM_SWITCH_POWER_DYNAMIC_OFF. Essentially this allows you to always
>>> open the gpu cdev node, no matter the vgaswitcheroo state. And the
>>> vgaswitcheroo only controls where the outputs are connected (and most
>>> designs only switch the integrated panel, external outputs go to the
>>> discrete gpu).
>>
>> Okay, it looks like you're talking about the support for "mux-only"
>> switching (MIGD/MDIS). It seems that this doesn't touch any of the driver
>> callbacks, though, and it would be nice to at least hit reprobe(). Would it
>> make sense to implement another switch type that switches without checking
>> can_switch(), but still hits the driver callbacks? I switched my PoC to do
>> this and it seems to work so far.
> ->can_switch has the most questionable of locking, so reworking that
> sounds like a good idea I'd say. I thought for the dynamic case we already
> skip checking that ...


So for "mux only" switches can_switch is indeed skipped, but so is reprobe.


>>> The ddc switching is so that the external gpu can still probe the
>>> panel when it's connected to the integrated gpu.
>>>
>>> What's not there is switching for outputs indivually.
>>>
>>> Note that's at least my understanding, I dont have a system supporting this.
>>>
>>> So my suggestio would be:
>>> - mayke the nvidia blob work with the current stuff first. I assume
>>> you'll need that :-)
>>> - look into fixing the locking and refcounting bugs. There's FIXME's
>>> all over the code, and we kinda need to address this before we make
>>> everything worse.
>>>
>>> That gets us a baseline. Next up I think enabling the seamless edp
>>> switching would be nice. For that we don't really need any per-output
>>> switching yet, the current vgaswitcheroo model still works. But what
>>> we probably need:
>>> - some coordination between drm drivers, probably going through
>>> userspace so we follow the sequence correctly
>>> - a new uapi which userspace can use without going into debugfs (which
>>> is a no-go really for shipping to enduser). Probably something that's
>>> tied to drm_connectors so we can extend it later on
>>> - the userspace which makes this work seamlessly, if you want this
>>> with X that probably means -modesetting.
>>>
>>>> Does this sound like a sensible high-level design?
>>>>
>>>>
>>>> * vga-switcheroo-capable GPU drivers can register muxable outputs.
>>>> * Each GPU driver must register each unique muxable output with the same
>>>> identifier. The outputs will be registered together with individual
>>>> devices they can be muxed to, in order to support e.g. muxing between
>>>> different GPU devices driven by the same vendor. (I'm not aware of any
>>>> designs that actually support this, but it seems reasonable to design
>>>> for.) The output identifier may be platform-specific (e.g. ACPI handle,
>>>> simple index). For example, two GPU drivers may each register an
>>>> internal panel with identifier "0" and an external port with identifier "1".
>>>> * For each output that was registered with more than one device,
>>>> vga-switcheroo will expose a sysfs file listing the devices that output
>>>> can be muxed to, and a sysfs file allowing the selection of a particular
>>>> device. Perhaps these could be the same file (e.g., on reading it prints
>>>> a list with an indicator to mark the currently selected device, write a
>>>> device ID to switch to that device).
>>> With my plan the above isn't needed, at least not at first. Naming and
>>> identifying stuff is a really hard problem, so probably best we delay
>>> it so we have more time to figure this out.
>>>
>>>> I think this would allow flexibility across N muxable outputs that can
>>>> each be switched to one of M GPU devices, without requiring that each of
>>>> the outputs be switchable to all M possible GPUs.
>>>>
>>>>
>>>> In addition to the above mechanism for advertising the switchability of
>>>> individual outputs and providing an interface, the following would also
>>>> be needed to support PSR:
>>>>
>>>>
>>>> * A new callback for GPU drivers so vga-switcheroo can tell them an
>>>> output is being switched to a GPU.
>>>> * vga-switcheroo can call this callback for all devices once before
>>>> switching the mux, and then again after the mux switch is complete. A
>>>> parameter of the callback would indicate whether the mux switch is
>>>> pending, completed, or failed, allowing GPU drivers to do any necessary
>>>> pre-switch setup, post-switch cleanup, or failed-switch recovery in
>>>> response to events from vga-switcheroo.
>>>> * Maybe a similar callback for mux handlers so vga-switcheroo can signal
>>>> pre- and post-switch events to the handler driver. The PSR designs I'm
>>>> aware of are GPU-driven, but I can imagine a design that is driven by
>>>> some component other than a GPU, in which case it would make sense for
>>>> the mux handler to drive PSR. I suppose this could be left out for now
>>>> and then added later if such a design emerges.
>>>> * It would probably be good to let userspace drive the pre/switch/post
>>>> operations independently, e.g. so that userspace can prepare the first
>>>> frame for presentation on the switched-to GPU before PSR is disabled.
>>> This more or less matches what I'm suggesting too. Except no new
>>> callbacks just because we might need them, we're only going to add
>>> what the drivers actually need to orchestrate a given use case. The
>>> drivers = i915 + nouveau + whatever vgaswitcheroo mux driver you have,
>>> all in upstream.
>>>
>>>> Now, I'm not sure if it makes more sense to also implement the AUX
>>>> channel proxying that Lukas had prototyped a while back, or to update
>>>> i915 and any other vga-switcheroo-compatible drivers that assume that
>>>> eDP is always connected to allow for the possibility of eDP being
>>>> disconnected due to being muxed away. I personally think disconnecting
>>>> the eDP output makes more sense, since it more accurately reflects
>>>> reality than proxying the AUX channel through to the GPU that's muxed
>>>> in, but if there's another reason the AUX proxying makes more sense, we
>>>> could plan on making that work (on a per-output basis, since I think
>>>> e.g. regular DP for external connectors wouldn't need this) as well.
>>> I think if we expect userspace to drive the seamless edp transition,
>>> then probably a disconnected state that reflects reality is needed.
>>>
>>> otoh, and I think that's the driver behind Lukas' work: Current
>>> drivers need the edp state to set everything up at driver load. If
>>> they can only fully probe the features of the integrated panel later
>>> on it's too late. That's also why we have the ddx mux, so that drivers
>>> can load as if they're connected to the panel.
>>>
>>> So I think we still need Lukas' edp proxying patches most likely. What
>>> the userspace visible connection_status will be like needs to be
>>> figured out with how exactly we're going to drive the switchover.
>>
>> What exactly do the drivers need to probe? Is there more than just the
>> panel's EDID involved? Many systems implement a _DDC method in ACPI which
>> allows retrieving the internal panel's EDID via ACPI, which on muxed
>> systems, is especially useful, as it will work regardless of which driver
>> needs it or what the current mux state is.
> Edid, but also dp aux register values (since almost everything is edp
> nowadays, at least on laptops). Especially for edp panels there's a lot of
> dpcd for all the fancy features.
>
>> Lukas suggested caching "the required portions of the DPCD", so it sounds
>> like it might be more than just the EDID, though. I was looking at plumbing
>> through our DP AUX code to the DRM DP helpers so I could try testing that,
>> but it wasn't as trivial as I had hoped, so I want to be sure that it's
>> really needed before going further down that path. I'm also a bit nervous
>> about giving drivers access to other drivers' DP AUX channels. Limiting it
>> to reading DPCD is possibly okay, but even then, there may be registers with
>> read side effects.
> Yeah I think some dpcd cache could be all we need.


I experimentally implemented a DPCD cache but found that it didn't seem 
to add any value, but perhaps I just wasn't hitting any code paths where 
DPCD access was required. I've omitted it from the current patch series 
because I didn't test it particularly heavily. With my current patches, 
I can get the mux to hand off successfully between the NVIDIA and 
modesetting X.org drivers, but not yet between two different DRM-KMS 
drivers both using the modesetting X driver. It seems the framebuffer 
doesn't get hande off, and I assume something will need to be done 
beyond the existing console remap code to make that happen. I'm not 
familiar enough with the DRM-KMS stack to know exactly what will be 
needed to get that working. I did add a helper to allow DRM drivers to 
access EDIDs from ACPI, which is useful for not only muxed designs, but 
a small number of non-hybrid and muxless hybrid systems also use an ACPI 
_DDC method to retrieve the EDID because the panel doesn't provide one 
via the usual ways.


>
> dp aux itself is exposed through debugfs, so handing out access like that
> to other parties should be fine. dp aux is also exposed through the i2c
> layer to userspace (and there's actually tools using it, for stuff like
> ddc), so if there's bugs in the locking for concurrent access, they're
> already a problem. Only thing to avoid here is a midlayer taste, but I
> think that should be doable. Unfortunately the current vga_switcheroo is
> quite a bit a midlayer, and e.g. locking rules around ->can_switch make
> that design mistake quite clear.
> -Daniel
>
>>
>>> -Daniel
>>>
>>>>>>> So I think what we should be doing here is that the DRM driver which
>>>>>>> happens to be muxed to the panel on boot performs link training and
>>>>>>> informs vga_switcheroo of the drive current, pre-emph level, etc.
>>>>>>> The other DRM driver is notified when that information is available
>>>>>>> and uses it to set up its eDP output, skipping an actual AUX CH
>>>>>>> handshake.
>>>>>>>
>>>>>>> At least i915 probes various capabilities in the DPCD without any
>>>>>>> consideration that the AUX channel may currently not be available.
>>>>>>> Back in the day I experimented with a read-only proxy mechanism
>>>>>>> to make that work, whereby the inactive DRM driver uses the active
>>>>>>> DRM driver to access the DPCD:
>>>>>>>
>>>>>>> https://patchwork.kernel.org/patch/7000591/
>>>>>>>
>>>>>>> An alternative would be to have the active DRM driver cache the
>>>>>>> required portions of the DPCD for use by the inactive DRM driver.
>>>>>>>
>>>>>>> Note that vga_switcheroo is currently controlled via debugfs.
>>>>>>> That is a historic artefact.  The kernel has since gained a
>>>>>>> mux subsystem in drivers/mux/ which could be used to represent
>>>>>>> the display mux in a standardized way in regular sysfs.
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> Lukas
>>>>>> _______________________________________________
>>>>>> dri-devel mailing list
>>>>>> dri-devel@lists.freedesktop.org
>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
