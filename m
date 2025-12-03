Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544EECA1A19
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 22:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCAD10E81E;
	Wed,  3 Dec 2025 21:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WD3jK8r9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB67110E815;
 Wed,  3 Dec 2025 21:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764796234; x=1796332234;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=quvxPjkuc49n5maI4CNw/ysIWK5htVzwpUZ9+jgdjLM=;
 b=WD3jK8r92JOfgivLueiI0MZSxiIx6m8rB+0rhxc5DCoQZD6j2NkwxCzj
 0hDNwEeym0vKRKumbWmismlGz+uprPS/9czC8Z8mBDaC0oOgbrQWwKXFm
 NxhjM4tVJVy9uWxDJqmoJPPPrFyzlEHWfPNudc+4qcP70xwwykEvpgraF
 w83ij9tTIIXfwYazt0L8tYRE1l4HJzg5d/vAud3AjeXkqNbornbzamGL0
 RcCW8/xmMp9aO2NPf0nMqWTbN4ZK6x9zHZM+SDQ0pqlnN9wqgIGsTgEQi
 /hyGD//mb184tAznkVm2o8WtknchXlBxISITns2ktvUSuPSDUTaOEAxDc A==;
X-CSE-ConnectionGUID: qr0bul44ReSTX3zWOHedUw==
X-CSE-MsgGUID: eqciTIVZQnOezi/zT8/kIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78273421"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="78273421"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:10:34 -0800
X-CSE-ConnectionGUID: CNq7fmOcTU6IFcKXYnpcZw==
X-CSE-MsgGUID: FL9DArozTQGSSu/nHqL40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="193871592"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:10:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 13:10:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 13:10:32 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 13:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMKsibRmIKYSx44ppKkt05EtpdSyOh2M3ox9LU00PRsMX3CibzF5mr3s7Bl40BeAAZ2lkhz4EGwmDqtbz0qPxnoXbAa+MujSNyoAySijtUDXYsD9wSCjSXPE8BZa/KUNdqia3vB91C3A6OcsMcUrmBow9RbHu9sVM9jRnNMe2YZYJ8XiYtaZkIqj2sznsnjAX4o+NHDTCH6y3tJaWWgzM0HVOaRfLNYW0cMCkup6InjutdqCpjG/8SYPIMldHYDxJdJOINPewdpKN5nIpZwJLOdLdDQ43llK4hw//Evwu0G+gXE4mTiMdvhDTqkFfzPc8lPEzRlNpYhSxjYetNfP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uppblGPfKafNNy7KZgTq7i5sYQ3m+JPj+TCtFU7vgBk=;
 b=GKJdS5ZdElI5vuXQ3pVIXWNGN1UO0u6eAQ68iPiF99j4idP9ZPC/SVfuabpWJuWMf98x3TroPy8VKoObliOPU1HK8wc/DtEX2KZBFCgdCH3HhyVIrZKTgQLGBUp2xERRcsZc5dQtjNvN+nBTmtIlbkIJpOIxckKLkfYq02Oilgo1cabFqxmWS3w/JNssy1Jj1588tF9R8zr5zx6/42DRfN0Vdb0W+HQQTEu0dBRNNnY56yWMySDFJo6hGkbkUJM1GMYcW6+KtD0g9zZF80lRIT8mRLUKXhb5Dd+O53gvGOat++rm4kQwCNcVQKMvr3Lk1h5gF7V/KU4HJnUR636aFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 21:10:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 21:10:29 +0000
Date: Wed, 3 Dec 2025 13:10:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v7 1/9] drm/sched: Add several job helpers to avoid
 drivers touching scheduler state
Message-ID: <aTCnQjLY1WzmZHR8@lstrano-desk.jf.intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-2-matthew.brost@intel.com>
 <0b1b4bbf0b49832db2c1e12477c5af55780f39df.camel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b1b4bbf0b49832db2c1e12477c5af55780f39df.camel@redhat.com>
X-ClientProxiedBy: MW4PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:303:8e::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a8d957-dc6b-4669-27a1-08de32b06316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFJ3QnRlMnJKWnk2cWN0OU5mZ3E2aFZhdi9pZGJQcG9KZkdWckl2RFIyd0ti?=
 =?utf-8?B?TVhOeFdCVmRxM1l6VmVmZDE2WjdUenc4SWllU2ppcytKYzVZb1I3S0RBeGNN?=
 =?utf-8?B?WFJoR2YxT0ZDazJocTl2TXlMcG1rTFRwMnMxZ0RQcWlTaUoxaFJJaXNsMjFp?=
 =?utf-8?B?UFZHSVB5NllyQVJDZGVlRC9yTkViM0g4TE1GMklYanNaajJxQUZUZTVhc25K?=
 =?utf-8?B?UmlhN0YreDVzYktPZVlrWUVjSTN3WDJzdkJLSFFGdHd1eEhXMkF0eUdsSTR1?=
 =?utf-8?B?eTBEVEx1Uk1xUzQxVURudU5mTUEvbFdFRWV0cE9CVGFlM0VWSkNoN3NlRjRi?=
 =?utf-8?B?VVRORndGM2NzWW81b0VsbGJleEd6V20vRzlKWXdMcTNvNHk0UVY3V2IzVUJa?=
 =?utf-8?B?dFljNk9aQzE4RFFVbnpZYUFkRlNjTStLVllNbjVzcGZGR2gvOTZyRks4dVN3?=
 =?utf-8?B?NHlQMjV5RWo1T0NJc091RC9lNkQ1UWcrZnBRUEk2eml5WkZ3WmpZalYvaXkr?=
 =?utf-8?B?QmNmZmpIdzk2M0QvSTY4aEhPd3pRYWFRZUx1dTRFMEluZDRRakFkenZ1eG5z?=
 =?utf-8?B?NFA5L3NEZk1PWC9zdm5wbE9mZ0xTWTZjMmQzSWExcFBDUjU5S21wTXorSXU2?=
 =?utf-8?B?ZnZhOVhzemNXY2RpekpzZHg4UGZSSUsreG5ZZlNMMGpWdGQ2YmVJNHdHRm1S?=
 =?utf-8?B?SGZxOHBMb2FIUUlBblRwU01GOHI3K2ZIWjhCZGlvanJGK2oxTHhueDRCbDVt?=
 =?utf-8?B?NElLZzF6ckFZeHM0KzUwL3lqSVJZUE5iL0FHZWhnMDhVZnV3UWxFZTVUZVVp?=
 =?utf-8?B?Q1ZxbVg5cHlwcFhHQXBLRUwzM0luTitBNGF2Wkk2aFFmeVZoQzRFbEpiT0lr?=
 =?utf-8?B?OXFWcllSdi9JVnRKR1Y0Nmtxak9ueVVpTFgwVzdHSWJBbXB1N1duQkJRMjdF?=
 =?utf-8?B?bEVET2plZ0ZPNkdpWG5CSFB2YTdlTW1pODc5ZzZSMmowUWhaNWNPVVdOcjVS?=
 =?utf-8?B?WUVud1k1bkhCdjJXaU9BK2VHckNKcXp3S3A4TWlzNFVtbWxYaU1xQXl1MTVh?=
 =?utf-8?B?c0tZTHFPazI5SHFYYXlSdXIycVV5SFM2enl5RnRHa2dMNlJUUTQzNlVJTks3?=
 =?utf-8?B?Y21aV0pPcGptMVFEdVpXczZlQnpHeXRzYjB0YTR3UXpkcjU2OFJrNVdrbkov?=
 =?utf-8?B?ZkpoTEpGaENjOVA3elZmL09pOFNEVUJLSkZFQTJKdElkajJrK2ZWTDdULy9B?=
 =?utf-8?B?RFNidy9MQWdGQ0Z4ZzQ5c2dEa0dQMGVwQWwvdDg1eVc4OGQ4U1ZNeTRFQWtN?=
 =?utf-8?B?bjcvVXFIYVlhTE1HU3Jkcms1Ym51WElpYk5XYjhobHY1b3B3bkFuUVlJbzRv?=
 =?utf-8?B?MW1lZksvc0pvQjAzclA1bTc1RlEyRFB5bGVvcElIc3hOQks1UjJDOFdnU1hh?=
 =?utf-8?B?VXJtQ1JwM1czS2hOcGx3SXF1N0JVVlRuVmVNT0FLL3E0SDB4b2NRRVo0UXFE?=
 =?utf-8?B?NnFhUkV4b2R5dzZuS0hyek1jUDkxUDJ4K2Iza3k1dkp0c0tqbnh2NUtqc1NM?=
 =?utf-8?B?RmpnUnM0VnBIRFg2bUxsUDV2TG9sU1V0QVJUVGptTkd0dVFjWGRodjFBQzZJ?=
 =?utf-8?B?SndQdzliV3pqc24wcnJXU0o1V2d2SlA2ODdZaG1FSnNzSG1OTWtCTy84anlP?=
 =?utf-8?B?SkNnUkl2cm5Hd3pRNmpsQWpGRi9pOTdVZ0NOVW1PRTlGVGFKOTYxV0tOVGc2?=
 =?utf-8?B?WFhrenVLemRYb3UzK0dWNHFuRTJrVmo4Q3JZNS9tVnhuMndYVFZCd3hlYnZL?=
 =?utf-8?B?ZlBvcDhHM09FZDF5Njd1ZDRWOEFZbzEydG9BR0tmSTltZ2s3ZDl0dHllMDJv?=
 =?utf-8?B?Um4vNG1QNnd3Yk1zTmZ1RnFEVkRxaFJLeEhBRTBkVFlZTDl3QndMT0dnMUQx?=
 =?utf-8?Q?Dr5fUd9hSWxleYFgqHz2ZDXf3yOlN3eg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUp3VG5TZEJBQnRHVEJFOVk4RkpiamtGT0Mwc3RuOUxIdlZxZFRYWDVVMWk2?=
 =?utf-8?B?dm5SYUlXcTE0a1ZraUtzaFZDWmNVcU14Mk9aMVlJRTFGR0tOUmt1ZVhMU1h5?=
 =?utf-8?B?MWcxQjArQnFDcUM2dHdXQmNwMWZZc1RCY0ljSXA1b3R5Nm9YN1VXMHplNjlK?=
 =?utf-8?B?YXVPMWUwNlNxQVRrSnorN3grSnl2Zzc1bFMwQ0F0ajF4bjZidnFGVTQ3Mkg0?=
 =?utf-8?B?TmpYZlRBcGNjR2VtWlRQVXlsb2ZpWjVSa3QwSWtHNkoxNVptU1M1Vnk4bkRh?=
 =?utf-8?B?TlZXWTRKdGdOOExSSTV1SlY5dnZOWGptKzBaSS9tZzdMNG1HMWR1eG9FQVdT?=
 =?utf-8?B?TmdheDdvTUlWYi9pWDFXc28rN3BJSXc0QjY1dmVWSzd1bFFpQXRwODBabFpk?=
 =?utf-8?B?VHhYNVNrUmE1cnJvemVvK3VVS1A0dWlONDBhQlVTOFMwTm10WHY0QnFZenAw?=
 =?utf-8?B?OTlQa2lWb0FNS21nUC9Pa29BQkxldyt6RW5GeDUrYTRDZXJVUlljQjZsRlFX?=
 =?utf-8?B?QVpYLzlzZWp2bjIzWEQyV2phNE1sdkpsNnJXUFVoQlF1Uk9LdEJ4QzRBamdZ?=
 =?utf-8?B?TlQ5WENSRm1IVFhJSG94Umw1RnlPMXVUM21kZXFBR0hDbFE2S0wzZmxtbUZ5?=
 =?utf-8?B?SkhVTWhQak1mRlQyQnV0bkwyZDFTVkMyNDJxMDl3SE96TGNSV0NSeXZvVWdV?=
 =?utf-8?B?bkNPYkQ1eTJrak5RWDFoeWtLTkFaMEJFaFJ2aytvRVpQMXpDVGdrQVV5MERP?=
 =?utf-8?B?UUVHbENQWld2bHYwV2Ivb2xCd0FwVGh4SFBhZE1vRUlSb0hLL0xBczlZTEZ2?=
 =?utf-8?B?TnpkSzhDNWpwaXE5b3pBOS9VZkJwZlhkSUR2MndkMSt0ZHg5dWNuZmhvNThi?=
 =?utf-8?B?TEJyaXMwcnlNekFBS3VxbUlNNXJJSGgwbXZ1Nm5Mc3dwSUx3RkJVWTF2MXU4?=
 =?utf-8?B?NDNyR2wyNzhnOGV3ZVNOVEpEcUNtSkhjUW1ucUNITnRkeTdmaStFK1g5Vmwv?=
 =?utf-8?B?MHlONlRvMVN1amtSa1gwNldTc2JTVDVlZm5RTllkMjNZV0JSWURmOEVTOTY1?=
 =?utf-8?B?UVo2SGd3aWo1czNnNnJKM01scjNmNDY5bjRrQkJYQzdGdk1FRXBGRWRZNWVz?=
 =?utf-8?B?YW5tRFRma2xoZC9YY0FlcERTVDQwQkR2WmQzRGZqdDBXZE50czNkd3NQb3lZ?=
 =?utf-8?B?TUVMb2Q3NTRtVkdaNVR2Z00zTjR5cFBLY3dZdGlIQ2xxdFBBUGVaRUUzMVFa?=
 =?utf-8?B?K2RYSDVvdDNUaCtvODBqN1dhWTg0MXljUlMrY0dhN1VwRjR6Y3RSVHBUZHVV?=
 =?utf-8?B?Z2FzdVMyOHF4ampzS0VTY3htVmhtWVdwcm4wVnRPbHc2V25LSjB0eDJuK1V2?=
 =?utf-8?B?TWhtcjhBUWdNRFE4K3I1cG5VYXpNaWpWM3RVenA2c0l0REdqZHA2LzdoZ2dJ?=
 =?utf-8?B?eTNtbndVY0wyZ01WWllTLy8vc1Q3cU8vQUJGdUI2ZkdpcGZaVFVmSjV2RWRI?=
 =?utf-8?B?SjJHVEtPTXBHNFkzeVpsSHBZblhwdm9XdE9aeUEvSWVLU1JOOFNURHBCT3By?=
 =?utf-8?B?WmVmRVJWbU1CakRLbDU5V1MyS2RZVDNJMEd5Q0t4VWhWdTlteldPcUk0eFph?=
 =?utf-8?B?a2JSdk95bGhYVXN4M0M3UVdYMzVjSXgzSk1TV1hib0FiSnFCUHNjYzBMNjJ3?=
 =?utf-8?B?Qkh0STJaL2JTMWFqRG1tamJxWkptZVZBSm9WeWQxQTYrQ1l6UXZLcElRZGRW?=
 =?utf-8?B?WWJjclNJYklCVC9BQmpPNHhqTEtHalNTbFQwd0x0Q3Y5Vnc5eVVKRXhtUWNx?=
 =?utf-8?B?QjNMUmhONE1aT004aC81R3hHT2Z1NjY0ZnZWK2hFb25KRlFXbFk4TmV4MFg2?=
 =?utf-8?B?U1JLb1hEK0RRSjJRMjlhUkN3a2JDakJibjl3azc3QlF3ZlpWWnBUS3hVM2wy?=
 =?utf-8?B?d1FGb1dCT0xFU29yeTVZdlBlTm5aS1h4bEJoa21McGo5VmZITU5wbVl2bmVu?=
 =?utf-8?B?RWl5ejFWNDNpOFJLZFNBbXBRQ0xycE9NV2xvSEJudzFRdjJ3bzZCOW9VV1VT?=
 =?utf-8?B?QytjOHVDaXh5N2lPdWV4bnZUVkhnOHRscWF4ZDJtRmNmR1RLYlVnTk9OcFlt?=
 =?utf-8?B?eWlKQ3BGZ3lER094UElWeWNjM1MwYVJBeGtrOUtLVmMwWUUxYmFTOXNkeHRI?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a8d957-dc6b-4669-27a1-08de32b06316
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 21:10:29.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzCZHUKwRqgvav0Rm41xJ8Xpjw5tWrmtHQ9tlufI4MrIfO6QsSJNsJ5dO++l+JJGY354+Wsd6Zwi5hpjK510xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
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

On Wed, Dec 03, 2025 at 09:56:45AM +0100, Philipp Stanner wrote:
> +Cc Christian, Alex, Danilo
> 
> 
> On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> > Add helpers to see if scheduler is stopped and a jobs signaled state.
> > Expected to be used driver side on recovery and debug flows.
> 
> First, thanks for working on this.
> 
> This is a big and significant change because it moves towards ending
> the 10-year practice of accessing internal locks etc. – I think this
> should have a long(er) and detailed commit message aka "In the past
> drivers used to … this must end because … to do so we need to provide
> those new functions: …"
> 

Sure, let me add that.

> > 
> > v4:
> >  - Reorder patch to first in series (Niranjana)
> >  - Also check parent fence for signaling (Niranjana)
> 
> "We" mostly agreed of not adding changelogs to commit messages anymore
> and either have them in the cover letter or in the patche's comment
> section below ---
> The commit changelog comments are not canonical in the kernel and don't
> provide any value IMO.
> 

In Xe we typically keep these, right or wrong? Also if this is below
---, if I checkouk a mbox and apply it then next time I send the patch
change log is lost unless I add it back in. Maybe there is a git am
option so that doesn't happen? Anyways, I'll fix this up in the next
rev.

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c |  4 ++--
> >  include/drm/gpu_scheduler.h            | 32 ++++++++++++++++++++++++++
> >  2 files changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 1d4f1b822e7b..cf40c18ab433 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -344,7 +344,7 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> >   */
> >  static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> >  {
> > -	if (!READ_ONCE(sched->pause_submit))
> > +	if (!drm_sched_is_stopped(sched))
> >  		queue_work(sched->submit_wq, &sched->work_run_job);
> >  }
> >  
> > @@ -354,7 +354,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> >   */
> >  static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> >  {
> > -	if (!READ_ONCE(sched->pause_submit))
> > +	if (!drm_sched_is_stopped(sched))
> >  		queue_work(sched->submit_wq, &sched->work_free_job);
> >  }
> >  
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index fb88301b3c45..385bf34e76fe 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -698,4 +698,36 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  				   struct drm_gpu_scheduler **sched_list,
> >  				   unsigned int num_sched_list);
> >  
> > +/* Inlines */

This file has surplus comments, so just followed the style. See
'Scheduler operations' and "Jobs' in this header. But can remove.

> 
> Surplus comment, everyone immediately sees by the keyword that the
> functions are inline.
> 
> But why do you want to provide them here instead of in sched_main.c in
> the first place?

They are small functions so made them inlines but can move sched_main.c
if needed. The iterator in the following patch needs to be in header
though.

> 
> 
> > +
> > +/**
> > + * drm_sched_is_stopped() - DRM is stopped
> 
> Well no, I doubt the entire DRM subsystem is stopped ;)
> 
> "Checks whether drm_sched is stopped"
> 

Sure.

> > + * @sched: DRM scheduler
> > + *
> > + * Return: True if sched is stopped, False otherwise
> > + */
> > +static inline bool drm_sched_is_stopped(struct drm_gpu_scheduler *sched)
> > +{
> > +	return READ_ONCE(sched->pause_submit);
> 
> I am by the way suspecting since a long time
> 

?

> > +}
> > +
> > +/**
> > + * drm_sched_job_is_signaled() - DRM scheduler job is signaled
> > + * @job: DRM scheduler job
> > + *
> > + * Determine if DRM scheduler job is signaled. DRM scheduler should be stopped
> > + * to obtain a stable snapshot of state. Both parent fence (hardware fence) and
> > + * finished fence (software fence) are check to determine signaling state.
> 
> s/check/checked
>

+1
 
> I can roughly understand why you need the start/stop checkers for your
> list iterator, but what is this function's purpose? The commit message
> should explain that.
> 

Sure can adjust the commit message.

> Do you need them in Xe? Do all drivers need them?
> 

I think Xe question in answered in patch #4. Unsure on other driver.

> I think it's very cool that you provide this series and are working on
> all that, but at XDC I think the important point was that we determined
> that AMD and Intel basically do the same trick for GPU resets.
> 
> So our desire was not only to prevent folks from accessing the
> scheduler's internals, but, ideally, also provide a well documented,
> centralized and canonical mechanisms to do GPU resets.

See my reply in patch #4. I believe GPU resets could largely be generic.
However, my driver’s VF migration restore use case also calls run_job
again, which is a vendor-specific flow. So I’d prefer to keep that part
on the driver side and just use the functions provided in the first two
patches of this series to avoid touching the internals of the scheduler.
Eventually, I might push some of the logic from my custom function into
my run_job callback, but at the moment the ROI on that is quite low—and
I’m not convinced this can be made completely generic.

> 
> So I think this drm/sched code must be discussed with AMD and we should
> see whether it would be sufficient for them, too. And if yes, we need
> to properly document that new way of GPU resets and tell users what
> those functions are for. The docstrings so far just highlight that
> those functions exist and how they are used, but not *why* they exist.
> 

Again, I really doubt that everything related to GPU resets and
resubmission can be made generic. This series is about providing the
interfaces to do these things and doing so safely (e.g., not walking the
pending job list while the scheduler is running, etc.).

> > + *
> > + * Return: True if job is signaled, False otherwise
> 
> True and False should be lower case I think. At least I've never seen
> them upper case in docstrings so far?
> 

That's typically how we type this in Xe but this is a bikeshed. Can
change if you like.

Matt

> 
> P.
> 
> > + */
> > +static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
> > +{
> > +	struct drm_sched_fence *s_fence = job->s_fence;
> > +
> > +	WARN_ON(!drm_sched_is_stopped(job->sched));
> > +	return (s_fence->parent && dma_fence_is_signaled(s_fence->parent)) ||
> > +		dma_fence_is_signaled(&s_fence->finished);
> > +}
> > +
> >  #endif
> 
