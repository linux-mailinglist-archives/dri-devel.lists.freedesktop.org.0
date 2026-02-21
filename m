Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEDnAzEvmmnPZQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 23:18:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6916E178
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 23:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CBF10E0BE;
	Sat, 21 Feb 2026 22:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="WVQs//KY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3A610E0BE
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 22:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=wmPg3krCGLYxqdO1s2V7OVlTQkXVv33YeZdELw95jYM=; b=WVQs//KY+NXeAo+Dvue1fb9wQc
 DIsj5/8yTFxBYQJbaM3qvfi25vwvM5BRljDrQp12BKMkC+nTc4hAWsB5UkJiSqoA0HC4WoBqOhPDr
 Wlq0QiUIkOc352X2M0Rwzoe+sTXM0lWC6J0v3wua7o56zEy/o2ay8CXS6VP8OTBdFIeVrESTUsJrI
 b8E9Vq7jmghyeELDjJh4/qjQMsnlun9/CccB75HZnVCvSzGR58GiTLx8EOrxnNjbeBMnsptJA/UMo
 gG8IMpHIBuarUK3B165gmG+FGiU1td1d12W+zqRFpJDXNfErvtsb2vgmsa3LBhWvj8zcgFINiRDuL
 SrKqTYGQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com,
	Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, alchark@gmail.com,
 andrzej.hajda@intel.com, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, airlied@gmail.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kever.yang@rock-chips.com,
 krzk+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, nicolas.frattaroli@collabora.com,
 robh@kernel.org, rfoss@kernel.org, hjc@rock-chips.com,
 sebastian.reichel@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v3 0/5] Add DisplayPort support for rk3576
Date: Sat, 21 Feb 2026 23:17:56 +0100
Message-ID: <177171224758.1745786.7493605269440201268.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260206010421.443605-1-andyshrk@163.com>
References: <20260206010421.443605-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andyshrk@163.com,m:heiko@sntech.de,m:alchark@gmail.com,m:andrzej.hajda@intel.com,m:conor+dt@kernel.org,m:cristian.ciocaltea@collabora.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:kever.yang@rock-chips.com,m:krzk+dt@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:nicolas.frattaroli@collabora.com,m:robh@kernel.org,m:rfoss@kernel.org,m:hjc@rock-chips.com,m:sebastian.reichel@collabora.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:andy.yan@rock-chips.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,163.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[sntech.de,gmail.com,intel.com,kernel.org,collabora.com,kwiboo.se,rock-chips.com,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sntech.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sntech.de:mid,sntech.de:dkim,sntech.de:email]
X-Rspamd-Queue-Id: B8D6916E178
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 09:04:10 +0800, Andy Yan wrote:
> The DisplayPort found on RK3576 is very similar to that of RK3588,
> but work in dual pixel mode and support for MST.
> 
> This patch series aims to add basic display output, not include audio
> and MST, which will be the work for the next stage.
> 
> Tested with 2 lane standard DP port and USB-C Alt mode output now.
> For those who want to give it a try, I have a reference branch here[0].
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: display: rockchip: Add rk3576 DisplayPort
      commit: 3410ab9fbd642e24f21d2fe6db6e995fa14991de
[2/5] drm/bridge: synopsys: dw-dp: Set pixel mode by platform data
      commit: 77ae37018a2705f5abe8cc428e3496651258901d
[3/5] drm/bridge: synopsys: dw-dp: Make i2s/spdif clk optional
      commit: 388bb0899bc9acdb6e4eeaad9eb9dce3427ceca4
[4/5] drm/rockchip: dw_dp: Add DisplayPort support for rk3576
      commit: 70ad4780431e3936e9cb0cf13e286d304b418f94

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
