Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B46850A72B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 19:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E5510E463;
	Thu, 21 Apr 2022 17:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3BF10E109;
 Thu, 21 Apr 2022 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650562360; x=1682098360;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=0RagYtN5vUnuVjhwUjsbQu+fnsevFBGNEkc+9hWY7F0=;
 b=Z+RSTGaBetZpWFlj/+oYhnbeZD9xlHz//WC1yGavdZVxDyyH4HvsE8Bh
 Y9dAgnLJ1TFJ4P2ygbzhazLEe9hvJGsycPzvlLa110/7bHhBid0/fiNNV
 HQBRJbcHSrWfXd/W75WFDuhJd0Q4/QjGEytQ+34MqGufsta+YJbuzSwMl
 zaL2A7kgsN1DRy6wPYM77RutmArMvRPreb5EBRkzjnVCK23f9zzbz2wNx
 GzuGZj8d/UbuU+Q2WRWt02+0Il2zDvZgH0CVEo09CHeYWtUmwJxETfLKD
 /sMlqZ8PdGkd5MfmqzpCPTfu9dJpp1xuIhcmgtLZc0W2EBfy2/BKJ1VYG Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="263895405"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="263895405"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 10:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="648231227"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2022 10:32:35 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 10:32:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 10:32:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 10:32:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBxEFiL4Q6A2u/KOYfDV5cQrk7+XaRTwTyiNGEyd0tkK3qbtIs6SRUSOEHp6k0O3slBbpRBqpdgo97giQosyMIpKQQvz4RkPZDO8wBvS9kx3lPyC4RXB/Uc8rYB6b89bhL+csuc1wao08KR4U+gLkNk8OLMBRNMb4Wq1FWGUIgaWV+weyrBONzCShcwmITImACzJC3e7Vp/aBbKveTPbP9wqA3KQmycKRKn6Dy7BubuK9/3xM59LVCyQvuD3VSA+jTG3nwbj9QuA+3Em83hz6p23fFoVoXgYTSM2prumbrUIfBGGAO1NeU+EkvFQzcU2+5lhWTmBsTNTHQn1fxKTKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHjh3iQcGVtG26x523N2j0qhpS5gTCroXZdvidOTfZw=;
 b=EPuTMZeZGovNItTPmy+qsxYRQeSDJQMqNBv29fn49knqlAzWDOhvabvCmj/D3lLf1YPD6lWFgDONo/sLFiGvhZI9Td7uq18oQjou4gfsPL1IStYIQulb3SRpgz9kNfqOkMvD6kpwlH/QadWA+6w4C9lPH/oVQibE7KZ5BywCAcZt/8wF0042Egz+7tOx/XNtz1HIAcP8UNfNCF+RcVl6ptT0XIiVTl2mYKLYdgY6MRrkA9keaTxeQ/UTxxUy+sXsUmaHHcW+2h4/yZajlAGDvg9Hnz/1WK3XE9WvVP2u47cL1LkHoGkX/x0XPLTSDYYoe9uyo0h0DPV7HRkrDlSXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Thu, 21 Apr 2022 17:32:32 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 17:32:32 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: [PULL v3] gvt-next
Thread-Topic: [PULL v3] gvt-next
Thread-Index: AQHYVaXIPXN/NhB81UavXULnJXGvwQ==
Date: Thu, 21 Apr 2022 17:32:32 +0000
Message-ID: <25a713cd-0b7d-4c09-7d91-4f4ef6c9eb11@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 364b0734-4263-4c52-8a01-08da23bceae5
x-ms-traffictypediagnostic: SN6PR11MB2557:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR11MB2557960EBE2136DCB3619A49CAF49@SN6PR11MB2557.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dRMuVYXVq6wD2Tjn3UUi0pU1rX6mfKvyEkZGGW/9dwRylSVmIboNbzYmy8zwwMpvESvcFxNNT1r5aK52v7fBy7hn5XbbGYCYv4QndRjQ8+K63zVIPUaF0bDTMn8YBT929+ICYC3E//625YH0CKjVRnllsLQj4LGX4uSkNjquNqDPlM2Bh2tzaQ4anBNZSeNTrdIwcTNL1BtUrze4axllWlylDVPyB+p7edhOKeiY/n+Yd3ejh1qdcvFKNnlyMX93bRGWngd50vJYs20AyTeoRfiTm7U9ww2nPfcgs7xbASbpfsZUDbHkrKE/1SNEhs4YAR8tKu+GEUj+t1Icl2lkg4KMNvkC8pnE+Zipkix3d2ne6/wvPDk0sKQi+LaU9xmphedHK9la6XcwmVp1sKJ/aJUw20zA9bYpJ9xfrEB8RqKzBAfXBuyVqAfYm92fUf0nOj/2MQvtAW8vHqcQomyTHZ9tTEvV3o2iKH9MNnaYM3io3iRIOSyueihOQSZIupxiTuTew62jen0egqg/ssFXLcZ2KH70M7YtrnRMiE3HDeK5Ttcc463x/p2kfP9T8eADM7W/u3YNMbofVcm3DTXBhjDr0wtTGOeA/McN9TUJD1Ai5ESQLS4j0YJZs6Tl/b6ySVQ3j8v/6vwCTmyxe8D8XXoNI0nx208vACgJNWMj00f5RztnYatoMKeNKBBXiC1cO8dbjIPhjR2mH2Eg+5Q4Yhk3c7huVs6Nl4oU2lU8f26GbzkMjMR3WkIaf3VXHxjTvc3H5OAg0LVPnC35VaOuMgjYFLX1Vb8i2KxawQyXX2+BiLUY3yflvPOX49XYnufSUa48iHWF9XGTj2BkqOMQd+qJe8TLc3lkVIMfGI/F+zE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(86362001)(36756003)(5660300002)(2906002)(66446008)(31696002)(54906003)(66946007)(71200400001)(66556008)(64756008)(66476007)(4326008)(8676002)(122000001)(91956017)(82960400001)(316002)(7416002)(8936002)(38070700005)(38100700002)(6512007)(966005)(31686004)(6486002)(508600001)(110136005)(83380400001)(186003)(2616005)(6506007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?R76PkDYQ6AaP5DG6bWb6bSlCAuuSYF2I4yJdVU0HsnIdvkAjT7GIFeLY?=
 =?Windows-1252?Q?obl7OqYiCNDvCdv37BTjrNTDWKjdnhAYjsDh4EQhQbGUM9SyBlLP1CkO?=
 =?Windows-1252?Q?bNzsap6pObz9dsOy6oFc8Q7Ln1MV9XqRdagvn5UIAIwjRzUffUWbvmkA?=
 =?Windows-1252?Q?30jUA9X81t1AoISAhKGuKmtty/swqMTaeH9H+4KLG3lZlc77XCkuktDW?=
 =?Windows-1252?Q?//AbqLoGrvmSYodqEcOmg7jKa9+muEpkRfzOxwBtBsyfGU2tO8Q3LgEU?=
 =?Windows-1252?Q?iZp7AFQWlGbLYW0rxOrAXRJawGUsyuaFUj7kkdhJWYTZiCL4qZdvT67Z?=
 =?Windows-1252?Q?+6kMw+EmNK5+Js1i0YL9LXNfwvMs38k8LItVdS5f7Ky8aeMYPNUqwPr+?=
 =?Windows-1252?Q?TekbpvXJb5KOKbUii25m9R6hJ0tx08HqnKvfPgjZZRox3nAfuD00/rhQ?=
 =?Windows-1252?Q?X1vrL2v2+3bI9T+QB+R/rdcOUtVh/+gTPX5lT0pwB8oSNSn2nub3izzG?=
 =?Windows-1252?Q?U8ahGOH6IyFzoZEUu1LnC8wZ84TevMT7onGde/kD5aJPT4eN1C/RzdQl?=
 =?Windows-1252?Q?mw/4iZ0PcPKSPR4pVaXGao9MbvrR7qWO9Rcrfo5mVGF1d9ORnizhSXpd?=
 =?Windows-1252?Q?NYLBeGiS4O86N8bIMkJHrFq5sjVXUgNDh+YZqaNghQbA25w1jM1D2gSZ?=
 =?Windows-1252?Q?ljyZc2a8bpvv4dCJCrpYDeiO8i43KKZp0k4wBUha6e0McCmjZ7G5edDv?=
 =?Windows-1252?Q?o36P6mQTFqGDhp+KaCN7EMPRvcUSeCe1bao21IIHKLEMc/fYN+Nfpwzf?=
 =?Windows-1252?Q?nq19SbsHQgul3iYxf70AyN4byFLEloEF76u4Rfbbc301D87s4uQrTYtG?=
 =?Windows-1252?Q?mqTjXOz81Vt0O7GW5DB5FVOkbfXF5GxSU8vkwWOKKrdkj+xCJYza2Z33?=
 =?Windows-1252?Q?Q54PTZYnWZ6lBo4elD1htOS9P1Qo3+zkb5s3GuW+2gBB1eKDWyzT+JQh?=
 =?Windows-1252?Q?QVQkGt16JHaPeB+meCzYuN/7GYxqRc5RBfUhTj+U5pz0fkzFbQ3rLZ1p?=
 =?Windows-1252?Q?rKGCs/wgPjLjHds84ZDH/MDekTGQvGRiHTk3t6HErld90AI3m6BJqseB?=
 =?Windows-1252?Q?hiLPhn9skVsL/RvJTPhJTCCiNQ+AZCedXEzIvGMGRCQziX5NmKM/AytL?=
 =?Windows-1252?Q?WP5JRtjUGcZJfebSpEdJPNVJTtE9Bdrg57gAs8NKjxIVjXwVBasFK5eQ?=
 =?Windows-1252?Q?S8VV5H4Em/6+Q4nEDiYEu8EHGeVMkMi5vUlGHU9npoAJlNr/qczMHUH0?=
 =?Windows-1252?Q?JZvnlaIGZzehfKZUavcTbiVwaHmuQjS4jFO4ZSJXKXsbG/jkxAvkh/1S?=
 =?Windows-1252?Q?j+Cqgiu6CRbQxzKgBdTLRrdFCst4O8FMZqIsfbJhsOpDDwOqYIHDt6ea?=
 =?Windows-1252?Q?/8kVZlKzZKjoVyqqTU16OIhYB02k23NcuNL0t2dYh5YBknd2EDEL20o4?=
 =?Windows-1252?Q?3g6pzi3OdA5AZ8w6DDAEWC6WxcuqjYXciROTDrusI8a2FdSxhyFT24Hu?=
 =?Windows-1252?Q?K19/aglKa5r6+oCdyePKw+tu7JY1caUGSfm4JMxlu6m+TvZdIgbSMCyx?=
 =?Windows-1252?Q?QuiK/6m1YbQU4gisjBQjxkUh11tJQFa8EOEpeIhK/mWR0WwmlN1bec6H?=
 =?Windows-1252?Q?dz4F+vmIEjctf3DKxVW9zP1mlk3ZR1+D528yR9Q9zT+aSefapLd7EK/B?=
 =?Windows-1252?Q?vhTkihJf3vsMrebuon69DfL2yJKf8Jzp3uEqIDpIkFyox5MoE8Hu+uN1?=
 =?Windows-1252?Q?cAO8taQ7qT6VKk2VKSvxgotEkFnytoJIMP/eUoe43lS+kYpIwwXTJcD9?=
 =?Windows-1252?Q?o0feTShyUX7Z5g=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <74F539262EAB7F46885A68F3C7373792@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364b0734-4263-4c52-8a01-08da23bceae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 17:32:32.7925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XxD/XubFINjvAvy6meRpYuwm9Nba6lOG3qcPwmuVYK4PTcf1AoicQirJw1W4bITZGUR0hlKt68yW3MusRjcsuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2557
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks:

Here is the PR of gvt-next. Thanks so much for the patience.

Mostly it includes the patch bundle of GVT-g re-factor patches for adapting=
 the GVT-g with the
new MDEV interfaces:

- Separating the MMIO table from GVT-g. (Zhi)
- GVT-g re-factor. (Christoph)
- GVT-g mdev API cleanup. (Jason)
- GVT-g trace/makefile cleanup. (Jani)

Thanks so much for making this happen.

This PR has been tested as following and no problem shows up:

$dim update-branches
$dim apply-pull drm-intel-next < this_email.eml

When merging this pull to drm-intel-next, please include the following code=
 in the merge commit:

diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/=
i915/intel_gvt_mmio_table.c
index 03a7fcd0f904..72dac1718f3e 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -3,6 +3,7 @@
  * Copyright =A9 2020 Intel Corporation
  */
=20
+#include "display/intel_dmc_regs.h"
 #include "display/vlv_dsi_pll_regs.h"
 #include "gt/intel_gt_regs.h"
 #include "gvt/gvt.h"


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17=
:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2022-04-21-for-christoph

for you to fetch changes up to 2917f53113be3b7a0f374e02cebe6d6b749366b5:

  vfio/mdev: Remove mdev drvdata (2022-04-21 07:36:56 -0400)

----------------------------------------------------------------
gvt-next-2022-04-21-for-christoph

- Separating the MMIO table from GVT-g. (Zhi)
- GVT-g re-factor. (Christoph)
- GVT-g mdev API cleanup. (Jason)
- GVT-g trace/makefile cleanup. (Jani)

----------------------------------------------------------------
Christoph Hellwig (27):
      drm/i915/gvt: remove module refcounting in intel_gvt_{,un}register_hy=
pervisor
      drm/i915/gvt: remove enum hypervisor_type
      drm/i915/gvt: rename intel_vgpu_ops to intel_vgpu_mdev_ops
      drm/i915/gvt: move the gvt code into kvmgt.ko
      drm/i915/gvt: remove intel_gvt_ops
      drm/i915/gvt: remove the map_gfn_to_mfn and set_trap_area ops
      drm/i915/gvt: remove the unused from_virt_to_mfn op
      drm/i915/gvt: merge struct kvmgt_vdev into struct intel_vgpu
      drm/i915/gvt: merge struct kvmgt_guest_info into strut intel_vgpu
      drm/i915/gvt: remove vgpu->handle
      drm/i915/gvt: devirtualize ->{read,write}_gpa
      drm/i915/gvt: devirtualize ->{get,put}_vfio_device
      drm/i915/gvt: devirtualize ->set_edid and ->set_opregion
      drm/i915/gvt: devirtualize ->detach_vgpu
      drm/i915/gvt: devirtualize ->inject_msi
      drm/i915/gvt: devirtualize ->is_valid_gfn
      drm/i915/gvt: devirtualize ->gfn_to_mfn
      drm/i915/gvt: devirtualize ->{enable,disable}_page_track
      drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
      drm/i915/gvt: devirtualize dma_pin_guest_page
      drm/i915/gvt: remove struct intel_gvt_mpt
      drm/i915/gvt: remove the extra vfio_device refcounting for dmabufs
      drm/i915/gvt: streamline intel_vgpu_create
      drm/i915/gvt: pass a struct intel_vgpu to the vfio read/write helpers
      drm/i915/gvt: remove kvmgt_guest_{init,exit}
      drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev
      drm/i915/gvt: merge gvt.c into kvmgvt.c

Jani Nikula (2):
      drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
      drm/i915/gvt: better align the Makefile with i915 Makefile

Jason Gunthorpe (5):
      vfio/mdev: Remove vfio_mdev.c
      vfio/mdev: Remove mdev_parent_ops dev_attr_groups
      vfio/mdev: Remove mdev_parent_ops
      vfio/mdev: Use the driver core to create the 'remove' file
      vfio/mdev: Remove mdev drvdata

Zhi Wang (3):
      i915/gvt: Separate the MMIO tracking table from GVT-g
      i915/gvt: Save the initial HW state snapshot in i915
      i915/gvt: Use the initial HW state snapshot saved in i915

 Documentation/driver-api/vfio-mediated-device.rst |   27 +-
 drivers/gpu/drm/i915/Kconfig                      |   36 +-
 drivers/gpu/drm/i915/Makefile                     |    8 +-
 drivers/gpu/drm/i915/gvt/Makefile                 |   30 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c              |   89 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c             |    4 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                 |   36 +-
 drivers/gpu/drm/i915/gvt/execlist.c               |   12 +-
 drivers/gpu/drm/i915/gvt/firmware.c               |   25 +-
 drivers/gpu/drm/i915/gvt/gtt.c                    |   55 +-
 drivers/gpu/drm/i915/gvt/gvt.c                    |  340 ------
 drivers/gpu/drm/i915/gvt/gvt.h                    |  128 +-
 drivers/gpu/drm/i915/gvt/handlers.c               | 1033 +++--------------
 drivers/gpu/drm/i915/gvt/hypercall.h              |   82 --
 drivers/gpu/drm/i915/gvt/interrupt.c              |   40 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                  | 1097 +++++++++--------
 drivers/gpu/drm/i915/gvt/mmio.c                   |    4 +-
 drivers/gpu/drm/i915/gvt/mmio.h                   |    1 -
 drivers/gpu/drm/i915/gvt/mpt.h                    |  400 -------
 drivers/gpu/drm/i915/gvt/opregion.c               |  148 +--
 drivers/gpu/drm/i915/gvt/page_track.c             |    8 +-
 drivers/gpu/drm/i915/gvt/reg.h                    |    9 +-
 drivers/gpu/drm/i915/gvt/scheduler.c              |   37 +-
 drivers/gpu/drm/i915/gvt/trace.h                  |    2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                   |   22 +-
 drivers/gpu/drm/i915/i915_driver.c                |    7 -
 drivers/gpu/drm/i915/i915_drv.h                   |    3 +
 drivers/gpu/drm/i915/intel_gvt.c                  |  248 +++-
 drivers/gpu/drm/i915/intel_gvt.h                  |   32 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c       | 1291 +++++++++++++++++=
++++
 drivers/s390/cio/vfio_ccw_ops.c                   |    7 +-
 drivers/s390/crypto/vfio_ap_ops.c                 |    9 +-
 drivers/vfio/mdev/Makefile                        |    2 +-
 drivers/vfio/mdev/mdev_core.c                     |   52 +-
 drivers/vfio/mdev/mdev_driver.c                   |   10 -
 drivers/vfio/mdev/mdev_private.h                  |    6 +-
 drivers/vfio/mdev/mdev_sysfs.c                    |   37 +-
 drivers/vfio/mdev/vfio_mdev.c                     |  152 ---
 include/linux/mdev.h                              |   82 +-
 samples/vfio-mdev/mbochs.c                        |    9 +-
 samples/vfio-mdev/mdpy.c                          |    9 +-
 samples/vfio-mdev/mtty.c                          |   39 +-
 42 files changed, 2530 insertions(+), 3138 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gvt/gvt.c
 delete mode 100644 drivers/gpu/drm/i915/gvt/hypercall.h
 delete mode 100644 drivers/gpu/drm/i915/gvt/mpt.h
 create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c
 delete mode 100644 drivers/vfio/mdev/vfio_mdev.c
