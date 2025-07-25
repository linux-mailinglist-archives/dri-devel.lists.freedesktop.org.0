Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63980B11FC0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 16:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA1310E374;
	Fri, 25 Jul 2025 14:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="ZoxmfZxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020119.outbound.protection.outlook.com
 [52.101.84.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED35D10E374
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:06:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hV3w+fvNiAbPcLPVL6DtE0wheQNnwznHC8zRqif8Mic9q8RYsfYQBVTqUjvxB7F+WJj8lmM/smXSA513GUuMHE8/zZ9i3F4htcrEqmoXLMLsulCz09z3dipAmk9u1E9ku9M5JI6bkDIGe4qrOEikHXBpgBA6sYCdk9HHxvLTrJpcvxfU+lCkEipN0yCFOsdXyBS9JlAWhC2QP/cTigQp/ntALrBow6sZCY1bJ/XNmC2/kWYUbJ73HOniYKJYRHeLmpWboNG7dI/jRksnruFVvqYpyt0j2R3GOSp27CXisGrXfZ7AGLmAXRSDI0sMO2t52wmNlYYMiSfoRTJ2UveSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6GvOr8rlvCqGEt5E0ZVFivmeWba41UMwLIhyLyaFew=;
 b=vf086KlzM3srl4Xagflf2lizlPoPojqV+PvOMcAE1kjlZ+RcLFrLKEDsGTBsZsgHdVlFulwJVguKlktJIEU/7ytAdgX/TF4svHlV3FpFlPi2g0ZM3Eu7t2dJYAowrbyv4qJ6m68APafVRYdBKuxQCmd32GB7pM+txJ+bcWEsCY3d+HYGVPfnZO2WNBFGbRfOSZiSrFdxH2F9uw+w0WowHGreWOq9il4zKbxCjlqRxQl0+ldQrONLcemJAiogejOAZKVdduBw91cHRHqjt3F4YHBgt8XhKEgtCUOcVeO7qAMmtM9DpDZADyU2g7hIVju1OSGvvAh79+FgwqKG5iC6pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6GvOr8rlvCqGEt5E0ZVFivmeWba41UMwLIhyLyaFew=;
 b=ZoxmfZxahdwSqO27tmYyBy95q1cPbTZjkVzlwtpO50rN7VvazBP84zoU9Q/J0s8YmrJSNkv7a5MTJoLk75G7LgVaxtaIVc6KPzcaMsla0pR4VzML10fFs0/Ov6kms/mKS76YWqH95btih7wCH2YTPFP60vbJNkRBizZHaQbXau4vC9mEXm66W1b9tOwyU+t5kNhtS/4jpWMCzsH6t+xWN37TNqXLKYdQImohqSpR1EHo8ePXoovqBNCokhtHB4yBDCOqbNCqWfRwa+Nmr2gFKgS0nDglCRf5rHUYoPpM9HjqAxZMtAQvXlKH3AwxQsjahc8qUkkAYQwa1yTEDw62lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by DB9PR04MB11512.eurprd04.prod.outlook.com (2603:10a6:10:5e1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:06:46 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8922.037; Fri, 25 Jul 2025
 14:06:46 +0000
Message-ID: <03096180-1e33-4dd0-b027-cc18a5010e46@gocontroll.com>
Date: Fri, 25 Jul 2025 16:06:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: backlight: Add max25014 bindings
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
 <175345006903.1002291.4212198267952446360.robh@kernel.org>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <175345006903.1002291.4212198267952446360.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:208:be::23) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|DB9PR04MB11512:EE_
X-MS-Office365-Filtering-Correlation-Id: 879b086d-e442-4e19-54af-08ddcb847dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzJiTXlkK1hWQUxmQWJ6Qm5nT0pxUWpwdlAzK25jWEVXU3lFbGxsRVNNbWRu?=
 =?utf-8?B?emQ4bWNzS0VJL2tLa0ZjUk53Z1lBa1Q2VDVURUtBeVcyaitxdDg4di9qUmVi?=
 =?utf-8?B?QUhMV1VWRU1kb2tWRmhJa0p1VGxncjB4amlsejBENXo5ZHRPa2luL29nY01P?=
 =?utf-8?B?K3J0MTdNQmRpZWI5blcvOG8zbEowM1Z3YnlEelVtZkFXWVNLN0d6U0VmYTF0?=
 =?utf-8?B?UG9yeVBkMzhZQlJtVlVoT0I5eDJIT2lQb3o5Q2h3T3ZOMTc0bDM0Q2M5U0tN?=
 =?utf-8?B?WGhDbnJiYkk1TFRVNUVDUlRzaEl2c09FOHFCZENLeDk2SFFDMjlhVGhQdGsz?=
 =?utf-8?B?VlR1OEt5RWowcVMwSDNBc29Xclp0WXV0Y0p0ME1Ca1ZobzUwcExGZTBXczdm?=
 =?utf-8?B?TFc3NzNIM3hwd2x2Q3ZyTHZRM3cxbW1aWkxtSDlmNndCTVo0Z1pwcFpzQzBI?=
 =?utf-8?B?Y01QTWJOSXBpRjBWcEhrcXpiSVYyUzlTODhoTUJheGVHUWZrNDFpMDMydlN3?=
 =?utf-8?B?aEFNUXRDU2QzUzhoMDlJZEw4RXF6bW1mbTJoMC9CbkhRYnJiRkFSL2dDaDRQ?=
 =?utf-8?B?cjA5djhJWFI2NEQ1Zys5SGZFcTlsY1lReGp5ZmdweUZFVllqQXEzRFpLOURQ?=
 =?utf-8?B?UnFCdHZmdVRYUWQzbU1qQ3RzVkl1Zk0yNytPaVVRK1Fja1hwVGJsbUxvRkYz?=
 =?utf-8?B?N2psZVl5R2ROaUh2S0xsb1lKNExWQXNyRmhrOHlHNEVEeXd0WHdZMmRjM1Nr?=
 =?utf-8?B?dEZIanRTLytRTEkxTnNPOUFEUERaSmh6RVdWbHhOaHdLeE5RZi9tYjd2dnpF?=
 =?utf-8?B?OHRUN0FrZHArWi9YUWZ3V05rN21nQ2xMei9EV0dxZlZNK2FYOFZYUitsbkFJ?=
 =?utf-8?B?MHFuaTR1bWZRUEp6eSsySUpFQXphc2NTTFNJN1U4OFZhZWJKbDFIeUtTbGdU?=
 =?utf-8?B?NWp5dGRFa200QXBXblBFY2xVU1JGd3IvK3kzcmUvMi9zMUVvWDB4UG9sMlMx?=
 =?utf-8?B?WW8vRjJ0UlNKSXRlbjdDVUxKMmZObkR3YzZ2MlY4dDdNREUraVNjcFlNbWdX?=
 =?utf-8?B?TTYvV2NmdHpBL3dZL0JBNnQ5V0t1NEUvNjQwMHRrd3JaTmVtSU02bC8xZmNh?=
 =?utf-8?B?UnB4ZC9iRkpPQnc4SjRIcUJVcVc4SHlSQ3ZoT3NkS0NMRlc3R2xiOWVPb0ow?=
 =?utf-8?B?MlRjVklFclJsS1paWGFHNEFlYXpEd3dZQlpVTW1ORFR2cjQyRGlVNVZhZ1Z4?=
 =?utf-8?B?Slc4Wm15Q1lZMmtBS2hDL1cyZTVyVkJQb0JNZWhwbmkyRVBQR1pxTHg1NHBL?=
 =?utf-8?B?dVlPc2dIdXRYWjFsUWZJR3dES0RwQTlkWUh3c3h1TEY5a010M2tPY1pLcUZs?=
 =?utf-8?B?bHpGdUhFZTF2Qzl2S0p2MXg5R0phU3plbUgvTGVuODJsUUI3cm1OOUZCT0ZD?=
 =?utf-8?B?NlQyTFMrWENINTg1TGxzdDhER2l6Tlh6alVxVUpUcExQeG9nOGU2NzZvNVFv?=
 =?utf-8?B?M1dCeU5uU0V3S0JxbmVoYXBoeFIxb0NXMnVWam0xUUhNTHVzd1lheGNCdXIz?=
 =?utf-8?B?dGZ0NlA4SE9yNjY4R0dob0MvZ29ITDdSOGZ6ZzV0TFhvVHcvSjhJZjlWekNQ?=
 =?utf-8?B?a0JLVnhGZlVlZUt4QmJvQ1FBT3lEWkQ0dGlkWGQ0d0h1VjNEUlA0Y2hHMjMx?=
 =?utf-8?B?aG5vT1EyUlljeGVMM1hiUnltZG80M0kzdFNrV0pFd050NFdHbUlWUmZxVmVo?=
 =?utf-8?B?SzNVZ2pMWi9iVzdTRXRxdjgwcG83QnZydVpGL1dpT0dGMTRWRWNBOU9OVVFy?=
 =?utf-8?Q?+dEd87Q4uWxBQ1CkwWKRoPuvlWr3+e+93HP0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUdhZnY5b044NWJSQUVyVlNjK2RYZTlMb2gyWHRPb3hIZk05dlFUMXNWT01D?=
 =?utf-8?B?SW00K0R2cmdGeUZLZ3hHUzNiTStBRnBOOS8ybGIreU0veUtxeWQrQW9rYzVY?=
 =?utf-8?B?QlJzVkkzRzBQbTZiZUNjUWdxeklFbEVuREx4ZCtpQnlneStscjMwcHh3d1hX?=
 =?utf-8?B?QjZDdURIVVpVT3JBWG40TnR2WURNVXJvaHdnN1pFWXdyVTEyc1VMVGdGd2la?=
 =?utf-8?B?eE5KTFIrSnQvYXBaQ1IrTWVDYWtrdUkxKy9jWGFQanJYb0JJSVpuNlNMS1lS?=
 =?utf-8?B?eEFxeDh3S2lPRkQvYnczR3JlVWREeFEvNlp5c0pWYTV1ZFJmb3dkcEtZVUkv?=
 =?utf-8?B?Tk9KM29JTmRONURyWmhXb1FuTDlBNWs1Q3Z3bjdoMW12c0N0RWJoQm4xckJ5?=
 =?utf-8?B?MVRaRXBxODkvV0FwalJlZTh5bFFGdjZCdVBpTy9kV1JKMjVrelQvUHlNZmM1?=
 =?utf-8?B?ekJGbVI1OFB1em5VVmpzVm5KYjZJRXJmbVh3WnZ1bCtIT29PV3dFNFMzUVly?=
 =?utf-8?B?SFlxREcrZWFBTDdRSGVJZmg3UW15YlRLY2JXMDFrbTlsVUZqMUJzSXhNWXNK?=
 =?utf-8?B?U0k4dWFRdGtqTHdqSXZudnVTS2JxM0NRYnRjZTBGcnlYVzlnRFlDZWU2d0JC?=
 =?utf-8?B?dDEyeXgrRUdUL0RTYXMzU3NCeFh0c0g3Q3puM0JwOXN6d0NCOGR4RXZnUndv?=
 =?utf-8?B?RlUwZm1nV1cyQlJkQXhVMFpBNjBsWEpKd1g1VkVIMUFaRWM2RG1XdTlRYkxP?=
 =?utf-8?B?SkNHUFU2cmV5Yi9BZXFtM202c2tmRDZNUC91YldVelhJVENyN1lQN3ZNVWM5?=
 =?utf-8?B?Q3hucjZ3dGNpMmdyaHBtbG1lM0RtNzlzdTNjSkNZc1kxZnJ3Q05pWnFOSEFS?=
 =?utf-8?B?OTYzU0JPZTA4OVVKUHUrQXNRTFNnb2xGYWVVS2ltUzlKVG94cUVWVEwvQTVm?=
 =?utf-8?B?WFcwYlA0YnJIMHdTTi9GWThBdlFIZVFXSTNXZWcxQ3pxVC83cGdvR0dDNy91?=
 =?utf-8?B?Y0J5a2p6aGNxUVIyQ1QzL3QwQ1hsa08vVmdwK2dFUnBSdXYwQWFaT2lyYytY?=
 =?utf-8?B?bkl6eFprMFEvWUhGc1ZHaWd4Qkc0bVRMeVV0QVd5SVNrSXNXVFJxL3FiZlZG?=
 =?utf-8?B?TDkydWdCM2thQzg4QXJRZnk4eUVzNW5aUXRqVjk4ZFQwZ3RPTnFOZmZTQ09Y?=
 =?utf-8?B?OTdXVVQrenM4NFZRR1VPMjlwQUV4SndwQlZzc3FvazVqZEdqZVVIRjRwdnZx?=
 =?utf-8?B?V0RXVVZEdjNmYVFoZVd6VDFMcktUWXFBaTZ0MVVINWVmcHdXbGdoK2tTWFFr?=
 =?utf-8?B?NjZTcFNrSmJCK2lTZ2pURHpzTnpMWWo4bS9xVlFObzY2ODY2SmJyMThZWUhX?=
 =?utf-8?B?Um01WkZlek8rbmJRSmp5TWk2eTlDTEJZVnRhc0I3dGlIZHl0STFFNjFpL3Zo?=
 =?utf-8?B?L3I4Rm9WQkdyd1JVbFVIeU0yWDRBbGNML0FBM2NvRVZXSENxZStYN2x5VEJL?=
 =?utf-8?B?Tk1GYlBxSDB1d0JOOTAvWm5OaXR3TGpvVmcyWGc0VStVemlBNTZycndZODB0?=
 =?utf-8?B?aEZwaHUwb1VKMlZRd3pQcktIMWJNMTluZ3RqTlhmSzg2YmhBbEdDSStCV1NI?=
 =?utf-8?B?YkZGSEIvZWwrUzcvdHZvU09XWGQvQ29OYzYvdzlUdlgvVVBQRGtURjQ0NTZX?=
 =?utf-8?B?OUx0T0V6dUFyYUlGYlFHVkNTNFpJTGgvRTlIbFpUODAyczZVYmxFckdhMUl1?=
 =?utf-8?B?MHVPTjBLVFVKRG9LeUFWUGJNVGVBWWxqVUF4SnRhTjZrNGxqRGNXN01EVDBI?=
 =?utf-8?B?VHQ0WVZpYW8xRlFERU41RHkxdmo4Z2x6K3BkR0lqS0Z4L2c4c2pSM01Wd09I?=
 =?utf-8?B?UGZDZC9rYmlQRkh3WDJoM2h4a200dkRnNVVjdmxXU255UkEvdVRWRWhLREVP?=
 =?utf-8?B?MFNveS83Vk8zN1hENzNwaXhISktVTXE0K0JSWldMUFBJRFcwRmNrNWRFdEw1?=
 =?utf-8?B?Mm52T0FDMTBmMkIrUTVXWldxRTQ4OE9uVGp4RzZaazJXRlRBSXp0ZlRvOWtk?=
 =?utf-8?B?YXB6elJIMHZQUjdHWWJHczlqNzdYcE5wVHRBeEpFM0wyd09FUU5lQWM2Q08x?=
 =?utf-8?B?cUZkOUhtMjVTSWxhSnpnWVRhbktTUm5QZFhxOVdmTDNBck5yS3FWNDdpMnNh?=
 =?utf-8?B?dDVkMFhuNXpEUUxYR0hBK0J1bUlhVk82d0Q5Y2NkaEM3eDM0cXhRUEhxTmk2?=
 =?utf-8?B?cUR4WDM4QWVGTzhYRkVlNGFNTlNnPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879b086d-e442-4e19-54af-08ddcb847dbf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 14:06:46.3628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /p1cbB29eNqAJH4j7u94nnOG01+XcVIIoFEdKQInoPAa7+K3K2WrN++nh9u2h698dcTt5K+Nx61WUFvaPuHjeEof45Nt/CGQJSD0U0ZqJQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11512
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



On 7/25/25 15:27, Rob Herring (Arm) wrote:
> 
> On Fri, 25 Jul 2025 13:09:23 +0200, Maud Spierings wrote:
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with intgrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>> ---
>>   .../bindings/leds/backlight/maxim,max25014.yaml    | 78 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  5 ++
>>   2 files changed, 83 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:

Pretty sure I did that, but I've never gotten those tools to work quite 
right, I'll look at it for v2
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.example.dtb: backlight@6f (maxim,max25014): Unevaluated properties are not allowed ('bl-name' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#

Ah oops, leftover from old version, fixed in rv2

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250725-max25014-v1-1-0e8cce92078e@gocontroll.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
Kind Regards,
Maud
