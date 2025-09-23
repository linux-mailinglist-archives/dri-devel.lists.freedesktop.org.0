Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10DB953A9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE47110E5C9;
	Tue, 23 Sep 2025 09:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EIGmxjcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAE710E5C9;
 Tue, 23 Sep 2025 09:23:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo8cpiZeQRM4uU0qYZV0BWOJIO1qtdh/VnVom2HkD9COT5EPfCnugKwVhqXiciWpNRujmuV0X988lqt6DOr+R6O5qCYu4iJPoBd5BIovXDcXA2anDyKrYbp1wc0XUCkW/7e2B7Su9yE+vBRgw0PQKrN+RxSArFWiEJSxS6cWrCf/a6OjY1pqi76+mPkAcjanG9OAG7eOrvSzlVYsKxG9pcvcwDX/SSaf/v7fgzX65KIBxwVQcXaW0I/+sitBEC+9decRvzr9RM0FJBIXkH+JLCVYDs3UUk8H/YJuHudMcE17O8QzmJHQ+2mn0Ai670LBkmVchvu0OFuT7c+X9ubDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NQ83y4SxXtpHpzumeXO0rq7wJ/nZj3FtuF//Hiyxoc=;
 b=wYKL2EfcZSiNmjjpKKmquaYA9GMWyddtq7AJq16mT44TNkANDYaRFFmEv7BZn0cVzxme2yTE/kwEJvLca98woNR3aMjdgxBEHezPMM3VvsUlDgNIt+7hg1hc2R5JcEBWgCAAW2p9O8MxZsIv3u+vH4piirv38h64L/lCTROWVcNAg/hoW3nGKQkcYOdyVUNXuMYpx5K+mBoTDpr1oYYVlcgqN4RKpt/4sHqqcSh4jm2Lu32bKlbjX/hCQbPkc8ZyI2+1Pq5CfFDekviN3DebpexGYLO7Bd/0OG3ud46EjBo/fo7ifFT05ezTGiVm0ecJ2nFm1wMZjop6odRlgf0Zcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NQ83y4SxXtpHpzumeXO0rq7wJ/nZj3FtuF//Hiyxoc=;
 b=EIGmxjcploiiNS8VTp4VTTq4SEUAsSrrtpUu4lYdzC3rArDOVLjYmLEr6eLPB3oDubzMkjWXSho5HjxnSbt/p1I3Y+qJrqyqBKhEHtltYiS2g8g2x7uIBVuTM/oVU4Q86gNWwhf4c4jZkxvQe2liUGiD7sV3aYQpAWLX84bjh5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by BN5PR12MB9538.namprd12.prod.outlook.com (2603:10b6:408:2ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 09:23:14 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 09:23:14 +0000
Content-Type: multipart/alternative;
 boundary="------------kNN5iUB82B09LYQ54sEHvbSt"
Message-ID: <6ead49fb-9420-4831-a1ab-96594ab399d3@amd.com>
Date: Tue, 23 Sep 2025 14:53:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/buddy: Optimize free block management with RB
 tree
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: matthew.auld@intel.com, jani.nikula@linux.intel.com,
 samuel.pitoiset@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, alexander.deucher@amd.com,
 stable@vger.kernel.org
References: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
 <6f6841a7-57bd-49de-9b55-b5b0514a2749@amd.com>
 <20250909140519.GK4067720@noisy.programming.kicks-ass.net>
 <106c1a36-c104-4eb8-b928-d11b8ca9b599@amd.com>
 <fcbf6ae8-f9ab-4723-8df4-16d2f0f62c3f@amd.com>
 <12f56eda-a6a5-47bf-b89e-0cfa8443a439@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <12f56eda-a6a5-47bf-b89e-0cfa8443a439@amd.com>
X-ClientProxiedBy: PN4PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::7) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|BN5PR12MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: 7082c28c-859d-44be-b371-08ddfa82d278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1NRWkFES1doZzVVWFNxdXFhS2lseERlR2diVW0yMjVsTU9EajNTSU5KVnN2?=
 =?utf-8?B?ZFNEN2hzTytuZVhBeTJlVWxQSHl6Y1dYcE9JRTlqUnoxRkl6R0xzdVNiQlVM?=
 =?utf-8?B?YjBLeHdyT2R3OWw2TGRoVWMrSjZSZm15emJ0S3RmRG1mcDhxeCtxNGUrU2ly?=
 =?utf-8?B?a1Zac3l3YXZGcVQ0MDBROUFiSVQ5YVVYU2tYTXdObURrditXajN1SVJGR25J?=
 =?utf-8?B?ZkVQUzVkUk1GSzlYaVl2UWI0cUVkVVlqU1JvRFRwM3ZvZVc1dm9mbmc5aUlS?=
 =?utf-8?B?UE0wemdoeEdST2tGcVBIWFMvRDF3NWhyMlgxa3ZLYmNhQ0Y3L2FLNEw3MTVj?=
 =?utf-8?B?cTJibHJLVkxvRndHODlKSmJmOFJSVlFpZm02ZlpJTUVCRmRLdDkxR2RSMnJB?=
 =?utf-8?B?NEcxVDZCYTdaK2dvcEwwZ2Jjelk5RVJLb2ViMXVnRTZuMkNzaDluaXdhTmQz?=
 =?utf-8?B?NjRGWEFjZUQ4ekEzMWlOVlBOVzdYK25SWW5MTDNhQUVGamlQcXdyQ3FJL3I3?=
 =?utf-8?B?eVdNSDFydGluU2dPdHBUYjZNRUNOaXIxdWxnY05PNTVMVXUyWXlJQnFDUjNF?=
 =?utf-8?B?dWpIOE5VaE94RlhuaVl5M20zSXVNbzhxc3h4T1dwUXF1TWFsRUxoMXlRL0Er?=
 =?utf-8?B?a0hYUThiMUxZdGlGYjI2SG9NWHpnL3gwS2o5TFBZeGt6MGZvRXVCbXh2U0VB?=
 =?utf-8?B?ZmUzcGxZN2E3Q0RtM1Jsc2ErSzN0NFI0QzNYMEZwRFAzSEpSMVNqcHVnUWZS?=
 =?utf-8?B?L0ZHVk1TdHVTVlozb3M3bzRXcTNtN0l2UHN5Z0dMQXBBazNKUVRFMDFCeEFE?=
 =?utf-8?B?dStKd1hHQlA4dkJJcFRWdGt0UHNMdm5TT2VIVVJmd0hHYkxsTExjTXBoUndy?=
 =?utf-8?B?eXFBWEJaZWVDcFh5L0U3Ym9Ic0Mxc0tGVGRpRWh0R3FTYTF1QnMzV2FqRXcr?=
 =?utf-8?B?THVIVDltMnZ2QlNNbmVnQTZlZEFhSU1BVldpVTArTWdNNGxkNmdXVUY4NGNq?=
 =?utf-8?B?N0phRjMvQ0hHY1JOL1loemUwUGRvNlU5RDB2dGhRcXhDeWRpVkd6UDgyeW9r?=
 =?utf-8?B?TTVPZjZIV1hGTXloMVBCT3RORGZ4K0JFVFZvZE5nckxsMzVXcGQyYUJqNWRq?=
 =?utf-8?B?NTd1Z01DZS9jNkFEaUdxNjZ0UmU0MFhnUEpMVDREUmh4SW9Ta08xa1lyUEdn?=
 =?utf-8?B?S1ZSOWtNYmhZYzhHUG5XK2Y0dktJM09MK1dQcGU2SzJrcmUxUnFveHFvRVZ2?=
 =?utf-8?B?TVRtdlFLQWNKdEM0ZXVLT0tqVW1jMkkrbXBFNXE1cjhEbjdGaFZTdjBSZ0hk?=
 =?utf-8?B?RFlhYllxYVREZEVSbFJtQmZnYVZId25JN3NMcm9VUWozZ2VUTkNQUTBhVytv?=
 =?utf-8?B?S051eDVHc3YzbENuWEFYRndPTWNuK09ybVpyemp2YllCelY3aWZoL3lWdEV6?=
 =?utf-8?B?YlZycEF4RWdYakxIL1lMakdad0IzSE82WmVJVTV3OWdIMFZWenpzNlFFY0dw?=
 =?utf-8?B?U2htQmliMTBnallYODNGSjRObHJwckYvODlzTFIvcW53TVpDR0ZDT0RqbjZW?=
 =?utf-8?B?VW9ydjZRVzNqNWNvbFlQV29QaVMvdGhRVFdHaXd1RlJIanQ0b2FKSE5va1NC?=
 =?utf-8?B?eGp5Y0tZRDVIVFNhWEFWMW96MmlnSXp4QUdMN010eWVXU1pkTHJXOXFOUVpH?=
 =?utf-8?B?c3lXem5QVzN6R3lsRVc0VGhZbldHWmRPN0NlbzU4NEVkT1ZaMVB4VnNCR2VG?=
 =?utf-8?B?UUEwbFZJeTNsK21XdmVWeTZQZld5bXdmbzJ2SEVDb1BWVERBNFNLMHlUd09u?=
 =?utf-8?B?bmZXdTQ3Zzhjcm1kZmNBVjlpeUlxZ0RTUjNtc3JlMjRrTjNockFoL0paeTJy?=
 =?utf-8?B?OUFWTWUyb1dRVHpKYnc0amFIZVFWTGZ2elFIclNza3ZNdmtPZnUyOEhseWpj?=
 =?utf-8?Q?M58TlAkwt1Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azhZaWUvYnFHNzBsemFKaEhNQ0JFSlM1bkZUN1NtMWpudFNjTUJ3bDRYaHJn?=
 =?utf-8?B?OTd1akFQZXIzcWl3cXEvZnNKSFIxM2FTK0MrcnFnTk14ZmZRNXRnWTNxRkhX?=
 =?utf-8?B?Z3p5bFBTanIyUXhLakNNTEd6eXB5cmlUemFTd2JJdlVYTnh0cnFGUVJTVkhG?=
 =?utf-8?B?V1R4Zm1ZMk5HQUk3bFBwOVRnRG1oWnNWQlBYUEdRbXZ5VUNadTh6eGs2bHBj?=
 =?utf-8?B?RXkwQXVveHFKWXQzWGRLZ09CdHppaUR3Qm1BbkFDM1NmcUkzelRMaHpWUnhj?=
 =?utf-8?B?SHNRK0NZdFNhY3N2SDNSeW1wTVA1a1lDMEpLZXFZWWtMczlVYk1rRUVLcFhi?=
 =?utf-8?B?b3dzcDd1elRZK1VvTzNDeVEwczN1cjlNUVBSaFdKMkJVRE55c09GSXdKbDNI?=
 =?utf-8?B?YjVYVXJzenhvTWh4UlZXYk9TSFV5aTMwTDJTMklybzNCeC9scGMreWRkVkly?=
 =?utf-8?B?MWZENE9sVjZQQVFXV25UU3R6R0pXWmp2UjJhakJGYmhJSlo0OVlZcTdDRy9F?=
 =?utf-8?B?RnVoMzA1TmErYVlmTFdZWW5SMnltcnUrb1hlaVp1SWpWWFlMR0paSitrVGlo?=
 =?utf-8?B?MGRmNThNYjY1a2VBTk4xOFl2WDdLUVNwUGt2c3UzNUl5S3p3UTZpOGxrMy9U?=
 =?utf-8?B?cVAzUVU4L1BnK0Mxekx5UW5WekpXTEVZanUxTWNCLzBVajQzalpjcWZkODRW?=
 =?utf-8?B?WGpvbGNWRTArZ1huaGlyN0hQYTNicS9yNnhkWEQrRFBoYWF4cnF4bU9PKzht?=
 =?utf-8?B?amVmK1lVUU1NVHpiZkdiTUUxV1lGRGlvMzNKQ3NaTGxQMjRveEEyTzkybUw2?=
 =?utf-8?B?bnpzcFdwYWRNZkVkelFUamw3L3ZuSHZiK3hFejNnS3ZxbEZKNWxPUElHM3hG?=
 =?utf-8?B?N2xHZDdvN0E5emIzR0lHTEozbithY01QUlZvNDRxeXN2NzNFMkFtMCt1QWs3?=
 =?utf-8?B?OEUzSC9XcHVTQ0RSWkNROXdSdjNJTmQ3bVEzK3BnQ3pibFVMOGgzanZrREZE?=
 =?utf-8?B?V0wzOE94NjYwdmt4cTJPWXVodXJpTW4yaWR2L3lDRnh6WXMyVjEzR0dPVzhj?=
 =?utf-8?B?WTgwSFZNbGFpU05tSHFGdTUwbGxsVWFoUThlWm00ck1KYXRld3h3WCtvK0pO?=
 =?utf-8?B?Z21JZi9HU1hIc2YzYWFYbE8vbDl5V0YwUnN4VlJsS2htUlRaK2U5MXc2TFdz?=
 =?utf-8?B?YUxTemVRRElxVjl5dk9KSjlGQlZMRjNCWFVmSWMzNjFXeHkxb3J4Zm5DNmw2?=
 =?utf-8?B?WUd0NklFcG1MVHFCLzExSjU3NmRRN25GM3cxOGtONzZ6QjFzRFMzaTZNQ0NN?=
 =?utf-8?B?MHZsNUJRemRCRUJZcFUwb01QL1ZNampGSWp6SFkrUVJJQ251YzhXbC9nWnZQ?=
 =?utf-8?B?TFNoZ1hrM1p0bHI1V3RnNGRvK3VSTm9nV3poWlp3OHlUWHZSY1dSblJNK0Rv?=
 =?utf-8?B?TS9mU1hhem5UYzU5TGdWeUt3S0o4NGFESFhkN2twcHRMRUtTbjY5MHRMMVdJ?=
 =?utf-8?B?TjhrOUcxV0VXbkF3TVI5dElyMUh6cG4vaTFXQU5hNGM0a3hsOEhiN0xHbVNL?=
 =?utf-8?B?RzNxVTdMamQ0aVE1b3dZNjhqK3F2ZFRwQzNhR05Zb0pHelA2QlpBeWtwVTZ1?=
 =?utf-8?B?RC9oK1VTcTJjR1hESVoxOGRqcGpPWnN1cUNLVjEzUVdWL0tpbFU0dG9HZTA5?=
 =?utf-8?B?Q1NMOTRzUHkyaTMwd04rT21BREVqVkhjdXF1SnJjaXI0Q0Z0QmZBYVpRWHl4?=
 =?utf-8?B?Q0FadWtVLzZUcWYyeVA0RFFRUFZ2UlNPdVFtczFaVCtTdGF1M211ZkhONkdl?=
 =?utf-8?B?NndzTlIwaTZSclJJWmFhOFg4bUZ0OFdiLy9maWl3YmVzRDFlOGdsQzJwYjlj?=
 =?utf-8?B?VHFIN3Nsak51MGRBWlVpL0FxNWdsRVJOaEkvVnVpYU95VjlsSlpxQy8reFFr?=
 =?utf-8?B?RThFYTZxTXhqSnR1UDVYYTV0Z1hUWDJILytCSjVTRExmTlZCdVhHMi91OFdw?=
 =?utf-8?B?SWtLRTlzL1ZYYy9WK0hVblNhV3l3OURnRmtZeHp6QjN6UUVRNi9PTVJyRkxM?=
 =?utf-8?B?SGFhd25WVFVrSzN0TUVGMU5ZN251TmVOSVA4dExnQkVFL1hDUXczMTU0Zk1O?=
 =?utf-8?Q?/tsYKeTqpodHZev6UJWqDeZXG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7082c28c-859d-44be-b371-08ddfa82d278
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 09:23:14.3690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBSPM4PmZs6qs6zFOc5NLVnvnsGgfgnOGvx8CgObqwhloa+gd8l/M1ugNQP5XhCVveJyjFzpcO1T+p3I2pyaRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9538
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

--------------kNN5iUB82B09LYQ54sEHvbSt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christian,

On 9/10/2025 7:52 PM, Christian König wrote:
>> In drm_buddy_fini(), force_merge() is called to ensure all blocks are merged before tearing down the allocator. This guarantees that all
>> mm->roots are freed and not held by the driver at shutdown. If any blocks remain allocated, drm_buddy_fini() will issue a warning.
>>
>> In drm_buddy_reset_clear(), which is invoked at device suspend/resume, it is an ideal place to call force_merge(). This ensures that all
>> possible blocks are merged before resetting the clear state, thereby reducing fragmentation and improving allocation efficiency after resume.
> That's where rbtree_postorder_for_each_entry_safe() should be used.
Sure, I have replaced with the existing 
rbtree_postorder_for_each_entry_safe() macro in places where the 
traversal order is not important such as debug print
and reset clear functions.

Thanks,
Arun.
>
>

--------------kNN5iUB82B09LYQ54sEHvbSt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Christian,<br>
    <br>
    <div class="moz-cite-prefix">On 9/10/2025 7:52 PM, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:12f56eda-a6a5-47bf-b89e-0cfa8443a439@amd.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
In drm_buddy_fini(), force_merge() is called to ensure all blocks are merged before tearing down the allocator. This guarantees that all
mm-&gt;roots are freed and not held by the driver at shutdown. If any blocks remain allocated, drm_buddy_fini() will issue a warning.

In drm_buddy_reset_clear(), which is invoked at device suspend/resume, it is an ideal place to call force_merge(). This ensures that all
possible blocks are merged before resetting the clear state, thereby reducing fragmentation and improving allocation efficiency after resume.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That's where rbtree_postorder_for_each_entry_safe() should be used.</pre>
    </blockquote>
    Sure, I have replaced with the existing
    rbtree_postorder_for_each_entry_safe() macro in places where the
    traversal order is not important such as debug print<br>
    and reset clear functions.<br>
    <br>
    Thanks,<br>
    Arun.<br>
    <blockquote type="cite" cite="mid:12f56eda-a6a5-47bf-b89e-0cfa8443a439@amd.com">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------kNN5iUB82B09LYQ54sEHvbSt--
