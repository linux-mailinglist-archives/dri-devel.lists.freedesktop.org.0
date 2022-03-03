Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C674CC4CC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16B010EBAC;
	Thu,  3 Mar 2022 18:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AA110EBAC;
 Thu,  3 Mar 2022 18:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646331151; x=1677867151;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=umTC8Qfmuj+Ho9IVbEsf2oDu0eL2urXELX/pRkyqQoI=;
 b=KTMKrxp8K8auH6RKpeuGdolKKAERByGn2FdXmk+XKw4Gcxl1NTDV7kUY
 he8xUyMQpgFhSrMdXuuofy0hedOvb4W4fUMIkjIV8Y/cgIVnB1OxKAt7D
 fisfEA/OfirY1zQQ+lmoaCBXl7WMspwj95Quynhrk7oH4r+Oqs9b11Pzb
 +jrzJ8m+3jbbTTgu8bU3jpvXcGDlgF7FuBi846HF361LIA1xsjsjERB+I
 Vue53WwF4nKbuaTqtXvdLqbl4QopW+VDsHpFtKdjl7mbfn4HCKImY4lZi
 P8n9DOcvDt9q8Un0EtiMKmU99yQNQWFHE+gcFC0pT60WxG9+NTp6Le0R/ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="278447081"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="278447081"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 09:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="609658629"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2022 09:58:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:58:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 09:58:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 09:58:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIE6HR7Mz2teVmdItlBBGazeRAIzs9z0F+GDMSxe901vtb/kWvoRwXKSU4kWuNx4Caliu+UTqiUooEwySwTEszAgnTI83K03/JQAocdj4PVacNAF7IszbuIOkVaBb24WvV3XO+16rXJeiid9YLkV0F98JKoB+mYgNappOfDAZJt5ReGCIDbXNTfP3fLsDKA/TWtt0iUNywB1rGV/H7iSa2ThMsgU+N2ih96IJAnjQ22uf2SD5qxFrRWpdpukX0mMRCWMxb6waDHXL1gmlDsTL8+MImrlkFPKdx7k9ayBc4yzVLQ+BHUwGLRuU55myR7tKXeBRSOPOtrV37c9JQ8JyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXbXlfL+FFln6sqUdOPXLoBMSQoQlDBdCFDqQxFHPfc=;
 b=Udj2e3jKOW8rMrrs1cTFblxQer/Rdoj44a1ByKKwHIoq1yP1ZzYRLzQBwX/p2UNX3AQHM37BQhkvXLIPhrqpH0sDe+Jni1bbqBlUanOxs/aEaiX8piU+ayOZ1Tn5y3lYHMX2MRX78UTU1OQAlM1De+dtvS4ZEA/Be0Ng8/3iI41hZ5UflzgydKsMPODvGTA8kfX7KZNQfVlYG9XWFWVR1Fz+C1vUFETyfQyEEBAnjjQkapl7CabfpUAOrB0LBQ4eJTLa/iHPpvOX4MfBXFVS9f4Qh+rqUcujVN+16bpj6PTmOg88PGQz+vAlFZlSH4SLkrI0ReB2dC1DXKmn4Rzp9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BN7PR11MB2708.namprd11.prod.outlook.com (2603:10b6:406:a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 17:58:49 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%8]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 17:58:49 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/7] drm/i915: Use the memcpy_from_wc function from drm
Date: Thu, 3 Mar 2022 23:30:06 +0530
Message-ID: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0157.apcprd06.prod.outlook.com
 (2603:1096:1:1e::11) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31270f59-6f9b-4634-bf2d-08d9fd3f783b
X-MS-TrafficTypeDiagnostic: BN7PR11MB2708:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtFwd,ExtAddr
X-Microsoft-Antispam-PRVS: <BN7PR11MB27088C48CB543D1191E9E4789F049@BN7PR11MB2708.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: koHZKh6ePFXWESxe+Kee9yQELxLUvz0LkWN8kzcQPgqYNdPuqG8jlXjTP8e/v4kz0BXvWw7SvALwScKge7WWRc7FDMu5rFYNuVNDNNIJ4dJn7ZsT2MFmUz1/Gk28cMgfm0Ep7idBuZIVCGUzcviYqVrW1vkmmRQ8PHYCwUp7QKP8wJIJ5/jfN8WLuu59s4TPEPn76IOCiKVYGAarwFTJRgXNIri5aAeHOxPxjNGEUdFp2rcVR/jzl/EoJ+aYy9qBGVmvNRzCOABasm7SummYTtYgeuJgcwzRfOPCCYw1E8Ab6aD7r9zTSgFuEEOLLHs2uvofh5LrUgwIjSTKxbqCP3QfWgA4UKMXdNHPY5A0EehwDuz/+nL/QAoMzGTYDdd3/J8skXwWiEHXgDjdKTzcX5yYy9RYpUpxC5LaSvjnpfDptUry3+OOw24rEUYbCBuBIuzoD6M63/iPtiTDGzsHDuEaZA7seW03WWYSEvTI1wVZmA6Hmz3+aSOQOC2vup4Ahd3JuGdQYosdP/67L/BfX3WcxpgupTtobakjX6Vt0zi31uuAufS/gWAm41jYuk/sf6+eQ/PjPlizt2nDiG1VZ4T2nWhtoOyfc0vpXk9kQdcunRsoxzNrbvZrcgZa204m83fW7W32RItZOD9horCvHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(83380400001)(38100700002)(82960400001)(966005)(508600001)(8936002)(6486002)(8676002)(66946007)(36756003)(66476007)(316002)(66556008)(6666004)(44832011)(4326008)(5660300002)(1076003)(2906002)(6512007)(2616005)(26005)(186003)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0hXNTZINzI0aUpZK3ZsODQvQ1ZJTXpCTTc5clQxV3dIeUY2dTQ0WHZ4bjBo?=
 =?utf-8?B?Q3M2eDcwbkoxTEVtcGhIaU9XdkpkbER0VGVKNlJ3cnlSMUJOa09XbFZEbHRL?=
 =?utf-8?B?bjdtS2p3WXZoNjBxcjR1VEhGU1I0Yll2d0xyb0drakpycUxWNXFtS1pGc1Vy?=
 =?utf-8?B?QW1jVUhtWHZrOGFmOC9tbGlham5HNVU1WTJVTjBXY0ZuNFRpRWpzbTJLNndi?=
 =?utf-8?B?UFlrbm04cmNZQUptc2N4Y0dHdStNNmp2ZDFoaHZnYkF5dnp4M2tUNmlQQ3Bn?=
 =?utf-8?B?eWQ2UFcxdUR5MEkrTWQ0MXEveVBjU2N5K05nVDg1dHAwMnZEdHBFN2tjNmV1?=
 =?utf-8?B?YThoOENlZ1V4Q3M5bUFIclk5Tk9KVEJ5ZTM2VjdzcHBWTzQ3dXlEczhYdFZt?=
 =?utf-8?B?UVZzWms2TkZ4eVNSVEJkWEhHSkllRmlSM3QxNkwzT1FIUzJMWG5HM0h6SFZU?=
 =?utf-8?B?dDY2WjFWV3ptcHp1U2xnUkNLK2ZMZVdYSlA5bEVzLzZFZHViU2hsWVdOcXNG?=
 =?utf-8?B?OWFyU0JaYVAyT2t4aUJHNUxlZkdpMzhwdnJNUSt6WkllTGtiWGZKWmpkSWt2?=
 =?utf-8?B?aGFDc0NsMldiM2x3bE9DMTQwaURzeXprR040K1FqTW9scG1WTkhXanVtUWNO?=
 =?utf-8?B?MG5UYzNySWgzeDY4ZnU0M3YwVEN1Q0RQWmw4c0p6SXg3REI3NFBpNkRNK2Rk?=
 =?utf-8?B?VFhBcFFCTndtS0FqU0x4ekVFTHRyYVB2aUxVUHduTXlFZzVVeVZEZTFXekNE?=
 =?utf-8?B?Ti9jK0ZNUEVQS0ZPWjlJRDlMamhHV0Npa0QveFduL2xqdkJld0tKS0hCOVZQ?=
 =?utf-8?B?TzE0Y3VNVjgxeFZud2Z4R0VnOTN5ZndMczF3REFZZ3hoVU1JdE9jRHpsWFA4?=
 =?utf-8?B?R1pCVXBBRXBheGRMR01teVROVWZxZ2JMSjZnMG1OcUZPQU8zc1l6MitvSjBy?=
 =?utf-8?B?cVc1cWlGdEJSOFkrQW5MRzhURkVZT3lxTytoRUtqbzRZeWtESmlmRmdWcmVN?=
 =?utf-8?B?Tm9Ya3ZuN2dDM0RxQk5jd1NzQnZjMTJVU214eWkyYXUrK2VraGNwZ2pMVSth?=
 =?utf-8?B?YjdqWlJVbG1sK3FlRjFGMUh4eXBEMklNdzZ5bnpvWkRVNklCY1Q5S0hmK1dF?=
 =?utf-8?B?SGg4VkFUQ01paC9keU9XTExjUUU5UUQ4NFU1Z0twVVVhVGNBOWJSZkxINVYr?=
 =?utf-8?B?Z3BOZVNCZTIvZy9NRHJKd1VWQ1RZVnREWUpMRjdGSGswZXBSU1NhMENSS1l5?=
 =?utf-8?B?Y1ZXLzF0N2lLRzFtU0FUU1V0MkdhY0ZZUHMwUGdWMmhtQVdiLzRRM1FFV3pR?=
 =?utf-8?B?d2dtbkNHd0FOeCtxcXZsQUhJSnhaT2szVUFGNEZQeDk4SGVGRDZIckFKekVP?=
 =?utf-8?B?L0tUUHV1MjZ5aHQ0OFVXZ1dxMitPQ2h1cmlwQXFFcHRDdmtkVW52SmJGZlh1?=
 =?utf-8?B?a0ozVkhGU1RQTzdqYzA2RkFzQTNzaGRqMDNlQmJCaWU0S1ZJZjJCRzhJTlBp?=
 =?utf-8?B?d05jSWpSSW1hUFJORnZ3K0lHMnBtdFd0VnRrVEpPSlBpcTRRV09TVHF1S1FQ?=
 =?utf-8?B?UGF1SVpMbk9yendnQUVZNXhvcFkwajNUTWFYb0R3RGZtSkNxRWlKWVMrSml4?=
 =?utf-8?B?RTFwUFZ5am54bXY3aE8wL0V0cmxKV1NTM3RzanhqSXo2cS9sVlJscGt1N0R4?=
 =?utf-8?B?b0JSK1hVRGVZazVUaHdqWFNmVkZuT09qaTNpdzExVjhiZ3laZTc5QU5VTnN6?=
 =?utf-8?B?WEhaQzdRU1F0Z0xsVGdTcW8vMTgzT0pvY2xJYmZpRHE0YU1VRVF4Tkk2dERH?=
 =?utf-8?B?QnFxbVArdkhQVXByT05HZEhVRlRVWDdOZjZ1K01MbFhnb0FUOTJ4L2N5VWh6?=
 =?utf-8?B?R002TERiWDFLVEFLUVhNZWsvdmx4Zm5iSXdCRm1Xd042OGFkUi9TR0dzc3Yr?=
 =?utf-8?B?NkdsSm9MUEYzSzVxaTB6NGg4bW1Ib3Nkc3Q0OTlZb2ZPT0g1NEFzMHd2Mllk?=
 =?utf-8?B?RGxFdEFGK0krZGJQMnFRby9FK3V3ekNEcFdaNmlYbjVEcXJ5ZzhQVHlNV3Zx?=
 =?utf-8?B?bmFHV3RBazA2Vm9rM3VrNlY2S0dJTUdvWXJja0k1T2ZVUk1GNExlMFZpNHlt?=
 =?utf-8?B?NEtnTW0zSWRRb2o2TXlMWXRjYjBhT2FCdnQvT0JqRnJvNjNLL3B2TUU3bHhj?=
 =?utf-8?B?R0FnREZDYTIwMDYxMU40V2lIMDVjeU50VlpIeEFqcW1CNHJpM0JXdUgzV25n?=
 =?utf-8?B?R3hkZGttN2NpSCtzeHhYYk1kNG56ZGFSZEJSMnBUaTZ0WlZKYW5UY0JneG56?=
 =?utf-8?B?SVo3YWtyVTZBQUpQS2pWTjRRcGZ4TXgrOG93dGI5YWw4eHIyT3NjUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31270f59-6f9b-4634-bf2d-08d9fd3f783b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:58:49.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YiupA5+C20mYecGyzK3ZwLc2W98zHv9ekVUuPoczwS9Miw0umE1BYDrmrsxxqkJZXws0j6BU9E1ZnjoAKr9nMEILIbvCtF6ezPQP+vTBdU/vyKIT7+ofGxbpEnrErnq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2708
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, Jani Nikula <jani.nikula@intel.com>,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com, Chris
 Wilson <chris.p.wilson@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, siva.mullati@intel.com,
 David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_memcpy_from_wc() performs fast copy from WC memory type using
non-temporal instructions. Now there are two similar implementations of
this function. One exists in drm_cache.c as drm_memcpy_from_wc() and
another implementation in i915/i915_memcpy.c as i915_memcpy_from_wc().
drm_memcpy_from_wc() was the recent addition through the series
https://patchwork.freedesktop.org/patch/436276/?series=90681&rev=6

The goal of this patch series is to change all users of
i915_memcpy_from_wc() to drm_memcpy_from_wc() and a have common
implementation in drm and eventually remove the copy from i915.

Another benefit of using memcpy functions from drm is that
drm_memcpy_from_wc() is available for non-x86 architectures.
i915_memcpy_from_wc() is implemented only for x86 and prevents building
i915 for ARM64.
drm_memcpy_from_wc() does fast copy using non-temporal instructions for
x86 and for other architectures makes use of memcpy() family of
functions as fallback.

Another major difference is unlike i915_memcpy_from_wc(),
drm_memcpy_from_wc() will not fail if the passed address argument is not
alignment to be used with non-temporal load instructions or if the
platform lacks support for those instructions (non-temporal load
instructions are provided through SSE4.1 instruction set extension).
Instead drm_memcpy_from_wc() continues with fallback functions to
complete the copy.
This relieves the caller from checking the return value of
i915_memcpy_from_wc() and explicitly using a fallback.

Follow up series will be created to remove the memcpy_from_wc functions
from i915 once the dependency is completely removed.

v2: Fixed missing check to find if the address is from system memory or
    io memory and use the right initialization function to construct the
    iosys_map structure (Review feedback from Lucas)

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com> 
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chris Wilson <chris.p.wilson@intel.com> 
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com> 
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>

Balasubramani Vivekanandan (7):
  drm: Relax alignment constraint for destination address
  drm: Add drm_memcpy_from_wc() variant which accepts destination
    address
  drm/i915: use the memcpy_from_wc call from the drm
  drm/i915/guc: use the memcpy_from_wc call from the drm
  drm/i915/selftests: use the memcpy_from_wc call from the drm
  drm/i915/gt: Avoid direct dereferencing of io memory
  drm/i915: Avoid dereferencing io mapped memory

 drivers/gpu/drm/drm_cache.c                   | 98 +++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  6 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      | 21 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 15 ++-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 45 +++++----
 .../drm/i915/selftests/intel_memory_region.c  | 41 +++++---
 include/drm/drm_cache.h                       |  3 +
 7 files changed, 174 insertions(+), 55 deletions(-)

-- 
2.25.1

