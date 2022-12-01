Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A21C63F582
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 17:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCAB10E651;
	Thu,  1 Dec 2022 16:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550A910E640;
 Thu,  1 Dec 2022 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669912887; x=1701448887;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=mt7gswslCUpkPFctyXffRuodGk5k5gBOMhqCvkN/V6I=;
 b=QndHOMMHNI+kCTcDlNMtDgzbPrOr3Q24CiNnHxRJ0JZVwBv//W9kqBXJ
 Ad3tipu8eNu6G/1nNRRtvvTm5KYiqZmiOSo4tOIgYvm3xzuckfLPrztWD
 erUUVP3Oo3ssTaQEFYtSL6j3PiVBKhnXXyN0q20V2eUuqGpg5WvEahx90
 1a39w/p8hWe3J9bCuX9Ricv5uNZ7+zyGhmsSunVbpJ/pGG26j1Y8mOn+6
 2C7L5RkAVSaLyMGa37UyIUOV4v2VwcoTWT3A+YApnEK+ROBdEhAEVEqfb
 jEsmKNpUdZX7j/C5BedX8ORJj0vPkRekuKukePDKhAG+e6kWnEBz/9PL0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="303335387"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="303335387"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 08:40:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="769292609"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="769292609"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 01 Dec 2022 08:40:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 08:40:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 08:40:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 08:40:44 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 08:40:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNQp0OenrGYIgC75RiB33s/GAwxe7FS0sroNOIaf7atjgklItAJOPcEKD+rPjqVv+fIelpKBjjA7nGSRipTNxDstdw4hhzN1kb2AqNrG68Ub8lewgXSWN+v3r2xFMWMfiH1Z9J7LaZfwbanXbYGPq59FkcpY6onhPsm6JkzzNiixlz3iIBOqEjZ1S2CiaItNOi25kTQ4HpEIwjjN7lRkhj8AF8isVbsQ22aZNlaPwBi6JP/lccKc04HXl9/v/1+7d5W8SJXhzN6pen2hWxXro8M8f+euhSgFbRtXA0d7xXnJsJuVoFAaatXD2vwUzJz2watWiUrqLyQievwPrRQ1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjkoItOZP66rad4m3TSfZZ0Sws3ih2e/amff5/n+BUY=;
 b=lr1+Dk9A6gc0EChZd4Uwmjpzshi5qUirVEZdX9WFbx1DWZaAYO8RX6bbEZMRbT/lzUn2unOKjA1TmwsqKsYT2u67rDRNS+hDnB7uer9md+kL+RvoO1efPifl5xKIxiKQ7ni4SPa0CBrANPYwslfMRQtAJNMbPjX/7Rym/5N3ZwJuJ+MH/MjTYgqp7uLyMS4vF1lmDClVqRvLPua7edyvGAKyZpO0sUr8TOcmYlFQEswCVesD3vL0z89jFmPzMsXDU1GKIrXII0IDxaUxXnlJpUrKXycgTjkcHamhks7zB2EyxLJkMX1G1awiPuBctDReFYa/8ISao27xlhKVVrccMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4573.namprd11.prod.outlook.com (2603:10b6:806:98::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 16:40:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%7]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 16:40:42 +0000
Date: Thu, 1 Dec 2022 11:40:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <Y4jZBRw9KvlKgkr6@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4573:EE_
X-MS-Office365-Filtering-Correlation-Id: ce708a55-394d-46da-9014-08dad3bac99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jGUhQjNrp17QbV+ZLlohAdhQ/Qq2zkEDxxGOBtm7+/r2CV/S4TugZdo+xuPt+uKPWUNS66keufbSpshdqVs2lxTELAw5jwgxEJRL5g+GB6pjbbjQ1PyB4WV/Oie8Q5s0lLSqtbH/ul98FOlKS8mYBJVcKo+NpfI5QGHPIa4UJaHm4I7NWPr93QNk26yk2a4LEFAsAR1NfjKUa5XYa14pje0tUsiezAMnfiWW799jgBvPAvY1VJASIHcY7S5+E3farMeLvZNDUaMJA9Pvex+hpvSk/V+UvEHEFPw2MBsTmxBSCpnMPnRP3/Bjo0SIdFtWOI353Pl5TbS6c66zeGdhpMYJCiXaD4Y2qJR77hC46QPCVJlp/vdBiVviG9BqAF2+JEnhwGih63V9Ah4TBR8AjQRPWcIXEoO9l0bf+ySH3guCT21oKEXSf32C/xRblUh5HD5qgOtHQn6vFky7agJ7Are1BiIUZGFiMANh9Q7obFuqsHwxV84wXbHzRGRQDTmEsrXgCY7KCIUw4TFoVBPJf2nZsUIy/dSTycxAsHfly5XTbx4QRaC36T0FsS5+SRu4nNwM8nT6XQch6fu+n9ckkgP7lZ87scZXFfyx2qZhVrBN8eDU+MQgpIvoXI3PzQkp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199015)(36756003)(66946007)(2616005)(478600001)(6666004)(316002)(26005)(4326008)(66476007)(6486002)(8676002)(8936002)(6506007)(86362001)(4001150100001)(6512007)(7416002)(2906002)(186003)(66556008)(41300700001)(66574015)(5660300002)(44832011)(110136005)(82960400001)(54906003)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1nA08nlOExaNHSYWzp6MhZjDZPHY6v8PXtZ1nQraI+jUZeQpDFtGJPyy/r?=
 =?iso-8859-1?Q?JZrLFfr+d0VCs6unC8MLjcpfrvRDNQ69buzjIHx3tM8E2HlgFhAy+wY5Xa?=
 =?iso-8859-1?Q?uTu3WBc6BR0LqGYspRMONR0FI4MmGssRd+5KSxvPVkQxfBPXOWiK3zu/m4?=
 =?iso-8859-1?Q?thdp4Oz5tG0p1/emzXsVnMeG8TYZcz2tAUhfSeHv4mls1uK40j3elsuF46?=
 =?iso-8859-1?Q?mj38QRxOBQaWlsK54+FGf9MgHZSqQO0csj0EV+LBEO30BhXKx/3AuqJMe1?=
 =?iso-8859-1?Q?AnfMVbJkusZT6hCWYoCpSVfbPA+9+jGZpn0xS7BqwJOlwFk9seJboeqfxm?=
 =?iso-8859-1?Q?74Cy7lbmpO0d8zH6Tdpkq+it8I2yzliayIDwKyjLjCui5dHMrU3isVuAeD?=
 =?iso-8859-1?Q?UVVHeqEr576GjUZYMAioGP/qVTGdqG0F+87q057xttKGoms32/rdf5wGX8?=
 =?iso-8859-1?Q?nnz2JaKTubCbuJFg3klUFSaQbd9KOHciD0Hk0jj6PB6q9fT8o47bqokD8+?=
 =?iso-8859-1?Q?nEeWROcvh5FizzmJFsKKWeGGIw5rWFMJC794c/7H9eXP5jFkIIxc1DVEfl?=
 =?iso-8859-1?Q?UTeyNHjsFFnY+djKn0FLMJfEk7s0wCJJJ5qle+aFvP/TjfZf8LvvrF7JfG?=
 =?iso-8859-1?Q?A108ZjmLLjUW1fiRmf39JztAq8hN0A2l30AdiUaXlUiByX3ehhKhnh5yFv?=
 =?iso-8859-1?Q?JHel7KxFeUIStB4MSaSXozJil3h9utKb6n7u6tUcKdXI+RXdSgkLNFaH2f?=
 =?iso-8859-1?Q?5z7ktm9b7H9Sdxmk5z8pCVs8UNIB3iHxjqESOs+50EtWu2qGZPtKLbuOzb?=
 =?iso-8859-1?Q?8f8JbgNG/6LphchIG4uzOP6RH5/cUqQuZGZB23V9VaDto7Jfqg2uUwfI1p?=
 =?iso-8859-1?Q?/v5L+bK/Lt5ITF27sXZw1EQKid7R1azKITfkSWHHdK0GY9AvCSi0k5ymTZ?=
 =?iso-8859-1?Q?5HZ50QFD5lYsHGIHSFjgBgpaRqq0mPQLqWg50J3QPlTTCE0V01tUGFmM1v?=
 =?iso-8859-1?Q?4F8wEGQs//qvOMqYOMUWbsrOL1YCfcH6wokmIu8pqleXRFJ/9oWIB3pESC?=
 =?iso-8859-1?Q?vw78OHukHZLsQKjx+cX1m7qecMkRCAPwgQeH3nruBbuOSEfy0Qh0vstnVF?=
 =?iso-8859-1?Q?Xye30wU25ZPBKfodtI4hRdZOZz8Gjg0rDMIoK69txUCadGcq0lpFtCn8y4?=
 =?iso-8859-1?Q?BrRECoGZ8dMx+Vtmk9pdGpDjpshUWzUk2QVXkvJ7Pg1GRFwt9QpaTfQDSw?=
 =?iso-8859-1?Q?KmLGhO0062hNs01IrpZaOjB4/NLUN5IWD9SCBBQ8+gAaw+zYucoMhz00kH?=
 =?iso-8859-1?Q?Da0YEYKxlSxtxMD0N5F0eBjMEnW5P1lrHeUpokvYIjQm62cW/Wi9r0bPFm?=
 =?iso-8859-1?Q?OTGDAmjHzq7Ycl3q/8rV1JmaYa3Uxkf3PbsIy2XDN/vyasA2KWJHmr2rhQ?=
 =?iso-8859-1?Q?jHhJK8rfqpMojNxmmX+DFFTMI8IvVP7b9maxct/MW0YlzP1xPNDM147dlJ?=
 =?iso-8859-1?Q?afr6QNJP2uicUxLeHrCOR6g22Dj5HFA8gkBwIFvxS280yhD8iQE14IsSjm?=
 =?iso-8859-1?Q?wImKq+Tm2LgbkFDpHFiPbwD/quBLrqmpqVJFq+y7lGSxmG5Yx0e8KuHuPC?=
 =?iso-8859-1?Q?Nq7IugKLyBBITrfdwHJ4uH4YLNVDnClZ4H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce708a55-394d-46da-9014-08dad3bac99d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 16:40:42.8614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxAEXNGLNW3wpW/8bgHvSSPHlN73d1FZIiZZhnEcrZ4Ue3EscXK0rBLCDKHGNeGJR8k52tlNbKS+XIyH2fb7ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4573
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

Here goes our next-fixes targeting 6.2-rc1.

Please notice that DG2 DMC had a minor bump version in order
to fix the remaining issues related to PCI warns at DC state
transition. I didn't request the team to provide the fallback
to the previous version because we are moving this fix to the
6.2 along with the force_probe removal. But I warned them if
any minor bump is needed after that that all the new rules
need to be respected. Besides, I have also requested them to
make changes to comply with the new rules. Or to remove the
minor version from the fw like GuC did or remove the version
entirely like HuC did, since the there's no direct ABI involved
that needs version. I expect this work to be done for the next
platforms.

Still about the DG2, the other MEI patches to fix the potential
huc loading failure where already picked up by Greg. So we shall
have them into 6.2 as well. Meanwhile we are keeping them in
our topic/core-for-CI.

Other than that, small fixes and couple targeting stable below.

drm-intel-next-fixes-2022-12-01:

- Multi-cast register fix (Matt)
- Fix workarounds on gen2-3 (Tvrtko)
- Bigjoiner fix (Ville)
- Make Guc default_list a const data (Jani)
- Acquire forcewake before uncore read (Umesh)
- Selftest fix (Umesh)
- HuC related fixes (Daniele)
- Fix some incorrect return values (Janusz)
- Fix a memory leak in bios related code (Xia)
- Fix VBT send packet port selection (Mikko)
- DG2's DMC fix bump for Register noclaims and few restore (Gustavo)

Thanks,
Rodrigo.

The following changes since commit 3d335a523b938a445a674be24d1dd5c7a4c86fb6:

  Merge tag 'drm-intel-next-2022-11-18' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-11-23 09:15:44 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-12-01

for you to fetch changes up to 7d579eff3e55a256fdd71624543747ed4d7fa38b:

  drm/i915/dmc: Update DG2 DMC version to v2.08 (2022-11-30 09:07:14 -0500)

----------------------------------------------------------------
- Multi-cast register fix (Matt)
- Fix workarounds on gen2-3 (Tvrtko)
- Bigjoiner fix (Ville)
- Make Guc default_list a const data (Jani)
- Acquire forcewake before uncore read (Umesh)
- Selftest fix (Umesh)
- HuC related fixes (Daniele)
- Fix some incorrect return values (Janusz)
- Fix a memory leak in bios related code (Xia)
- Fix VBT send packet port selection (Mikko)
- DG2's DMC fix bump for Register noclaims and few restore (Gustavo)

----------------------------------------------------------------
Daniele Ceraolo Spurio (2):
      drm/i915/huc: fix leak of debug object in huc load fence on driver unload
      drm/i915/huc: always init the delayed load fence

Gustavo Sousa (1):
      drm/i915/dmc: Update DG2 DMC version to v2.08

Jani Nikula (1):
      drm/i915/guc: make default_lists const data

Janusz Krzysztofik (2):
      drm/i915: Fix negative value passed as remaining time
      drm/i915: Never return 0 if not all requests retired

Matt Roper (1):
      drm/i915/gt: Manage uncore->lock while waiting on MCR register

Mikko Kovanen (1):
      drm/i915/dsi: fix VBT send packet port selection for dual link DSI

Tvrtko Ursulin (1):
      drm/i915: Fix workarounds on Gen2-3

Umesh Nerlige Ramappa (2):
      i915/uncore: Acquire fw before loop in intel_uncore_read64_2x32
      drm/i915/selftest: Bump up sample period for busy stats selftest

Ville Syrjälä (1):
      drm/i915: Remove non-existent pipes from bigjoiner pipe mask

Xia Fukun (1):
      drm/i915/bios: fix a memory leak in generate_lfp_data_ptrs

 drivers/gpu/drm/i915/display/intel_bios.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c   | 10 +++--
 drivers/gpu/drm/i915/display/intel_dmc.c       |  4 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c   |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c             | 15 ++++---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c         | 18 ++++----
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h         | 12 +++---
 drivers/gpu/drm/i915/gt/intel_gt_requests.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c    |  5 +--
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c   |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c         | 57 ++++++++++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_uc.c          |  1 +
 drivers/gpu/drm/i915/intel_uncore.h            | 44 +++++++++++++-------
 14 files changed, 113 insertions(+), 65 deletions(-)
