Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629BA8ACED3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 15:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA76E112B06;
	Mon, 22 Apr 2024 13:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="WRbIBn01";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="I0eKgKrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfout5-smtp.messagingengine.com
 (wfout5-smtp.messagingengine.com [64.147.123.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75650112B06
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:55:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.west.internal (Postfix) with ESMTP id 5D7F41C00146;
 Mon, 22 Apr 2024 09:55:12 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 22 Apr 2024 09:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1713794111; x=1713880511; bh=dP7QCkFa2V
 pxgbo7VoSL0Ax5/oZR8Zm98IoSxqALypA=; b=WRbIBn01+ZTKiwdI+kbkFZYLlv
 DbnR+igCrIB7pg54qU3/sgTfBzX+NzVL6avdBv6bphUJoNdjj7jOpOZpxxKERIq7
 g57eE3+jVN7sEvdXClIGbthIhtfYsoFAkawL8ABBdvlZcS1Hz3kS4yzsCDVYPOEI
 fanwNiqQKn2110G2Crq+hitaUYyhBm4ssTbX11RpWo/BHMfpjJsIneKgikBN1GF1
 bBxlHEb8Y6Kn7aGlDSY0b2iIyTVb9LHLBAsgt6SlbA7bUZV6zZ5W6v2IEERRYo0m
 W33EzoFqYC1otRExYN+GNZxQ/A1QKp+WzM5DthIRLqJARgMjEPbzxEFsE2Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1713794111; x=1713880511; bh=dP7QCkFa2Vpxgbo7VoSL0Ax5/oZR
 8Zm98IoSxqALypA=; b=I0eKgKrDC+E6gWxO9Me5fy3ATo2uFYlCdYRqCeoQwYws
 xUc9dl6JIznVsG15WXqt0I0nNvOQxQTT28LGv0jHohdbeZTIOvEY5ggcYfus7x5g
 vkYsN3cr9LyBlOcoCpTRNm3AY/cUal3W5RxWUHvsNDsUtLroudk9wQNG19f/pIJE
 Pl7ypDFzQCpjO+CNd95GC8LR0trRoUAo+SrI+R/qMmskTQdmRvP6k4UqbfwwZPwo
 9w2ig/DwiHEo+HXlCb/WP3+KRQF9i9sNcihRDBWJpX+ZQv6stxNgxkowxbZpLnBK
 +1kOpLGgZmgYV1016rjkgVhwJFoVFcRLf2Oxka0fDA==
X-ME-Sender: <xms:P2wmZiTuiP3S70d73RwJIoMICgdm4i2Ny2KzRLnUuzBApE4U8UZXrA>
 <xme:P2wmZnzZZwI5pA6NtoUHHJCPtcXjFBprwaCbQuHliF2ft4M_SU8LyXPM08-s1pKlk
 pf39IiyjQHFk77eZS4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekledgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:P2wmZv1ZTVFKUSoQkTre2JiKFEekZNnItFIGuVO3knRED9JUFc6P-w>
 <xmx:P2wmZuAK6LxqZ6Y5xdvMrYZBoPWohQBIbcZssMc0-kSlatRSZAWoRw>
 <xmx:P2wmZrilVWsz7DLaux6VO4KX5RyIaMbD3gJw3mMd8F9Mc82K9ucgkQ>
 <xmx:P2wmZqp74Xz4FQAnYl0B0SqA783ctvB8DfSQTvXDr8NYLq6VDDdwRQ>
 <xmx:P2wmZqOjldHJblvtYtnnBYvnJTLvlm4ouUbZe5jP52ax7Wfv4bfp1HnE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E1310B60092; Mon, 22 Apr 2024 09:55:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
MIME-Version: 1.0
Message-Id: <af6e26d1-1402-4ed2-a650-b58eae77273e@app.fastmail.com>
In-Reply-To: <875xw9ttl6.fsf@intel.com>
References: <cover.1713780345.git.geert+renesas@glider.be>
 <87il09ty4u.fsf@intel.com>
 <ff4f9e8f-0825-4421-adf9-e3914b108da7@app.fastmail.com>
 <875xw9ttl6.fsf@intel.com>
Date: Mon, 22 Apr 2024 15:54:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Daniel Vetter" <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 00/11] drm: Restore helper usability
Content-Type: text/plain
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

On Mon, Apr 22, 2024, at 15:28, Jani Nikula wrote:
> On Mon, 22 Apr 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
>> On Mon, Apr 22, 2024, at 13:50, Jani Nikula wrote:
>>
>>> I still disagree with this, because fundamentally the source symbol
>>> really should not have to care about the dependencies of the target
>>> symbol.
>>
>> Sorry you missed the IRC discussion on #armlinux, we should have
>> included you as well since you applied the original patch.
>>
>> I think the reason for this revert is a bit more nuanced than
>> just the usability problem. Sorry if I'm dragging this out too
>> much, but I want to be sure that two points come across:
>>
>> 1. There is a semantic problem that is mostly subjective, but
>>    with the naming as "helper", I generally expect it as a hidden
>>    symbol that gets selected by its users, while calling same module
>>    "feature" would be something that is user-enabled and that
>>    other modules depend on. Both ways are commonly used in the
>>    kernel and are not mistakes on their own.
>
> Fair enough. I believe for (optional) "feature" the common pattern would
> then be depends on FEATURE || FEATURE=n.
>
>> 2. Using "select" on user visible symbols that have dependencies
>>    is a common source for bugs, and this is is a problem in
>>    drivers/gpu/drm more than elsewhere in the kernel, as these
>>    drivers traditionally select entire subsystems or drivers
>>    (I2C, VIRTIO, INPUT, ACPI_WMI, BACKLIGHT_CLASS_DEVICE,
>>    POWER_SUPPLY, SND_PCM, INTERCONNECT, ...). This regularly
>>    leads to circular dependencies and we should fix all of them.
>
> What annoys me is that the fixes tend to fall in two categories:
>
> - Play catch with selecting the dependencies of the selected
>   symbols. "depends on" handles this recursively, while select does
>   not.

I'm not sure where this misunderstanding comes from, as you
seem to be repeating the same incorrect assumption about
how select works that Maxime wrote in his changelog. To clarify,
this works exactly as one would expect:

config HELPER_A
       tristate

config HELPER_B
       tristate
       select HELPER_A

config DRIVER
       tristate "Turn on the driver and the helpers it uses"
       select HELPER_B # this recursively selects HELPER_A

Whereas this one is broken:

config FEATURE_A
       tristate "user visible if I2C is enabled"
       depends on I2C

config HELPER_B
       tristate # hidden
       select FEATURE_A

config DRIVER
       tristate "This driver is broken if I2C is disabled"
       select HELPER_B

>   There is no end to this, it just goes on and on, as the
>   dependencies of the selected symbols change over time. Often the
>   selects require unintuitive if patterns that are about the
>   implementation details of the symbol being selected.

Agreed, that is the problem I frequently face with drivers/gpu/drm,
and most of the time it can only be solved by rewriting the whole
system to not select user-visible symbol at all.

Using 'depends on' by itself is unfortunately not enough to
avoid /all/ the problems. See e.g. today's failure

config DRM_DISPLAY_HELPER
       tristate "DRM Display Helpers"
       default y

config DRM_DISPLAY_DP_HELPER
       bool "DRM DisplayPort Helpers"
       depends on DRM_DISPLAY_HELPER

config DRM_PANEL_LG_SW43408
       tristate "LG SW43408 panel"
       depends on DRM_DISPLAY_DP_HELPER

This version is still broken for DRM_DISPLAY_HELPER=m,
DRM_DISPLAY_DP_HELPER=m, DRM_PANEL_LG_SW43408=y because
the dependency on the bool symbol is not enough to
ensure that DRM_DISPLAY_HELPER is also built-in, so you
still need explicit dependencies on both
DRM_DISPLAY_HELPER and DRM_DISPLAY_DP_HELPER in the users.

This can be solved by making DRM_DISPLAY_DP_HELPER a
tristate symbol and adjusting the #ifdef checks and
Makefile logic accordingly, which is exactly what you'd
need to do to make it work with 'select' as well.

> - Brush the invalid configs under the rug by using IS_REACHABLE(),
>   switching from a loud link time failure to a silent runtime
>   failure. (I regularly reject patches adding IS_REACHABLE() to i915,
>   because from my pov e.g. i915=y backlight=m is an invalid
>   configuration that the user shouldn't have to debug at runtime. But I
>   can't express that in kconfig while everyone selects backlight.)

Thanks a lot for rejecting the IS_REACHABLE() patches, it is
indeed the worst way to handle those (I know, as I introduced
IS_REACHABLE() only to replace open-coded versions of the same,
not to have it as a feature or to use it in new code).

> If you have other ideas how these should be fixed, I'm all ears.
>
>>    The display helpers however don't have this problem because
>>    they do not have any dependencies outside of drivers/gpu/
>
> Fair enough, though I think they still suffer from some of them having
> dependencies. (Wasn't this how the original patches and the debate all
> got started?)

I believe that Maxime said on IRC that he only did the patches
originally because he expected problems with them based on his
understanding on how Kconfig works. I'm not aware of any
particular problem here.

Let me know if you see a problem with any of the symbols that
Geert has proposed for reverting, and I'll try to find a solution.
In my randconfig test environment, I have several patches that
I sent in the past to clean up the ACPI_VIDEO, I2C, BACKLIGHT and
LED dependencies to stop using 'select' as I could not otherwise
get nouveau, i915 and xe to build reliably, but that means I
may be missing some of the other problems.

     Arnd
