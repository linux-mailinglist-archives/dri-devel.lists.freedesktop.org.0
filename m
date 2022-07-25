Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02054580498
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 21:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AD914A6B5;
	Mon, 25 Jul 2022 19:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1689218AA9F;
 Mon, 25 Jul 2022 19:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778091; x=1690314091;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=UP6mz88+4ksAx7GCa1Vs21u/rCMMXbRiJvpX52djnkY=;
 b=byTNgoXhDtPoLDIajddBdamwuuLc0/5j7NrbzDmiCsCD6POZyWHYTX1+
 MRWuwnWJcCk4J5JXj6LcPsGAfKVyo9Br/uN082Ov35yEzfemMly5MetfH
 tYaEhe3isu84oSlZ9ryHJB/WQA4gDdE8Q2TpdVedsaZ5wX0Jww8uoQADq
 IULJKwGd1ySt/yjF2UE/wKuGLFSfulf1CGkRcWly0U4wQTyGoTey4tUid
 lA5Vp9k+0HlmDfaabMuqHo6tRMvm70eFPgnNyl2n6oQDIijMVSxOQbUvc
 00RCbK/oKVyIFI3G1xiq4HCWHBe4tUsj7BR0SHD9Fo5vxplti4pYjJ2/Y Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267552885"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="267552885"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="741945669"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2022 12:41:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 12:41:29 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 12:41:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 25 Jul 2022 12:41:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 25 Jul 2022 12:41:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHcfV2DPB/M/dEre4PsZsSOfxIzlDKCNI3Xd9yxlYZTw4v/yYOy5SNMQF/i9U+XZxZFy//uKkeuaiswlU7ua5aM2SaWIGDY1C5jRgQ3QTBRGUDcmBjUm0e5JScdMZM3+6oKFf+TxGH+bXtwhlECsGfCg4EeBVERF790Q9zL76EE9nx81YW+2uztmvV11N4WGrCW4NKSL7PcaaNNKZT9ZLjypkqGy1T8tuI3PNokwLGr4gAfjItaw7RqgoX6R/U60wUJNzU0JdFPqJ9i6CStNS4RtSA4nGhydviqeeGKC2g5Fu6yxMGR5i/VPdJY+jRrkhI3kiUbO7oH9sZZLjxfBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R71W4TYm93WZKe996AzHZxJ/WrPfrPWIJzo8BEevNhA=;
 b=Szzp2LNtj9sB1vw/yMOXEaNyr0FOIeVKiNnB7618g+v+E4bHzCVtFZ0P2mhIRc4prTx147f5NdU7FPhuVBfDOx2z65CsOUMEGfGyTjD3rCKfnlWI1XdpL/XDmudV5grDZttlidNFq+tH2WE1abeIzf8UwK505gy/OjUsnaktWJVd5qccVjvvngjNVdmUng3HKdmquYq0hXiiepC3tHeFSHVstQz7LmkJtCuRn8EbiAJS/2HtVPaS0fivEyCMIobdKs0tBniWpvb1CVrKE/iwsKNFiL3iUxg45Nv+qRbb7I4romr8MLb4ec7Md/i3PLg8NThSsYPiyl0lNEtJ4hRXHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1372.namprd11.prod.outlook.com (2603:10b6:3:11::14) by
 CY4PR1101MB2216.namprd11.prod.outlook.com (2603:10b6:910:25::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.21; Mon, 25 Jul
 2022 19:41:27 +0000
Received: from DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507]) by DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507%3]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 19:41:27 +0000
From: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] Sanitycheck PCI BARs
Date: Mon, 25 Jul 2022 21:41:03 +0200
Message-ID: <20220725194105.4054734-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0324.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::23) To DM5PR11MB1372.namprd11.prod.outlook.com
 (2603:10b6:3:11::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e0d911e-344e-4382-c275-08da6e75aa14
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2216:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6IIIuZJvbTvhMLvkQ1+aVzpzJfhNZNnUuvtutaduWGQjBVVrHYbOdtqsR8i4HiJ9TvaY+u1V9AmVqYXI5JqtW7QndISL82aNZneOhSSko+ViUAwLzblSaxgzdITyZZccEpTjN2R6titZneUxhncMWPrAU7o8NdUpB7lVhRQJMnGJA5swr3EEruWq6zw8dcK5Tf1+7Xk5zb2c4iPLrbpAQ/Jf4Gqq/u6hR1eVfh33blQvM+1SmLSCFWJJjFeNLksG5FA+erArDKYzPNlam4s5s69yOQ5zaJBADVPPTbuIWvCzrH7pLOT6T9sBIuAaQykVn4H4o0dop+jmVSp5S/8dY38AB1iC9cCFEEl9RscMVyEhxQzaYIlYJKm8Nf8IzuFZeNIqoCMtSc1L0rz49LVDfPSciqTnpw3E+VMRvdE2McO+q1a6zdqAU7VdLgP1C3ADlaPMU6ywo49XnOS+OV3cphYhleUAL0wYfOJDdZ99TDwi+wr+NzriN/sAvhJdrEg1Ed/Ni1YP2X7zueSrw5J9urc3TZNFK/Yn4gF9LjbsfP/NnMPuoJyBzyr4nfei+hjyp6UQlQA6lDqfKvXLsJQ+IUM0BsA2Cz5fbpRqXFQM9cYJDDcFL63WzyGKa1j6D8C7KyBKLSZKPYkEZRH7u64Q3XXyaPfuWtcBwJQMksiJZSnIf4gv6At1tnwy+JCvniV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1372.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(346002)(39860400002)(396003)(136003)(966005)(26005)(6486002)(478600001)(1076003)(5660300002)(8936002)(6506007)(2616005)(6512007)(186003)(83380400001)(66574015)(6666004)(41300700001)(66946007)(54906003)(38100700002)(4326008)(86362001)(8676002)(316002)(66556008)(36756003)(66476007)(2906002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0Z5eDZFSjZjVEZFR256THBYL0hNd1JDNjdNTWtlZFI4N3lXV0plSFAya3cw?=
 =?utf-8?B?K3hDL0RSRFVPOEthODBZS01HRmxva0Nxa1crL1A0ejZ2elR2MXRVMFVOOEd5?=
 =?utf-8?B?WHU3NVAxVkZRdllFTVREM3pBWG95QjhYRnlkZkgvTGRhU1FNUE9HT3k4SWcw?=
 =?utf-8?B?aGtkUVRxNzFSSFlCMS9WTThjYXJXUjE3OWtjS1h2UVhjekVORnppejlQWjQv?=
 =?utf-8?B?VkhIemxDUnRUeEdjMktnRittMDdoMkM0Q09wUXUzalRDdlRCcmNQUXBqOWUx?=
 =?utf-8?B?cWNtY3hrdGpoSTRTL2UzSFd6NWxpMjQwdThQbDNyQ01zaXM4ZXBZT01RWDVu?=
 =?utf-8?B?YzhRaG1MM3RQREw5NHl3dDk2UkJSYnZRdHc4bHYyZUNJRS9rUDRVQjZsWDMr?=
 =?utf-8?B?UWd6V0t3TWtaUkUrbUsxMEhYRW4xc0JkaFV3ZGJpVlNianJiOWtxVlRxbGNF?=
 =?utf-8?B?THpZbkdxaXpIQXNidGlyOXVPN2d3UXRxYURUdzZDczZIQWVkNDd1VUE1YTNN?=
 =?utf-8?B?djlGUVRLalYrZGtWeTlUdWFrem1BRGNQQk1kQXlXQjZCLzFqZ2w1OVpKZEc3?=
 =?utf-8?B?d05SYnlGL0JTcWZKR0RUdEFta2x0RlJHdmY3emF2N2RxbWthQTVqQndRYzAr?=
 =?utf-8?B?WWRDMGk5dmR1NUpCUWJjQVBKOFdNUjdtUFhUTWlmc2NHeG40aVhjczFIR3dr?=
 =?utf-8?B?bG85S2hoMloyRExqMGE5M3NyQzU3WFR4c1FhQ2NGenFublZmWTNraFR5L3Nl?=
 =?utf-8?B?TjlFK2RaSjdDcFkxcmNoQ2pITUI4aWk5NytNUG5HNEZPTzQwdVFCNDVIeDN0?=
 =?utf-8?B?U2UvYUFZUWN0aCtDMUlLaVlhQjlkN2hZeTZCMDFOd0VUd3UyOGkxWUlMUWhy?=
 =?utf-8?B?bmY3cVdNMVhQNllSdFAwRDQzeHlYcWxzbER3d0RuQ095T2tEZEZETkxmclc3?=
 =?utf-8?B?RXg4cjkvaE12bktrMVYwV0puWkkxdDV0VFhTWWZsb3Q3WXN6WVc1WW1ocmxU?=
 =?utf-8?B?ZkVDWGhHTnEzOW1mSHNtYUlkdnk5aE13aW9NV213c3ZYU2JvalYwUE53WDY5?=
 =?utf-8?B?NlI3MWF6ZVM5eWZmQVp2NmlWOFU3bDZIOGs3TzZjYkEwYkJET0lnWFY0TktH?=
 =?utf-8?B?bWZaREZaRHE5OHJVZ1hnM0lPQ1I3V2RreUNkUkFGZkJ0Y3hENi9TbVhQdmtk?=
 =?utf-8?B?MEVFYmttYnljcmpSWDgxUkR1emN2V1lyZDVpVndHNWtNVlRIMVl0L09hekxR?=
 =?utf-8?B?Rjg1UEFkQ2FkSElSSjRML2tHU2pFZEtQMjRiS1ZaL2w5YjRQeVBmR2VLamc5?=
 =?utf-8?B?c3VjSkJCZC84RWYydWhXTWd3L1d1ZGlaeVJ6UDdROEl4WnM0RWtkQnJzR0xp?=
 =?utf-8?B?Y29hbWVoc3FIZVJNVHorSDBiakFTdnpodkppQ3Y5YWxOTHhjL05hNnNtRzh0?=
 =?utf-8?B?bCs3THZPc2llWjdvc01hVE5MZy9ZbHNsV2E4emp6TS91NjNpd0JnM3N1SEtB?=
 =?utf-8?B?TTFjV3dYUUFTTW1qK0V0Umk5S1NacjZ5QXNxVk4xcGZqVExpV3MzYjkxR3ZH?=
 =?utf-8?B?d1YvWG5CZlFGbzJIZXk3UGdJMXNVcXhhK3lKekdkbFd3QXlWOVpnTEhsWVh5?=
 =?utf-8?B?ZWppMUpMSzE4NkJIc1BiWFVNQW9PU2ViVEYydVBTYUhJNWwwR3NVMTZkcDFv?=
 =?utf-8?B?K1JmZjRweE54WnRoOEVBcUlCMXRYcmJtbGNBVDM1NldMVXJWdVMxNVpLWXlz?=
 =?utf-8?B?ZnFNb1dRbFdlaVpuT2JrMlp6S3BuZTFhSFpQSUNjVktwWkpNMERBMzA3ekIy?=
 =?utf-8?B?aHM5cWFmenNNYmNwSGoyekVzejNGeGlBdWIxdjRJZEw5eHdGZHhmREhEUVZn?=
 =?utf-8?B?UWZQN1VMWG1ZQVl5M3h4TTgzdWszbWptTnp4ZDY2djZUUXp4azNMcGtmVHRW?=
 =?utf-8?B?Y0NOT1M5cUN6djZCSEkxU05PYW9KV1JyNnhWRnBDa0RuY2V4R0c2UFBUeWJ1?=
 =?utf-8?B?UHdHOFB2WXl4VDY1WjlIU3BlWGtxWE1DdkxaQ0FjaGo2ZDh0a3J1b0dEYnIy?=
 =?utf-8?B?c3ZqK1VzdEpJaVlmVTREZDVNYis5bzNpZnVBck43a0tqV1pDaGhCMG1Fb21s?=
 =?utf-8?B?eEc2K3paaGo2VVpOemtLdHVDWlZNendhem4xcU1rbDFxWFRCanZLWGM4VmRG?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0d911e-344e-4382-c275-08da6e75aa14
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 19:41:27.2875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQcqnv1ugscRzwma3t0NULUYqUDvHl3c2en4TxDHDC7R7n3qIhqdo1U8XPYjsPdQl3FfKAuNUMqUTzMDoHQcjZqt1KYPVwMhzYAuC/j59D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2216
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

When initializing the i915, we want to be sure that the PCI
BARs have been properly initialized.
As part of this series, I have prepared two patches,
one that introduces BARs names to use in code instead of numbers,
and another that adds function to validate BARs before use.
This is an evolution of the concept I presented in the patch:
https://patchwork.freedesktop.org/patch/470184/?series=99094
The main difference between the original patch and what I have
prepared here is that previously I checked all BARs at the beginning
of i915 initialization, and now I only check BAR 0 at beginning.
This is due to the fact that I have noticed that it can happen that only
BAR 0 is available (I have observed this in the case of virtualization,
on some platforms).
Therefore, at the beginning, let's verify only BAR 0, and the others only
before the first use.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Piotr Piórkowski (2):
  drm/i915: Use of BARs names instead of numbers
  drm/i915: Sanitycheck PCI BARs

 .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 ++--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 11 +++++---
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 16 +++++++++---
 drivers/gpu/drm/i915/gt/intel_gt.c            |  3 ++-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   | 17 +++++++------
 drivers/gpu/drm/i915/gvt/cfg_space.c          |  4 +--
 drivers/gpu/drm/i915/i915_pci.c               | 25 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_pci.h               |  4 +++
 drivers/gpu/drm/i915/intel_pci_config.h       |  7 ++++++
 9 files changed, 73 insertions(+), 19 deletions(-)

-- 
2.25.1

