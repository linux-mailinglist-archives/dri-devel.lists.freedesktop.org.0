Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7506EA2FC95
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 23:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B779810E61B;
	Mon, 10 Feb 2025 22:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PbJ4K0Hv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FB510E3DE;
 Mon, 10 Feb 2025 22:03:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY7YuyoCmPr+aIdUBHqUVeYYPHy5Ije8Uw+4Vi+V3iOTuHc0/wsvtkwtJvL9aGBdkHFimW26VtJkpRhAUuram0IJLi7NkG9RLHlU6pLPhHv/t3erQE2h7YktbKxeYo5WAzF0UbOcEwhpL35tbBQGqxwIdGy+sXpP1raaI/XxpxezCOpj0L3lb+xmuo/4yZTwNlPBK7ZWxn7BDs8S93QQbhP1lVOPJQfyprn44/PAW2q9wi+EmJWFBT2giRyIC0myQCXD7hcaQut0reQXhVGwbfKcUw1yaEW6xfMPf4rnieQ09XUHM6ouWCXADFyHzm5EBaCDjUnZD1gn0yd9HY5jHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDrDDAb4YTesLO3x60X+Ab/ICj5uEJC5PWjoLxA0DAw=;
 b=gc6obcQkb6OVT7WAn+gSAaBjQe59jNyVYuHc5Ax9Kss3EWVgBws/wIPfai8HiPvmXj/8lK5LqTYRHs+BJp+Y5TwIuGWFRS1B5QNYZf03B1VtEpjTnl2S4dlxzZcOHqi9rPlayOj6NwdATxZ2dYvLaVp0dTk5+4dVxd03s3EJDCRmndmb3GiJrBnbF/ZDcDmKRaRU2IDN/P/GuAvbPKk9bJH5Ub3++Yq72jA3kulQ+XoS7f4Jeuur3DkgisQ4dbLBpuCWsTt4fTFNjUu63oAV4Qop3oL5GjZXIq5CE5ZsgFYDT7tLPyh4japSgp/7cviPcxK/iW5PkPWS2gJ7JiNNJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDrDDAb4YTesLO3x60X+Ab/ICj5uEJC5PWjoLxA0DAw=;
 b=PbJ4K0HvIcYf0dJeUk3UbdRVdiq4U3i4ODMCv03U5w66fCcBmdv/VJQ9gyhlEG6B2FULjBtbonxbAEfLTV9slEmsHbJ/c8iGAqSjt53E8BZweAyp6IGTLhAAytI6nBYA5IPqgXUI/3TXjzVbMnXW1/y9rmJbbTR0PWrbnjEuQRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Mon, 10 Feb
 2025 22:03:06 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 22:03:06 +0000
Message-ID: <5eb5fecd-caa8-4e40-8fe9-23599dc59bbf@amd.com>
Date: Mon, 10 Feb 2025 17:03:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 08/45] Documentation/gpu: document drm_colorop
To: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-9-alex.hung@amd.com>
 <eDrRzjuU_q4z4Jvq-DYxUnw2a-VUts65NbWMZbhrvqYoKbcW_jUawJ_ZirFIFQzrtMG4asLn6f9WP24o-k4DnP_oYf5R94PYoMIejFqdTZM=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <eDrRzjuU_q4z4Jvq-DYxUnw2a-VUts65NbWMZbhrvqYoKbcW_jUawJ_ZirFIFQzrtMG4asLn6f9WP24o-k4DnP_oYf5R94PYoMIejFqdTZM=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0254.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9631d9-ec35-4fe1-e6cd-08dd4a1eb2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWlBTnUvK1NyU1RPcFZDdWluNTNoRE1rWVlyeUZpblQzdEVId2Z5ckdoS2VG?=
 =?utf-8?B?TEIxanpkQVRMaGZESTR2dnhKYTdLK2N6bjBCRTJZVmtvYTU3YzNneEk0T25P?=
 =?utf-8?B?ZXpzRmdIaUZjTTdzVXVCc25ieVg3YUxES1hHMjEwMzMxbUM3T3VoNnRRY3FO?=
 =?utf-8?B?NmNQTENTWGNaQmxFN3g5NkFJcTdWeTRvOVN5L3M0TkZlRnFGWkhHU0JGT2hR?=
 =?utf-8?B?WXlzTXNxekV5YmF1blpFOStKSUd4L2ZTdFQwa2wzdGNYVHJERm1HSXBTWDZF?=
 =?utf-8?B?R2dWR0Z0cEJGWkhGbHRwUjJ2OUp4SGVxM0JpWi9vREdtZHBmWCtSUjh5RGZq?=
 =?utf-8?B?bTlMakQ3b3c3NVMya0hiSndaQ3AvUWR2bUl0cFpJMGFQZ3ZHQm5KM3B6WTg2?=
 =?utf-8?B?WUJoZGFoay9FRHE2OUh6NUc3ZkxrbDAxTVhFNUorenlubG1UVGtvdjQ5YzVO?=
 =?utf-8?B?R2pncXlHcEY3TlBUb2s0RWxURU9WWUQzcExEcWN3bm96L1VqeEtmd3VQQ1Ay?=
 =?utf-8?B?RDFWQkk3S3JNRlZJN09xcEFTMlc5MGd1bTVJSmlwVlczRjZScU9hTHVadUt4?=
 =?utf-8?B?cDhHS1h1WXBNYzJqSlp4Q2VNc1Qwb3ZXK0xGU2ZueTNmNU1aZGhTUUw5UWV3?=
 =?utf-8?B?S1dwUXA4TDBaU3ozbWlXZW94WTlGUVpZVDVRRGR6clhieUJpM2pFZm05Um04?=
 =?utf-8?B?aG5RN1NJNzJEclY0d3czdmlOempYN3JnK3FBa3k0N29FSHRkcTdlMFpVUjhw?=
 =?utf-8?B?M0hQNzFKNlNPdWFCUlR0dkFudXY2eVBZckp1VnhjUXZKRTlZMVRIMkNVZUky?=
 =?utf-8?B?dWFWU0dUaTBnSjV4Y2hBQ1JVMTRFUmVWcFgyOXk3UTFRWjFuMnN4dmZtYmJo?=
 =?utf-8?B?clVRME03U2FGOW5mV2haMnJxT0Z2d2RiVFdRQUh2WlFNdFpuZFFMeWpBQ3Az?=
 =?utf-8?B?MHE4QnJKRHpCWUlCdjB5UFFmcUova05zU3Y4L2pjb1VuVTlReTcwNFJyQzNJ?=
 =?utf-8?B?UG5wSisxMjJWakgxd3IyeXZMMkcyaTBPUW5lY0ZDdEk5VFRIaGNPN0ZBS2dY?=
 =?utf-8?B?QStKMEhrS2hYczN1Tkh4c0xCY0t4VTZ4M3dUTWNZZnZxbnVFZThrSk11akIy?=
 =?utf-8?B?cjJrQnBnU0VycE15WXhQbUI0cURSVm5qQ1h5U3NpNGdBdmM3ZHJxdndSekdw?=
 =?utf-8?B?dFJCTVpLUXV5QTk5dkFwZm9XSE9BdmdwaXNkVHN4bE1ZOUZ6Z0E5RVV5amdi?=
 =?utf-8?B?elJTYWpOY3lvamF3RWxsS01oVFhTVXQyMlBVUFo1TmtUZGJPcFFKMHRzNXhy?=
 =?utf-8?B?T1pVYkE5ME5FU2Y1M0NWMmg4RTczUnJyaHlPSGFOZVB6T0N5SmhibllxaWt3?=
 =?utf-8?B?MGdWT1QzWFpWSm9pOWFlNGIzb2ZpRU9OQ096NzRoTlNSYy9HdU1jZDFXdzJ6?=
 =?utf-8?B?Y1gwTVR4Qm9VejBwV2I1STlYaTB3b1R3S3lCUlBuZ1hoeFlvMURZbUZ3MmpG?=
 =?utf-8?B?QTVQc1FHQzg4YnVYaTdLbUVtQmNoQVg4aHJlOThLeHJuejFkSXhFZktOM3lK?=
 =?utf-8?B?MXNCcWVsWnRROExZTUxYZHVBVVJXaStMVTVnQlZzZ2FlOS9HWTJOTDNhYXZE?=
 =?utf-8?B?STNUV210dG9VOFppU0dJMGVTYXFNRnhwLzNsY2lDODkzcFBVVUtxWFFpRVZT?=
 =?utf-8?B?TG41N0dyaG82eEpsOVRzRE9SNW8vKzB2dGU0VUNaSWJ6cEJBUG9HYmtJczdm?=
 =?utf-8?B?bHErQitFRUI1ajNKVXRMaHZDelgrR2tZcUhtQmYvcE9CMWowSWo2NTZjam0y?=
 =?utf-8?B?QXhCaWdBaHV5Z0RWbkRyYXJoT21USi9ndjJnNENwa3RVYjl5SFBNcFhXVC9W?=
 =?utf-8?Q?0myLXzJJG5ufy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEFMMmgvSkltdGkyek5zaHQ2dUJ0b0hLeDArT2ZXU2lZNDBuUkxBNnJGTGVv?=
 =?utf-8?B?TW9YK0xKRTJyMklIdE1TYloxUlFZK0UzNmpLUitoeHQ2bGxUL2NEK3dPbDF0?=
 =?utf-8?B?NU1iNGNUZUdScGlwNE5wSUtFQXBkcTUzMFBkQ1hhUWZaYWR2Vm1JUEJjbHFo?=
 =?utf-8?B?cU5hbnc2d0RuaU1WNW5mUEpjWFR2dWJydzM5QUVQejN3aTJQSlp2Q095czIz?=
 =?utf-8?B?M1NVR1J6WitGS2tNY3BaMHFJdlFPQ0Q0VWp3cjJPTU9hdngvUWpjZ3hJQVFn?=
 =?utf-8?B?dWdYeUlCdEtLWG1xNmpzWGtLTm9IaElnKzdBMnFiVDMzMHFhZWovS0ZWekM5?=
 =?utf-8?B?RGdSSE9kSE5VSEFVQU5LbGQyeVN1TWlZczlJYTdOYXRGeWNyZVhhaThQRUxm?=
 =?utf-8?B?R1lENTVIeGc1d0V2VExheEFjak91bzRjbXlkdlNkTWxRL1o0cTlWaUxmbnBS?=
 =?utf-8?B?a0htLzRXSW4ySDh1VTFibzFaelhLeTV1eWM4ZTYwZzU0WnBTN2I0Ni81anZs?=
 =?utf-8?B?SnU2RzFKZUFmdzgvQldEamcxU3NKZkxoU2NEbytQOEZLNlRIVjZuZWZTT0NV?=
 =?utf-8?B?UUxiYVNTNGx4b3kwSElKdnlXUGtZY3pXa0ZTWnhjUFJtYWozeWlRdCtQdzRm?=
 =?utf-8?B?RS9yRW54N2NxdE8zV0JRSHlZTlk1ejlHY0VEK09CMHJ0cnlQRUh5V0s1eitV?=
 =?utf-8?B?bitGL21jRnZBWWxQU2JXMitheGNBbzRKSGpWQWtvcTFVSVRWQXFaOTdJSG5x?=
 =?utf-8?B?NFdaZEhCaGtBcGNPSGl4eDQyZHM0dXdCMGVobzlmQmpQTXRaUnlqTGNKZ1Ez?=
 =?utf-8?B?SStkZi8zM2RhUGg3YUt5engvSEN3NG52c01NRUltdUdCb2NJRVVEUmczTHFT?=
 =?utf-8?B?T1paemthTEk0RVlKL1ZmeHlQcWVqUmhXZFlVMk0rdGxFZTBpUG9icFM2OU0x?=
 =?utf-8?B?YU1mRTg4YnNJVHFmd09teDRUTE1xcUo3NnpTb0h2WmtrczlpcEQydlArOExz?=
 =?utf-8?B?VXluaVVBRno4ajVOd0VSVDdjZFFYYXZLd3NPZExjK2FWYjdIUCswWEptTDVH?=
 =?utf-8?B?K2lvR3BtUG53M1d5QzhNdmU5WWxLTE9DajFzdXlEUUdZOTBRUVAyVS9uaWlV?=
 =?utf-8?B?L1MvWEdPTndHS1U5MGJjVjNoK21Lekl4OHk4RzZuQ1JPM3FpZmp1TXhQOG05?=
 =?utf-8?B?WmhrR0N2T0hHRzBWbEl0N1FJblJYajRxY0Z2SkJRYlZaM3hBQUkzamsyVkdJ?=
 =?utf-8?B?YjlCbkNTK0hwc2ZyNUR4anRqa0xRdzV0RUt6QUxQTXVWMmlVSTZLek5JSi9X?=
 =?utf-8?B?ZDc2NmpSSFZTeGxVWGtWTmt4bS9TUnBRZTFrN0VoTGlPdVc4RnR4OGRIS0lJ?=
 =?utf-8?B?RkprQ2ZpWVVwamdwUUIwSy9sODYzV2NYak44alloVHBZdHFaQjRRRFhCUFh1?=
 =?utf-8?B?SnYyL21ucjRZaXJaM0NNWlJnd1RoaUJxQkFXSUpRYzFHbHdscDFaa0JGZ3Y3?=
 =?utf-8?B?T2RJNE5td0d6aHB1WmNlYnNjZGpieFZLVHllQ05sWVFWYWpZcGk1bEFCb1Nx?=
 =?utf-8?B?K2JOeUJ3K2dVT0VFa2hROWlDMXN1UHlmSHlrVnlBNFdLazNUbmNDcmRoTFBD?=
 =?utf-8?B?d2RmaXM2S01kaDFrUVNBY2ptM1krUzZ2cW1BVnNrMlA2VmRqaEdwUnVZTXlq?=
 =?utf-8?B?Mit5V3dwd1Q1NkxVVWhBNXAvcmF1Z090bTdPMFlQL055QllKcWROY2pZakxF?=
 =?utf-8?B?TFNpZmo2enVudHoyZjk3aS9zQXgrd1RXZUE3bXVCU2VzMTk4RWFTWUJVZkI3?=
 =?utf-8?B?NFlmaktLN0NCeEJxT1laOXBucmVjMExJelAzNmZhUEhVbFVKVENoK0Uwa0tG?=
 =?utf-8?B?ck8zRjgyUFhOTkc0Vmw3WkRZVncwSzVrZjBhMjE1cGx2S0htdllPRTR0WXZN?=
 =?utf-8?B?Sk0zMFFZTXVNVjFEcUpyandBbFc3TWtNejdCdFFnZlF0cGJzbnVVRDNwM0hZ?=
 =?utf-8?B?KzIvRXR4eGRmQXI2Yy9iMExPYXVqSXRyejBZeDRPZ2lhVEpaVWNCZnJYVzhm?=
 =?utf-8?B?MmpmaHp1K2FuYUYweWlrZWpyNGpzVWRTemZwbUl6TENnWnN5L1RobGpyR0xz?=
 =?utf-8?Q?YuwhMNtunWuK7ejL5qGRfNEUt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9631d9-ec35-4fe1-e6cd-08dd4a1eb2d3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 22:03:06.8471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acefmFx/tDzvLuRr7zKZh6EikG8AbGC25lp/6NRb91CeoFI9y6UPCXw+ZsjvGpPxBWW70+MYWXmktQI9KnDxwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5596
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



On 2025-01-13 03:18, Simon Ser wrote:
> This patch should probably come after all patches introducing the
> properties referenced in the docs, e.g. NEXT and COLOR_PIPELINE.
> Probably after "[13/45] drm/colorop: Introduce
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE"?
> 
>> +/**
>> + * DOC: overview
>> + *
>> + * A colorop represents a single color operation. Colorops are chained
>> + * via the NEXT property and make up color pipelines. Color pipelines
>> + * are advertised and selected via the COLOR_PIPELINE &drm_plane
>> + * property.
>> + *
>> + * A colorop will be of a certain type, advertised by the read-only TYPE
>> + * property. Each type of colorop will advertise a different set of
>> + * properties and is programmed in a different manner. Types can be
>> + * enumerated 1D curves, 1D LUTs, 3D LUTs, matrices, etc. See the
>> + * &drm_colorop_type documentation for information on each type.
> 
> It's not super nice to refer to internal kernel docs here, because AFAIU
> this section is mostly written towards user-space developers. User-space
> developers have no idea how internal kernel structs work.
> 
> It would be nicer to have a list of colorop types here, without referring
> to kernel internals. For instance, we have a list of 
> 

I'm not sure I follow. This is linking to the drm_colorop_type
(from drm_mode.h) enum documentation in drm-uapi.html.

Duplicating it here would mean that sooner or later the two
docs will get out of sync.

I agree with the rest and we'll reflect that in v8.

Harry

>> + * If a colorop advertises the BYPASS property it can be bypassed.
>> + *
>> + * Since colorops cannot stand-alone and are used to describe colorop
>> + * operations on a plane they don't have their own locking mechanism but
>> + * are locked and programmed along with their associated &drm_plane.
> 
> This sounds a bit too internal for overview docs - maybe should be in
> the struct drm_colorop docs instead?
> 
>> + * Colorops are only advertised and valid for atomic drivers and atomic
>> + * userspace that signals the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE client
> 
> Nit: this cap can be linkified with a "&".
> 
>> + * cap. When a driver advertises the COLOR_PIPELINE property on a
>> + * &drm_plane and userspace signals the
>> + * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE the driver shall ignore all other
>> + * plane color properties, such as COLOR_ENCODING and COLOR_RANGE.
> 
> Perhaps this should appear first in the doc? Start with instructions to
> enable, then describe how it works?
> 
>> + * More information about colorops and color pipelines can be found at
>> + * rfc/color_pipeline.rst.
> 
> Perhaps we should note that this document contains information about
> design/architectural decisions? The "reference" should be this section, the
> RFC doc is just about the motivation I believe. That is, if the API evolves,
> the RFC is unliekly to get updated, but this document will.

