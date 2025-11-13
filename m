Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8EC59D76
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 20:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B807610E936;
	Thu, 13 Nov 2025 19:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kxMaG7Xr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F2810E933;
 Thu, 13 Nov 2025 19:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZUwlAwvi8lzl03YoPSy//iWeQofyOsCP62GyOiT0QJ+do1byCDzoHH5Nb0AWVQ51G9SHxNhAtpSnuxmkKoKs3mTaP9gwXvLsHAWC8tWEvkX9p0UFCel09wB0VHLuxw3uNqwpcz6F+EvH6hi0LBQwWQ/rMsSv11xDfUZAkXE+mpDFGuZV5qIPxlssr9QuYbDgcNAAvTgfJqtK8hiAJX4tQDAxSWAwDqZJXlRYtXiz/gWr71K8nVEQaWAICHPS2eexu4liPjVTmuaPXjv8U5SwXhy7oHYTXxOxmZoFnCyxxKwdRQXYM0/zXDAjdRzCqtRzIhaQ8q9bgSRVXlCHnCKcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GmWmYY0rM7EWwLoLNs9RFyRIvmSqqnKb8/w7zNLquA=;
 b=SZaA1qKf4SsVuHLNMC8k5vT6MPUFClQCwKdzNRWp3uotBeCaATbzu0XoUCzA3JeQhQO6Ae2V9+TZVZUlqhWYUfBAhGwyz782KhJVx23trHxsUWTucqIQaQdoK9XlMKmJp0oXSytuf6fTMRe3sv+E1wmutO6yYiiC2hGtjJBLlYhcw+mDpk08LL3ihaL/+NxMNDlgopgtsGTEvGX9WahalKubk6dWQdKyU8F2ijuhpThEeuW/NKbF8AHSz2qIIy18JeRymRYn+R8Gm2yJcgsOzugPdZ7OIw7AJMtD2hoYSTUFsJlJLolB++D7npIhH+gFtRC/XVITShsPpB4uQ2hFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GmWmYY0rM7EWwLoLNs9RFyRIvmSqqnKb8/w7zNLquA=;
 b=kxMaG7XrP2w/3UCGnv7S7TQNrNxIM9RAxdk4MDWNlZe4IE30PdWxs1TzsAAiZ/TUW97aU7+4GhDPTxUv6AVsbOGx2F8uhy11yEDsxgbqNA3gs4e1vDQQumqpEFj20YrNLLXtGjrzbami2mWEz8dKtGfc0ix1LQY6iVkej2JQD80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB7996.namprd12.prod.outlook.com (2603:10b6:8:14f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 19:50:39 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 19:50:39 +0000
Message-ID: <0fb38eee-d090-4a06-9dfa-3a1af3a6dec9@amd.com>
Date: Thu, 13 Nov 2025 14:50:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 49/49] drm/amd/display: Enable support for Gamma 2.2
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, mcanal@igalia.com, nfraprado@collabora.com,
 arthurgrillo@riseup.net
References: <20251030034349.2309829-1-alex.hung@amd.com>
 <20251030034349.2309829-50-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251030034349.2309829-50-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:408:e7::12) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f30b9fa-fce9-46a4-0d46-08de22edec00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZE81WWJ2NjdiVkRTVFhBN1VZV3Q4S0E0dzYvWngwSERQWHJBTVlWTis5TnFU?=
 =?utf-8?B?dVhZNE4xSFBXUXQ5Lzl6VHU4L3ZxNEVOSGpuRXdyc0Z5WlpGeHZxT3NRckp3?=
 =?utf-8?B?dHVmU2FydHFjekx2K0Z6VWJIVGdZN2FobUdrYkNmN2JrQ2FBeVBwQkVSdG9I?=
 =?utf-8?B?MnNuTGRHYlBGOXNuRXdmSHhYT3dXYWFDaWJlYXpSSWNXWlhVeVkwakwxa0th?=
 =?utf-8?B?MHVCSzVZN2VES3dRVWxKQ1VUWldZc2RuT1J0MU5TS0NudUlobXJDMnBHSXpC?=
 =?utf-8?B?VW5FN0Rha1BsbGh3anFDMEptbDQ3cHcycVp2UE9HbEhQVU5oWnU2aXowU0N1?=
 =?utf-8?B?TU14QTlNQi9JWkRaci9VRFpxcjRWc0Z1ekw4RW1UcEVReE00MGMzbC9NOXA2?=
 =?utf-8?B?a2JBb3g4a1RuMW9QSXJtdkFTdDk1cTZEbjB5TFRGMmNYTXMybE85b2lzRFhI?=
 =?utf-8?B?eERmaTNhd0IydkNZWEY2bVoybFRVVW94SGhuaTQwdngyUEx2RS9ha0tzdDB0?=
 =?utf-8?B?V3Z2SkRWQ1ZDb2VOSWFVZFNyMldZMGhxZDREU2ZpejFvaWhlTGdETStzQzRy?=
 =?utf-8?B?QWw4dFozMXlqMkNldVVuOXR3UWxwaXZzWVBoNlBYcDJkS1dmYnpPdEtnWExC?=
 =?utf-8?B?RlByaFN4Z0M2eUhNSUcwSVY3dEk2V0NPSlZwMENEWDFVYUNtcWd2RDZxSy9X?=
 =?utf-8?B?c1M0MUxsVkRZZUJWQkk4THZXUGtPeFFmYW5qZUtOZ0xQQkJEN2c5Ris0Sk96?=
 =?utf-8?B?d2V0cjZzcWFQeDhMREFnVzZLMU9IVnY0Q1pKMisvRWplUmk1RFEwdUxRd29x?=
 =?utf-8?B?WVBTZ1kwcWtZZWlaZzVFSEFlanRRWndtdWtTWWxBQVR5UVQ3UnVqeGZzNXVr?=
 =?utf-8?B?Q3FqaDg1NVBpaCtoNHNFa0lsaE50UUVlVHRnWm5IRUV6ZTNoZkZyay9QNUIv?=
 =?utf-8?B?Q2pTamxKT0YwLzNXNi9CQ1ExUnk4enNkY2FRQkFLbEdyZ2lMeFQ0OWhnRVh3?=
 =?utf-8?B?M1Q4L3VkdDFTV2UyeUp1aWhDZjZNeDkxUnRYbjM2aTB5UThocjNySHRhMkx0?=
 =?utf-8?B?ZytTWjloV2FIa3ZELzZPOWpaWUF4VlBxZkl1dFVTLzI2S0JLbmg3MS9sVW90?=
 =?utf-8?B?L3p1RDJpbFkvbUxTck13S0JQTGJ0UDdZYmozdmI3TytSZWpRSndobUt1YklU?=
 =?utf-8?B?NTNDQU1BTG5hcWF2dlFKOXRZMDZpaG9rdU5STmpvelY5bEswTU1mR2xOdjcv?=
 =?utf-8?B?cGRnWVFneThLZWg4WVlLbHByUTF1S1FBaFE0YXE4OFMrV2JhSjF2TEk5K0c2?=
 =?utf-8?B?NkxuYVlvb0NkUnowdXJHSEZlaHRmRWNBUHNjSVZ2ZnBhcmlLakR3OWlXNldr?=
 =?utf-8?B?RXIvUEU0UDB0RUVWRHlkWkRtTmM4bmdxaEIwNS9LOVpMYzlsZ1dnTndkZ1NO?=
 =?utf-8?B?OEQvUUsyNkZ0a015S2pBNFd2VDYxdDFTcGVRb2FiaFBKVGplRWpsUW15NzFM?=
 =?utf-8?B?SElDcWUvZ09oczVhamlOWmh0bXZ5U0N6MDN4QzVoOWxwY3gxSGNBdUVFYnBN?=
 =?utf-8?B?K2kzRzlYcFBGSk1vS1BvTE9VZGlYcWFmVllNRTU5SXlXZnV1N3I0Q2lTWHhv?=
 =?utf-8?B?a3dZMUw3WTVnRHJQRzNLL1BUMnVHdmlBRGxwcEpBZ1F6ZEh0QVUwZlRZZnNM?=
 =?utf-8?B?cnorSXpQZlBmcHJrUm1Bd2NnMHJML0pIUnIwSTREOGRPMENVOXlUWEtEYU0v?=
 =?utf-8?B?R2k5QWk4YjdRdXZ0Nnc2bGZVby9uZWQyWUZlbjc2bHpMMXlLb2hmb3hsL3gy?=
 =?utf-8?B?aHhneVk0ek0rUjUzSjVab204Yk8ybXZPTlZ4aG5sSlB4Qi9PN2N4WjJRRFZr?=
 =?utf-8?B?TnBFMTNQaWhOYjd4STRnV2t1VGpnOXltY2d5dkZhanZzSk5tQVFXRXhkVUZz?=
 =?utf-8?Q?uf/lCp9nelWyMKqYcd+1tewPUYOHDJ72?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2tLZVJ2WXRqMlBFTUJvM0plRXhxTGJKVXlzWGo4RURHN3N3NFo0V0JTT3A2?=
 =?utf-8?B?MlBTQk5wNmNMb2RJQlQxK1ZLRHQyV2tDeVdDYjZrSEJKRW5FS3p5bzBTa3Bi?=
 =?utf-8?B?bkNISi8wdWFHYWU5d2ZFcXYwYjduR1FNWWcraHQzSi82WThneG5KSTZqMU9q?=
 =?utf-8?B?Tno2KzhkRGpUbzFKODVyL01Hd3dYWDdBU1ZLSGJSMGIxMHZzS29FZG1nMVN3?=
 =?utf-8?B?bTdITGJUQllIbmVjdmp6S2tBbkdiS3dUQitGNXgwNTlXNUVoNUozaUNSL1dK?=
 =?utf-8?B?SDdJQ3NCR0g5MXIzYnNsQjVHbG1DY0x3ZFd1aFN0V3ZOQU81clAvem1LeXVI?=
 =?utf-8?B?OHNqSkVaR2x5Z21KZGgrL1BTN0sxMS9jcHlIRktkSU9sS0tScnlLNndHMFhr?=
 =?utf-8?B?cWpmc0lUd1ZkQVVYSE9La2VZS2lTZXlGSmJRUkFXSXVJNVU5TGl4OXU5RWtK?=
 =?utf-8?B?ekkydmdFWGNBYS9UdTU1enF4OVc4dFZuenV1MXVwWnVHNEF1czVVYStUSnBz?=
 =?utf-8?B?WmY0STZaTUF2ZzFTWFJuRm91MzVWQUhWbnc5dzZBU1ZlZEdLOE9YMVRuQjI4?=
 =?utf-8?B?dWUxWEtxb1E0SUNob2dETXhieHlScmNsVVYybysyRm5NMnpHMHZoaDhLWWRJ?=
 =?utf-8?B?L0Uzd3UxQzU5ZEFuYnkrcWw0cXJha0dSYmd2ZXFoUUZRYi9LaW1qQzR4Szdl?=
 =?utf-8?B?MlZKTHloR2NQbTVOK3JKMElYMi9ORE5PNkZLdk5OblE2ZE9TcjB2bWJRS0l2?=
 =?utf-8?B?MytxZnJFSmc4d1ZoME8xYlFXQy9jNThsUGhpQ0ZSZTc3azlnRFhCMzhpN3lm?=
 =?utf-8?B?WWlqeHlLK1RTbFZybGdnNG9BeHBGVldFV09xMGpja01ycnpFZHE0QW9COXlG?=
 =?utf-8?B?TkZma3NvWnVWRGJ0U295cjlmUlhEVXNMYk9hMWhaTU9qOGJ6VjlBLzNyNVRr?=
 =?utf-8?B?STBDREJWVHNDakplYzRSSzNoWVNpcDdoSFQ5ajBXY0twYWVPUVF3bFRhWENa?=
 =?utf-8?B?OUVaQVdkYnVobXJ5Q1BNa0hOOEJUMWgrWThXWG9zbkFIdkZpWEdTVVVYd0Uy?=
 =?utf-8?B?ejAyVU1TNTh4cklpWjNzaFJwL3U0dnR4aHAybEVCd3ZWMkFPdW9Ec09KeWZt?=
 =?utf-8?B?NFREUTJXV052S25seFErNnVJODNPZEFlZUgyZGlyeUwzRnpGRFZUTDkrSlMy?=
 =?utf-8?B?ajNpdXhoZC80YmRGa1JacTRkdlRFeU13NmR1ZEsrRlFkRjUyd3dZVUFzR0o0?=
 =?utf-8?B?NFpQRDZsSW1HTy9Fa2tYQnB1RzZ0Mkp5cDFncjZwNndpb1ZlVmc2VGM0dGZh?=
 =?utf-8?B?NjdHWTlWNkJzb2l5UzNCVUNRTjBBRExhN3FheTBvSlNiVVQ0UXBkeGowbEcz?=
 =?utf-8?B?SlY1UVkxMzVIcmVmSEc5eHlMYmRCYmVzRFV2NDJVM1dzeitIS0l5a2tpSEpH?=
 =?utf-8?B?c21qZGlaekJUc2s4VXRta2RQMDhtaG5URWpVaFhUQXdzZ2N4Q0N1TDJxSmhK?=
 =?utf-8?B?cklMcExvMHQrQm5RQUl1amdYOWk0OWhLSlRtb3VPK0hGYUN3THZzSCtMVTky?=
 =?utf-8?B?Y3Njc0s0M0lNQnJOZHd3TE4zQkQvRHFzdUxWd0JjSVh3WXVTU3lEKzBPSjg3?=
 =?utf-8?B?MzZUdm5CK0lRUUF6NjdvZnJRQURPNVVXVnptblVaaU8xNEp0ZkpSaWc1bWhq?=
 =?utf-8?B?c0drVm91bXdsL1JEekVkeWo2Qm5lZ3ppTGdmSk1jTnExc3MxVm9oMHcxVHhB?=
 =?utf-8?B?NTVYWEsvSmkxMGNRZGtlbnZQaEh4KzJSNXJoajJtWXRpRWp4TTF0QzJrcXVI?=
 =?utf-8?B?aFQ5QTVqdFhqVjk4YU1PQXc0YksybTNyRnB1NnJLQUJsenNjRmxxZGxNOUlH?=
 =?utf-8?B?c0Z4NHR2LzRYNk9XSnkvbG4rdFpXeVk3ZU5XRys5SVVBUWg0MHhBNitHUGhr?=
 =?utf-8?B?UW1YYjJ3S1JkeU9NUXZCV0ZoTmh4Z0JVOEpUUlptQ2dyMisxb29HLzUrektj?=
 =?utf-8?B?dHhSaU5VMytKanlEK2JkdzhmWVorVU54RXJRNUoyNHprVDIrb0dLLzZ6SytD?=
 =?utf-8?B?dlF0eXBPbVo2Z3B5OHVHYlFuYlRleUlMSzl6QUlLOWtWbGtwanZzN2VnVkxY?=
 =?utf-8?Q?YUxybZ8XTfZXXkp3nrqHsxZ9C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f30b9fa-fce9-46a4-0d46-08de22edec00
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 19:50:39.7642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sh0ym+HEnyNqmH+7a5Cyfe8voSg3+rSYtcBC8gOBH92QkjunhyViDIT2zFq8sZ0dgKZmhSxREEys1bPYwb4dsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7996
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



On 2025-10-29 23:42, Alex Hung wrote:
> This patchset enables support for the Gamma 2.2.
> 
> With this patch the following IGT subtests pass:
> 
> kms_colorop --run plane-XR30-XR30-gamma_2_2
> 
> kms_colorop --run plane-XR30-XR30-gamma_2_2_inv-gamma_2_2
> 
> kms_colorop --run plane-XR30-XR30-gamma_2_2_inv-gamma_2_2-gamma_2_2_inv
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> v12:
>  - Add gamma 2.2
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 3 +++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    | 9 ++++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index c3ddf136dbc8..6992067fd7d2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -890,6 +890,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
>  	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
>  	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
>  		return TRANSFER_FUNCTION_BT709;
> +	case DRM_COLOROP_1D_CURVE_GAMMA22:
> +	case DRM_COLOROP_1D_CURVE_GAMMA22_INV:
> +		return TRANSFER_FUNCTION_GAMMA22;
>  	default:
>  		return TRANSFER_FUNCTION_LINEAR;
>  	}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index f205f3c31f6a..64a4757d778b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -36,17 +36,20 @@
>  const u64 amdgpu_dm_supported_degam_tfs =
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>  	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
> -	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
> +	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF) |
> +	BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV);
>  
>  const u64 amdgpu_dm_supported_shaper_tfs =
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
>  	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
> -	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
> +	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF) |
> +	BIT(DRM_COLOROP_1D_CURVE_GAMMA22);
>  
>  const u64 amdgpu_dm_supported_blnd_tfs =
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>  	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
> -	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
> +	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF) |
> +	BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV);
>  
>  #define MAX_COLOR_PIPELINE_OPS 10
>  

