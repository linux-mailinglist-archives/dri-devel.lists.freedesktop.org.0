Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3E8A3AFDD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 04:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B36C10E051;
	Wed, 19 Feb 2025 03:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekI5LxB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E947B10E011;
 Wed, 19 Feb 2025 03:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739934048; x=1771470048;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nYPQGttayaJKKAzGVDFIU1IqzlT2MOybgnZNuyGUnnE=;
 b=ekI5LxB4PEMaQgiteYAXJ901fyVPccU5xogjg3frH36LYd6WpPwKvFWv
 J6OTg0PvsLlCErxRjkDUBI6N51H0XA+2IvcK9BtO2zMQGj6evzW0Fz4fs
 IK+j8mdbKbCItNH6mqyzu2dJfMbt8AkhRjDYjEEfPI01qelqUiAhUAGyA
 /nDRZ4zG+IkoPzJheUz2ZGoGT3XX1S8xDu3LJl4iYFagPfNBK6sL0XnvY
 6kJb2tiha2gnpTsLSaFIEDrVj2yw1BhizZ/CSEclOAXCZGe5NcV5VwT4q
 GGOEWH/j9Kr3yvhTqKdfbXcYM2afWbKSzDnT6RuTvhC+KxCITN0zktRti w==;
X-CSE-ConnectionGUID: K+dsErfERSuXN59+9BcBEw==
X-CSE-MsgGUID: mCHdReuvRMu4pQPbS/8hOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43488296"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="43488296"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:00:47 -0800
X-CSE-ConnectionGUID: cXWarJydQraIzLNnI+Ifqw==
X-CSE-MsgGUID: HFQe17zOTRyAgYlWz5AKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119518155"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 19:00:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 19:00:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 19:00:46 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 19:00:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtFl5NM1AShpwaJzJO3G4qaj0lzi7yuAXDeloV+aABkd4nFcgpb6IrOlaeVmd9XxV4TcucHeC2JgSaMoSl4aDBsL4K/KGCsNmWHnGHWfP0WOoz1+tEQpC9oduOypoj7jn7l9V0wOiucNeXuuiCY0MAQG02fW5qQKuWRCDwn4vplVQQ4y9k00Ty0BfU7mVm12kwpg6tuKoeRqAAQSgUOW3sc4AseNyMHrHSQizBP/eUtqnADcz17JalFkuZdXz1rPMSip+uZHhtEsTWPfqFj2dVKB/Zxppebt4566MiC2BPk0gCF8Xt2Zp88Gub6zmDQLnqrz3j7Sh47JImtw0t/PIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51TOA0Uvf0j5vKSgNOJk6lIsrr2wDkAGmQmoQOsNmTo=;
 b=HaTH0i3jR0pzRg8T7hpit/euXgZI4aZnqeMvh+BPHxGWNV1883b59Ju3LbSv1hk15knftsgGZGrW+tPsnT8NM1POdEsbAW5MtuGtZLAf4Wa9EMb3LAEC5kZoFJA5ExfHN2rW7ng1wkMjKg/UE23XN7F4DZ8WNE7HlJCzipM1QSTZKsaJtfwizLHyl3JzAk6SzrqDJJQocRyrOmCD3dhz9iOSvjRxECrlN3MKF0mU+DLLZf9uZ4yCDyG7gczawZX5w/d06SnMw+JksepGZ1Xsz6M7vWlqJPuXzLaObTsMewEAR+MkJgHN0BSEhCjiaJZ2w5hwzkspIOB9ojsUqi6DHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 02:59:59 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 02:59:59 +0000
Message-ID: <91cb5b9b-84cc-4651-8d28-973650eb7c69@intel.com>
Date: Wed, 19 Feb 2025 08:29:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-28-matthew.brost@intel.com>
 <ee155ea0-e7ef-4a5e-b409-d08b62762e5c@intel.com>
 <Z7UBiYFn3oq9dhXN@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z7UBiYFn3oq9dhXN@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e2d967-aaf8-44b0-ddbf-08dd50917f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NitFOTJpM3d1VVJGYTBOaUtwYzdnNmhMemgrak9FRktLdHdaaGptamQ5dC9T?=
 =?utf-8?B?MUFBUDgrRzVWbTZkMWJtUFZxeUtKSDAwMXRoa3o0ZEovelN1Vmo2MGpoMkhv?=
 =?utf-8?B?UzhYRjBPdStNQzNkVmlMaU1nVUJ2clR0WlVsS0hCVXVTL2JLRkRBZ3J3RFJo?=
 =?utf-8?B?T0NlWnc5RTJ1eFczU1ZlUVB2VUdIL1UzQ3ovNC84ODJtay9ZQmxTNVhFcHF3?=
 =?utf-8?B?SVRYVmJRd3FHNVZDTEZWQjY3Sno1TmQyOFF2a2V4RnFDZjhLZkR0QW5sY09O?=
 =?utf-8?B?akR0NXlnb2xCekgxMDRPaDZVVDhoMDJBb2RySkdlSWQ3b1FEZllQejdlTStV?=
 =?utf-8?B?ZGhZR0ZnalMzZ2pkS3JsRVpDalAvNkQxWEZEdFd0Qk5hNno0OUl5dGplNWJv?=
 =?utf-8?B?dzdqOFFFL2ZHL3gxNXhNZk5VOGJVd1lUUVFaSmM4SlBVVmZvR3cyc0hJWVRx?=
 =?utf-8?B?WFJvdUQzL01qTWVtVzdIN2RjY1BMQWx3NlJOK2V5UitYQ0p4K1k2czRZSnd3?=
 =?utf-8?B?eThwc294ckN1a0pZellINUk0YVpHK0hWWHN1eXQzNjNqWjFmN25vOFJSZ3pX?=
 =?utf-8?B?NmRCdUpwYTByRGFEcTd0RkY3ZGJaNXNBeDBsYytZWXZ2SWtwQ2RoY3FoWHlr?=
 =?utf-8?B?OEJ0WVMwRG1ONFhNVEJ5Qm9uMEVtWEd1L0xnZHlYVmN6RjZzYzhYVzJ0YTJk?=
 =?utf-8?B?eEJjdXpGZ2RPQk9sbzhOWlFuMlg0dUJGQmRjTjlkZ0l0Vkk0dzdiclNCb1gx?=
 =?utf-8?B?bzhnTFViaTJoNkNWeFF2TDNCTExodnF4d3NFUXNWSVZkYlZVc3hSckZWUU9x?=
 =?utf-8?B?Z3lzOGU2Mk5Ib3hFY2ZjRHAyd0ZxdkRMWlVaL0lubGh1UWR6OHNkVTFPYmFw?=
 =?utf-8?B?YXI4YkZFSDV4aStyVnZwZmRIS28yenN4c2lTTEpJVTczRHN1YmgxTnRVbmZL?=
 =?utf-8?B?RWM2T2hIZHFpSzh1V1RTRFZmLzRJblFCMUxsSFhUaFZCRlN2ak4za3oyMFh2?=
 =?utf-8?B?SjNkdW1aaExsdkFsTFJ4QSt0b1BsMDgzMEZYSC9UWHovZVFyYWpWdzh5K25l?=
 =?utf-8?B?UUNqR3VjYUI2c3pDS3FRbk1NMmt4NEJiNGpKVkswUTBYSlI5cnVsWmMzTzNq?=
 =?utf-8?B?UzFRamU4dk9WUm1qenRmU2lxNno1RFQxVm9XMTdPTkxIdHpaNVUybkZoSUhl?=
 =?utf-8?B?YzBHS1J1STVJSWlkajN6YUtja3RnYzRQbDdqd0QrYVo4R2g0dWNVWDF3R0lU?=
 =?utf-8?B?bE9Oek8yajVtYUVoa0dIZWlPdHNEdlhIVVFGUEdvZlVkdmRVUTFjMm5jV3Rm?=
 =?utf-8?B?Q1NRbldpTVBjUUF3R1JvVjNiSCsyUU92eUZKWi9Scm5UK2NQUE1IQ2QzdjZi?=
 =?utf-8?B?NnhrWUROV0QvU3UyZkoxSDBCZ1Z1anlVUWE5SVdOa1I5OSsvNDFhZnVQVEtL?=
 =?utf-8?B?Z2ovWExEVzRKVXpKTWdBRG90S2VPcE45ZWpuZDhpT1Blck4vbkxZbDVCZUNC?=
 =?utf-8?B?RUNpYjdaVEpwZFpuUmtNSU9CUDBWWGVyTU5ybk51UGxXam5FOXhGVnh0aG9t?=
 =?utf-8?B?UUFqSEQyNTJ1NDNVaXhuQXJBLzQvTUJRaytua0I4ZFcxZDNhZVBIWTdWTzdx?=
 =?utf-8?B?Wkx0bkptTVVHYWJwS291TFUvY1YyMVRSSGJ6ZE16dDVCY2pTczZqZDRDV1FD?=
 =?utf-8?B?QnNHWHY4MlRLTkwrUllIY1VFL2FHYjlEN2tHVFpUSTNTenA0ZjJLdlF4dzdm?=
 =?utf-8?B?NGpJNzNoaTlMVHMzQjR2NGZ0S2JJK3paTGVJWW1XVkQ0dHFlcFhGR1ZUVDdN?=
 =?utf-8?B?b3hUQXBnOCtUVzc4Rmk3QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzRaS1Uzd005Z1MwTzFhU2FlRHNubzNzOHRid2JQR3dMY3k3K0dZMnVDbUV6?=
 =?utf-8?B?QTBTMStlbGdzamJBQzRsekh3bzJzQTBRY3Z5UE1lTEJONnBwQVJzL0M3K1Fl?=
 =?utf-8?B?ODU5ejQ1YkNzZitnN3h1ZXkyODMxR0crUkxxQzNUUnFXNlBEeklRWmZ3aFNh?=
 =?utf-8?B?TEpnY3FjaWRwdWFYZWxwdEsyZyswanpweDZ3RGFzTkloOGxPdnc4S21QY1Bj?=
 =?utf-8?B?UzU5eE56Vk1WNk8yeVhjMnBhRUZhbGs4aEhPSGhBUVZtLzViUWpNVkxCZkg3?=
 =?utf-8?B?RWlMUU5iaFQycm5icFkzRmJvalE0MVUrQ2pnT2VjL2pNQWcySnFxUW9QbGw3?=
 =?utf-8?B?S0s5TDVwK0pEMmRVdHFFTGhNNDlJRHJHbDl2dm9qcnpQTDQxa1h4aVpsUjQ1?=
 =?utf-8?B?YW1VMC9aUzJOUHFHOTJlVjV5dTZ0YVhQNytxQUVtM0VvUTZGVjRxQWxmYXBl?=
 =?utf-8?B?MytseUtzR1VtRlVGT2tXU20zYjdtMitLdndpazY1ZTZ5QmRnbWdSRUFWOGdP?=
 =?utf-8?B?b0ZkR2RWU2h4MzVMdGtkWWJLZFl5RGNlSytyOEc5MzVrNjNXSndmWTBHL0gx?=
 =?utf-8?B?UE53b0lrSzUxSkppbG5nY1lpVnlxRFEyWk44dXk2UWluSXppTGd1V1l0MTRH?=
 =?utf-8?B?OEN6MG5HZ0p5ZDQyV0pBd1g0QzkrZmZPdVRwR1VOM3QxbWI4NGNXYy8ycHMw?=
 =?utf-8?B?V1lFUHpCZjFxVll0aEFXU05lVllkS1R1R0xZellrMzMwTndJL0VCWmNnOXVr?=
 =?utf-8?B?NEFBU1ZCeGZQWFJCejcxVWxhakc2dndGTHEvVWhZUFd5M292MGZvYkdOVVd1?=
 =?utf-8?B?SGF3dkVpWDdwWUxDb0Jod2gyc29VTUFVZTVhVzZPWlZabzNyOVJaUmc1VTRp?=
 =?utf-8?B?SGVPTUVUTEVodUtJMFduTzd1cFBRZzk5WHIrRkhmcG9WSC9zcUszVGU3SUlV?=
 =?utf-8?B?bXllSUtoeEFiUUNIaTBkSjJhQUFPYmt5Zm5YNWI5VCs1NjBVb0pVR2lia0Q3?=
 =?utf-8?B?M0hQSXp5b2lKbTRMZTFnVmxxSzZ0SFJBNnk5NzV4WnZYbGJEN2ZwS1NocFoz?=
 =?utf-8?B?YitqbE9YQS9GczdJb3YxdnJDYkppZFZpTktISjdKUGw4YTJMTFFUQ3lVSG5p?=
 =?utf-8?B?WHY0MGY3YkE2MHIyNlpJQm5qQUJUYkMrVHJhQVkzaWxwdWJlL1NOVHVEVG1W?=
 =?utf-8?B?VFZYTDV6WW02OGhGdFVmNWVXdXBrSGdpQjVJY1FhV3BFaGNXZ0NWaFJqL0Rz?=
 =?utf-8?B?YWJyamtsdjFPNDJtcmhyQ3A0M3VmL2x5NVZzMExJVmZmTUV2ZHkvd2V5QlhV?=
 =?utf-8?B?Y3FKbGJJb2ZNcFlvUlVlSlU3Y1J2YnlhRHJPcW1CSWo3UFAyUWNRZmpHNW9w?=
 =?utf-8?B?SDFtWTRkZDRzaHZUUHZ0ZEt0aWVnWHpLWmxCb3lZMWRrUkNST2hwMDBRbG5K?=
 =?utf-8?B?QXZXcEFSeXB6a295UEI2azhUT3V5bldJR3BBampVUkp1L3BBWGQyem1zQUdM?=
 =?utf-8?B?N0hMcEZuWkNUWFZPLzEydzlxeEpyU2dRS29EVlMrdW8wdnM4ZmdmcURaNzVa?=
 =?utf-8?B?a3ViYXBreDMram9aL1czR1dmUW9qenc3d1NzNTBzWWxhU2FZMFdZSUJ6d0hi?=
 =?utf-8?B?U0ppMVVOdmYweDV0QzBlOHpXSTczbDBIMUhlYXRrTDNUbDd5Y1FqbHdFalNt?=
 =?utf-8?B?Q1dEaDIwR1JTbytENHJjRmM2Qk5OR0Z2aThFcjFiUUhJN0ZBaCs2TGtYTGVD?=
 =?utf-8?B?Q0sxSEJsMFFNcm00RjVXdlUrUm9SOXlkN056OFN3cUtqNGphdGh1YndzZ3lN?=
 =?utf-8?B?cHR6eEoybnBCek9lWXk3Q1BLdHluUE55UGpvYnZnbng0aG5mSFVNM0FuM2w2?=
 =?utf-8?B?d284ODlUZjUrRjRZRkRSTTNrVzB5cW9oVG5YUmY5bElYNzhIaTBlb0JTS0NQ?=
 =?utf-8?B?NWNrQndBQ3ppbThwVTFJYU5jTmNRRFBPWFQ0T1RRV3lXQnI5SWhGNllxZFdT?=
 =?utf-8?B?T2JIN3owRUN1cGc4VEt6ZTRpNCtYUVRBZGVMUHFPY3A1ZVFnSkg4VHJMUzN2?=
 =?utf-8?B?dlh4YTkvVHVmZWx1U01TVnVHTXRWMDRTdGtTMmorOGRmbVdEOG14ayt3c3FN?=
 =?utf-8?B?ZXAyYVhLQ1Awall6YjFUcXRPYmlLajdTYnNLTEhSREE2R3dWbjlyckJ2Nm1S?=
 =?utf-8?Q?oc+3oqDk1wuRYmxQAqpth3A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e2d967-aaf8-44b0-ddbf-08dd50917f3b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 02:59:59.4729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfUNftw8YoQa0bqOuUfitiL0AwU/4LFUTTS+OKY1ZuC0CtWNbyZmyMn0Z5dsLm70i9PE+VFWbKqg7B31B2Y/GPj+qHXseXNRdbRLbuth/dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
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



On 19-02-2025 03:24, Matthew Brost wrote:
> On Thu, Feb 13, 2025 at 11:58:27PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 13-02-2025 07:41, Matthew Brost wrote:
>>> Migration is implemented with range granularity, with VRAM backing being
>>> a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
>>> TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
>>> SVM range is migrated to SRAM, the TTM BO is destroyed).
>>>
>>> The design choice for using TTM BO for VRAM backing store, as opposed to
>>> direct buddy allocation, is as follows:
>>>
>>> - DRM buddy allocations are not at page granularity, offering no
>>>     advantage over a BO.
>>> - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
>>>     evict each other).
>>> - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
>>>     require a dma-resv.
>>> - Likely allocation size is 2M which makes of size of BO (872)
>>>     acceptable per allocation (872 / 2M == .0004158).
>>>
>>> With this, using TTM BO for VRAM backing store seems to be an obvious
>>> choice as it allows leveraging of the TTM eviction code.
>>>
>>> Current migration policy is migrate any SVM range greater than or equal
>>> to 64k once.
>>>
>>> [1] https://patchwork.freedesktop.org/series/133643/
>>>
>>> v2:
>>>    - Rebase on latest GPU SVM
>>>    - Retry page fault on get pages returning mixed allocation
>>>    - Use drm_gpusvm_devmem
>>> v3:
>>>    - Use new BO flags
>>>    - New range structure (Thomas)
>>>    - Hide migration behind Kconfig
>>>    - Kernel doc (Thomas)
>>>    - Use check_pages_threshold
>>> v4:
>>>    - Don't evict partial unmaps in garbage collector (Thomas)
>>>    - Use %pe to print errors (Thomas)
>>>    - Use %p to print pointers (Thomas)
>>> v5:
>>>    - Use range size helper (Thomas)
>>>    - Make BO external (Thomas)
>>>    - Set tile to NULL for BO creation (Thomas)
>>>    - Drop BO mirror flag (Thomas)
>>>    - Hold BO dma-resv lock across migration (Auld, Thomas)
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_svm.c | 111 ++++++++++++++++++++++++++++++++++--
>>>    drivers/gpu/drm/xe/xe_svm.h |   5 ++
>>>    2 files changed, 112 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>> index 0a78a838508c..2e1e0f31c1a8 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>> @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct xe_svm_range *range)
>>>    	return drm_gpusvm_range_end(&range->base);
>>>    }
>>> +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
>>> +{
>>> +	return drm_gpusvm_range_size(&range->base);
>>> +}
>>> +
>>>    static void *xe_svm_devm_owner(struct xe_device *xe)
>>>    {
>>>    	return xe;
>>> @@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
>>>    	return 0;
>>>    }
>>> -__maybe_unused
>>>    static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
>>>    	.devmem_release = xe_svm_devmem_release,
>>>    	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
>>> @@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>>>    	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
>>>    }
>>> +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>>> +{
>>> +	return &tile->mem.vram;
>>> +}
>>> +
>>> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>>> +				       struct xe_svm_range *range,
>>> +				       const struct drm_gpusvm_ctx *ctx)
>>> +{
>>> +	struct mm_struct *mm = vm->svm.gpusvm.mm;
>>> +	struct xe_vram_region *vr = tile_to_vr(tile);
>>> +	struct drm_buddy_block *block;
>>> +	struct list_head *blocks;
>>> +	struct xe_bo *bo;
>>> +	ktime_t end = 0;
>>> +	int err;
>>> +
>>> +	if (!mmget_not_zero(mm))
>>> +		return ERR_PTR(-EFAULT);
>>> +	mmap_read_lock(mm);
>>> +
>>> +retry:
>>> +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
>>> +				 xe_svm_range_size(range),
>>> +				 ttm_bo_type_device,
>>> +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
>>> +	if (IS_ERR(bo)) {
>>> +		err = PTR_ERR(bo);
>>> +		if (xe_vm_validate_should_retry(NULL, err, &end))
>>> +			goto retry;
>>> +		goto unlock;
>>> +	}
>>> +
>>> +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
>>> +			       vm->xe->drm.dev, mm,
>>> +			       &gpusvm_devmem_ops,
>>> +			       &tile->mem.vram.dpagemap,
>>> +			       xe_svm_range_size(range));
>>> +
>>> +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>>> +	list_for_each_entry(block, blocks, link)
>>> +		block->private = vr;
>>> +
>>> +	/*
>>> +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
>>> +	 * creation ref can be dropped upon CPU fault or unmap.
>>> +	 */
>>> +	xe_bo_get(bo);
>>> +
>>> +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
>>> +					   &bo->devmem_allocation, ctx);
>>> +	xe_bo_unlock(bo);
>>> +	if (err) {
>>> +		xe_bo_put(bo);	/* Local ref */
>>> +		xe_bo_put(bo);	/* Creation ref */
>>> +		bo = ERR_PTR(err);
>>> +	}
>>> +
>>> +unlock:
>>> +	mmap_read_unlock(mm);
>>> +	mmput(mm);
>>> +
>>> +	return bo;
>>> +}
>>> +
>>>    /**
>>>     * xe_svm_handle_pagefault() - SVM handle page fault
>>>     * @vm: The VM.
>>> @@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>>>     * @fault_addr: The GPU fault address.
>>>     * @atomic: The fault atomic access bit.
>>>     *
>>> - * Create GPU bindings for a SVM page fault.
>>> + * Create GPU bindings for a SVM page fault. Optionally migrate to device
>>> + * memory.
>>>     *
>>>     * Return: 0 on success, negative error code on error.
>>>     */
>>> @@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>>    			    struct xe_tile *tile, u64 fault_addr,
>>>    			    bool atomic)
>>>    {
>>> -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
>>> +	struct drm_gpusvm_ctx ctx = {
>>> +		.read_only = xe_vma_read_only(vma),
>>> +		.devmem_possible = IS_DGFX(vm->xe) &&
>>> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>>> +		.check_pages_threshold = IS_DGFX(vm->xe) &&
>>> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>>> +	};
>>>    	struct xe_svm_range *range;
>>>    	struct drm_gpusvm_range *r;
>>>    	struct drm_exec exec;
>>>    	struct dma_fence *fence;
>>> +	struct xe_bo *bo = NULL;
>>>    	ktime_t end = 0;
>>>    	int err;
>>> @@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>>    	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>>>    retry:
>>> +	xe_bo_put(bo);
>>> +	bo = NULL;
>>> +
>>>    	/* Always process UNMAPs first so view SVM ranges is current */
>>>    	err = xe_svm_garbage_collector(vm);
>>>    	if (err)
>>> @@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>>    	if (xe_svm_range_is_valid(range, tile))
>>>    		return 0;
>>> +	/* XXX: Add migration policy, for now migrate range once */
>>> +	if (!range->migrated && range->base.flags.migrate_devmem &&
>>> +	    xe_svm_range_size(range) >= SZ_64K) {
>>> +		range->migrated = true;
>>
>>
>> shouldn't this be set to true, only once xe_svm_alloc_vram is successfull ?
>> In case of bo alloc failure retry wont enter here.
>>
> 
> No. The point of this is try to migrate once to avoid a live lock case
> of concurrent CPU and GPU access. Once we have migration policy, I'd
> suspect memory marked as prefered VRAM only try once too. If memory is
> marked as VRAM only we'd retry to a limit and if reached kill the app.
> We can work of those details when that code lands. Until then, trying
> once seems reasonable.

I understand what we are trying to achieve here, and it functions well. 
However, my only concern is member name "migrated" gives the impression 
that it will be set to true only if the range has been successfully 
migrated to VRAM.

> 
> Matt
> 
>>> +
>>> +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
>>> +		if (IS_ERR(bo)) {
>>> +			drm_info(&vm->xe->drm,
>>> +				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %pe\n",
>>> +				 vm->usm.asid, bo);

This log is also misleading, we dont retry vram allocation in case of 
first failure.

>>> +			bo = NULL;
>>> +			goto retry;
>>> +		}
>>> +	}
>>> +
>>>    	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
>>> -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
>>> +	/* Corner where CPU mappings have changed */
>>> +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
>>> +		if (err == -EOPNOTSUPP)
>>> +			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>>> +		drm_info(&vm->xe->drm,
>>> +			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
>>> +			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>>>    		goto retry;
>>> +	}
>>>    	if (err)
>>>    		goto err_out;
>>> @@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>>    	dma_fence_put(fence);
>>>    err_out:
>>> +	xe_bo_put(bo);
>>>    	return err;
>>>    }
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>>> index 0fa525d34987..984a61651d9e 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.h
>>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>>> @@ -35,6 +35,11 @@ struct xe_svm_range {
>>>    	 * range. Protected by GPU SVM notifier lock.
>>>    	 */
>>>    	u8 tile_invalidated;
>>> +	/**
>>> +	 * @migrated: Range has been migrated to device memory, protected by
>>> +	 * GPU fault handler locking.

The range is not necessarily migrated to device memory if migrated is true.

>>> +	 */
>>> +	u8 migrated	:1;
>>>    };
>>>    int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
>>

