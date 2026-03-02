Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBujNiH4pWkEIgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:50:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE061E0DBC
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1035B10E5BD;
	Mon,  2 Mar 2026 20:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DqiCTgWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EF710E5BD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 20:50:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVxnL+9+sjKSECDScRerwzNB0gtuX1iKmUqkJeb8VulSMQlxx1rhYQGseKY4bjhp8zIYF1m0EsApSzSLwHSgXS5kWKeb4LJVaW4sTNyVraJi+MpLVs2Cra+Nn06gIIEnxaYCw5EyXx6XoL/Pe/hfRO4Jd58avgEPqFhMOUeOkDSDWbdaOmQ0VLURM9yPZoKMd/vi/wpMmLmiEPwnB+bKDUx3PbDFalNBqq50D4Kq51ilf4uMx0Y0fZvx7ocN7Ej19Dp3ik696ifr/KOUdDsqAENQY8FD1KlXR4m4BtQld5p4q02Gnjgjy6tHUA8+wknv1grzGEKVASfMZo22ZAj4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYtb/1TP+S6XdBc1qBMkrn39DbnohAwt51ESAhpYQYs=;
 b=vkfoAZT97LZLxqECJx7qtaGhHU2YuhXtZAgnrkFQDZBk01aXGa7ToroEgLeIppdMbYcWjTgMoRaqL5HcVwvq31oczUvIbZgcGoWrDXOT1deOMibWm52wGF3o7bBlOiu441EUzJ3pFsl/r7+IeMcvtR071mPoB1QhY/KOFKb74OC6aW22a1K70Evg1C8/vZzAbe14DA/eTMMDgQhoL2t494outyr6a5E4qkCtBqK1ZGrEUKQFTrSgrJMbXFXnuNn7R8wT7DGH8LyajxmTTWYMU3RUIImWs9vj6TZBOGHLUYyIsJW3TeWwHdSz8FwJ5H9uyJ14m73N5JV+B4uxmjhPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYtb/1TP+S6XdBc1qBMkrn39DbnohAwt51ESAhpYQYs=;
 b=DqiCTgWTnyf8Q9BsLwt47RgVWeB4ZTbbiNQW8K7kv4mK3b68iA74mnpDvVfavKYtDSZHPpZmEZlWTYertrO4rR6HMKXNsi5IzNJMopB86wIZ7hWocfgwFMbYxz214fXcjr5S65qv0SXPn7jwIJ9IWpde8MdkwM0s4H1EiXFHGXhs0daARpbr7CArGoF0eWKVnY76/JGC+/q8if+FhKMlsKfFPuBKf5iLgBVupa7O5wstsy5P5ZZFcQndIj8s3Vj9BnbK4YxwmRFq/Emj2/5EjkwCj7JqsPqx5VUjg3tgl/5bIUBHOz6HqgVr0d59EBgMTooaFmxRtKtpNJFr3XpFVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11445.eurprd04.prod.outlook.com (2603:10a6:150:2af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 20:50:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:50:31 +0000
Date: Mon, 2 Mar 2026 15:50:21 -0500
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
Message-ID: <aaX4DYzfR2HifTtf@lizhi-Precision-Tower-5810>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-8-hugo@hugovil.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302190953.669325-8-hugo@hugovil.com>
X-ClientProxiedBy: PH7P220CA0123.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11445:EE_
X-MS-Office365-Filtering-Correlation-Id: 16030164-54ad-42c9-4574-08de789d57e3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: Hiq+yQIgjugnve6q9g9Bf8s3KQjFoiyKGjhZNLJYojDJefVX732jzXz2uncuOVRDIOQvbURtXXTeSIBYfbacIAtspQmvJYmB75ZlSm62l0ciGwJP5l3FmPWykM6MfdrJBwHUIk9jRuuhw+dOzS8Zcfmueoct3WEPN0SmeMfwO5kT+H3ga3Bpi9iw3B4LXGs2Xp9DVNvbel8pwRY2COljAENuja8hk+pG5BLYICZtlLKp9EzIA7rMVMDyL4bJnhrpurawLWXDA/4NB+JLNF1MvUo8MRB+8RBcIExdzw2k04ML8+wnOdxLBfkBtmUbtyH/XCYQJIIqSYcs1aTksVPOn7F6bqgkN5akYizD9Aw0bFpo553qwOiHfSPhbLiKv/PCbQDWrCyqyuKjkZnFeihhlhJYFzfFfokwKxPaxznsyKYBkZtFu3R45TtR7kW7nPvUVbtkaeILtZKc8MaatRWi+QUZoctuX0XIEarhT+uwZSFSwaY/44O8+QF+IYeiQyFGyzwjzESzFkh6xivp8nqPPKvHAK4xdBqajOKw7Jxy3g05dofOpvChyd14y9PmyW6HI1TGrxSxurPYkywmCtW0oX2ocl8mLTh3X/pp5bv0y/X0q4+RdanIPB6IwhD5xnrMrYBoz+8vZlbGaMOzcfsqpNgzFjfelnAYCvylrBKntGNYJBnZrUuO2PeKOtbWhe8zT3418YQkehkNu3WsmqdluVLH+7AkIVDH91lxy63uIUGZ81J/SBzKeKMyKCpteiOJhtMGgxtpsKmlnj6s/jWcuvbmK/YJwRVw4S8OKXnIavk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bVmmM/s5mY7zQoAISBUqguGtsm31RDnJIwJ6zFSgXPLxPrwVb2aX5lF3+TCh?=
 =?us-ascii?Q?re4OYPM/cAVf+YOWqZEC8r6ulv60xvAtqPUA+x16m8W3D2+N0+yK/rqMf7vc?=
 =?us-ascii?Q?tgPGD/GUR9FqI39x6Cq/56+no2zHC6YDgT0BmViHy7/x1HSLc48fDRz67WwY?=
 =?us-ascii?Q?+eT9iVMNBDzId9X44przN3yY7ijE6jPP0LPS25EKq2+ozkqOL7YVUJjOImf3?=
 =?us-ascii?Q?XwjkFxHv7sbEv4P/wGWrM9dsZ+eAUqc9qjdk9zjBd3ZbfiBviSN9KbOkqmFT?=
 =?us-ascii?Q?J9HJbGAfkUDJY/6ipd7PeL5IhKKICP4aoKCnV798kn85Jt2e3mzs24h0bWmQ?=
 =?us-ascii?Q?10TH0A/6FaNQm6mZ50s9G0u+Rq0gzaGz1NaZrTWJnvq70lE3ziV8GR1So4QS?=
 =?us-ascii?Q?0wzTKX/LFa+q0Wm4dfrBPLkKWzPG3JQffffzxNNchGWG3dGCrCiju2J50RUa?=
 =?us-ascii?Q?OSr7bfAz0XmSWwz18qZzk8KHe1rONEOdMPKzdZ4AI4rtBooK+cncoeqP+C/G?=
 =?us-ascii?Q?98a3akUnm5u/31XKBemVmG/edhI5KPj5h0CGCeHFP0vBb058edcFe4GtyXbr?=
 =?us-ascii?Q?/JDD2aOYMK24GXsrCFqmW6fYZ8eqaWZVQdwluPBNavdhwsGSIw7+Dx+kY+7/?=
 =?us-ascii?Q?S4L+4kGF4R0vkUDaP8wwRbOmAHxBagKJ03DIwzlKzaxcpTohREhp0g6dmAgW?=
 =?us-ascii?Q?OCq5Cq1nzmuwnnx0ifF03ttsi/Hqqjtg+W1vADIAqDMTi7aLSJTTWvWnjivU?=
 =?us-ascii?Q?lzPJgxBKe5XNxEgWV2G7HsCvaboOpnTIVKWitQxtcfFU4egNhpIKMh3m5PzJ?=
 =?us-ascii?Q?76X1QIpegbgfdSr8H18yNB7E+JJ/EM2d2FJCYWbDGUDEFEYZoVnwdJAFbPie?=
 =?us-ascii?Q?KoqudR9FeQuxSLEi1uRKAt3HqjzNcCLDZSdrgsyS2UGCAuoMT9Oo9U5QVrhr?=
 =?us-ascii?Q?UVUXNcOAivsJZlt4JoC/1OjROdson6jZ/jQMIeY9J8AgdMVqGR/V86x56vmD?=
 =?us-ascii?Q?MKK1Hz2CGm2fNrUvV69sfiuTbqolb3nTf5sVdVLh5bjvDRDqHR8cziBRR/1U?=
 =?us-ascii?Q?//cFKyx7DlbCVV7M+cZNg8yYaHAqw3XFGANz7n2PdzyE3AFicsuXVcfhJcgD?=
 =?us-ascii?Q?i0PhFmSUHfzy4IS4CMFhqLdCeyChIpPVs+MHekxghk4HCibyAp80fh0OB8Jb?=
 =?us-ascii?Q?WFAVBiiTzhS77AxQMGHDntvXLgBVgfaN+ew41I6w9VVPhgpa77faGcxoY5nb?=
 =?us-ascii?Q?/iYpDh+LfA9RIYyfVNqVsVEkLT9DZw4uERLD6EuH41UPaiJ4xhQOwlKFMQsl?=
 =?us-ascii?Q?6OuHpGUrbNuDwLdpnxoS9MPoE5btz/5ITD6GmYmRa508/i5khCgU66aPVpJ4?=
 =?us-ascii?Q?gJm7J9v69LFf8qYrjypkVJ3IaqRYOFWFoTfIs60kou0+bqEIM06TiCXctUHB?=
 =?us-ascii?Q?7IEyperDGFoKJPGJ8lwp8A1zXL6/2CP1R3b4/D+6NmbY2lUxQHDyIM74EOjr?=
 =?us-ascii?Q?A96v+h0gNtOl7Kx+LiBWR0grU7gsSY9eh1lwfeukZPu+jX14QuPeT3uUtPXG?=
 =?us-ascii?Q?3D08QOyWXPIxG/jb0EASiuBeGkWDysmdi+eiDxnlZCnhw0fGNTc24UWVCe36?=
 =?us-ascii?Q?cOx4hIC8muii5nZB5ozxWcvb1qCKLJ7utc3CvHBQhCJffWz54cOvAyAXxVEW?=
 =?us-ascii?Q?UpzmgpDHxcbwd386k4V3YjWPzwu20kNJRBymCOCKKrNDwGMuD02DRuKaJj0O?=
 =?us-ascii?Q?0aPlgwdzaQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16030164-54ad-42c9-4574-08de789d57e3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:50:31.4132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgsR8ItHO4KhdL7KeIwUbwc8jCSx4rVnO5AaIgejNiz3s16mx62hWhzO9idANtiuWDH/sknXU6HdKCQz93oalQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11445
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
X-Rspamd-Queue-Id: 3BE061E0DBC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:hugo@hugovil.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:antonin.godard@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hvilleneuve@dimonoff.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,pengutronix.de,bootlin.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,dimonoff.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:03:43PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> Export common parts to the Variscite VAR-SOM-6UL dtsi so that they can be
> reused on other boards.
>
> This will simplify adding future dedicated device tree files for each CPU
> variant.

Simplify adding ...

>
> Add i2c1 pinctrl to var-som dtsi pinmux, so that it can be reused by other
> boards.
>
> Reorder pinctrl_gpio_leds to respect alphabetical order.

this one use new patch.

>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
>  .../dts/nxp/imx/imx6ul-var-som-common.dtsi    |   7 +
>  ...ts => imx6ul-var-som-concerto-common.dtsi} |  17 +-
>  .../dts/nxp/imx/imx6ul-var-som-concerto.dts   | 312 +-----------------
>  .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  17 +
>  5 files changed, 33 insertions(+), 321 deletions(-)
>  copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-concerto.dts => imx6ul-var-som-concerto-common.dtsi} (95%)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index de4142e8f3ce8..bc534d0fb1412 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -376,6 +376,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ull-tarragon-slavext.dtb \
>  	imx6ull-tqma6ull2-mba6ulx.dtb \
>  	imx6ull-tqma6ull2l-mba6ulx.dtb \
> +	imx6ull-var-som-concerto.dtb \

keep alphabet order

Frank
>  	imx6ull-uti260b.dtb \
>  	imx6ulz-14x14-evk.dtb \
>  	imx6ulz-bsh-smm-m2.dtb
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> index 2072e8ba4d469..22b0c4e0725a5 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> @@ -104,6 +104,13 @@ MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
>  		>;
>  	};
>
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> +			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
> +		>;
> +	};
> +
>  	pinctrl_sai2: sai2grp {
>  		fsl,pins = <
>  			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> similarity index 95%
> copy from arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> copy to arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> index d16e75164fd18..10a23ae104359 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> @@ -1,19 +1,15 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> - * Variscite SoM mounted on it
> + * Variscite SoM mounted on it, for all CPU variants.
>   *
>   * Copyright 2019 Variscite Ltd.
>   * Copyright 2025 Bootlin
>   */
>
> -#include "imx6ul-var-som.dtsi"
>  #include <dt-bindings/leds/common.h>
>
>  / {
> -	model = "Variscite VAR-SOM-6UL Concerto Board";
> -	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> -
>  	chosen {
>  		stdout-path = &uart1;
>  	};
> @@ -144,22 +140,15 @@ MX6UL_PAD_NAND_CE1_B__GPIO4_IO14	0x17059
>  		>;
>  	};
>
> -	pinctrl_gpio_leds: gpio-ledsgrp {
> -		fsl,pins = <
> -			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
> -		>;
> -	};
> -
>  	pinctrl_gpio_key_wakeup: gpio-keys-wakeupgrp {
>  		fsl,pins = <
>  			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x17059
>  		>;
>  	};
>
> -	pinctrl_i2c1: i2c1grp {
> +	pinctrl_gpio_leds: gpio-ledsgrp {
>  		fsl,pins = <
> -			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> -			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
> +			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
>  		>;
>  	};
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> index d16e75164fd18..11b45f105b7ad 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> @@ -1,320 +1,18 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> - * Variscite SoM mounted on it
> + * Variscite SoM mounted on it (6UL CPU variant).
>   *
>   * Copyright 2019 Variscite Ltd.
>   * Copyright 2025 Bootlin
>   */
>
> +/dts-v1/;
> +
>  #include "imx6ul-var-som.dtsi"
> -#include <dt-bindings/leds/common.h>
> +#include "imx6ul-var-som-concerto-common.dtsi"
>
>  / {
> -	model = "Variscite VAR-SOM-6UL Concerto Board";
> +	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
>  	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> -
> -	chosen {
> -		stdout-path = &uart1;
> -	};
> -
> -	gpio-keys {
> -		compatible = "gpio-keys";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_key_back>, <&pinctrl_gpio_key_wakeup>;
> -
> -		key-back {
> -			gpios = <&gpio4 14 GPIO_ACTIVE_LOW>;
> -			linux,code = <KEY_BACK>;
> -		};
> -
> -		key-wakeup {
> -			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
> -			linux,code = <KEY_WAKEUP>;
> -			wakeup-source;
> -		};
> -	};
> -
> -	leds {
> -		compatible = "gpio-leds";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_leds>;
> -
> -		led-0 {
> -			function = LED_FUNCTION_STATUS;
> -			color = <LED_COLOR_ID_GREEN>;
> -			label = "gpled2";
> -			gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "heartbeat";
> -		};
> -	};
> -};
> -
> -&can1 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_flexcan1>;
> -	status = "okay";
> -};
> -
> -&fec1 {
> -	status = "disabled";
> -};
> -
> -&fec2 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_enet2>, <&pinctrl_enet2_gpio>, <&pinctrl_enet2_mdio>;
> -	phy-mode = "rmii";
> -	phy-handle = <&ethphy1>;
> -	status = "okay";
> -
> -	mdio {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ethphy1: ethernet-phy@3 {
> -			compatible = "ethernet-phy-ieee802.3-c22";
> -			reg = <3>;
> -			clocks = <&rmii_ref_clk>;
> -			clock-names = "rmii-ref";
> -			reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
> -			reset-assert-us = <100000>;
> -			micrel,led-mode = <0>;
> -			micrel,rmii-reference-clock-select-25-mhz;
> -		};
> -	};
> -};
> -
> -&i2c1 {
> -	clock-frequency = <100000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_i2c1>;
> -	status = "okay";
> -
> -	rtc@68 {
> -		/*
> -		 * To actually use this interrupt
> -		 * connect pins J14.8 & J14.10 on the Concerto-Board.
> -		 */
> -		compatible = "dallas,ds1337";
> -		reg = <0x68>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_rtc>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> -	};
> -};
> -
> -&iomuxc {
> -	pinctrl_enet2: enet2grp {
> -		fsl,pins = <
> -			MX6UL_PAD_ENET2_RX_EN__ENET2_RX_EN	0x1b0b0
> -			MX6UL_PAD_ENET2_RX_ER__ENET2_RX_ER	0x1b0b0
> -			MX6UL_PAD_ENET2_RX_DATA0__ENET2_RDATA00	0x1b0b0
> -			MX6UL_PAD_ENET2_RX_DATA1__ENET2_RDATA01	0x1b0b0
> -			MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN	0x1b0b0
> -			MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00	0x1b0b0
> -			MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01	0x1b0b0
> -			MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x4001b031
> -		>;
> -	};
> -
> -	pinctrl_enet2_gpio: enet2-gpiogrp {
> -		fsl,pins = <
> -			MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x1b0b0 /* fec2 reset */
> -		>;
> -	};
> -
> -	pinctrl_enet2_mdio: enet2-mdiogrp {
> -		fsl,pins = <
> -			MX6UL_PAD_GPIO1_IO06__ENET2_MDIO	0x1b0b0
> -			MX6UL_PAD_GPIO1_IO07__ENET2_MDC		0x1b0b0
> -		>;
> -	};
> -
> -	pinctrl_flexcan1: flexcan1grp {
> -		fsl,pins = <
> -			MX6UL_PAD_UART3_RTS_B__FLEXCAN1_RX	0x1b020
> -			MX6UL_PAD_UART3_CTS_B__FLEXCAN1_TX	0x1b020
> -		>;
> -	};
> -
> -	pinctrl_gpio_key_back: gpio-key-backgrp {
> -		fsl,pins = <
> -			MX6UL_PAD_NAND_CE1_B__GPIO4_IO14	0x17059
> -		>;
> -	};
> -
> -	pinctrl_gpio_leds: gpio-ledsgrp {
> -		fsl,pins = <
> -			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
> -		>;
> -	};
> -
> -	pinctrl_gpio_key_wakeup: gpio-keys-wakeupgrp {
> -		fsl,pins = <
> -			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x17059
> -		>;
> -	};
> -
> -	pinctrl_i2c1: i2c1grp {
> -		fsl,pins = <
> -			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> -			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
> -		>;
> -	};
> -
> -	pinctrl_pwm4: pwm4grp {
> -		fsl,pins = <
> -			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
> -		>;
> -	};
> -
> -	pinctrl_rtc: rtcgrp {
> -		fsl,pins = <
> -			MX6UL_PAD_JTAG_MOD__GPIO1_IO10		0x1b0b0 /* RTC alarm IRQ */
> -		>;
> -	};
> -
> -	pinctrl_uart1: uart1grp {
> -		fsl,pins = <
> -			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
> -			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
> -		>;
> -	};
> -
> -	pinctrl_uart5: uart5grp {
> -		fsl,pins = <
> -			MX6UL_PAD_CSI_DATA00__UART5_DCE_TX	0x1b0b1
> -			MX6UL_PAD_CSI_DATA01__UART5_DCE_RX	0x1b0b1
> -			MX6UL_PAD_GPIO1_IO09__UART5_DCE_CTS	0x1b0b1
> -			MX6UL_PAD_GPIO1_IO08__UART5_DCE_RTS	0x1b0b1
> -		>;
> -	};
> -
> -	pinctrl_usb_otg1_id: usbotg1idgrp {
> -		fsl,pins = <
> -			MX6UL_PAD_UART3_TX_DATA__ANATOP_OTG1_ID	0x17059
> -		>;
> -	};
> -
> -	pinctrl_usdhc1: usdhc1grp {
> -		fsl,pins = <
> -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
> -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> -		>;
> -	};
> -
> -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> -		fsl,pins = <
> -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> -		>;
> -	};
> -
> -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> -		fsl,pins = <
> -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> -		>;
> -	};
> -
> -	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> -		fsl,pins = <
> -			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
> -		>;
> -	};
> -
> -	pinctrl_wdog: wdoggrp {
> -		fsl,pins = <
> -			MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x78b0
> -		>;
> -	};
> -};
> -
> -&pwm4 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_pwm4>;
> -	status = "okay";
> -};
> -
> -&snvs_pwrkey {
> -	status = "disabled";
> -};
> -
> -&snvs_rtc {
> -	status = "disabled";
> -};
> -
> -&tsc {
> -	/*
> -	 * Conflics with wdog1 ext-reset-output & SD CD pins,
> -	 * so we keep it disabled by default.
> -	 */
> -	status = "disabled";
> -};
> -
> -/* Console UART */
> -&uart1 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_uart1>;
> -	status = "okay";
> -};
> -
> -/* ttymxc4 UART */
> -&uart5 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_uart5>;
> -	uart-has-rtscts;
> -	status = "okay";
> -};
> -
> -&usbotg1 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_usb_otg1_id>;
> -	dr_mode = "otg";
> -	disable-over-current;
> -	srp-disable;
> -	hnp-disable;
> -	adp-disable;
> -	status = "okay";
> -};
> -
> -&usbotg2 {
> -	dr_mode = "host";
> -	disable-over-current;
> -	status = "okay";
> -};
> -
> -&usdhc1 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> -	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> -	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> -	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> -	no-1-8-v;
> -	keep-power-in-suspend;
> -	wakeup-source;
> -	status = "okay";
> -};
> -
> -&wdog1 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_wdog>;
> -	/*
> -	 * To actually use ext-reset-output
> -	 * connect pins J17.3 & J17.8 on the Concerto-Board
> -	 */
> -	fsl,ext-reset-output;
>  };
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> new file mode 100644
> index 0000000000000..7c601af2657d7
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> + * Variscite SoM mounted on it (6ULL CPU variant).
> + *
> + * Copyright 2026 Dimonoff
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-var-som.dtsi"
> +#include "imx6ul-var-som-concerto-common.dtsi"
> +
> +/ {
> +	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
> +	compatible = "variscite,mx6ullconcerto", "variscite,var-som-imx6ull", "fsl,imx6ull";
> +};
> --
> 2.47.3
>
