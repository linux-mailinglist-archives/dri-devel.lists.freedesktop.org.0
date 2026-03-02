Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPujMK/qpWlLHwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 20:53:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488EA1DEFA6
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 20:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BC010E5B2;
	Mon,  2 Mar 2026 19:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="fgjwneqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FD610E5B2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 19:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=7zjPjCKQJoi6jurmXp6AwDyOS1X/gpBHDLrt2aPQjbI=; b=fgjwneqSWDTw3bZTiE3SmFLXqB
 mMMv4iti+59YdBzAA2GN/OcHm58KcPUFlYc6VTCOX5E9YZDPtkGanZr9FtN6//xTx4/xEn8s2zapE
 QpiN5IHUNeHX8kCYj+CCB+qELwkKwwAFAfRvHjFSv0uGtx42Eqv+OjS9oA5wEHRVfpf7T0byGz3hn
 Uagexl4u+aSwHZLEFNLzQd55UixnznvP8Kgsf8J0APRWaPDFwOViWq56YYUbVw9Lbo8RXSYYxyKxn
 mjpvaxkdwdIv2jOvhR3jydvoeePONF3oVP9lo6BxmnN/LTXRTbhoOU7DKOlsL2U/LFNpO11vKE/9B
 PT5XLWiQ==;
Date: Mon, 2 Mar 2026 20:52:44 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: aaro.koskinen@iki.fi, airlied@gmail.com, conor+dt@kernel.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, khilman@baylibre.com,
 krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 jesszhan0024@gmail.com, rfoss@kernel.org, robh@kernel.org,
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com,
 tony@atomide.com, tzimmermann@suse.de, andrzej.hajda@intel.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v8 8/8] ARM: dts: ti: omap: samsung-espresso10: Add
 initial support for Galaxy Tab 2 10.1
Message-ID: <20260302205244.111fa4d5@kemnade.info>
In-Reply-To: <20260223134941.427-9-bavishimithil@gmail.com>
References: <20260223134941.427-1-bavishimithil@gmail.com>
 <20260223134941.427-9-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 488EA1DEFA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kemnade.info:s=20220719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[kemnade.info : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bavishimithil@gmail.com,m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andreas@kemnade.info,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[iki.fi,gmail.com,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kemnade.info:-];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.11:email,0.0.0.20:email];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.607];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 08:49:40 -0500
Mithil Bavishi <bavishimithil@gmail.com> wrote:

> Create a device tree for the 10 inch variants (P5100, P5110, P5113)
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  arch/arm/boot/dts/ti/omap/Makefile            |   1 +
>  .../dts/ti/omap/omap4-samsung-espresso10.dts  | 104 ++++++++++++++++++
>  2 files changed, 105 insertions(+)
>  create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
> 
> diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
> index d24f13efd..140ac39b3 100644
> --- a/arch/arm/boot/dts/ti/omap/Makefile
> +++ b/arch/arm/boot/dts/ti/omap/Makefile
> @@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
>  	omap4-var-dvk-om44.dtb \
>  	omap4-var-stk-om44.dtb \
>  	omap4-samsung-espresso7.dtb \
> +	omap4-samsung-espresso10.dtb \
>  	omap4-xyboard-mz609.dtb \
>  	omap4-xyboard-mz617.dtb
>  dtb-$(CONFIG_SOC_AM33XX) += \
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
> new file mode 100644
> index 000000000..5c00d67ac
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
> @@ -0,0 +1,104 @@
[...]

> +&i2c3 {
> +	touchscreen@20 {
> +		compatible = "syna,rmi4-i2c";
> +		reg = <0x20>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touch_pins>;
> +
> +		//avdd-supply = <&reg_touch_ldo_en>;
> +		vdd-supply = <&ldo6>;
> +
> +		syna,reset-delay-ms = <200>;
> +		syna,startup-delay-ms = <200>;
> +
> +		touchscreen-size-x = <1280>;
> +		touchscreen-size-y = <800>;
> +
duplicated,

> +		rmi4-f01@1 {
> +			reg = <0x01>;
> +			syna,nosleep-mode = <1>;
> +		};
> +
> +		rmi4-f11@11 {
> +			reg = <0x11>;
> +			touchscreen-size-x = <1280>;
> +			touchscreen-size-y = <800>;
it is needed and accepted only here.


Regards,
Andreas
