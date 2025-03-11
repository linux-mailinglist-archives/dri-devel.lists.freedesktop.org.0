Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F2A5B6AE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 03:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CB810E50B;
	Tue, 11 Mar 2025 02:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="UcemLjFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D73310E50B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 02:28:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndsnXwOl0M02IIQVX7bz7cf6SN51UT6Lgm/BPp8nHlXVnmolkeyhbURj+N6lxDNwvKkgPUueGUzGaD0KPzbKwHApuSFVw4lvO+7uH4sGXOu9v9MahGPgIMR7zQEufaXqKetc29wGw3sl2LKrmSweS/6WfnbYZm/6I/t2QPU/lJnkOy4zU51iT7v34uLoz2Y1KwLikNqRmSBol9S9lQ8NkS5a9W6v/72/vGwAH5Wr+aOP4zFZBLuLQO0WSZ2LTMBj9Y7/9SjJh86EeEmxf3+FsmJdBeuttFl+sCemGh+FuFWtefkTyhaaUiaNQLdz7mjC0zZZrP51NWaq2cWGTUMdvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jruUvvJUQKmHnM8LY0Hg4V2K/4gqi4W2NL2hsDg6KcA=;
 b=LbLhqvcnBXAJVnpsWoxxliER9OumPLpHxqtshukCk3Yi7EYsYfM59+fTHZpdBiqVthkXXFg5zgkSedwQqEx1u1lNtsOtfGlj8N1wkPLTxQgOQXyyah6aDIRXlUdGwN7KrfIKKV3LLQhjWiQrLMmUMu1mowiZiFuRQtJk8pm5xVP3Eopw6KjqXAsOZqRzJahNNYqnuWJ3bpEpIlp9PADR3AxL9sSjFK+0x37VWYeUnCB3doqfMWNycTrDvty2FYIMhP59KvaLckKP+gAoxckYG/XFhfQcKleVZgm4+JmXi2KLTWljTbiZezqsNbivB6UCRbyb+kUCEWvNCrP6bec5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jruUvvJUQKmHnM8LY0Hg4V2K/4gqi4W2NL2hsDg6KcA=;
 b=UcemLjFW89xv9TWMrtcqoHBfdfzq72GS24mbyTnAOTKNsfis/ukwyHBmvhA1FY3JIGQAK7UufJbAYgnxkq9JS/H/yI/IuPe8KEPKUedR9w9JGmjSbZghXNtv7qZdNYTo5UY83WhvS5K/yB//E29ZW2RkIgl2Z3BAasmnWWO3Ywmac7UpnwTjZly9N3Ao4gjBWUN3BRpA8yVWPtbFElltgWHuXAUEa6WOnSxrY9FHCto3E7xOTsG0s8MgYf6zYu9a8tQrMkdHVWVN0D+cb3lC2O4WjtLmmWSUtTwnHhUUgE5ELUL0dmMFW8xSaJnmc+/X0b1u/1+l+C0cKl85jP4Yhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10352.eurprd04.prod.outlook.com (2603:10a6:150:1c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 02:28:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.025; Tue, 11 Mar 2025
 02:28:15 +0000
Message-ID: <8148d63e-a6ef-403b-b730-f64c572113af@nxp.com>
Date: Tue, 11 Mar 2025 10:29:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
 <20250304152320.GA2630063-robh@kernel.org> <1891036.atdPhlSkOF@steina-w>
 <20250305163805.GA2071011-robh@kernel.org>
 <7d98163d-10c8-457d-92e7-6a1d6e379beb@nxp.com>
 <20250306-kangaroo-of-pastoral-typhoon-8aefb2@houat>
 <20250306203444.GA570402-robh@kernel.org>
 <3836a4d2-ef4e-427e-a820-39dd4823458b@nxp.com>
 <20250310-orthodox-unyielding-kagu-decaf9@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250310-orthodox-unyielding-kagu-decaf9@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::17)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10352:EE_
X-MS-Office365-Filtering-Correlation-Id: fd88b1eb-cd7c-4400-f954-08dd60446071
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blpQcXB6RE5HMk1QNjlTV1YxcGdOVG1jekJlS2hEZlVpbGlOc2FJMHZRSXRw?=
 =?utf-8?B?RU5yQU9BK2lsSFlQMDhOWGxDNzgvSERMdnFFK2tqa3lwN0pKbzgyTVR5SjdQ?=
 =?utf-8?B?RWR4QWdrYkZOQjI3enZuSWc3NExsMy9pTnVab2dIWGxVbUxUNWhRejNnOHhR?=
 =?utf-8?B?TlNEMWFONzNkM3VQZnRyWVUzTlpLbDR6TUFCWGp5eXp0VzI2Y0tkL2hPL09M?=
 =?utf-8?B?RS9qZUdIOEtBMzlTN0tCQ2s0cTUwOTc4N2llZTkrZHBHcFRyaFNyZENMUUZk?=
 =?utf-8?B?RWtGVW0wa1Jpd3VHaExCSGpPb0VzejBmZkM1U0RXRUx2VzB2NXAwTm92N3VG?=
 =?utf-8?B?WVNIWUNBbTBqT3RPT1FZd3A4YU00bVJHdmxhMkVRZmlVbzdHWWMxTWM0UDZH?=
 =?utf-8?B?UExpVVROb3FacE4rOEk3bEppSmFRanc1Y2x2TDZZdHZRU3NWT0VKUUR3R0Z0?=
 =?utf-8?B?YWdvNTZ1cTFGNXpCQVhCZFZWVXN4QnhsMmEzR29CSjU2SHQ0SzA5bzRTblVk?=
 =?utf-8?B?ekxXcFdHVTFuU0xNTGJjVGpPa3lPelVXUGM3YWhBbVlsdXp5YXdzS0xmTzc2?=
 =?utf-8?B?NERHeWZWUzVDajJyU0ZvMFdWaUpjTGsvZmVxY3hRaFJWNlk3amtUUlpiTmV1?=
 =?utf-8?B?ODAwZzltVzJQditNV0dmMTJFSWlGU1FKb3hoYnJHdklXMkxpaUcwMXFiTUZy?=
 =?utf-8?B?T3lodGEwZkRFMW5IWFNCTVhSbnNLSVduUFFLVkgzWlBtSWZZQmJLTFEwT2d2?=
 =?utf-8?B?UE1KMGNzNktFVWtXeTlDcmdjL1pVVldET01uaFlHOXNqU281RDBPYTNtTTk0?=
 =?utf-8?B?cys5U1BlYVZDUFlIcUJmY1k2LzJTMXc0UXBaOUlqeTg1Y2VMUytsc3Y0MHph?=
 =?utf-8?B?b2hLQ2E2aGQ0N3hMOU1pbC8xUzBzV2tPWEt6bC9IUnBrNmZyeklYclFtemhv?=
 =?utf-8?B?S0VGL2srcXlkdzVjZnNzcWl1Nkl4dDNCMmwzU0lncUlZekZ3eWxsWXhNQnZU?=
 =?utf-8?B?ZUVzVk95Q0RlY3VJQ2JvWmUra2lDZnBwUHUwL1FzMWJ4RTY2eFVZZEc3MDBJ?=
 =?utf-8?B?Tk9PMndIVDBUSVlmTnJmTEw0OGpyNnZvWjREMnlpd0dBRGIxYWk0UW9yd1JP?=
 =?utf-8?B?Q1FpT2l6bWRWQzZOY3F5NGdZOHpySGQzNFltUkd5UTBZOEI2Sm5tbTRTbnBa?=
 =?utf-8?B?T0kzbnFsaCtuUjhYaXFzNDUwaXNkUFZrQUlZZ2VCOEFzNHJRbWJmVVhqaFla?=
 =?utf-8?B?YzRpNzZUcmI5cWN6TkZtNDgvMXMwRklxVjQ3ck00UFRHbHkyVlAxckFjdzVi?=
 =?utf-8?B?eU8wTU5OQStqd2VySUhvNWdmV0k2WmVCbEtsWWN4bGZZdTZhMlhEcTJNUFFI?=
 =?utf-8?B?b1lTOW9XU2VqOEF4NiswL1o1c2E1QmsxODN4bDdvdGFZUjRSTjVMWDVnWGRT?=
 =?utf-8?B?SU5xY2RpYnZYWmc3Tms0RlllNFJENjVsOG1aUUdUZnI1eW5XVjdrMjEvTGNT?=
 =?utf-8?B?eHVLUWxMQy9UN0RRUEp4akI4bjVBLzRaR3UxTWZtME9QdmZIK2JuTk1QMUk2?=
 =?utf-8?B?eFU2VUs5VkowNU5MTlZsT21KTXBmbHNjUWRqVEpFSmxjeEdTSHQzVkJOTStk?=
 =?utf-8?B?RnNpM25LNGEzRGE5MFg5WG1RQWh5UGNrOTJhNEpoeHFvc3ZtZ3BrRFYyNjM2?=
 =?utf-8?B?MEdOc1ozLzRkZ0VsTmd1Vm01OTNYS3lEK1UvQzJZNzB4eklBK1A3SG5udXBR?=
 =?utf-8?B?bkNqM3U4OUZaSzRzZ1UwaEdlcEJuTGVBdmx5a2dJTWhtV0hjZk9tZVV4M0pH?=
 =?utf-8?B?SGFKQTBBcGs2UlQ0UjJGdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czg1czdvRHc5dU8xNkJHSVQ2QnQ1M25MWUl5RjgyOXRJOFRGWit2NTZScXdx?=
 =?utf-8?B?Y2RENStNUkdDdWpKU24yUERFRTlPbXVFb1RxdDdIS3JWbGkrbGp6RDFBSjhF?=
 =?utf-8?B?VE5iYnpiNVVXaVN4cFhUemNDM2dHejVKUXBHWStIUzUwMUZKMlpqeXFkZVlo?=
 =?utf-8?B?VlhtaFVmMHkxM3VIR1NZeFlWT1h3U1NZYTZxV2ltWlBUYVdUSVQ1blJwbkE3?=
 =?utf-8?B?VStKQVRNa2xWbDJseU5LRnpGb0c2WFFFNFdqTCs4OVNwWmpjSG51b2RhaHhI?=
 =?utf-8?B?MUZKbmhKb3h2S2VQcHVXandWazMzK0lGV3UxQW9wempuRzM1UlRBbmV1aC8w?=
 =?utf-8?B?OFJQMXAwUGllVVZ5ZEp5aU5LZ2RNenoxb0J0N28zNWhHNFUzMjRMYW1IL0hY?=
 =?utf-8?B?SndwcjZxekt3SXh4bGxGTmp5WjNqdjNwVzNPa3FjWm9valg5WFJ5TEY1YUtB?=
 =?utf-8?B?RGhkSlBVTnVkLy92NDYyNXRueHE2TmpCRVp1WE5Lb0VRYTRjbkpUbFpIdmhS?=
 =?utf-8?B?UVBuK2lHUjZpTy9JcmoyNXovZlkwNGlGTjVocmV2OEFtaVRTeExRdGE1ZG05?=
 =?utf-8?B?cEpSaDNXS3JybXE2UzdPT000SU1IMlVDZmN1V0V2dFRBTDhFb3E2bkx6ZENL?=
 =?utf-8?B?TlMwdVFFWFFxOFVtUk1Fb0JoaFpUMmRJYjVEN0hUYmVoZ0FaZ3RzNTlDT3Va?=
 =?utf-8?B?QTZtSGt4d3ZoM1ZmYzJzL2VYNlNSdTZPeEt0azg2RVpBQVdyOGtlZ0JoU3d3?=
 =?utf-8?B?TU01c05CYXM1VExTYkJhUm1IWjduNjBQQThMVmorYTB4aVJkcDg0a1RiZ09l?=
 =?utf-8?B?MXc1MUVWQi9iTTRHVGFNaSttK29pOHFPQVEyeHFJY09raXlCV0NyaWEwRGNT?=
 =?utf-8?B?cjQ0VWRVdWZtWTExb1RicUxSamUyWkxwVVZYTVk2WUNEL3BmdkVjbTU2KzBC?=
 =?utf-8?B?YkRSYW1SYS9XMDROekYvZmtNUVFkOG9QMmxpcHJ3VjVxRklCbHJHQUw2anBV?=
 =?utf-8?B?OWcxNS9oY3h4aFlxN2haemFpOXlYcEVMaVFHUlErc1NyWlZwL3ZQMG5YbGhH?=
 =?utf-8?B?YURrTFNlNGY2OERuc3BueWhkOEdicXdIMytSRTUwNER6UzBYVk5aYWFmVkc1?=
 =?utf-8?B?VUVWNWc4VTMxcldVUmhVYnYvdmlramFFOEU0dEswb2g0OVI0aHRTVXNFMHpJ?=
 =?utf-8?B?M3ZEbExUWW8zM0RXZzVyOVpUMzdzYnFxWEN5UFQrKzE2UWpEbkRJYmZ5bCtV?=
 =?utf-8?B?ZkJHY1c2bUVkWElIUG1IQ2sxWXBwdDgyNmxkaTdHTzZoLzZTUmV4TWlxMEhl?=
 =?utf-8?B?cUFITVdnd0dsdTVwNE42WkdkN1RPcm9UUHp2TStSdUxSc2dBVUNpRXNuZVQ4?=
 =?utf-8?B?b0x1UHhuV1ZpemRnN1ZFbE5JVGdjbDZLN0dhSndWWmM0YUVZUHZHelRJQW5W?=
 =?utf-8?B?dUtUUzN1ZVVKV2hJREtOdjQxb2tHNXlUWUdiVWVXdW5sd0VIZG5HRFdhRmFo?=
 =?utf-8?B?UFFQcHIxQ0tySWFHTEU5Z3BSSVEyQjJTaDN3N1c5QlZ0TXRIM1BtNnRDSnNK?=
 =?utf-8?B?Q3d6R2UzQjU3M3pXUVNTaHVxaFV6aG5YR2tza1NiMXBseHlOdXdRS1NZOUZx?=
 =?utf-8?B?SkZrNU5XYmRtL2ZkWk5wTG9ZR0ZBQTdlaXVEdUFwUlZlT1A0OWhJdmFRNVhJ?=
 =?utf-8?B?enlxMGdoV3hSL1N2bC9UNElCK25FRkhmZzVCSWZUczhybnc1dG40V0MwTHRn?=
 =?utf-8?B?dmNOQWpDeUJvNG9jemdQS01ESGFRTmpobE1XZEJETlZSRHFTeGQ0dVArU0py?=
 =?utf-8?B?UWYyTlRWMUFXUHVYQ3VwaTJNUnNjQXIyVnQ3S2pLcHFaWkZQc1dRTHRsTkc2?=
 =?utf-8?B?d2tNbWpFNmIwQlNvZm1sb0FXUFloanpkSWNlRUlCdThMdVFiclFkSlVVanRJ?=
 =?utf-8?B?L1MwMnFKbkpLdThjM0xpNWp1dU5VWFBINmszYmlIT24xeGdGSjlBQ2hoUitO?=
 =?utf-8?B?MzZ5RW5hWDVzbk1tamhWQjAvQ3hlRFFkVlRjUzVxRitnOEFENllpanVqaDB3?=
 =?utf-8?B?TVRNeHoxSmJaa25EVWdDQVZGZXB1NjBERXpKVDNRTHFpWWgyalB5dkorY29X?=
 =?utf-8?Q?BfQnwFSi9FzdNEoK/LKyIUJX1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd88b1eb-cd7c-4400-f954-08dd60446071
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 02:28:15.1690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ligYet+5LdesWaRp26eJvGrMNhW7nv2PEK81wdCBaPLr58+aDCNpoa5IipGBgpbmHzps88nJG9RVFaBN8Bjfcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10352
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

On 03/10/2025, Maxime Ripard wrote:
> On Fri, Mar 07, 2025 at 11:25:40AM +0800, Liu Ying wrote:
>> On 03/07/2025, Rob Herring wrote:
>>> On Thu, Mar 06, 2025 at 12:35:49PM +0100, Maxime Ripard wrote:
>>>> On Thu, Mar 06, 2025 at 03:02:41PM +0800, Liu Ying wrote:
>>>>> On 03/06/2025, Rob Herring wrote:
>>>>>> On Wed, Mar 05, 2025 at 10:35:26AM +0100, Alexander Stein wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Am Dienstag, 4. März 2025, 16:23:20 CET schrieb Rob Herring:
>>>>>>>> On Tue, Mar 04, 2025 at 06:15:28PM +0800, Liu Ying wrote:
>>>>>>>>> A DPI color encoder, as a simple display bridge, converts input DPI color
>>>>>>>>> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
>>>>>>>>> converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
>>>>>>>>> bits in every color component though). Document the DPI color encoder.
>>>>>>>>
>>>>>>>> Why do we need a node for this? Isn't this just wired how it is wired 
>>>>>>>> and there's nothing for s/w to see or do? I suppose if you are trying to 
>>>>>>>> resolve the mode with 24-bit on one end and 18-bit on the other end, you 
>>>>>>>> need to allow that and not require an exact match. You still might need 
>>>>>>>> to figure out which pins the 18-bit data comes out on, but you have that 
>>>>>>>> problem with an 18-bit panel too. IOW, how is this any different if you 
>>>>>>>> have an 18-bit panel versus 24-bit panel?
>>>>>>>
>>>>>>> Especially panel-simple.c has a fixed configuration for each display, such as:
>>>>>>>> .bus_format = MEDIA_BUS_FMT_RGB666_1X18
>>>>>>>
>>>>>>> How would you allow or even know it should be addressed as
>>>>>>> MEDIA_BUS_FMT_RGB888_1X24 instead? I see different ways:
>>>>>>> 1. Create a new display setting/compatible
>>>>>>> 2. Add an overwrite property to the displays
>>>>>>> 3. Use a (transparent) bridge (this series)
>>>>>>>
>>>>>>> Number 1 is IMHO out of question. 
>>>>>>
>>>>>> Agreed.
>>>>>>
>>>>>>> I personally don't like number 2 as this
>>>>>>> feels like adding quirks to displays, which they don't have.
>>>>>>
>>>>>> This is what I would do except apply it to the controller side. We know 
>>>>>> the panel side already. This is a board variation, so a property makes 
>>>>>> sense. I don't think you need any more than knowing what's on each end. 
>>>>>
>>>>> With option 2, no matter putting a property in source side or sink side,
>>>>> impacted display drivers and DT bindings need to be changed, once a board
>>>>> manipulates the DPI color coding.  This adds burdens and introduces new
>>>>> versions of those DT bindings.  Is this what we want?
>>>>
>>>> There's an option 4: make it a property of the OF graph endpoints. In
>>>> essence, it's similar to properties that are already there like
>>>> lane-mapping, and it wouldn't affect the panel drivers, or create an
>>>> intermediate bridge.
>>>
>>> Yes, that's actually where I meant to put the property(ies).
>>
>> Put optional dpi-color-coding or something else in endpoint-base?
> 
> I'm not sure what you mean by endpoint base, but it would be just like

I meant the endpoint-base definition in graph.yaml.

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml#L37

If optional dpi-color-coding property or something else is put there, then
any existing DT binding doc which references it starts to contain the
additional property automatically, which means those existing DT binding docs
don't need any change.  I'm not saying that this is ok to do(due to burdens
added by driver modification and maintainence) - I still think option 3 is the
right thing to do.

> data-lanes, on the endpoint itself, right next to remote-endpoint. Given
> the nomenclature we have, something like "color-format" or
> "color-encoding", and taking the media format bus as value.

This requires to change drivers and maintain the change, which adds burdens.

> 
>> Assuming it's optional, then it implies that it will overwrite OS's
>> setting, which sounds kinda awkward, because it is supposed to be
>> required to describe the actual color coding.
> 
> I'm sorry, I don't understand what you mean here. Your bridge would have

I meant an optional new property is not that welcomed and it is supposed
to be required.

> been optional as well, right?

No, if _no_ additional property is added to endpoint-base in graph.yaml or
to video-interfaces.yaml, then my bridge would be required, not optional,
because that would be the only way to support DPI color encoding.

> 
> Worst case scenario, your driver could make that property mandatory on
> its endpoints. Plenty of drivers are doing it.

This adds a new property to existing DT binding docs(yet another new version
of DT binding doc) and requires modifications on existing drivers, which again
adds burdens.  It's also a burden for developers to support that property in
new DT binding docs and new drivers.  For existing DT binding docs and drivers
which are using that property, that's fine and good to them.

> 
> Maxime

-- 
Regards,
Liu Ying
