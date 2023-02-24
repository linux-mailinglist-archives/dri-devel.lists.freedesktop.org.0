Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54A76A1419
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 01:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06C910E299;
	Fri, 24 Feb 2023 00:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CEA10E299;
 Fri, 24 Feb 2023 00:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677197119; x=1708733119;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jZleva32LTFBNll68HPuzigHCDOSMXbTbimULCCcCFk=;
 b=TuVDd/pfexMJkemE0rIqGL2l8Wm+ZWxFgrzu6H7TlxFsJJqDrhNmEMiQ
 a9EJhraI7nUSTZhG7c+/Is6aLkxR+t+x3kaPJZ53mx6Q5s4tbVNRcjXmw
 DBrInlt9BvL9evzeu0/oVE7PFiXjR27Eeq6Og9FtCoi08HBSC1e698Uen
 I9FBM1u88G56j38qt8xkzeXSBktXAXeOwkHXYgrM3JT1hKGlHpUcX7p+1
 I6OAXSQsJVp/F/QWze0aVWYaQRcQAozR3NRACUvOoG++4V+gbkxieZ8R3
 1S2i3iBo04Yj90Knq5xYhZIqivl1MSzT7ioNnUOMmVtZ7PLaOJIunsdY7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335589753"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="335589753"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 16:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="674723965"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="674723965"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 23 Feb 2023 16:05:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 16:05:11 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 16:05:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 16:05:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 16:05:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kv0TPvGU6ZaqfidQxrn9CV/AX1e2wuapUjhGqjblZ3+vWIez1vENq5Yt9/mQiib2Y+5afEHMl0fhJvrLpgwpy8x09gvdAK+8A1bkc5Cc8bzmQG2c5qOGiGaklO+j0LkhmSYb056q/BwnUqCuKS46R5Oxy7MFQQdzGyhhHDIQYOHgRkgPcKfj8zw/Ithg60ns2OV5OdVg/IsBIEDditFqHjz+QJP6pe85oxby0STBK7c59g7//cmeP9dQ5ewxw1rUHtcyfXZF9kU1QVKfBZOoepbgr3BOt71bhG335ZsXfCgAamDyQB8jEzvvV90i8tBHqBTgWzkTKUJLcaQTx6aOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZleva32LTFBNll68HPuzigHCDOSMXbTbimULCCcCFk=;
 b=BWs0fLXs/H0ijU7wClPygiepOMmq0ihiEl9CoxTyZ2oOiqNhE+Q7UAtmWCd5pOls0nbgdCgxrO0VsBrKuS9xBlAjbPZiTEBA3HLKo3fFZMvLvILu67xfYiRU4Lnerj2v0TjtXvWKqZ/jKzgM3OqQGqLDGEYBeg5DNuHZ+yp0zVODL3MkANl6A3xne5m1E/+gyZa5D+/Lh+rOOsw4PLuASCy7HEiO53EZ9+b4n8mkgTKuOhyjq26ZgoHmbv2yCPZccYX+epp8f06k4Oas9gQ6C2+4TA8i2xQGrr2z2Ag02wMRtNtMobqZHHiqzmg5t/42BgPoC4RNCsKO5n1pht9UdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Fri, 24 Feb 2023 00:05:09 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6134.019; Fri, 24 Feb 2023
 00:05:09 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gsc: Fix the Driver-FLR completion
Thread-Topic: [PATCH] drm/i915/gsc: Fix the Driver-FLR completion
Thread-Index: AQHZRwDbw0/xN5oKUE+UWvIDbhBX167dNNuAgAAEcYA=
Date: Fri, 24 Feb 2023 00:05:09 +0000
Message-ID: <141a1bf26c866c3f51707e834fe18098812300af.camel@intel.com>
References: <20230222210120.407780-1-alan.previn.teres.alexis@intel.com>
 <f15e26d3-fde2-acba-fb2f-2363e8c66d1c@intel.com>
In-Reply-To: <f15e26d3-fde2-acba-fb2f-2363e8c66d1c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB6214:EE_
x-ms-office365-filtering-correlation-id: c45795d8-0835-4c87-1777-08db15facb07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DyC+g2DR67gO2FC1K/SqWi3qgcvn5CEXnU6ZuTvrGAw5jtuROm7VeNjqSjt0+sHR0H/4Ju6iBfnkvE3JwNpFSZHOJPoLb3i7muIHhkNd2L8JS2grPe/ZQZSnWLW5ulgVYy3+d9Vm5B1OfpdOjf1J9TVpeyZhwcr1AMCfQ8u+zDkAL7li01M0lQ4U2LG8Kdejn7vg5HDmVB/Zzwb+LL0dwGFm/QGwjH7ON7znDssPoJWAfYIfyoDJh6B1TfzpRCKPIAe2y6RwuSsG90rCBdTlWv3bNoTeLYYtK1s7iTpN66UJiSRfK41lfhGa5tzKysVwPiTwC7CsoCqFls6KIPh/lTrhRkaMCDf2zrvYfLbASj1s4ZQINmRS7rGCRjgQFLT+/ztiyqtTPkT9ry+EaqNJSbdbmG+eZUKP1EyDJXDW0q9NBCYA5QMs31B+oYdMbw8emBtqzG8LSpKycUzsAWMHqCoSDJQE+bGaHlw2If7cE1o1O3txR10MnuudxQ8lKPBqzSCQ0A2rWU8fHxrdH0aik3Yh0deGTQyl7Tm1fWkA+FUl3NEeO1XVvxmihU0zYiDQIIbaYRb9CszrX8FiEGWZpMMYX3PbKaIQwI3kQJfus0RvYmH7TXGh5NguQMVx2lm4dHrv43+yplB2aUnj9G9eD4P7DKm9/PaobeGvY1+8ZVmSRCZvIF7dmBoNHbdx1giYyh5hgrW41Z3ZU9e4tkLqug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199018)(76116006)(122000001)(91956017)(41300700001)(38100700002)(110136005)(54906003)(66446008)(66946007)(4326008)(66476007)(66556008)(316002)(8676002)(64756008)(8936002)(82960400001)(36756003)(83380400001)(2616005)(6486002)(478600001)(5660300002)(186003)(2906002)(53546011)(71200400001)(4744005)(26005)(38070700005)(86362001)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WU4rVE1zNVFVNDBUY1B6SjdhSS93MVdXaFBsN3Nmb0hEb05BdGFFSWdwR2RW?=
 =?utf-8?B?T0lUR3hGLzJIOUpZRkJxTDkweU9Rd2dLU1NxTnAwZFBGVUI5Qlhwcko3aXVH?=
 =?utf-8?B?a1JtT1g4bzdmMUx1TTRYaDJpRmhQSnQzQ0xEN2ZCd3FncUFWdlBjZ09JU1Y5?=
 =?utf-8?B?cVFoNGlyWUJQNlVubmwyNXpEV0E0c0RxNVA0aUozMXNZRndHamRoY0pRTkx3?=
 =?utf-8?B?QjhzUTlTOHV0Vks2dW5vVjJBcTloOVJtZmgrTWpxdHFoUEJZZTZ0ZVozTTZx?=
 =?utf-8?B?Q1IxRmRMWElqcXVnby9hSFlZdk5qOWt6Rkc2OVphc2diV292OG93YkQ4SkM5?=
 =?utf-8?B?cG54S3I3Q05VRWswdk13NUxscm5Ybi8yNWtJdGdnRlVUM29IMmxZK21VK1Z4?=
 =?utf-8?B?TGpkMnVXaHNrUG53WjRBOFJIK2RrcnlJa010VXZDaFAyZE9qQkRzY2RVRysy?=
 =?utf-8?B?dUxwMTVibUJuemxlTmJxQVFwL2dvZmo1ZXBwWTNJMkNRMW5HNFUyUXBwY2pE?=
 =?utf-8?B?OTZJd2FRZVh2WlRNMEVZeER3cUd1Mm5pa3R0T3RqMTJwZGdYVFhXdXJrUGph?=
 =?utf-8?B?ZTlEbHZCamQvTVM2QXoxV21qSzA2NmRHRnFMZWZEYUNuY3ZPUTI5ZSsycjB6?=
 =?utf-8?B?UVkvbldKZzZ5eXE2YmdQNXNScFhUVTBGdjlJeUhyLy9OcElMZzJ6bUZPR2F1?=
 =?utf-8?B?WnpvWjlwYVIzRVBKeWxhc1k2ZWtHdkdXWkxVT1IwcFhuSUd6NEphS2h6WTFh?=
 =?utf-8?B?OU52RGhoL1kyeS9wT1RyWUt5WmJUakhJR2xRdDIyMjNmUVorMHVNMUc0WFQr?=
 =?utf-8?B?MzA4QlBMVXQvanpXUmoyVm9DeXQveWNuUVZHV2xaNlZMNUtoQUpFS3JDOFI3?=
 =?utf-8?B?U1pkWmV4Sk1JQVlSZFVyN0hTVlBTemxLRFBOUDdOdjNGa3Y2UTgyMGVWZjlO?=
 =?utf-8?B?TVhzOFZsbG5EK3VpWWx6R0d6QzU4a2tZMVA4Z1Vsa2Y1ako4aG9tVVVaZGc2?=
 =?utf-8?B?NDZrYk5VcGdmdVJlT1pkNXdxV3hpVWlTYVgwQzZBbGJNNGxnNDUwZkhJdG9M?=
 =?utf-8?B?ZjVBeXowa1JRN0hhTjl3cTVRbTlYTlZwVTFQMEhYRmgzOFVidmlFNllpL3N5?=
 =?utf-8?B?c2ZmSS83Y3BqZHI2c3o3UTZKcWpHenhxNHhaRWZscWVkeTBvd0QxeXJSUUpB?=
 =?utf-8?B?T3M2K3RTK1VZQ0FONzZFL1dVb1pmK0VDUUh6alVXek5ETnBjQXNsc1pVRGl5?=
 =?utf-8?B?ZWNwNDAxamxTcElJd1pzQTh6Q283QkVCcWY5NThpdXgxVnpwOGdXNnBtcCtp?=
 =?utf-8?B?Y2l3SFBOOSt4MmwzWWNxMlpWSzg2TVVXM1FnMVRtOHI3OVZFRWJ5aHFFbDlB?=
 =?utf-8?B?UzdFNU02NkkvT0trNis5UGRXN0hDMGQ5NTJZdjRMUTlUUVY5Y2xOclFSSmJu?=
 =?utf-8?B?Y0pKeTdFVWVUaXE2WElNZ3hLeENvSzQ1b3RpdzdWdTMrOHRCRHRYYnhzSWVk?=
 =?utf-8?B?M2NPYkQ2SlYwU3NCMnN1bTRUSlZKYkhsbWVLNExTUXBld0tLN2h5M0h2Qys1?=
 =?utf-8?B?MkFQWW83MmNjU0FJVUJ2dlVoUzB4VWNhUmIwa1hKczVYdmR4KzgyYjMwOFkr?=
 =?utf-8?B?Y2YwWnpZTUNNTTM3b25vVGlwYTF6YkVOek54K01HQ2ZZUmtTQVIvZGdpMk50?=
 =?utf-8?B?RUdRU0dyK0RTcFBvUXVMWVFaMGpDaWRnQW54Q29wSkNBZ0liMmNvOGg2VDVE?=
 =?utf-8?B?aGM3WmI3L29EQzJYL1FScHE3M2RwQVpOWW9aYU5ZalJSNHhoUnhHRk9GRGti?=
 =?utf-8?B?Z2hSSlhuVnVtcytvWnZCUjBSUktxQlJPU2hEcStNRlRmeEdTRmFtYldrY0dX?=
 =?utf-8?B?a1Z2cit3Mnhvbk4raHdHVFZYOUtNZ2p2a1NmaFZqZ3ltdDl2a0NOdXJZcTZi?=
 =?utf-8?B?SkxMbVdaOCtvdlZWZlNlT00vUzk1d25PbWZPVlY5VUZ6dUw1YzVhMnBzVksz?=
 =?utf-8?B?M04vU3BDd3NDSm5uMHdRWFFBZStGczBkZzFvSkd2M21KOU0rS04yeEp5Nlhx?=
 =?utf-8?B?UWQzbVFGQm9RMmZyWS8zbitXM0FjanZMMUNVczQ2QW1DUDJUcEdWZWF6RTFJ?=
 =?utf-8?B?YlFyR01UK0JWWE40NjkyeXVRUnZSRkVUeUpWRTc2Z1h2L3hueUF5THJWZmhU?=
 =?utf-8?Q?gKe8gi2E+wmKBdn7Uz6n8j0RYAQmAFa98z+xDLPoqrEm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86A399C591153C4EBC092D0FEC326F0A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45795d8-0835-4c87-1777-08db15facb07
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 00:05:09.4679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnEK0eiSyNyFTcLc395TcoH6/At3CAx9y6Iy5aysz45NdJNYst6eRTCREFau/ymlp+jJAmefUopIJLbWPLcDVfsJL3OblEMBRZd8yH024gfIGhZEqUQg/imbplZ6aJbx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIERhbmllbGUsIHlvdSBhcmUgcmlnaHQgYWJvdXQgdGhlIGZpeGVzIHRhZyAtIGkgdG90
YWxseSBmb3Jnb3QgdGhhdCBNVEwgaXMgc3RpbGwgZm9yY2UtcHJvYmUuDQpXaWxsIHJlc3BpbiB3
aXRoIHRoZSBiaXQgZGVmaW5pdGlvbiBmaXgsIHJlbW92ZSB0aGUgZml4ZXMtdGFnIGFuZCBsZWF2
ZSBvdXQgdGhlIGdldC9wdXQgcnVudGltZS1wbSBmcm9tIHJldjMgKGFzIHBlciB5b3VyIGNvbW1l
bnQgb24gcmV2MykuDQpSZXY0IGNvbWluZyByaWdodCB1cC4NCg0KLi4uYWxhbg0KDQpQLlMuIEkg
aGFkIHRoZSBzYW1lIHRob3VnaHQgcHJvY2VzcyBhYm91dCB0aGUgZHVhbC1wb2xsLXdhaXRpbmcg
dGltZW91dCAtIGJ1dCBiYXNlZCBvbiBteSBkaXNjdXNzaW9ucyB3aXRoIHRoZSBodyBmb2xrIGFu
ZCB3aGF0IGlzIHRoZSBub3ctdXBkYXRlZCBodyBzcGVjcywgd2Ugc3RhcnQgdG8gdW5kZXJzdGFu
ZA0KdGhhdCBkZXBlbmRpbmcgb24gdGhlIFNPQyBpbXBsZW1lbnRhdGlvbiBmYWJyaWMgKG91dHNp
ZGUgdGhlIEdQVSBJUCksIHdlIHdpbGwgbW9zdCBsaWtlbHkgaGF2ZSB0aGUgbG9uZ2VyIHBvbGxp
bmcgb25lIGVpdGhlciBvbmUgb2YgdGhvc2UgYml0cyBidXQgbm90IGJvdGguIEJ1dCBzaW5jZSB0
aGF0J3MNCm91dHNpZGUgdGhlIEdQVS1JUCwgaXRzIGp1c3QgbW9yZSBzY2FsYWJsZSB0byBrZWVw
IGJvdGggdGhlc2UgcG9sbHMuDQoNCg0KT24gVGh1LCAyMDIzLTAyLTIzIGF0IDE1OjQ5IC0wODAw
LCBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSB3cm90ZToNCj4gDQo+IE9uIDIvMjIvMjAyMyAxOjAx
IFBNLCBBbGFuIFByZXZpbiB3cm90ZToNCj4gPiANCmFsYW46c25pcA0KDQo=
