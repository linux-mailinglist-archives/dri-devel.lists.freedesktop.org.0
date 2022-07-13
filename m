Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89702573F00
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 23:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044719BA32;
	Wed, 13 Jul 2022 21:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DD89BA32;
 Wed, 13 Jul 2022 21:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657747885; x=1689283885;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=Yt8LSaseORI4WGW/MNFNRCKtG8owUdoEVI9ph1fMBzo=;
 b=UH55Li4uh8IMIi47iZCtfXiq8sRpgbaFu5k3DhuX7gySCsdZKhKyjQK8
 84K/MMRA13C1Dx9NuXFhcAA0Q9bH/1qoKHqTCBaMv/paac0YXVzORfQc7
 U1DW5+oZiAEkmkEorK695+wDwliuq1BQyYhJwVO0HiRFS5rQwfnuDZcPq
 29lR87IPbFR/b8GUHScIU60EP7LvBcny+Q0WmmNk3IGpawg4prIwenmWt
 sD6ZHnmQzsfqQgShBmSb/ejRaW06jJGqsMecDLeXTZ5r+EDj047PpmAG3
 gYeJ+cON2sR5ZlSeTanv98ELWvdIMwuAcE9HFvrMY072HD77k4cnchJMS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="347032096"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="347032096"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 14:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="570799524"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 13 Jul 2022 14:31:24 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 14:31:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 14:31:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 14:31:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iT6ZDvlVy3EdqfYnChUdigJ+LOvLyVmhbQA0Azo6SKreg+EMjgKXft8GPIGjex2uBKy7whAVBqVpdEy38vyRrG0h/HXLUIK52Su7PCjnHOZTe6vuKm3dHt/zSyksmmmvOJAM9sctm5ohJBBMsedtemPR89es2oGkGUa2TKt7wXvSpYuMnSP96TzybJzMNeQw+K2nYY9kuwbDcrhhbxK9ZJRF9AWCyB0Hel9x/B2080IM0y9HFgYmKXPR7CSKGhwH+dq8J2/v3a57S054Doc9vWbULCHBk7D8F7eXSP+wPg2Ryti3BDzBV/SAHSliC41fDMLWlQiPPSY8hN4ROfisBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6x9h3JqDDLs861PhlpYOQjRgh5m9pS+C1Rm8j0PQQiA=;
 b=X68hXxKSLzVyUwS782OrNmBP+qFig31pJbNxo+0ME7yFNjD3on4JvaEepTLN3g8LpqI6f4r3qtudi+JHqRBgX7keJe1GiPwIwtMpqC6hQHnHPmopqW2A4GHZtATg7ingPNiR9K4g/n0dCYhXGooWop+2ZolAnVEkxSK9hWg0xvuUFsEaG9nrl/N7vS/nrlBD4Crq6pBLfEDfCXppG3OOY6sH+VGkDAlwmdwbJNLfDiaLBF9xeF4bwkJUn6o/ch/zw1m1w113W0Jbis1a5NUEzydJe066f5DLb2HqFnLLEN6lV4+rG0Mtz5XQJ8p7XnT1vf8XrsgW2yA1MNEw7j9JWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5542.namprd11.prod.outlook.com (2603:10b6:208:31d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 21:31:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 21:31:21 +0000
Date: Wed, 13 Jul 2022 17:31:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <Ys85pcMYLkqF/HtB@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a47be2fd-220e-48b6-37c9-08da651707bf
X-MS-TrafficTypeDiagnostic: BL1PR11MB5542:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBF3KdorSrLM35GUuVtQNOjnrnFMaUvTeEynkf5tEMV1asnmwImP+ibvYs/0ru+zcX+EqwQh0GFwaxFnk+8gzjteihis/o+/xjywNuAIaAnhHs+IGfHlhnh0d3/EP9mXf+BH2dkJeFDmpvAU7uevMIZ9rxBTr8hGVZYwS9unnJXpZ+fA9/ciQAZxmxvVXofYyDyBlNzzfRrREyFMixW17Tq3y7vzLIHljkKIdJsSWkizJwgWWxqZp8bd1ICdxfsimXb5C8Fq0h54CF4E7nzjR384ZLc0DEJmPrnhzdHP1ttMXphrSuXm6FtvNwPJV0JFiGLMP3o+cun43/MDxtQ+I/PbAOzZd0dCEZAk6JO5O/NgWYwcZluhZM+YsNI/xX6l9OlETOx+HoFcfsW29pN6x+2qfKTP8CENPNvM+f9dcQUv2ME3RE5uZH9ElbcSMkor2nAlH0h3zcEjOSLTLZQQ7ZNAB5zfIYzn6xpRwrnyXUlpcq9iVFS0qoHJNP87yWQzm/RCtyZNtJgNwF5fUg120L97Ez6z03QYimbxe3rnzYG4HoCz3z3DQ/vqwc5eps2q9HaiBIojoacJ0MSrKMK/nu7NzjfYNv+sH2f5hTAfpQNKkHeLwE/mKztP6C3wwIIcioYid5K/SBm7NbySLpkAA+TlArUhUn1V1BnEss+7BKxbQ3rWODYQ6rpXdtes9cXhAt1vjPXV+wrYeBT7Ey8i0mrpX8Wye+pXZBex9DdipTA9eoVbgJucnR021rBAqsB+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(346002)(366004)(136003)(376002)(41300700001)(38100700002)(6512007)(66574015)(6666004)(36756003)(86362001)(44832011)(26005)(5660300002)(7416002)(2906002)(8936002)(8676002)(82960400001)(6506007)(4326008)(66476007)(6486002)(66946007)(66556008)(2616005)(478600001)(316002)(83380400001)(110136005)(186003)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3gQVpfyd8s+9cTd2abh1QZ4vCN41d4E7k0eUVmZaxAWKrXP0Ahx75eDuqa?=
 =?iso-8859-1?Q?X16bWbfdo/XADfM7S9kf7ZoiqRd6jIynuVIlsZFlzIIXkYWEP7xnOt3pMz?=
 =?iso-8859-1?Q?/6D8in2MqhJLDyaVAO2R/u0ULtE4DNH+05hjL2HfgdVqLWDR9/PP/0Q+cS?=
 =?iso-8859-1?Q?Rdb3Nc7KeQDTPl7jaPgpheU780KVjtLceAXuBfHi9X9WfCX96YVlWZe8JE?=
 =?iso-8859-1?Q?3BeLr3GbBNY60oeuFxSKsA922dnZCB7PCv//QsU8QTsJKrC3zdsQ/bc5+S?=
 =?iso-8859-1?Q?XMFWzby6QIyGvWlRdXZkMKRG83RL/tthAzwxAzkHBJMrBXlfxH90gQbD9w?=
 =?iso-8859-1?Q?u6f4AKVswuIzThZ+PTFYdnpGQzCGFUTjTmwcLQxiV+84z5fRSfjP1cPh+t?=
 =?iso-8859-1?Q?OoHyrdfDXvj97Wa7w4yvvksPnYSFTw1U3Oqz2RK+5krgTs86Fm3WorcOWr?=
 =?iso-8859-1?Q?hsQJ63wqfgDfFfU/KJ/dORRbIPqE/puIZMbRty1RRKlJI44bAGyQN6Jtz4?=
 =?iso-8859-1?Q?nVuBq/hl5IR8QtgZNnXy0F2VLx2eEbxf7CboPaAYdeqUPprQB5lR+rG4up?=
 =?iso-8859-1?Q?bU/NUOIgaOslsPQZOPGaBoPT/cpE5n/YPW5kR7/nObj24drErtzfGpz9ij?=
 =?iso-8859-1?Q?qggZDGhxABmpUVlvjfrXOhRjSzuHhfDPsCgP0GV5Rt6Am8K0OpnrkZwVoe?=
 =?iso-8859-1?Q?ZWWXlH4I4Zh1UeB5NnjMZAW8FxuwSs3WzwWC7HPxTZx/QAIB8UhgNiwVs8?=
 =?iso-8859-1?Q?WvaZnwB/mQbCMPe5zesiKrf+WxZ3piTe8LOJ2CPZpYrLcyUCCR1iFJNP+j?=
 =?iso-8859-1?Q?Hj5ie4gh118/L6SvIGsmxouq6fJuujhovNJWmDsn1nOc0vwnAZVcOe7xxf?=
 =?iso-8859-1?Q?tFLrQ5e9WEaCr66vQYWS+0W2Ry3KYn3WvrwbGEKazZfN+VvRKI5Py6rUw6?=
 =?iso-8859-1?Q?J+tf3O3ojEzD1znsnpF4ca1+DqPhZNL27bPAx7Cw06+IjdZAUmZD3tkuJH?=
 =?iso-8859-1?Q?SACA7wLUEq/Xt5Hkevq0H/15yjlkUZF4cTorBCVw26VYnwvSeaQopLHJK/?=
 =?iso-8859-1?Q?TYdQofsTn5NN0/4nnOSBPwwjm38+hICTzqZjoYSc0aQgpZ4VIX9UOc4Uv1?=
 =?iso-8859-1?Q?U7cfkqVAbFSdMKbe049jHXkpuYeyWmAkQdS560AsDocxOiLKH2Ml3gQog6?=
 =?iso-8859-1?Q?pqW0COP+DtBa5RkWj+T34hKVpCSA6laL1X111Cs2qyxK9TwkAX8JvebyPb?=
 =?iso-8859-1?Q?RkhHqM9nizofe+vdrgwfKXCLwwUTmRqTvw2jNeGmzOlIwXsqGKBCO1NovV?=
 =?iso-8859-1?Q?K2eedHU5qd0/0oMVSS4Ez34ZSV7m8c6dK+e13oXECfWlkpfrUnm57+yxzD?=
 =?iso-8859-1?Q?XUW+GlLRCba7fsH/iZEunb+BV/1h6bnL+yYR4J5TLA4Qn8s8NvVw4AJ9lS?=
 =?iso-8859-1?Q?K/wroOH5z+cU8sOQMcP1ldcLKX4K6v9Ue3XE4IQ8bZlBPsPe1HmGmjVua1?=
 =?iso-8859-1?Q?5mABR53jicRYrIjmqzhXNu0tvYe5SR2W3N/9YTrsD3O/HpN5zSr/BjOGEQ?=
 =?iso-8859-1?Q?LESAHmOcBM3WJQDzYsEXIcGTVtM5ijpte0g5tY9RijSGQpEDStQQi7kuWB?=
 =?iso-8859-1?Q?d5NWkDc/3Nbn9Dmh8vgQFyepO36oz/0tcl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a47be2fd-220e-48b6-37c9-08da651707bf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 21:31:21.8564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eS0C8rq4xfUhQrWtzE1vTO8vxvI9u8W54ASEFXxGyYhbAoBHCRKBQiFmnfeljP52/aB0oVuhme+oEE1Cyh0zpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5542
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

On behalf of Tvrtko, who is recovering from Covid,
here goes the latest drm-intel-gt-next pull request
targeting 5.20.

Thanks,
Rodrigo.

Driver uAPI changes:
- All related to the Small BAR support: (and all by Matt Auld)
 * add probed_cpu_visible_size
 * expose the avail memory region tracking
 * apply ALLOC_GPU only by default
 * add NEEDS_CPU_ACCESS hint
 * tweak error capture on recoverable contexts

Driver highlights:
- Add Small BAR support (Matt)
- Add MeteorLake support (RK)
- Add support for LMEM PCIe resizable BAR (Akeem)

Driver important fixes:
- ttm related fixes (Matt Auld)
- Fix a performance regression related to waitboost (Chris)
- Fix GT resets (Chris)

Driver others:
- Adding GuC SLPC selftest (Vinay)
- Fix ADL-N GuC load (Daniele)
- Add platform workaround (Gustavo, Matt Roper)
- DG2 and ATS-M device ID updates (Matt Roper)
- Add VM_BIND doc rfc with uAPI documentation (Niranjana)
- Fix user-after-free in vma destruction (Thomas)
- Async flush of GuC log regions (Alan)
- Fixes in selftests (Chris, Dan, Andrzej)
- Convert to drm_dbg (Umesh)
- Disable OA sseu config param for newer hardware (Umesh)
- Multi-cast register steering changes (Matt Roper)
- Add lmem_bar_size modparam (Priyanka)

Thanks,
Rodrigo.

The following changes since commit a06968563775181690125091f470a8655742dcbf:

  drm/i915: Fix a lockdep warning at error capture (2022-06-29 14:52:50 +0530)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2022-07-13

for you to fetch changes up to 17cd10a44a8962860ff4ba351b2a290e752dbbde:

  drm/i915: Add lmem_bar_size modparam (2022-07-13 17:47:51 +0100)

----------------------------------------------------------------
Driver uAPI changes:
- All related to the Small BAR support: (and all by Matt Auld)
 * add probed_cpu_visible_size
 * expose the avail memory region tracking
 * apply ALLOC_GPU only by default
 * add NEEDS_CPU_ACCESS hint
 * tweak error capture on recoverable contexts

Driver highlights:
- Add Small BAR support (Matt)
- Add MeteorLake support (RK)
- Add support for LMEM PCIe resizable BAR (Akeem)

Driver important fixes:
- ttm related fixes (Matt Auld)
- Fix a performance regression related to waitboost (Chris)
- Fix GT resets (Chris)

Driver others:
- Adding GuC SLPC selftest (Vinay)
- Fix ADL-N GuC load (Daniele)
- Add platform workaround (Gustavo, Matt Roper)
- DG2 and ATS-M device ID updates (Matt Roper)
- Add VM_BIND doc rfc with uAPI documentation (Niranjana)
- Fix user-after-free in vma destruction (Thomas)
- Async flush of GuC log regions (Alan)
- Fixes in selftests (Chris, Dan, Andrzej)
- Convert to drm_dbg (Umesh)
- Disable OA sseu config param for newer hardware (Umesh)
- Multi-cast register steering changes (Matt Roper)
- Add lmem_bar_size modparam (Priyanka)

----------------------------------------------------------------
Akeem G Abodunrin (1):
      drm/i915: Add support for LMEM PCIe resizable bar

Alan Previn (1):
      drm/i915/guc: Asynchronous flush of GuC log regions

Andrzej Hajda (1):
      drm/i915/selftests: fix subtraction overflow bug

Chris Wilson (6):
      drm/i915/selftests: Grab the runtime pm in shrink_thp
      drm/i915/gt: Serialize GRDOM access between multiple engine resets
      drm/i915/gt: Serialize TLB invalidates with GT resets
      drm/i915/gem: Look for waitboosting across the whole object prior to individual waits
      drm/i915: Bump GT idling delay to 2 jiffies
      drm/i915/gt: Only kick the signal worker if there's been an update

Dan Carpenter (1):
      drm/i915/selftests: fix a couple IS_ERR() vs NULL tests

Daniele Ceraolo Spurio (1):
      drm/i915/guc: ADL-N should use the same GuC FW as ADL-S

Gustavo Sousa (1):
      drm/i915/pvc: Implement w/a 16016694945

Matt Roper (4):
      drm/i915: DG2 and ATS-M device ID updates
      drm/i915/gt: Add general DSS steering iterator to intel_gt_mcr
      drm/i915/dg2: Add Wa_15010599737
      drm/i915: Correct ss -> steering calculation for pre-Xe_HP platforms

Matthew Auld (15):
      drm/doc: add rfc section for small BAR uapi
      drm/i915/uapi: add probed_cpu_visible_size
      drm/i915/uapi: expose the avail tracking
      drm/i915: remove intel_memory_region avail
      drm/i915/uapi: apply ALLOC_GPU_ONLY by default
      drm/i915/uapi: add NEEDS_CPU_ACCESS hint
      drm/i915/error: skip non-mappable pages
      drm/i915/uapi: tweak error capture on recoverable contexts
      drm/i915/selftests: skip the mman tests for stolen
      drm/i915/selftests: ensure we reserve a fence slot
      drm/i915/ttm: handle blitter failure on DG2
      drm/i915/ttm: disallow CPU fallback mode for ccs pages
      drm/i915: turn on small BAR support
      drm/i915/ttm: fix sg_table construction
      drm/i915/ttm: fix 32b build

Niranjana Vishwanathapura (3):
      drm/doc/rfc: VM_BIND feature design document
      drm/i915: Update i915 uapi documentation
      drm/doc/rfc: VM_BIND uapi definition

Priyanka Dandamudi (1):
      drm/i915: Add lmem_bar_size modparam

Radhakrishna Sripada (2):
      drm/i915/mtl: Add MeteorLake platform info
      drm/i915/mtl: Add MeteorLake PCI IDs

Thomas Hellström (1):
      drm/i915: Fix vm use-after-free in vma destruction

Umesh Nerlige Ramappa (2):
      i915/perf: Replace DRM_DEBUG with driver specific drm_dbg call
      i915/perf: Disable OA sseu config param for gfx12.50+

Vinay Belgaumkar (1):
      drm/i915/guc/slpc: Add a new SLPC selftest

 Documentation/gpu/rfc/i915_small_bar.h             | 189 +++++++++++
 Documentation/gpu/rfc/i915_small_bar.rst           |  47 +++
 Documentation/gpu/rfc/i915_vm_bind.h               | 291 ++++++++++++++++
 Documentation/gpu/rfc/i915_vm_bind.rst             | 245 ++++++++++++++
 Documentation/gpu/rfc/index.rst                    |   8 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  47 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  18 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  55 +--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |  99 +++++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h       |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |  34 ++
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |   7 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  | 141 ++++++--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  87 ++++-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  34 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  22 --
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  15 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |  25 ++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h             |  24 ++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   7 +
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        | 109 +++++-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  37 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   6 +
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   8 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            | 323 +++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |  16 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   9 +
 drivers/gpu/drm/i915/i915_active.c                 |   2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   5 +
 drivers/gpu/drm/i915/i915_gpu_error.c              |  42 +--
 drivers/gpu/drm/i915/i915_params.c                 |   2 +
 drivers/gpu/drm/i915/i915_params.h                 |   1 +
 drivers/gpu/drm/i915/i915_pci.c                    |  28 +-
 drivers/gpu/drm/i915/i915_perf.c                   | 158 ++++++---
 drivers/gpu/drm/i915/i915_query.c                  |  16 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |  27 +-
 drivers/gpu/drm/i915/i915_scatterlist.h            |   6 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |  31 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h      |   3 +
 drivers/gpu/drm/i915/i915_vma.c                    |  37 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  17 +
 drivers/gpu/drm/i915/intel_device_info.h           |   5 +
 drivers/gpu/drm/i915/intel_memory_region.c         |  18 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |   4 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |  10 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |   3 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   2 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |  21 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |   3 +-
 include/drm/i915_pciids.h                          |  39 ++-
 include/uapi/drm/i915_drm.h                        | 371 ++++++++++++++++-----
 58 files changed, 2281 insertions(+), 522 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_small_bar.h
 create mode 100644 Documentation/gpu/rfc/i915_small_bar.rst
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst
