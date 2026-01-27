Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGYfEwjWeGmNtQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:13:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C729966C0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4859910E06A;
	Tue, 27 Jan 2026 15:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ohP/Ycbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C49D10E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 15:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YKT+iclIkSdV8c83ayGvWA3kBucltRdTlZe/rREsEHU=; b=ohP/YcbhZlaXjUOdIKusH5/749
 BUSEOC+y9mXd9+qYms4ENrSUy33ONfAxB1JM+bRRDYpCFrQuF15e6FbcgjPOZHHDmev4FLDdi5C+b
 C+zV02RVLkK8T8CnNom7bLyUn+VFE/CxhzO1eIxPgkNE/vOG6pbhcdbrjIU3Sa1P9B0AV4X02dwBt
 7XrMskavy3jhcrolfvOSpGFOtJTlZrFGwpwJ00XsbZC6n3go8LhIuoclGaB1nKzH2tTXPycyY1Ed8
 X+dlACmr8lNv+E7+eZynuvI0brbbJhOP62X+KexrTEt6wIBnJmrm3wBsiOi9h3pR+E1lccR0SzcB6
 lMblik8A==;
Received: from [189.89.57.42] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vkkk9-00AW7o-Gv; Tue, 27 Jan 2026 16:12:37 +0100
Message-ID: <53fce710-8b0f-490a-b48d-9c5a17802533@igalia.com>
Date: Tue, 27 Jan 2026 12:12:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Power Management for Raspberry Pi V3D GPU
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:wahrenst@gmx.net,m:mripard@kernel.org,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:popcornmix@gmail.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,baylibre.com,kernel.org,broadcom.com,gmx.net,gmail.com,raspberrypi.com,pengutronix.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9C729966C0
X-Rspamd-Action: no action



On 26/01/2026 14:26, Maíra Canal wrote:
> This series introduces Runtime Power Management (PM) support for the
> Raspberry Pi V3D GPU.
>
> Currently, the V3D clock remains enabled for the entire system uptime,
> even when the GPU is idle. With the introduction of Runtime PM, the
> clock can now be disabled during idle periods. For example, with this
> series applied on a Raspberry Pi 5, if we check `vcgencmd measure_clock
> v3d`, we get:
>
> (idle)
>
> $ vcgencmd measure_clock v3d
> frequency(0)=0
>
> (running glmark2)
>
> $ vcgencmd measure_clock v3d
> frequency(0)=960016128
>
> One particular change was required in v3 to ensure a meaningful
> reduction in idle power consumption: the V3D clock rate must be
> explicitly set to the minimum rate during suspend. As explained in an
> inline comment, this is needed as some firmware versions may not fully
> power off the clock when its state is set to off. This issue can be
> mitigated by setting the clock rate to 0 during suspend. For this same
> reason, PATCH 1/6 has been added in v3.
>
> Apart from that, the v3d patches are mostly identical to v2, but rebased
> on top of drm-misc-next.
>
> To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
> backporting this series to rpi-6.18.y [1].
>
> [1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-6.18

The whole series is:

Reviewed-by: Melissa Wen <mwen@igalia.com>

>
> Best regards,
> - Maíra
>
> ---
> v1 -> v2: https://lore.kernel.org/r/20250728-v3d-power-management-v1-0-780f922b1048@igalia.com
>
> - [1/5] NEW PATCH: "clk: bcm: rpi: Add missing logs if firmware fails" (Stefan Wahren)
> - [2/5] Remove the "Fixes:" tag (Stefan Wahren)
> - [2/5] dev_err_ratelimited() instead of dev_err() (Stefan Wahren)
> - [2/5] Instead of logging the clock ID, use clk_hw_get_name(hw) to log the name (Stefan Wahren)
> - [2/5] Add a newline character at the end of the log message (Stefan Wahren)
> - [2/5] Use CLK_IS_CRITICAL for all clocks that can't be disabled (Maxime Ripard)
> - [3/5] NEW PATCH: "clk: bcm: rpi: Maximize V3D clock"
> - [4/5] Use devm_reset_control_get_optional_exclusive() (Philipp Zabel)
> - [4/5] Make sure that resource are cleaned in the inverse order of allocation (Philipp Zabel)
>
> v2 -> v3: https://lore.kernel.org/r/20250731-v3d-power-management-v2-0-032d56b01964@igalia.com
>
> - Rebased on top of drm-misc-next
> - Patches "[PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware
>    fails", "[PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
>    preparing/unpreparing", and "[PATCH v2 3/5] clk: bcm: rpi: Maximize
>    V3D clock" were applied to clk-next.
> - [1/4] NEW PATCH: "clk: bcm: rpi: Let V3D consumers manage clock rate"
> - [2/4] NEW PATCH: "clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED"
> - [3/4] Added Philipp's R-b (Philipp Zabel)
> - [4/4] s/drm_err/DRM_ERROR
> - [4/4] Set the clock rate to 0 during suspend and to the maximum rate
>    during resume
>
> v3 -> v4: https://lore.kernel.org/r/20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com
>
> - Rebased on top of drm-misc-next
> - [1/6, 3/6] Add Melissa's A-b (Melissa Wen)
> - [2/6] NEW PATCH: "clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE
>    behavior" (Stefan Wahren)
> - [4/6] NEW PATCH: "drm/v3d: Use devm_reset_control_get_optional_exclusive()" (Melissa Wen)
> - [5/6] Include more context to the commit message (Melissa Wen)
> - [5/6, 6/6] Instead of creating the function v3d_gem_allocate(), use v3d_gem_init()
>    and move HW initialization out of it (Melissa Wen)
>
> ---
> Maíra Canal (6):
>        clk: bcm: rpi: Let V3D consumers manage clock rate
>        clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE behavior
>        clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED
>        drm/v3d: Use devm_reset_control_get_optional_exclusive()
>        drm/v3d: Allocate all resources before enabling the clock
>        drm/v3d: Introduce Runtime Power Management
>
>   drivers/clk/bcm/clk-raspberrypi.c |  15 ++--
>   drivers/gpu/drm/v3d/Makefile      |   3 +-
>   drivers/gpu/drm/v3d/v3d_debugfs.c |  23 +++++-
>   drivers/gpu/drm/v3d/v3d_drv.c     | 163 ++++++++++++++++++--------------------
>   drivers/gpu/drm/v3d/v3d_drv.h     |  21 +++++
>   drivers/gpu/drm/v3d/v3d_gem.c     |  25 +++---
>   drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
>   drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
>   drivers/gpu/drm/v3d/v3d_power.c   |  96 ++++++++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
>   10 files changed, 273 insertions(+), 119 deletions(-)
> ---
> base-commit: 68e28facbc8ab3e701e1814323d397a75b400865
> change-id: 20250728-v3d-power-management-eebb2024dc96
>

