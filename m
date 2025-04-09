Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90646A825D0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB1F10E8B1;
	Wed,  9 Apr 2025 13:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ziuxw+SU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C16310E8A6;
 Wed,  9 Apr 2025 13:14:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGfxgKvFAGgwkk6gmZOeei1K/SCTzIS9Mt/HWjv901b9OIZWtE+vMdIgVKD9Y1IgYUlC1Ydry+RklR0gwfRGbqg0nFpewAHzRgXpZEFb2ZC156J5BuLnm52tVKzUvi+MxO+3TPd2Fi/bd/OwAgC39YIjlC3MFZ2wALoXs1ZhVwr+lOT6zGF4J5OTGsrZ2Byu4Kj3ZErL1U5oiExTQ2eExGp5AmFrqVBZewWboD97Qr0BlKaBKGMah4KY7GATwOsX6dPiqobG9zP+e+Uiy4bWX/B06HIIbVxnF/9t0Gx/Dp7zWZChG3JD6mHaCt8g1ZyAKPqCvYzi/zluzvx14Ayqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMt8IhWXjfKKNSe/YUAi2Bwdd4Ynu5BMzPeY66KYb7k=;
 b=HRFpmKlgvhIZUEa9iLYZ6oShYvGSyDVm9eLPxl8HtZpge72fXvfskU5BGH18BlANIBOD0Ri/uWGEYFvfxNthi8txeyk7fMrkHr4iT/1/xmoXX+Lswq6cvXPt0+EuR4Gl66ndH4cNq5T5EpZUa5trdPFbgqWy50Up9otlpNVoRVirpLKoNMzkMEtnQhNKTVCWQutmof30S3PfV292KSIrbf0D1Km3mgOVnjoVC1W8OiD3E+U24yaIprBwBiFfMUUVo3ZotdZcK2TIGfulslMhm61nCbz7sBGT9/37XlbEBXUJOk10lS2hMUb1HEUVYSzwXwMVD8tNmF1GbfkLII+vzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMt8IhWXjfKKNSe/YUAi2Bwdd4Ynu5BMzPeY66KYb7k=;
 b=Ziuxw+SUz6wk9Z0qJxeR2lPXUP81o1XEr+3qKbkvWvZR54vc5Hq/Rw8rltt7Nb+b7BHCGqcz6PAqc7DK3G190hVGnuIXNtEUrSWcLSRH+qfpEqp0mmdc4pMD4vs4s6qeaJQSMigNpbIS0ShVbA3H9gU8eAG8frwyEFfPcGt9O+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 13:14:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 13:14:42 +0000
Message-ID: <ab7d1937-d0e9-45f8-8f7d-ddd7a1a9d3d5@amd.com>
Date: Wed, 9 Apr 2025 15:14:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-fence: Rename dma_fence_is_signaled()
To: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Qiang Yu <yuq825@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Yang Wang <kevinyang.wang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Tim Huang <tim.huang@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, Eric Huang <jinhuieric.huang@amd.com>,
 Asad Kamal <asad.kamal@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Friedrich Vock <friedrich.vock@gmx.de>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250409120640.106408-2-phasta@kernel.org>
 <20250409120640.106408-3-phasta@kernel.org>
 <20250409143917.31303d22@collabora.com>
 <73d41cd84c73b296789b654e45125bfce88e0dbf.camel@mailbox.org>
 <72eb974dfea8fa1167cf97e29848672223f6fc5b.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <72eb974dfea8fa1167cf97e29848672223f6fc5b.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 75da6efb-51ca-475b-8897-08dd77687d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjBqNXgzbkhLaU5rdTVpRFRjQy9KZkhZdHMyRU9EMUxzRWQ3THRiYkRTZkds?=
 =?utf-8?B?LzNNQ1pQS285Wmx6RTVxR1ltSzRVbXhrV3ZxZTdPY0QzcEdlaVVQdld5Qks0?=
 =?utf-8?B?SUFkSk1UYWdOOXNWLzZweFNVQVpzejdyRFFXc05ST1Y0ZWt6UDJneXZQYk4w?=
 =?utf-8?B?STBhaFI0ZjNVUi80ajZWRVFJTXFrMkNkTGQ3ZHhwWUxPb2NoQWN4aE4wV2Z4?=
 =?utf-8?B?NFV4d09GcEVmQk1JdGV1aVl6Z3paM0dta0FHditZbjFXSDN5RVFTUndCWW4r?=
 =?utf-8?B?U0JlaHZ0SHRPZmpLN1pJVVEwSXVqRXRGQzFJTkFOa2ZOWG8zSmFaUWJEUWhi?=
 =?utf-8?B?S0o2OGdUOGtxQi9lbzRZZURsOEdBNkQ3MGZOQWJZMkV1Um1OVENpbjFUZDFm?=
 =?utf-8?B?M0Q1MlJlQ244b2N5MDEwSmZWdHBkYzNpTmgrTUl2NUZyVmFyTmlrM3hzcllB?=
 =?utf-8?B?NXVIcGRWcG1DcGlJQU11VVJzRVQ0V2RHajUzZW1LR2FGMVMvaDJhK05xc3ll?=
 =?utf-8?B?cENIV3dYcUZPckRkaHV1U1JaSG9XbVhJcDF1ZnhqOTh6ZVFPMnV4c1NZU2Js?=
 =?utf-8?B?ZnNWd1pPT3FCR20xR1FTTGdwNitmUWNBSWNKWmgvY3hmOVdzcUFFZHdzRmEv?=
 =?utf-8?B?WGthUmJuL1U4SExTZWNGYmJ4WVp0MzY5U3FIOVNnOVo2cFcwclZOZFB3a29M?=
 =?utf-8?B?L1B1YWFzVVhhcmt3QUxxU2p3SUUrNmt0Y2Zna2VLOVZSbFl1OTRXSVJqSjYy?=
 =?utf-8?B?R1Zwc29aWEdrLzB0RVdxZ2RkeExqSFVyOGF6OXl3ZzVvYVhOKy9rd2VQU0Nw?=
 =?utf-8?B?OGhOZ0VtUTdsOUdHd3V5cUJmZWVTS2VGMG9xL01JWmRJbHRkRklLbFV1UVZP?=
 =?utf-8?B?bk4yWGRDVngxZzViTEs4V1Y0cnNpeXIrb29QL0J6aGtiemxPYjkxRUdrOEov?=
 =?utf-8?B?VmFlVldjUnVUWXdTK2VxVzhlSkZUbjd2eFRraU5FKzl1YjBhRDE0Y0JodG9W?=
 =?utf-8?B?dTFwQlI0L2tINm93NVlEVk8wRGovT1pNOXBHTzBhaTdIMHJDT2pxMFBobGVo?=
 =?utf-8?B?ZXI2eS8zbEtDci9ZVjlxQXY3bXY5YkNjY1RkZXEwOEpDZlRxbXNOTkdvcFVt?=
 =?utf-8?B?SWZZVm5ObHVyeEo3T0tJekZWQi9ITDkya2UvdXF5RWpxeCsrK0Fsa2JiTC9a?=
 =?utf-8?B?Z09CaCt6dlo4NFZLUWVtaitwenhrYU9tVE41QStVY1RHTG81UEsyOGw0T25K?=
 =?utf-8?B?cVl6MGdibVAvbXlTeXNZaUZ0ME5ESk5IQk9LSWU0YzlrSlAyQlpIZytCNm9v?=
 =?utf-8?B?TWZoRmdtcUNCeE5Mb2xINks4MUdNeVpCWDdlS2NmaFNoQWdEZXhWVkI3akJl?=
 =?utf-8?B?L2liYldyYmxvZUZNOHpiRFBuNXRTS0hHSndoeFpwVWpIK0h1QVlXaVRCQjg2?=
 =?utf-8?B?L0dHeVg4RWpIZ2xwb0s2VGlQRmpqKzJIY1Qxd2F0bDhiUEduMk9kTWIzUmRl?=
 =?utf-8?B?WGQrQjd2cnFXUFZCdFExZE1kclFvWTlxZHZvTTN1TTd1WFlRRE4wM09Xc3Z3?=
 =?utf-8?B?Qjg1OWlwNFQ5MEppbkoremNoWk9GT0I5MjdSSjE1S3V1VVhtUDYrL3RGVm9C?=
 =?utf-8?B?QTc1MTdrbkRsS1dlR3RJZ3k2N21BeElxeEdrZEROMVhHa3VIOFpOeVVOdjhk?=
 =?utf-8?B?L2ZrS01SK3VVbGZGSU10dkJUa0QzbE04dE9nTDlCK0N5eGJ2RXRBMGEydGdL?=
 =?utf-8?B?NkJKR1N6UysvMjFSMFQxYk5sbEo4NGR2dTcvcnBhQ0xFMkt0OHFDdHFQajYr?=
 =?utf-8?B?eXpnaGoxUGN1OCtJaEpqd2VucnVudVBaLzk2NHE3OWJlWDAxbytJWHpkSGdN?=
 =?utf-8?B?bFg3T2RQcGpycTltSi9vS1FlYjh4dUMvSDBRL2xqNXVhdm1IbEJWd3J5dEUw?=
 =?utf-8?Q?3zvaB5TSbLY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFVXQlJLTHpjNzJoYi9mWVhiZmNYaDZFa1RoZS9Jc2FkOFpwWnJHQnNTOVNt?=
 =?utf-8?B?TTRUSGlkZElpcVpIaFFrQ3lrOGFVM0VhUEdhL2NxZ2M5R1ZHMHlxci9iMnpG?=
 =?utf-8?B?cFRSeWh2ekYxdy84Rld4SmFpMDg5aUJMRXNpNHlzWndCbEZnazhURFBnM25z?=
 =?utf-8?B?bEV5N1lpM24yR2Qwd25HS202Yis0MkU3SXJwTFFNNVJteStkS3NoYUh6SzdR?=
 =?utf-8?B?NzlWc05yZ2lPRXBML3ZERW5KUWtnQWt5V1QyRHlVQ2h1VXlGV2RnNUpDRWVI?=
 =?utf-8?B?NWJrRlN5U3p4MytYa2Q4L3ZTZFBNSG9nOUZBZGNLY2hQaG02aG9UUlRSNkJh?=
 =?utf-8?B?cTlYZ3NsTmdvL0prSU4xUXgzYlJBL1cwMW1xVDE2SEEwWDduRGFQYXpORUpE?=
 =?utf-8?B?MSs4ZTZsK0Y2T1FtK0FPQkJzcHlGZDBWa29lcWNJZDNaNFdTVTUxNDkzU1Rn?=
 =?utf-8?B?TGpPd0FKekwvWVNCaWFsVUQyR1cxby94RStHM1djMk5ydUdTdm1FK3N3bkFE?=
 =?utf-8?B?dFBHb1hYZnBvZHRRZWgzTzRzNDB5Z0twM0Y4Y205ZWU1NU9mamFEYmpzaWxL?=
 =?utf-8?B?SkJaSzZ3cFU2Q3F5R3NXaHU3WFdJMnRpbWNFTkl1ODZEb2JmQWxaZkZST2l2?=
 =?utf-8?B?QWJVYktDWDIzc3BZU0krRDd4RVJNQzFqQkoyK1lDb0oxTSs5Qk9xclNkY1pH?=
 =?utf-8?B?cTlmUlNlall4clBnaFRjUC8xRWsxWTRZclFqV2UwUGV2Y0p5NVZxeGNGZG1m?=
 =?utf-8?B?dDQwUVJzWlFIZWhKUmUyYXI0V3lkSU5kc3ZWZGFhNzRZSnUwQmMwZ1hzZWZ0?=
 =?utf-8?B?UzVPSGkyQTNuUkVkUFlUYnh4cGtXU0hsRXEyVnlmM0srMnVpem9YT3B2bWhH?=
 =?utf-8?B?aGVMSGsyYUlkak52UjI2WjdhMndWNTlSNS9wdWZwN1VhVG01clo4WExoNVk5?=
 =?utf-8?B?UmtqaTlxVDhiMUlqa1RPNjZ2cnNxNUVHMmRwalJYWEJTMkpDRmlLTDZqRk03?=
 =?utf-8?B?bUh3M0ZKNjNRN3k3clVuK0V4OFJuNmhBOFRhSWtVY1VZc1NJUVpLQlB2MWRr?=
 =?utf-8?B?ckp2NXR2RmxGZ09ZdlVVdWdTRHpOQ2ltd0I2aE8yU04xYmNNM29GS25XZUxy?=
 =?utf-8?B?NHhLRlNXSFBReGdNbm9mQnlUMEMzUjJHalhKb0hEUGl6bWRkdndjUHFvUHBK?=
 =?utf-8?B?U1VRV2M5WUhDUnVDY0dOeFY4ay94WitjcjhsSFZ3eGhBQ3E0blplNXlVbHg0?=
 =?utf-8?B?NFBIeSs3UVZlTjRheWM1UnIvdzIyZS9BSGVnVE1nY24wdHVLWC9KTWRJMnph?=
 =?utf-8?B?KzFpYithVkl2MFdEdEJLQ1RINDRDZmNjaXVxTDNUTHM4SjFOd1hYbEl0ZWw1?=
 =?utf-8?B?VGQ5RDJFYjFrUlk4ZmVzNlJlYm1pakJLcENKSTU1OTdSQXU0MU9VeGpmdHpu?=
 =?utf-8?B?QjFKTDdhd04ySjZOY3dPaS85RXZwTkZGUmxJczVMdXNlMGZIODMrQ28rZjVs?=
 =?utf-8?B?cVgvQ1FURzc1TFhtbEVkU1ZmdEhEK0plT1hEclhZVUIxYnU2TVp0alh4ZDdr?=
 =?utf-8?B?Q2trclN5eEptSWdwWGMvdWt4amowZWlTYWpENjlSclRvb1BrbEVjZDVRREk2?=
 =?utf-8?B?UGc4RTdLTFExZmV2QzJaQ3VPMVN6RTNGdU9uVnhZMmZnLzhWTlFGbExXclJO?=
 =?utf-8?B?OTBQWWJsc0hKYVUzaG5nbHJqK2g4V0paektwRzRKd2tjaWhsd0RnWmUrT1Fo?=
 =?utf-8?B?VDFjb1JLQ2hHc0YwRW1CMFFOdnVUZ3hpL1BQbElNQlUwcDJVZzRkYU1YZzcv?=
 =?utf-8?B?VXZPZk00bWNhWHBIOFd3WXpvR0ZRQXFRYnBXd1dOOTR0SVd2anRUMVhmMnhy?=
 =?utf-8?B?WXZXaUljY1pLU09nSnh6TDg1NVQ4S2xLN01na3RzQndvYjJmdUpCUEZYZHp3?=
 =?utf-8?B?b0toNStFUXFEL0hKdTgzODFxa3ZwbzhtdmpENnpFS29UeVppRU5xaUc3czVM?=
 =?utf-8?B?VDBNalBIaXF3UUxFNFJrUkMvQXNIZWRQSFU0SHF0cWJlTzNCNFh2TEFiNjB5?=
 =?utf-8?B?aTlkSTRsMW5wSjB0WFl4cWJWeWFHZDlrdU5mODY0WklFZ1lnMHdTa2Ewb1do?=
 =?utf-8?Q?r8gw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75da6efb-51ca-475b-8897-08dd77687d4e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 13:14:42.2808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cwf+4Ijyeu9sD7MROrsq1lN1XEEQrMsc2l+l2+likNJmA+nXh7J80XOHgLCckfIQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352
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

Am 09.04.25 um 14:56 schrieb Philipp Stanner:
> On Wed, 2025-04-09 at 14:51 +0200, Philipp Stanner wrote:
>> On Wed, 2025-04-09 at 14:39 +0200, Boris Brezillon wrote:
>>> Hi Philipp,
>>>
>>> On Wed,  9 Apr 2025 14:06:37 +0200
>>> Philipp Stanner <phasta@kernel.org> wrote:
>>>
>>>> dma_fence_is_signaled()'s name strongly reads as if this function
>>>> were
>>>> intended for checking whether a fence is already signaled. Also
>>>> the
>>>> boolean it returns hints at that.
>>>>
>>>> The function's behavior, however, is more complex: it can check
>>>> with a
>>>> driver callback whether the hardware's sequence number indicates
>>>> that
>>>> the fence can already be treated as signaled, although the
>>>> hardware's /
>>>> driver's interrupt handler has not signaled it yet. If that's the
>>>> case,
>>>> the function also signals the fence.
>>>>
>>>> (Presumably) this has caused a bug in Nouveau (unknown commit),
>>>> where
>>>> nouveau_fence_done() uses the function to check a fence, which
>>>> causes a
>>>> race.
>>>>
>>>> Give the function a more obvious name.
>>> This is just my personal view on this, but I find the new name just
>>> as
>>> confusing as the old one. It sounds like something is checked, but
>>> it's
>>> clear what, and then the fence is forcibly signaled like it would
>>> be
>>> if
>>> you call drm_fence_signal(). Of course, this clarified by the doc,
>>> but
>>> given the goal was to make the function name clearly reflect what
>>> it
>>> does, I'm not convinced it's significantly better.
>>>
>>> Maybe dma_fence_check_hw_state_and_propagate(), though it might be
>>> too long of name. Oh well, feel free to ignore this comments if a
>>> majority is fine with the new name.
>> Yoa, the name isn't perfect (the perfect name describing the whole
>> behavior would be
>> dma_fence_check_if_already_signaled_then_check_hardware_state_and_pro
>> pa
>> gate() ^^'
>>
>> My intention here is to have the reader realize "watch out, the fence
>> might get signaled here!", which is probably the most important event
>> regarding fences, which can race, invoke the callbacks and so on.
>>
>> For details readers will then check the documentation.
>>
>> But I'm of course open to see if there's a majority for this or that
>> name.
> how about:
>
> dma_fence_check_hw_and_signal() ?

I don't think that renaming the function is a good idea in the first place.

What the function does internally is an implementation detail of the framework.

For the code using this function it's completely irrelevant if the function might also signal the fence, what matters for the caller is the returned status of the fence. I think this also counts for the dma_fence_is_signaled() documentation.

What we should improve is the documentation of the dma_fence_ops->enable_signaling and dma_fence_ops->signaled callbacks.

Especially see the comment about reference counts on enable_signaling which is missing on the signaled callback. That is most likely the root cause why nouveau implemented enable_signaling correctly but not the other one.

But putting that aside I think we should make nails with heads and let the framework guarantee that the fences stay alive until they are signaled (one way or another). This completely removes the burden to keep a reference on unsignaled fences from the drivers / implementations and make things more over all more defensive.

Regards,
Christian.

>
> P.
>
>> P.
>>
>>
>>> Regards,
>>>
>>> Boris

