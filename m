Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKMWBhJ9hGl/3AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 12:20:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C383DF1CB2
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 12:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E504910E875;
	Thu,  5 Feb 2026 11:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pVpUnWyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013027.outbound.protection.outlook.com
 [40.93.201.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E85910E86F;
 Thu,  5 Feb 2026 11:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPcPpqs0qWd6ApkAyrMSuDVZoyDMouM44OYjux6H3X1ZAuCEDSrTdnkLt2Al3zabtvLghPuzIQ0ZfbsbwL1MztPmvFOx21XIH+WwP8Zt4kH8hBN6fWWIJ2G6a6e+BSiP5jGVFCaWVEyMKjs1ZUTkyL/faibmFaENEXrl9quh2GhfgpxiaNd8JpEgBsPlX+hQwKrgKpjNa2kC8i/uNMxUK2g8oZPQLLHX7Y8P2agr8W2Xk3gaTXblqNyhlU2caR1mA8ww0THlGMhr00kcFbBVIFmPfdzbXEmFUGOM4rDR95Zix21MqZhC2VL6WXijDG9DmA5bzj1rEBHJDlSq/BY4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiCDtWV/mBkJHYnCYr3XysCgcRP8AwBhd/kGvb9UfO4=;
 b=QliihnfmpXaj0YEf4JHZxgeI49saW63rTnmTI/4m5GjqDE9/FDCk1RWHsxFMRAImtPYLJwpawJm/DBHl0BOcPF0KvhExTwypOoG90YbYa/xr1Kpcqshh4RPV8G2byF03j6KOJiYRmRZ98q+Bc5MwSti4JF5sj8Xjxrq7N+uaZoTIPwrfnaAb31Oa+YOYsp1fifu7Qr3UkrrFypvG9J3PLEwUH7/68rMBpv7cxFiVMvD8J7cXZ8yvMUiNaK4DWYYazDY1nylSQU0Nh2i8V+wHCh40nDY2M/HEMxUmdHejy9kdQzWLJ73EbQcJ/DN39q5FcU71Rm/SgiVqAr/N/bJ1uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiCDtWV/mBkJHYnCYr3XysCgcRP8AwBhd/kGvb9UfO4=;
 b=pVpUnWyt1RkgqrSkJc99J0JEa3sqgASe1y/ZjeKhAVzGaOwZlGj8NbJBBhH3LEtk3vVdc1VktDWPI4Ial/xwuJmPW9jTLS5aoZJNl2MfZbVU+vlDOG8NRTlsSzsgiiWLLNLti4noMPlNAyX3rFW8/veBe5f14z9tEyz90O6Q1l4F8VieQEyGdmUWnJwt59G3r36bcmGlmaKD1r/IaCcaTvqIEeF94gRtUvYNuOb5ghLFKuHNYlwtcaBM70Kjk/Xbo8VCR7pGnuaY1r6/1jcIImH3nFElR9GkKMbxv9j6TaFIVr2GxfVdNGntLhKv3kIQyNaGoKdbEMgfKFNyto0acA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH3PR12MB9430.namprd12.prod.outlook.com (2603:10b6:610:1cd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 11:20:36 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 11:20:36 +0000
Message-ID: <a1fa9630-2661-4a62-9b38-8154d8ef05b1@nvidia.com>
Date: Thu, 5 Feb 2026 22:20:31 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm: Fix a hmm_range_fault() livelock / starvation
 problem
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Alistair Popple <apopple@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Matthew Brost <matthew.brost@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20260205111028.200506-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260205111028.200506-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH3PR12MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f11047-523e-4ac1-7ff1-08de64a89597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnRFZDlPQ3VkSlFjT1ppbjFtRFd5S0I3VVplNjdMRklZVlp5L0xFZlBINWdS?=
 =?utf-8?B?dUFVZUJxdXEzR3UxSjVUczhZVTY1WW9kazMwOUV6OWZLaUUyQUFrSUtieXQv?=
 =?utf-8?B?OFY1dnJrd2xPY2h2cFZzcFlldzZBRzlSbkk4UDRGaWdodVh5K2thTkZHTzBD?=
 =?utf-8?B?WkJoZmZ4eUU5MVF4eWhPaHgxRm5JOGpIQ05GbDVpVlVhSkZWN25vcUpJd2xL?=
 =?utf-8?B?cG9WeGUrMmZwK0NRKzZRUHR5VDFPbUJOclh3YngwM3BlZjhKOHd0aVVTOEJ3?=
 =?utf-8?B?NXF3WkRqQzBZbXpTMzFLYmJZVVJEQkN5NTNibUpmbTRDbVZ3dDR1d29RZE9U?=
 =?utf-8?B?V2t6bmhjblNHZ1MyUS95UnlTOU9HTzI4SkF5eFc3U09pcHlZWG9CVXJLVndt?=
 =?utf-8?B?UDJyc0NnUThFV2NUWW15blFnbEVwNzJ1aVRUQnc3eXVmRWE2bUxzeTRNakVY?=
 =?utf-8?B?ZEZiSEozZml4bjdzakZkU0w2MUNGQXoyNDY4ekJKbGluOFdiU3hibVQ4RUdK?=
 =?utf-8?B?VzJ2ZGRnUXJPSkxSV1pmbDJMM3AyQ014UE5kQy90eEVGc1JET1diV0l1THJW?=
 =?utf-8?B?Q3JqbVEzcmhqUjVpTFIxUS9WNWJtMnd6Q0pxMXptT0UyVDhjUWlOdE51ZWlT?=
 =?utf-8?B?eDdEYmwxeGF0RVNiU1NnRko0YUJka25RTjAvc2g4SVo3cUEyM2pWZ28wN2Fn?=
 =?utf-8?B?TzczV3JZOFdGS2VGbXdwOUhSd25idmJQSXZhSy9pRHp0dTRTKzVMV0UzNXNw?=
 =?utf-8?B?OEROOEdYTFRFRlNiRTE0U2VGNEpkQThkWXJZd3NoajdITkl1cUZON2d1bDlu?=
 =?utf-8?B?UFpjQ1l5SGZFWVpmc0gra1ZUYWZYcGxLamlMWWJVTTNrNEpxbG5iT0JYNk5G?=
 =?utf-8?B?ZkRrMWw4dUEyaVdnQ3FLRmxxYUhkbzRUNzdqb1UrL3dmZjZUS2VaNW9RcXVJ?=
 =?utf-8?B?WjYrWVQ4YUpsWDZMVjBsZ2RaK2lVQzByeDIzNVQ5QWJJK3ZiVzVhaXYzaFJr?=
 =?utf-8?B?VmhuVmMyU296djhnUVNwd1RtY2N4UlI5dHRjeTd0Zzh0R3pHdldUWkdKZ0sr?=
 =?utf-8?B?NEVtWGc3VU4xTjNyL3pqUUt1YWpnZjdtSTVmQzJCbUZuUFlQalhoSDRpZzBz?=
 =?utf-8?B?cEJSN3JONmR6bk1ETjdvakRmaGRJbm5jU3ZqOHhGYmVNN1BHVTJTUU04QS9u?=
 =?utf-8?B?UG9aWURVUHMxMmNFNjJpemFGR2dHR0k4N0hjcXoxQmkwcUJCMTVYanAvTTBx?=
 =?utf-8?B?bW9FbFlkbXZHU29sQTVOdHBqSmdPS1VUcmFkc214RmdRTWpsMCt3OWVrODM3?=
 =?utf-8?B?aDdhOXk5N3hONmxJMlN4T2U2eTI0TFFoY3pJSDZnSFpZTWNmdmZyNk55eGZS?=
 =?utf-8?B?dUdEeHJWcGI1ekZhOFNERjdGdW5zTHpNU0E2NzlVYTQrYXlJUHBLUlRyblZt?=
 =?utf-8?B?Z3h1TFV2OURJWUFZeGw1bkgyQVpTNmVTZ25jZUlabTlWdyt3N05UQVZwT1Ny?=
 =?utf-8?B?VGpoVEdKWjN4WWNhMmFFUHFOQlZkWGdzeUFhTW44WVdkWUpwQVg5NUkzQUFT?=
 =?utf-8?B?WnlSQkM2SXIwTDQyR2RmdEljZktLMFptK1U4VUxWdTIvV1I1Y0psRnpldG9F?=
 =?utf-8?B?a0RvU2RqV29RWWVkYTN2VndPUmZQbEpXQ0JiL0x1WndCd0M1QUZUbFFKckNN?=
 =?utf-8?B?ZGZWR2lLRDFoRmltRHZHNmRFajdUQUhHdVFaOGNpRUl4MWZVS3p5ZlR1V3VP?=
 =?utf-8?B?N0FLYTdoeHlPK0NQeVJmalJiZ1pMalZHeTUzcXhqYjlkZjVWNHJOUHBGZnBt?=
 =?utf-8?B?bzRtV09UVkQxMDcrRXFHdTk0UllXNzNOYnd0RSsvOGxwMHZSNUZRMldadHlh?=
 =?utf-8?B?NXFWUk9DNk5Oc0hNeDc1cHJWOUN2eXFqM2lRU3J6TnNhaUtGNEJ4SnhhZ2ZM?=
 =?utf-8?B?Q3AvdjVMV3VQcXF1VHIySGJBTm1NKzEyVmk0dFl2QWl4VGt0MEFnakN4NEp1?=
 =?utf-8?B?QStPWkF6NFNIQzFiYzNzcml5b1NPVWlMdkZRc1YwYnJ6V2d2Z1prWFhSMEV5?=
 =?utf-8?B?aEtscmFQRnVzNzRWUFNwU3hDU0FSOWpyaUFoQVJ6RWZydlZmajVOTmljd05r?=
 =?utf-8?Q?SNb0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUNUTmgwak16d3lUL043MC9Ia1BhOFVHd2xyYTNQS1k4SUFvYXlzV09kcXNQ?=
 =?utf-8?B?SkNsWVVuaTVpM1BMMG1YZGxieGo4Q1E5dHdNOFBzUW9NbUNZZ21saE13UXRM?=
 =?utf-8?B?VUY2OEdaaXc4eU1YVXlCUFQ0d3FvbGlzeHZxaW80STZEL0s1WGhZSjRqTE15?=
 =?utf-8?B?Q245WEpaQjVKbmVpNEhvNUJhUlR0Rm8wRUZGYVNwZG5jY0MzRldWdGZuaHVi?=
 =?utf-8?B?QjdybzEybU1hRnJSMjU5Yk1BRkFobEtPb0dvWEVXZkJrZHZPZ1JOK1owVm84?=
 =?utf-8?B?aW1nWUM3UWRBd09ObzJhTW5UM2t0UWdteitHcHg5VWNIaDE0Nk5TaDJoN3lF?=
 =?utf-8?B?cnI0cXFjVWFkT0hrYlB3V1BDZjRzd0tVV2tGTnNQWlFuZ2xJRUhSUzU2c2Np?=
 =?utf-8?B?Zmh4L1Y0eFROYlRBdUpmMEdOUm4rUElCZnFKR0Y0dGdMU1VQOWNheEdWZTZa?=
 =?utf-8?B?bE51d0RhVlNtZ3FIc3I5QU5EZkNSQit1R2JZb2lQOHdLejZ6Vm1VeDhNN3RF?=
 =?utf-8?B?dlg3UVJaSFRJeXhDNGZTQXJaMzMycFJYdDVlVlJleDRsSkR4YTA0QSsxNWlP?=
 =?utf-8?B?SHIzNUNCOFFzOTdMc3FDK1BBeHNQdWl0OEExYnd4dWVNbVZyL0F4dlNpN2hC?=
 =?utf-8?B?VTAxOGcvZWZyL1p0YkJickh1d0w2aDVHNDZra2pwQ2FJV2Z5K0FEMDBUUDN4?=
 =?utf-8?B?YWdNdG4zODloWlN2NkZ4eER6aFMzSGlRVVdCanYwb3I1YTRFMDdiNUQ2c1h4?=
 =?utf-8?B?blRRYTdqek05Wkk5c3RqTVB6Z0F1WkY2cC9HT0VWT0RFa1pSZTkxcmlLa3Zl?=
 =?utf-8?B?RzVnNXJYTUpZUThhKzFrK3NHT3pjVTNRK3V6clhPVGo4ZGlTNXkvWE1iWHhp?=
 =?utf-8?B?VGlJekpTeDBXNkl4TWtoTnQwYzA2dHJ5UnBhR0ZDKzAybGdqUDYyU216eVZ1?=
 =?utf-8?B?cWgxakRXdU8rZnRSQUNoTnJ0bHlha2ZoUjVmY0M1WkQveDRXanJROTVVMG1Y?=
 =?utf-8?B?aEZtQ1RhZElOSGp2NmVTTkRjaXpyVkVXV2ZncWh0TWVEOUJaSklpcnFKTlVH?=
 =?utf-8?B?YXNMOE91eStRd3ZLbjJTWkNYWHd5QTlpRUNhdUdCTHptMnRJeE9WMGxXdGJs?=
 =?utf-8?B?b3dUQTJEdEcwSGNZcWpIc0VTNXhPNjVFQUpwSWtiUWNkRXRmYkZwN2JBOUhh?=
 =?utf-8?B?MmpFM2dpMldnUk9weUJDNkEvNjcvQnNFN084UVYxRCt6TWlRcmxNcjFkZ0Va?=
 =?utf-8?B?a1kzTE9mSTVuRVZUR0pDL2NkcGJWb2EvZ05OdHpLWGkyMDk3Q2U0TGtrbWR6?=
 =?utf-8?B?UElqczZ5djh0T25JTmxWWVhKSFlxT0xmdzkrZzRYNE9objY3MURXZTVkQ0JW?=
 =?utf-8?B?SkxtbE45NlplaFBXbVlqU2pZazliRktoeTFEY3ZrRlMrS2hqMlJtOWdzczJw?=
 =?utf-8?B?YXJYV2xpZlI4UXlmaEJaa1R3LzBXSFRGVytTdXcrL0dzcnRPL012OVh5UGhB?=
 =?utf-8?B?dlRsb1BrTy9RMzl5STJPS3JndVVSaGJVbWtqZlhMOG9uRWtUYU16cFJzUDVv?=
 =?utf-8?B?TnZXYW5ONW9SZWxiUDN2T3QzSGhMTXFuVU4vTkhmVzdtQWlBdGhBV2ZnTHVC?=
 =?utf-8?B?dmtWdmNydzZaQU5HSm5BWW1ydThLTDdadGxudGNFODk3UVRPTEdkWUtSWTJQ?=
 =?utf-8?B?UTZ3Q1RyM2ZRNmd2NktBcHlLYi9tZ0RLb2pLNU9Bek1yOS9MWDBpN0p3QzVi?=
 =?utf-8?B?T1FhYStiUkhPSXlaS3BKMURPVFIvVzNIR2UvS2hJT3VUbG1pci93QzU5YmY5?=
 =?utf-8?B?SDlHdTg2eWtWQmdhNGNwNDlGTHBPSHY2VUhFUEUwdHRPUG9LM1RxZVFLMjhB?=
 =?utf-8?B?OEtMQWpXYU14R1Jya0tHNDBBUkZCU044QVFOZUtnL0ZRci96RnBNbGZvNzNL?=
 =?utf-8?B?bW1obUxyelRsbFJFam1WNVdUclZmNVQyOWd0VFZVSElEUnJoUVZjaWlKakxM?=
 =?utf-8?B?bWZiRWtHeVY3eE5udTVGM3JRdGVRVHVleWlpMmJxTjdnanV2ckNFZjE1c0k4?=
 =?utf-8?B?TnFGTGhZR1FTOXVGZkVJQ3prenIvWXhlcENHU0NnRG4zMmFWalpYdm5iOGNG?=
 =?utf-8?B?MkRWd0d5SHFWNkRRNmJXRmtXUTZIZ3VxSEFhbDBKK0xYOHdSVTBGakM5aEJp?=
 =?utf-8?B?bVQ5T1BNbm1QaVM1MG8zcWdFSE9CV3Jaa2tacGFHZVRQT1p1YVMvQ1JsYjlX?=
 =?utf-8?B?cG9XT3h0R0F3aUJRYnpWZHhsOEpVU0Z0N1VpZmlFLzA4RnZOSEhZbFFLVkNB?=
 =?utf-8?B?R3U1TFA3MFdsSkcvWHdQQW9pLy9uZkVMcXlhclBhV2x5Wk9UUXZ5VjUwclF3?=
 =?utf-8?Q?uR2+ir6HvpHmYr8Mdl9PP7tIoSawHecJVEYvaDox+CZ+c?=
X-MS-Exchange-AntiSpam-MessageData-1: gMzWXmWopVFPog==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f11047-523e-4ac1-7ff1-08de64a89597
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 11:20:36.2094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TurRzqLyVhVtNYBeHfii3kqK7ivfq04ahU76XS33mLxYfnqazw9XIWoBruJVJwulAViX9BfL94BXtwoO8kguw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9430
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balbirs@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:email,intel.com:email,mellanox.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux-foundation.org:email,kvack.org:email,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,lst.de:email,lists.freedesktop.org:email];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: C383DF1CB2
X-Rspamd-Action: no action

On 2/5/26 22:10, Thomas Hellström wrote:
> If hmm_range_fault() fails a folio_trylock() in do_swap_page,
> trying to acquire the lock of a device-private folio for migration,
> to ram, the function will spin until it succeeds grabbing the lock.
> 
> However, if the process holding the lock is depending on a work
> item to be completed, which is scheduled on the same CPU as the
> spinning hmm_range_fault(), that work item might be starved and
> we end up in a livelock / starvation situation which is never
> resolved.
> 
> This can happen, for example if the process holding the
> device-private folio lock is stuck in
>    migrate_device_unmap()->lru_add_drain_all()
> The lru_add_drain_all() function requires a short work-item
> to be run on all online cpus to complete.
> 
> A prerequisite for this to happen is:
> a) Both zone device and system memory folios are considered in
>    migrate_device_unmap(), so that there is a reason to call
>    lru_add_drain_all() for a system memory folio while a
>    folio lock is held on a zone device folio.
> b) The zone device folio has an initial mapcount > 1 which causes
>    at least one migration PTE entry insertion to be deferred to
>    try_to_migrate(), which can happen after the call to
>    lru_add_drain_all().
> c) No or voluntary only preemption.
> 
> This all seems pretty unlikely to happen, but indeed is hit by
> the "xe_exec_system_allocator" igt test.
> 

Do you have a stack trace from the test? I am trying to visualize the
livelock/starvation, but I can't from the description.

> Resolve this by waiting for the folio to be unlocked if the
> folio_trylock() fails in the do_swap_page() function.
> 
> Rename the migration_entry_wait_on_locked() function to
> softleaf_entry_wait_unlock() and update its documentation to
> indicate the new use-case.
> 
> Future code improvements might consider moving
> the lru_add_drain_all() call in migrate_device_unmap() to be
> called *after* all pages have migration entries inserted.
> That would eliminate also b) above.
> 
> v2:
> - Instead of a cond_resched() in the hmm_range_fault() function,
>   eliminate the problem by waiting for the folio to be unlocked
>   in do_swap_page() (Alistair Popple, Andrew Morton)
> v3:
> - Add a stub migration_entry_wait_on_locked() for the
>   !CONFIG_MIGRATION case. (Kernel Test Robot)
> v4:
> - Rename migrate_entry_wait_on_locked() to
>   softleaf_entry_wait_on_locked() and update docs (Alistair Popple)
> 
> Suggested-by: Alistair Popple <apopple@nvidia.com>
> Fixes: 1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jason Gunthorpe <jgg@mellanox.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: linux-mm@kvack.org
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.15+
> Reviewed-by: John Hubbard <jhubbard@nvidia.com> #v3
> ---
>  include/linux/migrate.h |  8 +++++++-
>  mm/filemap.c            | 15 ++++++++++-----
>  mm/memory.c             |  3 ++-
>  mm/migrate.c            |  8 ++++----
>  mm/migrate_device.c     |  2 +-
>  5 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 26ca00c325d9..3cc387f1957d 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -65,7 +65,7 @@ bool isolate_folio_to_list(struct folio *folio, struct list_head *list);
>  
>  int migrate_huge_page_move_mapping(struct address_space *mapping,
>  		struct folio *dst, struct folio *src);
> -void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
> +void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
>  		__releases(ptl);
>  void folio_migrate_flags(struct folio *newfolio, struct folio *folio);
>  int folio_migrate_mapping(struct address_space *mapping,
> @@ -97,6 +97,12 @@ static inline int set_movable_ops(const struct movable_operations *ops, enum pag
>  	return -ENOSYS;
>  }
>  
> +static inline void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
> +	__releases(ptl)
> +{
> +	spin_unlock(ptl);
> +}
> +
>  #endif /* CONFIG_MIGRATION */
>  
>  #ifdef CONFIG_NUMA_BALANCING
> diff --git a/mm/filemap.c b/mm/filemap.c
> index ebd75684cb0a..d98e4883f13d 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -1379,14 +1379,16 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
>  
>  #ifdef CONFIG_MIGRATION
>  /**
> - * migration_entry_wait_on_locked - Wait for a migration entry to be removed
> - * @entry: migration swap entry.
> + * softleaf_entry_wait_on_locked - Wait for a migration entry or
> + * device_private entry to be removed.
> + * @entry: migration or device_private swap entry.
>   * @ptl: already locked ptl. This function will drop the lock.
>   *
> - * Wait for a migration entry referencing the given page to be removed. This is
> + * Wait for a migration entry referencing the given page, or device_private
> + * entry referencing a dvice_private page to be unlocked. This is
>   * equivalent to folio_put_wait_locked(folio, TASK_UNINTERRUPTIBLE) except
>   * this can be called without taking a reference on the page. Instead this
> - * should be called while holding the ptl for the migration entry referencing
> + * should be called while holding the ptl for @entry referencing
>   * the page.
>   *
>   * Returns after unlocking the ptl.
> @@ -1394,7 +1396,7 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
>   * This follows the same logic as folio_wait_bit_common() so see the comments
>   * there.
>   */
> -void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
> +void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
>  	__releases(ptl)
>  {
>  	struct wait_page_queue wait_page;
> @@ -1428,6 +1430,9 @@ void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
>  	 * If a migration entry exists for the page the migration path must hold
>  	 * a valid reference to the page, and it must take the ptl to remove the
>  	 * migration entry. So the page is valid until the ptl is dropped.
> +	 * Similarly any path attempting to drop the last reference to a
> +	 * device-private page needs to grab the ptl to remove the device-private
> +	 * entry.
>  	 */
>  	spin_unlock(ptl);
>  
> diff --git a/mm/memory.c b/mm/memory.c
> index da360a6eb8a4..20172476a57f 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  				unlock_page(vmf->page);
>  				put_page(vmf->page);
>  			} else {
> -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +				pte_unmap(vmf->pte);
> +				softleaf_entry_wait_on_locked(entry, vmf->ptl);
>  			}
>  		} else if (softleaf_is_hwpoison(entry)) {
>  			ret = VM_FAULT_HWPOISON;
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 4688b9e38cd2..cf6449b4202e 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -499,7 +499,7 @@ void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
>  	if (!softleaf_is_migration(entry))
>  		goto out;
>  
> -	migration_entry_wait_on_locked(entry, ptl);
> +	softleaf_entry_wait_on_locked(entry, ptl);
>  	return;
>  out:
>  	spin_unlock(ptl);
> @@ -531,10 +531,10 @@ void migration_entry_wait_huge(struct vm_area_struct *vma, unsigned long addr, p
>  		 * If migration entry existed, safe to release vma lock
>  		 * here because the pgtable page won't be freed without the
>  		 * pgtable lock released.  See comment right above pgtable
> -		 * lock release in migration_entry_wait_on_locked().
> +		 * lock release in softleaf_entry_wait_on_locked().
>  		 */
>  		hugetlb_vma_unlock_read(vma);
> -		migration_entry_wait_on_locked(entry, ptl);
> +		softleaf_entry_wait_on_locked(entry, ptl);
>  		return;
>  	}
>  
> @@ -552,7 +552,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
>  	ptl = pmd_lock(mm, pmd);
>  	if (!pmd_is_migration_entry(*pmd))
>  		goto unlock;
> -	migration_entry_wait_on_locked(softleaf_from_pmd(*pmd), ptl);
> +	softleaf_entry_wait_on_locked(softleaf_from_pmd(*pmd), ptl);
>  	return;
>  unlock:
>  	spin_unlock(ptl);
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 23379663b1e1..deab89fd4541 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -176,7 +176,7 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>  		}
>  
>  		if (softleaf_is_migration(entry)) {
> -			migration_entry_wait_on_locked(entry, ptl);
> +			softleaf_entry_wait_on_locked(entry, ptl);
>  			spin_unlock(ptl);
>  			return -EAGAIN;
>  		}

Balbir
