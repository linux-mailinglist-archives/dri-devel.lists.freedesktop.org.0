Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOaLJ2s+i2mfRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:19:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2756911BCDA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9C510E38E;
	Tue, 10 Feb 2026 14:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GL3LryEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FD710E38E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 14:19:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 54BF4409BA;
 Tue, 10 Feb 2026 14:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27D0C16AAE;
 Tue, 10 Feb 2026 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770733158;
 bh=//7KljrC/IVY3euefeUO1Zpi7jEZ7Npdc2eJ84WefRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GL3LryEu5LmWDAMX9Q+4nK8Jv7LyWfzBW3qz2XJrc+PLTViCnXFX+PAihvwdUo/KY
 bQFAvpwrQVFr/XYHK7I9y8gqCDxEh+g9qMbnU9aG3DghisNORGMhttIyluYq6nqAMN
 hAsU5s0vGTImbJZBYV0DeAwI9h8Ls0qdsTR/Ww32e+nzMGU3ueoK2xcguOm0Amx5P9
 5zLmAUE0I8GC0zXbdF1uCaQLKleR7lloLKJ6caBMR+cvKrvDewWPnKDbeyBzf/l7Ad
 Uz6t5aiUv7BMQSuRktLoyoV6wcPJioT8ZVoHAPqAfYUXhSKyDqDTaMepVmKrBiHQTy
 MKA/yk90VP32g==
Date: Tue, 10 Feb 2026 08:19:17 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: display: tegra: document Tegra20
 HDMI port
Message-ID: <20260210141917.GA2659856-robh@kernel.org>
References: <20260210094908.14276-1-clamor95@gmail.com>
 <20260210094908.14276-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210094908.14276-2-clamor95@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2756911BCDA
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:49:07AM +0200, Svyatoslav Ryhel wrote:
> Tegra HDMI can be modeled using an OF graph. Reflect this in the bindings.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-hdmi.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
> index f77197e4869f..f33b700bf0ee 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
> @@ -82,6 +82,10 @@ properties:
>      description: phandle of a display panel
>      $ref: /schemas/types.yaml#/definitions/phandle
>  
> +  port:
> +    description: connection to controller receiving HDMI signals

Describe this in terms of this block, not what it is connected to. It 
could be an hdmi-connector node or a bridge.

> +    $ref: /schemas/graph.yaml#/properties/port
> +
>    "#sound-dai-cells":
>      const: 0
>  
> @@ -97,8 +101,13 @@ required:
>    - reset-names
>    - pll-supply
>    - vdd-supply
> -  - nvidia,ddc-i2c-bus
> -  - nvidia,hpd-gpio
> +
> +anyOf:
> +  - required:
> +    - nvidia,ddc-i2c-bus
> +    - nvidia,hpd-gpio
> +  - required:
> +    - port
>  
>  examples:
>    - |
> -- 
> 2.51.0
> 
