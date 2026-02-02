Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJSiHRAAgGkn1QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 02:38:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972EAC7C74
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 02:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02E210E168;
	Mon,  2 Feb 2026 01:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="KJRnNBIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973173.qiye.163.com (mail-m1973173.qiye.163.com
 [220.197.31.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D95610E168
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 01:38:14 +0000 (UTC)
Received: from [172.16.12.43] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 32baf1fcb;
 Mon, 2 Feb 2026 09:33:02 +0800 (GMT+08:00)
Message-ID: <c7d2c401-068c-456f-a641-71d9aec9a4cd@rock-chips.com>
Date: Mon, 2 Feb 2026 09:33:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <6571983.R56niFO833@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <6571983.R56niFO833@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c1bfb576803a3kunm5c7836bd5d1df6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhpLGFYaShpPGBpIGU1OT0tWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=KJRnNBIV/6A1cPIx6R+QeecYKPdcQaVXPI9zSXurB2PQuRHbCF1u3Yw+TzPWeVSFCkEdJGtjimeudD/Z6PL00I+5Z0uRt4EpwXdIHIewgGCVt7qgU/oUuAuQEp4smDrYdLlvtySYHY3PnK5GDx13Xcrtyi0y1KhKlDrw3nk26JE=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=3vJEwBZpP35hbXCKhhIcCEaHgMGxx7jXQ1r49X/tjUs=;
 h=date:mime-version:subject:message-id:from;
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:jingoohan1@gmail.com,m:p.zabel@pengutronix.de,m:hjc@rock-chips.com,m:andy.yan@rock-chips.com,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:m.szyprowski@samsung.com,m:luca.ceresoli@bootlin.com,m:jani.nikula@intel.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,samsung.com,rock-chips.com,oss.qualcomm.com,chromium.org,bootlin.com,intel.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:email]
X-Rspamd-Queue-Id: 972EAC7C74
X-Rspamd-Action: no action

Hi Heiko,

On 1/20/2026 12:06 AM, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 17. Dezember 2025, 10:33:03 Mitteleuropäische Normalzeit schrieb Damon Ding:
>> PATCH 1 is to ensure the last bridge declares OP_EDID or OP_MODES or both.
>> PATCH 2 is a small format optimization for struct analogid_dp_device.
>> PATCH 3 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 4 is to add a new parameter to store the point of next bridge.
>> PATCH 5 is to make legacy bridge driver more universal.
>> PATCH 6-11 are preparations for apply drm_bridge_connector helper.
>> PATCH 12 is to apply the drm_bridge_connector helper.
>> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 16 is to attach the next bridge on Analogix side uniformly.
>> PATCH 17-18 are to apply the panel_bridge helper.
> 
> On top of all the recent bridge-related commits, this series still works
> on my rk3588-eDP board - when the display is plugged in on boot.
> 
> As that is the current state we also had before, this series:
> Tested-by: Heiko Stuebner <heiko@sntech.de> on rk3588
> 
> 
> ======
> !!! The following should not hold up this series though, because the
> analogix-dp not handling hotplug, is also the current state already!!!
> ======
> 
> However, actually hotplugging the device does not seem to work.
> 
> With the hpd-gpio inside a dp-connector node.
> 
> 
> (1) When booting connected and unplugging the display I get:
> 
> [   42.725888] rockchip-dp fdec0000.edp: Rx Max Link Rate is abnormal :0 !
> [   42.733325] rockchip-dp fdec0000.edp: Rx Max Lane count is abnormal :0 !
> [   42.764853] rockchip-dp fdec0000.edp: LT link start failed!
> [   42.771105] rockchip-dp fdec0000.edp: eDP link training failed (-110)
> [   42.778329] rockchip-dp fdec0000.edp: unable to do link train, ret=-110
> [   42.785747] [drm:analogix_dp_bridge_atomic_enable] *ERROR* dp commit error, ret = -110
> ( ... repeasts a bunch of times ... )
> [   43.284897] rockchip-dp fdec0000.edp: failed to set bridge, retry: 4
> [   43.292045] rockchip-dp fdec0000.edp: too many times retry set bridge, give it up
> 
> plugging the eDP back in reenables the display successfully though.
> 
> (2) Booting with the display unplugged
> 
> Same messages as above, but plugging the display in for the first time
> does not create an output.
> 
> I'll try to dig more, but if you have an idea, what I should look at, I'd,
> be really grateful.
> 

Sorry for the late reply. I've been heavily occupied with the downstream 
work recently.

I can reproduce the same issue on my RK3576 IOTEST board, which is 
equipped with a standard DP receptacle for eDP interface.

(BTW: The RK3576 Analogix DP functions properly with a set of targeted 
changes, and I plan to upstream these modifications later. :-))

Regarding the eDP HPD exception, several functional patches for HPD 
handling have not yet been synced to the upstream. I will verify these 
changes and submit them when time permits.

Best regards,
Damon

