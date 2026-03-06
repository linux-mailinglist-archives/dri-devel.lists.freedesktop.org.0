Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCpvO5mJqmlDTQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:00:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B6821CC06
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7B910E3A2;
	Fri,  6 Mar 2026 08:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aGLxPXBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D272010E3A2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 08:00:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5EBD140700;
 Fri,  6 Mar 2026 08:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA98CC4CEF7;
 Fri,  6 Mar 2026 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772784021;
 bh=iD/VzlwDTwkJdaLubLGKVtxVDTiATyldptYt3Eq4+W4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aGLxPXBEPp4RLYM+7FzuxdhtMJt2EG85Qr6Y7+8IOyLDCQ5sdzHvaxmcZMw4zeUHq
 O/rMnUHNJxeACFOaI7z6W5N0C6QjPjpuMt1qK03C8NVzvn1xqisygTzEP+mO/Lggm5
 XQryoRPXV5Byzv8ON+wizR5s9ENCmsYLiWClAmL2BA/84MKyPPdo4Wlgive7/2pNMU
 DQMbN+EL+vy2HKkGb8J2fdNaaR+qBCz5cEGfZMQ5ydBQeCYfq+m7e8ONO8636bYqd4
 rk8fCVoteI0IPeDkQJOXw6Z74wVIWgpsroBs9lVXCAYgDk7cTd0Nl2KAFRuhBrOmON
 bN87DPyCATJOQ==
Date: Fri, 6 Mar 2026 09:00:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, 
 antonin.godard@bootlin.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-MX6UL references
Message-ID: <20260306-observant-banana-wapiti-90adef@quoll>
References: <20260305180651.1827087-1-hugo@hugovil.com>
 <20260305180651.1827087-5-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305180651.1827087-5-hugo@hugovil.com>
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
X-Rspamd-Queue-Id: 68B6821CC06
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
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:hugo@hugovil.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:antonin.godard@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hvilleneuve@dimonoff.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,nxp.com,pengutronix.de,bootlin.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,dimonoff.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dimonoff.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 01:06:19PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> There is no Variscite module named VAR-SOM-MX6UL, but there is VAR-SOM-MX6

And binding does not speak about VAR-SOM-MX6UL, so I find your commit
msg extra confusing. It took me way too much time to decipher why you
are doing this and this should be just simple correction of name to
match the product expressed by compatible.

BTW, the DTSI also has wrong name.

> and also VAR-SOM-6UL, so it is confusing at first to know to which one it
> refers to. The imx6ul-var-som* dts/dtsi supports only the VAR-SOM-6UL [1],
> not VAR-SOM-MX6 [2], so modify comments and model descriptions accordingly.
> 
> Link  https://dev.variscite.com/var-som-6ul [1]
> Link: https://dev.variscite.com/var-som-mx6 [2]
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

