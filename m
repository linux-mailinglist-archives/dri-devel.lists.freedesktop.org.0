Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHSjFg7YgWlYKgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 12:12:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A2BD819B
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 12:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8839D10E31F;
	Tue,  3 Feb 2026 11:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DPoX7rqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8AF10E31F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 11:12:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 88BF4C211DD;
 Tue,  3 Feb 2026 11:12:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4351F60728;
 Tue,  3 Feb 2026 11:12:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49DDD119A8888; Tue,  3 Feb 2026 12:11:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770117125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=szFGRLlVCEwZRRovS/jad1iKZfVKQX8FqT/CwFCFTuw=;
 b=DPoX7rqxJKZUDYyaRDR7/S+6t9BTtJqy8WOm0KmHCdu7fbDoA48IJeL5CmMiKa5CyLOhPX
 1m04Tm1xnpB+4RqSBdn7YL51+pYU3mHNquNAHCkDuVG/s86TDceDYJ9NzVKwqMLOP+ckgr
 l5IyZPCe6xDcieA1XnO/XkU+hCgZUUoC71wA9QWyEwKGBoUn6jkxFv+oPWNTwgiVXpO+3X
 zROF2ReXs0saPeDrmiua4EgvrIFBe8Jc+tbqSIiRARGUc+JofQISJrkPs/wocHLOBMIBdh
 sPveengo3QMRO55rX/CBQjMu9HRt0XLeznsH2BnuNRYnSdvxUSFDSepExnD74A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 12:11:53 +0100
Message-Id: <DG5A5BNULPQX.HRWTJLN9UQ2W@bootlin.com>
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 "Damon Ding" <damon.ding@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <andy.yan@rock-chips.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <jani.nikula@intel.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <6571983.R56niFO833@diego>
In-Reply-To: <6571983.R56niFO833@diego>
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:damon.ding@rock-chips.com,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:jingoohan1@gmail.com,m:p.zabel@pengutronix.de,m:hjc@rock-chips.com,m:andy.yan@rock-chips.com,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:m.szyprowski@samsung.com,m:jani.nikula@intel.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,samsung.com,rock-chips.com,oss.qualcomm.com,chromium.org,intel.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A2A2BD819B
X-Rspamd-Action: no action

Hello Heiko, Damon,

On Mon Jan 19, 2026 at 5:06 PM CET, Heiko St=C3=BCbner wrote:
> Hi Damon,
>
> Am Mittwoch, 17. Dezember 2025, 10:33:03 Mitteleurop=C3=A4ische Normalzei=
t schrieb Damon Ding:
>> PATCH 1 is to ensure the last bridge declares OP_EDID or OP_MODES or bot=
h.
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

I'm appplying patches 1-3 and got a checkpatch warning for each patch:

  WARNING: Unexpected content after email: 'Heiko Stuebner <heiko@sntech.de=
> on rk3588', should be: 'Heiko Stuebner <heiko@sntech.de> (on rk3588)'

I'm fixing it while applying those 3 patches.

Damon, can you fix that for the remaining patches before sending a new
iteration?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
