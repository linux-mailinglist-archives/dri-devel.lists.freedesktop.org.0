Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PlcbMBiErWla3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3EC2308F0
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C78110E179;
	Sun,  8 Mar 2026 14:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="N+M+CvFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947E510ED2D;
 Fri,  6 Mar 2026 13:06:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUufr0a2CxWroACoC0VGpBjaGzg6zlFWBsUeGHPLpeN+/Ho7RJzFPz2Exvt3Y8Edp38v6BsUcSmfVtFtEXTiAPo07/vLRvejTWRiUgpF37L/59b66trBsZMCSebH9VrDqYKLA6p2j1K2Mh5U8G5+jHntUhKkICwEv/8gIcpC7TpDxwoisDXCFW3dlHbS2frKq14jttAOC/CYBzjwH982ayQ8Yzrdk0MtsaYkUYQJYp2HV4Aj+1aYcVhBQMD+HThn8LUPBT+FDYs7b5aRRvXHmHdTMKLu27yHCXMxHFTFqHDYdAPZ5d65WqGY1RtFCxZ3mOjmzecDWer+nhjExyXZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3Wm86uYlGdv4LY1I/C5jtWegO/XTbwWQa3y/jTLQ48=;
 b=Gca2JibTiouhRv6YhzEjxY4GUH4+A2wMMOS+qvnMfEc4FY+cbJH10aFPaNOUeaKksGgUbIm1ZNLyPWGhChB9eeyccBIUS4iAe55W0gg2xbs7KCL7eeFXHzyCKDWq915RCzvDHSlTSefkZKx7OqTc6oxe7BXwHThFRJU5Pyejh57X7ybKMbG1Bgyubsyj9KhXTmzNX6v7UXYjRdJF0vlOlKW6wkzoyLZt9+3hvGxs409NFnJMy8rUuN+4J1VAp4ilMX/25XeJQJbH6jLs2oHpeJ4GBFwBMmay4c39IWrSpTKZZCkYQ3YNBySSsu2IlrY6fq8ha6OA9UJ/nfiZ57bxFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3Wm86uYlGdv4LY1I/C5jtWegO/XTbwWQa3y/jTLQ48=;
 b=N+M+CvFVUnvVFZQel/sy1TYU6MRYacg1H5PZboUIA3ZMgjoeal+G/uDtWM62Atx/a2ebIGRD8FTDN91KMubyojepsKbQnxSrach7i63R4ioXBg+2nkrC8h7eYE6C/hlUQi9IQeH7k4GM/vQvCPIfYdEYzvOOVxmEczPTITy2AuXcxktxHgncMMt2gJ9E6cM2fVyC2j8oNEesNOND0stbzsyUrjmW9XUOFurhBZF4BXhOLn1oGWIpesOw+52mHPcAgXdFvGglFp7XR6JY1aOBVI4o50ZMRWA37NNLPXXYlaRyTv+DHh/Ye4n/TKNRk72t8OabV/4vA9EJeiCKnMc3wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI0PR04MB10853.eurprd04.prod.outlook.com (2603:10a6:800:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 13:06:42 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 13:06:42 +0000
Date: Fri, 6 Mar 2026 15:06:39 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 20/22] phy: include PHY provider header
Message-ID: <20260306130639.ae2d2aqcqambnta6@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-21-vladimir.oltean@nxp.com>
 <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-21-vladimir.oltean@nxp.com>
 <7b44322a-5ec9-860e-6698-bbdc62b9a292@rock-chips.com>
 <7b44322a-5ec9-860e-6698-bbdc62b9a292@rock-chips.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b44322a-5ec9-860e-6698-bbdc62b9a292@rock-chips.com>
 <7b44322a-5ec9-860e-6698-bbdc62b9a292@rock-chips.com>
X-ClientProxiedBy: BE1P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::17) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI0PR04MB10853:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5fb674-c7f8-4402-55ad-08de7b813625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|10070799003|1800799024|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info: LyEnsBSXm1a7qJFsrROgPhByZ2ZLoO/030b524ANNAbRvOI4WLMBuV8vzikOa8hUqSTLNVvVU97DpV2dsMySUCi2PSIwUR2gFnWE0YLOvaM87PJl51BWj1TvgFMQd2KprqhoSlHDERuTYuXn1IkCVuIzViXeaUbUX4ATu+8FpvdqyZSsI9u2K6XnSd2+iNRUotch6Ot9c32NFGvEPCXl8v1T9+iHWeVLsIVzYIR8LbtAv4JZv7pVLIqB5uxfzst9uGE8Kb0H4QpcHoCd48rUWZ6Uv9K3eoVfaDj1IYbv0kOxdQTUnTmOCmhYf3U0TX9ndyU10CnrUmFKdbfujwIAKSwCBrbty66bFdxT1uzXOJHnjto1Eo+dQnvxVhi4Kd8rmGRPc2rduzmQ8+i9iIYBM0w80CquE3FyW3UsVQE132uspdcc2OUq7oGQhOKDl96TSa1j4eIKHTr28koksE3XHOz/odln8J6551VZC9tCLGtPbxZllfFeIWFDKCbYZdTu8GuGocaAZgSF+1KP+sleiBKZFBkeNu/4a9BZNlI3GghUSlB0wPnrM1Sgm5h7nh4xDQPyuSrFgtD6n8hCDV/5hftsS4BacIQsO3tDOYskacnET4kseFD1omtRP52/P2mV57KtFcRSV3jtTmGoC5r/vb/KUyJ8q6CbEqaN1GxOO912RHatSS1zLLdgGICdA45SwIG5iRDD9ey8hcmrNw78B3vyfPippZDsASSzm8LhVpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(10070799003)(1800799024)(19092799006)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FvDsrmLcpE/S3YUr29BmnCra7Co7/teURt0RuScml/44oIOM8yeuFpqcGZCk?=
 =?us-ascii?Q?F04C2VlVDyqfXQ5c2889PqVw3WxIoe0K4znukd5b57zF5J9AyqEZChcHGHai?=
 =?us-ascii?Q?XIDdt1A0JlgRCf4WlrkHEhJQ+79lriMzI6NjbPzUM46UUrjxViSlnk8KhUT+?=
 =?us-ascii?Q?exBzbJ1TBP3bNwXL7oO9oU5MGJba7FS9iGm0BSAXCl64eDdkEM7zeRRWOwAS?=
 =?us-ascii?Q?2EcMDbj9s0I0VRQ9SKBK2JSxVECLwIC+SK34xImQyMyfdmtqdqk4oO9+DOcY?=
 =?us-ascii?Q?H+e7ru/BY43j4Yrh8AnjE1R5DtdZleJFnEhDizATfJ6ybaIp8DWMd84DzlZ3?=
 =?us-ascii?Q?qBJQrCSL7huoSWwwWqpiUhRrcaTSdg3jOYPibCnChDI4vzftUk9wxl9gAz5P?=
 =?us-ascii?Q?VKwWSC3K1aVlDMfPqhto/zwNJ3tRUh2i5E48FhU8U8Tw8WAcsdaip/mBeONr?=
 =?us-ascii?Q?8b2HFUdYglirJu84dZB8dbNBStl3DWsKWuL9hk7aBINHJFKSO1Gapjg61ouK?=
 =?us-ascii?Q?9vQql/iUm1Xxo/12kPu0le+AWubOgpedJf43AsUcSHTGt2WHwZuPMPqgb2PI?=
 =?us-ascii?Q?fCLeOgEs6Sc8piWzvJ79qqEKmKz/fcQEPqU1jPuF/GEKuaXqUn8olGJeqFlG?=
 =?us-ascii?Q?ytxEuCkkiulta4JSK7oowtLltlTjvxdVK9pHBG1gNBq8UliPo/ab3Fnlh6si?=
 =?us-ascii?Q?4WwBwfBOS9h0AbBSo9A0WKfm2kWim6xipOlSSBz38JnCmhkldWroPEchqgso?=
 =?us-ascii?Q?eKI6xGEJEZu4oelhKVjc9k3JCxMJ3/os78BO/h1QNH4Gv27Y7gRKhHSlqVMB?=
 =?us-ascii?Q?QqJOCNGM6XfPkehkxaVeVK77NDpDPzC1n9Ofnsx/8/fYlgN7tWr60aq4ZkqL?=
 =?us-ascii?Q?lkG+kfFDyOFZzON6WlKEwXQdbRGYN/9yVnUTmvegbxWz33QLDoQRPQRlIwGd?=
 =?us-ascii?Q?KnwpP1/a4KI17g3ohO/ZWKerZebr/e6MOiFB3z+C8k3SsK8TyuEpRTLWSNXs?=
 =?us-ascii?Q?TQccPTTr9RDlBMbpxRvGWImecQHT9RTvdcQv7lXCK1Iwl00VZ0msEFj5UCRX?=
 =?us-ascii?Q?Wr3erHN1gT6zC+WFWbGkoBt9B9MoWu+TioV47/5UKiFe35PucgJdsgbCmeaY?=
 =?us-ascii?Q?9P/q+s+7X1xoPFDT1oFhUiFMqtGJ6iViwsXQTT2YvBqXOckHXghncPGs7I2p?=
 =?us-ascii?Q?mtYV6LbGwuvkBP0qtVNrjArwokOPV3alu6LLmDo4MzNQ/fM9tRAeVNw3rC9f?=
 =?us-ascii?Q?ChkIdUjs8EUCNq8+5fYdlgjxOIYwv3cxoNR4zzW7cmbEMtW7BhIr19ydT6E1?=
 =?us-ascii?Q?YSr4IOnzp+xrpMK9h5eLW9kjw38qRyf9Ns7dD5IoKSLKI5UZPPIsUEZBCWXc?=
 =?us-ascii?Q?SNPxD/aPrn3X+Qp3FBHkqIq1n9Et12t5hfluglfsOXFiYKuSXfMcEX632b4U?=
 =?us-ascii?Q?IuyR/XoCKCceeV8RRvumWO/xc4DPS6tFGCKUCjz2AJL3OrKCprYeh3Fi3CJz?=
 =?us-ascii?Q?YQe69pA6swlLA3F2xK8aX7uhQoUzKMDEqHrNHCiSK175nszO6nh8D1rNMG/Q?=
 =?us-ascii?Q?yTXIvZwLtfdkYruZoN60gObuv26bkSPXIaj2rPTD9z5Vwh5kLGt2cOtUEPd7?=
 =?us-ascii?Q?bT1/EviLVtXhJn6bWu8Bebk+fM1MxOrD5dOO0vVExtt55MbRp5YXS0vz285I?=
 =?us-ascii?Q?6tGd0dzsD8ZEvN4qnQhULvzmw97uVVg2G8MwaE2nZ4+yqhK8LXaNM7EJfC0I?=
 =?us-ascii?Q?7WUJpztzTXApIZtVnLWklZsJXIzu9VchVK2zQRt0cXS9JUL+XCZz1p/WB+D/?=
X-MS-Exchange-AntiSpam-MessageData-1: O78bT1dWZ/9JsXGWgO17oYNKauK4gWgfB4Q=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5fb674-c7f8-4402-55ad-08de7b813625
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 13:06:42.6084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sv6bop/3BCPYVPLa+u3xDqHTp0OZLlyg9fCSuCQPFNITsrYikxZGhRjxhAkbO4BjYlKKlANsd8jBI5BmT8HQ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10853
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 4E3EC2308F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DATE_IN_PAST(1.00)[49];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.927];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email,nxp.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi Shawn,

On Thu, Mar 05, 2026 at 11:22:52AM +0800, Shawn Lin wrote:
> For rockchip parts:
> 
> Acked-by: Shawn Lin <shawn.lin@rock-chips.com>

Thank you for the review.

This is a large patch, please trim the quoted portion when replying.
I had to scroll through a lot of text to make sure you didn't have
anything else to say.

I will split this patch up in v2. It's so large that it didn't pass
through the linux-phy mailing list moderation, thus it didn't make it to
patchwork and the incomplete series didn't get build tested.
