Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04415B1491
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 08:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747BA10E972;
	Thu,  8 Sep 2022 06:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39B410E96D;
 Thu,  8 Sep 2022 06:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662617988; x=1694153988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pcffSw4UDGF3QwYvasvTvyUhg+ZfIF3s7aN42bCQuck=;
 b=cGbGxABGR5eVjUCTzt5L/9dE97iqZHgrKSeQRVs8fAsWmSppgyNTeZgW
 BYieoH1vBeKpVbJtpaUpZ16P/xRDrtIUwTJtSNnxhPqSYt03CYC3RsWV1
 li3dpr2D/C30ubedV8nhU2nPfNS9h0bxnr1EBG3xpW1T9GT5s8YzjFkx6
 zU0M4xSL5Ch3w8H5jGyhEdFzTme1NUrn8pPAOeaOc+7IAFH0qNozIuyS+
 IuuQ8aObdYAq40phBSc4w4upywo5EcqE5ObnrOlXWd93fqnGrkaQZIujn
 rr8BO9wDp1TcBtMZxywtKnQKPVujPmp92J4GB0A/adZ1UjYexlj2yRWgy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="361042703"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="361042703"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 23:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="592030298"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 07 Sep 2022 23:19:47 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 23:19:47 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 23:19:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 23:19:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 23:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaZDDkSZj8AHnoDr95vFbKd1u4wS0zg2RGZ/NwpVScwmxQsddvRn9LB5JnRW/tM0k3uwe56pl5Cfvv3Uuvmt/mKF+pdPCLqVBNRXVw1Eiry9FkosUjAIn9xVOx+GUQB+YInEnwrAYi1tAKl6geuJrM0xuFYRqQdFcvFwkoXDG+o8iT6uLz62sQYlrpSheaU/A220A2VxYnxhI/Zc1qEbQFx5oUWiAYEXvFufTBG0vNZo+lzN1ZehjBLSaCQILSN4MVXj4QD9pO0eZi8eMazCRZ+nnrXjDsXaU/ZacS7BuLUsrM+cdDfuJPhLV7v4SLqjJXUsgvlGetRq5ey41fvnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcffSw4UDGF3QwYvasvTvyUhg+ZfIF3s7aN42bCQuck=;
 b=Kc4BMM7p65JEICwiiCBdt0d1+URultqzTZCZo+N8azMq7GjfqkprM4zcGwsCvQRXIZW3x6oaPnHJOPFulWKX4XraCsLnB3V/FX5N9YVJp6Jk6oN7VW3hTYOzEMgbwII9YIO9D2p1oPUb5g+Rx+eBhC8MMi4tncq6M1OLW/T+LPl2l0TEx2a4AHAXQ59tkBaTNU28fSK67ppCz/MPxikQo3gd369dgY24AKa/xkcyW0yGHCgKZIeaSxfxNplc7dgBHBuPuU5p2tPpxwauqAlCfQY9AM2gG+XNpZhX4X2qZKNeNvNmx1tWxso3HyXPDo9QxoOqE7v7BfvMoIDzc0OUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB4425.namprd11.prod.outlook.com (2603:10b6:5:1d9::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 06:19:44 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 06:19:44 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Eric Farman
 <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger
 <freude@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Longfang Liu <liulongfang@huawei.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Abhishek Sahu <abhsahu@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH v2 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Thread-Topic: [PATCH v2 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Thread-Index: AQHYvdLyg4z9as64RUeGfBAXbmJkJK3UZE+AgAC03LA=
Date: Thu, 8 Sep 2022 06:19:43 +0000
Message-ID: <BN9PR11MB527639DCC5706ADA8F0519D38C409@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-2-kevin.tian@intel.com>
 <90862543-9343-7389-a1ff-be9a011be64e@redhat.com>
In-Reply-To: <90862543-9343-7389-a1ff-be9a011be64e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM6PR11MB4425:EE_
x-ms-office365-filtering-correlation-id: 3585e748-21fd-4622-7a7a-08da91621f15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RnE99n9Lp+DSfKp0qse8YXKNsJacwYQQFwyy7yRJvYDAmqwX3PBccQENggVXz9EZlkuOVEll/1XHAu96PYv+iaX2xoLooL4AnHxR1hqo/qRoNhQPXHhu+xKgQEcU0PUpU5rv+BxK36cPh7zJq6BYwW7A1Rkgaub/3OjaMzZmfbJACy8rvkQoiZOoPwxQtOSu874bjt1DaaS9GGePZeR1or2Vm9ssMGAs8xjJOijMOSooYihWkQT4X44GHmAaEXep+wG8PSgDO1V9EYTGaMjwVfx5649K/oo3/hqRJl+KDg2d9NhHDiT4tIlnmCUBPDx86iSTetik7tNgWP7CC6PFgOoYlrwM/2+a+ho8HjqECxRE4I9t7nFnI1kb6qgkSp7omG8Ou2pyE7d3IOsLMU7T5ZjXXihkBonvAYbALwYSuY6MLpqjQinMD2dGX+QLqF9WiiSQD5CqcoTK9sk6y3Yre+NBmm72xB1uSGPU+WXlaJCAOJ17fJA/bT5sNpaHP+gi3n53qwhmGbiZW2cGKb6o0GdnkAcssHQvro5s0uMLEhJbunpyM82U1r+PX+cs4Lv5STNcfMYWbOijiL1wuNl2Gm1UP+iIBD536JqDdRd4SgbAkY0Pvcvghm0fQF8TE+Yc1evwKyeQyb/AzbbtnHYvgiA4sALVGn5woC147LR4BS+MqiC7XvA2IBAd7wsprcBgCHHA/i5/WDGgF2dRz2B19u1wPVQFBvHVVLwe3pEtPM4mJ6i3eH4BLLGjkTPvWjIC0ta3siretnmeCcJbl1FfBSvqnIm53Vz/cQi3gepUAuIgJVBGwu2kJN+YbEUrsxN5KCz5EB35RHsQSKC8E2nPoA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(366004)(136003)(396003)(39860400002)(82960400001)(38070700005)(921005)(38100700002)(122000001)(316002)(110136005)(71200400001)(7406005)(52536014)(5660300002)(4744005)(8936002)(7416002)(76116006)(66946007)(66476007)(4326008)(2906002)(64756008)(66446008)(8676002)(66556008)(186003)(41300700001)(55016003)(478600001)(7696005)(9686003)(86362001)(26005)(33656002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0UvTHdWeDlqcEsvSGxTRUJZU1JFdHdaSS9SdFBlVlpOaFNFdlg0N2huZllE?=
 =?utf-8?B?R0diVk5NdFpiU1VXbzNBSTVyZ2pRKzJnSVdSMityTURFOTBqU1FzRDltWTJH?=
 =?utf-8?B?OWFQdk9mU2pZZWFFRW8rcCtpVStDR1Y1OFUyeVpMT0tyN2RENnN6UUZIUi9E?=
 =?utf-8?B?bzUySjc2a001ZDk1dUNSbWViZHkrT0JwTG1PR0hmQzFDWDNZaFl0RmR3TTY4?=
 =?utf-8?B?TFdTZDdaT2V4SnRuYzQzTVpNZVFkQm92cC9OTlIvRzM1OFJSWHdBdlV6TEdM?=
 =?utf-8?B?bDZ1WW9IV05jcWNFMC9mNGtkM3ZEVi93V0FRejF4WTl2amRtTUJZNHFqeDNI?=
 =?utf-8?B?cHNRV2k3SFNtTEVYQmFSSUwyV2pnSGJHUitiTkZERjQzeWVVM0syeUE2YTR5?=
 =?utf-8?B?YUVxUkJUaC92VkpnRW5vS0xEV3NSU1BhdWI0ZG9HTlU3d2ZKcnVYY2tOVStR?=
 =?utf-8?B?MVZiSU9DWVZadmlwRC8yVzFqVmpGTFYxRXhLbTlaa004cmtKWEdNVVNkaUlm?=
 =?utf-8?B?SEJLSUgwWVNRWERTM1lJV0Y3bWEvREp3Mk1mWnlMS216bFpXb0RlRUc4L0Vr?=
 =?utf-8?B?Uk5OMk9pODdiMnJiOFpORzlwMWpleldaRkVvZ2RUV1Q2aGhWd3RrNm9yc2o5?=
 =?utf-8?B?RTJ1VlF1N1JQQ3pIeEVNaDBvZnNYMTI0WTlHcTVsbDJxNlRpbU40Q0ZDTFJa?=
 =?utf-8?B?Um5NaWtyWmdMSVJ4UHFnUGt6TVlmVTdaRnZqWm10Q1dXeFZjb0RRbVRBYWQv?=
 =?utf-8?B?YTd1SXZBYnA0cEp2ZDB4QnBhRDRpbXgvVFY2NW5FWHVYQU9zcDVSYjBoTEdC?=
 =?utf-8?B?RUp2V0IrVEVSVU5BUUttTWdveWxrbWVPdmNaMDNtLzUwdWhhWXRoVE9HTlFC?=
 =?utf-8?B?cWsrTmhkaWlVTjlrYTlGdWV4dW9MbXR2N2NFdlplbE9rRHlnRjdHbzNmWkxa?=
 =?utf-8?B?emtjRnlhb3NheWN2NFU2d2dZVXVsNTB5UGphV2hFblRRMFBIQmVOMTIwOFVV?=
 =?utf-8?B?aHRrYmgyRVlHejZvUlFoSG9vTEpYS1hlKy91L0FyWDBGSTBtcEg2Rit3Qjk1?=
 =?utf-8?B?RmVnVlljTTF1My8wS2p1KytZbSt3RGd4bFdOMGRQbkc5dlBWT1hQZXFDYzhS?=
 =?utf-8?B?YlZFQ2Jsc0ZwRkJCZ09sbGZwMEo2TXpxUTFucUF6NlowbVdvTklmZ1FZbFdZ?=
 =?utf-8?B?UFpCbjJrWTRXUitWT2hrUmtBT3E0Tit3cURZN29tcUFsWGFRcWxyTWdhSnZT?=
 =?utf-8?B?QTRBcVNCZzU5UWorNmNtend0ZUh3d1BTZUMrWVd4VUJidWJhWHNwTG9QeWVH?=
 =?utf-8?B?L0ppUnlhWWk5K0lWVU1ockRsallLV3JVZXdkdFErSU8vMXo3SnlLUFlLOWc3?=
 =?utf-8?B?V3FVN09xMVpmWXZBZS9kQUNvemJQbFFxbzNDcnByTmMyenhXRVFBWTNqWWY2?=
 =?utf-8?B?bzB6SlFwdHhWZUFnT1RDSVNqQlQxNFFUNzNRLzVCbFpRV3QwNWhORm5HTk41?=
 =?utf-8?B?WHFvRERrM1hNUE52cXJjR1FHY0NSSFhhSVhkMjdQSnlvTENtc0tJZnlFakVC?=
 =?utf-8?B?eHBCd3JGNDJ6WUpmYlRlVlVvR3M0SWl5NlFlbk1QR3JPc3NSYTlHNUh4MVJP?=
 =?utf-8?B?M0ZDLy9ZTm9xbWNxdDBWcXRWaU1kWjJML0FPWFh1VWNjbG9kcUpQZUhnZkpx?=
 =?utf-8?B?YXV1NGNIRmJJRnBzNVlPcEtDWTZEY0RVR240T0RMTUUyZEhWKzFaTlI0ekJZ?=
 =?utf-8?B?dkdzY2NkTTl6YVBZaUp0d05UcjBvOWYrdVYrSkdJNzJuQXhSTjVOYTFiTHVr?=
 =?utf-8?B?dkZ6dzVWQ29JMTNDc0dRTG1WTEpPSmlCYnJET3VmNTR2d2pGdDAzcC9QVnFi?=
 =?utf-8?B?NEJRY2FwY1NRMERjYTZ6UXJhRzdHa1ZZTXFyNDN5aDdYS083bEtqKzB0cWtT?=
 =?utf-8?B?SGNpYnV1RGFhb3dCQVlPWE5BTGdmUHJpS0ZKQ0YrVFAraTBSNjlrTzU5T0Er?=
 =?utf-8?B?bXBkbnJleDFWazEyYWZuaThGVVhBUmpkQ0NSWVY2U3dFYldFakxpZXY3RFFI?=
 =?utf-8?B?YVYzWnV1NHYwWW5qV1o3N2dlbmVudG9DZGMvRzNqVCt5eUltcU9TVk9kRkxz?=
 =?utf-8?Q?tDCadOQTwJZsS+mDx6jE6danJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3585e748-21fd-4622-7a7a-08da91621f15
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:19:44.0190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jpiCcFGatYH/oJ2OUxtmZMkYA/QpQb9Tnq6GqdykIUExk5iSjwk9n8TY4dPrwpDf5NnnhY1xaaHSxxjkUv2+Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4425
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBTZXB0ZW1iZXIgOCwgMjAyMiAzOjI4IEFNDQo+ID4gKy8qDQo+ID4gKyAqIEFsbG9jIGFu
ZCBpbml0aWFsaXplIHZmaW9fZGV2aWNlIHNvIGl0IGNhbiBiZSByZWdpc3RlcmVkIHRvIHZmaW8N
Cj4gPiArICogY29yZS4NCj4gPiArICoNCj4gPiArICogRHJpdmVycyBzaG91bGQgdXNlIHRoZSB3
cmFwcGVyIHZmaW9fYWxsb2NfZGV2aWNlKCkgZm9yIGFsbG9jYXRpb24uDQo+ID4gKyAqIEBzaXpl
IGlzIHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3R1cmUgdG8gYmUgYWxsb2NhdGVkLCBpbmNsdWRpbmcg
YW55DQo+ID4gKyAqIHByaXZhdGUgZGF0YSB1c2VkIGJ5IHRoZSBkcml2ZXIuDQo+ID4gKyAqDQo+
ID4gKyAqIERyaXZlciBtYXkgcHJvdmlkZSBhbiBAaW5pdCBjYWxsYmFjayB0byBjb3ZlciBkZXZp
Y2UgcHJpdmF0ZSBkYXRhLg0KPiBuaXQ6IHRoaXMgY29tbWVudCBtYXkgcmF0aGVyIHJlbGF0ZSB0
byB0aGUgdmZpb19pbml0X2RldmljZSBmdW5jdGlvbg0KDQpZZXMgYnV0IHZmaW9faW5pdF9kZXZp
Y2UoKSBpcyB1c2VkIG9ubHkgYnkgY2N3IGFuZCBwcmVzdW1hYmx5IHdpbGwgYmUNCmFiYW5kb25l
ZCBvbmNlIGNjdyBmaXhlcyBpdHMgbGlmZSBjeWNsZSBtZXNzLiBHaXZlbiB0aGF0IEkgcHJlZmVy
IHRvIGxlYXZpbmcNCnRoZSBjb21tZW50IGhlcmUgdG8gYmUgbm90ZWQgYnkgYnJvYWRlciB1c2Vy
cy4NCg0KPiBCZXNpZGVzDQo+IA0KPiBSZXZpZXdlZC1ieTogRXJpYyBBdWdlciA8ZXJpYy5hdWdl
ckByZWRoYXQuY29tPg0KPiANCg0KVGhhbmtzIGFuZCBvdGhlciBjb21tZW50cyBhZG9wdGVkLiAN
Cg==
