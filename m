Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F10E872DB4A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0AE10E33C;
	Tue, 13 Jun 2023 07:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAEB10E33C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3MzCW3wlfGh3ldQVH4nH8PoL57QfwCt+2dkgHQ0zeEo=;
 b=H7YxumfyYtTD4ombpLO8AcFyZG54JHJ16heiJ3onQk6BqUbaxoKC2wDRaI9wIDPlP+N4N9zLys0gV
 iUOkPmEsUUo85/mKa5vlIzvH+3k/edGJ4tDYLMvYYk8p5Qvgh0e6qUi+J9SyVIQcqA1T21KdJ4BPwA
 uzkhW9I8UiY5BXLdBrNmnaEpYQusILj2/2eieR17jpasZYx1Miuaw7GWlhKYJjy0Qq0mZe2WJPOiwK
 KggaRRVDVrNnS+a3DL8BlGfdBmZuzrogiyt9IsqY65OsOkRYyT1Zn6EwMjBKlx9Hv3TtQRyN3lKCrl
 xujnjy62I4HDBDz3W1x3TZHnrKS6wCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3MzCW3wlfGh3ldQVH4nH8PoL57QfwCt+2dkgHQ0zeEo=;
 b=3cVrnL7jSDU9iPLCYxZbe42soqmfI/umVPKsHtya9fzpsb3rwFnVrpk7xI/dLD/fHKsftoQR7p+gx
 U1tYMQsAw==
X-HalOne-ID: cf1ab6a4-09bd-11ee-9e75-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id cf1ab6a4-09bd-11ee-9e75-592bb1efe9dc;
 Tue, 13 Jun 2023 07:42:14 +0000 (UTC)
Date: Tue, 13 Jun 2023 09:42:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/bridge: ps8640: Drop the ability of ps8640 to fetch
 the EDID
Message-ID: <20230613074212.GA1322631@ravnborg.org>
References: <20230612163256.1.I7b8f60b3fbfda068f9bf452d584dc934494bfbfa@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612163256.1.I7b8f60b3fbfda068f9bf452d584dc934494bfbfa@changeid>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

On Mon, Jun 12, 2023 at 04:32:57PM -0700, Douglas Anderson wrote:
> In order to read the EDID from an eDP panel, you not only need to
> power on the bridge chip itself but also the panel. In the ps8640
> driver, this was made to work by having the bridge chip manually power
> the panel on by calling pre_enable() on everything connectorward on
> the bridge chain. This worked OK, but...
> 
> ...when trying to do the same thing on ti-sn65dsi86, feedback was that
> this wasn't a great idea. As a result, we designed the "DP AUX"
> bus. With the design we ended up with the panel driver itself was in
> charge of reading the EDID. The panel driver could power itself on and
> the bridge chip was able to power itself on because it implemented the
> DP AUX bus.
> 
> Despite the fact that we came up with a new scheme, implemented in on
> ti-sn65dsi86, and even implemented it on parade-ps8640, we still kept
> the old code around. This was because the new scheme required a DT
> change. Previously the panel was a simple "platform_device" and in DT
> at the top level. With the new design the panel needs to be listed in
> DT under the DP controller node. The old code allowed us to properly
> fetch EDIDs with ps8640 with the old DTs.
> 
> Unfortunately, the old code stopped working as of commit 102e80d1fa2c
> ("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs"). There
> are cases at bootup where connector->state->state is NULL and the
> kernel crashed at:
> * drm_atomic_bridge_chain_pre_enable
> * drm_atomic_get_old_bridge_state
> * drm_atomic_get_old_private_obj_state
> 
> A bit of digging was done to see if there was an easy fix but there
> was nothing obvious. Instead, the only device using ps8640 the "old"
> way had its DT updated so that the panel was no longer a simple
> "platform_deice". See commit c2d94f72140a ("arm64: dts: mediatek:
> mt8173-elm: Move display to ps8640 auxiliary bus") and commit
> 113b5cc06f44 ("arm64: dts: mediatek: mt8173-elm: remove panel model
> number in DT").
> 
> Let's delete the old, crashing code so nobody gets tempted to copy it
> or figure out how it works (since it doesn't).
> 
> NOTE: from a device tree "purist" point of view, we're supposed to
> keep old device trees working and this patch is technically "against
> policy". Reasons I'm still proposing it anyway:
> 1. Officially, old mt8173-elm device trees worked via the "little
>    white lie" approach. The DT would list an arbitrary/representative
>    panel that would be used for power sequencing. The mode information
>    in the panel driver would then be ignored / overridden by the EDID
>    reading code in ps8640. I don't feel too terrible breaking DTs that
>    contained the wrong "compatible" string to begin with. NOTE that
>    any old device trees that _didn't_ lie about their compatible will
>    still work because the mode information will come from the
>    hardcoded panels in panel-edp.
> 2. The only users of the old code were Chromebooks and Chromebooks
>    don't bake their DTs into the BIOS (they are bundled with the
>    kernel). Thus we don't need to worry about breaking someone using
>    an old DT with a new kernel.
> 3. The old code was crashing anyway. If someone wants to fix the old
>    code instead of deleting it then they have my blessing, but without
>    a proper fix the old code isn't useful.
> 
> I'll list this as "Fixing" the code that made the old code start
> failing. There's not lots of reason to bring this back any further
> than that.
> 
> Fixes: 102e80d1fa2c ("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thanks for fixing this!
Change looks good, and I like that it deletes stuff.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
