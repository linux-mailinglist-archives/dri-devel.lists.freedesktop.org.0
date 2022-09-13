Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5875B6BE6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 12:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E94410E69A;
	Tue, 13 Sep 2022 10:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3445410E69A;
 Tue, 13 Sep 2022 10:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663066061; x=1694602061;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NDj7mIVUGa4en93pWQYD8X+KVlcjE3IWQqmBrxQFe54=;
 b=LnZvkm0GnoUSVndpKEfzTBWTYzFSyPKtAkN5dg9mWNpmgBWCw2VqN4+t
 plRDo/K1Oq+SduxTxCCNycScMdx0WDNYrFS1yCFEiXGx5VnIFUTVc1NhQ
 t3DntlVxCOfeDZM6luZEBlMcwZtLAK3UlRxqGy0iMDVhNxp0Xy2tveUeD
 yJeYXfrdycbBDO5NmzIOdt9XNibAfuHqVGxyStsNvuezT+Xj5yRlxjVUW
 DIPL95bvcAVOT0KPrwSB7Hs9WxG160n4GNogDeP3FLiVhjrjd5DN2yhZf
 /8U/JY/ZNymDsM9Q+18hTWANMteYN2LF+xVCvQ1LtVL3r28WHqAJYEaUk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="298108154"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="298108154"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 03:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="945012870"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 13 Sep 2022 03:47:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 03:47:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 13 Sep 2022 03:47:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 13 Sep 2022 03:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7IHWJyqhEX6TkXx9MC+9UDPkEHa8VTpXoH8pfGACYxNt8dBvEORmJvr0X1aDsXPoE9Mr2qAPjlIPRcQy2jP1bxED+7FXeCPLGPceG9tYSOYIiYxRRT6nmnMyqral9NnsFB5SV3gtlbkkCrw68fiajSI6R0BD5F1FleYNbzAlTiwIwebBSCQum86lRgPsgsJcTKzSC3F7NQSg4RdN4k94TEXZsKt8zGKSCeQ8B3W9muuFtn79++GlRTFvB6P1QESQUOgviqC8M3hkuR5k4542vHea36MrlRZ8iY2KWZvwV8mETHj18Oa63/nH4TYXmDC42FIO6r67PiZ4BvgNMMnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDj7mIVUGa4en93pWQYD8X+KVlcjE3IWQqmBrxQFe54=;
 b=NVYnSnoJvyYJo75GL8OIOcCeyCdCf+4oj7wfoV26HI3gjLojyiiryXpNnXnrgeJwVuHUBtJPO7kA+CzSu2NgmaVwhwqunYdA897qeSa1tYf+PcVhFQWpyXFlP7ymF+4jVQORScBiFcP3uFCW2o/opLlz9oRbJmHLTXbzGRjBFOIAS3Axliq4Mmik1nntvfkd3toEAHLk+oCUapnSXUhhXT2vzdHifr5CupZJCDGcDUI7kRkpd8V5qfOUWBqXQl1i1gIRSY2z41TDcaJBI6IsV31bEkqbStCohQptcm35zyRCXlR398NOJb0tD9B9QGGp/em4vmj8+Su6pRhVbWjVmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW3PR11MB4683.namprd11.prod.outlook.com (2603:10b6:303:5c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Tue, 13 Sep 2022 10:47:25 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bc57:8e8c:b573:5365]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bc57:8e8c:b573:5365%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 10:47:25 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 0/4] Fixes for damage clips handling
Thread-Topic: [PATCH v2 0/4] Fixes for damage clips handling
Thread-Index: AQHYtuPWPzuiM0Fvf02dyZI4WCXTOa3dMdQAgAAcxoA=
Date: Tue, 13 Sep 2022 10:47:24 +0000
Message-ID: <f3ffd5df9d48222e459ff091961ea4ea7c4a411f.camel@intel.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <YyBHkmeIy5VD36u1@intel.com>
In-Reply-To: <YyBHkmeIy5VD36u1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW3PR11MB4683:EE_
x-ms-office365-filtering-correlation-id: 50befc47-03e8-4aec-45e4-08da95755838
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z3MtAl4aYh/Z1XW0IDvEzUQ9m5IIDlJk6az/8UO9PqMbv8EPkFsMcCJGnL9lTlO/HJnRSZvahGDGSruGMei4pqoyoW6hlOZurfoyf/RvVeOF1Ox9vjFIJmcbOtGwfsH04ilhCv+4tF0IZ4UmqrnIhA3w1oRxqxGCugK3+6woIy7aOD7FyjRL2KND7AjVIPBlrY8yfgElVkN1UvjIXNOLK6rX76MaJMZrbtAWoMT+yNl6AVBxTo4Yvv5yqZg3ncllN8haT8JDiROxVDYQFpojluoInz4LiPb89hesJ0bcU+LRLQHUOlwCvP+h93O57AiU+nea1+UUlOS3K5w31yB8R42C58cbJXxtmicOzLw4DNCUWzPxiTElsPrMUnBaPHegfV3OzeLCADpx1bwHAVqqbkz1gpJWuOMpF0qXRpZ/nuOHGjjlo8kDl/xwmjb2vPAUmlLTjb+cma9wDDCB+p1I0LuioH0Fe43B5Dma4WVl0YhqGHTIqbXJi1cqRf7BAHSLkzARvM2bOLcxDRPnv6wvOS663nT+dLTETingFfyXk2c+hM+ajNc5Y2sJ0ayZ5m7WO5R4pJKvqr1C6HeNktrQjTohCfrsgdV68K9MYnBOMThWyyYWFQLTFT9Z45Kf54dLOfAu6TCSex+If+AuM5Qh/vw3dUvZ/+BkqcPPDS2yLUYFQMCddLio7pD9Rq91I/IV7ln/HAAKq37TckvEvfifQ5Gbql7oGqgPS3oaoHQJ/KtFfEyNBvYRQiVKW+0g2IdEsnlhrVk0REOEfL4LTIRQQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199015)(186003)(6486002)(86362001)(316002)(41300700001)(64756008)(36756003)(71200400001)(478600001)(91956017)(66574015)(122000001)(8936002)(83380400001)(54906003)(6916009)(38100700002)(4326008)(66446008)(76116006)(66556008)(6506007)(6512007)(2616005)(5660300002)(66946007)(26005)(82960400001)(8676002)(66476007)(38070700005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlVBSWYzZVZ3cWd1QXIwMmppYmVvWk1FMUt3Y2JQdEZ6VDYrNjBOdGcwdmJM?=
 =?utf-8?B?UVIzbjFOM3BSdUg3UmRWWW0rWXJvbUh3UGl6VjZzV29Ga1JzdTIrckdzbktO?=
 =?utf-8?B?NmtSZEpWZFpHci9JOUM3SkhRWjVLRklxaVUvMVpJR1FmaXRsR0YzTHVkR3lh?=
 =?utf-8?B?eElncXNjSi8vdkNNejFSZW9vTHZxYVRSWEdQVXVyVzlnWW9jeTFVWkxZRFJO?=
 =?utf-8?B?MmVaclVMakVNWHhtTGhFQVhWQUZXMmFaM2NmQTl4aTh2U29Sd1hpM1c0SlBq?=
 =?utf-8?B?aGZQTlhwTjJreC9rd1hUTDRPcGJLY3lpYnJsdzJYcGE4OTFkaWp3cmF4T2FN?=
 =?utf-8?B?dldXbFAxSm5XVDl0bGVuUUdIUXNmVklSR2t2RnZybUJUbEJlUUpMSHdSNytF?=
 =?utf-8?B?WXRNaWxFaVpqQmJ0Nnhoc2tBOUdzOUJGTEFYOTN5aHlhM0x2VGdPb1ZFVTFq?=
 =?utf-8?B?a292KzFPRW1PazdrRGt2c0gzNHpoYVFBZXM3eFRJdTd6QkxYL3NGNUFBSlR6?=
 =?utf-8?B?L3RyWnBzcm16RWRCMW5hL0l2cFBDc0IxdjZkT3Nrcm11a1VxcFc4b3B5aDMy?=
 =?utf-8?B?eXNRcE81di9EZTJ3K05xQUR4TDExSWo1WFBwTWtVZXpNK2o5Ump4QmN0Y3VZ?=
 =?utf-8?B?KzNCb2wxb1ZmOG9NK3dVUWFVM1V1UktZVmE3c0Uxa3djQW5DaVhhdlJSWnZ6?=
 =?utf-8?B?OVVwQjh0NDIwYUxKK1lpTk1haE9YdUVaR2FTYWVaMHhHVGVBSGw5eFJ2Z0hu?=
 =?utf-8?B?SmtjcHFjVmY3ZkUwM2tzSTZGS3g5MDlJWk9PcjVFUjZTcW04UytKbGRlQ2hG?=
 =?utf-8?B?VkNjQTFjcC9Xc2k1SFlkci9sQTdGL2JqcElhb0FDaVNqSU4rRDRxZGc5bUti?=
 =?utf-8?B?WUJXaXpyV3pQRXA0cWZBRnlJY2tZbzJmaDFSVXNOMmkramprWnl6WmtEeE1k?=
 =?utf-8?B?aDBZdm16MkhaTXBTQ2VIK3NpdlhtcTduKzFhTnRkSnZwdFlHeENpTVBMdmtr?=
 =?utf-8?B?cHowV2hIRHlDWFBZVVcvUXRjMUcrY3FWanlYdS9DRGFpZkppQitsdnZnbGxr?=
 =?utf-8?B?cnJoNFNwKzNsVm13TjhuOWh1WnZzdFJpalNIQmkyN2pnM2FjeHF0Rk1kUUhG?=
 =?utf-8?B?UVRtWU5OcHpmWHJheHpUSW9NN0JIR29IODVhTlJFd0l1d0ozSEdySnByOVBQ?=
 =?utf-8?B?M0hINXE2eG00VVdiS2NNU0llbDB1OEwxd0VVbm5aR1FWS29aQk1vTnNTOW5o?=
 =?utf-8?B?Sk15czN0Z3Z0cHdJdU94OXNCMG0vT0JNdktXR3V6MUpneCtuTWtmclZka1Ba?=
 =?utf-8?B?bmF3cEw3Zk1Gc0pDYVhaWmpiUjRvVkxIMERCRFdad21CL0FGSmIvQkRpSTgw?=
 =?utf-8?B?aFh6WVFvdWRnUnV2Z1ppV2tLUTJLa2lINWttbDVybm9LaHhic0g2OVJkZHJs?=
 =?utf-8?B?MG1xN0xNMjl0OHBlRkNSM1RLTTRTWXp5bHFYZ2RSdjJkTU1xdHBITWFqd2Er?=
 =?utf-8?B?QUJja25UUVJSTFpWV3VZKzlKY3VoNHNhRE1neDRwRGhhSFMrK0l3UzN2UkRL?=
 =?utf-8?B?d3lyME5GbUJDNDVzMSszM0E1OFpVRnpiUmt6TXNnTG1iWlJFNktpbEZOS0NB?=
 =?utf-8?B?WkxHcHJLdjhmT1FvVzA5VUVRL1N2a3Z3USsrdk52aVdHT21PMHpnTUR6UEMw?=
 =?utf-8?B?R0NhSjhOZXgvYnV6N2ZodTdGUEhWTDhRZFYrblVDWUh0c0VWREFicmxrdXh3?=
 =?utf-8?B?Y2w0a1RpMjg1S3JZdVJFZVc1Ykt0ZWZyQXdUNTc1aDdKdWRKcGNmSzRtVThP?=
 =?utf-8?B?ZTRXVXJDYWlRaFFPVlh1MFBpZkwzVXFDMnFpeW9Kd0F6OEJkcXI4VWd6c0pO?=
 =?utf-8?B?V3crNnBZSWNHWFpsc0w1aWRvbHNpZ1FianprWXZmRVduS3VseWRtVlJlNktO?=
 =?utf-8?B?RjYyaHJwbFFrZ3pJdUlnMHlHZUpCdXNKTnBMeWVJVHBQc2djZzFLcWZ5Qk1a?=
 =?utf-8?B?YWRNUzhiZzRJN1Nza2ZQNjFlak40NUJ3QkNNTGlvc1NXRVdjZnZDSnhFOSsw?=
 =?utf-8?B?bGdmWkx1TE5JZDF0TWtrSUdpSzIwMStvRk9TZHpzNUU1Uml6SlhTTk91ZWVl?=
 =?utf-8?B?OVdrMWREekJvMkdOTGliWXRrL0h6R3JuUThmNGQ0SVA3Mkg4WEhPRmIvRGlR?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59A5793795D9DB4B9FC807DBD014C250@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50befc47-03e8-4aec-45e4-08da95755838
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 10:47:24.9673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8bDrWWONABaOfyE53ZCbdYimxhGPNu24bhshnx+OfcNbCS4sZCN7/JjiZl2X3Z2vc94V/4ZuCVUQpsVyaXLq+wAM9GJrMTKmTrN0zow7XIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4683
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>, "Souza,
 Jose" <jose.souza@intel.com>, "Kahola, Mika" <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA5LTEzIGF0IDEyOjA0ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFR1ZSwgQXVnIDIzLCAyMDIyIGF0IDAyOjI5OjE2UE0gKzAzMDAsIEpvdW5pIEjDtmdh
bmRlciB3cm90ZToNCj4gPiBDdXJyZW50bHkgZGFtYWdlIGNsaXBzIGhhbmRsaW5nIGlzIGJyb2tl
biBmb3IgcGxhbmVzIHdoZW4gdXNpbmcgYmlnDQo+ID4gZnJhbWVidWZmZXIgKyBvZmZzZXQgaW4g
Y2FzZSBrbXMgZHJpdmVyIGFkanVzdHMgZHJtX3BsYW5lX3N0YXRlLnNyYw0KPiA+IGNvb3Jkcy4g
VGhpcyBpcyBiZWNhdXNlIGRhbWFnZSBjbGlwcyBhcmUgdXNpbmcgY29vcmRzIHJlbGF0aXZlIHRv
DQo+ID4gb3JpZ2luYWwgY29vcmRzIGZyb20gdXNlci1zcGFjZS4NCj4gPiANCj4gPiBUaGlzIHBh
dGNoc2V0IGlzIGZpeGluZyB0aGlzIGJ5IHVzaW5nIG9yaWdpbmFsDQo+ID4gY29vcmRzIGZyb20g
dXNlci1zcGFjZSBpbnN0ZWFkIG9mIGRybV9wbGFuZV9zdGF0ZS5zcmMgd2hlbg0KPiA+IGl0ZXJh
dGluZw0KPiA+IGRhbWFnZV9jbGlwcy4NCj4gPiANCj4gPiB2MjogTW9kaWZ5IGRybSB1bml0IHRl
c3RzIGFjY29yZGluZ2x5DQo+ID4gDQo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+DQo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+DQo+ID4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRl
bC5jb20+DQo+ID4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+DQo+ID4gQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KPiA+IENjOiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiA+IENj
OiBNYcOtcmEgQ2FuYWwgPG1haXJhY2FuYWxAcmlzZXVwLm5ldD4NCj4gPiANCj4gPiBKb3VuaSBI
w7ZnYW5kZXIgKDQpOg0KPiA+IMKgIGRybTogVXNlIG9yaWdpbmFsIHNyYyByZWN0IHdoaWxlIGlu
aXRpYWxpemluZyBkYW1hZ2UgaXRlcmF0b3INCj4gPiDCoCBkcm0vaTkxNS9kaXNwbGF5OiBVc2Ug
b3JpZ2luYWwgc3JjIGluIHBzcjIgc2VsIGZldGNoIGFyZWENCj4gPiBjYWxjdWxhdGlvbg0KPiA+
IMKgIGRybS9pOTE1L2Rpc3BsYXk6IFVzZSBkcm0gaGVscGVyIGluc3RlYWQgb2Ygb3duIGxvb3Ag
Zm9yIGRhbWFnZQ0KPiA+IGNsaXBzDQo+ID4gwqAgZHJtL3Rlc3RzOiBTZXQgYWxzbyBtb2NrIHBs
YW5lIHNyY194LCBzcmNfeSwgc3JjX3cgYW5kIHNyY19oDQo+IA0KPiBEbyB0aGVzZSBuZWVkIHRv
IGJlIGFwcGxpZWQgaW50byB0aGUgc2FtZSB0cmVlLCBvciBjYW4NCj4gdGhlIGRybSB2cy4gaTkx
NSBzdHVmZiBnbyBpbiBzZXBhcmF0ZWx5Pw0KDQpQYXRjaCAxIGFuZCAyIGFyZSBuZWVkZWQgdG8g
Zml4IHRoYXQgYmlnZmIgaGFuZGxpbmcgZm9yIGk5MTUuIFBhdGNoIDQNCmlzIGFsc28gbmVlZGVk
IHRvIHByZXZlbnQgYnJlYWtpbmcgdGVzdHMuIFBhdGNoIDMgaXMgbW9yZSBsaWtlIGNsZWFudXAu
DQoNCkkgdGhpbmsgaTkxNSBwYXRjaGVzIGNvdWxkIGdvIHZpYSBpOTE1IHRyZWUuIFRoaXMganVz
dCBtZWFucyB0aGF0IGk5MTUNCmJpZ2ZiIGhhbmRsaW5nIGlzbid0IGZpeGVkIGJ5IGVpdGhlciBv
ZiB0aGUgc2V0cyBhbG9uZS4NCiANCj4gDQo+ID4gDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vZHJt
X2RhbWFnZV9oZWxwZXIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTEgKysrKysrLS0tLQ0KPiA+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuY8KgwqDCoMKgwqAgfCAy
MCArKysrKysrLS0tLS0tLS0NCj4gPiAtLS0tDQo+ID4gwqAuLi4vZ3B1L2RybS90ZXN0cy9kcm1f
ZGFtYWdlX2hlbHBlcl90ZXN0LmPCoMKgwqAgfMKgIDUgKysrKysNCj4gPiDCoDMgZmlsZXMgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gLS0gDQo+
ID4gMi4zNC4xDQo+IA0KDQo=
