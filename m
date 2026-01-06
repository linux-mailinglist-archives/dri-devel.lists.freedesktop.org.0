Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B683FCFB63D
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 00:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5B810E24D;
	Tue,  6 Jan 2026 23:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KyeN0pxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012032.outbound.protection.outlook.com [52.101.48.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA5410E1F3;
 Tue,  6 Jan 2026 23:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gESD75fpW9+uAg8GKnJVrsy1Yezm46tQUr8XNEYj6Cpvjq9FUNC/TXLzHXizTQ1dwdMMOVToMqw1LapV1aYgR7emMPNvallhOUhGcTi19hS5Y7bkxYdApEl7m+RQfsTaSUJV//vq/0H5z1793CXrpQb9evKtB3TQO5yYpvIgrk009bsYU9gCsUJkDqCqm9HMyyfy+0eWi/BsUbnRw2Dzv8kfKJiN5euf4bcsbQXeE/zjWhhijOwEX3XR+WY54spiZz3zYtCVNsHKWuhT/Ey7zIFjsIxe8x7FYfJgPGomqbo8d8kKy5Pm1qxWlrncbnzuoCYFpIjc2TmL0R/bgmdXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZ7WQ9UuCZ0epXB1ET4aaT53iCYeDkmMSYX9GtOF0Tg=;
 b=wsKp7pNyZyOOHMcbwXVDeghH7BGFaajRzMYVqjvmqagLmkA11iTChGmxdxXMSJZe77c7I8ezL+/aokZNeX7MRdvo0e4ExjaBTzwUSXzeqasoPIX3GA5H7mkQAwo+uVqzuJV3nthUPOyg5FpbMx3CzolL+jIi/omHYY8sLEQELtRBmZiMkcXqTA2vfIS5y/izT9vzl/GWUShY7aNJpTT+9j8lBYujr6dLZEcWRKO1NVxi0LfflF9kyiwnE83PnkHjLJrg9FDwyosNq4NUZq83U0COpzdr/d5tnyLzsozBRkhvxd+ntUL2PjzXGripsvPu1YEVc6BhOtN+3M3qRAxhow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZ7WQ9UuCZ0epXB1ET4aaT53iCYeDkmMSYX9GtOF0Tg=;
 b=KyeN0pxf7TAiQn4+xwgDmfm923AZ6OStFCLa2vuxgtRSLpuzsuFqRhtf/wBZFnkdwoCVEuhKrsaUrBmKpdDaABzqCWkUjTmkaICJHpHTHKiz1CEsypMnt0GkJzOqjityGHpM7cFEuupfDEznAfLc67dh5FMEtbVZOca7910kSps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB6984.namprd12.prod.outlook.com (2603:10b6:806:260::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 23:50:47 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 23:50:46 +0000
Message-ID: <cc16d03d-e9ce-42cd-bd98-543f8670a70a@amd.com>
Date: Tue, 6 Jan 2026 16:50:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] drm/vkms: Fix color pipeline enum name leak
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 daniels@collabora.com, uma.shankar@intel.com, suraj.kandpal@intel.com,
 nfraprado@collabora.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-4-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251219065614.190834-4-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::35) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4855d3-d02c-426d-24d5-08de4d7e69a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG1TdU1FZVRrZ3dGUDl6aVEwNkFkdkRjWEJlYzhNQitQWjBIK3B4SHVXT2Fw?=
 =?utf-8?B?NVJ1UXJHSXJYQ0Urem5QU1JJTFFwSjdxamdtS1RzUmVLSitwMDJJam9WR1VX?=
 =?utf-8?B?OFhORG9CV2NnSGgvQnNzbG1mcDZCU1NRTDk3bU9wMElwYk00ekd5L2NqR2tp?=
 =?utf-8?B?UWxNMkI3SC9OalZieU4ySDBHY3pxaGVXVGpSakthNERtTEJiU1NwTkNsOTlt?=
 =?utf-8?B?SnozL2JNYTY5WGxZcXR6KzBFamlNUGNwSGp4YkhGUkdtMXcrayt5WC9XZDFN?=
 =?utf-8?B?ZVNtOWJwR3ZNZ0o3Zkl4eEFoKzY2Nkt6SHAxNURLWmxkZ0VJSmoySlJQb1ZT?=
 =?utf-8?B?V1pTSDVxNVRxZUJQb0FPdmlPZC9sM0Ryd1FNblhVZk8xb3l1WHI3RHJCTUVR?=
 =?utf-8?B?enFzOC9zdGwzRmtGbjBmNXBTVittamJCdjhSUjBqQSt5dklIZHlJVTh5YmEx?=
 =?utf-8?B?Y2EyaDVrZFB5U09WZk5YNkVqbURadkFBcFY3NjdFUGhuUWsvb2Q2alFXMFJM?=
 =?utf-8?B?V1JTeVdJSVdNWkhFWTFLbHNkdmhrS0Z2YnRIU1lra3BkUGZGRWdVMGxDZU9h?=
 =?utf-8?B?MDFrSXdlRXUzMHhRNUJYa2JGcXVjM01kSC81K1NPcXBkVlNkNU1mYkVKZ2s4?=
 =?utf-8?B?Y05QWm1NaExLRm12Vnc3R2V5ckwwOWQydzFtbVhvVlVtcWZwSjZZUUluSUxE?=
 =?utf-8?B?eDhwcTIrRFphTkk4MUthYkZKT1JXTDY5bTZiaEFvUDdkVzVXaC9uQ25YRXBI?=
 =?utf-8?B?OGw5dFhvR1hROUVWRTRPWGVFaHVBNUpIT1VNTmxzUGN0dlNFNVhCTnhNQVNQ?=
 =?utf-8?B?a2JkMnNucVlHbXFXdEl0ZzFyb1lRSEg5UDJFTGIxVG81OE1LYUhwSzJlNC95?=
 =?utf-8?B?ODVpNGhvV3VQbGUyVG0ySmFsUWNCa2NVWHdIME1jQnF4dTV6R2NWeU1QMC9i?=
 =?utf-8?B?OEN6QkE5ZlN1NmUybUpzajJQNnFsTy9iSzV6UWxCcG1yNTVtTHRLUGttc0ZH?=
 =?utf-8?B?RTNRK2ViSkdqWnFjWVN2cjM2bGdUWkQ1K25UcmVHZ3dHai9tS2dBRWhuY2ZR?=
 =?utf-8?B?cWlTaUl5NkRyR3VKdmh1SUozd21jM0NiTzJlQ2lBRXM4YWZQb1p1dWlwcDlh?=
 =?utf-8?B?dkcvbUtZTUhOcHJkc3NHeDR5RkdQdzEwTFpOak1haDcxWk11QWVKRnFQWVBL?=
 =?utf-8?B?cStnM1daNm1yWU1oMEtCNkhxWlpOUDRkazJqSldkaU5RdHlJWmwzVlhXZG9B?=
 =?utf-8?B?UEpQcW90TTRyZ1hRSTgvb2FpSzBaWkp4MkMzNzByR3pTZ3Rpa1ZwajZOdHRG?=
 =?utf-8?B?aTZpWGgvenE3VmJKandvTS9xdzFwOHJ1UmcyOGNGa0ZoUGVGc3lsVnpadm1o?=
 =?utf-8?B?OUhnUkVMMFdwb2JadzN1Ykp4R1dPbmppN0lNeWkxWkFiTHluRS9hYk4zZE9H?=
 =?utf-8?B?WWR5L1lKR285RmxNRlM1K3J5cndxSFUvNUxTSHNEak02UWNGeHBJeTY0ZTYr?=
 =?utf-8?B?ZVdFQlJzY283cWNhb21iM2NTaHl3cjBIQVZoamFEOFlYN1BkS1VLY0phMzlk?=
 =?utf-8?B?dUI0UWZsUjVhcnRVUHFyYWdpMzArdFhiTmptOUVUSlF6R3pnc2JrRmV0UHgw?=
 =?utf-8?B?em9yYVFwZmJvcnJlMHVSbDIyMHNEaEphZUFqY2ZHWlViOXpialROc0N3T2Vy?=
 =?utf-8?B?V1JoRU0wUStMaXViaVdvUGRIazFhSEx0ZzRCYTJBZlRwYjBmc3UvaEhULytY?=
 =?utf-8?B?NGlyK1JjKzdHMmpvVFJzZFdHalRBTFFKMlhtdTZ1d3RRZC9YdGlyOUptUUMv?=
 =?utf-8?B?VEd6WTBuWXF5L1Vac0hrNDFOWGt5djZKVzFXRWVRWEVLZ293K0FNYXd2NTlZ?=
 =?utf-8?B?UE0zQjZuNUhmbEwwKzRRVk9oRjVydUFDWEgzNGIzQlAyaWdBcDIrc21RYThu?=
 =?utf-8?Q?qL1zMXl/8B1xx6mhQojYm/RVXdr5vGjR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVdWR0JkUjAvaTFGcENqWUxlQ0E1NmM1UWdRemNGY3p3QzBSL2ZraXgxN2V1?=
 =?utf-8?B?QWxDZS9MVjVBbzZ4N2lKdWNhaE1oajVrRWhmaFJ3SGJjNHg3OG03cGQ0Qmk5?=
 =?utf-8?B?Z1BYTC85clRzd1MwRGVMTXgzcnBKMHp2VENxc3ZOdVZ3UFc5b1YxdnA4OWh6?=
 =?utf-8?B?UU5YVSthYkNteUVXeHFjVGxYdm9LcW9WblptZHFJREJMR0pVMS85TWlSWGx6?=
 =?utf-8?B?aWhOdVBhV0hQRXI2WWhQVnhnVVhHMVI5a2RIazZ6eUEvamloZjVod0x3M2V0?=
 =?utf-8?B?aDFsWHBwLzRtWU9uS0FtRzFGM1hyQ1lTVEVrclozY3pkZmxtU3FjUWUxRjU3?=
 =?utf-8?B?Tks2dFArdTNOQ0FhQVV6REVldTA3TWtscVpwLzdkRjhxWGZqZEwyV3FMNHBv?=
 =?utf-8?B?KzQrcnZxL3B6aytkUnRTaU9pcklJUEZFelJGVmNyenQ0dld6c0syY0RReHFW?=
 =?utf-8?B?Y3drQW1qc0dJUDMzK0JGN3BWL1BocGMweXVYZGVvYzkyUDVQbHduSVBxaitz?=
 =?utf-8?B?alRGSTM4bDF6RnR1RTQxZXBTRmZody82NDlsTzZzZk5RQXJ5VTN1S3VNbTRw?=
 =?utf-8?B?enVQbmc1dTBJdzZkRFhINHU2UjU0SUw4dTBmNGtmU1pQRWNBL2IyYWxpWDNk?=
 =?utf-8?B?OFVhdE1LNENLTkJ1RThFQ0RnS0hGbFBueGt3Z1ZESVlDcGZlTFdlSDZEZG8z?=
 =?utf-8?B?SVZCQjRwMDBRdlg3QVMySXN4VFZXTmRrOFNzbkhma2RsU3Z5NUNBN0FDbEUr?=
 =?utf-8?B?aWM0WVBLNVdUQ3lpVVFzSE1XUkNUUWVKc1YyazVnaE10K1p6UVV2MlZNRkF5?=
 =?utf-8?B?QlFtRCtDbnQ2YWVZZlBERXkvNzVRRDBaeWZRWEQ0VTJiOVF3Y1Y5ZjZkc2RY?=
 =?utf-8?B?cHR6VXkwd0pYQmJPZjY0WDN2UFY1cGlyRXNrb2xwMFI3REZraVRyYzFnQ3ph?=
 =?utf-8?B?dWV2aEU2OS9YaVFFNDIwZUxIQ21DYkZyUmFKOU1mQjBHY0RxNllzbXk2Tm1l?=
 =?utf-8?B?RVA5dEZQTGZoR2FIRlRpZFh6cHpmMW91SkhURE12a2I1cnA2R1N1R3l3TElN?=
 =?utf-8?B?RG1YQ3dwTGVkSXM2MnByV2F4NFdWNWxkbWVzZXZIUm1PTmpBZUkyWWhydEgw?=
 =?utf-8?B?UnNEczBqUE9qTjN4T2RXczRUakF1bUZFaWVCSXlGWC85d2lVYjlqNzNUOG02?=
 =?utf-8?B?eGFsNks3djdXSVpua3hLODB5NFJhN3B4R0Zrd2xPaFBwUk01UXZhRXVaeGJF?=
 =?utf-8?B?ZVpBUysvNFRTT1FjR3BPaGpQUk42WTQ5UGlHYTlZbWxpZStOU1d1UEx4aWhQ?=
 =?utf-8?B?Um9RN1pZQkZCeGRGT0xMN2FSZlNmU3hoajhhSXhvWmFqczBtUDhLSzF3ckJo?=
 =?utf-8?B?UlBLaEt0eHFmNUFCRVNZSmJjbkM2QUF1dTUzTzluakxhYzFOMU9Md2Nhc0ox?=
 =?utf-8?B?c1YyVk9pd3V4RldzTG8rUHRJbU9GamREZXhyVCtZSE8ybHlIcjNQVXdjN0Z5?=
 =?utf-8?B?bVRoVHhFcTJvdDQ0VVBkZEJBakJpYzVmYkRsa2pCd1ZlV3NNUTM1cHRmVlZS?=
 =?utf-8?B?TTdUOHJGTEFnZmlla1paS3Nnek1hNWo4c3Z3NkdOWEJKODc3TXpmVlJWdXJK?=
 =?utf-8?B?V1ZjQ1YvRVFjbXNvdW1ZVlpuU2ViSnhsRC9MY2o1dEs2Q2xjcSttQVl2RWxX?=
 =?utf-8?B?SWJYNUJLZS9FNkhBYmNkVi9lQitMNzZ1c3o2NjAzMExDVFhCQ1U4VUsrZlI0?=
 =?utf-8?B?NnF2dWlHL0QwbTF1TnJtOElqczdLMGtFVnZ1QzBJZTlHenRRNDV2dlJwRzFz?=
 =?utf-8?B?endXZ2VON0VUeGUxWUcxM3FjdEdPREhPMitCMmNWdmhJbytYY0hoeEZ2Mm9Q?=
 =?utf-8?B?bVlmUFREY1RGeXRkK1B1Y0VYTVVmVTNYekF3eWJTczFrQjVzQStIOUhxMzNB?=
 =?utf-8?B?MFBWQ0JndFd3dnNNREhWcGZOa2ZEZExQazFXMy9MOWdBdDZ0WEdleW90THdx?=
 =?utf-8?B?YkE4ZFdDSlRQc2JseFpMRVdTZzhReHhuYnVONnE4UFdXalRyRCtYWWZCZk81?=
 =?utf-8?B?aFIwR3c5dm5DcCtlRFVuTG9MQUJtdS9CZ0E3UUErcE04YlFQSEFuSndPYlFJ?=
 =?utf-8?B?cnZaL1gyQUF5TVU5ekNoTXJtWTQrS0lhNzRuL3BqcWgyeUVsWHBCSVpWSG81?=
 =?utf-8?B?ZDNybDErbERheXB4UlBmbWFxK2ovWnAxbFVYZDdpK3NSVGtYU3VrTzJ6VTYy?=
 =?utf-8?B?c2kvaDRCcDJ1OTZ4T0JUUXpITFMyb1NJT2k4NDJiNi9RZ050SjBnUmUzR3BQ?=
 =?utf-8?B?VnFWMndjdHRHZTFCWWQxZC83NjNWd2Y0UUxxRTZlTWVWQmUycFBLdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4855d3-d02c-426d-24d5-08de4d7e69a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 23:50:46.8278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYj0LYq9iiQ37spmVkFlXyi5ht+HDaUi3hCFiAIHKSY/NedT9G7qMpyxxMlUHwOOyy/nqxLg5lzNyhvDHbjYjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6984
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/18/25 23:56, Chaitanya Kumar Borah wrote:
> vkms_initialize_colorops() allocates enum names for color pipelines,
> which are copied by drm_property_create_enum(). The temporary strings
> were not freed, resulting in a memory leak.
> 
> Allocate enum names only after successful pipeline construction and
> free them on all exit paths
> 
> Fixes: c1e578bd08da ("drm/vkms: Add enumerated 1D curve colorop")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   drivers/gpu/drm/vkms/vkms_colorop.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
> index 5c3ffc78aea0..d03a1f2e9c41 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -37,7 +37,6 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   
>   	list->type = ops[i]->base.id;
> -	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
>   
>   	i++;
>   
> @@ -88,6 +87,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   
>   	drm_colorop_set_next_property(ops[i - 1], ops[i]);
>   
> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
> +
>   	return 0;
>   
>   cleanup:
> @@ -103,18 +104,18 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   
>   int vkms_initialize_colorops(struct drm_plane *plane)
>   {
> -	struct drm_prop_enum_list pipeline;
> -	int ret;
> +	struct drm_prop_enum_list pipeline = {};
> +	int ret = 0;
>   
>   	/* Add color pipeline */
>   	ret = vkms_initialize_color_pipeline(plane, &pipeline);
>   	if (ret)
> -		return ret;
> +		goto out;
>   
>   	/* Create COLOR_PIPELINE property and attach */
>   	ret = drm_plane_create_color_pipeline_property(plane, &pipeline, 1);
> -	if (ret)
> -		return ret;
>   
> -	return 0;
> +	kfree(pipeline.name);
> +out:
> +	return ret;
>   }

