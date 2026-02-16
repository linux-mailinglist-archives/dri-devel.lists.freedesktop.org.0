Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EmsnAzN7k2ko5wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:16:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF7147658
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FA710E0D7;
	Mon, 16 Feb 2026 20:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iUDnseMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013042.outbound.protection.outlook.com [52.101.72.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA51910E0BE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 20:16:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cd89T8cmzv7cYeFYmAD5WFgRe+aoB0u8sJyeR89vGSfUZOVWJkmPBnuI1FzFrRP6AMq3g3FfCxiZrZ15tQJeRxSyqIfMoa4uzoltLBAXIzll9qVoafMVhqrNZIb5sj820inLLPzufeU5+ag+yDoIlYXAKP0EPcyGiuC8tRwGtOGrjPspCaXkxTnTBsEsMeSX8BVy7vTii/0LMjGGbuMOmUilabf/HEar6auY1dKVKBbX1BZGb3tZKkRqVAOt4na0Hvzdl6ad73O4bVibYwsnnXXpT+uK/cJ0/K7aVt9x5VA9NurQu451xXpAl8FwQXH31+lpLGOSv/skmpdRSqrDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWzui092eYVBj2PECYki/C0Jb9kQrYFfkOW2QqTKCMc=;
 b=NcwsHBlADsDgki8ml+zrMRiWIoHKajNkHucVS5QSYwxqxzMUyidI79lHBPUn3LhV2CCrg8tpOwPZXhmGJ8GCYV3UL++F2v74fR9uodvWXgV2ZPLD1ioaOyOb8XlxmfvF6q6HTbRVwzKpye+L5gajqPiq7ckL0vNy/NYXNIWo5dGL+JIP1qQIM2cVD+NH7d7IUbEAchoUxDZL4BMAA3fs/RGlUkTNI6tGG2vL9GWImFavDu15F9tBZL4CWMai7+11QQiiOKxWKBZ1CixJGSPSXh413bzeUN23oSQssyxjTMvyJlmuswyYO9ZrfVR+Y+V2IKmyk67ATvIV6wPtat9n9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWzui092eYVBj2PECYki/C0Jb9kQrYFfkOW2QqTKCMc=;
 b=iUDnseMZ2aZSQuN7mcBtQtk9Ea0jWqby8IbDO/e+98gnGfDVXMOITBh2cDZLZRuRLtffSUeNf5ROCFvC/HFYsPHcmDJXcvwTm8YfmE2MtPocmqnzUwXtM5Mh1+uaPKiP4TbQdXBDNEvQVD7XPsiA1y8DKBPmsk1YBcmT7IN4WBdwPtkVeXYJEIWqcWPxkQDNkArBXnVvycPHyv6Zgb9xd8bGm72JvUZYQ9YPKX4VrfQWAOFTxeHogQOs0OC7J7sVOsA5RTTz4LZpg/vlTITnT0JKVZ8lyObF2jtKzdS/8eTDsYjwf09C/NM5KvBbw67M2dogv7JIQh4NJik5iMZhjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7429.eurprd04.prod.outlook.com (2603:10a6:10:1a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 20:16:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 20:16:40 +0000
Date: Mon, 16 Feb 2026 15:16:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com,
 cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com,
 aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com,
 jkangas@redhat.com, Radu Pirea <radu-nicolae.pirea@nxp.com>
Subject: Re: [PATCH 01/13] serial: linflexuart: Fix locking in set_termios
Message-ID: <aZN7Hx_aK4ta1ksL@lizhi-Precision-Tower-5810>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-2-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216150205.212318-2-larisa.grigore@oss.nxp.com>
X-ClientProxiedBy: PH2PEPF0000384F.namprd17.prod.outlook.com
 (2603:10b6:518:1::71) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd632c9-dc69-4a45-5377-08de6d984bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|376014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jLEWiG5jRzRBnt4GR3egLdtwxGLvorvq0lscRUJBufgyJUZkN61uavDy2s2L?=
 =?us-ascii?Q?iQrraocGcXQclb9PutfV7K8rln2MEY9oH1kzwN/Rw72g6HhN/2PtQe3dXBcs?=
 =?us-ascii?Q?y1X4dEYcPcRkp76i0aj7X051Ox0feE0I4BR7s+ft5fVS4MuClr7ME0h6gmws?=
 =?us-ascii?Q?57OszgahTnTm1tBGS19ACI2g/kqoAh1E1kAulnmuBiV0O6qt/GeoKcisf+8e?=
 =?us-ascii?Q?iLb2Z2OLEtxZeAeHYNqgcOaAf5ELJ1Y/sNt0VLHW8rMzMfHySOPZQdL9uMgL?=
 =?us-ascii?Q?WV+1OLAE+Q1vRDSKs3y9FLE/aOIXg9umHzIxGAyljdLoafFyy6cm2Cs3DA5z?=
 =?us-ascii?Q?dFzDqX1CT5mfwr+XhY+86c1ijRmANxxdtYpi79mOg8tz8Mo741b2dwNeuiE1?=
 =?us-ascii?Q?RXpw3+sYBBv20Ox6gkqOzyZ0U3pTidIULOFdVMcvpLYbU/kqNCRLebOy2391?=
 =?us-ascii?Q?+9LKmwqxSDPU18FWLx/VoPADZw9prtGiacCoeLyO16IXetds80aUv6WWwOF7?=
 =?us-ascii?Q?e4HjqWsfy4hCMkvMCpuCN2IMdPB4oYrq1KnZKUwwAMiq2jysgspacRdqBwFy?=
 =?us-ascii?Q?FZEZ8AkKZm9NmTi06G39hhaaCQAv33aJUqM4RvJaFBbWVuYPyxzz+mQN/Mw9?=
 =?us-ascii?Q?vtJmxU5Nf3UzqQfcwMk2TU3Cj//4m0trn5CKL2EmEXjdPnaKsDnbIs/rhLS6?=
 =?us-ascii?Q?xWFru6lbB9OfI/cV2E2u59tXZ9ih8wwsV27M6XGsjSJchSx1IUATLbwEkIWt?=
 =?us-ascii?Q?UVY8CCTa9INNYtc3+om8gSXo3h9JGrcZZMI564SJlPCt0+NRXtd0th3idO9g?=
 =?us-ascii?Q?Fzctou4kH8jjnboUxUEaNWM+DhQgmS4g2i5mjP+3By5Q6ZGx5wmpJIiuP5Ue?=
 =?us-ascii?Q?sLvb2DFF7XLhJTUCk+dXaERlh1DD6FQPAj9/I44aecRQrHXyjuXQinjDIlPJ?=
 =?us-ascii?Q?g+Vx6c7ta8AA7oWc6cKozxsMBFIGIVqDqeQz2h3lyRus5UxNtmOFN1k3rRaU?=
 =?us-ascii?Q?bD9WROno25SNaoThJWFhw1ZtzjdiW0tlf9vNFs5DGuf3F1WzHggkV/yF0wU9?=
 =?us-ascii?Q?hKv1KMgZIwrDxYwU0XxijHJHdzqKYRTO2R442ayXlQ+dViLW6VSwFMI2RGgw?=
 =?us-ascii?Q?w8aV6h85VGB4VXG/IXE9QsBzagl54P+xTkNm2U78fT+Fz5SBykx1lI55wOG9?=
 =?us-ascii?Q?yf0kUErxjlL4SLL2S1Ii//bQ3jOxKj3I+OYb4bI8Ju+WwWB00JSUcbM7TB/8?=
 =?us-ascii?Q?K03x/SqfHdV0VqBQeu12DaV/ZqixNH78TmgwFHYz1kDpvfuLb7k7XzW288C5?=
 =?us-ascii?Q?Bq64uUQhLl+sOTR5HYtw+uQvqA23/LZNNYECnFplmyPLpffBhznTTWj41vHl?=
 =?us-ascii?Q?0u+EAfDrcdJXPu7oi1OIwv2GWWzFqM6KvozzD5h8Q27ZVT9Nt0vPfeASBhdk?=
 =?us-ascii?Q?X7K2Wlsk6BTBqlbdfCAdNVyfR58j8KOyDQmoKLwtr6xVMNBdRDKDPrEwoAld?=
 =?us-ascii?Q?sZwjVn+7SDEQhmUyILg8nDgh+XldgiU6W+U4i8zaTIaua0MeGXd4xNV1zwYb?=
 =?us-ascii?Q?Hrbg3CfeWJDHAlfs+L3LWxW8Iq4njFLbzCk+kiDW8PmsFDGYLp8Yy8eJdMz9?=
 =?us-ascii?Q?vvNw8+bgf4qrjGclP7aBDL4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r/LBheWFx6CKZ/g165q2tZ47U+Qc5Z471zRBwNwIPbJIOkzAHqDbuT5maxWT?=
 =?us-ascii?Q?V4NgetmJ4K3vBwikeoh7JDayP71qfhSbpCZ5tXyPvIZyqMG49BwbnrmZCdWI?=
 =?us-ascii?Q?1GTVS0sReScJkiQ/ukiTslNKzi8Y8cr8wrCp8hEl7vDyKEAUihI1+KXdjNQn?=
 =?us-ascii?Q?SyOBo2lencqZqlc2eD96/ASNnSRgmkJvXLkmEique+mH4H0HGWCyiG+Y8O8a?=
 =?us-ascii?Q?cn/s4hdoVTWFC53gEQVqh8xMInTvvLC04rwA4iPg45wKU/wEIWYTOAct5s8z?=
 =?us-ascii?Q?HFPhiGMBxILt3w9bvgfGAFSHL+SuhOeKl/bzmg5UeqqZuujFn3fzYddwKeIy?=
 =?us-ascii?Q?+xlvWsB80LkxmHr5lLGUvdB03cDnenY0/R8ChHt8UMu4aELWMgqF8/QaKTtA?=
 =?us-ascii?Q?cAuc9GyQ7TVmEAvbCPO+QZGl/EFsGoYkbk6Nz1jQn+NGYmVMkr1RerF2Hoz+?=
 =?us-ascii?Q?dwHsn3GQYNttTuveYg3/8+KHKP2r/5WTPS9CUSUgGxmsdXrwreMONAaOLpsf?=
 =?us-ascii?Q?vl0DpAglOJo6D5MwRrSdEjsoXmpBPIIKwj5RNYbGcotXwyzqw2g2ABAHVX8K?=
 =?us-ascii?Q?rA0nBSuljM9C7FM1ijZfJjT1ceB3hmnMVP2oifAa8CEMQBHXOM3VmqaOeUf/?=
 =?us-ascii?Q?lVXIeOQGow8SFVWLU8rtXtJJ+6UNOqf//0hgYTP5G8klJobvaFBzHmwmNXIX?=
 =?us-ascii?Q?lDqww2XJHd7tMfZzuqInsJPYc/tsOR3zmqci7R6kI2KhA8ufiKU9d3ZZ9MZA?=
 =?us-ascii?Q?0it2Zq1e/UPqkzYU/mRVpCCzh/k1wJce4zVY2qzJxKhQ45us+YG+Et1W9mVV?=
 =?us-ascii?Q?SEV00WwZ6eApbnuZUIfudLe/ek2Ij8Nho/jgOnmTvMIEupNfhucI3zMMktIR?=
 =?us-ascii?Q?G4c2ylJYSNfz21tXtLt85jjqcmYiTlu7XY8m0mB+0j6oJby3nVL5Br0K2+XI?=
 =?us-ascii?Q?qe+XqBOaKj/w/DBpkr75e9MsA0I/VT/irCiEfEasNh8YNiMxfIty5fQAA46z?=
 =?us-ascii?Q?u867ZuCQcv+837YkMnCZCEzRvlcnmxE6GwquaXynnREl9jVecwO67mjBHd0M?=
 =?us-ascii?Q?JQ7UWnEpk8qdCxNfgA83lcXc5XQ7+RtalhRIojTdBg6iON7x8Bkuiiz+VVHu?=
 =?us-ascii?Q?aCtgGqdLi7o3fVlqyPqmcHt0R9ANjR4+3u/TQEoaEpOVltcAzu+zq4rNqVhZ?=
 =?us-ascii?Q?jWmHUkkNVNoJMkzx2Fhx/I8O9Q9FrbszFrEIJbHJyOrI6KUywz30vdG7uRWx?=
 =?us-ascii?Q?/rQJkpZEfgZG5Gnh9Mu98N80QA8m5vQ+qjgwvmnk13n0hs+HSsa0yyzaya/P?=
 =?us-ascii?Q?OowuaVNjcyppTQdtpEk20UL2K6J2CtFBP6IJr+LpOERyt5Sn26dJJFhEkC9T?=
 =?us-ascii?Q?4cYcgZQD1+T6+t2DBGWldxukaqPTt65RG0JPY5adQN2vNRnBUqMQBjOVCQNt?=
 =?us-ascii?Q?GursOg6M65OTDbHqyzMSLCXMSkLGOAxQNQ94kPBj8RfmU+LgTX2zkc8qNVNd?=
 =?us-ascii?Q?4bRtFExU54LkxzfeGe0ETihX5paQ4JclxhAWUaG+eS8ncZBsS+1i+s+4aKaI?=
 =?us-ascii?Q?ovDZpe0tK73kflFyYfNIroUkQrIIIYlMbpDcUgZEnQ/GwBsrSJrPGgaJEtiK?=
 =?us-ascii?Q?7zIn3FWbZ7MqGhsuE7gcfjJmlHEezwcDjJaz47EJcPpeIM8AKXTa6oy+PLFX?=
 =?us-ascii?Q?tuoXzCqFzBqnGKtS9yLly1FCTb3wdok55RI4Rz7mqNsnEkd/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd632c9-dc69-4a45-5377-08de6d984bbd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 20:16:40.8273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O69q27S4LzP1clvrROrpJRuUu/dc2A6m+uZudNWiytk108O1O5sL8ir+sOtPGadSLKWoox1mf/+1k+rS/ekPDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7429
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
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:larisa.grigore@oss.nxp.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,redhat.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 35CF7147658
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 04:01:53PM +0100, Larisa Grigore wrote:
> From: Radu Pirea <radu-nicolae.pirea@nxp.com>
>
> Take the port->lock when set_termios is called, otherwise if characters
> are sent while IP is in init mode, the IP will hang in an uncertain
> state.

According to patch, you move it before read(UARTCR). can explain why hang?

Frank
>
> Fixes: 09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234")
> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> ---
>  drivers/tty/serial/fsl_linflexuart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
> index e70a56de1fce..5a410e2d56ac 100644
> --- a/drivers/tty/serial/fsl_linflexuart.c
> +++ b/drivers/tty/serial/fsl_linflexuart.c
> @@ -407,6 +407,8 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
>  	unsigned long cr, old_cr, cr1;
>  	unsigned int old_csize = old ? old->c_cflag & CSIZE : CS8;
>
> +	uart_port_lock_irqsave(port, &flags);
> +
>  	cr = readl(port->membase + UARTCR);
>  	old_cr = cr;
>
> @@ -475,8 +477,6 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
>  		cr &= ~LINFLEXD_UARTCR_PCE;
>  	}
>
> -	uart_port_lock_irqsave(port, &flags);
> -
>  	port->read_status_mask = 0;
>
>  	if (termios->c_iflag & INPCK)
> --
> 2.47.0
>
