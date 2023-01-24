Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9637F678CAE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 01:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E5F10E5E0;
	Tue, 24 Jan 2023 00:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB6F10E5E0;
 Tue, 24 Jan 2023 00:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674519314; x=1706055314;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fVjIjPmXqqBRteUbpg87nuq50EI9FoHiBjUaMzjGbn0=;
 b=BM5S6I1O0lX3gOobV5FHutBEoColpIIwJlkoPpFQN2wqgp52JQw8H1x7
 IcZHSQubDy/pMDo46WsBCtakc7cmyQkMghOkQVbpjyp6d+aUP+swQNlGG
 jH4p6GafB/nqrvIZ/iRqDs+lpcxiGl9CPZvoxpYkZGeib+GzTTEbEDnAR
 zWcmTcwXjAFHOEv4lQWdnztKF5BpgQ37gggTMbE09sPt9wSd8KWcxQk3R
 7qlr+jNOrEAoZlSVdEWwoXqkCWVZtWAChqz3eA0GyodmQ9famkwbSEQ4i
 xAQPRv4uW5ytZOwYv7ThBoUD+HW+W8cumzRENAz+BwetJOO/AHB7g4MXZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309773264"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="309773264"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 16:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907295137"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="907295137"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 23 Jan 2023 16:15:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 16:15:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 16:15:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 16:15:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 16:15:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjJPV9YYDxYBZtG/utb9xeAtLmVQnYS7Zmw8dapSrjpi1UMv6Uj98xGhjftYqvYWbaobRPA5nSzYgoqB1K7MNCK/p62BC/PB644SazAOtckFERaATvoNWUfi1FASw/UQ97iFcqxfcGegI7SMCf/AJX2rwDJGePAS1m9jceh2R97Jk3Jq9rxYLiDbi3COmFBrkmykSB8vLmWxxHXqHjln4iiDFLnVXDFt4a+82jJ+DKwnGX/785m5QbTEQ7HjNkircPtcUf7tVl0Z/5tFMQmm9AmHp6C46TDtArpB8h6+whEvTRMK3k1spTtCIgtgCsBMuxGwM7PJpu4/iwZDsmMKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVjIjPmXqqBRteUbpg87nuq50EI9FoHiBjUaMzjGbn0=;
 b=bg3fQVGifTNLVcC7r6b6u4dl7Phat17u04ZG5L/nPU4KOFS5b9aF9dH/Vr4nhIUiTt8SdwykdN2QRw9uF5Kgd4fNdIgOkOB8mbxCKjrIezh0+/LtSw5Tba0NaK2RNTHNA1h/H/XAHADy2phOU3j/uC9WwyNsrbWJAnrxRN4EixHka3n24TuafOwNSouacaCXf9PtrKKwfh+K8+aG0BIHAlMh6Oczy191TTPUOzHulfJvasL2aMx2qT5upu8TRu8pYNanGdMiVFvWz19zSZWYz+luXZa396pEkoRM/lJ5+rgdbfwFE+CoftVCts3Utdk4qEc06kpqRmEbhzxPVWryLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Tue, 24 Jan
 2023 00:15:08 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 00:15:08 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 8/9] drm/i915/pxp: On MTL, KCR enabling doesn't wait on
 tee component
Thread-Topic: [PATCH v2 8/9] drm/i915/pxp: On MTL, KCR enabling doesn't wait
 on tee component
Thread-Index: AQHZJgWhafQx2xMO80KDSdqvwjyh9q6lDFqAgAe5bIA=
Date: Tue, 24 Jan 2023 00:15:07 +0000
Message-ID: <2bf92d87abfe3a626067ae969f8f255ece1ccc03.camel@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-9-alan.previn.teres.alexis@intel.com>
 <a3e202cf-bac5-0906-b87c-1b32f9427193@intel.com>
In-Reply-To: <a3e202cf-bac5-0906-b87c-1b32f9427193@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW4PR11MB6839:EE_
x-ms-office365-filtering-correlation-id: 09d1ad5a-5436-4fb6-2f57-08dafda00ce7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wv5O6A/1hA2PAlHpRwZ7VfdRWBw+0yCPkQn6Ik+IqT2/6Cj17SflOm7EXMezhY5GIGufkvLMPCsAepHUBCBb31frttR8HdEGYUPoMOJ4Pz/z9Dn5U51DDiBOoG0zDg0NuR8zw9fxIx0tVRSAS8yMB/G+HklONXUTMlJKN/BPM76RUg2gmjnw30SsyyTw7LKRalXfTo+QJdOv1FhDQsThT1qXEemm/VtCfkXJnz0hanGDe8RfwVYxcmZUqLjUNqzE1gGNkB3ZhJArl5x5NRupXe6VyxW8QZdC1lPaml4ojYTiV+rtuC7rNZvnJL146UBztGVjexvUfTIi/GqeGqlxCyhhlpPQxWdfHlyXjpyO7VHPwJIPh7HpvCNefcua4LUD1gBijVK5fVTzUJRhNS897Ik2NAK9NPVzqUUlr9def88xA2W6P4sIDR5iXX1Kmjnts2PUQFU6b4ueaPjOgAxWQBCm5sNM4kEQhCLFBYaUJk9J6CWfH0AN7AotB2IyZjtE/aQ3bYBVXd5F6FynRDI96oJ2Ue3eHIZeerjNlhHjfMcUxy9KcOg5tzg8BtDoA60n069ZbCSaIEByejSLSjydtVDtlwHU2jNtn5S0MNdG5WTBVtPo8mkltJMdblFgIlqjWtBy2wRVfzF+auGmr/lJWpqFO+0pxRqisqjl62PYuHVdqo65qgxYipCBTH+E9GLlJm3b9KxEuhT/4Iruk5qxXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199015)(6486002)(71200400001)(478600001)(122000001)(54906003)(38100700002)(38070700005)(82960400001)(83380400001)(41300700001)(2616005)(316002)(110136005)(36756003)(6506007)(66446008)(66476007)(8936002)(91956017)(5660300002)(64756008)(4744005)(86362001)(4326008)(8676002)(6512007)(53546011)(26005)(186003)(2906002)(66946007)(66556008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXJtSWgxVG8wdURDMU5uQ01sNWtkUUZNZjFJUU1BanJBUjFjd3EzZys1WDM2?=
 =?utf-8?B?QW1zdHVpYkhhdUVrYzczb1E1UEhmaVpmL3g1aW5ndnhlN2w4TlZCN293MjZq?=
 =?utf-8?B?SzlJK1pEWitDaWw1ajlJTUtvZzlTZ1dHMjZnMnVoSWdHZWVPNVlzTUlxdnpN?=
 =?utf-8?B?N2dIaE5vemtkSE5yOVduYnlNTWtMdWRWMG5uT3FxSXBoYU5Qd0hEZ1diNkE2?=
 =?utf-8?B?U0pRblk4QzZHWUI5d1UwVjBEOTNCbWEzc2IybHp0RE04aUxKVHVaclNUY2JN?=
 =?utf-8?B?d3RHUURaSXhJTllUT01EZHU0SXVVNTEvd0VIUExsNjdvbzJINUYyTy95djc1?=
 =?utf-8?B?bVY2RjBWZDBrOEE4NFV4WTdIaElYa2k4Z2Uyc29IQnpTM1ZiRktEY25GLy9y?=
 =?utf-8?B?TUpDVG9nOVVXK0p4c0VRZC92NzExY2pPUld0Rzl5OFVEcDNIRnV4MnNCcDBN?=
 =?utf-8?B?NytnbkkwRFp0NzkwVXJreVQ3aU5HNTNtRnVRUDh1TFVIMmxIY3Rvcnl5YWpo?=
 =?utf-8?B?cHVJdVBiSDNMdngvRG4xT2h2NEJGZ1htcTRlM0xRNkp1WDhPR3pOWi92eFR0?=
 =?utf-8?B?cnhyQ0h1VFRoN043RG9DdnIwYzllZUNNam5EbTYzbHhvaWNnSWt3TzFMOUF3?=
 =?utf-8?B?akJoME9kTXR0cUZIUFl6ODd6Mndiem5CN2duaERUemFGOTlnV3MrSkkybEwv?=
 =?utf-8?B?R2pFT29lVnhpcmd1Y3prNHNyVWRVQWdqTlJ5WHJIamJlZDNmdlZTVkRNQkgx?=
 =?utf-8?B?bk5LalU0Y0hHR0todWFXdit0Wmt4d3lVeExnM2pGdXNRL084aEVKY3dvaE5W?=
 =?utf-8?B?YklnS1RrT0pPbVRNVlJySnV5S1ViVHBmVW9UUm53SEFrdUw2Yko1WXdXVDNG?=
 =?utf-8?B?RFovc3pVVjBheVhic1JVWXc5d0RUcjJBVVNLbmwvblVEZCtwaUcxY1IzdFVR?=
 =?utf-8?B?eEpocStDd3UzNFh2TXZpV29pVkR0cnpENy8vMzJmbE10Vmw4aHRxaXhuZWt2?=
 =?utf-8?B?ZTNUM3RZWjh5NUpDaStuUmJzdThHSk50eXFxc1liRHh3MEVXZXBtWjdJUmE5?=
 =?utf-8?B?VlNYSVhGQzlkSkVycmlPWDdhbVVFU1pLUTE4QjVkZ1d6WHJVbm9KbVlhRFZR?=
 =?utf-8?B?VjVCK2J1RkViQ0NtREJjZlhnTlU1WmpjWGFpVWYxZXNJSGRsZEFVUnBTOGVV?=
 =?utf-8?B?SmIwaWliOHJ3alhjRE12UGxoU04yZTVFZGppSFN0dUN6N1V5dmljTWNZbjVQ?=
 =?utf-8?B?NjNjYXRSeS9xS0cwMHJkdXN2eGxkaC9UanJ2VVloTHRRTkRIanpvU1BWMXhh?=
 =?utf-8?B?cEF4YWh2VFFpNEhiNkExOW96emZkWFFyaUl3UUpmaGJidkJWdXZrbzJOd1Y1?=
 =?utf-8?B?bGFQSk1kbXNCMk55WVp0MEoyYWw2YmRJWURCQkRTbmFvbEwwaVh6bjgrZ1I0?=
 =?utf-8?B?V2dTSVdQbEdVd3d4K0NvQk5nMlhjYmcyMmhQQm1Nakp4Y0hQOXAraHgrOC9Z?=
 =?utf-8?B?Y295ODlpcFVNTTFaTENZcUZLbkIzSzVnT0VqdVBIZmFiQ21hNWFwYkoyazRO?=
 =?utf-8?B?UHM3SlFBcys2UGRGdGd5MTdZUzBuSStpV0haU2l2TEVWblZoZUJ1UytvTk12?=
 =?utf-8?B?bVgzOFFBK3ByRGt0VlArRTZwUHEzVTE3dXNjaVMybXZPOXgyRmNPYXVyN3pP?=
 =?utf-8?B?cjYxVnQxMThVY0NxSmdUalRVdWFBMEpuaU5vOWNRYmYwdUdlbXZOendQUktM?=
 =?utf-8?B?V0dpMTY3UWtjYkYzM1FXOXhuTlVuTHZNTHhkT2g2YTRwTVpCazNReVJBbHpB?=
 =?utf-8?B?SUQvaHdXSE51U2QrOTBqSW9OZ1V0eW0zYW9jVkx6NXFENEtsVmo4bmNoYi9O?=
 =?utf-8?B?U2NxMjRuMHhJZy9GZGo5VXBKWEFJSElTM0dQN1ErdEt1MDlpK0tvckdtRVgw?=
 =?utf-8?B?L0cwYjZmWkFtd1ljbXBjREszY3NoUEdVV1FXNGFvWUw1Z3gyTTgyUzVIMlpZ?=
 =?utf-8?B?ZVdibmg0Q3Y4YVJMc2NCNnV1SmRKV2Zpeml6U0xkYUViTzE4eEljUXY3M2Er?=
 =?utf-8?B?UjFZZ2hyanpNRDZXbTRrajdtY29XZUoweUttU1lOTGpIVStNVTVDV2tmYXJD?=
 =?utf-8?B?VVhZZERLSTZPOEFjWUF0MUV2czVvWVJiRUtiQ0t3bUxuSkFCSnM5VXhsVWZX?=
 =?utf-8?Q?Op1pg/BxMuGDk3eqAjPr6+Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5218E52E91C3154B95236E2FBE596F37@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d1ad5a-5436-4fb6-2f57-08dafda00ce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2023 00:15:07.8950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 66jxeb+3x1knKMd/b3kdu7k7SsvTMOWw4Q8HCMw0UWfAUENnwpRn86CDRPTpznmcM13T1KKmZ/HgUYwgjql8hp/WMS7pRLTA2Zn8LXpERg1/tUW0/8A+H5BDoIZvjpgD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIC0gd2lsbCBnbyB3aXRoIHlvdXIgc3VnZ2VzdGlvbiAtIGRpdGNoIGFsbCB0aGUgYWJz
dHJhY3Rpb24gLyBjb25zb2xpZGF0aW9uIC4uDQphZGQgb25seSB0aGUgdHdvIGFkZGl0aW9uYWwg
Y2FsbHMgd2l0aCB0aGUgZXhwbGljaXQgcnVudGltZS10YWtlcyAtIHRoYXQgbWluaW1pemVzIHRo
ZSBjaGFuZ2VzLg0KQW5kIHdvbid0IGZvcmdldCB0byB0aGUgZml4IHRoZSAnJicgLT4gJyYmJw0K
Li4uYWxhbg0KDQpPbiBXZWQsIDIwMjMtMDEtMTggYXQgMTg6MTcgLTA4MDAsIENlcmFvbG8gU3B1
cmlvLCBEYW5pZWxlIHdyb3RlOg0KPiANCj4gDQo+IE9uIDEvMTEvMjAyMyAxOjQyIFBNLCBBbGFu
IFByZXZpbiB3cm90ZToNCj4gPiBPbiBsZWdhY3kgcGxhdGZvcm1zLCBLQ1IgSFcgZW5hYmxpbmcg
aXMgZG9uZSBhdCB0aGUgdGltZSB0aGUgbWVpDQo+ID4gY29tcG9uZW50IGludGVyZmFjZSBpcyBi
b3VuZC4gSXQncyBhbHNvIGRpc2FibGVkIGR1cmluZyB1bmJpbmQuDQo+ID4gSG93ZXZlciwgZm9y
IE1UTCBvbndhcmRzLCB3ZSBkb24ndCBkZXBlbmQgb24gdGhlIHRlZS1jb21wb25lbnQNCj4gPiBv
cGVyYXRpb24gYmVmb3JlIHdlIGNhbiBzdGFydCBzZW5kaW5nIEdTQy1DUyBmaXJtd2FyZSBtZXNz
YWdlcy4NCj4gPiANCj4gPiBUaHVzLCBpbW1lZGlhdGVseSBlbmFibGUgS0NSIEhXIG9uIFBYUCdz
IGluaXQsIGZpbmkgYW5kIHJlc3VtZS4NCmFsYW46c25pcC4uDQo=
