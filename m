Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PlOAQcBpml5IwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:28:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E91E2F00
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487DF10E5D4;
	Mon,  2 Mar 2026 21:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lTKm/VFX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013001.outbound.protection.outlook.com
 [40.107.162.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE80F10E5D2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 21:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9nbMNNGwA9Qai5f09pXPD/H5P9j5p4HS19Esw08gt644pRv2lnd9MTDh6zukwfPATApYRI68Btr9cVzTVSqT1O5JJza5q1TSoqo/G73M264aIwPhwgUJvGysLbKuBDykD4Hd89Uqg835MzE7srl1KqGi9zM8K1006r5rKOPLjzNH20t/NtMretS/CkwA1ci6CG1JILJEU+o2bfPMmEtGUplwPDSy5UNb+MIUlIumWoBfwZFfEMMmeAA5UVs4W9IvKRZbaA9q7XTlXK9vBqgvclpJyvcbiUlhb6rcEShO07bNrDgF3UeLul0VHWPZg+pIpRZoxtQjubzCXKRkyeY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uEM8fRInI8UhhsiflJOa7KC9zuI2tjL84hGCh9/0Os=;
 b=LBiBuu1hRjQhOqdBm7cBlygHms6+Zp6PR3ySHrEWRFirRvjSmR/3CQieeloprGa/tCzoOIGOUbg6oVKIl0qzzw98ZIvQGHNJdOAbt5MfOMpXNHXHxqHJakGA/ahXOaEA0OnqfQ4YE2RXZCkARDjanmN7clfDo62INpIWSVKHFkjXty2pZyUKANEOU/2Wqk55MEyo7EK4kQwbEK8jiJeQM0YwXgWq3Zw/I0j5ozlb7HmPvHXnxrimOSIwEJSFYfsFnpxjPG7KGlzWeG3dMp9/Qlcy6H+ZKWBb5zAtZEUaM8Su9a+vbIzIb0hlqFHaPlGl42DTnUf18PZgxXMJzaBDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uEM8fRInI8UhhsiflJOa7KC9zuI2tjL84hGCh9/0Os=;
 b=lTKm/VFXKbIHOhTfiSIVRdKEoy+D1NJLjKTCZj1BrFruFy3FE5Mq85soYVer/HVISFPm2NCsBQceJKRFvp17973Qk6T8cHJyMsUxMi4d9tD4e0hpospL+TwP9qbMVhLaZ/5umqYqCiZcQytmtYDtbbs2vlWVnfRq3Kd9O+P5yuG+oW9eEJFihfdkgi3tDRBJgDiRimKVFay46E71F8tltPDKrjmR1UZIUM9yhs+/GePJplRY5e7FGZRslRZG9JW6fuNZasa+L4Y+vjxCzoWn9NBoP2Us+xorSh6TC2LuJBQPiaipYrQFbNsJ0SlhfTx/+IECzXI4fIyTSlqahe79ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9353.eurprd04.prod.outlook.com (2603:10a6:10:36d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 21:28:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 21:28:29 +0000
Date: Mon, 2 Mar 2026 16:28:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com,
 antonin.godard@bootlin.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 07/14] ARM: dts: imx6ul-var-som-concerto: Factor out
 common parts for all CPU variants
Message-ID: <aaYA8YjxugSHW6TF@lizhi-Precision-Tower-5810>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-8-hugo@hugovil.com>
 <aaX4DYzfR2HifTtf@lizhi-Precision-Tower-5810>
 <20260302160731.0b6dd8fc1709a91236289fea@hugovil.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302160731.0b6dd8fc1709a91236289fea@hugovil.com>
X-ClientProxiedBy: SJ0PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:a03:331::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: a707f13e-2aea-4104-eb89-08de78a2a569
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|7416014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: ud6/hK1UzyCBlvpOGG4QlsZPfBDYFuLk5S7946KA2xSHsCDS/+3+Jt8Xcz2IvspLcUjRP32kcUurVPBKclmr/Pa1NF1ScHsSK0eNVHhKb7p/bdZ0E54gDkBHXdDlPxHO19LhwoMQituon0hhn9zeNw5v2+NqAtM6D6QBuh32J9L18qNYbmqNBbIEK5lvihmGxWKUsAtI8qKCEBrmx67SbSNK7V8Ar5npzC5ZvbiHfOjrRuo0EL3zCYoTa37UcI8zBFIJpbKUzeAhm0Cn7+p3al1LLiimssVyLux4HizSomHz9Gz9D+WzWN/p2ndPfc9vbP4t3zvPaalTCKqehqXmV8E2B0LZcUJ+ufcXrpFm0SLc9MwNWWaqSrtVZwFGb6HZTS5tlQFx9h95u5fI2/W0Y6wAW931/X1Kefjti6KJSW++ncGmeqmnWupAEhF/ZiyaxVbcWhWX2MjnODPxGgIg8Kx6cL0F8U6/USmpnySdUjxf3VqpxnlyuRtXjZIFMhmSm5RnyL+YGewPF4NVDWj4YSmtLfBJeh153c786sqBlVdzBdZBaOe1eysxjbbHOxTa1j3XwmmF3KpKk3ZrYgLnHl+2feVlfsUFKrihL2i5ypbYKElcfT7l8R9LDHb+XZMK277NAzWaLHxk0TAZaxfdBxx8pLEDXGNfo3+xm0BZlY/Svr8Pacf5MibCsEn2hf+INyalWywrbDNYi6Pf0WPBkHa47peoY19dHANRpEL2DRUuYmRcssQyki5AUlbK7cnW437Aqbxl2as26VAb7wE7mDTLXL8ruJ3wF1Qpbp0SFdY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yWtN6o0rJOEAlDZS9DMs26U8Xnkft1QR6dhtNKHbwDD9dIa2n/8xWt8UMfwO?=
 =?us-ascii?Q?n/M/MmbjgWiLSP3ba2cE4S4xEXxxc/mLqQzR5gMVmWVCbKpPpdW02X+vJxoc?=
 =?us-ascii?Q?AWxtlbfeODvPCIOxNhWzvPhnEhvy8qVdZheY3q06fKfhhyu05WZPsdYd6Ymk?=
 =?us-ascii?Q?/QZpCFpBngWz2C+RyiDXKv/1X3QeH1X6T55qoTkchNLQ/zrLyYUWWxa40aI9?=
 =?us-ascii?Q?f2PSVfxMjg+Mc0JKgE76qGY0hRaqaVV9oEtCyHXa32Ma9lzG9HQ4LaHYfagC?=
 =?us-ascii?Q?BmcX2WVFf3toU1O0YQ5X+JIxbt2OkwBPc3E/CVuC4cRSI57dAuPl/4q44Wnj?=
 =?us-ascii?Q?pAIL47DzRiAdGnEKWRhgXeAwebMHKMh1wSMm+QbEbxYAdz/0nsAj42+dm6NN?=
 =?us-ascii?Q?GmOGCvAAi9wbJ0f8C8/BvVzDtFBz03A1GHwiiiV2qt+QzA683SuabpYfGEWH?=
 =?us-ascii?Q?/Ks7TryvD7uTc0xl5AMXpDdNsmVPENA0X8S8vlXSgLnFNEw5JvK/gwgOHIcG?=
 =?us-ascii?Q?vNBJZPxzZW4ibhlJwxSBXdqrwdd7mD/TwMeJhg4w2mpwglRvwfNbC4qO/KKt?=
 =?us-ascii?Q?JdPcAOugxf7ApACDxV7DrK0h/l2SjRnCwf8dF3sB6GzWyO1V7CkanIdvZol5?=
 =?us-ascii?Q?xWVXBnphcmC6lhCOZBvimKk580IQR+AlLm4NDXayP3fnBTlvmRUoE7C4WaSC?=
 =?us-ascii?Q?cnrquYCR04GMAcstal4ftR2+vx/ivVaun/AroLSyJL9Wge3pyBIosuDYnBjc?=
 =?us-ascii?Q?7Ngw0i91jyEZPnEDNL2TPAOP/oP2uzxXsdQmsA+QTtTYLGWihdPNubIxUGYd?=
 =?us-ascii?Q?gF4shV95i4W6d0iGCrzJKhI1wVkj31Rxv+z2jz0pZuE4nDaT6/sxdlQvjQ8z?=
 =?us-ascii?Q?e++A+z/7URiOHqT72hm8cqGOgyermDabKI0Stdk7X00cFdSP2xAT9oB4Lw9C?=
 =?us-ascii?Q?mMt//2qPKAa1+H7VYu+fwvowzzC+tXyxuO2g7wXLvA5Z7qZsp62PVEAlE8DW?=
 =?us-ascii?Q?svV19oePPAtVDiEPZoEZT/T/V0fj+2N4ZljOCAM6E7iNcfd8m+D8hQGhuK9/?=
 =?us-ascii?Q?OTH5cUOPcPEpXsqa6zH43g26U7WwmKquqPez/SSHPWQ5RM2z5gfc7maHo3Bh?=
 =?us-ascii?Q?tLoZk3UChuktVpppDQAkWBFpMeftMJOXAoLX49yYiNtwUbbEF0QSGiveatF+?=
 =?us-ascii?Q?omuf0yrLj21wVF7Sb8CgU0LkG6Cr/B8SJC9c2JI7A+blRHdTq9UPhkINomG2?=
 =?us-ascii?Q?lvl4Pj6D9Id0xq+S/3bmn06JwaoDuUH+mH9s4J+xTwWwZO8FeHi7rG2B2fQd?=
 =?us-ascii?Q?toCgfobWgWatD+EJsXIYZ+WIVNXi+8ydU2b99bW1ruT7YOZLawbvyrlzbGqr?=
 =?us-ascii?Q?44QkazvBWjBH10gqCwGaPswQk/S0Oo5ZwYtEysM2NLdUJSR8vMj4T/cS3H9m?=
 =?us-ascii?Q?KwWniS+oEye1WupyIuFwPVlXqQK6Xo7OrCvKoD9nfeoRnhx0hAqoVYdNiUXb?=
 =?us-ascii?Q?2NM1Zuu+nEQHEtkXoYi9txqQZXsgpiGQY/AL3qfWfJ7vyVSblfDheou3Mdy1?=
 =?us-ascii?Q?Ys80E6mNLHlrMASBEmdBegsrPzgH81gioH/YkmqfnwAuvIvvFqIFOgjCT5vr?=
 =?us-ascii?Q?CZ8hHKsga06Pu4Kh4anuOvaEWWlsObmjZEigYmB8heqQFFCKfXgMl5ql2QLw?=
 =?us-ascii?Q?RIwcRsNwwEOGf70AMnvIaZTu4c6ljHNhBFH/+DjZYvTuvOnO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a707f13e-2aea-4104-eb89-08de78a2a569
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 21:28:29.0248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7+uYu3o5hLpI0RgBHd2H2qO2/fGZMdQBTjXMU2tpntJFJh+jRXGdSBhsMRSXoM0Tj5JbasZBfwlyg+VRo4jTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9353
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
X-Rspamd-Queue-Id: 5A7E91E2F00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:hugo@hugovil.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:antonin.godard@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hvilleneuve@dimonoff.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.68:email,0.0.0.3:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,pengutronix.de,bootlin.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,dimonoff.com];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,dimonoff.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 04:07:31PM -0500, Hugo Villeneuve wrote:
> Hi Frank,
>
> On Mon, 2 Mar 2026 15:50:21 -0500
> Frank Li <Frank.li@nxp.com> wrote:
>
> > On Mon, Mar 02, 2026 at 02:03:43PM -0500, Hugo Villeneuve wrote:
> > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > >
> > > Export common parts to the Variscite VAR-SOM-6UL dtsi so that they can be
> > > reused on other boards.
> > >
> > > This will simplify adding future dedicated device tree files for each CPU
> > > variant.
> >
> > Simplify adding ...
> >
> > >
> > > Add i2c1 pinctrl to var-som dtsi pinmux, so that it can be reused by other
> > > boards.
> > >
> > > Reorder pinctrl_gpio_leds to respect alphabetical order.
> >
> > this one use new patch.
>
> I'm not sure what you mean by that? Do you mean to move this change to a
> separate patch?

yes

Frank
>
>
> >
> > >
> > > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > ---
> > >  arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
> > >  .../dts/nxp/imx/imx6ul-var-som-common.dtsi    |   7 +
> > >  ...ts => imx6ul-var-som-concerto-common.dtsi} |  17 +-
> > >  .../dts/nxp/imx/imx6ul-var-som-concerto.dts   | 312 +-----------------
> > >  .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  17 +
> > >  5 files changed, 33 insertions(+), 321 deletions(-)
> > >  copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-concerto.dts => imx6ul-var-som-concerto-common.dtsi} (95%)
> > >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> > > index de4142e8f3ce8..bc534d0fb1412 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/Makefile
> > > +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> > > @@ -376,6 +376,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
> > >  	imx6ull-tarragon-slavext.dtb \
> > >  	imx6ull-tqma6ull2-mba6ulx.dtb \
> > >  	imx6ull-tqma6ull2l-mba6ulx.dtb \
> > > +	imx6ull-var-som-concerto.dtb \
> >
> > keep alphabet order
>
> Ok
>
> >
> > Frank
> > >  	imx6ull-uti260b.dtb \
> > >  	imx6ulz-14x14-evk.dtb \
> > >  	imx6ulz-bsh-smm-m2.dtb
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > > index 2072e8ba4d469..22b0c4e0725a5 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > > @@ -104,6 +104,13 @@ MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
> > >  		>;
> > >  	};
> > >
> > > +	pinctrl_i2c1: i2c1grp {
> > > +		fsl,pins = <
> > > +			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> > > +			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
> > > +		>;
> > > +	};
> > > +
> > >  	pinctrl_sai2: sai2grp {
> > >  		fsl,pins = <
> > >  			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > > similarity index 95%
> > > copy from arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > > copy to arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > > index d16e75164fd18..10a23ae104359 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > > @@ -1,19 +1,15 @@
> > >  // SPDX-License-Identifier: GPL-2.0+
> > >  /*
> > >   * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > > - * Variscite SoM mounted on it
> > > + * Variscite SoM mounted on it, for all CPU variants.
> > >   *
> > >   * Copyright 2019 Variscite Ltd.
> > >   * Copyright 2025 Bootlin
> > >   */
> > >
> > > -#include "imx6ul-var-som.dtsi"
> > >  #include <dt-bindings/leds/common.h>
> > >
> > >  / {
> > > -	model = "Variscite VAR-SOM-6UL Concerto Board";
> > > -	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> > > -
> > >  	chosen {
> > >  		stdout-path = &uart1;
> > >  	};
> > > @@ -144,22 +140,15 @@ MX6UL_PAD_NAND_CE1_B__GPIO4_IO14	0x17059
> > >  		>;
> > >  	};
> > >
> > > -	pinctrl_gpio_leds: gpio-ledsgrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
> > > -		>;
> > > -	};
> > > -
> > >  	pinctrl_gpio_key_wakeup: gpio-keys-wakeupgrp {
> > >  		fsl,pins = <
> > >  			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x17059
> > >  		>;
> > >  	};
> > >
> > > -	pinctrl_i2c1: i2c1grp {
> > > +	pinctrl_gpio_leds: gpio-ledsgrp {
> > >  		fsl,pins = <
> > > -			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> > > -			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
> > > +			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
> > >  		>;
> > >  	};
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > > index d16e75164fd18..11b45f105b7ad 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > > @@ -1,320 +1,18 @@
> > >  // SPDX-License-Identifier: GPL-2.0+
> > >  /*
> > >   * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > > - * Variscite SoM mounted on it
> > > + * Variscite SoM mounted on it (6UL CPU variant).
> > >   *
> > >   * Copyright 2019 Variscite Ltd.
> > >   * Copyright 2025 Bootlin
> > >   */
> > >
> > > +/dts-v1/;
> > > +
> > >  #include "imx6ul-var-som.dtsi"
> > > -#include <dt-bindings/leds/common.h>
> > > +#include "imx6ul-var-som-concerto-common.dtsi"
> > >
> > >  / {
> > > -	model = "Variscite VAR-SOM-6UL Concerto Board";
> > > +	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
> > >  	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> > > -
> > > -	chosen {
> > > -		stdout-path = &uart1;
> > > -	};
> > > -
> > > -	gpio-keys {
> > > -		compatible = "gpio-keys";
> > > -		pinctrl-names = "default";
> > > -		pinctrl-0 = <&pinctrl_gpio_key_back>, <&pinctrl_gpio_key_wakeup>;
> > > -
> > > -		key-back {
> > > -			gpios = <&gpio4 14 GPIO_ACTIVE_LOW>;
> > > -			linux,code = <KEY_BACK>;
> > > -		};
> > > -
> > > -		key-wakeup {
> > > -			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
> > > -			linux,code = <KEY_WAKEUP>;
> > > -			wakeup-source;
> > > -		};
> > > -	};
> > > -
> > > -	leds {
> > > -		compatible = "gpio-leds";
> > > -		pinctrl-names = "default";
> > > -		pinctrl-0 = <&pinctrl_gpio_leds>;
> > > -
> > > -		led-0 {
> > > -			function = LED_FUNCTION_STATUS;
> > > -			color = <LED_COLOR_ID_GREEN>;
> > > -			label = "gpled2";
> > > -			gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
> > > -			linux,default-trigger = "heartbeat";
> > > -		};
> > > -	};
> > > -};
> > > -
> > > -&can1 {
> > > -	pinctrl-names = "default";
> > > -	pinctrl-0 = <&pinctrl_flexcan1>;
> > > -	status = "okay";
> > > -};
> > > -
> > > -&fec1 {
> > > -	status = "disabled";
> > > -};
> > > -
> > > -&fec2 {
> > > -	pinctrl-names = "default";
> > > -	pinctrl-0 = <&pinctrl_enet2>, <&pinctrl_enet2_gpio>, <&pinctrl_enet2_mdio>;
> > > -	phy-mode = "rmii";
> > > -	phy-handle = <&ethphy1>;
> > > -	status = "okay";
> > > -
> > > -	mdio {
> > > -		#address-cells = <1>;
> > > -		#size-cells = <0>;
> > > -
> > > -		ethphy1: ethernet-phy@3 {
> > > -			compatible = "ethernet-phy-ieee802.3-c22";
> > > -			reg = <3>;
> > > -			clocks = <&rmii_ref_clk>;
> > > -			clock-names = "rmii-ref";
> > > -			reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
> > > -			reset-assert-us = <100000>;
> > > -			micrel,led-mode = <0>;
> > > -			micrel,rmii-reference-clock-select-25-mhz;
> > > -		};
> > > -	};
> > > -};
> > > -
> > > -&i2c1 {
> > > -	clock-frequency = <100000>;
> > > -	pinctrl-names = "default";
> > > -	pinctrl-0 = <&pinctrl_i2c1>;
> > > -	status = "okay";
> > > -
> > > -	rtc@68 {
> > > -		/*
> > > -		 * To actually use this interrupt
> > > -		 * connect pins J14.8 & J14.10 on the Concerto-Board.
> > > -		 */
> > > -		compatible = "dallas,ds1337";
> > > -		reg = <0x68>;
> > > -		pinctrl-names = "default";
> > > -		pinctrl-0 = <&pinctrl_rtc>;
> > > -		interrupt-parent = <&gpio1>;
> > > -		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> > > -	};
> > > -};
> > > -
> > > -&iomuxc {
> > > -	pinctrl_enet2: enet2grp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_ENET2_RX_EN__ENET2_RX_EN	0x1b0b0
> > > -			MX6UL_PAD_ENET2_RX_ER__ENET2_RX_ER	0x1b0b0
> > > -			MX6UL_PAD_ENET2_RX_DATA0__ENET2_RDATA00	0x1b0b0
> > > -			MX6UL_PAD_ENET2_RX_DATA1__ENET2_RDATA01	0x1b0b0
> > > -			MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN	0x1b0b0
> > > -			MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00	0x1b0b0
> > > -			MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01	0x1b0b0
> > > -			MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x4001b031
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_enet2_gpio: enet2-gpiogrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x1b0b0 /* fec2 reset */
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_enet2_mdio: enet2-mdiogrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_GPIO1_IO06__ENET2_MDIO	0x1b0b0
> > > -			MX6UL_PAD_GPIO1_IO07__ENET2_MDC		0x1b0b0
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_flexcan1: flexcan1grp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_UART3_RTS_B__FLEXCAN1_RX	0x1b020
> > > -			MX6UL_PAD_UART3_CTS_B__FLEXCAN1_TX	0x1b020
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_gpio_key_back: gpio-key-backgrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_NAND_CE1_B__GPIO4_IO14	0x17059
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_gpio_leds: gpio-ledsgrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_gpio_key_wakeup: gpio-keys-wakeupgrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x17059
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_i2c1: i2c1grp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> > > -			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_pwm4: pwm4grp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_rtc: rtcgrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_JTAG_MOD__GPIO1_IO10		0x1b0b0 /* RTC alarm IRQ */
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_uart1: uart1grp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
> > > -			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_uart5: uart5grp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_CSI_DATA00__UART5_DCE_TX	0x1b0b1
> > > -			MX6UL_PAD_CSI_DATA01__UART5_DCE_RX	0x1b0b1
> > > -			MX6UL_PAD_GPIO1_IO09__UART5_DCE_CTS	0x1b0b1
> > > -			MX6UL_PAD_GPIO1_IO08__UART5_DCE_RTS	0x1b0b1
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_usb_otg1_id: usbotg1idgrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_UART3_TX_DATA__ANATOP_OTG1_ID	0x17059
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_usdhc1: usdhc1grp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> > > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
> > > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> > > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> > > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> > > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> > > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> > > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> > > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> > > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> > > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> > > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> > > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> > > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> > > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> > > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
> > > -		>;
> > > -	};
> > > -
> > > -	pinctrl_wdog: wdoggrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x78b0
> > > -		>;
> > > -	};
> > > -};
> > > -
> > > -&pwm4 {
> > > -	pinctrl-names = "default";
> > > -	pinctrl-0 = <&pinctrl_pwm4>;
> > > -	status = "okay";
> > > -};
> > > -
> > > -&snvs_pwrkey {
> > > -	status = "disabled";
> > > -};
> > > -
> > > -&snvs_rtc {
> > > -	status = "disabled";
> > > -};
> > > -
> > > -&tsc {
> > > -	/*
> > > -	 * Conflics with wdog1 ext-reset-output & SD CD pins,
> > > -	 * so we keep it disabled by default.
> > > -	 */
> > > -	status = "disabled";
> > > -};
> > > -
> > > -/* Console UART */
> > > -&uart1 {
> > > -	pinctrl-names = "default";
> > > -	pinctrl-0 = <&pinctrl_uart1>;
> > > -	status = "okay";
> > > -};
> > > -
> > > -/* ttymxc4 UART */
> > > -&uart5 {
> > > -	pinctrl-names = "default";
> > > -	pinctrl-0 = <&pinctrl_uart5>;
> > > -	uart-has-rtscts;
> > > -	status = "okay";
> > > -};
> > > -
> > > -&usbotg1 {
> > > -	pinctrl-names = "default";
> > > -	pinctrl-0 = <&pinctrl_usb_otg1_id>;
> > > -	dr_mode = "otg";
> > > -	disable-over-current;
> > > -	srp-disable;
> > > -	hnp-disable;
> > > -	adp-disable;
> > > -	status = "okay";
> > > -};
> > > -
> > > -&usbotg2 {
> > > -	dr_mode = "host";
> > > -	disable-over-current;
> > > -	status = "okay";
> > > -};
> > > -
> > > -&usdhc1 {
> > > -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > > -	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> > > -	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> > > -	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> > > -	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> > > -	no-1-8-v;
> > > -	keep-power-in-suspend;
> > > -	wakeup-source;
> > > -	status = "okay";
> > > -};
> > > -
> > > -&wdog1 {
> > > -	pinctrl-names = "default";
> > > -	pinctrl-0 = <&pinctrl_wdog>;
> > > -	/*
> > > -	 * To actually use ext-reset-output
> > > -	 * connect pins J17.3 & J17.8 on the Concerto-Board
> > > -	 */
> > > -	fsl,ext-reset-output;
> > >  };
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > > new file mode 100644
> > > index 0000000000000..7c601af2657d7
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > > @@ -0,0 +1,17 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > > + * Variscite SoM mounted on it (6ULL CPU variant).
> > > + *
> > > + * Copyright 2026 Dimonoff
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "imx6ull-var-som.dtsi"
> > > +#include "imx6ul-var-som-concerto-common.dtsi"
> > > +
> > > +/ {
> > > +	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
> > > +	compatible = "variscite,mx6ullconcerto", "variscite,var-som-imx6ull", "fsl,imx6ull";
> > > +};
> > > --
> > > 2.47.3
> > >
> >
>
>
> --
> Hugo Villeneuve
