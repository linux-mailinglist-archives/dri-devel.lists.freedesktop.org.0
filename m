Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C3A12604
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 15:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DB010E6EE;
	Wed, 15 Jan 2025 14:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CUFwEgXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB2910E6EE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 14:29:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hx46jazMSM1PxLxjDFq3CJlrRDP8qZ8YP3i9kXoN0KAvWzrdsB6A3UcQOoB38zsHveIMWHaPmpp2WVoJ0nFkqmymR1H5OxBvZZZ5mid35eGA596g4IcvKJGgyhNs3Fb4jjRXHtAB26hX56davpv5JrCd4ldRIF4B/lSfMZlroPrzvu+PDOZPiln2OiQZFObbE1fQ0YP1PuIpAUnaql2HXZQktcL4QNgSk9pIne6fzpAxyevSpOjI2ZdzjgUPE592GrO2/CgcYsH3VhQEHPBPyVjjqurupY08hYVFJD82InVG+W97B5qFdZQyPtd33HYqFSqfkO/Qvk+zTMOEmjAZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+/zLLVLWpM5wM7TYxKoAMqF1Yav8W4/HFSM+V3OWNw=;
 b=OjPZFwVFKxqZcsyQV2f5bvQ0pocE9aygXNl3uAMq7Urgt3bIWspoP4B2waDFyw5qsaTvCTTbNWqLtljiBHK3jFHteU8AKaN33QF3hiVCWxcXiTN5wBlRNrZpvo945SkmU/jElJHOIrIUqZxh95c7WJ+NfzMzKAcgW5GiArGXzLqzJtdiMlGeQO8lrcW37NAGLBsuv4ap6eON0jP4YvWST1pmjin0h09pyLWUEWToD9Z/jxBWcRg1HCPhdRr/WVhbfBs8DrE9BcvtlBwa05g1nhraQYa+3cXs7yujJNBQ4+XchBWgGcZYXCtRAETD7nWdm5jL3wPK8mhzswXEMFKY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+/zLLVLWpM5wM7TYxKoAMqF1Yav8W4/HFSM+V3OWNw=;
 b=CUFwEgXJzONS9zqYiEVFnF+VuoCI13LyyEr7JZ1NdCRptcx/04RcYjWjss5HYgXwEL8d571SfkFvGjfooyvxsQna3QSnlYckJTXtuAAX4zBqDHwmKBfIq12XT4HW0ibs/H2HasUNCBgGlXIighQxNLn7KE8MeGJlVswdCbDS0TI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 14:29:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 14:29:43 +0000
Content-Type: multipart/alternative;
 boundary="------------09QfNbJYdkE6QQCeininRsXJ"
Message-ID: <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
Date: Wed, 15 Jan 2025 15:29:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <c823f70c-9b70-441c-b046-71058c315857@amd.com>
 <20250110205454.GM5556@nvidia.com>
 <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
 <20250115133821.GO5556@nvidia.com>
 <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
 <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250115141458.GP5556@nvidia.com>
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: d137535f-cf6b-4077-3298-08dd35710d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFQ4SVBQT3JNR3ZLV2hSdHZRMXIyblkrY3cySnNvMTNwMnVXTTA4bXpyUXRv?=
 =?utf-8?B?YmpCRldqMXlWTkVuZUtUcEUweGZhdDhyYWNCV1NkcFYrTWk2eEhiVCtKS2Nr?=
 =?utf-8?B?OVoxK2NOOTJPY0VnWndoNFZmK3lQVC83WkpZNllWL09PS0puaVFvVnB2SW1a?=
 =?utf-8?B?a1J6K0UxSmdwcnFmTkRHaWpZSitIYlg2dXVsa1dCRk0zVEdPOFVyeG5oRWNn?=
 =?utf-8?B?U1cyVWlQNWhmNDRobmlBelk5WFNyZUZ1Y1llMnl3Rm8va2RBSlZwRXIvbklW?=
 =?utf-8?B?T0JJa2dxbUR5RHh6bmRvT2xNZzEzcGRqWEF4RG1aRHQ4dFVZSW56c3lpN3dH?=
 =?utf-8?B?bU1WTU5aclR4b3IwbGF2aER5NGsyK0t3dWt3SzhYWGFGK2VHUjE5dUFzUnR3?=
 =?utf-8?B?SStUbkJYbnJ5UEdHKytGaVNRKzlzV3Q3dEhxZGlIbFhuZXhVRWw1OGptV0VI?=
 =?utf-8?B?dnF2UHRLblM5Sk0xYUNwbGVxSjNNK1gvOHYvcnFVT0NxQ0x5K1dIR1ROWjB2?=
 =?utf-8?B?azZ2ck5SdCt6Y1JZZlpja0orNjNzT0MwR2FDR3JjMjRhY1dhU3RxUjRYN2Fh?=
 =?utf-8?B?dnUvODBzaHNWV1hNRVEwV0dlWEIwejBGS3ZCRFliT2pVazIrb0tWbEg1T2Rw?=
 =?utf-8?B?TmNvWjNKVjAvN2pObEozYkxSQktpaDdIVmltUElqTlQ1eGxxRXc2OE5jRzZm?=
 =?utf-8?B?QmNhRHF2dnNIc3hSZFd0V1ZlcTVJQXp5WFE2Mitoc1ZTV2lCSUt6eXpPUWlq?=
 =?utf-8?B?bkJ1YVdEUUlzbkpkL2NjdkFYbGp1N3ZIY20xNWtVZVZwWTNFYkY1Q0pGRHZU?=
 =?utf-8?B?Y1VPT21oRERDUTEzTHZUeStLaXg3SDdFN01RQURJU2tWNFBqbHViZFNoVlBI?=
 =?utf-8?B?L2c1cHArMmZtQktqcEZIZEMrZXRsMnc2VitRYkExQVRMLzlmamsvUmllS0Rh?=
 =?utf-8?B?RGlBTG0xcUVqK3JnRktTaDNHc1lIY2F1cEdMR1JGWFBuREw2bnl5VHI5blQ1?=
 =?utf-8?B?V202Y25rYVRGQml1OWhZL1JwdHA3K0RQWWloWGlFeUhpcXJ4VEVIcVdPZnZz?=
 =?utf-8?B?Z0ZSVmhrSFg2bDdxSGwweXlvejB2QzF5cDlJdWNLYlJxNUpMOEh4MjZIVnlq?=
 =?utf-8?B?dDBxOUQyT2k3RXNaRUJLdW04cWcrSDhwUjA0SEtka2FGSTY2UjRjZ091Q1ky?=
 =?utf-8?B?cjllR3dwcmR4RUhOdldtajlRZ0c3NThrOEJJREw0OUszeDZnazZxNlhhZjhT?=
 =?utf-8?B?M1Nkd1JjZXhac1J3Y2IwMjB5UDVCV3YvMDhuK1UwZVNMZWt3L2hYMTdtODNG?=
 =?utf-8?B?a1F5TDI5Y3ZkVTc1RTlMb1pQeUFDdk82dVpzV0VYNXl2dzNMbjNILzc4SGRi?=
 =?utf-8?B?YTBseGtmaklXNlQ2bUxqMUZxSXA4QXZYTmxQYkdIbGZtZ1dFNE8wZ1Y4WVl0?=
 =?utf-8?B?SGl0b2dJSStkbldvTmVIMTkrNlZuM0dtTDdNM2NSZW9sY0FtYWdlbnpNaHFT?=
 =?utf-8?B?QUUyOXRScDUyMnh5V0pDS1V0S0g1WUJOVk0rK3F6QUdob0hzRE1tRzlQbXVn?=
 =?utf-8?B?SEcxbVMzRkdiNGtpZGg2Zm1KekNzVHFMVkFYc0hDR2JXTWprYW9YeDFubDJt?=
 =?utf-8?B?eFdJYTM4ZlBwQ2tyNEZ5UXVHTFVMZ054WW0relBFcTZ1LzNWM3JYREtYOEdC?=
 =?utf-8?B?TkJUR2JvcnViVmtSR0pCY0dkNkZDRkpwc3ExRFZBWEVXRllYNEFub3NMdmMw?=
 =?utf-8?B?S3R4WWw3Ujk3V3ZwV3pZM0prZ0pHWjVaK0tvK2JtL0RTdi85S1VYTWQyTDI5?=
 =?utf-8?B?eng5UmlLZVd1Yzh5emRqQ1M3K0U1RTlMV3FJOWFrdUZtL0lHeTcyU2VmbGh0?=
 =?utf-8?Q?CkdTdwYU6GHi1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFN3K1NNb1lCQXJNMmhENlBUYVFsaWYxS3huQUFHMFAzYktva3hUc0JOdFR2?=
 =?utf-8?B?Y3ZhVThpTlV2OFRwMThadjVpQisyVEF3cTlmb2l6SGU2MlU0aEZUT2NwY1FS?=
 =?utf-8?B?eXExb0huZlVNcjBRdFRkcmhQN2dsRittYWdJSzFMZHo4YnBiL2pSaWNFU0gy?=
 =?utf-8?B?VXJMYmxwLzZlYWJWaEVpV21zZGRNU2hLVGRtWlp4UU5tUUtrR1VEck9kWWhy?=
 =?utf-8?B?aWo1OHRpbjRwWlZuM1hHRzg1MTFCZnRKYzNIZHRjQkpXWFdtQVJQaTZpRFNs?=
 =?utf-8?B?c3FPYnNES3NDZFlnSlB5dVQvei9WQkhkV3o3Uzd3a3FIeXI1SUJQd0tRN2pL?=
 =?utf-8?B?cjlicERBTDI0engvZ3dQZnRmd3V5bWswbGl3UXBaOFVKdTY4TDZSRlVzL1VN?=
 =?utf-8?B?Z1V4Nm04TzdlQWNqZS9KLzZ5NzRXNVpNVzJVNmIxMk5kWnA3b0FUaVFmQjAv?=
 =?utf-8?B?SlI2U0ZUL2RheVpreU9GbkVkMlF4bzhFMlJxa3F1d0JvajUvZE1wS1FEUDZx?=
 =?utf-8?B?NzB5bUFEVzhGNzYyVUNGWWZnMmo1QjlaNjlBMXJzTFREMkg0U2pucVdieTJ6?=
 =?utf-8?B?M3AzKzdsSlYxTFZVclNITlEzbDZlYVFpSjJIM2RabElWRWdHL1BTNHlacjhv?=
 =?utf-8?B?UktuK2ZmUmtlVlp3eEJJeHFnVXFTRmdGUWx1VmU0bUc3MnVIRUhySDRNUnF0?=
 =?utf-8?B?SEo0Nk9QRm51VXUwNTRCcDdTVFdGMEIwNVh5SDlpanFjNjY0TDJGWVJZd29Q?=
 =?utf-8?B?dHVqYXg0RXJ0azRXVlRmNVpWby9vN2xGOEgvTEZ0cFAyYU1GZ0kxSDdSdnBP?=
 =?utf-8?B?SjlkTjA4dmlDY01aS1ZQbEFhSU54Yk95T1U0SzlRUmVzSjg5YWhxdnFsRUtD?=
 =?utf-8?B?WjIzS0RBeTZsUUQxb09ZcXpCdTljY3RONU9KU3dPZHgvMFNBd0NVblNSQnNY?=
 =?utf-8?B?MHUxWjZxV3pVS2ZzMWpQSGVnSWtMS3p3RnQzenRoMXJrTm9aMVVrb3VDeStC?=
 =?utf-8?B?NXRlMUI1THkzbG1xY1hWRytBdW9TSjVaVS9IcmRXVGtnbTdLK3BuSWJ0T2Qy?=
 =?utf-8?B?ci9NL3lYRFRwOWZzdytscThvWHBDMGZJOE4xUkZENkV0eDVsQ3lteDFuVUpz?=
 =?utf-8?B?d1h3V3dSM0JLL0ZtenJNYVZHVmRaZjJmN01HOXBNUys3MFA0SFMwNEFBaU01?=
 =?utf-8?B?cGpWTXdSY1lSdlVPdXJ5ckFXeHd0RXMxTHdPYm1ZNFVNTU5HYzUwbXdta0x0?=
 =?utf-8?B?cFJyalV4eVpXUkpjWlNpU3FJMWIzMExXemxOL2RXRk1KOXpRMmFvUTdPSXoy?=
 =?utf-8?B?NSswbWJma2NyUmNrRytYamNHSkdLL3NrS1NjNERTWlU1YUdmanBLR21qQjVp?=
 =?utf-8?B?TS9pRmZ3SXBNeHpRLzMvVHhyOFJ2b0l2cU5ycmdaRXBiejdPL0lqMXRSa1FE?=
 =?utf-8?B?d2RKVHltZCtyVHhYSWhsc0FPazBRd1pLcUhZcU9CN0ZSWG5UaXVVaUUvd0hH?=
 =?utf-8?B?Qkc4Y29zQkpyS1NrM0pmWWtqVHhvVzl4Q2JJOHZwZ2l4dmRMYXJyMkROUWRx?=
 =?utf-8?B?R0Q1bjZqdXNYV0FJR05hakNuRUtxYVVpZDd1eEhIQ3VLQnE0MSs3Z0xQV0hH?=
 =?utf-8?B?V3c5allqZkNhL1pqQVFydmZtZk1Rb0xRaUNzbjlxU3lSUkM5THd1TVhSRW0z?=
 =?utf-8?B?UHhDamtZMjdHR2lJc0gxTWJ1dDRZRXVLMitudFZlWVdQQ3Mwb0oxOTY2Y1lN?=
 =?utf-8?B?WjJST3pFMzMyenE2TVN5NWVPVjhuMEN0V2dlK2NXNmhOTmdFcGZiQnMvbGxi?=
 =?utf-8?B?bSswL1FzSzI2MFNWaUZUc3RFK09BZlkrcXBxQUlJZkt6bnRqQXlyUDFicW1J?=
 =?utf-8?B?T0Q2N0JrcWxDNDV1WFFLeitXZHFtVHlTYTd4Z2g3N1YyYXUyb0lPLzdhL2Jo?=
 =?utf-8?B?cXNKRlZoK1l1bC91bkRzclUvNUw2OGJLRDVaRGFuNzlhR1plaXNhL0ZqNTlP?=
 =?utf-8?B?aVNWVTNHV2M1M2JUSU9sSUVmMURaa0x3aEdkRk1EVVJNdTR4TCtpc0tmeEs1?=
 =?utf-8?B?dVNYUEZyQXVpbkZMZk1vUnBGVWtSdG1OK29lcE1jQ0psMjA5RWFYY3VMZGh2?=
 =?utf-8?Q?31sIvOrsMUq83DYbKxcI1QF8k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d137535f-cf6b-4077-3298-08dd35710d79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 14:29:43.2663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9ynNfgy7djp8VhzLrIO1shjLnvS3tc5T7AZdb9FoWSrG6u+3eTMNS7THNeZNkVQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982
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

--------------09QfNbJYdkE6QQCeininRsXJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 15.01.25 um 15:14 schrieb Jason Gunthorpe:
> On Wed, Jan 15, 2025 at 02:46:56PM +0100, Christian König wrote:
> [SNIP]
>>> Yeah, but it's private to the exporter. And a very fundamental rule of
>>> DMA-buf is that the exporter is the one in control of things.
> I've said a few times now, I don't think we can build the kind of
> buffer sharing framework we need to solve all the problems with this
> philosophy. It is also inefficient with the new DMA API.
>
> I think it is backwards looking and we need to move forwards with
> fixing the fundamental API issues which motivated that design.

And that's what I clearly see completely different.

Those rules are not something we cam up with because of some limitation 
of the DMA-API, but rather from experience working with different device 
driver and especially their developers.

Applying and enforcing those restrictions is absolutely mandatory must 
have for extending DMA-buf.

>>> So for example it is illegal for an importer to setup CPU mappings to a
>>> buffer. That's why we have dma_buf_mmap() which redirects mmap()
>>> requests from the importer to the exporter.
> Like this, in a future no-scatter list world I would want to make this
> safe. The importer will have enough information to know if CPU
> mappings exist and are safe to use under what conditions.
>
> There is no reason the importer should not be able to CPU access
> memory that is HW permitted to be CPU accessible.
>
> If the importer needs CPU access and the exporter cannot provide it
> then the attachment simply fails.
>
> Saying CPU access is banned 100% of the time is not a helpful position
> when we have use cases that need it.

That approach is an absolutely no-go from my side.

We have fully intentionally implemented the restriction that importers 
can't CPU access DMA-buf for both kernel and userspace without going 
through the exporter because of design requirements and a lot of 
negative experience with exactly this approach.

This is not something which is discuss-able in any way possible.

>>> As far as I can see that is really not an use case which fits DMA-buf in
>>> any way.
> I really don't want to make a dmabuf2 - everyone would have to
> implement it, including all the GPU drivers if they want to work with
> RDMA. I don't think this makes any sense compared to incrementally
> evolving dmabuf with more optional capabilities.

The point is that a dmabuf2 would most likely be rejected as well or 
otherwise run into the same issues we have seen before.

>>>>> That sounds more something for the TEE driver instead of anything DMA-buf
>>>>> should be dealing with.
>>>> Has nothing to do with TEE.
>>> Why?
> The Linux TEE framework is not used as part of confidential compute.
>
> CC already has guest memfd for holding it's private CPU memory.

Where is that coming from and how it is used?

> This is about confidential MMIO memory.

Who is the exporter and who is the importer of the DMA-buf in this use case?

> This is also not just about the KVM side, the VM side also has issues
> with DMABUF and CC - only co-operating devices can interact with the
> VM side "encrypted" memory and there needs to be a negotiation as part
> of all buffer setup what the mutual capability is. :\ swiotlb hides
> some of this some times, but confidential P2P is currently unsolved.

Yes and it is documented by now how that is supposed to happen with DMA-buf.

As far as I can see there is not much new approach here.

Regards,
Christian.

>
> Jason

--------------09QfNbJYdkE6QQCeininRsXJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 15.01.25 um 15:14 schrieb Jason Gunthorpe:<br>
    <blockquote type="cite" cite="mid:20250115141458.GP5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Jan 15, 2025 at 02:46:56PM +0100, Christian König wrote:
</pre>
      [SNIP]<br>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Yeah, but it's private to the exporter. And a very fundamental rule of
DMA-buf is that the exporter is the one in control of things.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I've said a few times now, I don't think we can build the kind of
buffer sharing framework we need to solve all the problems with this
philosophy. It is also inefficient with the new DMA API.

I think it is backwards looking and we need to move forwards with
fixing the fundamental API issues which motivated that design.</pre>
    </blockquote>
    <br>
    And that's what I clearly see completely different.<br>
    <br>
    Those rules are not something we cam up with because of some
    limitation of the DMA-API, but rather from experience working with
    different device driver and especially their developers.<br>
    <br>
    Applying and enforcing those restrictions is absolutely mandatory
    must have for extending DMA-buf.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115141458.GP5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">So for example it is illegal for an importer to setup CPU mappings to a
buffer. That's why we have dma_buf_mmap() which redirects mmap()
requests from the importer to the exporter.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Like this, in a future no-scatter list world I would want to make this
safe. The importer will have enough information to know if CPU
mappings exist and are safe to use under what conditions.

There is no reason the importer should not be able to CPU access
memory that is HW permitted to be CPU accessible.

If the importer needs CPU access and the exporter cannot provide it
then the attachment simply fails.

Saying CPU access is banned 100% of the time is not a helpful position
when we have use cases that need it.</pre>
    </blockquote>
    <br>
    That approach is an absolutely no-go from my side.<br>
    <br>
    We have fully intentionally implemented the restriction that
    importers can't CPU access DMA-buf for both kernel and userspace
    without going through the exporter because of design requirements
    and a lot of negative experience with exactly this approach.<br>
    <br>
    This is not something which is discuss-able in any way possible.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115141458.GP5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">As far as I can see that is really not an use case which fits DMA-buf in
any way.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I really don't want to make a dmabuf2 - everyone would have to
implement it, including all the GPU drivers if they want to work with
RDMA. I don't think this makes any sense compared to incrementally
evolving dmabuf with more optional capabilities.</pre>
    </blockquote>
    <br>
    The point is that a dmabuf2 would most likely be rejected as well or
    otherwise run into the same issues we have seen before.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115141458.GP5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">That sounds more something for the TEE driver instead of anything DMA-buf
should be dealing with.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Has nothing to do with TEE.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Why?
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The Linux TEE framework is not used as part of confidential compute.

CC already has guest memfd for holding it's private CPU memory.</pre>
    </blockquote>
    <br>
    Where is that coming from and how it is used?<br>
    <br>
    <blockquote type="cite" cite="mid:20250115141458.GP5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">This is about confidential MMIO memory.</pre>
    </blockquote>
    <br>
    Who is the exporter and who is the importer of the DMA-buf in this
    use case?<br>
    <br>
    <blockquote type="cite" cite="mid:20250115141458.GP5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">This is also not just about the KVM side, the VM side also has issues
with DMABUF and CC - only co-operating devices can interact with the
VM side &quot;encrypted&quot; memory and there needs to be a negotiation as part
of all buffer setup what the mutual capability is. :\ swiotlb hides
some of this some times, but confidential P2P is currently unsolved.</pre>
    </blockquote>
    <br>
    Yes and it is documented by now how that is supposed to happen with
    DMA-buf.<br>
    <br>
    As far as I can see there is not much new approach here.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20250115141458.GP5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

Jason
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------09QfNbJYdkE6QQCeininRsXJ--
