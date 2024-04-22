Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F68ACCC2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 14:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61307112133;
	Mon, 22 Apr 2024 12:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="L7klJsWN";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="W6VpGQiw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfout4-smtp.messagingengine.com
 (wfout4-smtp.messagingengine.com [64.147.123.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A122D112133
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:30:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.west.internal (Postfix) with ESMTP id 971321C00144;
 Mon, 22 Apr 2024 08:30:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 22 Apr 2024 08:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1713789039; x=1713875439; bh=8ugVFk+Zkc
 D//rYYfTG6/QQI1nngqkt6LSHTwxmvrd0=; b=L7klJsWNtidH6l7sSU7XBax2QE
 kssLsGQ9VOkRGD3D33MwEvbCJszjBEcdxhvvjvzd2NQ8Gkuskuv9Ykg91djjRZ/E
 Ha4PSfm6AlUoWRwlDjubByrDZ3W7jXhlI+hgwCeswy1Rg24Tttc9k74ZyhkGeXO9
 V19PeC3E/76Oh18YtdtCoyW8Q38CMsTUvKkU/oddWrEJD/ejyUvLUicLZ/mTukBg
 +xQllc490tqb/44vzn5wlZKVY85aH1+QHg/xetyjhR1BuDDGb2oYlZRLJZsNuAn8
 ZL9AY8OkefLcNHiF+GdEvON1jf7LvLj1ryVwtcn2uOpWulh56uKvVEBsbn6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1713789039; x=1713875439; bh=8ugVFk+ZkcD//rYYfTG6/QQI1nng
 qkt6LSHTwxmvrd0=; b=W6VpGQiwUHgeYJhs+GX+FE50swdWYFDJ+eNVUu4aCAQC
 gPGTkpQd0EXQEe7O/pDeBcxmDVIGvrQ8oeMw5SjrZrWyVgMm56MzSVgdbCJwa7VB
 uoU0krJfz2aKfYziqx5nuNZBUjhdJkt63sZQIg17ss5LRzyOXqYQcdldCZX9h8a6
 mDcHOpYPt6HGjaoXQ6PdXI6bhJT10isoK+yoIpxVgu22anAegQI4LKCI1zHs4ayB
 VkXn3xH3E314DkQknMEgkmSyJEYbxrrsEJc79h4mobA90ZWAXbhv1RA+RC4PKHHT
 xSF5rOhxjSV2MNCN4hFzyOnHqfyCF/ZOV3HN8RfS1g==
X-ME-Sender: <xms:blgmZiu6wzzdWf6Cw_85Jc8apalXn-VGVRG3P5gFEl3R0azkRI5EXA>
 <xme:blgmZncCM-rwzHpqmNjDUgPp8jpwwMXOINXRYVCaAc-5Vv0xsh3QhLAdApe_j4TZa
 0Vdd09z1KArycLy8A8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekledgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:blgmZtxOA_tTKIAXeCjaZ1fsn6kkBzugtKiH0FX-uTChmguCYo_ycQ>
 <xmx:blgmZtOn9ZjOUqYQMgm8syoZ1c__8uq8P7SAngoLEXU_Q2vVB82tBw>
 <xmx:blgmZi_LJ8KfUAhrxlOJRcsK6AgSHNKQs06CpsJDAJIA4C6Me56oPw>
 <xmx:blgmZlVZuP27eRUG-F9S0vRVERD9umVaIGtMk_RfYslp6aD5-g4IOQ>
 <xmx:b1gmZlZjYApXpdzk0A4sDQjQHQIPFW88OdWKezOWI2T1oW3D4M_7z0ns>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B204BB6008F; Mon, 22 Apr 2024 08:30:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <ff4f9e8f-0825-4421-adf9-e3914b108da7@app.fastmail.com>
In-Reply-To: <87il09ty4u.fsf@intel.com>
References: <cover.1713780345.git.geert+renesas@glider.be>
 <87il09ty4u.fsf@intel.com>
Date: Mon, 22 Apr 2024 14:30:18 +0200
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

On Mon, Apr 22, 2024, at 13:50, Jani Nikula wrote:
> On Mon, 22 Apr 2024, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>> 	Hi all,
>>
>> As discussed on IRC with Maxime and Arnd, this series reverts the
>> conversion of select to depends for various DRM helpers in series
>> "[PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols to
>> depends on"[1], and various fixes for it.  This conversion introduced a
>> big usability issue when configuring a kernel and enabling DRM drivers
>> that use DRM helper code: as drivers now depend on helpers, the user
>> needs to know which helpers to enable, before the driver he is
>> interested even becomes visible.  The user should not need to know that,
>> and drivers should select the helpers they need.
>>
>> Hence revert back to what we had before, where drivers selected the
>> helpers (and any of their dependencies, if they can be met) they need.
>> In general, when a symbol selects another symbol, it should just make
>> sure the dependencies of the target symbol are met, which may mean
>> adding dependencies to the source symbol.

Thanks for doing this.

Acked-by: Arnd Bergmann <arnd@arndb.de>

> I still disagree with this, because fundamentally the source symbol
> really should not have to care about the dependencies of the target
> symbol.

Sorry you missed the IRC discussion on #armlinux, we should have
included you as well since you applied the original patch.

I think the reason for this revert is a bit more nuanced than
just the usability problem. Sorry if I'm dragging this out too
much, but I want to be sure that two points come across:

1. There is a semantic problem that is mostly subjective, but
   with the naming as "helper", I generally expect it as a hidden
   symbol that gets selected by its users, while calling same module
   "feature" would be something that is user-enabled and that
   other modules depend on. Both ways are commonly used in the
   kernel and are not mistakes on their own.

2. Using "select" on user visible symbols that have dependencies
   is a common source for bugs, and this is is a problem in
   drivers/gpu/drm more than elsewhere in the kernel, as these
   drivers traditionally select entire subsystems or drivers
   (I2C, VIRTIO, INPUT, ACPI_WMI, BACKLIGHT_CLASS_DEVICE,
   POWER_SUPPLY, SND_PCM, INTERCONNECT, ...). This regularly
   leads to circular dependencies and we should fix all of them.
   The display helpers however don't have this problem because
   they do not have any dependencies outside of drivers/gpu/

        Arnd
