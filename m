Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47650C4A2CB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44B110E4AA;
	Tue, 11 Nov 2025 01:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAi4np9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204B510E4A4;
 Tue, 11 Nov 2025 01:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823136; x=1794359136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ool7qvo8qCFT1OuzfhinX/prfL2pYy/BKCx2e2sC7kU=;
 b=iAi4np9vf1VnmiFlpQibxjm7M3fiKkWQ8FkFl70zar98omgyG78jmsYf
 4AiFdmakoJTEb6P2d+koHvQeiZTuXyfZsJ9yTasFmNFgy5Cc3ilI/P6mN
 Ta/4nocvhZgEM5BcyJ0Uhwror2NTNyaaxnwD4wCx2D0nMhj7ulCdgiBv9
 9S7a/pnbXPRE+Td5Lzk19lEunbdbZWbsQPJXTykyMhPMN9pmixy1wluDW
 X+n8Q6XXra/4QtUsPngA/g1C83LbjM2itWy+bt1kCGzCbrPV3rTG4LlO4
 2kWpbUqFYfu8VHTo42I3BLgKrvQU97TIJ63PKULqBoeSba+aK8FFVln8U w==;
X-CSE-ConnectionGUID: 9jGP4xfKTJu2jFz9RFoD/w==
X-CSE-MsgGUID: jMaIW9RvReqb4R0higTR9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="52437987"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="52437987"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:35 -0800
X-CSE-ConnectionGUID: 15NyBxSQRkeEti9GC/S1qw==
X-CSE-MsgGUID: pwj4YCv/R0eEonmoMeh2Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188081788"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:35 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:05:34 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+rwnKbmagouBe/Nf69BNTcs+dBVy7OpYktHSqYC+FaSaRei1HYYI6U4VrqzzwxTU3sobGkrxaBeIAf0W4f8PUg5b/2XaSboXFXU4nHo8Ub/Lf1JYzuvJzZ+N2ASuSKX4VzDVS0C4FFNu9N9m6yl0wdANgD386YGPIfnM49UbbJNL/t/GvyeFnOj+SnGdwEZSSkhCAWZ0ETEcszfUo4eFrXjM9XYKPjcr1+7/O1TSADQD6YFTzsCGBe9Jd1PUN8hApz4pHIYBC85rKOWPfHkRTV90GstBer7Mrx61RFLMKXwzpZrLcb8KYypCwYLkE8eiDkpHFG5cdfD6aB/hZKg+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiAyE25NNse2DSiThERL/4tFn1532FaPTy1ZEXfhHL8=;
 b=WAJ0uuzLbAD5RwUzFtzZr0b/3fFxSiQ4yl0/pMWpbI6VE7KTPFeDzriA/CrD66VNshQwq9TkE2H1q+I2xmgJjxW1WWwMXwQGLmCD0pXLZq8C1PZjBuXGvI1x/+S/RvsO9q0IFn0EXj0mX3N7VcIowJasc0hWATy612AANbHz7CnFelLl2052hnqXX3HPOEmHxKfsavJi1WnCbIV4SAoiX+ACRBNUwPXa9GVIAiT5wl5BMerzvXNJJ/ZTiuUHEMYm6U6TEHRuoZjTlJyNfb9vM9p0v+e8VSLHz7PHTowxX/LIcVciRFH3SuIDKm0aqtmxnMPnmAtd9x/AGPFsEXSwEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:29 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 05/28] drm/xe/pf: Add data structures and handlers for
 migration rings
Date: Tue, 11 Nov 2025 02:04:16 +0100
Message-ID: <20251111010439.347045-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf4f64c-7fd5-49fd-61f8-08de20be6820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDRZRHpDWkJka3RzR0ZKcmYwTEFiQnk0L0tWV2hVZkttZTkzZ0toSHE4dVhY?=
 =?utf-8?B?c3FlREhodnJOMSsvSzMxRXZQOEhyR0lIaFh2alZIVDdjOWdFRXRMYUE5SmZa?=
 =?utf-8?B?VFNyZVIxQXpYajNEKzF0UHpWc04rNmFEZU4wOWU3SG5uTEdQVG5zcEtsaWpj?=
 =?utf-8?B?eU1seW53WFdFTmVYaGxrNTU2WU54ZnhaWU9GZ3FqZVk2aFhsa2FST3ZtUVFr?=
 =?utf-8?B?UkU3dWN5M3RKMDBLMmhvRFY4N1ZCNWp2amJtdTVLdUV4ekNVSU5yeHVqMWM2?=
 =?utf-8?B?TEFjOWFlME9veENzNWRYR3psc29XNTdnT1FQT0hwVVpkd3NzcnJmVmJjZTlG?=
 =?utf-8?B?dWV1OEx5QUVtQlNwTWZQN28vdzNmcmVOT1pKRjVaa0lSbUYzeFhFNnhMWkla?=
 =?utf-8?B?T0s2NHFjbittcFlwQXM1ZHBhcWRTbllKeDdpUUFqM1Nmdi81TkJIOVVNSm9D?=
 =?utf-8?B?ZnRKSHdwSWhjTVlNNkNpeENISHRubFRSRFBjcXMxbDNCTldmY1NEemw1bVJ0?=
 =?utf-8?B?TEJpeTF3cVZ2YmMrSmR0Z1lzQy82NGNreWhsTWZ2Z2FscEptTmEvVU5GOGJR?=
 =?utf-8?B?L0FoeFRjNkpqUW5GOGtIczlrckJFN1kycElEMEw4cWtTSG5qa3h4VTk4Smhv?=
 =?utf-8?B?T0lTcmhES3ZpUno5alJRVnYxOXN5YmMzeFhYeVlObTJtQmoxNzBnUlpTVk44?=
 =?utf-8?B?SkJaR1ZxWlZTSUxpSTNFVVNZRFVjUndkdDN1TUI0U2NiN05HZVRiVjYyL2lP?=
 =?utf-8?B?OUVVazRyNXlvdnNvMDhKN1BrK001c09OenhYeUtvYnlWajc1dGxjVVE3OSt3?=
 =?utf-8?B?K3F4TEo3Q01WQ29qVlF2SW5WU01vMDVFMEFmTy9zMEdhTVRUd2VjWmM1NDha?=
 =?utf-8?B?R1k5V3hnRk8rc2E3MkhBQjJ5dVRlb1BpajNQWGdUT2FKblN2b25QOC8vQjZ5?=
 =?utf-8?B?eVZEc05OeTBhdG1ycmgvMWdyODlTeldvMzF5b214K0QzMVZMYXg4d2hzK1gr?=
 =?utf-8?B?ZFI4aHMvb0JWMWpJTWc1WXkzVktJeWIzOEluMmoxUlVXRmJNWkRXKzkzRHBB?=
 =?utf-8?B?OFRtVGdlSldFOXZ4WTNNVmpjTC9aVS8vVDBobjRyMzJudFQ1RVE1R3VKd0lH?=
 =?utf-8?B?dFRucGQrVGY5MGVXL2pKSTQ5Y3VjNThxcVdSSDBZZzJwQ1VqaGVZdVVwUVU0?=
 =?utf-8?B?ZkNjbnlhVVM5R0kxeGtPS2x6QjA1amtFVjJTWHZqbTF5c1RNQ0duQ3N1OGUx?=
 =?utf-8?B?YTkwM0VSRnpmdzBORG1vVmoxV3BPendJUDlLNE1aellycXhNM3Y1dXNLYmdk?=
 =?utf-8?B?Y2R1UTU3SVpic3o3dUhPUkJ1dFdSWFZnZk1yZ2dXOCs5NXVUQmFpNG0yMis5?=
 =?utf-8?B?aEhWMm5rNDZMU01tajJKK0Zxc2ZhR2JNeDBuRHgyWGVNa0FKVDZPQXZwd3F0?=
 =?utf-8?B?enIvaktQeFBsZVorRXE2Y1RqbGdtOG01MlY1OG94U2czTlRUSXdQbUxRVUdm?=
 =?utf-8?B?Nk15K2pVaERhdER0N25kbDBlU2d5TXZQVnp3QlJNd2wyVGZiU2V3NHQ0eTF0?=
 =?utf-8?B?U3owSWNha3lDUmJsMWMrNFpMaGRNNlBiak5uOUVPWVdCZ1hFUUwrWDV6Y082?=
 =?utf-8?B?N0NOaktmZ1RGbE9rSDExd2psWTRSamxXWlhEVTNKQVg0dkhaSnUwZTlpRXRD?=
 =?utf-8?B?dWQ2SHNxLzVuL05uOTBRU282cUo4NVhyeGd3ZDlIN3BDNkdNZ0VNR2dvWGRt?=
 =?utf-8?B?UU9yMjYzaHV2eFVhS1ZHWTdEalhGQk91NSs1Y0J0ZTFVZ1dkbm9Tb2dJT1Q0?=
 =?utf-8?B?bFpDc3VXc2VpNW04SjlabHF4Rjl0dm82TS9hbC9pbFlyd254NThmbmJrNUZH?=
 =?utf-8?B?YmxMdXdpUDJDcHM3SUtUMzhJVlhtdTFXeEYreU5kOUQwUkxpWlNLamhDNW92?=
 =?utf-8?B?UzkyenBBWXRaelV5aVVhSzVaU0FFeE5sQ3ZXVlVsWDhiNjZXS0l2eFpSRmt5?=
 =?utf-8?Q?OmPfSWyrwS0QhmiVpMh4c/GFTnTtBM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmVNRFNwQTJlb3RJTkszbTNaVmUrSzdBbi9RZW0zcE9aUjBTZzg3d1pCTVlH?=
 =?utf-8?B?M25qbTFKOTZTRFhmeVdVM085a2g0Z0xtZXpRTGRlL1l6bDRPK0tTc1hEcXNl?=
 =?utf-8?B?cmVVNE1IR3pnc016c2JySXNDNWx1emRYM3ZUcjBTb1owSGFCdTNrdTFkNk5M?=
 =?utf-8?B?c0JXVXVxZlluSm1WNStHeE9qRzR3Q2g0eUgycmF3YUFQeXdhb2ppdFlrS2hM?=
 =?utf-8?B?YzI2S1MzZkc2WThEWmJpM0RqOExscXI5ZU0zTVJzNnErNTVrc1RNNHR5M0Mr?=
 =?utf-8?B?azBNSXpLR3huYW1qNVduWEVnMzBzeEV3dGF1dmI3T1V0NUxHR3VXaEhOUFY5?=
 =?utf-8?B?cjBZODUvby90MGlncHdEOUxxZldGbDc1YlgvZzJuNExPY3dyTVdpZ0pFc1Uw?=
 =?utf-8?B?TmY3cEJDOExCaXd0ZUgyNmJEZ0pMQXhXb2NLVkpmeGJaZmFCS3dhU3ZKQm9S?=
 =?utf-8?B?TmQwVFhpM3VCYk8raTYzaS9vczhjL2M1eWJCdi9UVTdQWTFlT1c3em9RUFhu?=
 =?utf-8?B?bnNoblNJNWc4ajJFZ2o2NVdPNjJmNGpNb1F0L1BkdENwU2JEYXdxWm1LYUdR?=
 =?utf-8?B?RUdxWmZIeGd3YnQ3VmRXcGhtaTUvNU9RRDVRNEJxWlNxVW1pRUx0aGpueDRX?=
 =?utf-8?B?NTZXalNXRlVRd0xubDc0ZDkxdWFWRnpmZ3R4Mit0Y2dGajkzc1pLeStlYmp2?=
 =?utf-8?B?Q2dHUDV2cVZ2MEtLWUkxdXNkWElNYW5oem4xQ1FWdkl2VjhRR0FFZ3pNOXov?=
 =?utf-8?B?Z2hwbTVWRkJKM2lqL1J3aHNRcFZDSyt6MW41Y1paMEV6VENnbXAyZlB4TFl1?=
 =?utf-8?B?cnR1bHFGNjNMUkdnSkc0bGVtR1JwWHBYODhQWEFyQytFY3BzSWgvMU4zK3V6?=
 =?utf-8?B?ME1NakplQ3JyTS9EU1RzaHVjMjhrMUN2WUt1Tm1QNFhVOTJURFNwTTEwSjhr?=
 =?utf-8?B?eFIwZGhUckZOdG9FdTBDVm13Rmo5ZHQvR1QxL2xlWmRLQ0VGOGV1QWp3aEx6?=
 =?utf-8?B?OGtUb2crNnYxbDM3M2FicitIKzdjc2VYaTVQQ09RZnNBdS9mbis3ZW10anR6?=
 =?utf-8?B?QjdhMGtyNzcvUGMwbkpxbVJ1TzJITnlpZ1RHV0N2M2FoUVo2aUswZFF3WWN4?=
 =?utf-8?B?STZ2dUVOVWNXRXBtQXBPKzNyc3ZqaDRUbnRYWURKVHY5alJDYllYK05qL3BX?=
 =?utf-8?B?Y1p5V3FWeWFOSDZMcFRhaEgzS25BSXFSUCtFa0c0eEdJYlNEbFAwQVc1U3Fy?=
 =?utf-8?B?T1R4V1hNSjFlaGxZNUhYdEgzTnY4TXRzckJuZW42NHRZWjg0M0VjTTN6Mmx5?=
 =?utf-8?B?VklyNDROV3gwT3g4OE9DQkgwWVhkSmo1S3BzN3poaTdFZlpNc28yd3oxUXRC?=
 =?utf-8?B?SWF1RW1zdC9BTmJ2aHhhYnAyYjY3V3BXSUR3RzVNV3o5ZW5sbUtFTHRaM21Z?=
 =?utf-8?B?MnNCa21LTFZueU9zTjNBVkorUWc0K29DS0syTlo5VC84Wm5uekZ1RzV4TGxQ?=
 =?utf-8?B?eHFxTlUvaUxJMDYvWnZWbnVIMkcwVjRTVHpsbjJRMXo0MUdldVN2eXppN051?=
 =?utf-8?B?S2FqeE9xL052U1VEVE50elo5WjNDWVBwU3loM0dLM3ErYTlDV3RVVW5QRGh3?=
 =?utf-8?B?dUVWQmU3REJabUlTQWc5THdhSEhlUWhKNUdXemtDajNVV2RCWWV1ZnZleVQy?=
 =?utf-8?B?T29RcWhyU2RoMTRId2lTeTF2dHpVZDJISWUwSVBtd1pPZkhqQWJaQm5meE05?=
 =?utf-8?B?K0NqRCttamoydG53QTBVWE1lbUJkZzNSeTBHUG1XRm9sMmwrd1Jib0R5Z2xZ?=
 =?utf-8?B?ZnJxUUZIWHhzTUxNV1l1d09IejVjQjVSRllPWHM3aUM0c3ZwQ2NjUStMSTJC?=
 =?utf-8?B?bHFLZktmdDI4VmxnZHJwYWFIWU9nU1A3K3NqT3FkeXljb21mNVAyWGNqWTg5?=
 =?utf-8?B?dEh2ZHNuY2dFMWxtMm5KU3NVQlJLY21uTnlPREhHZzg2bGJNZVBNMzU4QkY0?=
 =?utf-8?B?N0lRRUVtdERHUEdaZ3p3V3NSU2RvN3lFSDVIcHFvb0RzMDVWVzQxKzBaVyt4?=
 =?utf-8?B?cWt1Z1MxOTdxV2NzZlFmYUd6QW9YWjB4eDRqWmdPcVhpMTRiL01vZlVXQU5s?=
 =?utf-8?B?NXdvRk5WdER6QXlBa1EwNzd3bkFEdllwVGJYYVlKTm5wcHo2S1NRYUR2T0pk?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf4f64c-7fd5-49fd-61f8-08de20be6820
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:29.8536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiZiZaxuw31LVLHI4j1eezQ4rr0wxxtfkg244TBB3SGjjuTpeKlscsxZVk2DZmFz09HeXzjZPM9qi05ydc2ve7S7Bx0AOZouNbF8YLG3bqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

Migration data is queued in a per-GT ptr_ring to decouple the worker
responsible for handling the data transfer from the .read() and .write()
syscalls.
Add the data structures and handlers that will be used in future
commits.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 311 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  12 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 200 +++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  14 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  11 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
 drivers/gpu/drm/xe/xe_sriov_packet_types.h    |  55 ++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 144 ++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   7 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   2 +
 12 files changed, 761 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet_types.h

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index a571e1c02a3b4..bea19e7a4d18e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -18,7 +18,9 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_packet_types.h"
 #include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_tile.h"
 
@@ -185,9 +187,15 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
 	CASE2STR(SAVE_WIP);
+	CASE2STR(SAVE_PROCESS_DATA);
+	CASE2STR(SAVE_WAIT_DATA);
+	CASE2STR(SAVE_DATA_DONE);
 	CASE2STR(SAVE_FAILED);
 	CASE2STR(SAVED);
 	CASE2STR(RESTORE_WIP);
+	CASE2STR(RESTORE_PROCESS_DATA);
+	CASE2STR(RESTORE_WAIT_DATA);
+	CASE2STR(RESTORE_DATA_DONE);
 	CASE2STR(RESTORE_FAILED);
 	CASE2STR(RESTORED);
 	CASE2STR(RESUME_WIP);
@@ -804,9 +812,51 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 	return -ECANCELED;
 }
 
+/**
+ * DOC: The VF SAVE state machine
+ *
+ * SAVE extends the PAUSED state.
+ *
+ * The VF SAVE state machine looks like::
+ *
+ *  ....PAUSED....................................................
+ *  :                                                            :
+ *  :     (O)<---------o                                         :
+ *  :      |            \                                        :
+ *  :    save          (SAVED)    (SAVE_FAILED)                  :
+ *  :      |               ^           ^                         :
+ *  :      |               |           |                         :
+ *  :  ....V...............o...........o......SAVE_WIP.........  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |             empty         |                      :  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |           DATA_DONE       |                      :  :
+ *  :  :   |               ^           |                      :  :
+ *  :  :   |               |        error                     :  :
+ *  :  :   |            no_data       /                       :  :
+ *  :  :   |              /          /                        :  :
+ *  :  :   |             /          /                         :  :
+ *  :  :   |            /          /                          :  :
+ *  :  :   o---------->PROCESS_DATA<----consume               :  :
+ *  :  :                \                      \              :  :
+ *  :  :                 \                      \             :  :
+ *  :  :                  \                      \            :  :
+ *  :  :                   ring_full----->WAIT_DATA           :  :
+ *  :  :                                                      :  :
+ *  :  :......................................................:  :
+ *  :............................................................:
+ *
+ * For the full state machine view, see `The VF state machine`_.
+ */
+
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
-	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
+	}
 }
 
 static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
@@ -821,20 +871,58 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_wip(gt, vfid);
 }
 
+static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
+
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
+{
+	return 0;
+}
+
 static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
+	int ret;
+
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA))
 		return false;
 
-	pf_enter_vf_saved(gt, vfid);
+	if (xe_gt_sriov_pf_migration_ring_full(gt, vfid)) {
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
+		return true;
+	}
+
+	ret = pf_handle_vf_save_data(gt, vfid);
+	if (ret == -EAGAIN)
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
+	else if (ret)
+		pf_enter_vf_save_failed(gt, vfid);
+	else
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
 
 	return true;
 }
 
+static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA))
+		return;
+
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
+	pf_queue_vf(gt, vfid);
+}
+
 static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
 		pf_enter_vf_wip(gt, vfid);
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_queue_vf(gt, vfid);
 		return true;
 	}
@@ -842,6 +930,53 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 	return false;
 }
 
+/**
+ * xe_gt_sriov_pf_control_check_save_data_done() - Check if all save migration data was produced.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: true if all migration data was produced, false otherwise.
+ */
+bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
+}
+
+/**
+ * xe_gt_sriov_pf_control_check_save_failed() - Check if save processing has failed.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: true if save processing failed, false otherwise.
+ */
+bool xe_gt_sriov_pf_control_check_save_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
+}
+
+/**
+ * xe_gt_sriov_pf_control_process_save_data() - Queue VF save migration data processing.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
+		return -EIO;
+
+	pf_exit_vf_save_wait_data(gt, vfid);
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
  * @gt: the &xe_gt
@@ -887,19 +1022,63 @@ int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
  */
 int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
-		pf_enter_vf_mismatch(gt, vfid);
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE)) {
+		xe_gt_sriov_err(gt, "VF%u save is still in progress!\n", vfid);
 		return -EIO;
 	}
 
 	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
+	pf_enter_vf_saved(gt, vfid);
 
 	return 0;
 }
 
+/**
+ * DOC: The VF RESTORE state machine
+ *
+ * RESTORE extends the PAUSED state.
+ *
+ * The VF RESTORE state machine looks like::
+ *
+ *  ....PAUSED....................................................
+ *  :                                                            :
+ *  :     (O)<---------o                                         :
+ *  :      |            \                                        :
+ *  :    restore      (RESTORED)  (RESTORE_FAILED)               :
+ *  :      |               ^           ^                         :
+ *  :      |               |           |                         :
+ *  :  ....V...............o...........o......RESTORE_WIP......  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |             empty         |                      :  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |           DATA_DONE       |                      :  :
+ *  :  :   |               ^           |                      :  :
+ *  :  :   |               |        error                     :  :
+ *  :  :   |           trailer        /                       :  :
+ *  :  :   |              /          /                        :  :
+ *  :  :   |             /          /                         :  :
+ *  :  :   |            /          /                          :  :
+ *  :  :   o---------->PROCESS_DATA<----produce               :  :
+ *  :  :                \                      \              :  :
+ *  :  :                 \                      \             :  :
+ *  :  :                  \                      \            :  :
+ *  :  :                   ring_empty---->WAIT_DATA           :  :
+ *  :  :                                                      :  :
+ *  :  :......................................................:  :
+ *  :............................................................:
+ *
+ * For the full state machine view, see `The VF state machine`_.
+ */
+
 static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
-	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
+	}
 }
 
 static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
@@ -914,20 +1093,64 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_wip(gt, vfid);
 }
 
+static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
+
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_packet *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
+
+	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->hdr.type);
+
+	return 0;
+}
+
 static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+	int ret;
+
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA))
 		return false;
 
-	pf_enter_vf_restored(gt, vfid);
+	if (xe_gt_sriov_pf_migration_ring_empty(gt, vfid)) {
+		if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE))
+			pf_enter_vf_restored(gt, vfid);
+		else
+			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
+
+		return true;
+	}
+
+	ret = pf_handle_vf_restore_data(gt, vfid);
+	if (ret)
+		pf_enter_vf_restore_failed(gt, vfid);
+	else
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 
 	return true;
 }
 
+static void pf_exit_vf_restore_wait_data(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA))
+		return;
+
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
+	pf_queue_vf(gt, vfid);
+}
+
 static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
 		pf_enter_vf_wip(gt, vfid);
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 		pf_queue_vf(gt, vfid);
 		return true;
 	}
@@ -935,6 +1158,58 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 	return false;
 }
 
+/**
+ * xe_gt_sriov_pf_control_check_restore_failed() - Check if restore processing has failed.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: true if restore processing failed, false otherwise.
+ */
+bool xe_gt_sriov_pf_control_check_restore_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
+}
+
+/**
+ * xe_gt_sriov_pf_control_restore_data_done() - Indicate the end of VF migration data stream.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
+		pf_enter_vf_state_machine_bug(gt, vfid);
+		return -EIO;
+	}
+
+	return xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_control_process_restore_data() - Queue VF restore migration data processing.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+		return -EIO;
+
+	pf_exit_vf_restore_wait_data(gt, vfid);
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
  * @gt: the &xe_gt
@@ -1000,11 +1275,9 @@ int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid
 {
 	int ret;
 
-	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
-		ret = pf_wait_vf_restore_done(gt, vfid);
-		if (ret)
-			return ret;
-	}
+	ret = pf_wait_vf_restore_done(gt, vfid);
+	if (ret)
+		return ret;
 
 	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
 		pf_enter_vf_mismatch(gt, vfid);
@@ -1705,9 +1978,21 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_save_guc(gt, vfid))
 		return true;
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
+		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
+					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
+		return false;
+	}
+
 	if (pf_handle_vf_save(gt, vfid))
 		return true;
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA)) {
+		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
+					control_bit_to_string(XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA));
+		return false;
+	}
+
 	if (pf_handle_vf_restore(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index 0286536375d17..c36c8767f3adc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -16,8 +16,14 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
 
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_control_check_save_failed(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_control_check_restore_failed(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index c0ce05818e24f..0bee910bdf07e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -32,9 +32,15 @@
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
  * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
+ * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
+ * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
+ * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
  * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
  * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
  * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
+ * @XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA: indicates that VF migration data is being consumed.
+ * @XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA: indicates that PF awaits for data in migration data ring.
+ * @XE_GT_SRIOV_STATE_RESTORE_DATA_DONE: indicates that all migration data was produced by the user.
  * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
  * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
  * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
@@ -70,10 +76,16 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSED,
 
 	XE_GT_SRIOV_STATE_SAVE_WIP,
+	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
+	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
+	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
 	XE_GT_SRIOV_STATE_SAVE_FAILED,
 	XE_GT_SRIOV_STATE_SAVED,
 
 	XE_GT_SRIOV_STATE_RESTORE_WIP,
+	XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA,
+	XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA,
+	XE_GT_SRIOV_STATE_RESTORE_DATA_DONE,
 	XE_GT_SRIOV_STATE_RESTORE_FAILED,
 	XE_GT_SRIOV_STATE_RESTORED,
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index ca28f45aaf481..47f1d85341f7f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,14 +7,27 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_packet_types.h"
 #include "xe_sriov_pf_migration.h"
 
+#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
+
+static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return &gt->sriov.pf.vfs[vfid].migration;
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -382,6 +395,178 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Return: true if the ring is empty, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
+{
+	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ring_full() - Check if a migration ring is full.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Return: true if the ring is full, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
+{
+	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @data: the &xe_sriov_packet
+ *
+ * Called by the save migration data producer (PF SR-IOV Control worker) when
+ * processing migration data.
+ * Wakes up the save migration data consumer (userspace), that is potentially
+ * waiting for data when the ring was empty.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	int ret;
+
+	ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
+	if (ret)
+		return ret;
+
+	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_restore_consume() - Get VF restore data packet from migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Called by the restore migration data consumer (PF SR-IOV Control worker) when
+ * processing migration data.
+ * Wakes up the restore migration data producer (userspace), that is
+ * potentially waiting to add more data when the ring is full.
+ *
+ * Return: Pointer to &xe_sriov_packet on success,
+ *	   NULL if ring is empty.
+ */
+struct xe_sriov_packet *
+xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
+	struct xe_sriov_packet *data;
+
+	data = ptr_ring_consume(&migration->ring);
+	if (data)
+		wake_up_all(wq);
+
+	return data;
+}
+
+static bool pf_restore_data_ready(struct xe_gt *gt, unsigned int vfid)
+{
+	if (xe_gt_sriov_pf_control_check_restore_failed(gt, vfid) ||
+	    !ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring))
+		return true;
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_restore_produce() - Add VF restore data packet to migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @data: the &xe_sriov_packet
+ *
+ * Called by the restore migration data producer (userspace) when processing
+ * migration data.
+ * If the ring is full, waits until there is space.
+ * Queues the restore migration data consumer (PF SR-IOV Control worker), that
+ * is potentially waiting for data when the ring was empty.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
+					     struct xe_sriov_packet *data)
+{
+	int ret;
+
+	xe_gt_assert(gt, data->hdr.tile_id == gt->tile->id);
+	xe_gt_assert(gt, data->hdr.gt_id == gt->info.id);
+
+	for (;;) {
+		if (xe_gt_sriov_pf_control_check_restore_failed(gt, vfid))
+			return -EIO;
+
+		ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
+		if (!ret)
+			break;
+
+		ret = wait_event_interruptible(*xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid),
+					       pf_restore_data_ready(gt, vfid));
+		if (ret)
+			return ret;
+	}
+
+	return xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_consume() - Get VF save data packet from migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Called by the save migration data consumer (userspace) when
+ * processing migration data.
+ * Queues the save migration data producer (PF SR-IOV Control worker), that is
+ * potentially waiting to add more data when the ring is full.
+ *
+ * Return: Pointer to &xe_sriov_packet on success,
+ *	   NULL if ring is empty and there's no more data available,
+ *	   ERR_PTR(-EAGAIN) if the ring is empty, but data is still produced.
+ */
+struct xe_sriov_packet *
+xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	struct xe_sriov_packet *data;
+	int ret;
+
+	data = ptr_ring_consume(&migration->ring);
+	if (data) {
+		ret = xe_gt_sriov_pf_control_process_save_data(gt, vfid);
+		if (ret)
+			return ERR_PTR(ret);
+
+		return data;
+	}
+
+	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
+		return NULL;
+
+	if (xe_gt_sriov_pf_control_check_save_failed(gt, vfid))
+		return ERR_PTR(-EIO);
+
+	return ERR_PTR(-EAGAIN);
+}
+
+static void action_ring_cleanup(void *arg)
+{
+	struct ptr_ring *r = arg;
+
+	ptr_ring_cleanup(r, NULL);
+}
+
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -393,6 +578,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int n, totalvfs;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
@@ -404,5 +590,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	for (n = 1; n <= totalvfs; n++) {
+		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
+
+		err = ptr_ring_init(&migration->ring,
+				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
+		if (err)
+			return err;
+
+		err = devm_add_action_or_reset(xe->drm.dev, action_ring_cleanup, &migration->ring);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 09faeae00ddbb..b29d34a835b71 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -9,11 +9,25 @@
 #include <linux/types.h>
 
 struct xe_gt;
+struct xe_sriov_packet;
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
+
+int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
+struct xe_sriov_packet *
+xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid);
+
+int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
+					     struct xe_sriov_packet *data);
+struct xe_sriov_packet *
+xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
+
 #ifdef CONFIG_DEBUG_FS
 ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
 						char __user *buf, size_t count, loff_t *pos);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 9d672feac5f04..84be6fac16c8b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/mutex.h>
+#include <linux/ptr_ring.h>
 #include <linux/types.h>
 
 /**
@@ -24,6 +25,16 @@ struct xe_gt_sriov_state_snapshot {
 	} guc;
 };
 
+/**
+ * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
+ *
+ * Used by the PF driver to maintain per-VF migration data.
+ */
+struct xe_gt_sriov_migration_data {
+	/** @ring: queue containing VF save / restore migration data */
+	struct ptr_ring ring;
+};
+
 /**
  * struct xe_gt_sriov_pf_migration - GT-level data.
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index a64a6835ad656..812e74d3f8f80 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
 
 	/** @snapshot: snapshot of the VF state data */
 	struct xe_gt_sriov_state_snapshot snapshot;
+
+	/** @migration: per-VF migration data. */
+	struct xe_gt_sriov_migration_data migration;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet_types.h b/drivers/gpu/drm/xe/xe_sriov_packet_types.h
new file mode 100644
index 0000000000000..e6d097a1cd5c5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_packet_types.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PACKET_TYPES_H_
+#define _XE_SRIOV_PACKET_TYPES_H_
+
+#include <linux/types.h>
+
+/**
+ * struct xe_sriov_packet_hdr - Xe SR-IOV VF migration data packet header
+ */
+struct xe_sriov_packet_hdr {
+	/** @version: migration data protocol version */
+	u8 version;
+	/** @type: migration data type */
+	u8 type;
+	/** @tile_id: migration data tile id */
+	u8 tile_id;
+	/** @gt_id: migration data gt id */
+	u8 gt_id;
+	/** @flags: migration data flags */
+	u32 flags;
+	/**
+	 * @offset: offset into the resource;
+	 * used when multiple packets of given type are used for migration
+	 */
+	u64 offset;
+	/** @size: migration data size  */
+	u64 size;
+} __packed;
+
+/**
+ * struct xe_sriov_packet - Xe SR-IOV VF migration data packet
+ */
+struct xe_sriov_packet {
+	/** @xe: the PF &xe_device this data packet belongs to */
+	struct xe_device *xe;
+	/** @vaddr: CPU pointer to payload data */
+	void *vaddr;
+	/** @remaining: payload data remaining */
+	size_t remaining;
+	/** @hdr_remaining: header data remaining */
+	size_t hdr_remaining;
+	union {
+		/** @bo: Buffer object with migration data */
+		struct xe_bo *bo;
+		/** @buff: Buffer with migration data */
+		void *buff;
+	};
+	struct xe_sriov_packet_hdr hdr;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 8c523c392f98b..11bc2e33373c8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -3,8 +3,37 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_migration.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_sriov_packet_types.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
+#include "xe_sriov_printk.h"
+
+static struct xe_sriov_migration_state *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+
+	return &xe->sriov.pf.vfs[vfid].migration;
+}
+
+/**
+ * xe_sriov_pf_migration_waitqueue() - Get waitqueue for migration.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Return: pointer to the migration waitqueue.
+ */
+wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
+{
+	return &pf_pick_migration(xe, vfid)->wq;
+}
 
 /**
  * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
@@ -33,9 +62,124 @@ static bool pf_check_migration_support(struct xe_device *xe)
  */
 int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
+	unsigned int n, totalvfs;
+
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
 	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+	if (!xe_sriov_pf_migration_supported(xe))
+		return 0;
+
+	totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	for (n = 1; n <= totalvfs; n++) {
+		struct xe_sriov_migration_state *migration = pf_pick_migration(xe, n);
+
+		init_waitqueue_head(&migration->wq);
+	}
 
 	return 0;
 }
+
+static bool pf_migration_data_ready(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	for_each_gt(gt, xe, gt_id) {
+		if (xe_gt_sriov_pf_control_check_save_failed(gt, vfid) ||
+		    xe_gt_sriov_pf_control_check_save_data_done(gt, vfid) ||
+		    !xe_gt_sriov_pf_migration_ring_empty(gt, vfid))
+			return true;
+	}
+
+	return false;
+}
+
+static struct xe_sriov_packet *
+pf_migration_consume(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet *data;
+	bool more_data = false;
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	for_each_gt(gt, xe, gt_id) {
+		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
+		if (data && PTR_ERR(data) != EAGAIN)
+			return data;
+		if (PTR_ERR(data) == -EAGAIN)
+			more_data = true;
+	}
+
+	if (!more_data)
+		return NULL;
+
+	return ERR_PTR(-EAGAIN);
+}
+
+/**
+ * xe_sriov_pf_migration_save_consume() - Consume a VF migration data packet from the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Called by the save migration data consumer (userspace) when
+ * processing migration data.
+ * If there is no migration data to process, wait until more data is available.
+ *
+ * Return: Pointer to &xe_sriov_packet on success,
+ *	   NULL if ring is empty and no more migration data is expected,
+ *	   ERR_PTR value in case of error.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+struct xe_sriov_packet *
+xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
+	struct xe_sriov_packet *data;
+	int ret;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	for (;;) {
+		data = pf_migration_consume(xe, vfid);
+		if (PTR_ERR(data) != -EAGAIN)
+			break;
+
+		ret = wait_event_interruptible(migration->wq,
+					       pf_migration_data_ready(xe, vfid));
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	return data;
+}
+
+/**
+ * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @data: Pointer to &xe_sriov_packet
+ *
+ * Called by the restore migration data producer (userspace) when processing
+ * migration data.
+ * If the underlying data structure is full, wait until there is space.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	struct xe_gt *gt;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	gt = xe_device_get_gt(xe, data->hdr.gt_id);
+	if (!gt || data->hdr.tile_id != gt->tile->id) {
+		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
+					 vfid, data->hdr.tile_id, data->hdr.gt_id);
+		return -EINVAL;
+	}
+
+	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index d2b4a24165438..d48ff2ecc2308 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -7,10 +7,17 @@
 #define _XE_SRIOV_PF_MIGRATION_H_
 
 #include <linux/types.h>
+#include <linux/wait.h>
 
 struct xe_device;
+struct xe_sriov_packet;
 
 int xe_sriov_pf_migration_init(struct xe_device *xe);
 bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
+					  struct xe_sriov_packet *data);
+struct xe_sriov_packet *
+xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
+wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index 43ca60b8982c7..5f2062c8c0c42 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/wait.h>
 
 /**
  * struct xe_sriov_pf_migration - Xe device level VF migration data
@@ -16,4 +17,12 @@ struct xe_sriov_pf_migration {
 	bool supported;
 };
 
+/**
+ * struct xe_sriov_migration_state - Per VF device-level migration related data
+ */
+struct xe_sriov_migration_state {
+	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
+	wait_queue_head_t wq;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index b15d8ca2894c2..d1af2c0aef866 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -24,6 +24,8 @@ struct xe_sriov_metadata {
 
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_sriov_pf_service_version version;
+	/** @migration: migration state */
+	struct xe_sriov_migration_state migration;
 };
 
 /**
-- 
2.51.2

