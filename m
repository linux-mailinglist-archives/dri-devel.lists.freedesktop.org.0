Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE04B8B22
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 15:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC4810F138;
	Wed, 16 Feb 2022 14:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2968C10F138;
 Wed, 16 Feb 2022 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645020721; x=1676556721;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rsMxNsdj370zNx+Lz8fMw7kkIeQi6fW4+mweOM6tlnA=;
 b=d1DiSV/LWvFeazwUO+uxa3VHsy4o5/F6qPv9K6HpgWbh0njTLQXwGmQK
 FHulVTfoGg1bSiMrL5Rh2rkF6Ccbvb384MwXSkiRllHBWyYRaqvi7pHc6
 OfnQIrsVyk9O+HFNLRB/XwV49DzAcYnlxZHhYAvEr0EMUYXGdbjVrwJEb
 XB6xfh3AaBO2O54HfQ1dYnriQQVZeu9dk/gAPvrh6IXz25Q7fuGE3bsHa
 cu724TH593ZcDhF/9b25aOcArKO5OIUHztvjbnwzHU677HTVKrs1VtrRR
 lYwMOz1W8RzSsF+mUXmhlIDw5Pg3GTswULNMXfDc+IZh2jN4vNpIrXcrI Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250346019"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="250346019"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 06:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="633625087"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2022 06:12:00 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 16 Feb 2022 06:11:59 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 16 Feb 2022 06:11:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 16 Feb 2022 06:11:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 16 Feb 2022 06:11:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIY2piOzCw5IP73m/Sg7U8eDKOIHiAg9THKfKWmba/K/tCdDCglAFVCWVhZ2JsGTYMMuK5QT33ESyQsDwBBNQPVwiyhBiwg70+XxS8vkcF8Y8RAcZlczggsMQ41vap7gDVIfTWE1RX/8quYzKOmWjhXFEh5JstR82EFM0DEwhs+gWi2bWAwDiVEO9lLkmUrg8KXVkZ+NNLksv4HhSnERFSQvZgQlukIz6/+blQGggB2GwRi6IRvGMxuf1vTSD/AQuhdIuTrclQxxs6BSy6fYyUIbjYNjy2rEGCcBS7nWKf5DgyzGq/9AXE+Bc+Chherg5LXY7vaampCCxfOhjNNG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsMxNsdj370zNx+Lz8fMw7kkIeQi6fW4+mweOM6tlnA=;
 b=KUkUhU38Kn0Y2e+u4RxUii7YohZt/SuVwaPAK8Radf6QIeGSJF3B+mr5X71+553RcLO3V2VogJDvaod2q2hm22fs8ehmJJagExttr0LBc986L40yHlntvOVpra8HGO+muQ5u0qX8Pbj8rOzO03HqYhPJB3exdAM6pDvAf15IqtIagUP4opIRYHP71jpnOAT0a+pe/imap0gio+k4oA6FgIqxtl9zbLOxvti/75WuHxBukc/VaKs5fwUUv5jnIN21EwLgXWJbudSHwKDNjE7ZmdsRBDlFPl38HbdmgftF5Z5+DdD59yjCxBq5SpYpILh8Ab7c5uU6Q5xm2aBaYPeOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2731.namprd11.prod.outlook.com (2603:10b6:5:c3::25) by
 BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 14:11:55 +0000
Received: from DM6PR11MB2731.namprd11.prod.outlook.com
 ([fe80::b4f9:69c4:33a4:aca2]) by DM6PR11MB2731.namprd11.prod.outlook.com
 ([fe80::b4f9:69c4:33a4:aca2%6]) with mapi id 15.20.4975.015; Wed, 16 Feb 2022
 14:11:55 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Thread-Topic: [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Thread-Index: AQHYIjAmYa3IUrw5kk2DUczzl8q10ayV4EKAgAAMlYCAAAiyAIAARGKA
Date: Wed, 16 Feb 2022 14:11:54 +0000
Message-ID: <11bc21211988d45e73a7be212d31263574dfb1ca.camel@intel.com>
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-4-ramalingam.c@intel.com>
 <Ygy68/f1ERpTKJJW@intel.com>
 <392e942460079346d1ce9d3a17db11f9d02a17f5.camel@intel.com>
 <YgzMzNYlAoQPGhj1@intel.com>
In-Reply-To: <YgzMzNYlAoQPGhj1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48f9a4ce-bf07-4760-68aa-08d9f156495f
x-ms-traffictypediagnostic: BY5PR11MB4307:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BY5PR11MB4307DBC4932D871E00DABF308A359@BY5PR11MB4307.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Dh/o3Pu2GLf9KImLshD0H5ARxRSN/4ZZ/gPQJSgCLabW1HfEIbKOLQ4YtlrOESEoctdYe+edSGrCnJ74mqB2mRfmd1Z+XW1jemMMTSYtKVxWmsn+glAojDpMLGcvRjU34+Wr7L6IFoPTuZ7ImF/2XwrpSTEE1/Xo06SM+j1TVdBeJtJfBX6y5XR0F9S9rIJg2OWgvUkaPzwvan4xFzKE4d3FyrGKTyOjyHVVqq8AWkLDFEYluhkhdrL+5oXrDL38qHoukHmJOyvPPngAghWMmzIl3n2ymcVCnZsCDfqiBnA4Sw+AgOCZ1rMu40jQkPCS9XhOgB+eivRqEjqgHaZqTltQ+sii7F2St8H+PTFO5SskJTbL5knDmHBVFiJsSVQ5c8FdDx6FP+s7oWmCtPK+erbh4oTFjlACwj4WzpyH0a4fyJz7CcZQtVkJWuQpOWTdTdv0Klwapf65RGOtfYaqMLLw+nwOg2yaiG567gTv5gf1JOx7buVYZL5zdIDGfaq/KITYJ2l3pZso2U49ZxcHT/trtwiQU2aiiIY661SMyBMBksaG6PalASPBDv1Harnl05IHnMmGko6KDPU2SAFkKxlCyKDVFPXTqQbxR3l4D93Eo70LT/zLLrKL4ucgVdIjpVH/2UPbxMF2jjzC4EM2mTx01Hn/Vky8JN1vpVhZ4+r21t1m/zIq6aiIov45BQDU2jr54XmNXGC29gB7s1y3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2731.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(36756003)(6512007)(38070700005)(6486002)(83380400001)(2616005)(508600001)(38100700002)(122000001)(6916009)(5660300002)(54906003)(66574015)(8936002)(2906002)(66446008)(64756008)(66556008)(66476007)(91956017)(66946007)(76116006)(8676002)(4326008)(82960400001)(186003)(26005)(86362001)(71200400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmFHTFVEYXpUWi9KWUNWN2lUeCtGV05yd2xUb252RnZuek5VNzBhK0tVNWVB?=
 =?utf-8?B?VGNRWDFobmoxeUdHcG9RTVMyVkE5TWlYQURtWldzMDZhU0cvZ215K3orM282?=
 =?utf-8?B?YXBBbUJZR2EweEIxSGZwc1F2ZENmaVhaWkdwOTBmbFVuMC9qUytYQUtSVU5V?=
 =?utf-8?B?MGZFQnA5S1BhZGEvYjNCNEJRaTVibnBINFpFcW1mZ1psNXJRdVg4WUxCK1l3?=
 =?utf-8?B?aGtNb2JQR0VZdWFicUhaMUNqTWV6WDJlZW82QlpqaHJSZ2dZeHYwNm5hcjVu?=
 =?utf-8?B?ZS9FdkVlUGFqMFBwaEkxRmhFZXAvT2NiVDRxNnppanh0b2hGbWozM211MDFU?=
 =?utf-8?B?Tm5nTGh0SHZ5L251ZDAzTFJ6WGVza0JXMzBpNGRkQlVWUy8vV2Z6RGlRL1Mr?=
 =?utf-8?B?dmhVaUx2QXNzdDUzdkRIejRxZ1Q2OFdHSDR0UW5wQXZKenoxZm1ERFNiK2Ns?=
 =?utf-8?B?VlNnOWxVYnF2Q1BSZFdGRTJMbnZ0L0psSUMySkhwMjBaYTJnaHlRd2h6YVNP?=
 =?utf-8?B?ZjAwbUNkYm1ORnFuUE90S25VM1hJcjJ0LzZHRnhOMm0rKytodVVQdUVmWm9r?=
 =?utf-8?B?UmNyVEZmOGpLMnp3bkZZTmRVaWovekRhNVJwenE3Y0YyRWtBMjRPUWowWEhV?=
 =?utf-8?B?R2xSYmIvUHl6ZFhWWkdWRkVWNlpneTBmRitoYmFTdDNnUEhkQVowekQzZXpG?=
 =?utf-8?B?ZHVkM0ZtSDJCckJlcUI2R1czcGV0MzdjQ0E5N1o2UDRDMEd1VEtEVEJFTzJs?=
 =?utf-8?B?SU4vSXFXaEJvTkZ5OEhTYXVDVU02SjBTc3VqaUNjdXhBTXZ2VWdvTTJ0U1FS?=
 =?utf-8?B?TzArNDBQTHRHYll0SmNrRE9DMVpyeDhQeDdhODh6bjlNNDViT0R6b3gyenBt?=
 =?utf-8?B?bWJldXlhMnJpVk0rNFVVQmRLTkVWM1lqV3Biclp1UkRudmx4M1JNWk54V1la?=
 =?utf-8?B?Qk5aNk1JbU5BamZ2dGNwU1pUeTRreUhqaHVPQTFFOFlTUmdTajViN2tHSG9n?=
 =?utf-8?B?YXlubkZCcVR6UXJwUXYyWThRZFhKT1g1YU5pcVlucHZUdnN4UHJtZE4rdHd5?=
 =?utf-8?B?QzNDOHp0T0ViYW95SnExcXl6dlR4M25kQzhxaHZ6QnY4MWZXS21nUTJzc3Qr?=
 =?utf-8?B?SGd5SHk2eXlJeUxJSVEzM25haGRwY0pRd3ozWWYzbUhMRjVYK1VkZTYwVUkw?=
 =?utf-8?B?SEJ4aDZ6aUZiOXI5UnhaVER3anZQRFNiSytDZlkwYnFXYVIvMnR5NHl4Vity?=
 =?utf-8?B?WERIQTlUTTZuVWQwV1hyN0hNbm9iR0p0N3g5Q2QrQmtnUDFjbzlHSGl4YlNm?=
 =?utf-8?B?dXVIMVprdmVuakFvTmNhVWdhbHlYaFlXTmRwUnNOVjFjR1FpTGR1NUxuQVZz?=
 =?utf-8?B?Sjdtd012bHJiT3JkYXkxWktWT2huYnhWazFoUHhtbDJYLzk0WFJwaGRQUkVj?=
 =?utf-8?B?ZUlBVERkWUhFOEZ0VWhidkp1TVFjZ2tFMUN2WWM1T0Z4WU1JWFV3ZXE2cFh5?=
 =?utf-8?B?UVo1aXdoMWY0K0J6VXBOUmNuSGE5dGpEaEtXR2REZHhZZ0FocWdFZHdYSXFX?=
 =?utf-8?B?U3dWbHgvdXFBa2VmNGV5NVpBV1RQMFErR2hlM3dycHlzTmdOaFRpRXozOG5x?=
 =?utf-8?B?VXAwb1NjQjBOdVduMjZRSlA1N3A3Q0xJTEM3VStlOWptL2cramRwb1h1MnVs?=
 =?utf-8?B?SGFqOVAwR3B3SVZ3eHNiNzg1K21keTZSOCtwdFY3TDYrSk56S2hQdTRYOFI4?=
 =?utf-8?B?d251MWdHY1dPUVRxbnhPU0xlQXlNanNyT0xHNDdiT053aG50elpmaUxIbkUx?=
 =?utf-8?B?QzdWRXZBYktvK1JpazVXOUhiZ3FKZ2tQd0dPZ2VJRzNHSFY1eUR4a1UzVzlm?=
 =?utf-8?B?SHpXYi9BRk53TXpzRGY5aXJTeFd5ZGtSSjMrSXV2SjBBUmF5YUhmMDVkUXFZ?=
 =?utf-8?B?b2FtMEJVSDMvTTdOcjVYTElucy9RK3BSZjFrZy9ZWHB0aFVjSWZ6TmQ4blI0?=
 =?utf-8?B?TUliUkhPTTBjZnBTMnZzRS9wczh1MHNyVUVoaFRpaUtTcGhDU3JCOHgxN1NQ?=
 =?utf-8?B?OGJlTTdBVVhmK1YyOE5OQ2hOMjhjekdSbnEyYnpFVHlKSGQ3NWhXSURndDRo?=
 =?utf-8?B?N3VsejRaOEpmM0hKdWpHZFQ0WXpDbEhsZVk1aXVyN2Q1NUFJTjZSaExmSHRQ?=
 =?utf-8?B?V1lZVlQzZnBIUE9vaGEzNHFyQklmRndWcXdNVWVxTXpiRTFGNWFBUXRIbVNv?=
 =?utf-8?Q?FTcV4F9Q5iCSBhs6L7KNMGk4Qk/Ha6qXT0+pIFKyls=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC719493D085FE4F9B323B9D64355170@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2731.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f9a4ce-bf07-4760-68aa-08d9f156495f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 14:11:54.9325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clfdLLCW2M/LsxM3nc3DH5EGQIt7/M2GrNn/ZBljufgOF9DBY/YZC30zl+CXAwND3fHeORIHkA61nrwNP98AzLdkUmO1Rht7o6hLAJvjN0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4307
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTAyLTE2IGF0IDEyOjA3ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFdlZCwgRmViIDE2LCAyMDIyIGF0IDA5OjM2OjAyQU0gKzAwMDAsIEhvZ2FuZGVyLCBK
b3VuaSB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjItMDItMTYgYXQgMTA6NTAgKzAyMDAsIFZpbGxl
IFN5cmrDpGzDpCB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgRmViIDE1LCAyMDIyIGF0IDExOjIxOjU0
QU0gKzA1MzAsIFJhbWFsaW5nYW0gQyB3cm90ZToNCj4gPiA+ID4gRnJvbTogSm91bmkgSMO2Z2Fu
ZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gPiA+IA0KPiA+ID4gPiBDdXJyZW50
bHkgSUNMX1BIWV9NSVNDIG1hY3JvIGlzIHJldHVybmluZyBvZmZzZXQgMHg2NEMxMCBmb3INCj4g
PiA+ID4gUEhZX0UNCj4gPiA+ID4gcG9ydC4gQ29ycmVjdCBvZmZzZXQgaXMgMHg2NEMxNC4NCj4g
PiA+IA0KPiA+ID4gV2h5IGlzIGl0IFBIWV9FIGFuZCBub3QgUEhZX0Y/DQo+ID4gDQo+ID4gVGhp
cyBpcyBhIHZhbGlkIHF1ZXN0aW9uLiBJdCBzZWVtcyB3ZSBoYXZlIGZvbGxvd2VkDQo+ID4gaW50
ZWxfcGh5X2lzX3NucHMoKQ0KPiA+IGhlcmU6DQo+ID4gDQo+ID4gLy8gc25pcA0KPiA+IGVsc2Ug
aWYgKElTX0RHMihkZXZfcHJpdikpDQo+ID4gCQkvKg0KPiA+IAkJICogQWxsIGZvdXIgImNvbWJv
IiBwb3J0cyBhbmQgdGhlIFRDMSBwb3J0IChQSFkgRSkgdXNlDQo+ID4gCQkgKiBTeW5vcHNpcyBQ
SFlzLg0KPiA+IAkJICovDQo+ID4gCQlyZXR1cm4gcGh5IDw9IFBIWV9FOw0KPiA+IC8vIHNuaXAN
Cj4gPiANCj4gPiBBY2NvcmRpbmcgdG8gc3BlYyBwb3J0IEUgaXMgIk5vIGNvbm5lY3Rpb24iLiBC
ZXR0ZXIgcGxhY2UgdG8gZml4DQo+ID4gdGhpcw0KPiA+IGNvdWxkIGJlIGludGVsX3BoeV9pc19z
bnBzKCkgaXRzZWxmPw0KPiANCj4gSSB0aGluayB0aGUgY3J1Y2lhbCBxdWVzdGlvbiBpcyB3aGVy
ZSBhcmUgYWxsIHRoZSBwbGFjZXMgdGhhdA0KPiB0aGUgcmVzdWx0cyBvZiBpbnRlbF9wb3J0X3Rv
X3BoeSgpIGdldCB1c2VkLg0KPiANCj4gSSBkbyBzZWUgdGhhdCBmb3IgYWxsIHRoZSBhY3R1YWwg
c25wcyBwaHkgcmVnaXN0ZXJzIHdlDQo+IGRvIHdhbnQgUEhZX0UsIGJ1dCBtYXliZSBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gaGF2ZSBhIGxvY2FsDQo+IFNOUFNfUEhZIGVudW0ganVzdCBmb3IgaW50
ZWxfc25wc19waHkuYywgYW5kIGxlYXZlIHRoZSBvdGhlcg0KPiBwaHkgdGhpbmcgZm9yIGV2ZXJ5
dGhpbmcgZWxzZT8NCj4gDQo+IE5vdCBzdXJlIGlmIHRoZXJlIGlzIHNvbWUgb3RoZXIgcmVnaXN0
ZXIgd2UgaW5kZXggd2l0aCB0aGUNCj4gcGh5IHRoYXQgc3BlY2lmaWNhbGx5IHdhbnRzIFBIWV9F
Pw0KDQpJIHdlbnQgdGhyb3VnaCByZWdpc3RlcnMgYWNjZXNzZXMgaW4gaW50ZWxfc25wc19waHku
Yy4gSXQgaXMgYWN0dWFsbHkNCm9ubHkgdGhpcyBvbmUgcmVnaXN0ZXIgd2hpY2ggb2Zmc2V0IGlz
IHdyb25nIHdpdGggUEhZX0UuIEV2ZXJ5dGhpbmcNCmVsc2Ugc2VlbXMgdG8gYmUgYXNzdW1pbmcg
UEhZX0UgaW5jbHVkaW5nIHRob3NlIFNOUFNfKiByZWdpc3RlcnMgKGFzDQp5b3UgbWVudGlvbmVk
KS4gSSdtIHN0YXJ0aW5nIHRvIHRoaW5rIGl0IHdvdWxkIGJlIG92ZXJraWxsIHRvIG9wZW4gdXAN
CnRoaXMgcGh5IGVudW0gZm9yIHRoaXMgcHVycG9zZS4gSSB3b3VsZCBwcm9wb3NlIHRvIHN0aWNr
IHdpdGggY3VycmVudA0KcGF0Y2guIE1heWJlIGp1c3QgdXBkYXRlIGNvbW1pdCBtZXNzYWdlLiBX
aGF0IGRvIHlvdSB0aGluaz8NCg0KPiANCj4gQWxzbyBpdCBraW5kYSBsb29rcyB0byBtZSBsaWtl
IGZvciBWQlQgcG9ydCBtYXBwaW5nIHdlIGFsc28NCj4gd2FudCBQSFlfRiBlc3NlbnRpYWxseSBz
aW5jZSB0aGUgbW9kZXJuIHBsYXRmb3JtcyBtYWtlIHRoZQ0KPiBWQlQgcG9ydCBtYXBwaW5nIFBI
WSBiYXNlZCBhbmQgeGVscGRfcG9ydF9tYXBwaW5nKCkgdXNlcw0KPiBQT1JUX1RDMTwtPkRWT19Q
T1JUXypGLiBOb3QgdGhhdCB3ZSBhY3R1YWxseSB1c2UgZW51bSBwaHkNCj4gaW4gdGhlIFZCVCBj
b2RlIGF0bSwgYnV0IEknbSB0aGlua2luZyB3ZSBwcm9iYWJseSBzaG91bGQNCj4gc2luY2UgaXQg
bWlnaHQgYWxsb3cgdXMgdG8gZ2V0IHJpZCBvZiBhbGwgdGhvc2UgZGlmZmVyZW50DQo+IG1hcHBp
bmcgdGFibGVzLiBUaG91Z2ggdGhlIHdob2xlIGludGVsX3BvcnRfdG9fcGh5KCkNCj4gZGlzYXN0
ZXIgbmVlZHMgdG8gZ2V0IGNsZWFuZWQgdXAgZmlyc3QgSU1PLg0KPiANCg0KQlIsDQoNCkpvdW5p
IEjDtmdhbmRlcg0K
