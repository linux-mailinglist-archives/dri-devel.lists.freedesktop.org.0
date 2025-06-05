Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33086ACEBD0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6017F10E26B;
	Thu,  5 Jun 2025 08:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXLOLDqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2322710E0D3;
 Thu,  5 Jun 2025 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749112142; x=1780648142;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=h4Fnqcxtlm1tXt8v54uc1wLk6PHyBXqwNuDLshs6/yM=;
 b=dXLOLDqz4lnqyn5an//aKL0syly4vdBicJ19OvBRpXiMv8LnZFXE9n4I
 vx2HJpQi6LzTNvSRfbH78qmo8j6qYiB8RQI6NvS++CnAtJfqScCNeaeTp
 59p1/bGtqiYX6fXIPSirWdda8loPPfe/V4Zoxqg+o3qQpnSoHemxxs5I7
 TkLATs6ozx+PPurCvCKsOsMYDqvFeS3NMB8uoqQSWocC4i7HR5a2UKP8T
 BbTPrJz/wzKu2i2AL7dT05ulq1aJqSgkUn6bU9qW9ChrZ3sHH/aOatQDA
 fvh3ipDkdv9t68zpfXAMGkyw20kNdYxNkQiS+M9HU+oSlT35+v8Nyp6DS A==;
X-CSE-ConnectionGUID: ysDyM6b/SpqMYPdOlDuFMQ==
X-CSE-MsgGUID: /28MAvEnQRSz83ltrhTw5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68771587"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="68771587"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:02 -0700
X-CSE-ConnectionGUID: 8PSfegGWRDSI6ynlEzbWqQ==
X-CSE-MsgGUID: hranZxyST/u5YJiD5nwJQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="149274056"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 01:29:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 01:29:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.64) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 01:29:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2DiBVM2KKOxPqvivWjzb0WHWm1PqZW3dkpBClJJ+hWr18jtHuIj6tzxQuy8BZ1Kzue8+7t9eTn6N86hZgIgljTUO8TQlrf/N8V0spsItIBjurtO5/wO1NLd+or/1VmdYhSIqlsq94tZbj0KXUr5lnBcv2ccjtccUDtU11xzjYk/ns0L63qBtVjCoszDUkshkE3BUeu3AmF5+leVJBgSaXMSAGNfx4POx4BpIHJgXrwKwI75n1YNvObBNFkwrYQV4gwBj4FLUdNib7qeiOqjMfpBc6YF50X8kpHRNQpWZ9gcgu7DbilCVkev9cW8r3h7iCzsFoB8l7URVzTGfKFWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9piDDO2VbtuqQgZgQxW9S51pvHd59MLShc7DF9lfGM=;
 b=faZaJaWip3oD9xtQUahgss8xtkTWZi3nMj73SMEiMEMeUZnRlUw+cQSW2f1SnyGERLYx4behhcb5cqrc9PBrhmETY/FpmvtuyIeqV7BPrKT2DpZWP3TQPj3U6JtfCiKunuPp2aqu5Jtq9HzwMlwuYsLX8Pv9eNtUgFR+dOrYki58j12RpQQHFfCwocHa57fwrMuiBjbFbBMl3IDCivetoIggXLhJkJi9Mg7AFMmat1KutFzb6xwR4XmdGEuP7PcLS7pSOPMy1Vig/nHEUXwvgZHUG3r5pVY233/B0NYV3c3JPB4vlFb+r7kqUWmvJi/dKi14R+b1DfNfuyaN49kQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 08:28:58 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 08:28:58 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3 0/5] drm/dp: Limit the DPCD probe quirk to the affected
 monitor
Date: Thu, 5 Jun 2025 11:28:45 +0300
Message-ID: <20250605082850.65136-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: a1dfb063-40b6-4682-a549-08dda40b03c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTlqZjlZRDZRNVJpU3FsWWxSWlJtQUp1ZzBIaWdhc29TOXlnaTJzQUg3UnNh?=
 =?utf-8?B?STJlc0F0Q09GdFZyd0VwRjBJMnBvZzh4TlJBUVhhajhycnVzaVUvQ0tCUjZ1?=
 =?utf-8?B?WkdydFFncFgwYUxMenBYODlUWDUybk9ianRUdjBWa3Z5QkduaGFZTG94Qy9Z?=
 =?utf-8?B?WGdKdDdnSURkbEwvWU5XS2dWbTdXakkxcjVPUENoWTJ5bE9Sd1JZaGpQdjVT?=
 =?utf-8?B?b00yWUVwQzFSMWR2c2wvblgxMFl0S1VBRzhNcHhpVWwwZ2sxMHViTnRjb3Zz?=
 =?utf-8?B?TURhMmdIR1Nqby83TElvVmR4c3NaYWZFMU5mUHIwbGs1NnJZcVRrQUR3c1gx?=
 =?utf-8?B?ZWlXcndsSjVFbURkaGQ4Yk5RdzE0NmRhMTNjdlNtbkdCaXZhbVUzelF6SFhT?=
 =?utf-8?B?VjFiYUU2aWNDc1k1QU9sUGVIOUdSOFR5Qk9zQlRlaytkVU9xcnE3Y2k5bWJi?=
 =?utf-8?B?Mm91UGplaGUzei8rNGZySCt2NTdrVDh5VzZtS0YyN09lNUFML1U1cklpSmpN?=
 =?utf-8?B?Y0NwcnIxend0YmdWbjJBdHpRdkc0ejY1MFNqNWIxemQxNFNzMjZXTnl2djlz?=
 =?utf-8?B?bzZvcTIyS2wzaGtPc2ZpUVR4UmdiSHNGSlBiZkFiTXR5ZFdOazdHNXpOUTJF?=
 =?utf-8?B?UDlWbFl1V2t6K3dNV3BhcDk0QVNPMERkOUZ5eGdMYlFVc2dkU2YwNElZUjNq?=
 =?utf-8?B?YmJUYVltaEh6QmRzUjdhL2ZYRDI3dlNCWTdZQVo1cDNLRGlzdnJMWmdJOWVT?=
 =?utf-8?B?R25leHQxeW9iRjByNWIrNEFMUTlWd3dMVTN1ZHZ3czVwQ21LdlQzaXZwZGE0?=
 =?utf-8?B?cFhLZ3FENzlmZzgvTklVZmxyQ0J5cURBNUpDK0Jhc1lqbjFFUndGM2Z6NytY?=
 =?utf-8?B?YzFvak1TL3F0bnhaRlJReVgyTUdRVWlvUVBUdEN5dUZHcnFCd3JIT1MzeFpM?=
 =?utf-8?B?V1gyUFU5TEt0M1doQ0hOVGR5M29Jejd4a0Fra2gwelBFa24yejBnQmt4TTAv?=
 =?utf-8?B?R3p0Mnd2MjMxdWhGL1lUR3RCODR3VGVBTEVCZGdxd2dpWkJtSE5LSWpqLzJK?=
 =?utf-8?B?ZkkreEc2WGFKN2N3VGxpLy9rZ1NMVVgrYW13dkp1Wm9pbjhMdUlQUm55aGVs?=
 =?utf-8?B?Y2NRdzhJayt2WFlvbGx1ZmpaZW9lcEJoYzYvd3JuaDEvaEpCemJNU3R3V0ky?=
 =?utf-8?B?Vzg4ZnI4VnJSdTFRU005UGJtQU9yaDFVR05jVjhtU0xqaWMwZXpXQVZPRHVa?=
 =?utf-8?B?d1UxNml6ZnhiSlFWZzhZVFIyb09VVlB6bWhHcVBzTjJFaXhUcUpDTzR5ek0x?=
 =?utf-8?B?elFyanNnTFBYNXdpMTJ2QnU1Z0hMWk1RQjJ6Y3JrUHR5V3c4cGJDZ2NSaTZR?=
 =?utf-8?B?V1NIOFY5cGg2NnB3RlFScTJlSEQvUGltUU9BbGV4ZVpXUU5Zek92dmVpMkly?=
 =?utf-8?B?bVk0MW95STNkRXhwRVVTQ0pXTTlMckg5Rm1xeXhuZHJtN3NnaFAwUlJTRHBx?=
 =?utf-8?B?SEh5QXRBRUh0Rm9KM1ErYURFMTdrZ3p4RUJCMG9DZWJWc011blNIVjNYYmwv?=
 =?utf-8?B?OG1jcDJHMjlCVWNkM3E2SzFlSXpFWGFNUmluK1BMZGNtZVFGeldjek9yVDZ3?=
 =?utf-8?B?WGRKNFpuRHpoN0UvVW51S0F5VERZSjhLbHlETjhKV09IOS8xRUppNHJhaEM5?=
 =?utf-8?B?ZGZKSEU5aDNTZER2b2JGYWVmQTZWMmYzVHRLUENPMm1Xb2NCMHlBK3pQYkxy?=
 =?utf-8?B?bExVeHFUM3BQSkUvVGZ4alVPK042TEhCNEZpdzhXQWtrQThHUkFscC9NRHJ1?=
 =?utf-8?B?SVJzNjZnV0dteDhTYlU5R2hxbmh6cGdKSVhBc3BaMkZQTEpKNi9ubUg5Umtl?=
 =?utf-8?B?R3c5SlBiWTZxRXZVaVBQdytobkYwdGVxUWpnV0cvdEpHT3Rod1ZhUWpna0dC?=
 =?utf-8?Q?QnzzfcIBbAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnI3eUhLeEYweXI2QXc0YjJiRHVObm1RQjF1cGZCSU1acUZ3b3hUVWFWcjhq?=
 =?utf-8?B?NUUwZ0tDUGFXVzgxQUZ6S2Z2aHVQajJhZEw0aW5pdWxzMXAzSnpieUlTNXZv?=
 =?utf-8?B?ajN6TnJhdHRRaGhsLzdRZG5BbDlSL3pEYkNjUmwwTzJSZVVKc3ZtTjdlYkhl?=
 =?utf-8?B?aGhCTmRXODIvY2xmZCtCSDVlOGk0V3pWQ0F0TUs0ellsenEwUTk4WS9qUVlV?=
 =?utf-8?B?c2E1a0p5NG9hdWF3VXFKQ1lFdjBDSnR4TW16SnBURTlsdXpaeXRPSnBjMy84?=
 =?utf-8?B?di9HeGRpd0Nrak92Rkl5Tk9heDlBb3NoZlV4WUttUEZJcFRIcy9SNDQ3TS9B?=
 =?utf-8?B?eC8zSThseXpFOXFpZjFrQjBMK3dlMDA2eGdRK1VYdnpBdjVPMllSODZuUmc3?=
 =?utf-8?B?NHRHUGxCNmwzWjhIcUJSWEhWYWxGM0VxSjFZblVkdmtjeFdhK3h5TytCVlQ3?=
 =?utf-8?B?RDk3enBIZlpKZTl0WnNxMVVvRi9EN2JWTitHRDl4MEFSenBQYjZRcGI0Yjlu?=
 =?utf-8?B?dnAzNDF4eVlXcGJtMVVXRVF5RmJDYnhUUlhtQkI0Q1djVHRFU01CQzhQNXdC?=
 =?utf-8?B?U3QzRVpaTUh3OE0xK2tubGZqYVJuZ1pjOXhHYVR4S3NzMXZFclFOaUFJbzFw?=
 =?utf-8?B?blEvbjNPT2JGcnRLNGZ4d2VuaHVyNktVR2VXcjhPbnFZcWpLakc5MlhCSW1n?=
 =?utf-8?B?SnhqWk5VcmxaSFo3bTRUYlV6L1ZiL3JscFFqMzRFNlpibHpwQmlTOXdMZWF4?=
 =?utf-8?B?RTY3WUVnUTZYWXpaQWJnWGhGc1A4aGFNYWRNSE1Ha0tVR2VBNUtFTTgxaS9Q?=
 =?utf-8?B?ODNSTkFzMW1ORTR0Z0lxS09vQitUQ1VJRzhYa01oMjNLdkxaQkJqM2JpWFZB?=
 =?utf-8?B?Y2ExOXBraGN2K0dhV1V4Sk93Q3BCbnlsZkErRGJPbzJiZU1leTg4RXhGMWxq?=
 =?utf-8?B?UjhLNVQvbzR0Z3pPUlFzNlRhUlZUL0lVdDAyWld1dm9BTC94VTkxU1dFVnY2?=
 =?utf-8?B?Ykk2UkZ0SFhHbFZ2RS9BZ3l3QWxDR2dwYXd1UDVqMXhadHJjVlc1MS9iZGd4?=
 =?utf-8?B?TVpnQlNvZXgyVDUwdnQ5QURCZ1NVN3dqWEdnODdRdjJ1ak92bUR4R2RiRkkx?=
 =?utf-8?B?WWEyNFp6d0NDV0tPQk1Eb2Z5azNxdWc2aXc3cVJoK0J6UWxhV0U5SFErbldr?=
 =?utf-8?B?ZnZ5NkZlcUIzNGhOM2IwQmg5ajVURXRNdERrRnA2S251RTNrMVFMWitOclV3?=
 =?utf-8?B?TGJRT0FuQzJQSDdCV3U5NUZhUzU5ckZEejZWMXByQ3FYZnVpaERTRlhuRmR3?=
 =?utf-8?B?LzNETFBhOHY0OEJEek9KQk5MWnJxT2tLS0c5aFk4aUxQendwNDhoNUQzR1pC?=
 =?utf-8?B?d0tVbGwrYlorUENvOWFqNmNKOVM1MjdwRDdsVmRRWE9ZcjJnbThiTXNZNFZV?=
 =?utf-8?B?VmQ3RnUzc250M1VXQXh1NHUwQXk2NGdxbVpNMmgwRmZyTEMrU2xqSTBidlBq?=
 =?utf-8?B?YkV5bHYxdlZwQ0hjazFraFhwdlFMb2M3ZWdCazQydEU0MlhIbjR1dEJmVEpL?=
 =?utf-8?B?MlNCNGlLRUVaaDNKVXpRYjBaeG40aktTd3A0RWpjM0FwMTBaNW5pVlNpMXRs?=
 =?utf-8?B?TlFkcWh2cjZ4SUNzZWprU0doMVFHOEV3U014aXpjYzA1VmFPQlhOSkFoUXo4?=
 =?utf-8?B?dldjamxzTUZSU011ZjRoYzVzbjVRYWZPOHRld3lzVTJrQndkWTd0Zk1lVEN5?=
 =?utf-8?B?VWVEalBWT2o1ZlByM2pZZEZnLzBKLzVhaVhKQmJVUU9tTjI5Z0F0WWRwamI4?=
 =?utf-8?B?YUh5Vy9ZWGZsLzF3bWJDeFJBc3ZKWno3NCtsT3ZTVnFKVXZDY2N3UUdLbDV4?=
 =?utf-8?B?emxBcnZrNzVQYW5qRmlLMVRYNlNId1gvT3o2QzZHM3JnTlk0Nm5BcUY3N1J5?=
 =?utf-8?B?T2tRSXM5bHYzNTZidjlYb2VUZ3pxK2k3RWV0RGIzYit6bnRVRGRsb2RIekph?=
 =?utf-8?B?MmJPLzNBeW80NWI0dXRqdzhYd1pyZTdjVlFCSEp5U2YwemtuYldjOExwWmh2?=
 =?utf-8?B?d0puZnlTMDVROGRyZHpOb0liU2NaSlArREwxMzA4eDU1bUlaSkwvWGVGbjg0?=
 =?utf-8?Q?s/ijUlQMN8uPSZFbxzAuDynqu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1dfb063-40b6-4682-a549-08dda40b03c8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:28:58.1899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrVZahkGSIdQNk6izh/W2V3V7e3A5ihPZd0jqfzmxdMnU4b/9EtWawyC6xIcoMjW3CpLaSgmrLXIP+/HN9yNyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
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

This is v3 of [1], with the following changes requested by Jani:

- Convert the internal quirk list to an enum list.
- Track both the internal and global quirks on a single list.
- Drop the change to support panel name specific quirks for now.

[1] https://lore.kernel.org/all/20250603121543.17842-1-imre.deak@intel.com

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>

Imre Deak (5):
  drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
  drm/edid: Define the quirks in an enum list
  drm/edid: Add support for quirks visible to DRM core and drivers
  drm/dp: Add an EDID quirk for the DPCD register access probe
  drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required

 drivers/gpu/drm/display/drm_dp_helper.c      |  44 ++--
 drivers/gpu/drm/drm_edid.c                   | 227 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_dp.c      |  11 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c  |   2 +
 drivers/gpu/drm/i915/display/intel_hotplug.c |  10 +
 include/drm/display/drm_dp_helper.h          |   6 +
 include/drm/drm_connector.h                  |   4 +-
 include/drm/drm_edid.h                       |   8 +
 8 files changed, 189 insertions(+), 123 deletions(-)

-- 
2.44.2

