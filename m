Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F6AC6EC7B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A4610E5FF;
	Wed, 19 Nov 2025 13:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4eZZl+Yz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013022.outbound.protection.outlook.com
 [40.93.196.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2932E10E5FF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoVwMvuOMANAP/lYVM1A8+yzHpd2lsDTA1ipvhRTFQjmZ8nR7W/rkWuFPkIJ4Q779izlG6d1DFKISxEhsX8vYH6puU1KOip/VXwVN/aeempMFdE+qglyv/T9au/6MIIbBqVZhDBSjx7ncACgbjP037DGezwo34b8Y6Mh2iRjnCvpm5+gu7bjMkIaroXOaYZ4KYHkSIREFdQ4V3KQRb+7rdUkvwbulaa/Jgcl8QlgV0UWT4T4f0DGfDzlCy23rOaeaoKjGhfjOLZYp2JWi1sWIjnVPHz4f+rbTHFe4qFQUWh4UZT2sP103Ne7YnMfSUh/X4Nmr0Q7WuUt2WSIwW2wtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/Tow/b+Rv0XrCmCk1oa6qFl3UXZQzGQUV5E39t5qR8=;
 b=CCsgGrEjnA/CwtwZbaxcH96hNrtG3yD2vDzxoTUgQ6XHARZz7wRgTK+ubHxHwdY/neNrmn0sH4uTH4aLiIgP1NK8QwEH7uBqle4w5VvRPYvv2YcvIC6HY9VkXo8gYEkh2jnfhnEZgrPFM2BM3r+sIZuwoRB9lX4b0FUqDf0K9o7OcETbnqeZfZcJVNnlUNMAld2et0XU2xKlRnXiuWctSBgIbmjp6qDMk3VQDljVKfd3tjoGZ4Lt8WU5BA+MjCVEJOdM3qGiCth71WUb4SZcIAY7brnPB1slgeMPZq2MxOZqh2sZ+5Ljhh2IcOQtSwXMv9R40BKlPLjja9WaRs62vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/Tow/b+Rv0XrCmCk1oa6qFl3UXZQzGQUV5E39t5qR8=;
 b=4eZZl+YzIn2xiM1qK3AlIfzmfIUWTQFvBiVoDKbN6UpSxrO5Uz2Oem9jmtAwZl+SO4o6ycr6UKHTW36DdyO6y1TJAmvwMHJbceToj2qcjww/OQwbRXyxIViY+2LShQCS1NB+u5kK7JosqVjLA8/upgW49vGpIWVhYQB/q0ntqAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6717.namprd12.prod.outlook.com (2603:10b6:510:1b0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 13:17:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 13:17:06 +0000
Message-ID: <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
Date: Wed, 19 Nov 2025 14:16:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
To: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>
Cc: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: ffded6cc-85bc-4889-39aa-08de276df00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UURneWl2by9WcXFxWVhXcWNNNUtxRjZ2Z3B6MzJrdWkyclR3akpTdDUwRzJo?=
 =?utf-8?B?MEg2M0k3QVFGVSsySkR2bmFSYmFqcVEycXhaLzNiMUdBNm9sNXNaYnpyVEc4?=
 =?utf-8?B?T3VNUkZveWovb0M1VWxmTnkyZ1pQb05zTG1yajQwV0EzM2NzWG5JTU94YmlB?=
 =?utf-8?B?MjUzR2RIbUVFQVhISmlHbDZOMWFPWXVhV3l3TUF3c2VyK1dYMmxlYzA0Q1pV?=
 =?utf-8?B?a2dHUVdZcUd6Y2I1enFFNytXWk81N0IzVTdkdXZRaTM5d2FWMmZFcHgzVEJJ?=
 =?utf-8?B?bGJ0QzRReFRTU2xBaDBHSHJjUjRyQ1A2V3RNa0JyUmdkaGViZXRvRjhwN0pV?=
 =?utf-8?B?QUFtVXJWNTlOeUU4ZTZwK3YwM0s3Vnk1ZE9pelJGemNvRjk5bndlMXEyWTZQ?=
 =?utf-8?B?dGtuWkxQUFFrY3JhUnlMSi9nSkU5ZkFYNU9oYmtVNlIxaXVWOGxUbndZMGYy?=
 =?utf-8?B?eTcrK3ovRXpNQVg1VGpycGVKS2JPejA0ZHE4VGV3ZmFEZDhtbThINFhlTEQ4?=
 =?utf-8?B?b0JyNGZ5QnFNWlJrZ2dKVEtnUVhVeUcxM09KSUlYRHppa0pmL1EzNzZXS01L?=
 =?utf-8?B?cDZqb3JlczU0eGNMaFVSWVdhTDhzZExHT1JPOFpTUTJvNnp6OTlxYnUxaFA2?=
 =?utf-8?B?SGJnU0RCUG9CM0FIVGoxWDFmcmg1cExjK0prbUZ0OWRiTURQK2hGamRKVVVP?=
 =?utf-8?B?ZlkwSURSaFRORDBJaHQ3WlhIL0ZjR205ZDQrbE96bWZISE0zclJVK0k5eFVW?=
 =?utf-8?B?bXF1Y3hwYlc3K2h2TlVYNUQ2MjJGSTJLUXhDNmsxNWZBZHZSYUxQczRUbHkz?=
 =?utf-8?B?Z1dLM3FFVm1ETGN0VlNUK1RlS0xLb0dRS2FsY1U4UDlIR1I3TFNxckVKVXFr?=
 =?utf-8?B?cXF5dzB5cXZld2lQM0ZlWWZpbWRMK3JXM2NkNWFYby95MzdRek9QVFV1TXlY?=
 =?utf-8?B?ejZUeDM3Y2FTZm5XQjBzdG0rZFBoOStWcjZwWm16ay9YNlBKaUNVSDYzZ3NN?=
 =?utf-8?B?amF3ZVJ6dDRhTWZVaDRiQjNTWm15S0tEN0lDM0ZIb1I5YXBQMTV2Uk9sQzZY?=
 =?utf-8?B?UXF5Vk5ZZm1CckpDN2J0OCtmMURwQi9jeEVkWTBRb1YwQVJkSmpJblN0ZnNi?=
 =?utf-8?B?Q3pzYW1nRit6c3R1NG5jWjJmM0RrTHlpcUVuQUVNc3JIYTRZbE9iOEhua3dm?=
 =?utf-8?B?VURQR0dUamQ4dG9SV3BoNk1sVURKaFVQRmQrNkVFcEdCemE2MVpacDVWSTFD?=
 =?utf-8?B?dGltNTB3cGtPNkJlT2tPVjdaaWZQRXBmeTlnYTRxYzAzTzI3R1Y1TGZaRUFJ?=
 =?utf-8?B?UU5VcnlqZFFBaEUrSE5RMGNaY3ZPZDE0STl5OVBNcVVUajVnSWQydXRJVG1D?=
 =?utf-8?B?ZkxDb0NFWWVSNVliZ3FTSm5hNDl6Unk1U0Rxb0pRd1BuNEgvV1E0T0s0KzF2?=
 =?utf-8?B?NGhxZVBkRHN1VHVSQXZrSms1Tjg3MFBjOVk0ekhtYi9NaFZmWGM3bC8waTFG?=
 =?utf-8?B?aHlCZHRJU3ZXTmdLeDd6cEVFaVp4VzJjNWxNbWJqWEEzUEdabG85MXRzSjM4?=
 =?utf-8?B?NFJOaitFTGJQc2RFdWJYNllkcFl3M1J2SkpCTG5FL3I0NDlMK0ZtUmpYSzgv?=
 =?utf-8?B?UkpKZEFBWGNoVUo5SElIZzVqbVBUeFg4ZHNLK2VRTFQ3L0gvMmFTTEZzMWww?=
 =?utf-8?B?UDN3S3hNd1NGVUJZaGVlTCtUZ3J1enBXYTVSazd0Q3l5WVoxRGc5VjRmcXhx?=
 =?utf-8?B?bWovcDVwaW5ZTGdNYWdTZmR3c2w1TzljWjNkaUpNT0U1T0dCL1VMM2VVQ2M0?=
 =?utf-8?B?UnVHU0pMVVRQSXJRRHovRFJDODYxbHFZSW5PTDB1Z2wxdDRaWFRXd0tZT3ov?=
 =?utf-8?B?K243QiszVGJJZXpJVXBLVS93c29Wc2tSZEY4WmxoWS9uYm0rSGVKaWVmSDFM?=
 =?utf-8?B?UXpFSVNTOGFQK2NNM2pjcnVwNjBZR2tlc21vdnhEMStQMHE2b2Q2RDFUSDdr?=
 =?utf-8?Q?+zQ8WYTRekBI8MtGqmY/KPF8WIoceg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WStYY3k1ZGd2clZOcmUxTHk0Y0IydVBQaVdWeGJBNjBITHVuUjJQdDQzSXdM?=
 =?utf-8?B?NnlzeXA5K1NwNGZQdXoyVmdJbVoyc0JSUXJpTjNLWVhaY1VlTjlzTlc4VDVr?=
 =?utf-8?B?cm5DQ0JQb2dNYjAzVlQrWlVZZmNEOUE3WXFwcUtXWHk3UWRlRS9ENjAzZnY5?=
 =?utf-8?B?TlE0MFd3MEVXSFJyWExNWXBMYXV6cHp4aEtRd2x0aWJYZjhWdDFMVzVFdG1y?=
 =?utf-8?B?L2VRekZyMWlJSXZDL3Vmd0x2WWhFaU5KS2pva24yeEV4Vy9WT2NTNk0zNTlW?=
 =?utf-8?B?Ym5SNGRpSytYL056d3JUSkxmeVUwTWRRaDVwNEJCWDYwZ1hyNEszOWZVU1J6?=
 =?utf-8?B?V0pBYXlrcmF4K2NkNDNLS3EvMmh4dy93bW1OV0JMZ2dBY0Jma3lJZ3FmSlRQ?=
 =?utf-8?B?UHZDUXFPdDVRV2tpMVZ3RVEveHFkS3pRdU9HVmZ3bkdtN0NBaDU5aW9OZlkw?=
 =?utf-8?B?ZVFKUTNNVUhvNEFRbVBJWVhITWt3aFAxNEJGSWx0ZlZpUXc5S0cxalN1cUdL?=
 =?utf-8?B?NG5KeXR6VHlKYmY0NmYvc01Ya2QzVU90THhML2tLaHBmaHllZ2pFdEV5TCsy?=
 =?utf-8?B?MjkwVWV5L25OejNkRWxuN2lwT05uTUUwUTZ2THNLYU5uSkJ3QnlHNjJoNHpn?=
 =?utf-8?B?WHNJb1BIN29oMlB0LzlGWWl1V1dBV3JnZ3Zia0JqOFJwWjJVNXJtK2ZXNUR2?=
 =?utf-8?B?YktlMGt1RDlRZnBRcnlTbGtWUllUYkhJdHIyZ0tOVG4wdlNPWll2eUdyc285?=
 =?utf-8?B?RXo5Tkg1Z29XWFcyV3I5cSs2Z1dXejBiaUN2N2M0dlNVY1UxMmlCQzQzRnJH?=
 =?utf-8?B?N3Z6RWhXanNIaGRTTWFZelZ2QlJvSkNENGR3U2lFaDlIbWJwQVJWVkV1SVNF?=
 =?utf-8?B?UG1PZ0NSOHR4RXcvZXB6U2VOZDhWZFV0ZnliMFFPOGhxa1hOdUk3VE1jQ1N1?=
 =?utf-8?B?QmdqVFRwUC81aFJTdFkrb1lVUldmZnZwb0x3c3NBT2Z3UEVSaWZZWUhTQmRD?=
 =?utf-8?B?UEdFTStrTFZwUFRYbEM1Q2VUZ0xXa0hJTFgrSkpDSDVZTTRaUlhYcEZpekhk?=
 =?utf-8?B?eHQ3SGIwOTJ0YlhRWjdwWVZYbE5ZcmQxZnJXakNyUVVHNW9tWkVZQk1PdHhW?=
 =?utf-8?B?czNGNTJocHRSVkIwalBQMnA4V0RtQjc0dEc2a1RoME5MQ0NERkl1TGR6YW9o?=
 =?utf-8?B?eWd6V09TY1p6dlRaYWRlRUliNWZiOVE2ZHN5cnlzZ2V3UWd2NUs5M1UzdXlw?=
 =?utf-8?B?elVlOXFYWEtkVERSclIvWTFWKzBIbGorVVhmMVBCN29uaFlVd3F3aWM0aTVa?=
 =?utf-8?B?MWlTbGk5cVNVMnpiYU9FMXZlZnJQRzVITlo0WjBBSGhnNGczTEtxSkZ0dUh2?=
 =?utf-8?B?WUFXTUdUSi9DR3ZjQWZtdkdiUkYyR05OMHlEUTdBVDl3RWlMblVEODMvWkYx?=
 =?utf-8?B?MHhwNStaWXBuUkgveXFUWEsyL1NUVXV5a3p6ZHU1VDM2L0VScUlHbDkvKzND?=
 =?utf-8?B?Y29mekdodm5Yc3NOdjZ2UFlhU0Z3Mlk0Mm1SRE1RanJCK0E4Ulg2cjQwWTFv?=
 =?utf-8?B?SHQ5ekdFRmwwWFVkMHFUY0o5WkszRzBqdUdIdW1xNFdmVkljeTVSTzBCSzFE?=
 =?utf-8?B?NlNRekFGTkd2WVZ6ZGZHbVgvRjRNS3dyTWpabElic2h2Rk4xeEx4WjhBck5W?=
 =?utf-8?B?eC8wWHVZS29uSVpheWsrNk42OUsrMDVqdmVlSlltMGpuampYdUFLc1EzU2ts?=
 =?utf-8?B?WUFEcXpxSlovdkk0TS9OQ0Y4cXhyOG94QTZ4US9QazRmcm9ZR0t4djB3K0or?=
 =?utf-8?B?d1NTTmdxNXozaE82QlFEdTduZjM0eHgxV1ltdkhzRzdmY3hseDVNRlBEWUNj?=
 =?utf-8?B?Y3gyS01ZUkNadFdiK1dwdXdGVm5EbGxBOHhaTE1tTXRFeUFDWHl5R2xsWHJD?=
 =?utf-8?B?OXlWWHdxYVZDNys5NkVDVUswZkVBMzdXd2YycTY1MVkvWHNORjdzK3RjUUZL?=
 =?utf-8?B?Y3RISkI4aUkzeEo2ejdaYlZxZ0ZrNkpFaURBWDd4MjJMMmd2K0pTSUtLSXVP?=
 =?utf-8?B?ODdtS2M4Y0lnYTdIRDJqdWhCdzY2MzJrWFVGc05aZzllbHZHcE4wMS9YMFRx?=
 =?utf-8?Q?JvIMBd/lAafISq8PT0UzYlVje?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffded6cc-85bc-4889-39aa-08de276df00d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 13:17:06.7073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mYGye7b8R9X1mAEGv7QD94/kmAOlA8xY+7IZSoT/SdAVTJzhgrfQEuJsAB9MASY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6717
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



On 11/11/25 10:57, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Add dma_buf_map() and dma_buf_unmap() helpers to convert an array of
> MMIO physical address ranges into scatter-gather tables with proper
> DMA mapping.
> 
> These common functions are a starting point and support any PCI
> drivers creating mappings from their BAR's MMIO addresses. VFIO is one
> case, as shortly will be RDMA. We can review existing DRM drivers to
> refactor them separately. We hope this will evolve into routines to
> help common DRM that include mixed CPU and MMIO mappings.
> 
> Compared to the dma_map_resource() abuse this implementation handles
> the complicated PCI P2P scenarios properly, especially when an IOMMU
> is enabled:
> 
>  - Direct bus address mapping without IOVA allocation for
>    PCI_P2PDMA_MAP_BUS_ADDR, using pci_p2pdma_bus_addr_map(). This
>    happens if the IOMMU is enabled but the PCIe switch ACS flags allow
>    transactions to avoid the host bridge.
> 
>    Further, this handles the slightly obscure, case of MMIO with a
>    phys_addr_t that is different from the physical BAR programming
>    (bus offset). The phys_addr_t is converted to a dma_addr_t and
>    accommodates this effect. This enables certain real systems to
>    work, especially on ARM platforms.
> 
>  - Mapping through host bridge with IOVA allocation and DMA_ATTR_MMIO
>    attribute for MMIO memory regions (PCI_P2PDMA_MAP_THRU_HOST_BRIDGE).
>    This happens when the IOMMU is enabled and the ACS flags are forcing
>    all traffic to the IOMMU - ie for virtualization systems.
> 
>  - Cases where P2P is not supported through the host bridge/CPU. The
>    P2P subsystem is the proper place to detect this and block it.
> 
> Helper functions fill_sg_entry() and calc_sg_nents() handle the
> scatter-gather table construction, splitting large regions into
> UINT_MAX-sized chunks to fit within sg->length field limits.
> 
> Since the physical address based DMA API forbids use of the CPU list
> of the scatterlist this will produce a mangled scatterlist that has
> a fully zero-length and NULL'd CPU list. The list is 0 length,
> all the struct page pointers are NULL and zero sized. This is stronger
> and more robust than the existing mangle_sg_table() technique. It is
> a future project to migrate DMABUF as a subsystem away from using
> scatterlist for this data structure.
> 
> Tested-by: Alex Mastro <amastro@fb.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/dma-buf/dma-buf.c | 235 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-buf.h   |  18 ++++
>  2 files changed, 253 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 2bcf9ceca997..cb55dff1dad5 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1254,6 +1254,241 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
>  
> +static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
> +					 dma_addr_t addr)
> +{
> +	unsigned int len, nents;
> +	int i;
> +
> +	nents = DIV_ROUND_UP(length, UINT_MAX);
> +	for (i = 0; i < nents; i++) {
> +		len = min_t(size_t, length, UINT_MAX);
> +		length -= len;
> +		/*
> +		 * DMABUF abuses scatterlist to create a scatterlist
> +		 * that does not have any CPU list, only the DMA list.
> +		 * Always set the page related values to NULL to ensure
> +		 * importers can't use it. The phys_addr based DMA API
> +		 * does not require the CPU list for mapping or unmapping.
> +		 */
> +		sg_set_page(sgl, NULL, 0, 0);
> +		sg_dma_address(sgl) = addr + i * UINT_MAX;
> +		sg_dma_len(sgl) = len;
> +		sgl = sg_next(sgl);
> +	}
> +
> +	return sgl;
> +}
> +
> +static unsigned int calc_sg_nents(struct dma_iova_state *state,
> +				  struct dma_buf_phys_vec *phys_vec,
> +				  size_t nr_ranges, size_t size)
> +{
> +	unsigned int nents = 0;
> +	size_t i;
> +
> +	if (!state || !dma_use_iova(state)) {
> +		for (i = 0; i < nr_ranges; i++)
> +			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
> +	} else {
> +		/*
> +		 * In IOVA case, there is only one SG entry which spans
> +		 * for whole IOVA address space, but we need to make sure
> +		 * that it fits sg->length, maybe we need more.
> +		 */
> +		nents = DIV_ROUND_UP(size, UINT_MAX);
> +	}
> +
> +	return nents;
> +}
> +
> +/**
> + * struct dma_buf_dma - holds DMA mapping information
> + * @sgt:    Scatter-gather table
> + * @state:  DMA IOVA state relevant in IOMMU-based DMA
> + * @size:   Total size of DMA transfer
> + */
> +struct dma_buf_dma {
> +	struct sg_table sgt;
> +	struct dma_iova_state *state;
> +	size_t size;
> +};
> +
> +/**
> + * dma_buf_map - Returns the scatterlist table of the attachment from arrays
> + * of physical vectors. This funciton is intended for MMIO memory only.
> + * @attach:	[in]	attachment whose scatterlist is to be returned
> + * @provider:	[in]	p2pdma provider
> + * @phys_vec:	[in]	array of physical vectors
> + * @nr_ranges:	[in]	number of entries in phys_vec array
> + * @size:	[in]	total size of phys_vec
> + * @dir:	[in]	direction of DMA transfer
> + *
> + * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
> + * on error. May return -EINTR if it is interrupted by a signal.
> + *
> + * On success, the DMA addresses and lengths in the returned scatterlist are
> + * PAGE_SIZE aligned.
> + *
> + * A mapping must be unmapped by using dma_buf_unmap().
> + */
> +struct sg_table *dma_buf_map(struct dma_buf_attachment *attach,

That is clearly not a good name for this function. We already have overloaded the term *mapping* with something completely different.

> +			     struct p2pdma_provider *provider,
> +			     struct dma_buf_phys_vec *phys_vec,
> +			     size_t nr_ranges, size_t size,
> +			     enum dma_data_direction dir)
> +{
> +	unsigned int nents, mapped_len = 0;
> +	struct dma_buf_dma *dma;
> +	struct scatterlist *sgl;
> +	dma_addr_t addr;
> +	size_t i;
> +	int ret;
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	if (WARN_ON(!attach || !attach->dmabuf || !provider))
> +		/* This function is supposed to work on MMIO memory only */
> +		return ERR_PTR(-EINVAL);
> +
> +	dma = kzalloc(sizeof(*dma), GFP_KERNEL);
> +	if (!dma)
> +		return ERR_PTR(-ENOMEM);
> +
> +	switch (pci_p2pdma_map_type(provider, attach->dev)) {
> +	case PCI_P2PDMA_MAP_BUS_ADDR:
> +		/*
> +		 * There is no need in IOVA at all for this flow.
> +		 */
> +		break;
> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
> +		if (!dma->state) {
> +			ret = -ENOMEM;
> +			goto err_free_dma;
> +		}
> +
> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);

Oh, that is a clear no-go for the core DMA-buf code.

It's intentionally up to the exporter how to create the DMA addresses the importer can work with.

We could add something like a dma_buf_sg_helper.c or similar and put it in there.

Regards,
Christian.


> +		break;
> +	default:
> +		ret = -EINVAL;
> +		goto err_free_dma;
> +	}
> +
> +	nents = calc_sg_nents(dma->state, phys_vec, nr_ranges, size);
> +	ret = sg_alloc_table(&dma->sgt, nents, GFP_KERNEL | __GFP_ZERO);
> +	if (ret)
> +		goto err_free_state;
> +
> +	sgl = dma->sgt.sgl;
> +
> +	for (i = 0; i < nr_ranges; i++) {
> +		if (!dma->state) {
> +			addr = pci_p2pdma_bus_addr_map(provider,
> +						       phys_vec[i].paddr);
> +		} else if (dma_use_iova(dma->state)) {
> +			ret = dma_iova_link(attach->dev, dma->state,
> +					    phys_vec[i].paddr, 0,
> +					    phys_vec[i].len, dir,
> +					    DMA_ATTR_MMIO);
> +			if (ret)
> +				goto err_unmap_dma;
> +
> +			mapped_len += phys_vec[i].len;
> +		} else {
> +			addr = dma_map_phys(attach->dev, phys_vec[i].paddr,
> +					    phys_vec[i].len, dir,
> +					    DMA_ATTR_MMIO);
> +			ret = dma_mapping_error(attach->dev, addr);
> +			if (ret)
> +				goto err_unmap_dma;
> +		}
> +
> +		if (!dma->state || !dma_use_iova(dma->state))
> +			sgl = fill_sg_entry(sgl, phys_vec[i].len, addr);
> +	}
> +
> +	if (dma->state && dma_use_iova(dma->state)) {
> +		WARN_ON_ONCE(mapped_len != size);
> +		ret = dma_iova_sync(attach->dev, dma->state, 0, mapped_len);
> +		if (ret)
> +			goto err_unmap_dma;
> +
> +		sgl = fill_sg_entry(sgl, mapped_len, dma->state->addr);
> +	}
> +
> +	dma->size = size;
> +
> +	/*
> +	 * No CPU list included — set orig_nents = 0 so others can detect
> +	 * this via SG table (use nents only).
> +	 */
> +	dma->sgt.orig_nents = 0;
> +
> +
> +	/*
> +	 * SGL must be NULL to indicate that SGL is the last one
> +	 * and we allocated correct number of entries in sg_alloc_table()
> +	 */
> +	WARN_ON_ONCE(sgl);
> +	return &dma->sgt;
> +
> +err_unmap_dma:
> +	if (!i || !dma->state) {
> +		; /* Do nothing */
> +	} else if (dma_use_iova(dma->state)) {
> +		dma_iova_destroy(attach->dev, dma->state, mapped_len, dir,
> +				 DMA_ATTR_MMIO);
> +	} else {
> +		for_each_sgtable_dma_sg(&dma->sgt, sgl, i)
> +			dma_unmap_phys(attach->dev, sg_dma_address(sgl),
> +				       sg_dma_len(sgl), dir, DMA_ATTR_MMIO);
> +	}
> +	sg_free_table(&dma->sgt);
> +err_free_state:
> +	kfree(dma->state);
> +err_free_dma:
> +	kfree(dma);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_map, "DMA_BUF");
> +
> +/**
> + * dma_buf_unmap - unmaps the buffer
> + * @attach:	[in]	attachment to unmap buffer from
> + * @sgt:	[in]	scatterlist info of the buffer to unmap
> + * @direction:	[in]	direction of DMA transfer
> + *
> + * This unmaps a DMA mapping for @attached obtained by dma_buf_map().
> + */
> +void dma_buf_unmap(struct dma_buf_attachment *attach, struct sg_table *sgt,
> +		   enum dma_data_direction dir)
> +{
> +	struct dma_buf_dma *dma = container_of(sgt, struct dma_buf_dma, sgt);
> +	int i;
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	if (!dma->state) {
> +		; /* Do nothing */
> +	} else if (dma_use_iova(dma->state)) {
> +		dma_iova_destroy(attach->dev, dma->state, dma->size, dir,
> +				 DMA_ATTR_MMIO);
> +	} else {
> +		struct scatterlist *sgl;
> +
> +		for_each_sgtable_dma_sg(sgt, sgl, i)
> +			dma_unmap_phys(attach->dev, sg_dma_address(sgl),
> +				       sg_dma_len(sgl), dir, DMA_ATTR_MMIO);
> +	}
> +
> +	sg_free_table(sgt);
> +	kfree(dma->state);
> +	kfree(dma);
> +
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unmap, "DMA_BUF");
> +
>  /**
>   * dma_buf_move_notify - notify attachments that DMA-buf is moving
>   *
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d58e329ac0e7..545ba27a5040 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -22,6 +22,7 @@
>  #include <linux/fs.h>
>  #include <linux/dma-fence.h>
>  #include <linux/wait.h>
> +#include <linux/pci-p2pdma.h>
>  
>  struct device;
>  struct dma_buf;
> @@ -530,6 +531,16 @@ struct dma_buf_export_info {
>  	void *priv;
>  };
>  
> +/**
> + * struct dma_buf_phys_vec - describe continuous chunk of memory
> + * @paddr:   physical address of that chunk
> + * @len:     Length of this chunk
> + */
> +struct dma_buf_phys_vec {
> +	phys_addr_t paddr;
> +	size_t len;
> +};
> +
>  /**
>   * DEFINE_DMA_BUF_EXPORT_INFO - helper macro for exporters
>   * @name: export-info name
> @@ -609,4 +620,11 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
>  void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
>  struct dma_buf *dma_buf_iter_begin(void);
>  struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf);
> +struct sg_table *dma_buf_map(struct dma_buf_attachment *attach,
> +			     struct p2pdma_provider *provider,
> +			     struct dma_buf_phys_vec *phys_vec,
> +			     size_t nr_ranges, size_t size,
> +			     enum dma_data_direction dir);
> +void dma_buf_unmap(struct dma_buf_attachment *attach, struct sg_table *sgt,
> +		   enum dma_data_direction dir);
>  #endif /* __DMA_BUF_H__ */
> 

