Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241DB916090
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 10:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E8E10E25E;
	Tue, 25 Jun 2024 08:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fd550YPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6064F10E5C2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 08:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWiBOwbJADCpaM8yfxd0jrAHoFaIre+h9/lyIZUzQqEv9Cu11XOMNCsXBbY9AKN5ARWHvC+xQYw3DDcOjrC/6xfohG8aiTRaj8dP0deYk8BfOPFK4kpuVUPmB9z+5D8M6vTqzUwr7c+6le1DtqoypsFC2N8pBs1QvlIJN8BFUVbkhGCtqwHX3arFPbvNdm65xrLyZs8CXH1vGY5sRrNcAhpIzptY2J9sE5Ym8eHRt1mnCpr0EHJgOhdFW13IhK185rdZH2MRn1bewIf4vi1JK5U9GCqtA6YMSVsFZxmq8RG50obv1HCRFuLDI1FtPcZoiqZofyXz9a6TTYznq8ERzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s4E6D8LHisTZWw10fQ0Me8CAQtXCzgGClOFbEjkHCs=;
 b=Hdx8WbdRqu5Vr9/KQ+l5ytOBAh9F62W4sdP7K//cnT0I6BKvrngEorCLgR1+A82fqrATP2JlcMbdF+yrrOWp4RXK0LOlisrv38tLfn9P2xAipS0/Rk5xBV5qAnXV38SgM7j2srwcwExBal0t0I7YiF5WBsLKFLOlwwQA0NcxjQLvWsUILlvtF84Nxi/6V2ulK+RjmZ9Y3yTKZtbY3yuWBjVeUEs6FWUFd97Ygx7k9WKfzMkYtyhQE/BFKuzH9tyFgWcy/NlEm7VSmq0Ce+muXyY4ov7T2F2O0yKSwKuq3P+V9kCGhQYj6qDPOAUOg9yJplpp7vhKUwlRRpYFRgiMDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s4E6D8LHisTZWw10fQ0Me8CAQtXCzgGClOFbEjkHCs=;
 b=fd550YPYfX+9po2CY5ODJpGqIgBwG1DdJmZ9ZvYcYCdctjvAsmKnyIua+8qkDj95QiV1UADFR8uqpIIcvOfwMclQ7Dhkt1EWHiqbUv1Bv4SI06ehQhorIiCp1cyecFim8OuCuyU9GGJ4twXo6s8AFXqNtOgNqwZzjDV4BYnHEEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8759.namprd12.prod.outlook.com (2603:10b6:303:243::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Tue, 25 Jun
 2024 08:00:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 08:00:31 +0000
Message-ID: <1bea3fc8-1c29-4951-b077-d442257c93e5@amd.com>
Date: Tue, 25 Jun 2024 10:00:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ttm/tests: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240624-md-drivers-gpu-drm-ttm-tests-v2-1-76bb765e19c9@quicinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240624-md-drivers-gpu-drm-ttm-tests-v2-1-76bb765e19c9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: d738b178-6e26-45a4-d57e-08dc94ece22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVZlOWd6Y1FrRG5BQlpEWjU4WHRDM0IzL1lJcG5iN2FQcW9RS3lxd2VTaEIw?=
 =?utf-8?B?aWJGaGVqOXkzWTNOT0VCL1VPelMraFZySG9sdkpEd3FvWHhuRXRDMTlkQksy?=
 =?utf-8?B?N2g3Q3VYWUJlSjJFclYvYUNQWExpYkJXd0NzYmsxN1VIZWpZaDlKOU81NlhN?=
 =?utf-8?B?YlNYeEdTUVhneURQWmU1UHhieDMxbnFGYVZrQ3BUbjkxZmp3Tm1LNjEyZG5Q?=
 =?utf-8?B?MUJBVnNwYmVCbWtGd2NJK0F0WThFZ3gwdENzNHZJMkJvRmFmUU5US2p5NmRW?=
 =?utf-8?B?ME9SaE8yb1hoZXdBc25MU3lyTjlVdGxVdzlEV2VOcjF3aGFaSVB2Z2dOem1N?=
 =?utf-8?B?N3IyNm1wQWtqaTdkUmZoYkExb3lEUnRCZm1SNGtxNzB2Z0s5UWdNY2oyR25V?=
 =?utf-8?B?bWg1UkY4bTZZcnRqU0QzVFVweDlTeFlvNGNMTHpDcHh1dHdVVnh5eDc5bVpw?=
 =?utf-8?B?eUJsQkZLbmE0R3BYRklyblpQWWszMXNHTys4ODZuN0VJbkpxWTdnMUVOUWEz?=
 =?utf-8?B?MW4rdzQ0WEZvbHhXQU9leHJEdnhxM1I4eEY2cGpZZWk0Uk5oOWFaUjdsWlhT?=
 =?utf-8?B?WTBEUFA5TWFONDM0QjFkZmlHUTBscVFxVGVvc3ljb1hua1N5ejlRQlRDZCtG?=
 =?utf-8?B?WEs1T3NuQURYREtrcWp6Ukh0WDBqOXg4cVpDaENTU2RUdWhqV3RCSG5JaXpX?=
 =?utf-8?B?Wm1HK09HNngxaFVmRHNDQVFWdVJmUkhBaDhhNkJjNEllT2gyKzBpY0IvNG4y?=
 =?utf-8?B?VXd3ZFQrekRUQm90RUM4L3VjOHNJcjkreEV3U1Fhai9HeHpoOHAyUkxJS1p2?=
 =?utf-8?B?S3Bwd1k4U1B4eE5YN0ZhUWFpbmNzemxsYlA2NjVaeEdTWnlMUnF3NnV3b1Fs?=
 =?utf-8?B?NW5hdkNzSUFqV0Z6cU5CZmZiY1FqdWJYZFR6L0hCUGQ2Yk1LSXQxUlZ5aVVh?=
 =?utf-8?B?QVNScG8xbGM2eDlnMzdDUUg0RTVoRC8zc2FOWDlSSDIwbldRaU9GTURJT3Fk?=
 =?utf-8?B?aVVnRTdVMTBKU1FzYmM4VkxLS0tDNk1RMzRKbDVrL0dubDdIeE9uZ3R3ckEx?=
 =?utf-8?B?Sy9MakdON1ExR1hIaEFyQi9hYThtaitCVy9PUU5LM2FrQlo4WHlFMk81RzV1?=
 =?utf-8?B?WGYyMWVXZURRVnQyVjFDcnBUb21FM3IrMzBJNmk0aEhEL0VWQndmUk5hUHdY?=
 =?utf-8?B?NGE1NksvQ08xaVhDQlNIeUU2bUZXdkQ5T1h5VGxPQld5Z255RjNhRy92aVUy?=
 =?utf-8?B?a2hGSFYrZGMvbERJZmhVQ1o0VkdrSzJ3eWNaVDlCWTY4UXBWVWh4SGwxMVZM?=
 =?utf-8?B?VFdSL1prUWVWODVXV1hpVS9VYTBxQVpMRXhQYk5uOEI0ODZPeUNTbUpVVnFF?=
 =?utf-8?B?K1pYN082L2pLQnBBMEd5eHpRSGh2L1VVYnZNQzNtVmJVRlFxYkZHYmMwSmtP?=
 =?utf-8?B?TUpGcW9jTzR4OU9adVJ1MVBPcHlBbkdEWDZka1FJcjgxWlBnd0hSQklqUWxm?=
 =?utf-8?B?UlBjRXk5YnBQQTJFNXY1Z0V5Mk5rTThlQXJQSk5nd2NwWTh6UjNDczVKRmpY?=
 =?utf-8?B?NG1qZmllSVJ1M3RSTk9va1ZZejQ1UWo4UkUvcmhBM2piblU0VUZaNGdzT2FC?=
 =?utf-8?B?UHNDdllSZFkrN3FRditMNk5WekQ2dm9BSlpQZm1zWU5yeHhFcHV0N2JuU3JU?=
 =?utf-8?Q?A/k6/XppCqUdamrmVC1Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUI0TjI3M1VXTi9FdHlPMFdaL2xKWTJYZUpNRWJVTVViNWNyZEpKMVhjQUk5?=
 =?utf-8?B?Z2VKZlFjY1U2Q3RDMWd5VzZ1UXc3L1hVWml5SWVNblVBK1VpeW1mUTRzak5J?=
 =?utf-8?B?dEtKWkNuVTlxa2pmZit0UFQrVmJLU01QL211TnBYejRqVnlrNitTWTZsNnUv?=
 =?utf-8?B?M25BYnVKdDZ0TVpVeGszRnpwdVVpbU10MVE3VWZtR0tVNTBnelJXYVBBTlZj?=
 =?utf-8?B?dlVuMDNteVlNT1VWbnB4dEUwaWhRRnZvdTV3NVJmQ3I3SGR5L0hTendHaTlj?=
 =?utf-8?B?aGR1MlNrL3lLbmg2clZNVXo1dE5zVE1zS0QvV1BTUHYvOXF3bEJzRk9KNUVN?=
 =?utf-8?B?bEwvNXZMajZqSnZ4dFQ4azFSQmpPV2l2WE5wR2hJY0hEaERXbkFIdldQV3BG?=
 =?utf-8?B?b25pbWpUMmoyVS8vU0NNLzZPd0NJL1ZNKzBSVExnaERNZG1teVl0QmFFNWJX?=
 =?utf-8?B?YWV3Q2VpK3BvUjRWbHJxaSsrNkltMXZOakVJb3RUNXR0a2pOWG9IR1ZvNnd3?=
 =?utf-8?B?MHhZRHU5eXRIcEU2L0NyWFV2NXJWQ3A4UGlIYmJIMmhkSDZiV25xRmM3TG45?=
 =?utf-8?B?aFZCVDBPOERxcnR3UTlacVU3N2grUnY0b1NJS2Q1R1ZsMTB4UnFMV0g1Vzl5?=
 =?utf-8?B?TnFScHFtbUFLUkdKa1FPUW4wbEpxQ3JaV2UwUThIQTVEcmJVaWgxZE0raUx5?=
 =?utf-8?B?d1kvOEtNY1paSm9JQ1l5K1dNVmw0VEVzSE5oN0c2S28yRWRWMFhxNFJkSCtP?=
 =?utf-8?B?cE41d3FaTWFuSWxscTFJdmpFekFncmo2c1hjLzEvdEgweFZ1WEtTeHIzWDVn?=
 =?utf-8?B?em9lcDBxR3oyTFJ2bm5Kdyt0aGptUUhTR1NGNFRUVmNIZSthY1k3My8yNjcw?=
 =?utf-8?B?RU8xS3AySEJRd21iR3lZNWk2UHRXdEl6ZGNvM1NXVWEyTS9sdXFYSFM4Z3BQ?=
 =?utf-8?B?RnFQSTR6ZHhwZm1kRTRkbHc1UTk0cDFEdk41d2dKb0xVdnVZdWd6Zys5d3lq?=
 =?utf-8?B?Z28zaEYrcWFSS25oOHc0aUVDU2hMN1hvWFRkaUk2Y0ZiU1dKWHhMaWtRU1Ev?=
 =?utf-8?B?Q2dJTkRHcEMyT0E5UXNYaDV6R3FTc3FWY25rRm9KcklteWpGQTBlaTYxKy9x?=
 =?utf-8?B?TEFjb2oxeHBIdGVzWWEzWUFVS3c0bnJSdzdkNGpha1A0VE4rSEZRcDFPeG5V?=
 =?utf-8?B?UUY1YlRpTTZNK1dBUHR5bG1saWk0V2RyanpRZXNLUTBKNDIyTUpmU3FXRU5R?=
 =?utf-8?B?bWxsS0h0cTNGVXBlcDNZVVlVTGFqOG5oR0hQWm0vQVJzbW1lUE9hYnhpZ0xi?=
 =?utf-8?B?a1ZoSTB5dklROGYwd2JOaTNWUWIxS0JTR0FldE9GbXZSRk81c3AwOUZUbGQ3?=
 =?utf-8?B?enpPdjNyWFJhNXpnc3JyaVVUaEJPZkRvNjUxeWhqVFRNQTBudlN1RDQyTmdl?=
 =?utf-8?B?bkg2ejg1aTVURTJRcVRHUjdteFdnWXprVFFXS01CNy9CSXhOYnJ2VjYveEN0?=
 =?utf-8?B?ODRDNjFqVGlpNFZmQ0VrM3JDeU9jMVZ4UlZSWmU0OWEzWkdCTGJTM0JDc2hw?=
 =?utf-8?B?WGt4VG9GNHNycFNyZGw0aVBmV0lMbkZpT1NIR0czdkhtQmZQOXZoMmE4Ujdm?=
 =?utf-8?B?a3h4MlVCa1FBbXJPeTJQdy9jbEhHcURCcXRDUGVkaUZieXRYV2thb29WQmY3?=
 =?utf-8?B?ZHlGWSs4RnJYQ3IxK0ViTjZ3bkFpTmt0anlGQWVLNkExYlZYVUtpY3B4aWd1?=
 =?utf-8?B?czZQWnNiaC9JU2VVMXpKaTBnam16em5xLzArOWxzeGlZNDdCaWF5ZEVTZFVa?=
 =?utf-8?B?UlBDS3BDZ3FwWFdOOWptSHQ3Uzg0NEpLL2d2WU1nV2dIaTYvUTh2dzdNM2Fa?=
 =?utf-8?B?dFIrSGdFaW9rUUpSL253aStNTjFBSzVyQUN5TE9WVHhzaDVqekwwbVh6cktv?=
 =?utf-8?B?dVoyVWZQTS9rZUVBYVdIVjNWWlRxOTdFdVowMFFoSmpsYVVLNlBjay90TERB?=
 =?utf-8?B?RFJSaHBtMDBsRFlaYWh4QWE4VU8xVHAzOHQxbm41Z1oxVlR2MVUyUXJPYTk0?=
 =?utf-8?B?ekpDYTlyZEpabU9zYW1wTTUyNEFQUlNWSHM0ZklzalhqZ24zdnkvV1F3U2J0?=
 =?utf-8?Q?S4uDTQ+WPZOmekcxBTCr9mvuY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d738b178-6e26-45a4-d57e-08dc94ece22e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 08:00:31.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7ptLfXQwuPXufFWqV5bo+q9Mfx8nkHV2mOegAzxprl+yCz5Aj5BgLjRUazJ/Lx8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759
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

Am 25.06.24 um 03:24 schrieb Jeff Johnson:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_device_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_pool_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_resource_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_tt_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_bo_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_mock_manager.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.o
>
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked and pushed to drm-misc-next.

Thanks,
Christian.

> ---
> Changes in v2:
> - Rebased on top of linux-next/master to resolve conflict with commit
>    "drm/ttm/tests: Correct modules' licenses" as well as add descriptions
>    for two new modules recently added.
> - Link to v1: https://lore.kernel.org/r/20240609-md-drivers-gpu-drm-ttm-tests-v1-1-d94123d95b4c@quicinc.com
> ---
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c          | 1 +
>   drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 1 +
>   drivers/gpu/drm/ttm/tests/ttm_device_test.c      | 1 +
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c    | 1 +
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c     | 1 +
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c        | 1 +
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c    | 1 +
>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c          | 1 +
>   8 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index 407c31b21872..d1b32303d051 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -633,4 +633,5 @@ static struct kunit_suite ttm_bo_test_suite = {
>   
>   kunit_test_suites(&ttm_bo_test_suite);
>   
> +MODULE_DESCRIPTION("KUnit tests for ttm_bo APIs");
>   MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index bc8281c03420..1adf18481ea0 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -1221,4 +1221,5 @@ static struct kunit_suite ttm_bo_validate_test_suite = {
>   
>   kunit_test_suites(&ttm_bo_validate_test_suite);
>   
> +MODULE_DESCRIPTION("KUnit tests for ttm_bo APIs");
>   MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> index 0f235a834ede..1621903818e5 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> @@ -209,4 +209,5 @@ static struct kunit_suite ttm_device_test_suite = {
>   
>   kunit_test_suites(&ttm_device_test_suite);
>   
> +MODULE_DESCRIPTION("KUnit tests for ttm_device APIs");
>   MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 70f40814b26a..b91c13f46225 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -301,4 +301,5 @@ void ttm_test_devices_fini(struct kunit *test)
>   }
>   EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
>   
> +MODULE_DESCRIPTION("TTM KUnit test helper functions");
>   MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
> index 7f34fecd3fef..f6d1c8a2845d 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
> @@ -230,4 +230,5 @@ void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t mem_type)
>   }
>   EXPORT_SYMBOL_GPL(ttm_bad_manager_fini);
>   
> +MODULE_DESCRIPTION("KUnit tests for ttm with mock resource managers");
>   MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> index 5d4dc5b1c6d7..8ade53371f72 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -433,4 +433,5 @@ static struct kunit_suite ttm_pool_test_suite = {
>   
>   kunit_test_suites(&ttm_pool_test_suite);
>   
> +MODULE_DESCRIPTION("KUnit tests for ttm_pool APIs");
>   MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> index 77be0942ab62..9c2f13e53162 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -332,4 +332,5 @@ static struct kunit_suite ttm_resource_test_suite = {
>   
>   kunit_test_suites(&ttm_resource_test_suite);
>   
> +MODULE_DESCRIPTION("KUnit tests for ttm_resource and ttm_sys_man APIs");
>   MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> index a8c76dbd6913..61ec6f580b62 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> @@ -398,4 +398,5 @@ static struct kunit_suite ttm_tt_test_suite = {
>   
>   kunit_test_suites(&ttm_tt_test_suite);
>   
> +MODULE_DESCRIPTION("KUnit tests for ttm_tt APIs");
>   MODULE_LICENSE("GPL and additional rights");
>
> ---
> base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371
> change-id: 20240609-md-drivers-gpu-drm-ttm-tests-f7b63f46eb3c
>

