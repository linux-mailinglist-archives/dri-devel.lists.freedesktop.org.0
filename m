Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 857637A24A6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 19:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFAB10E658;
	Fri, 15 Sep 2023 17:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF9D10E658;
 Fri, 15 Sep 2023 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694798932; x=1726334932;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=P4H4zl9QtsmQSkISQ0/X+Ftv18kClbCBbRgKbAGxBVc=;
 b=QWqGQrbkG45pEhDaU89wLsggOtfo+MyYmLYFnZ06YCjLYMpEsp0sbZml
 agUes+x0oI4Wd9xgXnMptSPgZdyyXjkOH/eaEVyIvs1cfKWT7i33sx/C0
 3AE/9SZ7kP/FaGblySqnALrwPZ24S4Va8/A8j0zd+941jyThmWvRl/ye0
 vsa96u/QIAIckPGgr5HdJkwhWgCxHFPq6oYI30Q3Cw5smjwx59yUin1Re
 WacvTVYZbAYeqXROv8WR+PHGuGJGTeXCJ59fbdB055keEA01GukSlStuC
 rO2pwrHFEuDuGzfMmGEDNvaLsPbabMHJ0eF3zaucSWHt55O26imJUEAnB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359557494"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="359557494"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745076530"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="745076530"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 10:28:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 10:28:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 10:28:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 10:28:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D09QR+Iq8aa8BmQCmwhBqBH4fv+MsqjIkTwSGjXEzEWEWvRcwyVxNael9UisImVcQa1f/QIpVdLvlEJrxNglyW8LENhiNo3NS+3C+VrzRGShU0htD/f0Zh2vrEJp5uhG0Gcfri8U+pu1QzSV2d/LCM0101/byjdL1On/2jfmX/Y1u5Vuhb284G2zOEN3xKDKVcT8HlFTSBquFF+r1WWq5EsknDj/hCtoadpcnU4VnekCepLTN2pmOWMIidOy0KC2TEv9qTReyqNqvxNVukwr+mWllE/Zs+1QHakmDSLL+B9Afj2WbBDha0o1k+cg0RX9hsJxanFufo65Y7SwNokLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4H4zl9QtsmQSkISQ0/X+Ftv18kClbCBbRgKbAGxBVc=;
 b=LnbnmqCpdpTmkX1ubdIuapGK2cuG2Y1QcFfiWIhcJnvJGue1UJkiN53vGM2XRJx031xA9uiIHz04+6YCO/VH97P8ALrqt2kB9ZiF5mEkPqTueyoXpgqDTDMhYnxMGlQ1HLImR+Zy8je5TgC8f5Hvx51EuLyZw7YRT0dGVkghQb17TsSdrMeYjwaNgGoHcpyO0W+azsJ5TNWdnvGTCDJgw1zHIbv8jFLAtZpOzVR+/G07FgE7ni2HdshBuDWww/ARo410v9xS/BaF6YQlrhJiglFwa+UPiZE2TCJgJo11m9b/BuS9S9HXk2XLNPQSxrU1BAALXTVA7ptaOkg2sbvRyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS7PR11MB6222.namprd11.prod.outlook.com (2603:10b6:8:99::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Fri, 15 Sep 2023 17:28:47 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6792.021; Fri, 15 Sep 2023
 17:28:47 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Thread-Topic: [PATCH v5 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Thread-Index: AQHZ425s3iBiBJrFw0ufvaUcfhHV1bAcLUuA
Date: Fri, 15 Sep 2023 17:28:47 +0000
Message-ID: <1c540e0448f204f029772eeda9d5d3968058cc3a.camel@intel.com>
References: <20230909223848.427849-1-alan.previn.teres.alexis@intel.com>
 <20230909223848.427849-3-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230909223848.427849-3-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS7PR11MB6222:EE_
x-ms-office365-filtering-correlation-id: e74130e3-4986-498a-f9fa-08dbb611381e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hnPRW1ItOa93qZa8cFTTQkVNlJZhavw9/WlBbA2ah8uhJc9NOQ+GzliNpq709CKLNgnlRcTwc+zZ5iW+HITOepHrFbz5qlyZiXGCOpMnFZlKypGUekY6sn/YWMMkWiRF6l4Csqv+vUnULSlRiM0DNJ6/+cGdHt8pmLpwzlkOQ8GdWROWTcpyVOhwAcYExJztSQXuznTnID3PnkbMMbhj6XqFlXyfDv1wSwoeeGC2ElZ28eDjKs1XS09pOiMCzSpP1SzgXiO4guanHMrM0Hh6JErnoOkkJx7uH9Zmt/4aoasmWsTgHO7k/OtwjldaRqCWGJyH8IDMZ/rF6FlVCl4vGplqJP+ov/M4pTiW5uEuaaOFvX61ZLjsIq6w2jL+JE3v367UUChID4w/A0vDNYxamT/GaVKa6N/nJknQoAuQ+0C7K+g87b4rgHQQFwSTivBub3v2uqFCJ1yS36mTiiljV6EbJM7QaarEzF5VlGp23WQk7cqeUAEtdOLrkQi0aw/32YJZmlSItScJZKmX7vFJlzoEzbRCMt9aZeZXaVgb5dJ5zd+VCrZ6D8ORE9ERyoKLKiSjHM5WT0ad7lIMwt1Qvbw/rZmarOP6OpVlS0R+GRk7qovbkNdvEr+z2Oe7dM+H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199024)(1800799009)(186009)(2906002)(38070700005)(6486002)(82960400001)(71200400001)(6506007)(66446008)(478600001)(83380400001)(8936002)(6512007)(15650500001)(26005)(4744005)(66476007)(91956017)(41300700001)(66946007)(54906003)(316002)(76116006)(66556008)(64756008)(8676002)(6916009)(450100002)(4326008)(5660300002)(86362001)(36756003)(107886003)(2616005)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTJhdkhnOHBJTDZRTDN4eWFFbmtDNVVtVkU2ZCtJL21uZEluSDRhZnlSb2Fu?=
 =?utf-8?B?WG1DZTJlRW1CclRBUkxYblZIeWlkbUtJbUZLeGRhOEJKcjNQYzhvTTBxOXVR?=
 =?utf-8?B?SkZ3MnM2MDRwZEhzTTU5d21DYWs0U3cyMVI5UWdZVVh0T2w1Q3FUY1g3a2l1?=
 =?utf-8?B?UFNUMVJIK1VGdGljb1o3UDhlS3p2cy9MckJPdzFzMUFvYmVoZG1nYm9WV1d5?=
 =?utf-8?B?aDNDVHk5SGNIakRndHQvRkcwNDRnTThnVERHZ2h2a0NUdm9UUFcyZVcvNzFN?=
 =?utf-8?B?VVhNZXh6UkhJa2QxZjBxbTluaGF0bWxoV0EzN2Z1S1EzUHB1R2s1Wjg3SnZC?=
 =?utf-8?B?TUNCNEJxd2F1UGFuUmY4c3oxSDBLZzh0YitOeWFvNW1ZS09pTDdTWmIxV1Mr?=
 =?utf-8?B?elBXQVFveFkxWG41aWFDbisvOWJNaTZhYWljdzFoQjNTcEQzMjR1TktxOU5G?=
 =?utf-8?B?K2EyeEZEWGxxMmJ6TFdvUUdxd2ZMelF1blIyTUFrSXBHbkV4cmJMYnpna0l5?=
 =?utf-8?B?b2lEalhMUnp2UHNkN1hIRE5CMFplbkhTanVsd3Qvb3AzT2FpVDU3dElHc0Zm?=
 =?utf-8?B?RFVBdTlHcGtURXhpbmdOa2tSeFdWTS81aEJucGhBUjQ2SDN4dzNkQTVJMUF2?=
 =?utf-8?B?ZkVYRk44TGduemhuZUVRc0l3Y3dLcU1HcWw2UTF5Y2I1di9teFFKRHFRWk1X?=
 =?utf-8?B?bUpzTjNrVlQ0dzFzMTNra2VHQUZqQ0lXT25oclJRVWt0akxLdHR4NjFaako5?=
 =?utf-8?B?OS9nMlF1MElTajdGNW9pQVE1SjhrdWExZ2JnVTd1cXN1dlNEbmxNSWl1bHZv?=
 =?utf-8?B?MlAzWDFQbFFhbEVSQTVrVXZYTE04TFloeG9UQmlGNURQQlhkMTRvdkxIbStt?=
 =?utf-8?B?c3JGL1pIQ3hEQ0h0OVVBR2h0WTBxRWx5UnlnVE43aUVNcXA1K2JYdmEzNWsr?=
 =?utf-8?B?Yk5yR2FNM2ZwM2pRTzRDMVRWbVFsbHB5d09hR3ArdHhndmhiMysvbGZ5b3Y1?=
 =?utf-8?B?RG1xa3VqcGNjTUVZSHNpYzgxMVRLTTFwNHpHeURUTy9xWmFjRGZhUko0K21l?=
 =?utf-8?B?NUdJYnBwcnhPMmlSMWdmMUFDN2k0S0FGMDBpNUdiUTRJWWpzRG8rTWJKVjlN?=
 =?utf-8?B?VjRUOEt2bUhvaHE3M0xON3BidnpHejJIM0o4bUNrUmtkM1AxT1M4VXZIaXdP?=
 =?utf-8?B?YnF3MHFDSzdhMEdOUm1iQTdlaVFrRnVoSkkycWFvS1o3c1djQkdTS0RZUEZ0?=
 =?utf-8?B?a2x5eVNEVkc5SCtmM0xPQmFWWjlWSnh6YmhpOVZJMFR4djRMWllJZ0JwTGg3?=
 =?utf-8?B?WkViQzFhQkRWdjJnL1doT0VPRDBkYmU5cHlCc0s0STdNdkZJWmF0dHg1RHZ4?=
 =?utf-8?B?MkFXbnV0REQxOXlhcmlKTDRkdUdaZkRTbDZyRDN1SFBFWDRPbUpSd2JhS2Jk?=
 =?utf-8?B?UkpOQ1NxcDVHNTVVZnVneVBPWTVzV01rcG5TTlRvMm5XbmFPeDg0bXIrU3Y3?=
 =?utf-8?B?czltTStMaVZwKzZ6YTJVTXlKQjZXMHRhYVNlRjhkT1FyVTRPVm1wTEE2RnRS?=
 =?utf-8?B?VlZIK1k0NmdHK01namFTZjlVZERuKzJpRjdWUC90aWJuOHRjTHBoOGU0With?=
 =?utf-8?B?Sk5CUWo2TXpTa2Y2ZVpRV0RLTHJsZlZiYlFjVFk3TnRUd25hakFqb0tvWUxa?=
 =?utf-8?B?K25lejFJeXlkam5XYU56OENnYW15TFMzbEt1akphRytSMHpoczFINVM0c2pM?=
 =?utf-8?B?QVF3bGN2dTkwMThMZVZLK0hDY3pKUVdhOWhMb1FucUJXSDd0TTFuWUw5bFlO?=
 =?utf-8?B?bmtpNGNCanIzcCtBd3JqOVpFaXNFT2t6d3pnRk1aSmJvZjNQYWpsT3NQbXEr?=
 =?utf-8?B?aFBmYjUzUFJYTzhzcVBBcmQ3RUZWc1NjNmN6ZGpidGdvSGJnWmJqR2hpWFhX?=
 =?utf-8?B?Sk1tU1ljcVdTSEhhRDhLSTAyR1RTZG1DUTdnODEzVFZFYzZVOFl6UGk5cmtS?=
 =?utf-8?B?K2FEUmZURkc4bUJyTlgzYlNGWTNTaThZaVNrRHNSdHJWSVRCTnlMdSt5N0FL?=
 =?utf-8?B?ZWwvUDkxeFZINEFrVER3NU9PL1UwM0ZsakJOOXUwaitlNTIxRkNNRmdqd0Vr?=
 =?utf-8?B?L2o2NkpoUm1NbkY1YStGMkxJRThyYUV1YlVXVlVWc1gxN1hSakhOT3diMjBx?=
 =?utf-8?Q?N6l474/AwuVMfzVi4+cCsag=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83CA8FAF26A41C458386C0139F4BCCE9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74130e3-4986-498a-f9fa-08dbb611381e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 17:28:47.4906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Fnf3ziJEPj6u8YgQU03rzUaExR81pfI02E25w+NdB44glPdbyBBYM5IPqlvJWF5dwos+fl/lDW8vEZtwzl/kzawWRONZBkFZrQEIs8QZQ5pkJBh/5dxTgZjk3TeEb/q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6222
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTA5LTA5IGF0IDE1OjM4IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBVcGRhdGUgdGhlIEdTQy1mdyBpbnB1dC9vdXRwdXQgSEVDSSBwYWNrZXQg
c2l6ZSB0byBtYXRjaA0KPiB1cGRhdGVkIGludGVybmFsIGZ3IHNwZWNzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+
DQo+IA0KYWxhbjpzbmlwDQoNCj4gLS8qIFBYUC1QYWNrZXQgc2l6ZXMgZm9yIE1UTCdzIEdTQ0NT
LUhFQ0kgaW5zdHJ1Y3Rpb24gKi8NCj4gLSNkZWZpbmUgUFhQNDNfTUFYX0hFQ0lfSU5PVVRfU0la
RSAoU1pfMzJLKQ0KPiArLyogUFhQLVBhY2tldCBzaXplcyBmb3IgTVRMJ3MgR1NDQ1MtSEVDSSBp
bnN0cnVjdGlvbiBpcyBzcGVjJ2QgYXQgNjVLIGJlZm9yZSBwYWdlIGFsaWdubWVudCovDQo+ICsj
ZGVmaW5lIFBYUDQzX01BWF9IRUNJX0lOT1VUX1NJWkUgKFBBR0VfQUxJR05FRChTWl82NEsgKyBT
Wl8xSykpDQphbGFuOiBzaWxseSBjdHJsLWMvdiBidWcgb24gbXkgcGFydCAtIHNob3VsZCBiZSBQ
QUdFX0FMSUdOLCBub3QgQUxJR05FRA0KPiAgDQo+ICAvKiBQWFAtUGFja2V0IHNpemUgZm9yIE1U
TCdzIE5FV19IVUNfQVVUSCBpbnN0cnVjdGlvbiAqLw0KPiAgI2RlZmluZSBQWFA0M19IVUNfQVVU
SF9JTk9VVF9TSVpFIChTWl80SykNCg0K
