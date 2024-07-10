Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E392DD0A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 01:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C4C10E92D;
	Wed, 10 Jul 2024 23:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mag+FIBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5E88926D;
 Wed, 10 Jul 2024 23:47:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yfpx27nmdxfItQ+D26g87m+sIt2J6sBLoDJG5aqvEIH4xM5gQXbMxr2UFfgGiI+xDJIlBkNu3c4DOKL7Q3uxf3/RpWXCPkidlUePs3MxvBNOczbDMAa3Diviodf5pAH6JJdgG+ABcusWhH+RVKhm8JeHlYcq318jiEp99Z/rgUYgg4yMiEYFzzr3xp7S08evVH9bm3N4ekZP3uUIi+Qb1N/3NTCWDnlEScCMeCxa5KrHEXxbKWPwER7GhdkEpHn2Bauy6aA+IJRX68DUVTOe+nMpZJXdCCipOv7zokvwZg6ShML4OtIi4irYNPSQdjldZFEOxv+eLQPDS+0BLDx7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBhMo2ITlOb3z+sCTdLGBPzcRPRm6kv2ah8KnuP76vs=;
 b=b/NHbhYGT8Wxq+ku9Oglm/bOKmDVi/cI2C/Vnvd/7XX+aZxON/8ySvB0j36ZFsLblEyAUf0US2cpksyAo8pKfKluZ9vpUGUF3opvh4GzeoO8x4BghquwFsAXGlVr0pQZq5j685TsUUK+WO+x1DZvpyRwL3yEUgYqpXIykZpiz/gpf+c7BGtEEruUU6Zj3h1RxivdreiQnt7jolVby62bbaGXikMA1Hd6EKG5rVDl5ndHbj9FsjMeQZkVYE0aECiO0bkOtWN+Ng6YOiQ9EynOszozBijKPQXCAjNtgumZoR/fmD8dUZ4Fdutdtj+WbYPCFGQBkereMD8efzkIg3dtjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBhMo2ITlOb3z+sCTdLGBPzcRPRm6kv2ah8KnuP76vs=;
 b=mag+FIBE3YiXpgZzohsoidXYXaRvfStlZHmuPMgb4yX2Nkaz6o2cNUXzw17php9fvQ+5Cg9ec1J0YJ9PjGZneus8QHuqUkw38HxXUzXPeo5gLdlKo+P3hfm/4vHZ0t1H63P3/snLc3K7qqnolu2262S37rrv2eQP9xbzquKxU0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 23:47:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 23:47:06 +0000
Message-ID: <782ca993-39f3-4a17-9039-23d98d5031ec@amd.com>
Date: Wed, 10 Jul 2024 19:47:03 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_va_range_based_memory_management_discussion_=28was?=
 =?UTF-8?B?OiDlm57lpI3vvJrlm57lpI3vvJpSZe+8mlByb3Bvc2FsIHRvIGFkZCBDUklVIHN1?=
 =?UTF-8?Q?pport_to_DRM_render_nodes=29?=
To: =?UTF-8?B?5ZGo5pil5piOKOaXpeaciCk=?= <riyue.zcm@alibaba-inc.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 criu <criu@openvz.org>
Cc: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?5byg5Lym5by6KOW8oOWwmCk=?= <zhanglunqiang.zlq@alibaba-inc.com>
References: <fdd1aaa5-29fe-4d67-bb55-da054c7c24f6.riyue.zcm@alibaba-inc.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <fdd1aaa5-29fe-4d67-bb55-da054c7c24f6.riyue.zcm@alibaba-inc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH2PR12MB4167:EE_
X-MS-Office365-Filtering-Correlation-Id: a002f495-7488-49ee-d1ac-08dca13a9b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|3613699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1lEM1cxTTJmWU9VSTZUMy9LS0RkRW41dnhFL2J3b041NE1vMkpzMW9yVFl4?=
 =?utf-8?B?VXZnU25MZXhhMTJhb3ZuWmowRzA0eDdBMk1VMWlrU01uYlAxS1ZsTWxGYnNO?=
 =?utf-8?B?MTN5M3V5bXNTOWdPMXhWUURUSWU5MW93RldLZXpORmsya3VhalY2U1dja0Zj?=
 =?utf-8?B?aG1rL01xRzJObnpnbFoyQXh1bVpLQVBaOTJXdnA5SFNGejRGZWNER0tYTHJv?=
 =?utf-8?B?SGRWdks5UHdUVkVMYUUreFR4SXlJYm9hZk1HY2luazd6d0NlZDNWcUlsQ1Rv?=
 =?utf-8?B?b21Cc1hMNHBJVkdnOVAySTZJUGh4T0VSS2ZjZVVnbUlLNmdBSE9CYW41R2x3?=
 =?utf-8?B?WlZFYUlNQ2FmM29RYjFSall0V0JlM3VObXhqZUdKTzNDd0hmRGR4eUtZSDFn?=
 =?utf-8?B?Nk1SOTBaQTZGb1QrT3FaazNaMFVXRDdaWVRzaTBRTUp5V2hBVkVxajFtdXow?=
 =?utf-8?B?Um92NU1xa3E2bXFBRlN6YWxjbXh4SFVNeUtqMGhsV0hBditnTXRLVTJVTUIx?=
 =?utf-8?B?UXEwWG1Eb2V6dWlwdXdmM3lQTUFvZ3ZBYWdPSWxqUDQvaVpVSkNZMHViRHRz?=
 =?utf-8?B?YjNVYjNrRWtadzlETGh4TllzZUlsNFBrcGtXRWI5VE1FZXRuTjVWNlV6MU83?=
 =?utf-8?B?Mytsc01pU1ZESWdvcFovU0xGejYwWmcwSHo3M2dlWFRaV3hZNHYrVDBjRHB6?=
 =?utf-8?B?SjVycXRLZ2R1M3FPeGdVeDNRZDNYdEdzWU50MmEvZjVmdjJjTW8wRG1kN1JQ?=
 =?utf-8?B?L25VNFNlTy9qM1RBWGZ0N3JPaTVKZGdkTG1SMmZIQ3U5ODcrajhocVBxRGIw?=
 =?utf-8?B?cUxpNXZ4S3U3TE5oMHMyQW1ZdVZBcnhTbUFyZkVWNEtlcDVBNkRwazZiOEl3?=
 =?utf-8?B?ZVM2bmZaLzdycE8xMXV6RnZxZXFtZUViZmpLeVVMVnBxNUVPc21iUU5uRUFw?=
 =?utf-8?B?c3JUOTEzWjlFVWlYd3lTMVZjSzc4UXJ0ejBmWnZqS1UxYVRBd2k5dFlCcUZp?=
 =?utf-8?B?YTRjTzJYdmFzVzBseDJPZ3MwZkNLK2QyMDArckVmaTJQSWxLOFByVndEczhO?=
 =?utf-8?B?V3U5U3FNc2s4TEZrVEpYeTNubWpLd1ROVktPQWNHdzBpNThHSEJxMTg0bkVz?=
 =?utf-8?B?VktnNlNPekxTd3BpaXk5ZXZHbzhPcVN2bXcwbzlzcHRlTnN6Y2gwUlR6ZUlx?=
 =?utf-8?B?QmhxWEk0YS9Pd1dtVk9ISm9iRDBaemVGUlZaYlhjdWpLNVZvN01oOFo2cExj?=
 =?utf-8?B?M0JuR0gwZjFuM2plbVg0WmVxMFMzZmhORjN2MHh6dkdEL1AreXVFckpINmYy?=
 =?utf-8?B?citYampBYXNUNWVPZ0trM1BJdVJpeWZCRHZsNkg0WUlQUDNlTUd6aXhNeFFs?=
 =?utf-8?B?R0dzbUlyNHFLRVd1R1NJeGFReklXL0xlWFJuaTNIUjhjWGdhQ3piVDVNaHow?=
 =?utf-8?B?SWRrcHdNYm4vYlIzZDFtcjVNdFUyekxrQ1VmU01MTzJMb21qd3RrWkNncHhx?=
 =?utf-8?B?Ty9tSEhGamJNTTB6U1drRHFvcXcxRExGQkdEbHBiNmJHZkhCWDB2SlFHZTJI?=
 =?utf-8?B?VTBXdG5ubTdXSkdiSERPRkhWSmhhR0hxc2hLQkIrRVNuM1FTeGhqUDlhMXhs?=
 =?utf-8?B?UzhzV3lnUTN3S0pNN3h2d2NPOWxjNXIwMkdDc0VHaUlCdXQxSm5OckVoWmt1?=
 =?utf-8?B?MDhnUTZZaWtCSEh4MG5KendlQTdrTVJiTU9GWWltMmd2bXZzUGtqRXJrTjdu?=
 =?utf-8?B?c0ZjSE5yQ1llbUxsNGJwdGJ4SnRLcEs0QzJrbFcwY1JTTE9PZVJNcW94WDRL?=
 =?utf-8?Q?UjrcgGNGC8h9Ys/Wrs7ETny1+a7kFcJqOtmVg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(3613699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1FpNmRaN05LaW92Wm5tdTMvZ2Z2dkZYUlRZUHh2S3d6WW8xN3Vyb29ieXMz?=
 =?utf-8?B?SGdaQkdiU2tlN1UyOE1PemZzeGNyOGhaUkxHa0VzZmtlcFJSc25LVllqK000?=
 =?utf-8?B?ZmdvR0lEOGdCYnNIaHhhemsrTFdZb3ZrWU45ak1rV3NNR0RrbWc4djNrS0dj?=
 =?utf-8?B?S3VGS2VKWFFqdmxPUHJYYnF1a2pBVWNCMmo4NENqdjZSbXh1d3V3T3QyaWpC?=
 =?utf-8?B?VWk3Q2Zpa21FSFFFLzdYZHpGS3JKcmdhdnBqNzFiMVBBUHgyWHBmUWFrYitK?=
 =?utf-8?B?RjhtYXdOd01SZXAzVHc1elRPSk1teUxBTjh0dUNmek1iY21hTGoyQ1VZenBV?=
 =?utf-8?B?M01Cd29WcFpJSmpZV1ZqRk13TFZaZGx3Zm0vYXlYRzZITUFjR05MZy9pRTdr?=
 =?utf-8?B?alpuSWZza2FDQUhrZjBGNUFXd2k3YXI1QXNCYThnTG8zUmNUemRIWE9OQWNu?=
 =?utf-8?B?UTIwajlYRURrNmxieXpRVXVFQ1NMQ3Q5RlYzK0pwcmFOdTFlV3JVZU1uL1d3?=
 =?utf-8?B?R0lCdkFyUkNwYXphNlI5N1FmeUs2SUF1Z2ZTMzFmYnhKRUdleHNtQ1dCNWdz?=
 =?utf-8?B?K2IyRWo5QVFockFDcFBVa1kycmcraURVOEgyNkNmZGNmOElnQWFsS01MaEtS?=
 =?utf-8?B?a0J5bEVEWm9tcTdoK1c3WGVmR1NtOXRmRk5QVml2VVp2dXJUUmFadFRDUWV2?=
 =?utf-8?B?c3RnL1FnV3hoWGFqeHZlclE5aU80SmptdWZ4ZHZqSFJJSjdLUjRGSlZkeFl0?=
 =?utf-8?B?d3JPZ2RXVjJtMzNGWHpsK3JrMzVPa016b0hOblM4M1FXSUM1YWdOR2hMZlR3?=
 =?utf-8?B?ZDA2ZFNrTFVPaSs0dUlNVDkrTElwMmRpeEV4VkVlTE1DWUQwYm9Pbjd6bGhH?=
 =?utf-8?B?TUNrU1ZFTXliK015Y3JXS0ZnQlZVWHdTakpmdEFUSXJjOXBtMzltQVVlQlBS?=
 =?utf-8?B?TW9oWDNkTkpMYjFabDV2MmYwaGhMcTErSVAzOUhYKzN6Q2FxbC9pUDhERDlS?=
 =?utf-8?B?cUhjOFg4dGl6M3lEc2tsZ21sMWlLUXQ5aUk2MHMzSDFjWFY3TnBWdC9yQkdF?=
 =?utf-8?B?UWpObTl6dENaeUpPSTFaZlplYnhMaDJPQTUxY0JENTlwQ1JORnNOaDllUGdY?=
 =?utf-8?B?blJlM2luTkNlYTlaaGpVY2FySjdseVJxWjJzRnhiSWlXZGlNbWZUUlJvd0lN?=
 =?utf-8?B?ZElhTTA1aWZxbW1BdkJqUVBPNUpVTUpFUG1ubXpuZ3NEczVrR0pnOFRsNWFW?=
 =?utf-8?B?eWFBcmZzak5mY0FKTXNnS21qUy8yZG5udFlKbm9MY2ExM0ZZVTlmNzdVZTZY?=
 =?utf-8?B?Ly9jZXJsVDU4Y01QVGx6VG1GQ1lpbG1UMkVobE05emJFODZva3k4MERseXY2?=
 =?utf-8?B?OGRjSVp2QUwwNko1QUVFNDR4dXlkeFQwT3pYam83UWlZQzdMTWIxQ2k0N3pO?=
 =?utf-8?B?b0NoTzlqK0hyY2VoSi93Z2QrS2h5RDNPT05tRCt2QzhvYm9MUjM5TW1ES3VQ?=
 =?utf-8?B?L2N3eXNJbzQrRG9NNkNHUkg2clc3RjVtWlNuQjYrcUV2WnZvL0dhMkJVeEJo?=
 =?utf-8?B?dithNUNsMWhtT1NqSkNwdkRLQjhJZUtlMEp5T3V0ZHNWRk5ocTJYdU1sMnhu?=
 =?utf-8?B?K1NwRGowV1RvOUhNM3dUZ1V2cmZrY251WFNtK2VXOGJQb1VnbTQ4U0kxalpS?=
 =?utf-8?B?KzhSL1k3eDFPUTdmbjRla3NwQU0wekdzRFpSTlZKcitRVXRibmZQZVVtQXZJ?=
 =?utf-8?B?UStmNXQwWm9tT1dHcnlXU2dWU1pnbEpiZ3BWdk8zRzNsQ0Y1V2VOOURTNUVt?=
 =?utf-8?B?elFncy9UVlM1aDBlZ3JnUE1Hdm52OXUybzN6OXVFS1lUTHhlVllwWVRDVEhF?=
 =?utf-8?B?WHU0U3Y4YXZ5VTlieDNoeFk0WGtmY0FsNVkwNXJYL21tZGN5cE5uV2JBRHVK?=
 =?utf-8?B?d1BLckJMMHZiZDhzTllPZGxNdFdsemFJQjFXUUFwb2psckY2TEVYZE4veDls?=
 =?utf-8?B?R2NqYWxSbzVXRXkvaEhoc2Qxenl1T2dXTXhOVFQ3eVpkdnBzZm1iYk8vajRs?=
 =?utf-8?B?OThwOGpySWhjbk5iTmlYcTNRRDd5ajliMUlORGtPS2swaVJXSUdQUjVlbFdq?=
 =?utf-8?Q?RiZBItviYuWs8falfkmFkZQ+U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a002f495-7488-49ee-d1ac-08dca13a9b28
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 23:47:06.4494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUrL0WcMycQKs2m0XIO9F6mnyhb14bftA9PbcTJsOXhy1KiufdW/kFCaTl2kfinzY5CXi/H8yP2sGFxJsi8X/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167
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

On 2024-07-09 22:38, 周春明(日月) wrote:
>
>
>
>
>
>
> ------------------------------------------------------------------
> 发件人：Felix Kuehling <felix.kuehling@amd.com>
> 发送时间：2024年7月10日(星期三) 01:07
> 收件人：周春明(日月) <riyue.zcm@alibaba-inc.com>; Tvrtko Ursulin 
> <tursulin@ursulin.net>; dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>; Dave Airlie <airlied@redhat.com>; 
> Daniel Vetter <daniel@ffwll.ch>; criu <criu@openvz.org>
> 抄　送："Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>; "Christian König" 
> <christian.koenig@amd.com>
> 主　题：Re: 回复：Re：Proposal to add CRIU support to DRM render nodes
>
>
>
> On 2024-07-09 5:30, 周春明(日月) wrote:
> >
> >
> >
> >
> >
> >
> > ------------------------------------------------------------------
> > 发件人：Felix Kuehling <felix.kuehling@amd.com>
> > 发送时间：2024年7月9日(星期二) 06:40
> > 收件人：周春明(日月) <riyue.zcm@alibaba-inc.com>; Tvrtko Ursulin 
> <tursulin@ursulin.net>; dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>; Dave Airlie <airlied@redhat.com>; 
> Daniel Vetter <daniel@ffwll.ch>; criu <criu@openvz.org>
> > 抄 送："Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>; "Christian König" 
> <christian.koenig@amd.com>
> > 主 题：Re: Re：Proposal to add CRIU support to DRM render nodes
> >
> >
> > On 2024-07-08 2:51, 周春明(日月) wrote:
> >>
> >>> Hi Felix,
> >>>
> >>> When I learn CRIU you introduced in 
> https://github.com/checkpoint-restore/criu/tree/criu-dev/plugins/amdgpu 
> <https://github.com/checkpoint-restore/criu/tree/criu-dev/plugins/amdgpu> 
> <https://github.com/checkpoint-restore/criu/tree/criu-dev/plugins/amdgpu>> 
> <https://github.com/checkpoint-restore/criu/tree/criu-dev/plugins/amdgpu> 
> <https://github.com/checkpoint-restore/criu/tree/criu-dev/plugins/amdgpu>> 
> <https://github.com/checkpoint-restore/criu/tree/criu-dev/plugins/amdgpu>> 
> <https://github.com/checkpoint-restore/criu/tree/criu-dev/plugins/amdgpu>>> 
> , there is a sentence
> >>> "ROCm manages memory in the form of buffer objects (BOs). We are 
> also working on a new memory management API that will be based on 
> virtual address ranges...",
> >>> Out of curious, how about "new memory management based on virtual 
> address ranges"? Any introduction for that?
> >>
> >>>Hi David,
> >>
> >>>This refers to the SVM API that has been in the upstream driver for 
> a while now: 
> https://elixir.bootlin.com/linux/v6.9.8/source/include/uapi/linux/kfd_ioctl.h#L732 
> <https://elixir.bootlin.com/linux/v6.9.8/source/include/uapi/linux/kfd_ioctl.h#L732> 
> <https://elixir.bootlin.com/linux/v6.9.8/source/include/uapi/linux/kfd_ioctl.h#L732>>
> >>
> >> [David] Can all ROCm runtime memory management switch to use svm 
> apis? No need BOs any more?
>
> >I had thought about that when I started working on SVM years ago. But 
> I came to the conclusion that we need to use BOs for VRAM to support 
> DMABuf exports and imports to support P2P and IPC features.
>
> [David] OK, I guessed you would say DMABuf and IPC factors, if we 
> don't use dmabuf (as you know, dmabuf isn't popular in compute area) 
> and implement a new ipc based on va ranges, is that possible to using 
> svm api to cover all ROCm memory management?
> When I tried memory pool used by cuda graph, seems that's OK.

DMABuf and IPC are important for collective communications libraries 
used by distributed applications. You could get away without it when 
you're running a single-process application on a single machine. But 
changing all memory allocations to SVM would probably cause some 
performance regressions, because our BO allocators and memory mapping 
functions are simpler and easier to optimize than for unified memory.

That leaves the question, what's the expected benefit or a compelling 
reason for making such an invasive change?

Regards,
   Felix


>
> Thanks,
> -David
>
> >Regards,
> >  Felix
>
>
> >
> > Thanks,
> > -David
> >
> > Regards,
> >   Felix
> >
> >
> >>
> >> Thanks,
> >> -David
> >>
> >> ------------------------------------------------------------------
> >>     发件人：Felix Kuehling <felix.kuehling@amd.com>
> >>     发送时间：2024年5月3日(星期五) 22:44
> >>     收件人：Tvrtko Ursulin <tursulin@ursulin.net>; 
> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; 
> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Dave 
> Airlie <airlied@redhat.com>; Daniel Vetter <daniel@ffwll.ch>; criu 
> <criu@openvz.org>
> >>     抄 送："Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>; "Christian 
> König" <christian.koenig@amd.com>
> >>     主 题：Re: Proposal to add CRIU support to DRM render nodes
> >>
> >>
> >>
> >>     On 2024-04-16 10:04, Tvrtko Ursulin wrote:
> >>     >
> >>     > On 01/04/2024 18:58, Felix Kuehling wrote:
> >>     >>
> >>     >> On 2024-04-01 12:56, Tvrtko Ursulin wrote:
> >>     >>>
> >>     >>> On 01/04/2024 17:37, Felix Kuehling wrote:
> >>     >>>> On 2024-04-01 11:09, Tvrtko Ursulin wrote:
> >>     >>>>>
> >>     >>>>> On 28/03/2024 20:42, Felix Kuehling wrote:
> >>     >>>>>>
> >>     >>>>>> On 2024-03-28 12:03, Tvrtko Ursulin wrote:
> >>     >>>>>>>
> >>     >>>>>>> Hi Felix,
> >>     >>>>>>>
> >>     >>>>>>> I had one more thought while browsing around the amdgpu 
> CRIU plugin. It appears it relies on the KFD support being compiled in 
> and /dev/kfd present, correct? AFAICT at least, it relies on that to 
> figure out the amdgpu DRM node.
> >>     >>>>>>>
> >>     >>>>>>> In would be probably good to consider designing things 
> without that dependency. So that checkpointing an application which 
> does not use /dev/kfd is possible. Or if the kernel does not even have 
> the KFD support compiled in.
> >>     >>>>>>
> >>     >>>>>> Yeah, if we want to support graphics apps that don't use 
> KFD, we should definitely do that. Currently we get a lot of topology 
> information from KFD, not even from the /dev/kfd device but from the 
> sysfs nodes exposed by KFD. We'd need to get GPU device info from the 
> render nodes instead. And if KFD is available, we may need to 
> integrate both sources of information.
> >>     >>>>>>
> >>     >>>>>>
> >>     >>>>>>>
> >>     >>>>>>> It could perhaps mean no more than adding some GPU 
> discovery code into CRIU. Which shuold be flexible enough to account 
> for things like re-assigned minor numbers due driver reload.
> >>     >>>>>>
> >>     >>>>>> Do you mean adding GPU discovery to the core CRIU, or to 
> the plugin. I was thinking this is still part of the plugin.
> >>     >>>>>
> >>     >>>>> Yes I agree. I was only thinking about adding some DRM 
> device discovery code in a more decoupled fashion from the current 
> plugin, for both the reason discussed above (decoupling a bit from 
> reliance on kfd sysfs), and then also if/when a new DRM driver might 
> want to implement this the code could be move to some common plugin area.
> >>     >>>>>
> >>     >>>>> I am not sure how feasible that would be though. The "gpu 
> id" concept and it's matching in the current kernel code and CRIU 
> plugin - is that value tied to the physical GPU instance or how it works?
> >>     >>>>
> >>     >>>> The concept of the GPU ID is that it's stable while the 
> system is up, even when devices get added and removed dynamically. It 
> was baked into the API early on, but I don't think we ever fully 
> validated device hot plug. I think the closest we're getting is with 
> our latest MI GPUs and dynamic partition mode change.
> >>     >>>
> >>     >>> Doesn't it read the saved gpu id from the image file while 
> doing restore and tries to open the render node to match it? Maybe I 
> am misreading the code.. But if it does, does it imply that in 
> practice it could be stable across reboots? Or that it is not possible 
> to restore to a different instance of maybe the same GPU model 
> installed in a system?
> >>     >>
> >>     >> Ah, the idea is, that when you restore on a different 
> system, you may get different GPU IDs. Or you may checkpoint an app 
> running on GPU 1 but restore it on GPU 2 on the same system. That's 
> why we need to translate GPU IDs in restored applications. User mode 
> still uses the old GPU IDs, but the kernel mode driver translates them 
> to the actual GPU IDs of the GPUs that the process was restored on.
> >>     >
> >>     > I see.. I think. Normal flow is ppd->user_gpu_id set during 
> client init, but for restored clients it gets overriden during restore 
> so that any further ioctls can actually not instantly fail.
> >>     >
> >>     > And then in amdgpu_plugin_restore_file, when it is opening 
> the render node, it relies on the kfd topology to have filled in (more 
> or less) the target_gpu_id corresponding to the render node gpu id of 
> the target GPU - the one associated with the new kfd gpu_id?
> >>
> >>     Yes.
> >>
> >>     >
> >>     > I am digging into this because I am trying to see if some 
> part of GPU discovery could somehow be decoupled.. to offer you to 
> work on at least that until you start to tackle the main body of the 
> feature. But it looks properly tangled up.
> >>
> >>     OK. Most of the interesting plugin code should be in 
> amdgpu_plugin_topology.c. It currently has some pretty complicated 
> logic to find a set of devices that matches the topology in the 
> checkpoint, including shader ISA versions, numbers of compute units, 
> memory sizes, firmware versions and IO-Links between GPUs. This was 
> originally done to support P2P with XGMI links. I'm not sure we ever 
> updated it to properly support PCIe P2P.
> >>
> >>
> >>     >
> >>     > Do you have any suggestions with what I could help with? 
> Maybe developing some sort of drm device enumeration library if you 
> see a way that would be useful in decoupling the device discovery from 
> kfd. We would need to define what sort of information you would need 
> to be queryable from it.
> >>
> >>     Maybe. I think a lot of device information is available with 
> some amdgpu info-ioctl. It may not cover all the things we're checking 
> in the KFD topology, though.
> >>
> >>     >
> >>     >>>> This also highlights another aspect on those spatially 
> partitioned GPUs. GPU IDs identify device partitions, not devices. 
> Similarly, each partition has its own render node, and the KFD 
> topology info in sysfs points to the render-minor number corresponding 
> to each GPU ID.
> >>     >>>
> >>     >>> I am not familiar with this. This is not SR-IOV but some 
> other kind of partitioning? Would you have any links where I could 
> read more?
> >>     >>
> >>     >> Right, the bare-metal driver can partition a PF spatially 
> without SRIOV. SRIOV can also use spatial partitioning and expose each 
> partition through its own VF, but that's not useful for bare metal. 
> Spatial partitioning is new in MI300. There is some high-level info in 
> this whitepaper: 
> https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-3-white-paper.pdf 
> <https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-3-white-paper.pdf> 
> <https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-3-white-paper.pdf>> 
> <https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-3-white-paper.pdf> 
> <https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-3-white-paper.pdf>> 
> <https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-3-white-paper.pdf>> 
> <https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-3-white-paper.pdf>>>.
> >>     >
> >>     > From the outside (userspace) this looks simply like multiple 
> DRM render nodes or how exactly?
> >>
> >>     Yes, that's correct. Each partition has its own render node and 
> its own node in the KFD topology.
> >>
> >>     Regards,
> >>       Felix
> >>
> >>     >
> >>     > Regards,
> >>     >
> >>     > Tvrtko
> >>     >
> >>     >>
> >>     >> Regards,
> >>     >>    Felix
> >>     >>
> >>     >>
> >>     >>>
> >>     >>> Regards,
> >>     >>>
> >>     >>> Tvrtko
> >>     >>>
> >>     >>>>>>> Otherwise I am eagerly awaiting to hear more about the 
> design specifics around dma-buf handling. And also seeing how to 
> extend to other DRM related anonymous fds.
> >>     >>>>>>
> >>     >>>>>> I've been pretty far under-water lately. I hope I'll 
> find time to work on this more, but it's probably going to be at least 
> a few weeks.
> >>     >>>>>
> >>     >>>>> Got it.
> >>     >>>>>
> >>     >>>>> Regards,
> >>     >>>>>
> >>     >>>>> Tvrtko
> >>     >>>>>
> >>     >>>>>>
> >>     >>>>>> Regards,
> >>     >>>>>>    Felix
> >>     >>>>>>
> >>     >>>>>>
> >>     >>>>>>>
> >>     >>>>>>> Regards,
> >>     >>>>>>>
> >>     >>>>>>> Tvrtko
> >>     >>>>>>>
> >>     >>>>>>> On 15/03/2024 18:36, Tvrtko Ursulin wrote:
> >>     >>>>>>>>
> >>     >>>>>>>> On 15/03/2024 02:33, Felix Kuehling wrote:
> >>     >>>>>>>>>
> >>     >>>>>>>>> On 2024-03-12 5:45, Tvrtko Ursulin wrote:
> >>     >>>>>>>>>>
> >>     >>>>>>>>>> On 11/03/2024 14:48, Tvrtko Ursulin wrote:
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> Hi Felix,
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> On 06/12/2023 21:23, Felix Kuehling wrote:
> >> >>>>>>>>>>>> Executive Summary: We need to add CRIU support to DRM 
> render nodes in order to maintain CRIU support for ROCm application 
> once they start relying on render nodes for more GPU memory 
> management. In this email I'm providing some background why we are 
> doing this, and outlining some of the problems we need to solve to 
> checkpoint and restore render node state and shared memory (DMABuf) 
> state. I have some thoughts on the API design, leaning on what we did 
> for KFD, but would like to get feedback from the DRI community 
> regarding that API and to what extent there is interest in making that 
> generic.
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> We are working on using DRM render nodes for virtual 
> address mappings in ROCm applications to implement the CUDA11-style VM 
> API and improve interoperability between graphics and compute. This 
> uses DMABufs for sharing buffer objects between KFD and multiple 
> render node devices, as well as between processes. In the long run 
> this also provides a path to moving all or most memory management from 
> the KFD ioctl API to libdrm.
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> Once ROCm user mode starts using render nodes for 
> virtual address management, that creates a problem for checkpointing 
> and restoring ROCm applications with CRIU. Currently there is no 
> support for checkpointing and restoring render node state, other than 
> CPU virtual address mappings. Support will be needed for checkpointing 
> GEM buffer objects and handles, their GPU virtual address mappings and 
> memory sharing relationships between devices and processes.
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> Eventually, if full CRIU support for graphics 
> applications is desired, more state would need to be captured, 
> including scheduler contexts and BO lists. Most of this state is 
> driver-specific.
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> After some internal discussions we decided to take our 
> design process public as this potentially touches DRM GEM and DMABuf 
> APIs and may have implications for other drivers in the future.
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> One basic question before going into any API details: 
> Is there a desire to have CRIU support for other DRM drivers?
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> This sounds like a very interesting feature on the 
> overall, although I cannot answer on the last question here.
> >>     >>>>>>>>>>
> >>     >>>>>>>>>> I forgot to finish this thought. I cannot answer / 
> don't know of any concrete plans, but I think feature is pretty cool 
> and if amdgpu gets it working I wouldn't be surprised if other drivers 
> would get interested.
> >>     >>>>>>>>>
> >>     >>>>>>>>> Thanks, that's good to hear!
> >>     >>>>>>>>>
> >>     >>>>>>>>>
> >>     >>>>>>>>>>
> >>     >>>>>>>>>>> Funnily enough, it has a tiny relation to an i915 
> feature I recently implemented on Mesa's request, which is to be able 
> to "upload" the GPU context from the GPU hang error state and replay 
> the hanging request. It is kind of (at a stretch) a very special tiny 
> subset of checkout and restore so I am not mentioning it as a curiosity.
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> And there is also another partical conceptual 
> intersect with the (at the moment not yet upstream) i915 online 
> debugger. This part being in the area of discovering and enumerating 
> GPU resources beloning to the client.
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> I don't see an immediate design or code sharing 
> opportunities though but just mentioning.
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> I did spend some time reading your plugin and 
> kernel implementation out of curiousity and have some comments and 
> questions.
> >>     >>>>>>>>>>>
> >> >>>>>>>>>>>> With that out of the way, some considerations for a 
> possible DRM CRIU API (either generic of AMDGPU driver specific): The 
> API goes through several phases during checkpoint and restore:
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> Checkpoint:
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>>  1. Process-info (enumerates objects and sizes so user 
> mode can allocate
> >> >>>>>>>>>>>>     memory for the checkpoint, stops execution on the GPU)
> >> >>>>>>>>>>>>  2. Checkpoint (store object metadata for BOs, queues, 
> etc.)
> >> >>>>>>>>>>>>  3. Unpause (resumes execution after the checkpoint is 
> complete)
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> Restore:
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>>  1. Restore (restore objects, VMAs are not in the 
> right place at this time)
> >> >>>>>>>>>>>>  2. Resume (final fixups after the VMAs are sorted 
> out, resume execution)
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> Btw is check-pointing guaranteeing all relevant 
> activity is idled? For instance dma_resv objects are free of fences 
> which would need to restored for things to continue executing 
> sensibly? Or how is that handled?
> >>     >>>>>>>>>
> >>     >>>>>>>>> In our compute use cases, we suspend user mode 
> queues. This can include CWSR (compute-wave-save-restore) where the 
> state of in-flight waves is stored in memory and can be reloaded and 
> resumed from memory later. We don't use any fences other than 
> "eviction fences", that are signaled after the queues are suspended. 
> And those fences are never handed to user mode. So we don't need to 
> worry about any fence state in the checkpoint.
> >>     >>>>>>>>>
> >>     >>>>>>>>> If we extended this to support the kernel mode 
> command submission APIs, I would expect that we'd wait for all current 
> submissions to complete, and stop new ones from being sent to the HW 
> before taking the checkpoint. When we take the checkpoint in the CRIU 
> plugin, the CPU threads are already frozen and cannot submit any more 
> work. If we wait for all currently pending submissions to drain, I 
> think we don't need to save any fence state because all the fences 
> will have signaled. (I may be missing some intricacies and I'm afraid 
> it may not be that simple in reality, but that's my opening bid. ;)
> >>     >>>>>>>>
> >>     >>>>>>>> It feels feasible to me too, for the normally behaving 
> clients at least.
> >>     >>>>>>>>
> >>     >>>>>>>> Presumably, given that the whole checkpointing is not 
> instant, it would be okay to wait a second or two longer for the 
> in-progress submissions complete. After which kernel would need to 
> prune all signalled fences from the respective container objects 
> before checkpointing.
> >>     >>>>>>>>
> >>     >>>>>>>> For the "misbehaving" clients who have perhaps queued 
> up too much work, either still in the scheduler with unsatisfied 
> dependencies, or already submitted to the hardware and/or driver 
> backend, is there a timeout concept in CRIU so it would be possible to 
> say something like "try to checkpoint but if the kernel says no time 
> period t then give up"?
> >>     >>>>>>>>
> >> >>>>>>>>>>>> For some more background about our implementation in 
> KFD, you can refer to this whitepaper: 
> https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md 
> <https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md> 
> <https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md>> 
> <https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md> 
> <https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md>> 
> <https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md>> 
> <https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md>>>
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> Potential objections to a KFD-style CRIU API in DRM 
> render nodes, I'll address each of them in more detail below:
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>>   * Opaque information in the checkpoint data that 
> user mode can't
> >> >>>>>>>>>>>> interpret or do anything with
> >> >>>>>>>>>>>>   * A second API for creating objects (e.g. BOs) that 
> is separate from
> >> >>>>>>>>>>>>     the regular BO creation API
> >> >>>>>>>>>>>>   * Kernel mode would need to be involved in restoring 
> BO sharing
> >> >>>>>>>>>>>> relationships rather than replaying BO creation, 
> export and import
> >> >>>>>>>>>>>>     from user mode
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> # Opaque information in the checkpoint
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> This comes out of ABI compatibility considerations. 
> Adding any new objects or attributes to the driver/HW state that needs 
> to be checkpointed could potentially break the ABI of the CRIU 
> checkpoint/restore ioctl if the plugin needs to parse that 
> information. Therefore, much of the information in our KFD CRIU ioctl 
> API is opaque. It is written by kernel mode in the checkpoint, it is 
> consumed by kernel mode when restoring the checkpoint, but user mode 
> doesn't care about the contents or binary layout, so there is no user 
> mode ABI to break. This is how we were able to maintain CRIU support 
> when we added the SVM API to KFD without changing the CRIU plugin and 
> without breaking our ABI.
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> Opaque information may also lend itself to API 
> abstraction, if this becomes a generic DRM API with driver-specific 
> callbacks that fill in HW-specific opaque data.
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> This feels sound in principle to me. Fundamentally 
> the state is very hardware specfic, and/or driver version specific, so 
> I don't see anything could be gained in practice by making it much 
> less opaque. (Apart from making things more complicated.)
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> I was however unsure of the current split of how 
> you dump buffer objects with some data in the defined bo structure, 
> and some in completely opaque private data. Is there a benefit to that 
> split, or maybe in other words, is there a benefit on having part 
> transparent and part opaque for buffer objects?
> >>     >>>>>>>>>
> >>     >>>>>>>>> Some of the buffer object state is needed by the 
> plugin. E.g. the size and mmap offset are needed to match VMAs with 
> BOs. I'd have to review the plugin in detail to prove that all the 
> fields are, in fact, needed by the plugin, but that was the intent. 
> Anything that the plugin doesn't need to know should be in the opaque 
> data structures.
> >>     >>>>>>>>
> >>     >>>>>>>> Right, got it.
> >>     >>>>>>>>
> >>     >>>>>>>> Would it make sense to make the opaque data in the 
> same block as the defined one? I mean instead of separating the two in 
> the binary image for instance have struct kfd_criu_bo_bucket have a 
> trailing priv_data blob? Maybe it is too late now if the image format 
> is not versioned or something.
> >>     >>>>>>>>
> >>     >>>>>>>>>>> To slightly touch upon the question of whether this 
> could become a generic DRM API. It feels it would be hard to do it 
> from the start. What sounds more feasible is if/when generic looking 
> helpers can be spotted while developing the RFC then potentially 
> structure the code they can easily be promoted to shared/common at 
> some future moment.
> >>     >>>>>>>>>
> >>     >>>>>>>>> Yes, that's how this usually goes, in my experience. 
> Thanks for confirming.
> >>     >>>>>>>>>
> >>     >>>>>>>>>
> >>     >>>>>>>>>>>
> >> >>>>>>>>>>>> # Second API for creating objects
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> Creating BOs and other objects when restoring a 
> checkpoint needs more information than the usual BO alloc and similar 
> APIs provide. For example, we need to restore BOs with the same GEM 
> handles so that user mode can continue using those handles after 
> resuming execution. If BOs are shared through DMABufs without dynamic 
> attachment, we need to restore pinned BOs as pinned. Validation of 
> virtual addresses and handling MMU notifiers must be suspended until 
> the virtual address space is restored. For user mode queues we need to 
> save and restore a lot of queue execution state so that execution can 
> resume cleanly.
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> This also sounds justified to me. Restore creating 
> all internal objects is definitely special and sounds better to add 
> uapi to create them directly with the correct properties, than to add 
> uapi to adjust internal properties after creation. And in case you 
> would always need some new uapi - so at least to adjust after 
> creation. At which point you may have both in one. Internally 
> implementation can be split or common, whatever makes sense for a 
> given object type, but new uapi definitely sounds is required.
> >> >>>>>>>>>>>> # Restoring buffer sharing relationships
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> Different GEM handles in different render nodes and 
> processes can refer to the same underlying shared memory, either by 
> directly pointing to the same GEM object, or by creating an import 
> attachment that may get its SG tables invalidated and updated 
> dynamically through dynamic attachment callbacks. In the latter case 
> it's obvious, who is the exporter and who is the importer. In the 
> first case, either one could be the exporter, and it's not clear who 
> would need to create the BO and who would need to
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> To see if I follow the former case correctly.
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> This could be two clients A and B, where B has 
> imported a dma-buf shared BO from A and has since closed the dma-buf 
> fd? Which results in a single BO with reference count of 2 and 
> obj->import_attach unset. History of who created the object is lost.
> >>     >>>>>>>>>
> >>     >>>>>>>>> Yes. In the amdgpu driver this happens when the 
> exporter and import device are the same.
> >>     >>>>>>>>>
> >>     >>>>>>>>>
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> In fact it could even be that two imported objects 
> remain (clients A, B and C) and A, who originally created the BO, has 
> since fully released it. So any kind of "creator" tracking if added 
> wouldn't be fully reliable either.
> >>     >>>>>>>>>
> >>     >>>>>>>>> That's a good point.
> >>     >>>>>>>>>
> >>     >>>>>>>>>
> >>     >>>>>>>>>>>
> >> >>>>>>>>>>>> import it when restoring the checkpoint. To further 
> complicate things, multiple processes in a checkpoint get restored 
> concurrently. So there is no guarantee that an exporter has restored a 
> shared BO at the time an importer is trying to restore its import.
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> A proposal to deal with these problems would be to 
> treat importers and exporters the same. Whoever restores first, ends 
> up creating the BO and potentially attaching to it. The other 
> process(es) can find BOs that were already restored by another process 
> by looking it up with a unique ID that could be based on the DMABuf 
> inode number. An alternative would be a two-pass approach that needs 
> to restore BOs on two passes:
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>>  1. Restore exported BOs
> >> >>>>>>>>>>>>  2. Restore imports
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> With some inter-process synchronization in CRIU itself 
> between these two passes. This may require changes in the core CRIU, 
> outside our plugin. Both approaches depend on identifying BOs with 
> some unique ID that could be based on the DMABuf inode number in the 
> checkpoint. However, we would need to identify the processes in the 
> same restore session, possibly based on parent/child process 
> relationships, to create a scope where those IDs are valid during restore.
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> If my understanding above is on the right track, 
> then I think this is the only thing which can be done (for all scenarios).
> >>     >>>>>>>>>
> >>     >>>>>>>>> I presented two alternatives. I think you're in favor 
> of the first one, where it doesn't matter who is the importer and 
> exporter. I think the two-pass approach requires that you can identify 
> an exporter. And as you pointed out, the exporter may already have 
> dropped their reference to the BO.
> >>     >>>>>>>>
> >>     >>>>>>>> Yep.
> >>     >>>>>>>>
> >>     >>>>>>>>>>> I also *think* it would be safe. At least at the 
> moment I cannot think what could go wrong. Semantics are that it 
> doesn't really matter who created the object.
> >>     >>>>>>>>>
> >>     >>>>>>>>> I would agree. What matters is that the object is 
> recreated on the correct device, and that all the direct references 
> and import attachments pointing to it are restored.
> >>     >>>>>>>>>
> >>     >>>>>>>>>
> >>     >>>>>>>>>>>
> >> >>>>>>>>>>>> Finally, we would also need to checkpoint and restore 
> DMABuf file descriptors themselves. These are anonymous file 
> descriptors. The CRIU plugin could probably be taught to recreate them 
> from the original exported BO based on the inode number that could be 
> queried with fstat in the checkpoint. It would need help from the 
> render node CRIU API to find the right BO from the inode, which may be 
> from a different process in the same restore session.
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> This part feels like it is breaking the component 
> separation a bit because even for buffers fully owned by amdgpu, 
> strictly speaking the dma-buf fd is not. At least my understanding 
> from the above is that you propose to attempt to import the fd, from 
> the kernel side, during the checkpoint process? Like:
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> Checkpoint:
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> CRIU for each anon fd:
> >>     >>>>>>>>>>> amdgpu_plugin(fd)
> >>     >>>>>>>>>>>   -> attempt in kernel dma buf import (passes fd to 
> kernel via ioctl?)
> >>     >>>>>>>>>>>       -> is it ours? (no -> error)
> >>     >>>>>>>>>>>           -> create a record mapping fd number to 
> amdgpu BO
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> Restore:
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> for each dma-buf fd record:
> >>     >>>>>>>>>>>   create BO if does not exists
> >>     >>>>>>>>>>>   export BO to same fd
> >>     >>>>>>>>>>>   close BO handle if not in regular BO handle records
> >>     >>>>>>>>>>>
> >>     >>>>>>>>>>> Or since you mention lookup by inode, that would 
> need to be dmabuf_plugin so it can lookup inodes in the private mount 
> space. However how would it co-operate with amdgpu_plugin is not clear 
> to me.
> >>     >>>>>>>>>
> >>     >>>>>>>>> The way I think about the ownership is, whichever 
> driver created the underlying BO owns the checkpointing of the dmabuf. 
> You need driver-specific information to link the dmabuf with the 
> driver's BO and you need the right driver to recreate the BO and the 
> dmabuf fd when restoring the checkpoint.
> >>     >>>>>>>>>
> >>     >>>>>>>>> It gets really interesting if you have an amdgpu 
> plugin and an i915 plugin, and they checkpoint an application that 
> shares BOs between the two devices through DMABufs. E.g. if i915 
> created a BO and amdgpu imported it, then during restore, i915 needs 
> to restore the dmabuf before the amdgpu import of it can be restored. 
> I think that brings us back to a two-phase approach to restoring the 
> memory sharing relationships. Uff.
> >>     >>>>>>>>
> >>     >>>>>>>> I think this part of the discussion somewhat depends 
> on the previous part about idling. If it is feasible to completely 
> idle and prune, and fail if that is not happening quickly enough, then 
> maybe there wouldn't be too much hierarchical state to save.
> >>     >>>>>>>>
> >>     >>>>>>>> Otherwise my idea was that there is a top-level 
> drm_plugin.so which understands amdgpu fds, i915, syncobj, sync_file, 
> and uses some new uapi to uniquely identify each, associate with the 
> correct driver, and then internally dispatches to 
> amdgpu|i915|dmabuf|..._plugin.so. Building the in memory 
> representation of their relationships. As long as all objects and 
> their relationships have been recorded I think everything could then 
> be correctly restored.
> >>     >>>>>>>>
> >>     >>>>>>>> It is possible there is flaw in my thinking and that 
> something in CRIU design would make this impossible? I think it would 
> require the top-level drm_plugin.so to hold all state in memory until 
> the whole checkpointing is done, and then verify something is not 
> incomplete, failing it all if it was. (For instance one plugin 
> discovered an reference to an object which was not discoverd by any 
> other plugin or things like that.) May need some further tweaks to 
> CRIU common code.
> >>     >>>>>>>>
> >>     >>>>>>>> Maybe I need to better understand how exactly you mean 
> to query the DRM driver about random anonymous fds. I see it as a 
> problem in the design, possibly even implementation, but maybe I am 
> missing something which makes it not so. I mean even with my general 
> idea I don't know how would one determine which driver to query about 
> a particular anonymous inode.
> >>     >>>>>>>>
> >>     >>>>>>>>>> I later also realised that I was maybe increasing 
> the scope for you here. :) You did state focus is ROCm applications 
> which possibly doesn't care about dma-resv, fences, syncobjs etc?
> >>     >>>>>>>>>
> >>     >>>>>>>>> That's my focus for now. But I don't want to engineer 
> a solution that would preclude your use cases in the future.
> >>     >>>>>>>>>
> >>     >>>>>>>>>
> >>     >>>>>>>>>>
> >>     >>>>>>>>>> But I think the "how to handle dma-bufs" design 
> question is still relevant and interesting. For example I had this 
> thought that perhaps what would be needed is a CRIU plugin hierarchy.
> >>     >>>>>>>>>>
> >>     >>>>>>>>>> Because fundamentally we would be snapshoting a 
> hierarcy of kernel objects belonging to different drivers (kfd, 
> amdgpu, dma-buf, ...). And if one day someone would to try to handle 
> dma fences and drm syncobjs, the argument for a hierarchial design 
> would be even stronger I think.
> >>     >>>>>>>>>>
> >>     >>>>>>>>>> Something like a drm_plugin.so could call 
> sub-plugins (amdgpu, dma-buf, sync file, ...) and internally build the 
> representation of the whole state and how the relationship between the 
> objects.
> >>     >>>>>>>>>
> >>     >>>>>>>>> Maybe. I guess a structure similar to libdrm makes 
> sense. I'm not sure it's strictly a hierarchy. Maybe more like some 
> common code shared by multiple GPU driver plugins. I think the common 
> checkpoint state is quite limited and restoring it requires the 
> GPU-specific drivers anyway.
> >>     >>>>>>>>>
> >>     >>>>>>>>> Also the idea of building a representation of the 
> whole state doesn't work well with the CRIU design, because "the whole 
> state" can include multiple processes that restore themselves 
> concurrently and only synchronize with each other in a few places in 
> the restore process. I feel, if we can work out how to checkpoint and 
> restore shared objects between processes, we can do the same for 
> shared objects between drivers without imposing a strict hierarchy and 
> some omniscient entity that needs to know "the whole state".
> >>     >>>>>>>>
> >>     >>>>>>>> Okay, this continues on the same problem space as 
> above. And you obviously know how CRIU works much better than me.
> >>     >>>>>>>>
> >>     >>>>>>>>>> With that kind of design there probably would be a 
> need to define some common kernel side api and uapi, so all involved 
> objects can be enumerated with some unique ids etc.
> >>     >>>>>>>>>>
> >>     >>>>>>>>>> Now.. the counter argument.. the more state from 
> different drivers would one want to handle the bigger this project 
> would get. Would it even be feasible is the question, to the point 
> that it may be simpler to just run the workload in a VM via SR-IOV and 
> simply hibernate the whole thin guest. :)
> >>     >>>>>>>>>
> >>     >>>>>>>>> Well, CRIU kind of tries to do that, but with 
> containers instead of VMs. ;)
> >>     >>>>>>>>
> >>     >>>>>>>> It would definitely be useful for hardware and drivers 
> without SR-IOV support so lets hope it is doable. :)
> >>     >>>>>>>>
> >>     >>>>>>>> Regards,
> >>     >>>>>>>>
> >>     >>>>>>>> Tvrtko
> >
>
