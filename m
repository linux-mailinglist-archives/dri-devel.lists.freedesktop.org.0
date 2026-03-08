Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA/pND/srmkWKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB0423C0FE
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C91610E552;
	Mon,  9 Mar 2026 15:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VbHdA377";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EFA10E084;
 Sun,  8 Mar 2026 19:10:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hesM6H1Yqj5g50bjfqn5OctSM3FAfA1S1+nTE50O5Eui4nfx4NcmJ03tlmiuW0y4iIc3ap0ejVvWcYhsnMSnGu+AkH21u93EihgwOTWohQpQqq9G6zPvz34RgNsmr/5u5jSPx2ND1pR/0EHyBv5D6yA/0yzjnDBAf/SIYef+J0Wc5POXp9Saml35pHg/mZcQ7xKHZeGts6zIGG8FcJXwDKKOeh6LFWu6vSpPuaM4KoMsjSTZ2lmtQj+II5kAI7nr0q0xaUd4G6N207yLeYEGZt4D7tNIn7ruqCqA2Kj21L0af/gYHvGTmPZsIG7JaEeINp/NmXq1oosdhu2RxLiMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8CnBHuXN9K1MAdGD8VgVACEMXJi4m1AvA9p3LHQYtM=;
 b=CN10MeJppS/Vayq6e1i8YxzeLbVpyvkL1d8U4j1mRX30tV9j8eCKA4IHlTosUkCuOQTPcsWL0CFPs/DWjHdC1c5a4nAhKs+FOBi+Gs6tBKtjZ8yiWBG6yVvOSYjfyf733uOpAPGLOMEs5VRWNeZpUgVECgJU+s1eLEYtVAN/6/d/kM5s9cIRzfp8zVxP8yY6jS7zulX0wvpPH5NDegZJZfyjS3O36y1bxZ88pfrhmIwT8ww8gzm7xFfLWh2A0ql9AAJnR4z9AAlaQ1VbGmyfsUMYAkys6Fo4yx+EgdfVHBfibHRqfATGROWPM/M8OsdFb8R0jvJJZpEiPgbxhEcYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8CnBHuXN9K1MAdGD8VgVACEMXJi4m1AvA9p3LHQYtM=;
 b=VbHdA377aFKWfwGIjeknpX716kXmbRzg2p9CfhSQjkD2HO54U9WsyJolYK59qP+yCpcbAxKzGQQKKx4ormDtoZ4xaSYw5rz30E6Q1DY18VbfOZPIAYqVgyRzuE1d/phXJ6SXSrPjWM8eqGP5WNZM5TOyfhqM37tQe7UWdIKGO4XIUcuupNFytFRqpbky/nCn6/n+nfIIJMxof/B2f0k1bWQlTs5Jm9J9G9Bsde4D44lkDycDAJx1vH0xQQFZctC31qu+jJlo8sJwN+UlWHE0PDIiRbpLeTvIiVlcT7twT/UgsVDOQSewovaTEIUSg3wpsg2KVyAdtteZgYN3dRH+fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV2PR04MB11881.eurprd04.prod.outlook.com (2603:10a6:150:2f6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sun, 8 Mar
 2026 19:10:16 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 19:10:21 +0000
Date: Sun, 8 Mar 2026 21:10:17 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Joe Perches <joe@perches.com>
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
Subject: Re: [PATCH v2 phy-next 24/24] MAINTAINERS: add regexes for linux-phy
Message-ID: <20260308191017.kcyi7ka5pktq5jl4@skbuf>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
 <20260308114009.2546587-25-vladimir.oltean@nxp.com>
 <ca170cbaf2f8bcbc89bbda68914d8e0d7640f0e7.camel@perches.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca170cbaf2f8bcbc89bbda68914d8e0d7640f0e7.camel@perches.com>
X-ClientProxiedBy: VI1PR0102CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::20) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV2PR04MB11881:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e01e83-381d-4f45-12ef-08de7d465802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: z25QfSPjIo+DyxJ6qdPBzAXKKRn/FoHI4rRieVWqLa4IfTGd4gYkU/eFW42FL0nAFYSQQ9hqWieWsu8pAhKp0SatAmgQqDHep1pXCs5+hyBQquqUWNm6mNlaz+w0oTYpAVrkMeUnljoJFntVDhRaTvEqv826+I91Wk6jCIyYE7GxVw9BY3gV59WrLilefdEwKtgUSIlPucSiYUr5+N2o0VsliAP0udZElplIDUTPqJwjk6zsgT9L9J3OJT/1OxPfMh5tGuSajKcGr4EHEVM+SS0y++rj7mp7ff7WBh4f/hn9ASSmH9WKuV/k5W84qORhu5TNO+7Ml0vvptxoXC/KSzwDjp9ge0l4hG5U3HKCPndP+LO7GdXOzhnBKCWEPfrzouiKLzNDaQiM9iBvhvWU7zcFQ0HkwR1DhJEzphNH5B6fhgm7Hitm5LOs7igm7ztGwoRJGUW7oJC99UctRcm7X76ruVylPderojgAcAMnQsfLeLyZUc6ULQk1VL2Kp1v7N9pWch1/8fhzJEufyRlvlgQ1UeL/JFYE7vJ4PqkgL/c8E0MuPEDkYaMWBkt8pRL4p1446cTUTAdDxoGlccK9ESFH8j2BCgrxcFDPFKoJ2a+DS4ugdgXhTVSuKteZHCDMDcSiJACyGClAuvnDBHMnfdSYIBcfLfPN8mg3hAKx6esBbPXDEsIpZINdVmEUauAW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(10070799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GqLwlwgrjARG12jeUMKmP752m62y/9hfmqWtULNkgTZHyfNybRLZE3auChCo?=
 =?us-ascii?Q?VdhZ2TWywBDd57Y6f0XdPt6g1ZCq4CFoYI92mtyOaLgTCh27sucjB6YTVLT+?=
 =?us-ascii?Q?0mbl1mWJKsQPtHjGSyYCMCW3rim9OBsOoN8GQFZDQXcmMseK/vS47lDS55EI?=
 =?us-ascii?Q?C2c5Vz/xd9YRx4B93kJptYteE9NArMJBs/AdPJJQscE9uAGQwYI6DNcod5sb?=
 =?us-ascii?Q?9I7qgiXgvnio9iK8VlzS6XI5oVFFG5F2I39SdFUSuvKHNy+UfLAyhn7D3MIf?=
 =?us-ascii?Q?sxs+2FQo4lPVTKjlY9MdV26wak3yZqACGRahd3rj2koAGj+xiwDZHak1BFc2?=
 =?us-ascii?Q?fkBQbf/cy6NjU+V0NzpqrsVKeXU9k41+rzHYUKnK57nMYiCD1TOL9T7LsP0R?=
 =?us-ascii?Q?SgcBFzC37RlH/g377LtY5LeTZ99/h2HvIX3r0ed+n7VKgn3EKPl268ns1FKo?=
 =?us-ascii?Q?4IF3iv+WGvd+hDz4sTcUs7G4MyRm5Q5V8PPEefdD3K3GAa/HfVwoUx5fEPgF?=
 =?us-ascii?Q?zE7fRR5zFJU4qU+YEYhhltMuF9k5QNd2muEDi/n1ECh5MGLtR2ckYjPqj1ey?=
 =?us-ascii?Q?rf03XnGKquB6xNF4mQiEa0VZp63Z8VNt/CyeT+5a4quAO3dr91ocJhxFAlIj?=
 =?us-ascii?Q?Yqjq2MKvWFwMYX8TKcbjUCFdEyvY9ob86hukgyu156bfcS9xdyG2FRIN5L80?=
 =?us-ascii?Q?R6bWjD80V5M7t48H6ofE+K8Dsm5Wc9XiJh0EmpECf5Vr9mu85DL3WCn7F4V6?=
 =?us-ascii?Q?kD3aBXL2hQJo3P180hnGtl3oFc1UP1VVyhemlB2UX3iEOcFQW8Ws3q1YljtO?=
 =?us-ascii?Q?TxaexKGqOX2fsTBLPZ92m9Ua3OMRthWyiLYXNwwt7XdjVm6vtePpa0Nh2nS4?=
 =?us-ascii?Q?foJKFwTUFlFHBgWAgadWXxF4VuCz75oHvnFL/sH7bVxMt0eUZDgAtLIVXYDs?=
 =?us-ascii?Q?t4fDOO44x2EKeFtrBDCH1ZDDjs/7uVFMQ//GmwXpQk8aTK8lb1j4kJtfvy0a?=
 =?us-ascii?Q?zJ+375kfeyiH/dJXxUf7Q0jMSeKI2fDGalMy4o/+v05iP7YTZp4cnrO52bl5?=
 =?us-ascii?Q?tgV3fMmP/RBOZN5iRuQWbNc0xQKB1LN1xiK6BhgkrRO5Gy31yCKvfl/VoXJd?=
 =?us-ascii?Q?jWk86cZHShna25e80WtrhQx34StBGKd0iQURSfsJ+V3EiF3U5RxEjMaaHuLb?=
 =?us-ascii?Q?dY0RqjkdB1R/sbwEnUyVWt4KKraSCGfns6wpmuSYG/ZBraRC1Xn064UPVn4A?=
 =?us-ascii?Q?0IFxY2pBH0qQKQBF+xOlHnzwEilXkZ76lowoMSGQW4w3E8Cq/uG7djkjACBq?=
 =?us-ascii?Q?1pV5hMG65jwXbR/aZED4Bz4sCQHRnlr1VemGpJp4AXiGrQMZd5XFo6Ae5kWu?=
 =?us-ascii?Q?rEBrZI5G2H9gujgFAW24/fFBeKg8NfmBNBg/k6A09PIVtf9DvlVN6DDSPDeV?=
 =?us-ascii?Q?qFALSN7Ia8vnARo8bnMTeI63Dh3i3xDsJJhHpt7LMzdO4TRoKs1czemJCYZA?=
 =?us-ascii?Q?pRmLB7ViwZ0DmbLIKtKga64RYd9oQ7iT/sYHxTU7d0qgihFqrctiGOofaNkU?=
 =?us-ascii?Q?aNrFAkgNEMeSE6GQ8u3N1L5YnPvI+cUyAotLRseXcw0DnNL68i+I53m/OCNE?=
 =?us-ascii?Q?ue3d8wXIPt8AqZhF56ViDmXN39MqkkbH1PyJqbb52HJKbxdOlKCdFF8wrgFo?=
 =?us-ascii?Q?Ydi2TvZKcue8vZJCpw8qADPSIEIOFh35fgwlvJt3wtcR6aQmNCzMpuEgutte?=
 =?us-ascii?Q?DrVxCerV85xJfg31sbGkxGvN8+ZPh1EoCGMH/7fwk+Y6jdSzMmOuguzB5vG1?=
X-MS-Exchange-AntiSpam-MessageData-1: ZLYOAakTcd+HomcZtq3ZWx1UYpnBr6PPyHM=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e01e83-381d-4f45-12ef-08de7d465802
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 19:10:21.2616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yor39mQ281Q5+tsgNOnS9BZ9otpsrtq0EhtRuSLpR9HbftNP1vDGR4OVb0bFA5BT6uOyvqfcz6OsTqK0yLr9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11881
X-Mailman-Approved-At: Mon, 09 Mar 2026 15:50:13 +0000
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
X-Rspamd-Queue-Id: 6DB0423C0FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.920];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 11:40:44AM -0700, Joe Perches wrote:
> On Sun, 2026-03-08 at 13:40 +0200, vladimir.oltean@nxp.com wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> []
> > @@ -10713,6 +10713,17 @@ F:	Documentation/devicetree/bindings/phy/
> > +K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> 
> phy-props.h and phy-provider.h don't seem to exist.
> Are these going to be added later?

They're actually provided by patch 13/24:
https://lore.kernel.org/linux-phy/20260308114009.2546587-13-vladimir.oltean@nxp.com/T/#u
./include/linux/phy/phy-props.h
./drivers/phy/phy-provider.h

> Maybe this should be phy-common-props.h ?

No, that's unrelated.

> Perhaps if matching only the include uses:
> (/ is escaped because get_maintainer is stupid)
> something like:
> 
> K:	include\s*\<linux\/phy\/phy(?:-common-props|-provider)?\.h\>

Why is get_maintainer stupid? I ran git format-patch -1 0fc83bd79589b
(random patch which includes <linux/phy/phy.h> and I got:

GENERIC PHY FRAMEWORK status: Supported:Keyword:(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
GENERIC PHY FRAMEWORK status: Supported:Keyword:\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
GENERIC PHY FRAMEWORK status: Supported:Keyword:\bphy_(?:init|exit|power_(?:on|off))\b
GENERIC PHY FRAMEWORK status: Supported:Keyword:\bphy_(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
GENERIC PHY FRAMEWORK status: Supported:Keyword:\bstruct\s+phy(?:_ops|_attrs|_lookup|_provider)?\b

which seems to be OK, it matched the (?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h) regex.
