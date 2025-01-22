Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB137A18D01
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 08:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E2610E67B;
	Wed, 22 Jan 2025 07:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="j6XT0vAn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1875 seconds by postgrey-1.36 at gabe;
 Wed, 22 Jan 2025 07:47:10 UTC
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4029410E679
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 07:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=R1uiOwZ7x7lSXU17znmNBNrn9QEYe1p5X7ManMdCUao=; b=j6XT0vAnQTydnrnDwsyIFmQLuK
 OuXPpa2NEpAwOgm71HgD0I6ozgHPCVdeFi57JgnzotSEKxWVGC5mL13XNKhIgF/2/xYDewqa40/LD
 n7JDisdc6xBVrtvs7bzEhkXL7v2ouRwvj0UO+BmB63SknHTCE0alW/qXl4ltv+U0jN4/izACm6dKL
 2cgfBsTvrFoZ8qKu33SAmP2PKbVdO1pwpDhqVciWqTWFRyfoAIqJIxz/mSC1gpT2Q7WWO2tR9BaoU
 YnnzA+DuEwft4S7evEbpM/jIpyQQRRoMxOWCRI8cS+UMoseSkY2HTNrgm1pUw9q5inEPylW6r63K6
 v6pvsfFQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <esben@geanix.com>) id 1taUxr-000725-2a;
 Wed, 22 Jan 2025 08:15:51 +0100
Received: from [87.49.44.57] (helo=localhost)
 by sslproxy07.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <esben@geanix.com>) id 1taUxr-000Av9-1F;
 Wed, 22 Jan 2025 08:15:51 +0100
From: Esben Haabendal <esben@geanix.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Subject: Re: drm/bridge: nwl-dsi: Use vsync/hsync polarity from display mode
In-Reply-To: <4658759.LvFx2qVVIh@steina-w> (Alexander Stein's message of "Mon, 
 20 Jan 2025 13:42:30 +0100")
References: <20240814-nwl-dsi-sync-polarity-v1-1-ee198e369196@geanix.com>
 <4658759.LvFx2qVVIh@steina-w>
Date: Wed, 22 Jan 2025 08:15:50 +0100
Message-ID: <878qr3uxnd.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27525/Tue Jan 21 10:37:18 2025)
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

Alexander Stein <alexander.stein@ew.tq-group.com> writes:

> Hi,
>
> I'm sorry I'm late to the party.
>
> Am Mittwoch, 14. August 2024, 12:37:26 CET schrieb Esben Haabendal:
>> Using the correct bit helps. The documentation specifies bit 0 in both
>> registers to be controlling polarity of dpi_vsync_input and
>> dpi_hsync_input polarity. Bit 1 is reserved, and should therefore not be
>> set.
>> 
>> Tested with panel that requires active high vsync and hsync.
>> 
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> I just noticed this commit causes a regression on my platform TQMa8Mx/MBa8Mx.
> DT overlay: arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso
> My bridges are configured as follow:
>> $ cat /sys/kernel/debug/dri/30320000.lcd-controller/encoder-0/bridges
>> bridge[0]: nwl_dsi_bridge_funcs [nwl_dsi]
>> 
>>         type: [0] Unknown
>>         OF: /soc@0/bus@30800000/dsi@30a00000:fsl,imx8mq-nwl-dsi
>>         ops: [0x0]
>> 
>> bridge[1]: sn65dsi83_funcs [ti_sn65dsi83]
>> 
>>         type: [0] Unknown
>>         OF: /soc@0/bus@30800000/i2c@30a40000/bridge@2d:ti,sn65dsi84
>>         ops: [0x0]
>> 
>> bridge[2]: panel_bridge_bridge_funcs
>> 
>>         type: [7] LVDS
>>         OF: /panel-lvds:tianma,tm070jvhg33
>>         ops: [0x8] modes
>
> The display needs active-low sync signals, otherwise the image is shifted
> by the amount of sync pulse.
> The patch itself looks good. But there is also nwl_dsi_bridge_atomic_check()
> unconditionally enabling DRM_MODE_FLAG_PHSYNC and DRM_MODE_FLAG_PVSYNC.

Yes, the code you mention does look quite suspicious to me.

        /* At least LCDIF + NWL needs active high sync */
        adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
        adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)

Why would we want to unconditionally enable active high sync signals in
.atomic_check()? It is perfectly valid to have active-low sync signals,
which your case perfectly proves.

Could we simply drop this, and thus require that the sync signals are
properly configured?

> Reverting the patch immediately restores the display image correctly.

And breaks it in other cases :(

We need a way to be able to select the sync signal polarity.

/Esben

>
> Best regards,
> Alexander
>> ---
>>  drivers/gpu/drm/bridge/nwl-dsi.c | 8 ++++----
>>  drivers/gpu/drm/bridge/nwl-dsi.h | 4 ++--
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>> 
>> 
>> ---
>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>> change-id: 20240814-nwl-dsi-sync-polarity-ddc58435a4c4
>> 
>> Best regards,
>> 
>> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
>> index 8d54091ec66e..5f05647a3bea 100644
>> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
>> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
>> @@ -289,13 +289,13 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
>>  
>>  	nwl_dsi_write(dsi, NWL_DSI_INTERFACE_COLOR_CODING, NWL_DSI_DPI_24_BIT);
>>  	nwl_dsi_write(dsi, NWL_DSI_PIXEL_FORMAT, color_format);
>> -	/*
>> -	 * Adjusting input polarity based on the video mode results in
>> -	 * a black screen so always pick active low:
>> -	 */
>>  	nwl_dsi_write(dsi, NWL_DSI_VSYNC_POLARITY,
>> +		      dsi->mode.flags & DRM_MODE_FLAG_PVSYNC ?
>> +		      NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH :
>>  		      NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW);
>>  	nwl_dsi_write(dsi, NWL_DSI_HSYNC_POLARITY,
>> +		      dsi->mode.flags & DRM_MODE_FLAG_PHSYNC ?
>> +		      NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH :
>>  		      NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW);
>>  
>>  	burst_mode = (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_BURST) &&
>> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.h b/drivers/gpu/drm/bridge/nwl-dsi.h
>> index a247a8a11c7c..61e7d65cb1eb 100644
>> --- a/drivers/gpu/drm/bridge/nwl-dsi.h
>> +++ b/drivers/gpu/drm/bridge/nwl-dsi.h
>> @@ -30,11 +30,11 @@
>>  #define NWL_DSI_PIXEL_FORMAT			0x20c
>>  #define NWL_DSI_VSYNC_POLARITY			0x210
>>  #define NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW	0
>> -#define NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH	BIT(1)
>> +#define NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH	BIT(0)
>>  
>>  #define NWL_DSI_HSYNC_POLARITY			0x214
>>  #define NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW	0
>> -#define NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH	BIT(1)
>> +#define NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH	BIT(0)
>>  
>>  #define NWL_DSI_VIDEO_MODE			0x218
>>  #define NWL_DSI_HFP				0x21c
>> 
