Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6814864C54B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 09:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F3B10E229;
	Wed, 14 Dec 2022 08:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2100.outbound.protection.outlook.com [40.107.6.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EE310E229
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:50:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvekYsfa6IIEuJVA8oJ0tvqGnZ2duRtPsqZcmVMjgGEtR0JLJqBGuIHX9LOzZhNacNxVR0i0r55q+kYVD35bmEH1Qow5zne2W6dyJSgOwjlaD0kDbmzOhz1Us09+8IlFMWQmIPUi1USRknIEK39oK4md5/hTQKjcRoiN7JPal9WH09v4yeFjgwnLwegZcaQZs7psdXB//3KXWSqv5hQwVgz6fS0rwh9BuvxNLDnsWDDTCxlPwdZlw1LZUReQZ6ue/Ywme9VWFxFnLZqiExUtGjLTqMVH0MF4ov7zb8X/nIb33pQILaNa5r5bIbMWbIPmSvJkF26t15lE0EF4os9HMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyO3LSIUH1oQXSX2xHIBs3eeBONZeX0hXcxw/LuIOuw=;
 b=fajj5k+P1tyPwb39z3nd/e0ZnjqeqKvH7Y8d6jx5fgYbkYu7Gi+pB4M96Ndf35MefuKJ4LYFhozYvG/+ukKQ7bXBx9i595im8HH0RV8mgr+EU4Si7TNIwxDZtFESRF+v1FNB/ACjoH1KyvQ3LWX/ok3Um9SpjYpZTnUOT3PUyPVlejH+GpwSQOuXPHk1mp1MhJT22dTOCNQekgEvAsLy38kjyRHDuV5zGpBDW95NmiFdBIBwiCSodsD409sMLNX+wvDQtq25L86a+nwmw+CSiWliQNBgJj1brEoDlcsLCKTExF+OYkqz7v0zsDAJLbl+WVEe4bcVDSjyBYzYcA1NFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyO3LSIUH1oQXSX2xHIBs3eeBONZeX0hXcxw/LuIOuw=;
 b=mAuIZtc7u57RHh6jCYz14WVyM277L8CsRz4qEwfk75dCHpZojU2MuKQgx5KHZFNc5XoqbAJ6xCW7mfvt4To38XhBDQwAtv1YK5xCB201m+gu5OlBDGexxakqC9dFr5extJS4EdeAbsCJv+9dSCdkQqgU4IvLxB7Fi9t2I19tGPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM0PR10MB3667.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:158::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 08:50:19 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 08:50:19 +0000
Message-ID: <536121db-f2ec-54f4-7164-8cda0935407a@kontron.de>
Date: Wed, 14 Dec 2022 09:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v11 3/3] drm: exynos: dsi: Restore proper bridge chain
 order
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>, Robert Foss
 <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <20221212182923.29155-4-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221212182923.29155-4-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::15) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM0PR10MB3667:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0506c2-458b-425d-1992-08daddb03a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R3KJUMNthm4ueW/K2Ni22fIN1/gGaoHYVuPnyse3n9E9iO4SPV29mJMpkCxDfaIWBbJrKpuWC8PPF6SqOMeIpmFfg+2QtL7ObLrEa2CQUJIY8hAs341zmpPIpzzOTSUTxaZc875QusoDJU+9UVvsC7CNKD4bURX+He1Bhv/lI0okiWZW4v+0JpjTUUkNzuG0HmYjrlbIpUiC++QEIDDU0/5FVstPuzkyQf0B00uqhbyywznsXYw0q7bdfMftPczlbcJLNXnVTy3ZeVtRO+XquY+jzO6bXdGjkYbk6DXK4Ue+7Kc7XDIWDRmnvhz85VMFH7GypSCTcwD30Q5yalLm+lJKgGY1eco1i2EXefXAR4L0vPZkv3g0GM7kYCuLGuWJBNouKIJMWUAvr2O0/PD4XK9nqhxQVFEcawsEawv+eaz2Ma12si4/Zdxxq9/ydk/iaLTLInO2pCMo4TDGu1AEiTPMiH+28Xkm0gYCQji7tSNT0Hr3peEg0it6LJXeGGTsyIzVuOR5THHb19EMSmxy7kCGLhwtgVIuQxG4SxQ57HbMZGB7AOE6vhW8eeLXTsjzW88Re6bDNJVIrKTTWt+wQPR2bz/pa8zpCGuYU82Wn2WK6dSEJkz79t674TAc7xyF8+qBvLIjl1hLl3dL0FzVIT484Uww8+ZO47hOdJ9Rt5ImAiUVmUV5JIf7IzG2KEjtN6XSQGVZ3zxPPYs3eheGBQ+tiHCAm8U/iOsoVTpzMDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199015)(6506007)(41300700001)(44832011)(478600001)(6486002)(83380400001)(2616005)(8676002)(31696002)(66556008)(4326008)(66946007)(36756003)(66476007)(86362001)(38100700002)(2906002)(53546011)(6512007)(186003)(5660300002)(54906003)(110136005)(31686004)(7416002)(316002)(8936002)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cSs3OXlyb3VQN0FlREdzRngxeXk5N2h2UUJyN3VGRW1hdTdJYWwyczNQTEhj?=
 =?utf-8?B?b2V5dWZjNHZGUGdYVFFQUStpUktmdjE5dUhMdVAvd2JqRHkzc0ZZNTAyalQ1?=
 =?utf-8?B?dnJ0cllzd1RVQjBGbGhLaG9mYllQSmFIOXplUmtyaEtveXVjdVlWemkya3pz?=
 =?utf-8?B?dWt1ZURZWDZQZDhWenV3ZThxNmZhdDY0Rkh5ME9kK2NtMDA0SnV3YU5yTEtn?=
 =?utf-8?B?TmFHU0xsYnduQUhzM3Z3TEdSTFdZL3krTkRVU1pkR0pwS1JiS0hiZU03N1I1?=
 =?utf-8?B?R080YmZzOVBETmI4c1F2K0F6d2tYMEVxWnh0L1dnOGRZeThlR0p1ZmliWG05?=
 =?utf-8?B?QUZXaHc4TFhGM1piMURFMnhCb2lTTjBrWFU4dlpvdUpIVG1mV1g5dU5MV0I0?=
 =?utf-8?B?a3hrNlZ3Z1BWNVRSNWdvYzFBOGpqUTBob2lhVksyd3R0K2J3SmV0NHZuMVNK?=
 =?utf-8?B?VUYvcG0rTENJWnh6b3BYckFTM0hUbTI0UG5jTXdJR3U1UHhCS0VoVFZDU1lS?=
 =?utf-8?B?YURwQ1Y1T25HK2dIZkVKTjI5a2c0OVJwMkNWaENZZHNkODVFNjBxRFVGZFNW?=
 =?utf-8?B?ZjU3SGJ6TDNMcFBCNHh4VWJyRTBhY1c0SEpNczYvTHVLVmtPL3RETS80ZWFB?=
 =?utf-8?B?Zmp2RFd4VmE5Z1p1K09KOEloV2FuZkRKdkRVbVpnVHBWOVp5Z2hMbHRUbnFS?=
 =?utf-8?B?eVQ4akZ4MFJ3WmN4YXFYZUZJMm9waHo5WDZUUDM3UUsxRXkwelFQdlo5VXln?=
 =?utf-8?B?TldWenJIN0ZmM2tYK3VnOXE3YlpMTThpMWNSd25LRUZoQjNDeEphTDZ0VEVk?=
 =?utf-8?B?NG5sbk5zb1NKVFZBUjhzdzdpR2NnNlE3dThTeXFjRTNIaFl5QmZVS043ZVNa?=
 =?utf-8?B?NW4rT0VsellmRU5QOWRDUVFWa0hMWkhOVTJwOTdkRG44aDQ0amhjYVNPZUwx?=
 =?utf-8?B?V3Nsb1Q0WjlFZ1FIOVc2S3pKZHZpN2QvVVhPWmJEYVJQbitNRy91Qk9GQ2tv?=
 =?utf-8?B?ckZid1BzQ0tab1Q0djZoa2lVdWxUUVpPUktobkREZklJZTF0ZUljVHM1dUp6?=
 =?utf-8?B?RUo0ZU5QaE1oYzQwSFZORmF2TVRMNk5hcU9TYVNTR2pyTDlGVmtTbDNMRDRD?=
 =?utf-8?B?REtaeG45MGExeHRxNzdnVEg4aWRxNjEyV2N2LzZLOHk5WXlxK0w3NWtTMlNr?=
 =?utf-8?B?dndaNFdFQ3h6Q0tjbnlhRkMvdTBZYWY2Qk56VmRpbFcvS1Z0V1dSNUUwK1pT?=
 =?utf-8?B?U3diMjdMZ28xTW1QMVgxRTQ5eUJHZjFqOGp2MzhWZHo3M0oyUFoxVlI2aWx6?=
 =?utf-8?B?WGFnRzhkWmZLa04xa1lEZUh1VlpHZDRCZno1cnNYWjVxZDFxeHlNNk9JakNR?=
 =?utf-8?B?d1hRZ1NPa3FzUnNqMjFNVndTQ2NYaFY0c2JqRzBYaEo3U0ZhZVVtRThDRisx?=
 =?utf-8?B?NElsZjh2YWpoUDVtZWFJS0ZMWnQrMmNicjhRWk8xQUZjNU1BSmxXR2pSU0Nh?=
 =?utf-8?B?N3UvelY1S24yclRtYmtNa3A3WUFjTzRRSlcyVkVLUCt2Q3BqQjh3eHZlMUgr?=
 =?utf-8?B?ZlhTTExLL3FGVkxJVGZYYlBhMkFRWkh0ZVRWQldDeStFUXRqdmd4MjV2QXZ5?=
 =?utf-8?B?YnBpRU90eDdzc3N0QXMzRURxZEFTZEFOdlFiRlJqODhxYTFGMjVGSk9HdUsw?=
 =?utf-8?B?b1RVd29CRlZyT2szSTN4Y3VNL0NiVDhMNytjUFU0ZGZSOUMwUGcvdS9mdWtz?=
 =?utf-8?B?bkNZejFyWUJkWXFMdkxNc3J6bkJoTmo1WGtQL21rYjFBWUEvMDZPampDMEp6?=
 =?utf-8?B?cjBBd0daU2JvNy9MMGlqbG9iVmtXSFVvT1MwSmQzTHNJOWVpRlBESjBHbkJI?=
 =?utf-8?B?RnhJMzNBK25FT0JGL2x5NkVQOEtvYzdISE1ncHVpRjU2cUV1TkdlbFQ5ZVBI?=
 =?utf-8?B?SUd3MHhzRW5rdlJWQ0lHejVscDBBSGJ2M25IKzd6S2NpZnB1RGhMb0ppR3g0?=
 =?utf-8?B?dmNSRDFtVXBsdWY3YlhLYWZHY2Q1WmVyLzcvMnAray9leVBHODZzdUJLaWhq?=
 =?utf-8?B?dzFvN2hXdjkrU1YzN0UxaWtva1RkVWdZZ0d5U0hPbEdOZHJxNVJ4b08rSGNz?=
 =?utf-8?B?R0RiTDg5RWJzNGFjWENEUmRGVENZRDIwdzRoajRSZ25UaEYxcVpTbjJkR2t0?=
 =?utf-8?Q?AEk3kxwhZOTFvoglHWkbhH4SOnKDjvZjjg4g4A/akdBY?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0506c2-458b-425d-1992-08daddb03a99
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 08:50:19.4378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECOBTRcKLDEbecR4l3P7YymEB845aB6gNrA9Wpssz5rT1777CrYjuTR5r55noXkaykgadkqfOwNk2iPvD0RVtatuwsk4Cxp6ZKyIxnqSlgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3667
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.12.22 19:29, Jagan Teki wrote:
> Restore the proper bridge chain by finding the previous bridge
> in the chain instead of passing NULL.
> 
> This establishes a proper bridge chain while attaching downstream
> bridges.
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
