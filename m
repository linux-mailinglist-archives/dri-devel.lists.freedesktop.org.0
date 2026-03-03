Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M/FGIKJpmkZRAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:10:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E671EA01A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C4F10E11A;
	Tue,  3 Mar 2026 07:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NpHGIKcu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4BA10E11A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 07:10:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 58FF143437;
 Tue,  3 Mar 2026 07:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5567C116C6;
 Tue,  3 Mar 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772521854;
 bh=pBHQLMDwk1MY9/39mtqq/JiDGHIU87rGe3pEu29CWLU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NpHGIKcu+rt4IsNFB7vxOydVo4a2Zit6xSIB4dZdDP7+9aR2cwMdHaEBRkG7RycU0
 +rGDnNsbt2qHHvh7R+lxNXMwX6GufP2QZxfvyO4B6jSUNkcvDPVTDPcXoRzcJ0nDYV
 0jMJVKDTS9QyqEG2+F0JbVllCrtbZVYFMZo76pdCXL6daxKQqLAp3ttWfbV5EVlUwq
 Aki9qA16Swm5iS+TcO6MudNns36+8UcHrncNwvtLp1xhEwKoAH2XIbJGUzB6dbZ1+e
 7iJ4mmYFWU5wUSWu5ey6DWkvkqQmLKn7iKDm7KmcrG62QE9tYHwGl7yyaJr+zGj8a0
 IsEmHjuMFxCEg==
Date: Tue, 3 Mar 2026 08:10:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, 
 antonin.godard@bootlin.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 04/14] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-6UL model name
Message-ID: <20260303-rational-thundering-firefly-9dcaa9@quoll>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-5-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302190953.669325-5-hugo@hugovil.com>
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
X-Rspamd-Queue-Id: E5E671EA01A
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
	FORGED_RECIPIENTS(0.00)[m:hugo@hugovil.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:antonin.godard@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hvilleneuve@dimonoff.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,nxp.com,pengutronix.de,bootlin.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,dimonoff.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[variscite.com:url,dimonoff.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:03:40PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> There is no Variscite module named VAR-SOM-MX6UL.

VAR-SOM-MX6? And there is.
https://dev.variscite.com/var-som-mx6/

> 
> The official name from the manufacturer is VAR-SOM-6UL.
> 
> Change SOM model name to VAR-SOM-6UL to reduce confusion.

That's just one paragraph. Please write concise commit msgs so reading
them will be fast and easy.

Not a sentence.

By a sentence.

In multiple steps.

> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 5716d701292cf..99dc1b3f1ba92 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -688,7 +688,7 @@ properties:
>            - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
>            - const: fsl,imx6ul
>  
> -      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
> +      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
>          items:
>            - const: variscite,mx6ulconcerto
>            - const: variscite,var-som-imx6ul
> -- 
> 2.47.3
> 
