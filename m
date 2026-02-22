Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DyoMNYLm2kXrAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 14:59:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB416F470
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 14:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD3710E18A;
	Sun, 22 Feb 2026 13:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="KbH4rzM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75F810E18A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=Ff2I/wJE6bSHHw7NlocrsNF4riW7XkTVuaNjiBsfECI=; b=KbH4rzM+X2YN6NkUJdUuchwaz4
 g9/eHRabRTZwpqe/MKKTjn3qzv6zt7TKYwa9jdp3ZQmnuxBLejw39jKMnFrSVPjz5v0Ibef14sFAg
 Eo7HljYMaiY2FEGHSkG7kM79LOIR5u8YgFcKRDUg9P9aTR6C9EnPl1HxBXPy1UAdYWaLEu3/Hzil6
 +rRNBz5pEkYKn6r2nD3GfwWOU/Up41YFNjeaOA3gnG/O8wRAdXHaTc8Kxt5zg2fBFFwKXx/9A59o4
 1lbAypuUbq/YMhRvuZ8vD2LMlGJK79tVXmbkNru6aI80VHfF3iVLXAh91lwkdB5TD1EExfzRcVKFu
 30aaJ2kg==;
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org,
 Robin Murphy <robin.murphy@arm.com>
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec
 HD702E
Date: Sun, 22 Feb 2026 14:59:40 +0100
Message-ID: <24273079.6Emhk5qWAg@phil>
In-Reply-To: <2bbc2e62ae9b54ac7594355001ce2b15885d3493.1769191673.git.robin.murphy@arm.com>
References: <cover.1769191673.git.robin.murphy@arm.com>
 <2bbc2e62ae9b54ac7594355001ce2b15885d3493.1769191673.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:robin.murphy@arm.com,m:jesszhan0024@gmail.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,chromium.org,gmail.com,ravnborg.org,arm.com];
	FORGED_SENDER(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,lists.infradead.org];
	DKIM_TRACE(0.00)[sntech.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 45DB416F470
X-Rspamd-Action: no action

Am Freitag, 23. Januar 2026, 20:22:23 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Robin Murphy:
> Add an overlay to support FriendlyElec's HD702E 7" eDP LCD touchscreen
> module for the NanoPC-T4 board:
>=20
> https://www.friendlyelec.com/index.php?route=3Dproduct/product&path=3D81&=
product_id=3D230
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

[...]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso b/=
arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso
> new file mode 100644
> index 000000000000..66ac530392b7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso
> @@ -0,0 +1,96 @@
> +&edp {
> +	force-hpd;
> +	status =3D "okay";
> +
> +	aux-bus {
> +		edp-panel {

The dtbs-check was unhappy, because the auxbus binding wishes for this
node to be named "panel". I'll just change this when applying.


Heiko

> +			compatible =3D "friendlyarm,hd702e";
> +			backlight =3D <&backlight>;
> +			no-hpd;
> +			power-supply =3D <&vdd_3_3v>;
> +
> +			port {
> +				panel_in_edp: endpoint {
> +					remote-endpoint =3D <&edp_out_panel>;
> +				};
> +			};
> +		};
> +	};
> +};



