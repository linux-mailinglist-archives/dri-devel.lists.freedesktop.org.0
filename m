Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIdUK3o/h2nVVQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 14:34:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D4105FE0
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 14:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A7610E267;
	Sat,  7 Feb 2026 13:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11022127.outbound.protection.outlook.com [40.107.75.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1917910E267
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 13:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiMtmLbHIDsAM3V7L5n7Sjmvd+8sUWmZwqHUBBLsjSRK5qhJHFN5LdoF9SKin+U7QVDjOPg2A1uw26NGndqlEZIoeYZYnfQQX8nxhKJogdQRnco4NkVOJCYrNUXrIJPBKbspl5y0xu89KrKdKU9FcQbDVCLjMEKbGGR44Qw+3s9tQSI4kbWo9/VFpx90lbSvFQbjEXQVQE84FN3yAA/h9sQ6y60UbJJNO+r+kjNdzp/a5XDEqSEfgNMNnHVFuFAWADHEQuA2VPT71hRdsYM9YTCh2utdOJ8rgI3asCrLvHPXDG+88LbskKJWd0+NOFxTOg9vWnAf7iqGwbIWbY4Zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggxBO0RAGHsQYgBfJWYEmCjdNWHDmZ30KQFTuzpoUvo=;
 b=h3Lul9P62ad/TmWD//OS2X2X4nv8r8vckhe8ZVolf5wovg4IbfLUfvyXAc5O85C8v/Pad4a7DQNNDiT3Kt7I/s47eyoORuWwO7qYCFTbv8WyRH1LMlESElJB8lhgXCwitpBzCtAB2wIap46lsCe7GCyyGTtO4akbSQeelHDn2x3fyzto6ugnKztHoLuBovuLXkEkJAab5tLwwMcVx4OeZulhA6AQ8npK7TCQKANUrCjbiL2WhajAFMS9wC6EnXojHZCh74yYnmDqiyXdqOx/nX2PKb7VfI2DhTNXLuRKofW8qCnf49jUb2iv65H/siQriDV68yzJ+S5OrGJGwupPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by JH0PR06MB6559.apcprd06.prod.outlook.com (2603:1096:990:2f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Sat, 7 Feb
 2026 13:34:38 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01%6]) with mapi id 15.20.9587.013; Sat, 7 Feb 2026
 13:34:36 +0000
Message-ID: <a5f6aeb1-b038-462e-8989-c4da65966134@linumiz.com>
Date: Sat, 7 Feb 2026 14:34:05 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paulk@sys-base.io
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116134609.447043-1-kuba@szczodrzynski.pl>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|JH0PR06MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 394bd2ff-3f90-4616-03e1-08de664da294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckY2RitXRU04WnVXS2k3K2p1WUhWbDZ0a0poRGNVeEJnY2JZZTRlYVNCV2o4?=
 =?utf-8?B?YlRjdnRMZjFlWWErQmo4ZTFNNFBxQWMzNWgrcG50dkZFekQ5Nys4SUJwWThV?=
 =?utf-8?B?bTRnZnZDc0NnUzNtTU1LNnpNcm1lZzRBSU5DSkIzTmpMMEJCMkp3NEVxbnhB?=
 =?utf-8?B?WWZuQSt1bERCYkVUNlRNTlZrcnBFOGdBdTNZalFsK1JqbFJVK2xtbnJVZ3Zy?=
 =?utf-8?B?bE83Mkd6bUhBK2ZPU1ROU0RTWWd4Mm9PclhXUmVWemxWSXFiOEdQUnlMelAz?=
 =?utf-8?B?a3Z5dUl3UnFDa1hFSmxDdFdiNnVYeU1DaEF5ck1pM3dRTHVnNXN5a3BlblZq?=
 =?utf-8?B?cDNsRWdML0RhYXB0RXZNRGRRRTJKTS8zMkFpTnJZRi9Dd3BhY2lXYTNNR0JX?=
 =?utf-8?B?bXdLSUtqKzUyd3NJWnBTS0FHZzRUcEV1dU5nbDdMbXNUbnFnVlFVQ0pXbHpL?=
 =?utf-8?B?ZytQOUdXaExIOXZBWGtrOUhqUTd0RnkxbS9rdTlFQXprVjVPMjkxYi9KNnJL?=
 =?utf-8?B?U3ZoYllhMkJGRVRYc0VRaW5UMHZqTzNyMlVNeVN1bWRVdFg5QmR2OTY4NGxO?=
 =?utf-8?B?Q1BTTFFhaXoyUlJnMm5haGxKL0EwcGZUR2V4aGZQM21Lc2hwcGJMN0V6elBa?=
 =?utf-8?B?RVcrck5tMEVsRUFuOVZiTnEvekZZZWN0TXQvVEk4cVdrZzhBV1dpWTFQbko5?=
 =?utf-8?B?VXNwcFE2elUxWnFlWjl2VWVtUVFoTmFkRjZxY3FyL0ptQytWU1RzL3J4Vmth?=
 =?utf-8?B?bjlhV3U2VW5nRkdERnNtM0tJWHNuNUtJNnFKcGFvQkpmM2ZJT05HbmM3blY0?=
 =?utf-8?B?Z3B2dUZwekJ0dUhucC9MTTM4R0ZPdFlNVXI3YkNWMkovZ2NmR3l5c2c4QzR1?=
 =?utf-8?B?SUswdU5WZG1FWFd0TUdhNzY4YTVTbU42cGY3VVJxdXdRTXhpUXBicVNibzU3?=
 =?utf-8?B?MTFoWElqY3F2M01uWkxvTWw2SEgzcDNkWFhVSWxTK3FLVkZoazZSQnNRY0kr?=
 =?utf-8?B?V2JBSWtJci9FWXdnNndQUkdvdmZIVVhBVTkxNGprQjRxaXBiNG11bG00QUJq?=
 =?utf-8?B?bmx4d1czcmJlaFgyc2M1ZDlURFQyUit2ell4c1EvUlFEd1FZR3gzMzRrcktQ?=
 =?utf-8?B?ZldEbThnYTdENjk5U2ZhOFdYTjZyUVN6UWxWU1F5ZE0xZFh3V3R4K2NoS1Y1?=
 =?utf-8?B?eDNBcUlTeCtJL0lzdlVOQlo3Rjd5MkFwYTNFQVJVVWR4NHRGWHNBVE82Tlk5?=
 =?utf-8?B?dW1LTGlxZ2JKRUpYY0d5Vkh0aW4zZkkrdWxxU3p0OEFpdnRrdUZaSzgvY0dZ?=
 =?utf-8?B?Q2pQN1VqdnpPNzFxZmVEMzBjL2lGZzhlSGVNNGpHZkVyNDdtS0NmTS9ERTJU?=
 =?utf-8?B?Z3huK2pRaEQ5a0UySVNBV2ZUSE84V1lZQVR6bEhLTTVaNG9DM1UzVnJUeUVO?=
 =?utf-8?B?VHA0d0RKYUtlbEdMM1dJekxjckR2V2FHV2piSHM3WUtUaERjRFA3Unh3d1JP?=
 =?utf-8?B?VGJYay80Wk5MWllXZCtnaHdSRkRkWVFBM0JINlMrVS9qZlZvQ0EzdjNxa2hP?=
 =?utf-8?B?TVNtKzNWbzJpeTBSWXpMalFWTHdEM0NLRFY2Y1FzRE5mbFE2dnVtOUpncTZG?=
 =?utf-8?B?dGQwcVdpVDRYSW9QcHVpVUxvTllHK2MwR0J6YUV0OUpyMVBCNW9QN1puRTZJ?=
 =?utf-8?B?ajBDKzB3TE1mUnNNTythcy9qU1EvOTdSVktLSGhKTUtqZEs2OGFEKzNTNGdW?=
 =?utf-8?B?bG9sS25XTjFmazg1NSs5clZ2c3N1Y0RFZ2hPdFQrcVpnT0M0TGpMOFg0bnp5?=
 =?utf-8?B?L2ZxVnFOVUdheEc4Ri9adUZSTnFpUWNaTlBxeEhmaGdRbzlTL2ZLY3dEZy8z?=
 =?utf-8?B?NFhkdktDc0o1WndlTlNyRXB1TnAvSDBxVWJSVkl5Yit2QzNJamZpcnBSU21w?=
 =?utf-8?B?ZzZpUDBtQ3BTdkVoNUx5MlpNWkJkd3VjSnRSNmpSUzFLdi9WdHRuTGFGdzJB?=
 =?utf-8?B?aU9vdXhFVXJ0em1yL0tuVDgxaE53a2hSdjg4eWliV013alR3RkJubzQ4bktl?=
 =?utf-8?B?YU1CSEh6ZVFQNFZUSnc5UFR0U1NBaTJtRzRyRDIrUG8wZzdFSG92ZDZKRTBr?=
 =?utf-8?Q?Z7N0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6935.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVdibUJVaDE5YTg5a2xuMzVBazlpdUJDazIyQ3JtakVBWlRvWkY2MmR1Y3ZG?=
 =?utf-8?B?eHhGVmRYVjJoRDhDdTNiRGwramZrTFdxZ2xCQWpCUFRUdEFsTjhSZ1MzQWd4?=
 =?utf-8?B?UElyOEpPWXFkRkZ0QVd3R1lHcC9JNzVHQ2g1cEtEVFltWHN3YTBvV2JQT1F5?=
 =?utf-8?B?dXFVZXh0cWcxVmVVU1QrNW9PV3JxekVJNDRseHROVTdydzNXV2JBZzFUd2Zt?=
 =?utf-8?B?QVExS3kwdWRQUExtTFRIQVkxWU9uYmlwRnczMVRPd2ZsSzdLVlUvb09udHlj?=
 =?utf-8?B?WDJZN29sYXh3Tzkyc2FBL2dhM2RaYVlVMmFrczVNZkpQUzM1alo5Z3ViVzAz?=
 =?utf-8?B?SzZObVAydHBVZWRHaGxEdHViUHNoU3JvRGJBTzRZdWNTWkNCUzB1bVdUZXJD?=
 =?utf-8?B?VTVyVW01S0tMTG90Lzg3SDZuUU5Wdzh5b3YrUkw5bEhaMFJWOUFUM3djWEV0?=
 =?utf-8?B?VmliMTkzQmFWSklUdVJacEd0bk1WZ0VxR1hlYzRBUlAzR2UrN1pUSlpONnRy?=
 =?utf-8?B?NDA2YnNNQ2x6cnFkNElFNXh0NG5VMzhEMkk5cjZvY3BaQmsvU1VEa3oxRHFz?=
 =?utf-8?B?Wll3MHgxRE1TaFhpQ2dXNGpWOFptdHAxbmpyTnN6V1U3eTlxRC95RE53TlBy?=
 =?utf-8?B?SUZpdm1LcW5iMWdJTDR2TVA2RDMrVm92YXVHbmpDbXhyeFc1SzhUdmYyU05N?=
 =?utf-8?B?VDYrY3pab1kyOFJUNysxU2x5enEvL205ck10c2tkN1IxZ0NEOWRMQ1NMYUVw?=
 =?utf-8?B?Und4SW9KckNXd3VudC9IRitYSVBvTlNUZEhXMjJlK21LWXFvenVHY05Nd0Jm?=
 =?utf-8?B?L25oSklYbnF2UDF6KzU5SVdkN3Nsc2ZrdnI2dkZrakZGLzBna3Ric2xod1hS?=
 =?utf-8?B?MGVUdlJjNXpPU0FKQjR2Z1dQcUNLNFkxNTFPbFdoYy91U0lDQnp0SlFWdDli?=
 =?utf-8?B?MDNHZ0EzQ1ZlZUUvRTBwSVp4ODF0Q3Q2bjVyM3NHZXVTTGNkajcwS0tSV0hW?=
 =?utf-8?B?VS9HNGtLVUFCZ09OLy9Ed0dBNUdUUWJJcml1Mmx2ODZiWjQxbTVwMERsVHRl?=
 =?utf-8?B?QXJUZUNrOUljb2s4dzRad0dzZEJUZ1FtWFRoVFVYTzBFQXI4Vlh3Smxjd01F?=
 =?utf-8?B?VXpDb3hpSVcrYlJQTTRBZS9HZFZLNlR2YWJXV1hXVitnb3V2SmorUm9BUUVy?=
 =?utf-8?B?TGNDYUdrNFZ2Q0FTSk1ZQ2sxSnpWcGhSbml0TVNPSG5vTW0yZHRhcUcwSHRo?=
 =?utf-8?B?cS93R3NjR2FLMC9ldDVxd25YUFlRaVhMRHcxbGNHa3J1SXluZEgrVlprWExG?=
 =?utf-8?B?NVp6Q0N0a0NDR3p4UW9rS1M0azhxZFU5MzNiTDhOL2xLaDY4RE9tU3dNSWMv?=
 =?utf-8?B?QXpaRkRvTlRITlJTYnVGbER4aHVNQlNhYzUyVGpydHFlV092Q1l4NUVMZWdx?=
 =?utf-8?B?SnF4OE5IQmVnWDBXVGFua1ozdFZMR1hTblNyTlgvaDZsRHRBK1JOQ0p2emIv?=
 =?utf-8?B?RW5rTDhEQ3ZNV002UUtzNUt0a1J6ZFFaYTllL0FTbkdFOTJEaGVxVzNVSFE1?=
 =?utf-8?B?Q09EQTV6Zklpc05tZXZCNEdpWVFOTjZRNFUvdloxenJ1cHpvTmhNL08zcnhI?=
 =?utf-8?B?d3J5UysxaGw4M1d6ZER5bFhpTUZpc1JnajZ3eWRVMlBoL2pWYlU3VTRxS2Nq?=
 =?utf-8?B?Znh3VjFJbVFwQ0E3Qi9LY0NBV3Uwa0p1cHAzbWswT3p0YkthNHdVY2tSRWxO?=
 =?utf-8?B?Vk1FeXllMERsZWJxL0ducDIyeFM1TFZNR2JLNGtqYWw2MzdJcHhrQ1dVdlky?=
 =?utf-8?B?VE9OUGhxbDJXdUdadEV0TXg3L25XVzJIQmNwaW40czAxanFhVlpYQ0g1ZVJ1?=
 =?utf-8?B?K3dsYSs5ckxFMTMxZ3lXQy8rQm9LUS9FYmx4ZS8rTzVzZnZ6dGU4UTZISExz?=
 =?utf-8?B?ZnZSTGZhZURST1Vsem42cmNYVTE3M3AvOTRBa3pCaVJUZzhMUGw1K3JDdnNQ?=
 =?utf-8?B?UUgvanJBWW9lK1RQVU13QWJOU2hoSXY5UXgrR3JycHREQ3hyTVljQVpWdWtD?=
 =?utf-8?B?WlFjMmlWM0VkQ212L2RSYVhNQUpSenpiUjdDVldkTC9zemVXM243Ny81TWpq?=
 =?utf-8?B?NHJUVTBCdlBtWS9nZ1UzSUs4ZUZNVE84K2NlZGRzZWZ6cnZzV0x4c1kza3g1?=
 =?utf-8?B?N2EwcGZBWUpVbFJSYkJkSEtmbVBBbkxDSFJVOTJKTC8rYk5kNUlDMFJmSktM?=
 =?utf-8?B?Kyt1ZVFwR2s1T1Q2TnBpMmdUbEF6djBrR3JxTjVLbnZYVk00NG5IY29FZHdT?=
 =?utf-8?B?VDZDZkxHYTJnam9XNGp1NmZWcWdjckMxWHg4ZWg1dXdBUkZYZVZEdz09?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394bd2ff-3f90-4616-03e1-08de664da294
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 13:34:36.1636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLw9u+OCIFXKK1yYpNMka2Ndee5zcfV9ZDzIU0CJV5yWx9i0uZs3MJ2ZvsgT5LzCfT5zYwsnEnHhKQkR4O9ydA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6559
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
X-Spamd-Result: default: False [-0.11 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linumiz.com];
	FORGED_RECIPIENTS(0.00)[m:parthiban@linumiz.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:paulk@sys-base.io,m:kuba@szczodrzynski.pl,m:mripard@kernel.org,m:samuel@sholland.org,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[parthiban@linumiz.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[szczodrzynski.pl,kernel.org,sholland.org,csie.org,gmail.com,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[parthiban@linumiz.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linumiz.com,gmail.com,ffwll.ch,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,sys-base.io];
	NEURAL_HAM(-0.00)[-0.990];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 881D4105FE0
X-Rspamd-Action: no action

On 11/16/25 2:46 PM, Kuba Szczodrzyński wrote:
> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
> PD0..PD9 pins are used for either DSI or LVDS.
> 
> Other than having to use the combo D-PHY, LVDS output is configured in
> the same way as on older chips.
> 
> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
> is then configured by the LCD TCON, which allows connecting a
> single-link LVDS display panel.

Also one additional note is, current LVDS implementation in tcon doesn't
handle LVDS mode in "0x0084 LCD LVDS Configure". We have only bitwidth
handled. When using smaller LVDS panels vesa & jeida needs to be handled
separately. Not sure if the mode support bit is same across all the SoC's TCON,
but here is the diff which I have used to make it work for vesa-24 by tweaking
the a133 lvds hook.

commit 1f2d8983f78a11adab759160957a9cf6dc4296aa
Author: Parthiban Nallathambi <parthiban@linumiz.com>
Date:   Tue Feb 3 21:55:48 2026 +0530

    drm/sunxi: a133 add support for LVDS mode handling
    
    A133 supports both NS and JEIDA mode. Add support depends on the
    mode selected from the devicetree data mapping.
    
    Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 3bacc897217f..98a2fb7ed015 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -175,8 +175,34 @@ static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 static void sun20i_tcon_setup_lvds_dphy(struct sun4i_tcon *tcon,
                                        const struct drm_encoder *encoder)
 {
+       struct drm_connector *connector;
+       struct drm_display_info *info;
        union phy_configure_opts opts = { };
 
+       connector = sun4i_tcon_get_connector(encoder);
+       if (!connector)
+               return;
+
+       info = &connector->display_info;
+       if (info->num_bus_formats != 1)
+               return;
+
+       switch (info->bus_formats[0]) {
+       case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+       case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+       case MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA:
+               regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
+                                  SUN4I_TCON0_LVDS_IF_MODE,
+                                  SUN4I_TCON0_LVDS_IF_MODE);
+               break;
+       case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+       case MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG:
+               regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
+                                  SUN4I_TCON0_LVDS_IF_MODE,
+                                  0);
+               break;
+       }
+
        if (!tcon->quirks->has_combo_dphy || !tcon->dphy)
                return;
 
@@ -550,7 +576,9 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
        else
                reg |= SUN4I_TCON0_LVDS_IF_BITWIDTH_18BITS;
 
-       regmap_write(tcon->regs, SUN4I_TCON0_LVDS_IF_REG, reg);
+       regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
+                          SUN4I_TCON0_LVDS_IF_CLK_SEL_TCON0 | SUN4I_TCON0_LVDS_IF_BITWIDTH_MASK,
+                          reg);
 
        /* Setup the polarity of the various signals */
        if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index 7e6a5f500d37..fa45b070def2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -101,11 +101,12 @@
 
 #define SUN4I_TCON0_LVDS_IF_REG                        0x84
 #define SUN4I_TCON0_LVDS_IF_EN                         BIT(31)
+#define SUN4I_TCON0_LVDS_IF_MODE                       BIT(27)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_MASK              BIT(26)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_18BITS            (1 << 26)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS            (0 << 26)
 #define SUN4I_TCON0_LVDS_IF_CLK_SEL_MASK               BIT(20)
-#define SUN4I_TCON0_LVDS_IF_CLK_SEL_TCON0              (1 << 20)
+#define SUN4I_TCON0_LVDS_IF_CLK_SEL_TCON0              BIT(20)
 #define SUN4I_TCON0_LVDS_IF_CLK_POL_MASK               BIT(4)
 #define SUN4I_TCON0_LVDS_IF_CLK_POL_NORMAL             (1 << 4)
 #define SUN4I_TCON0_LVDS_IF_CLK_POL_INV                        (0 << 4)

Shall this be same for all the TCON?

--
Thanks,
Parthiban
https://linumiz.com
https://www.linkedin.com/company/linumiz
