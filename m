Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B17233C3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 01:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D058F10E0B7;
	Mon,  5 Jun 2023 23:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE6510E09A;
 Mon,  5 Jun 2023 23:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686008813; x=1717544813;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tjIABk+HEqUvG62K4W8kmUEPPc0RjnIn0/oz8gKXViE=;
 b=WloLAawaKwYilCckurilb3dqF/3dR1EU4K+vbMNYoX40EK8g4RGG9HWL
 p6jMwYdSIf9BpErsGpI7JxVLHvArMYZMGBwg6mZ5A5t/o7BDSMcQBFTP6
 YlVi0IgCwcu3HuG8comNKoTNx3PXyxb7JgRhw76n9yXYgAhYo2I7hHtAm
 EpowPbzhk0Mb/n058gc5dhCbBbvVSceq0vTKvVAJZxH47Uz6giDkjUUa9
 ZiTfvB8LKlTsN/Q2E9bOxBUi9PuAHSi87OFoALVcn/Tl7n2QOQdVgtOGK
 xivQX2HHMpgoOOVBmVxhmLpMkIc0FPjRmvRKmbc45j8a6cBrzBGpL4gS6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336134709"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="336134709"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 16:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="1038955241"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="1038955241"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 05 Jun 2023 16:46:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 16:46:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 16:46:51 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 16:46:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt8jsv6NfkBC+U72ZiMmmaAUw83j4vhtfADEV0KO3NEhILVPTXEYM5Zz3ROYnUa2jg3ujJUdypd53iHSc5ekHu7e732MM5kRxmoSnNIK1l8ep9S5c0UF345Xg4gbDa5nJi9cn9Ma9xwMkqw0oTLpUNuujrZd27ZZaiuN+ob/Wa4D5XfVn1sPnCiyGjfq1SemJWvjehLMNgdclaWtBptaXNGu/zijiJVgkeko0axUjGZ19z2UV2XtCFWEHHJVEMGlm5q4RZsN/c8ikJ/u92qnjuMGQ3MuvFHNxuMTIRGEVVlqC1d8KQzkl1JEKGzjTDl1Hn8fRIfyOIiixSvTgFUdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjIABk+HEqUvG62K4W8kmUEPPc0RjnIn0/oz8gKXViE=;
 b=ZPyUzfwIfcm4NoJj+qbuM9hg/MAJHNSnhpPuiCpfZ9oVO7WYojVO6dcgephzIBpdq5X3A8PFpDpzMzuwXkdUspNESXL5MF6uCrhgw2zu5M4isHLdE6Lui9ViWTwj3l2GNZSn4C42/4+IY5mD3egCsEHLqD3eB4e0W6qtptQIJ3fLOybzwcZBGsuunqkSCnf8owpGUkFeE7SMEiN96JIpEJHcFEvUj4OedsXW2CafWmoQAkovYF2iQV2U449RAH/4f1nsKEblYUy0Q9+uY9pz13wxDJ0d2yygiZSONnn0BJnfeqI1zoAxTZOpi/8VfX/N9dnvFVsTrT48X+Qnj1tJKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ2PR11MB8500.namprd11.prod.outlook.com (2603:10b6:a03:574::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 23:46:49 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 23:46:49 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/i915/uc/gsc: Add a gsc_info debugfs
Thread-Topic: [PATCH 6/6] drm/i915/uc/gsc: Add a gsc_info debugfs
Thread-Index: AQHZf2tln2uj94bTo0S3qc9XZ1lTSa9tTCWAgAf0SICAB9C3gA==
Date: Mon, 5 Jun 2023 23:46:49 +0000
Message-ID: <0432681c0495b1616d811a902af7f1e9ff8d6274.camel@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-7-daniele.ceraolospurio@intel.com>
 <63637814b7d02639de39287ec92eace9f3aff46a.camel@intel.com>
 <f370372e-42b9-17af-c553-475814c25807@intel.com>
In-Reply-To: <f370372e-42b9-17af-c553-475814c25807@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ2PR11MB8500:EE_
x-ms-office365-filtering-correlation-id: 8b2ef352-f57f-43f3-eb57-08db661f219d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ljM5g2LLdxx6X/pPurwPb5uRbboVrQcEUudHsVemQtuceMo6MfTYD44DCLgmUyEXsiO+WZq+PUZKXu2rYdIkaxDWLuAVfe9yAHUAOqW8FSo4LRdbATdPfV2EB6y8ZxWxSEP2CA96e9j6MR+cBcHB0cf9EPJObXinLXsYbFdUUPGx5UZqjcgZxf7qtqiKkP2ysw4prf5FJWdoFmUBQ5OLk/7as2JFs1+bFVTpUDFOsNYalNOE9R5SLKK2GwmQLGp8LgFyPhIYofnug9Y7cqjcPwtnynqYN3heqH3KuVPKUwuqkk2QqWuAG5RXrAW/JuC9lv+CrlUF3x3C/twOtBH/BXb0GnaQLPLF+dPI45NVb+91jqzQSQR4izQ2HrRQk8XTq8mxzikY4JrtrT10dLewa4CMOg03QsfiwT708ADp/bTj52f5TcaKVOcK75mR5hJF3fxSN8Y8852UHqXOTH9NOH5nfOiNyeJYKHK7JoOk9yMlyLxeklB+cNZX9EW1S7llo411uU4thMETjuPT21GZvtlhUXKK4XIC6kw8aLI4Mx9+wUt2hxd0RvN11KsXSLuv+HKM1hBFUnWFafh2ouU7SkDXzC0EMAikqBdDS3YHL8nAZHDLTn5rD24Vu4xYRC4G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(107886003)(53546011)(6512007)(6506007)(38100700002)(2616005)(41300700001)(6486002)(186003)(26005)(83380400001)(71200400001)(478600001)(110136005)(54906003)(4326008)(66446008)(91956017)(66556008)(64756008)(66476007)(122000001)(76116006)(82960400001)(66946007)(316002)(450100002)(8676002)(5660300002)(8936002)(2906002)(38070700005)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFdFZ2lEYWl3Tk8xMUZiVVE5MjVDWllLbitHbC93TW5OVHdYVm1MZDdxdjhC?=
 =?utf-8?B?Zjh6UVMrZW0vR1lmdHVLWjVKS3FBb0pMY2c4UXJnaEdiSHgranRGamEyV0s0?=
 =?utf-8?B?NWhCVVpjRzRPQkRKVTloQnhKSitmMlNoa3hwZkM5Y3lTUkRlYXdVQ2hyRkZ3?=
 =?utf-8?B?MWQrdThBRzlMMi81SnpoR1Foa2V2aGZtSkNhQzR6alFteFBKNldxeHFJaW5q?=
 =?utf-8?B?UU55Qit3TWVMbWdKcGtiR051OC9QMnp4YnlseXg0OFF0OVJ4OVdZdWdoV2s4?=
 =?utf-8?B?czNjRmJTS2Q5NDEwQ09mTnppMmZzY2N5Q0xCTjBpbE44Ukl5YUs1TGZBcVcz?=
 =?utf-8?B?RXBaR1NHYkViN2pmNjkwcURySkJSeitSUm9PbXdDU2hSMVY3TFlLU1ZLLy9D?=
 =?utf-8?B?MXFSbit4czRiZUdFVWY0M00veFI5TDZ2dyt4L1VLa3hkK2x4YllqeUhPaUQr?=
 =?utf-8?B?VGwrdGpOM0JJOHF4ejFsTFZOOUxTR2N6YWRhSUtzZklodm45WDhQYmphaytX?=
 =?utf-8?B?SFNtcldtYndwTUNqZ2hSYlpZbXVBWXlaTkl0WUlMZEtKbUluQ3UrVS9pK0dC?=
 =?utf-8?B?TFBxMG5BQ1MwdEN3TzlYSzNkckIvYzJLdm01M05EUCtMdnlLZmkwQTQ3UENX?=
 =?utf-8?B?VmorMWd6NmppK0swRkNrY3hRSElVQzJUVUx5c2x5OW5lajBnWEpHVFR0TmJn?=
 =?utf-8?B?Y2dUcnRwbjIvRHRCTEJTZXgyT0xiaGFxUFNoZGMrUUxGTjBEbFR1Nzk1KzJV?=
 =?utf-8?B?K24yRE9wd3NyRlpJVG5PbG1BM2F2SmpyVk1OLzdDY2FHQzhEaW1SaGNJakta?=
 =?utf-8?B?ODhuVy8yanJzUC9uQlIxZVBmVkJlNFRLdnhrNWpCU1lDeDlHUkhYcHY2YWpE?=
 =?utf-8?B?a1ZtcjJTRUNQSVQzNGRzSEMwRU9hVzM3T1ExREprSy9nejNqR3dCMkJoMGQ1?=
 =?utf-8?B?aTg1czFNeDAzQmkzZ2ozZ3lnYlRmQ2pWamYwYzNNRWppdU83a0JOdHJCNCsx?=
 =?utf-8?B?dFIwK0p6bDZRRFNUanRmWWpKbUpQd3pSQ3J5TkdkRUV0UU1HTUdjUFJSc0pS?=
 =?utf-8?B?dWQ2dXA0eis5K3oxeHRuK0RKRUVQMjhSRTNobXIyTWtBWUN6UnlFbG1zckZY?=
 =?utf-8?B?RTdEN0JiSU9ZekVjOUJJem04SmtvYjB5RkJQVWVNcmVBWDZDcCtWVzVMdHdW?=
 =?utf-8?B?Q2Q2SG5tdUtzUnpwZHNGK3U4YmE5Uzc2L2Rralo0K1p4YjJhLzhBaDhyWnBB?=
 =?utf-8?B?aWwwcG9wcENlelAycWxjQS85THdwL3FadXUxWDlBUUEzbUNIR2txU1p1NlBJ?=
 =?utf-8?B?OTRBdktmNW5Fbm5DNmcvWk4vdkd6cW8yTzhYaDI3VW1rWWtkaEJLOW5acVBj?=
 =?utf-8?B?ZGJGNXAwMytPVDlQUUk4blVudUJmOE81Sjd5QWFaMFhpN1JES0c1dG40TWZv?=
 =?utf-8?B?YmlOZ3IwZHRyQzRadGRnUnNHeXRqVUo5UDBmZ1QxVUhYblcwRGVFaVZnek1n?=
 =?utf-8?B?WUJ4RnhYSFV5MFBJb0tGUVBzMUd6WkIzSnphV3NzN3JobVNLR0JybG5VbERa?=
 =?utf-8?B?VXdoa29Ec0lWcms4Z1FtcVgyYlNuRmhmbGdVUDZ0MnlzRis2ME4xQ3JNRHRT?=
 =?utf-8?B?R2h0c0FuVW5XcEJBVmc5MDVWS3MxaE41aUUzdCtUc3FlWlByc05wZFZHR3Bn?=
 =?utf-8?B?cVVVRmJINmFVUHF3ZDJNd2JNZ1JVdGlsbWxESGhHenc2aW53anlvT2pEK0hX?=
 =?utf-8?B?aFVUeUU2MnpTNlN4MjNqdnRRMGsxTUo2VXlvYjg3dUUrcHN5WjZTWGlobW9G?=
 =?utf-8?B?WnA2bVViRkROUXhKVE51bVM2REVjWDIyTWhjMm1obERUWjhPZVZ6Ym4ycXBU?=
 =?utf-8?B?REd5ajhTVDJYdUp3MzNZZDVuNlRUS0pUZHBoK3dNaU5WR0t2TjMxNUFaN2dm?=
 =?utf-8?B?SDdhRnlaR1hPYlBpQk45UnBOdmpvbTZEbVVDLytSQlgxdFFPK3NRNXB6Vlc5?=
 =?utf-8?B?YVE5ZHpKM0ErdVZYWisxUjlKa1V3dFJMc3pXNDFscVFXZzFoM290ZXVONWsz?=
 =?utf-8?B?UXI1eHc2Q1VpTUVQcFk0YWRScnFzVlg4WmovMVVsdkhUQjhWTEJCczJMUitt?=
 =?utf-8?B?UXZaRWpGT2dFNWFTSWZkTVo0OXpHaWk0dFhoSElBdUgvUjdxMGZmNWp0TXBz?=
 =?utf-8?Q?tSX4yEYDiia1elYyBB1ygz0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3716F1618890384A99BD68E5DBD38F8F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2ef352-f57f-43f3-eb57-08db661f219d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 23:46:49.6969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YI1vyWsYJM8ylABCqsbVyenvFdftqdN4Ed9JClBeC6AcMdQJBbqg5wD8hrS0g47N4RJx3aqKbkKiTwFtWxK0GoJJXdcZ385aTBjcGmTP8k2yORkBGxtsQwHYTWHGkZxr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8500
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA1LTMxIGF0IDE3OjI1IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gDQo+IE9uIDUvMjYvMjAyMyAzOjU3IFBNLCBUZXJlcyBBbGV4aXMsIEFsYW4g
UHJldmluIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAyMy0wNS0wNSBhdCAwOTowNCAtMDcwMCwgQ2Vy
YW9sbyBTcHVyaW8sIERhbmllbGUgd3JvdGU6DQo+ID4gPiBBZGQgYSBuZXcgZGVidWdmcyB0byBk
dW1wIGluZm9ybWF0aW9uIGFib3V0IHRoZSBHU0MuIFRoaXMgaW5jbHVkZXM6DQo+ID4gYWxhbjpz
bmlwDQo+ID4gQWN0dWFsbHkgZXZlcnl0aGluZyBsb29rcyBnb29kIGV4Y2VwdCBmb3IgYSBjb3Vw
bGUgb2YgcXVlc3Rpb25zICsgYXNrcyAtIGhvcGUgd2UgY2FuIGNsb3NlIG9uIHRoaXMgcGF0Y2gg
aW4gbmV4dCByZXYuDQo+ID4gDQo+ID4gPiAtIHRoZSBGVyBwYXRoIGFuZCBTVyB0cmFja2luZyBz
dGF0dXM7DQo+ID4gPiAtIHRoZSByZWxlYXNlLCBzZWN1cml0eSBhbmQgY29tcGF0aWJpbGl0eSB2
ZXJzaW9uczsNCj4gPiA+IC0gdGhlIEhFQ0kxIHN0YXR1cyByZWdpc3RlcnMuDQo+ID4gPiANCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfZncu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY19mdy5jDQo+ID4gPiBpbmRl
eCAwYjZkY2Q5ODJiMTQuLjMwMTRlOTgyYWFiMiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY19mdy5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfZncuYw0KPiA+ID4gQEAgLTEyLDM2ICsxMiwzMSBA
QA0KPiA+ID4gICAjaW5jbHVkZSAiaW50ZWxfZ3NjX2Z3LmgiDQo+ID4gPiAgICNpbmNsdWRlICJp
bnRlbF9nc2NfbWV1X2hlYWRlcnMuaCINCj4gPiA+ICAgI2luY2x1ZGUgImludGVsX2dzY191Y19o
ZWNpX2NtZF9zdWJtaXQuaCINCj4gPiA+IC0NCj4gPiA+IC0jZGVmaW5lIEdTQ19GV19TVEFUVVNf
UkVHCQkJX01NSU8oMHgxMTZDNDApDQo+ID4gPiAtI2RlZmluZSBHU0NfRldfQ1VSUkVOVF9TVEFU
RQkJCVJFR19HRU5NQVNLKDMsIDApDQo+ID4gPiAtI2RlZmluZSAgIEdTQ19GV19DVVJSRU5UX1NU
QVRFX1JFU0VUCQkwDQo+ID4gPiAtI2RlZmluZSAgIEdTQ19GV19QUk9YWV9TVEFURV9OT1JNQUwJ
CTUNCj4gPiA+IC0jZGVmaW5lIEdTQ19GV19JTklUX0NPTVBMRVRFX0JJVAkJUkVHX0JJVCg5KQ0K
PiA+ID4gKyNpbmNsdWRlICJpOTE1X3JlZy5oIg0KPiA+ID4gICANCj4gPiBhbGFuOnNuaXANCj4g
PiAgIA0KPiA+IGFsYW46IGJ0dywganVzdCB0byBiZSBjb25zaXN0ZW50IHdpdGggb3RoZXIgdG9w
LWxldmVsICJpbnRlbF9mb29faXMuLi4iIGNoZWNraW5nIGZ1bmN0aW9ucywNCj4gPiB3aHkgZG9u
J3Qgd2UgdGFrZSB0aGUgcnVudGltZSB3YWtlcmVmIGluc2lkZSB0aGUgZm9sbG93aW5nIGZ1bmN0
aW9ucyBhbmQgbWFrZSBpdCBlYXNpZXIgZm9yIGFueSBjYWxsZXJzPw0KPiA+IChqdXN0IGxpa2Ug
d2hhdCB3ZSBkbyBmb3IgImludGVsX2h1Y19pc19hdXRoZW50aWNhdGVkIik6DQo+ID4gICAgICBz
dGF0aWMgYm9vbCBnc2NfaXNfaW5fcmVzZXQoc3RydWN0IGludGVsX3VuY29yZSAqdW5jb3JlKQ0K
PiA+ICAgICAgYm9vbCBpbnRlbF9nc2NfdWNfZndfcHJveHlfaW5pdF9kb25lKHN0cnVjdCBpbnRl
bF9nc2NfdWMgKmdzYykNCj4gPiAgICAgIGJvb2wgaW50ZWxfZ3NjX3VjX2Z3X2luaXRfZG9uZShz
dHJ1Y3QgaW50ZWxfZ3NjX3VjICpnc2MpDQo+IA0KPiBUaGUgaWRlYSB3YXMgdGhhdCB3ZSBzaG91
bGRuJ3QgY2hlY2sgdGhlIEZXIHN0YXR1cyBpZiB3ZSdyZSBub3QgcGxhbm5pbmcgDQo+IHRvIGRv
IHNvbWV0aGluZyB3aXRoIGl0LCBpbiB3aGljaCBjYXNlIHdlIHNob3VsZCBhbHJlYWR5IGhhdmUg
YSB3YWtlcmVmLiANCj4gSHVDIGlzIGEgc3BlY2lhbCBjYXNlIGJlY2F1c2UgdXNlcnNwYWNlIGNh
biBxdWVyeSB0aGF0IHdoZW4gdGhlIEhXIGlzIA0KPiBpZGxlLiBUaGlzIHNhaWQsIEkgaGF2ZSBu
b3RoaW5nIGFnYWluc3QgYWRkaW5nIGFuIGV4dHJhIHdha2VyZWYgLCBidXQgSSANCj4gZG9uJ3Qg
dGhpbmsgaXQgc2hvdWxkIGJlIGluIHRoaXMgcGF0Y2guDQphbGFuOiBpIGJlbGlldmUgaW50ZWxf
cHhwX2dzY2NzX2lzX3JlYWR5X2Zvcl9zZXNzaW9ucyBpcyBiZWluZyB1c2VkIGluIGENCnNpbWls
YXIgd2F5IHdoZXJlIG9uZSBvZiB0aGUgdXNlcyBpdCB0byBjaGVjayBodWMtc3RhdHVzIGFuZCBn
c2MtcHJveHkNCnN0YXR1cyB3aXRob3V0IGFjdHVhbGx5IGRvaW5nIGFueSBvcGVyYXRpb24uIElm
IHUgc3RpbGwgd2FubmEga2VlcCBpdA0KZGlmZmVyZW50bHkgdGhlbiBJJ2xsIGhhdmUgdG8gdXBk
YXRlIHRoZSBQWFAgY29kZS4gT3IgcGVyaGFwcyB5b3UgY291bGQNCmhlbHAgbWUgZml4IHRoYXQg
b24gdGhlIFBYUCBzaWRlPw0KDQphbG5hOnNuaXANCj4gPiANCg0KPiA+ID4gK3ZvaWQgaW50ZWxf
Z3NjX3VjX2xvYWRfc3RhdHVzKHN0cnVjdCBpbnRlbF9nc2NfdWMgKmdzYywgc3RydWN0IGRybV9w
cmludGVyICpwKQ0KPiA+ID4gK3sNCj4gPiA+ICsJc3RydWN0IGludGVsX2d0ICpndCA9IGdzY191
Y190b19ndChnc2MpOw0KPiA+ID4gKwlzdHJ1Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUgPSBndC0+
dW5jb3JlOw0KPiA+ID4gKwlpbnRlbF93YWtlcmVmX3Qgd2FrZXJlZjsNCj4gPiA+ICsNCj4gPiA+
ICsJaWYgKCFpbnRlbF9nc2NfdWNfaXNfc3VwcG9ydGVkKGdzYykpIHsNCj4gPiBhbGFuOiB0aGlz
IHdhcyBhbHJlYWR5IGNoZWNrZWQgaW4gY2FsbGVyIHNvIHdlJ2xsIG5ldmVyIGdldCBoZXJlLiBp
IHRoaW5rIHdlIHNob3VsZCByZW1vdmUgdGhlIGNoZWNrIGluIHRoZSBjYWxsZXIsIGxldCBiZWxv
dyBtc2cgYXBwZWFyLg0KPiANCj4gSSBkaWQgdGhlIHNhbWUgYXMgd2hhdCB3ZSBkbyBmb3IgR3VD
IGFuZCBIdUMuIEknZCBwcmVmZXIgdG8gYmUgDQo+IGNvbnNpc3RlbnQgaW4gYmVoYXZpb3Igd2l0
aCB0aG9zZS4NCmFsYW46IG9rYXkgLSBzb3VuZHMgZ29vZA0KPiANCj4gPiA+ICsJCWRybV9wcmlu
dGYocCwgIkdTQyBub3Qgc3VwcG9ydGVkXG4iKTsNCj4gPiA+ICsJCXJldHVybjsNCj4gPiA+ICsJ
fQ0KPiA+IGFsYW46c25pcA0KDQo+ID4gPiArCQkJZHJtX3ByaW50ZihwLCAiSEVDSTEgRldTVFNU
JXUgPSAweCUwOHhcbiIsIGksIHN0YXR1cyk7DQo+ID4gYWxhbjpuaXQ6IGRvIHlvdSB3ZSBjb3Vs
ZCBhZGQgdGhvc2UgYWRkaXRpb25hbCBzaGltIHJlZ3M/IChzZWVtZWQgdXNlZnVsIGluIHJlY2Vu
dCBvZmZsaW5lIGRlYnVncykuDQo+IA0KPiBBZ3JlZWQgdGhhdCBpdCB3b3VsZCBiZSB1c2VmdWw7
IEknbGwgdHJ5IHRvIGdldCBhIGNvbXBsZXRlIGxpc3QgZnJvbSANCj4gYXJjaCBhbmQvb3IgdGhl
IEdTQyBGVyB0ZWFtLiBBcmUgeW91IG9rIGlmIHdlIGdvIGFoZWFkIHdpdGggdGhpcyBpbiB0aGUg
DQo+IG1lYW50aW1lPw0KYWxhbjogeWVzIHN1cmUuDQo+IA0KPiA+IA0KPiANCg0K
