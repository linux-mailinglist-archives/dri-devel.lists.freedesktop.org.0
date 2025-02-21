Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE70A3FEF7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 19:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7D310EB21;
	Fri, 21 Feb 2025 18:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W0ixQu/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DDB10EB1B;
 Fri, 21 Feb 2025 18:41:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fcq7NYem6diC282qs068mOI4CPICtHyFU6b4/3ZvZXXEYawYrHbzdeOca2nTVp+vXWaikPkUvyACslIwHDqlEXHlXZUswa7JSdvoJkYA0o9vgeHD+wUUCMCAmER4DUvzbnjlzn7eX9WS5xmcKhmwZXTQ2DN6648ns+BHM6ZHj0tuadVZwi2U7mA36tI8lMtHSPgvsMYK4HWFTMMxNs4FjUemGwf/9TvbrEa/xkp+sKKkM8t4M1jevFksbH9+Y9WtUc7RMwQDduBPb1cohKvJ7LrYoWzWKzk2EaMAjMzb+HzcfWk7DGfq9zfyw+RrZ+kDuSJDR7JL+3Mv9ipQh8nAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pqt5J0/b0P+iucuw5fri4KGPquyPCIG0Jnov2xzlzj4=;
 b=SL7TvS7ORSJDMRa6UgpZ0Vm5+Bj0jaQIx9d6MgIE2r5hqFfBA3fKZG8wwyibPr4CQBRteLpSlmvl9p12+2XsamuBQ1XfZC4hWi6lfjsWNm7+cJ9GAdzSlShbWHY3bTQnlssV0WTMb73kFFfh5agcCjU0yKRNx72P7BeRac0jgjOKY3i///N8/ObjwIFO/S4XrpMH0aBb8v8ZqEI6m4cVL4XxZLD95k576P85ZPVdDKRYdOgFG+25xro6aGyAmKSWyxmRw6qccAoj5K6gJJVZAyfSRNmCS8G0b9IHKJ0Cl9u1TVMOvQALpEgy06nMt1OUvPbl2R+HEAF6/lw4tmotKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pqt5J0/b0P+iucuw5fri4KGPquyPCIG0Jnov2xzlzj4=;
 b=W0ixQu/QrIO/CMoGTyGf5qjwBXl1kedkT8oNHAXfUb2DEIFWYCxWne1MTdYQ15bgTz0fwW3uIxwY8vqnC5d1VVjO3txqiePKs6mCeYbdM4eDacW3p8dclnkA2G3ykXgIEuUFz2tRI4tlRuXtevWvUNEkCoO9Bkj4/heos3YUY6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 18:41:22 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 18:41:22 +0000
Message-ID: <fd49ad18-b1a7-4389-8b21-96f6dd21864e@amd.com>
Date: Fri, 21 Feb 2025 13:41:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 08/45] Documentation/gpu: document drm_colorop
To: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-9-alex.hung@amd.com>
 <eDrRzjuU_q4z4Jvq-DYxUnw2a-VUts65NbWMZbhrvqYoKbcW_jUawJ_ZirFIFQzrtMG4asLn6f9WP24o-k4DnP_oYf5R94PYoMIejFqdTZM=@emersion.fr>
 <5eb5fecd-caa8-4e40-8fe9-23599dc59bbf@amd.com>
 <TFAFx0Fj4cqaba_HYCGoFyvpZVhmaa2KEHRsejqoqEr64CBhJRzpaBs4ZuQWQIJDSQovx0NwwYKhb0GrbhyBWxNGxJbmxckHlyCDtJBbSYs=@emersion.fr>
 <5e3eb899-ae82-4919-a382-99cbd3c6bf34@amd.com>
 <djOGXENG_s9B416YlwwkN9f9IVTX8lv_-H-F64NSeOM1Uv0MhGKYSeouKCeJc92m9tizvwGW6JbSnWxgCQmM8A4tRl-GJDA8ZSapOyxHnV8=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <djOGXENG_s9B416YlwwkN9f9IVTX8lv_-H-F64NSeOM1Uv0MhGKYSeouKCeJc92m9tizvwGW6JbSnWxgCQmM8A4tRl-GJDA8ZSapOyxHnV8=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::7) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 888a3cf2-0c50-47da-b652-08dd52a75651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmNLVjBBUHRjS3JpSnptNEptMHZlS0UvaTFFa3hHTmJ3UDhuOVJDVTdDRjdK?=
 =?utf-8?B?R3pndzhiSmV0bFF6VG5BenlnWVFhckFvazNzblBXRkJROW13bWFLcER6akJx?=
 =?utf-8?B?ZXFMOTZUbkxWV2RRT294QWRsZE9YZHQzcWZSZEpHam1BUkdpMGQwSkczNFlM?=
 =?utf-8?B?ZnBmUTdSSTl2MzhnL3JRRTNoS3NFc1dpcHhQelVrQmlFK0x6T21lVVpyaEJI?=
 =?utf-8?B?NGJKWTlzSzVSSmZQZWdETStzRUtEbTZ0V2VwQmtZK1FzSkdxd0Fwb2ZTczUv?=
 =?utf-8?B?dzFyaUorN1F5REMyNFZFZTQxQk43Tm9UUldRNFV3VVloTXd0Q3pRUVZjYmts?=
 =?utf-8?B?eVlzN3RBK29yRUFITHlaN1BDKzF1SmxuQ09nb0ZOcGtDdTRjSytzVlhPSGY3?=
 =?utf-8?B?Mmg2OG5RQno5SVFGSUM0Z2orWWpxZ3NQNnlNaVVnQ3RnTXB3Mmt0RVVCV3RE?=
 =?utf-8?B?dXRHOXhvcGt5d3NlbTBwWjkvZllpS2VhaGxDVlo0V2dyOWd1RDJ3WFpGNjVM?=
 =?utf-8?B?QisyUS9UMWRaRU9Wb2pLVjdtYVVUREZVMzVsMVg4ZjYrR0VFOURHc1ZYcXBV?=
 =?utf-8?B?bldmVEI2Zkx0clVHVndGUGFKZnNGZnExdVl2RGRzMTl0VEEvNzQ5S0x2SzJh?=
 =?utf-8?B?RVBqaGFCMzhHTVE0cVZrV29SNHFDMG9HcDdCSlpqNEl2MmVMNDhuc3lCY1ha?=
 =?utf-8?B?d0tEU2lWOEVsSE1SZHF2SnVxNzc1RHg2a2NVeFZVZVJKWEVhTnRpQ1JadEpj?=
 =?utf-8?B?b2tRSWZ2c1VjL2h5RW1Yd205eDVUclh2bTVUSFlVSkdwdkdCSlkxRkdyL1Vu?=
 =?utf-8?B?WTZ5c0tBdU85d2p5cW1aSThpSGoyMU5leDRIZ3ZWamFOaTdqL2RuR1VzVVVL?=
 =?utf-8?B?Nm9TWnpVZDB3cjhnVEhNdUhDcXl2M0hoNlFiMytWTmlaOHg1MGNpZ1RZVW0w?=
 =?utf-8?B?MTJIcTNaSG91V0lBNmhYdVhiclkyV3czOTVTb3l2bllscVVhUHpSdFlLYlFl?=
 =?utf-8?B?UWhvQ083d2x4S1hlT2dLN1JjdEk4aFU5UFhHcEQ0cHdjREh6OGxLMC96eEY5?=
 =?utf-8?B?aDRaZWlnSFdXZFNMSEhuOGpGUkRTUXRzSDlPaUZRUnN5cUpzUklzV1k3NW5u?=
 =?utf-8?B?dGdEaHN3NzQ1a2FwaElPMlZkSHRtd1lKaHFmR0Z6THlDR0pWblRnYlhkSWZk?=
 =?utf-8?B?SnFvaXcrc2xKREdhK01ML0NSeXUrZ245eGFnOUtXUUxFdlh5dTFlbW9Zdjhr?=
 =?utf-8?B?NEdVeCtmM0tJRTlDelIxVlVkMEFrTkxING5vL2w1NUJLc2JUOTZZREVnajJj?=
 =?utf-8?B?cGoxcU0zSEdNdkZsRW9MYjh3VzBzMnJVQXNoQnkxL01td0xmZTMvSkFqNGpn?=
 =?utf-8?B?T0d5ekhoc0M2clNDS1BIdzlITFowaDRwNCszNysycFAvNmFpZ1NaRE5hQjYv?=
 =?utf-8?B?K2g4S2F3U0pqMEx6OXNqWm1QOGhENTVsa1N5VVhXaTQ3enpSTjdFbDdZUlNS?=
 =?utf-8?B?U25QNFVJd3RMYTVIeE1YanEwS2hCUG9OTWZTdUluY0pnd01RblN2OEg5YUxl?=
 =?utf-8?B?cUxDQU5YWlROTEducCtzdEpOZHlIQ3pUN2thNjJqZTdqWS9iUkJSZE1NY0Er?=
 =?utf-8?B?Y0o3bGlvYm9QT1J6aHNhKzN5Y0lscFUrQTlBdmVndlcwWXppSGdJbjJVcmk1?=
 =?utf-8?B?US9Ra0pNVVVIeE1OOWVXKzFLQkRkVDFKQjVIbSsvVGp0U2lyWEgzaksyckhX?=
 =?utf-8?B?d0hEVURVMkFveWRDaUsvV2dxU0JQQU1vQUN1Uk5aQ2Y4SXl6WHNWbm1SUXN5?=
 =?utf-8?B?Uk5obGJ4YjJaL0VwVnprZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlFScjc0YU4wNTZBREEvYkJpL0NYbGlmc1VTWHJqZnZTVGhwcTd4aGk0V0pv?=
 =?utf-8?B?eDAxSFJ2OW5jNHgvcXcxbytWcDVTNEtTNXlTSXIxaWFRZjhCVlpqblQ4QlI4?=
 =?utf-8?B?TVFnQnUvSmdnRWprc2NkcGk4akkvbjZJWnVuRG56cjRaTEU1bmthZzBCSzAx?=
 =?utf-8?B?dzFLOW1sVGs4RjRFd2grSE02U0xiODZHRzdDaG1SMWNvQ01PaC9OUW9tUHI4?=
 =?utf-8?B?dnA4Z3hZRUxHQllERk9aUGJWRkxKTjNrTzgybUpEbkxFTHZPZFgzeFk2NE9S?=
 =?utf-8?B?ak9kd2REcWhlR2FSTmMwV29HV2F2aEZBRy9CSkhvcUxjdnc2eTZOUTMxQnJv?=
 =?utf-8?B?MGZpRkxBeDRMRGRKUzkyQ3Zpc2FlN1BEUHRsRGJLaDBaSW53OHBRWkREb1Za?=
 =?utf-8?B?dFFKN2ExWFpSZnVZZDNQTzN1c1VHNGc5bm41Um5FL2Jzelg2ZmthMzRvL1Q4?=
 =?utf-8?B?Y3JkdVdJZmF6bElPdytvSmM0ZndkUzl6SnR2S1padjY3cHR3d1ppVEVMeUxL?=
 =?utf-8?B?ZDFoSkVkY2lkSTkrQkVrWDdyZ01VbWc2VDlDeHVHVWs5TFI4QTJyRHg1czRm?=
 =?utf-8?B?Q0diZFZtaGpiRjRySllaNWdOeXBWUFdUKzlZUCtBOGJySWdvdXhRb3RXa2VW?=
 =?utf-8?B?dlhPQ3JOY0ZIa1d6c2x6Zm9lYjk3Ync0NktrRTRpVmhXSWcyYTB3MXpwc29E?=
 =?utf-8?B?aVJPR0ZZWkJDTU0zK1NtM0JrUXhQbU9OOGg0eFhST2lrNkFHQWNMTDdnOFVP?=
 =?utf-8?B?RU4wTExvQnl4V3JKMWYyd0o5UXU5djluSVBvMGZ4NUpEamp1eDV4OXhPZHpw?=
 =?utf-8?B?NEI3ZHAxNDU2MWI2eGVmT0drcTBZdjN1bUczWVVmdWdmQnY0VmR6RnJNSXRD?=
 =?utf-8?B?bGw3aFFwOUw2MWhHbHJ0aXN2SWh3MWpSOWxCSDliZGVQRXphb3c3RTNlbTZ4?=
 =?utf-8?B?MHA4MzJmN2swT0FLclR5MFpsVGNwc21mR0FyMURKNlcyTUlzK0w2c2YyRm05?=
 =?utf-8?B?NlRkSE52cmpxMXNCQ25leVBydGNwUzl2MkxXajlKdFJ2WEJCRGVQelFiMzQv?=
 =?utf-8?B?Z2ZuZmlrOVBLTXdyMlcyL3h5STFmdlVnNlppSjFHQkk2Rm9HTE04bldhbWVT?=
 =?utf-8?B?dEFRbzVSK3FUaEpYM2JsM2lPVVNYRWVJVmhuRU40UEpJLzVBa0tYWnlUK2Yx?=
 =?utf-8?B?ZGhsemVQWlFpSmlNSkljbnRkZDBqMitZaUhpbkk5UHVkU2VlQ0NGeW50dEhE?=
 =?utf-8?B?dndNb0VBVG9VeHVibEsvMjJIU0xJOWF4MCtzeWtabnpLKzM3cmQ0YnhTYmxa?=
 =?utf-8?B?Skdhc2NZK1N0c3ZVQlVsSHF5dXR0U2N3eU5HazhtM21oSmY1NExqRi9RYkln?=
 =?utf-8?B?TGZKLzcwT2hINXNZMmpLN3BraWVQbkhkaU5nTE43OWxJV1BKUU1RbWkyTkJm?=
 =?utf-8?B?NVAvVnFRQ2orYlBZSU1wSllRVlpBVSs0KzdyYkxlTW9QcGxyMXNxcU52U2RQ?=
 =?utf-8?B?cEtONDRla1MyeHVud1VHMlUzTWhScG0wWExIL2JEajNzUEkzL08zQ3Q3aVJL?=
 =?utf-8?B?S3NIU0d6SVRZUXN5V09ySm5IZUpRR0pmUDFIaUxuWTcrWFo3NE51Z0M4ZS91?=
 =?utf-8?B?RTB5ZE1OVlEvSHRBZG9qK3VIQkFnY3dVWndFSXlHMDI2N0dubnlzSzNabFNY?=
 =?utf-8?B?YU5CbHM5YW5WYUt0cDlTYmN2OHpGMlF6VGRWSUpoMTJQL2JwdmNjdDBPeWpn?=
 =?utf-8?B?ZjBNRjBDbTRpdGdEVzR3V0ZKTGdpNTdleThYdVZsR3RqL1hkRUpXSnM5aDlJ?=
 =?utf-8?B?TDZiSGNtNUtlNkoyUnQrZ0JVKzlpUWlid3R1bXNYZ01rZVlQVzVRc1dOZHV1?=
 =?utf-8?B?VEVYTm9YL21rT004aHRZOUJjZ0hjNGMzSFJDN1V2SS9kK3NaU3FjUmxJcWJm?=
 =?utf-8?B?Y2NkdklPQzVueDBBeWg1ejNibmFoL1UxTU1ROXRhdkpaQjNnc1l0VWs3WHRB?=
 =?utf-8?B?Mi95clg1anREL3FhRGhlZGVwRzExdEd3UlhzSjdGd2RXcVJac0RNeGhSRHNM?=
 =?utf-8?B?UGNtdkNZMmNxSHVWd1NBRGxhdVdrdkRLZVVTbVJBbXlUcGx2WnEvdzdwRDd5?=
 =?utf-8?Q?jvQ1JrQtQ6r4IZJgT89B1ieSN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888a3cf2-0c50-47da-b652-08dd52a75651
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 18:41:21.9523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xvQs7gtOe7xjXalH3ZSEAcEa+q/cZqBVPeFi8zZkswfR0A3rn7ocuwE3Fv9WtKGff6USBppsSVmYvk5Ffx2Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
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



On 2025-02-21 11:42, Simon Ser wrote:
> On Friday, February 21st, 2025 at 17:18, Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> I did a brief survey of other enum properties and noticed
>> that this isn't well documented for others, such as the Content
>> Protection connector property, or the COLOR_RANGE and COLOR_ENCODING
>> plane properties.
> 
> Isn't the Content Protection property documented here?
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#standard-connector-properties
> 

Yes, but I don't see the actual strings. The doc mentions UNDESIRED,
DESIRED, and ENABLED but the strings are "Undesired", "Desired", and
"Enabled".

> COLOR_RANGE and COLOR_ENCODING are documented here, but indeed they
> are missing docs for enum entries:
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#color-management-properties
> 
> Would be nice to fix.
> 
>> On the IGT front, some tests set enum properties via enum strings,
>> and other set and get enum properties based on the prop uint64_t
>> prop_values[i] entry from the drmModeObjectPropertiesPtr.
>>
>> Do you know if there's a best practice for enum usage or is it mostly
>> a case of "use what works for you"?
> 
> It's an old debate. Some user-space uses enum integer values, some
> user-space uses enum name strings.
> 
> In theory, each KMS object could have a different name-value map for
> a given property. However, this is very theoretical and last time we've
> discussed this we haven't found any case where this would be desirable.
> 
> IMHO, strings make it painful for user-space because it needs to go
> through another level of indirection (to convert names to values right
> before setting a property) for no benefit. Strings are more annoying to
> handle in general (memory management, typos, etc).
> 
> Kernel has a no user-space regression policy anyways, so when user-space
> starts using values, the kernel won't be able to break these users.
> 

Makes sense and thanks for some background on previous discussions on this.

> Other people have argued that strings make it easier for user-space to
> start using a new KMS property without deploying new kernel uAPI headers.
> 

I don't understand this argument. You would either need to define the
strings or the ints in your user-space app. You could do either without
deploying new uAPI headers.

> In the end, it's up to user-space to use their preferred way to set
> properties.

Makes sense.

Harry
