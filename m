Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA29034694E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 20:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD6D6E855;
	Tue, 23 Mar 2021 19:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3176E855
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 19:52:15 +0000 (UTC)
IronPort-SDR: qHG0eaEbsx2YIDQdTnrAyQEaZRFzJuYCWqKqtGEaJuyBg9Nli0usDT6Iyh6ZQpJjuNsTVQ8uFN
 6LP127yXDWIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="275652455"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="275652455"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 12:52:15 -0700
IronPort-SDR: pY+OtfI9GaGhQGP+UKg9LF6ebyNQturOW6YZp0ZSBoCe4PgsMYOk8VFibZF8zrWKOC6d1uCImN
 BGfc1IvqtXaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="441847339"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2021 12:52:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 12:52:14 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 12:52:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 23 Mar 2021 12:52:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 23 Mar 2021 12:52:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0Kz0scB3Cv2FlZlKqFc5TiLO5VC+2dqkH/vMPHhTacHwUh7cjgy+4/mkhQ5nEa6WIN680tFII3bEZTl1/WiVZt4bpnmNQDkzqMT75A1LoGz7BynD2rqIaWReee3BG5z6KrFQ1oa0yET/sD3Lo9iI2syGxjaRbiV60PuyD/CM7ZC9wwSzsJerc/NL18pvY+sd8EEEKeCD4d7Kr7ASBEzH9A4HceD4VDzUwgHoe5qRwuYLV7qy6FsMFNHMpmL5FnniPHFEFSM5AniIMN333b9McQy3+I3pZFvDbJXMk1PWOz3j/gGbepEirnJ8y808UaepeyCXrYZHyUAjZJbj8divQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIfK/4RB7W88XETeDDhdZFk6tmViEcre/Ix6pS7VzBs=;
 b=AQtj44JN4njwwKxUYe9YCTICnKnb4hqRXKjpR0rrALIVeX06k6uR+bZSIhMe4nGYJU259FNyZZCM33/IRasTlAg1kzRfkcx1fO36FPmVNFw2n9x7fpTxdAN/6p4XWfxVrBqRhY61+mAP0w0B3yfmMKiExjaI/1MHa6XtsPfmb2Qqw5QjNb3W+LvNfqWizSu+TQ07NpZ16NQRP23QQxZdTijBYbtOVhLjC5223h8wKeoXr4fPz6Rlpwf/aBFPCp7+AvGN/2K9PQyZZhEzipo5+Zbi8I2DW8VdzCTMOlYqRZs1arvpdFI7xMiqIt9o09Is0WLWb2iSsXa8vylIpxdpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIfK/4RB7W88XETeDDhdZFk6tmViEcre/Ix6pS7VzBs=;
 b=cMF0h5Runv4v16TRTh0Dc10Y1OBRdCPyIsB0VdThwg/a3wmYCm5NFaPl7e3t0PhXCZqclKQKkAfbrLb4RWBT0Bgci1ys3UQGhRDAiOBVdAA5paHnnsWkNs4TigWVOquv+H8vRnF7FcT1i95QeEIL2t545uaOu011lSP0tfqmE5Y=
Received: from SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18)
 by SJ0PR11MB4957.namprd11.prod.outlook.com (2603:10b6:a03:2df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 19:52:13 +0000
Received: from SJ0PR11MB5150.namprd11.prod.outlook.com
 ([fe80::5127:2366:9745:85d8]) by SJ0PR11MB5150.namprd11.prod.outlook.com
 ([fe80::5127:2366:9745:85d8%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 19:52:13 +0000
From: "Williams, Dan J" <dan.j.williams@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thomas_os@shipmail.org" <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Thread-Topic: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Thread-Index: AQHXIB4E/VTXwsCvu0+B1J8xJxNM8A==
Date: Tue, 23 Mar 2021 19:52:13 +0000
Message-ID: <ec99146c7abc35d16b245816aba3e9d14862e624.camel@intel.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
In-Reply-To: <20210321184529.59006-2-thomas_os@shipmail.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-2.fc32) 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8527236-b9ce-42e8-eb94-08d8ee352769
x-ms-traffictypediagnostic: SJ0PR11MB4957:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB495775D694EBEE46E671CB31C6649@SJ0PR11MB4957.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1K2p/4KHyMr14aoPtQEp1u8qAWJsGtwmt9wbeE+skccuF+cEPD/QXGV7m8mRopLkS3uz+vrDzwnhikPXW66IUp4qYA6p2oCA43K0Cl5zVpJkugV/ohrtW9BB8nE9upkAbbLxk2qr68fVgyVvQPwF/Rx0eKUWl3nTRGEtp0RM/06L9ytmWPYGD7a53EBHzm+2NXHZUHkdeT1OwlIYrW3uNtSXS7kFz7k8fKHv5Uvb2J7zQr0VSmvwgPJbek2uG3lh84RJzJn9q4WKFwCR4hEzCibg7HaDdoy1gI4Rxigbg98Ublxi44l5mMgDLqLuaqvQoAOBTaKq7BPuaro+DQebNyO/iy2iTyM5LWo5USccjSrzGYr6b+cbyvChIFmQ3N3Q9Iz3a/coXeaQDdH3MtMeaGCMxCD5KTc0j01sbtnpyfsRBSfKFRmfe2rtt6nsCGcSe+eoIFBQBOv1sPbv4BnA51IZl9pZREEnsb8Nf9d0hIftEsFr87StY2+Q8wj7mTyaBx3HZvP5xZltTngBEyGAiSkt9CQoxftw/wuFaWRd8hCseOi+vwL4M57KQJcqNb8wVop0Rp9Bb8Oi8hgcPLgqMbM9JGVyt0SjFrwN3kS4zENkZawozTGGWj1+WxL7bQ4Tsm7hW6XjHPXbkIl4X0jxMOXZjorZf0AyFk3osWJXsbr8PCz7cSrgv2e7mfnRJkPZBnT4PYKfbmUZIQp+9E3bbs/vRgLR0kPCJVA4CxHwaYsJYE0ZlIbtB4cGRE95qvHg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5150.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(346002)(376002)(39860400002)(66946007)(66446008)(7416002)(71200400001)(2616005)(66476007)(54906003)(6512007)(4326008)(26005)(6506007)(86362001)(186003)(316002)(6486002)(8676002)(66556008)(76116006)(8936002)(64756008)(110136005)(478600001)(5660300002)(83380400001)(36756003)(66574015)(966005)(2906002)(38100700001)(14583001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NjFNbTdYVUNFcE1aL1NZcWtDM1EyVE1ObFVMRlZNV3Rra2xjcUxuZmVMMXZB?=
 =?utf-8?B?Qm1KSi9sZlQ1eVFGYkhOR0Vmam9PQU15ejFnbHN1bG5JMVNRdEVQZk54Qi9j?=
 =?utf-8?B?OVhjdEJEcWdMc0lLMmMzMGRVMnEycG1nRFdYeGtRUUMyelo5R0pKQ1ZGRWNt?=
 =?utf-8?B?eHJXNUZEQkFFMkhCOHFCRGE1dDBOZmdnSEVGOVF3Q0o2c0w5TDZTSUlGMkJS?=
 =?utf-8?B?cDhwSGZNVnVGR0xpMUl1OW0vdG1yWDBxc1JpVy83QTNtWC9BY3hNckhaQzIy?=
 =?utf-8?B?bWkwTkxBUnZqcjA3OFN0RU4za1poMTI1R1FsLy9hbldVbGZvWTBOa2hnaU56?=
 =?utf-8?B?MXZaVk1vckpvTHRuN3Z4Tmlwdm1lbEJ1UmM0QXdodldadEYyRGZyNXNMUlR2?=
 =?utf-8?B?Wms1enp2V3hBTFVYWEV4OStZZTBvUW5UUlZjYW94cEM0cS9lWUZkTXpqdkJP?=
 =?utf-8?B?VkdjTllNY0QzTzFVS3k1S3VlR1pLSURvdEJDNmJYSVFYbWhKL1pBWjNKelZE?=
 =?utf-8?B?a1ZKSFdpRExjSVBjL3pPUnZRMG5QZlovOFl2Wjl4S245MmNSekJpRG9VaDNx?=
 =?utf-8?B?SHFKbTcwWFNta29BNFk3UTZ4U0JKd3JTSjg2YWN5NnFGNnNBeUVPSzR1cERB?=
 =?utf-8?B?SG0ycVJaeXNxSkNxUGxLamM3OE13NTYzZlFuVi83VVllNDVhdFV3S05LZzZF?=
 =?utf-8?B?TitxaDlTTmtNWVExRDBRczRtVytxZUttY0xHYmRod1M3WlZJWlJjN2RiTmxj?=
 =?utf-8?B?VkVOaWwwQk9SamxNYU1DOU8vb3dEbm5BUm9seEN0MERWbFEyQUc3U2x4NEVN?=
 =?utf-8?B?OE1GRnRiRDJaS2tlQUZ1MEQ5d3V6dDY5SnZ6eFBMVzg1d3lKUEFuR09hU2ho?=
 =?utf-8?B?ZHp4V0hpZnNrSTM2azkvRElpWElhTXZJS0RKQ1lpLzhsRk5pTE1udk9rQ1FJ?=
 =?utf-8?B?YnJIVkJ2UHd1TnRlUzlRMHl2Nk1teWMyRnE5MGlOcTdqYlRQK1dkSjhhTEEw?=
 =?utf-8?B?YVRpVkx0N0tsbHZJS2lrQnN0STFTS245TzdrTWVkL1UwR0VkbkNNY3NuNEts?=
 =?utf-8?B?eThtQjFjSzlWTmIvMmNsejg5Si9pVGR0OEdCR0RScXFkUndnem95bUUrUk5X?=
 =?utf-8?B?M2RpMW9UN29IYk5Mdmk0OHU2QzFyaFVoMFhIeGJtdmN6bXpqa2UrVklvc0RU?=
 =?utf-8?B?NnVMZjRGd3FKTEl4MEJyenViYXQzZFZCdkhmekoySVNENFFHaEw2N01odDh6?=
 =?utf-8?B?cGVGUEhjUVBkeSs2cE05blRyaE1SdjhCdzBGU1Vkek9YS3JybTBMYW0yM09Z?=
 =?utf-8?B?ZkdwdlBLT2psd3A1SDRidzZVTGp4dnlNZG9xaGhCZFFiUTVsT1oyRWJ4Sjlz?=
 =?utf-8?B?Z1RvWXhQZkRrMFVVVWhVbWs3K2t5SFlBamxSUUloZGRrd0FIS1U4NGg1MUY4?=
 =?utf-8?B?TDY2S3VLTWVtUlFZVFNadGppS1lPRzdIOXBCWXdPUXpablFwb0JxRURWWENH?=
 =?utf-8?B?Uy80QkF4MEZkUkMzK3ZSMjZGL05jbnlISzZTRjY3WUorTUdkZFlXTm9nZXFl?=
 =?utf-8?B?c092QkpLaE9KRDh4b3Zhai9FSDJwMFhFa01FdXhtOExMRVloRTl5VVBmQnZM?=
 =?utf-8?B?SHNUWGJwdlhTeElra0F6aVMweHdyZSt6OUtGM01nK01TYVEzbHVFOVRydkk0?=
 =?utf-8?B?MHJVQnZ4QnY5UGFZQ0VXWlF6MW14cU52MEtTYisrVDcxQ1RENnd3c1hDamlS?=
 =?utf-8?Q?IwHEgHWwBxX8/0pQlvvlM3MApH2yKZjtDfjhn9+?=
Content-ID: <F32B7BEFD9986E4FAAACFC5A922C48ED@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5150.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8527236-b9ce-42e8-eb94-08d8ee352769
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 19:52:13.3172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sLZgTc+1Nvwa0LGTlp960hkUexriy9yLo4l4CoNQ//+AT0ImgXoXGYjSCnE1Q/73RKdEofB9vBC7AhkHRybwGLiU8w7cDqZcO5a2D/U6NN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4957
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
Cc: "jgg@nvidia.com" <jgg@nvidia.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIxLTAzLTIxIGF0IDE5OjQ1ICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50
ZWwpIHdyb3RlOg0KPiBUVE0gc2V0cyB1cCBodWdlIHBhZ2UtdGFibGUtZW50cmllcyBib3RoIHRv
IHN5c3RlbS0gYW5kIGRldmljZQ0KPiBtZW1vcnksDQo+IGFuZCB3ZSBkb24ndCB3YW50IGd1cCB0
byBhc3N1bWUgdGhlcmUgYXJlIGFsd2F5cyB2YWxpZCBiYWNraW5nIHN0cnVjdA0KPiBwYWdlcyBm
b3IgdGhlc2UuIEZvciBQVEVzIHRoaXMgaXMgaGFuZGxlZCBieSBzZXR0aW5nIHRoZSBwdGVfc3Bl
Y2lhbA0KPiBiaXQsDQo+IGJ1dCBmb3IgdGhlIGh1Z2UgUFVEcyBhbmQgUE1Ecywgd2UgaGF2ZSBu
ZWl0aGVyIHBtZF9zcGVjaWFsIG5vcg0KPiBwdWRfc3BlY2lhbC4gTm9ybWFsbHksIGh1Z2UgVFRN
IGVudHJpZXMgYXJlIGlkZW50aWZpZWQgYnkgbG9va2luZyBhdA0KPiB2bWFfaXNfc3BlY2lhbF9o
dWdlKCksIGJ1dCBmYXN0IGd1cCBjYW4ndCBkbyB0aGF0LCBzbyBhcyBhbg0KPiBhbHRlcm5hdGl2
ZQ0KPiBkZWZpbmUgX2Rldm1hcCBlbnRyaWVzIGZvciB3aGljaCB0aGVyZSBhcmUgbm8gYmFja2lu
ZyBkZXZfcGFnZW1hcCBhcw0KPiBzcGVjaWFsLCB1cGRhdGUgZG9jdW1lbnRhdGlvbiBhbmQgbWFr
ZSBodWdlIFRUTSBlbnRyaWVzIF9kZXZtYXAsDQo+IGFmdGVyDQo+IHZlcmlmeWluZyB0aGF0IHRo
ZXJlIGlzIG5vIGJhY2tpbmcgZGV2X3BhZ2VtYXAuDQoNClBsZWFzZSBkbyBub3QgYWJ1c2UgcHtt
LHV9ZF9kZXZtYXAgbGlrZSB0aGlzLiBJJ20gaW4gdGhlIHByb2Nlc3Mgb2YNCnJlbW92aW5nIGdl
dF9kZXZwYWdlbWFwKCkgZnJvbSB0aGUgZ3VwLWZhc3QgcGF0aCBbMV0uIEluc3RlYWQgdGhlcmUN
CnNob3VsZCBiZSBzcGFjZSBmb3IgcHttLHV9ZF9zcGVjaWFsIGluIHRoZSBwYWdlIHRhYmxlIGVu
dHJpZXMgKGF0IGxlYXN0DQpmb3IgeDg2LTY0KS4gU28gdGhlIGZpeCBpcyB0byByZW1vdmUgdGhh
dCBvbGQgYXNzdW1wdGlvbiB0aGF0IGh1Z2UNCnBhZ2VzIGNhbiBuZXZlciBiZSBzcGVjaWFsLg0K
DQpbMV06IA0KaHR0cDovL2xvcmUua2VybmVsLm9yZy9yLzE2MTYwNDA1MDg2Ni4xNDYzNzQyLjc3
NTk1MjE1MTAzODM1NTEwNTUuc3RnaXRAZHdpbGxpYTItZGVzazMuYW1yLmNvcnAuaW50ZWwuY29t
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
