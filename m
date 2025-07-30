Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B8B16237
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 16:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6C810E1F4;
	Wed, 30 Jul 2025 14:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GM8nHNPC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256B410E1F4;
 Wed, 30 Jul 2025 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753884286; x=1785420286;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T30o6zdxq11o7yjhcAvgglG+oB5eCEsaufeP+fwubS0=;
 b=GM8nHNPC2GyrO9L/xR6Zsmkr2I0m2pj3SF1ldWniQGhB3kOSKr2EeDKt
 EwjKdoccXBlD/ps5PHZS0CU5PTJIgGRjsTn/kg6aeyi/Mj3vqfc1xJo/J
 kIlITWjzxkgNdakjqY8yLuhr8Gx5gS0dvd3jsFeIUylG35x7Nil2tvnxb
 pnwxUrVzPn/sRtnPTyyF5uuYjsS1WOyjjJFlFru81k2yi37n9RKwRHmfl
 9VVGpNz0MvQRPPXdJ8gDZ2q4qUwE0dWKezagsdWk7IqRHAe1fA2Sifzhs
 mVTHit+t7P4RNhbCBb8au3XfBidKAsOn/4xSKNM46sOdrHfxtCvl70B81 g==;
X-CSE-ConnectionGUID: saA0A5dSSwaxYDQMYTs8kw==
X-CSE-MsgGUID: d1h8G7rLTFi2mrkdgTV/0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="60000621"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="60000621"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:03:50 -0700
X-CSE-ConnectionGUID: DQqW3CZWTeSM3CP4eSYpwQ==
X-CSE-MsgGUID: itn1DvPGTCKhcP3DRg0cSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163338814"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:03:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 07:03:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 07:03:47 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 07:03:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLazbuAGNwObLZTxvFPvbeM/1UtYTy4BNsb/K48WO8YQETsbtwDQn1vWT0o66/CkaY0582wx+1M8oe49Q1yl+0akIuonE2jLRKv/eEAAIDfDB4z3eMuRPufBPG8bNedplhKvcdqSXopmiI8hJ4X6qOW7FnMpg/qG8aj3KLGG6TWs27GLH8n2u9ahN+eUTPdGIn51i3CuT98QHxTxSW3e4/pqiJdN13KGvxma3MSMCV2NzcgDSLoIOpZaFfI7W5g/4NjF+pF7fHA4we0xrxvJNtYOdfThmjnCznIyTzl7wEMOpxUwU+BDXorKc+UhsP7FUXcP5Jj5QW367751XQZJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iqv3Azg9XYolvAwFYwteCHR3i+vAKLsV5zOxlc6YngA=;
 b=ahv52XwR5CUbdIZUDuGSFm2JrOfW2PfadxhkXzAwMlUcQ6e5hp1d6LToorLyPv7dditqqhpXp6RmFWgKXIsH0K8Mk2q6Tibay48bfJcBJ1kGIUTIpvQyTC332a4htiiv8T5zFCDAOask3HbvYiBnThm6LTeDlNQlcWyh/LgM5DMMiv3yevC/81CCVheFraYSKIjhZNFE1KcRsG2VpaLsLfjvm9vNJN7Etny0S8w6Xzut4yI1ISeZc2M4fzsf2eU5WeE0uso1XKBW9aT+UOMyFGo0bjzlR3gfQBw7ZTOcWQPB72cZdHTwsfpgLFbXJJK0sfPhk8paN8cPwpWyGCz8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL4PR11MB8871.namprd11.prod.outlook.com (2603:10b6:208:5a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 14:03:12 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 14:03:12 +0000
Message-ID: <39095bd1-2dee-4bfb-bc87-ee8cecedebce@intel.com>
Date: Wed, 30 Jul 2025 19:33:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
To: <dri-devel@lists.freedesktop.org>, <simona.vetter@ffwll.ch>, David Airlie
 <airlied@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <intel-xe@lists.freedesktop.org>, <tzimmermann@suse.de>
References: <20250728102809.502324-1-riana.tauro@intel.com>
 <20250728102809.502324-2-riana.tauro@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250728102809.502324-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::31) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL4PR11MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: ceec0074-78e8-47b2-d376-08ddcf71d246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGN1Z1NzTVdha1IrenNjN3Budi9aTzBYWEEzMjBKYVhSSVJCU1FpWm5GZzBX?=
 =?utf-8?B?WG9nU2hqRXgzZFVkMHA3d0lLTEY3cUk5UFFzU2tvSHJWbHVUUkx0YWtBZXhK?=
 =?utf-8?B?dWhQcGJBMjBYSE1hajV2eGxNQmg3dC9uMmlmY1BvcW54VE9xRmszN05MZnk4?=
 =?utf-8?B?dytsK1paSFg3ci96c0lMNlBEMERPbHIxNGVVbk5uakJ2TU15dVNxN2crZzNo?=
 =?utf-8?B?eUYrNkV6b3lJTy9KWVVXcXRQc3FKRk1uY0VoamlId1g2dWdsUzBvMGdDRmJ0?=
 =?utf-8?B?N2ErY1dHWVJLd3FjMnZsYU1rOFlhaWZNVHMzdUlyZWNTYXNRR1kyQkM5SGty?=
 =?utf-8?B?UDZhK2MxdVh1blJib1lZQ2p1aDFQQWtudFJFNFhQYzN2dlNtbUZSWjRzY0pS?=
 =?utf-8?B?dkJleGpvRUVvcDE5VkRONzJ0ak1kL3pEL1djY3orcm1KaHJ4d2VQZlpHVUZK?=
 =?utf-8?B?dU12azcxUXNCVTg5NXUxQ01sc2k3YXhiY3daNFkrdkNMZS8xZ2tha3RkdmVi?=
 =?utf-8?B?SXdpNjk4RDEzaGVkMjlBQklXMVNaY1dwQ29LVkdtWHo0eEZWS2pPMmNsa1p2?=
 =?utf-8?B?M3RWdnZLcjF1NVBxVzF1Z2pBc0RoRm00U2FHNXRIOHZPaEdCaWVFeVk0azJI?=
 =?utf-8?B?R08wMGFrVStZUGhJSEdGaytFMUxoYjhiMUE5MDVZOGVKckwzSnRTRG96Y0NW?=
 =?utf-8?B?bWZCVjNvcWFHM1NBeUxGaWlpTFZGNXNVZzN1V0VFRmh1V3QvOWgwYitNZUdn?=
 =?utf-8?B?UlFtbUhXbXZpOHNsNFJJT1NkYmNtZUpkajRRc01CK0lGeWt4em4vNVpBVFVF?=
 =?utf-8?B?ZUFUWUtUTnlUdDRObHdpN21QMXFwZ2t5WWJFL1FaWitPWkQ3RzJYYTdDSnVs?=
 =?utf-8?B?VDVVR2pBUEJVdmhaaWxncU1OUkoveTlib1BSOGxoNDhzRjdBQTRKdStaSGp1?=
 =?utf-8?B?cHBra0tyRFNrZWdtbE8rNkNVQkM1b2pWaWF5ZnpYUTF5N0Njem1qY0Ricmxu?=
 =?utf-8?B?YnVkMnMxUDZxVzhUMlNsSFp4M1BsWTdwaExvUXJXYlR5TnVtaUJJWjJqMUJB?=
 =?utf-8?B?SERTWkpGVHVPbGpwbHFrMFFHZnA2SGVDRHUwMTBQZEhMVzhMbk54cHIvUnpG?=
 =?utf-8?B?ZGZBeklqb2lNRXpPK1c5KzFMVEZtbXlORFNvVnByRjVNZ0JWVi9jbHFVTWZY?=
 =?utf-8?B?SkVYZ3BYTndBZi9xSFZkbW9jVkE3b2haR1RMK3ZyUmpJN3JFbzUveUFkMkZr?=
 =?utf-8?B?b1c5dStRUFBta3AySlJ0MVFvc3Y5VDFEV3p5dDBZVHhJY1FjU21yUXpYSDdP?=
 =?utf-8?B?UHJYVEQvK0FJUU0rS3VaNzlkMkw2TTRIRnFYU0lCS0lQZ0lwWUNpZFNkcHd3?=
 =?utf-8?B?UERWR1VtZERtODRqemg0cXFlYXcvRGxNQ1ZiUTJUMUcvL2JyWGV5Tk5qNktr?=
 =?utf-8?B?NDNlUnQxVGd6Q0t6V2VqTGc5cU1KK3pmOW5ldlhiZHdNSmJuck9vZ2xRd3U1?=
 =?utf-8?B?RWp5cDM5VXVrQ2d6NW1hdEpKTFFMNUl4T0J1NVU1eFc0aldQTWxYV1JZSWFM?=
 =?utf-8?B?V2xNanBFVVJRaUdEOStqd2hWMlNyMjN0UFdiMWo1VEY4cVZJa2ZTS2ZQVjE1?=
 =?utf-8?B?b1dQTXZiVU1zY0xWNUhKRmY0SkZ1Q0lwcU16eVIxUndZcll6aG9IaUNldmJF?=
 =?utf-8?B?M2NrcFBiSk55YXRPTUYwd2Y5UitHdjhsdDJKQW1EU2RIMWZ0Qm9jVXVKS1pH?=
 =?utf-8?B?MHNBY0U4NG9HWVk4VStsMjY4c2hocGZLYWZGVVRwTUFkUno4ak94bHVWUllV?=
 =?utf-8?B?VkovbEczVDVKT0M1TXNoeDcyZTNvQlZCUFVleFJha3VmUnNXMHJYOFVUUkJF?=
 =?utf-8?B?dDFPQTc4V0FkVUkvTkcxd1VvUjkyZE91bktoZktUWThmekdPUXUvN2o3QnE0?=
 =?utf-8?Q?9Ts2VbDVxAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjNMdjVYZnIvUCtrZlhHMDlIa2tEd2kyODNoQjNhQjNOUTkvRi9BMVhTbkFN?=
 =?utf-8?B?MVRkRjQvekoxdElyVHo3N1M1OE5HbGd2T0tnL2FhclFZNkxiNCsvSnNWaVZw?=
 =?utf-8?B?dUQ3VnA2bU0yanhCbHNYRXdiNWRQRU1yNllQOWVKU3l2VnRaeHJIYzFBcWo0?=
 =?utf-8?B?SVVPU0Yxdk8yS3JlR21ER2pkeUw4d1pjd0VaVzRpZCtzREtDcmpPOXFPbCto?=
 =?utf-8?B?UlF3d2MrWWVlVVl6TTlza2RHdUtZTUpOSnh1K1NtUG1tNXZUNjFKckUzUkhK?=
 =?utf-8?B?OUg3Zm5kMkFyZVFTdU4xYXF0ZTQ3MDBBYUtSQytvQUtqYzZHZDU1VG1Hd3hs?=
 =?utf-8?B?VS9EVkd5WndnaGkwV3QrengvZitjZVlHNU5sWnpqRm5SbHA2WjZ5RVJKWndR?=
 =?utf-8?B?WDBZdUwwb1ZqNjhwWlhna2IvYVY0KzlKYU5WVnRZam1hdGVzQjdWNG9jUU1v?=
 =?utf-8?B?cTVvMUY0b2RSeWdhVnNSc2xxaGxra0RHUFVBWE5HNGN5Ym44WWJMWE5uYmpH?=
 =?utf-8?B?MXBlNGo0ajZ3a0twdHJEWUtuUGpBOGJXMFVwTTN6SVhSTWFmVU1aYU9paTBY?=
 =?utf-8?B?NStQblEyK1Foa1lxRHVHdGNTMkpRVGNhVmVKeVdNT1RibTNjUDVndHhSektL?=
 =?utf-8?B?U29XbURoajZ3cVhrTEhlMGtqeDM2S1cxUElOZzNtd0Rya2RvZUhpZ3d5SS8r?=
 =?utf-8?B?emZRblFXenR1NTdWemlMcDVJSGd0eFhqcEpBUHhnemVLRlphRXd1RHRCeUJn?=
 =?utf-8?B?ZS91RmRaNHNyV21zSVVSQ3ZpeFlpMSszVW9rcUlDbFc1eTIzL3Z1Ry92MFlF?=
 =?utf-8?B?VFMzVnkwY0swczJmV3d2bzYvQ2Evd3lQTW55OGZFa0F5OE9RaiswTVFlSW13?=
 =?utf-8?B?OWNyWUpzMlhDMTZ0L050ZUoyRjJMWEoyZkc1eE1Pd1hQM1MrWFVxajVUZVRW?=
 =?utf-8?B?b2JlQW8zZ1hkdGRYS2lMOUIwYlU0K2ZZRUQ4N0ZHcGx4bDYxU1habDVFUFYy?=
 =?utf-8?B?LzhLY2VYTnVmQWFodHZKMko1eDVrQUFjQzE5UXVHUmM3amRtLzRUVnB0WHc0?=
 =?utf-8?B?Zm4xd001OUtTSlA1bEJmbmxFeGxwdlI0bC9KQUlDaWtrbjl2bUJQV216cjVQ?=
 =?utf-8?B?SlM0NEQ5MmFta1RndWV0QjVLVElTK2VFR2gxWWVMS0VmaGhMQ3FYeWFQaEVq?=
 =?utf-8?B?WUpycnFjTWczM1pKN3hwMGJkZUc3NU9mOWVzd3crOThoTEE4QkF6QzF3MnN6?=
 =?utf-8?B?RGhQUVlRYjRzbk9JZHFVWm1UbE9TOGFJWTNrd0JPbVdpUmtMUHZUVlFXM3JN?=
 =?utf-8?B?UEt4ekU4NTJrWC9WR2JjNnZaRTZwMXZ5dlM1cUduUWJQQTk0OEJIWVBERGpv?=
 =?utf-8?B?emZRK2FDZXA1eHBaTjhsdkZOaVUxUmdQVjVxWXd4QlRrNHBDZ0xJbGlSek1K?=
 =?utf-8?B?cUZiWEJ6OHNZNCtETzYzRnZsVytIbi9RNVhXU0c1WUFCZlZOL2xzZzBDNnFk?=
 =?utf-8?B?TnY3QXN6WGtTb2w3QWpCT2NmbS9tWHRwTUtxSVBiQk5tUXkxTnVvNDRPYm9J?=
 =?utf-8?B?YmliMCsyckdOcnRhN2sxZEVneVhiZ0VXajF3YzF1S1N5K2ZlMnhkdm5iUExB?=
 =?utf-8?B?dVY1dVhyRFlwdmxPVUhNUk0rK2EyOTNxZ05SK09jRytMekNUSDdaTWdPa0F6?=
 =?utf-8?B?NUNDK3R0R2h4YnEzYlBYUnQyQ1BEZzI5bjdINWNFRjF2QkdYUUUvajIzME1i?=
 =?utf-8?B?NTZxMFVUamRReDZBYnRobEN1eElvb2hJZEpWdklJZU5iNFlkWmNwdnQvNVZj?=
 =?utf-8?B?ZW5Mek5yK1lrd0kxMTJ3dFlXNWV2V3hjckpIRnozUU5Qd0Uwdko5MDRqRTBO?=
 =?utf-8?B?MGlpTU1Cdkprd3cvUVlXVm1MZVoyT0VBMlB6UVpsbXpXRkUvanRHQWM1YVdH?=
 =?utf-8?B?L1pON0VWWEJpRnIvYUI0cUwybGZROHpQMy9OeDhTTnlrbVFsblc3MGlNOTNr?=
 =?utf-8?B?OW1KcC9Cd3c2a2lYRW10em1WTjNPLzB3ZUFHaFUvY2hEKy85L25PRCtVTDBl?=
 =?utf-8?B?YWgrRWpadjJCaFBDNVZWMTdNSGw0TmVwTUplSmlJdmtLRllBdXY3cEl2OENq?=
 =?utf-8?Q?K5cmYAOxJs4pNB7tey9zrk8s3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceec0074-78e8-47b2-d376-08ddcf71d246
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 14:03:12.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rq24/RSr/FvyUX/ywUdN8xhrKKCtkR9g/Fjcq7JdDX9UKcohZx0o2A2N1T0RjawwVd1Ff/hSYTWEe+n62ZxE9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8871
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



On 7/28/2025 3:57 PM, Riana Tauro wrote:
> Address the need for a recovery method (firmware flash on Firmware errors)
> introduced in the later patches of Xe KMD.
> Whenever XE KMD detects a firmware error, a firmware flash is required to
> recover the device to normal operation.
> 
> The initial proposal to use 'firmware-flash' as a recovery method was
> not applicable to other drivers and could cause multiple recovery
> methods specific to vendors to be added.
> To address this a more generic 'vendor-specific' method is introduced,
> guiding users to refer to vendor specific documentation and system logs
> for detailed vendor specific recovery procedure.
> 
> Add a recovery method 'WEDGED=vendor-specific' for such errors.
> Vendors must provide additional recovery documentation if this method
> is used.
> 
> It is the responsibility of the consumer to refer to the correct vendor
> specific documentation and usecase before attempting a recovery.
> 
> For example: If driver is XE KMD, the consumer must refer
> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
> 
> Recovery script contributed by Raag.
> 
> v2: fix documentation (Raag)
> v3: add more details to commit message (Sima, Rodrigo, Raag)
>      add an example script to the documentation (Raag)
> v4: use consistent naming (Raag)
> v5: fix commit message
> 
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Co-developed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

This patch needs an ack from drm to be merged.
The rest of the series have RB's. Can someone please provide an ack ?

Cc: drm-misc maintainers

Thanks
Riana

> ---
>   Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
>   drivers/gpu/drm/drm_drv.c      |  2 ++
>   include/drm/drm_device.h       |  4 ++++
>   3 files changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 843facf01b2d..5691b29acde3 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -418,13 +418,15 @@ needed.
>   Recovery
>   --------
>   
> -Current implementation defines three recovery methods, out of which, drivers
> +Current implementation defines four recovery methods, out of which, drivers
>   can use any one, multiple or none. Method(s) of choice will be sent in the
>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> -more side-effects. If driver is unsure about recovery or method is unknown
> -(like soft/hard system reboot, firmware flashing, physical device replacement
> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> -will be sent instead.
> +more side-effects. If recovery method is specific to vendor
> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> +specific documentation for the recovery procedure. As an example if the driver
> +is 'Xe' then the documentation for 'Device Wedging' of Xe driver needs to be
> +referred for the recovery procedure. If driver is unsure about recovery or
> +method is unknown, ``WEDGED=unknown`` will be sent instead.
>   
>   Userspace consumers can parse this event and attempt recovery as per the
>   following expectations.
> @@ -435,6 +437,7 @@ following expectations.
>       none            optional telemetry collection
>       rebind          unbind + bind driver
>       bus-reset       unbind + bus reset/re-enumeration + bind
> +    vendor-specific vendor specific recovery method
>       unknown         consumer policy
>       =============== ========================================
>   
> @@ -472,8 +475,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>   be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>   device of all user context beforehand and set the stage for a clean recovery.
>   
> -Example
> --------
> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
> +consumer to check the driver documentation and the usecase before attempting
> +a recovery.
> +
> +Example - rebind
> +----------------
>   
>   Udev rule::
>   
> @@ -491,6 +498,27 @@ Recovery script::
>       echo -n $DEVICE > $DRIVER/unbind
>       echo -n $DEVICE > $DRIVER/bind
>   
> +Example - vendor-specific
> +-------------------------
> +
> +Udev rule::
> +
> +    SUBSYSTEM=="drm", ENV{WEDGED}=="vendor-specific", DEVPATH=="*/drm/card[0-9]",
> +    RUN+="/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
> +
> +Recovery script::
> +
> +    #!/bin/sh
> +
> +    DEVPATH=$(readlink -f /sys/$1/device)
> +    DRIVERPATH=$(readlink -f $DEVPATH/driver)
> +    DRIVER=$(basename $DRIVERPATH)
> +
> +    if [ "$DRIVER" = "xe" ]; then
> +        # Refer XE documentation and check usecase and recovery procedure
> +    fi
> +
> +
>   Customization
>   -------------
>   
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cdd591b11488..0ac723a46a91 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   		return "rebind";
>   	case DRM_WEDGE_RECOVERY_BUS_RESET:
>   		return "bus-reset";
> +	case DRM_WEDGE_RECOVERY_VENDOR:
> +		return "vendor-specific";
>   	default:
>   		return NULL;
>   	}
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index a33aedd5e9ec..59fd3f4d5995 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -26,10 +26,14 @@ struct pci_controller;
>    * Recovery methods for wedged device in order of less to more side-effects.
>    * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>    * use any one, multiple (or'd) or none depending on their needs.
> + *
> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> + * details.
>    */
>   #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>   
>   /**
>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev

