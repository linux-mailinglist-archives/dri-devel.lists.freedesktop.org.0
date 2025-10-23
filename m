Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE71BFF1BB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C1210E865;
	Thu, 23 Oct 2025 04:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHApIlrz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F7810E359;
 Thu, 23 Oct 2025 04:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761193441; x=1792729441;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OwCfVplg2n4gtY3G+VwhsGsjahVZ7hQgwAeyhR46ppc=;
 b=aHApIlrzzZttjipekRlFDkjp3QCQP0d4000bFNkW5iDn0V4AKP2cf4P2
 LuLheK2nxvXhRLqCM0CW71CxG0t3AyPU8WvdH+3UKjOw7lEf6TQnFIL9v
 7Rr9Fw1l/j+C7pS1WUQHgLkt/Q8IbPexU2XsbWz9KsIpe/DLE1McoNmND
 tqKliE9Ich1AZrgBYMHj6Z9S7ACzQrS3tsSRZBT1JBgLLv3E2mwFC8rU/
 qIWorqmenJTEKnZa6quon2sD21P7GTrE+0psucrdMC8jr9XKKaXVWFIee
 TwTGixznJRbKbonPn1TeQjzaw9lVytgaGeQnsS5Y6BoMxnu8cskokWI0d w==;
X-CSE-ConnectionGUID: Ek3bQU/PQOGCfwjtRzFmtw==
X-CSE-MsgGUID: fJN9GHD7TNOP2JV8ARwMYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65968218"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="65968218"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:24:01 -0700
X-CSE-ConnectionGUID: JpS2AQUQT8a+JDRBP9yAVg==
X-CSE-MsgGUID: hWUravsWT+ms5mrbk9ZmAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="207711419"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:24:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 21:24:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 21:24:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 21:24:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBDxPuT6zumUtaj7kNg4/wzIW/GIWU37k4+85qgwp8sapF7zXXIWaTYuPhhdQy3wi1c4A8aH8NCHDUWMptvIM25EJ+abp6ZDmBs1itSrgA7w4dBY7qBQwM+dJsv+j8hrC+RBdP0JM7Qo50UUfRn92IIkSNOlTw63rFIfh9AMz8Qp5dW62Mjzu3hlSw8F2FMmuBp4sQsLO+GFMNO4gXQdMboMabYM89hsoys3CNptp7CG2pwg/E4jxZj5i6YPSDwBUS0pdkG13w7SSB1gdS48kZ/aQwWqye9pTGrTAQSUrmw4JisslJ0KLC4+0Y2t4/uPgO/uUaDZqEd0ZMeSjEKohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks9xBBb4KzipN6FGyro/sIXOC+vuo2uBhc4+kRS3PI0=;
 b=zLCBet7Kioay2OBEaH8vLif1oPlpLGrGlHbx7cGUzL26NbpDCdSHMQRq4VoiJjpVom46RNAQC1ZWsSSA0KoxG48J6zDaqwXwN4r2boFXy1JOlWCeIeIkYIm/bv4nujidvS+NGwjEIS3jnZ911Vb/tKB7Q14o0CvvAqmQ9qD1ouSxitS5MY4xOMRp8ecAKVw1uN+Tr+l62HxAWLjobYwHWBYfY0LoYHKX3LcndWwz7nhq0953DuD/wRmwrNPcoWmk+YEFtf7uS54QonLH2cAUkJBKvUqrnnSd7+aM2PoS2Wc7c1e3s9ZqLVMS3W1PfQOTKRhBSPfbxl+b+j2NJ7z2TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7928.namprd11.prod.outlook.com (2603:10b6:8:fe::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Thu, 23 Oct 2025 04:23:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 04:23:53 +0000
Date: Wed, 22 Oct 2025 21:23:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <phasta@mailbox.org>, <alexdeucher@gmail.com>, <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 04/15] dma-buf: detach fence ops on signal
Message-ID: <aPmt1lZXAmom9Bko@lstrano-desk.jf.intel.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-5-christian.koenig@amd.com>
 <d5ea9ed0-d599-4b9f-92c8-a2e711371017@ursulin.net>
 <23bafbad-fcc9-4baa-9bd5-d4ea37c397f3@ursulin.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23bafbad-fcc9-4baa-9bd5-d4ea37c397f3@ursulin.net>
X-ClientProxiedBy: MW4PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:303:8f::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: ba635e4d-20f1-4d6a-37ed-08de11ebf94d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkpESXRJaXZaL3pYVmN5TDVDMVQ4QTlwYmJmK1FhRDJONi9RU2cydFBoaVZY?=
 =?utf-8?B?bXU4eFNCeFk5MG5Ybmk1MEYwZWZzRDkrd0ltNmlJNFpRazkyNVZnaURxanA2?=
 =?utf-8?B?eTYwODhEdWl5ci9FWE5zSyt0Yzd3RmhhUGRLNDJPMDQzeTNIL3FsL0RzY3Ny?=
 =?utf-8?B?MGp4Tlh1RXBWRmptdlBHcGtRTUZLTTdnN05idzV5MC8yRmRQb2FlVmtGbWlY?=
 =?utf-8?B?cE9TbS9LYkxFc3VkV1FCb3RtVHcrdlpBNW55RjYwSWErSzlTOE45bUxtdGNX?=
 =?utf-8?B?R2RGUzQ1S0VVUXJOVXB0N3hMOUZZSHY4QjJXTUErVXRZalVmZGZrNG9tRUps?=
 =?utf-8?B?bFJ3aXBqUTFTNFpzZStzNzR5YXh3UGMwNVM2TVlKMDViZXNMVkRGd2pDODN2?=
 =?utf-8?B?TlBPMW5iWXBNOWQ2Rm04R1RNZ1pmcW12YjBIVmY2ZkZmYWVwMGdTMktPektJ?=
 =?utf-8?B?OUxPR2F2Qis1a0UwbENXcDBLQ2tISkcyeEtNa0pURWUxVDdRRStvS1ZaY093?=
 =?utf-8?B?ZDhZVitnbkthQlhDTzVialVwOVdUV29heHZRK1pJT1IwOEN4WmZKb01FVGU1?=
 =?utf-8?B?TEhtNzF6TVZKQkpHbFR6Ym1ScmxmTXpJbzN6cjFYbnVkVzR0aFpkeHpQN1FV?=
 =?utf-8?B?bTZkMTJDcVowMytlczYwUmJkdVdTc3dMODdaSFVFelJBWEpadURpUkZFMlY1?=
 =?utf-8?B?Q1hZclhsdXVsTGNqby9IL0FpbmhOYVhKZjJYYVgxOHBpd0N2bTh6d2JWc2Vl?=
 =?utf-8?B?M1J5WWpnQUt3a3dpMHRPWWtQNThnL08zNVcwL0hCcFJVWGdORmZxc09uSmVt?=
 =?utf-8?B?M2RXbGFUTTgwcHNiaytwMlZncUE3R0d3VXRKQjcrZFFIMzRPclFPRGZjQkRY?=
 =?utf-8?B?S0M1V3dhMHMrNXdEMVV4NDE4cmpFTWl5WTdjY3BLdUJsZkZXdWtNWHlmVmg1?=
 =?utf-8?B?MkYrU1l5TkFQdU52WW5EVERqV0lzVGdGSTAyZ1QvKy9IazlIb1RvSDZGcVlC?=
 =?utf-8?B?REtBcFNBVW5vNExFbFdVbDk5d1lNT2dSNzNnV2p0VldwTGtYejc2RCtxWnA1?=
 =?utf-8?B?T2ZQN2xPRnZpaFVGVEMzV1ROeFhGN3lLRVBZSm1EUFNIWjVCU09uWmFnM2RI?=
 =?utf-8?B?aHp4eFBtL3FGOGY0bmVUZkxjbjZ0R2N4d0ExMFdQcnM3TWwyb2h6NWd0bGJU?=
 =?utf-8?B?dy9NYWZFQ2RBN2tBMUhacFVlZWFtM1IxV3UvdDVBWHB0bTlRckI2b0FCZzZK?=
 =?utf-8?B?QXJVQXhnc1JEU2tGN3k3SDFxeE9JVWZYRDBpOVgxTEJvSUJEUFZPVVhqSlE3?=
 =?utf-8?B?YjFRQ0l4OHVQN2VWZjZGdHhDcDVQV3FKZzNHSmZBSExnQ0VuN09GZE5oL0FO?=
 =?utf-8?B?Nmo0SVRhMlhjRWtUQjlac3QzNGpUU2d6elJHdkYvK05QUTFPc09uREpzWnJy?=
 =?utf-8?B?eU9PTXQvTHp3SXluTDBINnE3cGJuYUE1bFM1YlJuakRkcHZtVmxyWjIyUTEx?=
 =?utf-8?B?ODNvTStBeFR0bExJMHRFM2VPWFJnY1pPS2lTaFFObHhYNCsxai8vMEJ2L3Qr?=
 =?utf-8?B?aXA3enAra28vL0VqMElFeTlWaW9GMmJrY29NVi8xbjArbkRuZ2RvTXFTa2Ur?=
 =?utf-8?B?aXRnRDIwTGxVV2Uva1RpRHVPOE9yTVZQbE1BMStDVVdUN3JIWW05Q29JaXBN?=
 =?utf-8?B?RjBwREtrdFQ4RVFpK245T2g1UXdzVFNoREdHWEJHRlVaTUJpRitYV2xDc0t3?=
 =?utf-8?B?NnZyZFdLUHZxSkxQUlVlcnVjam9SdFhkZHptekJnbGxGd0RDOHp6cjhhNHdG?=
 =?utf-8?B?Q1YvUWNrZWxKbGRiMzhFdENMWU90VFEzV2k4ME5JMVNtZnBkM3RlLzIwYzh6?=
 =?utf-8?B?QVBrb2RjYXp3ZUtpd3BTRnluMklaek92SHdDK2p1RXhMTVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnhiOFJCRXNZQnF4Uk1tUWpzQWZ1dzh5MUV6anNqYmt5K0prRWhndTBpcHRK?=
 =?utf-8?B?SC9wZlAxdjlxOGxZVzViTVQvSmFnaFJ2L0tOd0pOSnN0TXhXdmcvQUtwaUFV?=
 =?utf-8?B?MWJQa1FVMkpNalVCYUduOUFuYU9NYjR2RWZiZTloQzVNczh6K0tRbStNQnY0?=
 =?utf-8?B?VDFRRlZyb1BOM3Q2c2JTblh2YUZ5MCtmMEFFNnZoK0s5Qnl4Z01pdzFlcUg3?=
 =?utf-8?B?U041aWdJaEpOb3d6d2s3azg2RzF1dDFveDFjNE5Dek9ES0EzYlI4MTlpZm8w?=
 =?utf-8?B?R0JoN0VKYnM4UjR0M0E4czhNa1lOaWtrUTlJWGpwcFl0QjVTMHhZS0JlelF1?=
 =?utf-8?B?R1ZQa0NydkUzV3pCS050TlV4aUpJREJTY3RTenhmeVBJU0lMSFZrT1pReUN5?=
 =?utf-8?B?YkFkNFcrY1V1K2FvVGpva0lTQ1h5WmorbGFGa0poRnVsUmY3THZxaXN4MHJF?=
 =?utf-8?B?anZuZmtKOUFTelRiLzEvemN3bUpudmFzMXF5eVhWOU8yd2VENllLN3dLc283?=
 =?utf-8?B?NitGSEhmQUs3d3VNT2JtTFk3eUd5YUNLUFhzTHA4M3NPRmgvYmo1c1RsMTV6?=
 =?utf-8?B?MWF3YU9MUUdyMTRsKytJaExSMmp1akFCM2ZKQVVpMGgrL3BsYUdzd2c3QXF4?=
 =?utf-8?B?YnIvN3JrdXA4b1o0S1d4dW53eFhUZWUyWUhLYUREcEVVdTVvV1VoeWxCWmUr?=
 =?utf-8?B?cU5uWHd5bUFWNUZWaVdKRWdaN0hpdFBVMWVPdTMrUjlxMG5rUTdwMmM1K2Ir?=
 =?utf-8?B?STJ0cWQxQS9wdUszWVYrcWZwQ1duTTJZY2xsQ2Rud21mYmZMYkdLT0RLdk9Q?=
 =?utf-8?B?YXlHZVBSQVJReE02WFo3YlllaGZ6bjdmaVVaa1QzOER0ck9mM3VWajBSaDU4?=
 =?utf-8?B?LzNxbU96d2J6Um1qaDFIOFBTQXhndUF5c1BvQnhjQ0NVNmxYN1MwZ1dsbWZw?=
 =?utf-8?B?SDdBU2cwSVBzcjRRU3VVSkJBT0ZCa2k2dUtCL0lGalIxMlVHVXFWYm9xOW82?=
 =?utf-8?B?eHFrQmx5RDJpd0FPd28rRUl5NzczakFPUGxkeEw5dHptVk9ITytlM1JHVDNW?=
 =?utf-8?B?Z2I5RDliNXdTYkRsR1NKR2IxdW5tVy9oNzFORmhqN00rM1NYSlBLQW8wWEtk?=
 =?utf-8?B?Y29TRVI3UnFsQldlZjFJbENJOStkQ2FoNjcwT2hoSWFpMlhic0g2bFhZNW15?=
 =?utf-8?B?dk5VYVNEbUx6RUVIUjhBVG9Md3I4UEg5WGNxZjRLUkxRbytId3ZhcHRIcTUw?=
 =?utf-8?B?cmNUWHlOZ3hHZEpMNXI2emI0R0QyQlhGL2hhTEJKdXhyU2FjaUZ5QXZNS1BZ?=
 =?utf-8?B?eEVVZFZmRVZCa2grTXROcmdycGw1VHFOTm9KRERUUjIwcVZOZTVCc3Rzd09l?=
 =?utf-8?B?emV2QU9hak5jcHRkeTFUNmVrRHBBRFFWMVVla2ZJR01scUxNekVnUk9hMUZ4?=
 =?utf-8?B?MVR0THlFZVpmRzhiUjlrQkErNXdqYm8rcWxTVlJOL0s2ei9yWTNnN2RybzZI?=
 =?utf-8?B?S2lxSzByN2ZjTnpqby8yU3p0elVHNldxMllEc24vK25WRTdFWmNhTzg0enFm?=
 =?utf-8?B?cHlDVUJPcTM1UWYxaFBEZ1JzazlvQ25wUGhDOWpRZGpSMHd2Zy80Y3NJWkFC?=
 =?utf-8?B?ZUlIaTJrN0hvbWtmTkpmZ3daR1RYOW5tWnBMVjYzQXY5T3lkS01ueERxMkta?=
 =?utf-8?B?R0l4M01TdXZPV0sza3NlQnhPZlZPSUIyQmFnVThZMDArSHZXVHhwYmtna1Rs?=
 =?utf-8?B?MFMyNklXK0p0cGdSY3FFVnVkWlZrK3psKzFicDNyVTBPYVV6Qkc0d0lRdmFt?=
 =?utf-8?B?bGtiNHM5d1JsMTBSWkhBRXhBeWZVZEE2eHNlOU5MckcrUm5oN2NJMkZwT25K?=
 =?utf-8?B?bEpqTjEvbFkwNG5hY0VYT29nSHlmMHpLbGdBbG9PSjh3S2wvZDhHbFZsNEox?=
 =?utf-8?B?d2pXazVnTnBDZ1FSc3pVL1h4d2x3MXJYK3Ftam5FOThFdU0xNmVmUEJLRzYz?=
 =?utf-8?B?WS95YUw2S0xERXA1anFNVklBVTFoeEViQkxaMDFJKzlzOWVlb2wwWEFkZlh1?=
 =?utf-8?B?d0RySXQ1WEs2eHRjdlF4U0FWQ2pvZkFKeldqZSswaHFXbkVETEE1VlpMekhG?=
 =?utf-8?B?dk01SVlaTENqdGlxK2xnZTMzd3M4b2ZpZ2ttTTFldGpITFFrUkRlUlNOaTRH?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba635e4d-20f1-4d6a-37ed-08de11ebf94d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 04:23:53.2428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJqcWB19888tvGOelPacOlb7DLxml44aY23ZymLKhvCJ5hX9iZxLw+sRfu0ilumQhFS/FSt6nnrIv4bsM8L2BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7928
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

On Thu, Oct 16, 2025 at 04:57:37PM +0100, Tvrtko Ursulin wrote:
> 
> On 16/10/2025 09:56, Tvrtko Ursulin wrote:
> > 
> > On 13/10/2025 14:48, Christian König wrote:
> > > When neither a release nor a wait operation is specified it is possible
> > > to let the dma_fence live on independent of the module who issued it.
> > > 
> > > This makes it possible to unload drivers and only wait for all their
> > > fences to signal.
> > 
> > Have you looked at whether the requirement to not have the release and
> > wait callbacks will exclude some drivers from being able to benefit from
> > this?
> 
> I had a browse and this seems to be the situation:
> 
> Custom .wait:
>  - radeon, qxl, nouveau, i915
> 
> Those would therefore still be vulnerable to the unbind->unload sequence.
> Actually not sure about qxl, but other three are PCI so in theory at least.
> I915 at least supports unbind and unload.
> 
> Custom .release:
>  - vgem, nouveau, lima, pvr, i915, usb-gadget, industrialio, etnaviv, xe
> 
> Out of those there do not actually need a custom release and could probably
> be weaned off it:
>  - usb-gadget, industrialio, etnaviv, xe
> 
> (Xe would lose a debug assert and some would have their kfrees replaced with
> kfree_rcu. Plus build time asserts added the struct dma-fence remains first
> in the respective driver structs. It sounds feasible.)

FWIW, I pulled this series from Christian into Xe and attempted to
disconnect fences in Xe [1]. It seems to work in my local testing, but
let’s see what CI says.

I still needed a release callback [2] to maintain an external lock for
our HW fences and the dma-fence signaling IRQ, but it should now be
fully disconnected from the module. I coded this in about an hour, so
take it with a grain of salt.

Matt

[1] https://patchwork.freedesktop.org/series/156388/
[2] https://patchwork.freedesktop.org/patch/682962/?series=156388&rev=1

> 
> That would leave us with .release in:
>  - vgem, nouveau, lima, pvr, i915
> 
> Combined list of custom .wait + .release:
>  - radeon, qxl, nouveau, i915, lima, pvr, vgem
> 
> From those the ones which support unbind and module unload would remain
> potentially vulnerable to use after free.
> 
> It doesn't sound great to only solve it partially but maybe it is a
> reasonable next step. Where could we go from there to solve it for everyone?
> 
> Regards,
> 
> Tvrtko
> 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
> > >   include/linux/dma-fence.h   |  4 ++--
> > >   2 files changed, 14 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > index 982f2b2a62c0..39f73edf3a33 100644
> > > --- a/drivers/dma-buf/dma-fence.c
> > > +++ b/drivers/dma-buf/dma-fence.c
> > > @@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct
> > > dma_fence *fence,
> > >                         &fence->flags)))
> > >           return -EINVAL;
> > > +    /*
> > > +     * When neither a release nor a wait operation is specified set
> > > the ops
> > > +     * pointer to NULL to allow the fence structure to become
> > > independent
> > > +     * who originally issued it.
> > > +     */
> > > +    if (!fence->ops->release && !fence->ops->wait)
> > > +        RCU_INIT_POINTER(fence->ops, NULL);
> > > +
> > >       /* Stash the cb_list before replacing it with the timestamp */
> > >       list_replace(&fence->cb_list, &cb_list);
> > > @@ -513,7 +521,7 @@ dma_fence_wait_timeout(struct dma_fence *fence,
> > > bool intr, signed long timeout)
> > >       rcu_read_lock();
> > >       ops = rcu_dereference(fence->ops);
> > >       trace_dma_fence_wait_start(fence);
> > > -    if (ops->wait) {
> > > +    if (ops && ops->wait) {
> > >           /*
> > >            * Implementing the wait ops is deprecated and not
> > > supported for
> > >            * issuer independent fences, so it is ok to use the ops
> > > outside
> > > @@ -578,7 +586,7 @@ void dma_fence_release(struct kref *kref)
> > >       }
> > >       ops = rcu_dereference(fence->ops);
> > > -    if (ops->release)
> > > +    if (ops && ops->release)
> > >           ops->release(fence);
> > >       else
> > >           dma_fence_free(fence);
> > > @@ -614,7 +622,7 @@ static bool __dma_fence_enable_signaling(struct
> > > dma_fence *fence)
> > >       rcu_read_lock();
> > >       ops = rcu_dereference(fence->ops);
> > > -    if (!was_set && ops->enable_signaling) {
> > > +    if (!was_set && ops && ops->enable_signaling) {
> > >           trace_dma_fence_enable_signal(fence);
> > >           if (!ops->enable_signaling(fence)) {
> > > @@ -1000,7 +1008,7 @@ void dma_fence_set_deadline(struct dma_fence
> > > *fence, ktime_t deadline)
> > >       rcu_read_lock();
> > >       ops = rcu_dereference(fence->ops);
> > > -    if (ops->set_deadline && !dma_fence_is_signaled(fence))
> > > +    if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> > >           ops->set_deadline(fence, deadline);
> > >       rcu_read_unlock();
> > >   }
> > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > index 38421a0c7c5b..e1ba1d53de88 100644
> > > --- a/include/linux/dma-fence.h
> > > +++ b/include/linux/dma-fence.h
> > > @@ -425,7 +425,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
> > >       rcu_read_lock();
> > >       ops = rcu_dereference(fence->ops);
> > > -    if (ops->signaled && ops->signaled(fence)) {
> > > +    if (ops && ops->signaled && ops->signaled(fence)) {
> > >           rcu_read_unlock();
> > >           dma_fence_signal_locked(fence);
> > >           return true;
> > > @@ -461,7 +461,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
> > >       rcu_read_lock();
> > >       ops = rcu_dereference(fence->ops);
> > > -    if (ops->signaled && ops->signaled(fence)) {
> > > +    if (ops && ops->signaled && ops->signaled(fence)) {
> > >           rcu_read_unlock();
> > >           dma_fence_signal(fence);
> > >           return true;
> > 
> 
