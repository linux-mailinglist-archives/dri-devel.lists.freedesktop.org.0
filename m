Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C79B1AD94
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 07:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF69110E46D;
	Tue,  5 Aug 2025 05:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQr2wDnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843EA10E24D;
 Tue,  5 Aug 2025 05:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754371494; x=1785907494;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UHonoKHS4AR2htjy3b95rqNJCUffT0B48NyDcpt0Ov0=;
 b=FQr2wDnWOe/F9EXywU6vlQ+HjZXPWy6hdCRL7QuD6LuloFUQEn11dHF7
 BvRNrtKPrYLoUi4mJz2r6vTbGaJvvj26eneL+XctNZQWKVdJZlfHKhuNW
 ruQpfH9j1I25doa+XdZrCz5yt6inWavHErG3sIADs4wPTBfmtNX/0VPD4
 psL1bdzbr1yJHkoE3N8PZshOl4QcswuAQklDzdfVOOdmi26vLqIMpahzg
 XqiTiQXxiy7zGtIlFrojjC9AI94q0zhR9TgQD9qkooAv69WRDEKfdr6di
 gdjhTV4WbXa9AyXw+BMDRrGZmdIRVsD6SFxSYl9uMGv0xAbtSB0G7Bbyo g==;
X-CSE-ConnectionGUID: xZGJ0GY+SNCSpfB6V+xf0g==
X-CSE-MsgGUID: 1Wex4RL4TlenSsbx5sY9Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="79206413"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="79206413"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 22:24:53 -0700
X-CSE-ConnectionGUID: ThB3a8+MQyisVGL+t9Jrsw==
X-CSE-MsgGUID: DRSvu67WQKePgQLyfIP96g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164044968"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 22:24:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 22:24:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 22:24:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 22:24:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjnwoLgZXxp18avpTFBOdzW/4N8jRixrowqBRsnTBJV6vn2bkboX7NBxYnJJwX6CY2x0OVQstkdwlj7Y4PPMA8vymEMvcXODlChZmNzhL++JL6V6FGVMkEx+UUkVzGCjoeMN8bOrOXe1iDhfrZfjENaPUcBM2rptfgGyVQTZd+vteCTRY0YiIo6dB5uF1b3lednCNd+dhD43NjEzaHTdNYf5G87pw8Tv11eqYP2+ew5ZmxgZ9yiFpylwRhemN/VN6+jhwxGb+Fiy1QHpkaO+UjWY9ZIYNTu83rpBQHBnNSmlQyGwJDhPbvT1bWe9Db5S9n22l92CVwq+vn0S3E8OZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gc6hDspCDnzcrdFE+ihP50CQZRDsokFipKrEkbG+SJI=;
 b=pSk4ZaTYogWLYpnnypPE5/I4UCoEKzC3ZcouwRKhEqc2MqlcgYY/+zE9NBxjWzdFPEFif4pRHWx1a/z9KJ6DQlrr6/q3wJ7yDeJJtR95n2VaUGpH/gJ+6cUIrVOMZe/ldz2thmL2qiL7sQr/MCKF8Gpo1foDcO4y8Vo+u0Pc1EH8pMMytVusKXHH7PsWx7ECy16CXxd1q3RWSSM+BNlprlzvdxPp8/zxwTjRc86HvohTqVGFSrLotOrRp3JXQD/DMSBC3xkPSD3UbB24oluUbYz5ym/wmuptYQY6+FFzK46BkkSA/y9ci/VPtTZoIk+jOE9QoHronORiKIq2yIB1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by BN9PR11MB5241.namprd11.prod.outlook.com
 (2603:10b6:408:132::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Tue, 5 Aug
 2025 05:24:36 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 05:24:36 +0000
Message-ID: <cb5e582f-7c85-4de6-8039-5c62d1ce5950@intel.com>
Date: Tue, 5 Aug 2025 10:54:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@redhat.com>, "Boris
 Brezillon" <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@kernel.org>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
 <aJGA4BPLJRs0RLfz@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aJGA4BPLJRs0RLfz@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: c8057e07-4502-42e7-0501-08ddd3e05dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG5vWE5LSnBvNlRmcmNsZm1ORTVrYzNFWEorbzRvbnhUaVFVR0x5TGR6ZU9r?=
 =?utf-8?B?QkMrNm1zSjcxS0syNDI0OEFTaW1RaGlFRFh0M2hnd1pCaTRERVJYeUxlWmRv?=
 =?utf-8?B?eVh3dnlFUVd6TDZsYW9nTDZSU3MvWXBic1k1eWo1N1BxVFVtUnZYZmt6MmVy?=
 =?utf-8?B?WlU2SERzQlJQTmU0VmF3NHVUTUNMUzZiNGl1Z2pJazl6QWRIdXdDR2RvbFBV?=
 =?utf-8?B?aWgyQ2pmWFJkMG82Rk5teFpIdWtJNFZudUFTakk3bEF1SFJ5V1lhdG9nVjlz?=
 =?utf-8?B?UHVqLyswcmJSTHdKUS9rT3U5ZkxuRVdlYXBRQUxNMERYUzNIMzMxL3V6QWRk?=
 =?utf-8?B?ZkNSdnpHcGZpMHJtQXUzdEQzeVErNDlwWEVyWjQrZW5SV1VROTFjVDNZUmE4?=
 =?utf-8?B?a1lDWmhtUlRWeWdwdGxFWVZ0SGNxdlRFNUtjZ0c0bFg1blNqNEVIUHdVeTk3?=
 =?utf-8?B?ZXhTRkFReEpsUU55djVUK05qWEtOVEV5bXAzbzNZK3d2czNselEzWUc0YjZW?=
 =?utf-8?B?OGNBNmUveVFDbGo4U2lRenRpRDZXcFVVUkl3b2luMVd0cDlqTG5WQmJrc2Zm?=
 =?utf-8?B?TjVEZU1jVjBsc3d4VXYwS05qOG1WTVNZQjJGRmZiZXJWWm9HTG1RRitvT2R2?=
 =?utf-8?B?RzYxNUJnTEJiRCtsdzNqNnprYmFVQVRKVEZ4SWhyWkJkV242NEN4TFI4K2Yv?=
 =?utf-8?B?bWF3SFVzc1BIRDJyNVBrWFV2U3F4NmxoeWJ5azhaVWRRVEpDOHVEVTlHSkQy?=
 =?utf-8?B?SFIydEpYcmp5U1VjY3hTMVgxbDd5ZjMwT1Z5NkNpSXVNeDllUDB3dlJqODdD?=
 =?utf-8?B?S1pOTzNyRnBEdEhSRk9qdU0rODY2TE5vOGJQaEh2RWgvL2Z5Ty82VDFGUURz?=
 =?utf-8?B?c0tHUnRvbVBHeFNGQ20zYnJYQzNSekY2YkFmOTRrZU9uelJWVDMzYmZPalpX?=
 =?utf-8?B?QStmaVdpblIyd1ZjUTFPejFrK1B4Z0FVS1pJZ0VBQ2dxSkl0R255OS9iWlJO?=
 =?utf-8?B?aGNGbTFSVlVrUUxKMGlLME43Y2xYUHlJMVNvZSthN3pqVmlxc084OWx0OEFS?=
 =?utf-8?B?NFRtanBiWFliSW1pczY4SEZJb2VuMWExMElwRTB0R1JEVUd6bk85NWxZalZy?=
 =?utf-8?B?dmd1QlRWOWljdVd6S3VUZW9QNjdybGQwNWZOS04rdlpvUk44REtveG1wTXp2?=
 =?utf-8?B?TTZtOTEwc0czOWE5aDNDNGMyK0dWMVJWRXJvRGtQaVc3NG1Xd3RRNHdFNFZx?=
 =?utf-8?B?YUxHWHQvbmw0S3prQlhFYUUxbVJnZHhaWXBmeDlicWg2U0xHRDdBOUhLUzJT?=
 =?utf-8?B?Njg5VlllS1licUdTeEQ1NkVRUkhITEVLS1NSRlQ1U1RsQTM1R0RUSlMrT0RV?=
 =?utf-8?B?dnRBWHdCdXk0ZEM5NWZQeUhyV1dROUM5ekU4a3BYd0RuaklIcVpqaHMyWlBM?=
 =?utf-8?B?YkZhOHNyZzhuQ0NodGJkdXh4Ky9yUnQ2dURMdnlZVFJQVTJLWDlkVFI5MzNH?=
 =?utf-8?B?bVNURmxSU1NDUTg0M3RSYVFIUXVJVUs0S0s2bWNjbWxvUWVoQ2pieUhoMkpC?=
 =?utf-8?B?ZE5zT3FTV0xqa0ZQQ1RTMHlmc2pHM0c1ODBwOTAyY05Bb0Z3bFFMQ3Znc3oz?=
 =?utf-8?B?eGs1WmdId01JOUVyM2dHWEV1ZC90WGh3Tmh2OEFVdTBpNFN4NzBKOHIyZ1BV?=
 =?utf-8?B?TEtScjF5dUhySXpJZEZlMkszMUt5a285MlZ5bmlyMVFUa0Q3RS9vNU5oMmlC?=
 =?utf-8?B?bkFyV0pTZTkyT0pHdGhMZHBCdkI4ZWlONEhDekV0eVUrenVkMGY2VWRObVpm?=
 =?utf-8?Q?2zfenXyAq17a6jw1rXuYSCDTbFw3Whu1OvLTM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1liWFZEY3FxZUQza0lMdTlSanV6ZlNjSHVSWTZ1c3ZQRVE1UVZPRVIydWNO?=
 =?utf-8?B?bmV4cFRoeUw4YUZMVjMxTzE1eGhYa2dwTURoaCtvdFAvRGlLeDBzeFFKNzUx?=
 =?utf-8?B?UnB3S1ZlQW93VmQ1SVFxdTA3WVZLWlNja0dQc2c0TmFEbllDNVFwTjMrQjBi?=
 =?utf-8?B?cUZvN1p2UlN1SFg0eDl1SlUwTWNMYkFLU3lCbXV0dTNBdmI0M1Bxa3Yyb0Nm?=
 =?utf-8?B?VktqS2t6TG9STjFpcGJ2UkZIZ3VwaFhrL2dSL0J2STE1d2JXNHZCSFdBRFJC?=
 =?utf-8?B?RWZ5ckpSZE1hNFZ4THBGUXkzZ0VZeml1VHJ4TmhMNTRjRmJaMTk1aEk4YURT?=
 =?utf-8?B?UXRuS2lKclpGSGZGbXQ3WkxyMFRBOWxtYjY4ZTZpend2U3pLK1JsLzVOSTh4?=
 =?utf-8?B?eHR1eG5PbytGbTdta0JyRjZOdm5ucUtZeDY5RnpSeE4yZ3I0RW9hbUJzR1Ix?=
 =?utf-8?B?bnlxa2xSclNkYndWb2VqMlJtem43ekg2b1FLaFFXTVAva3ZDTkVsRnZnbkJV?=
 =?utf-8?B?TjFFY0J6a1Exa3RFVzdtRWFoWXc5OUNVRy9yWlhvR1NqRlJjWlRMbW5FWHht?=
 =?utf-8?B?YVU0dTRzOGFkN21nRDRJOHRhRFZVSHJMdWIrT3p4Q3hZMkc0dG1VSVZRdkFG?=
 =?utf-8?B?T3BUNHkvYmhxeXdBU2Y5SXFTWTB3aXVZM0MreFk2VmxrUTdUbDBCNXViR1BZ?=
 =?utf-8?B?MGhGNUU2ZnVod3VKZFVCckw3ZVh2UHVnN1M4Q256cTMvR1BQZVdtOFNraDZN?=
 =?utf-8?B?M1B0c3F4YnkyUkRTQzdqdTNCc2FJM0prZFF1MllEZGpDeXl1Yml2Ky95Wkkx?=
 =?utf-8?B?NDg1VDlZS1FXR0IzcVdFWnpLbGU5ZzBsblNaZTBtbXNnK2FkVlNhM2dBd3Aw?=
 =?utf-8?B?dFNOdkc5MGJmcko2TVkrbG1HYkZxSmMxWTNNYTdHeXA2dUVtNlRucmsvMUJR?=
 =?utf-8?B?R3Jsa0tMSUZMbExrVEJkYWp5czhHU3pld3QzRmZESDNPTWhwd0kwZ0tjTE5r?=
 =?utf-8?B?L3RObm9YNlFHaWY2dnJ5MnlQUVRtYWpqSW5CNk9zcm0rcHZKb1BoL1ptTXZG?=
 =?utf-8?B?dEwvT2R3cUxONGFYRVRCNkJocWZLRjBORjFpZFQrZjRQY21mNTY5elJFN2sr?=
 =?utf-8?B?cE1DdDdxVlpxdWpHZjVUcHZ3eEplYjlxNEsxMGFZeHhiR3JlQmpDbUN5QUxQ?=
 =?utf-8?B?Y0JVVkJPRHU3eVBUVThrdHd5c2R3MmcwOFNjMVhycDBRczNLTlJkeDl3cExD?=
 =?utf-8?B?Ui9pd3VjeWl4UURUTjl2UW9sbHdyckpFRG9pdHgxaXYvOTBlZ2ZvTm1IQStl?=
 =?utf-8?B?cTl3N2ZPZzJ6Ni91eG43Y0oxYWpVRnZrRk9aZ1dsRG92UkdNNHJFSFp5bjVH?=
 =?utf-8?B?M0pOOFBsTllYRHJQSnhNYVpVa3Fhd2VyVzdDN1Zuck9EUFpWTm42emZFU1FW?=
 =?utf-8?B?QXNXTEl5Uk82a0hDRHZHa25hVFJxejN5Y0l1UGhEcmx5UFoxdUdsOWFYNUlx?=
 =?utf-8?B?ZnlUWVlFU2JpblVJSG1rY1JCakpaWWljUTc4WGFJNlJNMThqeVBRYzJ6VURL?=
 =?utf-8?B?WlJibnA5ZnFzMXNIU20yUldtdEVPSGI3bDVhM3VrZy9LNGZsUi9RNnlDZTVj?=
 =?utf-8?B?ejFJdFFHcU9RVkV2OEQvSjQzKzlPUmtQUS96WldtT3Q4anF0RFp5d1RIa1RB?=
 =?utf-8?B?VUpEY3E4dlpPTkRVQW0wV3M1TTdoZ1kzYUxPUEhDTnZwLzJONXdnTU1QRkg1?=
 =?utf-8?B?ZElMRTVPNXAwZ1kxSm5TSEJXc2Y1M0xyYmJyN0U4elNYZTVrTExkQzBYWWt3?=
 =?utf-8?B?V3dveG56ZUh3NGwzNTRxNWxvZ242ZnRPb1dYcXc1TTJEZU4vRi94QW5yWmQ5?=
 =?utf-8?B?cmhqUlR3Y0lZbGZ6VFhLcWRwQ1liQ1hPd1hvMWE4d0hxVnBwYmtBZGErb3RU?=
 =?utf-8?B?RmxGakdESlV0N2F3WHQ4ZitTc1o3NjNLMVlaVTlTMDgrYUg1a01ZNXpOQzNR?=
 =?utf-8?B?RXpQYVZuRllxbTR3aVcyVXZBQy93SFdVczBVWnlnekQ4UC9vNFhCMjE1OHBz?=
 =?utf-8?B?QWlRNk5xMElaNGxmUVl2Zm5SUFVqcUpkR2g0RE5US3UzK2x0NzQ2Y1ZxNEVE?=
 =?utf-8?B?ZlFjN3BSTHlDNDhLVWhSZ2RjbzBqS1ZCOGNZcTMvVFJSNVk4TVQrUnNPTDVp?=
 =?utf-8?Q?Wt7vrDWGi6jzh5QwtsNm5PQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8057e07-4502-42e7-0501-08ddd3e05dfd
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 05:24:36.3089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kb1p+iXr81+Ba4ZEWgkh1NTva9G5FEs2/+zbwt18iSWiGG1JdG/HU3ndJ76PX9wMQMgQ++i7Dv+mJxTyqHSJeB1ZZJI+JtUJ/lHcxn0KrM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
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



On 05-08-2025 09:26, Matthew Brost wrote:
> On Wed, Jul 30, 2025 at 06:30:26PM +0530, Himal Prasad Ghimiray wrote:
>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>
>> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
>> so, before we do that, let's pass arguments through a struct instead
>> of changing each call site every time a new optional argument is added.
>>
>> v5
>>   - Use drm_gpuva_op_map—same as drm_gpuvm_map_req (Danilo)
>>   - Rebase changes for drm_gpuvm_sm_map_exec_lock()
>>   - Fix kernel-docs
>>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: Caterina Shablia <caterina.shablia@collabora.com>
>> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>>
>> Acked-by: Danilo Krummrich <dakr@kernel.org> (#v4)
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c            | 106 ++++++++++---------------
>>   drivers/gpu/drm/imagination/pvr_vm.c   |  15 ++--
>>   drivers/gpu/drm/msm/msm_gem_vma.c      |  33 ++++++--
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 ++-
>>   drivers/gpu/drm/panthor/panthor_mmu.c  |  13 ++-
>>   drivers/gpu/drm/xe/xe_vm.c             |  13 ++-
>>   include/drm/drm_gpuvm.h                |  10 +--
>>   7 files changed, 112 insertions(+), 89 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>> index bbc7fecb6f4a..f04d80a3a63b 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -486,13 +486,18 @@
>>    *				  u64 addr, u64 range,
>>    *				  struct drm_gem_object *obj, u64 offset)
>>    *	{
>> + *	        struct drm_gpuva_op_map op_map = {
>> + *	                 .va.addr = addr,
>> + *	                 .va.range = range,
>> + *	                 .gem.obj = obj,
>> + *	                 .gem.offset = offset,
>> + *	           };
>>    *		struct drm_gpuva_ops *ops;
>>    *		struct drm_gpuva_op *op
>>    *		struct drm_gpuvm_bo *vm_bo;
>>    *
>>    *		driver_lock_va_space();
>> - *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
>> - *						  obj, offset);
>> + *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, &op_map);
>>    *		if (IS_ERR(ops))
>>    *			return PTR_ERR(ops);
>>    *
>> @@ -2054,16 +2059,15 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
>>   
>>   static int
>>   op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
>> -	  u64 addr, u64 range,
>> -	  struct drm_gem_object *obj, u64 offset)
>> +	  const struct drm_gpuva_op_map *req)
>>   {
>>   	struct drm_gpuva_op op = {};
>>   
>>   	op.op = DRM_GPUVA_OP_MAP;
>> -	op.map.va.addr = addr;
>> -	op.map.va.range = range;
>> -	op.map.gem.obj = obj;
>> -	op.map.gem.offset = offset;
>> +	op.map.va.addr = req->va.addr;
>> +	op.map.va.range = req->va.range;
>> +	op.map.gem.obj = req->gem.obj;
>> +	op.map.gem.offset = req->gem.offset;
>>   
>>   	return fn->sm_step_map(&op, priv);
>>   }
>> @@ -2102,17 +2106,16 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
>>   static int
>>   __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		   const struct drm_gpuvm_ops *ops, void *priv,
>> -		   u64 req_addr, u64 req_range,
>> -		   struct drm_gem_object *req_obj, u64 req_offset)
>> +		   const struct drm_gpuva_op_map *req)
>>   {
>>   	struct drm_gpuva *va, *next;
>> -	u64 req_end = req_addr + req_range;
>> +	u64 req_end = req->va.addr + req->va.range;
>>   	int ret;
>>   
>> -	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
>> +	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)))
>>   		return -EINVAL;
>>   
>> -	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
>> +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req->va.addr, req_end) {
>>   		struct drm_gem_object *obj = va->gem.obj;
>>   		u64 offset = va->gem.offset;
>>   		u64 addr = va->va.addr;
>> @@ -2120,9 +2123,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		u64 end = addr + range;
>>   		bool merge = !!va->gem.obj;
>>   
>> -		if (addr == req_addr) {
>> -			merge &= obj == req_obj &&
>> -				 offset == req_offset;
>> +		if (addr == req->va.addr) {
>> +			merge &= obj == req->gem.obj &&
>> +				 offset == req->gem.offset;
>>   
>>   			if (end == req_end) {
>>   				ret = op_unmap_cb(ops, priv, va, merge);
>> @@ -2141,9 +2144,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   			if (end > req_end) {
>>   				struct drm_gpuva_op_map n = {
>>   					.va.addr = req_end,
>> -					.va.range = range - req_range,
>> +					.va.range = range - req->va.range,
>>   					.gem.obj = obj,
>> -					.gem.offset = offset + req_range,
>> +					.gem.offset = offset + req->va.range,
>>   				};
>>   				struct drm_gpuva_op_unmap u = {
>>   					.va = va,
>> @@ -2155,8 +2158,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   					return ret;
>>   				break;
>>   			}
>> -		} else if (addr < req_addr) {
>> -			u64 ls_range = req_addr - addr;
>> +		} else if (addr < req->va.addr) {
>> +			u64 ls_range = req->va.addr - addr;
>>   			struct drm_gpuva_op_map p = {
>>   				.va.addr = addr,
>>   				.va.range = ls_range,
>> @@ -2165,8 +2168,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   			};
>>   			struct drm_gpuva_op_unmap u = { .va = va };
>>   
>> -			merge &= obj == req_obj &&
>> -				 offset + ls_range == req_offset;
>> +			merge &= obj == req->gem.obj &&
>> +				 offset + ls_range == req->gem.offset;
>>   			u.keep = merge;
>>   
>>   			if (end == req_end) {
>> @@ -2189,7 +2192,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   					.va.range = end - req_end,
>>   					.gem.obj = obj,
>>   					.gem.offset = offset + ls_range +
>> -						      req_range,
>> +						      req->va.range,
>>   				};
>>   
>>   				ret = op_remap_cb(ops, priv, &p, &n, &u);
>> @@ -2197,10 +2200,10 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   					return ret;
>>   				break;
>>   			}
>> -		} else if (addr > req_addr) {
>> -			merge &= obj == req_obj &&
>> -				 offset == req_offset +
>> -					   (addr - req_addr);
>> +		} else if (addr > req->va.addr) {
>> +			merge &= obj == req->gem.obj &&
>> +				 offset == req->gem.offset +
>> +					   (addr - req->va.addr);
>>   
>>   			if (end == req_end) {
>>   				ret = op_unmap_cb(ops, priv, va, merge);
>> @@ -2236,9 +2239,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		}
>>   	}
>>   
>> -	return op_map_cb(ops, priv,
>> -			 req_addr, req_range,
>> -			 req_obj, req_offset);
>> +	return op_map_cb(ops, priv, req);
>>   }
>>   
>>   static int
>> @@ -2303,10 +2304,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>>    * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
>>    * @gpuvm: the &drm_gpuvm representing the GPU VA space
>>    * @priv: pointer to a driver private data structure
>> - * @req_addr: the start address of the new mapping
>> - * @req_range: the range of the new mapping
>> - * @req_obj: the &drm_gem_object to map
>> - * @req_offset: the offset within the &drm_gem_object
>> + * @req: ptr to drm_gpuva_op_map struct
>>    *
>>    * This function iterates the given range of the GPU VA space. It utilizes the
>>    * &drm_gpuvm_ops to call back into the driver providing the split and merge
>> @@ -2333,8 +2331,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>>    */
>>   int
>>   drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>> -		 u64 req_addr, u64 req_range,
>> -		 struct drm_gem_object *req_obj, u64 req_offset)
>> +		 const struct drm_gpuva_op_map *req)
>>   {
>>   	const struct drm_gpuvm_ops *ops = gpuvm->ops;
>>   
>> @@ -2343,9 +2340,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>>   		       ops->sm_step_unmap)))
>>   		return -EINVAL;
>>   
>> -	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
>> -				  req_addr, req_range,
>> -				  req_obj, req_offset);
>> +	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>>   
>> @@ -2421,10 +2416,7 @@ static const struct drm_gpuvm_ops lock_ops = {
>>    * @gpuvm: the &drm_gpuvm representing the GPU VA space
>>    * @exec: the &drm_exec locking context
>>    * @num_fences: for newly mapped objects, the # of fences to reserve
>> - * @req_addr: the start address of the range to unmap
>> - * @req_range: the range of the mappings to unmap
>> - * @req_obj: the &drm_gem_object to map
>> - * @req_offset: the offset within the &drm_gem_object
>> + * @op: ptr to drm_gpuva_op_map struct
> 
> s/@op/@req/ - Kernel test robot.
> 
> Also I believe Danilo's suggestion here was to define drm_gpuvm_map_req
> as the argument and then embed drm_gpuva_op_map within
> drm_gpuvm_map_req. So in patch [1], flags would be added to
> drm_gpuvm_map_req rather than drm_gpuva_op_map.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/666211/?series=149550&rev=5

Hi Matt,

Thanks for the review. Initially, I considered using drm_gpuvm_map_req 
struct instead of passing drm_gpuva_op_map directly to the gpuvm layer, 
allowing it to handle split/merge decisions independently.

However, the upcoming patch [1] relies on this flag to determine 
driver-side behavior. So at the end drm_gpuva_op_map and 
drm_gpuvm_map_req might end up identical. Based on that—and Danilo’s 
feedback on this patch [2] I thought It will be better to keep a single 
op_map struct with the flag included.

Boris, could you please confirm if the flag will be useful on the driver 
side [1]?

[1] https://patchwork.freedesktop.org/patch/662832/?series=151264&rev=2
[2] https://patchwork.freedesktop.org/patch/662819/?series=151264&rev=2

> 
>>    *
>>    * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
>>    * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
>> @@ -2442,12 +2434,10 @@ static const struct drm_gpuvm_ops lock_ops = {
>>    *            for_each_vm_bind_operation {
>>    *                switch (op->op) {
>>    *                case DRIVER_OP_UNMAP:
>> - *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
>> + *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->va.addr, op->va.range);
>>    *                    break;
>>    *                case DRIVER_OP_MAP:
>> - *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
>> - *                                                     op->addr, op->range,
>> - *                                                     obj, op->obj_offset);
>> + *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences, op);
>>    *                    break;
>>    *                }
>>    *
>> @@ -2478,18 +2468,16 @@ static const struct drm_gpuvm_ops lock_ops = {
>>   int
>>   drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>>   			   struct drm_exec *exec, unsigned int num_fences,
>> -			   u64 req_addr, u64 req_range,
>> -			   struct drm_gem_object *req_obj, u64 req_offset)
>> +			   struct drm_gpuva_op_map *req)
>>   {
>> -	if (req_obj) {
>> -		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
>> +	if (req->gem.obj) {
>> +		int ret = drm_exec_prepare_obj(exec, req->gem.obj, num_fences);
>>   		if (ret)
>>   			return ret;
>>   	}
>>   
>>   	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
>> -				  req_addr, req_range,
>> -				  req_obj, req_offset);
>> +				  req);
>>   
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
>> @@ -2611,10 +2599,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>>   /**
>>    * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
>>    * @gpuvm: the &drm_gpuvm representing the GPU VA space
>> - * @req_addr: the start address of the new mapping
>> - * @req_range: the range of the new mapping
>> - * @req_obj: the &drm_gem_object to map
>> - * @req_offset: the offset within the &drm_gem_object
>> + * @req: ptr to drm_gpuva_op_map struct
>>    *
>>    * This function creates a list of operations to perform splitting and merging
>>    * of existent mapping(s) with the newly requested one.
>> @@ -2642,8 +2627,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>>    */
>>   struct drm_gpuva_ops *
>>   drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>> -			    u64 req_addr, u64 req_range,
>> -			    struct drm_gem_object *req_obj, u64 req_offset)
>> +			    const struct drm_gpuva_op_map *req)
>>   {
>>   	struct drm_gpuva_ops *ops;
>>   	struct {
>> @@ -2661,9 +2645,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>>   	args.vm = gpuvm;
>>   	args.ops = ops;
>>   
>> -	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
>> -				 req_addr, req_range,
>> -				 req_obj, req_offset);
>> +	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
>>   	if (ret)
>>   		goto err_free_ops;
>>   
>> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
>> index 2896fa7501b1..57116709de81 100644
>> --- a/drivers/gpu/drm/imagination/pvr_vm.c
>> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
>> @@ -185,12 +185,17 @@ struct pvr_vm_bind_op {
>>   static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
>>   {
>>   	switch (bind_op->type) {
>> -	case PVR_VM_BIND_TYPE_MAP:
>> +	case PVR_VM_BIND_TYPE_MAP: {
>> +		const struct drm_gpuva_op_map map_req = {
>> +			.va.addr = bind_op->device_addr,
>> +			.va.range = bind_op->size,
>> +			.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
>> +			.gem.offset = bind_op->offset,
>> +		};
>> +
>>   		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
>> -					bind_op, bind_op->device_addr,
>> -					bind_op->size,
>> -					gem_from_pvr_gem(bind_op->pvr_obj),
>> -					bind_op->offset);
>> +					bind_op, &map_req);
>> +	}
>>   
>>   	case PVR_VM_BIND_TYPE_UNMAP:
>>   		return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
>> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
>> index 3cd8562a5109..59a9b41bc967 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
>> @@ -371,6 +371,12 @@ struct drm_gpuva *
>>   msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>>   		u64 offset, u64 range_start, u64 range_end)
>>   {
>> +	struct drm_gpuva_op_map op_map = {
>> +		.va.addr = range_start,
>> +		.va.range = range_end - range_start,
>> +		.gem.obj = obj,
>> +		.gem.offset = offset,
>> +	};
>>   	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
>>   	struct drm_gpuvm_bo *vm_bo;
>>   	struct msm_gem_vma *vma;
>> @@ -399,7 +405,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>>   	if (obj)
>>   		GEM_WARN_ON((range_end - range_start) > obj->size);
>>   
>> -	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
>> +	drm_gpuva_init_from_op(&vma->base, &op_map);
>>   	vma->mapped = false;
>>   
>>   	ret = drm_gpuva_insert(&vm->base, &vma->base);
>> @@ -1172,10 +1178,17 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
>>   				break;
>>   			case MSM_VM_BIND_OP_MAP:
>>   			case MSM_VM_BIND_OP_MAP_NULL:
>> -				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1,
>> -							    op->iova, op->range,
>> -							    op->obj, op->obj_offset);
>> +			{
>> +				struct drm_gpuva_op_map map_req = {
>> +					.va.addr = op->iova,
>> +					.va.range = op->range,
>> +					.gem.obj = op->obj,
>> +					.gem.offset = op->obj_offset,
>> +				};
>> +
>> +				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
>>   				break;
>> +			}
>>   			default:
>>   				/*
>>   				 * lookup_op() should have already thrown an error for
>> @@ -1283,9 +1296,17 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>>   				arg.flags |= MSM_VMA_DUMP;
>>   			fallthrough;
>>   		case MSM_VM_BIND_OP_MAP_NULL:
>> -			ret = drm_gpuvm_sm_map(job->vm, &arg, op->iova,
>> -					       op->range, op->obj, op->obj_offset);
>> +		{
>> +			struct drm_gpuva_op_map map_req = {
>> +				.va.addr = op->iova,
>> +				.va.range = op->range,
>> +				.gem.obj = op->obj,
>> +				.gem.offset = op->obj_offset,
>> +			};
>> +
>> +			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
>>   			break;
>> +		}
>>   		default:
>>   			/*
>>   			 * lookup_op() should have already thrown an error for
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> index ddfc46bc1b3e..b74054b0a476 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> @@ -1276,6 +1276,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>>   			break;
>>   		case OP_MAP: {
>>   			struct nouveau_uvma_region *reg;
>> +			struct drm_gpuva_op_map map_req = {
>> +				.va.addr = op->va.addr,
>> +				.va.range = op->va.range,
>> +				.gem.obj = op->gem.obj,
>> +				.gem.offset = op->gem.offset,
>> +			};
>>   
>>   			reg = nouveau_uvma_region_find_first(uvmm,
>>   							     op->va.addr,
>> @@ -1301,10 +1307,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>>   			}
>>   
>>   			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
>> -							      op->va.addr,
>> -							      op->va.range,
>> -							      op->gem.obj,
>> -							      op->gem.offset);
>> +							      &map_req);
>>   			if (IS_ERR(op->ops)) {
>>   				ret = PTR_ERR(op->ops);
>>   				goto unwind_continue;
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index 4140f697ba5a..5fd4245a57b9 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -2169,15 +2169,22 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>>   	mutex_lock(&vm->op_lock);
>>   	vm->op_ctx = op;
>>   	switch (op_type) {
>> -	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
>> +	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
>> +		const struct drm_gpuva_op_map map_req = {
>> +			.va.addr = op->va.addr,
>> +			.va.range = op->va.range,
>> +			.gem.obj = op->map.vm_bo->obj,
>> +			.gem.offset = op->map.bo_offset,
>> +		};
>> +
>>   		if (vm->unusable) {
>>   			ret = -EINVAL;
>>   			break;
>>   		}
>>   
>> -		ret = drm_gpuvm_sm_map(&vm->base, vm, op->va.addr, op->va.range,
>> -				       op->map.vm_bo->obj, op->map.bo_offset);
>> +		ret = drm_gpuvm_sm_map(&vm->base, vm, &map_req);
>>   		break;
>> +	}
>>   
>>   	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
>>   		ret = drm_gpuvm_sm_unmap(&vm->base, vm, op->va.addr, op->va.range);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 432ea325677d..4b3e78745363 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2316,10 +2316,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>   
>>   	switch (operation) {
>>   	case DRM_XE_VM_BIND_OP_MAP:
>> -	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
>> -		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
>> -						  obj, bo_offset_or_userptr);
>> +	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
>> +		struct drm_gpuva_op_map map_req = {
>> +			.va.addr = addr,
>> +			.va.range = range,
>> +			.gem.obj = obj,
>> +			.gem.offset = bo_offset_or_userptr,
>> +		};
>> +
>> +		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
>>   		break;
>> +	}
>>   	case DRM_XE_VM_BIND_OP_UNMAP:
>>   		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
>>   		break;
>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>> index 274532facfd6..892ffe75a62f 100644
>> --- a/include/drm/drm_gpuvm.h
>> +++ b/include/drm/drm_gpuvm.h
>> @@ -1060,8 +1060,8 @@ struct drm_gpuva_ops {
>>   
>>   struct drm_gpuva_ops *
>>   drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>> -			    u64 addr, u64 range,
>> -			    struct drm_gem_object *obj, u64 offset);
>> +			    const struct drm_gpuva_op_map *req);
>> +
>>   struct drm_gpuva_ops *
>>   drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
>>   			      u64 addr, u64 range);
>> @@ -1205,16 +1205,14 @@ struct drm_gpuvm_ops {
>>   };
>>   
>>   int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>> -		     u64 addr, u64 range,
>> -		     struct drm_gem_object *obj, u64 offset);
>> +		     const struct drm_gpuva_op_map *req);
>>   
>>   int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>>   		       u64 addr, u64 range);
>>   
>>   int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>>   			  struct drm_exec *exec, unsigned int num_fences,
>> -			  u64 req_addr, u64 req_range,
>> -			  struct drm_gem_object *obj, u64 offset);
>> +			  struct drm_gpuva_op_map *req);
>>   
>>   int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
>>   				 u64 req_addr, u64 req_range);
>> -- 
>> 2.34.1
>>

