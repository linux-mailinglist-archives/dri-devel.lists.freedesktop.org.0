Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C67ABAAB95
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 01:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B230E10E4B5;
	Mon, 29 Sep 2025 23:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OIGE78JI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A81210E4A9;
 Mon, 29 Sep 2025 23:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eareMnoYKseadsn+2tLOJd0EMa0/U1r9/r/GyP9sQotK25Ghy5lrh9UCairmjqfFG0Q7GRlYshaNl7GmLDszoO7y46L6S6dO9fHBB+lOhP2KEBAKbq+XsG6Yt3nDNfNULmxDHWFzr3jrD658LUYUBedS06b+w3n5x3ojZPdr+99xNFFFBYZrRv5fVlZlCZp7VbwgCFSeETFIpYNtPEXKzvYhHenM9ElPj6vZx2ruJ7r4cFZfx5WuKOdB4v9D8HEqKdyW0GxukOVb5xiMmUQotVgU7RPJ4TjQvEATVcPNA8aaFyp93noGtG+ucf0FGAxsj4ebPXSGCE0r6Z42a2Z57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYjvuu8g3R9u/NDDzjSlzVHsIcztLFzVZv3gsTisbEE=;
 b=dIKNxdOvIS+FTVQKfyBGfZKItiSOZOG8O8b1MOXejDuCODY4y1L7EiKuolLI3GYE0/R2oAXU7L7OPXJtful221efgyTmEb6Ow5JRfUgiIf6jbT0DTrcDoV3DMAi3/FsENR6El58i3n6UO2aJ3PXTgjwy5VEImbwuql6oIU6D8ILi2erB5zeRdiysjSzoEbJZKKE/JzRx4Kdex+B/3CKRzElxeQa0sCNHLY5BHJlrYADQd/LtanXBZQRPHVUYl/1No+uqI2WcZEj5MwHlXx/OKXDgJt+OW/1+OFN3reqJwWMVecNXi8BN0dWyZhRkY2WQhKFY9q4TiIf9bt/Nt/2TUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYjvuu8g3R9u/NDDzjSlzVHsIcztLFzVZv3gsTisbEE=;
 b=OIGE78JISVRDdzHqfm7nzaObZkTxBMqqTzsGjBqIbVvVCf3ihIqlEK1wN8Oeujq+yYgtNsi19X4Z4TQwDNeFO5nYE/odwpgISxtVVG0mIqLUaRslJ5XaxlpQxuGftxYtFB/NnVHUqB2DUz1KZmJUIHNrlFCEkY67Z2cAqmfPzkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH8PR12MB7445.namprd12.prod.outlook.com (2603:10b6:510:217::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:02:45 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 23:02:45 +0000
Message-ID: <280dd0ac-559c-450d-8ca6-27dbd9999edc@amd.com>
Date: Mon, 29 Sep 2025 17:02:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: kernel-doc: document
 mpc_color_caps.num_rmcm_3dluts
To: Akiyoshi Kurita <weibu@redadmin.org>, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250919203011.1833355-1-weibu@redadmin.org>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250919203011.1833355-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:303:8d::10) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH8PR12MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: b60512c5-7437-452f-7776-08ddffac4d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVRaSlBCSHNlcTBxbzl0ZE9jc3JGL2dXbjVJb2Jsb0ZaeXBJT042Qm1BVFFv?=
 =?utf-8?B?WERXYU5wQkk3ckNPRzAwZXVNcXdpK1U4ODdFRXMzTG8xTk5Pbm5zaHZKQksz?=
 =?utf-8?B?UnVSTlE4empaUmpITmdBSUo5aXJuK0RXOXdiMmJvcmp3enE5dVQ5V0VzU2tt?=
 =?utf-8?B?SitOT0xhMFNFVTlNb2U2WGNPWDRtQU9Wd29yVlQ0bGlWVS8wTHY3clNySUFn?=
 =?utf-8?B?OVhLUkd3ZnVTVHV5NnlpV0Rpd0VvNG9vSUF2aUtHMzY3T3dITS9Wd3AzM05F?=
 =?utf-8?B?a0JzbGYyNUZmZWtiY0NGdkVCTzNONGlER2EzWXEvSWNER0VyNW5PU1hMenVl?=
 =?utf-8?B?UzVzZEgzZ2VzMUowMFhxbTQ4U3BqQVpXUHVlUE00UlJGUzJYNHZwMjJlRGRP?=
 =?utf-8?B?Y1VEak5ocWRTUkVjaC90QnY5THNIUHhCczlCVlRtNlkwNkRkeHBkWktSN24v?=
 =?utf-8?B?VWxjMEk4TnVtWk5oTEVXbTFwcVgvNEtPd1p2d3FTdGpxS3AwQXg4TzhJd1RK?=
 =?utf-8?B?MEl5cEhpeFFMRS9iTExlK005ZWNYRFQybFVSeU9Pa3pKLzU1UUNiWjRjZTNp?=
 =?utf-8?B?cFcyREhZZzRONFQ3Tm9ZOWpCbkxTWU5rWUZkcFo5M2lOcTg1dk8yajVsY3FK?=
 =?utf-8?B?RnpOYnNIcXpMS2gxSmFSbjYrdGdOVkxEUHVvMU9yOWtBRkJJenNGMzNuUWFy?=
 =?utf-8?B?VTdvSXd5ZXpFZWthYWh2c29uY3JCdm9YWkFwNHdqUncxYWFDYUIvMmFUMXow?=
 =?utf-8?B?UDZkeTJCdTdlWnZuRUJteXRtVUdmSjdheVlDUGxKN0x5STRHS0JCdzNObksy?=
 =?utf-8?B?aTFEUklURHZqd1k0c3JvUVRCeFNJczlFQ2pvckN2VnE3aHFrS1JncnFMU2xQ?=
 =?utf-8?B?Z3IzbXI0S2dEZzJ2aTFXUmUxTEVHR2RNZ3EzN0pwcEhPWTI1VS8weThQazBm?=
 =?utf-8?B?b214MUdpajRJNDVUcTBOVVJLc3hKUDBuLzVBYU9KN1hSTXltUFlpdWM5NTEv?=
 =?utf-8?B?SzZhb0FPZTdyS2dnNUN5Q0lrOElFQTBIZ1gvb1ZJc0tYb0UzZ09tRTRUNXJY?=
 =?utf-8?B?cy80ZWk2MUU3ZWFPYXMxUmZ1UGE1SGVPWE1yTmNTalhxUTF4NWw4WDllRkNE?=
 =?utf-8?B?YmRNQ2lVN0VrOWdRdEg1M3UyWVkrVVgzbFA0UmdyTC9XVzRtZHNnNlBkMzlU?=
 =?utf-8?B?MThoVkEwenpXV1pTeTkvNzlJVmJ2amxvVVRXMmVCS01SZVpFSVpOMHZuVWtI?=
 =?utf-8?B?TXVUWW9MRlhzdUNaK2J6ZExoSXI5WGV0OGMzNkxaMStIY0x0ZnArTDdUZ1N5?=
 =?utf-8?B?TDBjM1ZwWWszc3JpdmpjdjNDTXpwQkRMUG1yVDFnRVBKUVdTRVl0SGNYNDJD?=
 =?utf-8?B?MUNHcEVPSjZ5VnoyVlVrSXA3MUMwTm5uMHFvU1N6bndWUWo1cGRDb25ZeDBx?=
 =?utf-8?B?blQwbUlDay9DWFZoWEk1ZjgzbEE4RXJnaGhxT0pITlVuZU5nY0JWS2tzZHU4?=
 =?utf-8?B?ejE0NDZYWDN0MitlQ3ovblB5d3VWakVvTW5Oclptc3ZFbGZaSVNUL0FIRnpJ?=
 =?utf-8?B?MGFMUWpjeWxGOE9lQzdDWlo1TCtWUUJncXI5dHlwVjZURlBoV1BjbE1zM0Vv?=
 =?utf-8?B?OUJFdGIyeVloNVRBZk1NVE10NmxraXppbGx4b0RGT1dUa3RVRXkvdnZGWmx4?=
 =?utf-8?B?ZllvRjVEZlhWd0tweWdwRE5wQWpaTTBpc0RpSWVVNjRNRlFlTTRncDFrRGxh?=
 =?utf-8?B?UFZ2TEg2OVN5LzBxK2pwcnQrQ0xHUTJBTGJwbFFaTEhOd3N2K1lVNXcxODA2?=
 =?utf-8?B?cFRleHhjVGJUTUdELzc0b2VEZHpyWjh1OGl3OTZxSVc5ZHZQOFNSSGQ5RjU5?=
 =?utf-8?B?bFB0N1JXNjZyV2lkZmgzbk9hOFZndVdCRzVVd1RWQVBRZ3ZjK25sRkx0NFJU?=
 =?utf-8?Q?Fm1FbE/AJk37A8v+qOyANM7IE+PDHdOD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eThQeThwQmtSbTJmQno0MXBLdTkzM1B3ZWF1ZndkVEZrSjhYUnRndFFCM0xq?=
 =?utf-8?B?cElpZVh1cEZhN1V4UDkwTmJHb1NicXBxNDlRdkxQZmswQjhrRmJEVXRtWndp?=
 =?utf-8?B?K05XMzhWL0Fwa2NEQnRSU2ZOdXh3L0tQbGlrNEYxeDMrNkZ3dXRueWNxZEMr?=
 =?utf-8?B?ZCtWY1BOV1pmSWpORWt3REh2RjlBZ0RoRXNhOFBTN0J5S252REZGUXJWVXlk?=
 =?utf-8?B?QVNzbzJJcXI4UjdSRW5RbVhZZVhNakxIRmR3QjN2MVNRbDgyRFpHb2lneXp6?=
 =?utf-8?B?OHd2ajl3dE52d3FoNEM2WGJwSUpFd2JKcXdjdTlISkRqODZpbkxYVmxaN3lk?=
 =?utf-8?B?SGMveXVCcDRLUEpxMnQyT3NwSzFHUjRIcUxnbU5nTTgxa0NURlFhUVJmRVVy?=
 =?utf-8?B?Uis5dVpGaEhYRzRZdjVNZjUra0xNdyswTUlvL05XSW1oRUdSSGMvOUlQT2Rj?=
 =?utf-8?B?dUplTEJHNEtYNjFkZ1d6MHRrcXB5MlRpT3hNQmdzZUdQdHVNS0xydEFqY3pu?=
 =?utf-8?B?cExDRjZOb2wwUisyeTR6cE5VRmRETkdrOG0wSmZlRi9lcStPYk9FaTNiQitY?=
 =?utf-8?B?N29jNlRFRzZaOHdweU9FTTI4dnVMS2lMVjV1emlZSzZWdE1JRllRTDVKTUVZ?=
 =?utf-8?B?Z1o4WlBMclZoN0pSRHcxbUFsL1JVdjBEcXNVOVh5YWdQa2dyb3NHVzRKdnVX?=
 =?utf-8?B?U0hzb0JweUV5eFdSck0wcGdDbjZkdllEMkZibmFQbWlxMFg5Yy9mMkZYS1Nv?=
 =?utf-8?B?bDNtS2VrRXJKMGdUODFpemgzMGk0MitKclMybHZ6SHpxZnVrNzVaYmRCUGxT?=
 =?utf-8?B?RkJFYTFyWnpOeXlnQ09OVEl0SkF6d01aSHFnT2hIZGtwaWxIQmp5RmVuMHcr?=
 =?utf-8?B?SFNjOHp5Y2VIMUE0OTIwaVdDKzdqUTVsV0pXNXFNcWhDVkxad1d5aXBWbjFh?=
 =?utf-8?B?NjlMZUloR2IwUDIxWE9FK3ByY3hOcld3M3lINjJEOXI0RzJMNTZ0VDlTVGVY?=
 =?utf-8?B?VVJrMk4zN3ExcG9TdVNSZzhFbXdPRlRYZnlrL0JkY0lSRXZUSDFUR1BrNTBL?=
 =?utf-8?B?VWpUNzZZQ2MwaTQ0bUhvNExGQ2VSb2FBNVhKMURvdDZ6T2VwaHFyZGVDS0NQ?=
 =?utf-8?B?eVY5MWpHVjVsOFhid0RUVkFibDFlUE9MbEYzcFFYWkdUaGdpT3RWbTFUSnh0?=
 =?utf-8?B?OUs1T0dRQnlSV2E5enpCamM4K2FETy9Ec2FGTHFsMjh5b0I2SDRRamszUVBp?=
 =?utf-8?B?RTBUdzRQekFJc0RSYXlJdXdlVGpUR2tjMWlqMXJlNlNka2hhZE1Rdmh5b0RZ?=
 =?utf-8?B?cG4yTE5nL0Mycm9Kc3ZVZThib0JxeTh0UUEwb0xmKzFqRmt1eHFrV291ME1J?=
 =?utf-8?B?RmFvMldabE9qNFJ1eXJ0eGUrazNwRitBN3Q3Qlg3SXZobTR5RGJLeEhqUlBW?=
 =?utf-8?B?Wlh1N0NIS3cwSFp4a3J5QlJDN3MzSkk1Zi9na1NHK1B5bW5ubVVMQnN5MEZl?=
 =?utf-8?B?WHFBN08wSmFEckxuY3JobnVrazE1bTcwejdMNG9DbzZ4aDZHckdqR1pKeWxj?=
 =?utf-8?B?c29qNHIyOXI1SUk3Zm9xWmZZQlZyNkJsNTBscUZTN0NIWVN1cXZlWCtYTG5o?=
 =?utf-8?B?Z1VpdmkySDhVOUtWbnhPZDFFN2tXV1NXL1pZYVViZFdKd3kyYjY5aE5UM3lB?=
 =?utf-8?B?Ui9VQXlFVWtLa1BhQ2pjRkVmUXVDWjc0QmxFUHFPVGdrUU9RVWl3UGdabWF6?=
 =?utf-8?B?WXNGNnJUbWR0aFM3T0hQTVJ6Sjg2ZzVXbitVbm03Z0xaL2MvMnJDQU1peGFX?=
 =?utf-8?B?NXBuWmZxdW5PZW1oY0lpcCtMZmRuZW1KcmdONm1zVjI1bEVuMHNTS09Ka3VB?=
 =?utf-8?B?SFlPc3IwSlFPVUY5MGMxVm1RME43aUdRQjcwOU4xT1VSV2cvZTNTUHo2MmFS?=
 =?utf-8?B?RFpXWHdaYWlNNFhldnJCMXcxK0NwcjVYQXpUZHdhY1JUOGpzcUFjbUhFMHh4?=
 =?utf-8?B?NzR1dXF6YVAzeTZEbUZvdG1JRGc4Z3o1dm1UWmordHpGTWl3aFZCWmdMWlY2?=
 =?utf-8?B?WnNJTG1uM1grUDJLUWd2R3JnTEJjbWJ0MnRtNWRPVWFVV3BBdG9JZHpDaDRa?=
 =?utf-8?Q?zs7nvVk+EXHcbkd8KRQAErP6E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60512c5-7437-452f-7776-08ddffac4d37
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:02:45.3536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3ehHL/xVPj5jk5g4Smql3Civt1tCkoabiWHvsXwMyd0X9uq6NAdTnIKuk5bPEUgIJT/U7DcJJsm+DsqG/0fjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7445
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

kernel-doc for num_rmcm_3dluts is updated in the following commit in 
amd-staging-drm-next:

380366f6d35d drm/amd/display: Document num_rmcm_3dluts in mpc_color_caps

On 9/19/25 14:30, Akiyoshi Kurita wrote:
> Add the missing @num_rmcm_3dluts field description to silence a
> kernel-doc warning. While here, fix a typo in the same block
> ("pre-definied" -> "pre-defined") and clarify the oGAM description.
> 
> No functional change.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>   drivers/gpu/drm/amd/display/dc/dc.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index f24e1da68269..144de7b3ed49 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -231,12 +231,12 @@ struct lut3d_caps {
>    * plane combined blocks
>    *
>    * @gamut_remap: color transformation matrix
> - * @ogam_ram: programmable out gamma LUT
> + * @ogam_ram: programmable output gamma (oGAM) LUT
>    * @ocsc: output color space conversion matrix
>    * @num_3dluts: MPC 3D LUT; always assumes a preceding shaper LUT
> - * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but single
> - * instance
> - * @ogam_rom_caps: pre-definied curve caps for regamma 1D LUT
> + * @num_rmcm_3dluts: number of RMCM 3D LUT instances supported by MPC (0 if unsupported)
> + * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but single instance
> + * @ogam_rom_caps: pre-defined curve caps for regamma 1D LUT
>    * @mcm_3d_lut_caps: HW support cap for MCM LUT memory
>    * @rmcm_3d_lut_caps: HW support cap for RMCM LUT memory
>    * @preblend: whether color manager supports preblend with MPC

