Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE429E5075
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 10:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D4610EDFB;
	Thu,  5 Dec 2024 09:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZO7ZQwaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61F010EDFB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 09:01:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDpxjwdV1DSxX20GJcDVZ9X1CWk0X1rWRHOkVX9H50mi40cqTpHV5yPShXr1sgIxq7CHru7w9+jev5vFDzVsJ3M6n8AGmYtsBK/x/gH3NrE8D7og9BZqvTgKMmCvGAN1ckGB/uKDwsPG0TE7TpFSBXL/V9KJw6vEpyTdgm3UFCt5oplrOVUC1JLW9PH5/fthyzd2ycI9K+qDb/IcUm4b9FPFB51ndgYaEH+UmfdanHb50RrzfcZxIe9fDKodIRMj2RzMoibT243fsbh0zlG3Vl2jF5kYTYNPwq9KxsOQ50I0s1QmQfFg6FpaJVK1fQmsKXImMZwp9AY8kSAsDWgH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yr/5/hMLh+7Mgs+Eg3wsBFgvwPglXLotbN2OWjdCq68=;
 b=pcgG5GCNAfOc/6KCeit4witDATpXsm/BW7GJSqIGFzh2OpGMukWBLVjTGz5nmW+22kE+BLCm8bSyAdYHUJqQgXSKkzUI7eSdfZcKIFVZ+hY7vB2TRhBjLpaAtDhjiudEOUjLCpkaJcc9iPm9Xar6ZGqvDOsQ6kW+itlSYgIXD3sk1O7BMaZxs2dBmymWuCDNPtE3J3fmLCRpYW1iHDfyh9GEAP2t1oGCfewZ0VKUo93vhDOXj9mo+lc45Z72dw13Rre4PJIAzapzj5vnNEWE6d9Eg6EnktF2J1VpYiYwosVVvWCxy4+TXUY2VFatJx+ZV3pgq5C024V6W8gWJB+F4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yr/5/hMLh+7Mgs+Eg3wsBFgvwPglXLotbN2OWjdCq68=;
 b=ZO7ZQwaGpvnBQYTyMxWQfI+NwAT7KiOlTMXCKtLysuV4TGY7xxNlSVZWjlL0rUvZHJjk3DltbS+VzXpqtY4Ge0mIfcLMM43lxPJapKb0aASDxJJsU3zZGmD09mldhazx5zvBzyaBF95ZhSmL/dmhC8le+Cwsnv8Tg/MCnAqOJTR2L9rHtCOv05vDoxyn0CllqyHyZnh+djsOjFF1WqR0r8dxFfkAt8NrkSDtYmKNH3SV0TcEljlNQ/mCcSLhcTFP6AQ9hhUytwzDrQM9O3xE8GMOvi/EpFjGRX88Q5XpD2KAD0pBvcdB/xv/J7TZsd1cNZ25xAjtyVH3fQ2BfAPW3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 09:01:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 09:01:33 +0000
Message-ID: <3243b983-2f22-4254-b7e6-0f7ef0ae725c@nxp.com>
Date: Thu, 5 Dec 2024 17:02:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "tomm.merciai@gmail.com" <tomm.merciai@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <hd2kom5acz47c3mkjuauxhauahkt7vq2qoilppwn34iidldhos@rb5ydcayhtlj>
 <054a0278-428f-49cb-b0f0-182c5bb3b61b@nxp.com>
 <TY3PR01MB113469CCF62FCC801F15C6B2286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113469CCF62FCC801F15C6B2286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0166.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 87311350-00e6-4bcd-332c-08dd150b6a66
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzYxVnc0ZllxeVU0SzRSY0RIY2NhTG1tdmFOU3Z4d0ZQazFMRDVrenB2NGhT?=
 =?utf-8?B?ak1TZXZmUFlVb3BoS1hGMmVydHVxb2hrL3p3VHdBcEhSRFp1c0tlYklrZm1m?=
 =?utf-8?B?V0pxMWdxODFueFBKRjdFY3hMV0lJb1hSdnEvb2hNZkJxVk50Uk5ROFFQK3Jt?=
 =?utf-8?B?VEc5RXNsNDNBZ2xVWjlsVHFHOTU1L2FnTklIVnRyUE9VYlc2TG5LcWkwQ3NX?=
 =?utf-8?B?UlpuUVVuem1kNlBGb3k0amRwcFphdFpxYWtmbnBNT1l1UDNWdTY2b2FGK28z?=
 =?utf-8?B?UU9rdlNYS1RWRlpteVZ2alh0dnhGTnZNbFV3Y2hMamhSclNpb3l6d2YxcFdt?=
 =?utf-8?B?cHFnV0hHbFBUWnhrcXJyNXNMcVMvN3lLOTRMR1A0TGlYalFrU29EVVlabEVq?=
 =?utf-8?B?SzJYWDB5WW5wSUcwYUFFaUFTVUd2ZTZxNWZkbW9FVFRZa0o5b2M4SHRVSy9w?=
 =?utf-8?B?KzYzMmRiSUtRQjJJOVdDdWdGc3kyOEJpa21TQjUyT2tBc1lDUUhsRXVpcXF2?=
 =?utf-8?B?VTRCMk1HVzlaa1diNkUxaHNFNDN6TGtKN25zbS9LeUVNR2ZtRXZQZ3NnOUZL?=
 =?utf-8?B?WkVhalU4VzRwRjZyMjhYQjgwMnoxQ2UwRy9ndTNUWFBYait5UE1OUFFuRDNK?=
 =?utf-8?B?WmpGYVhzZjU2TDIvVlVSZHVQYzAyOFdyVnpxNEJWakVpNEg0WExGUm5MRnM4?=
 =?utf-8?B?aDNHTER3QVg1L3R3c3FNa3hFQnR0emJUa2xWZmhnRnRlcVltOGFOUk9LQUkz?=
 =?utf-8?B?ejdBa3BOWHBCTm95a2dYYTdiOE1KcjkwTmQwZWJzbm8zY1dhNnBObWlzRkR4?=
 =?utf-8?B?bDlIUGtNUm1YTDMrUFR6OHEvOHN1Zy9EQXZGS3dDMFlFVThGQjdISFFpSFpW?=
 =?utf-8?B?SmM5Lzl6SVRJYXk1YVB6MzE2VGYyV3NvRUdTVTNPVkROdW9JbTFGdkN6YnJz?=
 =?utf-8?B?M290ZmdFWjFpYlRzQzBvU3l6RFlsVjZXRHpXeU5ySzVkTUR2b1pPSFptbFZk?=
 =?utf-8?B?MFgvMHNjZDhMWnZiUnFxSDVSYWtYcDQ4akdDMGMxYWp0alRZTDFKSnhDaEJt?=
 =?utf-8?B?dnVvWkpVZnY3MTdWM3NRTUk3MjBWWU1LMEU0eHFNaWt6VjJza240cEtNTUJu?=
 =?utf-8?B?ZC9lN2NoTmx0NVNMT1lUeFlCRU9EU2Qrbm50YStiTFRJYjNEclRZbWRiNzd6?=
 =?utf-8?B?VzVLa3ZTT2dGRms1MHpoTFhnTXFIcjVsTXppT0Rtc1dHSG1qS2I1RWp1UjFE?=
 =?utf-8?B?N3NpSys0ZWxsNk5tM1kyUys4V2hkU3VmYktSckdPM0U0TDVYWWNuTThiTFRw?=
 =?utf-8?B?UjRWN3BqcUFQOU0rbnRDd3NBUWFSSEJWbW5XWkphQUp3SXR0RFdta0JuM0wr?=
 =?utf-8?B?UHVGMlFzM1MrSEp0akxKWEhYenAvbGFpR2RROHljSlVBVjlDVlo1UDZieFJV?=
 =?utf-8?B?OUFjVFBlcFljdE9XSkhuMXQrMVpTWGtQOEpEMXhlK3RoWVNLUG5lSUcrU0E2?=
 =?utf-8?B?aEpHUEd5Z1R0QUsyZWRncnFNMmRPYmlPTnlmQkl1T3M0cUNWaFVvQm1kWVFk?=
 =?utf-8?B?R3pRRkRiWEg0ZE1OYzZFaVk0MmhZZGVtVi84elI3dVJvNStxekI3WUF5M2lw?=
 =?utf-8?B?NjRRdWFxbVFRcjlZSUlmMWFwTHQxYnY2ZHhZZEFrdTJ3QXJhTHlHdFZJNzRW?=
 =?utf-8?B?YkZmUWdLZW90M1RxZytSN0ZXUXo1YnFqOVIwZWtmMUtDcUtudUdJcTRGMlI5?=
 =?utf-8?B?WS9qbFlJazh4WDNxTDlzSER1ZjFRKzMvUUthdzRKM0JFUnl0YWlYci9rWSsv?=
 =?utf-8?B?UXlxbTNEOU5SemJ0NTljQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGNpYmRpTkZGblkxbWNTOXBvdXlDeDNNMjJTQWN3UUFLeTcxbkRxUlJpTVFv?=
 =?utf-8?B?Q0lVUjhqOUI1Rkwzd0ZCYllaK0t5UEdFSkJpZWNFd1M1T0ZKaCtUc3pOZ1Yr?=
 =?utf-8?B?ZlVHcUNVM05sVnI5Q2xQOUFPc0ZIZm9PUzZoQW5UL2FqNGVnWU9VRjlXdTJ5?=
 =?utf-8?B?MThZcGMrU3N0OFhSMEVpdGZhY3R5ejdHTnVFVVRlNGJqNTl0QUV3SlpxeE1i?=
 =?utf-8?B?U2xHeVczMHNLSnE4TGZud3JacisrTWpTZlJMNFl0UytWU3Zoc3ZyZzkvZElJ?=
 =?utf-8?B?Tm0vcFUxSitEY0YvalBHZnBvblhkeDFTVE1PVktXWklVYkN3M2VXUExnZjN1?=
 =?utf-8?B?TlhRNUhNTGhDN1U4QWZuQ1pPN05teTNaUWpVaUpCQTh2bkNQTk1tc0NJZStu?=
 =?utf-8?B?RGVJRDM2NHBxdVFBMXJYMDVUUGk3d29FZzdkM01DL3dhcU9mNUNQOFZpdVB1?=
 =?utf-8?B?Y1RrVm9qeXFlbnpIL2lFbWN4SWliSHRRY2tTVU5QWk96RnF2ODJJTUJCdVhi?=
 =?utf-8?B?cjBmQTRrTDBIUFV5a2tzM3UvU0ZuZU1WM1FGZGw2QWxGZnpmaG4vN0ZmZkla?=
 =?utf-8?B?QWN0QVdSdVhLTThmVjNUYlc5alhoMEl0NHk4NFBqQ3NLNGloWVVDS1l5azZQ?=
 =?utf-8?B?TlJrbHBGdllmd3pOZUM2TEpqQWdWNnY3cWdvVE1EYVdzdkpBN0w1NEJjSjFB?=
 =?utf-8?B?R0FmVjk2MFVPMUVmUmVxb1l6NWNzUVNOSGVFUE95VW1xZlQ5dm9iVkhUOHgw?=
 =?utf-8?B?OFlQc0JnbXZYazJxbWxLNXlzdHlqVUUwM0srdWtsNDVQNjNHdnJPU3p4UWor?=
 =?utf-8?B?aFR3eW9uNXhXSVZ4WFRtK0JORmdXaHlCT2o4YzIxY2FtWVVYdXBxWVNUeHJ3?=
 =?utf-8?B?R1QwYXhya21rRTdmSGkxTWhlNnRtSzZBbHM5K0NCZXI5b0RwMmtvVmhVQTRW?=
 =?utf-8?B?djgwVUZza2Vmd0szcWs1RjZVQ09hZW9tYmR6SU9nS3VJeU5VUENYQmxZaW5M?=
 =?utf-8?B?NE14MTFsVUpyY2pRNWVOb05FQ0NIQURGeVNock1RaDlYcWlLYUl5WVlOa0lS?=
 =?utf-8?B?ekowNzg4UW1XRWhneWowWDIxa1V4bzY2UmxMRGgzVDhJdjRkNHdMTHB1OWRG?=
 =?utf-8?B?ek1STU5qVWRldE5PM1ZxYUV5emZ5V2RQaHJjVytrMmVCMWpRbkRMbkp5L0hX?=
 =?utf-8?B?OUROYW5SK1JHR2pScURYbldiZTN4cHZ2VTFmQVVBL01IWFlKcGtla1BTN3BW?=
 =?utf-8?B?NlhYK2U0SktFM1QzOWIyeGNXcnlGdjd6WDlWZUpyZ2pPTDh0ai9GUThxS2Ji?=
 =?utf-8?B?QmQwb25xaEhibEJaQ0JyWURqOE1iak5YNFJwU0g3VldOSkJNMDdNTmQ5OGZl?=
 =?utf-8?B?TnhNK0lWVm01QTI2KzNmQnR0VlFmMFZlcERnWFV2UXFSY096UU5PMDdvQmsx?=
 =?utf-8?B?MDRuNyt6MXlCRlJvd01ta3pBTjlkZFdiM0tranhjalB4ZURva2F1Y1ZoMjFU?=
 =?utf-8?B?YnJDVWlnWmMrZmRNeHo2UkRFRldTd1poWjlHUG90RzJsL0lPQ0pndmxrUFNz?=
 =?utf-8?B?NWp5M1BNT1grcWVpOUFPai9vTVJPQWZHcHVzeDNGelRYQUlackxkZzgraUhp?=
 =?utf-8?B?OUV4eEVLVDVmYm0zT2VONGZvSkZHaWZQWnEzZmtwek1CV2NlQUtqMHNhb3Y2?=
 =?utf-8?B?dDI4QzR0NEhyaFNvRzllMnFLWFVTOTRBMU1Wc3ltWEJBS3VSeldXR3BOVTZh?=
 =?utf-8?B?a09DcDFlOGxlMWJrR1N3dTAxMVEvZ3ZPQnYzUlg0b2NZRHlhRUEyWVVaUGZQ?=
 =?utf-8?B?YUNDeGZsWjN1K3FwcE95anZCYnNBbXRIeFVSdHQ3Vk5vbWtxakdsSHI3bk1K?=
 =?utf-8?B?ajJ2amtJS3ROdEE0bk1BMEhRRURBWjJxaVU2RGwrY3JUSjh4TW1HMDRWZEhN?=
 =?utf-8?B?U0dGWEx0Nkg1eFkzY0ljS1ZQVlRmRXJiYjZ3WWd2bCtpaE9UeUZTZG4xdFBS?=
 =?utf-8?B?ZDFNbXFYMUdnMmZhTGx2MTdnY0NodXZMbWRzdnZPSmxIdmgzdkxScEtiN2dp?=
 =?utf-8?B?NlhPSnJHVGxTcldPeDh6SEZ0YVZFaTVXK1c0c2szMWJsM0toTFpONGhSN3Vk?=
 =?utf-8?Q?GB7JAK6Kh8Du7s2Nt4fsmP4w/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87311350-00e6-4bcd-332c-08dd150b6a66
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 09:01:33.2098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tbjzwt5Y/iXTHbTYBS+bR7UPtTn43boA7nffAGMyn5NgcFcxsp9dM1Ws1pNJfQPSE8snSfgxfz7BAQmQZckrxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150
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

On 12/04/2024, Biju Das wrote:
> Hi Liu Ying,

Hi Biju,

> 
>> -----Original Message-----
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: 04 December 2024 03:43
>> Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
>>
>> On 12/04/2024, Dmitry Baryshkov wrote:
>>> On Tue, Dec 03, 2024 at 06:21:29PM +0100, tomm.merciai@gmail.com wrote:
>>>> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>>
>>>> Introduce it6263_is_input_bus_fmt_valid() and refactor the
>>>> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
>>>> format by selecting the LVDS input format based on the LVDS data
>>>> mapping and thereby support both JEIDA and VESA input formats.
>>>
>>> For the patch itself,
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> A more generic question: is the bridge limited to 4 lanes or does it
>>> support 3-lane or 5-lane configurations?
>>
>> According to ite,it6263.yaml, the bridge supports all the data mappings(jeida-{18,24,30} and vesa-
>> {24,30}) listed in lvds-data-mapping.yaml.  lvds-data-mapping.yaml specifies the data lanes(3/4/5)
>> used by each of the data mappings.  So, the bridge supports 3, 4 or 5 data lanes.
> 
> In Renesas SMARC RZ/G3E LVDS add on board, only 4 LVDS Rx lanes connected. The 5th one is unconnected.
> What is the situation in your board Liu Ying?

The adapter cards I'm using to connect with i.MX8MP EVK have only 4
LVDS data lanes routed out. 

> 
> Cheers,
> Biju

-- 
Regards,
Liu Ying

