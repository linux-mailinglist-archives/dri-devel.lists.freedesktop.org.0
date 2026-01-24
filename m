Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP7GJFzJdGkk9wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 14:30:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E247DBAC
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 14:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F72210E333;
	Sat, 24 Jan 2026 13:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="U7YDDLXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFDA10E333
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1769261399; x=1769866199; i=wahrenst@gmx.net;
 bh=LyRTE7okq9QLOOTSDvR0cMP+/RA6BDupI57gtIpwVRA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=U7YDDLXIMpLS+1a5jV3WuUBFLdTglfHVTvNeYrvMHm0ukwXlTwJjufQ+JN1kJiqD
 9LwPf1H9VZS9YmMI0bTQxge5O2iVfjJX4rUQItkwJDKt/OuxwuagJWCVdS4f91zQS
 m2xUuXYI/pqDAhEQCDKTpnN2LYaNpk8v78iw1Re3TKKlLx3xNuA48F2dblcNBifRt
 OSq0Yq/4btqmBZIRGAvMxqpR0kPmdnQGgwddSLRpalGot/aE4iDA+JQzdnOWjRybS
 c/hAA7OmmbjzjLmRyFfQ4e2dzibWzHMzRyNTqoKqFUjlky7F1HYO2sTKhbm4bLO9D
 FcqaKrh8+v+epFjtqw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.209.202]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsnF-1vTLI81g2n-00IuJ9; Sat, 24
 Jan 2026 14:24:29 +0100
Message-ID: <a3e4972d-c9d0-4121-9a11-6c6b30b8f798@gmx.net>
Date: Sat, 24 Jan 2026 14:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: bcm: rpi: Let V3D consumers manage clock rate
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
 <20260116-v3d-power-management-v3-1-4e1874e81dd6@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260116-v3d-power-management-v3-1-4e1874e81dd6@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2CoNgnS1QXyNkjmUn48A98WCovsAz9HkyW5Ac9DY3lqHrbJrBKY
 1rp+WzDgDZcjmUpSraU8g09EExwXTIp4bCnDzkfRfn4xyXy6oswf9cEWQcVuIZGaZ8RXPPS
 PH/FnHbxI4guSe9DGWdrilpWu2jSU5s/g50gM1MxZnc+4Q/j0nQ4wQZo16VUbNgkBD2mXyn
 tBjGUa7hTx9i4Bnt9/UTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aFUmOeL17CY=;HTN7QV92VBCMk0ueqN68ciL3ljH
 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
 1mW6Zaaw=
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:mripard@kernel.org,m:mwen@igalia.com,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:popcornmix@gmail.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,baylibre.com,kernel.org,broadcom.com,gmail.com,raspberrypi.com,pengutronix.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.net];
	FORGED_SENDER(0.00)[wahrenst@gmx.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[wahrenst@gmx.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email]
X-Rspamd-Queue-Id: 28E247DBAC
X-Rspamd-Action: no action

Hi Ma=C3=ADra,

Am 16.01.26 um 21:19 schrieb Ma=C3=ADra Canal:
> Remove the `maximize` infrastructure and don't set `minimize` for the
> V3D clock, giving consumers full control over its rate.
>
> On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. To achieve meaningful power consumption
> reduction, consumers need to set the clock rate to minimum before
> disabling it. Forcing the clock to maximum rate in the clock framework
> prevents this, as consumers don't have any flexibility over the clock
> rate.
not sure, if it's worth to document this important paragraph as a=20
comment in the driver?

Best regards
> This change enables the v3d driver to control the clock rate directly
> in its suspend/resume callbacks.
>
> Fixes: 6526402b9bac ("clk: bcm: rpi: Maximize V3D clock")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ras=
pberrypi.c
> index 1a9162f0ae31e330c46f6eafdd00350599b0eede..9783385d5859836898683209=
e320fcc928dfdc71 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -68,7 +68,6 @@ struct raspberrypi_clk_variant {
>   	char		*clkdev;
>   	unsigned long	min_rate;
>   	bool		minimize;
> -	bool		maximize;
>   	u32		flags;
>   };
>  =20
> @@ -136,7 +135,6 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   	},
>   	[RPI_FIRMWARE_V3D_CLK_ID] =3D {
>   		.export =3D true,
> -		.maximize =3D true,
>   	},
>   	[RPI_FIRMWARE_PIXEL_CLK_ID] =3D {
>   		.export =3D true,
> @@ -387,9 +385,6 @@ static struct clk_hw *raspberrypi_clk_register(struc=
t raspberrypi_clk *rpi,
>   		}
>   	}
>  =20
> -	if (variant->maximize)
> -		variant->min_rate =3D max_rate;
> -
>   	if (variant->min_rate) {
>   		unsigned long rate;
>  =20
>

