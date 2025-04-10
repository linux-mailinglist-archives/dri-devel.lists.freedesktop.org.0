Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56482A84C70
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 20:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CAE10E38B;
	Thu, 10 Apr 2025 18:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HtpGdqdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D5D10E388;
 Thu, 10 Apr 2025 18:52:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0dCvjVWiYHkab22udgLWcDEoJnkPsHmK5ZcqNHUeM9YRXthDlj18xuZn8Sg3DjDZ+vXUPhsTo+hj9v4wwrVQu5KHreg0VXOn+fG3EMatafz5WfX4qraipsPhDExwBPGNCdcuZZd84G44NZ/TvGzYVlPzDwPUKhrHHjesUU3Z3N2baNVYy5A2+O6zBGigofaZsatNF4eqWEloJZ9RwyhyP7M+Xi2f6ccYYI+ntyizRtQaA4QOAGIflaPNnaE+b+8g6DNW4pP2vFs+oG1eIcIWQlnSDiWU3D/LZn6UZNMNngXdrsz0Hhx/d/BOg157GvDb8UJDeanwk1rf1ZOBCujdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mUoOBDztqcWVXQJS60m9WuO/yWB1y4RKG2FeJbyZbo=;
 b=Zx+UNFdzcSg7e51W7rKFiImlRJAJYx6iKD0QWEi1ivfBx+wOmEW/5nQilEARECllRIAIDzz/ORbtMbWzoERA26PwxDqIHnOblsY+GU+8BJ1vn5D/BGBVmPNGoj0BIwQDcadBQz3covJMGkOgr5iMUi2XVu6VhQFbmJsoQrDPckyrkdynJarFhUSUcQLESoaXJCyYbQ/MRXKaz0lR2xjaAOUnDdyDCroggh4Hot1rfAgo/5MjjamEbz0MmGwNxiZNMZTYXezHqTY6IXlL0eRdlvNItdQdaNE0zCHG/9f6p9ezdK189juuB8of/aPlge/+0FeSAft3HiH7JYQe+MwNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mUoOBDztqcWVXQJS60m9WuO/yWB1y4RKG2FeJbyZbo=;
 b=HtpGdqdygrCg2QRTT0x7/kBMXXs5pDBxhT5GxJx/Bf9JwTW+iebMd01+vK+pE4GOLuNwdBsPD9q5Q/Ns4M3V07U0r7BwDjxoIJj2PBdvUcSMtczCSrxa+yCCV4IXcmrAbOdI1MqLIR52CvP+MAVI4w1bYieOMsSbks1Xf6SmbS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5788.namprd12.prod.outlook.com (2603:10b6:208:377::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Thu, 10 Apr
 2025 18:52:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 18:52:33 +0000
Content-Type: multipart/alternative;
 boundary="------------m3t13btmtnSzsmmrXAsSavxU"
Message-ID: <bb182577-f1fc-4305-9f12-09aa73b726b3@amd.com>
Date: Thu, 10 Apr 2025 20:52:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250410192054.24a592a5@collabora.com>
X-ClientProxiedBy: FR4P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9493ba-2cc8-4930-3d5d-08dd7860da6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SStEemlqQkx3V24xajh2Tk9ReVNweElackZVV3FZOS91TjVSR0J4a0hqMVFZ?=
 =?utf-8?B?T2tRWE9uaysrNzhCU2pRRUp0aHJhaXQ2UGUxMG1nNzNBSFo2cWIxZWd3cEF6?=
 =?utf-8?B?TStJNnFNaGZJK29CVXJvRVMrL3p6Y2ZiNTYrVnl4UUtRN0Q2NUorakNIdWxP?=
 =?utf-8?B?czJtRHZCR3c3dW9tV1JFQ3ZFU1hVVEtTbHc3U3ZrcDFhUkVyUzI3Y0ZGV3V6?=
 =?utf-8?B?SHdFY3lqbmVlT2JwQVFwaHhYSDZuS3YySE5sNTByTjdFYnovd3JLb05BZzlo?=
 =?utf-8?B?eXh1YWtQZnl2NmtCbW94cnZKdHBJWmVNTjM4ME9SSk5iZW5mbmtNa0pzckFM?=
 =?utf-8?B?Q0pBTmZaOUhWamdrajRrT2dyVlFtMFhvbHJTdVFqQjIwTEpBa2c3eXkwWUJ5?=
 =?utf-8?B?NDdvNWpUcWtXMjhjK2pCRXAwYWFCTXhpM05vYm13RmRscjVsdUJ0R2RGYndh?=
 =?utf-8?B?aWRsU2Z6UmZKcUJYL0tZS29PNUI4KzZkOEFlOE9xZDNHeFFwT2FMYmxwOHdX?=
 =?utf-8?B?WU8wci9RRmwrcXlNMitPK2ZCRXo1a3YyMHowQWcySGtHYjIxZHVqdDhNOWNv?=
 =?utf-8?B?SlZIWndwRDBWeTBLNmQzc0FpZi9rdVQ2Wis2YlNDNU1zVTVZaGlTNnhCeVNi?=
 =?utf-8?B?dzkwZU1leDM4YlRrVUxORDl1cG5mazB1ZS9uRmxVZW0rQnBkVGUxSEJqc0Rw?=
 =?utf-8?B?dDkwSkVGb0l4R1Y3SVNIUGNvNTJHT2ZDRGNsdkMxV2NKaFMydnRnbHVPMS9X?=
 =?utf-8?B?RENtbVpyWExXaEErZGJvZ2FyTTFYWGs0S3dYc1RtbmVXZFRkWTh3SGljZ1Bz?=
 =?utf-8?B?Z3N0aXUzMnYxNkI3Y21qNUIrTDBiV2NydDlaem9yQzB0ZlplMFlNL0xBWFRk?=
 =?utf-8?B?bE5yUGF3NytBbzlGNUFlSE9hOTQ3cEtqRUtsWXpocjZaV0I1MVFlb0dFSlVP?=
 =?utf-8?B?SnBDTjdDb0N2cENrczRsUk1UWktvV09xZWFmYlJqWEhtb3hJOGtZd3MzYWhx?=
 =?utf-8?B?c3V6S0ZSR1kxOTBaTnF4K1VpancwcEdkbmNOakU2K0YwSWJxWXRsWGxqMUtF?=
 =?utf-8?B?VzhwM05HdUFiRkxRc2pPYXVnWmRBL05xY3FEZnFwczlZNTBYOGRXZWVNSDdF?=
 =?utf-8?B?UEdEL1ZwbXpzUENEVnFqOVIvT2YvdlF6Yk1MMXBYTEc5d1c4aTU3TmdxYjhF?=
 =?utf-8?B?Z3JDSGNnbDRueUhRaGlMUlZqK0Yrakp3NVFXMm5NMGdITWhwbU0vekUzcEVs?=
 =?utf-8?B?N1d5eTRMMW4yVysxa0oxWGhHYmphMVRIUDk0cmZXZEptSnBaeXdlZTkrRUdx?=
 =?utf-8?B?VysweHJ1R2pSUHN4NFdqc3FheTJFeTBnWkJTUjR2dythSlFnL0t3S2Z0dXNC?=
 =?utf-8?B?bVpNVGxjVGVGNjcwRGFqWWlNbTNVR0d1M3ZaVm8xR3p6OEprQjBzOFF2c3k5?=
 =?utf-8?B?WnhHWUJvcVFnNkFnRVhIRStBSmpVTm05czRhTG0xY09oblQ1YkR1dVFSb0FB?=
 =?utf-8?B?b3dkWDJ6UmdIZ3dZc0JvdlVkT1F0MUZZM2Y4T3ZZQmRoaW9jTjZjdHNFNUtU?=
 =?utf-8?B?MEZpTlJWRGtlMWhTVjVpMU1RRXpRN2h2WFBoVEZtVjFrRlJUY1NxM29XTkFL?=
 =?utf-8?B?MzB3b3E4T3VKY1RrdEx5bis2WlVvN2JRN0s1bTkxakdCdDBBMU9sTkNzanhs?=
 =?utf-8?B?V1k0R3E4ZFVQR3BxVXVCZDl1UjZjZlpMUmtxNU5zaENkWWUwckZhYlFDbTdZ?=
 =?utf-8?B?b2huOGE4WFZUUXJObVdsVThEbTJOc2VWbTYrOTkrcTBHSld0eThDKzMvc2Nk?=
 =?utf-8?B?NEkrQkZyKzAwMkFuRndIOW9SL1J5L2wvUVlCZFRWVHNDQkNRUTRVM3prQ2xh?=
 =?utf-8?Q?3jGYTjjtQqmo4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUNQRUJ4WWlQL1JoQ2I1dXU2dDM1OENtUkZ4QSs1WjhxSmx5UTJFRVVSbWZz?=
 =?utf-8?B?ZkszU0IvWEJLWVJPdi9CcDRmVUdHR3VaYkFqdGE4VUVlNW96dVY2eEMvdUts?=
 =?utf-8?B?by92YmFQZGFmd0lKSlJ1L1dIaW1KdUMwVUNhRTB2Mjd3cjI0L0FMUDJBdmN0?=
 =?utf-8?B?NjBpYUlGb0tBbFRzTzhteGZiTXZHSGY2VGljS1B6Z0E2czZ3K0lCcHMySkZN?=
 =?utf-8?B?NWJxdEV0VGRWbzlPQVlLem5DVU9zb3NWSnk5R250S3hLYUtxZ0twWFgxbE56?=
 =?utf-8?B?UG9ERVR6ZE5yd2pvd3FIWDdSamRUUkdjc05DYVBIM2s2ZGpUZlh4OWFyUGpz?=
 =?utf-8?B?VmNWZy9CU2c2cHBJcXg5NU9Xak5kL2luZFFrcVUwd3g4TW1naDA1ZGpaNmU2?=
 =?utf-8?B?MGx2d3crNmlYOHArL0pMcUcvRU1DaytWMXRjcUxjemNXTGcyVHV3YjVHZEVm?=
 =?utf-8?B?MWFhYUVuQTROeC85eS92ZjZoNTVnS0lEZk1CbGVVVEJBM0IzcE16bTFnbTRZ?=
 =?utf-8?B?QUxhenBmVzI5R0hvanh1a3B0am5ucEwzVFM2NU8rQnlwdUw2T3FoNGw1WnB5?=
 =?utf-8?B?dWhNRWdLbFlySFFRN05Ud05lamplcnUxc216dm1iMXJiSGtGZ045aTVjaTNG?=
 =?utf-8?B?MHFSRkhhWHV5RUJadmJobkwzTW1raHZPYzBLb2pmRmpZNk9DOHBaS3lZalV0?=
 =?utf-8?B?V0RKT0VBWkFBZHFTZjV3MlFlWGhYOWVRQ20rWG9nNm1UTEMrVlJXN1J2Ynpn?=
 =?utf-8?B?bjBHWHBsSzVTeXhaNG9uSzREUFBIM0VOQWJEdzB2bmtuSDBPWXBKaG1XdkJI?=
 =?utf-8?B?TWZhVzAxOXVNQzlZRUk5ZngrZExuc0xzQmw5M1VIMFBuNkpUQ2NYVjNGNjgx?=
 =?utf-8?B?eWVxdzVnYmFGQ2I4VERPQWRTaXNyVWJJZ3pJdlI3UWNZMU82NDJ1aFF3anVt?=
 =?utf-8?B?NjVnd3ppU05JSFRVSkpvVVdKQy8vQVJQVy9JZFNqWHF2SWM2TXZvSm1Ea05W?=
 =?utf-8?B?eUF3T2JtYlp2RStoNWFtWlhzMmluVjhldDRZZGJaVjVoZDZlRzd6K010eHhG?=
 =?utf-8?B?MEVvTGZNMDBmdDdLNStLOW56UXcxeDRPbW5HUiswUHpFeGpSdzVaVU5weVlV?=
 =?utf-8?B?MHZBOTU4b1pXTXY1aXRFWWpGcWRlYk4vU2grc21NelRFQXpTY3RCZE5FY1Zx?=
 =?utf-8?B?SHhIcy9oRHBTdW10Z1k5cldsbVhKYmRXZW9tc3o0SFN1SGhQc2diRk1CNnpj?=
 =?utf-8?B?TVljQlA1L1dJblIyc21ST3lsdS9KdmdDcXhmQzNVbEFDVjhUOHkxZXc1eisv?=
 =?utf-8?B?UGtyMnVMbEVlTGRLOFlET1lqWEVJMmJQSGdraDBsRkxZcktKelhRRE10d0o4?=
 =?utf-8?B?Z1VpaEhvZE9iaXJOc2lvSHFacjhXby9md0lxL01BK1krVHV3UnMzaTlRRHlQ?=
 =?utf-8?B?R2FiWGk0V0UveDBVVlM2aW90NUFiWWRKdkhhL2NYbm9jb0hPQWFKajF3bEhK?=
 =?utf-8?B?MFVxZzFFTjdSVjhtZzQ3OGhGa3BwaWpXOGFkS0htUmJDcWJHNHE0eDU0dmJn?=
 =?utf-8?B?ZWdObVU2ZUNFSmlWY3hhZzVpbzVYL2NUWHJFcGVsRVY3eHM0RWpqU0JKY0pq?=
 =?utf-8?B?TmM0NmtYTUVMZTlWK1RWWExyYnZkdzhMTUd3a0FoKzhycmNwNDk2OWNUUnRP?=
 =?utf-8?B?YzlwUEJyVHFTek5DZDRkRmJxQ0VNcDRHaExvL2R1N1Nua1A0U1dqVmtnQkhR?=
 =?utf-8?B?MlRWZWYxZjdTcDRoeldFVTliK2Q0eUd1WFF5ZlVxVFlnLzJEUU10clRSK2hX?=
 =?utf-8?B?cXB1dGhyMUkxZUZseUFTV21EbDFHQjN3OWhuTzJJZmFSOGFsdlp0TzlscUxl?=
 =?utf-8?B?ZWV3OHpoSDgrbXhXYXJUZTR2cFphcE5sdWNSOVZQOEw0a3g5a2dDbkVKZ25i?=
 =?utf-8?B?ZERQV0hZLzJjY1VlZU9RbmpRenRLOWMzbGs2VGpvcTh5UDVuYkovY2szQTZY?=
 =?utf-8?B?RGJIWThxNGxDc1dxV3MveGRHNmxkTTNiVWs2MVdSUlFkdGpTZ0NUZ3hyNFlp?=
 =?utf-8?B?NEd2YjZYTkNUbDR1L0NkV1RxTEFLblFncDIyazM2cW5HNHRhdVhtSnVCbjZX?=
 =?utf-8?Q?WAmf+1cv/gc7TA3sxKjr2UsJW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9493ba-2cc8-4930-3d5d-08dd7860da6c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:52:33.4483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lzf8MGh+kbPSBWVHLAUI571kNK+ROETa/BcWiHxtpS5/75NpErcYtI09MPX1VlXv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5788
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

--------------m3t13btmtnSzsmmrXAsSavxU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 10.04.25 um 19:20 schrieb Boris Brezillon:
> [SNIP]
>>>> Faulting is only legal when you have something like HMM, SVM or
>>>> whatever you call it. And then you can just use a plain shmem
>>>> object to provide you with backing pages.
>>>>
>>>> I mean we could in theory allow faulting on GEM objects as well,
>>>> but we would need to take very strict precautions on that we
>>>> currently don't have as far as I know.  
>>> We only use this mechanism for very specific allocations: tiler
>>> memory whose maximum size can't be guessed upfront because tile
>>> binning is by nature unpredictible.
>>>  
>>>> So could you explain how this works in the first place?  
>>> I can explain you how this works in Panthor, yes. You get an initial
>>> amount of memory that the tiler can use, when it runs out of
>>> memory, it will first ask the system for more memory, if the
>>> allocation fails, it will fallback to what they call "incremental
>>> rendering", where the already binned primitives are flushed to the
>>> FB in order to free memory, and the rendering starts over from
>>> there, with the memory that has been freed.
>>>
>>> In Panthor, this on-demand allocation scheme is something that
>>> allows us to speed-up rendering when there's memory available, but
>>> we can make progress when that's not the case, hence the failable
>>> allocation scheme I'm proposing here.  
>> Puh, that sounds like it can potentially work but is also very very
>> fragile.
>>
>> You must have a code comment when you select the GFP flags how and
>> why that works.
> +	/* We want non-blocking allocations, if we're OOM, we just fail the job
> +	 * to unblock things.
> +	 */
> +	ret = drm_gem_shmem_sparse_populate_range(&bo->base, page_offset,
> +						  NUM_FAULT_PAGES, page_gfp,
> +						  __GFP_NORETRY | __GFP_NOWARN);
>
> That's what I have right now in the failable allocation path. The
> tiler chunk allocation uses the same flags, but doesn't have a
> comment explaining that a fallback exists when the allocation fails.

We agreed to use GFP_NOWAIT for such types of allocations to at least wake up kswapd on the low water mark.

IIRC even using __GFP_NORETRY here was illegal, but I need to double check the discussions again.

From the comment this at minimum needs an explanation what influence this has on the submission and that you can still guarantee fence forward progress.

>>> In Panfrost and Lima, we don't have this concept of "incremental
>>> rendering", so when we fail the allocation, we just fail the GPU job
>>> with an unhandled GPU fault.  
>> To be honest I think that this is enough to mark those two drivers as
>> broken.  It's documented that this approach is a no-go for upstream
>> drivers.
>>
>> How widely is that used?
> It exists in lima and panfrost, and I wouldn't be surprised if a similar
> mechanism was used in other drivers for tiler-based GPUs (etnaviv,
> freedreno, powervr, ...), because ultimately that's how tilers work:
> the amount of memory needed to store per-tile primitives (and metadata)
> depends on what the geometry pipeline feeds the tiler with, and that
> can't be predicted. If you over-provision, that's memory the system won't
> be able to use while rendering takes place, even though only a small
> portion might actually be used by the GPU. If your allocation is too
> small, it will either trigger a GPU fault (for HW not supporting an
> "incremental rendering" mode) or under-perform (because flushing
> primitives has a huge cost on tilers).
>
> Calling these drivers broken without having a plan to fix them is
> also not option.

Yeah, agree we need to have some kind of alternative. It's just that at the moment I can't think of any.

>>> And that's how it is today, the
>>> alloc-on-fault mechanism is being used in at least 3 drivers, and
>>> all I'm trying to do here is standardize it and try to document the
>>> constraints that comes with this model, constraint that are
>>> currently being ignored. Like the fact allocations in the fault
>>> handler path shouldn't block so we're guaranteed to signal the job
>>> fence in finite time, and we don't risk a deadlock between the
>>> driver shrinker and the job triggering the fault.  
>> Well on one hand it's good to that we document the pitfalls, but I
>> clearly think that we should *not* spread that into common code.
> Ack on not encouraging people to use that; but having a clear path
> describing how this should be done for HW that don't have other
> options, with helpers and extensive doc is IMHO better than letting
> new drivers reproduce the mistake that were done in the past.
> Because, if you tell people "don't do that", but don't have an
> alternative to propose, they'll end up doing it anyway.

Just to be clear: We have already completely rejected code from going upstream because of that!

And we are not talking about anything small, but rather a full blown framework and every developed by a major player.

Additional to that both i915 and amdgpu had code which used this approach as well and we reverted back because it simply doesn't work reliable.

>> That would give the impression that this actually works and to be
>> honest I should start to charge money to rejecting stuff like that.
>> It would probably get me rich.
>>
>>> I'm well aware of the implications of what I'm proposing here, but
>>> ignoring the fact some drivers already violate the rules don't make
>>> them disappear. So I'd rather work with you and others to clearly
>>> state what the alloc-in-fault-path rules are, and enforce them in
>>> some helper functions, than pretend these ugly things don't exist.
>>> :D  
>> Yeah, but this kind of says to others it's ok to do this which
>> clearly isn't as far as I can see.
> Not really. At least not if we properly review any driver that use
> these APIs, and clearly state in the doc that this is provided as a
> last resort for HW that can't do without on-fault-allocation, because
> they are designed to work this way.
>
>> What we should do instead is to add this as not ok approaches to the
>> documentation and move on.
> Well, that's what happened with panfrost, lima and panthor, and see
> where we are now: 3 drivers that you consider broken (probably
> rightfully), and more to come if we don't come up with a plan for HW
> that have the same requirements (as I said, I wouldn't be surprised
> if most tilers were relying on the same kind of on-demand-allocation).

Well we have HW features in major drivers which we simply don't use because of that.

> As always, I appreciate your valuable inputs, and would be happy to
> try anything you think might be more adapted than what is proposed
> here, but saying "this is broken HW/driver, so let's ignore it" is
> not really an option, at least if you don't want the bad design
> pattern to spread.

Yeah, I'm not sure what to do either. We *know* from experience that this approach will fail.

We have already tried that.

Regards,
Christian.


>
> Regards,
>
> Boris

--------------m3t13btmtnSzsmmrXAsSavxU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 10.04.25 um 19:20 schrieb Boris Brezillon:<br>
    <blockquote type="cite" cite="mid:20250410192054.24a592a5@collabora.com">[SNIP]<span style="white-space: pre-wrap"> </span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap=""></pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Faulting is only legal when you have something like HMM, SVM or
whatever you call it. And then you can just use a plain shmem
object to provide you with backing pages.

I mean we could in theory allow faulting on GEM objects as well,
but we would need to take very strict precautions on that we
currently don't have as far as I know.  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">We only use this mechanism for very specific allocations: tiler
memory whose maximum size can't be guessed upfront because tile
binning is by nature unpredictible.
 
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">So could you explain how this works in the first place?  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I can explain you how this works in Panthor, yes. You get an initial
amount of memory that the tiler can use, when it runs out of
memory, it will first ask the system for more memory, if the
allocation fails, it will fallback to what they call &quot;incremental
rendering&quot;, where the already binned primitives are flushed to the
FB in order to free memory, and the rendering starts over from
there, with the memory that has been freed.

In Panthor, this on-demand allocation scheme is something that
allows us to speed-up rendering when there's memory available, but
we can make progress when that's not the case, hence the failable
allocation scheme I'm proposing here.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Puh, that sounds like it can potentially work but is also very very
fragile.

You must have a code comment when you select the GFP flags how and
why that works.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
+	/* We want non-blocking allocations, if we're OOM, we just fail the job
+	 * to unblock things.
+	 */
+	ret = drm_gem_shmem_sparse_populate_range(&amp;bo-&gt;base, page_offset,
+						  NUM_FAULT_PAGES, page_gfp,
+						  __GFP_NORETRY | __GFP_NOWARN);

That's what I have right now in the failable allocation path. The
tiler chunk allocation uses the same flags, but doesn't have a
comment explaining that a fallback exists when the allocation fails.</pre>
    </blockquote>
    <br>
    We agreed to use GFP_NOWAIT for such types of allocations to at
    least wake up kswapd on the low water mark.<br>
    <br>
    IIRC even using __GFP_NORETRY here was illegal, but I need to double
    check the discussions again.<br>
    <br>
    From the comment this at minimum needs an explanation what influence
    this has on the submission and that you can still guarantee fence
    forward progress.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250410192054.24a592a5@collabora.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">In Panfrost and Lima, we don't have this concept of &quot;incremental
rendering&quot;, so when we fail the allocation, we just fail the GPU job
with an unhandled GPU fault.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
To be honest I think that this is enough to mark those two drivers as
broken.&nbsp; It's documented that this approach is a no-go for upstream
drivers.

How widely is that used?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It exists in lima and panfrost, and I wouldn't be surprised if a similar
mechanism was used in other drivers for tiler-based GPUs (etnaviv,
freedreno, powervr, ...), because ultimately that's how tilers work:
the amount of memory needed to store per-tile primitives (and metadata)
depends on what the geometry pipeline feeds the tiler with, and that
can't be predicted. If you over-provision, that's memory the system won't
be able to use while rendering takes place, even though only a small
portion might actually be used by the GPU. If your allocation is too
small, it will either trigger a GPU fault (for HW not supporting an
&quot;incremental rendering&quot; mode) or under-perform (because flushing
primitives has a huge cost on tilers).

Calling these drivers broken without having a plan to fix them is
also not option.</pre>
    </blockquote>
    <br>
    Yeah, agree we need to have some kind of alternative. It's just that
    at the moment I can't think of any.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250410192054.24a592a5@collabora.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">And that's how it is today, the
alloc-on-fault mechanism is being used in at least 3 drivers, and
all I'm trying to do here is standardize it and try to document the
constraints that comes with this model, constraint that are
currently being ignored. Like the fact allocations in the fault
handler path shouldn't block so we're guaranteed to signal the job
fence in finite time, and we don't risk a deadlock between the
driver shrinker and the job triggering the fault.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well on one hand it's good to that we document the pitfalls, but I
clearly think that we should *not* spread that into common code.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ack on not encouraging people to use that; but having a clear path
describing how this should be done for HW that don't have other
options, with helpers and extensive doc is IMHO better than letting
new drivers reproduce the mistake that were done in the past.
Because, if you tell people &quot;don't do that&quot;, but don't have an
alternative to propose, they'll end up doing it anyway.</pre>
    </blockquote>
    <br>
    Just to be clear: We have already completely rejected code from
    going upstream because of that!<br>
    <br>
    And we are not talking about anything small, but rather a full blown
    framework and every developed by a major player.<br>
    <br>
    Additional to that both i915 and amdgpu had code which used this
    approach as well and we reverted back because it simply doesn't work
    reliable.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250410192054.24a592a5@collabora.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
That would give the impression that this actually works and to be
honest I should start to charge money to rejecting stuff like that.
It would probably get me rich.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I'm well aware of the implications of what I'm proposing here, but
ignoring the fact some drivers already violate the rules don't make
them disappear. So I'd rather work with you and others to clearly
state what the alloc-in-fault-path rules are, and enforce them in
some helper functions, than pretend these ugly things don't exist.
:D  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah, but this kind of says to others it's ok to do this which
clearly isn't as far as I can see.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Not really. At least not if we properly review any driver that use
these APIs, and clearly state in the doc that this is provided as a
last resort for HW that can't do without on-fault-allocation, because
they are designed to work this way.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
What we should do instead is to add this as not ok approaches to the
documentation and move on.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, that's what happened with panfrost, lima and panthor, and see
where we are now: 3 drivers that you consider broken (probably
rightfully), and more to come if we don't come up with a plan for HW
that have the same requirements (as I said, I wouldn't be surprised
if most tilers were relying on the same kind of on-demand-allocation).</pre>
    </blockquote>
    <br>
    Well we have HW features in major drivers which we simply don't use
    because of that.<br>
    <br>
    <blockquote type="cite" cite="mid:20250410192054.24a592a5@collabora.com">
      <pre class="moz-quote-pre" wrap="">As always, I appreciate your valuable inputs, and would be happy to
try anything you think might be more adapted than what is proposed
here, but saying &quot;this is broken HW/driver, so let's ignore it&quot; is
not really an option, at least if you don't want the bad design
pattern to spread.</pre>
    </blockquote>
    <br>
    Yeah, I'm not sure what to do either. We *know* from experience that
    this approach will fail.<br>
    <br>
    We have already tried that.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20250410192054.24a592a5@collabora.com">
      <pre class="moz-quote-pre" wrap="">

Regards,

Boris
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------m3t13btmtnSzsmmrXAsSavxU--
