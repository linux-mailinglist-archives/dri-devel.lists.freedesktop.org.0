Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H6PEg1ZfGkYMAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 08:09:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96736B7C7E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 08:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBF510E22F;
	Fri, 30 Jan 2026 07:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="D17NyQvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3286C10E22F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 07:08:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxaslm+SAzpIuJzFq42esS0szskCy0np592WzXvzxX9lGaAd7qg8c7QGdVnhDT9R+r2O9jQy8PnuozXx5bpyO+DYRkgyDe+Q4RvP4SsP7KURWcWzL3viecZE+sDTdstU8iZr9GMr0JU3MFTGJAtghx6sHRj1pHENMUH1H072j55jdOmduZyEdqyMC5qFOT/X2w9dw/GsRRYleK0Jq2lzZoK/ncvEhT3kCedc0KR+q4UKFFghvs2S2ihDtJTCbNtg99R18VDLtMfRLsnmkNO9rSLqcMI6ronrv0e9FAxzmYJBjOybb2pcUwddeDTxr+5WTsaIfWkm5q3uYTSYvLxMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTH+sbyDJstPS3T/Ewf3dQx9WHo9qUXxXkVwe2dtr6I=;
 b=WfFnF+CytWFwUZesjdFoO2ra/aJwSCdG0lUNaz+mOD/GEvrsiWBMKJnoBiQUl6Ad40qVVLfwg9Si/SO+ZD1QdWHdwelJV6MolTIF1oTRvl1ZfuufGtbOQ+rWMyOPJyyisvByE9ntPVYvOM034HnBEaFl4BBFEiHQAe2OWoK9UKqSb2DG6cVqOCeb3a//MLfcdGj55zeGT1kLQQEYdetVsd4EWIfWtfZ0X5GELKm8JhdaUyQsYO183GOG5pGyEqA2YHoWKX9gyPO/yRhb14m9l1u6GTHX/z80v1KZtEq+NQkBuAz+IFhmHREBz98UhsYeCReGNO4iZTiuVSc7ZyIViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTH+sbyDJstPS3T/Ewf3dQx9WHo9qUXxXkVwe2dtr6I=;
 b=D17NyQvB9i53l6cqtRk42haUSgUDdxk6h6qUd4Y+d/6KiBnVpk5zTohTb0pvjT5WBZHSIYOgIAbWhRV7ofxg+DQyvGZZzGg9/MZP7wpTRvjsyPIljyLuHVh1uqusee7suNKbeAfEHJd1d4w/l9LERCG+BfwNwIm2145ZkI9fvAZ2xG7gkkrpkRKFa57ggBD5b02+kTVnolmgu5ENZwSYHyli6SGLx/QFlnbiClK9XeiTm8MR9Zso/H8aUEnahZiTdUfjVe+qblB070dKM7DppL5U1gAmO+ANbUPjzl+uJFKWhZumgcXREMXSpKrVrJcLrV63RGwD8blwg3iplYbBoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV2PR04MB11861.eurprd04.prod.outlook.com (2603:10a6:150:2f7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 07:08:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 07:08:53 +0000
Message-ID: <5c559d32-c75d-469e-8652-86122cf436df@nxp.com>
Date: Fri, 30 Jan 2026 15:09:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260130055508.3462700-1-shengjiu.wang@nxp.com>
 <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com>
 <CAA+D8AMkipi_iX=vagZMHXTNtqUqyFeVkU1Vr_wb4R82F1OHDA@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA+D8AMkipi_iX=vagZMHXTNtqUqyFeVkU1Vr_wb4R82F1OHDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV2PR04MB11861:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5a9767-1b1d-4bd8-827a-08de5fce6cef
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|19092799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OThSY05ZZHdUQ25SdnNHRzRsak9RelN1N0F0SklUWTM5Zzc5LzU1RzVGUEVR?=
 =?utf-8?B?ZC81Vkx5aDhqYkk3MmY2bzMzNlhJZG1nY1RqMmJrWC9JVzFaWVVQcUxTVmJZ?=
 =?utf-8?B?Tjh6VVVJZWJTSEVOUFZWRzB2bFRubm1pY3hyK1REakFpZ0pLVVIwUmJCTU9W?=
 =?utf-8?B?a21lNWxBTGZnYkpCK0s4bzQ2Z3Ryd3Q1YlhreXFMQlcwNG9KNk1FZkJRSXp3?=
 =?utf-8?B?OEtzNDJGbERnQkdlc2JxSXFHQ3RSKzJZTjdESmJEbFBhNDA1Ym9MN0kwcFJk?=
 =?utf-8?B?UG5BWTUwSUNxVlJPWC9RaCthQzV0Sy9PejBTYlVWbDhhNWdLekdBcGZEVUJa?=
 =?utf-8?B?NDNPZlJCblRERi93RVgzZDZlZWxtWkdRTlJMOE9sN0VRNkRQR2NGNG9RUk9y?=
 =?utf-8?B?eDhSN20zSzk0RjFwMnVSTUs1bGhrbDJxVFV6YkVzNHd5OEF3RjNtZ05FR1E1?=
 =?utf-8?B?RUk5MjN5UURyNHNpSlhYYmM4Rm1CcmFBZHlTUk9IWmpLR0FsQnl0R2dsWVgx?=
 =?utf-8?B?SGNlUkxSOFZlQm8xZFhwZkoralY1K0JCbGozeTg4dDJuZWJEelJmMlduN2Rv?=
 =?utf-8?B?Zk1YMGVPWFR3bmRaMjNMeUtRY3lUUFhQcnlpTmlhZUxhV1J6WjdPVkJvNzlO?=
 =?utf-8?B?L2x4WjAwMFQvQ0huSzVBeVZEc3FmTFdTWk9wa0NKeTNIV0FBRXREWUk1dkYw?=
 =?utf-8?B?T2Irc2F4WDlrMm9FYzA2Z2M0cGxkSGViZWY0TndRbWswc3FQcGc1eXl5aWtq?=
 =?utf-8?B?cVlpNHhwWjN2ZVBkRjJDVWxxVlU4YnVTZHo2OFp0eXVNU09kNE9QUnBveURl?=
 =?utf-8?B?Nis1VHd5NVBiWEFTeGxZTEZOdXBEZlBiNVZpc3gyVVVWMVJGZ3k2WnovUU1m?=
 =?utf-8?B?eHdEZ0VqWGdla1pjUVRHWXViTXBjVmVKSlowOXA5UXcwSHVaQjNqWjhGaXcr?=
 =?utf-8?B?M1pLeEIyaFhCemlpdWYwWkxrUGlxMDd6MmYxM21wRGR6YkgrTVAzVmJPeklC?=
 =?utf-8?B?V3pzeitBaTUxZWVDMW1oTkVrTXV5NUJBQUhvekJqcTV6d1dxWTdjMW5qcFBm?=
 =?utf-8?B?d0RFVEdRSTJoVmxwNnJTaXVsWTVsdWUzeS9FakgrNjRWMENQa0VJcUQzV0F3?=
 =?utf-8?B?N3hJbDc0SUNMcnczTGFhUm12NHdxZk8yeEt2UTNkdUFIQzNlTjYwQnp4ak81?=
 =?utf-8?B?aEV5eUNqSUZhdGJrRkVXVmFOSUVZZCtiMlF0L2hTaDI4MnJBaDNEcTh1SllT?=
 =?utf-8?B?ako2N0Z3a2RxKzNiVzRScExCUTQzS2R5ZzlkeCszeDQ2VUM2cTN6a0FDRVV4?=
 =?utf-8?B?RlJHbVRuR3BjK1pKVSswaUpLOWtKeVJCY0NyNVZFNWZKa2Z5emZqWWtVZTYy?=
 =?utf-8?B?QUt4TjkzelMwU1A0Ri9TeVhoSmQ5TzRpbFVvMm56K2xFVERqMEw1Y3dpdnkx?=
 =?utf-8?B?V2poYVpFcndZUVBSRVRCektHUG1ETG5MeldyV2p0dTB6WHZrTWVNZjNCY3hx?=
 =?utf-8?B?WURFWGVYdysrUlRXTjArb1gwZmxVQk1RQStYdVVtcmZVeEQxek8rcnpPRTFZ?=
 =?utf-8?B?aGkwMVBQQnRoY2lMekJTRDlzNHlKblc1WWgvR0tBU0ZyN3Y0NS9NS1liK2xu?=
 =?utf-8?B?ZFp1Zk5leUVEeTg2RWIrdHkvbUN4NExYaXdnK2pJWDFEc1dFRkRNczFzOXBh?=
 =?utf-8?B?TWVQYzdicWFjcGkrRnA3cUdpZDFCSlZFU0FkWUQwMklUMmNoSnJQa1BKWCtL?=
 =?utf-8?B?SGVWS1BHdW0ySmtBRVFuNnNUZ3lENXptdXgzbm02dGVERnN0TDZsNGFYdXFK?=
 =?utf-8?B?NGUwb2xSOUMwbE9KWWFtWjViMmUyT1pZTnYxbnJBeUdHdlYzQjZSK2k5dDFi?=
 =?utf-8?B?QkNHaE9HR3dncWxvWFdiU01GNlMvNEpTbTFJc05XMWgvZVZzUWVBeWYxRVZo?=
 =?utf-8?B?RVp4bE8wV2N2ZTlxZFFrQnB4M3FTUzRzcUpkaXNVNU54WWxQZmU4RE1PMnhv?=
 =?utf-8?B?eTd3MUVyU1V1QVloVFJmRnc2eUx1MnUwTjM0U1hMeXVpVWliZW9OczJrRjVo?=
 =?utf-8?B?KzMwWkZWR2tLdjJhNmNHL3RGbXp6cnZkUkd6MW5STGpndEszVmdVM2psdW1D?=
 =?utf-8?Q?LCIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHQvamEvb0RhUFA1L21DNEhESy9mNFpOM1EyU2NQM1JOTDJNc3BWaTJPM0pL?=
 =?utf-8?B?ZURJeXhOR2hQNGhLZGIxOFJTeXMwVWR5bGhzLzYzaitkbWNXWXA0b0VMSWFK?=
 =?utf-8?B?OTh6SjZKdjNpeW5ZeSs0Y29UUklMd2JWdHBMcUxxT2V6eE53Y1BnVGp4ZEVQ?=
 =?utf-8?B?bFVid0FPT280SkYwbHR4QkgydW5QOStrQWJ5cHNlWjEvZ1RCV2JBd293U2RP?=
 =?utf-8?B?Q0l4KzFEQmd4Y0Q3MGE1MnVqdkNNUStMTkIyVmZJWld2RFVVSk9jMmlScEFa?=
 =?utf-8?B?emJGV08rOHJsVzJycWtudWZqVkQrSm5mcFFHbkFYdHVCSGFuU3ZjeXNTemJU?=
 =?utf-8?B?aGVNb2RkeGtGckVLYkFBclIwSW1vakRha1lOdEs4ckJwSXpsOUNIK2lIWFpS?=
 =?utf-8?B?VGQ5MFBVYXUzekRjaGJ6Q2NsN2RVeVQwNUNlYTVBN1lyTjEyTnM5dHl4bjAw?=
 =?utf-8?B?UUZ5b0RIcGJCTWgyZk1kS3BjQndJNmNZMjIxMW1XS0RoMG9YNURNWlhiWGx4?=
 =?utf-8?B?YWxHWkxoNGR6dzNBLzZGdHFyQ2t0YS9rNHBXVW0vSnBsSmFIVXRLQWhwcVJN?=
 =?utf-8?B?Y0oxdXVlSHkra1lxNWhvSm41NVpHbHNnTHIzZU0zNWw5ajRvOER6b3IzUi9K?=
 =?utf-8?B?Nld3alc2bWFnWW5ldXdXblNQQzF5QWtFeEdaWWVmRWJmR2xmbDZWVlNLSHZa?=
 =?utf-8?B?RFZuZDh5ZWFtTUNCN2dzTmczVFlDRUdzVUNzcU1EM2NnLzRqNEUzNzNDQmc3?=
 =?utf-8?B?SFNXMWUveUczM1VlazgyMk1maXMveTlTRUFxRkhqMmluL1JIQjd0VEp3aEJM?=
 =?utf-8?B?RVBzaDdDZitFamNZbzFnZEZwSjg0bXoxWENuWjYzYVoxNUplTXpONzRrRVVS?=
 =?utf-8?B?OFUra0dCVHYrSCtaUjBQdzZLUzFFc2tTQjcwMnN6VXpnR2FQZkdTaTdQa0lD?=
 =?utf-8?B?V0hROC90Mld4TFlOMGpTNGdpVkExNWdzRW9XMkEwb05IU2dNZzNKUWYzK1h2?=
 =?utf-8?B?bVZRK3g3TlMybjRTNytyRk96aFZ0cTZVVzJrcnJIQ2RKaTVFQ1ROeDloY091?=
 =?utf-8?B?TGlqbVZrOGRkbFd6aFVVYkVabWpqQ3FsZU5BalJiYWFRa2MvdytObzV5TTRj?=
 =?utf-8?B?YlYwdE1LVytqcWs4NG1XV2ZEa2V2QlQ1ZXBWTlpOYVFsRmF1QTFNMlpoWGxV?=
 =?utf-8?B?aXdMUGhXYUU0K0lQaUFTYTlFaTNNR25QRlN6VVdoMFo0WHRMOTNPNVF0OXFV?=
 =?utf-8?B?QTdFRGw1QlN1TEhpUTVOODY3WlFWY25TVFNjSnNhSUNqTThuRUg2YVpzR3JO?=
 =?utf-8?B?S2RtVHJTQlVhMjN6dExSbER0aWlmYW1OWHpnWjRuRUtCV3RvcCs2SEgxRjJC?=
 =?utf-8?B?dGFVVVhjdEJpaWpVSUJ1Z0xGVmozYkl1YWxmZzZVZmNwV2JZVzh1ZlB3NDJS?=
 =?utf-8?B?TzUzS0JYZHNjNWM5VldYbytKaCtFMDF2Z0o4MmxGRnZkcHBaUUpRZFhPcCtE?=
 =?utf-8?B?UXhoR2xCT1FwM3dYSXFyVTBhME05cU5vNmk1eDRlSlB2bEZuNkVwQTh2QWRS?=
 =?utf-8?B?bzlGcDcvd3pWRFBCOTkwKzRsWkMrdTF4YWg3SDRzWkswQXlzZWpIa2NORXRE?=
 =?utf-8?B?MUt1YytSSmZjR3Iwam9Kek5UZ0dqWG9Gc09IL3hEQjZZdTd0ZGxoMWZsREJD?=
 =?utf-8?B?c0NWSWxGVXl4UzhHMFpsZ1J5UWRZV2ZuZjkzbFh4VXpPS2hRUlFnOUN1bkZn?=
 =?utf-8?B?ZlVuWVhkdGQ1eTBxYlhqM1ZJeDFTMXhaQnVWQmRjRjM5ZWpNN0ltSHNXdmNZ?=
 =?utf-8?B?QWJpTGhkTWVYMFNKVmwyK3hKbndjM0s4cTQ4bFNTWkdtUWJCbWY4a0tRZHBV?=
 =?utf-8?B?TUpoN2x6Sm1scnJSeFZoZERQeVM3ZnV1dnRUKzQ5WTcrUlpSSTdBZ2lvdlBk?=
 =?utf-8?B?Z1dERVNrVmIreHpoRW9CTzVMbW8wK3NUVDJxakZyc09DWCt2eXBpTTdNcy9x?=
 =?utf-8?B?b0xVdERDSjdselZWUDBIZ3dpM1BnMGFXeG8wRFFsNkc5WVZWOWowMlhwWFFo?=
 =?utf-8?B?Mm41YlZaV2ZlNnRlR0Z3ZVI3S2NTYmpkcE1pUHBJZ3lsM0g2M1U2OEtaczNU?=
 =?utf-8?B?VWk0S1JGeUJrcHM3RVYyYWNZLzlodHRQV0JRbjRyUk81cVN0S1RkSnZheDgv?=
 =?utf-8?B?YmZvWHJPQUxmTlNsZzZEd1Y0WWticzdacUlveGpNV1o2ZUhIQndVOGhGSG9X?=
 =?utf-8?B?Q2hkUVIrLzlhcGNucUVTRDJuV2ZWNnZwbkhnQ2dpZThaYXFkNkdNT2JQa2dH?=
 =?utf-8?B?M3hqRUY5aXo4ekFhci9yNy9GNzVJT2FpdlVvOGhxelVldnYzV3k5UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5a9767-1b1d-4bd8-827a-08de5fce6cef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 07:08:53.2148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Y26Sd8RmiLT0ml3O/bo3xRlai6tQ5CcHLeT4Ako5uSdFs6rvgIzbkDKlASYSRvfaEx/YSwd7snCPCnE/DAI5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11861
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:shengjiu.wang@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 96736B7C7E
X-Rspamd-Action: no action



On Fri, Jan 30, 2026 at 03:06:19PM +0800, Shengjiu Wang wrote:
> On Fri, Jan 30, 2026 at 2:49 PM Liu Ying <victor.liu@nxp.com> wrote:
>>
>> Hi Shengjiu,
>>
>> On Fri, Jan 30, 2026 at 01:55:08PM +0800, Shengjiu Wang wrote:
>>> There is an audio channel shift issue with multi channel case, first run
>>> the channel order is correct, but second run the channel order is shifted.

[...]

>> Can the channel order shift issue be fully fixed instead of implementing
>> a "recovery method"?  I presume that this patch implements a recovery
>> mechanism.  If it can't, any chip ERRATA?
> 
> Yes, it can be fully fixed by this patch. I will remove the "recovery" for
> confusion.

Then, you need to add a Fixes tag.

-- 
Regards,
Liu Ying
