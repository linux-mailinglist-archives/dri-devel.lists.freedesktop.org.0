Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19D28AD2E4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 19:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC78D112C80;
	Mon, 22 Apr 2024 17:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVIUgDmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9FF112C80
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713805214; x=1745341214;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xAOKVOl8L9bgXPssCvU9ysQILCCCOchkHGoJuRkb7/k=;
 b=nVIUgDmMWgH/10eZ0/kkZr4/Cxgg0cB+X7YR+R2dWPEl7vnZ92LpXSL1
 +eq+Hg64a7c2w6HLp+/he31PLxkC7SnD7KJ25UDbtLl2TMAQfcBIE/EOW
 5U5NeyZYiZmsKYZZFBiK/zk997ffoRsD52KHsfI5+m1BeXMK9rZe+ns10
 i+YqtDx3REuNZI3soD+n9YGWeD8ZLyQZ+mXVVT9Z9z851qKFcDS1d4e/F
 YSmDwwbKuoIxrb89Iw+eRnn5zQq/KXyIH8JYdVHAiqPtW2BVR+Z/5eCa1
 TFjR7I8t6gh9GRZYaFy0affCZmiGJyrL1soXjhcQBC3PL8YwJVWIZfZuS Q==;
X-CSE-ConnectionGUID: +Pp4Z//dTsiWGhaPjDPyTg==
X-CSE-MsgGUID: HYQ1cza0TZ2BQ5tFSHBCag==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20502409"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="20502409"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:00:13 -0700
X-CSE-ConnectionGUID: W0R16tSASjShcIHwqgyPlg==
X-CSE-MsgGUID: OW6KzNTESxqrC5nGq+YBPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="23953716"
Received: from ralbanes-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.128])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:00:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 00/11] drm: Restore helper usability
In-Reply-To: <af6e26d1-1402-4ed2-a650-b58eae77273e@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1713780345.git.geert+renesas@glider.be>
 <87il09ty4u.fsf@intel.com>
 <ff4f9e8f-0825-4421-adf9-e3914b108da7@app.fastmail.com>
 <875xw9ttl6.fsf@intel.com>
 <af6e26d1-1402-4ed2-a650-b58eae77273e@app.fastmail.com>
Date: Mon, 22 Apr 2024 20:00:07 +0300
Message-ID: <87wmops57s.fsf@intel.com>
MIME-Version: 1.0
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

On Mon, 22 Apr 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> On Mon, Apr 22, 2024, at 15:28, Jani Nikula wrote:
>> On Mon, 22 Apr 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>> On Mon, Apr 22, 2024, at 13:50, Jani Nikula wrote:
>>>
>>>> I still disagree with this, because fundamentally the source symbol
>>>> really should not have to care about the dependencies of the target
>>>> symbol.
>>>
>>> Sorry you missed the IRC discussion on #armlinux, we should have
>>> included you as well since you applied the original patch.
>>>
>>> I think the reason for this revert is a bit more nuanced than
>>> just the usability problem. Sorry if I'm dragging this out too
>>> much, but I want to be sure that two points come across:
>>>
>>> 1. There is a semantic problem that is mostly subjective, but
>>>    with the naming as "helper", I generally expect it as a hidden
>>>    symbol that gets selected by its users, while calling same module
>>>    "feature" would be something that is user-enabled and that
>>>    other modules depend on. Both ways are commonly used in the
>>>    kernel and are not mistakes on their own.
>>
>> Fair enough. I believe for (optional) "feature" the common pattern would
>> then be depends on FEATURE || FEATURE=n.
>>
>>> 2. Using "select" on user visible symbols that have dependencies
>>>    is a common source for bugs, and this is is a problem in
>>>    drivers/gpu/drm more than elsewhere in the kernel, as these
>>>    drivers traditionally select entire subsystems or drivers
>>>    (I2C, VIRTIO, INPUT, ACPI_WMI, BACKLIGHT_CLASS_DEVICE,
>>>    POWER_SUPPLY, SND_PCM, INTERCONNECT, ...). This regularly
>>>    leads to circular dependencies and we should fix all of them.
>>
>> What annoys me is that the fixes tend to fall in two categories:
>>
>> - Play catch with selecting the dependencies of the selected
>>   symbols. "depends on" handles this recursively, while select does
>>   not.
>
> I'm not sure where this misunderstanding comes from, as you
> seem to be repeating the same incorrect assumption about
> how select works that Maxime wrote in his changelog. To clarify,
> this works exactly as one would expect:
>
> config HELPER_A
>        tristate
>
> config HELPER_B
>        tristate
>        select HELPER_A
>
> config DRIVER
>        tristate "Turn on the driver and the helpers it uses"
>        select HELPER_B # this recursively selects HELPER_A
>
> Whereas this one is broken:
>
> config FEATURE_A
>        tristate "user visible if I2C is enabled"
>        depends on I2C
>
> config HELPER_B
>        tristate # hidden
>        select FEATURE_A
>
> config DRIVER
>        tristate "This driver is broken if I2C is disabled"
>        select HELPER_B

This case is really what I was referring to, although I was sloppy with
words there. I understand that select does work recursively for selects.

>>   There is no end to this, it just goes on and on, as the
>>   dependencies of the selected symbols change over time. Often the
>>   selects require unintuitive if patterns that are about the
>>   implementation details of the symbol being selected.
>
> Agreed, that is the problem I frequently face with drivers/gpu/drm,
> and most of the time it can only be solved by rewriting the whole
> system to not select user-visible symbol at all.
>
> Using 'depends on' by itself is unfortunately not enough to
> avoid /all/ the problems. See e.g. today's failure
>
> config DRM_DISPLAY_HELPER
>        tristate "DRM Display Helpers"
>        default y
>
> config DRM_DISPLAY_DP_HELPER
>        bool "DRM DisplayPort Helpers"
>        depends on DRM_DISPLAY_HELPER
>
> config DRM_PANEL_LG_SW43408
>        tristate "LG SW43408 panel"
>        depends on DRM_DISPLAY_DP_HELPER
>
> This version is still broken for DRM_DISPLAY_HELPER=m,
> DRM_DISPLAY_DP_HELPER=m, DRM_PANEL_LG_SW43408=y because
> the dependency on the bool symbol is not enough to
> ensure that DRM_DISPLAY_HELPER is also built-in, so you
> still need explicit dependencies on both
> DRM_DISPLAY_HELPER and DRM_DISPLAY_DP_HELPER in the users.
>
> This can be solved by making DRM_DISPLAY_DP_HELPER a
> tristate symbol and adjusting the #ifdef checks and
> Makefile logic accordingly, which is exactly what you'd
> need to do to make it work with 'select' as well.

So bool is kind of problematic for depends on and select even when it's
not really used for describing builtin vs. no, but rather yes vs. no?

>> - Brush the invalid configs under the rug by using IS_REACHABLE(),
>>   switching from a loud link time failure to a silent runtime
>>   failure. (I regularly reject patches adding IS_REACHABLE() to i915,
>>   because from my pov e.g. i915=y backlight=m is an invalid
>>   configuration that the user shouldn't have to debug at runtime. But I
>>   can't express that in kconfig while everyone selects backlight.)
>
> Thanks a lot for rejecting the IS_REACHABLE() patches, it is
> indeed the worst way to handle those (I know, as I introduced
> IS_REACHABLE() only to replace open-coded versions of the same,
> not to have it as a feature or to use it in new code).
>
>> If you have other ideas how these should be fixed, I'm all ears.
>>
>>>    The display helpers however don't have this problem because
>>>    they do not have any dependencies outside of drivers/gpu/
>>
>> Fair enough, though I think they still suffer from some of them having
>> dependencies. (Wasn't this how the original patches and the debate all
>> got started?)
>
> I believe that Maxime said on IRC that he only did the patches
> originally because he expected problems with them based on his
> understanding on how Kconfig works. I'm not aware of any
> particular problem here.
>
> Let me know if you see a problem with any of the symbols that
> Geert has proposed for reverting, and I'll try to find a solution.

I think there will still be some things that select and some other
things that depends on DRM_DISPLAY_HELPER, for example. Usually that's a
recipe for kconfig failures down the line. (Is it ever a good idea?)

For example, after this series, we'll (again) have:

config DRM_DISPLAY_DP_AUX_CEC
	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
	depends on DRM && DRM_DISPLAY_HELPER
	select DRM_DISPLAY_DP_HELPER
	select CEC_CORE

Should we now also drop the help from DRM_DISPLAY_HELPER, and select it
everywhere, including here, and in DRM_DISPLAY_HDCP_HELPER and
DRM_DISPLAY_HDMI_HELPER?

> In my randconfig test environment, I have several patches that
> I sent in the past to clean up the ACPI_VIDEO, I2C, BACKLIGHT and
> LED dependencies to stop using 'select' as I could not otherwise
> get nouveau, i915 and xe to build reliably, but that means I
> may be missing some of the other problems.

Yeah, these seem to be the really problematic ones. I admit I may have
been misguided in insisting the same approach to the helpers that should
be used here; at least the helpers should be easier to fix without
selecting the target symbol dependencies in the source symbols.

BR,
Jani.


-- 
Jani Nikula, Intel
