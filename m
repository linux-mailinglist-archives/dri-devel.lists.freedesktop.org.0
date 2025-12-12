Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C3CB7FF1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 07:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF1D10E330;
	Fri, 12 Dec 2025 06:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ga3giEap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010000.outbound.protection.outlook.com
 [52.101.193.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2450E10E32F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 06:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcyt9AXHo7Wgr8QmnnPCWep+MRQ+TkJ+oFj9OELs+m9RqVwLkQn4Qa3FOG2Gf5abzFSm7Nl8oTxcH2Y0KVDFVVTg8vXhePuo6EXZNMwE2UXE7kZCqkccvnkyO4P7TPhsZI/RcEL6ppdvgVdSo3lDWpj/fWDQKveYIPE4OKRLfBB7NPyxhZ8fhZ436DZT80TG4RvVqj3JP+cwq8CNp6Hu9vI/wK+jth6E0R+6FLhKsiB21Xh9TkW4PJoHdplHaGu6rRQ01i+Z/zvIS+5dWb+i3vZjFN8LS2zIJb1gstHont/wvNJas2quvWhN5LectL9f9mX2ZIY6WYgCRNWBXY8qiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgOLzglo8zvvcoH+lDh+7ZEdcBzHjckizIAljcZIavw=;
 b=v4oEkupcNt09Aw43FPpALG+IxRu/LhmklMteJzhUKQ4g29vl2f8D5eC7geRm0Z4DhSQls3Sxp3YAiRsMjE3xn8FV6lAJ4OvSC6gezNausUqpc7Dgez/R0lCSdOM8T2M7ughQX5YiSJQ/4kYfRp79MnVpImMg36prLKcgHnqLPif1HX1YW6rWqpwv10hT/cQ22kOZxTZ4zuTTonyT/Hb0FICWyY39uH7VuLezXAFLewmeGKh5OAg6P5AyvgGDQEUh1UvMKB8HtJMgOtShZC5QWp7IT4v9zOBc5DnFFoA1tHS4RE9TUz5ztVh/Otl3g77+qtaNjjerIGo6ZeanIthkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgOLzglo8zvvcoH+lDh+7ZEdcBzHjckizIAljcZIavw=;
 b=Ga3giEapK4FHfhTJoOU/ExLP/dGZY/qrEAKx9E775AEZonlUGLZ1SBmRIDxaMvJDJ4IVBVRcGqpMaZ9yNQ97iV0QRHWvw+RNBzn3x1HfNKVnJFZ1yZrzea7LnQ2wRMn2zp++POVpRlpcdoCN0726IvBm9cWSqroYmA8kgJzSYag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 06:01:15 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 06:01:15 +0000
Message-ID: <5e93b33d-da81-48cb-80d1-00e4a72b4acb@amd.com>
Date: Fri, 12 Dec 2025 11:31:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] accel/amdxdna: Add IOCTL to retrieve realtime NPU
 power estimate
To: Lizhi Hou <lizhi.hou@amd.com>, ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org, ogabbay@kernel.org, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, VinitKumar.Shukla@amd.com
References: <20251211175802.1760860-1-lizhi.hou@amd.com>
 <20251211175802.1760860-3-lizhi.hou@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20251211175802.1760860-3-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0232.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c36e08-bba3-4048-5db5-08de3943dc0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTZRN25rQWxHUnJDWDBjR2hFSE1IWVg5TEpNNGhYSmhhc2tFNHorL3lpaFFV?=
 =?utf-8?B?bEtoV2YzU3o2Q0gxUVh1a3FCQWFZSUZES0RWSk8zZW5CUk5ZTTBVMnltdXYz?=
 =?utf-8?B?bmt2SUlMcUNwUThYb3I3VG5hUjZWelVFdGhDcGU3Y1ErS0VaNVRFU2R2bzRQ?=
 =?utf-8?B?VmJKWFNhY3ZLL3lOZ1pPb1BseTl2NVdUNm8xTE9TVkdnbklDd2kzeVhxNzB2?=
 =?utf-8?B?UE54cEhYRTZzbzZUb0dVOWI3TlhnOVpFRHFselBmb2ZwalJ1clZ3L2Z4eHl6?=
 =?utf-8?B?MXlVeWRUcGp3b1MvUmZMNTdyMGJtNnJ5bFlHUVMxT0dBNDVRRnJneDhqS2Nz?=
 =?utf-8?B?eWsxNFlwUmVsbzIrS3pWOEdGZ1Y5dk9WcHMrODdJbk0wQS84TGRxdUdxcmYy?=
 =?utf-8?B?ell5VFJHbkRuM0pybGNyUmtPZU5HZlE4RDYyU1RGbkxmS1k3MU1qNEYyWlhk?=
 =?utf-8?B?dTMxY1FDMWxvWUtVell2bGgydm01S3hvUTE3M29IZHlsZ0JLYm1ENS9qbjgx?=
 =?utf-8?B?dWUyV2JMdTUzenZpQkhhY1pGSWdnZW0wQ05FUjdLMjhqWWFFQlA3b29ILzJ6?=
 =?utf-8?B?UGQrNVdiVktrZWtpdE9UNVNXSWdXaWgwK0xtSlFrR0FuNFptSnYxclAwZGxV?=
 =?utf-8?B?b1lReG5uNGVVLytuMFhPQk1xc3UwcEk0ZkhuOWIvWkR1NXBRRmJ4cFYzYyt4?=
 =?utf-8?B?MkJJbE04QklOajJFcEF4ZmNmelhnSTEyQm5VdzNBdnAxNVFkYnp3dTVaTzNF?=
 =?utf-8?B?T3Fra002dm83NjFRRDc3aWV0SG93a2QrRlZDNmxheGxDc3lJRjBSdFZUZ3Bi?=
 =?utf-8?B?a3p2cXV0c1BNYnhIU2JJU2tROFNUZHY1SEhhUjczQWt1NXc1dGtNYWVwK2Rt?=
 =?utf-8?B?b09DbHNJY2lIOFVlSEU0eHdBRWl1OGFQbkZHdm01bnAxR091VVFLZEhuSUUy?=
 =?utf-8?B?YUpZTHplVjk0ODh0Wml6eWNEYkIrQjBBMjlhMmpIMHVRY3Voa1Z3RG1KRnlY?=
 =?utf-8?B?N05Qa2o2bjlQTWwyZUhRTDczMGF3ZXIrdzBsdmNLM01HVUVYY08vbVlVQlRK?=
 =?utf-8?B?MHBwMTVGNnpuaThCR2lxTnhUR0VWZnNIVklFa2xIOXB3YW9qSnRlVnRDdVdk?=
 =?utf-8?B?M1g2NXdRdk5OMGRnTVd5S0U1K0I0WHIzZW5YOGhyaURydmRSNGtQbXBhVzBu?=
 =?utf-8?B?bFo2VUtlc0NuK0FiRTdycDVRWWtTTDRpZDdsbGNWZmdHeHY4T3BEOVF1bFV1?=
 =?utf-8?B?b2RPblM4bkpXZldnV1pyTHhGV3VVRnpDYWxobDIzaE5oU0JWLzhCdENiMko3?=
 =?utf-8?B?VDJCemVrVVN6RmxnZkdNU2tMOFhQVHhCeitIdS9sZXhpM2prMUx3WENkeGc5?=
 =?utf-8?B?cHZsUnE5ZXhpRm1rdVJmWVJhTVZYOVVrdHVMZDlFM3RNbGw0bDhoZHI0ZHJk?=
 =?utf-8?B?VkZlMW50ak0rVFZpUWhNVEp2Q0puaEljVVh3SlhlREMrNnNYeU9EY1ZzUzd5?=
 =?utf-8?B?OUk5bHpldW1MSDRIU2RNU05CdXczU1FjM3VCUWd5dlVlekkweUdUYUQ1Z1JL?=
 =?utf-8?B?WlB4aW01eHdZS0pmV2t5U3pBKzN1dVg5SjZ2Q2U2WkdqUUNySEoyRTNRSnJk?=
 =?utf-8?B?cGk5K3hTeHRrWHA0QjNhYnV3SVZPNXYrUDIzb293TVRDZE96dm55VkJRMzk4?=
 =?utf-8?B?RXBZVWJIMFp0aVlER0w0VDgxRVJST3IzV3hySU9OTHhrVzVwd2R2SlYyVkZt?=
 =?utf-8?B?OWVMN0xYWUM3dlRZenhRTkZ5MzJ3SCsyVk5pUy9RdTd6OHNPVzkySjZoWjls?=
 =?utf-8?B?YmVDaXZFa1ltbVJ3QTB0OGh3eDJCMmxGeGNrMmhvTW5UYVN1bmhyT213YlB6?=
 =?utf-8?B?cWpncUhGcUFLTkUxVlQwQmI2UVc2enk1NHdNRWZOVDZtWENkVFFybm5ZY1Bm?=
 =?utf-8?Q?r0iAG2UuW4xfOitKO/NXoLrrc8fBWjcX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ei9zSzN0dTRBamdCWlUxNmFlS3d5SHRNc0luTWdCeUdybCt3QnhCQW8rTExS?=
 =?utf-8?B?MnVzSkhRN3JQeVlZVkwvY2NET3paMFRvdHRRcUM3WW53YTE0Q1BINFNYcmdZ?=
 =?utf-8?B?cUVEcVdpWkx1Q21yM293QzNnUmdUSkowQnFmbHlFSnY1L3FoeEpMczNpZlhq?=
 =?utf-8?B?ajFZYUk2RGY1V0IxZTRmNEwvUXJRU0VvQUlsOXBMRGdvUTlIVC9DMDN5c2hG?=
 =?utf-8?B?MUxzL3VVQU1FbDV4OC84ekV1UmpGQ09zVFI5TzFnU2VobTdPRXJEZmxjYXJM?=
 =?utf-8?B?TkdCdy9YWnQwMHU5TGZnckYwTDFSVE1zTVFuQjkzZEpDMWoyTk5QMC81Smh3?=
 =?utf-8?B?RWVqR3dKODZVd2xIUFU2NVRjUWtGemgrbGU1OFpZQ2RWMm9aYlAxeEg0SUR4?=
 =?utf-8?B?Y2tUcWFEVUxvcndMRWo3aGovVXE0cVJPQU5XTmdncm10dHhZY0FIbU5rRzNn?=
 =?utf-8?B?ZFM0YmNrUC96WDNRM3NiM2toRzJaU0MyRWsrQ2lTWEI4Wi96NjQrT0V2VnBD?=
 =?utf-8?B?a2Fta0h6ckhiQnlCc29WY0Zndyt2SEoxeVdKMHphKzg5eFd4djJxYllGVUlZ?=
 =?utf-8?B?S2E1d1ZSRnQvYlp6WmxlZUprSWFYQU5OMStwcXdHVVUxdHIzbklYMHV1U1J6?=
 =?utf-8?B?Yy92dVFjbmZ1SUdaWWdsbmthUDNNVENiUzR0MjVaSVlEbzVhWkwrbm9hbFFE?=
 =?utf-8?B?eStNS2dtVzR6cmNXUEJZUVVqMkIwSDloTllmc084WEpsd3c1cGJoZWYzSnZM?=
 =?utf-8?B?ZXpSVXBMWEloV3NZb0ZabWJrYVU2TzFWN1dMY0JvcEMyR2R3WmhrYUhCYTRx?=
 =?utf-8?B?ellkMk1NNXQxNUlmc24vbzhNSEljSW16SWpWOW5Wek4rR0hNeVYwVFp3Z0RL?=
 =?utf-8?B?UERNTXMwdG1JS3U2clBGZWFOaElTMnVDQkthR2ZPVHBvWmdGMFJvZDhSTFdT?=
 =?utf-8?B?dG54c3MxblJxdnRzMXFGWjdKNDk5UktBeHgxZGZoZDNQdWZLVHRrMElCcmV3?=
 =?utf-8?B?VXJibjVkN1JNYm5Jc1hkcFZFQlNVdU9DMjZweEJ1dUM4NWp3bmMzYkFuUUo1?=
 =?utf-8?B?RzRFQWgreGx4M1R2UFRYS2pGR1VEc09CUFVSdE43SDErVnZqVFFtTGNOWW8y?=
 =?utf-8?B?QXJaOXBtdE9COTBiY3MrbWtrWnF0SS93enRDSXVnM0RjbzlzQ1VJc09FNGd1?=
 =?utf-8?B?eFNaczFTTklHdEhaRTJJOC94WDlzaEcxWGVrdm5KbnhTMzVLU3QwaE95eFZx?=
 =?utf-8?B?bEhqSjQ2czZxbWJVUWtjaDhVVkdadUZHQytQbW8rdU8zVmJhNTlJYXRSd2lF?=
 =?utf-8?B?bTdBWGtpS2hmT3BUS1gybU8zSk9YTzhiWnBYaEk1Sjk1WGpMOUU2RmJ5NjBz?=
 =?utf-8?B?Y0JvS2R2U3dlVUk3UnAwVGZMc3Zxb3pVdWlxK25RaWlTWGpHdWMxOUZMZUVa?=
 =?utf-8?B?UGQrOFZxVTBpcHhEejFlaGlBc2U3dmtkZHkxRmRvYlNZc1I3MDFkdkQ3enBM?=
 =?utf-8?B?YVlUYzBwZEpTL1J0M2U2VHNURnl0eFVxcHZBRFIvKzMycFRpeUQ0QXAyeTJi?=
 =?utf-8?B?TmVFZzhzaE81eHZ0UThQODdLQmg1TEo5VUo5SHhLUjB5MTU1ZHVLYnRPK21k?=
 =?utf-8?B?QU1EQ0ZNcnpYVlZ5MnNocldWaWdXdlROVkN2RlN4RXpqSGF5MVJRZmdVTHZh?=
 =?utf-8?B?TlN0NFlPa2tlRVFUZ0U0Zk8xNmcwVVRDQ2tLakowNXdBU3hlUk5Hbk1hc09a?=
 =?utf-8?B?Z21sQ05VOHNUMHFPMmFoUUVXUUZhOVVMWnIxWUwza3A0OHNHKzRVcStobkdO?=
 =?utf-8?B?YlVyeUFMYVdwb2FSRzJjUUJDRjFzNCthT29nL1BEOVZFMXJiQVFtQVRWb1Ns?=
 =?utf-8?B?emtsODFnTTNLSnBLMjViQSszYVQwYmM0WlBtUys5T2pZOHRWSElwSVR2bjNC?=
 =?utf-8?B?OUFkZ1VNMTVtbmZmenhSTWFvN3grVmo0RjlGWnJMbFduZW9QK1d4M2JjTjRD?=
 =?utf-8?B?SDhPUlJaNndGWmhrT2EyM2Y1RkhDVEdjK28vNkhxYjB3YWwrWjEycytjTDNB?=
 =?utf-8?B?NlBQbCswUWhHKzlVazE3TElqL1ZPcUpEbmpybldiZmFTcndCNDIva3FNOU44?=
 =?utf-8?Q?oghfapcwu2nBmtJQttKswB3I/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c36e08-bba3-4048-5db5-08de3943dc0a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 06:01:15.2444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gXVDpmLrfeCbKsBLIXAN/EIrtaaEgQWR7WMqEQXHJKsEJK52QiIzc7wLAl5p7XhBpRxFV5e9PmSjeJ476fn2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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



On 12/11/2025 23:28, Lizhi Hou wrote:
> The AMD PMF driver provides an interface to obtain realtime power
> estimates for the NPU. Expose this information to userspace through a
> new DRM_IOCTL_AMDXDNA_GET_INFO parameter, allowing applications to query
> the current NPU power level.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam

> ---
>  drivers/accel/amdxdna/aie2_pci.c        | 29 +++++++++++++++++++++++++
>  drivers/accel/amdxdna/aie2_pci.h        | 18 +++++++++++++++
>  drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 ++-
>  3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 81a8e4137bfd..4a2c7addcd79 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  #include <drm/gpu_scheduler.h>
> +#include <linux/amd-pmf-io.h>
>  #include <linux/cleanup.h>
>  #include <linux/errno.h>
>  #include <linux/firmware.h>
> @@ -777,6 +778,31 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>  	return ret;
>  }
>  
> +static int aie2_get_sensors(struct amdxdna_client *client,
> +			    struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_query_sensor sensor = { 0 };
> +	int ret;
> +
> +	if (args->buffer_size < sizeof(sensor))
> +		return -EINVAL;
> +
> +	ret = AIE2_GET_PMF_NPU_DATA(npu_power, sensor.input);
> +	if (ret)
> +		return ret;
> +	sensor.type = AMDXDNA_SENSOR_TYPE_POWER;
> +	sensor.unitm = -3;
> +	snprintf(sensor.label, sizeof(sensor.label), "Total Power");
> +	snprintf(sensor.units, sizeof(sensor.units), "mW");
> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), &sensor, sizeof(sensor)))
> +		return -EFAULT;
> +
> +	args->buffer_size = sizeof(sensor);
> +
> +	return 0;
> +}
> +
>  static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>  {
>  	struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
> @@ -980,6 +1006,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>  	case DRM_AMDXDNA_QUERY_CLOCK_METADATA:
>  		ret = aie2_get_clock_metadata(client, args);
>  		break;
> +	case DRM_AMDXDNA_QUERY_SENSORS:
> +		ret = aie2_get_sensors(client, args);
> +		break;
>  	case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
>  		ret = aie2_get_hwctx_status(client, args);
>  		break;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index c6b5cf4ae5c4..edf6f2e00dea 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -46,6 +46,24 @@
>  	pci_resource_len(NDEV2PDEV(_ndev), (_ndev)->xdna->dev_info->mbox_bar); \
>  })
>  
> +#if IS_ENABLED(CONFIG_AMD_PMF)
> +#define AIE2_GET_PMF_NPU_DATA(field, val) \
> +({ \
> +	struct amd_pmf_npu_metrics _npu_metrics; \
> +	int _ret; \
> +	_ret = amd_pmf_get_npu_data(&_npu_metrics); \
> +	val = _ret ? U32_MAX : _npu_metrics.field; \
> +	(_ret); \
> +})
> +#else
> +#define SENSOR_DEFAULT_npu_power	U32_MAX
> +#define AIE2_GET_PMF_NPU_DATA(field, val) \
> +({ \
> +	val = SENSOR_DEFAULT_##field; \
> +	(-EOPNOTSUPP); \
> +})
> +#endif
> +
>  enum aie2_smu_reg_idx {
>  	SMU_CMD_REG = 0,
>  	SMU_ARG_REG,
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 1973ab67721b..643ebd387074 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -32,9 +32,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>   * 0.4: Support getting resource information
>   * 0.5: Support getting telemetry data
>   * 0.6: Support preemption
> + * 0.7: Support getting power data
>   */
>  #define AMDXDNA_DRIVER_MAJOR		0
> -#define AMDXDNA_DRIVER_MINOR		6
> +#define AMDXDNA_DRIVER_MINOR		7
>  
>  /*
>   * Bind the driver base on (vendor_id, device_id) pair and later use the

