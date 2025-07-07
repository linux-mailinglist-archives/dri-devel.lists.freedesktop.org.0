Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF875AFA8AC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 02:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5592B10E272;
	Mon,  7 Jul 2025 00:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZ1svor3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE1910E272;
 Mon,  7 Jul 2025 00:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751849253; x=1783385253;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DDxZayI1Bs30RUHiwOJ4GMh/aX3l05IvEO9SlXsEILI=;
 b=IZ1svor3gQSfws1Apg4gs4apag01Ia1+cNsEJ/4Bv89ESACEA6ByQ/zm
 Sv2MGsEGU8uWrXu53rXSBHNFZvxf5+XPRfHwJZih6L4GXIlYN5ZadGtSM
 yJEN6F8RYcQ/oxow8L5fiNPY3FqXd1kbaOkPw2qjGfMYikglWsoOoD2yf
 JYqAx/OnEKV41QmT1XUdw4PuGaebZ04TZjwwSFCJbNTP/o4jqzhisc3Cd
 UTXvGlRX4EbqdFpvGMdEPcrvn1sE7o7fx1wlBu4wsOokWzhp1ZwmhpELG
 WDsZ1mdXWufP7InRmtF9Cm6Cq8BABAp++EzZsZtw1rJmjwZ0NLJwzNNRi w==;
X-CSE-ConnectionGUID: 6O4lVLgNRnucF9kbSvvSLQ==
X-CSE-MsgGUID: O02ANfuESUKaVlhDjPG05Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64753692"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="64753692"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 17:47:32 -0700
X-CSE-ConnectionGUID: i4PXHjOVQy6gCT80jPTvWQ==
X-CSE-MsgGUID: yBNDLoBqTeqj6UQlikIToA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="192261269"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 17:47:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 17:47:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 6 Jul 2025 17:47:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 17:47:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQJb9OUP0tx+SAuSOip7clCNAOvAfL0jBa1yRFHQu/gTp4X5EdK1kZ2Q/wR50pRc1ydh/+rreKoKS4CHNKlQ0aHETZODJEzEdggun+BDXj8EZi5jR3I9zHiq9TyNGF4jHCSitX/NH1Qnau4AR3Fvjvg8BT1hMg94xW3GwBV4qQV6dzYxDwGJueZ/UowRZGB+dIgBpqwz7hm3ZplRVGR31VkmAklw/TKtGqFTil8WiOeag7mRKse6aj19FpXutpvSZkJ0jbVBxrs5/mtvvk5ZGrVyHbT3nhg0tSfGMNjXPM2dOZrq4/gYcLm7Kck9dFUnvj9FlSWCMlotV7tu8cJXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kp9Xqv43yFmpS9Z05S5wwDFXcW9r7drbg0BwnWiPY6s=;
 b=RAGYmmavd9CKOXagSnhFOYUYy3BOmVAh8FZ+WuJzYJf/nIds2rp3peWgMpDL2emXU5SnSoPLLQ8GIccvHh8/e+slgEedNcRRhOfZxt998JEcINxulbgPnrtyTK3ADOrQzNvHYrjuq8zrcPB/OWNaRnqAgngXI8xhrHew4mV17K9wnB53kKkiVOLAAkf5yEEU06xCIe9f48ly3uaCwaY8UTzoNOaEmAzK0LEZ83S/Zmo7TzQTas71wK1UpkvaagiEDRLAVR3hYa6hqiJPoK524Delz7TAO7hCgfv7IMv8F+aTIPe0k1ntQZ0n6maKlnmrxS9WjKhFDkI3wil85iw31g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 00:47:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 00:47:13 +0000
Date: Sun, 6 Jul 2025 17:48:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
CC: Samuel Zhang <guoqing.zhang@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <rafael@kernel.org>, <len.brown@intel.com>,
 <pavel@kernel.org>, <gregkh@linuxfoundation.org>, <dakr@kernel.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <ray.huang@amd.com>,
 <matthew.auld@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <lijo.lazar@amd.com>,
 <victor.zhao@amd.com>, <haijun.chang@amd.com>, <Qing.Ma@amd.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/5] drm/ttm: add ttm_device_prepare_hibernation() api
Message-ID: <aGsZeOFhBcMAl341@lstrano-desk.jf.intel.com>
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
 <20250704101233.347506-2-guoqing.zhang@amd.com>
 <5c4f5f0d-024a-46e5-9506-0b589f6cce5d@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5c4f5f0d-024a-46e5-9506-0b589f6cce5d@amd.com>
X-ClientProxiedBy: SJ0PR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:334::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: 39155841-615a-4857-1856-08ddbcefd05e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PD5amweKx6q5nEQlOrGEnEe0x19NQt+leMbEg3zeQFA6mcRm5icVxMAT/rrZ?=
 =?us-ascii?Q?Xj/vrEX0DhnhmzoCvmLiT32MQ3gRIe+l7sl2HcVjTw3judbH3kbVMy7YgAfV?=
 =?us-ascii?Q?Dh8yJDlcjUkCgLsR40eUMKC8kdeazW05KfUb2uLMQtx0VK6z8N1VTpcmV8LR?=
 =?us-ascii?Q?Fa6V5gCH81AZAwSnEnBdg42cRJLpWzxUhYILSwAPE1YGPQ0G/yJx2cDYkzBC?=
 =?us-ascii?Q?d9LPiiSOMIkxAY+nQORk0+Ou1FwqfWqcM2Ok3RmobGeKGkMAweE/8bdvk8GS?=
 =?us-ascii?Q?evxTPlTYAcgvDdz2YjVCTnecwvR3eXPl7FCoqgZMRjD1mwaYHNb/j0Cz0947?=
 =?us-ascii?Q?WxP4w66gupmhaHyWhfUZv3nwiC+xC5jZ7u1VDO73i8gM5ForQNHDPndNJuCR?=
 =?us-ascii?Q?pb1d0yJtyPjcHyadwxwDtXZmxD32iuXeXmTmJl9I1UCyuSwGFHRfkRu/4fF8?=
 =?us-ascii?Q?j0qK6J54MIj2yYQHGU3B/NRhdWDAksnqv03sSPDt679/5jlyyq4YEa83UP3N?=
 =?us-ascii?Q?ra+tP6ai/Alzl0rRla3yJ7kphqoiPWcLUpIFy/gGM2dWCjWKJNtr4ir8oS12?=
 =?us-ascii?Q?dIJcH4ytNNMWGJm7jgt0EMu0haY5odKgX+cycCTT+iM4aCAj/maS6sB+DgdL?=
 =?us-ascii?Q?OBLPf/iy3EsCO02StSSiJWBdyS9U3XIEa7VilWKh8+FtCsWZR3OGXxEPzMl6?=
 =?us-ascii?Q?S+/SH1hMbBHebnCzY64bshYehCbgcnjxxS7K+Wcw///uHC3AgxmTAsAdYb4N?=
 =?us-ascii?Q?wZ+c6Pki4XbQNFRg4ZahzA2TMtkoM2Xk8JN0kBMS5pbeicbeMBYsrrSKhYPj?=
 =?us-ascii?Q?VAUaKDjlxtuJr+MvLKEZ3neyvN738QnPJBaOZTFQwOiST16yuJKF+r+IJSSD?=
 =?us-ascii?Q?+DohFaITWDKL73yganrnSZaprSfZQvG86y/ChkZ3MI1UOb22Tp+o4WaKAu/Z?=
 =?us-ascii?Q?mA0bAeCHzlrjh7y1Q4WDEsxxTxSMCXTFU1bGjwWrN43XIeB/mSXNNZn6pqBY?=
 =?us-ascii?Q?CLqnZAyU0EQhO8WNgoQrnBhsFqUnbwj4Z5hu9odxbfVTWAVrOIxPUHjS4k+/?=
 =?us-ascii?Q?SqOhPw6C6uY0/GAbRTuavhLcF54RJFUKHm7W8/poipbhhypNF+0LQtmm+cm9?=
 =?us-ascii?Q?Bo/Ad7DH1VK05SW58+Da0ZUTDAqpxSsnWI8G/YGqc72uGfM0bUD+WvF3zc1W?=
 =?us-ascii?Q?wxASRrUh1H7BUNmO09JEWpL5mMF4lwbcCd284U2KpHcKVh3RFKvyloaY9beD?=
 =?us-ascii?Q?kM6regfBAuD8yg4DKzJzfqUmwwSOLUZG3D63YayMywKa+eGAE09XGloBJGO0?=
 =?us-ascii?Q?HWJCwVBQObIvG+OmInCRnCGi/lzHmenSHEkoIBX4VXLYSQKFpQVWzraObj6w?=
 =?us-ascii?Q?GeS481JjGY+D48aSckR7OpPZ23Spv+tJy0vnbmoviRZum6dqaxMCfrEMum9h?=
 =?us-ascii?Q?DMAoi9WDOJE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pajov32B8661pv9EFfxdDcyL/yRxBj9PutqqpIuVYZUqdJRqfHrdy51PQErt?=
 =?us-ascii?Q?q+sXaAOPGFlG3uv+BdcJ80rt3rfl2s0dmjWoCNkrwycastY5W8fEdYx4cCBn?=
 =?us-ascii?Q?FpRjxQqO2GNJKbwpNdWg9IGpZEahd9YrdFQwpoNYq+4DJenZIkmlOtLVVwKf?=
 =?us-ascii?Q?NSFm1fN8JZ9wzwjjJKnVF0ASeOYMwnFctHFhxVRtzuNQhzTs+xB/MgnOgGbc?=
 =?us-ascii?Q?akzV0N0MUPvky9v1Uavg8A++J2sNRcjWkIzN49L5zEAv9yzyNOI2AQKpYUWR?=
 =?us-ascii?Q?KMltZsF31EccShgOxYY/BV6R9A1uz5AahDhs/xYBA2ojomv/A5ArP6/gExwa?=
 =?us-ascii?Q?BrO8Cnl5U3pqsE3qIiqbeu0EJhFtJTAxVTBjlL3adaMvoYG94nK/WOeLIr0b?=
 =?us-ascii?Q?uTL5hcNLXlt0J9N0Wd+8X/D1sLnJhnzhgSej30WY1kDesKBhbZOrjHWxvBSv?=
 =?us-ascii?Q?dS5hNwLRVTIE8No4Fyn4eT7qRFOZS3sQbSj6ciBf74K+B1AJkpnS6iPxzHme?=
 =?us-ascii?Q?QciWE77OsQdUdTivXABEnbNoJ0u47eOnaIGDWmTfau1v825KjJtGrFOZmkFi?=
 =?us-ascii?Q?2HwQTPBCEazHBo3ELraGCxVS+EsYu7s17pg1I2Bp12IjdBDnhR+0+zLlScZ3?=
 =?us-ascii?Q?QBsiTBZQ11UGuDpB7O6zbXy3JNIs6WrBKHEeKbRMP3xDmH4FUtPpzmqVLVNt?=
 =?us-ascii?Q?oXPZyD5DipApQFyh8BZjC/+8Acw/gAfBeVSUPmB3P11VqlJch/9qr2pi1hRP?=
 =?us-ascii?Q?bCtVuWcCZFuPeOZznw/FS6PscrGMGgegvRM8QZeAECSZ1RU4ROuvcWPyjY5z?=
 =?us-ascii?Q?MmeH8kuVb/qja8eVuwsIgOTD5GyDktHOq3cU9ObZs+seafjcUYjhcO7UFUOw?=
 =?us-ascii?Q?UiGKc6ByUAcEKg7qPk/F2+GzAOPiclGKiFNPgQEHa+MAAKClul/sdcBWwAWD?=
 =?us-ascii?Q?GZSrsF/0fLD3liidzlkNZ5ArE65cogpR3sDpnPvKL2sD+e/ZovfjmjeiDPk2?=
 =?us-ascii?Q?JNCJv8LVn935TpLIXkrY23vLEjNHjmRRGObswOf8MJmf1HK/aWdj6qlJYZYG?=
 =?us-ascii?Q?m2pS5IgdwMAF4GbDJEwzrWKOc1Ku/tHBbHzIzTJxSAlCJ2Tf2G+nXAIQPfOt?=
 =?us-ascii?Q?Gl+SVb5J1N6nNIli/OBm/mzr64KEXXo0WQIdspWfvU1FEeRamHduadistrUM?=
 =?us-ascii?Q?qoJaZnXHYW1LmVPFRghc/pyzH1aF1NY5tRILJcKY7KiBPjchOe05q1dn2rA4?=
 =?us-ascii?Q?fCMFLCGprwRjSicrs1NA1Du0OeoeeuMHjFemTikgQISAAWYEM+gVJXfIGa5X?=
 =?us-ascii?Q?+yKZEn3TqlG/PPNzKt2nkys+cgqhRc3YF9p1bb75HJRu8xLvmCIfi5axlWBo?=
 =?us-ascii?Q?JyXZZNAQPymWwHev8sfZthIInoHA1Bq2doTKs5O6+t+ijLGdzH7ontloCgTM?=
 =?us-ascii?Q?GuZ4puBUGbS+JwzPbzwa4vXPu+m/JX3n8+LqExnCalXKs1maV8YDODUwdok6?=
 =?us-ascii?Q?O6WNNHEbu5C0HNPKKfdW9vgRUoQCcbRADKqea50qE+mJqUqpV1s21Ajmwkiv?=
 =?us-ascii?Q?5KMYOJfPrWRHjCSNvaqoZa1S0MWqb1VACx2vPIwdKcs27Vrfuf7279kn3kGi?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39155841-615a-4857-1856-08ddbcefd05e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 00:47:13.8097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OiTb03/y+JCtzqSdIhTOARPa3KL84wrTU/cA54lgP9P3DcsDZutUj/J8lal/7b1xoMjnIBtwmnWq5cVbKuPJkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
X-OriginatorOrg: intel.com
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

On Sun, Jul 06, 2025 at 04:44:27PM -0400, Mario Limonciello wrote:
> On 7/4/2025 6:12 AM, Samuel Zhang wrote:
> > This new api is used for hibernation to move GTT BOs to shmem after
> > VRAM eviction. shmem will be flushed to swap disk later to reduce
> > the system memory usage for hibernation.
> > 
> > Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_device.c | 29 +++++++++++++++++++++++++++++
> >   include/drm/ttm/ttm_device.h     |  1 +
> >   2 files changed, 30 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> > index 02e797fd1891..19ab35ffeead 100644
> > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -123,6 +123,35 @@ static int ttm_global_init(void)
> >   	return ret;
> >   }
> > +/**
> > + * move GTT BOs to shmem for hibernation.
> > + *
> > + * returns 0 on success, negative on failure.
> > + */
> > +int ttm_device_prepare_hibernation(void)
> > +{
> > +	struct ttm_operation_ctx ctx = {
> > +		.interruptible = false,
> > +		.no_wait_gpu = false,
> > +		.force_alloc = true
> > +	};
> > +	struct ttm_global *glob = &ttm_glob;
> > +	struct ttm_device *bdev;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&ttm_global_mutex);
> > +	list_for_each_entry(bdev, &glob->device_list, device_list) {
> > +		do {
> > +			ret = ttm_device_swapout(bdev, &ctx, GFP_KERNEL);
> > +		} while (ret > 0);
> > +		if (ret < 0)
> > +			break;
> > +	}
> > +	mutex_unlock(&ttm_global_mutex);
> > +	return ret;
> 
> I'd personally rather see scoped guard here so you can return immediately
> and the guard will clean up but up to Christian what he thinks.
> 
> int ret;
> 
> scoped_guard(mutex, &ttm_global_mutex) {

guard(mutex)(&ttm_global_mutex) would be more apporiate for this as the
scope of the guard is the entire function.

Matt

> 	list_for_each_entry(bdev, &glob->device_list, device_list) {
> 		do {
> 			ret = ttm_device_swapout(bdev, &ctx, GFP_KERNEL);
> 		} while (ret > 0);
> 		if (ret)
> 			return ret;
> }
> 
> return 0;
> 
> > +}
> > +EXPORT_SYMBOL(ttm_device_prepare_hibernation);
> > +
> >   /*
> >    * A buffer object shrink method that tries to swap out the first
> >    * buffer object on the global::swap_lru list.
> > diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> > index 39b8636b1845..b45498b398dd 100644
> > --- a/include/drm/ttm/ttm_device.h
> > +++ b/include/drm/ttm/ttm_device.h
> > @@ -272,6 +272,7 @@ struct ttm_device {
> >   int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
> >   int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> >   		       gfp_t gfp_flags);
> > +int ttm_device_prepare_hibernation(void);
> >   static inline struct ttm_resource_manager *
> >   ttm_manager_type(struct ttm_device *bdev, int mem_type)
> 
