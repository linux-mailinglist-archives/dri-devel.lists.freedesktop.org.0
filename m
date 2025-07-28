Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0338DB144B0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 01:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C22A10E5A1;
	Mon, 28 Jul 2025 23:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cT8rtPR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854D410E05F;
 Mon, 28 Jul 2025 23:29:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdpwUuDlg1MBaWMF8Q98pY86kU96Lw3dSo8cYivAr6xA3hqmz7P+VIITLeDQ720k0MVDafS/jKVJMLyfeQtjQjTOzhGnlxOZWruc+oReyQI3WaIboybGXoaqOo0HRktuG6uj2AB07vOyePN5kftRTUvX3sc7c7dZYWHYgXELIAKjvgXUi4OTdPB5VJ+/Pjhyg7tuXi/W2s+S6J9mnFyubmQd1q+R6EwETRjjtvu2787iEZzKKsxEJ3yJXZqY1XIBwxXUDyW8ft1m7Prdn4NNMraO/Ni6GqCugdWagTRN9yFFXykyUM8xa+bQ1qPIzei+nTSeume6v6SmXYPzTo3yxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lcoWB0v6NdM2g18WvkEHr8hdZ88TWxPZc4c1giSzYU=;
 b=wdLa32S6+QDZ4d0KpVb512wlCZXWOAPMnIQtkgjgOZPmgAgLK3bopMdG6BFMjW8LqiGYGvp9GIGkwLqw+6Bdbt3x8NNZPs5LNa9u3bBd7I4qDxzUOjWTDBHgwj2v1RgPY/5kzXj531mIbrEVshIBR5cZ8qvqLOGYl0BzoUwqupZNLbq1GkFLwXydA9eZ+fkQ/ohpe04KO26UC+K8CnMc1cauDkdBxypZf29RdkqTp60cznSYnmUfuTqw2ehjqNMhFX4HnLaR3LQFKIEZ54XP25qS5ZrKZEl2T0/rx701/ikRXMyScbnIyT5+pj6e8jLAV4QIudFIoyOWirUW+SOp9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lcoWB0v6NdM2g18WvkEHr8hdZ88TWxPZc4c1giSzYU=;
 b=cT8rtPR8ZkppHsjHH+9sI0EGpZ1T3jqMfQq4ZF6P49qQFTm+xIwELG661JagKyjFocfXFrH7RXhvcJngUb3XBq8LH5/88y2KqE8Qz16Ik9XMYBUY8lSqraJzfU3GI1JVV7fTeJhAFG1WYcgULPaBCqrcXmonEwpgXkXMz/qrav4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 23:29:08 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 23:29:08 +0000
Message-ID: <019ca526-5bdf-4c88-a994-a6babb9963c7@amd.com>
Date: Mon, 28 Jul 2025 17:29:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] drm/amd/display: more drm_edid to AMD display
 driver
To: Melissa Wen <mwen@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250726003816.435227-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250726003816.435227-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::25) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN2PR12MB4096:EE_
X-MS-Office365-Filtering-Correlation-Id: d4da5d36-6930-4237-2d06-08ddce2e8cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODBBVjQwYzZtVlRYZ2FJNStNVTl5UkdpNG5ZUEFGR3dJWXdFbjZ1MDc5QTlR?=
 =?utf-8?B?c3VML1Vmbi9JR3AydnFXSzBFOGVQSnZpYndQU29HNnZOYzVJVzB4ZXc0U0M2?=
 =?utf-8?B?L1VXUU4rQmV5WU5YQzdsdHJpK1RyVjZYYmpWbHZ2VmhHcWxXYW9WTHpEWlA1?=
 =?utf-8?B?ME0zb3lVZWpBcks2dDBzTmhhKzk5d080QUpyeEV3YU9RdUg3M25vc0NnSEJx?=
 =?utf-8?B?NTE2UDlKSkxTckRRenN5SHFZT3BYdzgrSXJUcWlzRWtOaXZ1cG94NGF4YXZU?=
 =?utf-8?B?WjY5VVU0aE5yN1U3cTR5WUNaM3ZhRG9QZWRxTFhYcHB3RVladUtvZ0lzOERO?=
 =?utf-8?B?MG94WXVJV3BpWmsrUklCM29qU3NmRE10ZFFvdElsZjZjR2VsdU4xV2xqa2pP?=
 =?utf-8?B?OS9jOHArRGhiZ00zSDgwT3RsVEx5NnJQWi9adDVkWnV1ZmdWUFJrdDRScVhp?=
 =?utf-8?B?UFdNUml0VVV3QTdDOUx4VmRUandFS3E2ZUJmcUJrVG1lVldrN2RZTUowYVk3?=
 =?utf-8?B?UXN6aGJpSXVGeHZPVW16SDFRTW1zbXRrNjVYTTNoTFVzbStyd2d4ZW9VK3pQ?=
 =?utf-8?B?QVV4Q1lqQWdCb0laTWdwYys0c2o0dW5kQXFNRkxnTHAyNTB5b25SY0N6ZHF3?=
 =?utf-8?B?MXl3aFJNb1o2VTNrL3JjTmJGV25CWmNPVlFCayt2SndvNlJJWENQUGI2MUxF?=
 =?utf-8?B?LzNsRW81aHcwN1BIWVQ3NnBqMWMxdGkzandvNzJsNW9hdUZOQ3BZZ0NFNUF4?=
 =?utf-8?B?aEZtd0lsdFpmcytsenJ4cXRRVjBMUXFMbE9nWXRnWnZUYis5OHRMYk1LZjVM?=
 =?utf-8?B?OVd1T21nM3JGWVAyOVhEYjNjVFg5MXBNMHlGQWJOVXYzSUFvaXJ1QU53ZnJH?=
 =?utf-8?B?QkxzeVhxeU9pYWpSdTZlN05NZEp5WGlEREUwS3c0YlEreDVtS0lKSEVxV1Y0?=
 =?utf-8?B?WExFWUo0b3RmMWM5dmdhdmlicmcrYlBhZXArTHpPQ3hWWUxIWXZoOXpNaWRR?=
 =?utf-8?B?YWVmUlFBTG5jcUxOcnQ2VlM0cWQzcWNhT0VVWHRiMm9HOXlmMDlENUZEOTRT?=
 =?utf-8?B?a2VoZWRuaVI5d1RlUUZqeEU4T0Z3RkVvV0hKckk4bGthcEdUckkzRi9zSVFN?=
 =?utf-8?B?OFltSWZ3VmFsN0NIT1oxS0tkeHIvMTFRL01VNTVEL29XNTdaQXlGTTNUTEIx?=
 =?utf-8?B?NHdDK3VNcTlnalM1Q1JUK1BoMmhKc0liU3F0VmxPbTVTeUI3QnJUNmRsQ2JE?=
 =?utf-8?B?dnM2MmNldWJGckl6YUFBK3ZZQ0Jzb1VzQldhVXphRm1YdkU1WERld0N0UWoz?=
 =?utf-8?B?VnlLMjNYWjRKNjFBQU5xMGtDOFV5dkJsL1dENzdyYXpML0hCY2NlWHJKL1Ar?=
 =?utf-8?B?UDBUV082WlIrM2JyMmhOejg2UFVBbGUzdDNacE9ZaFN6YThkd1NPaW45Z3hu?=
 =?utf-8?B?a1MydmFJeXF6SW1hdkNTMmE1ME9nZ2p6YTk2T2RLNHFKQU9pZXhxaitTTjNu?=
 =?utf-8?B?SVRNdldPMGlselhhM0RRUERXVmVLU0dZekhERVFmbnRNMGt5ZWNjeGF6U3Jy?=
 =?utf-8?B?bVZGQVdwSnpxOGVoM3BsRHluSm91NXRmNU9kVHQrYmNGUFo4bDdJVDExK0Zx?=
 =?utf-8?B?NU55ei9IME80RElEVE5XQWdDYnV3eHhzZ3JIMGJKaHdSei9rVkpSdUtqRzlD?=
 =?utf-8?B?SFQzRVFRYVozd0d4UzVjbEtOcVk3RVU5aWJUWTEzMzRlSEZQMDJQZEVBUmI1?=
 =?utf-8?B?cWt5VDhjNDVjVFdFVkdMWEpOdm4veTZiSlUyOWVUUGU2ZGpqYlIxSmgvSTRB?=
 =?utf-8?B?a3A4djNBMlhkcG5mdFJ5aTdJaEx4a0RpMncwUDNiTXdKUHB4NCtHNEtRUGh5?=
 =?utf-8?B?djhzUVJWSXZtQ0psWkswTGdqSkgwM252b0Q1L2VjcWowd3RtclIxYU0wYkh4?=
 =?utf-8?B?K0p4SzFoSEIzU1NoNURieUEyV1dZWHdtdkpidkp6SjFxczVMbGZJb2Y2Y3RJ?=
 =?utf-8?B?cVpaOXJsdDZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3JMU2tXRXNSdk1nanM5cDJrcXFJM2JieUpwclZjVUVtOVh2MUY0VGtCYW8x?=
 =?utf-8?B?VVVGbzQwc215NXoyeTRzU3R6UG05bnltME5wTjk2NGg4RmEydDRQY1ptVUNE?=
 =?utf-8?B?S1k2WlVVbmNQRzk3aXE1ekFjaCtSMkN2TnNPWTlxMkVEdDNzbUkyU004MDIz?=
 =?utf-8?B?QzRjM0JITndmbWlRTitJRlpoWE55ODhmQmovSVZ6d0FTN3p6cm5NMmo1OVRv?=
 =?utf-8?B?OUkzSjRCY0Eyb0RDdzNLMGQrRDUrdjJPR092THlVK3VZK0hRMHp4QzEvb2Fy?=
 =?utf-8?B?RjNTbWVvdmkvT3dMKzJjdzJaQ2JLVDFORm1ZUllvbU9CSk5DRGJxbnFLSzNk?=
 =?utf-8?B?Q0tpTFNZQzlUaXRyNTV6eHNJVVJwbHpCdzk5emN4aTJUVW4yNnE4d0Z4MDZC?=
 =?utf-8?B?MXlWK1VGWEpMblpmZFF3ZmpKS0w1VUdxYTg4aUx4cWFzSk4yWUVaSmJ5SXR2?=
 =?utf-8?B?Y1VKcHVvQm41MlF2REhabFlLdGVsZ3d5Sjd5UUR1ZjdrVjF4Nm5JSUtEdDJz?=
 =?utf-8?B?OHR2QVloTjE2RXBZWm9RbjM0SHJLK2tkTTlCVkVkTHdRNkZzb3E0bEtrcE5Y?=
 =?utf-8?B?WGVvNHBvMWFiSU5oNEZGZ3cxclhXeGxIT25NaVNRMms2QjdlVEViM0dGWld1?=
 =?utf-8?B?RkpDdGNlRm1wUFo2bUhtOUloTUY5RUpQV2NjRCtJNDUvdk5qWlVVR1NkSzRS?=
 =?utf-8?B?Q2NGVk9ZbzFlYUd6aDRKMjkralJLcllsYmU0UGFwVHBNM3ovZFlRUDUvNElj?=
 =?utf-8?B?WTkxNE94SGlMS1lJM1NtVVFsTG13R0pHTm9ZWGlXZDIvL0ZVUnh3ems3N0VP?=
 =?utf-8?B?THpsbjBZbjJYdTBMSTZTVzNGWXRFZW1sQ1pOVTBPcUQ4Z2pOTHVUZnlweHV3?=
 =?utf-8?B?UkY3UXU4aU9taWwzSUJiZHdQV2Q4SmdOdkY5WFpPQllvbWd1Zk9abzViUThz?=
 =?utf-8?B?MGlmOU8xNmNWRkx5cjU1RExMVzZNRGRXeVNzQjIxYnZMZnVNd0E4OC9TMUZ1?=
 =?utf-8?B?bkRXL1hBMWI4Rm9LZE5DeklycFhrZHNDU01Za2owSERyVGZxQjFMWkVDbnVk?=
 =?utf-8?B?dUp6SlNFTHZLNXNNaU0xNlgySU1mWVpEUEQwWGRSQlErN0wrSlRJOGNaYmpJ?=
 =?utf-8?B?bVU4OWRHdVFFY3R5RU94TVp4V0h6K3lYb2RtSlFzdUZ6UlhPSWZzTjdXalNK?=
 =?utf-8?B?T2IwY1hkSFdXSG1PTytUT0F6dDdnOTJSaHRLSG5vdTFmaGN1T2pPNEYvSnQ5?=
 =?utf-8?B?R0hFQXhXNS9DSnFiTVkzZ2FCL0JGaFgyUW50c29USHVNR2pVNDQ1UVI3RjJP?=
 =?utf-8?B?Uko3R1hhaWxhbko2ejJSMlByUlZqRXRrWDNNeUY0a0ppZkhvM1hYWXd2Mnov?=
 =?utf-8?B?bW1BTWFEWS93R0VjbXRBOHF0eFhKaTRCNnlzSDduK2gyZlUwSFNhcFBWb1VI?=
 =?utf-8?B?aEplVEp3TXphbW5jT05Hd3lzdkNHTjNnQXoxMEsxWVY1dkdyWnVVV0dWVkY1?=
 =?utf-8?B?YW1adnBXOC9mSHFJWWhzcEY1elBZdWZiRis4S3cyaXpkYXpjQTJrUm5xSjd2?=
 =?utf-8?B?REl6ZTJIb2pWVUZiZld5Z0dlUG1oY3VYN0ZFQ0k5d2pBTUN4Nm9BNjRYZjFm?=
 =?utf-8?B?Ymw1eHJPUk5oRmxKL0g3OUhyWFFvWVBRM3Jzd0N1OUVLZ0dmVTNENFRuNkNq?=
 =?utf-8?B?cFQvU0RBcnR0S1RQOThUNXNmc0ZFSXpzclRpRnVLaTJmcktVRGtsNVY3SU1F?=
 =?utf-8?B?emIvTFdWbXlEWW52MUJqT01XNHVRMkhFdmgrWDJRUkx1S0xaU3JZNGIwQVJu?=
 =?utf-8?B?citzRVRyRGhybEdKVkZ0OCtSVUZMMnVVL016aXFIczJKV0gvRlBSYjR2dEZj?=
 =?utf-8?B?NmxyZmJFbTVVZHN0V2F4M1JIOUFoTFcvcXF5Sm5PeGo0QzRUQUdNdTdVaG0v?=
 =?utf-8?B?eUJIMXRHR3FSalNzd081L3VGanpES0JNeld1S21HNzVLYkRndWxITVAveUFV?=
 =?utf-8?B?dm1LZDNxQ1BtS3FkUG9rV0M1cTJ2bHduM2k1WEFjdXFYR29aNUxGQTk3S2Ux?=
 =?utf-8?B?dlpJV1pJd3laYVRMKzhvamNSdlFCVTlQU1krVEYzRTErSkRXYUxnK1ZRUThV?=
 =?utf-8?Q?gra/hewBwoh+UwJdTMvd3RH4p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4da5d36-6930-4237-2d06-08ddce2e8cb8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 23:29:08.3283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8N2POC/sBsIIA0qZ4I3lZgApQi2VGe7P2tRto02kkpLpbEVtEDHx9XagUnGF89slxZV+XGf7MkZB/TmYBPzag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
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

Thanks. I will send v6 to promotion test.

On 7/25/25 18:33, Melissa Wen wrote:
> Hi,
> 
> Siqueira and I have been working on a solution to reduce the usage of
> drm_edid_raw in the AMD display driver, since the current guideline in
> the DRM subsystem is to stop handling raw edid data in driver-specific
> implementation and use opaque `drm_edid` object with common-code
> helpers.
> 
> To keep DC as an OS-agnostic component, we create a mid layer that
> isolates `drm_edid` helpers called in the DC code, while allowing other
> OSes to implement their specific implementation.
> 
> This work is an extension of [1].
> 
> - Patch 1 addresses a possible leak added by previous migration to
>    drm_edid.
> - Patch 2 allocates a temporary drm_edid from raw edid for parsing.
> - Patches 3-7 use common-code, drm_edid helpers to parse edid
>    capabilities instead of driver-specific solutions. For this, patch 4
>    introduces a new helper that gets monitor name from drm_edid.
> - Patches 8-9 are groundwork to reduce the noise of Linux/DRM specific
>    code in the DC shared code
> - Patch 10 creates a mid layer to make DC embraces different ways of
>    handling EDID by platforms.
> - Patch 11 move open-coded management of raw EDID data to the mid
>    layer created before.
> - Patch 12 introduces a helper that compares EDIDs from two drm_edids.
> - Patch 13 adds drm_edid to dc_sink struct and a mid-layer helper to
>    free `drm_edid`.
> - Patch 14 switch dc_edid to drm_edid across the driver in a way that
>    the DC shared code is little affected by Linux specific stuff.
> 
> [v1] https://lore.kernel.org/dri-devel/20250411201333.151335-1-mwen@igalia.com/
> Changes:
> - fix broken approach to get monitor name from eld (Jani)
>    - I introduced a new helper that gets monitor name from drm_edid
> - rename drm_edid_eq to drm_edid_eq_buf and doc fixes (Jani)
> - add NULL edid checks (Jani)
> - fix mishandling of product_id.manufacturer_name (Michel)
>    - I directly set it to manufacturer_id since sparse didn't complain.
> - add Mario's r-b in the first fix patch and fix commit msg typo.
> 
> [v2] https://lore.kernel.org/dri-devel/20250507001712.120215-1-mwen@igalia.com/
> Changes:
> - kernel-doc and commit msg fixes (Jani)
> - use drm_edid_legacy_init instead of open coded (Jani)
> - place drm_edid new func into the right section (Jani)
> - paramenter names fix (Jani)
> - add Jani's r-b to the patch 12
> - remove unnecessary include (Jani)
> - call dc_edid_sink_edid_free in link_detection, instead of drm_edid_free
> - rebase on top of asdn
> 
> [v3] https://lore.kernel.org/dri-devel/20250514202130.291324-1-mwen@igalia.com/
> Changes:
> - rebase to asdn
> - some kernel-doc fixes
> - move some changes to the right commit
> 
> [v4] https://lore.kernel.org/amd-gfx/20250613150015.245917-1-mwen@igalia.com/
> Changes:
> - fix comments and commit messages (Mario)
> - remove unnecessary drm_edid dup and fix mem leak (Mario)
> - add Mario's rb to patches 5-7
> 
> [v5] https://lore.kernel.org/amd-gfx/20250618152216.948406-1-mwen@igalia.com/
> Changes:
> - fix NULL pointer dereference (Alex H.) with the same approach proposed
>    by 7c3be3ce3dfae
> 
 > --->
> There are three specific points where we still use drm_edid_raw() in the
> driver:
> 1. raw edid data for write EDID checksum in DP_TEST_EDID_CHECKSUM via
>     drm_dp_dpcd_write(), that AFAIK there is no common code solution yet;
> 2. open-coded connectivity log for dc link detection, that maybe can be
>     moved to drm (?);
> 3. open-coded parser that I suspect is a lot of duplicated code, but
>     needs careful examining.
> 
> I suggest to address those points in a next phase for regression control.
> 
> [1] https://lore.kernel.org/amd-gfx/20250308142650.35920-1-mwen@igalia.com/
> 
> Let me know yours thoughts!
> 
> Melissa
> 
> Melissa Wen (12):
>    drm/amd/display: make sure drm_edid stored in aconnector doesn't leak
>    drm/amd/display: start using drm_edid helpers to parse EDID caps
>    drm/amd/display: use drm_edid_product_id for parsing EDID product info
>    drm/edid: introduce a helper that gets monitor name from drm_edid
>    drm/amd/display: get panel id with drm_edid helper
>    drm/amd/display: get SAD from drm_eld when parsing EDID caps
>    drm/amd/display: get SADB from drm_eld when parsing EDID caps
>    drm/amd/display: simplify dm_helpers_parse_edid_caps signature
>    drm/amd/display: change DC functions to accept private types for edid
>    drm/edid: introduce a helper that compares edid data from two drm_edid
>    drm/amd/display: add drm_edid to dc_sink
>    drm/amd/display: move dc_sink from dc_edid to drm_edid
> 
> Rodrigo Siqueira (2):
>    drm/amd/display: add a mid-layer file to handle EDID in DC
>    drm/amd/display: create a function to fill dc_sink with edid data
> 
>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   1 +
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  33 +++---
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 109 +++++++-----------
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  21 ++--
>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   |  39 +++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  15 +++
>   .../drm/amd/display/dc/core/dc_link_exports.c |   9 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_sink.c |   3 +
>   drivers/gpu/drm/amd/display/dc/dc.h           |  10 +-
>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   7 +-
>   drivers/gpu/drm/amd/display/dc/inc/link.h     |   9 +-
>   .../drm/amd/display/dc/link/link_detection.c  |  30 ++---
>   .../drm/amd/display/dc/link/link_detection.h  |   9 +-
>   drivers/gpu/drm/bridge/sil-sii8620.c          |   2 +-
>   drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +-
>   drivers/gpu/drm/drm_edid.c                    |  54 +++++++--
>   include/drm/drm_edid.h                        |  10 +-
>   17 files changed, 199 insertions(+), 164 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> 

