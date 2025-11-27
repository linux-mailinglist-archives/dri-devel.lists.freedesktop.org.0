Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B642C8D96D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B271110E7AF;
	Thu, 27 Nov 2025 09:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8CN1fLc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD4710E7AF;
 Thu, 27 Nov 2025 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764236392; x=1795772392;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Ld+BCAlhDUNisOmrNSLGIuNpZDz8pVTs5DdAFJLQwCs=;
 b=n8CN1fLcx7+VI7GVzVikCnYASngHSbY9YpIqAN4MhXQO84FFRHUhFcGV
 fYkfel62h132bEMbx8uj9Q4UPyCQ9Xj+h95oJvEjMf4zl8J8FzzV23Bu/
 tCZus/2fyCp3NzNHjixJ398rwgVTd920sAFxhmzKGPKT96wf5MvE/iSY0
 mc25xIiQg4s0qd/NhbpArDGE3UOy5N1599eCpHOJ/FoXII91Vwz66jcvm
 vS4sUcU6uafGsurRZbtSuNrmpXzaZ/2q9ZOO6XdjXYY3vGY9R618lsUKg
 GkpctkOx9LXWxMFwK6be0OEzCPl/N2CBW/NJDXYKeVCXCH579Ld9wt66E w==;
X-CSE-ConnectionGUID: muiY/2l5TzOCsvZMj4Ec+Q==
X-CSE-MsgGUID: umPYWPW4SzO/18Vp7VcBig==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76970925"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="76970925"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:39:52 -0800
X-CSE-ConnectionGUID: B//fbV/sTbu8ZS0JEdTZ9g==
X-CSE-MsgGUID: 0ijZCRYfR9OVRW9aM04p5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="197343742"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:39:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:39:51 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 01:39:51 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:39:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PV7UQGksjJdVwxiuWZ697+9gEySEUDrPWGeZgJx1ek+6a7KeaF/hubqIq7WFmE+8HGy6E082yTP5mfofAn0SYt4xT1yBd+a8js3iYMkjkeLcTKJWq/QTxkqsiMS50+PcCl83/4z4jXNFGqTItDLZ9RSN4hbfnHZwAq4OIUMpxNFNPxgfPTjyQSnIKZRMm4VYHfoqeN7aS02u/e8tq9U8re5VB0p3Ocx7RnQhCUKSjRDw2ck/5/hA64TXZC00Tqp4brPiujHTC93eDiqylvZPpVUWkSMKLHqSw/022MdIoLLFi9VT1DsoFYmPW4K+Br2lbGEovvF93IzAFAp6xGq5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v47eD1+LhShl78xbcEY+pODxIHY2U7TgELoOb457T68=;
 b=Xzn7Fc8OwjV9HnqX3kpTuh5fFintWORVQXYHB2ffod5wI7QFpGMAn/I4qCI3WZTemYrmMwyKeQwtn9eAvshJTG+pfIeIlv9FaBYmFKDelrJMAzXtqBS9PUxfeQx64uBeOxuTKfP6rVuVdIQ9z/0POilMUki9dP5PQYUmkZ9vt4R99E9L3ekFnQNezUFXb6Brpjpsi8N2zS6SNx0oRhAV55FSiesAeuhcs+Y4rCKfPHN3nowmwA7AmEZaoB5IwjAb4mr4NRF++sNl9I386vO1OH66Yh7+b+3VzOkCcU2IfUM6VBjXBdurxZc+fO3C3qW9R9ErR/L2AgBboOVJ3nTiKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 09:39:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 09:39:41 +0000
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
Subject: [PATCH v7 0/4] vfio/xe: Add driver variant for Xe VF migration
Date: Thu, 27 Nov 2025 10:39:30 +0100
Message-ID: <20251127093934.1462188-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0175.eurprd09.prod.outlook.com
 (2603:10a6:800:120::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: ba513e5f-56d8-40f9-7c9a-08de2d98e388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlF0YzlxUzVqdjk4RFlLcXpKYzVYN201bEtTbGlzaUlBNW9OaDNlWnBVaFpL?=
 =?utf-8?B?bWVkNzh6UXIweG9WNjM1NEF6U3gzNk9NNWE4dUl1YUl2Z2ZMQ3VNVS9TMTBo?=
 =?utf-8?B?dFJhNGR3RVAwTnVyZFhMYlFiSkUvd1l2L29kNkpIV3QvZTZQSjB1bmpuYUpW?=
 =?utf-8?B?dWdhd3F6YUVrc1pkWGZ2L084VU91NzBvZzR2UFBGVGV0WDZlczZWRm5MREZo?=
 =?utf-8?B?ZzFKYzEwdnk2b29uUmNJbzhpR3lySmthUkVZbytpYXBSZUowMkQ2amt2L0pq?=
 =?utf-8?B?N3IzL2lLMDBmQ09CK0VBTkxybGgrS1NudTR5K2xxcDRZeTliOVBINHFZVmFK?=
 =?utf-8?B?UVRzM21FZllPemI1UW5hMi9LeVBRVGk4d1JYWXo3TTVWOXpTeGNpYnI3VThh?=
 =?utf-8?B?ODRGYUhNalZwU1lMRjVvQnlGVE41NFd3NEJwMjI1MkMyZUtxTHNsSm83cEg2?=
 =?utf-8?B?UVdkTE5DL3ZleGVYbDc5SjhySjV0bHpnS3FvOHdHeDZyR0JkSVZ3ZDN0YWpz?=
 =?utf-8?B?a3ZOY2xkbEdxWURFNk5Id2xSdm9KYnBES05qZWRUMGZuVFZrVlBIbmlTYWdZ?=
 =?utf-8?B?alFzOG82QWlLeEV3ZUZRcTBMUVJOQ0tHRHhjVm5oQW94MlhxbkFVMnpXb2dR?=
 =?utf-8?B?RlRLVmJLYUw1TnpXV0VqemlmY1laVnBJMkI3OWUwUFZwM2V0MkZBbGlYS2lq?=
 =?utf-8?B?TnRsOHI0TXFqVmVwQVdoY3UwTXNXZHh1Z3NJQ2xNK2ttaVh4T1YreWJScEor?=
 =?utf-8?B?SHJCMXFjTm9mMTdvN3IrQUQ5eFRuUk5ueFBZZGFQY0dQaHdpdCtiK1daTG14?=
 =?utf-8?B?eVNRQlUwNTl5WUYwRVFxZ3VibmZhNExTN2U5M1R3MTMwQVpRdjFLS2N6OHFh?=
 =?utf-8?B?bmcvTGJvSXM0YWNRTmRvSlU4RzA4bnNVOUZ3d2tpMTlCWnAwREJBdm1MZ1kx?=
 =?utf-8?B?Y3dxSlhlTlFzRTFyRTFka0NqaGVNN1RudGw0T0xxdlllbmtiSUZDVS9EcTJo?=
 =?utf-8?B?b1FQNk5qMjVwcnl4SXZBNXpteDErTkp5U1c1dHpNL0N0L09EOGRuQUR0OTlh?=
 =?utf-8?B?TlVwR0wrR29LaUxaWXdRQVpncHBtaGczMGNHbk0xOUN3YUJJTk1tc2RXMmts?=
 =?utf-8?B?SVUvYmFwalg3dHFDSVlRZFVBTW1Nc0g5UmY2VzVSRWdFRzB5WG82ODFzYTZ4?=
 =?utf-8?B?WXdHMHNrRnhUUVR6cWkrYTFFc0NBRVFMdEFkbHVtZUgwTkhSd01WaE91WDRk?=
 =?utf-8?B?UlYzaDNvVlFCNGhWanZEUi95QVJENGIrNldqOW9IbHpCMVhwcmNhckpBNWZw?=
 =?utf-8?B?RXZPeHp5VU16cy9XUHZvUE1aMXpPeWJzYXVxdUNyd2piaXR1N0lPVWNVYWZj?=
 =?utf-8?B?a2trY0pCWG1FMXJvaE5qZ1R6b0MwMFNDcStJaGc3UUtIS3dBSDRyTytHYW5y?=
 =?utf-8?B?dldEc2YrdHliTzF1a1FPWmVrVzhlTWE3VFVZMklVenVGMURRQWVLNGY4Q1hL?=
 =?utf-8?B?T3JxbENtaVIrak0rMDAvdE96dXZVUGpHT1lLckZRVnYrWnM5WmQ0N2x4OVN6?=
 =?utf-8?B?RVY1dU5NRi9RUjlYMlRYMzFkNnNjVkpyRlprT0pYdUUwSUhjc09LN1N2VUhO?=
 =?utf-8?B?ZkEwS1A3aHdnUWV3aGdXQjkzVlFFYnNyMEtaUFlHbEhCblp2dy8vemV0Njgz?=
 =?utf-8?B?bXdMb1ppcmlpNzlWYXBpd09VWW02VHFnSWhjZURlcjBNSVpKUzRmR0lVUWFh?=
 =?utf-8?B?N0tPUUVGRnEzeWNmRngrOVJ6d2xBdmtCQXFRa2N0VUpBZkpmV1FMdU1kTTkr?=
 =?utf-8?B?djZzdG1GbDVLdkRobHB5ODR6OXU1UWxweC9FMVZNSHRHaG1FTEZRNUlHNVUw?=
 =?utf-8?B?NmZjSk15eld2YWszSFlLN09yNE5vYVgzWkRBNWhmYUpLTzdGVWdJQ2UrNFhu?=
 =?utf-8?B?dzIrSmc0Z29nSW5iOTlXTlpsWW9MYUMxcldYK2kxbnd1RWx0elo0Q0xWaGNu?=
 =?utf-8?B?eWhac1pKOTdhMm83eHBqSFdHN3I2RFZCdWIxb05hRGsvbjZzZnpsZnlESWhV?=
 =?utf-8?Q?bCRQ1q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3k1dWNTZ3U0SFNjWm9QdldMQnpkeTF3aEVNeHUrQlgyRmcweG0zWk9TbVZQ?=
 =?utf-8?B?MEdaWmU4NzROd1hKK3F5bEJteE1OYWxORFRoWHlVYkREVVJOc0VNclB0VDNm?=
 =?utf-8?B?RTFSRWpqcVpwM1JpVW1ZbWtrMXh1bDlHdWJCSUtJUUs0T0NLdG1YTzdlKzhL?=
 =?utf-8?B?OFlESCtLdnFETVFyQnRrRWpqU0lka0dUZnZTNTY2MlN5NXRheWpvc2FSaTZs?=
 =?utf-8?B?dHBnazhNaFhiWHovSVIxOGh0WVhmRzZzNU5jdThpL0htaURtaHZuWDJvYXV0?=
 =?utf-8?B?aEFWOUg2L2RVeHZ6MnRydml3dHBMQkR6TVF5cEJFb1Jnc3ZGZzRwRzhEREFD?=
 =?utf-8?B?Z0NXb2p2Ylk2bDlxcSthNkp3MDM5ZlAvMWNWNG81dUN2c0EyajdYK25qV0g1?=
 =?utf-8?B?RmZWN05rdnY4dFd2SWo4L2RiRitzNlJtVXcvaXl1ajczWW1lOWZWdDNvWE5l?=
 =?utf-8?B?Q2ZvNDhPUkhBUk16QlFWaE9tTHJoazh0ZlJEMG5JeEpra21VTERrclBCUWpa?=
 =?utf-8?B?Qy95NktXTHFhcGt0MSs1WDhkMENoMHlsYzkwa1NqYWVQRDRhWU00NEE2a1dZ?=
 =?utf-8?B?ajI4NGxtMVRGSlQ2dWNOd2xHNVUxQjdUVTFZVE5sMUZrZFlNMHF5SjIyeDBN?=
 =?utf-8?B?MTNlUTlHNHJHR1VpV2x6VmZHalJEYnNrM1dMdTBLaWpwdkZDL3N3UkZWcFFN?=
 =?utf-8?B?cnV2Y3VmSjk5THYwRW9md003aU5xQnk1aFU3UU85YmFubHVEaUcxL2xjd0E0?=
 =?utf-8?B?Mys2YXNhMHhMTGdSVWRRQnVPQ00xVmdETjE0ZUxNOGRUcDIwUzhhT1lLSEY3?=
 =?utf-8?B?aUtmNEpBbXN5UXVzZnVEcXdYTVZkQnVEdTFlc2wvMXg5MFlBMEN3ZjVTOGxr?=
 =?utf-8?B?N01MMkYrSEFldGcyUms1V0tSRWd3KzhNT0NJTXRTWEdIeWlsbUJJREk2UHdT?=
 =?utf-8?B?NkdhbjFzTTlEdk42ODlvQXZxY2V3TUNJaUp3YVZSSUl5UHJJNGNKcEZDczgw?=
 =?utf-8?B?R3gxVFVkYnYzT3UvWllYZzBwSXBONm5LbzhLV2dTcFdhRXJwUkpvd1BOOWVB?=
 =?utf-8?B?enQzZVUrUWJzU3ArUmNtQWh1cDlEcm1QR3dUL3VqNWpNTDl5YXJuVmw4ZEVv?=
 =?utf-8?B?bEFlS1h1cGhucmtEMDFqVC9nTjhJc24vT2hVVVVWWGY3SVRleHAreno1OUxS?=
 =?utf-8?B?ZVIwUXhVVXFmTmltamhndGh0c0FITXpYVHo4NXFOd1RoZzIwREp2R1RjeUxF?=
 =?utf-8?B?QzdzR0NJWHJlOTViR1Z6anpqcndITXNLMjZDWjdTMHhiWjVVL21NRzRuZS83?=
 =?utf-8?B?bzNpR0tjUXpQMHQwd1BjNDF0VXNhYTlKczVOVDhkUk1sampNL3RRcTA4eUZF?=
 =?utf-8?B?Q25NZjRSblo0YmY3OU1CRW8vdGxHaTZkcndobU11L3ExaWR5WnpNb2JPNk1R?=
 =?utf-8?B?Mm9iTzR2Z0hNNXNqY3VtNWxRTG5LNVFCUTlqTjJtcDhHU1A1bDhic2h1dHBL?=
 =?utf-8?B?bkVEdkhIKy93SjJLWm9kaEVhRlIvd05kODRlSVBybVNEakF1SVZjR1hRTXRP?=
 =?utf-8?B?TW5ZNXhjTlZNWE9ZZkdUT3RRaHd2ZmYwUVc0cXhyTWdKa3FOZnozVWJmT081?=
 =?utf-8?B?RkhjajJxQUVodDExdkplckt4bXUrQ0FsQUVvNnY2SkpsQzBzQks4MlVMOE1o?=
 =?utf-8?B?U2x3dG85VnVJRUF1SFJtTnRVQWdYaXRTYmpJU2NCZlE3V3JiSG9idUpPUmZL?=
 =?utf-8?B?eElUcjVDR3lNRXNLNnlpU0hFUEI4YVdPaFl3enlZOGhEWFcvRXpFMWxFaitE?=
 =?utf-8?B?Q2xvRUROSkV5NHNKb092ZzhhbEF2UVVpSXFyYkxDd2hFeUFwVEpnZThtbXNo?=
 =?utf-8?B?TUwyUXcwYWRkekY3YjhvNmhiYXFKK2dMWmozT3lDWFgrTnNiTFo2ZGUrSUZB?=
 =?utf-8?B?dUFmbEUxQzI5clVNWFlzcDdHMlE4M3hHZDdXK0RBbXQvRHU4WEhYaHc1WkJz?=
 =?utf-8?B?UWpqZnMzYlZaNTZHaDMyQ2NmS28zYjNyVFFxNmZBSnlJZ0Vic3ZOK1JZMHRQ?=
 =?utf-8?B?dEZJN05tMTZ6MnFzWnFJQmRpVS9vVDZFeHBSRHArczZGQ1BNaHF6U0hCTFB2?=
 =?utf-8?B?OGtiKzdYYUd3elNWZ01NeGpVK1lHckgrQnNOQ2JtODdDdFJNdjdDQmFSSkRz?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba513e5f-56d8-40f9-7c9a-08de2d98e388
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:39:41.8576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IyCylEKIIJhJwiS0s2eEbRIO747OXHIroOh3LjYKklhR5+5K4YcbvzaQLdj8o1Wjwk70CetrvKPfamJ7T7RyLQ9TYaSsMzJ+XfbGQhgZCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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

Hi,

This is the v7 of series introducing xe-vfio-pci driver variant
supporting migration. Thanks for all the review feedback.

It looks like all the r-b's are in place and we need a final ack from
Alex.
We also got a confirmation that DRM will be able to take the series once
everything is ready.

The biggest changes in this revision are:
generating VFIO helpers using a macro, addition of XE_VFIO_PCI build
dependency on PCI_IOV, and a bug fix for the issue where we would skip
calling xe_sriov_vfio_wait_flr_done() if the VF doesn't support
migration.
Also, note that GuC v70.54.0 is now available in linux-firmware:
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/23568a4b942079631c9378011aa0a9b29de19370

Full changelog, including URLs to previous revisions can be found below.

Cover letter from the previous revision:

Xe is a DRM driver supporting Intel GPUs and for SR-IOV capable
devices, it enables the creation of SR-IOV VFs.
This series adds xe-vfio-pci driver variant that interacts with Xe
driver to control VF device state and read/write migration data,
allowing it to extend regular vfio-pci functionality with VFIO migration
capability.
The driver doesn't expose PRE_COPY support, as currently supported
hardware lacks the capability to track dirty pages.

While Xe driver already had the capability to manage VF device state,
management of migration data was something that needed to be implemented
and constitutes the majority of the series.

The migration data is processed asynchronously by the Xe driver, and is
organized into multiple migration data packet types representing the
hardware interfaces of the device (GGTT / MMIO / GuC FW / VRAM).
Since the VRAM can potentially be larger than available system memory,
it is copied in multiple chunks. The metadata needed for migration
compatibility decisions is added as part of descriptor packet (currently
limited to PCI device ID / revision).
Xe driver abstracts away the internals of packet processing and takes
care of tracking the position within individual packets.
The API exported to VFIO is similar to API exported by VFIO to
userspace, a simple .read()/.write().

Note that some of the VF resources are not virtualized (e.g. GGTT - the
GFX device global virtual address space). This means that the VF driver
needs to be aware that migration has occurred in order to properly
relocate (patching or reemiting data that contains references to GGTT
addresses) before resuming operation.
The code to handle that is already present in upstream Linux and in
production VF drivers for other OSes.

Links to previous revisions for reference.
v1:
https://lore.kernel.org/lkml/20251011193847.1836454-1-michal.winiarski@intel.com/
v2:
https://lore.kernel.org/lkml/20251021224133.577765-1-michal.winiarski@intel.com/
v3:
https://lore.kernel.org/lkml/20251030203135.337696-1-michal.winiarski@intel.com/
v4:
https://lore.kernel.org/lkml/20251105151027.540712-1-michal.winiarski@intel.com/
v5:
https://lore.kernel.org/lkml/20251111010439.347045-1-michal.winiarski@intel.com/
v6:
https://lore.kernel.org/lkml/20251124230841.613894-1-michal.winiarski@intel.com/

v6 -> v7:
* Update commit msg with details on debug flag behavior (Michał)
* Generate VFIO migration helpers with a macro (Alex)
* Depend on PCI_IOV (Michał)
* Reorder migration file struct members (Alex)
* Fix xe_sriov_vfio_wait_flr_done() behavior (Alex)
* Set state in .open_device() / .close_device() (Alex)
* Remove redundant "disable_file" in release_file (Alex)
* Use GFP_KERNEL_ACCOUNT alloc flag (Alex)
* Use pci_iov_vf_id() directly in vdev->vfid assignment (Alex)

v5 -> v6:
* Exclude the patches already merged through drm-tip
* Add logging when migration is enabled in debug mode (Michał)
* Rename the xe_pf_get_pf helper (Michał)
* Don't use "vendor specific" (yet again) (Michał)
* Kerneldoc tweaks (Michał)
* Use guard(xe_pm_runtime_noresume) instead of assert (Michał)
* Check for num_vfs rather than total_vfs (Michał)

v4 -> v5:
* Require GuC version >= 70.54.0
* Fix VFIO migration migf disable
* Fix null-ptr-deref on save_read error
* Don't use "vendor specific" (again) (Kevin)
* Introduce xe_sriov_packet_types.h (Michał)
* Kernel-doc fixes (Michał)
* Use tile_id / gt_id instead of tile / gt in packet header (Michał)
* Don't use struct_group() in packet (Michał)
* And other, more minor changes

v3 -> v4:
* Add error handling on data_read / data_write path
* Don't match on PCI class, use PCI_DRIVER_OVERRIDE_DEVICE_VFIO helper
  instead (Lucas De Marchi)
* Use proper node VMA size inside GGTT save / restore helper (Michał)
* Improve data tracking set_bit / clear_bit wrapper names (Michał)
* Improve packet dump helper (Michał)
* Use drmm for migration mutex init (Michał)
* Rename the pf_device access helper (Michał)
* Use non-interruptible sleep in VRAM copy (Matt)
* Rename xe_sriov_migration_data to xe_sriov_packet along with relevant
  functions (Michał)
* Rename per-vf device-level data to xe_sriov_migration_state (Michał)
* Use struct name that matches component name instead of anonymous
  struct (Michał)
* Don't add XE_GT_SRIOV_STATE_MAX to state enum, use a helper macro
  instead (Michał)
* Kernel-doc fixes (Michał)

v2 -> v3:
* Bind xe-vfio-pci to specific devices instead of using vendor and
  class (Christoph Hellwig / Jason Gunthorpe)
* Don't refer to the driver as "vendor specific" (Christoph)
* Use pci_iov_get_pf_drvdata and change the interface to take xe_device
  (Jason)
* Update the RUNNING_P2P comment (Jason / Kevin Tian)
* Add state_mutex to protect device state transitions (Kevin)
* Implement .error_detected (Kevin)
* Drop redundant comments (Kevin)
* Explain 1-based indexing and wait_flr_done (Kevin)
* Add a missing get_file() (Kevin)
* Drop redundant state transitions when p2p is supported (Kevin)
* Update run/stop naming to match other drivers (Kevin)
* Fix error state handling (Kevin)
* Fix SAVE state diagram rendering (Michał Wajdeczko)
* Control state machine flipping PROCESS / WAIT logic (Michał Wajdeczko)
* Drop GUC / GGTT / MMIO / VRAM from SAVE control state machine
* Use devm instead of drmm for migration-related allocations (Michał)
* Use GGTT node for size calculations (Michał)
* Use mutex guards consistently (Michał)
* Fix build break on 32-bit (lkp)
* Kernel-doc updates (Michał)
* And other, more minor changes

v1 -> v2:
* Do not require debug flag to support migration on PTL/BMG
* Fix PCI class match on VFIO side
* Reorganized PF Control state machine (Michał Wajdeczko)
* Kerneldoc tidying (Michał Wajdeczko)
* Return NULL instead of -ENODATA for produce/consume (Michał Wajdeczko)
* guc_buf s/sync/sync_read (Matt Brost)
* Squash patch 03 (Matt Brost)
* Assert on PM ref instead of taking it (Matt Brost)
* Remove CCS completely (Matt Brost)
* Return ptr on guc_buf_sync_read (Michał Wajdeczko)
* Define default guc_buf size (Michał Wajdeczko)
* Drop CONFIG_PCI_IOV=n stubs where not needed (Michał Wajdeczko)
* And other, more minor changes

Michał Winiarski (4):
  drm/xe/pf: Enable SR-IOV VF migration
  drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
  drm/xe/pf: Export helpers for VFIO
  vfio/xe: Add device specific vfio_pci driver variant for Intel
    graphics

 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |   9 +
 drivers/gpu/drm/xe/xe_pci.c                   |  17 +
 drivers/gpu/drm/xe/xe_pci.h                   |   3 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  35 +-
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   1 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   4 +-
 drivers/gpu/drm/xe/xe_sriov_vfio.c            |  80 +++
 drivers/vfio/pci/Kconfig                      |   2 +
 drivers/vfio/pci/Makefile                     |   2 +
 drivers/vfio/pci/xe/Kconfig                   |  12 +
 drivers/vfio/pci/xe/Makefile                  |   3 +
 drivers/vfio/pci/xe/main.c                    | 573 ++++++++++++++++++
 include/drm/intel/xe_sriov_vfio.h             | 143 +++++
 15 files changed, 888 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

-- 
2.51.2

