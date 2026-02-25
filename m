Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNAOGNnXnmkTXgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:07:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4C31963FE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B6110E010;
	Wed, 25 Feb 2026 11:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fMN5sQ7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A14610E737
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:07:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3622841942;
 Wed, 25 Feb 2026 11:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C11FC116D0;
 Wed, 25 Feb 2026 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772017620;
 bh=/vE7uvuaCXSs7YmOxiPnT+lQCznNjU9pP7qljs6QuPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fMN5sQ7yP4uqqJVZf/sKJtP9eCukvfMRWRCAcmEQPku8ckfbYtaqNVVMQJ0pGikIy
 6i+bEZErCpHVyCWFe9yqpkHt2dRFD0c0PccUGIJuprBTGlQ55cGMQJjs5QtDYl/7+E
 pxs51vKFJDxhSE4lnC4xMQnCmRClQqPSYt0lmQz1SgoLymgtGVhq8wcY+Inv97KQod
 oxXfhSd8I5PfZFH7qsqiX29NCUyXwXsOn3T66dU7GGvtmudg9ZL6fKzYnFTsjZPXJ2
 QdUisfY+zuMSYPn0YEsovwQc8mbvC49ZA6ExEW9no1MjBwas2NvsE689Xvfp2rjWxn
 4lW1bKFhczwLQ==
Date: Wed, 25 Feb 2026 12:06:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonios Christidis <a-christidis@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: gpu: img: Add J721e SoC specific
 compatible
Message-ID: <20260225-malamute-of-perpetual-typhoon-2f0f65@quoll>
References: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
 <20260224-gpu_dts-v1-2-cc5ddffe140c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224-gpu_dts-v1-2-cc5ddffe140c@ti.com>
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
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:a-christidis@ti.com,m:nm@ti.com,m:vigneshr@ti.com,m:kristo@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:ssantosh@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,imgtec.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,baylibre.com,lists.infradead.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:email]
X-Rspamd-Queue-Id: DD4C31963FE
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:09:16PM -0600, Antonios Christidis wrote:
> Add J721e SoC specific compatible.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a1f54dbae3f3..56249d1e65aa 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -44,7 +44,11 @@ properties:
>                - ti,j721s2-gpu
>            - const: img,img-bxs-4-64
>            - const: img,img-rogue
> -
> +      - items:
> +          - enum:
> +              - ti,j721e-gpu
> +          - const: img,img-ge8430
> +          - const: img,img-rogue
>        # This legacy combination of compatible strings was introduced early on
>        # before the more specific GPU identifiers were used.
>        - items:
> @@ -103,6 +107,7 @@ allOf:
>                - ti,am62-gpu
>                - ti,am62p-gpu
>                - ti,j721s2-gpu
> +              - ti,j721e-gpu

What about img,img-ge8430? Why this one does not have constraints?

What about all other constraints?

>      then:
>        properties:
>          clocks:

Best regards,
Krzysztof

