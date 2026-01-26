Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNRoMjD/dmnzaAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 06:44:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B381B84345
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 06:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED4210E02C;
	Mon, 26 Jan 2026 05:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="VJjllPb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155115.qiye.163.com (mail-m155115.qiye.163.com
 [101.71.155.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FEE10E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 05:44:08 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 31ed5cbf8;
 Mon, 26 Jan 2026 11:22:06 +0800 (GMT+08:00)
Message-ID: <e1b172bd-443f-40a5-9d9e-9e575b0b551e@rock-chips.com>
Date: Mon, 26 Jan 2026 11:22:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/9] Add Type-C DP support for RK3399 EVB IND board
To: Hugh Cole-Baker <sigmaris@gmail.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20260119073100.143-1-kernel@airkyi.com>
 <c9dd365b-ad8f-410e-96f8-f914f03634b2@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <c9dd365b-ad8f-410e-96f8-f914f03634b2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bf852ab9103abkunm5b6bca956138b8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR4eTVZNSU4aHhgaSR9OQktWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=VJjllPb6UrdOVvskGBEx5XXVF18/enOJ6dktrusjWEltCBQ2HBc40/45+3muptxFTNRsh5zWw83F/nrsw+EUOzPjFV7cp1ky0Z9ohtxvTtYRy1/DzherP7nIjaITF7eNsDSUzzlqDuN3e0AVdcnZhQslauskZ8mzWFvL6L2x/eY=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=pb2Tq6er4BO41TvKoQ35Jkzeqoj8YX2rwjW5soWNUEk=;
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sigmaris@gmail.com,m:kernel@airkyi.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:hzpeterchen@gmail.com,m:luca.ceresoli@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:heiko@sntech.de,m:hjc@rock-chips.com,m:andy.yan@rock-chips.com,m:yubing.zhang@rock-chips.com,m:frank.wang@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:amitsd@google.com,m:dsimic@manjaro.org,m:jbx6244@gmail.com,m:didi.debian@cknow.org,m:pbrobinson@gmail.com,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lis
 ts.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[chaoyi.chen@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[chaoyi.chen@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[airkyi.com,linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B381B84345
X-Rspamd-Action: no action

Hello,

On 1/26/2026 3:42 AM, Hugh Cole-Baker wrote:
> On 19/01/2026 07:30, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> This series focuses on adding Type-C DP support for USBDP PHY and DP
>> driver. The USBDP PHY and DP will perceive the changes in cable status
>> based on the USB PD and Type-C state machines provided by TCPM. Before
>> this, the USBDP PHY and DP controller of RK3399 sensed cable state
>> changes through extcon, and devices such as the RK3399 Gru-Chromebook
>> rely on them. This series should not break them.
>>
>> ====
>> 1. DisplayPort HPD status notify
>>
>> Before v7, I implemented a variety of DP HPD status notify. However,
>> they all had various problems and it was difficult to become a generic
>> solution.
>>
>> Under the guidance of Heikki and Dmitry, a decoupled notification
>> method between the TypeC and DRM subsystems was introduced in v7.
>> First, a notification is sent when TypeC registers a new altmode.
>> Then, a generic DP AUX HPD bridge is implemented on the DRM side.
>>
>> During v7-v10, we added a new notifier in typec to notify the altmode
>> device register event. With the help of Greg and Heikki, we implemented
>> the reuse of notifiers for the type bus itself in patch1 of v11.
>>
>> The USB subsystem related parts have already been merged into the
>> usb-next branch in v13 [0][1]. Therefore, this series no longer includes
>> these patches starting from v14. Thanks to Greg and Heikki!
>>
>> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=67ab45426215c7fdccb65aecd4cac15bbe4dfcbb
>> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=4dee13db29de6dd869af9b3827e1ff569644e838
>>
>> That makes it redundant for each Type-C controller driver to implement
>> a similar DP AUX HPD bridge in embedded scenarios.
>>
>> ====
>> 2. Altmode switching and orientation switching for USBDP PHY
>>
>> For USB Type-C interfaces, an external Type-C controller chip assists
>> by detecting cable attachment, determining plug orientation, and
>> reporting USB PD message. The USB/DP combo PHY supports software
>> configurable pin mapping and DisplayPort lane assignment. Based on
>> these message, the combo PHY can perform both altmode switching and
>> orientation switching via software.
>>
>> The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
>> fusb302 chip as Type-C controller. The connection diagram is shown below:
>>
>> fusb302 chip +---> USB2.0 PHY ----> DWC3 USB controller
>>              |
>>              +---> USB/DP PHY0 +--> CDN-DP controller
>>                                |
>>                                +--> DWC3 USB controller
>>
>> ====
>> 3. Multiple bridge model for RK3399 CDN-DP
>>
>> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
>> the CDN-DP can be switched to output to one of the PHYs.
>>
>> USB/DP PHY0 ---+
>>                | <----> CDN-DP controller
>> USB/DP PHY1 ---+
>>
>> In previous versions, if both PHY ports were connected to DP,
>> the CDN-DP driver would select the first PHY port for output.
>>
>> On Dmitry's suggestion, we introduced a multi-bridge model to support
>> flexible selection of the output PHY port. For each PHY port, a
>> separate encoder and bridge are registered.
>>
>> The change is based on the DRM AUX HPD bridge, rather than the
>> extcon approach. This requires the DT to correctly describe the
>> connections between the first bridge in bridge chain and DP
>> controller. And Once the first bridge is obtained, we can get the
>> last bridge corresponding to the USB-C connector, and then set the
>> DRM connector's fwnode to the corresponding one to enable HPD
>> notification.
> 
> With a similar dts patch [1] on top of this series I tested a type-C to
> DP adapter/cable for display output on the ROCKPro64 board, which also
> pairs a FUSB302 with RK3399. Booting it up with the cable plugged in
> works, as does hotplugging the cable after booting in both orientations.
> The correct mode for the display is detected. I wasn't able to test
> audio, only video output, as this display doesn't have speakers.
> 
> I did once, after unplugging and reconnecting the cable a few times,
> see it get into a state where it didn't detect the attached display.
> Logs from that unplug/reconnect attempt are here [2] if of interest.
> Nevertheless, hotplug seems to work the majority of the time, so
> 
> Tested-by: Hugh Cole-Baker <sigmaris@gmail.com>
> 
> [1]: https://github.com/sigmaris/linux/commit/91724088b19bee7d248946442a801423e8cd0634
> [2]: https://gist.github.com/sigmaris/fa107384a7492583ceee1c2962f5030a
>

Thank you for the test. I also have the same board, and I will
try it later :)

-- 
Best, 
Chaoyi
