Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3716B9A97A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E384810E755;
	Wed, 24 Sep 2025 15:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cz9rFz37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E221410E759;
 Wed, 24 Sep 2025 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758727453; x=1790263453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+g4JKeFCRLOtpOwQP5y99FmL05j2yjxbgym0IWzbrvo=;
 b=cz9rFz375ifEpkjkOxj3LtBOFN3Qa8u/IkmAyZQrH9M+7+yoZpBu+iLm
 MurWPpqlbjtdu2vjSUu+0F4GJoP0v/oNARnnkKgs5a1hdJL098WyyqsaV
 a6SBqAxV0uTR699jyrc3PkbtteUvkPhjMlk2pIqsLYYy1M0oxJ1IH8gYa
 RQu3XxxtyMD4gVq11v7bST5sne3uww9R1y98YODqeuy32yyeB9yiBpj0S
 fukXMNZ0PQSe+fFvz6U4IaEczr1EYY4h9EY+RwyVUhvgBMjpqotKUg4I1
 ZthBPNeOmkGl2bSkwJVV9EFs2Z4mOkGH3svNgGWonOvFPOoSsNa2Ktn/6 A==;
X-CSE-ConnectionGUID: GPvYyQ/CSRap+DBQAGM9/A==
X-CSE-MsgGUID: g1f8o/YIRK+rmbzQWbPLvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="71706754"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="71706754"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:24:07 -0700
X-CSE-ConnectionGUID: PsYz6lpcR/+rmPn7R8DO0g==
X-CSE-MsgGUID: 6cJ4FFJsQVG+jf3y6hKGCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176653270"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:24:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 08:24:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 08:24:06 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 08:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuaSfgUnf9iTbfnF4weA2PdX2ekrPzCE8AKTyGKMgg7VV4h0vm86fwoW8EVUowjN+idizwOLproxtj84z/0akpVzTSAfAdSdohENYHS52Q80kxrx+vPouES+7N5ZBklOftSHMXgjzrtc1xZ/IThL44dLf7xFXzrJ5lMNhM5h2L2/y9oWp80+DeMJapwoPdvvvji4YiffsZf66yIJgsELpmwbHtB0QmJN/TkPjioArzTB7imqPzhw6P6e1zcSt6oq4aSpnSg1DRrw0/Byp/iVwo1CqnvdF66gdmCn8sK9P1webNH9siz+vEY3n0NmbJsBROd2HsoI2qmvbbLupE1Eaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrWxuUg+6sI85fIEESGbjs3OyPkpq5b/DprcvJqGNCE=;
 b=bfnKBDVPL4LSWON/CrKN6SzwGfyYTfJs4Zb84/h4w4+wGkMcjFv0DfUN//9SWl0NOYd8Fm2sXKCeTupBCGiZS9EO543WA2IUDB5N44hLuonqBey008n7W8Mb43cx0Zp+3TQ8/7UPqnDJjQbrL9U5RDxG7MkeZQ08TMU4QERfvMjy75MrbixS3c0yQp2huYt2sEmM/J3Hi/WP2UkqIjU2oYu+P0LZrJtiiVTiWeYZIqHzzjEYHmiiL7XbaBMjpgvAtS8K7I8c4NGwHxKSh2mwzbst0A5ktaYjKcYdCdY6+NcOHZh/THlog4pPZsbbH55NicHwpFUZ3Y0ulbRNMuZorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BN9PR11MB5306.namprd11.prod.outlook.com (2603:10b6:408:137::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 15:23:59 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 15:23:59 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Date: Wed, 24 Sep 2025 18:23:28 +0300
Message-ID: <20250924152332.359768-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250924152332.359768-1-imre.deak@intel.com>
References: <20250924152332.359768-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0030.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BN9PR11MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fcf5435-4478-4477-b3ff-08ddfb7e6265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm0vamZIT0FJSmlQS1BaZmxvbDk5U29IT2g1N3lyTVlCWHNsU1pENFRBdGtU?=
 =?utf-8?B?QW0relB0QzIwSngrWm9pTzlMMGpyNHoxOU4xYlFrYmlIb2wzNWNod0VrRHZR?=
 =?utf-8?B?UVBrSU43bGVCMndpdDNoU01seGRJVGhwazRNZmM4RmVwenlaTjVscWRYYzhr?=
 =?utf-8?B?ZktUWDlYV2tyMFZkcFptRVp1ZG9WVURHR2VRc0FjUXlacXltdlNhWXFEUE1w?=
 =?utf-8?B?aVpHM2x0b1RJSUZjbGZZNHdaNG9BMTh0dkw1K0ViUUV6V3AyaWRBQm1WSVoy?=
 =?utf-8?B?K1JHQ0x1ZEpDc0VsakNuRlBoM0ZlSEs4bGVibHZXZDVPcmJjdEE5UFhycmd0?=
 =?utf-8?B?T1Q2bHVJcGU4OXorTVl4Z1NjdXREc0lHMmdLRWtTakk1VU9nVCt6ZlJUTjJQ?=
 =?utf-8?B?eHd6Y2UyOVpqSjU1NzMzYU9SNGdRQXVLUllsOUhWZXpLSnBTOEdSQ1RoLzlW?=
 =?utf-8?B?WnlBeEFUUTFvNDB4L1BnZERiaStnSkFlbitkMnR4NW9wQ091NktvT3V4UFVZ?=
 =?utf-8?B?T1d0QjI1Q3FqM1YzSGhKeEFXTm9Nb2x4ZHZ2bG5OMEpGdFByVmt3b2E5cWlk?=
 =?utf-8?B?aGQxRVJtVDVsVEtnYmRHU05CRis3YURuank2eWNwWWIwZTROQnFtcnAyMURx?=
 =?utf-8?B?WTViRTZTUmlZc3BqRzNwYU1CZ0cwcG1aeUJhYWd1T0lIU28ycFlKRHRzbXNX?=
 =?utf-8?B?Tm1KUVVoQ0JZRHUvei9sSnZzVDE5RUZRZk50ZERIUllWS2lGZHBlYlY2UU5D?=
 =?utf-8?B?WTc4ZUVhNzJDY2hMNFpmT3o4TnRId3NUeXFLZmZtd2tNMkphemh2bnVJOE1r?=
 =?utf-8?B?QkVsVVAreE5tWDMzZWxPbi9CdDB5MzZkM04rck53QUhuYXc5UGJmMUFUaVB0?=
 =?utf-8?B?NU5QYlBjMmtZczNodjFIclQ5SzRkN3pMNk41d1FRT0pFOGhFQy9PdFJ2NnJD?=
 =?utf-8?B?Q2xqZmVmU1cxSWZGL1pud1Z0UlpSTmRSNGhwUnFLaXdtMHNuUVRnM0huR0tT?=
 =?utf-8?B?RjY4dGtBczNjalVZTGkzOWhpMjRXZi9PcjM0Z3lJcURvZDhUOURtSDRhWk16?=
 =?utf-8?B?UnVhUXg1S0hwMmxEUTJvQ0lHeklaU3VnOVpiazBGdlREdUVWd1lwTmtPcXE3?=
 =?utf-8?B?NnFGV2FEKzlDSnE3ZlNTQlpvTkRKMVhvS2V2aFNDRjRvWFZmeGlBMG9VYjdr?=
 =?utf-8?B?M2hrSlhNcXFDSWlvWUwwbFpTbG9oNVJRV1RMTkc1Z2RjcDVrVUtGc1R0NlVr?=
 =?utf-8?B?bVp4c3ZQbm5ET0RhTlVjbzgzMXkwOGtaME1TVFB3N3paMWc0L3lIeW1QY1o4?=
 =?utf-8?B?UzRTWGhnWCtObld1L0xBNUdsYXZRWS9OcU9uOGdvZUtrQVdRTlRuU0NDUEUx?=
 =?utf-8?B?eU1NTE94M05jUk00R3VWaEs4YXU0YmovQUFjUkxhdGVCcUdoQmx1V0xCT25Z?=
 =?utf-8?B?ZXJOUEZ4amdSREhNRVJwTEgzeWJsNTFrOEYzS0NPbHh2ZTNHS1lYUXZvOGl3?=
 =?utf-8?B?dW9kWmk2VHdHQU1CdlBTS25EZDZZcC9yRGx1SHNxWXo5SkE5c0RRUHIxNUFk?=
 =?utf-8?B?U2t1OFZRc0tVWHVROUV6dklvMHFHZVVsRWllbEV0MWM3am02WjRBbTFtT2c4?=
 =?utf-8?B?RHk4ZU5RUk1ITkwzSmkwN1I0a2s2eFQya0YyeGROZlIyUFVUTTBRK2luanB6?=
 =?utf-8?B?UVVWcFF0NDkrUDdMYncwK3dmck9IZEtoSVR5Q2pRdmZvby9ORXYvMzczZG5n?=
 =?utf-8?B?aTEvTEFycVpPSW0wUXdCUUwrSllLRTh5M0l4aE14OGRCVDZZNFp6dS9uQzFy?=
 =?utf-8?B?aXF6NHBtM0t4bnVLa2ZNeWJkRXpBVVB3Uno0cWZnQUpFd3ZOcGovZ0RDRjlq?=
 =?utf-8?B?b1F0QUtUZVV1VVhUdHN6bWZhU1BoeGpDZDU5c1puejRtN3ZjVWl3aU9vU0dB?=
 =?utf-8?Q?vqagadDJZ48=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K09tMyswVWR2MlBqSkRINGFWY0pQSnl4VlBTZit0TENsZVZIZGZuM2ZCVmds?=
 =?utf-8?B?c0J3dUZqS0Z0Y25DQXRmU3hkMFJWUERXNHFpUzFsc2k1L0RDamFlWVdXMkFp?=
 =?utf-8?B?UDUxbVVEVG8vV1ptdDFFek5tMG9vMk5yZ21aVHFrZ0NxM1RWanJYSDcrT213?=
 =?utf-8?B?UXZIV0dUT3YzamJxd3RVam1OMUcvVEVIeU1uWUxXNSs0QU1QWHR5OCs3WVEv?=
 =?utf-8?B?dUFIeWZYdFRCRUs1R005Mkh6M3lJTnp4YXFHRkd2TFA1Ni82bjd4ek01UEtu?=
 =?utf-8?B?VVJMK2wvdXQ1STRBN3R2SVdOaGtITzBpN2ttN0dJUHFuQWpEQkNWajVsOVUv?=
 =?utf-8?B?bzIrZFBBdE94R3JkM3pUd1A4TUppWlRVUkZCOVBXMXpiRE5rQm9sU1ZJOGQv?=
 =?utf-8?B?aXJJcXdZbkVYZGRxbW1kNCtGU0Fsb09TVTJMcjNsL20xeVkzOHA5OURZU0dz?=
 =?utf-8?B?REFIRXFGWVJjMGoydUpQMnFzakNzNE1zTVdqaTllNE42Z2VHNk1Na3lUeHlK?=
 =?utf-8?B?VXYxK2tpVGoreHpRbmgvc2hJMVZuM2Y2ZnMyR3pOSWFicGoweUhIcVlWWHly?=
 =?utf-8?B?dmd1WjZIdjJ5WGtHWmRIeExsY2hMTzlEdytWeWc2bHE3VTlqckQyNEtxZ3Mz?=
 =?utf-8?B?M242QXYxMkkxZXVmRW5UY0dwRDZRbTB5eGx4TjdoaXAxemtGWkMyNDB2QzJq?=
 =?utf-8?B?N1hVcU9aNUR0RitqaDdsQ1VhWlYyVE9DaFRkdTRnSzFZamFsOTQ0NS9OQXI5?=
 =?utf-8?B?RS9IY2hvcm0zUzhWR2V4OE9YMkJocHJSdDdicjVKYzhCLy9HNnUvT1pKNkxt?=
 =?utf-8?B?QTRrQnJJYi9DcVc0NmtaQkxCbmhzd3FqVGVxbG9qVkMzd000V1hlWmR2R3N3?=
 =?utf-8?B?TllzM0l5V0YyTlViSWtSK01jM214aUlrSVdkSnlCR2dUb0lpWUN0bUZVdlRZ?=
 =?utf-8?B?WnhkTk15eUpyUldieVUyUllCUnFBeVNENjJSU29YQW5VUmNIcEJMM2NUMW1W?=
 =?utf-8?B?dnZ2WWhkZmdYQkhQZXNGMWZpYmpjdGdVTzhEUjNYeWszSHhyRUN1NU1Da2xy?=
 =?utf-8?B?SGdrc2NKdUFuOTgvY1QxTHhvdWZoVXpnWVZVWDNiWi8yKzhsUDJ3Mkt5V1VX?=
 =?utf-8?B?Ymk1TWVoVFFtbGUwd2lHNWNxb2twaCtIamhsdDJLajBUTGZUQ1JOMmpXYXpQ?=
 =?utf-8?B?WHZEdTZyOUFMelk2SjNrSm11Q0NzdnlGanVLQVZSSFFkdmc3UGE5WERZV1Z1?=
 =?utf-8?B?dVFhSERhTzNYZnpFZFpiaFpjY3JESTZQdFB4U3ZTZTRGVWVHc2tlZEU2VHEw?=
 =?utf-8?B?K2dqSWM0S1c2VEVhNW4zdWZIdFRiNGtzV0oxM0MyZ3d2RDlhOGVqcWZrWWk1?=
 =?utf-8?B?T3hBZm5WSjlDa3gzMHlHQlpDNVp1aWVXcklqVmFDRk83RjQ3bHRoUXJUcmhz?=
 =?utf-8?B?TzVlRURvT2hSa1lDWlkvT04rT1ZvQy9MdHZXd2pDNWNVUHY0VTJmOVBLS0V5?=
 =?utf-8?B?M2VKeGhSVDdYc1VEK0lzOEQ1MFNRd1BSNHRGdmdJbzRLSXdsRklhd2JqVU55?=
 =?utf-8?B?N1RSRW40V29iSHMxdFFwcG56S2ZnNldPdGtoeDM2eVM2bjBRc2FuWTBwNzNV?=
 =?utf-8?B?NVE0eW1IR3FGOEdqcWZ2cS9zeVpOZUJEMTZnODBnUDVGV0hmbG5kZU1MK2FE?=
 =?utf-8?B?bFBIcDB0YjUzRVl4L3owaW1Yb2EyQW8zdEdYbmZrVDYzd2hQOEU4dXgxaXRB?=
 =?utf-8?B?MEdIdVVjUU56cm9NeGxTeUxkZjBlOERpbzBOK1o5NDNHMy9ZcmRjSjB5V01B?=
 =?utf-8?B?VEd3c3VKZUZvNkJabURrb3NOVjQ0UzB0dm40bUxZRzZieXI5VFJGMldzdmg4?=
 =?utf-8?B?bFJSb29nN2NLbHhPanRlVDhxdXBMUEoxQmJxOFZOdUduY1pSMlhXelVWMHRz?=
 =?utf-8?B?aTZWbEdtZVphaTBURVJMMys5YlRsTjF2dnRkZjJ5bnQrQzdXTnRSaFhVUXVo?=
 =?utf-8?B?NEMxYjNZNjZWUzBINWtWNCtIOXpBallXbnNPQklHTy93eWQrd2tvendZNFR2?=
 =?utf-8?B?L1NwaThTZVJIeFpuRG82c095bHZQRWdnODBid0Z2ZE5XZjdoQmZqeXlWWlkx?=
 =?utf-8?B?QUVLOUl5VTljbzZ0akd6R2lPTW4ydGcxcjNyenFTS1hYRmhnZXM1aW5wT3Bi?=
 =?utf-8?Q?Kd6xDSY+vlyN2z4Hww9aj6xfzDddgCEcKkMsi50PhRKZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcf5435-4478-4477-b3ff-08ddfb7e6265
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:23:59.4293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJe5Q0y8gKBBPtGPfNL6ngUwdOs20TM/jhZGJenNK0p2zQrBuGeHORsDZk3idysa9VYCf4c+wFgoDpoPeXIGsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5306
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

Add helpers to query the DP branch device's per-slice throughput as well
as overall throughput and line-width capabilities.

Cc: dri-devel@lists.freedesktop.org
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 133 ++++++++++++++++++++++++
 include/drm/display/drm_dp.h            |   1 +
 include/drm/display/drm_dp_helper.h     |   5 +
 3 files changed, 139 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1c74fe9459ad9..9d9928daaab59 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2844,6 +2844,139 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
 
+/*
+ * See DP Standard v2.1a 2.8.4 Minimum Slices/Display, Table 2-159 and
+ * Appendix L.1 Derivation of Slice Count Requirements.
+ */
+static int dsc_branch_min_slice_throughput(int pixel_clock)
+{
+	if (pixel_clock >= 4800000)
+		return 600000;
+	else if (pixel_clock >= 2700000)
+		return 400000;
+	else
+		return 340000;
+}
+
+/**
+ * drm_dp_dsc_branch_max_slice_throughput() - Branch device's max DSC pixel throughput per slice
+ * @dsc_dpcd: DSC capabilities from DPCD
+ * @pixel_clock: Pixel clock of mode in kHz
+ * @is_rgb_yuv444: The mode is either RGB or YUV444
+ *
+ * Return the branch device's maximum per slice DSC pixel throughput, based on
+ * the device's DPCD DSC capabilities, @pixel_clock and whether the output
+ * format @is_rgb_yuv444 or yuv422/yuv420.
+ *
+ * Returns:
+ * The maximum DSC pixel throughput per slice supported by the branch device
+ * in kPixels/sec.
+ */
+int drm_dp_dsc_branch_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+					   int pixel_clock, bool is_rgb_yuv444)
+{
+	int throughput;
+
+	throughput = dsc_dpcd[DP_DSC_PEAK_THROUGHPUT - DP_DSC_SUPPORT];
+
+	if (is_rgb_yuv444)
+		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_0_MASK) >>
+			     DP_DSC_THROUGHPUT_MODE_0_SHIFT;
+	else
+		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_1_MASK) >>
+			     DP_DSC_THROUGHPUT_MODE_1_SHIFT;
+
+	switch (throughput) {
+	case 0:
+		return dsc_branch_min_slice_throughput(pixel_clock);
+	case 1:
+		return 340000;
+	case 2 ... 14:
+		return 400000 + 50000 * (throughput - 2);
+	case 15:
+		return 170000;
+	default:
+		WARN(1, "Missing case %d\n", throughput);
+		return 340000;
+	}
+}
+EXPORT_SYMBOL(drm_dp_dsc_branch_max_slice_throughput);
+
+static u8 dsc_branch_dpcd_cap(const u8 dpcd[DP_DSC_BRANCH_CAP_SIZE], int reg)
+{
+	return dpcd[reg - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
+}
+
+/**
+ * drm_dp_dsc_branch_max_overall_throughput() - Branch device's max overall DSC pixel throughput
+ * @dsc_branch_dpcd: DSC branch capabilities from DPCD
+ * @is_rgb_yuv444: The mode is either RGB or YUV444
+ *
+ * Return the branch device's maximum overall DSC pixel throughput, based on
+ * the device's DPCD DSC branch capabilities, and whether the output
+ * format @is_rgb_yuv444 or yuv422/yuv420.
+ *
+ * Returns:
+ * - 0:   The maximum overall throughput capability is not indicated by
+ *        the device separately and it must be determined from the per-slice
+ *        max throughput (see @drm_dp_dsc_branch_slice_max_throughput())
+ *        and the maximum slice count supported by the device.
+ * - > 0: The maximum overall DSC pixel throughput supported by the branch
+ *        device in kPixels/sec.
+ */
+int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
+					     bool is_rgb_yuv444)
+{
+	int throughput;
+
+	if (is_rgb_yuv444)
+		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
+						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_0);
+	else
+		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
+						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_1);
+
+	switch (throughput) {
+	case 0:
+		return 0;
+	case 1:
+		return 680000;
+	default:
+		return 600000 + 50000 * throughput;
+	}
+}
+EXPORT_SYMBOL(drm_dp_dsc_branch_max_overall_throughput);
+
+/**
+ * drm_dp_dsc_branch_max_line_width() - Branch device's max DSC line width
+ * @dsc_branch_dpcd: DSC branch capabilities from DPCD
+ *
+ * Return the branch device's maximum overall DSC line width, based on
+ * the device's @dsc_branch_dpcd capabilities.
+ *
+ * Returns:
+ * - 0:        The maximum line width is not indicated by the device
+ *             separately and it must be determined from the maximum
+ *             slice count and slice-width supported by the device.
+ * - %-EINVAL: The device indicates an invalid maximum line width
+ *             (< 2560 pixels).
+ * - >= 2560:  The maximum line width in pixels.
+ */
+int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE])
+{
+	int line_width = dsc_branch_dpcd_cap(dsc_branch_dpcd, DP_DSC_BRANCH_MAX_LINE_WIDTH);
+
+	switch (line_width) {
+	case 0:
+		return 0;
+	case 1 ... 7:
+		return -EINVAL;
+	default:
+		return line_width * 320;
+	}
+}
+EXPORT_SYMBOL(drm_dp_dsc_branch_max_line_width);
+
 static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
 				  const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
 				  u8 *buf, int buf_size)
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index cf318e3ddb5c5..43978ddd15056 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1686,6 +1686,7 @@ enum drm_dp_phy {
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
 #define DP_RECEIVER_CAP_SIZE		0xf
 #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
+#define DP_DSC_BRANCH_CAP_SIZE		3
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
 #define EDP_DISPLAY_CTL_CAP_SIZE	5
 #define DP_LTTPR_COMMON_CAP_SIZE	8
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e438c44409952..cb0cd13d632d2 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -211,6 +211,11 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SIZE],
 					 u8 dsc_bpc[3]);
+int drm_dp_dsc_branch_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+					   int mode_clock, bool is_rgb_yuv444);
+int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
+					     bool is_rgb_yuv444);
+int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE]);
 
 static inline bool
 drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
-- 
2.49.1

