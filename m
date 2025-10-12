Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F8CBD0AB4
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB4810E19A;
	Sun, 12 Oct 2025 19:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6ECnmMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5711610E194;
 Sun, 12 Oct 2025 19:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760296348; x=1791832348;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tbaTgVCDdvwm4iLV6mqs4+YYedpPZW2DwW6SQEsSHFg=;
 b=g6ECnmMhe7WlrlDXontkSOGuAB3AA/gSXZrmvWzT2IsNk7ZCjb6mltUh
 M4Up6uv7yIptdwFvL4PC/2t6+QrA+sbesi+/CzMi6CzaIvYUzua/CBG8h
 Py02V4XGwyJBMqSqZCkPADC/Tj1HtmO5ir7Ihk0iYXo/1SPBSMIWzUR7g
 /wGKUG5k7JFnLfRKBaAYEJe5/lNsX21cmMzMZypnM6cCgyWUcsA4ZixWd
 wrAFieOt2qAluuzYKAMyXgR6rR49Sk0rfqJn2P0SS49zCS8/2W4HQwVrQ
 DXxfwQzeiCqM0+pYHowidyZXx3P0vQ+wh5u7r4UBC9NpBwjjBDPyJsuZq Q==;
X-CSE-ConnectionGUID: Hmd9apPXT1iDlNx+U7OmHw==
X-CSE-MsgGUID: fBLw/5pNTIe9dnFb+jEC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62141174"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62141174"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 12:12:27 -0700
X-CSE-ConnectionGUID: 5sV7FUx+RdaiKWMI78G2Rw==
X-CSE-MsgGUID: FdpNumKXRL+SpGiUrE9wNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="205105821"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 12:12:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 12:12:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 12:12:24 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 12:12:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbHESVlhAhAb8Fmh6KE9QhxPu2REc5OMxb5Ly0PC1GJMI9ecsTPSXk/z1aZsidHB4VHi01iwl8flBcwi5z/lrCdkJglK0OegMESbQkwksjmULqQMnf6B1M5QoZtrQYWNZfPBYskTyK4lDSulv25pEs3tEy4lszwL+xCaKEV8U20+TRrI+tGmLsffRLe6irt4lsqZp0PuAPsykUgwaZGuytr1nhkpD5aght9NYLWusVZpp/hLTeShEPj51q+7PQgM0CnxdAlk1ZMLXZyCQQP6ure6jpe4rrBMndV3K2bMCbkJ+YXf/1IBDDPovwM7PyuY9lAQ/nBvqlmTuGjYPVZsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggOgimAT97jsG4fue5R4W5NG/b3//mDAIpiZCWnrjvA=;
 b=tSF7setsc18DQW0s+5UQGha5utk6RW4FIUia9bUw0ikB0NGQYQuMOntxfg3cUGU7sq2iogPD1ZRFDHBzelUHQxzPj2hyCDb3RlxvN9UeZM1X4tWA+D/VSVVzrgwGdv8kBKlU4tMNGQwYAyYyM3MHuFnmkqJZ1m5jPT/rXtr1VbTsPr67xU/lhNHtgLDNNx4DZ/2SfwjRMnBksr5xZy8w0Hg7V24yOlyaITaNc2eEOT5e3VOjxYXLoQ4I4hhwjE86sAdO2waek1r/aMlv/D9GEP1NcbFgb6Se0u4RViMoln5pTz3DzalVFW2ZuhmtcT3FJwgClBYiVZdAnUz5k+STQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 19:12:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 19:12:15 +0000
Date: Sun, 12 Oct 2025 12:12:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 06/26] drm/xe/pf: Add helpers for migration data
 allocation / free
Message-ID: <aOv9jIA27B3kJt0L@lstrano-desk.jf.intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-7-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011193847.1836454-7-michal.winiarski@intel.com>
X-ClientProxiedBy: MW4PR03CA0310.namprd03.prod.outlook.com
 (2603:10b6:303:dd::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 7119786c-d787-4cd6-5a6b-08de09c3417e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmF4NlNmMVFkSy9WUW1wZUJBYURkQkVGb1FZb3g2TEFlSGgxVnFWRkMvZHlH?=
 =?utf-8?B?Yk1BUzNROE1YMWxvVyttWEdlSVFlLzFESnVRdzhCcEdBQ1R3RkVPSFZsOWhQ?=
 =?utf-8?B?bG5lTzNnZDZLRU9zcWxwU3ZvOTF0dUlhVGc2QkNnQjQyVTQ1bGlkUytWNWky?=
 =?utf-8?B?ZXhORTZiaGlyc01oV1Z5K2s2TklGSGo5MWRLVlcxbEZzT0duNzk2UVBoSW5u?=
 =?utf-8?B?Qjl2OHlEVktNbmo1NS92RWhkeC9odlhjWXRZVlVBUldvVWZqRmxPRkEwWkYz?=
 =?utf-8?B?NFhlN05iWkpYSGRLVWZRT1dVMzVVQWdTelRtWGdQMVRXNHNEdVBOclhCMG1V?=
 =?utf-8?B?RUxoV0plUkwyN3JvVmtyblZleU5RcEpBVlRJYnRacmF4L1A5WC9qSytnbWMr?=
 =?utf-8?B?Nm5iaXk5akZIdm8rRTUxVlA0bGtDcElFSzlNMGNqRWNtbm1rd0hHbWR2cUh0?=
 =?utf-8?B?RkJqWitwbkdKUjlOQXpEU0xXcko2ODdvM0pzek9qSDFWbjFyWFFyaWo1eGQ2?=
 =?utf-8?B?eVlLVGFEbEk2VGhFektOdFhOUS8rV3F2eDhOSm5MZlZJWFkvYnEyQmljOGh4?=
 =?utf-8?B?NXJmTjMwVVVTb0RJaDNGZWlvOHdzeXRHb0VkOWdSRUZXazQ1a3JPeTBUbjJr?=
 =?utf-8?B?NUlXWG0vWUVNRmpTa0VOUFh5cGo2a1R4UTJqaWpEUjRYclJJdmpFWHhwbm52?=
 =?utf-8?B?QUFXbWlrMGs4L0JRVVlZd2FjYU9ScnFoTlFibzFZSlpRV015UzAzYU45RFp6?=
 =?utf-8?B?QmVVSCtyTVEyK05YTWNkY2hEclBzUWFTdmF0SWNyREZiM1l0Y0g2UUxBdEtD?=
 =?utf-8?B?Q1FIQnI4c0ZkTDZnVlRxSlpRRlhFaTdEWXFsUVZxMmY1TEMxWWY3ME9xek83?=
 =?utf-8?B?YnNQK0NreHR1NXRJQnlubXpaMjEvMU9DdGxLdDJBZUs1ei9jeWw4c05rckRt?=
 =?utf-8?B?MHZxbkJyUUEyYjE5MDRaamZ1OVpiNVhZZFErczBNbUFSZHJJVWFXWkhueTNB?=
 =?utf-8?B?RWdjTVFIV1B1czQ1R3pxNVlRbGFBWm1FbmU3YzR0NFUrQlZuRW45R1JKR3pl?=
 =?utf-8?B?ZndZQTh1THh6Y3JoYUdKVEZBN2J3TEg5anFIQS8wK2R3L1hXNXNXZmhBNWhY?=
 =?utf-8?B?dkcxNHpVVmo3TXo2UUZCK3I2QWYrblBiV2pncWZId2g4R2RPdDZ1bmRtNDJZ?=
 =?utf-8?B?RVN4OEQ2VUlCdG1CNkp0TkZ6NjNzSU5TVTFLNCtTM3JHNHlxeFhaWVk3NkdK?=
 =?utf-8?B?ZUtzdVgzbGtONy9rTlJKZ3dVR05rc1hMVm02cmJnMWZQc3ppQUhLSmFZUVMy?=
 =?utf-8?B?MmtqK3NmNlRXdnM2WW1UenNtbmFVanJvK2pSMFZ5WjM5ZVFrVXMvNmUvaTQz?=
 =?utf-8?B?THQvdGZUelgyZGVVSGZjellhWk5kRnhtN01NLzNVd0J5Q3dNQytxMVpVVVJw?=
 =?utf-8?B?UGczTVFrZTBsaVdxd0hGNndXVG9uSmNMR0lXSWJpMVFQaUJHRUZERCtNYm1T?=
 =?utf-8?B?V2FPSnA4WGpRT2tmL3FVTkdhZ1BoQ2pZak9MdGdzVlo2aVZyN29qSkVkUGM4?=
 =?utf-8?B?VDVoTlBCcUNzcDFrY2VNaWIwMFdxYjBFZi92M0F0akFYOHRpckc2eG82L0Ry?=
 =?utf-8?B?Vk14RzRFTXo0YWFHaG00bnZXeFo2UXdZTXVuKzMxd05SbDhKcDlSTUVXbEJQ?=
 =?utf-8?B?WmJiLzJlMFozZm1IN29Ud1RTaW56d0FQT0d4VTBRalpRVFNwZStaZmpTdGty?=
 =?utf-8?B?YUtOcWU1MmFZK2paR3FhNHNNQUhndUhKOFNjaUg0YXovajZxMDJRZGpBUlZO?=
 =?utf-8?B?MUxPejgwT1N4Y09CL0VsNVdWWk80cWVNdWVzLy9KdVFiSW5xcTNtbVlOR3pk?=
 =?utf-8?B?V3RqWUFuVnBJZnBHMEU3d3djSUl0K1JRcDhhMGlZQ2RweTVWZmtiYjVoUjlo?=
 =?utf-8?Q?f238eZNciI6PBgDOPU+QgOAD455DN4gO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGk0ZzdhQk9QOWFJSjJSbHp4Unh1a2NsRTk0SE5raXp6RTF3ZEdPT29qYzVH?=
 =?utf-8?B?MlEyR2FZSnpxREwraHpnNmZ5MzVpOXVjVmZmRnFRQWw0M0VQb3dsbUZzd0kw?=
 =?utf-8?B?dWtUTVZPUStYV04xaERFaGoyOXNLS1BuN2pIQnl6a0dPRC9xUTNoOW1rM0RK?=
 =?utf-8?B?TUFEeFRzQk9GcEJkVjYzL1dvT2NJU2FkeE5ZYWNqV1dIZ1ZuandFcHR1ZE05?=
 =?utf-8?B?M1dvRldkUDRsZDNoaTlLajgycEtaL04xWmc4MmpFV2tLVDRyREhHcUgxLzJ2?=
 =?utf-8?B?MGY1dEZJaFdXbXk0ZnJoc3dwd1ByMzFiMUg4K3V4aHkrT1dhNDk0Ym5QckY3?=
 =?utf-8?B?ZGtFWndDMmZkRFhnalFndTE0bGVYYzlNUXBtbXdOUGRuTDgrcGF2anFCNFZK?=
 =?utf-8?B?QmtJbmEwZzJlN3Fjd2lRTEJ5S3N4ZGFldmlGbDZ3Q3JIajN2VXllQndGZUov?=
 =?utf-8?B?bjFGUEM4aDlGMkljZjl6aUlESHZRaUlZc2dkOG9mc0pGUkg2NHI3Ykk4MlVp?=
 =?utf-8?B?OEhMVmZhR2tVVENXa2tncVZ6MVhucFExNjFqSFJuTERIdVU4WlpGMHIwSUJY?=
 =?utf-8?B?ZURxcjRRc21ZMWNhYzVBb1VPR1o5d0JyWDBNcmZMV0J0N2JGWkcybWRXZG4x?=
 =?utf-8?B?YjJiY1A1Z1dNWUUxY1Bzd2xQZjlBTVVXRWQ5NENYdWFLVE5EcDJlWmFwRysv?=
 =?utf-8?B?amZ4MytLZ3hmRUVlNU9jbElyZDhyejVLeHZCOVBBb04rYzV0S1NXK0kwRXJE?=
 =?utf-8?B?UFZ3ODQyYkR4UlNERFpqdG11UTNGT1NROWlvekRxUzJYNjMxNU9QNXJjYzNw?=
 =?utf-8?B?UXNPQjZsc1dqQ3NTZ3dtbWZ6MFdFZENxVm8rK3U3SnFTc3htakx1YVgyZ01p?=
 =?utf-8?B?N2FGOEJBbGNtYk5QQ0pZMnJ0QmZzVlNxbC9rUTJ4RklIcUU4dUgxU3RoZmlB?=
 =?utf-8?B?VG5uSklrenF6aUp1VDdvOUdKd25qYlBhZDhoaWdmaTVRa2JxY29DUElCZ0hE?=
 =?utf-8?B?cEVMM1FLT2UzYi9Zc2pLc0JIT2NSV3JFZldPYWRXYkVSSVZRU1p0MlV0YmNO?=
 =?utf-8?B?WVVyN2Z4RUFMbERTUlRZTVlQeS9GbWxtRzRvOE9Ba0k4eW9nTS9RRy8rUmUw?=
 =?utf-8?B?elhUNG5uYkozcjRrYy9NZEVCSFhiZy9QRUlkalk4QWVvTmVmMjU1ZU44Tyt0?=
 =?utf-8?B?cVFacTQ1OWtMSmNKYUtjanhUd0FWQzZTZndoZHdnc0dxRzdKckZoZll2K1dy?=
 =?utf-8?B?NXFsZVI4TmtZdm1IWnBKNkptd2QwbFFXRmhWM3R2Y1kvSEdLa2x1TWFodlZZ?=
 =?utf-8?B?TDRucUFxQm5pMU1GUXhhMFZvb3lnVlB1Y0ZtT0xUYmJJWjMwbzRBR1VhRGk5?=
 =?utf-8?B?SjBrYUtpek1FTjY3RHI5STZqbjQ2Qmw0NFBSUllhSnNjVkp1aHN1TjlXWVBT?=
 =?utf-8?B?Q1RVMklOeC8wc2x6WFovNTVvZTFHWlpVRTFEM2srUEE4SzR0UVNOTi92SlRR?=
 =?utf-8?B?WWZGb2QzaFUraDhCYjhONXhyVGpGMk1RWkdKWThyd2ZoeFNSdkNvOGVhSWNH?=
 =?utf-8?B?NnBzbmJIcEtqQkdqc056aWpXMi9UcnBQOEtKSFlLdy9IZWVyK1Brc2dmYWlw?=
 =?utf-8?B?S3Rtc3U5OVpQRDhhRFA0YitDY3ErUzc2T3E2SEFmL2hNMlZsZ1JBNEt1TXpu?=
 =?utf-8?B?d0xUTnZjNmNKdHJhSkM3RTZ2VmVEenNpUGhCRmdKT0JuWis0VlpXL1BjeUM0?=
 =?utf-8?B?bWVlUDlmcStnTjRRSTNrNnlxTlA4a2FaMS9qZVVPY080L0VRU2JzN2FnNTgz?=
 =?utf-8?B?dWZhOE05aDFZSjZWUDlIUEoweURKYzB1anpXL1NtS2xURTlmY1FXcDNzbTIz?=
 =?utf-8?B?WjYwZXc1NDVCZkUrcy9mMUJVOVZENTVON0dVWmN3MnFzMk96d09sTjJlV1FM?=
 =?utf-8?B?cTFPdW1GVlBRUEZPUktxL1FENXNoQVVpL0lKMExyVkF0bGlBN2VNL2k3V255?=
 =?utf-8?B?b1BIZ2o5Vi9rb21MWGQvSGZUc2xIL2d5TUpFemlnRHVYbjJ5U04veHBwS0dx?=
 =?utf-8?B?TnFncCtXRGpCRDcwa0tBczgzTUJ3SmZSMEF6RjNhWnhkWHdrRGNPanpvYUJl?=
 =?utf-8?B?L05vb1h1MVd0SlhpM2hKRGpBanhzallXd1pjRW5VaG1xYUVET2paY1c4MnIw?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7119786c-d787-4cd6-5a6b-08de09c3417e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 19:12:15.6670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UG1qBglHucC1BisAZMdemYBXbdx+2I0e8yItCYk9g2BQjO4T7wgqiXF0+8tn3C6YpCaUseNL2jwyqmKJQ0OMnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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

On Sat, Oct 11, 2025 at 09:38:27PM +0200, Michał Winiarski wrote:
> Now that it's possible to free the packets - connect the restore
> handling logic with the ring.
> The helpers will also be used in upcoming changes that will start producing
> migration data packets.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  48 ++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  10 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |   1 +
>  .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 135 ++++++++++++++++++
>  .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |  32 +++++
>  6 files changed, 224 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 71f685a315dca..e253d65366de4 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -177,6 +177,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf_control.o \
>  	xe_sriov_pf_debugfs.o \
>  	xe_sriov_pf_migration.o \
> +	xe_sriov_pf_migration_data.o \
>  	xe_sriov_pf_service.o \
>  	xe_tile_sriov_pf_debugfs.o
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 16a88e7599f6d..04a4e92133c2e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -20,6 +20,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_pf_migration_data.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_tile.h"
>  
> @@ -949,14 +950,57 @@ static void pf_exit_vf_restored(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
>  }
>  
> +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
> +				     struct xe_sriov_pf_migration_data *data)
> +{
> +	switch (data->type) {
> +	default:
> +		xe_gt_sriov_notice(gt, "Skipping VF%u invalid data type: %d\n", vfid, data->type);
> +		pf_enter_vf_restore_failed(gt, vfid);
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static bool pf_handle_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> +	struct xe_sriov_pf_migration_data *data;
> +	int ret;
> +
>  	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
>  		return false;
>  
> -	pf_exit_vf_restore_wip(gt, vfid);
> -	pf_enter_vf_restored(gt, vfid);
> +	data = xe_gt_sriov_pf_migration_ring_consume(gt, vfid);
> +	if (IS_ERR(data)) {
> +		if (PTR_ERR(data) == -ENODATA &&
> +		    !xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid)) {
> +			pf_exit_vf_restore_wip(gt, vfid);
> +			pf_enter_vf_restored(gt, vfid);
> +		} else {
> +			pf_enter_vf_restore_failed(gt, vfid);
> +		}
> +		return false;
> +	}
> +
> +	xe_gt_assert(gt, gt->info.id == data->gt);
> +	xe_gt_assert(gt, gt->tile->id == data->tile);
> +
> +	ret = pf_handle_vf_restore_data(gt, vfid, data);
> +	if (ret) {
> +		xe_gt_sriov_err(gt, "VF%u failed to restore data type: %d (%d)\n",
> +				vfid, data->type, ret);
> +		xe_sriov_pf_migration_data_free(data);
> +		pf_enter_vf_restore_failed(gt, vfid);
> +		return false;
> +	}
>  
> +	xe_sriov_pf_migration_data_free(data);
>  	return true;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index af5952f42fff1..582aaf062cbd4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -15,6 +15,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_pf_migration_data.h"
>  
>  #define XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT (HZ * 20)
>  #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> @@ -523,11 +524,18 @@ xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid
>  	return ERR_PTR(-EAGAIN);
>  }
>  
> +static void pf_mig_data_destroy(void *ptr)
> +{
> +	struct xe_sriov_pf_migration_data *data = ptr;
> +
> +	xe_sriov_pf_migration_data_free(data);
> +}
> +
>  static void pf_gt_migration_cleanup(struct drm_device *dev, void *arg)
>  {
>  	struct xe_gt_sriov_pf_migration *migration = arg;
>  
> -	ptr_ring_cleanup(&migration->ring, NULL);
> +	ptr_ring_cleanup(&migration->ring, pf_mig_data_destroy);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 347682f29a03c..d39cee66589b5 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -12,6 +12,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_pf_migration_data.h"
>  #include "xe_sriov_printk.h"
>  
>  static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> new file mode 100644
> index 0000000000000..cfc6b512c6674
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_sriov_pf_migration_data.h"
> +
> +static bool data_needs_bo(struct xe_sriov_pf_migration_data *data)
> +{
> +	unsigned int type = data->type;
> +
> +	return type == XE_SRIOV_MIG_DATA_CCS ||
> +	       type == XE_SRIOV_MIG_DATA_VRAM;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_alloc() - Allocate migration data packet
> + * @xe: the &struct xe_device
> + *
> + * Only allocates the "outer" structure, without initializing the migration
> + * data backing storage.
> + *
> + * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
> + *         NULL in case of error.
> + */
> +struct xe_sriov_pf_migration_data *
> +xe_sriov_pf_migration_data_alloc(struct xe_device *xe)
> +{
> +	struct xe_sriov_pf_migration_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return NULL;
> +
> +	data->xe = xe;
> +	data->hdr_remaining = sizeof(data->hdr);
> +
> +	return data;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_free() - Free migration data packet
> + * @data: the &struct xe_sriov_pf_migration_data packet
> + */
> +void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *data)
> +{
> +	if (data_needs_bo(data)) {
> +		if (data->bo)
> +			xe_bo_unpin_map_no_vm(data->bo);
> +	} else {
> +		if (data->buff)
> +			kvfree(data->buff);
> +	}
> +
> +	kfree(data);
> +}
> +
> +static int mig_data_init(struct xe_sriov_pf_migration_data *data)
> +{
> +	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
> +
> +	if (!gt || data->tile != gt->tile->id)
> +		return -EINVAL;
> +
> +	if (data->size == 0)
> +		return 0;
> +
> +	if (data_needs_bo(data)) {
> +		struct xe_bo *bo = xe_bo_create_pin_map_novm(data->xe, gt->tile,
> +							     PAGE_ALIGN(data->size),
> +							     ttm_bo_type_kernel,
> +							     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED,
> +							     false);
> +		if (IS_ERR(bo))
> +			return PTR_ERR(bo);
> +
> +		data->bo = bo;
> +		data->vaddr = bo->vmap.vaddr;
> +	} else {
> +		void *buff = kvzalloc(data->size, GFP_KERNEL);
> +		if (!buff)
> +			return -ENOMEM;
> +
> +		data->buff = buff;
> +		data->vaddr = buff;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_init() - Initialize the migration data header and backing storage
> + * @data: the &struct xe_sriov_pf_migration_data packet
> + * @tile_id: tile identifier
> + * @gt_id: GT identifier
> + * @type: &enum xe_sriov_pf_migration_data_type
> + * @offset: offset of data packet payload (within wider resource)
> + * @size: size of data packet payload
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
> +				    unsigned int type, loff_t offset, size_t size)
> +{
> +	xe_assert(data->xe, type < XE_SRIOV_MIG_DATA_MAX);
> +	data->version = 1;
> +	data->type = type;
> +	data->tile = tile_id;
> +	data->gt = gt_id;
> +	data->offset = offset;
> +	data->size = size;
> +	data->remaining = size;
> +
> +	return mig_data_init(data);
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_init() - Initialize the migration data backing storage based on header
> + * @data: the &struct xe_sriov_pf_migration_data packet
> + *
> + * Header data is expected to be filled prior to calling this function
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *data)
> +{
> +	if (WARN_ON(data->hdr_remaining))
> +		return -EINVAL;
> +
> +	data->remaining = data->size;
> +
> +	return mig_data_init(data);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> new file mode 100644
> index 0000000000000..1dde4cfcdbc47
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_MIGRATION_DATA_H_
> +#define _XE_SRIOV_PF_MIGRATION_DATA_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +enum xe_sriov_pf_migration_data_type {
> +	XE_SRIOV_MIG_DATA_DESCRIPTOR = 1,
> +	XE_SRIOV_MIG_DATA_TRAILER,
> +	XE_SRIOV_MIG_DATA_GGTT,
> +	XE_SRIOV_MIG_DATA_MMIO,
> +	XE_SRIOV_MIG_DATA_GUC,
> +	XE_SRIOV_MIG_DATA_CCS,

grep XE_SRIOV_MIG_DATA_CCS  *.c *.h
xe_sriov_pf_migration_data.c:   return type == XE_SRIOV_MIG_DATA_CCS ||
xe_sriov_pf_migration_data.h:   XE_SRIOV_MIG_DATA_CCS,

XE_SRIOV_MIG_DATA_CCS appears to be unused right now, I'd remove this
data type of now.

Matt

> +	XE_SRIOV_MIG_DATA_VRAM,
> +	XE_SRIOV_MIG_DATA_MAX,
> +};
> +
> +struct xe_sriov_pf_migration_data *
> +xe_sriov_pf_migration_data_alloc(struct xe_device *xe);
> +void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *snapshot);
> +
> +int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
> +				    unsigned int type, loff_t offset, size_t size);
> +int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *snapshot);
> +
> +#endif
> -- 
> 2.50.1
> 
