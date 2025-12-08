Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F30CAC6C5
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C88910E3AE;
	Mon,  8 Dec 2025 07:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cW/7IdDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012034.outbound.protection.outlook.com
 [40.107.200.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E68F10E3AE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 07:50:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGlcqrSiMCN42Z0dXFDllYGqvreMpuWut1lS/nSw8vRL6xg7ohykVuQlUwXuWkKX3A0u9+pHkNMZicVPNbitBKPguULWQtvl2E65RPTdbcz/5xGyU4Jn97i2mZ+H8k+VOwM08fsflmuJmd6Uc5rcv9aM07C8Q8Uz8lgtbeZDzRXIjSt46azrUmJt1JERfsDXt7CnKkwrSj5dDIw91xHayfns8yblPvijeVcmwRQK0NRJ/yPWvhhSvNafvD/MG4GAMNrXqXziHfgS5fwhkLvQcj8OOLOnvJPT5nKgSd4ZTxr0UvsRrEtpzMxCXH7My/whpqSgdWIWEa7H+3TiViA9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URMnyAH8WgwFZEPbxW0ppvJSNMr7JTme4W/vlI4f6lg=;
 b=r0fpkcUr+ImvWxk30iZN8lDJGnzE0MtXDhvAeV1o4AyuEAYojfLOzyDhax/LC5CznwKYWy4028aBhEu2/Aq3Nwh0lxA2C0MPjayMAnCt5NvE3qdZQTPxRIZss9lsXoR15Bn71+ZPhx1/CrTh53SNna6gdvdV4bd35p1Kr7qCsxsoIDO+uJJbH4/YJiC+RZpzjxsbCAqkNo4BWYTuMP1QJWHPZ8CbuzFgtDAK927wTkUM2T6spET2PZ2mq7CYroXWNTCwGroAu75l/4C6b9vrCTWNZLYkVIjwbQgSX7fpeHbVWNmNEWvKx+zVqCdn5VvYM8NjVd9ziSiDzABoRpp4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URMnyAH8WgwFZEPbxW0ppvJSNMr7JTme4W/vlI4f6lg=;
 b=cW/7IdDcwlhd/EnhGOfao7L/op/yAHlitpZfNiimQ2jH5CSXBoCpghyuURQ30i8m3g57zHb7Ek3oGuyeBVbJFE6WRO+L374uo1rXFxxMi0WzafiZcn14cmqyVIttMsG/n0l39p0qzCR8d5tv1peip3bVZtZ/QpHo9rwSjJoceQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by MN6PR12MB8542.namprd12.prod.outlook.com (2603:10b6:208:477::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:50:15 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:50:15 +0000
Message-ID: <3b2a9f46-abe5-49cc-bde1-18f8dae525db@amd.com>
Date: Mon, 8 Dec 2025 15:50:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] virtio-gpu: Add user pointer and HSAKMT support
 enhancements
To: alex.bennee@linaro.org, kraxel@redhat.com, dmitry.osipenko@collabora.com, 
 Ray.Huang@amd.com
Cc: gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251112075414.3719917-1-honghuan@amd.com>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <20251112075414.3719917-1-honghuan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|MN6PR12MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e05fd78-8ad9-4a39-8cad-08de362e6ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnhHVjd0ZnlHbWoxWUxhRlQ2SE04UWJIR1NNRjJXTThGRzJvdGdsYXJYOXBR?=
 =?utf-8?B?WEVZOUxuak9aT2t3aG1tRjhaZVVlOUVZSmdncUVEcW1mekdDenlYZERNMnY2?=
 =?utf-8?B?bnIwWHM1RFNaOUNwYjlVSGZtZEJqeVh2TjBuUG5XM3VNK0hpSkZuTkNWd3V6?=
 =?utf-8?B?M2g3NVdnbEtreWZYM3pybzdxb0JDbnIyMHBGVDhpaE5jOUFRZ1dGMVQ3dXNm?=
 =?utf-8?B?S0RYZ3BueE80Mm8vQW5jMWFMZm51b0Yvc0VhaWRpdER6WC9SUGVOWTlJZW41?=
 =?utf-8?B?OVNsK3pLYWRSQXlIdEtyZm9xYWs3em16Z21ZSnpHenhxczQxTkFhcUhldEhp?=
 =?utf-8?B?NXFEMEZrUWlickxWTGRaTzMxQ0lYcXpHWW4vcmlQSFZCbFZYK0xQMnZJa1p0?=
 =?utf-8?B?S0k0RjR0d01sTm84RmxzdXU1Tzk5S1IrNmVxa3l2bzk0clFDL3QvYWM0Qmc2?=
 =?utf-8?B?QzJEQVVGdW43SVdJY05WVzBiQnRDeXorb2VDUThBREpFVTQzWjJxVTVjVlBp?=
 =?utf-8?B?NDJqeDY2L1pJZGkvK3UxNkZoL1FCV3plVjl2M1lUNHQ4S2FrbWNVOGswczVP?=
 =?utf-8?B?ZkRMMXNmY3hjQzRna3d2RnhTMC8rbWxRYjNjc2xVZnBmS29jeXRoOGM1Zkhj?=
 =?utf-8?B?SEQxUlNKQy9BSndEZW9va05jUEJKM2VjbUwvdEh3K3VpR3R6NXowNDlmck96?=
 =?utf-8?B?dWg2ZDB4aUNxS3FYSnhpMDh3TVJvMjZ6c2Z1b1Z0cngwNlNPQmplUmZtM1gv?=
 =?utf-8?B?dTZLN2pGdHI3S055TFh0UDIvZ1ZGTGxjVmo2eXMydXlLNGF2Tnc0dWhXYXdG?=
 =?utf-8?B?eWxvb3Y0T2ozNmJ4UXFmVFMzUktsVnU5dm5qVXVaR3NqSndXSGorQWlaeGVj?=
 =?utf-8?B?L3Q5a3VhREVoNEp3d1VsRHRhcWVxb0JDQXpMdXdna2RMMFRMWlYwY0FkZFpO?=
 =?utf-8?B?cFp3bWNCU2N5YVh3elVhQTI1SzMrT0tzTmk3MnYyVU5aNXhXazJpZGxOcGt6?=
 =?utf-8?B?azdYQUlhcXBzMWJ4VVhGenV2MDRiQXorMnZyMjNPaDRteFFrL0doajAyUlhn?=
 =?utf-8?B?YWtVS2ExT2tPR2RTdlFWclJqbjl0TGV0SXpTSzhCcGZaYmhraGJCYkdyMmUw?=
 =?utf-8?B?K0FlZ3Fqa3BmM3c0YmI2Y0t3SXM4Znl0eEFmK05pWGVuZkl5QUIvWFZLeis5?=
 =?utf-8?B?MUUvamZCY2J5eXV1UG5rOWF5UmZMUUowekZkVmVJZ3BXLzNDbHB5cE1nOTF0?=
 =?utf-8?B?b3NQUTdlTG1OaVJWbElLeTd3Y3lRTmpRRGlGeVVNLzdHY0M3c3h4SFpkSXkx?=
 =?utf-8?B?VENQdGRpdlVIVC8wcmRUZ3N3Nk5OeFoxbzRycTFCeEZQaG9sSEZmTkRrQ01R?=
 =?utf-8?B?bENrdGdMaEVMdjNSYVM2UmFEU0NuNGl1Wjd2VXQrb0l6U3ppUVQrYm1MQm1J?=
 =?utf-8?B?Wjlsbk1vckozT1JSdUU4QVo4OXB6bFVaVVlzMUVqcWY1SmJmYWNsZ1h1Z3ZL?=
 =?utf-8?B?Z3JrampLNG9IUmd5TG9hRlF6NG5iLzBIRnc2MXBXdGZpd3dtKzJDdFhSb2Z6?=
 =?utf-8?B?eWRhUXNva296a2V2dGxZUGtwZDN1eVl3RFNJa1dnSzg0aVNLZHcxYVlnSGxq?=
 =?utf-8?B?WWxBZjB3d2xtVElrMUI0VHMxeDZhSDhGZ3hTRWd6a2hxcmdsTFBZR0txb3c3?=
 =?utf-8?B?N3hPYzMwVFlIZXBQL0RkRWRwZmY5Q1J5aVU5WnhPeEYxSjFzSjMzbUtrb3VH?=
 =?utf-8?B?WVJOSTZJbVU5Z2hwcEVQNVFmTHB6VnoybzJnNjZhTFBhOEhtY2pLVmxVNklq?=
 =?utf-8?B?SzUwMWlsSU9xTHEvZDdteU4rYk5iL1h5Mncwd29wMSs5RFVmUDA3aUlFM2w3?=
 =?utf-8?B?Y2Q0d2EzVDNOZ1BQL2JZdEJnMTFsOEVVQ2xwSTVIR2JTV3I5QTd1dnZ0RS9h?=
 =?utf-8?B?V2lTU1FZdHVQTUxON3B2T3hpSGtCbnM1MUo4MCtjaUhYZFloeFBxanBPcWdQ?=
 =?utf-8?B?WmlnUmxtWElRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk5NNGhCM3diM2hCNnYvdlV5blYrbTQ5WjJIYUx6Mjc3Y2dlUlQydWc0Mk9K?=
 =?utf-8?B?RlJtQmRiNDgzcTN5YTA3YXM4M3dET0lzcE95c2hWYnJ4ZmdDSGVldFEyTXBE?=
 =?utf-8?B?cFhCOWlMU0xIektsSzE5YVBXcEJ4UWZQR2pSRTBIdEJRSDlJa2pXbGJwS1dp?=
 =?utf-8?B?bWNDMlhPeHlNc282SS81QmNMOVdKMjdra3FLSWkybG9SV2l2N2NvQzVSaUdt?=
 =?utf-8?B?LzZrdWNoRloxeTk0dVpabElUMXh5cXhKTjM1Ym1xK2RvU2htZVJyaHJXR1VH?=
 =?utf-8?B?K2dTYXoxRzdaVmNBNExkNXdIZXVTUmh5YTYyNHBncUdHemR0RC9FemdDV2w5?=
 =?utf-8?B?QlN5WmRyMUdNRGVFalQxamhSU09QNVRibDZRSC90UnF3NUJJLzBna2REMjho?=
 =?utf-8?B?UkR6SjBXLzRDTkxGTUxsMGVjS3VheHpzQmJDWHJ3bTJJOW5RZ2dyczI1RGVk?=
 =?utf-8?B?d2tocUpQZFQxQlF4VWF2TkI2dXhJN1doVjVIbjdsNURDSGt4eHYrVTdMS1FH?=
 =?utf-8?B?ZDNVcit5ZkswVVg5R09EYVF6bjlZYzJJN2tId2FwOERiMzZJektuRGhJYjBm?=
 =?utf-8?B?MFgyZjcrL2VOaHpLOGwzMnFkT3Y3aWtyc2dBNktRQVFMRlpDK1VDTDhUU3lh?=
 =?utf-8?B?bVkyU0JLMDFsT0poVFg2SEtkUzI4R2ZRbysxU3QvUEhGb3Yvc2xCZGlRd0lV?=
 =?utf-8?B?MWovd0ZQZW9uUGxBTVpMR0FaWW5OQ01QRmt0bHRhN0NLZm5ZUWZ5VVFmWDl0?=
 =?utf-8?B?Mnk0M3ZSRFNqRHNvVGtMVUx1WGVTdGNSYjBGdERaTXJUVUV1c3NMUjVIRkx0?=
 =?utf-8?B?bEhja3FneU11WkRPR09pN3cwUGJ3Sk5id1JRZFp5czl2OGhVMUd4SWlDSVBC?=
 =?utf-8?B?dXdndyt1OThVR21LN3RZay9FM0tpaktzWnRYNU0zb1JwZ3ZRaXovSEhZSjFu?=
 =?utf-8?B?Y0dzM2FGbkJyOEZQMENwRXJxcmJTUlAvMUIxOVFuSG40YWt4MS9kY3ZlSklO?=
 =?utf-8?B?aDBuRnh3YXRDZW1rR2w2MW1RODd4WTNVUmdZSXNaYzVOd1VIQ21qQUZqbEZC?=
 =?utf-8?B?ZGgvRTlQanV1a09BVG9ibkF5cXd6VEE5d3VZdGxFRFE0T2lBcDJIVVVrMFdD?=
 =?utf-8?B?ZTk4ZlZLTkk1bmVia0I2anVPZWFrWXFqK0s1N2dkeVVsOTUvYVMrYjUzMXVm?=
 =?utf-8?B?Vlh1MWJhWGZZVnNxNGEwbXZmTDRTVVhPNGh3VnJpZ0VtNkg5aWJDMkUySWtz?=
 =?utf-8?B?S3hxYkYvY0x4YTUrVEJQbUZNVlB6YWFMclNKRWd5aU9ESTRQcEZqSitKZjVH?=
 =?utf-8?B?UThkdjVqRi9pNzdTd1RWK3NmbnczbUVXTXU4VlBhYUQ5WXB5L0s5N1VmQ0dY?=
 =?utf-8?B?QnJTRUNJUjhPejlQWDRxd3M0REpIUFVDdyszZTdUNys4dnFWTWdtQkx3Q1lY?=
 =?utf-8?B?WWlvL2I2alF0aXdpVTFQbEZ5MnNjRjAvSTNlN2hsSExIWXlBa29TdlJQUUlJ?=
 =?utf-8?B?cUpwSXhPcUMwbWtrR2toU1dnaDlTQk5BVmVzak55OGJXNWxlM2tzNkVBTkhM?=
 =?utf-8?B?ZHdkSmNyL3FEU2EveklreUIwOHdQS1l3VndwRXpoWFNxNDRpVEtWL1h2enZG?=
 =?utf-8?B?TlNrMS8rdjZKRWM1MnljNVptcWc4ZzROQktBUGd6eTc2Z0FzK085c250b213?=
 =?utf-8?B?a2JnNzJEUEFuakd3enJURjJFczR1V1U5M2lxcnRRazQ4TUdNNG1KSkIzMzJO?=
 =?utf-8?B?U2xocUhZWkFGVDRjSkMydVY2RDhkWkdUb1lZZXZkYktTcXdzaTAvcTN5V3d0?=
 =?utf-8?B?WHBuOUVoZzhtTWk4WUVUMCtpcVJGU3JSbGdDa0h4b0NEcTJKMTgzRjJHRmpU?=
 =?utf-8?B?Y2I5T1lHMUxxakx6TjArVWJPdnkvUXRRdThKR0sxMnJaZE8xcUtBY2RDOUpD?=
 =?utf-8?B?a0lyOTQ3VVZEYnQ1YlJjRFNsWHRYVXNaL3lYSWFYRlFJTTlPNUVHL044WG4v?=
 =?utf-8?B?V2RWSDQwdmtIRmpYVGViWlBzM2FGenVQc29pOUhxYXZHWEtmd1hzM1MrTno3?=
 =?utf-8?B?OFVaeExmZHhBYVU3TEo1Ym5nTCt6VHNSa3V5Si8zV2pBUi8xak9PS1NWZ2pU?=
 =?utf-8?Q?ZE8EVfS8tH5wUb5SJFqnXj4OO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e05fd78-8ad9-4a39-8cad-08de362e6ca7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:50:15.5740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CegRu4tgDJ+JT3juQTRhhz/1zcSQdajbqaLtVgM3Lg+DoHIRnrfoUhh9sa4git3JUSR+BQrTeM6rzG8luyP2Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8542
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



Dear all,

I would like to share some progress that has been made in exploring GPU 
compute capabilities within virtio-gpu. Work has been undertaken to 
extend virtio-gpu beyond traditional graphics workloads to support 
compute applications, and I wanted to update the community on the 
current status and gather feedback on this effort.

Virtio-gpu has the potential to become a unified solution for both 
graphics and compute, providing efficient GPU access in virtualized 
environments. This work aims to enable modern GPU compute stacks like 
ROCm, allowing AI/ML workloads and scientific computing to run in 
virtual machines with minimal performance penalty.

The current implementation is functional with essential features enabled 
and operational. The implementation has been validated with production 
AI workloads. For ComfyUI image/video generation on AMD W7900, the 
observed overhead ranges from 0.4% to 8.3% across different tasks. For 
LLM inference using deepseek-r1-distill-qwen-1.5b, the implementation 
achieved approximately 86% efficiency with 14% virtualization overhead. 
For OpenCL, most CTS tests have also been validated, and on certain 
hardware platforms, full CTS can be fully validated.

As someone approaching this work as a learner, I would greatly 
appreciate feedback from the community. The current functionality and 
performance are not bad, there are certainly areas that could benefit 
from improvement. I am fully committed to addressing any feedback 
received and working with the community to refine the implementation to 
meet the expected standards.

Full documentation and testing resources are available at: 
https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1475

Thank you for your time and consideration. I welcome all feedback, 
questions, and suggestions.

Best regards,
Honglei Huang

On 2025/11/12 15:54, Honglei Huang wrote:
> This patch series introduces three key enhancements to virtio-gpu to improve
> memory management and GPU virtualization capabilities:
> 
> 1. VIRTIO_GPU_BLOB_FLAG_USE_USERPTR support: Enables user pointer mapping
>     for blob resources, allowing guest applications to use user-allocated
>     memory for GPU resources more efficiently.
> 
> 2. Configurable HSAKMT capset support: Provides better control over HSAKMT
>     functionality with a new device property "hsakmt=on" to avoid exposing
>     unsupported capabilities to guests.
> 
> 3. VIRTIO_GPU_F_RESOURCE_USERPTR feature support: Introduces a new virtio-gpu
>     feature flag with configurable "userptr=on" device property to enable
>     user pointer resources for enhanced memory management.
> 
> These patches work together to provide more flexible and efficient memory
> management between guest and host in GPU virtualization scenarios. The
> changes are backward compatible and controlled by new device properties.
> 
> Usage examples:
>    -device virtio-gpu-gl,hsakmt=on,userptr=on
> 
> The series has been tested with GPU workloads requiring advanced memory
> management capabilities.
> 
> Honglei Huang (3):
>    virtio-gpu: Add support for VIRTIO_GPU_BLOB_FLAG_USE_USERPTR flag
>    virtio-gpu: add configurable HSAKMT capset support
>    virtio-gpu: Add VIRTIO_GPU_F_RESOURCE_USERPTR feature support
> 
>   hw/display/virtio-gpu-base.c                |  3 +++
>   hw/display/virtio-gpu-gl.c                  |  2 ++
>   hw/display/virtio-gpu-virgl.c               | 30 ++++++++++++++++-----
>   hw/display/virtio-gpu.c                     |  9 ++-----
>   include/hw/virtio/virtio-gpu.h              |  6 +++++
>   include/standard-headers/linux/virtio_gpu.h |  4 +++
>   6 files changed, 41 insertions(+), 13 deletions(-)
> 

