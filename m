Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5BAA444DF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEACF10E144;
	Tue, 25 Feb 2025 15:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="afa7Jbbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071A510E144
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 15:46:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C7004429D;
 Tue, 25 Feb 2025 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740498417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bzDPxLUdNty4pQsCfli/sP1l1GeyUx5l4lgbIIDK4uw=;
 b=afa7Jbbswbg/tCX2EW8J6PC1gR9lNc/MhWqDQCWiD6NLycYXj6zqzvp97z276yIgcliyg0
 rMZrTIodBz4LfKWeKpyI2uDdxbagx3zejy/DVXCABkLxH40Z94dGTSiod7cZYH3QfrxQ8U
 GeoKeT4IUlNKgsrBZ88MyIaI7PnyOKCHqKSPNexDGhxzVtGMtfziI26WPBQh/lx2smtUQr
 6HAfD1BfBWjBBNOdg7BsuTRs4yqnJlFijj0M+2oR+Cz+iauz6SbBv4YuMjr35cvT/qIGFa
 vgoZoWATskUkoKoCqqFABhDRExDcOxh0B00RH0ehsD8TS1D7kfL4QEoppSTtBA==
Message-ID: <e98d2da9-139a-48a6-841b-8ef8f94aa7df@bootlin.com>
Date: Tue, 25 Feb 2025 16:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 00/16] drm/vkms: ConfigFS interface
To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, jose.exposito89@gmail.com,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
 <Z0DC8nd1ZFN4A82-@louis-chauvet-laptop>
 <20241126-overjoyed-knowing-cuttlefish-c8d0f6@houat>
 <Z2GqEOiVkdgB3IXy@louis-chauvet-laptop>
 <20250219-versatile-smilodon-of-felicity-cbcc4d@houat>
 <Z7XZYVs6LL1gEzIF@phenom.ffwll.local>
 <4e0d66f7-6234-4265-bfbb-a919224ecb2a@bootlin.com>
 <Z7b5OcewxCEsDGo9@phenom.ffwll.local>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <Z7b5OcewxCEsDGo9@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgheehgeevudekvdetfeeifeelveeffffhieevtefhueelheettdeuhfeugfeuueenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoughrihhgohhsihhquhgvihhrrghmvghlohesghhmrghilhdrtghomhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlr
 dgtohhmpdhrtghpthhtohepmhgrihhrrggtrghnrghlsehrihhsvghuphdrnhgvthdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 20/02/2025 à 10:43, Simona Vetter a écrit :
> On Wed, Feb 19, 2025 at 05:28:37PM +0100, Louis Chauvet wrote:
>> Le 19/02/2025 à 14:15, Simona Vetter a écrit :
>>> On Wed, Feb 19, 2025 at 10:28:56AM +0100, Maxime Ripard wrote:
>>>> On Tue, Dec 17, 2024 at 05:42:56PM +0100, Louis Chauvet wrote:
>>>>> Hi,
>>>>>
>>>>>>> Hi all,
>>>>>>>
>>>>>>> I am also currently working on MST emulation for VKMS. If someone can read
>>>>>>> what I already did and at tell me if my implementation seems on the right
>>>>>>> track it could be nice.
>>>>>>>
>>>>>>> The current status is not very advanced: I can emulate a mst HUB, but not
>>>>>>> a screen. I am currently working on properly emulating the HUB by using an
>>>>>>> other hub.
>>>>>>>
>>>>>>> You can find the branch for this work here:
>>>>>>> https://gitlab.freedesktop.org/louischauvet/kernel/-/tree/b4/vkms-mst
>>>
>>> Can't look at this because it's private.
>>
>> Hi Maxime, Sima,
>>
>> Normally, those should work:
>>

[1]:https://gitlab.freedesktop.org/louischauvet/kernel/-/tree/vkms-mst[1]:https://github.com/Fomys/linux/tree/vkms-mst

>>
>> I just re-tested, this is broken, probably because I never had the time to
>> properly finish my last idea: simplifying vkms_connector by creating
>> vkms_mst_emulator_root. With the rest of the code (i.e.
>> vkms_mst_hub/display_emulator + vkms_connector), I was able to make this
>> config working:
>>
>> HUB1 -> HUB2 -> DISPLAY1
>>       |       -> DISPLAY2
>>       -> DISPLAY3
>>
>> (working == it was listed properly by modetest + did not report any issue
>> when using a connector with modetest -s)
>>
>> Few things to note: no ConfigFS support, no eBPF support, poorly tested
>> (there are probably multithread/recursion issues)
>>
>> I had to stop working on it because I don't have anymore time, I plan to at
>> least rebase + send an RFC once the VKMS+ConfigFS work is done.

I fixed it, so now [1] contains a working mst emulation with dp-aux 
emulation. It is far from perfect and probably have many flaws, but it 
works.

The last commit creates the following configuration:

host 0->0 hub1 1->0 display1
                2->0 hub2 1->0 display2
                          2-> Not Connected
                3-> NC
                4-> NC

>>
>>>>>> I think this is exactly the kind of things where we'll want eBPF I
>>>>>> think. There's no way you'll be able to model each possible test
>>>>>> scenarios for MST through configfs, even more so with a stable
>>>>>> interface.
>>>>>
>>>>> I just spent some time to think about it. I agree that eBPF seems
>>>>> applicable: we want to allows userspace to emulate any MST device, and we
>>>>> don't want to create huge uAPI + whole emulation in the kernel.
>>>>>
>>>>> As most of the protocol is similar accros device kind, I currently built
>>>>> my code around the struct vkms_mst_sideband_helpers to specify only the
>>>>> changed behavior (this way the "write to registers" "parse command"... is
>>>>> only done in one place). The choice of function is not definitive at all
>>>>> (it was just practical at this moment).
>>>>>
>>>>> With eBPF, I know three different way to attach programs to the kernel:
>>>>>    - Using a kprobe/attaching to a function: I can change the behavior of
>>>>>      all the device, there is no way "attach prog1 to hub" and "attach prog2
>>>>>      to screen1", it will be "attach prog1 to the function
>>>>>      `vkms_mst_emulator_handle_transfer_write`, and all the device will be
>>>>>      affected. This should be very easy to implement (maybe it already
>>>>>      works without modification?), but very limited / make userspace stuff
>>>>>      very ugly => Not ideal at all
>>>>>    - Creating a whole architecture to attach eBPF programs in vkms: VKMS
>>>>>      manage the list of attached eBPF programs, call them when it needs...
>>>>>      This is probably the "most flexible" option (in the sense "VKMS can do
>>>>>      whatever we need to fit our usecase"). This seems not trivial to
>>>>>      implement (drm complexity + MST complexity + BPF complexity in the same
>>>>>      driver seems a bad idea, espicially because VKMS don't have a lot of
>>>>>      maintainance and I don't feel confident introducing more complexity)
>>>>>      => Can work, require some work, but may bring more complexity in VKMS
>>>>>    - Using BPF struct_ops: I can "simply" create/complete a struct ops for
>>>>>      diverse mst callbacks (see the proposition bellow). I looked at some
>>>>>      example, this seems to be "easy" to do, and the work in VKMS should be
>>>>>      limited.
>>>>>      => Can work, a bit less flexible than the previous solution, but avoid
>>>>>      a lot of complexity
>>>>>
>>>>> I don't know if I will be able to finish the implementation but I imagine
>>>>> something like that may be a nice interface (may be not possible "as is"):
>>>>>
>>>>> // vkms_mst.c struct_ops that can be filled by userspace with custom
>>>>> // functions
>>>>> // Known limitation: maximum 64 functions in this table
>>>>> struct vkms_mst_ops {
>>>>> 	// Completly overide the transfer function, so the userspace can
>>>>> 	// do whatever he wants (even emulating a complex MST tree
>>>>> 	// without using stuff in vkms)
>>>>> 	handle_transfer(drm_dp_aux_msg);
>>>>>
>>>>> 	// If default transfer function is used, those are the callback
>>>>> 	// you can use (again, they will come with default
>>>>> 	// implementation)
>>>>> 	clear_payload_id_table(..);
>>>>> 	link_address(..);
>>>>> 	enum_path_ressources(..);
>>>>> 	[...]
>>>>>
>>>>> 	// Used to identify this kind of device, in my example the
>>>>> 	// userspace could register "LG_screen", "dell dock", "HP screen",
>>>>> 	// and then configure each mst device with the correct kind
>>>>> 	name = "<unique name for this device kind>",
>>>>>
>>>>> 	// If you want to use the default "hub" implementation, but only
>>>>> 	// tweak one specific behavior, you can use this
>>>>> 	base = "<name of the other structops>"
>>>>> }
>>>>>
>>>>>
>>>>> // Needed to implement eBPF struct_ops, called when userspace registers a
>>>>> // struct_ops of type vkms_mst_ops
>>>>> void register_struct_ops(new_ops...) {
>>>>> 	vkms_registered_ops.append(new_ops).
>>>>> }
>>>>>
>>>>> // In vkms_connector.c
>>>>> // Callback called by drm core to do transfer on the connector
>>>>> void vkms_mst_transfer(aux, msg) {
>>>>> 	mst_emulator = get_mst_emulator(aux);
>>>>>
>>>>> 	ops = vkms_registered_ops.search_for(mst_emulator.name);
>>>>> 	ops->handle_transfer(msg);
>>>>> }
>>>>>
>>>>> // mst_ebpf.c In the BPF program, userspace side
>>>>> void handle_transfer(...) {
>>>>> 	[...]
>>>>> }
>>>>> struct vkms_mst_ops {
>>>>> 	handle_transfer = handle_transfer;
>>>>> 	name = "lg-screen";
>>>>> 	base = "default-screen"
>>>>> }
>>>>
>>>> I don't think MST is the right abstraction there. We should have MST
>>>> related helper functions available to eBPF programs, but we should load
>>>> them at the connector level, ie, implement a full blown connector
>>>> atomic_check for example. It's more flexible and will allow to implement
>>>> other use-cases people have been interested in (like panels).
>>>
>>> So since I can't look at the code I'll just drop my thoughts here.
>>>
>>> - I think validating the MST helpers implementation should be done with
>>>     kunit tests. So these are out of scope for vkms testing I think
>>>     entirely.
>>
>> Yes, I agree with this, and it joins your last comment: the full dp-aux
>> emulation does not belong only to VKMS. I had this idea only because my
>> solution only use the normal core MST implementation (no special handling in
>> VKMS, just pure dp-aux emulation), so technically you could also stress-test
>> drm core with it.
>>
>>> - Next up are the driver implementations. There we might want to be able
>>>     to inject fake mst devices to stress-test driver corner cases. But I
>>>     don't think that's a job for vkms either.
>>
>> I agree, VKMS is not here to test other drivers.
>>
>>> - Now for vkms itself, I think the interesting case here is being able to
>>>     test compositors against funny mst corner-cases, but for that we don't
>>>     really need an mst operation at all. So no dp-aux or anything like that,
>>>     we just hotplug-create connectors with names and PATH property and MST
>>>     type, without any of the kernel-internal presentations for hubs/branch
>>>     points and all that stuff. Because userspace doesn't ever see that.
>>
>> I knew that user space don't really see the MST information (apart from
>> PATH), but I did not think about this solution. This may work well to test
>> user space, I agree!
>>
>> I think we are on the good track with José, he is trying to implement
>> connector hot-creation through ConfigFS [1]. To add "MST emulation", we can
>> "simply" add the PATH property through ConfigFS.
> 
> Yeah, I think that's the way to go. Well maybe with a change to always
> include the PATH property, because currently that's true for all
> hotpluggable connectors. And we probably want to keep that if we extend it
> to hotpluggable bridges or similar.
> 
>> [1]: Few discussions here
>> https://lore.kernel.org/all/Z5zJ1rEZyBEgd7DN@louis-chauvet-laptop/
> 
> Agreeing with you, connector hotplug is something we need to tackle as an
> extension of the basic configfs support, since it's quite complex.
> 
>>> - Next up is expressing all the funny constraints that can result in,
>>>     across different drivers. For that I think we want ebpf to implement the
>>>     various atomic_check hooks, so that you can implement all the funny
>>>     constraints of mst link bw limitations, but also host-side display
>>>     limitations. And I concur with Maxime that this ebpf support should be
>>>     entirely agnostic and just allow you to attach atomic_check
>>>     implementations to connectors, planes and crtcs. And then maybe one for
>>>     the overall commit, so that global constraints are easier to implement.
>>
>> If I understand correctly, this has nothing to do with VKMS + MST?
>> I don't clearly understand the use case: why do we want the user space to
>> express hardware limitations? If you have already discussed this on the
>> mailing list, can you share the discussion?
> 
> Not sure this was discussed in-depth, but when you get into more complex
> output configurations, there's all kinds of funny hw constraints that pop
> up. Examples:
> - Multiple mst outputs on the same physical port share the overall
>    bandwidth. So individually you might be able to light up each connector
>    at max resolution, but if you try to light up all of them, there's a
>    limitation. This is the mst specific case.
> - There's also lots of display hw constraints, like a limited amount of
>    clocks (fewer than crtc), or memory bw constraints for scanout, and
>    similar things.
> 
> The idea is to express these constraints with ebpf programs, so that you
> can validate that a compositor correctly handles these cases and doesn't
> try an invalide configuration and then just fails instead of trying to
> fall back to something that works.
> 
> So it's a much bigger issue, but multi-connector mst is a fairly important
> case here.

I think I understood. I don't think I will have the time to work on this 
issue, but it is clearly a good idea. I submitted [2] to add it on the 
TODO list.

[2]:https://lore.kernel.org/all/20250225-vkms-update-todo-v1-1-afb1e6f7d714@bootlin.com/ 
(not yet on lore)

Thanks,
Louis Chauvet


> Cheers, Sima
> 
>>> So summary: MST testing in vkms only needs to look like MST to userspace.
>>> Internally we'll just hand-roll the entire connector hotplug and leave out
>>> everything else. Because testing driver dp mst implementations and the
>>> helpers is better covered through different means.
>>>
>>> Eventually we might want to implement fake i2c and dp-aux implementations
>>> for additional features like TV remote control and fun stuff like that (I
>>> forgot the CEA/HDMI name for these). But I think that's waaaayyyyyy down
>>> the road.
>>
>> I think I am not that far from a full dp-aux emulation, it is precisely what
>> I tried to do in VKMS. I don't have the time to transform it to kunit tests.
>>
>> Thanks a lot for your feedback!
>> Louis Chauvet
>>
>>> Cheers, Sima
>>
>> -- 
>> Louis Chauvet, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

