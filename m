Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937EA6EF9EA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B092110E2FE;
	Wed, 26 Apr 2023 18:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D02510E2FE;
 Wed, 26 Apr 2023 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682533045; x=1714069045;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mgxkG8zxhRC5R4O/TLghJA9Q7/x7SzniToiahY0cXCw=;
 b=OponxRe/KeWXQlClJOXfeCgtoflWS1dF5Ss4vVGulpcwkjiVcEQGQAj6
 NgpHMzi0WCv5a9IzaUqUEHKpsvAj6hRJkdCL+qH0HvvZbdiyZKSDBoDIr
 Okiv23jDtl82MJ4YevxWoJ/8Y6F5P/SZKuK8FTwXuyi7xK9IIyr0/nO7+
 0gwh/yxdxGKSUpeeM5nsNLEAtPvALFzc2AOIwE6jp3acY0Uciz8S+PjuQ
 qHPixT4fNnKJ6GLAWTpx4Wo0uggUNLcvGWU7MJjDj30h3cpW/ljBrOqtE
 ot7vbXXFHQ53ObKGx5ITuyYDHY7xhdSnAANAMwML+KY6ptm7ODzwFgG6V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="345954202"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="345954202"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 11:17:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="694051930"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="694051930"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 26 Apr 2023 11:17:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 11:17:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 11:17:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 11:17:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 11:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSJamvFtyhkYk4jQfJXe+ZPDi7au/JUNokNGcqzMCahEN6pEl4C5D9UTrXYxLPPlSm/dGV1WsnovglsjZGoHPMOq6ZDT0aMPYTLimjB7gfZVePAYOLPUlitKORwUHrP0SYL0CaSDJ9sZQL6Ann1pHzSN6IwoZnF20NWygeB5mJiYwTOg03M5x0sTTJUQOE8DjHy+ZHlauhbdOxuxZwcNb75haiMc5Vz57Zl3sVGfz3wMb7O2KrAf68CoDvsTnq30jFwtvYNJhbc42wNmOVivekJNkWL+3NUNpQqFW4ASmj0cSdt440whpszoZAcvQ5yA/4KGJoI59eH+LOBSquQ7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgxkG8zxhRC5R4O/TLghJA9Q7/x7SzniToiahY0cXCw=;
 b=fEgrhqcPbtrikwiZHLbRghxlfPu8U4p9gRcNnefn8ThwJT6aL3BonTDYAn22hbB2fBtaC1WCb0dmLipIP4u3KlO5HX+DV6c6KAk73sVdxKMVrnrZQ4+JCSoJD+/FMEI84xT3Jd+rkS0HBaHRfj/e1R7HlmYvhhGMJvQLCCC8Sn/2JkuwDjfjni0UHH83OUA5nEyrvXoKLORGiAVZPgiXq2FFQmIG+9x4s6CNFodBC3tRdQ2sYj+vRz3KoaF5f4LRW38VEqUZsVLnkohvhjmexvaesi2Oa+dp++IA3TaYjrZaLXZCkkJMmXqscZajti0Crmioe/IGli+s5EdCyt0u2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 26 Apr
 2023 18:17:16 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 18:17:16 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v8 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for PXP
Thread-Topic: [PATCH v8 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for PXP
Thread-Index: AQHZdBLs73/R+FVB002lLr1tVAGsHq897oAA
Date: Wed, 26 Apr 2023 18:17:16 +0000
Message-ID: <82cab075a8330355b3844cad26fcf842b275afb9.camel@intel.com>
References: <20230421053410.1836241-1-alan.previn.teres.alexis@intel.com>
 <20230421053410.1836241-7-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230421053410.1836241-7-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ2PR11MB7503:EE_
x-ms-office365-filtering-correlation-id: 1a56a177-fc1f-41b5-136c-08db46827764
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5algoeBBaLrLUL4Llq9pSg2gTO633ibxy2lYpM6wb0+hBchziju/v3Dci2BvN5q9LJfaNeK3q5FC4/c+EDzzR+afh3RHRL0K9XZTgQcnNNY0iqKRoZOoPK2JfrJzDJSMIukkV2yuR5yVdj7PRs+4cj2+KIl7WOiszRCncdx7yU511PBeaUhmH05gk0IRrCtQCUsELMpRkE+m2yl/bllWjVzXnZRe0ZCbOYK298VP21v1aYXKMMdpCYe7oZlNQh7mw7rnTWGhVJBC6IgWsqYeZROSJkpEN6Mn7Rl9x832r8iPTEL+C5Kohwn0U+IusZjQw+f9jIll3tivMVnMPTe7EiedOLNn5/xCP5G/PwY6ylWXVt9VAxDD7mZfZofx+jD6A4tkfJUFxyEYeGyUjigUytrXvrw+bKDgXIV52YgxnDob5QuAWBK8HZY+tTf13Yc1xWVQIZxD5eR27zxtnHsmF9M36FGyAG5TLt1yriQ5v6rZ9T0aw3ypgkTOdXciol1OXOzgfEr9phiwdNtvkjYpSwaTpmH51GZw6AKyNIBxrwI9AbZVSHVurgLcRsrIox0u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(5660300002)(66556008)(4326008)(54906003)(478600001)(82960400001)(316002)(8936002)(41300700001)(122000001)(38100700002)(64756008)(91956017)(6916009)(66946007)(26005)(2906002)(6506007)(186003)(6512007)(2616005)(36756003)(8676002)(38070700005)(66446008)(66476007)(76116006)(6486002)(83380400001)(71200400001)(86362001)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFhCb1BqWnp3MFV5QkJML1pnSkJmL2NlRmZVZDc2LzkvYlRwMzRSZXJ0WDFJ?=
 =?utf-8?B?QmZ0STRWUUliUHc0L2crc2dBTnBobi9iVmsxQ2Z5VkVqSTAwWVhPMHF0N1Vp?=
 =?utf-8?B?UTltK2QvajdJTmxmTW5MSklmNkFPbTNENXlVMnEyTHowY1BIcUMxZnFNSWFa?=
 =?utf-8?B?R3hIdDdxcXdDdEFQSTNnNXdKOEpvOTlBVjlJTmZhalRrT1V5R1FqR0Ivb0tP?=
 =?utf-8?B?Wnh0RHB3eVloeC83WXVHVHRoYTd1Ylk4eVlvd09GSU5scWthejh3THdZazJJ?=
 =?utf-8?B?VVZ6MGllTUVKWDZ5SzU5aUxhVUtOM2IxaWluQVBkSjNMRVJKT2ZGOCtKUkVM?=
 =?utf-8?B?ZW9pQWh3a21RMjNqYVZmYzVQb1pKSE5kSE5KUS9Cd05oUFZ6SXNkMWZQRUpX?=
 =?utf-8?B?V3JJTUpBQTk4WCtKSjF6czBGaTB3emZNNEs5TS9OVTQwVk1aTTdGUG1nOE1i?=
 =?utf-8?B?dHVGQkNTM3p3L1lERDJvMTlsWTdPZ2xTQXlpNVVocit6VUVqQ3NJMG9qUGVj?=
 =?utf-8?B?RlFScnprK3NtY1hTbkN5c2JZMitvSTZKZ0hpRWZNYkpvN3F0N3l5WHlhMCtk?=
 =?utf-8?B?YjVzTVNkU3planJxMTNvQzNjZFdtdlY4bGdJdUNNeTVDTHBjNXRSeXNQaDY2?=
 =?utf-8?B?bkYxZDc3bkJqWnNoWEJIbkRLK3BlUTlqQ3oxTTFCN1FrVE1oQW5UR0RRZ3l1?=
 =?utf-8?B?R1FucWgyMy9YUFJkOUV3T1FEeXo3K2xHZXJkQ2pjTnNNTTFUOW81MEI2VW9J?=
 =?utf-8?B?OW5SNVFkOHh6WWxWMUswNHcxQlBTdmYvTTIyZC9JeWtZVGI1Qkw3U1ZqT2Yr?=
 =?utf-8?B?MDFaWkY3RCszSmswaTJWSVg4a3lYd3NkVmlXVzdmcy9aNGl4OVRrb0VLaFpH?=
 =?utf-8?B?bkRqbEo1dFBZT2t4bllkSSthR0ZnUTBlOXZ6QnJEa2x4TlhFbHVZWnhVOUg0?=
 =?utf-8?B?eVpMRXh3S2YzaUUyRElTUkNING9INmd2ZVU2R3ZWK0c5eVp5V0ZwczRmL29T?=
 =?utf-8?B?MkgvZ3RBaFV4eUdyQ1hSK0FtZjBrMUR3Q1NDTXRrKzYvYzUzT3lBdStaRFBh?=
 =?utf-8?B?d1hqZXFhV1c0Z05ycUF1RlIxYnErNmRPcW9QU1EwajRhU1lLUFB2WWtaN1dv?=
 =?utf-8?B?RWxHQ3MyRXo3dytNaUFSYllYRVRPeksyREdHZlFFZUQwQ2hrRlg5d1NvV3pC?=
 =?utf-8?B?OXEvWDhFblhjaEE1REpBdXdUdkJheTBhU3N3azdvdVgzcGUzTXBSNkYzQjAz?=
 =?utf-8?B?QVFVUzZrbkpnMkFwbFY5Rkl0UHZlbFhCNmgvMG02UTNCZGRpUHRNOFZBaHVZ?=
 =?utf-8?B?cjB2WVY3d2lnaHV4cnFVRWI4WUxXeFp1TzhiYVU2TFVpcm5jRnZCMUZObHd0?=
 =?utf-8?B?UjhLSWFNQmtZSmtmZXU1K0I0d0h5aVlHUnR4MEtNODdGNHJEVWRaV0xOdVlw?=
 =?utf-8?B?SGJJNHVKd2JNeXU5VjhjRFZjQ0xWYnFjeldDTllCcEJpS2NrdlpVVEdZZnFJ?=
 =?utf-8?B?VnJyci9aTGRsdDl2WDZHQUQ2WFc3WGhvNUVHbjFINlRkbEp3RVJYbE82dDNR?=
 =?utf-8?B?d1VnSWwyUHNkYWxDMVROVXpkWDJRckRyYk41WFU0NkVNdXJuQzVUZTNXdCtJ?=
 =?utf-8?B?aG1jb1c4bEpTQll0a0FLcDNaMllqNm1mYXZVOTd1ejlwMzlrb2c2SzNEaWxH?=
 =?utf-8?B?aHRPTzc1dFFsZWgwU0wwTUU2dWhGcXJtQXRjM292OEI1TmwvSGxVdnFjTUF2?=
 =?utf-8?B?b1VFL0JvWkZJcnp0NS93Qk5yNXlDcXNBcU0ycGZIbWZ0bEhudmZIQ0JiZHFM?=
 =?utf-8?B?K3o2SkZRNDZtYnY3aTMvclFXRHZEaDNoTEdQcWczY1BqL0hYNmtkb3I2eGl2?=
 =?utf-8?B?S1JHR3hiblZEd3pwS3VNZ2FvZ21HT0EwUnhldUU2QVJZRlVYZ05lK3JZTFlQ?=
 =?utf-8?B?NnVmUDRCQjhvdUs4Q0R0V3pWR21MWlBUN3BuNGJ5QTZKOUNBejRtQ2JuZXNZ?=
 =?utf-8?B?d1BseFMweGVkWUhVSVZ3RGgrOGhrRHpPb1RRRlVqakJZV1hKdzhRa2ZFZWNm?=
 =?utf-8?B?L1o2SGZ0bWxaNzk0ZFlwU0h5T2dUZDRLeUlRSGZ2cEhsODRhb1FpZlFYOHVh?=
 =?utf-8?B?NFRucnpObE5lUGY2aTAwVkkrU3FUL05DcCtxRURqbTJnWGticG1VeER5WXNC?=
 =?utf-8?Q?8h35WShsAGXCJ8mBMfjzbbw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1AE58AD9672B14392213EEDF66EADF5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a56a177-fc1f-41b5-136c-08db46827764
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 18:17:16.5790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XxFkWly64zA7XhTZz6AW1SqAxJSagbBpbWVMzNVch8fZPkUpIpYBwJXuR8MBEbVjideFxAQu7PoKtkjd+mKGFVlaJ+CDGot1NBEJX+DHioYHPDZE7Rrfai8Jo/KRx7qA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ceraolo Spurio, 
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTIwIGF0IDIyOjM0IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBCZWNhdXNlIG9mIHRoZSBhZGRpdGlvbmFsIGZpcm13YXJlLCBjb21wb25l
bnQtZHJpdmVyIGFuZA0KPiBpbml0aWFsaXphdGlvbiBkZXBlZGVuY2llcyByZXF1aXJlZCBvbiBN
VEwgcGxhdGZvcm0gYmVmb3JlIGENCj4gUFhQIGNvbnRleHQgY2FuIGJlIGNyZWF0ZWQsIFVNRCBj
YWxsaW5nIGZvciBQWFAgY3JlYXRpb24gYXMgYQ0KPiB3YXkgdG8gZ2V0LWNhcHMgY2FuIHRha2Ug
YSBsb25nIHRpbWUuIEFuIGFjdHVhbCByZWFsIHdvcmxkDQo+IGN1c3RvbWVyIHN0YWNrIGhhcyBz
ZWVuIHRoaXMgaGFwcGVuIGluIHRoZSA0LXRvLTggc2Vjb25kIHJhbmdlDQo+IGFmdGVyIHRoZSBr
ZXJuZWwgc3RhcnRzICh3aGljaCBzZWVzIE1FU0EncyBpbml0IGFwcGVhciBpbiB0aGUNCj4gbWlk
ZGxlIG9mIHRoaXMgcmFuZ2UgYXMgdGhlIGNvbXBvc2l0b3IgY29tZXMgdXApLiBUbyBhdm9pZA0K
PiB1bm5jZXNzYXJ5IGRlbGF5cyBleHBlcmllbmNlZCBieSB0aGUgVU1EIGZvciBnZXQtY2FwcyBw
dXJwb3NlcywNCj4gYWRkIGEgR0VUX1BBUkFNIGZvciBJOTE1X1BBUkFNX1BYUF9TVVBQT1JULg0K
PiANCj4gSG93ZXZlciwgc29tZSBmYWlsdXJlcyBjYW4gc3RpbGwgb2NjdXIgYWZ0ZXIgYWxsIHRo
ZSBkZXBlZGVuY2llcw0KPiBhcmUgbWV0IChzdWNoIGFzIGZpcm13YXJlIGluaXQgZmxvdyBmYWls
dXJlLCBiaW9zIGNvbmZpZ3VyYXRpb25zDQo+IG9yIFNPQyBmdXNpbmcgbm90IGFsbG93aW5nIFBY
UCBlbmFibGVtZW50KS4gVGhvc2Ugc2NlbmFyaW9zIHdpbGwNCj4gb25seSBiZSBrbm93biB0byB1
c2VyIHNwYWNlIHdoZW4gaXQgYXR0ZW1wdHMgY3JlYXRpbmcgYSBQWFAgY29udGV4dC4NCj4gDQo+
IFdpdGggdGhpcyBjaGFuZ2UsIGxhcmdlIGRlbGF5cyBhcmUgb25seSBtZXQgYnkgdXNlci1zcGFj
ZSBwcm9jZXNzZXMNCj4gdGhhdCBleHBsaWNpdGx5IG5lZWQgdG8gY3JlYXRlIGEgUFhQIGNvbnRl
eHQgYW5kIGJvb3QgdmVyeSBlYXJseS4NCj4gVGhlcmUgaXMgbm8gd2F5IHRvIGF2b2lkIHRoaXMg
dG9kYXkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVy
ZXMuYWxleGlzQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVy
aW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IEFja2VkLWJ5OiBMaW9uZWwg
TGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+DQo+IC0tLQ0KYWxhbjog
SGkgSm9yZGFuLCBUdnJ0a28sIERhbmllbCBWZXR0ZXIgYW5kIExpb25lbCwuLi7CoA0KaG93IHRv
IHByb2NlZWQgb24gdGhpcyBzZXJpZXMgKHdoaWNoIGhhdmUgcmVxdWlyZWQgUmIvQWNrJ3MpIGlu
IGxpZ2h0IG9mDQp0aGUgcmVjZW50IGRpc2N1c3Npb24gb24gdGhlIG90aGVyIHNlcmllcyBoZXJl
Og0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzUzMjk5NC8/c2VyaWVz
PTExNTk4MCZyZXY9OA0KaXQgc291bmRzIGxpa2U6DQotIEpvcmRhbiBzdGlsbCB3YW50cyB0aGUg
ZXh0ZW5zaW9uIHF1ZXJ5DQotIERhbmllbCByZWNhcHBlZCB0aGUgb3ZlcnZpZXcgb2YgaGlzdG9y
aWNhbCBkaXNjdXNzaW9ucyBhbmQga2VybmVsIFVBUEkgZ3VpZGVsaW5lcw0KICBhbmQgaW4gc3Vt
bWFyeSBpcyBva2F5IHdpdGggdGhlIEdFVF9QQVJBTSBvcHRpb24uIEhvd2V2ZXIgRGFuaWVsIGNp
dGVzIFBYUCB0YWtpbmcNCiAgOCBzZWNvbmRzIHRvIGNyZWF0ZSBhIGNvbnRleHQgaXMgYnJva2Vu
Lg0KLSBJIGNvcnJlY3RlZCBhYm92ZSBhc3N1bXB0aW9uIC0+IGN1cnJlbnQgdGltZW91dCBpcyAx
IHNlY29uZC4gOCBzZWNvbmRzIGlzIG5vdCB0aGUNCiAgdGltZSB0YWtlbiB0byBpbml0IHRoZSBj
b250ZXh0LCBpdHMgdGhlIG1heC1wb3NzaWJsZS10aW1lIHRvIGVuc3VyZSBkZXBlbmRlbmNpZXMN
CiAgbGlrZSB0aGUgZ3NjLXByb3h5LWNvbXBvbmVudCBpcyBsb2FkZWQgc28gdGhhdCBwcm90ZWN0
ZWQgY29udGV4dCBjb3VsZCBiZSBhdHRlbXB0ZWQNCiAgc3VjY2Vzc2Z1bGx5LiBFbHNlLCBpdCB3
b3VsZCByZXR1cm4gYW4gZXJyb3IgdGhhdCBNZXNhIGNvdWxkIGludGVycHJldCBhcyBub3Qgc3Vw
cG9ydGVkLg0KDQpTaG91bGQgSToNCihhKSByZXJldiB0aGlzLCBkcm9wIHRoaXMgcGF0Y2ggIzYg
YW5kIHdvcmsgdG93YXJkcyBtZXJnaW5nIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMNCiAgICB0byBh
bGxvdyB0aGUgZ2V0LXBhcmFtIHZzIGV4dGVuc2lvbnMtcXVlcnkgdG8gY29udGludWUgaW5kZXBl
bmRlbnRseT8NCihiKSBnbyBhaGVhZCBhbmQgbWVyZ2UgdGhpcyBzZXJpZXMgYXMgaXMgd2l0aCB0
aGUgR0VUX1BBUkFNPyAoaSBuZWVkIHRvIGdldCB0aGUgTWVzYQ0KICAgIFVNRCBjaGFuZ2UgdGVz
dGVkIGFuZCBQUiByZXF1ZXN0ZWQgZmlyc3QpDQoNCmFsYW46c25pcA0K
