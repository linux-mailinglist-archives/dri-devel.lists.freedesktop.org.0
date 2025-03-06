Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE605A54269
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 06:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B87A10E84A;
	Thu,  6 Mar 2025 05:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gYmdB8V9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A9210E84A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 05:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANPkFBlNCG6lkW9+JSrg7iRji+nZpOcsLIDMwisbl9vQJp6pG+CMX2FsVw/4HTv0RbHioTLpH4QiXEP5HZUKmQ1BgZ1cdXIhaTMCu7z2378ArvJmidN7dy5YADkh05d0uRzFkp1AJH1+xpd8fPm5D6NWpve82PofNNS1sSBUEcPGK64AviCjYucVJ17R50sEQtwD0QZy5LjzIj5Mrg5tWv9s0sPoQLI+ateD3gZ5yEbw6cnQthKhxZ5nnmQVo9WpWxIBuJAGyJPijCIOr83iHTaWjMEwIcZTKMa93EWkavzQQialrnedIjoQXhKC6pZ1mvBo+wotH44BDsX4BVOljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18G4MRU7bour7zR6mZc1ilHo6WwIUIHtz/Q8rzxIRTw=;
 b=Twne/i5jGC+jpqJjRH6rwsNTPVqWFuMJi1qQcurLFfC+BECGBJ8waX1vFjx0i5gtovnrWOM76IXd1eMJ4uX2YTkaepAkHdMvgn8t/zWWjcig5wrrWhTZdxlx5Rm2sbXMR3jObXQ3c8jkJLGIoSUI3/RTTAgJeVU7bKUUv3sQ1w8ArbcEEhksDvT9Fcwp+EzEVmNYE5oyiIPNANtNIIh9PHjPSiU/HYMCXm3li+sisGtdUISjUPAciS7B5K7VcG8z/YFSM0dKJGcxp5CncyxeZ6FFLsI0b48KmSQ7qX3Qn6KmeuVhJjBGezx9NhAsRTg4NuAokaP9FsWPjGBcK3iJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18G4MRU7bour7zR6mZc1ilHo6WwIUIHtz/Q8rzxIRTw=;
 b=gYmdB8V9lNjp0GThSdangjNb0qo2b1r981arc3iMWKuO/1mswiJqmWBzQk+up5sHj0PkrE4CZc1FnFRcpI8Z72F/I51VkjXUD8jI1hW7dPSXZPjq+/Oe6ANVMfqHh/i4X5unZIk+YLn5hVSDsncdyHOrcstelZvSnyO58G8C0DL94aRpqT6hMqngbAxo2LpzOfDfFIuZLDWCvn3/rK/FDfbKFTG1rB2EQr+viR6AU7Q2u1M/rh0zoqaZiZjHkqtQFGxPY/twx+Urx00B8kc037TiB3fEzFIcY0MTpJLQ/vTkTMJeNQ/Ldqke2ekLvqaiTAAW9LWSp+Rgl9acoghkfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 05:47:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:47:54 +0000
Message-ID: <b6320f0b-8605-455f-b834-57a8bdaf3f91@nxp.com>
Date: Thu, 6 Mar 2025 13:49:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
 <20250304-wandering-tangible-doberman-5b6dd0@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250304-wandering-tangible-doberman-5b6dd0@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd8fa31-4131-4640-c5a9-08dd5c727063
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eExzeTRTRGcwY0R0bXpQQ1NMTEVXd0lYR3RaNkpVZ1lhakV3MVQxc25xcEZF?=
 =?utf-8?B?UkhKL2lkTFlSY3Y2a2YzYXBQbkFHQzVkVm9sem5IOWVJNmVMUEJEditJQkRS?=
 =?utf-8?B?QnB0UkxseGlJeEVzVHJCYktvNDRKYStQbk1nVDNoT3Q5TkxSNUlvd2FCT2U3?=
 =?utf-8?B?MzNHb1VadXdYRmNMMXEyV2ZGeDRzK0ZuYXdHZThWZS9Fc0ovMk1weGZ3K2N6?=
 =?utf-8?B?MUk4OFM4SVljdnBZT1ptVUtTNlVjcm5scERXcHZ4bTNQWjVXMU50ZE1kck9i?=
 =?utf-8?B?YlFSSkNhdTBBMVFQbm1DRnpoRHVGeHJSdVZMR0hFb0c5QS9qUzVQQzVKYjUw?=
 =?utf-8?B?QndGZ01pekh2QzFZKzV4Y1NTdDgwbnAyZWJOTVh2cHdjU3o0MTJtL01xK2pa?=
 =?utf-8?B?dnpWSDhTb0ZGMklZVUFwM0kxS3U1NUdSRzc1Z1RVS2Qzdmp1RWhWSGNTMGU2?=
 =?utf-8?B?bGpqbWlNenJDd09VZnExeEhxY2Y0UTVQL3NVdnU3Uk5rN0YxWGttY2c5UG5t?=
 =?utf-8?B?V3hHTFFhVFNZb1F0R2Z2ald3QnJ1ckEyYnd0elRrSHBaVlo2eG8rU0JtVzJZ?=
 =?utf-8?B?Z3cyS0dBOWIzcVVzMEIwbkdnL0RoVEVlN25NNlVPbmg4QVozN3JjUGlvdjBw?=
 =?utf-8?B?UzUrRDRuU0lPcUVwbHl1RHNFejRqUjNLblVwZ2pUN1lwS3RVbWhGVitXRkpn?=
 =?utf-8?B?UTZHWk1ZRk1sbFdDd1dzM2dEZ1JwUmRRcUNaSVZ3ZWtiVGh6QWpWc1dqbG5j?=
 =?utf-8?B?dkk2eklHU21tSmFKYXJSOWY5OWUrbSs0Z1pzM2U5K1BrdlFzVEc3dWFvZk5v?=
 =?utf-8?B?dzdRS05scjN4QkhxMzdzeC83Snl5TlliK00vM1BmZ1lBR2FPY3VIWDFKdGw4?=
 =?utf-8?B?YzNvWDdDVHFqMmVMYXBuVjFYeUd3MSsrL1VJQ0xoMzViUGZ4MDJUbVFDUVMy?=
 =?utf-8?B?R2JYYyt3S20zRHBUcE1YdmNoNzcxSEFJT2NMU2R6b2ZCN3plYS9LUEFHTzFy?=
 =?utf-8?B?QkZoakdwZ2dDamhTaGVCZGFWWXluaHEzZGpWQTVTbERWcXhmdlZtOEVWRkl4?=
 =?utf-8?B?aFJ6UFoyd1JTOEtQbG5JcHI2YWdOUGd4NHNrSGZHWnV0cWR2SXNMM05RQ2xi?=
 =?utf-8?B?dWRWLzBRYkVpd0dtRUVjT1JqcVcrZjlGZkxQT0RWWW0zNElHVTEzUHFxQWth?=
 =?utf-8?B?TkEyckwyYVQ1UmJJd01ibjArOG1IdU9JVmpSdHN1ZjZWN0dHMDVabUNKa3JV?=
 =?utf-8?B?UXlXWXEvT1AwdzFab3Z2Y2lnRk5KM0tOQ3p0ZFpTZlJZYmpJMXB2SzhJL1h4?=
 =?utf-8?B?by9QZmFabFlDeEZXZlpVeG5LK0FuY0ppT1l2TE5NZGJ1M2lJTG92M0N1a3RY?=
 =?utf-8?B?VG5MV2NnNDVHdlk3bGxKQVF3Uk1SdmhSTC8vc1BnWnJ3UWd0NUY0ZXhIMGFH?=
 =?utf-8?B?d1VMUkNPckQwdll3MURZdkpFcDJtSEVhM2Q4VDJlM21vTU1uWTdhSzB0MnBj?=
 =?utf-8?B?c0NyaldUZ1VqSXVZZXlub3d3b0lZWmx4YjRwUGpuek1iVlZPalRrajR3d2Z3?=
 =?utf-8?B?T3U1b0M2TWkwMUVyV0U0L3RmemwvRkdTQzhvVmwrMS9ITlRtRHI2dVp3YTFP?=
 =?utf-8?B?TDZqdTcxQmpwdzAyOFRoTEE4M0l2TmtHaHlmK3Vnay9CRmYwM0hLSnNTSnBh?=
 =?utf-8?B?dUhMZGNVT0ZHVTQ3WDhzbnVLWmNaRmJ1dzkvZGJNWmRvS1phZ3JIM3JkVUVQ?=
 =?utf-8?B?OVVsL0RIaXhFcTJmZ3gxTDkvcHFseTRmamlheXdkVjdQM2VCU3grRzF6ejlz?=
 =?utf-8?B?UzdIcGpjdWd2bWI3YW91UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHp0VW8zYkZmMU41NFo2MFY3WjZnMTEyUHFkVkluWHQrUG1ObUp5MDFUa1I4?=
 =?utf-8?B?SzVmUzdoYWdxRGVSTG9XVHJOY2ZvdzFFenVTMkNLY3BXUUVPc1lzNXpCcXJy?=
 =?utf-8?B?VHBGVEk0Y2hHUklTWVJNNGwwNENLVmlkZHdlSDg0Nk54Z1FTZFF2aFNkb2xw?=
 =?utf-8?B?ZlB2Zk5oazhQU0FSZmZvS3E1dUFhZ2k5N1B6dUNiQ3dxb285bk1kaVlidVQy?=
 =?utf-8?B?L0UxdUVIeFNiZWNRUXloanpCYnFUeWp2WDNZaEdSNmJCaFMrbVY3OGtUZnMv?=
 =?utf-8?B?MVFsTU0wSDZ6eFM1QS81ZFh0UkN3QWJMcHVqR1FkUWlGeGVYNlJzdU9SbDRq?=
 =?utf-8?B?MVExZFlJenBSbmxReVg3MFMyQnhKKzhXYjkvWFpHaVI4VkJCMDREZHpwaUxT?=
 =?utf-8?B?Mk9wZFZ1eWlXYkJQUTJsL1JwZXc1RjJ6cjUwT1ZkK3hFbllPMjhhTzMwVDky?=
 =?utf-8?B?WUJKN2hOS2szV0l0NGtkdG1GR3EwUEdOVTVWYUpYUUhYTksrTERWU0NzTFRM?=
 =?utf-8?B?cW9IUXhROGQvUU1PYlVzd3o5U0Q1dkhVREx2WjZydXZkSUVyTVpXUEZNSXpW?=
 =?utf-8?B?VjVPUDFhWkptM0JyK2c5aU9NNmdkVExkUGZ6SmhUdUxNSXF0OHplL0J3dGJ6?=
 =?utf-8?B?V05yU1V2NVhrd2VjY3UwaGt1aG81VFcxSmJOQmpDZmIyOWRYNEphdXNjZzFJ?=
 =?utf-8?B?WkhZbnNibllPcStzbXBEajZHbERzWndlaUE2NmRuVHMvMEd3TlVZWkluRkNF?=
 =?utf-8?B?dXdSNkdHRWQrOWxmNTE5M2JxMk1YdVRGa2ptNkxZeVRFYktHZGx2dk9LaWkw?=
 =?utf-8?B?cFJETTh5QkpjT2E3UFRTMFFrSzllUW9DS2M5WE04bWRFcm1BOVUxMUpBS3Y5?=
 =?utf-8?B?bS8xMlphN096aWxUWjBmYS9HcnQ5SzdXd2ZNNkhyTzBxSzRDQTA1dWE0ZHRO?=
 =?utf-8?B?YjI0ZVU5ODU0NjhiSHZ1dDRBS3ZpckkwMFRESlFvaFJySTZNbU11V1JVL2Za?=
 =?utf-8?B?bXlXTlRVbXNKZEtUbFpoYVZtYkpGeWxMaUR2N2diL2ZyS2ZLdzVEdFo3RWh1?=
 =?utf-8?B?aGJ2dm42Q1RoT05aVHhQRGRkQXpnc3RWeUtBZWtNT1V0cEtWd1B1N3YweExn?=
 =?utf-8?B?UkJxazVuTWpQdEtWMWV3akpaWEoxVmdVNFlhRURtOUVibTBBT0VsaTRHUmEw?=
 =?utf-8?B?UFI2L3dwNUliK3JOWXo5WkVzS0VSdi9JMlJjQUJLYkg0UkFZcXI0UkpvV2Jm?=
 =?utf-8?B?NlA3dlIzQWlLdXUwRE5zVExpbE1aY2h1Njh5bjByQklYVGFMc1VoTVAyby93?=
 =?utf-8?B?ODBCd1BxNHg5UW5UV2lETCtGcDlaVHFlbThHZ0JOcUorWEkrVFh3bW9TaW5N?=
 =?utf-8?B?NjVYSEVKL2xhTEhKc1llNnFFOU44R05rdW5SaFhaRm5aaXFyTGsxak9RZzhW?=
 =?utf-8?B?TVJuaGV2YWNDcEpnNjJEaFVlRTlRRTZ2azhWSG90RnBIZFdNREJRZTRvUld1?=
 =?utf-8?B?eFQ4ei9mRDFEd1RXOXpPeXBqNzdUWEJZL1Z0REphbzRmeEhpbW5jcEhNbmhQ?=
 =?utf-8?B?dW56SWxpRmlqOEVMY0hLMzRNQktIdDRBSjFGNERxQ1FTa0YrYkdTN3h1MTVK?=
 =?utf-8?B?RzFCbjFIeEJ5Z05mODNnMkZwNmVqK3NZbDVCNkpucFpkdXVFU0FDNnVINXNJ?=
 =?utf-8?B?TjVPSk5qbGVLazFNQ3JJZFZycVIrenFGbzRPMFoyMkxZMDhXYTVzcm0vNnQy?=
 =?utf-8?B?elZEZTdnaUh1SlVHYVpZd3BFQW0wallnYnl4cFIrK0hXcTN6em8wc1RGUE9s?=
 =?utf-8?B?am5IMkd4ODVKaHJvOFlvbWRqTWhITGJhbEV3WkM5eDJUM0p2VmdPaDFveWM0?=
 =?utf-8?B?TkQyaHFZS2NacWRXenE5OGdYNnl6eVhNa0Y0OUVQenJvcnRMTU84aW9mY0h4?=
 =?utf-8?B?WFd6bzZuZDBsYWtnQ1lhNDh0ZC83RW5QMEZna0dGOHJZVHRKQWxRdWdIRkJp?=
 =?utf-8?B?ekQweU0zU0NDR2syamZIZ3JPdkZOcUlNWUljdGFOcU5MTVFaaVV4RTRKT2VS?=
 =?utf-8?B?NDRhUFpzbGlvbkxQM2FKWkl0T0Zsb3lQVTRidmIweHlsaWRNZ2F5WGluR1NY?=
 =?utf-8?Q?mvRr8/rlesy7jMj3RWUZ1DhHq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd8fa31-4131-4640-c5a9-08dd5c727063
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 05:47:53.9791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKFwilB71IM9mX7uWaemI8m/RcWGlTjQJmRj7er9BeLsK9fGHTTIcX7uwX7mgNbxFz1nOFK0r7RYvcOWvaVuMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
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

On 03/04/2025, Maxime Ripard wrote:
> On Tue, Mar 04, 2025 at 06:15:28PM +0800, Liu Ying wrote:
>> A DPI color encoder, as a simple display bridge, converts input DPI color
>> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
>> converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
>> bits in every color component though). Document the DPI color encoder.
>>
>> [1] https://learn.adafruit.com/adafruit-dpi-display-kippah-ttl-tft/downloads
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> 
> So it's just a bunch of signals that aren't wired / set to the ground? I
> assume to free a few GPIOs?

Yes. Freed pins could work as GPIOs or other functions.

> 
> I guess that makes sense.
> 
>> ---
>>  .../display/bridge/simple-bridge.yaml         | 89 ++++++++++++++++++-
>>  1 file changed, 87 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
>> index 43cf4df9811a..c1747c033040 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
>> @@ -27,6 +27,7 @@ properties:
>>            - const: adi,adv7123
>>        - enum:
>>            - adi,adv7123
>> +          - dpi-color-encoder
> 
> I don't think we can claim that there's a generic DPI color encoder.
> Maybe we can add the prefix dumb or transparent?

TBH, I don't have a best compatible string and open to suggestions.
"dpi-color-encoder" came up to my mind just because the MIPI DPI standard
documentation mentions *color coding* and this bridge changes the coding,
hence *encoder*.

If folks think "dumb-dpi-color-encoder" or "transparent-dpi-color-encoder"
are good enough, I'd use it.  Just let me know which one to use.

> 
>>            - dumb-vga-dac
>>            - ti,opa362
>>            - ti,ths8134
>> @@ -37,13 +38,31 @@ properties:
>>  
>>      properties:
>>        port@0:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>>          description: The bridge input
>>  
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              dpi-color-coding: true
>> +
>>        port@1:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>>          description: The bridge output
>>  
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              dpi-color-coding: true
>> +
>>      required:
>>        - port@0
>>        - port@1
>> @@ -61,6 +80,44 @@ required:
>>  
>>  additionalProperties: false
>>  
>> +allOf:
>> +  - $ref: /schemas/display/dpi-color-coding.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: dpi-color-encoder
>> +    then:
>> +      properties:
>> +        ports:
>> +          properties:
>> +            port@0:
>> +              properties:
>> +                endpoint:
>> +                  required:
>> +                    - dpi-color-coding
>> +
>> +            port@1:
>> +              properties:
>> +                endpoint:
>> +                  required:
>> +                    - dpi-color-coding
>> +    else:
>> +      properties:
>> +        ports:
>> +          properties:
>> +            port@0:
>> +              properties:
>> +                endpoint:
>> +                  properties:
>> +                    dpi-color-coding: false
>> +
>> +            port@1:
>> +              properties:
>> +                endpoint:
>> +                  properties:
>> +                    dpi-color-coding: false
>> +
> 
> Also it complicates the binding enough to warrant for another binding for
> that specific "component".

Do you suggest to write a separate/new DT binding for this bridge?

> 
>>  examples:
>>    - |
>>      bridge {
>> @@ -88,4 +145,32 @@ examples:
>>          };
>>      };
>>  
>> +  - |
>> +    bridge {
>> +        compatible = "dpi-color-enoder";
> 
> You have a typo in the compatible.

Hmm, good catch!  I did upgrade dtschema to version 2025.2 with pip3 and
didn't see any warnings/errors reported by dt_binding_check, weird...

> 
> Maxime

-- 
Regards,
Liu Ying
