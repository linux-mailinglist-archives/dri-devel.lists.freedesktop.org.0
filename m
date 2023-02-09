Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835469144B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 00:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C9C10EC00;
	Thu,  9 Feb 2023 23:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662A710EBF6;
 Thu,  9 Feb 2023 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675985027; x=1707521027;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DEj9gVlyzMxecaDvYZ3sXBAcEnyXQE/hLHs9AWXavEw=;
 b=dta+ZDC7ULrKjrlD3Zcco5l8NAdaHh0JEGHpTtltQlEhLyTjQ2TWUULl
 PaEcbfNP/4KUNC6TZcxWS1hw7YGKZap+WOZvZLV8e1F3j0rOwMx0u/Y8t
 Kj8rLaDtFdGW5QxF8sn56OdDIc4h+NCCyIoY96qfYlm4UUhphuYeCB3Z9
 mKtscsMGClf0yNtW0+ZUx6XIqFRX9bZPkvqC7mFxgWS7pw9X+9voA8uHd
 pkoLYw/375osjnwngdWjIr7c6Rayj8rqhy/JBwwZf0GxNqVNLALEDMrNI
 ImIbtimHzSRxr+wvxWLpA+bKDoGsifuFhs3BQqd/6xDS8RsIU3kQ/l4nT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="332415284"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; d="scan'208";a="332415284"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 15:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="996741476"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; d="scan'208";a="996741476"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 09 Feb 2023 15:23:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 15:23:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 15:23:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 9 Feb 2023 15:23:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 9 Feb 2023 15:23:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzGBoEYty5I9Uds5lJHEVPAHN6G4pPN7iAt6faDJCJJDhthV0zocpgPpv9IDnyFn4Mt/rzP7e1u6AGidb8DBRcFQdtFurQUshqNnb2Jpwf0NNC5Gd9xevYg3grrmOQ7k7qHnwrqdSMCIScquAqVvdwa2cVw8o+NmxyK+hqxmYP5qd8+bIWCTbHzvusYztK4e9DORedR6//KeuwBZmthfBFB89VPwI4oyX4pHELkZDKTT3CDL9wy0H01OjqQ4CpO3W7B4SS72/DRvuEDSxMeeXfGECK+2luTyt9/ZyPWMX8YgopHRq9f4XQAjBcLJ/gNwJTW15BpxfVilU6JV5q0fug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEj9gVlyzMxecaDvYZ3sXBAcEnyXQE/hLHs9AWXavEw=;
 b=GAwnrhnilDCUyFomBDAE0YjEWT1F5kS43KJc2NlfsMVs0gQXi3enKKnvRCymwvhrk096sH/k0xp169xCE3LporuS4KaeYIdwXmGERTeTpHvEWxFNPeqMZDKKhPiJjGHRaYFTNhvsD4t0xD1XdQNjCd46W6JxRIU7Xz5/silxtvd5+G58+d7RkjJnUA52oQNz2Lwb3yrb4RQRG6EP3nkVAcnOFsjskqqSh2vj5Hmvya6izAhqo+e+HYFaQ3KHfqweOwOEEOjDmHgi+kl6ZV3yfD8S74dmXU3f77W0gvJuOH5PXiXeLtA8F/59cJpXvX15qGOXm3uHYPHRAIWmnzVaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17; Thu, 9 Feb 2023 23:23:38 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 23:23:38 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Thread-Topic: [PATCH v3 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Thread-Index: AQHZMJR0Dt36zaiQcEWPO6o2sNVnqa7HWeaA
Date: Thu, 9 Feb 2023 23:23:38 +0000
Message-ID: <6850f599a093c651afe1869f986fe4c13cad83af.camel@intel.com>
References: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
 <20230125080651.100223-5-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230125080651.100223-5-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS7PR11MB6248:EE_
x-ms-office365-filtering-correlation-id: 53caf4bc-0cef-483c-1284-08db0af4ac7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BD50TAXCznqkxrKonJwUkn6qKYI4KFMYC5c1eWcpiV600W6Z0Y4TPvdEUjjqIwsI4Mnw03mxSAjCIjaFe/V5sF1IKBkqw0xgly+1Hu5qx0JhEpgDp2UfsQBxV75u97s7KmuZMTyLsAkbdsQscfQaoNZMSa/INEBsZ7QDlBmekwTbKcS+RQgjKtUDtnaNWJBW6hn9UrdELtQBtkOpdEjEhpjQO2wyQOGwgdnJJWDZCDmql3oouJ7+Yth0m69VWcVYDFUc0YLJQcdLqEzmXUEMJGMJGSGilEyymhTG9zO2HGbIMNk+19Y9RhQrG3p/HAjzpNWKnTGKBiZl8cKA8Cx+//uL70DDBUWh3yR2ymEXfltiy764+cHajNkDLlTpZdb5kASNQlMZ/YqWWj0m1ChaKVPQ5dFAlhiAxf6zS8W7t2BDDzKs6Wowx5Xj4ldGc+iBYuTglCbsFsMv0HkryX+RQNnB0zJOd25TRkj/s3vctIkpnWLACihXSx9Pr12vcyiD5TJ6K+dnDbVdRFD/ytJMEZvqb23WxE3QjRCyoRbqev9+y3ZXnFhuk79Myf0/qNK1Lhm+LZi5mAKZObblHrrf696hbQe+PHNYtDP4BHJaDK6SMTYpgGnYNStKEDEGK/oZlzsEfX8P/40if9Qs527TiImUmNKZ46HRVoYwQOvov8pMPF8385fH7Hx32pLL8tWx0y0hQM0n6n1O8217z9ysmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199018)(122000001)(38100700002)(83380400001)(82960400001)(38070700005)(2906002)(86362001)(36756003)(15650500001)(41300700001)(5660300002)(8936002)(76116006)(107886003)(4326008)(316002)(186003)(26005)(66556008)(6506007)(64756008)(2616005)(8676002)(6916009)(54906003)(66946007)(66446008)(91956017)(6486002)(478600001)(66476007)(6512007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0VrT0lQSVA3aVh1Q21rSDhWRGRGT1ZJditTN3lzeCswMTh4bnVlVzM1R0tP?=
 =?utf-8?B?MG5UYUI1ays0dlZOVC9ZZGsvd2ZzZDJWMVpTMlUrWUVhNm9tYUk5Vk5TQVdR?=
 =?utf-8?B?STJTWHJDSDBld050cDRyYzRMMFc2dXhxSEJpelA1dlFtck1PRzZCU292OVo2?=
 =?utf-8?B?SnJGZWZhVVVxazlaWUhlN2lFWEh4bnFjSzVTTjhiRkIvNm5vK2Q0UWZ3Um5q?=
 =?utf-8?B?TzF3dVVSb2RURUh6ZXhMZk1JWWlkV05tOTEyL3I1clM3S2ZMSGdndnpHaXR0?=
 =?utf-8?B?SytkOXFFVU9mVlR5WFFpN0lxb2t2dVdNNklkMmZ4QVdqK2NuSHRmR1ZpVVhh?=
 =?utf-8?B?YmtMdUhhemtFSjVNc3NkWWRwNHVhMHNuU20rUXhlR1Vnd2J0ZGNiMThBL0sw?=
 =?utf-8?B?TVk2RjBseEJudG9Ia01uWklUY21NNy83US9uL3VVWHJ2LzM5TTdqMzg3TlBN?=
 =?utf-8?B?S2NUUTZXQ3N4WExtSDdzT1dlRjVwc0dmM0xxckVqS1hBK0p0OFBFTWhpOWVN?=
 =?utf-8?B?V29mTUlVdHB0SWhyZ08xUmFUWm1rd1BxVnQvd3E3Yyt2ZHlZd014cGlpZTFQ?=
 =?utf-8?B?bTMzUHAzTWp1YnNSK0ZWSkJGQ3JTSy9leGtDNkpNa01yOXVpZk9jNGNuWml0?=
 =?utf-8?B?UUkwTytNSWM2MklMdUtJQTBnNU1nQmFLT2dzaG0zTDV1WWpYeGNEZm1FNTBH?=
 =?utf-8?B?NUVCSjc2UjR2R0F0M2daZHlRQ1NVOXNWYW5aclZUcDN3T2UyRi91K1h3eHpC?=
 =?utf-8?B?U0Zjc2ZwWGFBRVNTWk14N3FtM0tjUVErd2pPc2hJaWpRM2pURWpiQXRudHNt?=
 =?utf-8?B?NW0vNVhGODhFVldudk96eGZWNGIrN21pT2E4dTcxVUF2SXZWM3VZeGZ0bTl1?=
 =?utf-8?B?dVZLSEEzSFV0T3VJd0prVzVWT3hIZHFoZFB4akNwRC9hQUJXeWxsbXN2TU9K?=
 =?utf-8?B?bnFRdXlmS2M0dG9KSWIyaUJjSXNROC81R3NUY2JOK2tjRGVMNkdyRHh0RUhD?=
 =?utf-8?B?Z0x6V1JNV2EzTERic3BreEIzSUdKMHhrRVU5R2huUDBOODRFam1VckRjRCta?=
 =?utf-8?B?Q2FpdkMybldmeWRQaVJvamQ0TlNyczVnMkR5SlQvTGJ2M09jSFQ3aU5iQzNC?=
 =?utf-8?B?d0o0eUR1dWFTWXFvMWIza21IcFNmRTM3OVc5enE1VS9FcHdMUXE2Rk1KVSt1?=
 =?utf-8?B?bVBNRjZ3NThBNEp5R1RkNEs5ZVZ6SzJFUFVweGY0QkczVGwwVGVHQkF0d3Jq?=
 =?utf-8?B?S1ByQTdyQ0UwK1ZraEYwdkVQT1I0ZTBOM09KR0lEdk4rUVQxSjExT2FBSjk0?=
 =?utf-8?B?Vk5oSVIyci95TXZDV3hEVVlIa1R3aDN5R0hLclVPTExKL2F2RFZJV3RMRGt2?=
 =?utf-8?B?eHEzd2lOaFMrVkc5UzhOekJzWGVQVVJFTXUydVFtbytWK0ZlUk1KV3p0clRU?=
 =?utf-8?B?WThNWWZtZ2lsUDZsUUJWdzlsYXM1ZUZqYmpKNXpoOC96bk5Oc2VvUXJtNnFC?=
 =?utf-8?B?dEhoOExMbnlmNWl5QzVQYUppZDlBZTFoR1pHaWlzQ3NhNG9Rc2pjSlFjcEZm?=
 =?utf-8?B?dzBMUnVReGNUcmZaTXFSaDMrV3h0Q1FOMURJSDFBclg2bUw2c2h0RFZPa1d2?=
 =?utf-8?B?c0RKOG1rU3VGdnhmNDBmdkM2cUo5NmFmSm1ZUWpJczdWYURNVHZzSkIvcnd6?=
 =?utf-8?B?YWpkTmJLazJKckNXaTNhSGh1NmVlRDZCeW95d2NOc3BLNkFrcERrQkFURWNT?=
 =?utf-8?B?RExoa25wQXlVTkM4U1VNWEMwSXBCM21IcUN6VjhkTFhRUWpuWmNWOHovVi8v?=
 =?utf-8?B?c1NkdkFJbEdJeTNIaXlNRmZwYVUxRnNaUDJuUmNJNXBnNEJLN1pZLzgra0NW?=
 =?utf-8?B?VVJSbmREbDJSRHQ3bHMvZmJHUnBZVWxMYWxzT2g1UG5RUFlaTSs4UEVLVjJN?=
 =?utf-8?B?TGJRcnQ3RVUxT3hMQUVPbVk1RkVUVnBuNlpLWWxIdTU3a0hobWtyVkVKa3ZM?=
 =?utf-8?B?UkF0c3JsbzFZT2I4Mi9FWW5ESENOL3NzZ1lDSHNEUW1HWFpLSnZqWWIwbUJL?=
 =?utf-8?B?WGNDdE1rMEZMMDZUM1Y5clRkVE0zMVBMdGJiTWh6S1BtVmdXKy9hMTdRNnVV?=
 =?utf-8?B?b0ZpSWphaDZVUTdUdmZGQTBzR1dDaVA1clVaN2wxTGJqeGtMcHN2NjdjNmZV?=
 =?utf-8?Q?1yXTdr8ru0IQdBu4fg+eNMNjiIkohuWUxa41bDK9e7eJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B949DE7B8B2602469A2D34E1821098F3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53caf4bc-0cef-483c-1284-08db0af4ac7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 23:23:38.4739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOBZGeRJPVociCnyVzCbjm8d7Cz9cIaxcUidBnGGCLadfs+/OEClCCbQ0VDuCzD1w2U3UBqaw9n6jNhlqgsXcuNfYbWsS5jkukJYt1jEsYMlgvnuNbv9UkceuLB1itAp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bWlzc2VkIHNvbWV0aGluZ3Mgb24gaG9zdC1zZXNzaW9uLWhhbmRsZSAtIGZvciBuZXh0IHJldi4N
Cg0KT24gV2VkLCAyMDIzLTAxLTI1IGF0IDAwOjA2IC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4g
UHJldmluIHdyb3RlOg0KPiBBZGQgR1NDIGVuZ2luZSBiYXNlZCBtZXRob2QgZm9yIHNlbmRpbmcg
UFhQIGZpcm13YXJlIHBhY2tldHMNCj4gdG8gdGhlIEdTQyBmaXJtd2FyZSBmb3IgTVRMIChhbmQg
ZnV0dXJlKSBwcm9kdWN0cy4NCj4gDQo+IFVzZSB0aGUgbmV3bHkgYWRkZWQgaGVscGVycyB0byBw
b3B1bGF0ZSB0aGUgR1NDLUNTIG1lbW9yeQ0KPiBoZWFkZXIgYW5kIHNlbmQgdGhlIG1lc3NhZ2Ug
cGFja2V0IHRvIHRoZSBGVyBieSBkaXNwYXRjaGluZw0KPiB0aGUgR1NDX0hFQ0lfQ01EX1BLVCBp
bnN0cnVjdGlvbiBvbiB0aGUgR1NDIGVuZ2luZS4NCj4gDQo+IFdlIHVzZSBub24tcHJpdmVsZWdl
ZCBiYXRjaGVzIGZvciBzdWJtaXNzaW9uIHRvIEdTQyBlbmdpbmUNCj4gYW5kIHJlcXVpcmUgdHdv
IGJ1ZmZlcnMgZm9yIHRoZSByZXF1ZXN0Og0KPiAgICAgIC0gYSBidWZmZXIgZm9yIHRoZSBIRUNJ
IHBhY2tldCB0aGF0IGNvbnRhaW5zIFBYUCBGVyBjb21tYW5kcw0KPiAgICAgIC0gYSBiYXRjaC1i
dWZmZXIgdGhhdCBjb250YWlucyB0aGUgZW5naW5lIGluc3RydWN0aW9uIGZvcg0KPiAgICAgICAg
c2VuZGluZyB0aGUgSEVDSSBwYWNrZXQgdG8gdGhlIEdTQyBmaXJtd2FyZS4NCj4gDQo+IFRodXMs
IGFkZCB0aGUgYWxsb2NhdGlvbiBhbmQgZnJlZWluZyBvZiB0aGVzZSBidWZmZXJzIGluIGdzY2Nz
DQo+IGluaXQgYW5kIGZpbmkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxh
bi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCj4gLS0tDQo+ICAuLi4vZHJtL2k5MTUv
cHhwL2ludGVsX3B4cF9jbWRfaW50ZXJmYWNlXzQzLmggfCAgIDQgKw0KPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9nc2Njcy5jICAgIHwgMTc0ICsrKysrKysrKysrKysrKysr
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90eXBlcy5oICAgIHwgICA2
ICsNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTgzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2Nt
ZF9pbnRlcmZhY2VfNDMuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfY21k
X2ludGVyZmFjZV80My5oDQo+IGluZGV4IGFkNjdlM2Y0OWMyMC4uYjI1MjNkNjkxOGM3IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2NtZF9pbnRlcmZh
Y2VfNDMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2NtZF9p
bnRlcmZhY2VfNDMuaA0KPiBAQCAtMTIsNiArMTIsMTAgQEANCj4gIC8qIFBYUC1DbWQtT3AgZGVm
aW5pdGlvbnMgKi8NCj4gICNkZWZpbmUgUFhQNDNfQ01ESURfU1RBUlRfSFVDX0FVVEggMHgwMDAw
MDAzQQ0KPiAgDQo+ICsvKiBQWFAtUGFja2V0IHNpemVzIGZvciBNVEwncyBHU0NDUy1IRUNJIGlu
c3RydWN0aW9uICovDQo+ICsjZGVmaW5lIFBYUDQzX01BWF9IRUNJX0lOX1NJWkUgKFNaXzMySykN
Cj4gKyNkZWZpbmUgUFhQNDNfTUFYX0hFQ0lfT1VUX1NJWkUgKFNaXzMySykNCj4gKw0KPiAgLyog
UFhQLUlucHV0LVBhY2tldDogSFVDLUF1dGhlbnRpY2F0aW9uICovDQo+ICBzdHJ1Y3QgcHhwNDNf
c3RhcnRfaHVjX2F1dGhfaW4gew0KPiAgCXN0cnVjdCBweHBfY21kX2hlYWRlciBoZWFkZXI7DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2dzY2NzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2dzY2NzLmMNCj4gaW5kZXggYjMw
NDg2NDkwMmM4Li4zNWI2YmZhNTVkZmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L3B4cC9pbnRlbF9weHBfZ3NjY3MuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9w
eHAvaW50ZWxfcHhwX2dzY2NzLmMNCj4gQEAgLTYsMTIgKzYsMTU0IEBADQo+ICAjaW5jbHVkZSAi
Z2VtL2k5MTVfZ2VtX2ludGVybmFsLmgiDQo+ICANCj4gICNpbmNsdWRlICJndC9pbnRlbF9jb250
ZXh0LmgiDQo+ICsjaW5jbHVkZSAiZ3QvdWMvaW50ZWxfZ3NjX3VjX2hlY2lfY21kX3N1Ym1pdC5o
Ig0KPiAgDQo+ICAjaW5jbHVkZSAiaTkxNV9kcnYuaCINCj4gICNpbmNsdWRlICJpbnRlbF9weHBf
Y21kX2ludGVyZmFjZV80My5oIg0KPiAgI2luY2x1ZGUgImludGVsX3B4cF9nc2Njcy5oIg0KPiAg
I2luY2x1ZGUgImludGVsX3B4cF90eXBlcy5oIg0KPiAgDQo+IA0KYWxhbjpzbmlwDQoNCj4gIHN0
YXRpYyB2b2lkDQo+ICBnc2Njc19kZXN0cm95X2V4ZWN1dGlvbl9yZXNvdXJjZShzdHJ1Y3QgaW50
ZWxfcHhwICpweHApDQo+ICB7DQo+IEBAIC0xOSw2ICsxNjEsMTAgQEAgZ3NjY3NfZGVzdHJveV9l
eGVjdXRpb25fcmVzb3VyY2Uoc3RydWN0IGludGVsX3B4cCAqcHhwKQ0KPiANCndlIHNob3VsZCBz
ZW5kIGEgbWVzc2FnZSB0byBmaXJtd2FyZSB0byBjbGVhbnVwIGFsbCByZXNvdXJjZXMgYXNzb2Np
YXRlZCB3aXRoIGk5MTUncyBob3N0LXNlc3Npb24taGFuZGxlIGhlcmUNCj4gIA0KPiAgCWlmIChz
dHJtX3Jlcy0+Y2UpDQo+ICAJCWludGVsX2NvbnRleHRfcHV0KHN0cm1fcmVzLT5jZSk7DQo+ICsJ
aWYgKHN0cm1fcmVzLT5iYl92bWEpDQo+ICsJCWk5MTVfdm1hX3VucGluX2FuZF9yZWxlYXNlKCZz
dHJtX3Jlcy0+YmJfdm1hLCBJOTE1X1ZNQV9SRUxFQVNFX01BUCk7DQo+ICsJaWYgKHN0cm1fcmVz
LT5wa3Rfdm1hKQ0KPiArCQlpOTE1X3ZtYV91bnBpbl9hbmRfcmVsZWFzZSgmc3RybV9yZXMtPnBr
dF92bWEsIEk5MTVfVk1BX1JFTEVBU0VfTUFQKTsNCj4gIA0KPiAgCW1lbXNldChzdHJtX3Jlcywg
MCwgc2l6ZW9mKCpzdHJtX3JlcykpOw0KPiAgfQ0KPiANCg0KYWxhbjpzbmlwDQoNCj4gIAkgKiBG
aXJzdCwgZW5zdXJlIHRoZSBHU0MgZW5naW5lIGlzIHByZXNlbnQuDQo+IEBAIC00MCwxMSArMTg3
LDI4IEBAIGdzY2NzX2FsbG9jYXRlX2V4ZWN1dGlvbl9yZXNvdXJjZShzdHJ1Y3QgaW50ZWxfcHhw
ICpweHApDQo+ICANCj4gIAltdXRleF9pbml0KCZweHAtPnRlZV9tdXRleCk7DQo+ICANCj4gKwkv
Kg0KPiArCSAqIE5vdywgYWxsb2NhdGUsIHBpbiBhbmQgbWFwIHR3byBvYmplY3RzLCBvbmUgZm9y
IHRoZSBoZWNpIG1lc3NhZ2UgcGFja2V0DQo+ICsJICogYW5kIGFub3RoZXIgZm9yIHRoZSBiYXRj
aCBidWZmZXIgd2Ugc3VibWl0IGludG8gR1NDIGVuZ2luZSAodGhhdCBpbmNsdWRlcyB0aGUgcGFj
a2V0KS4NCj4gKwkgKiBOT1RFOiBHU0MtQ1MgYmFja2VuZCBpcyBjdXJyZW50bHkgb25seSBzdXBw
b3J0ZWQgb24gTVRMLCBzbyB3ZSBhbGxvY2F0ZSBzaG1lbS4NCj4gKwkgKi8NCj4gKwllcnIgPSBn
c2Njc19jcmVhdGVfYnVmZmVyKHB4cC0+Y3RybF9ndCwgIkhlY2kgUGFja2V0IiwNCj4gKwkJCQkg
IFBYUDQzX01BWF9IRUNJX0lOX1NJWkUgKyBQWFA0M19NQVhfSEVDSV9PVVRfU0laRSwNCj4gKwkJ
CQkgICZzdHJtX3Jlcy0+cGt0X3ZtYSwgJnN0cm1fcmVzLT5wa3RfdmFkZHIpOw0KPiArCWlmIChl
cnIpDQo+ICsJCXJldHVybiBlcnI7DQo+ICsNCj4gKwllcnIgPSBnc2Njc19jcmVhdGVfYnVmZmVy
KHB4cC0+Y3RybF9ndCwgIkJhdGNoIEJ1ZmZlciIsIFBBR0VfU0laRSwNCj4gKwkJCQkgICZzdHJt
X3Jlcy0+YmJfdm1hLCAmc3RybV9yZXMtPmJiX3ZhZGRyKTsNCj4gKwlpZiAoZXJyKQ0KPiArCQln
b3RvIGZyZWVfcGt0Ow0KPiArDQo+ICAJLyogRmluYWxseSwgY3JlYXRlIGFuIGludGVsX2NvbnRl
eHQgdG8gYmUgdXNlZCBkdXJpbmcgdGhlIHN1Ym1pc3Npb24gKi8NCj4gIAljZSA9IGludGVsX2Nv
bnRleHRfY3JlYXRlKGVuZ2luZSk7DQo+ICAJaWYgKElTX0VSUihjZSkpIHsNCj4gIAkJZHJtX2Vy
cigmZ3QtPmk5MTUtPmRybSwgIkZhaWxlZCBjcmVhdGluZyBnc2NjcyBiYWNrZW5kIGN0eFxuIik7
DQo+IC0JCXJldHVybiBQVFJfRVJSKGNlKTsNCj4gKwkJZXJyID0gUFRSX0VSUihjZSk7DQo+ICsJ
CWdvdG8gZnJlZV9iYXRjaDsNCj4gIAl9DQo+ICAJaTkxNV92bV9wdXQoY2UtPnZtKTsNCj4gIAlj
ZS0+dm0gPSBpOTE1X3ZtX2dldChweHAtPmN0cmxfZ3QtPnZtKTsNCj4gQEAgLTUyLDYgKzIxNiwx
NCBAQCBnc2Njc19hbGxvY2F0ZV9leGVjdXRpb25fcmVzb3VyY2Uoc3RydWN0IGludGVsX3B4cCAq
cHhwKQ0KPiAgCXN0cm1fcmVzLT5jZSA9IGNlOw0Kd2Ugc2hvdWxkIGJlIGFsbG9jYXR0aW5nIHRo
ZSBob3N0LXNlc3Npb24taGFuZGxlIGhlcmXCoA0KKHRoZSBzYW1lIG9uZSBzaG91bGQgYmUgdXNl
ZCB0aHJvdWdob3V0IGk5MTUgbGlmZS1jeWNsZSB1bnRpbCB1bmxvYWQpDQpzbyB3ZSBjYW4gcmVt
b3ZlIHRoYXQgZnJvbSB0aGUgYXJiLXNlc3Npb24tY3JlYXRpb24gb24gbmV4dCBwYXRjaA0KDQog
YWxhbjpzbmlwDQo=
