Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3765179EC
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 00:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2856010EA7B;
	Mon,  2 May 2022 22:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0DF10EA7B;
 Mon,  2 May 2022 22:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651530237; x=1683066237;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zEkvf+AXolryepwf9ZgDfjUTaf72rVFgUS7VAiloEUM=;
 b=Qa5ZWfv+46bocTqI8KxIJBxUpdBylunRThWiwIJLPxaySEb97+Y8iheZ
 SUKfm36aP3lH5JhOQ6w6YOT8qlTsWFV5E4L94Sy+E7GvhtGW3p5H8Px6F
 vm/XZJDzk97k1m/NLcoxMjuZrh5nSe+vMe2frhEIH/WZ3Ox08DePgY2JM
 u3Xls1+O415o0L23eE+FqY55Rgu99X911bbP4QxPLwfO12KQ58UQ8t8T3
 b9JSXlaCArptRO7QUVSDmqHEDVuWJmL5yFkSyCM7H+bUHKDfC+6bHSWyF
 aWeItDGyb68MFcuapbxrRopwFvxXIly53pmeiYLBgfb9JJ6azuDAu0BKA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="327886918"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="327886918"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 15:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="561949525"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 02 May 2022 15:23:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 15:23:55 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 15:23:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 2 May 2022 15:23:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 2 May 2022 15:23:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V99XuCKOT/E+Yj1TLuON9GEasOOQFKfG8+pY97QjtnhdoJ0QTystUyc91p2mX34IVXWuHRLM2qmff0t+fu6FffSoGWQRgVwk5Kfg+wD4hGvbz4/2XgjiLPEZrNnOLkoUBa8mIyoYJF0AkN5lm75fSpu4gAoZtdDIhbfaaN/EZJ5Fl3chHzOtEW9lVM+7Nn8G60PWNQ2xhbLSIj7lGKPrwD3ux/x3dpDviUVpEUyFlwkRr2m8MqF0w47dP1mI5guQ+7LbbF/Rgb9lh2l4uJj/NIkWkIUeTe395CA/ARTXCmin1rxzu7ZtCkO9K+fO43ha8dr1vA7VjI+MQC1sY/8zXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEkvf+AXolryepwf9ZgDfjUTaf72rVFgUS7VAiloEUM=;
 b=XFf/vo9Tl3berSlBG/nImRVuefzjWtfGf2UDEfv0SHsTfDcrydAofoS5V5M1VGSDNAnMKYVYmuIkUTwhItTA5VvzrcHn79Xp4cpKFSr4hVlNfcwslihnCTmgEyqtKzlRaN1LVwvTEAAOaELnVXPK6UU1B1kMX45y3g7wv6no075YNq2GQiFT7B2jfx2DiRVc6ODpOwR2WbVWm+WTVYHQJCIpDzdcWKa4rPKdT5NTuuChtOyRYTvV8zNzDc01dmG9F8ZphBX5fi6zeQKLZ+EJAKQc2QOTqYTwZ7Rqf9FkX9kOH+dCP3PyhO9zwzgFxoEsRKVONn2MS9Q3Yhlb01x9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BYAPR11MB3143.namprd11.prod.outlook.com (2603:10b6:a03:92::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Mon, 2 May 2022 22:23:54 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::bc45:8f18:bea9:46d8]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::bc45:8f18:bea9:46d8%5]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 22:23:54 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 08/11] drm/i915/pvc: Interrupt support for new copy engines
Thread-Topic: [PATCH 08/11] drm/i915/pvc: Interrupt support for new copy
 engines
Thread-Index: AQHYXkKNbm5wfSfe2U6xd8+CkkwoQq0MKGoA
Date: Mon, 2 May 2022 22:23:53 +0000
Message-ID: <a1780e0a3c44e3284db91cc42e96fdf470bf917d.camel@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-9-matthew.d.roper@intel.com>
In-Reply-To: <20220502163417.2635462-9-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c441376-7edb-4cef-96a3-08da2c8a7104
x-ms-traffictypediagnostic: BYAPR11MB3143:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR11MB31438878D6C1109027010F1696C19@BYAPR11MB3143.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QcTNVcki/LkQ6+39Hj/eGwWWoXyrJq4iv8He7sTq3fgTfQF49SGprO4G7Dx16Fa10K8PfxYabmmY7srvF36lYe4Ov6r6lrKUOx8tCyvB7S4/IiFuoqFcSNBaXzWXofWIjMQ45OT/rMb0moNuv4dUjp7Ix6r+wHSIqn/JspALcQXG0p6kGzVQ1XI8dEhwmIjgQ1KIV5BVCb1ZfCJYX3YjQpaRPvCYH4S0ijXXgGwgAW2Wo2zADGQrbpJtYt/FUdqPywiEXFsn/bB+Pr6KPUO0shu8271S1LWkHsXPlCuso+PKwmnlvGYP2IBu23qpLgqt40xdLwBAidXm/Tk3OWSDj45ZKF6FPnBT10X+QpuBX4BsRV3hK+HgW01HvlQvEvi7xFKCdlDPUwFA6icY7VP6MQM2HnA42WeR2ZU+hAfn9F5AOd38liJbCCUiByShIm0t4ioUccZ5eXVgbWSjK/cbzNwFR5tT2l2btbDlOU6/b+9fZjf8zpCQVylkAcR6SEUKXssppPcityFM3G3Lo0vWdYSKE+z4WWvBBepM60BCYiaP9lYYfKzitpIXQlXOPNJqv92KXettp5fc5uSlXyPyXHsejZq6JTBH1g//Jao2lCbhOKbe0zVRp4r8Yoe87MYeyfo8wyVIcaFwPJNANwwut02OLkwRbg+Wa50ycQZnupp/R6eDQOc8YdRBOU2//hjrU1c9qGCpMp6XNG0LFLSABQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(36756003)(110136005)(83380400001)(2616005)(71200400001)(26005)(6512007)(316002)(6506007)(38100700002)(66556008)(66476007)(66446008)(64756008)(8936002)(66946007)(76116006)(508600001)(450100002)(91956017)(38070700005)(5660300002)(2906002)(8676002)(4326008)(6486002)(82960400001)(122000001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHVXby81QktsWFBpb3ppalNBM1RjY29OV0d0TTNkNDBTamIyZkpLbzdNZGxu?=
 =?utf-8?B?OVRRWXdQZ0JydVhubFFtajdOQUFvcmdMczRkc0ttVU9jY0xERDl2WlVRcG9y?=
 =?utf-8?B?WGY2dG1ISmp5bUZaR3pYcmVVY3M2QnJST05iMDBnR1YyKytLNHVuaDFUc094?=
 =?utf-8?B?cWE5OEtwR1RNeEhZRmZrckh4Um5qekJhMDZ4MG1lYU40SGFOYjBpeWJpOThQ?=
 =?utf-8?B?ZW1WTmNKZ1pzUG5hS2d5Z1VUOHBMYzVPcEFvMmhRZ0pEK0FrTGJrUVBJTndN?=
 =?utf-8?B?SlVFZk9ESDR4b1dYeE5vMStJOERQVFBvWlRjWDE0NzM5TTlETUZTWXFDQkZx?=
 =?utf-8?B?bnVjZzZlVFhnTHEvdUFHSEFBRVhzYkppRTR4VUNtcGRjMFNka29PNHQxb2c2?=
 =?utf-8?B?RDB4ZXBObHFscnFXUUdWbFRVWW1RcnBxeVQ0OUJwWGFVc29tWEtJUjB1WUtO?=
 =?utf-8?B?ckEvQTNSQzIwRnVsLzY0UVhoQ2U3K0VkRWlpTlhrdnlwNDlsYUJaR2t2aXd5?=
 =?utf-8?B?NlovZUVuTjVNRGhqMVlHc2lQd2xFdmszWGdFcFJVb0xhOUx2S1dVWGxrb0lT?=
 =?utf-8?B?WTB4QndrNzA0NkNyZXdHVWVJODFFKzlFeW5mRy9zd05OUWlrc2QvYTlCMVRU?=
 =?utf-8?B?TzV5aFlkNDNFRzdpUThjbllQTnpuMC9DV045T1BYWmZiQnRtYkRzdkdPNTZ2?=
 =?utf-8?B?OG5kVVVGRDJ5aHZJdDJNVWhhakNIQkhac1YzbWdtS2FYd1VmeDA5TmhEcFoy?=
 =?utf-8?B?MzRiZlhsT09OZ0hvSE5CS1NCZ01vTzJ0NlkyYUVEWkFRWGN3ZWJ2R1lraEd6?=
 =?utf-8?B?SlZMTE4yeGEzSWJUc29yN0tKWGtqRUVMNjA2TVhhbTRWZ2ZwOWppU0tQQmlG?=
 =?utf-8?B?UGRhRjZhdG1PRDk5MktlZEk0Tlk5VksvK3p1Q3NjV3R3bUJaRHF4NFMyWFl3?=
 =?utf-8?B?b01GSm92Z2p4VEdxc3pZeWcyYUIwNTRVL1JjcEIyQXRrb05PUHg2VFJtdnYv?=
 =?utf-8?B?L2dIbFNMclRrYVhaZkNINTVyWEFIdTluRHlYbHQ5emRrclgvSUxFOGtMcXkv?=
 =?utf-8?B?SlNYUmZaTjdKajFTTWo3WitNTGZ5M1ZmMDNWRnIxeEMvRmJiRUpLT1dOM1VL?=
 =?utf-8?B?ZXZNL1FiWXhIRnhUZ0ZTa1l4UGs2U3oycUJ2ZHV4RFIrZnJDcjV2RWlCWUkw?=
 =?utf-8?B?by9uQ2oyWEMvZ3ZVNHN3eG1vaGNjblh4MVEyZFRvNVd4SDRpeXFLdHNobm4v?=
 =?utf-8?B?aCtxL2hIQnN0cW84NHJUNmVHaFkvamR3K2ROaU1zK0dQdEhmWkJCN1MrdUpa?=
 =?utf-8?B?UnJQZ1RPZkxtOU1hbzN2KzJKUVd2TGtLdFYraDN1cnhORStwaVJ3R0dpNzQy?=
 =?utf-8?B?bGsrK3hhcTUzenFNZ09ieXp6K0FxRmlEYUpNYUFja0tXR1ZaNng1MDBRRER5?=
 =?utf-8?B?U1J3RWM0V0M3UlFUK29KNUFmeVVkN3JhOEMvUHZtL1YrVm9sZ1plelJQcnJi?=
 =?utf-8?B?akFOMEZsOE1DZld2eVV0TDZJTmtrUkRZYTlmK1pobmhHTkpJWTduUGNNVWJY?=
 =?utf-8?B?UzdEYzE5M051bjJRUys0WEhvcUJPMUEzR2xkSkhKWkx6QnU4cmVFaTArSUwz?=
 =?utf-8?B?K3JudVg4eDFpd0lra3VncTVDSVZmVFBpYjNnUDJDd3dUMEZCL01pVW01SkVU?=
 =?utf-8?B?QVNmU1Z4dWptVFg1cUdlSXFlWmpvODduT3gxdG9BemhUSG1DN1Ezbmw3M1E4?=
 =?utf-8?B?Qkc3MlpFSWVGa3VHRHloeFZwZEQ3RGN0VmsxMWo3V0tFMXZBOEtqZGdJZ2Fn?=
 =?utf-8?B?UWt6WSt2cUV0ZGo5amF2d2xwWVV0Ryt1L0ErVVYxdUkvR3hKZmtDWTk1MDdy?=
 =?utf-8?B?aWZvenlKbGV5TWtxNEhzblg4TXg2V0lleXAwS0RiV2EwczloV2N5dGJKTk9B?=
 =?utf-8?B?ZEVTcWUwS1I1dG85aU9nUzZIb1UrbmU0RXY0QnZkVFdMaS9nMDdYU0N6bG1K?=
 =?utf-8?B?aGNKRzRBZGtVeXJUOFQ2aXBaSHErWDBMbjlQbW80c3RZbHBxVHF4Szc0bC82?=
 =?utf-8?B?bmNZb01IQkhHNVJrbWZRTjVLM3VWbk1LOGNyWUVWV2kzeEo3Y2hZM2ZyQzRz?=
 =?utf-8?B?dHdBQ2U3d0krSTV1Y01zR2p5dDJmUGN5U1Y5bEtrYVZ3cXhVeWZHVmJiaTY5?=
 =?utf-8?B?RjdqTC9GZ09HSWRSMmtFUHpRSzZXOU90RG9RMHYzeDNDTXN3MEJrdHpiMTVP?=
 =?utf-8?B?ZUlWVGJUcWp0UnF6YkluK1BmMHQrRlBGeFdNUUZrV1ZxMXZvMXBkYlhyaENh?=
 =?utf-8?B?VHoybjdNbEQ3QnM0aGJvODZPOEs2bUNJQWFDU3RoQXU5K0QrbFFaaXVFZXo4?=
 =?utf-8?Q?yZjEDNcJbXUc22D4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3904DE51555BF48BD80F40FDDA78162@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c441376-7edb-4cef-96a3-08da2c8a7104
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 22:23:53.9113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R/f5gqYg21DGLaVTFEWZbIRLBWnGIMrjjq30n2JaFbTAzn4VhVHFvA6m+y5wDvWSjjy+R3/zCR4SGR6o3yb6y7399QWxA+xzHMIbeO3EsT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3143
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTA1LTAyIGF0IDA5OjM0IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBU
aGlzIHBhdGNoIGFkZHMgdGhlIGludGVycnVwdCBoYW5kbGVyIHN1cHBvcnQgZm9yDQoNCkltcGVy
YXRpdmU6IEFkZCB0aGUgaW50ZXJydXB0IHN1cHBvcnQgZm9yLi4uDQoNCk90aGVyd2lzZToNClJl
dmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+
IG5ldyBjb3B5IGVuZ2luZXMuDQo+IA0KPiBCc3BlYzogNTQwMzANCj4gT3JpZ2luYWwtYXV0aG9y
OiBDUSBUYW5nDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfaXJx
LmMgIHwgMTYgKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50
ZWxfZ3RfcmVncy5oIHwgIDQgKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3Rf
aXJxLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9pcnEuYw0KPiBpbmRl
eCA4OGI0YmVjZmNiMTcuLjNhNzJkNGZkMDIxNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfaXJxLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfZ3RfaXJxLmMNCj4gQEAgLTE5Myw2ICsxOTMsMTQgQEAgdm9pZCBnZW4xMV9ndF9p
cnFfcmVzZXQoc3RydWN0IGludGVsX2d0ICpndCkNCj4gIAkvKiBSZXN0b3JlIG1hc2tzIGlycXMg
b24gUkNTLCBCQ1MsIFZDUyBhbmQgVkVDUyBlbmdpbmVzLiAqLw0KPiAgCWludGVsX3VuY29yZV93
cml0ZSh1bmNvcmUsIEdFTjExX1JDUzBfUlNWRF9JTlRSX01BU0ssCX4wKTsNCj4gIAlpbnRlbF91
bmNvcmVfd3JpdGUodW5jb3JlLCBHRU4xMV9CQ1NfUlNWRF9JTlRSX01BU0ssCX4wKTsNCj4gKwlp
ZiAoSEFTX0VOR0lORShndCwgQkNTMSkgfHwgSEFTX0VOR0lORShndCwgQkNTMikpDQo+ICsJCWlu
dGVsX3VuY29yZV93cml0ZSh1bmNvcmUsIFhFSFBDX0JDUzFfQkNTMl9JTlRSX01BU0ssDQo+IH4w
KTsNCj4gKwlpZiAoSEFTX0VOR0lORShndCwgQkNTMykgfHwgSEFTX0VOR0lORShndCwgQkNTNCkp
DQo+ICsJCWludGVsX3VuY29yZV93cml0ZSh1bmNvcmUsIFhFSFBDX0JDUzNfQkNTNF9JTlRSX01B
U0ssDQo+IH4wKTsNCj4gKwlpZiAoSEFTX0VOR0lORShndCwgQkNTNSkgfHwgSEFTX0VOR0lORShn
dCwgQkNTNikpDQo+ICsJCWludGVsX3VuY29yZV93cml0ZSh1bmNvcmUsIFhFSFBDX0JDUzVfQkNT
Nl9JTlRSX01BU0ssDQo+IH4wKTsNCj4gKwlpZiAoSEFTX0VOR0lORShndCwgQkNTNykgfHwgSEFT
X0VOR0lORShndCwgQkNTOCkpDQo+ICsJCWludGVsX3VuY29yZV93cml0ZSh1bmNvcmUsIFhFSFBD
X0JDUzdfQkNTOF9JTlRSX01BU0ssDQo+IH4wKTsNCj4gIAlpbnRlbF91bmNvcmVfd3JpdGUodW5j
b3JlLCBHRU4xMV9WQ1MwX1ZDUzFfSU5UUl9NQVNLLAl+MCk7DQo+ICAJaW50ZWxfdW5jb3JlX3dy
aXRlKHVuY29yZSwgR0VOMTFfVkNTMl9WQ1MzX0lOVFJfTUFTSywJfjApOw0KPiAgCWlmIChIQVNf
RU5HSU5FKGd0LCBWQ1M0KSB8fCBIQVNfRU5HSU5FKGd0LCBWQ1M1KSkNCj4gQEAgLTI0OCw2ICsy
NTYsMTQgQEAgdm9pZCBnZW4xMV9ndF9pcnFfcG9zdGluc3RhbGwoc3RydWN0IGludGVsX2d0DQo+
ICpndCkNCj4gIAkvKiBVbm1hc2sgaXJxcyBvbiBSQ1MsIEJDUywgVkNTIGFuZCBWRUNTIGVuZ2lu
ZXMuICovDQo+ICAJaW50ZWxfdW5jb3JlX3dyaXRlKHVuY29yZSwgR0VOMTFfUkNTMF9SU1ZEX0lO
VFJfTUFTSywgfnNtYXNrKTsNCj4gIAlpbnRlbF91bmNvcmVfd3JpdGUodW5jb3JlLCBHRU4xMV9C
Q1NfUlNWRF9JTlRSX01BU0ssIH5zbWFzayk7DQo+ICsJaWYgKEhBU19FTkdJTkUoZ3QsIEJDUzEp
IHx8IEhBU19FTkdJTkUoZ3QsIEJDUzIpKQ0KPiArCQlpbnRlbF91bmNvcmVfd3JpdGUodW5jb3Jl
LCBYRUhQQ19CQ1MxX0JDUzJfSU5UUl9NQVNLLA0KPiB+ZG1hc2spOw0KPiArCWlmIChIQVNfRU5H
SU5FKGd0LCBCQ1MzKSB8fCBIQVNfRU5HSU5FKGd0LCBCQ1M0KSkNCj4gKwkJaW50ZWxfdW5jb3Jl
X3dyaXRlKHVuY29yZSwgWEVIUENfQkNTM19CQ1M0X0lOVFJfTUFTSywNCj4gfmRtYXNrKTsNCj4g
KwlpZiAoSEFTX0VOR0lORShndCwgQkNTNSkgfHwgSEFTX0VOR0lORShndCwgQkNTNikpDQo+ICsJ
CWludGVsX3VuY29yZV93cml0ZSh1bmNvcmUsIFhFSFBDX0JDUzVfQkNTNl9JTlRSX01BU0ssDQo+
IH5kbWFzayk7DQo+ICsJaWYgKEhBU19FTkdJTkUoZ3QsIEJDUzcpIHx8IEhBU19FTkdJTkUoZ3Qs
IEJDUzgpKQ0KPiArCQlpbnRlbF91bmNvcmVfd3JpdGUodW5jb3JlLCBYRUhQQ19CQ1M3X0JDUzhf
SU5UUl9NQVNLLA0KPiB+ZG1hc2spOw0KPiAgCWludGVsX3VuY29yZV93cml0ZSh1bmNvcmUsIEdF
TjExX1ZDUzBfVkNTMV9JTlRSX01BU0ssIH5kbWFzayk7DQo+ICAJaW50ZWxfdW5jb3JlX3dyaXRl
KHVuY29yZSwgR0VOMTFfVkNTMl9WQ1MzX0lOVFJfTUFTSywgfmRtYXNrKTsNCj4gIAlpZiAoSEFT
X0VOR0lORShndCwgVkNTNCkgfHwgSEFTX0VOR0lORShndCwgVkNTNSkpDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdzLmgNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdzLmgNCj4gaW5kZXggYWEyYzA5NzRiMDJjLi5mZTA5
Mjg4YTMxNDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0
X3JlZ3MuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdzLmgN
Cj4gQEAgLTE1MjksNiArMTUyOSwxMCBAQA0KPiAgI2RlZmluZSBHRU4xMV9HVU5JVF9DU01FX0lO
VFJfTUFTSwkJX01NSU8oMHgxOTAwZjQpDQo+ICAjZGVmaW5lIEdFTjEyX0NDUzBfQ0NTMV9JTlRS
X01BU0sJCV9NTUlPKDB4MTkwMTAwKQ0KPiAgI2RlZmluZSBHRU4xMl9DQ1MyX0NDUzNfSU5UUl9N
QVNLCQlfTU1JTygweDE5MDEwNCkNCj4gKyNkZWZpbmUgWEVIUENfQkNTMV9CQ1MyX0lOVFJfTUFT
SwkJX01NSU8oMHgxOTAxMTApDQo+ICsjZGVmaW5lIFhFSFBDX0JDUzNfQkNTNF9JTlRSX01BU0sJ
CV9NTUlPKDB4MTkwMTE0KQ0KPiArI2RlZmluZSBYRUhQQ19CQ1M1X0JDUzZfSU5UUl9NQVNLCQlf
TU1JTygweDE5MDExOCkNCj4gKyNkZWZpbmUgWEVIUENfQkNTN19CQ1M4X0lOVFJfTUFTSwkJX01N
SU8oMHgxOTAxMWMpDQo+ICANCj4gICNkZWZpbmUgR0VOMTJfU0ZDX0RPTkUobikJCQlfTU1JTygw
eDFjYzAwMCArIChuKSAqDQo+IDB4MTAwMCkNCj4gIA0K
