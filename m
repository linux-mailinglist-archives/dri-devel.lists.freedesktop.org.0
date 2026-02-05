Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF72KqGWhGk43gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:09:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D47F300B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CE210E0D0;
	Thu,  5 Feb 2026 13:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J8wOaubt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1595F10E0D0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 13:09:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AE73644341;
 Thu,  5 Feb 2026 13:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A592C16AAE;
 Thu,  5 Feb 2026 13:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770296988;
 bh=veMJKaZ6Rc2cigcfOwDAZy09/u0wn043GkOQjCV8XzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8wOaubtN529HHkDll7yTtGvTEbxFS3qGpAMAPXAC4QyOzHMd2c1I3nDJ6jfq/Un4
 mjLCDqVmPOnCUc3r9NKJrozrpuGGcqrk1c62iC+WW3DikLPGyzw6zN4TcrhfIadU9Y
 w0vworH0mmEkVFLoOXy1vN7rnAHHPQLbZ2Cyf01L4eMcp5YNXEeahAsjtnsJWW16+4
 zP6VDwro0XZMq/AlaHF5QQ2RIQiUDlBO52gFDIBh01gWnZw36KxEGFiSM8+F0bxN+b
 VcrRJ4tdZ9HeHjOs3TzQ5e/IoZX2voNodqQC2BsYVDhXq7Cx5eRTYRbbNuKBDykd5H
 dsLOH6N6/n8dQ==
Date: Thu, 5 Feb 2026 14:09:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611
 DSI Port B
Message-ID: <20260205-calm-aboriginal-mastiff-b07eb3@quoll>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rosh@debian.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org,debian.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:email,0.0.0.1:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 30D47F300B
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 07:15:47PM +0800, Hongyang Zhao wrote:
> The LT9611 HDMI bridge on RubikPi3 has DSI physically connected to
> Port B. Update the devicetree to use port@1 which corresponds to
> Port B input on the LT9611.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>

Where did this happen?

https://lore.kernel.org/all/?q=f%3Arosh%40debian.org

And again, v1 was completely different so how pre-v1-internal-review
could be applied to this v2?

Honestly, initial guidance is useful but continuous development behind
the closed doors is not.

Best regards,
Krzysztof

