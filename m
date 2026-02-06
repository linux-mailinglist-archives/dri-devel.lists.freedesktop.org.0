Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC3lDIqdhWlKEAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 08:51:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EF4FB20C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 08:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CED10E07C;
	Fri,  6 Feb 2026 07:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QVRCeEVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA1910E07C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 07:51:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1EBA660010;
 Fri,  6 Feb 2026 07:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F98DC116C6;
 Fri,  6 Feb 2026 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770364292;
 bh=xqbUcSUTpk4arpBV33lwK63+MR69RzUxztVajpd6IpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QVRCeEVX4NnXHRYQVZb6WuR31nT0YfJbSMQsc1IcIk8zKF8I/rQVkHGNZ7yMt85oH
 uaW92gF7XGyL5HjlgYujTjtl5o0vA3beeM4Tw1zXc+SFo1F2LITXUy2R33r61TxLha
 lwxdLdpD6dfpnwu1HrudaJunjOsnm6G81QxyCyAdK3ss54QFXw5TBA/KPspq/LLyom
 7cykMPEMtKp+YBVZI159knhhpF6QEW0uHe9DL/ByJNx2OnU1gOr3Tu+IRBWjgmHx3A
 Xl7S/fpVsOXwZl0MWkbOcfxyJ3+HPPjfA1a9//G7+eANpq+7+XBuuZR3ndEo24lHYU
 /zqtO/fv1OvhA==
Date: Fri, 6 Feb 2026 08:51:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, heiko@sntech.de, alchark@gmail.com, 
 andrzej.hajda@intel.com, conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
 airlied@gmail.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, 
 nicolas.frattaroli@collabora.com, robh@kernel.org, rfoss@kernel.org,
 hjc@rock-chips.com, 
 sebastian.reichel@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: rockchip: Add rk3576
 DisplayPort
Message-ID: <20260206-transparent-primitive-pig-7ea2f8@quoll>
References: <20260206010421.443605-1-andyshrk@163.com>
 <20260206010421.443605-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206010421.443605-2-andyshrk@163.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andyshrk@163.com,m:dmitry.baryshkov@oss.qualcomm.com,m:heiko@sntech.de,m:alchark@gmail.com,m:andrzej.hajda@intel.com,m:conor+dt@kernel.org,m:cristian.ciocaltea@collabora.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:kever.yang@rock-chips.com,m:krzk+dt@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:nicolas.frattaroli@collabora.com,m:robh@kernel.org,m:rfoss@kernel.org,m:hjc@rock-chips.com,m:sebastian.reichel@collabora.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:andy.yan@rock-chips.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,sntech.de,gmail.com,intel.com,kernel.org,collabora.com,kwiboo.se,rock-chips.com,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,rock-chips.com:email,qualcomm.com:email,collabora.com:email]
X-Rspamd-Queue-Id: 99EF4FB20C
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 09:04:11AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The DisplayPort found on RK3576 is very similar to that of RK3588,
> but work in dual pixel mode. And itself does not depend on the I2S
> clock or the SPDIF clock when transmit audio.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> ---
> 
> Changes in v3:
> - Fix compatible order

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

