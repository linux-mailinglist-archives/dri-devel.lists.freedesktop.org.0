Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D96F051B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 13:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400D910E285;
	Thu, 27 Apr 2023 11:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA7610E285;
 Thu, 27 Apr 2023 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682595981; x=1714131981;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BG0CVvqqUkoA/3LU4RAHt7tPkNH9VJtoqoO++J4ijZ0=;
 b=VbRN8Xfh4w8B3JRRm50YFElF0FztIrECrVqJ3tWUlE6jCTKvoKG2HxtS
 cDAo/DoXMbgpuhvKq7R+V9/4QLfaHWE62aY+p4vtg/OyJwKiB5ocITlUj
 nxRrVVxnnNy05Bkn/5TCM27HuXwUlAjlojS8/yjVhZRi2FLnM2hQIyR92
 tAZxLkotFP9hizksKfUep8rBvAcKGHhqgI5VEE3nPN4IinBkkCMy+hG6w
 7mNnpXBvkPTwm/s5XzP+kiVcvIBUyZEzAohQgFuoKgGfg+ldxPG3NlyDY
 OcI/XDPiDeHAH1b8Fzq4q1Tj8E4yvlH+APrlVcMhmIawx3/Oes0Tkv3hD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375393325"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="375393325"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 04:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="697044677"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="697044677"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 27 Apr 2023 04:46:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 04:46:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 04:46:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 04:46:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 04:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHdC1mrzZVrKgxLyl4ZklEnspus5hMI5NMil5dB8fEkf2WxJG/XgpEOIluaHzcclRf8f3VjR0DhMy/4YzGemSYviai53XDgl53qP3KLVeNdDPQ8LJTZQoKZjYRZb+ZVMmn/8Z1p3bDKdtinGu73PuqWVFcvZWSmSpDd4WYv2YqChvKkbmCMCtv2nLNYcdHfU6r3kpKOhUHSPLCFzGYppBrwb41j8sojcgZABhSpF7BHen+8WNkyMUZGeJzyV8IlLJ+9C08Rc/2BhRaRvb3hI38us7Vm5XfjcNH9eQGDoRVP3S/8YmeIYqjREwgYLPkh0vSdOovl6RhOV1tgiIj6LbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG0CVvqqUkoA/3LU4RAHt7tPkNH9VJtoqoO++J4ijZ0=;
 b=niMuj08sJsk3mlpoIGIi43NLEa1oiAzLfxRLk/OJnDr3eKepIXfu1f7nx7juHYYwJdP7ngy1hJ6WxRU5bvU3wLBvzf0W2YtHe/6zfCPXqJxxqiEjpp16Ygwib06JW8OGIzHQruP8LdEc7aNboqv8tkqJAIRIDE8tpnB/gPNbh2tqjGBKuUROC4ws0mLIH72DFfDsP8zDX3T70rotPVhxmXVeyHVDx8C1YpxLBS2uVBQNBGuCfyzSaAiFuP4nfPG22XeT+ON3/ZO7gPNaY/GpBucag6JwirHI+r+3FWc8hXngO6gSsXPHQynmr1TIkUA8x+ZWh0udHlA+fc/4Y7J0wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.22; Thu, 27 Apr 2023 11:46:15 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97%9]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 11:46:15 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [Intel-xe] [PATCH] drm/xe/display: Do not use i915
 frontbuffer tracking implementation
Thread-Topic: [Intel-gfx] [Intel-xe] [PATCH] drm/xe/display: Do not use i915
 frontbuffer tracking implementation
Thread-Index: AQHZUDZZ/xOpbYbNkEW5oAvc81EWjK7t3q8AgABUBACAAAmhAIAEERYAgAABhICAABefAIBM9L+A
Date: Thu, 27 Apr 2023 11:46:15 +0000
Message-ID: <ff5d63dd814c3d1dbd6706ff79f5147799d1cbe2.camel@intel.com>
References: <20230306141638.196359-1-maarten.lankhorst@linux.intel.com>
 <edae44735190c4d5fbbe8959f999ad7ca65f3677.camel@intel.com>
 <073f5ef3-523a-2997-c7e9-771cce8f4c24@linux.intel.com>
 <ZAZT6jJlsiTF1A5a@intel.com>
 <3dc66e2540e3dcf8c626d8fe79c6334b1f1066e9.camel@intel.com>
 <34de1995-7c27-c548-fbd0-00de11b5b346@linux.intel.com>
 <ZAnSVOrUThPUSBes@intel.com>
In-Reply-To: <ZAnSVOrUThPUSBes@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA1PR11MB5780:EE_
x-ms-office365-filtering-correlation-id: b6dc3038-a0a1-4aa4-04ed-08db471501f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rNko+GRv+ilbJ8hpNt2IzAVeMaEQ8shyyx9Tr3A7BB+ZsPcnf2xHxsWjaXa7SkKhr6ZxhSCpscHq1o+xiTmtPPdwJpvzTiOosSqtKJVIAxlMOQF5X3GgdaaOHG0yetqHtj8MFjeabl3B0CC6wx9zJc1AitiM8Zwm0QL5rzbJ0N/bxZ7myWCfyqQz4ABKW9W6WyBR965U7Vd9Uj3n5LhMNLpKb7TQfjf0q1iP68RlkovsUvy3EDVotziqsfQxPGtlkVcPeXK16/PRvIZCCtTTaWNH9hof1aTArAK9+2q1yNACarsRmcd4fcdh/z/sn4nJYJkXkRgt8dHmkiiR/jKQPoSllx9TCoGtAHyT31Lm5vG4LcBz1/9wucyN69xpN1aWpo06uRMTh0NQyZSwwr8Mp60eC5rhrurlpbHzaNtRV8lFQsgLZAkOr4wCZv6FXOyhtrasR69nt34PJ2fSuPI2xcjxp7PwkZGNGyrC+I2v7oddAQqVNtS9kA7AehsqwBjm28Dyb64GbF7lmBEoIt5N+Ql73XbYfvs1QflF4U27E1LnfiR5LqsfJKocW2e4iLE8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(66476007)(4326008)(76116006)(66446008)(64756008)(66556008)(66946007)(66899021)(26005)(36756003)(38070700005)(53546011)(6506007)(6512007)(71200400001)(478600001)(6486002)(86362001)(110136005)(966005)(54906003)(91956017)(186003)(2906002)(38100700002)(8676002)(8936002)(316002)(122000001)(83380400001)(2616005)(66574015)(41300700001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTZWNVhkZUg2R0VycEE0WTB3NWFTVGpLY2xadjNxUXpZb2w2S1BBemwwanFH?=
 =?utf-8?B?ckRSdnhFM0VSeUJBVmFyaC93ZjRnSGJrNEh6QXRneHgyS2RsNmF4Rng5Nmox?=
 =?utf-8?B?ODdmakxqcFdqdDl4eU03SHJsNkhmR2FTaTd3QlUwTFBDZ3FOQjRaTkthYnpD?=
 =?utf-8?B?VWtIZTNrd2V1WjVKd2RQTzBwbFpreVVFRDRaTWdkdW9LNlk3VXNyaXI5czk1?=
 =?utf-8?B?akRjeXJsVEVZaE10SSt3SkpiTTk1bGpvbmwvTVpsMnVKR1hiV1lORGZ6emsx?=
 =?utf-8?B?VDl6dG01eFlNZnBvSElZTWtJVjJ4cG9lNHJwUnI4YklWS3V6VlM2UUZaMFVt?=
 =?utf-8?B?M0FoMUpRUUVSaWxlbmlaWkxFZ2x5UkZHanBkeXh5RXBsQjdCdHhNS01Hd3Jm?=
 =?utf-8?B?UHJ5UStKS1pneXEzSENkTHVHNlZpWUp1SFhXOU9MUkI4b3VXckhjblRsVGRG?=
 =?utf-8?B?N05DUzRvZE50NXc2TUN0SkYxbitGM3lEY0gzalVqTmtSUm9ZZndXQ3pGaWxK?=
 =?utf-8?B?WHVzMVhYMTFOcjBUV2JGQmZ3TlpZWUk3ZEZYbDVyNmk4dkI2Q3hoSUR1NlNs?=
 =?utf-8?B?d1ZkdkxJVGZTeHVSZEJrYUxlOWpNMHNNZzZaYjlRRTBSNlNxNitUSnZIWHcv?=
 =?utf-8?B?NG5DUzg1MldnVFlxZzViZngvZFN2K1NwZHl2eHJaNEJBSHZIVGFQbHdMUFZQ?=
 =?utf-8?B?T055WkJyeDBra3hLMk85aE81K1ZPSEtIc3BpTVNJZFZsTGhBbGljd2ZsZWtX?=
 =?utf-8?B?djVRcUMrNUJwRFNIdFRjQXhUaXowUmVOMXFiMDNJbTlMeFZ3blV5dE9BYVNQ?=
 =?utf-8?B?aGd6Vk11ajB4ZkVSeEtCOTRpU0s4bytsdEVrb05NR0FqQ3RrR2xXR215RzFG?=
 =?utf-8?B?V2xQbWZWYW4rdWgxWFdNZEdEZEphL0JFZFBrYUs1MGZzTDlzVFhEblJWNGNn?=
 =?utf-8?B?UXptdXh5ZFNHYjBkMzdLSW1hSUxPekdRUERYeWE2TFhTZ0liR0h5Uk52c21x?=
 =?utf-8?B?NE1xYnM1RVREVDlIck9FbW9KZklqNkVYNWsxRGNsNUlETHk5NWwrMHZQV3JS?=
 =?utf-8?B?ZEh3NTRaRDBVYXJuSUdVMXdkeWlRcEVKUWN1TW1zQjdySU4wMGNnanVWNDFV?=
 =?utf-8?B?Q1JKa2JQcjR6TW5YUjZ5SFEzb3JmM1lmS1REY2tvZktPRzAzZEI5UHdzM3Aw?=
 =?utf-8?B?SGZtRC9xclU2SUcrOGJuL0xPb2ppYzJmbVFsKzFnMVo1eXhndGUvK2FoRjR0?=
 =?utf-8?B?TUdPMkkwdjRiRktZc005U2lCM01iOFQ2WWJBNmVhYmZEMjl6aEZicEMwcUZG?=
 =?utf-8?B?SWMxK05FRzdaR2ZaTnRMUzNjNnpKeGxuRlo0dmFMb3BVYWxiSnFMLzIyVlEw?=
 =?utf-8?B?eHV4VHAycUtXTGJVRzl3akFwSVM2aEx0WGdpamRCMUZJdU1DcGUwKzFoSGZI?=
 =?utf-8?B?MHA1bGNzalhUdjEwQ2cwblNGOU1FZG9XanAvQ3VTRlN3MXJVdG9PZ2hHWUNB?=
 =?utf-8?B?SXErQ2V0NlBCUTFqRTZpSFlmWlJuK0RtTEZpV21ZQW84Q0NyTWZsWXZUOXdC?=
 =?utf-8?B?QSt5ZzlNZ1EzaVhwazVjVUh5SmhHb0RLWDY0SXcrbXpZQVMvd2x4dzY1ZXlm?=
 =?utf-8?B?dk5ENGhGbGFheWlJZDA4ZnpRR0pHRE1LcTdlM0M3SE1rZ0ZJN1ZEd2UzR0Vw?=
 =?utf-8?B?Yld3Q1dNM3RQTzdTcmJYa3EzTXdCQmh4Yk5FWDhzd0xaKzJ0Z1dwNGNxbkg3?=
 =?utf-8?B?RUpZSkszZjZBUlNiWUFFV2hTd0Rpejk4MHhEYjlCS2czWERUcWJscjRuZWsw?=
 =?utf-8?B?WlpTM1h6eWV3VWxLWEczTjRlc1BQK2svVnJWZ1QvUld1cHJBc3FXU21qSnJ4?=
 =?utf-8?B?UW5WSWpjL3I0dW5JaDBOSC82ZjJuNHd4TzRadHI5MDdjRURIejhybWRKdnFV?=
 =?utf-8?B?U1dpUFpzcjBNVmIvN01MVGJXK2NVZ2RsTkJFTmtaTEtjelVna3JuWDNkSVpl?=
 =?utf-8?B?c3NvcjdJMWZCVllzeVQyYXZaVEtUUUlhRmErb3BwRFZPQncxWGdPdGVzcGdj?=
 =?utf-8?B?QWJMQkFocXJNRGgwenJ4OWlEcm52bHZXYWVDNGU2UER0Ym9kS1VNZVBEK2RB?=
 =?utf-8?B?SWQ0eGRlZy9IL2NTN0d6VnVVb0QwRUMwNkJZZGZhWCtNTU8wZ05JdGJZb3k5?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D4276E04212234A8CE09BDD998C3BF1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dc3038-a0a1-4aa4-04ed-08db471501f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 11:46:15.5615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7zg2I4DCYc3tDC82ZomkSgbZ3mD6VdIYhY5w6kSwjvNOCKQcdf1W9u2fFW5gDIaxwH8xcRCPW50C4dc/FHUyk0uxWRtk/yhgi0WKqxC8Xr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
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
Cc: "Souza, Jose" <jose.souza@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTAzLTA5IGF0IDE0OjM0ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFRodSwgTWFyIDA5LCAyMDIzIGF0IDEyOjA5OjU1UE0gKzAxMDAsIE1hYXJ0ZW4gTGFu
a2hvcnN0IHdyb3RlOg0KPiA+IA0KPiA+IE9uIDIwMjMtMDMtMDkgMTI6MDQsIEhvZ2FuZGVyLCBK
b3VuaSB3cm90ZToNCj4gPiA+IE9uIE1vbiwgMjAyMy0wMy0wNiBhdCAyMjo1OCArMDIwMCwgVmls
bGUgU3lyasOkbMOkIHdyb3RlOg0KPiA+ID4gPiBPbiBNb24sIE1hciAwNiwgMjAyMyBhdCAwOToy
Mzo1MFBNICswMTAwLCBNYWFydGVuIExhbmtob3JzdA0KPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4g
PiBIZXksDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gT24gMjAyMy0wMy0wNiAxNjoyMywgU291emEs
IEpvc2Ugd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBNb24sIDIwMjMtMDMtMDYgYXQgMTU6MTYgKzAx
MDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBBcyBhIGZhbGxiYWNr
IGlmIHdlIGRlY2lkZSBub3QgdG8gbWVyZ2UgdGhlIGZyb250YnVmZmVyDQo+ID4gPiA+ID4gPiA+
IHRyYWNraW5nLCBhbGxvdw0KPiA+ID4gPiA+ID4gPiBpOTE1IHRvIGtlZXAgaXRzIG93biBpbXBs
ZW1lbnRhdGlvbiwgYW5kIGRvIHRoZSByaWdodA0KPiA+ID4gPiA+ID4gPiB0aGluZyBpbg0KPiA+
ID4gPiA+ID4gPiBYZS4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFRoZSBmcm9udGJ1
ZmZlciB0cmFja2luZyBmb3IgWGUgaXMgc3RpbGwgZG9uZSBwZXItZmIsDQo+ID4gPiA+ID4gPiA+
IHdoaWxlDQo+ID4gPiA+ID4gPiA+IGk5MTUgY2FuDQo+ID4gPiA+ID4gPiA+IGtlZXAgZG9pbmcg
dGhlIHdlaXJkIGludGVsX2Zyb250YnVmZmVyICsgaTkxNV9hY3RpdmUNCj4gPiA+ID4gPiA+ID4g
dGhpbmcNCj4gPiA+ID4gPiA+ID4gd2l0aG91dA0KPiA+ID4gPiA+ID4gPiBibG9ja2luZyBYZS4N
Cj4gPiA+ID4gPiA+IFBsZWFzZSBhbHNvIGRpc2FibGUgUFNSIGFuZCBGQkMgd2l0aCB0aGlzIG9y
IGF0IGxlYXN0IGFkZCBhDQo+ID4gPiA+ID4gPiB3YXkNCj4gPiA+ID4gPiA+IGZvciB1c2VycyB0
byBkaXNhYmxlIHRob3NlIGZlYXR1cmVzLg0KPiA+ID4gPiA+ID4gV2l0aG91dCBmcm9udGJ1ZmZl
ciB0cmFja2VyIHRob3NlIHR3byBmZWF0dXJlcyB3aWxsIGJyZWFrDQo+ID4gPiA+ID4gPiBpbiBz
b21lDQo+ID4gPiA+ID4gPiBjYXNlcy4NCj4gPiA+ID4gPiBGQkMgYW5kIFBTUiB3b3JrIGNvbXBs
ZXRlbHkgYXMgZXhwZWN0ZWQuIEkgZG9uJ3QgcmVtb3ZlDQo+ID4gPiA+ID4gZnJvbnRidWZmZXIN
Cj4gPiA+ID4gPiB0cmFja2luZzsgSSBvbmx5IHJlbW92ZSB0aGUgR0VNIHBhcnRzLg0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IEV4cGxpY2l0IGludmFsaWRhdGlvbiB1c2luZyBwYWdlZmxpcCBvciBD
UFUgcmVuZGVyaW5nICsNCj4gPiA+ID4gPiBEaXJ0eUZCDQo+ID4gPiA+ID4gY29udGludWUNCj4g
PiA+ID4gPiB0byB3b3JrLCBhcyBJIHZhbGlkYXRlZCBvbiBteSBsYXB0b3Agd2l0aCBGQkMuDQo+
ID4gPiA+IE5laXRoZXIgb2Ygd2hpY2ggYXJlIHJlbGV2YW50IHRvIHRoZSByZW1vdmFsIG9mIHRo
ZSBnZW0gaG9va3MuDQo+ID4gPiA+IA0KPiA+ID4gPiBMaWtlIEkgYWxyZWFkeSBzYWlkIH4xMCB0
aW1lcyBpbiB0aGUgbGFzdCBtZWV0aW5nLCB3ZSBuZWVkIGENCj4gPiA+ID4gcHJvcGVyDQo+ID4g
PiA+IHRlc3RjYXNlLiBIZXJlJ3MgYSByb3VnaCBpZGVhIHdoYXQgaXQgc2hvdWxkIGRvOg0KPiA+
ID4gPiANCj4gPiA+ID4gcHJlcGFyZSBhIGJhdGNoIHdpdGgNCj4gPiA+ID4gMS4gc3Bpbm5lcg0K
PiA+ID4gPiAyLiBzb21ldGhpbmcgdGhhdCBjbG9iYmVycyB0aGUgZmINCj4gPiA+ID4gDQo+ID4g
PiA+IFRoZW4NCj4gPiA+ID4gMS4gZ3JhYiByZWZlcmVuY2UgY3JjDQo+ID4gPiA+IDIuIGV4ZWNi
dWZmZXINCj4gPiA+ID4gMy4gZGlydHlmYg0KPiA+ID4gPiA0LiB3YWl0IGxvbmcgZW5vdWdoIGZv
ciBmYmMgdG8gcmVjb21wcmVzcw0KPiA+ID4gPiA1LiB0ZXJtaW5hdGUgc3Bpbm5lcg0KPiA+ID4g
PiA2LiBnZW1fc3luYw0KPiA+ID4gPiA3LiBncmFiIGNyYyBhbmQgY29tcGFyZSB3aXRoIHJlZmVy
ZW5jZQ0KPiA+ID4gPiANCj4gPiA+ID4gTm8gaWRlYSB3aGF0IHRoZSBjdXJyZW50IHN0YXR1cyBv
ZiBQU1IrQ1JDIGlzLCBzbyBub3Qgc3VyZQ0KPiA+ID4gPiB3aGV0aGVyIHdlIGNhbiBhY3R1YWxs
eSB0ZXN0IFBTUiBvciBub3QuDQo+ID4gPiA+IA0KPiA+ID4gQ1JDIGNhbGN1bGF0aW9uIGRvZXNu
J3Qgd29yayB3aXRoIFBTUiBjdXJyZW50bHkuIFBTUiBpcyBkaXNhYmxlZA0KPiA+ID4gaWYgQ1JD
DQo+ID4gPiBjYXB0dXJlIGlzIHJlcXVlc3RlZC4NCj4gPiA+IA0KPiA+ID4gQXJlIHdlIHN1cHBv
c2VkIHRvIHN1cHBvcnQgZnJvbnRidWZmZXIgcmVuZGVyaW5nIHVzaW5nIEdQVT8NCj4gPiANCj4g
PiBObyBvdGhlciBkcml2ZXIgZG9lcyB0aGF0Lg0KPiANCj4gRXZlcnkgZHJpdmVyIGRvZXMgdGhh
dCB3aGVuIHlvdSBydW4gWCB3L28gYSBjb21wb3NpdG9yLiBBc3N1bWluZw0KPiB0aGVyZSBpcyBh
biBhY3R1YWwgR1BVIGluIHRoZXJlLg0KPiANCj4gPiBJdCdzIGZpbmUgaWYgRGlydHlGQiBoYW5n
cyBpbnN0ZWFkIHVudGlsIHRoZSANCj4gPiBqb2IgaXQgd2FpdHMgb24gY29tcGxldGVzLg0KPiAN
Cj4gTm8gb25lIHRyaWVkIHRvIG1ha2UgaXQganVzdCB3YWl0IGZvciB0aGUgZmVuY2Uocykgdy9v
IGRvaW5nDQo+IGEgZnVsbCBibG93biBhdG9taWMgY29tbWl0LiBJdCBtaWdodCB3b3JrLCBidXQg
bWlnaHQgYWxzbw0KPiBzdGlsbCBzdWNrIHRvbyBtdWNoLiBJIGd1ZXNzIGRlcGVuZHMgb24gaG93
IG92ZXJsb2FkZWQgdGhlIEdQVQ0KPiBpcy4NCj4gDQo+IFdoYXQgd2UgY291bGQgZG8gaXMgZG8g
YSBmcm9udGJ1ZmZlciBpbnZhbGlkYXRlIG9uIGRpcnR5ZmINCj4gaW52b2NhdGlvbiwgYW5kIHRo
ZW4gb25jZSB0aGUgZmVuY2Uocykgc2lnbmFsIHdlIGRvIGEgZnJvbnRidWZmZXINCj4gZmx1c2gu
IFRoYXQgd291bGQgbW9zdCBjbG9zZWx5IG1hdGNoIHRoZSBnZW0gaG9vayBiZWhhdmlvdXIsIGV4
Y2VwdA0KPiB0aGUgaW52YWxpZGF0ZSBjb21lcyBpbiBhIGJpdCBsYXRlci4gVGhlIGFsdGVybmF0
aXZlIHdvdWxkIGJlIHRvDQo+IHNraXAgdGhlIGludmFsaWRhdGUsIHdoaWNoIHNob3VsZCBzdGls
bCBndWFyYW50ZWUgY29ycmVjdG5lc3MgaW4NCj4gdGhlIGVuZCwganVzdCB3aXRoIHBvc3NpYmx5
IGphbmtpZXIgaW50ZXJhY3Rpdml0eS4NCj4gDQoNCkkgaGF2ZSBpbXBsZW1lbnRlZCB0aGlzIGFw
cHJvYWNoIGhlcmU6DQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
MTE2NjIwLw0KDQpSZXZpZXcvY29tbWVudHMgYXJlIHdlbGNvbWUuDQoNCkJSLA0KDQpKb3VuaSBI
w7ZnYW5kZXINCg==
