Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOQAI+KZhGmh3gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:23:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C1F3315
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F381010E2BD;
	Thu,  5 Feb 2026 13:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cGoGIKHs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD3F10E2BD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 13:23:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 30E6360138;
 Thu,  5 Feb 2026 13:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D8EC19423;
 Thu,  5 Feb 2026 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770297820;
 bh=TH2SzadiN4HBN+40P0xnfax3PZRUqXvZ1UIA3ramg84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cGoGIKHsnk/D0CGgFAjZ/QcgfCNSPhv89UWcQmkPt8BJw+uM4cBLluhtuAQ+P35+L
 CSNDtwyJoS4ddMBv0vmjO1Q5XZ4gZcmHd7z4TH0Oq48IKPN8lUxSXD+Gu2ZelAYuvl
 pVAAiCssvsSIhkPGc6R8OPLjNgETk0rvJl4RWOQo8YSyRwSki/+ee9uGh/mzb8hvlX
 I0r0XZ7sbgyZLqs5mlF8Frb2zL31sme0ZtN4WAW7IAxRVoRfUlhRoGMX+/f8A3IVv9
 0tIojIr+uWACLmETEagWqvUhfghUaZqvmSHWr5lwBHozLSBXhVuKjTSDWuQSpqJTpe
 ILzM0kBznjoKw==
Date: Thu, 5 Feb 2026 14:23:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 yclu4@nuvoton.com, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: nuvoton: ma35d1: add display
 controller support
Message-ID: <20260205-tactful-warm-chicken-50bdc8@quoll>
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-3-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129040532.382693-3-a0987203069@gmail.com>
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
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nuvoton.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EC5C1F3315
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 12:05:31PM +0800, Joey Lu wrote:
>  &uart0 {
> @@ -129,3 +165,23 @@ &uart16 {
>  	pinctrl-0 = <&pinctrl_uart16>;
>  	status = "okay";
>  };
> +
> +&panel {
> +	port {
> +		panel_in: endpoint@0 {
> +			remote-endpoint = <&dpi_out>;
> +		};
> +	};
> +};
> +
> +&display {

What sort of ordering rule is followed in Nuvoton? Why is it different
than DTS coding style? Why do you choose other style?

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_display>;
> +	status = "okay";
> +
> +	port {
> +		dpi_out: endpoint@0 {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> index e51b98f5bdce..7d9d077f12b2 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -379,5 +379,19 @@ uart16: serial@40880000 {
>  			clocks = <&clk UART16_GATE>;
>  			status = "disabled";
>  		};
> +
> +		panel: panel {

No, there is no way your SoC has a panel.

Don't add fake stuff to your DTS.

Best regards,
Krzysztof

