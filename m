Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B6ADF8FC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 23:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027C310E964;
	Wed, 18 Jun 2025 21:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQvASPe9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E0010E964;
 Wed, 18 Jun 2025 21:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750283804; x=1781819804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6iabzk9W+RLjriwyW2dNlTYYwOYA17NbDA7sypuxAvs=;
 b=gQvASPe9Os8r9OJQUa4BUSUSUE8mUu9B49zii3lPTnBd2Iz+pCp056Zr
 RCFjrsodWVdrni7zP8LbRmDzBHOpLfBAni69vzNq/lLehgVqfBzAvYMH1
 V4riK1yUTD84Fe6HHXiWbPV5marAeJEfk/w/AUyvB4R90unMv3cHTqP5P
 IbnW/O7rgVrBpjEJkAW0sYKTcnN47nAIfZyja+1VcsktmwdhRiy2FaKov
 LclUvkh0XxhVyFmvt7N5JxYDfWZf+ws6gRSa3IFbxznx4kFxhSKg+klxF
 dDPfycBJNlAgp8nm+A0/JyzWQ9pwoggvGeEkOvU/j+YKjQPB1bQXr5SC2 A==;
X-CSE-ConnectionGUID: Um7IVWBaQyWpUZU5CxAYyA==
X-CSE-MsgGUID: D8JLXTD/QK2X9uuguH102w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52394191"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52394191"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 14:56:44 -0700
X-CSE-ConnectionGUID: kwmwjfkjR6OrGcffvcMVEw==
X-CSE-MsgGUID: SoZgLI50RH6z43uHStKlZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="154971543"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 14:56:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 14:56:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 14:56:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 14:56:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xg2bbTYofMuX+CTzRV2SH1gQqxWxGZG3yOKIjnIhhBFyx9k9nyYlJuIDiTZ3D6KG6eSNcwA7t1nrYOyiEaFhTENH/RELdQ5dwvYg4mXrON54gq3tq1g1VdOR7oTK9yUftVSJbO92APuGsfdXs5/i9JYSvmiwlIwcTlSpI4X/HV/hVao7AQHowkiQzhZHD3L6Sz/6MIJ1BUOYZX+FxpyD37VDh8HQ/hd7RLSQXgmaqlqRkaLJmPye0a40weymyEZddLbhomdGimlECJCrc2ENB2NLchp/qKW2BxUX4Jg32rAHQZELShZwrzUgGN5znmvsH9Sy70xFyKPnR9h07z32Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Inh1JbjyW5piHIU5peODvlsd11fM1xR7wv8l6m9oyWY=;
 b=CxhRaa7r1mEBm5cggK7O71MLeXuXcaRbcwdkPn5KXhmJQgx4qhodwclnJAimJqVKu9NnxMtIqKPaCvk5Yay7PiMAtIwyd8eM6+LytOTqRaLa9TTPhbK+/WaEBY1nSjoNfA7SLcJJKk58b298/IwI5ShWwIvVhpWMjXTxjccrBGW0a0tL56tW8gz7Uldr+PIXoF4u+vBoLkH56MVTZlz4KlWZCEepGUW0Wkx5YFlZe1/xITBOkPDzg3i4gfcn87CvY3gRDk63Vpe68vw1fV7Osc1IzEeARVDpEGvC7SaIttCx/sEJ2vjm/pFb9IwFn8VmXS3eh8VvtGzvpzOCNdtwYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB7064.namprd11.prod.outlook.com (2603:10b6:806:2b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 21:56:41 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 21:56:41 +0000
Message-ID: <994ba1b4-281a-46bd-9431-7bdef5970ed3@intel.com>
Date: Wed, 18 Jun 2025 14:56:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print
 version info
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-10-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250618190007.2932322-10-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: bf247c93-72a4-4819-7a2d-08ddaeb3022a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGIwcEsxK2xjOEZjTW5pRTlGMkkveUtUT1d3SEZSVnBybG55RHBHUnlUNGp2?=
 =?utf-8?B?bHRoUUZBYnJWVWMvN3Fadlk5NW1ZZTlTRlI3b0swK2JCaUlWYzlrSytzdW1P?=
 =?utf-8?B?aW9RTjNtYXdJNHhkMTRmbkFlMU1zSG5GSlFkR3QrTXhveVYzdWltdURTUERG?=
 =?utf-8?B?QVFMNmtIRXplTUVORmlMOG1kRXpLMFBuTURtaDRFTnJ4MUZjZ2k4dGRxQmF1?=
 =?utf-8?B?cGVzMWtjYXp6eTNFRldhRCtJblRabWw1Z3Ird1Fmc0FocnZ0UDRBRDhzTU5W?=
 =?utf-8?B?UlVtYzhTL3JXVUpOek1WdFNUZDZqdm1xK0hKZXduMjYxb2ZPU25rTlp0ekpU?=
 =?utf-8?B?L1duMlJ0bUR2SU9wcmdYRkhBMWVqdTE3L24vK1krNytVVm41VWJ0M2hpQVpl?=
 =?utf-8?B?SkRZOERVZFRUdlN5N0tzVit6M1VoeHpEYzZvbElzbjI5OVZ3RDgrK3UzaTJk?=
 =?utf-8?B?S3lBaUJwY3ZEd3JVTmJUWkxyc3YwSUNxcHdsTjlSNDAzRlBibzhVRXRTazJC?=
 =?utf-8?B?S2gzVXRSRnVvMytpdHdUTzhGcGNvMXpXT3lnNktvMkJsYlhFbVBOYlYyWWtz?=
 =?utf-8?B?dlEyRjZhVmxDSW5NUU1RU3B4d0NUTGdtb2dEczJtWWhsWldrbTBPcFc0c0w0?=
 =?utf-8?B?aktPUU9jTkpGTGZOYXJnK1RPTS9lb2l5K0ZzWjM5NkFOSTZmQlVyWkxsQ1lh?=
 =?utf-8?B?ZVZ3NWVBSUxuYUtZbFpja0ROSDZVUWM1cjZyWjBRZjE1K2VXOUxuRG4wUXlo?=
 =?utf-8?B?VnVIMWF0ZTRyMVNPU0pWdDZucnVhWTNtZ1lwV2EzWEdaYnU3Z1ZDbUoyaUpO?=
 =?utf-8?B?Mk9nUHhTeDlKSEtiSnRtNThMbEljRkVSMWsrOHY0bEhlZENNSFVqYkw2MEpW?=
 =?utf-8?B?ejMyMHpqWUVZb0RaS3Q1dEdIYThqUE5tTTY3SmlXR1hXbjA3a0FmTnBFNDVK?=
 =?utf-8?B?T0hYZ0xlV1psV2RESDJsa3JKZmc5c1hQcEJDcEZKdUFWQ2VuUThxeUprMkxY?=
 =?utf-8?B?cFRpVUVUdlpnY3ZmVlhSVUY0aWhPQWN4dm12b1F0b2JUL1RtTE8zNC9nRWRx?=
 =?utf-8?B?dk5Fc0ErR2xMNmV1RHpFbVorVFFReVB5M1FpYkNoTmNFT0JlWEg4K3V2ZUda?=
 =?utf-8?B?V1k2ZldFdWFDZ01LbERPTW0zQ1NXeWIwY3c1aGlJZmE4QWhPRlg4dU9IS1lh?=
 =?utf-8?B?RFlYd1gzUk1zZUExeGNrbDlrV2wzVVpIUmNWSUt2MWY1RExocjhYeWE0OVhw?=
 =?utf-8?B?UFlSVXBoUE9idjE4VU4za1lQM24zSG5SZVd5ZTlVbW1HS3JmMC9NM2hUVGgx?=
 =?utf-8?B?cWZnemR5Yjl2bUpvcm9xOS9PVFVuRSt6akU2MGVleWt5RGFXNi9rUXpNZWtO?=
 =?utf-8?B?M2MyUDM3QkhybktwZUdoc1NLZVZoUE9ubzA0YmNCN1luSnlOQitSTms3OGpL?=
 =?utf-8?B?aG5uc0lrc1gySVRYOHk3OHppa1k1UzNLQmNhR0YrdTkrRmluK0h2M3BJN1g0?=
 =?utf-8?B?MWtTYXh4SXE5Z3d4V0ZiYlF1K2JCdDhoendaamhGTkUvQXhxQWRScSt0Vmta?=
 =?utf-8?B?aXNWNmIvZi9sZzJ5a1g4b05ieVlYMkQraWIxRlVpdVFNZjZucXZvaTVZYlND?=
 =?utf-8?B?M3N4dDFvVDQ0Y0s2VjlXcEp5UEliL0JCRVdEVHFZZmxVYmgxWm1xVUY5L1VY?=
 =?utf-8?B?NDlYMml2dGREVG1mZ3FIV1F1L0J3WXM4eVVnbDAyUFZITkFTOTJ0TDlEVzJi?=
 =?utf-8?B?QWFqNVd2dU9MR0NPWCt4Z0dTSDFtcU92N3FQSHlNS0wrWEk3UCtDdzVoS1BC?=
 =?utf-8?B?QWk2Z0RPQjltd1B0U003ZkN0YzFOV0E0bjB3ekp5MnE4RVprb1U1TVFwNytU?=
 =?utf-8?B?eDdFZGZCRWRGSnlIc0hiV0w3Uyt3TUxXVy9UR1Q4U2ttMXdEbi92Sllua2h5?=
 =?utf-8?Q?8P8Ktz6F6EU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGMvUURSVnJBbnE2RjdXWXJ2UVlHOEE2YXVQQXRidFI3WWY5Ry9YaWNFQklY?=
 =?utf-8?B?ZEc3SkJncU1EUUhFZEJCM1oyeDVFYkdIN3JxYUpCZStMZEc5OUtzVEF0V2o1?=
 =?utf-8?B?Q2VoZGpNQlhIVTBZRUZnUFE3clZzZUVZZ3pxZzAwamdleDZ3TEZxYmpsa2lU?=
 =?utf-8?B?YTZpQnZkVXBqNDFkNExNTld6Qmt0aDZ1Uzc5Q1dWd2o4U0t2TlFydWtUOVAy?=
 =?utf-8?B?anROcXlXcTdxNDJ3RkUraU10REZlRW1jSDE4UXUwVUxpeFBjcXhHcWJpRTcr?=
 =?utf-8?B?emtlS3VQVEVNUDdVUUNtWVVEZHkvemxFNzJmdnlyam45dHY5UEpFYng1cnhp?=
 =?utf-8?B?TXc5eHhsVGRYVTZiaWpNWmk5SzU0TUhHUXdzUGpWUkpoSDF2cmtBM1FBdFYy?=
 =?utf-8?B?OHdHNGlhKzAwY3pyZTBUY1doZTJrSGxaR25VaERDcExZSDBjRHMyRGtTQWRT?=
 =?utf-8?B?emY1OHFHV0l6azlaWWxGR1A1S3A3NTh3U2J3bWhub3htZzRaY0FZR29TVlI3?=
 =?utf-8?B?SUJ3Uy90MmRKd2kwM0lIdEo1UDQzbGdoZDFNeWl0TjVwSXF5Z2w3bm1aTXg4?=
 =?utf-8?B?dWNheDRCZXVSUG1QZy84ZTdEMHdaK3kvaFlYMFJubGxtWUdVYlUxNFczaGdi?=
 =?utf-8?B?YzlYNFB2M1pQUXNpZXcrVTNqMllDR1FGb0FOOXAyZEdkVzNBZkxaZUFVV0px?=
 =?utf-8?B?OWxzeFZGT1lCT0RpYUMxTi9DWVRrM0RmVEc5cjhrbEpGc2xFc2NrUWcrMkpt?=
 =?utf-8?B?SjhzOVRhQVQ4b0s4TlAzRjlEdEQyaWVObEp0UFprSm9IUHBTS3FXaE5GdlJS?=
 =?utf-8?B?RkFpdEM5TTJNbk5ka1lsYzRnOGJQdy9XbFBqU05BTXRtYmNMMjNTQTRxRDk3?=
 =?utf-8?B?UDNGN0dTNkQxY1ZTZW9vVTRaQWFVcVQ2Q0IxMXd1ejZxdVJUMlkrN2dPbmJQ?=
 =?utf-8?B?aldYTTAxaXJXb0lJOThqRTRzSkhNejc4UHF0ZWxWZ3QwZjhWR25oc2JnR1p6?=
 =?utf-8?B?bVV1UUpZdW9yY0NicXp4QUZDMTVmYjAwbWgwZG1mZmNMOFIyekc1bm9lYVd5?=
 =?utf-8?B?NVkvZkI2L0VsSk5sZ0FuR05SRERqd2s0anpHN2UxOGorRjR6QVJWbmpuZEwr?=
 =?utf-8?B?M0dkeXpab1RUZ1JUQUtocXd5cHFYaEgzNkdBK0hFTzMreGlWRE1SVjFjMk9n?=
 =?utf-8?B?ZGxCeENxM2lRb1IyOURjU0NtWDljdVRiV2ZsVERKWkMxRFlPc2dCVkJJMEgv?=
 =?utf-8?B?MTZldCtyS1JLWHNhNHFqems4YUVraERVem1iUG5pRFQrMzBZWmlGNFI5VVFp?=
 =?utf-8?B?L3lqQkVCaHB5WksrcTR3TkVRQXhmd1RBYzJrZW9aYVBtdkNMNXhyOUlOS25a?=
 =?utf-8?B?QmFkMFhEVUwyVlJhcy9kUzZOTzByV1pSQUlsRXJzV3VQamhZdUJTUkEyaVNF?=
 =?utf-8?B?bGI1T2kyZWhXQkdNNjMrMnFTeUZ6aXF1RHY1NDZvRFFmU2c0SjlxTklVdUZ2?=
 =?utf-8?B?ZXdzNSt1YTZ3aEpNaUNkWUUrSEc2eUNieTZoRVZ5aXlaajdrSVhpOGptWTBy?=
 =?utf-8?B?VmQ2enVsMlBGa05kanl0L0xheEltNjNmVnNOUGFsR3VPQjJsQlhyY1IxTWVv?=
 =?utf-8?B?alBCMWNTUHROSmNQMU1ReDU5dHU5Slp6RXcvdDI4VVFBQm9acHV6N0d6Sys2?=
 =?utf-8?B?YVdEclcrR0F6ZjlPOHZ4RmUrbVdQT2xOK2xNTFlLTDFyZXFqV1pVemhJV3B2?=
 =?utf-8?B?MDdLY1ZaNURBL1BZQ3poa1dhU2hIZFJSSGNlRzhYSjJoVzRPWVRxM3diN0Zx?=
 =?utf-8?B?elFwNGdrMTJwM3FSWVdybWorRWViRDdLR3JrbktSWDE5ajB1U3l6UDBkb0xR?=
 =?utf-8?B?NDJUSDYyamhwVkI5bWR5cWtJOUV1cGFHZjg2T3FodklyVUphd1YybjM0OURZ?=
 =?utf-8?B?dExuVzhpQ25Od2FpaFFUZE1XWW9PT1VBWi9QOVE5SXowNm4yQjRLZGc3Szgr?=
 =?utf-8?B?T3NoUms1bWx5V3RPYm1rY1UxVlpYQUJydk1HS29xU2lDWkdmNTJ2Vko4MU9B?=
 =?utf-8?B?WjJBeXVnL0dOcXFTMXZPdGo5VDZLWUFrdnVLT3NMN2J3K3hsVnB6aDhxMWFV?=
 =?utf-8?B?SWlpcTNUdmd5NjczRlAyOThsMXczaWk3cVlBWkN6TDhuekdzVGk3RmRvWW1M?=
 =?utf-8?Q?dstRtKc1689ecEc7wCjT+e4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf247c93-72a4-4819-7a2d-08ddaeb3022a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 21:56:41.6217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATGVnp7KJBMDfwhso3/GPaQpFs7pxZUdWz4OOYhyTU679oiEnvCWXiMk90bSkGwrcR6lQ23u+zHI+bgu4EXSEUnZqsZ6pIWaRVAJvxz6ux0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7064
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



On 6/18/2025 12:00 PM, Badal Nilawar wrote:
> Extract and print version info of the late binding binary.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 132 ++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   3 +
>   drivers/gpu/drm/xe/xe_uc_fw_abi.h          |  69 +++++++++++
>   3 files changed, 203 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 001e526e569a..f71d5825ac5b 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -45,6 +45,129 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>   	return container_of(late_bind, struct xe_device, late_bind);
>   }
>   
> +/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
> +static int parse_cpd_header(struct xe_late_bind *late_bind, u32 fw_id,
> +			    const void *data, size_t size, const char *manifest_entry)

We'll need to try and make this common between the uc_fw code and this 
code to reduce duplication, but we can do that as a follow up.

> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	const struct gsc_cpd_header_v2 *header = data;
> +	const struct gsc_manifest_header *manifest;
> +	const struct gsc_cpd_entry *entry;
> +	size_t min_size = sizeof(*header);
> +	struct xe_late_bind_fw *lb_fw;
> +	u32 offset;
> +	int i;
> +
> +	if (fw_id >= MAX_FW_ID)
> +		return -EINVAL;
> +	lb_fw = &late_bind->late_bind_fw[fw_id];
> +
> +	/* manifest_entry is mandatory */
> +	xe_assert(xe, manifest_entry);
> +
> +	if (size < min_size || header->header_marker != GSC_CPD_HEADER_MARKER)
> +		return -ENOENT;
> +
> +	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
> +		drm_err(&xe->drm, "%s late binding fw: Invalid CPD header length %u!\n",
> +			fw_id_to_name[lb_fw->id], header->header_length);
> +		return -EINVAL;
> +	}
> +
> +	min_size = header->header_length + sizeof(struct gsc_cpd_entry) * header->num_of_entries;
> +	if (size < min_size) {
> +		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
> +			fw_id_to_name[lb_fw->id], size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	/* Look for the manifest first */
> +	entry = (void *)header + header->header_length;
> +	for (i = 0; i < header->num_of_entries; i++, entry++)
> +		if (strcmp(entry->name, manifest_entry) == 0)
> +			offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
> +
> +	if (!offset) {
> +		drm_err(&xe->drm, "%s late binding fw: Failed to find manifest_entry\n",
> +			fw_id_to_name[lb_fw->id]);
> +		return -ENODATA;
> +	}
> +
> +	min_size = offset + sizeof(struct gsc_manifest_header);
> +	if (size < min_size) {
> +		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
> +			fw_id_to_name[lb_fw->id], size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	manifest = data + offset;
> +
> +	lb_fw->version.major = manifest->fw_version.major;
> +	lb_fw->version.minor = manifest->fw_version.minor;
> +	lb_fw->version.hotfix = manifest->fw_version.hotfix;
> +	lb_fw->version.build = manifest->fw_version.build;

not: here you can just do:

     lb_fw->version = manifest->fw_version;

since both variables are of type struct gsc_version.

> +
> +	return 0;
> +}
> +
> +/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
> +static int parse_lb_layout(struct xe_late_bind *late_bind, u32 fw_id,

IMO it'd be cleaner to just pass xe and xe_late_bind_fw, instead of 
xe_late_bind and fw_id.
You should also be able to do a lb_fw_to_xe() call if you want with 
something like:

container_of(lb_fw, struct xe_device, late_bind.late_bind_fw[lb_fw->id])

> +			   const void *data, size_t size, const char *fpt_entry)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	const struct csc_fpt_header *header = data;
> +	const struct csc_fpt_entry *entry;
> +	size_t min_size = sizeof(*header);
> +	struct xe_late_bind_fw *lb_fw;
> +	u32 offset;
> +	int i;
> +
> +	if (fw_id >= MAX_FW_ID)
> +		return -EINVAL;
> +
> +	lb_fw = &late_bind->late_bind_fw[fw_id];
> +
> +	/* fpt_entry is mandatory */
> +	xe_assert(xe, fpt_entry);
> +
> +	if (size < min_size || header->header_marker != CSC_FPT_HEADER_MARKER)
> +		return -ENOENT;
> +
> +	if (header->header_length < sizeof(struct csc_fpt_header)) {
> +		drm_err(&xe->drm, "%s late binding fw: Invalid FPT header length %u!\n",
> +			fw_id_to_name[lb_fw->id], header->header_length);
> +		return -EINVAL;
> +	}
> +
> +	min_size = header->header_length + sizeof(struct csc_fpt_entry) * header->num_of_entries;
> +	if (size < min_size) {
> +		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
> +			fw_id_to_name[lb_fw->id], size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	/* Look for the manifest first */

Here you're looking for the cpd header, not the manifest.

> +	entry = (void *)header + header->header_length;
> +	for (i = 0; i < header->num_of_entries; i++, entry++)
> +		if (strcmp(entry->name, fpt_entry) == 0)
> +			offset = entry->offset;
> +
> +	if (!offset) {
> +		drm_err(&xe->drm, "%s late binding fw: Failed to find fpt_entry\n",
> +			fw_id_to_name[lb_fw->id]);
> +		return -ENODATA;
> +	}
> +
> +	min_size = offset + sizeof(struct gsc_cpd_header_v2);
> +	if (size < min_size) {
> +		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
> +			fw_id_to_name[lb_fw->id], size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	return parse_cpd_header(late_bind, fw_id, data + offset, size - offset, "LTES.man");
> +}
> +
>   static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>   {
>   	struct xe_device *xe = late_bind_to_xe(late_bind);
> @@ -185,8 +308,15 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   		return -ENODATA;
>   	}
>   
> -	lb_fw->payload_size = fw->size;
> +	ret = parse_lb_layout(late_bind, fw_id, fw->data, fw->size, "LTES");
> +	if (ret)
> +		return ret;
> +
> +	drm_info(&xe->drm, "Using %s firmware from %s version %d.%d.%d\n",
> +		 fw_id_to_name[lb_fw->id], lb_fw->blob_path,
> +		 lb_fw->version.major, lb_fw->version.minor, lb_fw->version.hotfix);

You need to log the build number as well, as that needs to be relevant 
for this type of headers (we do log it for GSC for example).

>   
> +	lb_fw->payload_size = fw->size;
>   	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>   	release_firmware(fw);
>   	INIT_WORK(&lb_fw->work, late_bind_work);
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index f79f0c0b2c4a..3fc4f350c81f 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -10,6 +10,7 @@
>   #include <linux/mutex.h>
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
> +#include "xe_uc_fw_abi.h"
>   
>   #define MAX_PAYLOAD_SIZE (1024 * 4)
>   
> @@ -41,6 +42,8 @@ struct xe_late_bind_fw {
>   	size_t payload_size;
>   	/** @late_bind_fw.work: worker to upload latebind blob */
>   	struct work_struct work;
> +	/** @late_bind_fw.version: late binding blob manifest version */
> +	struct gsc_version version;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> index 87ade41209d0..13da2ca96817 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> @@ -318,4 +318,73 @@ struct gsc_manifest_header {
>   	u32 exponent_size; /* in dwords */
>   } __packed;
>   
> +/**
> + * DOC: Late binding Firmware Layout
> + *
> + * The Late binding binary starts with FPT header, which contains locations
> + * of various partitions of the binary. Here we're interested in finding out
> + * manifest version. To the manifest version, we need to locate CPD header
> + * one of the entry in CPD header points to manifest header. Manifest header
> + * contains the version.
> + *
> + *      +================================================+
> + *      |  FPT Header                                    |
> + *      +================================================+
> + *      |  FPT entries[]                                 |
> + *      |      entry1                                    |
> + *      |      ...                                       |
> + *      |      entryX                                    |
> + *      |          "LTES"                                |
> + *      |          ...                                   |
> + *      |          offset  >-----------------------------|------o
> + *      +================================================+      |
> + *                                                              |
> + *      +================================================+      |
> + *      |  CPD Header                                    |<-----o
> + *      +================================================+
> + *      |  CPD entries[]                                 |
> + *      |      entry1                                    |
> + *      |      ...                                       |
> + *      |      entryX                                    |
> + *      |          "LTES.man"                            |
> + *      |           ...                                  |
> + *      |           offset  >----------------------------|------o
> + *      +================================================+      |
> + *                                                              |
> + *      +================================================+      |
> + *      |  Manifest Header                               |<-----o
> + *      |      ...                                       |
> + *      |      FW version                                |
> + *      |      ...                                       |
> + *      +================================================+
> + */
> +
> +/* FPT Headers */
> +struct csc_fpt_header {
> +	u32 header_marker;
> +#define CSC_FPT_HEADER_MARKER 0x54504624
> +	u32 num_of_entries;
> +	u8 header_version;
> +	u8 entry_version;
> +	u8 header_length; /* in bytes */
> +	u8 flags;
> +	u16 ticks_to_add;
> +	u16 tokens_to_add;
> +	u32 uma_size;
> +	u32 crc32;
> +	u16 fitc_major;
> +	u16 fitc_minor;
> +	u16 fitc_hotfix;
> +	u16 fitc_build;

For other headers we grouped the version values in a gsc_version struct. 
So here instead of the 4 separate versions you could have:

struct gsc_version fitc_version;

Which makes it easier to read as all headers have the same type for the 
version. We don't read this one though, so not a blocker.

Daniele

> +} __packed;
> +
> +struct csc_fpt_entry {
> +	u8 name[4]; /* partition name */
> +	u32 reserved1;
> +	u32 offset; /* offset from beginning of CSE region */
> +	u32 length; /* partition length in bytes */
> +	u32 reserved2[3];
> +	u32 partition_flags;
> +} __packed;
> +
>   #endif

