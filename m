Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A257AAD4DC6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 10:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBB010E0BA;
	Wed, 11 Jun 2025 08:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmgOeSgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289CB10E0BA;
 Wed, 11 Jun 2025 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749629001; x=1781165001;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aL98kBYeKwz53jZcrR7lqOQgqozAF1z8MF4nNLBNSRg=;
 b=PmgOeSgGFs87fsAjjTlLzSkv35LUlye5C18EvJtNDm8yZzreODdIkG8c
 gY81TTdnPTjSMl+oThQMldwaR20n4HEuU54umlXOHx0Dwt32tH+DKmSxO
 SkodhOjy3xE5bgPOf86MzYSBtY1RmGSz/pjtl+EmEC7XTLcpnwtbK491e
 TqhGYQLYRySm5Os/htTCeMbWpAtF1pR3HdFNczmOXvuPbhLfPFetdp4q1
 i0FOUkA/3YGasx1amMX8QPgukSwXq0hOTzwyhLt9KH5kmcNgD6mhcUNlZ
 H4c4z34TrZ5Ni6sWLNTH4KGTpO8M0ejLTmLgHVoyQ/UP5mie4VfvigtLk g==;
X-CSE-ConnectionGUID: JKZPzz2gS+KyftimWiuVng==
X-CSE-MsgGUID: zncbgv/3SdGnPT/+oqmvaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51623582"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51623582"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 01:03:21 -0700
X-CSE-ConnectionGUID: ir7rcWVEQ++bjbNpFEUGLA==
X-CSE-MsgGUID: GR0rXVtjTOuVYrnf0BdsHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147022463"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 01:03:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 01:03:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 01:03:19 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 01:03:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOuh142c6ZO1fv0utqq6B7KMveaP+XovGApxiesxQRSbun0dBHwS6dqTsSstmMBRmtfr6++0SjX3a2kmct5WAl5r7C0lmRPa2JDPKogndLYoVoL8d1gKfxepQxKq6sptsS+4/Dw8uGR0PMrnQDcT8p5EaD+fN/cpq99mpkgu/FOFvBJucjAAJQtzameco2JhyXJRQB/hhoGtMr9ZjwPTgVRU+ReCeUugkOW1DOoMVvnCPLvAFCrhm30HUFs+dgI3AiS64yVXBNKi6CxSTlu1mlMEaH3K39+9dx/0iRRibFaE+E8vxWcFoU33by8VmqQejp6/KjZcw25ldpqqudsoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL98kBYeKwz53jZcrR7lqOQgqozAF1z8MF4nNLBNSRg=;
 b=RgbY18DzL8dEUWrmWvgALOESDkG4fTJpxIgyP+CsgOdBAkPew/HFs+k8qcyP7g9YLrXrPgQ8w4cjml71H/PnZrTqDJi1fgyrZZqkFtnwZOK/lABMnqzf9Zk+oFBuw0IndFXPjrxMStI/vdZcRsPv8f3BCfk79rRw8kHZFjSv2Z3TRROO/z/f3707iMOFKY5r2yD89ROZr1067HbP7+cD1ezZngLPMmi5QCqKjPMnxGjEp+txCqpfuTAR1ywXQ5PLDUpH7oazbJppvxrerelgE3/8kQ4ZAtLGb9zSsEN0e0+ra1Bnbue/q/p92+JOFi191rJxA7lBiS6HMTtChfW0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY8PR11MB6961.namprd11.prod.outlook.com (2603:10b6:930:5a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 08:03:13 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%6]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 08:03:13 +0000
Date: Wed, 11 Jun 2025 08:03:03 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Andi Shyti
 <andi.shyti@linux.intel.com>, Nitin Gote <nitin.r.gote@intel.com>, "Chris
 Wilson" <chris.p.wilson@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA
 alloc error
Message-ID: <dzngyd5a5ospzsdnbm77irwda2m6ttaxoxro77v2tsn6czjgan@hmknxwnwdzkb>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250606140753.522927-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250606140753.522927-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY8PR11MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 31bba134-1fc2-4355-4eae-08dda8be69d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTJ5dzBwWkZlTlRMYWw0RlMvOCtxN2RGclNBU0ZQMDVHV3I2bTJORkdZRTls?=
 =?utf-8?B?NmZqazU5c2NlWGg3bVFyMFI5MkVVem9OSTM0dUJSUndWanFrYitHS3d1NjNW?=
 =?utf-8?B?b0R2emFhRUxMckpoU21na1Mrc1llaDc0b0Y1QlNZUXQ2ZFBmMC9POThGQk9r?=
 =?utf-8?B?TW5RVkVqYjRGWWRjc1dBTXpMeGFYRks1MnVRdkx5ZlVEc3I4UlJxNWpHMHdx?=
 =?utf-8?B?QzByb1A2Zm4wYmtXZWF0bjJJVGZaQ0RqQjJkOENtSHVmVkowS3BIeW1MZ01y?=
 =?utf-8?B?Ymk5NnBBOGVUUHhmc25icGlOeWJFK1hXb1hQc096Z3pEaWtmUlJKSmZYT2cr?=
 =?utf-8?B?ZWRNZWZQVDBCQTEzYVVYbWhYUlFCOEFKUjA0MTZTWS9LQ0o1bVN3VFRmOHZE?=
 =?utf-8?B?K2Z5dTVaY1QxWjlzUzdWQlV2TUxuTmtiN3lIdDRXT1AvdlpPb0xIMVgxQXg3?=
 =?utf-8?B?UGUrMDhkWGVBa3hseEtNb01mdi9uakFodVJ0czNGUnZlSklPdFRNRmh5RXB4?=
 =?utf-8?B?ejEvd2tET3FIZ1pwSDVUUmVSSEZVSnQ3L3BiZ05UQXhuZWI1c0ZNMnZERGI4?=
 =?utf-8?B?Lzl2UWxRUGNXSDVvNU9SZjNKTThLQnlIcm05aTdBTGVvRFVmSWZBMUdoalFq?=
 =?utf-8?B?Z2kvLzRtL0tZWWgzWUFPRWU0MkkvOFh0TEJMVnNNaEFCbXg2bURBcUxJVVVN?=
 =?utf-8?B?YXY2S2ZKZS9lSGdHWE0yaTlSME5MVUdIbDM3T0d3OHd3QnoyTUp2ZDR5SHVW?=
 =?utf-8?B?N2xsRnRONTZ6RlUveUxKMVhpMGo1ZmUzQ0RrSUlrdVNON3FuNlRTenFHbERS?=
 =?utf-8?B?QTFka05haGlobmJvejR6RjRBNWc5WG5xaCt6TGhxMDU3anZ3SmVEaG1vU2JE?=
 =?utf-8?B?dHIrbytmWDVLWG1wYS9BSVVUODhxSjF4dDgrb1kwZEFnbWpsdklNYzNWT1BT?=
 =?utf-8?B?T3lvT2N5NDc2Q2Q1SUNqNVMyNm5tbmpKWW1reVpwZE56VGJRNFVhVEcyNDBC?=
 =?utf-8?B?dTY0RzZ1c1ZZalBpMDgzbEw3SU52dTRHWlIyK25mSk11dVJBM29PbnBuK0o3?=
 =?utf-8?B?ZDgrWUNzL1NTQ3QzKzZKOHFHNG9hdVZDWHJmbnA4YlRRakpmR1hmYWx3VHk2?=
 =?utf-8?B?VEF2SDBzdnM3YTdnUGdZb1hEVFVINHQrUHc3K2Q2RXRLTkpOUlVwc3BSQjdr?=
 =?utf-8?B?Z0hOUE9zMSs2SWRkRXZ2VkpnaHN5MEI3T0lnZlZHd1lUNzNwMDFVb0hqRGRM?=
 =?utf-8?B?S2xaR3hFbE5VV3JVdDVXUDg4WXZnWW81VkNvUmp4dENxampkZThVMnZsSU1K?=
 =?utf-8?B?ZUt5a2tBKy9menJPVmYxbmxrUExMbkMyVGxXZnlGZkc4R2xHQ0ZrajdtU3A1?=
 =?utf-8?B?cHFQaWkybEU5aXFjQzk5b2ZaemVqWjFIZlVFZ2ZmMllWT1ZnMUxINSs5eGFQ?=
 =?utf-8?B?WCtjRDQ0WXZXR1pRTGtoR1k5dHN4N1A0amN2U3Q3VG5VM2ExcVR4cG84OXVr?=
 =?utf-8?B?aXlIWkJlSzFsRUhIV3RpS21tc2lxOXkxMHIxZmtYdEJwY2VHMmtPVmpQYjg2?=
 =?utf-8?B?b3l2dGlneDhZbjlYMVE3MVEvekRVaVR0MlZWQVNTQXllNkUrMTBKZEJkSjFx?=
 =?utf-8?B?T3JRc3hWb2NJdHhWSHMwMkhiMFhCclRpK0hwMm52WWxXdXJqc2hnMmlXclNK?=
 =?utf-8?B?WUtOZ2g5TzFoSWRwQW8rcUduNnozaEpjWCtySm93bjk3cWFUOUhhN2o2RHkr?=
 =?utf-8?B?ZzJ5UHFJUHJvY0ZWUzRuQklibTZjMWRpMENUWEp0dmtNYjVvVUNqbWlVYmYz?=
 =?utf-8?B?L25zNFA5aThhVzBZOW9EQnZ2eElRRHFqUUUrRWVlSHgrZStBQ2R1ZGc3UHBz?=
 =?utf-8?B?TWQyRXQ1UGNBM29VR1BEVG51OUNLUzZTV21Cd2NObEUxeXZ0R1NuZE1ETTV6?=
 =?utf-8?B?T1Y4cERhd0tCU0FtZ3BCU1R4YllodDBVOTMwQlF4ZUZwSExoT2o0bW5hZDdi?=
 =?utf-8?B?VlR0Z0s1eU13PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE0rUmVpNC85ZnB2aU1TVFdWbWc0OUdHUmd0a0d6aVJ4MWdWR2J5RTd3MDZK?=
 =?utf-8?B?VW1wWDVCbWJqNzJXS0pzQ1VNTlhUeEFnaG1EZ3I2czBmeURQVjdNRkdCeCtD?=
 =?utf-8?B?SmlFTCsrYWpsdUI1U0E3VE1UdUlLQXFBTVd2ajh5cVhRMk1Fa1oyd25QbDQ4?=
 =?utf-8?B?dXIwT2toQ0xqMGJTUml4UzB4V3VZK3pRZDRlTkVJWmFSUExWZVBaR1Exc1Vx?=
 =?utf-8?B?QkNHM1pzY2YzM0w0QmtxVFFtdlM5dUlKalBMUW4vZERYNmZJMzBObmdNRUds?=
 =?utf-8?B?VXMzR0k4ZC8wK3ZvZ3huQ2NLWk9razg2UWtIeS9sZWtabU9QTS9pN2lEYmhz?=
 =?utf-8?B?VVIvYkJjdzRpZUwwSWFxTENyRG5WakpHcWdZTmlMakFLVklDUmFZeWVndnh5?=
 =?utf-8?B?RWtKZmxFalNFaTVSb0I1cXlkODN5L203VVZsZnNiNWdmOW8vTmNZL0xQK1Nm?=
 =?utf-8?B?SGpCTGYyZno4Z1phU2NTMDNIdUNKZnROcG5OWnN6azhiWlc0Vk5OQW9jMmwr?=
 =?utf-8?B?STZTQXZ4Qm5EbjRoZW83c1dPSmF1Vi9vQ01EVEVqZjJuayt4RXZCOG9qQ21X?=
 =?utf-8?B?TW5uNW9ValNSbkVHRGxhN1VvYXhlV3krNTdkUm9XU0pTYVBZRUVrUTZQRnZI?=
 =?utf-8?B?ZkZSMzdoa2V5UCtFdUNrSEJXMXhxZXJoaGFHWTZiSFlQNlNpZTBPNWV3TDgv?=
 =?utf-8?B?UGVvTmJvb29Td05acEF1TUJXbDc5UkJ5dU5MeWZWTXNpOFNTMGFVSnhnbzhn?=
 =?utf-8?B?WjFub0hQcXhUUDRFa2IxbnV3QWFPWHlvRUVvSmpCeU5xTXNGSnJ0S2x2Y1pu?=
 =?utf-8?B?VnYyMEZhWEZrUHE0SVpmOGQ5eks3V3F3QlI1a2RsajBDYll1NTJoazJacHhx?=
 =?utf-8?B?MVZVcFlIODdVU0cyQVFpa1VWc2lxV0VRMXNlRGFJMGZtVjBJRkplSDJUZzFL?=
 =?utf-8?B?UEh5L2pZSytPZXhaSVhFejlhRjVwRk5wamxjRUxHZ1JIaXlSc1ZtMHV3NFVq?=
 =?utf-8?B?SWkvN1dXNVo1QnhTOVZ6MURZMk1xRjBHdC9NS3JUUUR6bkhzVmg2bjRBTXpO?=
 =?utf-8?B?RU9xQVZvQnBVODBNWWNJRVN3QVozWEdDWjZicksxdUxGTi9ma1NDYUlaNkJz?=
 =?utf-8?B?N3FBOHh5amhUL1NuRDNYVVhzanlRbmY3ZTBYdFF1dHRJSXZTRjJtbC95RDlr?=
 =?utf-8?B?VVhCSWJtQ1VISlB6SmZtNlRhaXRnUW55NjEwYnVPcFI5QjZ6NDVYSlZscklG?=
 =?utf-8?B?elpEM1dGMWJnZTQ3VGJQbWlONVBSRHZ1TkI4Vk1ZKzlXNGNkVHkvUVA5azE0?=
 =?utf-8?B?UllhTmxBRDF6c1JwZTlBYU03eFB4bW5YcnlSU0Mvb3hMakFKTVovUmRmcG5q?=
 =?utf-8?B?R1pCcFNuajdkUkU0d0J4dEFDcFUzaG5YUytDRFNHTExpR2FhVGlsMUROZTNR?=
 =?utf-8?B?WEJwWnJITlB0YVhQcFZiMGtDN3F1NytWcllsazh4d3BSeGo1N0VHRzhOK2t4?=
 =?utf-8?B?Y2NQOGVEbmZJaFlvNS9VWUFXYWMyWm8yak5UMUdiZnIrWWxXWkJDblhnTnFh?=
 =?utf-8?B?SlBpUXFXRDNlZ1RjTXNOVjRxbXY3N3JEY3E4V1VtVTlQaHloNUY3ZURVaThI?=
 =?utf-8?B?Rm9ZbVZqVFMrYnhRYXFQYWdwSTNsTDZWUUx4MGNHd1JpRCtmV0pSRi9Eb1hH?=
 =?utf-8?B?bDA2NmFENmRXRnB4alJMRE80dnI1UmZkcElMUVRMS0drQTA0NVo2dXBmcWND?=
 =?utf-8?B?VEtTbER0eFVKazJsU09PSHI4NE1EMVJrUGh6WlpYU2dubmhmaGdjQ3h6OEJs?=
 =?utf-8?B?TXlUejB5TzlGVnhYenZSSE15NE9ONUhzNlFBaGxnWkhkZzUrQjRPTURuY2N5?=
 =?utf-8?B?RjY3TG54Yk1ZeDdXNXRlbWJWUms0bzE2YWNRR0VpQlJTRkZJbUZabld6U0JF?=
 =?utf-8?B?bmt1SjM4emdxUmJXcEJ1ZWJXRmNHK05xTENManVFT29NaTMyOEcrbllRK1gx?=
 =?utf-8?B?eDdtRTU4YzEyTGpqdWFzakxxcFdDanpkWkVvaEdWeUJjZ0Z6alBibHUxZnhD?=
 =?utf-8?B?cWZwa2xSQllCTGFmM1k3SVNJMWsydEVCQ2hCYzhtbjd1Qlp6SEtxaU11MFNL?=
 =?utf-8?B?aHlKMHo5MzVsUTNGaGswVzVUeWZSaThXWXY0dFJ6MkgyU1BNQzduTXVWZW9t?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bba134-1fc2-4355-4eae-08dda8be69d8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 08:03:13.1362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZiQ8oF7xD8slvrog+EMnkxUQLXdouX8xGwDnmVvYga3G+oz/MJarOqZlUezBV06ElI/up6KHn3iEtqAN1XTNUgJitMJ6dQGBe7jTGQRBHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6961
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

Hi Janusz,

[...]
> If successful then that function, or its execlists or GuC submission
> equivalent, is supposed to be called only once per GEM context engine,
Could you clarify "execlists or GuC submission equivalent" here
- do these functions perform similar reference acquisition,
which may be lost along with some other data? Should they also
be modified to avoid similar problems in the future?

Best Regards,
Krzysztof
