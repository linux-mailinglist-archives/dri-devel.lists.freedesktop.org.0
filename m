Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933175AB677
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 18:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F52310E899;
	Fri,  2 Sep 2022 16:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6677F10E899;
 Fri,  2 Sep 2022 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662135991; x=1693671991;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wz5hrOG/dtzMD4Ja+vb4bNo11Fg7UdcHUljJf/2RUZc=;
 b=gxR1d5XC1euL8ii0xBkWuQH4BGx3tw0IzVH1+LpXlZXwClzJg1jl2nsc
 6E78V9Fd8t2yppUF6pMmgn0daPX2K8FXtBvK1Mbr6YFDuy+ch2sQT03ge
 oWYro4rVSHxb8HsM46stKDTOPyl56YSqyUgUrzp+D5NCtq64/b0NBhKcL
 HP9BrZdCuhY2PL12dkqrMzcnIhbPGadC3Zs/O2ioEs8dt0PgFBaNb06D6
 m9RV0uPnVLSfToNkBxm8MglfOTZev97E/BD3s/y9aV4gMACCl6klsM9rI
 QTaitpNCVKDxGP6r3UWy0JQHDqmB82mdZe3C6UhyGHd0rZVOTVwVgu34z g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="296021898"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="296021898"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 09:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="590121802"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 02 Sep 2022 09:26:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 09:26:29 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 09:26:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 09:26:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 09:26:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imJZeRu1T9Tnjr1TkxblZxEqN7oZK74/GiGxxfw43caeNKMSWOcuKI/8vThbeCOqtNCaDeQsoJ9Y1jb/YtVLCZHxL1Dvu8DMdw1gmGAyJNO78JifEMCemQfdVYjNfdVukbqhw5sDPoCp4gA3dHSWXCqesxqO4VoQT/3nVqRnsu00zyI5l9kGtKzWDkV/0xXk7bA55RJGdUAyE5JFQZHcTCfMoFsMDdY9p7Pn0YP/SjgB4+egl0wyGJK4KPpbh0PdhnwzXsIzfYVstKy1FD7tIBlls8HJhE6QUwHzE3/u6ucThyzpfq5T6Icx71BTT2bcfCh4jNNp5/G0hPpzXA56OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz5hrOG/dtzMD4Ja+vb4bNo11Fg7UdcHUljJf/2RUZc=;
 b=ETjN6HpCOPjdy7gNSkhDFbD1z1Lme7PD8KYI/Y7F9O05q2bT54CHo2ykuxvn8xAVESV4sYwEUhFPwk8+4mMapW/uKvQUIa8rC5yGSQDKLSfT3oKg1dYiFFE1Er27gH1+eq7JXYu+QeP0BP2FbPPqvOGWbKQMHVtKaGvHq2206dsPLDH8UMLsuWAld2oevG0/tBYFwS2LC981lSCWfN/MKyOflh68vx181Bpig4TRhLi9QWhE7t6XpZWxQg2dNs0X8dTM60ZPJh3VVRAbfXAm9Kgh/mmYiTvdNNHVjkl4yyHBaNEPB6o9UgW8dHolK/9fjhjCbUyJhZ4beyzQtrcGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 BN6PR11MB2050.namprd11.prod.outlook.com (2603:10b6:404:3c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.19; Fri, 2 Sep 2022 16:26:25 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756%3]) with mapi id 15.20.5588.010; Fri, 2 Sep 2022
 16:26:25 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Dmitry Osipenko <digetx@gmail.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas_os@shipmail.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Chris Wilson
 <chris@chris-wilson.co.uk>
Subject: RE: [PATCH v4 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Thread-Topic: [PATCH v4 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Thread-Index: AQHYvVAKt26jWPyWVUOQMFIjO4nTPq3Km+VAgAFX7QCAAAHWAIAAUtTA
Date: Fri, 2 Sep 2022 16:26:25 +0000
Message-ID: <DM5PR11MB1324EDC7A97DE98C2DC6EDA8C17A9@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
 <20220831153757.97381-7-dmitry.osipenko@collabora.com>
 <DM5PR11MB1324088635FDE00B0D957816C17B9@DM5PR11MB1324.namprd11.prod.outlook.com>
 <760b999f-b15d-102e-8bc7-c3e69f07f43f@gmail.com>
 <c89680d0-30ee-f5d7-be68-fa84458df04d@gmail.com>
In-Reply-To: <c89680d0-30ee-f5d7-be68-fa84458df04d@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62b9e1fe-40af-4387-5e88-08da8cffe1a2
x-ms-traffictypediagnostic: BN6PR11MB2050:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sGAkQ6Tm5Uf0Vv1SH1H3DRF2gqIBeZFHSw+MICeKqTIh3kN+Wo9aRoe3vx8ZNqdOQsfC6qsDJi/hgwO/4jHk+MOqDfuW8rwBhBz1JjAdQVHWuM8poTVlUhmhif+SheP9QMdc2ITcHyjWA/jXQ6YT9LVTD5cgcgJUe+7nxZD9Rh2tgGlXfcI178lsMbO2hO99gZ/TxyVlkG5OZEK79HKNjTX0hC+HeIP5F8vqCQ8j3bp3pr9Un4tDfM643M8NZ2jVOnvXNGD4fXw6A7ZssOZ+6K2ASBJVUHCMrK7frUqeFV60vdI1SvNeX/UctGv1o/9K8mPzHuY4NeK9zCD/qSaiLPx9iiiXhBJ330xvJVKz7HrbypX6CEmLixdgZ3dH5gw3KmIzx1c6SFo0CEVUkZ1+j7cSOdNJIJNzdbZdKmufCwZcru9wdJxbOdKszuMEAlKC0nJh+8fI/+t1Qbh7dzE2f1iuHtP/Av2STq26ukzEc3EhDGraKitvsKB6TAP+EUG7jLWaQr1RsIYir+X9hD5QncMXhlltJvL8cDTrsX3ojc4kYpkcjL5AssWe0Je5Qea3XUb5kvAtzcPTNGt0tTX8DsGUfZPDGkLETaeUsJsSN9JM6+RjTJtLAuDQLRxcHvLF3MAdnuNLrxKIaZMF494rs8R1aOCffhGBBRVo1T37Tr44bT8UJ6ngmBEGzM0IWaO+e03G2clgpn8BMXH29apR4nGclWR6dscZ+ghchmEAmisAczho9WmZRTOy+8OUy9LNSXAFKIpNHGjHuPhKPkRDxJlIxg/1dTEmzPj47S1ed+a1zwJjy3k1Va1mLDBhXZkD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(396003)(136003)(376002)(39860400002)(83380400001)(82960400001)(66574015)(122000001)(38070700005)(186003)(86362001)(921005)(52536014)(38100700002)(7416002)(7406005)(5660300002)(84970400001)(26005)(76116006)(7366002)(8676002)(4326008)(64756008)(66946007)(66476007)(110136005)(9686003)(2906002)(55016003)(66446008)(66556008)(478600001)(966005)(71200400001)(7696005)(41300700001)(54906003)(33656002)(8936002)(6506007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjU5NkdsaFNabitmN1pTWGFRb1NUZ2ZBZzh5dG51amd0NS9RejZQVkFmMDZy?=
 =?utf-8?B?VGtLcjhWc081NlhzTTg3YjZYdjh4YW9vSXJQQkIrbjUyVWV4eGRiMXAxMzVz?=
 =?utf-8?B?SlN5WkZuWjZGeVRVM2o4bHVZVmNQUjhicHlxRzBDWnhHWndZMDE4NkpEQXlM?=
 =?utf-8?B?cDFsVTdQQU42RFpieCs3MkVCSnpXZUNEZnJVM1ZsYXpsRWtNa0ovbkhDTktN?=
 =?utf-8?B?TjUwZEx1NS9PeHBPSFJSYjlJczVMOS9BS0ZGK2sraStodTd4b0tJcjQ4QTF3?=
 =?utf-8?B?bFZtMHhqRnVFZmMxa2gxT3RsL0dzVlppZWJXVUJQK0o0QVNjQU5GMkg0NVpN?=
 =?utf-8?B?UnEwcm1LSDVyTGlzOGlPNVBTaGtwQ1JGaVhsVFdUUjZqaXkvSjcvenMraU5j?=
 =?utf-8?B?aWhYNkhMZVZCSUl4RU1VZlV0N0oxRlhzMkVVMWkrQ2lMMWZHcEp0bjgyTTNK?=
 =?utf-8?B?cGl3d3BIcjhUSE5QSzZZZlpWeXVtbE9BVktiWHJLT1BvV0Rxekp6ZDRFSEky?=
 =?utf-8?B?THJEUFozKzhhL3BBTWR2ZkxNOUFrM2lIQTE5TkZoM3RJZUtsK3oxWHMvVDhN?=
 =?utf-8?B?Z2pKOENKblVZeWVEUDArSmViU0lQV2thdWNReDFRNXp5bHg0TFRNc2xGRUFw?=
 =?utf-8?B?MWNaNm11Vm14ZTRoRlg0RmVJU3pWODJCaVo1S0k4SGJNYnVSR2RYc21neEQ0?=
 =?utf-8?B?NUJXRlRpa1ljdS9NbXNwNURjTm4rMENzOGJmNzM3V2lMckpZckZOUjdFYTNR?=
 =?utf-8?B?ZHFyVS9heUh6VlZ0cG5INnFJeGUyLzN3Y3NWbnVKWjE1VFVZaW5uUmhESHQ3?=
 =?utf-8?B?SUpOdW1MaElRdTFPRkZ5T3plSmY1QkZWT0tUTC9SVDhBN1hER0JoYUNGbk5N?=
 =?utf-8?B?SUR5clNQa2lJVnd0cVg1THZjVFp1bmpkYTVGeEpXaTlXQis5cVhCQjJBSjVy?=
 =?utf-8?B?b0k3WU5jRXVrOGJrb3JyZ2VET2VhZVJTSDk0UE1KcCt1dWU5UlF5QU9BR3py?=
 =?utf-8?B?anpkS2ZWNC9SWExuRGZ3US9NM2JvQ1Z4dFpVYWU1bUVGaFo4STB4V05TUldZ?=
 =?utf-8?B?UXV3Szh5OVdoRGdXaXphMCt5bXp2R01keUhDZUVvYnRLa0pNWlpBK1lwODYr?=
 =?utf-8?B?MFpFK2J1K1ZuTldtd016andhbnlUdnRHaStoNzFPMFhKbGtraHpaZlo2MVky?=
 =?utf-8?B?RjB5TnNRZUZaeXEzUnhBRnM0YWd0aVJ2dlNFK1hqRUdEVDBTdFdieVdKYjRk?=
 =?utf-8?B?NlU3UnRCOTVVMHdXb29nZDl0aVpXMlV4aVhGZmJpWFRkcUVwaEZyRm9lY3F0?=
 =?utf-8?B?WXI2MVhHbG8ybVU4cllJWW9GeHg2cjR6ZmJsYTczSzc3VFJHRGsxNjFzOFp0?=
 =?utf-8?B?RDZQZ0doWG5KTFhZRGtNdlA5R2U0MHFBWnlhMVc3aWFkdSsvLzdsT2VmeTNt?=
 =?utf-8?B?Z0hVM0tlc2RUc0RQaEprNUl3QkxpVzVaMVBzNFN5Y3F2MngyamFkT0tucXY0?=
 =?utf-8?B?WVB3TzdjVElqOGV4NndkbkF2eStpVmhrV0xVUytYTURpeHFMbFJEaGhhL1h5?=
 =?utf-8?B?RVJ1ZW8vK1RIVlk2M1pxaW5KSWxTYTNvTmxFVmVNbi9xb1ZtSnNaNStuL0Nv?=
 =?utf-8?B?WEc1RGlWNzBUUUdEYWVqc0NqMllId3Awek5KWmRGOFdYRi90WXNMVjY3L3hs?=
 =?utf-8?B?bVZjV2pPc0ptYTVCT0xFNnp4RG5vL1NTaWw0YWFreWJJU2dhNXU2cFYyK3NE?=
 =?utf-8?B?TVJWdUJaL25jUWU5bWwxNUkxUC8rZTIvYllwN1JyZU1VSlo4MkhKSTczRzFZ?=
 =?utf-8?B?bFc0K21SbDA0ZmJYcnVIZGEyNjdSd2wyZmJ6VGRUSE5pa2xsTFY5dk94cXQr?=
 =?utf-8?B?ck5nUzJSVVExVGx0YmVQWGFyRms1aGxIUHJzeEQ1WWluc2FJRXhjRXZ3VFI2?=
 =?utf-8?B?c1RGaHhEb0o4OFZNcWVNa3VxVGw4VkRGTi9VQlZBWTJjQnVUUXQraWRoMEJV?=
 =?utf-8?B?eVBiR0pqT0Z4QmphVjJXb215R21BL3VsRXNiKzRiV3dVbmRIOWhWa29qdU9M?=
 =?utf-8?B?elc3ckZKQVVqV25Gblc3TVJUemFHa2JHb0szams0ckNacWVSSjRoOFg3M3RZ?=
 =?utf-8?Q?bdzCg6bmhvmOxGfCBUtQZAVEQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b9e1fe-40af-4387-5e88-08da8cffe1a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 16:26:25.5785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bg2JELs2xReMyTybiNYwlD1SKAXsqNEPU15RtFpPBXjoNgbR38+b41x+w76tM5nj5449W55u9aSu8fQJaM3iXQdK8K9yj9F3TyP8Lr2k8tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2050
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Gerd
 Hoffmann <kraxel@redhat.com>, "kernel@collabora.com" <kernel@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Russell
 King <linux@armlinux.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, "Gross,
 Jurgen" <jgross@suse.com>, David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomba@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Qiang Yu <yuq825@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdl
dHhAZ21haWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDIsIDIwMjIgNjozOSBBTQ0K
PlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47IERtaXRyeSBP
c2lwZW5rbw0KPjxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT47IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+Ow0KPkpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxh
aHRpbmVuQGxpbnV4LmludGVsLmNvbT47IFZpdmksIFJvZHJpZ28NCj48cm9kcmlnby52aXZpQGlu
dGVsLmNvbT47IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+
Ow0KPlRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPjsgQ2hyaXN0aWFu
IEvDtm5pZw0KPjxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4NCj5DYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+bWVkaWFAdmdlci5rZXJu
ZWwub3JnOyBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmc7IGFtZC0NCj5nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPmtlcm5l
bEBjb2xsYWJvcmEuY29tOyB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZzsgbGludXgtDQo+cmRtYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1tc21Admdlci5rZXJu
ZWwub3JnOyBEYXZpZCBBaXJsaWUNCj48YWlybGllZEBsaW51eC5pZT47IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPjsgR3VyY2hldGFuIFNpbmdoDQo+PGd1cmNoZXRhbnNpbmdoQGNo
cm9taXVtLm9yZz47IENoaWEtSSBXdSA8b2x2YWZmZUBnbWFpbC5jb20+OyBEYW5pZWwNCj5WZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD47IERhbmllbCBBbG1laWRhIDxkYW5pZWwuYWxtZWlkYUBjb2xs
YWJvcmEuY29tPjsNCj5HZXJ0IFdvbGxueSA8Z2VydC53b2xsbnlAY29sbGFib3JhLmNvbT47IEd1
c3Rhdm8gUGFkb3Zhbg0KPjxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvbT47IERhbmllbCBT
dG9uZSA8ZGFuaWVsQGZvb2lzaGJhci5vcmc+Ow0KPlRvbWV1IFZpem9zbyA8dG9tZXUudml6b3Nv
QGNvbGxhYm9yYS5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPjxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkDQo+PG1yaXBhcmRAa2VybmVsLm9yZz47IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPjsNCj5Sb2IgQ2xhcmsgPHJvYmRj
bGFya0BnbWFpbC5jb20+OyBTdW1pdCBTZW13YWwNCj48c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+
OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgVGhpZXJyeQ0KPlJlZGluZyA8dGhp
ZXJyeS5yZWRpbmdAZ21haWwuY29tPjsgVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz47
DQo+TWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPjsgTWF1cm8gQ2Fy
dmFsaG8gQ2hlaGFiDQo+PG1jaGVoYWJAa2VybmVsLm9yZz47IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT47DQo+UWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+OyBTcmlu
aXZhcyBLYW5kYWdhdGxhDQo+PHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz47IEFtb2wg
TWFoZXNod2FyaQ0KPjxhbWFoZXNoQHF0aS5xdWFsY29tbS5jb20+OyBKYXNvbiBHdW50aG9ycGUg
PGpnZ0B6aWVwZS5jYT47IExlb24NCj5Sb21hbm92c2t5IDxsZW9uQGtlcm5lbC5vcmc+OyBHcm9z
cywgSnVyZ2VuIDxqZ3Jvc3NAc3VzZS5jb20+OyBTdGVmYW5vDQo+U3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IE9sZWtzYW5kciBUeXNoY2hlbmtvDQo+PG9sZWtzYW5kcl90eXNo
Y2hlbmtvQGVwYW0uY29tPjsgVG9taSBWYWxrZWluZW4gPHRvbWJhQGtlcm5lbC5vcmc+Ow0KPlJ1
c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPjsgTHVjYXMgU3RhY2ggPGwuc3RhY2hA
cGVuZ3V0cm9uaXguZGU+Ow0KPkNocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBn
bWFpbC5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSCB2NCAwNi8yMV0gZHJtL2k5MTU6IFByZXBh
cmUgdG8gZHluYW1pYyBkbWEtYnVmIGxvY2tpbmcNCj5zcGVjaWZpY2F0aW9uDQo+DQo+MDIuMDku
MjAyMiAxMzozMSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6DQo+PiAwMS4wOS4yMDIyIDE3
OjAyLCBSdWhsLCBNaWNoYWVsIEog0L/QuNGI0LXRgjoNCj4+IC4uLg0KPj4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMNCj4+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5jDQo+Pj4+IEBAIC0zMzEsNyArMzMx
LDE5IEBAIHN0YXRpYyB2b2lkIF9faTkxNV9nZW1fZnJlZV9vYmplY3RzKHN0cnVjdA0KPj4+PiBk
cm1faTkxNV9wcml2YXRlICppOTE1LA0KPj4+PiAJCQljb250aW51ZTsNCj4+Pj4gCQl9DQo+Pj4+
DQo+Pj4+ICsJCS8qDQo+Pj4+ICsJCSAqIGRtYV9idWZfdW5tYXBfYXR0YWNobWVudCgpIHJlcXVp
cmVzIHJlc2VydmF0aW9uIHRvIGJlDQo+Pj4+ICsJCSAqIGxvY2tlZC4gVGhlIGltcG9ydGVkIEdF
TSBzaG91bGRuJ3Qgc2hhcmUgcmVzZXJ2YXRpb24gbG9jaywNCj4+Pj4gKwkJICogc28gaXQncyBz
YWZlIHRvIHRha2UgdGhlIGxvY2suDQo+Pj4+ICsJCSAqLw0KPj4+PiArCQlpZiAob2JqLT5iYXNl
LmltcG9ydF9hdHRhY2gpDQo+Pj4+ICsJCQlpOTE1X2dlbV9vYmplY3RfbG9jayhvYmosIE5VTEwp
Ow0KPj4+DQo+Pj4gVGhlcmUgaXMgYSBsb3Qgb2Ygc3R1ZmYgZ29pbmcgaGVyZS4gIFRha2luZyB0
aGUgbG9jayBtYXkgYmUgcHJlbWF0dXJlLi4uDQo+Pj4NCj4+Pj4gCQlfX2k5MTVfZ2VtX29iamVj
dF9wYWdlc19maW5pKG9iaik7DQo+Pj4NCj4+PiBUaGUgaTkxNV9nZW1fZG1hYnVmLmM6aTkxNV9n
ZW1fb2JqZWN0X3B1dF9wYWdlc19kbWFidWYgaXMgd2hlcmUNCj4+PiB1bm1hcF9hdHRhY2htZW50
IGlzIGFjdHVhbGx5IGNhbGxlZCwgd291bGQgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIG1ha2UNCj4+
PiBkbyB0aGUgbG9ja2luZyB0aGVyZT8NCj4+DQo+PiBUaGUgX19pOTE1X2dlbV9vYmplY3RfcHV0
X3BhZ2VzKCkgaXMgaW52b2tlZCB3aXRoIGEgaGVsZCByZXNlcnZhdGlvbg0KPj4gbG9jaywgd2hp
bGUgZnJlZWluZyBvYmplY3QgaXMgYSBzcGVjaWFsIHRpbWUgd2hlbiB3ZSBrbm93IHRoYXQgR0VN
IGlzDQo+PiB1bnVzZWQuDQo+Pg0KPj4gVGhlIF9faTkxNV9nZW1fZnJlZV9vYmplY3RzKCkgd2Fz
IHRha2luZyB0aGUgbG9jayB0d28gd2Vla3MgYWdvIHVudGlsDQo+PiB0aGUgY2hhbmdlIG1hZGUg
Q2hyaXMgV2lsc29uIFsxXSByZWFjaGVkIGxpbnV4LW5leHQuDQo+Pg0KPj4gWzFdDQo+PiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LQ0K
Pm5leHQuZ2l0L2NvbW1pdC8/aWQ9MjgyNmQ0NDdmYmQ2MGU2YTA1ZTUzZDVmOTE4YmNlYjhjMDRl
MzE1Yw0KPj4NCj4+IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIHRha2UgdGhlIGxvY2sgd2l0aGluDQo+
PiBpOTE1X2dlbV9vYmplY3RfcHV0X3BhZ2VzX2RtYWJ1ZigpLCBpdCBtYXkvc2hvdWxkIGRlYWRs
b2NrIG90aGVyIGNvZGUNCj5wYXRocy4NCj4NCj5PbiB0aGUgb3RoZXIgaGFuZCwgd2UgY2FuIGNo
ZWNrIHdoZXRoZXIgdGhlIEdFTSdzIHJlZmNvdW50IG51bWJlciBpcw0KPnplcm8gaW4gaTkxNV9n
ZW1fb2JqZWN0X3B1dF9wYWdlc19kbWFidWYoKSBhbmQgdGhlbiB0YWtlIHRoZSBsb2NrIGlmDQo+
aXQncyB6ZXJvLg0KPg0KPkFsc28sIHNlZW1zIGl0IHNob3VsZCBiZSBwb3NzaWJsZSBqdXN0IHRv
IGJhaWwgb3V0IGZyb20NCj5pOTE1X2dlbV9vYmplY3RfcHV0X3BhZ2VzX2RtYWJ1ZigpIGlmIHJl
ZmNvdW50PTAuIFRoZSBmdXJ0aGVyDQo+ZHJtX3ByaW1lX2dlbV9kZXN0cm95KCkgd2lsbCB0YWtl
IGNhcmUgb2YgdW5tYXBwaW5nLiBQZXJoYXBzIHRoaXMgY291bGQNCj5iZSB0aGUgYmVzdCBvcHRp
b24sIEknbGwgZ2l2ZSBpdCBhIHRlc3QuDQoNCmk5MTVfZ2VtX29iamVjdF9wdXRfcGFnZXMoKSBp
cyB1c2VzIHRoZSBTRywgYW5kIHRoZSB1c2FnZSBmb3INCmRybV9wcmltX2dlbV9kZXN0cm95KCkN
Cg0KZnJvbSBfX2k5MTVfZ2VtX2ZyZWVfb2JqZWN0cygpIGRvZXNuJ3QgdXNlIHRoZSBTRyBiZWNh
dXNlIGl0IGhhcyBiZWVuICJmcmVlZCINCmFscmVhZHksIEkgYW0gbm90IHN1cmUgaWYgdGhhdCB3
b3VsZCB3b3JrLi4uDQoNCkhtbS4uIHdpdGggdGhhdCBpbiBtaW5kLCBtYXliZSBtb3ZpbmcgdGhl
IGJhc2UuaW1wb3J0X2F0dGFjaCBjaGVjayB0byANCl9faTkxNV9nZW1fb2JqZWN0X3B1dF9wYWdl
cyB3aXRoIHlvdXIgYXR0YWNoIGNoZWNrPw0KDQoJYXRvbWljX3NldCgmb2JqLT5tbS5wYWdlc19w
aW5fY291bnQsIDApOw0KCWlmIChvYmotPmJhc2UuaW1wb3J0KQ0KCQlpOTE1X2dlbV9vYmplY3Rf
bG9jayhvYmosIE5VTEwpOw0KDQoJX19pOTE1X2dlbV9vYmplY3RfcHV0X3BhZ2VzKG9iaik7DQoN
CglpZiAob2JqLT5iYXNlLmltcG9ydCkNCgkJaTkxNV9nZW1fb2JqZWN0X3VubG9jayhvYmosIE5V
TEwpOw0KCUdFTV9CVUdfT04oaTkxNV9nZW1fb2JqZWN0X2hhc19wYWdlcyhvYmopKTsNCg0KUHJl
dHR5IG11Y2ggb25lIHN0ZXAgdXAgZnJvbSB0aGUgZG1hYnVmIGludGVyZmFjZSwgYnV0IHdlIGFy
ZSBndWFyYW50ZWVkIHRvDQpub3QgaGF2ZSBhbnkgcGlubmVkIHBhZ2VzPw0KDQpUaGUgb3RoZXIg
Y2FsbGVyIG9mIF9faTkxNV9nZW1fb2JqZWN0X3BhZ2VzX2ZpbmkgaXMgdGhlIGk5MTVfdHRtIG1v
dmVfbm90aWZ5DQp3aGljaCBzaG91bGQgbm90IGNvbmZsaWN0IChleHBvcnQgc2lkZSwgbm90IGlt
cG9ydCBzaWRlKS4NCg0KU2luY2UgaXQgYXBwZWFycyB0aGF0IG5vdCBsb2NraW5nIGR1cmluZyB0
aGUgY2xlYW4gdXAgaXMgZGVzaXJhYmxlLCB0cnlpbmcgdG8gbWFrZSBzdXJlIHRha2UgdGhlIGxv
Y2sNCmlzIHRha2VuIGF0IHRoZSBsYXN0IG1vbWVudCBtaWdodCBiZSB0aGUgcmlnaHQgcGF0aD8N
Cg0KTQ0KDQo=
