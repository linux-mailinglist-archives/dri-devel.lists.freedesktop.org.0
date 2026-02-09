Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAUpLUggimnLHQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 18:58:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DC11351B
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 18:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AA810E443;
	Mon,  9 Feb 2026 17:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TX3H9997";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDD110E443
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 17:58:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B726840BEC;
 Mon,  9 Feb 2026 17:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642C2C16AAE;
 Mon,  9 Feb 2026 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770659906;
 bh=vxxNB6nWgY4FeC3V5k11CvbrJUV7Z/hmMTpSNLsLNYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TX3H99972Qth3fjJt7lnW+yMbsYjeoJojgZeRvCZ3IxPlw9u+b/Sn0ZG+byjFcPSi
 dOsp9XYpZKiDIeYjqmnoja08c4N+PSTVf2Aj4yhceOIFa8dp/rw7/jVP8X+fs12K+C
 vF59Dhb8oOkxuyeEBabgcYbX/vECmOnbFe33w28a+piwe5LMiAEOCN/7BZeNNVd3kI
 iBG1/uVHXUYsV8iQJe6WzTJcLFHYSNLjJ2eoyP8mYDv7hPcqu3+V9R1W4CUsElbFzD
 Q6hRPJ9WQVfk/xWGFZe+cIvSRfVQq88nJ65vr5l73m6XGpXjUgmaaV/PgVR/uxKVHH
 eQcmel4SSF71g==
Date: Mon, 9 Feb 2026 11:58:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dominik Haller <d.haller@phytec.de>
Cc: conor+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, adrien.grassein@gmail.com,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <andrzej.hajda@intel.com>, upstream@lists.phytec.de,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 jernej.skrabec@gmail.com, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, onas@kwiboo.se
Subject: Re: [PATCH 5/6] dt-bindings: display: bridge: lt8912b: Drop reset
 gpio requirement
Message-ID: <177065990345.1493489.15126893179740897544.robh@kernel.org>
References: <20260130205820.83189-1-d.haller@phytec.de>
 <20260130205820.83189-6-d.haller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130205820.83189-6-d.haller@phytec.de>
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,lists.infradead.org,gmail.com,linaro.org,kwiboo.se,intel.com,lists.phytec.de,lists.freedesktop.org,vger.kernel.org,suse.de,linux.intel.com,ffwll.ch];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:d.haller@phytec.de,m:conor+dt@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:linux-arm-kernel@lists.infradead.org,m:adrien.grassein@gmail.com,m:neil.armstrong@linaro.org,m:jonas@kwiboo.se,m:andrzej.hajda@intel.com,m:upstream@lists.phytec.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:jernej.skrabec@gmail.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:onas@kwiboo.se,m:conor@kernel.org,m:adriengrassein@gmail.com,m:krzk@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0F9DC11351B
X-Rspamd-Action: no action


On Fri, 30 Jan 2026 12:58:15 -0800, Dominik Haller wrote:
> Drop the gpio reset from the list of required properties. The bridge works
> fine with a reset not managed by Linux. In the driver itself the gpio is
> already flagged as optional.
> 
> Signed-off-by: Dominik Haller <d.haller@phytec.de>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml      | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!

