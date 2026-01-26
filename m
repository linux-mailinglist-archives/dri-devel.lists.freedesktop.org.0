Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC8lAGZCd2mMdQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:31:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815A186F3C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3D510E3FC;
	Mon, 26 Jan 2026 10:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HKmY1k3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0BF10E3F8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:30:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C58DD60007;
 Mon, 26 Jan 2026 10:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B8AC19421;
 Mon, 26 Jan 2026 10:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769423457;
 bh=y8YlnBBYdukWkLM4gI4CeIjxBlYWDFXvVo4EZdvNX/w=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=HKmY1k3MJihWWPe6EOHqv0VHZKWuHc8NR7drsAPmiVG7wW9FtIMMVtU9M6LRVaRCU
 14zoiljY30Ynrg//ohr8DUocHiyaCL4blvI1BWec0uPmjNeMK/tXlhR65kyx/2Btus
 Z89yNcyZ2scUAgBTaoB+UwloBP/mMFloIeGonn/FG0GNg87FSZAl9S29XTyOdwHWO4
 2fxJ3bWaF/64oqIU94r1y0IQ/2Lc9fYgb1u2zxgLCGdop7tMLIE/VGWQYAbG3oybNI
 +lACoMAC4W3RwH3VhRbp0+EeFk3LPoSUyqZl1xF+IhLlZb3RRZFW/Aj4ciS0DPq3oy
 mYOO2f2Y1b5Vg==
Date: Mon, 26 Jan 2026 04:30:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, schung@nuvoton.com, tzimmermann@suse.de, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com, 
 linux-arm-kernel@lists.infradead.org, maarten.lankhorst@linux.intel.com, 
 yclu4@nuvoton.com, airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 mripard@kernel.org, simona@ffwll.ch, krzk+dt@kernel.org
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260126085727.2568958-2-a0987203069@gmail.com>
References: <20260126085727.2568958-1-a0987203069@gmail.com>
 <20260126085727.2568958-2-a0987203069@gmail.com>
Message-Id: <176942345650.1493690.6680592088886642042.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU binding
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,nuvoton.com,suse.de,kernel.org,lists.infradead.org,linux.intel.com,gmail.com,lists.freedesktop.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:schung@nuvoton.com,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:maarten.lankhorst@linux.intel.com,m:yclu4@nuvoton.com,m:airlied@gmail.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:krzk+dt@kernel.org,m:a0987203069@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[2.102.81.160:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 815A186F3C
X-Rspamd-Action: no action


On Mon, 26 Jan 2026 16:57:25 +0800, Joey Lu wrote:
> Add Device Tree binding documentation for the Display Control
> Unit (DCU) found in Nuvoton MA35D1 SoCs.
> 
> The DCU is a DPI-based display controller supporting RGB output
> with optional external bridges or panels.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.example.dtb: /example-0/display@40260000: failed to match any schema with compatible: ['nuvoton,ma35d1-drm']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260126085727.2568958-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

