Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF4347203
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 08:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DB289E1B;
	Wed, 24 Mar 2021 07:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E7D6E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 02:49:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 19B4C15C4;
 Tue, 23 Mar 2021 22:48:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 23 Mar 2021 22:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=S
 9hVFXlHxFynIOxrNrduoTNoyxZE1kHVtXmwywd0EOI=; b=YZflfkGOYNjYarMU4
 y+I3z1HYVbAPNVsrpmn1tlLj+rNQBYt3TZJpMFQ4jD01E0y4aYB1QpZQJMSKeSlO
 GCmU5gQ4N89X/ZZ/ovNeLAlxRoTa1/0K6FG1PhB+1FR+WIF7/DYdIRp5xXz1S55l
 gYOutV5tYzUecDCfkMFoid3XKLhMYz3n7jfApGV/fPaD3rIOCODOgXEKIcvWS6hk
 yqHM/LRZb1ssrAajEvvTXE/h+c6vAi+eK8ixg+uihsGE07Cr8geX5tXNh/WOh6OK
 lbHVQePdBSibzrIUhF0GnO+ulRUlZI4zFkfyhlBp2E5Cxe57QGrkpLPIQjta/y80
 VuA/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=S9hVFXlHxFynIOxrNrduoTNoyxZE1kHVtXmwywd0E
 OI=; b=N0ILWQj+oOVBkHETy0CDV/HFnn81ylEhsA5Jb/1XqMlcKjUUBdybTkNq2
 T7t+YKib2XYRigswWzmnoxsZKjJyPWdzvu9QjbP9WoP6aTVe5yN6pD/nfG5XUPId
 tMXOrqK0XPJn2DMxHSi+kgVHfJIAikn4NQdR1cmrzEAvbCveoh05VL1WLSRt23C7
 5Jh7l5OW8coe2sXARkg1n0xj9F2f5LPQ2sI6ZzSssI+GYfyCwmjE194d7A/mKcK7
 aKWZAF5FW7+tzv1WHHRi746mDQwJ4Ayr9bGziBWek2Su70e8INsIxFe5CV5Fqilu
 xIPoGbIn+Tt/5ccrT0MMx1+Ujp2eg==
X-ME-Sender: <xms:lqhaYGM8Plc9p5POMUi41FWfUW2XcWk10-QVyYeB0gptzOa2QqwldQ>
 <xme:lqhaYE_E-tyo9a0uubro-MZc0TRmDTbHM5R7o9BBQY-3fNk4_gh25xeZ4o5A27QrB
 SJzkkStqt0IKAk7PA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegjedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepvddttdejieduudfgffevteekffegffeguddtgfefkeduvedukeff
 hedtfeevuedvnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
 nhgurdhorhhg
X-ME-Proxy: <xmx:lqhaYNTnWNVVznNNa40VTPKEZbBLa52HWaU_Riqtq2XJbnAACHc-WQ>
 <xmx:lqhaYGuZdosSi3-hmGnAtvmEI-7HAglUvDtrCQI0U1hikhjMlRUueA>
 <xmx:lqhaYOc4PWSTUrzH3-gKp_MwNzhMoR2a4Q-933NakVU_EFj6mb-2bg>
 <xmx:mKhaYEsAapfB8RbPhUabbpBXT4PCwlwubnwwpJ9oVUcAUVhqnIiqKw>
Received: from [70.135.148.151]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 36C7824033F;
 Tue, 23 Mar 2021 22:48:54 -0400 (EDT)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20210322140152.101709-1-jagan@amarulasolutions.com>
 <20210322140152.101709-2-jagan@amarulasolutions.com>
 <YFpxYpA+EIZm7sOf@pendragon.ideasonboard.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 1/4] drm: sun4i: dsi: Use drm_of_find_panel_or_bridge
Message-ID: <f47bc0ad-dbd6-05b5-aaec-2e3256e3715a@sholland.org>
Date: Tue, 23 Mar 2021 21:48:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <YFpxYpA+EIZm7sOf@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 24 Mar 2021 07:06:07 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/23/21 5:53 PM, Laurent Pinchart wrote:
> Hi Jagan,
> 
> Thank you for the patch.
> 
> On Mon, Mar 22, 2021 at 07:31:49PM +0530, Jagan Teki wrote:
>> Replace of_drm_find_panel with drm_of_find_panel_or_bridge
>> for finding panel, this indeed help to find the bridge if
>> bridge support added.
>>
>> Added NULL in bridge argument, same will replace with bridge
>> parameter once bridge supported.
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> 
> Looks good, there should be no functional change.

Actually this breaks all existing users of this driver, see below.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> ---
>> Changes for v4, v3:
>> - none
>>
>>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>> index 4f5efcace68e..2e9e7b2d4145 100644
>> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>> @@ -21,6 +21,7 @@
>>  
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_mipi_dsi.h>
>> +#include <drm/drm_of.h>
>>  #include <drm/drm_panel.h>
>>  #include <drm/drm_print.h>
>>  #include <drm/drm_probe_helper.h>
>> @@ -963,10 +964,14 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
>>  			    struct mipi_dsi_device *device)
>>  {
>>  	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
>> -	struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);

This is using the OF node of the DSI device, which is a direct child of
the DSI host's OF node. There is no OF graph involved.

>> +	struct drm_panel *panel;
>> +	int ret;
>> +
>> +	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 0, 0,
>> +					  &panel, NULL);

However, this function expects to find the panel using OF graph. This
does not work with existing device trees (PinePhone, PineTab) which do
not use OF graph to connect the panel. And it cannot work, because the
DSI host's binding specifies a single port: the input port from the
display engine.

Regards,
Samuel

>> +	if (ret)
>> +		return ret;
>>  
>> -	if (IS_ERR(panel))
>> -		return PTR_ERR(panel);
>>  	if (!dsi->drm || !dsi->drm->registered)
>>  		return -EPROBE_DEFER;
>>  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
