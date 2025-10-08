Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9046BBC568C
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE5B10E085;
	Wed,  8 Oct 2025 14:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kntnz6+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5DC10E085
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 14:15:44 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 064C6EFE;
 Wed,  8 Oct 2025 16:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759932849;
 bh=8tRqtbODRqjaEdOTfJSsrK4OHe29vcxu7+DtAi2pak4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kntnz6+fJf8VFixy317M7XUJctcfhnvC/AFpuJKTkZc6QA2z2Z+kvb9xd8DbkN6hf
 OLD4kp4EX/SmUZRwtXLwQSyPgVcofL/5IDWZNhv25c5R6a38J/vlteHKWhes7hWzBL
 x5zdfBRQdE8Soem2TuHZY6QKsRjdJzsL8q5C0QeU=
Message-ID: <47dfe81e-08ab-4fea-85fe-8c0a1d76bb78@ideasonboard.com>
Date: Wed, 8 Oct 2025 17:15:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/29] drm: Implement state readout support
To: Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <f87700f1-ed9c-40fe-9327-efe574820139@ideasonboard.com>
 <20251008-nondescript-snobbish-rattlesnake-d486a7@houat>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251008-nondescript-snobbish-rattlesnake-d486a7@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 08/10/2025 16:57, Maxime Ripard wrote:
> Hi Tomi,
> 
> Thanks for having a look.
> 
> On Wed, Oct 08, 2025 at 04:07:57PM +0300, Tomi Valkeinen wrote:
>> On 02/09/2025 11:32, Maxime Ripard wrote:
>>> Hi,
>>>
>>> Here's a series that implement what i915 calls "fastboot", ie,
>>> initializing the initial KMS state from the hardware state at boot, to
>>> skip the first modeset if the firmware already set up the display.
>>>
>>> This series creates the infrastructure in KMS to create that state by
>>> relying on driver specific hooks. It also implements some infrastructure
>>> to check during non-blocking commits that the readout helpers work
>>> properly by reading out the state that was just committed and comparing
>>> it to what was supposed to be commited.
>>>
>>> This relies on another set of driver hooks to compare the entities
>>> states, with helpers providing the default implementation.
>>>
>>> It then implements the readout support in the TIDSS driver, and was
>>> tested with the SK-AM62 board. This board in particular is pretty
>>> interesting, since it relies on an DPI to HDMI bridge, and uses the
>>> drm_bridge_connector infrastructure.
>>>
>>> So the readout works with the current state of the art on embedded-ish
>>> platforms.
>>>
>>> The whole thing feels a bit clunky at the moment:
>>>
>>>   - The initial state buildup ties everything together in a state in the
>>>     old state pointer. It's useful for the initial readout because
>>>     accessors can then use the usual state accessors to look into the
>>>     state of other entities. But one of the argument for it was also
>>>     that for state comparison, it allows to compare the new state
>>>     (committed) to the old state (readout). It doesn't really work in
>>>     practice, since in such a case the old state contains the previous
>>>     hardware state to be freed, and thus we would end up with a memory
>>>     leak
>>>
>>>   - The framebuffer refcounting is broken.
>>>
>>>   - The tidss atomic_flush waits for the go bit on the initial
>>>     modesetting, except that if the state is readout we didn't commit
>>>     anything and the driver will wait forever, eventually resulting in
>>>     commit timeout
>>
>> Isn't atomic flush part of the modeset? Why is it called if there's no
>> modeset.
> 
> No, atomic_flush is ran when we update the planes, so it will trigger
> here on the first page flip.
> 
>>>   - The tidss_crtc_state fields are not read properly at the moment
>>>     either.
>>
>> Just because no implemented, or was there something funny with them? I
>> guess there's some reverse-mapping that needs to be done.
> 
> The bus_format field isn't read properly, I wasn't quite sure what was
> going on there.
> 
> And also, for bridges, I've yet to figure out a way to read / find the
> input/output formats.
> 
>>> The main thing works though: the state is picked up properly, doesn't
>>> trigger a modeset if what was programmed is the one the first modeset
>>> tries to pick as well, will switch properly if it isn't, etc.
>>
>> This is pretty interesting work. I haven't tested, and I'm sure it still
>> breaks in a million ways if used with anything else but the HW you're
>> using =).
> 
> Thanks :D
> 
>> This is related to the boot-splash screen work I've been working on for
>> quite a while, although at a different stage.
> 
> As far as I'm concerned, once this lands, your work isn't needed at all.

No, I'm quite sure something alike my patches are needed. Without my
patch (drm/tidss: Add some support for splash-screen):

- the driver will do a hw reset at probe time, and you lose the splash
screen
- nothing has a reference to the related clocks, so they may be turned off

>> In my patches I have been trying to avoid hw reset, so that if the DSS
>> has been set up by the bootloader, we'll just let it run until we get
>> a modeset.
> 
> We really only need to power up the hardware around
> drm_mode_config_reset.

If by "power up" you mean set things up (it's powered up already by the
bootloader), yes. I think that's somewhat similar to what I did in my
patch wrt. handling the reset, but with your series we'll skip the reset
too.

> Once we're done, either the hardware will be active or inactive, but
> we'll know for sure.

We still need to have some early code to make sure we keep the clocks
enabled until the userspace does a modeset. Or would
drm_mode_config_reset be called at probe time?

>> And now your series would potentially remove that modeset too, so, in
>> theory, we could get up to X/Weston from bootloader with just a single
>> modeset in the bootloader.
>>
>> Of course, fbdev/simpledrm will mess things up there. I had some hacks
>> for fbdev too, to retain the bootsplash image, but it was just hacking.
> 
> And it works also with fbdev, since fbdev or whatever will trigger a
> new commit we can compare to.

Sorry, meant simplefb. There's a different problem there: if the
bootloader has set up a boot splash, simpledrm will allocate a new empty
framebuffer so we get a black screen, or in case of simplefb, it can be
made to use the existing memory buffer, but if fb console is enabled, it
will clear the buffer.

So maybe there won't be a modeset-related-temporary-blanking when using
your series, but the core issue of keeping a stable logo on the screen
up until X/Weston is, afaik, unsolved (unless you disable simplefb/drm
and thus also fbconsole).

 Tomi

