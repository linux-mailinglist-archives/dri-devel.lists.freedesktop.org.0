Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22DAC40E5
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 16:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60FD10E2F9;
	Mon, 26 May 2025 14:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="n2e5icdc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375E310E30A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 14:02:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfdiMzO9hTREy0sL2fuYVsdI+FHqDR0zCcoeJe6fKLTmhyypu4dlpyV+/yYvYbrbs6ius3xgWGx3JYwyT3xn3jt06XuPj186DsjmlUok+d+wDLej6DGOuhlbh7F2/tJY8KwFajyb/XfSLvHHjGkkA0j1VrH17EJoQsMwLmuC3EB6gQrHGQ7mN2RXBC58pcaZRRQwCmRZNpMVOYMkybsMc6U/6IgUhnR9fI621Nme/FF36uWyggdqzuIU/lnfOGIP1W23GyDkz9OYc0lFUjmP9otZTPSQ4vhVznhYWlOMtq+su9jzXMGwxGwWPT46Lu4Ibl3XQCbVXk/3ThJgRSsULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+EFYPnvcELQBuWEfDa7tMQ+3vMUP9ble/x9h4ZqEM8=;
 b=q9pS7SeTkIWgSAcmvW/8A/Dq4WGEgJ2JxIWGWRY3+86LyAZTK+zYJ+yasFghA2Dg4aClh8//rmOxeePld50RItvt0auXYw99sAN6HCthwkIfqzpJU2LkR8PyQE/X8BpH+E58FJwbA7HJmxxFrqCLLxlRTWxaUD836YuK1gYBsLs1u9Ls3kC1/+7C/rDEZ9I7tjiRSYfxPjhnP9drAPDEw2p6zswfeCv7z35V1+CTKWFStdAG8Ptje29FWZOVTu/3Xk3XvCIENhDAUGnoSEHAq1zXJBZrUm7Qio1Sj0imnU3Dvqk4eZxsJ6WNjGBMUchM0XnqU8uiIZuj9v7wc/vuUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+EFYPnvcELQBuWEfDa7tMQ+3vMUP9ble/x9h4ZqEM8=;
 b=n2e5icdcIijk6w6FUId8GyEjWyz/ziTiOJjVUEkmKS5V4jfWySFiX6CkBTU2WQjBeonjhaAWnZLgTzDP1m3ZV2NXGop2IdnabUTZs45EM6seHnVbK5pbO/cIUX+zZDeWcSDNvTHiHq3TDcfbhC0kpvfhVw6P1VLC65uRQ5dPadE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13941.jpnprd01.prod.outlook.com
 (2603:1096:405:21c::10) by OS9PR01MB16074.jpnprd01.prod.outlook.com
 (2603:1096:604:3d9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Mon, 26 May
 2025 14:02:50 +0000
Received: from TYRPR01MB13941.jpnprd01.prod.outlook.com
 ([fe80::1512:cd0c:8675:4688]) by TYRPR01MB13941.jpnprd01.prod.outlook.com
 ([fe80::1512:cd0c:8675:4688%4]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 14:02:50 +0000
Message-ID: <aec5d09f-248b-4dcc-8536-89b4b9d47e9c@bp.renesas.com>
Date: Mon, 26 May 2025 16:02:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Adam Ford <aford173@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
 <20250526104902.GB17743@pendragon.ideasonboard.com>
 <209ddc02-01d2-4375-afcf-2c9a55fe8fc1@bp.renesas.com>
 <20250526-cherubic-ambitious-cobra-3c6a1e@houat>
 <7603c3b1-edff-4c02-a4a5-1d5f72720cad@oss.qualcomm.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <7603c3b1-edff-4c02-a4a5-1d5f72720cad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0407.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::16) To TYRPR01MB13941.jpnprd01.prod.outlook.com
 (2603:1096:405:21c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13941:EE_|OS9PR01MB16074:EE_
X-MS-Office365-Filtering-Correlation-Id: c28a96b1-6902-45f1-2879-08dd9c5e0043
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVlIUlhoZFFuM0FZanZFSFRaYy8zTzRLTlJ4TU90WTRZZUVmV1FDQU1iWTgx?=
 =?utf-8?B?NEFrZ1RBdkJEV1ozOStST3pIbFNGNC9XQWt1K0o2eDAxenVadDZWSW1Md1Qz?=
 =?utf-8?B?NEU1dFNJcFJoU2kycVV1SW5ydHNOcG52eUplODZPVWxVaTRTT1BRK1c2N1ky?=
 =?utf-8?B?TTlkRWY5SXlDUXB5b01pbHRJUml5amQ0cXlwdGlDVWRNb2xpUGdIemtRR1RP?=
 =?utf-8?B?WmZ0UTRNTU9aTmNLakF4em53aEJlR3B3dEtTbERXN05Vd0pJVGJRdXQ3RHlX?=
 =?utf-8?B?dTBEV25iQzBuWU84MGhTSUhkQ2FESngxL2RBRG04VXhabVYrWWkzTWVNMkRS?=
 =?utf-8?B?aGFaRUl5SW9QMkYySlFITmgzdERuNVdQTUxvRUl4MmEzY05pMHlhYkwvWUZG?=
 =?utf-8?B?SWU0dXpVQUN3aFREMVoxbWlsUFJzanZaZGlUT3R6cHBTVEZWU1F0eHNYc3FQ?=
 =?utf-8?B?c0thOE5rUTcwZXovV21qSHFyQlBteGl4SVVJTUczUjFyM3NjUmR1MVRpaXQ1?=
 =?utf-8?B?NUVlN1BLU3k0QXdwVHdlQk1ubmhlOWp1Rjc5dkFxU3FkSVN4NUh5TjloTTZX?=
 =?utf-8?B?SU9iazQ0ZmZJRHJFVWV4WThqSHlGUW56TGxyZjdrZEFYV0ZuYlNzN0RuZzNU?=
 =?utf-8?B?NDkwYWJ1SFlJbE15VGpPVmxsWlYyUzNwemhaa3pYU1RhcnRXbWRUdW50cFJX?=
 =?utf-8?B?dkNSWnpLaW9ldFU0c0FqbXFyS2xQYjFkVjN0RnUwUkFGWk9TUVlwVkxRYmpp?=
 =?utf-8?B?Vi9TdnRVSEJUMkdVUDMzWFdid3lMRFphZEs0dGY5eXZvWnFVa0pVRVViNzJF?=
 =?utf-8?B?YkpnRTEwRzFRRklmTGFxYjJvQi9HNjEvOWhDRFpQdUU0cFhWMVhFYVlKVlVL?=
 =?utf-8?B?Ri8vdDVvMmROaGh0RldBTVVqU0NTZG1HcXBnanlTRmwzREFiY1RWQnR3WEJn?=
 =?utf-8?B?ZCt2R2xSaGVjT3M0V0tCbnA5bHRsVmJzcDczV3ovTmFwQUp2T3djc1Z0N0pp?=
 =?utf-8?B?a2thbStDeVJmODZrREg1T0ZCM0dLazFwVzdQamR5QlhWZ1dGZjdUYmRmM3hR?=
 =?utf-8?B?U3RtUjZidVZ5aE1QTnV3RE5jemFqeHk1NWVIRmRlWEswRDZmeWg0eE1UeG5j?=
 =?utf-8?B?QndkUmxUVmxkd240cHgydVh6MGRCR1F2czhFYzZCemliYmFlSXc4QUtQMmxS?=
 =?utf-8?B?ZC9heSs2cXBTNmZLL2MyVmpQZ3FUNk1zdnJhYzE1K2VZS3lsb1MyRUY5T0Fa?=
 =?utf-8?B?WDY2enZuNXRhQ0NZZVh2VmZ0ZTJLV1hpNUVYOU1tbUZ6dnp5ZE82RVN1OFNX?=
 =?utf-8?B?aEl4N21MUW5kRFJRRVI3T1lUZ2tMRDd4S04wMjBNbDN2eTlYMUNUbFIwSFdQ?=
 =?utf-8?B?Q2gvU0hnQlFrR3NlVnh2MGtLakxFN01PeURUMzNjbmdmYVBOQXA2eWluVHRu?=
 =?utf-8?B?Vkp4VmNDMGRLSWZ6a3pLWFdWcHczTW5nUk93M04waURTb0tWc2VoR0Z3WFF4?=
 =?utf-8?B?Ymk2QWV1OHh3OGY1ZGlVZkh5T2FSbEhCblB2cklicEI0RlM1MVZmcjZYVHRC?=
 =?utf-8?B?Rml5aHBRTEZyTUVMN2FyZUsrL2tUZnBsMmtyS1dMUDJwS2lSU1I0cUJOR1hK?=
 =?utf-8?B?Y01ZUkZMS2t1MUtFU25JaWo3ZTM2czJuN1JHS3NuMWpnQnFHd2pYMys1ZWpj?=
 =?utf-8?B?MU5wK0tkQSt1bWFlQXdTbEs0c2E0RElOOEZCd25Ib3h0cnNqQUFRYndQem9i?=
 =?utf-8?B?d2xCLy9sZWg4M2VRdWJrSDVzWlhoSmxiQjI1NXprRThMMjVVSlhlcmVFUmVp?=
 =?utf-8?B?Z1B1bkUwdEU1YmowWUEzTVhjbVJJeExmNzBSczN2QTZwelNYN095d2ZhclQy?=
 =?utf-8?B?WnhadHNQYStxVisvNEovZldYS0wxRGQ1STBrVmhnZURxdjhpQVRrWS92STU2?=
 =?utf-8?Q?1sNCjzijd/U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYRPR01MB13941.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1Y5aEQ2TllBQkNoZFdtMHhQM1FiSS81QTZBbFV6VXdHVUV0Rk9lcEJMMnlX?=
 =?utf-8?B?RDRtS1NLVG1xR25VbE9DZmorS3ZMWUkyeHhNR1EzY2JCYzBZdm8rNCtnR1hD?=
 =?utf-8?B?TkJBNXREVElES29KSGdBUnNOT3VOT21FOGY0M0lvRTNjVzZQVDBJb3pxNHI2?=
 =?utf-8?B?S1BzSzJnSUJSRGY2UnFyN0FjRVc3ZUNHdXYySEIyMnlWSW83TzVEMmdKUUEr?=
 =?utf-8?B?cU1iVEg5YWpta0xKSWRMNStEaEpicHRKVFM2NXNEMlpaTGFWNUt6eHl1a1Bt?=
 =?utf-8?B?b3Zva1BEdEdFSDIrZEc0L3pGS21mNUQvUDVmZndnMCs0YjhTK0ZKanVMU3FS?=
 =?utf-8?B?NFAxOHpieDhyWjNaSTYyaWRGdExkemlXVXYrQ24vSDFOcHY3UFRqdlpmaDg0?=
 =?utf-8?B?a0pvaFJGUDVPVE9zTXN2cGpCY1JpNEcwMXVNd0RtWmFaQjZNeFp0c1FMUFVM?=
 =?utf-8?B?MHdjRGNEOVEvVVBISXVWNUt2MFlLdjNGNVZ5WEhxZ295SnhoOWJ0Ui9pRWtR?=
 =?utf-8?B?SFhtMTBiSXhOOG5EVHcwa2l6SG1DTVVLbFpWNjExVXVORElENDlCSzd4eWow?=
 =?utf-8?B?WmlITFJtQ0p1M1BJMXZpZ3hpTWtjRnpUYnJyODh0ZVdCNHZXNElJdGVVaXBt?=
 =?utf-8?B?bzZtbWNnZ1FyVXFGbHdLeEZ5a0cyNFZxMFh0R01WdU5RdGRUOFg0SWViSkUw?=
 =?utf-8?B?eFFYeGFSNFVNc3FReDg0TFcxcFlFcEJRWnZHZlRQSjhLdWFtMnpJb1oremNZ?=
 =?utf-8?B?elY0dHlJSUt4dzd5dFQ1Qk1acWFNQmQyNkxsQ3BuWDErWXJXZTZnR3UweDRH?=
 =?utf-8?B?K3lhZ1FYU1p3TnBKWi9ubTNmaGN1ZjUwQmk1aUREcmpXSEFUZWliUzJyTGd1?=
 =?utf-8?B?NHZBREw2QlF5WUFlSzh3MDc0dGRoejcvSHlpMk1zLys3STR0c09oQ2QvT3Fl?=
 =?utf-8?B?THZjM2dPaUVQeTIrZmhEdEhpdHdPYXFmR0FKMm9sMGt5bVoxNkZzcjcraTdQ?=
 =?utf-8?B?UGZPVlhmTzlPQWdETDZJYzM0VGkwbnYxeWF5blBnYW8xMExLaFp6eDE2OTRl?=
 =?utf-8?B?R3dWQXdJNy8rSmxiclBHYTFvcGxNZFNuMzd3L0xLQTcxb2s3NW52RFZUaUV3?=
 =?utf-8?B?ajZvYVB6OXRZYU9YdzZLU0RMV0taZW5ZdVNWOURrY0ZtTjRFOFJoSGhvWmFo?=
 =?utf-8?B?S1F1bDV6S0tKSFZpVGZua0J5dXh0QWQweXJhQnRsNzZZT0IyT3I0N2FodDdj?=
 =?utf-8?B?amFvay9rbUtZdzdYVnF1cHdRQ2lscHdYMGdJMzdGaE1GLzh3TnBtcGorTzk3?=
 =?utf-8?B?OWxORHhUbDczTW5BYXN4R0JEdFNVeVZzdG50MTNONWlvUVNKSWcrWDA5dWVW?=
 =?utf-8?B?TW9FSjloNmpOc1gxcWJvb3ppQU9uS1hNQ1NCdHRHS3F0MmlQNUUvZzZUY3BV?=
 =?utf-8?B?OFhtQlY2Mkp5TS9HRjhWd0RZK3lqTWJRYzNsMWlhRmZmemlua1EwbjVXdWRU?=
 =?utf-8?B?SWN5eU1FK05LUitWY1RZSjFhRlp1T0YzN2hTWnpZYWYvcnlsa1c4cUl0MFky?=
 =?utf-8?B?MzlydjlGdEZnNEdrWElBSTBrdTBnM05TZ0tEVzZRLzduN0NTdHAzcFZuazFt?=
 =?utf-8?B?WXFrUEUvTlB2cEdqYmw4SlVmY3I3ZVdQZDZBeEFaRDJ3VGVnMW9SM3lHZEhp?=
 =?utf-8?B?Q2VibjRId1NKTVRpMkViejJRT2llSnZNQW9kZTg4NFM4V0xFTW5DVjJEZG9X?=
 =?utf-8?B?cElxdU1rdDVmZjMzekplS3JZVE9XN2lZU2h1RVU4bVI2UU5TWmpBYmxTUncz?=
 =?utf-8?B?Ull3V0c1amxJVy9HL0NEenp2ZytRS25JV2dZSDkwN3MrYzRGa1FiVURqVHRx?=
 =?utf-8?B?ZXdoVWd2R0IyL0srMHBaVFhBWlBldDNDY2s2RlJtRGNPd0ZjMVQzaXd6czVD?=
 =?utf-8?B?YzZCRTg2Yzc4TlNIL1BDQnY5TmRHT1BlYnkxT3pwSlVnQnN6SG9hOEpDeUtL?=
 =?utf-8?B?TXkyWE5kdlRsZDhsNDRTc25VbXhHRzhZZElDWHRBNFV5RUF1Sy9kYkJMZWpI?=
 =?utf-8?B?bDRmaXZTWDZhQk91UzR1eVg3ZDM0QVE5ekZsT29SNW1uemRqZ1Z0OEZ1aXVq?=
 =?utf-8?B?NmlweXpnVDlXRUZEZkxSdTlwRklxclNXa0g2N2JybUNVeVFjTFNlVjM2SldO?=
 =?utf-8?Q?feCHs20lt2OFAceUg5oZaxY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28a96b1-6902-45f1-2879-08dd9c5e0043
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13941.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:02:50.3119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBayBC83kkD9r7zb73Ih2P0CEBErbVq3KOKilMc7ND4yoganaMy87lKW/8PikV0OmmQZIMUxP3hhLMRlMtPbOJlhjjiFE5C89AuloyvyNnJc6uaDbuJ8Z555vXutPx/y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16074
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

Hi All,
Thanks for your comments.

On 26/05/25 15:18, Dmitry Baryshkov wrote:
> On 26/05/2025 14:40, Maxime Ripard wrote:
>> On Mon, May 26, 2025 at 01:19:23PM +0200, Tommaso Merciai wrote:
>>> Hi Laurent,
>>> Thanks for your comment.
>>>
>>> On 26/05/25 12:49, Laurent Pinchart wrote:
>>>> On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
>>>>> Hi Maxime,
>>>>> Thanks for your comment.
>>>>>
>>>>> On 26/05/25 11:26, Maxime Ripard wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
>>>>>>> After adv7511_mode_set() was merged into .atomic_enable(), only the
>>>>>>> native resolution is working when using modetest.
>>>>>>>
>>>>>>> This is caused by incorrect timings: adv7511_mode_set() must not be
>>>>>>> merged into .atomic_enable().
>>>>>>>
>>>>>>> Move adv7511_mode_set() back to the .mode_set() callback in
>>>>>>> drm_bridge_funcs to restore correct behavior.
>>>>>>>
>>>>>>> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI 
>>>>>>> connector helpers")
>>>>>>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>>> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
>>>>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>>>>
>>>>>> Explaining why, both in the commit log and the comments, would be 
>>>>>> nice.
>>>>>> Because I can't think of any good reason it just can't work for that
>>>>>> bridge.
>>>>>
>>>>> Sorry, let me clarify and share with you some details:
>>>>>
>>>>> adv7511_mode_set:
>>>>>     - Is setting up timings registers for the DSI2HDMI bridge in 
>>>>> our case
>>>>>       we are using ADV7535 bridge.
>>>>>
>>>>> rzg2l_mipi_dsi_atomic_enable:
>>>>>     - Is setting up the vclock for the DSI ip
>>>>>
>>>>> Testing new/old implementation a bit we found the following:
>>>>>
>>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI- 
>>>>> A-1:800x600-56.25@XR24
>>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>>> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
>>>>> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>>>
>>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI- 
>>>>> A-1:800x600-56.25@XR24
>>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>>> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>>> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
>>>>>
>>>>> Same result but different timing (in function call perspective):
>>>>>
>>>>>     - old: adv7511_mode_set() is call before 
>>>>> rzg2l_mipi_dsi_atomic_enable()
>>>>>     - new: adv7511_mode_set() is call after 
>>>>> rzg2l_mipi_dsi_atomic_enable()
>>>>
>>>> What is "old" and "new" here ? Is it before and after Dmitry's 
>>>> patch, or
>>>> before and after yours ? Please be precise when describing problems.
>>>
>>> Sorry, you are completely right:
>>>
>>>   - old --> before Dmitry's patch
>>>   - new --> after Dmitry's patch
>>>
>>>>
>>>>> What do you think? Thanks in advance.
>>>>
>>>> You're only explaining above what the "old" and "new" behaviours are,
>>>> and claiming one of them is causing an issue, but you're not explaining
>>>> *why* it causes an issue. That's what your commit message is 
>>>> expected to
>>>> detail.
>>>>
>>>
>>> Thanks for the clarification! :)
>>> I will send v2 explaining better this.
>>
>> In particular, if the driver needs to have mode_set called before
>> atomic_enable, you should say why moving the call to mode_set earlier in
>> the function wouldn't work.
> 
> It might be the same thing as we had on PS8640: it had to be brought up 
> before the host starts the DSI link, so that there is no clock input on 
> the DSI clock lane.
> 

Some updates on my side:

I'm not seeing any differences from a regs perspective when using the 
old driver version (before Dmitry's patch) and the new driver version 
(after Dmitry's patch).

In particular, i2cdump -f -y 7 0x4c shows me the same result.

Unfortunately, since I don't have the ADV7535 datasheet, I believe this 
issue may be related to the functions call sequence.

I agree with Dmitry's theory.

Let me gently know if you need some more test on my side. Thanks in advance.

Regards,
Tommaso








