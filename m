Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038AEC52752
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437CF10E735;
	Wed, 12 Nov 2025 13:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQww6ayU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCBB10E733;
 Wed, 12 Nov 2025 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953839; x=1794489839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=M35gC0SHbrH5NhXVXusTPFpYZ6rr50JibKq2X+j8mP0=;
 b=QQww6ayU4mV/Skhd5+wKWcO4tneVHlPe79TXKNtNSgP4yqXlnFP9QkV+
 U6iJ+C1i/A8D73rBel2aDvp5xP3GBitVGdNpQoNN7dhChqcVa5p80TNVs
 tyu+/RISiAfB4KMMWnWEMBngG6kht+O9NYH38R4AKUaX+wtyp+M12kz7E
 8MKhGwBeyI1nVyEI9iFNS9Vmt1Zsonth36rqdPvroUOLbyrsaUPPztJCm
 3zxMlSoUqHd7UQ3DU5gBO67l/SohPvSEne2YxEzyKVD+TGknYjBuY70fT
 1vwK7f42mUb8PnEZjOMblAHNOqJGxDjQyUOX9SB7Cwe4+UsswJzQ/HddH w==;
X-CSE-ConnectionGUID: efrfemWbTxe+ZE62Df2tpA==
X-CSE-MsgGUID: cD0b4x7dQQ2apmH8dqkHtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68649754"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="68649754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:58 -0800
X-CSE-ConnectionGUID: MsPBBiRCTview0OCGdJd9Q==
X-CSE-MsgGUID: aq3+AdjaRoC2J6ueuQ4wRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="193468034"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:57 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.38)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnwWrJeqF0DoB8cjNwfVAws8B88a4jZyt50ikSYdEmuiI0DatYfmEwgv1eSHSNUtDD8fGtDLRa8Pe0sTkj+F+hK3K0/t3nvah76LjAyCU/Ecd6QFXDK9su5Q27pUCHsY1yUbGqRhEbBFXIlznWHYwvcHwlLOWvSzJOw7WjaArZYYji3knJf9IGx9dAvMdkPenPNVTScH7KXjVhn08Udw0y/Ar3IgxwGI9rlLwB7Zv6ceQ9ymb60NcnqxsMRcEIYLIhVgtfpy9SYnkluj40NHwSaet/wiEqOtGqnedNYlufgmcIUxnbXp61LDvk/oFpQDPcqzV4xBJrE4IDnd02axZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cqPcZFkpmzgiJqTQI7sCsymyJA5XVtFHCSFOpHrvmY=;
 b=V3ESW+cpEze54rPHYneV9tfIaklndVddBklhA9WlEiB5MgM3C5K1igoi914pSXs+6BQr/fBQiAyPoSn6GQuckYvXn1SQ8XQItLqWBzwwghZhl9bJtPdxQVfB7G9tVRNi2KBYIR1NAs3ASoO6+fgDOrhFbiamNefkGMMMDSf2kLa/QT+MIiLDCiMwddGtRbl7eocj+aneHK6wIe9nNfVLShYny90hBv3Pd+vWR+lW+KsoxNurU1Ry1flRlO7aWEwNiq1Lt5Pq6Nwu6sPJ9aQHoyuWLifmfi7q4YciwdqkR7fElGH6z18P+TpCsPyZ+ffHAuJEupmuRXNgIvC/bL59bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:23:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:49 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 14/24] drm/xe/pf: Don't save GuC VF migration data on pause
Date: Wed, 12 Nov 2025 14:22:10 +0100
Message-ID: <20251112132220.516975-15-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0096.eurprd09.prod.outlook.com
 (2603:10a6:803:78::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 2106057f-15b6-4558-8370-08de21eeb739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXVYbVB1TXZFdUs0MnUwbXBVYy9uak1xTEtjS3J4OFB1dk1nVFBhMTFnTTBW?=
 =?utf-8?B?NlppVGFTMFRKWGFCQld4eWhTT05UOElqWFY0L3g5bXRZcDZVamdnRlA2dDMx?=
 =?utf-8?B?YjlQV3lUZE5uc1d6UFYxUGlDM2JtNC9zbVphQUthb1pBSXlEcGZXRDFaa285?=
 =?utf-8?B?Y011eWxjUmVVVU9Gc21XTHM4NkZRMm9LZy9yY3VzZ1lIZzdJSm1sK3FkNEUr?=
 =?utf-8?B?K0NqWW5pQ2oxZWpjU3B0SmF3dng2YnpVOXo2VEpJNTlienNlRFUvK3VzdGda?=
 =?utf-8?B?a3lmLzFPbkwwRVBpenpOODFDMXNyZFhPTVd5a1JGVG01bVpWNExiOTVFQ0Fq?=
 =?utf-8?B?L2w3ay80Z09NWFpldEVOdElTQ0FuVVlkVThheDhqS1kxcVlzbCtWajlOMzhl?=
 =?utf-8?B?Vkd5U3BKZHRLNGJoVGJhV0tRS1VtRS9rdkNqbExnKzN6RnVUMTI5eGZsc0E3?=
 =?utf-8?B?Mmt2TnhtZC9kY05pQytxQjA0LzB1ZUNCb1NvRzkvRTk0MGZmL29kcXVySktW?=
 =?utf-8?B?R2J2YjJRRzM3WDViTTlXb0hldkFiU01jUGsvb21zc3lCajRCNGcwdzRmamJO?=
 =?utf-8?B?dXpDb3RUaGN3TVFBYmUxM0lRUTVneDVtSjM4cTdLTXgrNjVwVHI2WVZQc3Ru?=
 =?utf-8?B?SmVBOVdkRXlLczhxR3pNRHBySDFLWmpXNldjeHVOK2V0NEFXZUlkenJnTTBu?=
 =?utf-8?B?MTFNSkVYdFo3cHhrbzZGTm9Pc2h3QzZCTlZXSDd3RytpV04yUmFRdHRaZGJk?=
 =?utf-8?B?RG9EK1BpRU9YWE9yQmd4OVMzT3pyMlZ0SEs1bGlEVklna2pCU0k2M09ZTFMy?=
 =?utf-8?B?SVAyZjZUTFkzK3Q1bk1GS2lvR2gvbm1OZlpPb0RmWklGZHJiUzd4UElIVWFj?=
 =?utf-8?B?clFtckRXeWpXV0FySTJHUFpSUVBabWZzaFlSNmRTSGt3azdOV3cwczJ5NDFU?=
 =?utf-8?B?Qk5DNHFjZ3l5ZW1oOGc2eHJkN1hDZTFSV0J0d2FyUng1Nmx1Q2UybW0zVGQ3?=
 =?utf-8?B?NTFYdFo5RXZ1N3psSmVzdGF0Z24xeEZueUVOOWY0QjFySTRmTTRVWnowMHBn?=
 =?utf-8?B?aXFGRWR3dFNQTnk3ZlROM2lWQ3haVlp3L0ZvRG83VDZYVzFrSWFNMTUweXRj?=
 =?utf-8?B?L2dwanhQVWFpWTdHeGFsem80UkJ5MGpxMVlRejU3ekE2L1hDOEh5Q25Bd09k?=
 =?utf-8?B?eDRPQmtJV0I0ejJ4OGFWNmdpcnVyV2R2K0FPZjJLMDlkQzJjZjFneURhRjFB?=
 =?utf-8?B?RGRjaUh3dTlzcEdpV0crN1g1K3YrTnBQc2pUNlprS2V2S3BzZjRPUnR1bm9r?=
 =?utf-8?B?bjdFZnpzOWJSZWZwbjRhYXd1MDJKa1JoRGx1QXVPVmlKNlBSSjVVNjJteXlj?=
 =?utf-8?B?Z0hveTR6VEpPZHVud05hVG90ZXRGRk1qdGNodldjQ0ZQWlkvKzlwMkN4VGJE?=
 =?utf-8?B?V3BzSi8rTEl0Z0dYQ0hlSUVwV3VJZytocnN6eko5L3NudWxBUXNySkx4Um4x?=
 =?utf-8?B?VWtZbmdNbk8rbUdGOUJIR2U1Q3VRQ3dRVXdub2hqUmNJWHY2OGUxTU1jeFNu?=
 =?utf-8?B?Yk9pQmZzRHpDTTVBSE5JVXBsNEtKdUtzRjc4NVpaUTBRNUNSSGpPZmRQSXB4?=
 =?utf-8?B?b2Z1RXVNU3c4b2lHOXNucmhWN3l4Z2UwMUoyRVoyanlWQ0lJZ0R1SEZWUmIy?=
 =?utf-8?B?VWZKdkNqdVBzS082NUx3VUVhYUhiakppbGxtZ2Z2LzBxWDR2OElncVRzUW9E?=
 =?utf-8?B?c1k2V3ZVQVZESllyaHVPNEtCelFqdHU1bkJWb0lGYUZQWnZnNk9DVVlhMXMy?=
 =?utf-8?B?bGxoblN3bFcvdms3eXFMVTI2cVI4RFNjejg0VHhXNUZkTVFhMllmdUtsNXlL?=
 =?utf-8?B?WjJEVVVzZ1RFZDFQdUxQaFErdWFRMnJPdzdSaFBBV3VldStRaWFEZEt2RVVH?=
 =?utf-8?Q?12nqn/JoSqACKVeANmEztCoWOMGb7OsL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHZlQ0pCWUJwenJhWEFoK05vUHZ0RkV3V3Mxc2lyL1RVZFRndE52dlVERSs5?=
 =?utf-8?B?M0k4NHVJR0FBdXV3S0FBK0xGdkN1RmQzOVkyTWN0WnQyUGdqcjlqZ0xzN1Rm?=
 =?utf-8?B?LzE1RGMzc3grME84UmYrZkovZlE3SUpRZ1BFdHZXU1FxTU0wbjRWbFFUZG44?=
 =?utf-8?B?NlZROFNaMGVucW9rWHprUzVpdGxUZ25abXROMHlDSFhNaXFKSDNTZ1NxMndO?=
 =?utf-8?B?cEorZkNoOHZlWWZnWk10aVpOV1Y2QlEvT2podWJ0bjVQOFd4VGlzaVd5QkZu?=
 =?utf-8?B?OFV1ZFY1c3NHRks1Z0x5b3c2UHdpY2NSS3RQL0E2M1RVcm5FM2d4Q3J5M1Bw?=
 =?utf-8?B?eXE3dzdFUTdSN2s3T1NPa1Bvd0NOL1M3YXZFblcwTFdNTlFIZGYra3JWb1d5?=
 =?utf-8?B?U1YwYVl0TlZ5empkNjAwdmlkUzIwK2NhWjJVVlVWSm4wcDV6eFphbTBhL1Zs?=
 =?utf-8?B?cFUzaHVMY0p1RmNacUlWYVhTOXI4TUtBYTJ4REp3dTBDcythOXYxRHplejFm?=
 =?utf-8?B?L09ZeEdUODJtYW9jMzJOYjAyTVNEYjRFSnM0aHQrL2RPc3kyTzZVa1pYTGNv?=
 =?utf-8?B?UWRydjIrdU81ZXd2TzRIaFoyTWxhTVRqbCtGd3N2cW5KWjJySnZmRmxBbW8r?=
 =?utf-8?B?cVB6SU5vWk5oTDNRVWNkeEFZbGV4RS9LTng0UkJPWW13Z1crbUUvbnJNYlh4?=
 =?utf-8?B?eG9kRWh0UW5ZYlJFR2tmYmk1WlZmQWlqdHBVYjE3bG5VM3FvM1VPVzJRSS9Q?=
 =?utf-8?B?dTkyWHhjZDdKajA4ZmxHSms0NWdxSEpYNGVRMjdjdDZBQUdGYURQY2hyb2lG?=
 =?utf-8?B?WmZuc0hPSHhVNkxBaXpDcVRGMUtxVytFSzVIOFZoMGFLTWovWUo1dFZSQStw?=
 =?utf-8?B?a3NiN1VaekdaendVa2REczQ0UDlkTlRTU1RNNFk5MEFJaWh3RnV6ZVF0eWxK?=
 =?utf-8?B?d3dpNjcrT0FPN2R0MzdpZlhDWG5nV1AyR0I5L2JPWHEwbUdtcjEySDh3Y0dk?=
 =?utf-8?B?QVMwM0VlZWV4S21PNjRNQmRqRXZELzVtbUEyZUVEeVJab3FXbHVURmZrTDZ2?=
 =?utf-8?B?MTdZRWNjR1c2ejRQc1NDSzV1MGxrZzJxUHRYRjVCUGZMK0FIbjY5Wm9TN1RS?=
 =?utf-8?B?OTk5dzVFeVQ2YWVGZnZtcTNkbDU4M3luMmpVQWxnbDFFczJIeHFDRVhEMUkv?=
 =?utf-8?B?bEo5TVBnSGJ3ekd4Y3JNMUdGQlg2VUlYbEx1dmRsTER5eFRVN3BNODFLUHdO?=
 =?utf-8?B?NFdtaHp0UC8wRWxCa1dIWjVWZUNJQVJ0bzJ2QmZBMkpuV1pXcWhNQWpjeVRj?=
 =?utf-8?B?TWVLUE5MamRJMmlYcVMxaU0yWk40L0NTT3RwUlVaZUs1QUFCemZNUnJXQXhX?=
 =?utf-8?B?U25RSjYzZ0pwN2lDV3l2VlJLZ1NCQjRtdk5PcDVlVytuK1dnMFhZeGQ4dDZE?=
 =?utf-8?B?K29xQ0QwQVdVdDJBaXBsNTNnQkNIWHNaSkFhaE5tV1NTdm5XVURTQk9jUHBG?=
 =?utf-8?B?dTFPNGJUVENrelRjYU1yc0VVZElBNkIwNEVvMkEwenNnUTBNdDk1a2xXM2ph?=
 =?utf-8?B?eEJ3aUowMldaMytudXZnemFiRHRJNFgybGNJUkVkcHg1b0ViS1lmbkpRVHNJ?=
 =?utf-8?B?RkppTjdvOVJUMWNZcjluUkNoc2UxcVE0SjNWN2U2OUw3YjVCaHBuSFZkdmI3?=
 =?utf-8?B?aFdZN0NDL2oxVnFXTFpTMFpCSnVBcVZzK2wrTmo3OHpWRWl5VVhUNjBDdmJ1?=
 =?utf-8?B?VEU5RFRIN2dYQmJja0lRdWkyekNXdlI0YlpxNHNuQWNtdnVDekpqWVIyVUdS?=
 =?utf-8?B?ZStGSjJlcUZKTHJaOFREZGJ2YlhtZXpieUtvNmFFNGhPY0dCLytFNHRnWFU2?=
 =?utf-8?B?RE5oOXRBWldybEliZGdmdHBOVjFDK0dNd2JSUEluNC83OEJWdzFVbTNDTXZD?=
 =?utf-8?B?ZnFZamFXRXIrRkx5K2dPMzQzVjFCWW1vWmZRRUpkT0V0b2dxSy9GWDhWeEY3?=
 =?utf-8?B?SDJZdDZ2clVqZXIyTjN4VzRhbFFOdmxhMFNuMEZmY1J0SnV4SFk1TFRDd2lo?=
 =?utf-8?B?MDZEaDhqUG55MUkyZDFZVFYrMjdYRTI4cXZrdzdKM2xVVXNDK2huMXNaeHNi?=
 =?utf-8?B?bUsraWJ4Z1JTOVREQ2ExZzlrYmdsODY1N3R2RTZ3ajIwNWJyelUzd1JYOEdZ?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2106057f-15b6-4558-8370-08de21eeb739
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:49.4559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHa/xlWczyjsrrPADFQAPCgTauD8tN27EIULso9SdVFBuXknloSE4TOrrrRzqabHt8L6oenCL8t1rum+6ks7lk0c/qwWxYgumTbDOy9GYZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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

In upcoming changes, the GuC VF migration data will be handled as part
of separate SAVE/RESTORE states in VF control state machine.
Remove it from PAUSE state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 39 +------------------
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 -
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 171b2ba0a97dc..bb1ff5ff436c1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -184,7 +184,6 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SEND_PAUSE);
 	CASE2STR(PAUSE_WAIT_GUC);
 	CASE2STR(PAUSE_GUC_DONE);
-	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
 	CASE2STR(SAVE_WIP);
@@ -454,8 +453,7 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
  *	:       PAUSE_GUC_DONE                          o-----restart
  *	:        |                                      :
  *	:        |   o---<--busy                        :
- *	:        v  /         /                         :
- *	:       PAUSE_SAVE_GUC                          :
+ *	:       /                                       :
  *	:      /                                        :
  *	:     /                                         :
  *	:....o..............o...............o...........:
@@ -475,7 +473,6 @@ static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE);
-		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC);
 	}
 }
 
@@ -506,41 +503,12 @@ static void pf_enter_vf_pause_rejected(struct xe_gt *gt, unsigned int vfid)
 	pf_enter_vf_pause_failed(gt, vfid);
 }
 
-static void pf_enter_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		pf_enter_vf_state_machine_bug(gt, vfid);
-}
-
-static bool pf_exit_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	int err;
-
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		return false;
-
-	err = xe_gt_sriov_pf_migration_save_guc_state(gt, vfid);
-	if (err) {
-		/* retry if busy */
-		if (err == -EBUSY) {
-			pf_enter_vf_pause_save_guc(gt, vfid);
-			return true;
-		}
-		/* give up on error */
-		if (err == -EIO)
-			pf_enter_vf_mismatch(gt, vfid);
-	}
-
-	pf_enter_vf_pause_completed(gt, vfid);
-	return true;
-}
-
 static bool pf_exit_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
 {
 	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
 		return false;
 
-	pf_enter_vf_pause_save_guc(gt, vfid);
+	pf_enter_vf_pause_completed(gt, vfid);
 	return true;
 }
 
@@ -1984,9 +1952,6 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_guc_done(gt, vfid))
 		return true;
 
-	if (pf_exit_vf_pause_save_guc(gt, vfid))
-		return true;
-
 	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
 		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
 					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 0bee910bdf07e..6027ba05a7f2e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -28,7 +28,6 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE: indicates that the PF is about to send a PAUSE command.
  * @XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
  * @XE_GT_SRIOV_STATE_PAUSE_GUC_DONE: indicates that the PF has received a response from the GuC.
- * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
  * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
@@ -71,7 +70,6 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
 	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
-	XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
-- 
2.51.2

