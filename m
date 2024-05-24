Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA06D8CDEEB
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 02:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFFD10E102;
	Fri, 24 May 2024 00:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIxfxwjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B4710E043
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 00:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716510635; x=1748046635;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=PeGr3/4SVYggq3rPdHoaTGRto/P8yn18rr6sZt0VI84=;
 b=dIxfxwjR+GvRh5g4CwBmNYWJnw84+B4LePSWALHPXPhe7LYm0nNjRvyi
 MO/JqCxq7/IS9pbnCntG54mOEBUVxJw+HE7e/RRgnE2MARWU6J5BjUET/
 IZqUK+zbB5Dxk9KQidzdPzSPqPBLGxNkGp6GcccoDC2RimsOvXiHxERUp
 m+X/qS3hIFYvz0+7R4bfvFlFHDEnpV4uNwa2tCFE+3xcmpOhP/Z6Rrc0a
 9ICXAlbnrvuEUd3E2/vX6sUK2EKNJbff16fO2cXOmB/KDqw3/pq0mm9Df
 FRVrB1f1RE+hvtATupN4+G7nU3uG7l6yipoi3yFG4NM0QoB3tGh57OekT g==;
X-CSE-ConnectionGUID: 8o5YmG5QQAWAkwCM5fFlLw==
X-CSE-MsgGUID: P4u+/VokRXKHgP0LjRGBMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12990050"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208,217";a="12990050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 17:30:30 -0700
X-CSE-ConnectionGUID: +b90e3+qT86LdfYSd8QN0w==
X-CSE-MsgGUID: ktae5EJ9QUeZFiaCC4+h2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208,217";a="38415869"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 17:30:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 17:30:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 17:30:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 17:30:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mr2W4OpgurYQc994yuFe4vcB8FuRCIdQRnMlEz4F3/l1BGI6rCFiaQn+P+dbRIbS4UgrV8A4NeFDZjhKZXzGiseoh0F9eWcpALlQxFBgu+gdqN0NGCb29piZ5LfZTh/LbCbCw0L23OAZKn2Fqbj/+htWH5OQiaWnDBSir88BeVQB0REzluTo00CBMFQvv2scdqELvgAmb6ImPUcCz57JENzwroNhe2VPfx30Z/NuNK8AZavqRdE2W18a6ThnG6Em5vRCGjdZiVPV4L1QW3etWFs9VKOeeywjwyFy77dMbxTxzyKkDN2+uObsL310uCsdsOm4lcC+d52SBmCV4aMpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EV12bKYPzm806d8MKqcpjw5uarYRbAd9zsdKyV4toow=;
 b=jvPTcto7H+yRPujh58UCENreGOmBKihsRHoFY3E5GtgSCPfJz9i1fD1x+74tw4LtEd4cuX4S4M+S6zN1nFxutg49aoqeEYpsnKlpEwZxoW7C8WMkOSktF30QD9fOlcdzuyW/p7wcShDDEqCUTq2aHVvUQBQieQdTsjxaFUdT9sNmMeTXDmjhIqfUXTU9gasuIa81kovqpzJoDLbgDNVkaW1bmvuFpG94gom/JwKRQAtw9zq+8b0SweNZzI63AhfPgJdnQ5MgHjvk4UMAWUnFjT7Syhvr9sbATJBrtt1MlhyxT7AhcVJzfPkCaKWrjV1BZ1HAhNvljTgVEnvDv4jH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Fri, 24 May
 2024 00:30:26 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 00:30:26 +0000
Content-Type: multipart/alternative;
 boundary="------------It8oBWXt4Q9Zot0o1tRDqcT0"
Message-ID: <6d88ab01-f2c8-4791-9802-87151b178c0b@intel.com>
Date: Thu, 23 May 2024 17:30:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/print: Introduce drm_line_printer
To: dri-devel <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20240514145631.2128-1-michal.wajdeczko@intel.com>
 <d928673b-133f-4d0d-8c8d-44f4ebad33b6@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <d928673b-133f-4d0d-8c8d-44f4ebad33b6@intel.com>
X-ClientProxiedBy: SJ0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: dfaf3d99-7965-48e7-9fd3-08dc7b88b4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFFDS2p4bG5qTlNOeHlPNE5GVmgvVTJZMCtiM0wyd29POHRYendwUzBTYWZn?=
 =?utf-8?B?a2tpSEFQWVRlc2xDelQ1a091UDBHaGxhVlF2dlhxOWlkdkg4ZldoUGloZjFy?=
 =?utf-8?B?MW9QaDBNekJIcGxpa2NVMDlCK21ZTlVlajFERnkzMkxZUGZtODd4VGVUdklw?=
 =?utf-8?B?R05sVkllM2ZWTFE1VlpWdHIwNG1VR05DS2ZyNXBoWHBFekEwSndsTkhwRXY0?=
 =?utf-8?B?VWhhSXQ4cDFCbkJkcHMweWF0cmJRUDhCa000QllSYzB1bXpaTmNtY21XeDE0?=
 =?utf-8?B?aEtXWmFDSkVlTTlDa2ZWVTNyZUJSWmNNVDExV3hORmNLU1NEd0FHcUpMWXJi?=
 =?utf-8?B?dkhCZSs4VGRkbmtMbkg3NU4zSEFaVUlzanJzTDMrUlBQa2dyN1ZxaDlQZDBY?=
 =?utf-8?B?Z0ozYUNBSHdzWWJpN2RVMGlVRzhkZ3I1MEJwWlJJVGFXNTFKcjBCbmtsckFu?=
 =?utf-8?B?dWw1VzdEOUpmU3hBdHhNVXFyYkR4eEYzb3JSWkx0Y0l5UGh2OTZ3SElwRWZy?=
 =?utf-8?B?TDB3ZUdDWjBmSWppaEIra1B1Tk1ndFl1T2UyNTFhUnB5TnBaTnI1R3pvemd4?=
 =?utf-8?B?MUJUNkNjeVRYVnJrSW1QeVpNdkhVNisxVlRlSEFjVjZQdU5hSDVQTnkvdUpW?=
 =?utf-8?B?UFgzNDVqWHBlL2o0UEk2SXhxclA5aks3MHAzUjBFOWx5Y1MyU1J4Nks4c0x1?=
 =?utf-8?B?YWt5VUNqeHJLQmQyMlh5LzMvYVMvVFRqUUgySkpQYXR0bVFVSzY4TUpVeUZC?=
 =?utf-8?B?YVZPVnBFZ2E5L2VoVThKZjA4eDNiVlpZN1pNRkYwUzhyajJubVdHVko5OXVv?=
 =?utf-8?B?V0JtbW51M3g2TXpxUFNjRDJhMU44WVhIUStpdHEvRXh6U0dNTC80aVpuWWtx?=
 =?utf-8?B?TnFLYzlLT28wZ1VndGxsZE94MjlDT28ydXR5eTZ3TWk3WVNkZ2hoSS8rZXpS?=
 =?utf-8?B?Ynpua3owaTd4K0EySzRqZklyN1doVWxnYzlvcXJnQzM2MjV2aTduY3JLYURK?=
 =?utf-8?B?ODBtS3QvN0QrU0h3RUJHeDFPbEl3cXZnT2JpdW1WbmhPNFpuakQ4S25laGlh?=
 =?utf-8?B?R0Z5TlpvUjRFbEcwcS9sUno1TTl0djU0RnNMMEhhTDV2Q0tuc3ZFQjdEZjhN?=
 =?utf-8?B?RHpqUm94WEl0eTQ0V2J1NUJ4WnVnNUpkY3dHK1c1LzFYU1FaVkNMSjlvVGFO?=
 =?utf-8?B?MlYzMEQxdUgrZmIxcGRHN1Nrd0tuek9sMVdRa3BIWElJWkZWbUwyZnM1WXVQ?=
 =?utf-8?B?a3N2bUlvN0xnM01YZXlkdlFqcUE5T0dITS93V2JJb1JyQ29YcDNGNi9aQnBp?=
 =?utf-8?B?akFKVEpEUEFtNTcyZmxndDE0Z2dZbnNBeGpaVHJyQ2E3QW80RkZ3MFJtazI5?=
 =?utf-8?B?VEtsNUEwV3pqSmVrbStqbUk4UTlkWVdjVHRsVzVVTkxOL3FWV3JOaXNKOW9S?=
 =?utf-8?B?cE4vMytoMkp4RXBXSTN4V1JSTzhubVBSOXZWRzIydFBaV2hDRkZDTThlbjEw?=
 =?utf-8?B?RUdmbjhrYnhGSlEvd0FEUEhOMzBFQzZEVGVTdHQxRm0rcThGay9SVkFuVVdR?=
 =?utf-8?B?LzRuTnFLL0o0cDFPQVBzVDhzYkgwa25NQmo3YUY3TDhDMGx4ZHZkbHF5ZzRz?=
 =?utf-8?B?Z25CREZOREUxNlJ3Nk04VkczM1IzTFNhdG1MQ2tIa2p3bkd1cEhqZGRJVkh0?=
 =?utf-8?B?WUJ2VElETlVzZkJuZGROek5iMVFIZUxpN2ZHbGU0OWVUUVZDUndjM3FBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGlQQndHMEl2REtkVVZ3SUVzVWIxc0I0RXpySHU3cTVoeUtNV05vSlVrK2l5?=
 =?utf-8?B?MW42TDlNTk1qUnhka1U3RERZTnhaWDJISXNpT3BTNFA1b2tzU0VpcHVQOENJ?=
 =?utf-8?B?NHI0Smhwd3VkZ0JWSkU3eGZtZGpVZDZtNmYwcXdDMU1RVVZ4cEhVdmtzWFdp?=
 =?utf-8?B?QU5oQ1RSVGRRM2lTdUhORjZrQ1hzWGhzcnR1MWxYYVo2UmZ3aHB3WmQvelI4?=
 =?utf-8?B?T1pyU1ZWVlNtRmcwbnRnNFNGaXdEOHM0OGl0blI0bTErMHFZSXNPOUNCY1RU?=
 =?utf-8?B?eFcxN3kxWEh4cnhTbmhHcTZ1aXFVZndXSUlhTG1pUzZNOFc4ZUhMK3Z1TndQ?=
 =?utf-8?B?cUVNYzJsV0d6Smc5SitvUXhYMlk3R1RmVkRhTGlCaXh2amNicHNsQ3lpOVYv?=
 =?utf-8?B?dUZ1ZlB6ZmgxWmE4SlBiU3crV3g3dHBOL2FBanFZRE14ZjZuaHdrMTV4NENL?=
 =?utf-8?B?TzFySE4vcUlUKzU3Zytta21taDQ0VHhpUFNxUCtkVG9DUVp5cE9WVGZoWWYy?=
 =?utf-8?B?YkRXMTNOT1RjM3dXMGhWNG5tUVN2Y291RWJSNnZVMFc3TVI1RlNITnN4SHN4?=
 =?utf-8?B?MWtabHB2bnkydDQ1M3FSNWNldmtPbEJDSGEzdWVSUmxwL1ZVM0hRTlF4NFRp?=
 =?utf-8?B?VTBETVZWU0d4LzBsNEF6U1NITXRyOS9iejQ2bDlzTXRWa2FLNFJObmkzekJi?=
 =?utf-8?B?N2M5bzBjbVBoR2NVeTFHSURxbmNaMDB6Ri9zY0hmVEVpSnNJOTRxUXFoMk9D?=
 =?utf-8?B?eXRBZVV3UXlMM3ZVbXFzeXhram9MclUzc3VNYXZYZlNRTm90YmlhMEF4TG43?=
 =?utf-8?B?WGpFMnZ6dlRJa2pkSlpMaTdpMXpGSGNjbXpqTUhLWC9zN251VDNIeFh6cGFz?=
 =?utf-8?B?d3JsM2wxekl3RThIejg0MnI1Z3U3bHEzTGdRYW4yZ3gyci8rU2k2TFc4UDBv?=
 =?utf-8?B?U29lRlIwU005SVR3VkJZMnk0YjNRY3N1WEZnRWZKaVZXaHJ6ZWxHSHd2UXFo?=
 =?utf-8?B?TXdITllxNG1OeGwxSWI4c1M5VE1yZlozV2RCdFhXOStrSkZYN0N2YlR6RG9P?=
 =?utf-8?B?dCttSmp3RjhCanJ6MkNpQzRsWHNvdHRNRnRzd29NRTFndVRQSTR2NXR2dHdU?=
 =?utf-8?B?V3NSdDZVTEdPRGlPSEYzV1lGN2FNM1p4aWIzUjBHMmNyRmtpSEhOVUk3cEJ4?=
 =?utf-8?B?Zm9zb05WOS9lWG1JN2FFamZub2g5SVlIejNrVFlzamQrYkFVVGVDYVo2OHNZ?=
 =?utf-8?B?Q1htL0lOMy92UFpsNWFRd1M5YjJEb2NNRGhlODVUVXNRRWRPTXFNR3FxTUpO?=
 =?utf-8?B?eGdTQXRFTDNGWkJ3a1I3YjFsRXBTTmR0YW8yVU56RjJUWC92SHBMaldXZnNV?=
 =?utf-8?B?S2JCUURHU3c2dkxmR0hRbGR2Q1NPaW5ZSWpoZnlLM0Y3M3lIMXRLM0U3OG9L?=
 =?utf-8?B?ajhPVE9zYmFVNTdTSUtpeE9BaE05VUdsSDVWT050eVpMR0E5YWtReGlrTjVW?=
 =?utf-8?B?b2ZFbTdWTzM5cWl3em1IRE82RGlJRW1JdFBjR0ROenpOTEpQZ2ozb25iUlVp?=
 =?utf-8?B?Q2QveVNQYWl6amtMZUFUUjVPck5NOStpZlBpenRPY3N4cFVmcGhiRVRYamFC?=
 =?utf-8?B?dUdoVVRSQ0drd3VqaFBrS0RmcVhKRzVwTlZBNVh6M3FZYjRpZUFVeWN1RHpq?=
 =?utf-8?B?cGFZdmdndElUVUNZU2YzTjkrcU1QWFhhMWVzeWdUc2lGSVBHbnRnNVlSbnBC?=
 =?utf-8?B?MFdkell5dWFWVFVzayttOUxjbzlhZjVzTE82MEVqUGlZVEx5UktYTHFDd1Vo?=
 =?utf-8?B?WFFRRFNWYzNjMVR2emVzRDd2b3hYQnFBMHliSjN2NXRVZXl0ZC80NDhFZXVr?=
 =?utf-8?B?S3NnQVRoR2R4YkZVYnI1WHI0RDZyQStVVitrTHJLTEVlWlphblRCWVpoYlNp?=
 =?utf-8?B?SWt5aGR0Tk9oaTBRSkFObElscEl6MkswRnpteDhjVnA4cldsWDdHRndhK2RQ?=
 =?utf-8?B?VGVUaFdLTHI3dzl5OGpmOUMzWUpaeGFWM1VHbERKd0JwTjJqYVZxR2x4WUtz?=
 =?utf-8?B?NXdtWTNCUzlQRzBiRGpVaERBQ2xiT2dqV2Q0R1RzeklKb1l6ak01M1c3VVNv?=
 =?utf-8?B?c3pOQnRQQlRLeVJZMGttZ2pGd2lJN3B3Z0QzNSs1VzhGSDlTbllvdnpIWERv?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfaf3d99-7965-48e7-9fd3-08dc7b88b4cc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 00:30:26.0424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVniKLHTs/gmubEI3i0pQ50J+7dHIJetcHrT/tBCVY96ykogMZKXJ05A5bAAD62gENaQeGzsNf5+cFgJOMU6taQ0RRpYC5CNeB1rbzF67os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
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

--------------It8oBWXt4Q9Zot0o1tRDqcT0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/2024 16:54, Daniele Ceraolo Spurio wrote:
> -------- Forwarded Message --------
> Subject: 	[RFC] drm/print: Introduce drm_line_printer
> Date: 	Tue, 14 May 2024 16:56:31 +0200
> From: 	Michal Wajdeczko <michal.wajdeczko@intel.com>
> To: 	dri-devel@lists.freedesktop.org
>
>
>
> This drm printer wrapper can be used to increase the robustness of
> the captured output generated by any other drm_printer to make sure
> we didn't lost any intermediate lines of the output by adding line
> numbers to each output line. Helpful for capturing some crash data.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> drivers/gpu/drm/drm_print.c | 9 +++++++++
> include/drm/drm_print.h | 37 +++++++++++++++++++++++++++++++++++++
> 2 files changed, 46 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index cf2efb44722c..d6fb50d3407a 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -214,6 +214,15 @@ void __drm_printfn_err(struct drm_printer *p, 
> struct va_format *vaf)
> }
> EXPORT_SYMBOL(__drm_printfn_err);
> +void __drm_printfn_line(struct drm_printer *p, struct va_format *vaf)
> +{
> + unsigned int line = (uintptr_t)(++p->prefix);
The prefix field is officially supposed to be a const char *. There is 
no documentation to say that this is intended to be used as a private 
data field by random printer wrappers. So overloading it like this feels 
very hacky and dangerous. Also, you are mixing types - uintptr_t then 
uint. So an arch with 64-bit pointers but only 32-bit ints would hit a 
truncated compiler warning?

> + struct drm_printer *dp = p->arg;
> +
> + drm_printf(dp, "%u: %pV", line, vaf);
This is insufficient. As previously commented, there needs to be a 
global counter as well as a local line counter. The global count must be 
global to at least whatever entity is generating a specific set of 
prints. Being global to a higher level, e.g. kernel global, is fine. But 
without that, two concurrent dumps that get interleaved can be 
impossible to separate resulting in a useless bug report/log.

The prefix field could potentially be split into a 16:16 global:local 
index with the global master just being a static u16 inside that 
function. With the first print call to a given drm_printer object being 
defined by the global value being zero. And it then sets the global 
value to the next increment skipping over zero on a 16-bit wrap around. 
But see above about prefix not being intended for such purposes. So now 
you are just piling hacks upon hacks.

Plus it would be much nicer output to have the ability to put an 
arbitrary prefix in front of the G.L number, as per the original 
implementation. The whole point of this is to aid identification of 
otherwise uniform data such as hexdumps. So anything that makes it less 
clear is bad.

John.


> +}
> +EXPORT_SYMBOL(__drm_printfn_line);
> +
> /**
> * drm_puts - print a const string to a &drm_printer stream
> * @p: the &drm printer
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 089950ad8681..58cc73c53853 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -186,6 +186,7 @@ void __drm_puts_seq_file(struct drm_printer *p, 
> const char *str);
> void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
> void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf);
> void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
> +void __drm_printfn_line(struct drm_printer *p, struct va_format *vaf);
> __printf(2, 3)
> void drm_printf(struct drm_printer *p, const char *f, ...);
> @@ -357,6 +358,42 @@ static inline struct drm_printer 
> drm_err_printer(struct drm_device *drm,
> return p;
> }
> +/**
> + * drm_line_printer - construct a &drm_printer that prefixes outputs 
> with line numbers
> + * @dp: the &struct drm_printer which actually generates the output
> + *
> + * This printer can be used to increase the robustness of the 
> captured output
> + * to make sure we didn't lost any intermediate lines of the output. 
> Helpful
> + * while capturing some crash data.
> + *
> + * For example::
> + *
> + * void crash_dump(struct drm_device *drm)
> + * {
> + * struct drm_printer dp = drm_err_printer(drm, "crash");
> + * struct drm_printer lp = drm_line_printer(&dp);
> + *
> + * drm_printf(&lp, "foo");
> + * drm_printf(&lp, "bar");
> + * }
> + *
> + * Above code will print into the dmesg something like::
> + *
> + * [ ] 0000:00:00.0: [drm] *ERROR* crash 1: foo
> + * [ ] 0000:00:00.0: [drm] *ERROR* crash 2: bar
> + *
> + * RETURNS:
> + * The &drm_printer object
> + */
> +static inline struct drm_printer drm_line_printer(struct drm_printer *dp)
> +{
> + struct drm_printer lp = {
> + .printfn = __drm_printfn_line,
> + .arg = dp,
> + };
> + return lp;
> +}
> +
> /*
> * struct device based logging
> *
> -- 
> 2.43.0
>

--------------It8oBWXt4Q9Zot0o1tRDqcT0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 5/23/2024 16:54, Daniele Ceraolo Spurio wrote:<br>
    <blockquote type="cite" cite="mid:d928673b-133f-4d0d-8c8d-44f4ebad33b6@intel.com">
      
      -------- Forwarded Message --------
      <div class="moz-forward-container">
        <table class="moz-email-headers-table" cellspacing="0" cellpadding="0" border="0">
          <tbody>
            <tr>
              <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Subject:
              </th>
              <td>[RFC] drm/print: Introduce drm_line_printer</td>
            </tr>
            <tr>
              <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Date:
              </th>
              <td>Tue, 14 May 2024 16:56:31 +0200</td>
            </tr>
            <tr>
              <th valign="BASELINE" nowrap="nowrap" align="RIGHT">From:
              </th>
              <td>Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com" moz-do-not-send="true">&lt;michal.wajdeczko@intel.com&gt;</a></td>
            </tr>
            <tr>
              <th valign="BASELINE" nowrap="nowrap" align="RIGHT">To: </th>
              <td><a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a></td>
            </tr>
          </tbody>
        </table>
        <br>
        <br>
        This drm printer wrapper can be used to increase the robustness
        of<br>
        the captured output generated by any other drm_printer to make
        sure<br>
        we didn't lost any intermediate lines of the output by adding
        line<br>
        numbers to each output line. Helpful for capturing some crash
        data.<br>
        <br>
        Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com" moz-do-not-send="true">&lt;michal.wajdeczko@intel.com&gt;</a><br>
        ---<br>
        drivers/gpu/drm/drm_print.c | 9 +++++++++<br>
        include/drm/drm_print.h | 37
        +++++++++++++++++++++++++++++++++++++<br>
        2 files changed, 46 insertions(+)<br>
        <br>
        diff --git a/drivers/gpu/drm/drm_print.c
        b/drivers/gpu/drm/drm_print.c<br>
        index cf2efb44722c..d6fb50d3407a 100644<br>
        --- a/drivers/gpu/drm/drm_print.c<br>
        +++ b/drivers/gpu/drm/drm_print.c<br>
        @@ -214,6 +214,15 @@ void __drm_printfn_err(struct drm_printer
        *p, struct va_format *vaf)<br>
        }<br>
        EXPORT_SYMBOL(__drm_printfn_err);<br>
        +void __drm_printfn_line(struct drm_printer *p, struct va_format
        *vaf)<br>
        +{<br>
        + unsigned int line = (uintptr_t)(++p-&gt;prefix);<br>
      </div>
    </blockquote>
    The prefix field is officially supposed to be a const char *. There
    is no documentation to say that this is intended to be used as a
    private data field by random printer wrappers. So overloading it
    like this feels very hacky and dangerous. Also, you are mixing types
    - uintptr_t then uint. So an arch with 64-bit pointers but only
    32-bit ints would hit a truncated compiler warning?<br>
    <br>
    <blockquote type="cite" cite="mid:d928673b-133f-4d0d-8c8d-44f4ebad33b6@intel.com">
      <div class="moz-forward-container"> + struct drm_printer *dp =
        p-&gt;arg;<br>
        +<br>
        + drm_printf(dp, &quot;%u: %pV&quot;, line, vaf);<br>
      </div>
    </blockquote>
    This is insufficient. As previously commented, there needs to be a
    global counter as well as a local line counter. The global count
    must be global to at least whatever entity is generating a specific
    set of prints. Being global to a higher level, e.g. kernel global,
    is fine. But without that, two concurrent dumps that get interleaved
    can be impossible to separate resulting in a useless bug report/log.<br>
    <br>
    The prefix field could potentially be split into a 16:16
    global:local index with the global master just being a static u16
    inside that function. With the first print call to a given
    drm_printer object being defined by the global value being zero. And
    it then sets the global value to the next increment skipping over
    zero on a 16-bit wrap around. But see above about prefix not being
    intended for such purposes. So now you are just piling hacks upon
    hacks.<br>
    <br>
    Plus it would be much nicer output to have the ability to put an
    arbitrary prefix in front of the G.L number, as per the original
    implementation. The whole point of this is to aid identification of
    otherwise uniform data such as hexdumps. So anything that makes it
    less clear is bad.<br>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:d928673b-133f-4d0d-8c8d-44f4ebad33b6@intel.com">
      <div class="moz-forward-container"> +}<br>
        +EXPORT_SYMBOL(__drm_printfn_line);<br>
        +<br>
        /**<br>
        * drm_puts - print a const string to a &amp;drm_printer stream<br>
        * @p: the &amp;drm printer<br>
        diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h<br>
        index 089950ad8681..58cc73c53853 100644<br>
        --- a/include/drm/drm_print.h<br>
        +++ b/include/drm/drm_print.h<br>
        @@ -186,6 +186,7 @@ void __drm_puts_seq_file(struct drm_printer
        *p, const char *str);<br>
        void __drm_printfn_info(struct drm_printer *p, struct va_format
        *vaf);<br>
        void __drm_printfn_dbg(struct drm_printer *p, struct va_format
        *vaf);<br>
        void __drm_printfn_err(struct drm_printer *p, struct va_format
        *vaf);<br>
        +void __drm_printfn_line(struct drm_printer *p, struct va_format
        *vaf);<br>
        __printf(2, 3)<br>
        void drm_printf(struct drm_printer *p, const char *f, ...);<br>
        @@ -357,6 +358,42 @@ static inline struct drm_printer
        drm_err_printer(struct drm_device *drm,<br>
        return p;<br>
        }<br>
        +/**<br>
        + * drm_line_printer - construct a &amp;drm_printer that
        prefixes outputs with line numbers<br>
        + * @dp: the &amp;struct drm_printer which actually generates
        the output<br>
        + *<br>
        + * This printer can be used to increase the robustness of the
        captured output<br>
        + * to make sure we didn't lost any intermediate lines of the
        output. Helpful<br>
        + * while capturing some crash data.<br>
        + *<br>
        + * For example::<br>
        + *<br>
        + * void crash_dump(struct drm_device *drm)<br>
        + * {<br>
        + * struct drm_printer dp = drm_err_printer(drm, &quot;crash&quot;);<br>
        + * struct drm_printer lp = drm_line_printer(&amp;dp);<br>
        + *<br>
        + * drm_printf(&amp;lp, &quot;foo&quot;);<br>
        + * drm_printf(&amp;lp, &quot;bar&quot;);<br>
        + * }<br>
        + *<br>
        + * Above code will print into the dmesg something like::<br>
        + *<br>
        + * [ ] 0000:00:00.0: [drm] *ERROR* crash 1: foo<br>
        + * [ ] 0000:00:00.0: [drm] *ERROR* crash 2: bar<br>
        + *<br>
        + * RETURNS:<br>
        + * The &amp;drm_printer object<br>
        + */<br>
        +static inline struct drm_printer drm_line_printer(struct
        drm_printer *dp)<br>
        +{<br>
        + struct drm_printer lp = {<br>
        + .printfn = __drm_printfn_line,<br>
        + .arg = dp,<br>
        + };<br>
        + return lp;<br>
        +}<br>
        +<br>
        /*<br>
        * struct device based logging<br>
        *<br>
        <pre class="moz-signature">-- 
2.43.0

</pre>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------It8oBWXt4Q9Zot0o1tRDqcT0--
