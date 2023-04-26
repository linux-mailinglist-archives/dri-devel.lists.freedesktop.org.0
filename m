Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111AF6EF913
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 19:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5590710E265;
	Wed, 26 Apr 2023 17:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189C810E256;
 Wed, 26 Apr 2023 17:13:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+9jhKwkbN5GCKXE+jvnD/djzqlDzTUmJeB45KtgKlj1vFTxffCOWAsDgYf2j8U2Dh2HU4L1qJsMwhsONX4Z4f7oDeP6I+33633ZnsuTsLLHzitJD63gpbhaTVQXIBvyo4nUp6qRcG3dLM4rqpe9f00E6Kp/530bhRdflbyV11zGBVo6XxJtnjfUqyHAPPxDX0iPtvgFlMfUX2Smxn7APoG0RxUJUjMbpSKqXUf594Kc/q9pOFIcAsbPVbbcBH0BLrHO2MXJAcNz3sBNeKtbQ76t7LbWK+c2tU0j3VxYNoonB/yCGpoKTPj/QxWGdbLl1VKt9bRKblUMCANjmU8qeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7am59M/z5ePKpzLpyl0e7xZy7NlcqznNrIZ0D1ya/I=;
 b=alMN1UMWoy9kCBcz1cSwYbmB3rmxrr7LBqFU+xE5QCsUIbZhV8qhMc4bllX+Vl/knzsf+vyxJBNOz2zbdX2dcJSkl5wN7zjE+2ZA5TeWOtEGrIbX1y4G4BifXaG0BBHxI6Bu49B32+2CXVdC7mbx4v9jCxT0rMVJnXiGwSEiq3Y4MYkMR5GWnNpI2ExwMPcHOEZ3UOMaE/cGIoH02NvpCszSObDmNCciJ54cOWASToM6CZz/EPmCrNfW//JJWTwurH/jUq0T8Srm/Qs/chV5QY51heteObiJqaP61R293ISJ+oAqX6dp1MEgDa9iIVzpiuT+6+nBZ5y7dMCDGNhi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7am59M/z5ePKpzLpyl0e7xZy7NlcqznNrIZ0D1ya/I=;
 b=Si7DQ80UQAJ4ZAhyhLAw11ZKx6VFMFG0dEP1CZo6nSuP4YB+yKbEb8Ku0/wLNFQEvaaOUugQK2wEhHOevTA9KGpzD5ZUVoD05a4F6CUS7iDWzNqnuwljjA0hcgviBJrmEnZhwfd+0jNZvjBorVOZ4F5t2V0Oh9cpFK30wzMUXh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SN7PR12MB6816.namprd12.prod.outlook.com (2603:10b6:806:264::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 17:13:47 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 17:13:47 +0000
Message-ID: <04902f0f-dd67-64e7-4495-ae37ae1a8e01@amd.com>
Date: Wed, 26 Apr 2023 13:15:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: set variable custom_backlight_curve0
 storage-class-specifier to static
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, qingqing.zhuo@amd.com, Josip.Pavic@amd.com,
 robin.chen@amd.com, alex.hung@amd.com, dingchen.zhang@amd.com,
 jiapeng.chong@linux.alibaba.com
References: <20230426111838.728441-1-trix@redhat.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230426111838.728441-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::20) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SN7PR12MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd39b0f-dbcc-42d6-bd77-08db46799892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/5ZyUSX0oU/Pm78L5gEiwEiXgxRTBH1DCviWpbRzQeNCTDzew7+5J2+36Ye+zTX3rNywDdIOo1zEnC0Ayg8ho/7SQ7S24EStlc1WKOaR4f8ssg3INhQ6cAd4ATqRK2W5EerOJBE4jUH7/PoQ+v+XmmPrG7d8A54ouuxRzYFE7PaXBcHbnE39aEXXX9vYQbH3DsP8UxlgDVz8g1accrxC/uaDLz16KXIl8iqM0VpOt2pfoJe4FqePhBJVS9igfhqcpiUfGZNn8WKW+sl6WCq9O0FwnFg0vEaE/UWnZjPZsHc03+LD6dVpsq5EE6tVV9UpXFCV3hStkSfE20gUKQlii4YUSnnIUPziMCwkpKGjxSDc5YKZVlt4LciLE+DEG5aq4svj1q1Z4XehzwRzfHLXu0BSpFNd3xD2u3GBZ1STFwvVGtLnpLmukhr1mAiNNAdj0rTUf67/35P/Cq8Ggt3VUqJoLErW8LqjRzmwzTUQIWv7gS2kLJlCPn7DE9Sor3Jg1G8HbT0Saehu2a30xSCb+DOrOEFt0jrgRgZoLA3v+8fQSSMF004kA7q+9tY9lz9oWbnliD2Rh8LoIVpK/SQEPW8RiwnZkq8mOq5P5zcLb9Pp7bx1E7LHiqnIHxwdxsmM6kEctaxAuV2S6a4gXgpi9NJuQ0KhgRm0Mpaz+BCujY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(86362001)(31696002)(36756003)(2906002)(31686004)(6666004)(6486002)(186003)(83380400001)(53546011)(2616005)(6512007)(6506007)(26005)(66946007)(66556008)(66476007)(478600001)(316002)(41300700001)(5660300002)(921005)(38100700002)(44832011)(4326008)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk4zM2dSbjRNNUxxM3QxaXdOWm94L1lBdG9CYWF4aXNoVU5VYS8vVnlDMmhh?=
 =?utf-8?B?YkhtN282Uk1tTTZHSXdIc2ovbGpBd0JMcVBpVmhsWXhnVGVXM3d2WnhzY3hG?=
 =?utf-8?B?aUcrZkNoaWJsN05aWFo1QnhSelM3ekhjT2djRDRYSE8xRjVJYnBId0JHa01x?=
 =?utf-8?B?c1R3cVFrM3gxSFdpRkgwcUh5VW1uNGs2d3orS0xZNmdQUldvRGw1TFdTR0N3?=
 =?utf-8?B?NFFFamE3VDZvM0NnQ1FKT2x5MUNHWjAveVZiNTVhSUZOYVZYcDhkeW9acDRW?=
 =?utf-8?B?MFpuUDVUVHVLUXl1Wm81MEpWbURab2RSODRZenZBbWxJNXNQVHFvKzFCU2xJ?=
 =?utf-8?B?ZUNDc0lJb0J6cXRKM0VGY0JBRWZ3YVF5aE9QeVVKRjEvWnV6dmFjcDQ1ejE0?=
 =?utf-8?B?OGF1S0pUNTJ4QlJsSzhOYnhpRWwzazdzMjUzaVBka0xXcTdZMzVPa3RtNFVF?=
 =?utf-8?B?WDR2bUZHY2t0RzdrSVdEYWNpM1NpQlJuQngzUmo4N0o5ODR1cmx5eXZlbXRQ?=
 =?utf-8?B?STI2QnZ3WmwvK0tjeG9JUkF4REJVLzNLeEJUczhTaVJad0tsamlzK3h0VS9n?=
 =?utf-8?B?UDVpQm11aGxUbkMveG85LzFaME5kWnF4WUd3ODVvTlZ1KzVLemYxeENZckJN?=
 =?utf-8?B?Z1BJSW11YUlzeFVLTkhISzhCS2Z5Z0kveGdhazVReXNEZ3BMT2tHc2llcS9p?=
 =?utf-8?B?WHVMcnczbVMwYWw2OTY3RVh0V1l1UHVaYkp3NmtUM0pqR01NNjdtb0laeW52?=
 =?utf-8?B?RnRNY0I5MTc1cTg0Q2lBdjZXL1dJTlNaMzlIL1FYWVJod1U0bDYzSWNoNElU?=
 =?utf-8?B?SEpkT3dLSkx2WkJoZm90VTczVlhlbXU0T1hEWVZveHYyWU5rWTNWQUVQZHpW?=
 =?utf-8?B?dHdLNHpPRGpUTmxvY2RTQ05QN0hibzZaQURvVFJmZVJzNFdiYXlPRXBnSkZ2?=
 =?utf-8?B?NWpISmRGUUZhVjdmS0U1ZWsyK09UWU0waTE4dnp0TnFEVXMwamVzWFpOV1cv?=
 =?utf-8?B?MlpqZXdobDJZMFl5alNtRXR6TVZ4YVdJLzQzSDBEQ3hiQkRKRW5rNlNGV0d3?=
 =?utf-8?B?SGp3OSs3SmEwTk1tcWtSTUJ6NmJVeWFuMVNuYmZNZFBrejFTQVlJNkdDc2Uy?=
 =?utf-8?B?WHJkQmgrQjBobWNDSUtVUmZxaUk1U0dFVzFIRUZFYk9qb1J2QzRlUENHeE9U?=
 =?utf-8?B?L2p4WHczSWEyRDA4WFU1Q0FXUzJRVSs0S3hQbFI2eXZWd3ZhcGxXWVdrYmFM?=
 =?utf-8?B?amVvdENCczdCY3h2VWtEVDYvSTJCWUd2aU9vMkljSkdUcWVlOFNCc3ZZVnRD?=
 =?utf-8?B?bEVFL3R5Y0VlWC9oSFdOck5reURTS0FQWHUyUFRkTE13b1AvVUR5TWEzRjFX?=
 =?utf-8?B?MjZJMWlNeVRoRnROeXhWTzhoek9yaXZPd3lHRWUwVHRwZGdjTmdQc2JRVzhJ?=
 =?utf-8?B?THpmU3UwZHNJSHpqUVRKaWZLQkdrMHhENVRZNEl2SDJ4M2sydDVYUGdGTXdK?=
 =?utf-8?B?d0YwUmZsblVFQ1hwdGlGcnoxM3RWeXV3Y1hQOEErUDN6cTR3UllZTll4cXJx?=
 =?utf-8?B?V0lObzhGSnN1MzdPNzVGVFdMbjdkNTlKZm1Kc1hYZGdqcjFXZ0dNa1l3VFBs?=
 =?utf-8?B?K3ZLUXRENmRqdjVxZVdWT21yTm4xcmJNTlNoRnU0UVVpaWtla1dUeHhMeGdX?=
 =?utf-8?B?WE94TmlTdDE1Tk01bTZpYVpwZjlwRUxvM205aU5Jc1h2b0pxd0d0ME1KaWxo?=
 =?utf-8?B?ZXhYckxCN3FFdDc2YTBZTDlwQnJSTFFHUm5UTndqSXVkeGVOdVFZdDhleC9Q?=
 =?utf-8?B?RWpiVk1JVHY4bk16N2lTaEo1TStldkdGRXZTWTBjUlJvMG9VSUtzR1hTK3RM?=
 =?utf-8?B?bllOSW9qNkhVSHN4ZWVhTlM1R1NKdkc0TDVxTUZNWTlQNFluRktpWjhoMGhT?=
 =?utf-8?B?UEpKN2o2N2FYQ1FRdkFqSGV4TVllc2ZEanEvZUU5R2QvYVpOWXBCTEVYM1VK?=
 =?utf-8?B?SUthRnVFUnRiRHdKN0N6VS90U1BtUitNWTZRb05KZDNzbXIyQWJXRDNWN2Nz?=
 =?utf-8?B?RU82Q0RiZHlaUWVONkF5bi9Pb2N2T0g3cUg0VmNjaXBxa3c0NVVOdExJT1A0?=
 =?utf-8?Q?VZTTOElnYA8tEmwKjhClP4YFO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd39b0f-dbcc-42d6-bd77-08db46799892
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 17:13:47.0370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syVCZ4by6RPf2YOJ9Ar5xmXEwTrGxdVOIqcc3sto0hqehYNlsihAAo+f64R+5qKgGiS3V1GQhfzoQXvuIHIURQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6816
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/26/23 07:18, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c:119:31:
>    warning: symbol 'custom_backlight_curve0' was not declared. Should it be static?
> 
> This variable is only used in its defining file, so it should be static
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/modules/power/power_helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> index 68d95b92df76..30349881a283 100644
> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> @@ -116,7 +116,7 @@ static const struct abm_parameters * const abm_settings[] = {
>   	abm_settings_config2,
>   };
>   
> -const struct dm_bl_data_point custom_backlight_curve0[] = {
> +static const struct dm_bl_data_point custom_backlight_curve0[] = {
>   		{2, 14}, {4, 16}, {6, 18}, {8, 21}, {10, 23}, {12, 26}, {14, 29}, {16, 32}, {18, 35},
>   		{20, 38}, {22, 41}, {24, 44}, {26, 48}, {28, 52}, {30, 55}, {32, 59}, {34, 62},
>   		{36, 67}, {38, 71}, {40, 75}, {42, 80}, {44, 84}, {46, 88}, {48, 93}, {50, 98},
-- 
Hamza

