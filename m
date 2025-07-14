Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6790B0422F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 16:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B68910E0A6;
	Mon, 14 Jul 2025 14:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qR7xo0M1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7F310E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 14:52:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=So0gQwcZ7h9cmopvc0pu+Gk5aq+XcjqDkjefr/Ra7lfsAYtB7Gi0sOD1U/lTqqaYBdIRmwWBbT8pTl4e+rXDVUMjtoVAy4MVgh9jZOCGKDrWVfyro/CUyyvXRJQlZplYGdXTFgHhm4DInk49QGLN5m+rpv8m1g78bQ9ICio3SSYDTviXdvEi/7sCleisM9x7um+hfSVDgj+WGPW5mJDakZOp+l0bal3HTa79m6NN9BDBRHsjvS1e5756ME9Ia3ZDw3sYOGtvwLRgAz00R91a9+LdHsDuBGeoa9JkbePwEcOCmVluH5UGr2onQpFjpUvOKT+Pe6L/BQN/q9uw1BHwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D35Nk5hfSwsMDM9Q6QqcjPmAlVIluIoSLUJVeClDU0I=;
 b=ELKhgRmif+EztOVPFTv6xih0FVMSOAPsLnCgZ+NjzBWeepfyGOnBuaoECnwCjZQBF5bF4plD27OmImEjEMxUFJa+IaWAPffpHC7zVVqW8kmiQ935yxRK6d57IzA6qpf0Qmlk9OxIGz78C51e2vrHDpynxAT3GeSwdQLCTPVxSpPkUZr1xeDY4jFJO30EzuU6hPPqBhksrx9rw3VkCw+04Cc0/uCp4zzunMmRecUJRxazp+z4Gj/9ahqLvs4MbNgGfOk2Bl9+vLEt2tiiLGM/0ozDLNbNyzUse+VEPb4FlNUFp+UWYes/H+HKLEbL8P1k2QMxmpID1isAZMF/rYKOSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D35Nk5hfSwsMDM9Q6QqcjPmAlVIluIoSLUJVeClDU0I=;
 b=qR7xo0M1jt+EZKfVMDpy3HW1lsFcsIdufoKRZyekUE2P4ZDW8Okgu4Zl70JjrvcomP2Otu1Nt50efRXiE2cVJhyyKGTplcNQdbzisxPEorf39sb9EImxJdbU3b04KLEuQt7tlsLGD+/pZwSM4rQhRu8NF+0+vD/H2Ua+zcQhaVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 by SJ1PR12MB6220.namprd12.prod.outlook.com (2603:10b6:a03:455::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 14:51:56 +0000
Received: from BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc]) by BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc%5]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 14:51:54 +0000
Message-ID: <9ee6ee78-af88-4b57-a939-30390c790972@amd.com>
Date: Mon, 14 Jul 2025 08:51:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/9] dt-bindings: soc: xilinx: Add AI engine DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Williams <gregory.williams@amd.com>, ogabbay@kernel.org,
 michal.simek@amd.com, robh@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702155630.1737227-1-gregory.williams@amd.com>
 <20250702155630.1737227-5-gregory.williams@amd.com>
 <7533fd56-aeef-4685-a25f-d64b3f6a2d78@kernel.org>
 <eb3c843a-6762-4ac0-b863-3f500fb15b6f@amd.com>
 <504f6660-4938-47b4-b1db-0a6fe0214e5f@kernel.org>
 <349be13c-fef5-4fc2-b4c9-e85e28cbc06a@amd.com>
 <0c1e62fa-aec3-4d01-8fa0-d10817122426@kernel.org>
Content-Language: en-US
From: "Williams, Gregory" <gregoryw@amd.com>
In-Reply-To: <0c1e62fa-aec3-4d01-8fa0-d10817122426@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:805:de::35) To BL3PR12MB6642.namprd12.prod.outlook.com
 (2603:10b6:208:38e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6642:EE_|SJ1PR12MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 216a8b15-635b-4367-d182-08ddc2e5f96e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0JiaEYrQ2JvWlZSK2NDYk9Pc1VERVBmSEpkdHlEQXEyRTU5YUs5NVhBUXVI?=
 =?utf-8?B?UWRxbThzblB3ZmZFcURpRUtEZ1c3QXNlMVhSZFJnODlTMVBqaVFkN2U1TDY0?=
 =?utf-8?B?enRvVjVudjBNTHAxQjNSa2xDa3JRN2VYTWY4Mkl5a29PaDZOWm5uRkxlZUVx?=
 =?utf-8?B?NVVQa1dNYnJvUnJQa3c1cldqK2tCTXFya2R2dm4wcjV6TkpXaGNhQUpDNFJy?=
 =?utf-8?B?eHBaTytQdEpSRFJXa0dZU1ZObTVVdUF5aGxmb1MvU3U5V0FHdFpOSjUyQVc3?=
 =?utf-8?B?NzZwTGMrT2g0akgydXN3QnBoM1Y5UUFuSHV5UVZWamNRaUVUck16ell4blN2?=
 =?utf-8?B?aEhZVW8xeUwwN0RqTHorOG1Mc1ZIUGdNZFAvQzVMN3ljbWRJVmlQM3M4eE1k?=
 =?utf-8?B?Zlp4MlExZHArcXpQMy92Um5BWTRXR0I3WlRoVDRuejRab1Z2Nmd1cFdYcFpO?=
 =?utf-8?B?cXNaSU9rSWYyMURpcnExMmxIRFBnMXBHMW51TTBqVDNPVG9tZzJCTVJMVHVO?=
 =?utf-8?B?aUE1dUZmMDJZdDc2bnQyaTFUM3M1TDdMSlM5ZHNTODVROVA2YWltb3JaRkJ2?=
 =?utf-8?B?UE5oVDlNQ25ka2U0WkxTTndwTDVGSmJxVGRCY1hvV1RPYVBhbmllWmpad243?=
 =?utf-8?B?ZGJ6TkVEdVM1blZlK1EzSWJvdUZwTHdPQllIZ3JlR3hxY2hqdVExVmZ0WUs3?=
 =?utf-8?B?QXFvaTVadkxnNGpaQmd5a2VFZ0lNUDZ1MzhQTzlTYWd2N1lUSEtTTmd2R21V?=
 =?utf-8?B?NjNldHFCRjdIS1cyZVFiU0ZrVlRQYXJFcE9XUjduWU1DcW1PU3BFWXlveHRm?=
 =?utf-8?B?Q3NoRFp0MFZtUmMwd1c1QmdSK085dW1lQllUOUNQNzk1SUdTdmhaMEMxbGM1?=
 =?utf-8?B?UFFRNEVXY29sTjZKT2ZCcmJINlEwajhpQTRWTEZGQlFKdS9HNlJXa0h4dkJF?=
 =?utf-8?B?dkFnejd5dVdHTzNVNjJpckg1c3Y0RHZUMVZFcXFKNkdyWXNYVjNUNktYUU12?=
 =?utf-8?B?K3Y3cXB5S3VRK0FqaHlaZ1FMQkloRjVoRW15aHp5TkovVkxjRkhVTHhWb1Vz?=
 =?utf-8?B?ZEpPUWZ1S0UwcThRTDFsWmFFMm80TWZPWWt0V3pGRnU4cks1UmVGVGE2TW9q?=
 =?utf-8?B?b2ZnazdhRUM1Q1Vwai9vL0JQWDc0NWw0eGZQbmtoVGZUNXRGbEYzUXozbTZK?=
 =?utf-8?B?emtwVW9INkVVSmNHVjQ5MzROQWFYNElOZkM4bkVqaWRhRDcrb1hiQkNnazg5?=
 =?utf-8?B?Z3h5YTFYTis2eStTaTFDT01RTnN2NkQzZ3lVYmxHRVRwNzZPQnRSOXc3UmI0?=
 =?utf-8?B?SjdXbTBiTXA0S093WUVYZEFJbUc4NnRhQjEwSnNMUUNuaEc2QWt5dlg2NG5E?=
 =?utf-8?B?VnBmMDB5cFZmMC9vWVJZayt0T3M5TXdNNEVETlowZWxBSWo1UEE0bXYxRklp?=
 =?utf-8?B?QjFIcVA1cEVPY3NwQjRPN0tEa0VGZGRPQXJOL29iNGsrUXhCL0RjRW0wenFs?=
 =?utf-8?B?Q2xIbFhFYVhMYlB2U3FyV0VBK0dUaDVaM3BLSW05ZUVBYUxFU2RVTHJTaTM1?=
 =?utf-8?B?QXBhdlE4aC9iVnF5ZFo0OEtFOUc0UHN0dVZiMmphU0tlMTFmRWQxZEZtMmRC?=
 =?utf-8?B?SThHQWs4clB1dFZ4R1pIQXV5Q3dJZTdJeWhCaWU5ajlsYloxeC80TzN1U1ls?=
 =?utf-8?B?K05yVzA2bDZ0VG5uQ1lYZ0NrdlBhRjhFamF3bEQwRm5JV0hWVy9JNzBwdTRI?=
 =?utf-8?B?YjgwemhLUHdHUmpwekY5NVp4VzN2NXlPS1c0OFkvbEc0QVArdDlGaVgySVdR?=
 =?utf-8?B?T01CbzhTS1lha2NMc1ZRMkJyS1FGMWQzdHQyWDl5bEl5d1lobm5yejRJNnJs?=
 =?utf-8?B?aW14RzBXd3JyczQ3c0Jod1crK1A3QjlEVU5mZzBvMHV2K1RDQjNNei9YN0li?=
 =?utf-8?Q?3Wa2Ipd3fho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6642.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2tzQ3VkN3lLOGtiZ21OQ0s1aGxtcWNQdzk5TGI1QWNYU3Qwb1ZBaFhUeFht?=
 =?utf-8?B?VGc2ZjZXR0NDSWtUQ2Z3eUVoTC8yMzFRdWdtS0t5dVBGSFd3N3lxbURsVTFO?=
 =?utf-8?B?N1RudjJHS2ZuVm55UDFBWS9nYkZtVzkwZ2t2TjhWakdONW13VHBPNW43MUhr?=
 =?utf-8?B?aE5WelZabDkxc1dSNzdsU0VlVWljMExFWGV3cXRjQUNFNkh1MnNITk5YM1BX?=
 =?utf-8?B?ZDFVVDN3WitHV0wvTWlnQkR0eU1Qck5XbkhTd2RwTC9TVU5TbUluMEtZb1FW?=
 =?utf-8?B?VGJ0eGp2azhnR29HZEQ3RTdYV0MwSlkzK3dPUUlMVHlvRERZeUczVy83NjBM?=
 =?utf-8?B?b3NEMjlXS25YOGVOaEdWSVlZOGtFQlpKOUd2aDhuMEpaaWp4UUJYNllMQ1RW?=
 =?utf-8?B?NmdRbnp6emNFOWRtZSt2bU9aak53QzJvb1UxTm5oL3I2Q0tGMDNpV3o4WWhF?=
 =?utf-8?B?WjRtNGhRZW1iRE4wRk4xTWVIamlmbTcyZHRkTHdYOHp3LzF3bU5DdVNqMERL?=
 =?utf-8?B?b0ViYloya245a3grZGphbE5yRXR2bUs5T2N3NXY2NlV3TlFRcW45Sk02ZURa?=
 =?utf-8?B?UWFXSkxFUjNFZVAyMVNmV1FtZWY5SjBxYk1uMXFpNGdNY0hsUDVaNEpZTkVU?=
 =?utf-8?B?SUkxS3RTRndFditqR2R4d1U5VWc0WmRSbUFMTm5iR2V6RVZJdC9YZlpIRUdm?=
 =?utf-8?B?QW9lSjZPeEdDWmVKVHhFMWhodXpubDZLV0R5Z3d3ak9oMXllc1pUK3R1RXF2?=
 =?utf-8?B?ZStCTzJKMDBuOURSaE15aGVjcUpiUU1BTXgxdldNT1RXV3Z4YVdKZkxOeDFo?=
 =?utf-8?B?ZWYwS04vMW9VNko1KzFNNkhKQVJxb09pdnQ1dWxHY2V6SFNFZEFuWXhNbWZB?=
 =?utf-8?B?aDJCU3llZm9WZDB4bVdUOHJOb1lGdmpEYnJCMy9vQjh1VDduWTZrZldTV2p3?=
 =?utf-8?B?R1FXbDdVTVo3RVRCS1hwd3B3S2dGRXhPbGVlMXFvQVNTRnV4TDNYOU1wQ29F?=
 =?utf-8?B?bVhKTGloUWJWd0w2ZTFJQ1EwNk1DaXh2Z2J2anVkWjJoRUlsd21hMzBSYUZz?=
 =?utf-8?B?L3BMTGI4MnY0a1NHbUNOUTJEcEJ2NlpmeE85NWRsNGZqR0ovUHE5bVVnUXV2?=
 =?utf-8?B?dGpycGFnZ1RyL0wzOGNaNU1tL3lyb2dhaGJuNncvTlI3amU3TzVFTDI4SGF4?=
 =?utf-8?B?cHpIUkk2VmJvNXAvZzB5Q3JHQ2UycldiVG9hZjM3cmNpYkhxYyttNHBUYTNt?=
 =?utf-8?B?aWN3dGpwRTlBWlMxUm9DRkh6dXlDOWlVTEc0SWltank1bXREZ2FsZVFGQ3Iv?=
 =?utf-8?B?ejlTYm01RmpkUWhJS09vV3RQclg2Y1lKNlFJZGZ1NkhKQ3BhWEpzbk53YWpy?=
 =?utf-8?B?QVY0UVZESCs0dFZsMUYrNjYyR25abll6eEZnbWJoa2M0ZTg5cU9RZ0VFYWEr?=
 =?utf-8?B?ckx1VHQ3dm9FRTQ4Ti9xdXF5ODF2UTE1M1NkWHZYYjc5WHRFVXNBTjVUeFNE?=
 =?utf-8?B?bk43K0UxbVd0aFN0aytpNGRnTGk1VVpjelVQM01VK2YvSjVkdkFGWTRCT0J1?=
 =?utf-8?B?MTVvLytudWNEeU9CYmNLSm5lYzN4MjNjelJYbHg3ODRjaUYwSXFkNER3dUx2?=
 =?utf-8?B?T2pYN0tDNkUyQnNLNGVmTm5JWnVTM3AvcGNBZG8yRjB0YWhMVWlMQlU5VjJJ?=
 =?utf-8?B?ODFJSU9yelpLb281cXVPTnNCUG1sUWtPODhna2xKTWtYT0x3YWUza1gwYkhY?=
 =?utf-8?B?RHZxS1NoNk5udHhDNktmWWFXdEg2VktIOTYyc0xIK2tRZ3VTMjA1ZldSRlNZ?=
 =?utf-8?B?OCtKOC9TQktLVU5udXdYc3J0MU9tS2IwQmpwRVdnTzVmQklDNnRQclRVRllY?=
 =?utf-8?B?eGF6RXczV3BJVlpTRW9ydzBHMGx1MTZMTi9SbXlrdkxnandpSFZZTTFxL3R5?=
 =?utf-8?B?UXNkT0YrMkk5YUVzdVo5bzJZb2IxN2VJNE13Mk93eDd6RUNJYzNQcGl6VHU3?=
 =?utf-8?B?L1MyNDJvTnlaRkhNMUpJWEl2MEwwTDk2blE5bEZhMnRzajB5NWZrVWhoOVlt?=
 =?utf-8?B?RWx2cUFGUnE4K2ZwaCtDMDZnNVNtNUtEeFlNSHA5MUk0Ym44Um91YVpLMGY0?=
 =?utf-8?Q?lkrTGMIGobDMyFqFbVB0LuSEw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216a8b15-635b-4367-d182-08ddc2e5f96e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6642.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 14:51:54.7253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gjsjx2XOWVuIsqn9CRZ4022qUxu6+RYV7AmRDK3QyOqMyWgcxXGDcyRPhVc3PWwwLMKiUFLpUVpvkFcDIVaa4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6220
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

On 7/12/2025 1:33 AM, Krzysztof Kozlowski wrote:
> On 11/07/2025 20:33, Williams, Gregory wrote:
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Gregory Williams <gregory.williams@amd.com>
>>>>>> +
>>>>>> +description:
>>>>>> +  The AMD AI Engine is a tile processor with many cores (up to 400) that
>>>>>> +  can run in parallel. The data routing between cores is configured through
>>>>>> +  internal switches, and shim tiles interface with external interconnect, such
>>>>>> +  as memory or PL. One AI engine device can have multiple apertures, each
>>>>>> +  has its own address space and interrupt. At runtime application can create
>>>>>> +  multiple partitions within an aperture which are groups of columns of AI
>>>>>> +  engine tiles. Each AI engine partition is the minimum resetable unit for an
>>>>>> +  AI engine application.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: xlnx,ai-engine-v2.0
>>>>>
>>>>> What does v2.0 stands for? Versioning is discouraged, unless mapping is
>>>>> well documented.
>>>>
>>>> Sure, I will remove the versioning in V2 patch.
>>>
>>> This should be specific to product, so use the actual product/model name.
>>>
>>> Is this part of a Soc? Then standard rules apply... but I could not
>>> deduce it from the descriptions or commit msgs.
>>
>> Yes this is part of an SoC. I will be more descriptive in V2 patch.
> 
> Huh... so you MUST use SoC compatibles. Don't upstream things entirely
> different than everything else.

I will fix this in V2 patch.

Thanks,
Greg

> 
> Best regards,
> Krzysztof

