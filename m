Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9CC6EE817
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 21:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2667210E19C;
	Tue, 25 Apr 2023 19:14:20 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBF510E086;
 Tue, 25 Apr 2023 19:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450057; x=1713986057;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Gic5/vXXabbv4ZLpghM3ZBJf3XYCBLgRtgMQ/v7ZIBw=;
 b=jhMoa+C0UZ+MFPAmf78x+Y4dm9eV3i3UxA8Iiv2ID6rK1wHmOUdThlpC
 OkujB1a7H5PJ1QOlTNRz92l62agKCsqLJ+Ibn3Lp60dOLEuzjZ7X62iMq
 RsHplkX6XZQOiv57uyLlBEdIf1s4QHOm/FAiNu9mzLvbNdDMT+jhBPU0z
 BlyhXUYcqgboyfsTZQf7ucUXX9Hj9aCW5tirn2r9Zp5LvThPnliTJCG1N
 Iihq3tnfU5krFXKoB7/MaVCLgLsz9ZwO7ZayFkmnhstp6mZ2Np/Rj6oIT
 kq4S8UtQZfLmJS0OKPcJn7N7HbOXD2feHQ3dQdnMZddok6tB5O8WqASeQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="412165773"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="412165773"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="758268632"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="758268632"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2023 12:10:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 12:10:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 12:10:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 12:10:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 12:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnE7KDyop8uiJJp5T1XTzC3dQzpCwsWFYfxc7iBmWXAvr2eEQdE52wB2qOxUpMjbRl/3Iej1Kn1NSNh6jFp4adEsrxbu544BpV0OzLZ/xRTPhIy/Vw+ZfVZv+0HFiwkDH0WYmmvUAuskllETd+Xpfne98B6xCM/3Oz38Oto7BiU5sVv2b5lRdNEtX22luZwNoQsJKzZ+P0ZQs0Uc71cCfaSd0BMVB2JIvzO330AFIVsBK0/vL0c75gnIS+3mMvj0+c6FxNP+6a2Oo3SXbpSKY6OBd22ggIUeUDfxpl3upOLpumJF5qbDQubAu45Azv6PZa4iTc1UCvFWMs1I9nmM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gic5/vXXabbv4ZLpghM3ZBJf3XYCBLgRtgMQ/v7ZIBw=;
 b=Dbc792ISpAETMOhqsVuWtXqV5D2inXs/OFjhQMcM5vZ2pEPknL3AP/luNFKwgJc3k6FI8KASgbRScul5Xqkt7X9S1UTCT5o/W4Ks7hNJRKX1Ab+5bMzWaamDAWgLBx1g9hzoj9Jthf5Bureu2hQUUw8UvSgMWyHAmdE1aQwPSZoRt3pQx2GzabBqq23u1dda+o22oO1UPTvygwX3L2u62ciefV4/FAUfQmvpfVB10jFklXLkWEqBKT46kjBKY8E/CDIXLUq0yOCvJdet+zufLz8+oJXy607LAE7jcdf8jmTXDkNX/noKyi8dlO/DwPVCIuPXIA04q4pF2LFLGcMkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 19:10:20 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 19:10:20 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915/guc: Capture list clean up - 4
Thread-Topic: [Intel-gfx] [PATCH 5/5] drm/i915/guc: Capture list clean up - 4
Thread-Index: AQHZaNb1PN5o21f/e0CzJXra8RtYh688gXcA
Date: Tue, 25 Apr 2023 19:10:20 +0000
Message-ID: <20f195633261927ca430c1b1775f21f8a24e3e0c.camel@intel.com>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
 <20230406222617.790484-6-John.C.Harrison@Intel.com>
In-Reply-To: <20230406222617.790484-6-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ2PR11MB7454:EE_
x-ms-office365-filtering-correlation-id: 84419c28-4173-4a04-4c94-08db45c0b68d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e4hvLLTb30XJ1Iwh6m5boyTyo/UhHC+4DMdWSIwP8DNBi9WtvcyJsmNpPBwlEVuV6pCOl09z0AQk0Xy/45HSdB92Xw2JRnwKFvX8pdnejzgnjIf+EXmQWd5GRBK/Fqkjit5J7RW0ROGPRiTMnTAGSn0/kI1WZ84KYYWkbsmWEHSOKlJt1UdUEJ1kI+hgyelIBQwk9qzMYSVlbofP/ozWuSfrfj8ubBirhktWLprUGAmc/P31JoAEZZlL3K1kQmjGVrUItxTuEX15cMIwQzZFxiSpM+SIwvb+tMzubnm7zBrcsl7n77zvJiciUnxZ3uRulRKqPMH54sNYVW0QLA6pc5iiw3wNbm8zRS+huU/RnOFkIBoqMP/FcFZlzutfCXkzW1kMzj9Luxwqg1xUVP18q1g6s24HksfmgyqA5HFQAYvXk5R9OOmgbTXj89TF7+3Jr5dOaLz3GW2XUSKXZ2o7JHmE/4NQHHIZS5n90q/F6W9DH00krCDyRUTfeKmTmQfTGxRDiSHuijw8cWsCoktUApTyVAkN0jXSMFcy1OeQzr4KZDxQTQW6sVTCjfYvEC3Pamucw89vd/vJvgzhMp1hF9JQuV/0r2phyinGOqMmT4bcEaUEyDbUzK1F6YMcXidG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199021)(36756003)(110136005)(38070700005)(478600001)(82960400001)(91956017)(4326008)(66446008)(66476007)(66556008)(316002)(76116006)(64756008)(66946007)(122000001)(41300700001)(2906002)(4744005)(8936002)(8676002)(5660300002)(38100700002)(2616005)(6512007)(6506007)(26005)(450100002)(86362001)(186003)(71200400001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVBReWJ1M0NnN3d0VjF5dkk2eDJNMVVNUllvWjc4M1doSE9nRExoSjRVQ0Rq?=
 =?utf-8?B?dUhoK1VIU0ExZFF4SENJVWVnQzJuaGs3Z3drYm9GQUVyVjUxbG5XY045eCtP?=
 =?utf-8?B?UDNlT3FFc0RxTFJmR0wvaGZNdXA0dWdxbEFnUy9zUUgxdzhwWThyNEJVUTI3?=
 =?utf-8?B?NnZBQW9PTHgzcExBaDhiSlNVM3ZJcVMrUVA0U3JWMStWTkx5WUF5MEJaTjEz?=
 =?utf-8?B?UjY5d29mZlQ2dVhvY0RaNXhWb1JzbG5pUVpiRnVqSmZMK3ZiNHNNN0txOW9W?=
 =?utf-8?B?STJKV3NKQlM1MmJ1VU12czNHVFlrQktyZks1ejJkcnY5MDVhNDlhaTRzQ1E1?=
 =?utf-8?B?NmdVbjB5UmgwVHpHcWFVaTBidnZ0Q1dyeWFoMlZSMjg5OHcwU0xSYVB1VlY5?=
 =?utf-8?B?ZTNQaER1QzNNeVMzNmEvYks4d01tV2FmRnRnT0s4SWowZ1hJZ0FkaytKbXFO?=
 =?utf-8?B?Zldta1FjTzI3ZUdzcFdIWE9Rejk3Y3lHZzZLZ0ZlUjN2MGplN3FPTXY0eXMr?=
 =?utf-8?B?dGpnQnRTTGdwQWxyRGY5dCt5TjFaSEp4OEZDbXM1aHdkdFJRWkM4dGpmNHNi?=
 =?utf-8?B?TUc0VGxoOHgwWWpUZW5DYVVDS2h2dnVIbDlITDVIa2xMVDY5djY3YktLYmE1?=
 =?utf-8?B?U0pWNGRVK1FpT1d6UTlKUUxMUENZaU9QZmxjdE8vUHdFQlg3NjRJT1owdzJ2?=
 =?utf-8?B?L09JVlI3cGJ1NVpnMzlsQVNzRHBWNXlXcFhGOStmTmxkNkVuNHhjcWYrcnJr?=
 =?utf-8?B?VitUTEpJYmVjQWtPM0MrbEJHVmxXaXBBOW1wbnNpeWFGcDcyYVdBcjR1RHNk?=
 =?utf-8?B?aGJkaTI4VzVPTmRTQW9jUzZqUGoza1oxTmJESGt1dlRRVnNtdjR1NndqYXJx?=
 =?utf-8?B?M0IrazJqejRHa3MrZU96UHRacGFNcmJDZEZNS0d3anYybU5uRW1kY1ZLWS9Q?=
 =?utf-8?B?RDcwdXFINDFzVTNFY0thWm9LaWZNM21NdnVMTTd2eG5EUEhRWmsrRmVpR3NW?=
 =?utf-8?B?bUhsTVBhSkZtUHNQVisxZmtDV1hXSmR5NEh5czFPUHhQSUtxbDVNQ2w5ZEZM?=
 =?utf-8?B?V3d2UXRRRGVzV2xVNWs1L2lSeVNsRGtsUWtCQVZ5TExSY09rd1BabDRsZlM5?=
 =?utf-8?B?TG5aYm50VUdWOW9YdytBVzFRYXBCcG0wQkFQYkVwU25hU1ZmRlhIVTRka3pi?=
 =?utf-8?B?b3NFNzdORWkzdS9Ndm5uZTVYSWR0Z2pvZEhRQVpLZEkyRVJ6M0Y3djdKdmxX?=
 =?utf-8?B?dkhwaFU3TVlWcXBzbUJOQ3N6SWpBTm16R0FxakkycUJVVThEOHN6RlIwelpE?=
 =?utf-8?B?YkNka0ZVSlMyYjRZaG0wdWFFQVorZzh0aWZoRHdEVmx1KzF4WmxJN0IrcEk2?=
 =?utf-8?B?clMwSnVHdm04bDExM2YvVXJXQnh3RzVYTWY3Q1hrbnBPSGs2Lzh0M29wdVVS?=
 =?utf-8?B?aG5veVdaRE9ET3BrZU9KSHpjeVVFVysyYVNnTm13OCs4WVpoaHVyb1BNSUl6?=
 =?utf-8?B?ellRZU50OUxwcXFGNnJxdE9DZ1lNcS94VUoyTmhIdzZRRC9ickdURi9rUU8y?=
 =?utf-8?B?NUxWTU9LRHo1SDVkdHpQdzhpaGd0MUoybVNNWk0xMm1QenoreTl1OUdPalQx?=
 =?utf-8?B?U1VXS0dyTVg1VHZsZTNYV1dGMG5UZGdDUW5paDBMck9IMndRMzJXQ0Z4RXVO?=
 =?utf-8?B?aU1MWjRKbGtaNWZqNXJHMXJDQVlzdkg4R2c0ZmJMRGJKZzVtM3F2aHc5SEZu?=
 =?utf-8?B?bjNSenYwakd6SFJucWl1Wkp5TXVtL0ZOcE9yQWx4N0VtUmxFUEUzRXo3V1Rv?=
 =?utf-8?B?WjJwTnhOWEx3aGF5Nkg4VEFKaGNUbHJqOHJiQWR2NHVsTkY1eDRDVlVpY1BB?=
 =?utf-8?B?ZGtydURwVjFJZE9UWVIxNmpCSmQwdmR3QXkrcmxCVWNUMDJyR0V0NzM0a01D?=
 =?utf-8?B?WjZDQTZaenpSU3hxZnRTSnVEZWMzbXIzR0dHQ0xrS2JJT2lpZ1pXZlJKZzh2?=
 =?utf-8?B?ZllzVTVOZWFNeUNyaGRxQWVWRjRkN3BZTWRKdWJEMmdQNFIxTlZZRG15Q0p1?=
 =?utf-8?B?dUlPcjFjMXB6bHp1cWxsWWd6MXZHUVU1UkRPK0crUlpsdldwZWxYV213Y1A1?=
 =?utf-8?B?dFArdVNyZVRhOXV4ck04Zks3LytyYTZrRU9LSVBxVDZEL2pzSzdCZ0FTcVBr?=
 =?utf-8?Q?q1XDDx3M6NN71oRvxhKoBYw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3144D61D9DFEA74E94E95E4FD56D7D7B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84419c28-4173-4a04-4c94-08db45c0b68d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 19:10:20.1253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B8trcuEcRW3D3oSormH0Rb3uwdTX9tLDVCO3YQ7CfhNtVHYxNW4E080eyXoSQcFO/upj8OZ/wW6UdDbpPJOT4YOXNbrMUhd9/lgZcQQH23lF9DFRNNJB3OnOUYnU6uj4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTA2IGF0IDE1OjI2IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gRG9uJ3QgdXNlIEdFTjkgYXMgYSBwcmVmaXggZm9yIHJlZ2lzdGVyIGxpc3Rz
IHRoYXQgY29udGFpbiBhbGwgR0VOOA0KPiByZWdpc3RlcnMuDQphbGFuOnNuaXANCg0KYWxhbjog
VGhpcyBwYXRjaCBhcyBhIHN0YW5kLWFsb25nIGxvb2tzIGdvb2QsIHNvIEknbGwgcHJvdmlkZSB0
aGUgUkIgYnV0IHRha2Ugbm90ZSBvZiB0aGUgY29tbWVudCBiZWxvdw0KdGhhdCBzaG91bGQgYmUg
cmVmbGVjdGVkIGJ5IGRlY2lzaW9uIG9uIHRoZSByZXZpZXcgY29tbWVudHMgb2YgcGF0Y2ggIzEg
c28gdGhpcyBwYXRjaCBtaWdodA0KY2hhbmdlIGZyb20gR0VOOV9mb28tZnJvbS1wYXRjaC0xIHRv
IEdFTjhfZm9vLWZyb20tcGF0Y2gtMS4NCg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFu
LnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQo+IC0vKiBHRU45IC0gR2xvYmFsICov
DQo+ICsvKiBHRU44IC0gR2xvYmFsICovDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IF9fZ3VjX21t
aW9fcmVnX2Rlc2NyIGRlZmF1bHRfZ2xvYmFsX3JlZ3NbXSA9IHsNCj4gIAlDT01NT05fQkFTRV9H
TE9CQUwsDQo+IC0JQ09NTU9OX0dFTjlCQVNFX0dMT0JBTCwNCj4gLQlHRU45X0dMT0JBTCwNCj4g
KwlDT01NT05fR0VOOEJBU0VfR0xPQkFMLA0KPiArCUdFTjhfR0xPQkFMLA0KYWxhbjogc2VlIHBh
dGNoIGNvbW1lbnQgYWJvdXQgIkNPTU1PTl9HTE9CQUwiIHZzICJHTE9CQUwiIGNvbmZ1c2lvbi4N
Cg0K
