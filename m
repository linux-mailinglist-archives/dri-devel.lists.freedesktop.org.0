Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2FB61465E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 10:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D17810E33B;
	Tue,  1 Nov 2022 09:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FD910E302;
 Tue,  1 Nov 2022 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667293851; x=1698829851;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pNHHcewmo2FYwtWopTUdVLVtAOKUBMFN4a7sImbLvYM=;
 b=bNtMXz0YlhOIT/MO/NdRrL3EdMi/Ba3WPIMew9ZYB1U7zfc3OeE/tH6/
 9gyV6OICnGEoIOTMI6Kj8vAs/2rc4sA8O1rAFMiMLz9Pz7SaN7rDXtW2w
 Tpak3eF0al7pD4r6d1nkaad5BwF1yoTN9FwB/vdaDC58aaveVoVFNoDwY
 jrUkrmRb1i+x9qaBcvIu6xudUXhJWlQ8acfJ8/g3HJ7kQ9rasX3GHk9p7
 bRI6PEzFjhb9/EBwbXaLzoR/mBC+k7LZQOJZwg0ru4O3+5/a0YPta5jxo
 m+WYSeH6zpkRl2vsqqu7N3eVMIySuRcijfIWG9aXej5bWxw6gLmvAi8vE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="310193889"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="310193889"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 02:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="879034556"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="879034556"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 01 Nov 2022 02:10:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 02:10:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 02:10:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 02:10:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ha6/1ayLdPyxRbGa3PtO82jEiEBUFmMrtK82C2y/cKKzLYneSQP6eKeVl04W7Rq4aZOEIrx+/KaCRdtpiThwOdLvEIWn6juRb2zwfUEOqQan74R+a8GZ7mjRAbeOX8DtGnh0GeLlx/bRZd9nuavT/hHFQvc4LnEq/ld55YZ4G6RURx20wSw3172Y5HFWW2wJt/90wKCGnHyTdYmf0H6oQys/nAyh6me/vz1i8cQe2gmAwFwnHYNi2rZByL9I/1v6q53A1BqrD89GDnkmsXkoTDreYS5JXIMCksr7XltrZlqe0km7qwbfOaSVoC/4uRdCLoUxpnigB/9AbOB4kZx6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNHHcewmo2FYwtWopTUdVLVtAOKUBMFN4a7sImbLvYM=;
 b=XuykfaFKF4Df2xh0IxwOYmEMu05V0Sx7jY1VpK8tJ+qVS6dHsB1W0MXwFCkqdBVsfxp0s8eDNHA7fovWf2aPt/9xkI5twVB6Mk/oG5gV2OQq/b0kmd65SD6BVsxJIRWPYMpAZXYKsZ6ES1Ck01Mlw6nbqHFI/bG7bfSBY9uw3WjAjWZnMibZuBpwajJE0tAQjPJUkNnhq1S2K3TIgeBS89/atp9pK2toaAe0GjNLO8gppcNp1wUnwfIbchh93cvfrDAo1Am6TDSjmVhp+i/Sg87ICbpGW2+pOYqKCdioyaJBNzltpKJygDIF+2IugPR1oASA3Nuaw2Qh2LGyNPn3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 09:10:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 09:10:47 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Eric Farman <farman@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>
Subject: RE: [PATCH v1 6/7] vfio/ccw: replace vfio_init_device with _alloc_
Thread-Topic: [PATCH v1 6/7] vfio/ccw: replace vfio_init_device with _alloc_
Thread-Index: AQHY49cNyAm5A5cMYk6TS5lyulMLNq4p25sg
Date: Tue, 1 Nov 2022 09:10:47 +0000
Message-ID: <BN9PR11MB52761247732AC600BB390C578C369@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
 <20221019162135.798901-7-farman@linux.ibm.com>
In-Reply-To: <20221019162135.798901-7-farman@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ1PR11MB6252:EE_
x-ms-office365-filtering-correlation-id: e17fe359-665e-4f39-01a8-08dabbe8f6c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 02qSeK4ylvQ0CVjj02tAI4N6Kyb5q9DiFC5yepB2y2BppHNaZslDzfMRUotOvonqGBlVSjZOIaIQdKpHHMAWj7f2V6evZnbWr1ujh2CMKe6VroYYZAbgRwyQC/kAvhcuTNhSlxr+lY10rS0Agy+4XR1Qf6NqbwPgTHKr8Rb0Zrk/VAQjLp8DfPMPGE20cPOl0xobLFBVW/cs4pjJhYw4n3Xw1M2vz14e+aiOqKbf/gKL0SHq8QouwjHrrZNPw9HefXcEePNr3QGYVrUx84Ch8DfC+Rg5CxliOgosJPuA9TjcjklyEV+kDzzqAW2riiJazDiRF3xlX0ZQgc1WJpGqkNdDUylbh9zSsJHnKyAvBDVSnx4E4vgmZTug/pNP5HKIErOIu3/k/PsML7j4jmfbqEbEH7ksl2x4ZuYw2PXDNpmgFFXCY0IE+IN3LZAF9mVdck0Xu3TBplt3qymuB0aOuZK800JJ61HahZ6P6IdavqQDcHnvqJQg61XsOiu0iJlzdYpBskgYT60iw3SCjt6X9ycWB9vg5VGkG94jbzGObBflUPXSV21FvYwAZOspf7GtO9W0eSyHCLcd35n41bvWWRR/kj1T2/Rt5IVVhzhgQEnRcDn98I3r+9cpc4U0flEzwjaECukhbfBZZP0XmI1VoyO4sB9CYxaOB93yrWd0prg28yQpDnNGlHbxMaRbmjmtWZ5GhulfhK3XVrqT+vtelse5Yc0ppnsaPI0cHg4iv+rt4DrfsGurbeJJA77E3U9dzsbIuQE4eGcKjtvqBn61NQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(5660300002)(186003)(66446008)(7416002)(4744005)(7696005)(4326008)(9686003)(76116006)(66556008)(66946007)(8936002)(64756008)(8676002)(2906002)(66476007)(6506007)(38100700002)(82960400001)(41300700001)(86362001)(38070700005)(33656002)(122000001)(26005)(55016003)(52536014)(7406005)(110136005)(316002)(54906003)(71200400001)(478600001)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uZDvxQphpx0TnbeZA5DKGYRZlZwrA0MoNNsKJfKJKAxyCM+Vh0HxIrrgiJCV?=
 =?us-ascii?Q?fKHncKuNObyivEukAtBL1DveMY9LYoM/yuWMFSnh5dH4/0coFL3saX5zI0X3?=
 =?us-ascii?Q?aouYCK4BZZe4s9mvhlQbClxnHRFdLY9qHx7k8zCPwcRlW2qEJmi03+Ng9sOj?=
 =?us-ascii?Q?Jm+0/Y6nwR9T3yFHfGbiDe2B9DlQbBRRDs4/aRo+Wz69n2/VNEdjUH3yhIV1?=
 =?us-ascii?Q?f/kHeWE+tNwdEaeR0e64LLqqVQUuywjO4KJ2KFYxWNjliy17rpr34xlCsdYc?=
 =?us-ascii?Q?21j7x6iHLs/gArEGkzaZiecXzRU93apE2SKq/0vtMtQMt2SUSuspjvB/4Jev?=
 =?us-ascii?Q?b/Ls+IB5IPl0MgqusuCGRi7pwSr/hGuSPG93C4M20P3PATeDoRZ2geisYpE+?=
 =?us-ascii?Q?B4cTIjEDTY3TVVdkKlb+XSDb3AP4LMZ2L+b5nMZKO7GcxqG+E4bj8xHl9CXZ?=
 =?us-ascii?Q?sJh2NKUReOz09RA4odal3Py3dFn/68TqnUT00kKH2xE8/j18NG0T4kaHUXb9?=
 =?us-ascii?Q?gEwc/APQkhqJRfq+nHLXeePDWL40MFhxp9NwWUUtvCoSNyC6OiPkcoENja2n?=
 =?us-ascii?Q?cuE3BJ93Tv1dIJyq3htkTdo0b/6IianjB5rIdOAn75G3LgyR49heu99pqL1k?=
 =?us-ascii?Q?5jiAcv4C+VXOS4QbZCYrJijriorb/qIaIulrdmpDz+R9JZzPbxcAygD5TqgE?=
 =?us-ascii?Q?q70KBqmWCyAPwqFup3ROQJaCLTid3mVwHkOYRFwHpmw5ikYNcGzu0zJqggc6?=
 =?us-ascii?Q?eGgTamETT7xl50zuVjW5nmK/JU8lVGwQ4BSiQ502JPOFpWFyWmNbT6moLeKd?=
 =?us-ascii?Q?3mUpVHhw5onturahY3Mj1m66DIPfgj6HzKTlbHT1sGhIjh2MzIdQqYugfeV9?=
 =?us-ascii?Q?UFvHKKMp20HTRnmDEA0Sd8eCmQzb3IWdTsNEHBjQu4NmYhvNivQR+pwkcF7H?=
 =?us-ascii?Q?QUa1ccaTOxoEKgU7SD4mipn9/J+FzTEswprMJXiyEqjn+P8PeYSGNVQ37Pye?=
 =?us-ascii?Q?yDqRuIwyth7s9R61440PLJzJuyVrRTGzm68nnMdf/MdlA1xZBJ+ZVIEwzdgF?=
 =?us-ascii?Q?VDxBv8eevyyChBBotsK678/XkGdrR0s7hndjB6HhLL947wzoKxFwG5Bo70qs?=
 =?us-ascii?Q?h5RkUKV1jXuinLRBsvs2oZwuLPnNXAzBrCQf8tgBEWM11ApVcwCp4N4nNos2?=
 =?us-ascii?Q?ro4+auHgMK237XG7UiS71vTZVyx5VFVhWkrNQt01OWndNJu5zSL/FNv+0nn4?=
 =?us-ascii?Q?IWfZN1TgIIRrAILRob4+xNXPJcNktskbUfqBrb5cVSqbGYXU3ouUJjl0SCpe?=
 =?us-ascii?Q?Q3w4UZXhfikXHW6XTLJOSeP2E5xpbc7t2Zmu+jlXB2hfYOpmuICVJNRfgzzm?=
 =?us-ascii?Q?/3qOfuhuVDn+AA1SB+O2AjY1SyJ/oNfRBpx/kj19xxI5k+oc1B4lCIq5bc48?=
 =?us-ascii?Q?fzVA20g5ZHtZSGuuo7btZM2w3fWJ1hlaYpfms2dd+Ftw5bcMkbgHo0xb5bT+?=
 =?us-ascii?Q?/+mLvbKnAMu3HjWoT9WL36R3V+JB11/lpkO2XaPo8jgLlmlNv5BNDViVjqer?=
 =?us-ascii?Q?BG6wASwGHl/JtJeO4lekhEushdsBjH+thBvSzmFB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e17fe359-665e-4f39-01a8-08dabbe8f6c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 09:10:47.2700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOdcKgtOWKDYZkN9t/9sM5D2kz63l9IVvNEJ6o34jDV3z5wu3A/7b7h3JRZ7oTVsO+xzBo19UglCSaD6ymYaPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Eric Farman
> Sent: Thursday, October 20, 2022 12:22 AM
>=20
> Now that we have a reasonable separation of structs that follow
> the subchannel and mdev lifecycles, there's no reason we can't
> call the official vfio_alloc_device routine for our private data,
> and behave like everyone else.
>=20
> Signed-off-by: Eric Farman <farman@linux.ibm.com>

This looks good to me. With Jason's suggestion handled,

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
