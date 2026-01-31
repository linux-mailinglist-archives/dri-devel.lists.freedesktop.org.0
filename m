Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM5JDpQGfmmVUwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 14:41:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02BAC2098
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 14:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191AB10E1E6;
	Sat, 31 Jan 2026 13:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="D2WoB0kD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3E510E1E6
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 13:41:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8B2A21A2B62;
 Sat, 31 Jan 2026 13:41:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5EE19606B6;
 Sat, 31 Jan 2026 13:41:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 96957119A8886; Sat, 31 Jan 2026 14:41:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769866893; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Lj8iwZ6EUO8gYZYfyUyDFt5AjJ1lvkxeyXDxTyIEnE0=;
 b=D2WoB0kD19f7FC8uabxA5frVmDRNS7fqqgky8NzIkrsRnfwiWTLuEskJEDLKYMlKhKTDJH
 aUO617aeS3F3x8/HEEuRdaqk3A9Gk/y6xfOwYgrNPMncoCNzyyVtODzg8lz/QuvRmmUI0z
 juqEkpIPMZEdJU6TUjdvrcUoC5DXje2HwUF8lNGYuSAkdkAa+VJPfWGu/yCcrFiY5wb+hx
 QSfUvUEXEHMg1JjW3cLE8zZ1YJKXa7rzZOAPjmHsZog70rizcJ5y99rMrtxlMVi9pgZRKj
 JuOYUBzsaJtcNkpHCLNcFE0tBazaKR54lEIs5ZlfC6dYnc1bqmNtzKXN6kWzzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 14:41:21 +0100
Message-Id: <DG2TG4NCMKXQ.36REPVMTQ7WWD@bootlin.com>
Subject: Re: [PATCH v8 04/18] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.next_bridge
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-5-damon.ding@rock-chips.com>
 <DFCCU8AN0GZQ.2CYTKKV40JYLI@bootlin.com>
 <187b2c32-5a10-4555-8d49-cf1ee86a8eaa@rock-chips.com>
 <f644a5ab-5dd1-4f4e-b2e9-3585dec81a96@rock-chips.com>
In-Reply-To: <f644a5ab-5dd1-4f4e-b2e9-3585dec81a96@rock-chips.com>
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
	FORGED_RECIPIENTS(0.00)[m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:jingoohan1@gmail.com,m:p.zabel@pengutronix.de,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:m.szyprowski@samsung.com,m:jani.nikula@intel.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:damon.ding@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,samsung.com,rock-chips.com,sntech.de,oss.qualcomm.com,chromium.org,intel.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:mid,qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,rock-chips.com:email]
X-Rspamd-Queue-Id: A02BAC2098
X-Rspamd-Action: no action

On Wed Jan 7, 2026 at 3:36 AM CET, Damon Ding wrote:
> Hi Luca,
>
> On 1/4/2026 10:51 AM, Damon Ding wrote:
>> Hi Luca,
>>
>> On 12/31/2025 7:11 PM, Luca Ceresoli wrote:
>>> Hello Damon,
>>>
>>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>>> In order to move the panel/bridge parsing and attachmenet to the
>>>> Analogix side, add component struct drm_bridge *next_bridge to
>>>> platform data struct analogix_dp_plat_data.
>>>>
>>>> The movement makes sense because the panel/bridge should logically
>>>> be positioned behind the Analogix bridge in the display pipeline.
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v4:
>>>> - Rename the &analogix_dp_plat_data.bridge to
>>>> =C2=A0=C2=A0 &analogix_dp_plat_data.next_bridge
>>>> ---
>>>> =C2=A0 include/drm/bridge/analogix_dp.h | 1 +
>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/
>>>> analogix_dp.h
>>>> index cf17646c1310..582357c20640 100644
>>>> --- a/include/drm/bridge/analogix_dp.h
>>>> +++ b/include/drm/bridge/analogix_dp.h
>>>> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum
>>>> analogix_dp_devtype type)
>>>> =C2=A0 struct analogix_dp_plat_data {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum analogix_dp_devtype dev_type;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_panel *panel;
>>>> +=C2=A0=C2=A0=C2=A0 struct drm_bridge *next_bridge;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_encoder *encoder;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector *connector;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool skip_connector;
>>>
>>> It took a while to understand why you are adding the next_bridge
>>> pointer in
>>> struct analogix_dp_plat_data instead of struct analogix_dp_device,
>>> where it
>>> would be more natural. I found an answer in patch 16: with current
>>> code you
>>> need to place next_bridge in struct analogix_dp_plat_data because it is
>>> used by user drivers to attach, and those drivers have no access to
>>> struct
>>> analogix_dp_device. However patch 16 (which looks a very good cleanup
>>> BTW)
>>> next_bridge can be moved to struct analogix_dp_device.
>>>
>>> So I'd suggest to move patch 16 before this one if it easily doable, so
>>> that you can introduce next_bridge in struct analogix_dp_device from th=
e
>>> beginning. Should that be impossible, you can send a separate patch to
>>> move
>>> next_bridge, after patch 16.
>>>
>>>
>>
>> Thanks for your nice suggestion! After patch 16, bridge attachment is
>> unified to the Analogix side, which acts as a common bridge driver for
>> both the Rockchip and Exynos sides, so moving next_bridge there makes
>> perfect sense. I will add a separate patch to move next_bridge in v9.
>>
>>
>
> My apologies for reversing the plan to move next_bridge to the Analogix
> side in v9 -- I only considered the Rockchip side before.
>
> When I tried modifying the code based on your suggestion, I found it
> better to keep &analogix_plat_data.next_bridge as is. This is because
> the Exynos side needs to maintain compatibility with the legacy method
> of parsing panels and bridges, so the next bridge isn't always parsed by
> the common Analogix side driver.
>
> This patch series has been pending for ages, and I'm even a bit fuzzy on
> the details myself. ;-)

OK, makes sense.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
