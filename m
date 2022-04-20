Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5C508D6F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 18:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0CF10E222;
	Wed, 20 Apr 2022 16:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE4089E86;
 Wed, 20 Apr 2022 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650472492; x=1682008492;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=qHLOIHWW8TMIMBvbzYAaOefpY40H4bX0sk9IWQ6Twnc=;
 b=jMXcV27z1wX4D4mZgYsxMhtRCutZOLXf9Bi1W+8Jo+4dMPxz6MxhCLFx
 0bDMu96IRGvSDWc2A1eWrkJvEVxhg8CE4F1IyMLuu5X+6hSfbMjTRj0lr
 v3iXaVmghtt64u6GaY2RcNAZA204g+qqUfP/Mgkevp3lPQKHm54QgXqK0
 IQSZFaOBDOG57Ld/azZ9RsiQPtzXDl7xioQktb2ns/+81g501/UdfyEDw
 7VA+OIcWeKEKe6tMw5NxXNYs9tglvy4Rf7t3+Iqgks0YRpleJCaMhmNup
 x6mbPC30dssUmrMpTboUgGLf1FIMSir9IfPEhxqGCcRBGfoS3iFrbPXgl Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="251390881"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="251390881"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 09:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="555284788"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2022 09:34:50 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 09:34:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 09:34:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 20 Apr 2022 09:34:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Apr 2022 09:34:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhBtjD8CC8ctFIClU7eK26EtucW+UsO6T4xbW+iKaPjelqATB+8/I0lKrRiJ3IfvPXI7GlYgAAauQErOmZri+u9wNwJMkAK7Y3iCv4DpW8Rm22m5UaP+UFPd1q/e5lDRhfb7MHGnhfJIAS8Pyb4QYHDuZRplafnaKZalFAvTZRizApLE8Sq9ggvtkf4ELYSj4RExAnOZqnSkwLwB8rlcCcyib6Nk2zVHHHTuKPEHTW5ztfT9mYyAXK1bg8CcJLMIF+TmvRebTTbPJ14WNs8f4Yeo0Vs+ZUjRr/X6P6jGEcVMZ9hsgSFQ0RzhhAA+NRNm/2BgYEYUesCpSxNX0+Ywnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j42lhOE7khyAhtz6guweDdjIsV/4GPuhC15rmKfHf2o=;
 b=gQba1mC9iqsm3N7CefEuVbwPh9Afd/QvvMIwN6cL4WovBbosGYx8UpbdocuY2h+t3IhnMylLblnN4UBvj0gAvUGRzL7N+99ryNKVcQOCydKLIyrafNql7NzffIc1R/bYqKNkv1Ubvc85Jw2dHY96Dvj9DxNa+blIoFXNRqfGTKMXkZmA7PSjlzSqdHXsQ8KycNN3bxhL+QdogEmlBqsbmMIrRCohNuM2y1QGeh3nYi8fvswFHgeUrW/1ZTdJWE5CAlPe632otJLz6V1b19fJOQ8CZk3m9WZn9+5W+jjRn1oCF/cir94pNhbWsU7DD0COUhrd/lGSzBshaTLBlcoedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SN6PR11MB3200.namprd11.prod.outlook.com (2603:10b6:805:ba::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Wed, 20 Apr 2022 16:34:47 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 16:34:47 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Subject: [PULL v2] gvt-next
Thread-Topic: [PULL v2] gvt-next
Thread-Index: AQHYVNSMOPXpKvGgN0OvGCZ3HfiQDg==
Date: Wed, 20 Apr 2022 16:34:47 +0000
Message-ID: <5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f970324-6b2a-4ad5-5ee9-08da22ebaefd
x-ms-traffictypediagnostic: SN6PR11MB3200:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR11MB32009B3959B72E2485DDBA2DCAF59@SN6PR11MB3200.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A+3zqZDqLoIPGrxuaenUfign0+sj85lwEtgL0DQ1VR7l+CDcnWy3a8AA2bAskKnV0okZNawE0p/Uz8BQFrIfN16vfIjY3DNdtjw7dqx3rA3cIkwIlw4k/cZTl/PDeJpz9Y5birUEiFWTC1U4h61p43tnbS2FP40LwxZLQ6VEQAj8mucyNy7gT3bxSHtm+XYyJzVPoQ1DKYHu1AvB3la406QGSRs2lJ/cDo62ySTLPfWlJuAFXYWVbzgTY2vz4UWZQmfs+iVBjgGEYO5btDAs0nQcC4kCUDDcugoI8Jz6xQrKrwRwSrbwFwvHYgz/pTjnqaEHXZYCfML+8YCZ/GgvxYuatDyTQN7BMLCS/KAD79Y5+WCJWYwIJXOrLMZrFool/ICr1LpbPyqSwig3YjlFnQTfGbu3bqLS0oJnKOqOKFOh+La6xZcw5FbYlXIrFE3jILjT0F+DY98nFy+TJ0D1oZFKole2Rn0o6wpMbEEgyFH6EP0BXH7N8DeyR0EPCcQhjLEKdZ1aS+3J/c4xck2IOqDlrvEWMbm+P0ksqSSN0N1fDMvY6YFAn8GjNcmnct/NJ3lZ4SOUSAkToPa4h2RRQz0ze/kCxw8IPLLVELhVxJSccEO13gzKdt7SHA3bsCAAZa6IwVNgo2y6Wy54WxBBxlTmHpcBa00TIGucNLxove5ksJTkNTOu1e7m7I2zc8jYQe99bhnS5Ywdp6EA6uSxXIpufupUw7lT2Erc9eANP/WrD9RAnGLfTdkiLmcV28zvAZYOJLmgiDcWPhc4DnHAb3Rmov786VMHMd2sMwh8Y3TQiciswrYupmxEPK0x/Cc5EQLfyKH7wtmr8ggLdsv3Iygv8DRIKj6qoLX56HLMhWY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(82960400001)(6512007)(31686004)(71200400001)(26005)(508600001)(2906002)(8936002)(36756003)(966005)(6486002)(7416002)(66946007)(8676002)(4326008)(86362001)(38100700002)(110136005)(38070700005)(83380400001)(91956017)(122000001)(66556008)(66476007)(66446008)(64756008)(2616005)(186003)(5660300002)(31696002)(54906003)(76116006)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?YP/CWdbaUcFqBpJiB9apA4DTD6Nn5bLDZI+dwMVT7E8RqQiZWC82W4Xh?=
 =?Windows-1252?Q?uy7DKnj7L6f/KkFYJmgYgf+aLLWWajrjpdlZ9/TRhs/Nw6nodPhqIL2C?=
 =?Windows-1252?Q?OiAxsRh3Kif5dGHIk0Mb0eo3f/hIHxSl2frh5j1SKJe+0GSjWWfsVSuT?=
 =?Windows-1252?Q?qzs1QTe2/boDdT3jRHBDb+kaUq9Iozn1THIs2FCEVRZDY6iU49eITbBz?=
 =?Windows-1252?Q?tEgFlNdXfpbjPO3AyOvNISMADRGbnoMIljSuvE+ahw8pLFbKyPEBIjIL?=
 =?Windows-1252?Q?gz5EMsEpCq68yiQT7CbQ0dYz4HYSvX3oBFeAJXdUQPUCyXNt4bv41FtP?=
 =?Windows-1252?Q?kL3PfyP6SKcliFjAH1+T3gFqrJ/NfkwJOnyDvQF4wS/31VCnbbtrjrGr?=
 =?Windows-1252?Q?fnHqZDjqia+rSJoeumvyYglc8LlG20ph6tow4YGtNTxIXI9SAIiuG9kZ?=
 =?Windows-1252?Q?jBlr8rz93qgnZ+qOxICYp7TdPzZq5HZchGxbzvdtQNuB6haUIlbYPlil?=
 =?Windows-1252?Q?CsQo+fK8+iMuddH9FOc1k5eYx2hSawaIGOiaZz3P0xrTPwuaZqbJ+52v?=
 =?Windows-1252?Q?XbJ75dJTFfy+bAChoTEzlfGXvRY9v5qwLiqyNYpYWLA7QiAQTcxmN0xU?=
 =?Windows-1252?Q?nqPzeCZKmNqzecj61JvLQZq4QMjpAv2cZ+RzhwiViX+7b8DQoFMsSv0P?=
 =?Windows-1252?Q?qXWJ83UHBu4kEX81yOK8W6yn+E47jja4lS6pIIwsdfSPxXq642rkLtW0?=
 =?Windows-1252?Q?MuZYTnRLfB8gXH+8bTg94VrdMtTra4q9br+sk8lYg5SK9qxVGcfxMLRx?=
 =?Windows-1252?Q?BrdJuazonOhhPuFrLrK7hE5x+3Kj5hsM2NcKGLiqH3QuvTjS0cGM/JbQ?=
 =?Windows-1252?Q?8isOYjzRKZy4YVidKm7pWnQ6RfIqE1rc6ZemP6o0wPlSQCuInwxj4sj7?=
 =?Windows-1252?Q?IfRx6aV2CiL539zLabPIC3XQqz2ir8BZnBPM70Jh0a0JE3mSAIPRnRxS?=
 =?Windows-1252?Q?dq+7nwT9PqP8iGH/aHHEzAEIo46eA6IVpPnmv/i+TOqOSnsU0fXQG+Rj?=
 =?Windows-1252?Q?cYcaqDrGKgs4BOvDthrL5gYfMJVukSIdRwTcG+XHube3U8fPzTfuo3ZQ?=
 =?Windows-1252?Q?rnnKZUyQ6jQJAwiorHti36PlJj21gj+ZvLZywmhXxAdg0LnwPU9pSiAe?=
 =?Windows-1252?Q?xIH6012X+yX3f/gi5avx2QHJ+V/fkogdoQfZTiJCQCW6JSyAwg86jLOS?=
 =?Windows-1252?Q?DDqZtOKvP2y0LzoTy9yIUvHDGiTs5Djcot11A3SZ3HbGuok1O7qRuDXZ?=
 =?Windows-1252?Q?7rSzrMp5wIgZcwsbWsS69oq0tuuYa3zwL4G6WKH0CpTCKIL8C/X8JQVi?=
 =?Windows-1252?Q?pUcb+TRyrXKBlfSE74gaRtC3PJ5deMjtbeRZww2jr534td1z9PDK0zwJ?=
 =?Windows-1252?Q?Re3+ipcnhQBWCDc/TSLvHyWLXCWkXCV8gHWR2ZSKpCETl08/NAJWU99v?=
 =?Windows-1252?Q?TsH1AGka/4L6VsrXqIDGy/D9eV8wQMUASOxd6wlQhz+AxXttdBLwaaXG?=
 =?Windows-1252?Q?6w/089Xzb5YjdewMLkr8NtORORCu4WY9qjMzWwMPOCutLaUYdINjlnDq?=
 =?Windows-1252?Q?BlzC1oc9bUZYinX8DTTCHtCMrN/lBGjHGlEy2jNHClnLK6TZtIfHDfHS?=
 =?Windows-1252?Q?y7iMbvoHy/x9TTH8IzC9ft0lw1z3ruTyq9HsgS8uB9u9Bu5IGmydYOT1?=
 =?Windows-1252?Q?UCYV0o9PDe4Y7Og+UDQHXRx+fAPAYlBNHZtggWOI7a+2Oduye4jYJsmh?=
 =?Windows-1252?Q?WpC0AgcS3P9YwHX4CRaIWibDGT1vGrUNX1e2RXRRZU5Pqr/2lE/Y945y?=
 =?Windows-1252?Q?MiNXv5dHhrsFVA=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <B91DB2F8DBDB4D4B81C889F3F77A209A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f970324-6b2a-4ad5-5ee9-08da22ebaefd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 16:34:47.3596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOcz+L9ln+sauf5A0HzU55XAd8bzI85KWny3OBHf59vcm5KGDRMQS6gFYlh/WaT5iCNhfdMSwYDT8XLyuu63UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3200
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
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

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17=
:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2022-04-20-for-christoph

for you to fetch changes up to ae7875879b7c838bffb42ed6db4658e5c504032e:

  vfio/mdev: Remove mdev drvdata (2022-04-20 03:15:58 -0400)

----------------------------------------------------------------
gvt-next-2022-04-22-for-christoph

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
 drivers/gpu/drm/i915/gvt/handlers.c               | 1033 +++-------------
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
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c       | 1292 +++++++++++++++++=
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
 42 files changed, 2531 insertions(+), 3138 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gvt/gvt.c
 delete mode 100644 drivers/gpu/drm/i915/gvt/hypercall.h
 delete mode 100644 drivers/gpu/drm/i915/gvt/mpt.h
 create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c
 delete mode 100644 drivers/vfio/mdev/vfio_mdev.c
