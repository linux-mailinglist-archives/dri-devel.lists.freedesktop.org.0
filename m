Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15BA242E9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 19:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDB310E41B;
	Fri, 31 Jan 2025 18:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOxTNDwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA67810E41B;
 Fri, 31 Jan 2025 18:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738349094; x=1769885094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tLog0box0NndzyJK6E3mR7m/EKekjOawg7EJFjRAhZs=;
 b=VOxTNDwhSenZfiZ20n3nvgKjf5ccdfcub8+GfACLo8x6m6T4aXhUS+vI
 rIUoBQeiyCEqAaTY1vRFE05LaWQVgvBh/bMrjCV3/BwVhXAp2BQg6YIbE
 Hk/iRIuhcd02tCO62UMEvBJZdB0iE/3XkFKWh/OnV9zQIvw3iflQdYkOD
 8wW5tqgAfhmxB5L0KiA80EhVmahlrZxW6CrHM+OprwpmpcNAcV7oTkaDs
 10caVqoVE+fDf8qpfSYaqh+Wd/qqtWl1MBJiz4xsa1G4Y/FrL3OfmJrhl
 rktpiG3jEi9MYddQkstKHv+0v/DbD3jQY6oE8MyGsPza8w5ciEYcq2Nef A==;
X-CSE-ConnectionGUID: XMtADgUFTqqg+F7LeFSZjg==
X-CSE-MsgGUID: fe9jEIkaT8iJZckTqGbtOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="50310016"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="50310016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 10:44:48 -0800
X-CSE-ConnectionGUID: WweaBwuNTCGYAW+RjslqQA==
X-CSE-MsgGUID: 1Zo59lbnRbKeG3iuFTvrYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132954718"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 10:44:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 10:44:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 10:44:43 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 10:44:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1Mr8P/q1xCH2Tu023Gr0TZwWOFVs14WBc2Ovdm3JuCjUjfrh7f2hgFS9V8Uqp48nu4qpfyXhIjZRZdJpSiktynaVhp7RBuaX1cl2w8bmwZcQ/EhprAzIVsln29b9TbyAq1+St5SZR2beHLLc/TutnBsY802qKg1115G08fLixnNL+FhtpXNOoj+9PhdTxl8LJuL8t/h8q65xlnp2ZcxjjUpTruRYyWTcZwsXm/qKSYpW/HpBeMCC3nCMeBKOV7HgeNQKtBZM61dlt7SbSi4K4AJho1y5k+zs/HsbzZBHwETP0swTMw1S1CiWbxDkAQqtkpZs+1CTXuFXFlWmjTBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLog0box0NndzyJK6E3mR7m/EKekjOawg7EJFjRAhZs=;
 b=TtVYnZRgU3CEL9cKH8aDUhghTIvfbn331nYiT5BIPXmGkDF56wmxSUUOnRiC8cAJUHb9h65OwkyfI7cydgpzm3pSCDxSIRQo4Z/OA2rZFDorK7gtWvIMYWww+t+n5X6NKAZnePATCGvv03wjoOncWWm4BsMKIS76csTN5kBEOVbZTLCjtiUaI32iHvZQVkn7za4JOO4PeyRm8h7pPxdm2LhOjyvpbBYhnS/Ye1JCRP1aL9J3egTlaIpM2wV5AArd+9ZoD7CWmPT3lULtbj+nKChEVwTnj43+LNb6+hqsHvc46UxAQWheJuh/NnRDV4E5y4Z7AZfEgqYbyaQ5Z5qn+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4868.namprd11.prod.outlook.com (2603:10b6:303:90::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.23; Fri, 31 Jan 2025 18:44:00 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 18:44:00 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v6 1/6] drm/xe/guc: Rename __guc_capture_parsed_output
Thread-Topic: [PATCH v6 1/6] drm/xe/guc: Rename __guc_capture_parsed_output
Thread-Index: AQHbcbOiC+Jk7a13WUGtJMiYai19Y7Mv650AgAFRKAA=
Date: Fri, 31 Jan 2025 18:44:00 +0000
Message-ID: <a6affbc02d3b46296bf7d36877794eb377c42994.camel@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
 <20250128183653.4027915-2-alan.previn.teres.alexis@intel.com>
 <Z5v_GhV2xJYZB3mw@intel.com>
In-Reply-To: <Z5v_GhV2xJYZB3mw@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4868:EE_
x-ms-office365-filtering-correlation-id: 088340e0-b40d-4cdc-6111-08dd42273a18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bm9xZ05rTW44MC91ek1lbkU5VVZpelhqT2NwK3YwcE5vdG5jUitSZ3lBN01W?=
 =?utf-8?B?NTBrZkJBZFF1S2tjYWZ0MGZFd1RNOVdWRDZKbVhYb1EwbE11ZjhZa1dYQVlJ?=
 =?utf-8?B?U2xHSmx4N25SMDFwTHFzeUk2SWFMbnB5SHlyNlZDcmlvbk9GaVlVWHhWUkwv?=
 =?utf-8?B?ekVBUWVjK1pFajU1UTJHTW9pTmoxMmpUUnRIMmhJNFZTWWdBRnh5aGN2ZFhQ?=
 =?utf-8?B?QklpeWxaRjA1SjlBY2Y3TnJxVVAzL3lMQ21qa2dvendodUxQbUJtQU50Rzg2?=
 =?utf-8?B?SEtTNGdyaHpQVjN1bExVaDVHZ3FaWVlLMTFCSUZJK2lYS2lURXRkc0hqa0N3?=
 =?utf-8?B?U094OTMyS2QwUEh3MCt1N3A1dWwxaUVudGJOVVptSWFqZVZBbGRGOFhEbEJx?=
 =?utf-8?B?bC8zZmdnRXlWSFlMaklFaStxaXBkM0ZXU3JNVmtwaGZDR0lmNjFRNGtLdXp6?=
 =?utf-8?B?RWxwR2lCbXl6NFlFaXNzSzRWdDVIQWhlalpOZk9qckQ4RjROaEVYS081dVpa?=
 =?utf-8?B?c1JrL3VJYmZYbnFxL1o5VDA0a0JUSk9RTUtJcjdYT0V3ZFJsaklFQ2ljVnhM?=
 =?utf-8?B?bFdMRVpRMEFTSmhndlUvY2dKd054UnRXdFBRYjltdTdYeUlTZzZUMjFjUEph?=
 =?utf-8?B?WjNFV29BWVVFeVFRWm10cnlnU2NIWXkzNlZ3bWl4N2I5VWxkSUNEOE53M2Jl?=
 =?utf-8?B?RmhCR2hLdE41dXcyeGlFSnZHOTFiMXV5ZWV3T2ZIT0JzeDVBbjdvcHZJVGd1?=
 =?utf-8?B?dG56azRub1dwS0VudjRINC93RG5pL0dzcVE0Z2VQdnpQSzk2TTZWd0NoWlBC?=
 =?utf-8?B?aFk2bG9OS2MyOENBNGtXbE05SlFOZFdXQUh4TFkzczBvemVXR2l0NGxGeS9N?=
 =?utf-8?B?b25xUDRaSWpOS1NjbWgwOW50Wmxja0pFRHJzUEdKNWNsc3hLcVZQbVJZZTlj?=
 =?utf-8?B?a21DTXpjOTdpcm51dHIzaW9MbW5Cek9mSXR5Mm9RRHJFeXprbEd6YkNnejh0?=
 =?utf-8?B?YnhxYTgwdWFwK1FsdTBpQVJ6cVdXRkgrTFhTTmxDRU84RzlVemozSGUrcHRQ?=
 =?utf-8?B?cHlwWVRTWjJHZGlZdkQ4ckx2ZTllQzJ5cUJlYjduSHRvWS9RL1VlUmkvaXVI?=
 =?utf-8?B?OW5CUmFZc0EwcDNjb0NRSUExTzNZUWJ4NnR2UXhqL2RoWmcvaWxGZW5qdzVI?=
 =?utf-8?B?Z3RzTW5rc3RkYzFVODMzQWRaWWM5NTc0dko5U3MwelFQNHNiSzkrN1A0cXN6?=
 =?utf-8?B?V3lHTkdKVFdqUGV5UG5QVHFlNk5rYWRPMC9FTjh2a1FzQWFxMU5YMnJkVFNa?=
 =?utf-8?B?T1k1ZkgvN0NJMkdlVE4xbWtSTjBBT0p2bUhFS2tEMnRJcFRoNXVXM0djWHF3?=
 =?utf-8?B?NDRDTm5JYWNWV1MvSFBwaDkxakJwaFVSOFE0WmxwMzZzQWVzQVA0TTBBbVVM?=
 =?utf-8?B?YlF6MUM4dStZWGROOFladmpIUEJjenBvZlpxTUJmNGE3bjRuRW5raE50QUhD?=
 =?utf-8?B?OVhHc3JCS3FJdmFmWmxkaGVCNjhsZjJjeWtsVld6SUNOQlVVdmpUS3BZVDFG?=
 =?utf-8?B?U1RpdTBLU3NaWVNrTU1ybVNvMG03MTVDRHRKalFOZVlRZ283NFRjWGkrckkv?=
 =?utf-8?B?ZmI3VXh5S09pS3hzYnJxMmxOSkY4YVVaN1JuZ2VQTmVQL0VYMjlYb1hkMzdh?=
 =?utf-8?B?NExndytiOUtqSThLL243aG8wclQzVldISzZLMkx5SlEzRTkrRnpaUjU5TGdj?=
 =?utf-8?B?UzdyOFRINVV6c3lVM0FHZEx1VTloMkNJTHAyK3k1UFBqbW1JNmpPVDFUdEh2?=
 =?utf-8?B?T0drbXdoeHdGQ1gzMFhVaFRuOVRxSzJJQkluU3ZjbWpjLzZFWE1uUitSZWs4?=
 =?utf-8?B?TG1Tc1cvdmhhVDlTQnA0RTFuSU90ZXh3K2hORVBlZjhHYWVRK2J0SUpVRGtm?=
 =?utf-8?Q?0vmXuF+1L7CDDWcgrKp86C/VxvXflrY6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEFPYjlYdmMyTk1oUnllclhuZGI4bGRYcGpYNDFsYnlteG1RMklEb2lVbmwx?=
 =?utf-8?B?MlBSVUxiRm9RcG1qZXlkeUQ4c1VPOUVxWGlUSXlUMGVJbk5VWXJ2cjZTcUpM?=
 =?utf-8?B?bnV2ek9PVlpKejdJMDZMeXFvb0hraTNiNjMwM1pLcUp1MXVUS2IrZG1zdExr?=
 =?utf-8?B?djZEUXB0Rnd4bzgzQkpIU053Mmx5RC9nd25Pby8rR1F2cU1YMTRqc2p4VmtV?=
 =?utf-8?B?WU5wOCtEK1dhTHhDWFZVUXJIVjY4am1CRWRqT0JBTmRyNjBMdkwxZ09kNFBp?=
 =?utf-8?B?M3piMThJbHdMdVNrUVBTTnhtZ1R3TjVpWUhkdUxBZk1LWVdZdGFLV1FGL2pW?=
 =?utf-8?B?aWt3VmRvRUo1ZXRiRGJkNnlwMlJNejFsNWw2SERXVjlRaFhydFNOY0F2dWJD?=
 =?utf-8?B?VkFPZGY1ZzRGbUdTVTN1Z1JkcFVUUEdSUDRoQ0RvNlRHN0l6MVNJTGVRWDhZ?=
 =?utf-8?B?d2gxVkZBVU9CZlZIOHVuK0xsd3lwZVFxT0kxUjNPc1REM1hSUkh3NWMxMWxE?=
 =?utf-8?B?WTZhTlp2RHpjenM5allPQjZDbngyYnZoZWVYUzN0b213ZHhoWW1jQURiaThk?=
 =?utf-8?B?bE44dzJjd2h1eWhyL1FyNS9ydHIrUVptYnpGeXYweWRIeFI2TUVMS3lHUEFZ?=
 =?utf-8?B?OU1ySmk0d28rQjJJZVZLK2hvbHRXUGU1d1BhZm1iaWZtSktVN3UvSUVzbXBk?=
 =?utf-8?B?Y2RteENDUDJlTUpzd3pndmtwWXdDZytDa0RPNFlBeHc2M09pMmZKMGhGRkM4?=
 =?utf-8?B?anVWS2ZSUTdkTnpScVFiQlUvbFFDS3NpMVkyVzNJcDE1OG81VGZGazdrM2Y4?=
 =?utf-8?B?TlVJNG5qQUNlYWJnbmVEVklJUlRxNzZiMWJTc3dEbDVJbUhaOFBrdnRXU1Ro?=
 =?utf-8?B?SzdnQzVwRzIrQ2dqVkxGc2g2L1lPYkRGa3Y3SzJ6cWdRd2VlWEtBWnFJdnpl?=
 =?utf-8?B?bDhTbkJMNDdoenhvNHJOL1hvTXUrbURUUGFZOG5NM3pDQUNCNkdQMkp1RkxG?=
 =?utf-8?B?d0NGdHkwZm41ZWQweG5mZzlENVpncUFmaWVBTnh2c3p1K1pzRTc3UWdrOWdn?=
 =?utf-8?B?ODZCQVFQYlh1QTZ6ektKOUYrZ2pjYzUweGZ3S25nUld0TnRkNHhVbGtqSjJE?=
 =?utf-8?B?c2dVUkZpT0Z0NkEvNEJQU09xdU1KUllzVm9JOHRvSkRVOW9Tak50Y3VvRjlw?=
 =?utf-8?B?anEyZy9CaTBINjdHbmZvN0RoaGZHZEZ3Q0IyL3dYaG50c1lNbEpwVWZHSzg4?=
 =?utf-8?B?ejIzS0RsdXhBbnFCRWlVUENhUWZ1dlFzK3dSZXA1Q0ZyTk9mZE5sbXIxNGFM?=
 =?utf-8?B?MjJwRGRPeDR6VG41OWMrWEhqckppeVJsRHc3R3czWEJGNEVpbHJtVkd6cWlm?=
 =?utf-8?B?UFJQeVd6VzBuRmVVUDJPVVVzdzdkd1BwTU5telc0bHdnMlRIV3NVWTNMMFEr?=
 =?utf-8?B?Q2twMmxPUDZwR0kyUDhTcXhEWU1WSWRwTXVWaDRHbEZwSkFBZUJpYjNFOXhW?=
 =?utf-8?B?Ri9lYzdPcUpodXBjM0JuZHRnSHFIVE5MaEo4YmJxSGl3TzJHaG9YTVZ5N2xR?=
 =?utf-8?B?UlNaTkF4TjY3OHNjMysvczBza3hWMG1CV2gvYmF5N050elVEVlJ2VkhPZWNy?=
 =?utf-8?B?N2szdzBrVXowRU5CWEw2UUhzd0haTmJ3b1RmTmxVS3BhZ2p0ZVN3NnVUWi8y?=
 =?utf-8?B?clVFYmRReUN4WW9oUkNRMHlkalJnaU1BQzgvQkFoWml3MjBSSjh5c3E3VzNs?=
 =?utf-8?B?cE1yd3YxRWF1U2Q3aUxyZGFaVk9RTURFblVMdy9tbnVPQXMwa0JPaXplQk9J?=
 =?utf-8?B?RkVycE85amh5YUEvZHdxUzFmUHp0Qmh1WEw2bm5Hc24rSjZ0OG5QbWtWZUpD?=
 =?utf-8?B?N094TjFpamZiUVpyZXFBZUR0aHZwYXlyV25vSU93Y0ZaRmN0OVhJVUpLajJK?=
 =?utf-8?B?aWVvaVpPSFZVUlptWWNvTVd6ZmRxSHJ2MTNic1Z5OWE2K0ZZT1Q5ems4ekZj?=
 =?utf-8?B?MGVJZWVHdDhhVzdtWGJVTGJ0SVpYanFEZ3Uwc3FpbHZnaTJhbldTVHZFOWps?=
 =?utf-8?B?a3Vsdm5yZlRCa1dIR2Iycm5ZMGlqUTdFR2F2SUVkc3JmQzA1T2VBZURwQXhn?=
 =?utf-8?B?d2JYeEtZOE13K21qYThkR01NRDdYV0JBTldTU0pVMEVLQTJUbmlCSjhIdlg3?=
 =?utf-8?Q?77HR5L0ym97t9U/eeYRbhgc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <584EF09889BFEC47AE72F2004DE3B57C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088340e0-b40d-4cdc-6111-08dd42273a18
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 18:44:00.1863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QAuRuUwBlf/z0gMhU4yXmHxkBVEPfYMHc+7MFXwwg6xD2E1bVBjr1nnK8cPThmUxpYvHAKrUG3JaGHxLvySExoz3Ufsc8moRwZ9DFqL0C4MC7SJUpsawSD2FWY3yaMqW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4868
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

PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZV9zbmFwc2hvdF90eXBl
cy5oDQo+ID4gQEAgLTAsMCArMSw1MyBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTUlUICovDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCDCqSAyMDIxLTIwMjQgSW50ZWwg
Q29ycG9yYXRpb24NCj4gDQo+IDIwMjUNCj4gDQo+IHRoZW4NCj4gDQo+IFJldmlld2VkLWJ5OiBS
b2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IA0KDQp3aWxsIGRvIC0gdGhh
bmtzDQo=
