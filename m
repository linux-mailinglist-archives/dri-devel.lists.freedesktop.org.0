Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E2AB2E51E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 20:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D5510E7CB;
	Wed, 20 Aug 2025 18:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="NeGOE3b0";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="kKzPkAUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E2510E13D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 15:46:33 +0000 (UTC)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K19d6W018860;
 Wed, 20 Aug 2025 08:24:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 h6iv8UygnuLgWbWQZVo93SGtrFDogvtAIBqK4obhnT4=; b=NeGOE3b0zGGh65Kk
 YmXNX3T+Yr+fdXnbH2ZSWBdRgYqtHzwTF7UlX7coyEZw9+66fUJ+jCYKLdgVREbP
 sh2gFEaCmCR63XLcVwcuX+LqKXPqEr4oQ8DDSG4em6cr7vLj5R+Z636PZebEgA5y
 OeP/BFzkdgWD7XpEjbq5ntjeCgIDdy5yZ2f+KWI0assg7nkMaW897FjG7UR158bD
 lEUU6IbkX+AqAitWoyS6/gVubpCVwhKbB/p7Z7kAZrHQojGOtR3prHYGLPBMblD+
 AAnyDX6YMrTrFfyVEGkDSmczLV1bcciwRJ/3TChFKx/vfkkxIqCpvgMNsKVid6/D
 /vWvxQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 48n3c4hyfn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Aug 2025 08:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN/X9lJOwFBexkqDOYTpbMrXU2AP/L+DQMvgLKT6oh06dU0hWl7Ez+4/PLAriEokfem8SBcIk+7S8UAlbEMxNBC0m6UrmzN3wK+UEH6b/R94A/B+LRHv5OCqwfPiwDXHS3/HQwxLpqHMxX9gVFVZ1CBqIQvRYBa3kHchaU/4wXKC4xOBCE27J1yg1GD1H649JlBCyzcBd1rfASzHTHhe7lx4RyQB2m1f7/Foqc0z8J9SoG/b/Q3rmRX/nFmY36c/RM05GPlfaJnKRmTx6s5m0I93TatrzxhN1GaS/Bjan57UmvjRFZgULf11TMt9PsleJ8dA9ScJZjMjryVFPuMpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6iv8UygnuLgWbWQZVo93SGtrFDogvtAIBqK4obhnT4=;
 b=Gwdp260TUfawMrmqjvx91KNMrLFHm2AfTPPJ+gE0lYpsqswi7kCWBsp0WCdUCLu43PEnN02oWjkrRx8WOgKrq+ces4IRpspgraXlouhTn5rnupfjcAKFDoDAR0XDtNR2uVeq0UtJQtnssPrErz8dWKu0mAwuNeYTT2m4v394pKy/u4K+LwGXlKgdNrEGnsG2fJJeldpahM323L5D+CPKh/1mgZ2F7DSwVFNNsutB0/t11pl1iNBlOB90cA0h+6Ieli6/7QBzwmsY/TY1JDzxho6gYNSrHQhQLHEWw4og4fVlL4cET2/OoHN30jBZwWXcXDx3mRj+NdF+GP0/z0ynPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6iv8UygnuLgWbWQZVo93SGtrFDogvtAIBqK4obhnT4=;
 b=kKzPkAUticr1g4tHe2Gdm40z5iMWti8mdi5yDSWS4hXzpAfnWLHGAp7Wd0t/oUqHZIEw+CV6nPuI8QQhhox6eA0MJYnkbZS4xiq9ah+PxzRpJgUncEJ+E5tf2DFnCRNxg/MynnQYWZ8sFyqmKP267gh/zvPjN5qJ5+5Cefy2Ke8=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by PH8PR17MB6810.namprd17.prod.outlook.com (2603:10b6:510:23b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 15:24:24 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 15:24:24 +0000
From: John Ripple <john.ripple@keysight.com>
To: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, John Ripple <john.ripple@keysight.com>
Subject: [PATCH 2/2] drm/bridge: ti-sn65dsi86: break probe dependency loop
Date: Wed, 20 Aug 2025 09:24:07 -0600
Message-ID: <20250820152407.2788495-2-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250820152407.2788495-1-john.ripple@keysight.com>
References: <20250820152407.2788495-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0097.namprd15.prod.outlook.com
 (2603:10b6:930:7::19) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|PH8PR17MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 63584d21-84bd-439a-515a-08dddffda4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q7Jf7jdu1KvPGp+8PRSzdn01aBGm+HWnNX8neQHV+vXOFy+RS1Ocy1AoO1Ou?=
 =?us-ascii?Q?/lyKOmyuq3FlbHw/2OuOQWkYwcXfPZJmV1E6mIANUYGOixq+Mxp66WlCrZun?=
 =?us-ascii?Q?LolqXmebHHxQoc8u/dMDFNKogdBbNerxcZx52mmlV8IOtBkk7okFYpa37FsH?=
 =?us-ascii?Q?unHF2PCg1gFcI0r95EikdwsEEButEh9pREVGuG9J7crIuRZeC9YZcez1nL0J?=
 =?us-ascii?Q?xnNUa6cM2pq4Bn1U+8GXP+1gBzuRLG2g41KTiY9BFHqbUmM2p63+eMFYzTJe?=
 =?us-ascii?Q?MfmkjkBlpr1jHOSY6CYaDYDVkCPTpl+Ex9abIYKZcxw5K3OsmjYn1wq7PkMC?=
 =?us-ascii?Q?+2hR7QDcOV52c9w6Ehkr+T9Fc0hol1CwDDCOu5Sw43UiwZLdIR8RmvKiscSd?=
 =?us-ascii?Q?H7G8EcUq1U6goNPLkqWxoHScgxcPwgk3sRKvutfQByjwEqMgB9yecnVQgAOQ?=
 =?us-ascii?Q?7BYyl4KJXxloU/F7+42RRLa/bnrgNyQ0FvjFDIi7WrGNL1LlommNZ6cEV3rm?=
 =?us-ascii?Q?bYd5l5FThD6Lgf7w2d0rba4YEc+nH4lgKDpAR3PVU96+A3DUIVJJ/aGh8JKs?=
 =?us-ascii?Q?8gAjGCLlXI9W3FRaf9r0pgKNq0TWMVcQNGBoFTTm20wcTPJS7RNXdFI5LGUa?=
 =?us-ascii?Q?DMVIcCMXGt414rSlguvbBvUrscyZJLS12+Vzyb4axqM4WkIJ3fXDa6/wyOgW?=
 =?us-ascii?Q?GJr5/4ODSiDh6oH33UWzHkgABBSMSZJaXwOA2w9pyJLtuLE1uehevo+Sodq2?=
 =?us-ascii?Q?CApnm4rPFN9ZRJYEc/lckVWISlaXI3dyhAckAN4SvE89tw2MWD9eIWIw/YOr?=
 =?us-ascii?Q?OpwPWu9bsnFY63Sq8L0IG5eGLQJ0Hd7SjfLNc1stwtCAMs1+UqsiMIx3wrRy?=
 =?us-ascii?Q?d2VT0+VSOaOlMVPcwMKCEu5PmMYdScqgPHsFpk72yRXQfXZmVFk9QZw4mi90?=
 =?us-ascii?Q?SDayQptJwBW7vdtQQx+yY1+PKES/6Ip++MUB+ogj6qLSxw7KYvzJgW5fWOtn?=
 =?us-ascii?Q?tKj6EUAAM/g9AziooM2+VUaENH8zSE9GUtZqSOksBoe4dWFo/PkteUjz3pGH?=
 =?us-ascii?Q?9nYw2jQ2L3ym+ETmWdaJFKOGOC8eIaBK+7g2hYu9Ezvaz1pyanKYOx7P5p8a?=
 =?us-ascii?Q?h/NOOyEvzloBSJk8NpkJZGVN5fAQj9JAcwlwGN4jz/rmufj6mvJx9ftkQ0Xu?=
 =?us-ascii?Q?Av+v8bSX7/nCbf4MtGfH/7O/+xhogcCgW9JuTTmAuL6RAv5/61mbtfkcHRDI?=
 =?us-ascii?Q?P34cuFDN0bnGPkPeUZorsbkzDM/+ffKu+zCDQOzAMCrUt027/u8h1oB3mJw4?=
 =?us-ascii?Q?UF1SYB31qjzylxpScwu8TK75FFX5IyLQbwregjDO2mmG4a/+4u5gcyMyXvLt?=
 =?us-ascii?Q?zFrFJlXOrCdjle8e4TIB/yRGV1wV6FlbQtC8Ud7Ttp3Kovfbv+EZEAqDixLs?=
 =?us-ascii?Q?hg2bNfRQfoQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jeWCCfVSGc34Sckw3VrYOkdb2vrIyeUXihr6TS70BWGaLFogoN+Q4c11UA+V?=
 =?us-ascii?Q?Yu5vp8Id2sojMBdH34mO4WTPwklKPvQCZsUalUWk2T8HTCHBq48Gs41s8ZUb?=
 =?us-ascii?Q?NcudDUcQSti4vH5EQTsJK/mCk+XjNzDntIaX7esd4c5GoQ/L0VwowJKashW8?=
 =?us-ascii?Q?/SqlsROGsEoBsrmfU6BRzbz/c5T219aqMiFqS3s0pkKAHj86CFfGPNHLeMUv?=
 =?us-ascii?Q?RxGI+l10QzZng/KVU6qNsqH0/Fe3b2gStpuTwndhbDCCnyumBBIpZzY10dfz?=
 =?us-ascii?Q?oWxNHjpyHHhyH3H+AxNMDrgLWsx9u53aqKsAdnPWAdZ+gbkmI8jpwyTHm7T0?=
 =?us-ascii?Q?GyKKBm9qvKVGYwN82g1RGYII7KxVHyvWqBmIIkWhsZOqV1AuY+05hZR1TkA/?=
 =?us-ascii?Q?66BNSq+c36jHdqfNzTkVaNHMDDUf4cKT+fJm7hVP74wUtXlWsCV91NZikmBb?=
 =?us-ascii?Q?kk98r+8mVA9XXlThxbtWYFigxh/hhBDUyAma8nAq2uPDX6c5dBHxxyjlWqZO?=
 =?us-ascii?Q?bvH9rlRz4Xb96sHHwF6WswWjI4SymbG3kQSvLnEHvMkx+eCvhRagk6LKv2D5?=
 =?us-ascii?Q?V4MRXK3Aq67cojG/C8pR+2iETqoItCS6s8qdK2PFRtJ7qwD4xDDNightLa2/?=
 =?us-ascii?Q?GDJ+46+HbSOBl3u1ckyZOowlcpXzAhC98Tr2X5fsYE0+0yGDMy0o666qsB6T?=
 =?us-ascii?Q?3qfiXg9mLfhI3/A6wkZ5Xsx82wpF97fqJK6peq5V7XehXp6TEeZwE84ZvOAU?=
 =?us-ascii?Q?QBVkBx4K1O2cKprJ6K78lqZv/0eoYRRxswbShgRzTJx48H1ssg+tbvDktsGv?=
 =?us-ascii?Q?tjR78ind18t850niARAJGwy8ysyT29wjAPq1WRhC8IP3DU0V/Ub03u3XGbFi?=
 =?us-ascii?Q?nJ98NtvMhB9+isymLcfWyD3EN+f6qeocURKQpfL1Bw/aipWRqq+i04TMH4zg?=
 =?us-ascii?Q?1StswDa/HNsvJj0p7vVsTzpKqNs6cVZo4SSz7Vixv9Ugv49Ahy5dXPogrI5B?=
 =?us-ascii?Q?rKVqjkMgzhqUX6sL8SaRsAcl29GjA2wAephOvuDzIsRkBt+qOGptODCEG4fT?=
 =?us-ascii?Q?a0ItLFcbmfVbodgy28HhPfTDAzjqcHnqIdjhrE3gbXqkeSlUdSQBGOjvrWzv?=
 =?us-ascii?Q?lJeB+wf7vFaobMSN+pkALB+71uSPRYNhb+XKXPLkD0cLa5ZBb9/25HyZhfEP?=
 =?us-ascii?Q?3ahQBHv63POjX5l7lsQWStM1qSplgVxtYLeaGIyvp7pRHxHcbxP7onO47Dl5?=
 =?us-ascii?Q?+YctBJcEv2fc6Fdcpcg+J04EkYve5RV9Akn8UfGjhrYAPta9I5Yj7F8UIzCh?=
 =?us-ascii?Q?sXKUUOeMcds/5fgiSKot+kgoR4b6mnTw/xJWyLw2MdEChGbcmQ1066kdtlJ+?=
 =?us-ascii?Q?g1NCRi9NTXlPhqSRXd62pbl5IkMArBZ7wY68uoY8FGnBt2B3Baynx0TtzYts?=
 =?us-ascii?Q?PcnFXVURYpDqTQakfpcmpKThKfkp4trcGUUpDNqH9iLp4l1qahp96o/foc+h?=
 =?us-ascii?Q?zZo+1YyyrDSPV4p1ueCGlX+kuSszd5QBOR6Ni7VSzUS3LBVCOa5K8dPZ+TWe?=
 =?us-ascii?Q?Uf0TpXeMGpNnMKtILdighyEuXrbDxMJ8IWCzGT1WwtUX8Ro9tOwNELeoPrLM?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Rmg/ZJrDpKzIHbOBdwCLbgQ4A/X9z71XT/d6IQlN+ZkCdlR9STb0chmtDyM6sfWWO1rlIi5qJpTjIkpEKzLMV7BW81CBs6K1RMWza0vaoXfnVrfWzBIhusLpKiE3VOIPphjGkHLcgx/4Blzbq3Mxu9uccAPv0zBiGFOMUh1kAPl2TfX80ln+v2mlxsAZecFl9C1sdggUY08CW+Jig1Y+hl7ir8lcHz7pozNhpS7Iuq7MiIDJiuAnorIgYBnJ4wSkXc5iByiawGt4bqAP5E1befEFqQkfMqz1nt8PCiz9IgWHoAr7GHaKIZnGlzWDbZUOvd81dXIsWPwM6LELNIC5uRuaKVXzqrYMJUuY9SZARNvznMba7MzBahRnmHTwl6FaUs0zLksfPMpiYuVHuaKJev1k86Lpe9cXInCT4q1FiaUZc0UlVslN1gI085T+RZ7txhh4HZF50+cre6dw8FgoWh0/ihHv3jnHgAHO8KTAH3BAj3eBkNssAZfh62w/FxxDtCJlDLncjtyC1PX36FI5Z30jxjO+di5oLFep9Ghf4kHLhaou6YDDwFKR9GMrMXIp+Z4hM3woj3h0O2H5rqTIYf5uo566Ypzuk2038TpO09MUEbUnJAJTQUOw78EZtTZd
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63584d21-84bd-439a-515a-08dddffda4dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 15:24:24.4231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55nEBoxiwJYrhnKt77JtzwIvOZpc0A1k42V80BeEVpuR4D7muzgfrc6qiXUL2sXTs/SGVrhQclquomaifaL+yAcFCBkPCENmu0jmg9gWX6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR17MB6810
X-Authority-Analysis: v=2.4 cv=EoyLbScA c=1 sm=1 tr=0 ts=68a5e8b3 cx=c_pps
 a=+wTz3zXVXQH4ZUjsIrltNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=vu2TTH8h0NUA:10 a=F6MVbVVLAAAA:8
 a=6f5zNMVFbdseIpmfuNgA:9 a=6mxfPxaA-CAxv1z-Kq-J:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: _fdoLb1pxbVBLXckUPTEdgkZeUIUzULa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDIyMyBTYWx0ZWRfXxEHCuOQKhpK+
 aCULG7+58q8ItQNHt9QxNPi1Fm9jhD94bWbUFYiiMkEK987LKPdoFKDUDRmvcPx/XFly6mdVk7t
 PpzF/2mruKJFdlV4tcAPaDrwmZWCiMxiT2yhtaaPzFQ/4Z1H3wEB+wTLWIw/L9KYsUGWCkP0p/H
 cuiwlbtu03XqYn4Ocq2mxGLzcvEwL1WN6URumz0tw6Cwk5LD4Ii6sdFHcvuFwjQuVX5eTg82zQj
 dkob03U5gabMLZxnAHm3WJrnoZ24Fh1yEPgBEHJuHKw07wk9JMhPql3GYpPxJN7PkGLUeVayayO
 BEfxESPm+yqhlRqCuRXTCu/C/FVQRSFRSPRN2fwGozogQpn549IK2Lak5UwgWbYWSpunXxBXVbS
 KXhm+njF9FaOC/rAmBFaMOBvPXkhqA==
X-Proofpoint-ORIG-GUID: _fdoLb1pxbVBLXckUPTEdgkZeUIUzULa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190223
X-Mailman-Approved-At: Wed, 20 Aug 2025 18:39:50 +0000
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

The commit c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our
DSI device at probe") was intended to prevent probe ordering issues and
created the ti_sn_attach_host function.

In practice, I found the following when using the nwl-dsi driver:
 - ti_sn_bridge_probe happens and it adds the i2c bridge. Then
   ti_sn_attach_host runs (in the ti_sn_bridge_probe function) and fails to
   find the dsi host which then returns to ti_sn_bridge_probe and removes
   the i2c bridge because of the failure.
 - The nwl_dsi_probe then runs and adds dsi host to the host list and then
   looks for the i2c bridge, which is now gone, so it fails. This loop
   continues for the entire boot sequence.

Looking at the other drivers (like simple-bridge.c) they end the probe
function after attaching the bridge with no option to remove the bridge in
the probe. Moving the ti_sn_attach_host to the ti_sn_bridge_attach function
follows the format of other drivers and ensures the i2c bridge won't be
removed while probing is still occurring fixing the dependency loop.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 75f9be347b41..58dfb0f39cea 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -815,6 +815,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int ret;
+	struct auxiliary_device *adev = pdata->bridge_aux;
 
 	pdata->aux.drm_dev = bridge->dev;
 	ret = drm_dp_aux_register(&pdata->aux);
@@ -823,6 +824,12 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
+	ret = ti_sn_attach_host(adev, pdata);
+	if (ret) {
+		dev_err_probe(&adev->dev, ret, "failed to attach dsi host\n");
+		goto err_remove_bridge;
+	}
+
 	/*
 	 * Attach the next bridge.
 	 * We never want the next bridge to *also* create a connector.
@@ -849,6 +856,9 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 err_initted_aux:
 	drm_dp_aux_unregister(&pdata->aux);
 	return ret;
+err_remove_bridge:
+	drm_bridge_remove(&pdata->bridge);
+	return ret;
 }
 
 static void ti_sn_bridge_detach(struct drm_bridge *bridge)
@@ -1574,17 +1584,7 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 
 	drm_bridge_add(&pdata->bridge);
 
-	ret = ti_sn_attach_host(adev, pdata);
-	if (ret) {
-		dev_err_probe(&adev->dev, ret, "failed to attach dsi host\n");
-		goto err_remove_bridge;
-	}
-
 	return 0;
-
-err_remove_bridge:
-	drm_bridge_remove(&pdata->bridge);
-	return ret;
 }
 
 static void ti_sn_bridge_remove(struct auxiliary_device *adev)
