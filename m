Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E533BA5F58F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 14:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7245010E88B;
	Thu, 13 Mar 2025 13:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNckM7B2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C2F10E889;
 Thu, 13 Mar 2025 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741871525; x=1773407525;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jV/3+Hz0gP7BZBzbdHB5pAHSlIAoNXddHHEyTofXLxQ=;
 b=eNckM7B2ztColTaZQGTuADja6TVNmrKr/3qRHNHeoW2seZHPp5tWfVrN
 EFCE749gdvnV39kc2b3NvZuRsQTbXqExE2mUP+u415Ijx5KJMUOAToS2I
 WqzPY2Ysll4dV0VRgdQs1ig76GYuLnqxlcGZz+s1GULbECSV/1CwbxRax
 679H/1gv4qOEFDNeEtke0dUv5NSvjAtHU1wDqdnu1QPlFBDlzm/NMnmYh
 I/3aL2cIB1apoe8+4djGdYEcaqiCNQ3HgDewqIWYD3Ubp011bfDBDinwh
 optFoFNbuA1GaajKiEKZoSbsh6lKrqieB3ijxw0qvrdurSIZqTdjqZ/5q g==;
X-CSE-ConnectionGUID: JOEV9TbzRVmrb1L3wQQT3g==
X-CSE-MsgGUID: vlvOg6BLRhSzBBei4o7g5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46638094"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="46638094"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 06:12:05 -0700
X-CSE-ConnectionGUID: tJXtb8axTWWC4E0kukovWQ==
X-CSE-MsgGUID: n+fCf/GwQSi6CfdgZQC4lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="158104693"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 06:12:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 06:12:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 06:12:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 06:12:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMb9zmYGEZ7nxdqDgkXbr/Rl0dWQUb/6HNhYjxe+YNt4QSmvqqpPdQqGhrZvq2hkFwc0qJtZ2M56hjwpSmq4WRiKtDdmroOauALC6m0gve8v9Hvt3UM8x94q5aGFtaCCJYoSmwnhgz0b+eU/Vkgz2TmJ29YzjpImlBOlUxtO/MEaBvS7i/4QI7BjxbscE7Yv/0B2YfUizt/MST+0qZMhHDF2F8LBLKKJvzP4TLpOoa2a8OVC6V/heV+8y1R0n99dWNsBzfjh7UuZylU1JwJVNdziZXr+S3ju5GwbNtvVKSW+z2KUC0IG5q5QigM8U99kpzC7Y7vomrhrIoD8nCpLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Epffd/UtpAoPwdA86vkNKPgdInsiIlbvmh3BKq6UyRM=;
 b=Z/hsQap9UXF+zFfCgxVtNIZ5STGb+mErnqKzxlT4+8iML81XUyN71HD4h1NlH8nTSr880zNlxFv/lIJF8VQ3h1MWpkEBXbhiL3rBWOTzsNC+sZwRE2lkEXaZCUvQwpZhiJokjkmYg1o/Ipnavmecm6XrabcSBWPJ5sZP190NCQfXVY3AVVTC9xeAwyo/0D0/IPzc/DaO+3/Z+Ay5cg4k2HjNVlUGUkv4cJ9NucGzvzIuvBv6Sx8g8heHYnHjemwMqT1f9B3w8+NYgsas4u0XLHUvkOShCvBujst0Ya8oTGOPis+oyq31yhT9bV7NvE2O5eVyHDStyuXR5fdBgmJPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 13:11:46 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 13:11:45 +0000
Date: Thu, 13 Mar 2025 14:11:35 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4] drm/i915: Fix harmful driver register/unregister
 asymmetry
Message-ID: <iij22uuf5v2qq5vss5uszwowkzqrlgqbo5vxuidocebgqu52kr@tt3hdgn2ppgq>
References: <20250311200550.637383-2-janusz.krzysztofik@linux.intel.com>
 <bqek2zam4zle4ilp3fcce4tnkocqdj7vfczvpswr6sswjbn3kr@a6pmh5uofyf3>
 <3330897.aV6nBDHxoP@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <3330897.aV6nBDHxoP@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: VI1PR06CA0188.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::45) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DS0PR11MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5e3deb-76e4-42c8-583b-08dd62309b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmpQTWlNa1dSVnVWUVVjQzhYdklkWVFSR0ZlZzBzUHBIZlNyYVA1eGYwZThP?=
 =?utf-8?B?bW93ZUgvQmMyalkzbXBIK1N5L0dreForNUJMSTc3WGk0TkF5QWd6MkNEMi9T?=
 =?utf-8?B?eENNdFYwNElkVkU5OHBrdUthdjVXNjhXbSszcnllUnZZN3BKdkZrR0FhSFpQ?=
 =?utf-8?B?VFM1a1dCUUtWY1VIdFY1MzNWMjA3ejlwd1hlejM4bkNIWTVGMHIyQ3ZFVi81?=
 =?utf-8?B?THFJbjh2ZzhyRTdMYVNyUFhzZzRGQWtsTW1lRmRkaUdwRXNXWENDMUdKMGNq?=
 =?utf-8?B?SE1BajBYV2ltaUxmVkgxTVFqUUpITkZtV3FoUzJDY3VIMEg2Vm9KRzFsSXVJ?=
 =?utf-8?B?bmdhbFRvQkZOdGk2V0JHcERldmpGaGJldU42ZGhYTkNEKzZWaHAzRGlKTXor?=
 =?utf-8?B?Z0svNVEzdURvWjBuRTJxWHI5WVloTEhGN1N4am1uNGFKaHJCdFBnbmRUVHdk?=
 =?utf-8?B?MFpMWjlWdUF5bVVqNytpNGpOd1hBUWducUtuaEdoQktsR1lpeS9ZaDhQbUo4?=
 =?utf-8?B?SEFDSGlTcStqRzZUcmU3R0Z3NXRFV1N6SzViTDZGZTRSSXpLYTdwTFdYZi96?=
 =?utf-8?B?L1ZHcDdNQUZuZXdmVStxcWNpUFlZOEpzLzRjZk9rOVVnOTBBZG1JTWNuYm5I?=
 =?utf-8?B?d3ZrdEVtVWlUc1FSeXdob2ozb0d3cXZkOVRCdFV2cnNIS2lWK043dVhQSDVN?=
 =?utf-8?B?eVEyMWh0b254Y0NNOERrWkRoektPQU1nekVTNVNnQ3h2QlI2NjRuZkp1ZUIr?=
 =?utf-8?B?YU9FWnhRUG1SbmF1WjFNMEgvbkNOalNxSEpHU1JvOW0vK3hlRGFpUUpYT2FK?=
 =?utf-8?B?RFhydnBEUkxPejExTUNEQUdTK3lkSENrUTdaTy8wdTQ4bEdzenNVN01qd0xv?=
 =?utf-8?B?U05mcjViTlVEWWQ1K2k5cHYwSDRFU2lYd3RXN1pleSs2RytYL1RwQi9ldGhU?=
 =?utf-8?B?b0ZiUnpCZCtYU2JqZ2x6cVNaZ3BmVnBYRWlRcVdGMTIrNVBZUkJhR2J6Y0ll?=
 =?utf-8?B?UzRZcGlWY1hLNmhnNUVEVFNsdWR4OXN5a3dEWVFrbjdGeVI1VXVxV3VOMnhF?=
 =?utf-8?B?SE82dnNrYW9ZdHlZbkV4eDdxVGVhVFpWZFpIQ1JWVHJWTndmY0RVbzlOZnVN?=
 =?utf-8?B?UVFCSVYzaFpvWlVmL2xjYWh6Uko1My9Td0hKZDlkdVZLbzdoVVZnRDIyUTR3?=
 =?utf-8?B?QWtLalMvNHZmdTNrTHNXbTF4R1VaV041Z0tOdUtnV1NCVEpuWXJLL2RrK2ZR?=
 =?utf-8?B?UnpMU3RueVAxVU5lVUVXMk1XajM4OVU4WFJWSDdCWXE3T0h6QkVWeE1FbU5T?=
 =?utf-8?B?bGxUN0dWcTgzblZMN1ppQytCTVdMczZPMVdxcHM5akIxTjVVRThCV3BhY0g2?=
 =?utf-8?B?NmdINUNQMk1aa2lTZFAydmFjeWxNZTgwRHVEVlhISmlEdG9aQkY4UC8yYkN1?=
 =?utf-8?B?SGJsS21BWkQvL1dLK3hQMHV4bldRTXl5SlZYcTU4L3gyNUhaeUt1VDRKNGhC?=
 =?utf-8?B?WmhKdUptdFJ3Z3VJaGR5SW5zOVZWS1pLbG9iUm9zWUFwOFZZZVJEWEVlcmdw?=
 =?utf-8?B?V3BwZFpCL0lLeVN6d3NTNExaYUxaSUIxYXYxN3ppanJJVXNxclEvSUhEdWxP?=
 =?utf-8?B?YVBPS3J3VitaeExZRHRhUG5SUVdrOUJHVjV2YW9SQWtaQmFhWkxtVEtRRVRz?=
 =?utf-8?B?cG1mc0pWeUIvNXhnWEZhNktvN1pxaHN0a3lWbXNFWk1pTUxvU253dEpiSkRn?=
 =?utf-8?B?dmFjYk1VOEdlalVQREQwZjgyZnE0c0Vna0hlbFdpMHZteCtDVjVOc05SVzVm?=
 =?utf-8?B?dk9UM3hsaENKemVaekhQQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjI5a1lyeDVUR1dHSXd4UFBZbURvazhrMXdvbC9VUG41eW1rNlRJcnoyUzJp?=
 =?utf-8?B?bDJpLzJUZG00eDZPSVVKRFYxRDAyTzZnQkZ6VDBvblpKQXVOVmNiSGRaWE02?=
 =?utf-8?B?cTBhUENBZllrWmVIV1ZwOEE3bEsyaEYzK0ZNcTBkakRPOWovMVJFRExsSVM5?=
 =?utf-8?B?MllXdi80bGlZZlRUV1FLTzlUNWdzMDR1SW01bkVEaUFZTzFjQ3gxVG85YldE?=
 =?utf-8?B?M3BjWU5yMjVRbG1FbW1mZzV0OEZVVFgyT3YvOFIxQVBEdXRGaUJ0SXMzUEdr?=
 =?utf-8?B?R1RwSmZ1UkZJekFZZDN2dWd2ZXNid3lpQTNrdTUrS00za2toR25SQ3RQL2xv?=
 =?utf-8?B?VjFzV2M4RWRPVEZRUzAxOU5ROFQ2cUMyaHhIL3ZjVlBXYjJWSGZ1S2xaY1lG?=
 =?utf-8?B?ajZrVUZIR1RnVUwycjdRcTdnRmRnMEdEZW9BVEl5UVFiTlBkTzFRMlUvK1BR?=
 =?utf-8?B?Z3ZUQ1YvZzBnSDQrMDFCYVlQbUIvSmVnSi9WemhzMGN3Z2psYmlxdjV0Z2xa?=
 =?utf-8?B?VERTVmJpcmRxeWZXN0NIb3lJaTlxOUlrdjFWV2tDRXRWTWFBOWVYcnJHQ2xI?=
 =?utf-8?B?NW1uY29JZTFVNWxNSnFwZXpZckRaM2xLSUk3Nzl6bm1JcnZYUExZZVk0Vm41?=
 =?utf-8?B?TTFtcGl5VjRXR1p1aStoWUYralFzcXJqWHpkcGd1VG5nRlEvYWgwWm1jTnF2?=
 =?utf-8?B?MmIvTUR0dEgyU0pTZ2xuVEtsZDdFL1FXVU50Z2R3Vi80TFBlOWJVcTdEaGlp?=
 =?utf-8?B?YVYvTGdpeHdSUEgvQjgvS29KbDJ0L0lYRUp3SDRBTWFGY3pTYkR4Ry9XVXQr?=
 =?utf-8?B?MG9RcUdqZ0RBdWI5aVd4YlVFZ0doUnlUSTFiZmlpWGRpbVhSaU53RHl0V3lS?=
 =?utf-8?B?NS9ta05aRTRlNUFsTCtpQndKNnVmSjExdVhFR2tjclErc2NaWitBd1BnbGRu?=
 =?utf-8?B?QlFCYmVaenlBNFJNQkJicFA2OEd6UGR0K2pvNWZlVHc1djg3cDhIV3U1ME5i?=
 =?utf-8?B?VmR6TnJVcjBaSGtwTDlORWcwNGZuZFd2VHdBU0pWOGkyN3VIaktOY1BGTEN2?=
 =?utf-8?B?UnVYNVRRSE5xazh0bFZuVnI5ZFFkS0toejRWS01LeURGZ244OHcxVU5nWXhu?=
 =?utf-8?B?WXo4eUp1MXdVTnZvN2pVN1RCMkRVWHpqRWhKNFFwdUc2Z3NVRWZGRC9LWE9K?=
 =?utf-8?B?QVJLb3cyMlRRTnhLTGZPT1FRa3J3emFURjRUVk5NV3VGYXlQdHdzTENFbXFC?=
 =?utf-8?B?OXlVOXhKb1dwYURScENLZWJ5eDByblIzUXlrcnZXS0EvYUxDeURNSlMvV3ln?=
 =?utf-8?B?Q2UvY2dCTmM0Mk11MVc4a3RMc2FhSW9pWHU0QzZkVjhMbDZwOFdOM2p5NzVG?=
 =?utf-8?B?Q1NabVB6Q0Judi9wQm53Szd0MDBRbC96VnNaRlpveDZwbnlQdmltUUNKa0N1?=
 =?utf-8?B?QWF5SHdGQzVKemN4RWJsemJtZ1BZR3h4UlhDZ0E0N0t4Qk1MMjVYbTdKZDY0?=
 =?utf-8?B?WEdHbVVFOFRPeGlGcVhzWVBUVHYwN0diMXRDcnhiZDdOcnNqYmtwQUJXREd5?=
 =?utf-8?B?K0lXeGZUWlNwNWFha3IyMHZFWWF5SEM5bWt5aXJ2dTA5K2lENXc5R2xkNS9D?=
 =?utf-8?B?UGJXSkVRcFdBeGk4eXNZaXp0SjB2ZFZNenhxeUNJWnBiT1MyekxOVzJpTlRP?=
 =?utf-8?B?dnBvYklUbjYwRGhaOEpoNmlBS3dRYnBZbm9HUTZCN2QyZ3crYnc2Wjdvcmly?=
 =?utf-8?B?aGZNQVlsVHVmdWF4cEF4T2tRcCtjZzE1N2JqZzZEaGJBcXFsYXhlTjV2enla?=
 =?utf-8?B?UnBGNFEwbEVBcFVHLytrbllQdGZJSjhFMU5hOWY3NUtoSTkvdFNTUEZteGJ3?=
 =?utf-8?B?UzQ2M1ZRTS9ReUt0b29zSkxCOU1iLysxS1g1N2hXWTNYUGV6V1lpU2pUY1VR?=
 =?utf-8?B?TWo2MU1rTkt4Q05VT3NWQWFMWHVVL1pNRHl4RzJPTWlSYk9ZL3M1dGRNSHp5?=
 =?utf-8?B?K3QwbnUwbjFhNUUxQXQ4NlpRamVZdFUzYzZzdkJ4WW55SGVwdkx0ZjVjZDNk?=
 =?utf-8?B?Nm5oeDUzd2RTajVZQUNZL3lweHBTT3A4SnRaZ3o3MDhmQU1GczZ1dVFrSG0y?=
 =?utf-8?B?RVhvRmo5T0RWYXE2cXlxb2dDL29aQnpFQmdNOTRiYnJPc2ljTTdWQkNTVG1V?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5e3deb-76e4-42c8-583b-08dd62309b29
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 13:11:45.8954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsiU56TUZ/4Scm6wSzaAQ4JRVnUHQp8ntg+Wq5r/F5jNWFKs1grAfoje8cfZtRQUYQClsvfqxhvxmikPiCLwAuJQD167ZE2+whD2zKeu5sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
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

Hi Janusz,

On 2025-03-12 at 17:58:13 GMT, Janusz Krzysztofik wrote:
> Hi Krzysztof,
> 
> Thanks for looking at this.
> 
> On Wednesday, 12 March 2025 16:06:15 CET Krzysztof Niemiec wrote:
> > On 2025-03-11 at 21:04:56 GMT, Janusz Krzysztofik wrote:
> > > Starting with commit ec3e00b4ee27 ("drm/i915: stop registering if
> > > drm_dev_register() fails"), we return from i915_driver_register()
> > > immediately if drm_dev_register() fails, skipping remaining registration
> > > steps, and continue only with remaining probe steps.  However, the
> > > _unregister() counterpart called at driver remove knows nothing about that
> > > skip and executes reverts of all those steps, with some of those reverts
> > > possibly added or modified later.  As a consequence, a number of kernel
> > > warnings that taint the kernel are triggered:
> > > 
> > > <3> [525.823143] i915 0000:00:02.0: [drm] *ERROR* Failed to register driver for
> > > userspace access!
> > > ...
> > > <4> [525.831069] ------------[ cut here ]------------
> > > <4> [525.831071] i915 0000:00:02.0: [drm] drm_WARN_ON(power_domains->init_wakere
> > > f)
> > > <4> [525.831095] WARNING: CPU: 6 PID: 3440 at drivers/gpu/drm/i915/display/intel
> > > _display_power.c:2074 intel_power_domains_disable+0xc2/0xd0 [i915]
> > > ...
> > > <4> [525.831328] CPU: 6 UID: 0 PID: 3440 Comm: i915_module_loa Tainted: G     U
> > >             6.14.0-rc1-CI_DRM_16076-g7a632b6798b6+ #1
> > > ...
> > > <4> [525.831334] RIP: 0010:intel_power_domains_disable+0xc2/0xd0 [i915]
> > > ...
> > > <4> [525.831483] Call Trace:
> > > <4> [525.831484]  <TASK>
> > > ...
> > > <4> [525.831943]  i915_driver_remove+0x4b/0x140 [i915]
> > > <4> [525.832028]  i915_pci_remove+0x1e/0x40 [i915]
> > > <4> [525.832099]  pci_device_remove+0x3e/0xb0
> > > <4> [525.832103]  device_remove+0x40/0x80
> > > <4> [525.832107]  device_release_driver_internal+0x215/0x280
> > > ...
> > > <4> [525.947666] ------------[ cut here ]------------
> > > <4> [525.947669] kobject: '(null)' (ffff88814f62a218): is not initialized, yet kobject_put() is being called.
> > > <4> [525.947707] WARNING: CPU: 6 PID: 3440 at lib/kobject.c:734 kobject_put+0xe4/0x200
> > > ...
> > > <4> [525.947875] RIP: 0010:kobject_put+0xe4/0x200
> > > ...
> > > <4> [525.947909] Call Trace:
> > > <4> [525.947911]  <TASK>
> > > ...
> > > <4> [525.947963]  intel_gt_sysfs_unregister+0x25/0x40 [i915]
> > > <4> [525.948133]  intel_gt_driver_unregister+0x14/0x80 [i915]
> > > <4> [525.948291]  i915_driver_remove+0x6c/0x140 [i915]
> > > <4> [525.948411]  i915_pci_remove+0x1e/0x40 [i915]
> > > ...
> > > <4> [526.441186] ------------[ cut here ]------------
> > > <4> [526.441191] kernfs: can not remove 'error', no directory
> > > <4> [526.441211] WARNING: CPU: 1 PID: 3440 at fs/kernfs/dir.c:1684 kernfs_remove_by_name_ns+0xbc/0xc0
> > > ...
> > > <4> [526.441536] RIP: 0010:kernfs_remove_by_name_ns+0xbc/0xc0
> > > ...
> > > <4> [526.441578] Call Trace:
> > > <4> [526.441581]  <TASK>
> > > ...
> > > <4> [526.441686]  sysfs_remove_bin_file+0x17/0x30
> > > <4> [526.441691]  i915_gpu_error_sysfs_teardown+0x1d/0x30 [i915]
> > > <4> [526.442226]  i915_teardown_sysfs+0x1c/0x60 [i915]
> > > <4> [526.442369]  i915_driver_remove+0x9d/0x140 [i915]
> > > <4> [526.442473]  i915_pci_remove+0x1e/0x40 [i915]
> > > ...
> > > <4> [526.685700] ------------[ cut here ]------------
> > > <4> [526.685706] i915 0000:00:02.0: [drm] i915 raw-wakerefs=1 wakelocks=1 on cle
> > > anup
> > > <4> [526.685734] WARNING: CPU: 1 PID: 3440 at drivers/gpu/drm/i915/intel_runtime
> > > _pm.c:443 intel_runtime_pm_driver_release+0x75/0x90 [i915]
> > > ...
> > > <4> [526.686090] RIP: 0010:intel_runtime_pm_driver_release+0x75/0x90 [i915]
> > > ...
> > > <4> [526.686294] Call Trace:
> > > <4> [526.686296]  <TASK>
> > > ...
> > > <4> [526.687025]  i915_driver_release+0x7e/0xb0 [i915]
> > > <4> [526.687243]  drm_dev_put.part.0+0x47/0x90
> > > <4> [526.687250]  devm_drm_dev_init_release+0x13/0x30
> > > <4> [526.687255]  devm_action_release+0x12/0x30
> > > <4> [526.687261]  release_nodes+0x3a/0x120
> > > <4> [526.687268]  devres_release_all+0x97/0xe0
> > > <4> [526.687277]  device_unbind_cleanup+0x12/0x80
> > > <4> [526.687282]  device_release_driver_internal+0x23a/0x280
> > > ...
> > > 
> > > A call to intel_power_domains_disable() was already there.  It triggers
> > > the drm_WARN_ON() when it finds a reference to a wakeref taken on device
> > > probe and not released after device register failure.  That wakeref is
> > > then left held forever once its handle gets lost overwritten with another
> > > wakeref, hence the WARN() called from intel_runtime_pm_driver_release().
> > > 
> > > The WARN() triggered by kernfs_remove_by_name_ns() from
> > > i915_teardown_sysfs()->i915_gpu_error_sysfs_teardown(), formerly
> > > i915_teardown_error_capture(), was also there when the return was added.
> > > 
> > > A call to intel_gt_sysfs_unregister() that triggers the WARN() from
> > > kobject_put() was added to intel_gt_driver_unregister() with commit
> > > 69d6bf5c3754ff ("drm/i915/gt: Fix memory leaks in per-gt sysfs").
> > > 
> > > Fix the asymmetry by failing the driver probe on device registration
> > > failure and going through rewind paths.
> > > 
> > > For that to work as expected, we apparently need to start the rewind path
> > > of i915_driver_register() with drm_dev_unregister(), even if
> > > drm_dev_register() returned an error.
> > > 
> > > Also, in rewind path of the i915_driver_probe() we need to clean up PXP
> > > initialization before it's safe to call other hardware cleanup routines.
> > > The intel_pxp_init() without a corresponding cleanup was added to
> > > i915_driver_probe() with commit f67986b0119c04 ("drm/i915/pxp: Promote pxp
> > > subsystem to top-level of i915").
> > > 
> > > v4: Switch to taking an error rewind path on device registration failure
> > >     (Krzysztof, Lucas).
> > > v3: Based on Andi's commitment on introducing a flag, try to address
> > >     Jani's "must find another way" by finding a better place and name for
> > >     the flag (in hope that's what Jani had on mind),
> > >   - split into a series of patches and limit the scope of the first (this)
> > >     one to a minimum of omitting conditionally only those unregister
> > >     (sub)steps that trigger kernel warnings when not registered.
> > > v2: Check in _unregister whether the drm_dev_register has succeeded and
> > >     skip some of the _unregister() steps. (Andi)
> > > 
> > > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/i915_driver.c | 22 +++++++++++++++-------
> > >  1 file changed, 15 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > > index ce3cc93ea211b..dcf723da8d409 100644
> > > --- a/drivers/gpu/drm/i915/i915_driver.c
> > > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > > @@ -622,11 +622,11 @@ static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
> > >   * Perform any steps necessary to make the driver available via kernel
> > >   * internal or userspace interfaces.
> > >   */
> > > -static void i915_driver_register(struct drm_i915_private *dev_priv)
> > > +static int i915_driver_register(struct drm_i915_private *dev_priv)
> > >  {
> > >  	struct intel_display *display = &dev_priv->display;
> > >  	struct intel_gt *gt;
> > > -	unsigned int i;
> > > +	unsigned int i, ret;
> > 
> > drm_dev_register() returns int, i915_driver_probe() expects int from
> > from the functions it calls (including this one), and this one is
> > defined as static int, so dropping the unsigned keyword for ret feels
> > more appropriate.
> 
> Right, my bad.  I'll fix it exactly as you suggest if the whole idea standing 
> behind this patch is accepted.
> 
> > >  
> > >  	i915_gem_driver_register(dev_priv);
> > >  	i915_pmu_register(dev_priv);
> > > @@ -634,10 +634,12 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
> > >  	intel_vgpu_register(dev_priv);
> > >  
> > >  	/* Reveal our presence to userspace */
> > > -	if (drm_dev_register(&dev_priv->drm, 0)) {
> > > -		drm_err(&dev_priv->drm,
> > > -			"Failed to register driver for userspace access!\n");
> > > -		return;
> > > +	ret = drm_dev_register(&dev_priv->drm, 0);
> > > +	if (ret) {
> > > +		drm_dev_unregister(&dev_priv->drm);
> > > +		i915_pmu_unregister(dev_priv);
> > > +		i915_gem_driver_unregister(dev_priv);
> > > +		return ret;
> > >  	}
> > >  
> > 
> > I'd keep the "Failed to register driver for userspace access" error
> > message.
> 
> OK, but would you still keep it if you knew that with this error message kept,
> CI would still report dmesg-warn as a result of 
> igt@i915_module_load@reload-with-fault-injection test?
> 

I think the message should still be there as a clue for debugging in
case this bug does happen on a live system (not as a result of an
injected bug). I think the way to resolve this is to use
i915_probe_error(), which prints the message as debug when there is an
injection happening, but prints it as error otherwise. Maybe it's also
worth to add the return value to that message, so something like:

i915_probe_error(dev_priv,
		 "Failed to register driver for userspace access! (%d)\n", ret);

That way we still benefit from debugging information but prevent CI from
complaining about dmesg-warn.

Thanks
Krzysztof

> Thanks,
> Janusz
> 
> 
> > Thanks
> > Krzysztof
> > 
> > >  	i915_debugfs_register(dev_priv);
> > > @@ -660,6 +662,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
> > >  
> > >  	if (i915_switcheroo_register(dev_priv))
> > >  		drm_err(&dev_priv->drm, "Failed to register vga switcheroo!\n");
> > > +
> > > +	return 0;
> > >  }
> > >  
> > >  /**
> > > @@ -834,7 +838,9 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > >  	if (ret)
> > >  		goto out_cleanup_gem;
> > >  
> > > -	i915_driver_register(i915);
> > > +	ret = i915_driver_register(i915);
> > > +	if (ret)
> > > +		goto out_cleanup_pxp;
> > >  
> > >  	enable_rpm_wakeref_asserts(&i915->runtime_pm);
> > >  
> > > @@ -844,6 +850,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > >  
> > >  	return 0;
> > >  
> > > +out_cleanup_pxp:
> > > +	intel_pxp_fini(i915);
> > >  out_cleanup_gem:
> > >  	i915_gem_suspend(i915);
> > >  	i915_gem_driver_remove(i915);
> > 
> 
> 
> 
> 
