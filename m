Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BD3AC3C8B
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C91310E2AA;
	Mon, 26 May 2025 09:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AlVj9DIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA86510E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fT4h+vN2w2GZm+4aHVFz7k9+izHGhpNQb2uMXZF7JjlZhNJfD2A3Qduqls7qN9L7iDR+O4THDIhzazcgvn0t4Wgq/krs3ykH3n4qKWJ3cKc/KFZKSXJ3WHfgOoaMdOpvwOxCX0XEMY6Xw0i5I2NXIGgJpEM0CS1jJaYwRR4NvaNgdkFIVg/rxcZhrQ/95g1dJ/Dz5hCpuD2DCd2j+Rqhml9RPWbvB7jUPkYiNDn1v1N7C0x88gApcgL8vEUcrUqH1sUMIgJmVtTM15YPMrRxiW47XFqXGFTdznK7yHVnbhfsPNHeESsCfNk79ENQCwob8HtUYSktss/z2tKqfZa9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRV8rC/76RdwCpwx7ofihmIaEHqnfTR59oD/oVIwubA=;
 b=qYlZ4TzIUndqTWrQ7ctkketKH5uPpYIy+rAprLc6l6NdDr3Uwy8fBlw/+ksu966GT02kL3kZFOGJ7xJjrD6ybIp/1HNahjEApI9qAVtavdWAdIWKZNGUQ4rJmuWO6iUwB3ys6yjg9wgzCsslYCj1fNRqQLYuOvrgHtWyv5Qc+pfvJC91gTDejIHghU6lloFmMinWgDrXfhUzZXhFRQ5cpQs7AsH2q+I9JuuBRMf21Tc9OqFoW3T61eJrelmkOt78637H8chfzYJ5edQmRHrXpPEa7umHN8bTkh1mqzAqOaNJdMHLAjrueAorhArx8qbIYNqQCYUhEdx60nS4NvoQ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRV8rC/76RdwCpwx7ofihmIaEHqnfTR59oD/oVIwubA=;
 b=AlVj9DISAvA2//Hp/s+s21+79rrqC/Yc2bPFHBQb+p8zZ+BdzPsTSx2QSd+ktWdC+cIhat9TROCKYuXGbJvTB5fY0X/XhpzeEPVfaQmjgwIxcRPtGIlAMOxtF2umwQzL2G9g9+HiiL8Sy8O1v8BusWrdMdrbKkBMGBPsiz5jOV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS7PR01MB11443.jpnprd01.prod.outlook.com (2603:1096:604:241::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Mon, 26 May
 2025 09:21:57 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 09:21:57 +0000
Message-ID: <c0aa1d6f-4a2e-455f-b458-1b679beefe0f@bp.renesas.com>
Date: Mon, 26 May 2025 11:21:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Adam Ford <aford173@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdVMDd2abFFzMY_Rbm=7pnX5C2qHBsa68tF_c=bRnp3zkg@mail.gmail.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <CAMuHMdVMDd2abFFzMY_Rbm=7pnX5C2qHBsa68tF_c=bRnp3zkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS7PR01MB11443:EE_
X-MS-Office365-Filtering-Correlation-Id: 93cb31be-e1d7-4bc3-ffc9-08dd9c36c2cc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3diSlA5andhaG5SQWt5ajE3bFVyQnBPU21tRjh4OWhqV1IxMlYvdEx5cHhV?=
 =?utf-8?B?MHVneTJXWWRRd3NLS2h0ZGNTQ1NxdW5WbEZVZmdlUUZsNU1qK2JHMnE5ck5K?=
 =?utf-8?B?Ung2WWlVWWNJZGxqWFlLN2FIZnZDTzVRVlhVam1rVFRpRWVqcjlxTkNEUits?=
 =?utf-8?B?ZUcxSU0xRUVRZmhuOEpaUUlBVU1yUHAxc0UvQjJkak9VdklVNHBGelpVdnJU?=
 =?utf-8?B?Y1pxd3VhdGRDUjN6YndzNjBhbXhmbzlHWXJ5RVpvekNQMU9WT3EvbzExT0VB?=
 =?utf-8?B?ZHN6RG9ZaWlmZXBXU0ZWTGU0N3dQTlJ1WjUxY2tsMXNuZ1ZHVXlLUXdEU2pw?=
 =?utf-8?B?bmQvenBET3J6VU4yTThqWnNHRVhUWXdKbytNaHQ2cnU1QjhLUG02MEdjV0Vi?=
 =?utf-8?B?ekFXZVZZaXZJQlNJaG5lcnhzdjZNQjZCdXZlYzFPVFgwZ0o2OURkMmZEeUtp?=
 =?utf-8?B?cDFITnNJNjhyRmtvNVdMRHluQVpVSDlnUmp3eXBFR1V4NCsySDBQWUFGRGRq?=
 =?utf-8?B?VndpWEIxZnRSR3JlT1ArbXMxZDVRYTBrM1BLUUwzUU5rOUdGdUFCKzBBV3NE?=
 =?utf-8?B?R2pvdTdCVGdZMVFiQ01ibUpYZm9CZ09pWjd6YmErSFJQQTc1OG91SGNpNVph?=
 =?utf-8?B?bVZzSXhyY01wR1c0ZXRqNDlpZDZFVWJZK2JMUUx2R1JUTXp5VXR0SnVhcUtB?=
 =?utf-8?B?QWxqYzZvZFJEOXdncnlzZFZxVGFiS2xBMzVyaE1tNzhJblRaeVFUU1lTOEpN?=
 =?utf-8?B?RldMMEtJcS9qR0Z0SVdEOGtDbm81aGp2RE5CemxETE56YXJjNFFmeTFNMVY5?=
 =?utf-8?B?RElaaXdmeVRZWGp5TWh1aEZVTE1UYW1CUGkzM2djeDg0WFlJdFlSMDdqeEJJ?=
 =?utf-8?B?eHArUVZmeG5IV1o3cnV6Uk15WGhweE9tb3dtUGp3NXJYSzRhaWY5MHRYZVVW?=
 =?utf-8?B?ZWVqdy83NVl4M3ZtVzFaZXhTZnQ0RmtVRWF4bFMyTzEzVzIwSFFPQkZPQk11?=
 =?utf-8?B?VDc2U3RpTUpBRUFKK1BSenZTTktidG1LU05rS1NtcUFwcFdKZkVhUmtPVDRK?=
 =?utf-8?B?OCt6dnROcUFjL1dHSmpsVmNLVE5WdWlxbTJkUEJ3emMwOFBnZmRib1p6WUhl?=
 =?utf-8?B?ODRIRy96L1BDRDI0bHU1aWU3cWo2UjZzTk10UXdZUmVZMmdZM25POG13LzJv?=
 =?utf-8?B?TkZMZFE2a1Y4VWRqQk1TVGJWOVdlQ0liRWZ6RW10UFE2RUF4ZC93QkNiZHV4?=
 =?utf-8?B?QVUzMzJpckl4Y3hMdS9TOWdqbzI1MEFMNVhqbTBDVXNjMlowMVRwNXBpd2VI?=
 =?utf-8?B?YXBBT0wxekp1UDd4WFFBS3kxQWx3SXNLMlhlYUx5aFJ4a1BPNTJDbUtwdE93?=
 =?utf-8?B?S1NnSzUyeitld010a0k5L0I5N0xCam1ob0JkcnlUdlBGamZQK1lvajZhZTR0?=
 =?utf-8?B?b3pmYjFCZEV6SmJSVm45blRoRFZQRERQejFNVnJVOUhZUm1VSGljOWJ4dXky?=
 =?utf-8?B?SGNyRjNiczB4TWNidTBiVmc5cFV6NlE1M0g2YUJCUVEzMUVERjVwaGhxMUZX?=
 =?utf-8?B?M2p6cHB4MEdON3oybGRUUHRpQmZqaGs5L3IzTVBEdTZERGRJK2pObGpuWmor?=
 =?utf-8?B?Ti92WWVaQlFVZXREMW9UN0lpZUM0aU84VnE2VEJVaFhBQmRPUi81MlRXZTBm?=
 =?utf-8?B?VUNhbXZsZHBnYm41alFUUmxVUWcwblpsb0FWMWhvN3E5ektVMkNUeXFFZG44?=
 =?utf-8?B?dEx4K1UrWFI5YktUS3UwOUZFVFJwMTZXcGE5cGtPZlRoNm04azFqTWV3amdM?=
 =?utf-8?Q?ySjNfGZo76Z2SxARoZWtw1IwrZR0UVOp/djO0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2d2TTdxQjhNY1pOVzB0MjdQcHk0b1NpVlVQa1J5M3ZZeUsrcFVEMC9SeTBw?=
 =?utf-8?B?U3MweTZ3ekcyMjZ0ZWZweHJnaUlIT3JHZFhTTXRxL2xmTWNMbWtvM0xjaStR?=
 =?utf-8?B?ZnNWZ211Y25WYlZPbURjM2MrQmpQb3Y3QU1VbHF6aVY1d3hqUEhUUnJyMGV0?=
 =?utf-8?B?bUFqRUd5a0tuTHFXSVhKeE8vUzBLTVRUeW9PTXhIekdqT2dQYjR3ckpSeHFL?=
 =?utf-8?B?SGxMMDhrOGtaU0dlbnFnOUJRKzFRb1o5Z0w3RFJUTjlWclRrajNNeml1TjFy?=
 =?utf-8?B?eUlndXNTdk5jQktIUVVJckVPenhZK3dieEhZUTBFVnpMQ1hEZVFPWGFqWFhZ?=
 =?utf-8?B?cmJIT1N1OTlQSjBKY0dDcXZOK3Y1blhrY1BHYW81UW45SGNkR1RwbGNnYjc2?=
 =?utf-8?B?ZkVGTThqNU5Ed1BiQ0VNSkFYa0pibEtBVE5YVnhiK1hkMk1ZR2dtSzhybFQx?=
 =?utf-8?B?TUltR09GanpDN3NTQnViVGlPQ3BsN0xiZVg3bStkMkx5YkNlUGE2YTlmSjhB?=
 =?utf-8?B?dXI4Tjluc2FicEY4TUtGMGx5VElWb2pxcXpJM3QxN0lsaVRHNTNYRjVsZVp3?=
 =?utf-8?B?YmtYZDJCUHg2bUZyZUF3M0xDb1dGbFRGUjFiZlBzdGZDNlRTZ01vLzRBNEc0?=
 =?utf-8?B?TzdNM0JzUGhpemJUM2pCSEdVeSt2c0lMUmN1TVNlSjFHWlpyVmJzdVlNQnhs?=
 =?utf-8?B?UjRMQkM0Q01ndU5YMi9ZeFV1SS9iMU1zWTdXZXRFKzFIYk9kRXVVVmJaWVN1?=
 =?utf-8?B?SUFTRk9GSlc2TVp5R1lGbndMY1Q4SkQyNFdnODhJN2xEOHhhUXdIWGtRZjNi?=
 =?utf-8?B?Y0QzMjdRWTdPbEdHNjEvVjVFTTA2ZHVaS0dPZXh5aGtHeS9mdmlpb2x1ZU9D?=
 =?utf-8?B?Y3BGUk5oeE1UVkJVMk43aWJvRENvR05RVXB5Y3BsLzQvVCtab015eXZNMDlB?=
 =?utf-8?B?ekRUUVhtV1psMUZ4WjBiNklCVFpQSXhnT2h1Q0g5ZVdLL3M2UnhqeTlQdG51?=
 =?utf-8?B?Q0NmQUdmV3p3V3pUOXpFd3A3dEUwYmRZaGk2OXFvZ05iQ2Y1SnQxSklkWXZh?=
 =?utf-8?B?WmVWeXBTYUJLVnpxWStHa1pnZnVZbStXYUdhUFVXLzFPM0hqM1dKNWpEaVZi?=
 =?utf-8?B?cmprUEE3RVVUbURoT3QvVEgvdzlLc2VVSDk5Qm9kdTJCSlVTYVNjakNoOTJs?=
 =?utf-8?B?U0QyZ0RLQ2pIcW1ncDVjSlBsdUM0bFFIV1JxV1RRUmZ5WWRYWGtxVk15Mk9K?=
 =?utf-8?B?OE5CUmtJdzRxbXFSWndCeFhhSEFEWS9GK1ZNeEEveTlMS0h4RlRtek5BZ1FX?=
 =?utf-8?B?Wi9oeUQyYW9vT0k0WUk0VlFCY2tsVzdrMjlaQ0RHd1B1S0RtaDdoTnJUWlBv?=
 =?utf-8?B?UmRTR1QrMmt1emdEMDRhaVNrQnJWTXFDS0NhMkxkNzZnM2dIdklOVkZBbGxr?=
 =?utf-8?B?ZGhnQ0hCWVloUXREb3RoWWRSQ21ua1o2TTI1K3lzV3dCV041MXJmQTN6ZDVi?=
 =?utf-8?B?dHR2QWJaeVUyWGhEWFVYOVJ5dXdQL2hyYUh5VFdJOGhLKzA1alpBdjRqN243?=
 =?utf-8?B?SUlDZTNrM1ZSWjFJcThEaHNrZkIrSGdhcW9zbzdOSUtOYisrK3NQdFBDT0FG?=
 =?utf-8?B?a3Q5QkxHSWdtM1cwNGRySGZFTmcydDRHN1BUeEhvbVJFU1VMdmZjTmhNbGEr?=
 =?utf-8?B?M2JWeFNhMTV6UWVvOUgyNFRmQVY3cVVnTTBoWU5YbjZnOXRBVHdDeVhwM3JE?=
 =?utf-8?B?SVplYzJPQUFOQVJ1TkJBVkJ4dGhyaUNEVnBLMVFFUmxKeFc4QUhuejlacFl1?=
 =?utf-8?B?blFQZXJadFcrOHAvQUwvTHdRSFROTDlpa1p6RDZEMlFTajc1clptc2JZNmYr?=
 =?utf-8?B?eXFpTWNlZDRUTEtWd1ZFK0JpMjFZWGdYeWtkeUljc1ZhTkhMWHZFQWNmNUd3?=
 =?utf-8?B?MnN5QWJtaUR1dmQ1NGxjUEhhb1JwS1hSR2hxZkRZOWdYdUU3L3BsMVkzeFZu?=
 =?utf-8?B?a0ZZbWFXQ1ptaGpYTFluVVJxSlViVXZiQXdCeThwVk1Bd3AwMEFPYXVkQ1Va?=
 =?utf-8?B?V1UwZURoWDdqbm9GQ2xWdmJBdllMNDhucEpLaFZOQnFucGNSblhtZk5Kb0pL?=
 =?utf-8?B?bUJEeGMyMDBRakJXOEZrTnNIY2V2ZjJuZ0MwM3AwQnBNZ003NXRmc0tMd2Jj?=
 =?utf-8?Q?ojTepU4OHQLh7Hgq0vTSgbs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cb31be-e1d7-4bc3-ffc9-08dd9c36c2cc
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:21:57.0506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8I9OKE4j7t74RDiD0yynu4MnaDuLSAPqW7wwFlPuWp2TEwsZIJKGwjvlheLSJUeNPoi7w4tAPnkXcGm8ZcW5+sZhOv1tg6smhd1caqQNIFWZT4E/OhrQNqUEv4GRb/lJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11443
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

Hi Geert,
Thanks for your comment.

On 26/05/25 11:13, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Mon, 26 May 2025 at 10:55, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
>> After adv7511_mode_set() was merged into .atomic_enable(), only the
>> native resolution is working when using modetest.
>>
>> This is caused by incorrect timings: adv7511_mode_set() must not be
>> merged into .atomic_enable().
>>
>> Move adv7511_mode_set() back to the .mode_set() callback in
>> drm_bridge_funcs to restore correct behavior.
> 
> Thanks for your patch!
> 
>> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
> 
> I can't find that commit? I guess you mean:
> Fixes: ae01d3183d2763ed ("drm/bridge: adv7511: switch to the HDMI
> connector helpers")

Yes, sorry.
You are completely right!

https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/bridge/adv7511?id=ae01d3183d2763ed27ab71f4ef5402b683d9ad8a

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

Thanks & Regards,
Tommaso
