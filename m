Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C65492D49E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 16:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3B610E806;
	Wed, 10 Jul 2024 14:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzlI4tKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B9D10E806;
 Wed, 10 Jul 2024 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720623487; x=1752159487;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T45h+RztH4UI25Uw65cwIZnlURpnzk/0f6+nJccY8Jk=;
 b=lzlI4tKf88tqI2Xzz+RaG1Al/cJGQOsqvd0077ZorYhBOqulWjyXVhrM
 2lwYPiVoM+R3SJAEy8HVa+1kq8KjQMjbPATtnICcemgCWZIG/JIuYkVjd
 /koXpPQW6lWsrnmsRr7+frKKCGNpD9yEyz82xBK1zMpFNHHsYzn5ooUqv
 NxbG24uBJV3r+UqYEZiTLQxjIj4zk0LLmEL3Nq3/xx9TdasA9+GMEv49J
 r8evOXcno94/3oRVu3DBA2mu4tKQAm35bPO9GZIzDF3RXSdQ9KTS6S0/6
 yBPdhTiMVVDPa7vaNS3OOP5shJzA9SxStTJiukA2LbAVLt1cviq/vpyo1 g==;
X-CSE-ConnectionGUID: efsK4jOOQ223EWTsulXfkQ==
X-CSE-MsgGUID: lejuwbk7RmGG1JaPglNAxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="43370699"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="43370699"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 07:58:07 -0700
X-CSE-ConnectionGUID: sfz8QcAHQSi541b/r8qk9Q==
X-CSE-MsgGUID: pTMDPkBiT2S/6VEJOVJmUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48119820"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 07:58:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 07:58:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 07:58:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 07:58:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMZpd6Tk0+/C0ijA03Sqo3peGq46GFJjNCL537PldhmpYkspQ3jiuMxkuGYDztcZOyJfU6CxUJ6XCyTU/SdUMbjnjRHgwFn5knikhTlW/A4Z0nTPK676KOBe7tZ1Nspujec/oFzkYQ20aI7etldwM1+thFO+9OWMcwHtbkOTSTDUV9ghlMl658xUVLML8oxodVpIl/ybrmDKbCQfso/Zp0QvA8raNp9pl8feE2MCxQClu6gg7ZNlAlLQtZ5+mbNGGMtFrgedh5ZQ6lZAb4H6g2HtMVv7Y1FZyD2Tam6Qk+WsYgGDxZWxkpFTnOndK+ftQc/CkjTVUJaIGFuwH6cekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T45h+RztH4UI25Uw65cwIZnlURpnzk/0f6+nJccY8Jk=;
 b=EBaBTGKTFLIz8E0kaAAxesmdEWAYcVU+NR0GnJFjcRLtQ15OLGcTwnPJaI/mRv2UkEIlioSSDqRr4I/75VFWLMG+lun+HGnzV8ZqHnjbl2XnhbO869TczyR5EBBAyPG+ltITvOC9w5sFoZ3NwInIcbtw457VfMNFIavmdWvUURKu8xu57HMrV1ZQVD3nq1UdmQhBzKOdO/B2Rf6JXY5MGb8EUOTRjPUyErkYzPSztyCmdrWisLFtI2OlQVbQzoHzLbTIlzJm8B8Nz2Oata2czPE0aTkVDnowylUAFRlv339fvQniptKJstaiMX2TnbIsC9bHsKdHtcSFXRCk6/wyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 by DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 14:58:03 +0000
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0]) by SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0%4]) with mapi id 15.20.7719.029; Wed, 10 Jul 2024
 14:58:02 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Shyti, Andi" <andi.shyti@intel.com>, "chris.p.wilson@linux.intel.com"
 <chris.p.wilson@linux.intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "janusz.krzysztofik@linux.intel.com" <janusz.krzysztofik@linux.intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Thread-Topic: [PATCH] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Thread-Index: AQHa0fy3WrqQAjX32UCLVgR57J54VbHubWQAgAFdIACAAEJQEA==
Date: Wed, 10 Jul 2024 14:58:01 +0000
Message-ID: <SJ0PR11MB5867C14DFD838DF3A078BC5FD0A42@SJ0PR11MB5867.namprd11.prod.outlook.com>
References: <20240709125302.861319-1-nitin.r.gote@intel.com>
 <51d17145-39bd-4ba5-a703-10725a1d3bc1@ursulin.net>
 <c0f5c187-38d9-40ce-b5b7-ae466584d24a@ursulin.net>
In-Reply-To: <c0f5c187-38d9-40ce-b5b7-ae466584d24a@ursulin.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5867:EE_|DM6PR11MB4626:EE_
x-ms-office365-filtering-correlation-id: acb3ee9e-190f-4a93-19b6-08dca0f0b219
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TWJYRDg0enc4VCsybzlaQVZ5Q1V3amU1NVNwdnYwZXFFTU9Ia0NVUEdFc2xI?=
 =?utf-8?B?MFBuTitOUUZpOEZJS0lSZVNORDRLVW5KK282b2RReFZteEdab3hPaUdyMm11?=
 =?utf-8?B?R0cwbjJFc0s0QldhRUJtZXd1UkhiYnJ0OHllbWRRTXQ4bzlzNFB3Z21nelBX?=
 =?utf-8?B?Q2doTzJTbmtzT0pkMC9kN2YwZjZ0TEZ2RXM0SGpFOUVwUU4xNjRkL0xqWmNv?=
 =?utf-8?B?N1djMkNLeGxJVk1UZXlqeERReCtHQTlFc0ZPYnVvY29vMTJrelJ6RVVyQ1dW?=
 =?utf-8?B?VGNhdjB3bGtYOWJ6Tmx1TkJEdE1EY01jUkw0TXEwdWpFNnpEZDU3dy9KcnhL?=
 =?utf-8?B?aVdRVW5SNFZOTmYxeGx2TTN0YUFWaTRlK01NRlhtTjF3WmMwTzhUekUvNFFG?=
 =?utf-8?B?UTBHOWExdmRMbDNmVE5ETHB2ZG9rNzZIcTh3ZmJJQXJaWWRTeWIzQVBIRk5U?=
 =?utf-8?B?cm81VCt3cDBwNVNzay9teDFJdTI2dXZWSlAzcWc3dVNyMTJ5RGY4Nk1jbTFl?=
 =?utf-8?B?WjU0WlBOT3FyeXJ6cld1WnpadGJqTzZnRlR0MEJTdEJ3b0ptOXRRYXNQNDFj?=
 =?utf-8?B?RWgxemJCWmFWS2djSWlrTmdmTXkxcGQ2bkV4aGpCSGpVaGJzYStUU3lxRkpI?=
 =?utf-8?B?eHE1MHlZb053L3ovVis4aW52VFNGRmZWU0lialp3WnRIY3AzZ0tZb3NtdkFV?=
 =?utf-8?B?V2NKTmxFVkhLS0x0Wmtjd2paQ21nTmlHOUxzWE5Na2h0bEpTbkNHZVJBdzR1?=
 =?utf-8?B?SWdTN0lDYUZmYmRmYWlma0ZVSjFKalhDWk5PZjVUc3k0b0RLanhvR3Z3Nk81?=
 =?utf-8?B?NTVlaVdoL2dpZFVsMk9ndkhtMHBrZGJxNXZaaFdKSy9CR25oL1NkenBZbzk5?=
 =?utf-8?B?eVR4ZDVZcjR4VnQ3eGhhZXVkZ0R3KzRCM25lT3NvTHZLdWdzaVphM3lWRzhm?=
 =?utf-8?B?WC82ZHczaWlvUjRQZ1p1ZVYrOXF6WS9oV2EySGUrdTgrNkZrdkM2ZmI2K1lH?=
 =?utf-8?B?N21oeVFiMkFPZjE5S0tnOVc0S1h4YVJKVFppd2NZRUVodXBSNFgzeW1WRmVZ?=
 =?utf-8?B?eHU5S3JVMFNPQWVSSkhTTG5rZVJHaVYzQzg1ekdKMWsreGExV2NHTXg1OGxH?=
 =?utf-8?B?dWsrKzNlaWtJWTI2OEo0WUswWGdXY3ZkMUpFRUh5T1NuZUxveDRjZUkyazFi?=
 =?utf-8?B?L0h3M3pGeTNqQUJyVnM3UUp1VmFKQXpkYUYrQk9QOGJ0WEp4S0podDNMSGl0?=
 =?utf-8?B?aWpiUDNOS2ZhWDEvMDk3Tmx5bkwvQ1laUHY3R01uNFhMMDhIVWM4MkNEWDFQ?=
 =?utf-8?B?bXUwSE9hQzdxRHJneDJPZlJod0lDTVY5d0JsZzFMZUdrT0RMYjI1K3pRbjlm?=
 =?utf-8?B?OFNBaWdDejRZSERWYWQ1ZXZpT0h3dVJYTW9PMUV2bi9qbmRoRzRPdUdHZ2k1?=
 =?utf-8?B?UlJoaElhdGtYMHkrL3FGa0lnY2FBK2JRb3ZXVENFb0s5VCtRU3Z2TnZicHkw?=
 =?utf-8?B?Ti8yaEFQTmlielJHR1RweXdYRTlHWVJuSVZiN05RZHNPbVNjcGhuNDVQbk54?=
 =?utf-8?B?MnpqRW0xbXU3M1ExWHRkenVrQmdlOVBiMnFxZzJ2WmhWWnB0Z1Q4SFZHb05T?=
 =?utf-8?B?bVdFUDR1aVFnTDN0ak1DL2txV3VpcE5ESnBEc2VwMWdXcVZUb3NIaVN1TEdG?=
 =?utf-8?B?ZzcxRlR4K2tyS0p3R3FpaWZDbUFKZFdkZ3pudmIyVkJ0ZitWN0RhWVFQVytC?=
 =?utf-8?B?S091M2ZrdGFzRll6aDV6dTNuNlVyUnZWVHM5WEZ3NkJ6eDZlWGIvRk1kWGNk?=
 =?utf-8?Q?IfN7GM/WCHkSV83vCzZEHcjdm/nk37azjfPl0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5867.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUI5dkk4RW1sbFg3Ukw4S3NXV3FLOWxOdE5MZzhCTmhDYmkzRWQxQkRrS2Fu?=
 =?utf-8?B?aUhJWDZXSnQ4RTl6Z0toSlFFcGg5VEpKRXpPenVyTmppV0gyNURGQnpIWExu?=
 =?utf-8?B?emlheUpPTFhQQ0syZndpbTdMS1k0VTkrTjQwR2JSalN0b09DRzIyV1JwaHl4?=
 =?utf-8?B?bS9qY1NUNmdQdVBXbGRhUDhvZjg4UzN0NUFUZ0pQcTdmZjVjRWxUR2ZhRXJG?=
 =?utf-8?B?SU1zdThqRWZ3UkhRZXZHZTFiMXdBMkZhL1VpMjU5MGxoWVhVMVQ3ZWkyM0Ji?=
 =?utf-8?B?YUh4em1PRjQ4K0ZWR2doUTJQTEs2WUY4TjUrRzBmT2s4SkdmajNZVmhkTmRq?=
 =?utf-8?B?NzZQeUVianhEWjAwMlRFYTNxRU1uQjlQbG1nNitGKzZEaGlZRmY1WWZkRlBI?=
 =?utf-8?B?YTNDY2k3NXFqamVOdmpTc081SFJ2ZWd4WGZVUk9jVjl0YWVueGpsVHR5cE53?=
 =?utf-8?B?QWZGU0xwTll2ZnMrZm9wY3lTdklQbG9kUGtVQXN3dktpWnpWRlZTa3ZieDJs?=
 =?utf-8?B?d1JRbkgxbTZTUlZ2b0YwSktYVmN3b0FKaVAzQUVyNS94ZDllTGNaQUlJVkFm?=
 =?utf-8?B?L0tFbGh2ZXFNMTNFQmErUjNUS1pnWnFXN1pZZkI2TzI5WlJlUklMaDMrYTJV?=
 =?utf-8?B?K2RzVm1jZ2RiTVdRcWlneVdYMHErUXVzaFMrS25FQ1VkUkQ1NFJ3UEVUcldE?=
 =?utf-8?B?dWRxb1FrakhJRGl6YnBTS00vcmNzOXUvdTlaZlV1SWRQbkJ3OWZLeDdva3li?=
 =?utf-8?B?TUNxa1ZoVzhOUFZ1cjU0MVJFQTRyRzJHTnFScnpxZHFjSm45d3didGdRZHBL?=
 =?utf-8?B?Vk94UVVQa00wR0pEV3ZiOW00SjgycW1raHNLK3dZUUFGR1hCWWJJd280Sjh0?=
 =?utf-8?B?VFdGR0d4Yng5NW9ORXRnOUI3OU1jVDJtSEJLTnNFbFVsSjFiZVlCZ05JMzRV?=
 =?utf-8?B?RzFteFZtQ3l3RWRWV0UweXdFRFNFL2JBcFd1bDhWbXpVQXBBMG5ab2poeWZD?=
 =?utf-8?B?R3pJSTR6dVdhbjRBR1FHR2FkOG9RK0VqcWdzakNPT0FEL1Q1dTJYcE52QUN2?=
 =?utf-8?B?ZWNVcE9raEt0YXBFYXJucU9Rem9JdHdOT2l5QzMzOEZWR0tmRDBKTFZDeUZF?=
 =?utf-8?B?QkFqOVJUZlJqOFo1VXk2OFRpK2dZUEtXQjZOdTB4Uk85WEVaWGYyYnZYT0FR?=
 =?utf-8?B?SGhxMWlYbUZIUkRPd1pOOVU5c05kcWhXeWRDay9OK3Zxa2J4SzdOdXl3bFJ3?=
 =?utf-8?B?Smdvd043V040d25WZVh4cHpZeFJwSlFCZGFHMkpneTNnaFduTjNpbmhCM2l5?=
 =?utf-8?B?UFhVMXhkUzRHWUFyeGdtODN1QlZpZnhraWRHdThrRmQ4RzA2NmIveWYxaXZX?=
 =?utf-8?B?R29NZjJadmFiMWV1K0laZlh1b214SWwxL0lTd2xnYkhMSVAwbENza08wS0dz?=
 =?utf-8?B?TW5ZK3NPUzdtM2tqTXJDVVdYMkRuL251OGx2NjQ2Zk1ldUhCQ0JvV2FOOHhs?=
 =?utf-8?B?K3VCQjk2ZkNENDZkVzlLaE4rOWRBMGMzakY2NDVEQjh5RFNxSnoyS1lFN0Ny?=
 =?utf-8?B?NUg5MVJHY2NIamUrYVp4TzNqem43bjdicDZNWmlaVjBpRWRoaGh5TnRvU3I5?=
 =?utf-8?B?N0N2NEVjV1JJcnRUMWluOEhnZWFDSXZNM3RlQmhpbHZxVVNiQWxBd1c4SkZR?=
 =?utf-8?B?S3RpT3c5aDJrbWVMdFp0cUprUGN4NVZQbjhsRzV3RmJnNkcxbFRFSC80T291?=
 =?utf-8?B?TjVyWCtzM2k1eUNzd012MFZ1RXZZc2ZJTWJtNENIWU01aDYvSzNSWklhVzJp?=
 =?utf-8?B?ckUvbkhUYmx4TVU5QmxHRmtxQTJxQ0JRVTVmM0NTWUI5SGdOMGp0b3dtUVFq?=
 =?utf-8?B?YVN4NlpTbEZBUkpXWjVaZGxTSlkrYnVGQnFQd2h3TWlOK0JtTXhPb0EvSUNW?=
 =?utf-8?B?ZEgvUDhYWTlOK3orZCtLcmorOG9Sc3RpL2FNMHdXcG1XOFdEcnRySXNjSHAw?=
 =?utf-8?B?aU9HS1dnQStBTExaUTlYZmJMYUN1b3JpS2wwSC84WW9TMHNiQ242ZlZjcTlo?=
 =?utf-8?B?N1JRNVVQVTNFci9UUmF3cEpiTUVINm0rdlcvaDVlU1FLR3ZhZ0w2QlZOMm5a?=
 =?utf-8?Q?uKznTGhjqm2ZaOgfT8+LGOGyy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb3ee9e-190f-4a93-19b6-08dca0f0b219
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 14:58:02.0077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: duu07uAxAl9+Rbm6Q+MXKeYCWRK6LOkGCJnnJkgSw2qNCiaPxkaEtkblV5XiRXRmDcOw+9Y7m7Ac5MtE1huMdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4g
PHR1cnN1bGluQHVyc3VsaW4ubmV0Pg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMTAsIDIwMjQg
NDoyMiBQTQ0KPiBUbzogR290ZSwgTml0aW4gUiA8bml0aW4uci5nb3RlQGludGVsLmNvbT47IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IFNoeXRpLCBBbmRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT47DQo+IGNocmlz
LnAud2lsc29uQGxpbnV4LmludGVsLmNvbTsgRGFzLCBOaXJtb3kgPG5pcm1veS5kYXNAaW50ZWwu
Y29tPjsNCj4gamFudXN6LmtyenlzenRvZmlrQGxpbnV4LmludGVsLmNvbTsgc3RhYmxlQHZnZXIu
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vaTkxNS9ndDogRG8gbm90IGNv
bnNpZGVyIHByZWVtcHRpb24gZHVyaW5nDQo+IGV4ZWNsaXN0c19kZXF1ZXVlIGZvciBnZW44DQo+
IA0KPiANCj4gT24gMDkvMDcvMjAyNCAxNTowMiwgVHZydGtvIFVyc3VsaW4gd3JvdGU6DQo+ID4N
Cj4gPiBPbiAwOS8wNy8yMDI0IDEzOjUzLCBOaXRpbiBHb3RlIHdyb3RlOg0KPiA+PiBXZSdyZSBz
ZWVpbmcgYSBHUFUgSEFORyBpc3N1ZSBvbiBhIENIViBwbGF0Zm9ybSwgd2hpY2ggd2FzIGNhdXNl
ZCBieQ0KPiA+PiBiYWMyNGY1OWY0NTQgKCJkcm0vaTkxNS9leGVjbGlzdHM6IEVuYWJsZSBjb2Fy
c2UgcHJlZW1wdGlvbg0KPiA+PiBib3VuZGFyaWVzIGZvciBnZW44IikuDQo+ID4+DQo+ID4+IEdl
bjggcGxhdGZvcm0gaGFzIG9ubHkgdGltZXNsaWNlIGFuZCBkb2Vzbid0IHN1cHBvcnQgYSBwcmVl
bXB0aW9uDQo+ID4+IG1lY2hhbmlzbSBhcyBlbmdpbmVzIGRvIG5vdCBoYXZlIGEgcHJlZW1wdGlv
biB0aW1lciBhbmQgZG9lc24ndCBzZW5kDQo+ID4+IGFuIGlycSBpZiB0aGUgcHJlZW1wdGlvbiB0
aW1lb3V0IGV4cGlyZXMuIFNvLCBhZGQgYSBmaXggdG8gbm90DQo+ID4+IGNvbnNpZGVyIHByZWVt
cHRpb24gZHVyaW5nIGRlcXVldWluZyBmb3IgZ2VuOCBwbGF0Zm9ybXMuDQo+ID4+DQo+ID4+IEFs
c28gbW92ZSBjYW5fcHJlZW10KCkgYWJvdmUgbmVlZF9wcmVlbXB0KCkgZnVuY3Rpb24gdG8gcmVz
b2x2ZQ0KPiA+PiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhjYW5fcHJlZW1w
dCcgZXJyb3IgYW5kIG1ha2UNCj4gPj4gY2FuX3ByZWVtcHQoKSBmdW5jdGlvbiBwYXJhbSBhcyBj
b25zdCB0byByZXNvbHZlIGVycm9yOiBwYXNzaW5nDQo+ID4+IGFyZ3VtZW50IDEgb2Yg4oCYY2Fu
X3ByZWVtcHTigJkgZGlzY2FyZHMg4oCYY29uc3TigJkgcXVhbGlmaWVyIGZyb20gdGhlIHBvaW50
ZXINCj4gdGFyZ2V0IHR5cGUuDQo+ID4+DQo+ID4+IEZpeGVzOiBiYWMyNGY1OWY0NTQgKCJkcm0v
aTkxNS9leGVjbGlzdHM6IEVuYWJsZSBjb2Fyc2UgcHJlZW1wdGlvbg0KPiA+PiBib3VuZGFyaWVz
IGZvciBnZW44IikNCj4gPj4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzExMzk2DQo+ID4+IFN1Z2dlc3RlZC1ieTogQW5kaSBT
aHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IE5pdGluIEdv
dGUgPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+DQo+ID4+IENjOiBDaHJpcyBXaWxzb24gPGNocmlz
LnAud2lsc29uQGxpbnV4LmludGVsLmNvbT4NCj4gPj4gQ0M6IDxzdGFibGVAdmdlci5rZXJuZWwu
b3JnPiAjIHY1LjIrDQo+ID4+IC0tLQ0KPiA+PiDCoCAuLi4vZHJtL2k5MTUvZ3QvaW50ZWxfZXhl
Y2xpc3RzX3N1Ym1pc3Npb24uY8KgIHwgMjQNCj4gPj4gKysrKysrKysrKysrLS0tLS0tLQ0KPiA+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4g
Pj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2V4ZWNs
aXN0c19zdWJtaXNzaW9uLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9l
eGVjbGlzdHNfc3VibWlzc2lvbi5jDQo+ID4+IGluZGV4IDIxODI5NDM5ZTY4Ni4uMzA2MzFjYzY5
MGYyIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9leGVj
bGlzdHNfc3VibWlzc2lvbi5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX2V4ZWNsaXN0c19zdWJtaXNzaW9uLmMNCj4gPj4gQEAgLTI5NCwxMSArMjk0LDI2IEBAIHN0
YXRpYyBpbnQgdmlydHVhbF9wcmlvKGNvbnN0IHN0cnVjdA0KPiA+PiBpbnRlbF9lbmdpbmVfZXhl
Y2xpc3RzICplbCkNCj4gPj4gwqDCoMKgwqDCoCByZXR1cm4gcmIgPyByYl9lbnRyeShyYiwgc3Ry
dWN0IHZlX25vZGUsIHJiKS0+cHJpbyA6IElOVF9NSU47DQo+ID4+IMKgIH0NCj4gPj4gK3N0YXRp
YyBib29sIGNhbl9wcmVlbXB0KGNvbnN0IHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkg
ew0KPiA+PiArwqDCoMKgIGlmIChHUkFQSElDU19WRVIoZW5naW5lLT5pOTE1KSA+IDgpDQo+ID4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsNCj4gPj4gKw0KPiA+PiArwqDCoMKgIGlmIChJ
U19DSEVSUllWSUVXKGVuZ2luZS0+aTkxNSkgfHwgSVNfQlJPQURXRUxMKGVuZ2luZS0+aTkxNSkp
DQo+ID4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+ID4+ICsNCj4gPj4gK8KgwqDC
oCAvKiBHUEdQVSBvbiBiZHcgcmVxdWlyZXMgZXh0cmEgdy9hOyBub3QgaW1wbGVtZW50ZWQgKi8N
Cj4gPj4gK8KgwqDCoCByZXR1cm4gZW5naW5lLT5jbGFzcyAhPSBSRU5ERVJfQ0xBU1M7DQo+ID4N
Cj4gPiBBcmVuJ3QgQkRXIGFuZCBDSFYgdGhlIG9ubHkgR2VuOCBwbGF0Zm9ybXMsIGluIHdoaWNo
IGNhc2UgdGhpcw0KPiA+IGZ1bmN0aW9uIGNhbiBiZSBzaW1wbGlmaWVzIGFzOg0KPiA+DQo+ID4g
Li4uDQo+ID4gew0KPiA+ICDCoMKgwqDCoHJldHVybiBHUkFQSElDU19WRVIoZW5naW5lLT5pOTE1
KSA+IDg7IH0NCj4gPg0KPiA+ID8NCj4gPg0KPiA+PiArfQ0KDQpZZXMuIEkgd2lsbCBzaW1wbHkg
dGhpcyBmdW5jdGlvbi4NCg0KPiA+PiArDQo+ID4+IMKgIHN0YXRpYyBib29sIG5lZWRfcHJlZW1w
dChjb25zdCBzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUsDQo+ID4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGk5MTVfcmVxdWVzdCAqcnEpDQo+ID4+IMKg
IHsNCj4gPj4gwqDCoMKgwqDCoCBpbnQgbGFzdF9wcmlvOw0KPiA+PiArwqDCoMKgIGlmICgoR1JB
UEhJQ1NfVkVSKGVuZ2luZS0+aTkxNSkgPD0gOCkgJiYgY2FuX3ByZWVtcHQoZW5naW5lKSkNCj4g
Pg0KPiA+IFRoZSBHUkFQSElDU19WRVIgY2hlY2sgaGVyZSBsb29rcyByZWR1bmRhbnQgd2l0aCB0
aGUgb25lIGluc2lkZQ0KPiA+IGNhbl9wcmVlbXB0KCkuDQpUcnVlLiBJIHdpbGwgdXBkYXRlIHRo
ZSBjb25kaXRpb24uDQo+IA0KPiBPbmUgbW9yZSB0aGluZyAtIEkgdGhpbmsgZ2VuOF9lbWl0X2Ji
X3N0YXJ0KCkgYmVjb21lcyBkZWFkIGNvZGUgYWZ0ZXIgdGhpcw0KPiBhbmQgY2FuIGJlIHJlbW92
ZWQuDQoNCkkgdGhpbmsgZ2VuOF9lbWl0X2JiX3N0YXJ0KCkgc3RpbGwgcmVxdWlyZSBmb3IgZ3Jh
cGhpY3MgdmVyc2lvbiA8IDEyIGFzIGl0IGlzDQp1c2VkIGluIGVsc2UgcGFydCBvZiBpZiAoR1JB
UEhJQ1NfVkVSX0ZVTEwoZW5naW5lLT5pOTE1KSA+PSBJUF9WRVIoMTIsIDU1KSkgY29uZGl0aW9u
Lg0KU28sIGl0IHdpbGwgbm90IGJlIGRlYWQgY29kZS4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0K
Tml0aW4NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBUdnJ0a28NCj4gDQo+ID4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gZmFsc2U7DQo+ID4+ICsNCj4gPj4gwqDCoMKgwqDCoCBpZiAoIWludGVsX2Vu
Z2luZV9oYXNfc2VtYXBob3JlcyhlbmdpbmUpKQ0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIGZhbHNlOw0KPiA+PiBAQCAtMzMxMywxNSArMzMyOCw2IEBAIHN0YXRpYyB2b2lkIHJlbW92
ZV9mcm9tX2VuZ2luZShzdHJ1Y3QNCj4gPj4gaTkxNV9yZXF1ZXN0ICpycSkNCj4gPj4gwqDCoMKg
wqDCoCBpOTE1X3JlcXVlc3Rfbm90aWZ5X2V4ZWN1dGVfY2JfaW1tKHJxKTsNCj4gPj4gwqAgfQ0K
PiA+PiAtc3RhdGljIGJvb2wgY2FuX3ByZWVtcHQoc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5n
aW5lKSAtew0KPiA+PiAtwqDCoMKgIGlmIChHUkFQSElDU19WRVIoZW5naW5lLT5pOTE1KSA+IDgp
DQo+ID4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsNCj4gPj4gLQ0KPiA+PiAtwqDCoMKg
IC8qIEdQR1BVIG9uIGJkdyByZXF1aXJlcyBleHRyYSB3L2E7IG5vdCBpbXBsZW1lbnRlZCAqLw0K
PiA+PiAtwqDCoMKgIHJldHVybiBlbmdpbmUtPmNsYXNzICE9IFJFTkRFUl9DTEFTUzsgLX0NCj4g
Pj4gLQ0KPiA+PiDCoCBzdGF0aWMgdm9pZCBraWNrX2V4ZWNsaXN0cyhjb25zdCBzdHJ1Y3QgaTkx
NV9yZXF1ZXN0ICpycSwgaW50IHByaW8pDQo+ID4+IMKgIHsNCj4gPj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUgPSBycS0+ZW5naW5lOw0K
