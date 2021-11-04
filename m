Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F654455B7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 15:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378356E439;
	Thu,  4 Nov 2021 14:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793C36E40D;
 Thu,  4 Nov 2021 14:51:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="295163173"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="295163173"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 07:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="667934198"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 04 Nov 2021 07:51:30 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 4 Nov 2021 07:51:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 4 Nov 2021 07:51:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 4 Nov 2021 07:51:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSf9G0PXLdskqUfGi0u8wErj/N/ViO7sUw0z3HtJkKa6khN0r323kzD01uRjUekFs5QVD3Iq8SNvjKASC8O4IkI/cufKXBtEl227GNXWLoljL1CNgeR6sfWU+gyK860lAKZop+JhUeKbG8knFlx4qcMyjw2Z8J2Ef1MiEes/HVDTTAThNi+P/WEarL9su/XaHKwn+dW4ZGP5RnClnJduiEZ2L+ofieRNuu428Tw9Nv5kiAWfX/9J1fAobspADMnJdbgEIVKlBHXrjgJ6dxOYyZhOScZ92SXMOJNuE+b2uN4kl01HbB/JP/FiomlpphSPZj8FPWvM4dijCtjpZ2IW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ND3dkwpQYsdbxNZTdybZZarCqBu4iZ+GCYVWg3ImYc=;
 b=CIgh+628OK+CSvBmkzn65jQCXFTCWxixBC+3HdWCzPxA/2Axbe6f6+AxTlEimMw7xgG1/Msysz9ZQFqzJaHWwFjlX23AbJdp1eBBG1PNoxV6J3a5t+Isrwo7/V9vdhDWIoBnNYTqLwfGJLJEbLgS/HSQ97udPAfsVw2t8fhSq+etcbYK0niGhPXa7V92jQ2QiKsWKw8G2AVNFsENQ4ThaFiRjbgS/fM+KZuF2JtKv5ugkPR5WSFbGE5dOkQHFnALnGvD9a4SD+yhD/UP+gofZEw4wgvIvDIKyYPI6Ip84ls8wSUwW04oKeKNr8KNzLofWdIXo0OtYWcglKVXrPLGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ND3dkwpQYsdbxNZTdybZZarCqBu4iZ+GCYVWg3ImYc=;
 b=WWqkB0dc7TNIgumz1kbryrJZ9ZPc4B2mv/NPdsEHSDbFqZ19dy0pJbEe23XzVjX08rbeLesoHB7cYzVgWj9/bjo6fTREs2y6z3wvSBS8WG1lA7CztRL3fKHj8LGo3DJrNetrVAJzt9+TtGT8gLh5oC8y9Kh/prxK7owbHXH/150=
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB2940.namprd11.prod.outlook.com (2603:10b6:5:6a::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17; Thu, 4 Nov 2021 14:51:28 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d%3]) with mapi id 15.20.4649.021; Thu, 4 Nov 2021
 14:51:28 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Christoph Hellwig
 <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: refactor the i915 GVT support and move to the modern mdev API v2
Thread-Topic: refactor the i915 GVT support and move to the modern mdev API v2
Thread-Index: AQHXz7gr2P/h6GA0bkS25mkWl+8GUqvzWB0AgAAa+CA=
Date: Thu, 4 Nov 2021 14:51:28 +0000
Message-ID: <DM4PR11MB554905AC416FBD055251DE43CA8D9@DM4PR11MB5549.namprd11.prod.outlook.com>
References: <20211102070601.155501-1-hch@lst.de>
 <163603075885.4807.880888219859400958@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <163603075885.4807.880888219859400958@jlahtine-mobl.ger.corp.intel.com>
Accept-Language: en-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3b708f0-9e57-4319-2b28-08d99fa2953c
x-ms-traffictypediagnostic: DM6PR11MB2940:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB29408F1E54935C6123199943CA8D9@DM6PR11MB2940.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1n2vnzGbAllfDlv/Eli5xkh5MMRVKqpqRpuPTg8JQtSd/ACXQAI840qCVZ9y4TE2S2Yy6rflFpC7uBUDqO/ldUmEidJb6rYju8tGt3al5DCYxRcN2bWHtHhq+j8wRDJ2nYL7stX4Pfdwdg9FlcPJAeApWcb5RzDSMQ+2R/4htihe/8RR1VfhNAJd4CpGCr97ly23NyiB3FjphRczSnFs0eE8HtKUq0u3/95+7jknXOg1ztDxbiRSgqcCFEOlzy2tku2+yxuj21z6H//QenCc0G/QCYY2VkSaXwdcZwa+Wgs04m/ABxPGJ2499uZJBEZ7fbqi5EDsoAoPBa45MIO86WHZhKv9hhpWA/t6HsCA0w72ROCUQLPEfDgi6X0kDo3ho1clqr6mAkHNFSS4Zimz0UA4FWjV4sH9GU9+QD3eulQc5CIUN3o4LC/b3KKFoFlKau8AsRj+dq96azn3L1awq/h108GC7Dyy6HHaT9FFHZZRcscBULcsUDXqM4QQD6XVP//urV9AzYnmK5u9eKa9IQ9y4sakvPXLUPKh+uJUCW1XcashhjGXTGTdjriW8vwFZAUBSwLDKzsZUBcv1X2FmqeJFs0dYmm56LxTIgMw0j1deAJjkAgcCVd85fhviOg6eHJyVAt8mq7fC3cq/QH94wyufKR6g0vLHbpMwl+nZcrmg1ZuSOBRwurB7v3GcP3Q4VOoANCTiGOxdRxZPQhOw6WrEALqvbjSAfCtVwG/qxiVTrnd2u4tkRMeOhQ+kiSKlQVRPuKD1MEWup2zHO/rAnKSCkq9Du0Lpw4nTRjlfC8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(76116006)(508600001)(966005)(66476007)(2906002)(83380400001)(4326008)(5660300002)(186003)(8676002)(66946007)(55016002)(66446008)(64756008)(6506007)(316002)(54906003)(110136005)(9686003)(7696005)(26005)(53546011)(66556008)(8936002)(86362001)(71200400001)(122000001)(38100700002)(52536014)(33656002)(82960400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0NldGlFYmhFMllyL25MU2ZEU25EMWVvbER6YlNaS1l4SVJPZkJBZGJNVlBU?=
 =?utf-8?B?RXdidDV5ZGJUZ2g4b2x4QU9aYkJYZWtQUW5YcEZzcytFeVJ4UTZSN1plRFlr?=
 =?utf-8?B?UFBoNzhKSFREN3h4a1NQT0MwL3lKeGpmWi9lWVVxdEF1TWdKV1NNeCtuUFJX?=
 =?utf-8?B?VjloRXMvSlFWZTdkN1liM1F6Tjlwb3FYRUVKT3Q1dURZdXhEUUE0YW1GRlRH?=
 =?utf-8?B?dUFIMWNaelJmSGZGTzB4R2F4eEpkRUd2L2ZjUFVUWGRDdmtWb3hJN0FiZkQx?=
 =?utf-8?B?TVlQWGNoUHFrdzJwcmRwYm1SdlVPVWVhMW55YnhOVkhqTTdPSDJOaXhhWVRr?=
 =?utf-8?B?eUtHVzlyNEdtVnI2MDV0VjU0aStkT0ZyemxZYlUrblJrUTZLVmltVHByNHZz?=
 =?utf-8?B?em0rRnNEVnVScUQ2QmRYU243KzFkbUJqcEZSWnBTa3NjZGVmNzBSNWw1emlZ?=
 =?utf-8?B?c1JxSHM5SENsd3dkb1RnWm9ra1BoNyt2ekVsYk5Xc0xOSHZSekJIQzJ3dzRV?=
 =?utf-8?B?cnBSSmVKclZ4eFJ3V3ZJNXpPZ0hvS0huc0k2cUtnTk5OU0lRSE5tam9wc09q?=
 =?utf-8?B?My9NYkh4T3NqUDZzbU53VjhWMm85c015VDBtL0xiYWo3UTR4TXZja0VmSW1i?=
 =?utf-8?B?YW5BRFlSU3NVTTBZNVBSZEh0VGhSWUxGWnhxRmo0VUhRUUZQSmkxSDE3RVZG?=
 =?utf-8?B?YTZNSEhTeTludkEyZ3pJc1UrYnlGOWJlNGhzUTVnZXdIWmZYSHU2Unp2VXlX?=
 =?utf-8?B?dGRLU2NiR1J4TTM1VFI3eVVCZi9vWFhMMzVUUnQ2THNIV0R5YmJOc212WmtK?=
 =?utf-8?B?aXpObStnMUhKVXNRZUM5SFRMZWVZYUYwSythQklWTEo2WFlRM3pCVlRJckk5?=
 =?utf-8?B?YjlXcWVCR0pRQ1lJYWR3MVc1bHBsSzVSRm4xQWNsVDRTL0VyRXJudmd4Mld4?=
 =?utf-8?B?MENkb1pzWWg2QWpSOFFmNHkxMVorMDBRSXQ2dlVXNCsyam1JcGlMODllRjZz?=
 =?utf-8?B?VVlHVDRrNFBNTkl4SkdTZGpsRjJ5K1ZxQ1ZMeEgvZHdwSGM3V1RLaC9hcEk0?=
 =?utf-8?B?b2oycE1BTjl6MW1IUjBMUkJhYktiaDFhTXRCdENmS08ycVkrUTd1OUMxTjNu?=
 =?utf-8?B?YWVyRDRHZGxYdE5rL2gyTXpwR2tQTTJWRVFqVzhWa2pIWk1GcjNQRlo3NTV6?=
 =?utf-8?B?RDYyMlRyQzZLTzJOZTE4em1xTFZBdnRqUS9pejRCaXBKRWsrdWVLMFUrQ0Va?=
 =?utf-8?B?Mk56aUhNcjdFVFV3ZUI5Y1RKUmZtWEE2TzNDRlZ4OUVNaUx2RFZlZzJDbWVQ?=
 =?utf-8?B?cExrVSt5ek9nVk1TeGFpdmxYWlYwWFdDcW5rUTl5TXlSMFZmajFUQXJRNkIw?=
 =?utf-8?B?TEFoK3doa3NleHVDZ1RkRWlRN2tIUkdSOTRFZFhNYmpwWmcwaVlEMEFVWXNu?=
 =?utf-8?B?bHcrY1E3RlRQS2ZxRVZ4UXEzY2JJbC9jenZhZjNjeFR0VHZxdzErcDJMNDMz?=
 =?utf-8?B?NkRqekNVWHJReXRyL1B5OFQ1cUNURFExR0xJakM0VzBMdFczUlBCNnVJOGlh?=
 =?utf-8?B?TTYvbDJYS1k5dC9wS3lmMXJTU0F2VjdZRXIyc3NwV2NnRnIvZGJhWEdSZ2lj?=
 =?utf-8?B?UldURWs3cEVkTERVZ2N4Tkd2RUlmN1plbHdsbEczTFo0RUxDcWd5L0JKbGxB?=
 =?utf-8?B?T3hZcFhXMU1SMDFHOWd2YlhyQzI0d1NzcUZCSUxrTHNEUUNhRzQwVXRreGNP?=
 =?utf-8?B?VUlxcDhNS3hjUmVmU284L3lyU2VEVmc0Zmg0ZlZFNVAvOFJXVlpQNGRSZnJz?=
 =?utf-8?B?ZUJMRkRoTEo2OXdtN2hoQUdDV0pCUmFDQllieTZpSTZkdDhtUU84b0s2cVpv?=
 =?utf-8?B?WVIyRXFIYS92cFVQSDAxczlHYmc0RlVjallSUTh1UlFoMFpwck9qS3dkRnAw?=
 =?utf-8?B?emhBbWRiVXJrNlJ5Y3oyTFlxd0tGakVIc3gyb1RueUdDUWtySXRLN2pGS1cy?=
 =?utf-8?B?RFZSQXRjU3FuQmUrQmlBZ1ZQVkNnaTVQRzNrRkF5UU9rMzlVTnUvQkZGMDdq?=
 =?utf-8?B?NG96T0xXbW5xdFlDUy9pTnhCbUp4MlEwTWJpVWtQV3ZXSllHaWJXT2dOdXpw?=
 =?utf-8?B?d0RMYTJTMU5ndVhxeDhPMDNnSHZ6WGtreEVlaG1ESkZRLzk2QU5lUm5LdzdV?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b708f0-9e57-4319-2b28-08d99fa2953c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2021 14:51:28.5409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwgX/NcYAOX6pAwasXYfB9CBmx/ibGapri6mloVi4LN5L5iSdHB1/XQ8bEwwC1Ca8tVH1zCFTxPnpwWsGMf3bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2940
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
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9vbmFzIGFuZCBDaHJpc3RvcGg6DQoNCldlIHdlcmUgdGVzdGluZyB0aGUgcGF0Y2ggc2Vy
aWVzIHNpbmNlIE1vbmRheSBhbmQgcGxhbm5pbmcgdG8gcmVwbHkgYWZ0ZXIgd2UgZ2V0IHRoZSB0
ZXN0IHJlc3VsdC4gTW9zdGx5LCB3ZSBhcmUgY29uY2VybmVkIGFib3V0IHBhdGNoIDYgYW5kIGhv
dyBpdCB3b3VsZCBhZmZlY3QgdGhlIHRlc3QgcmVzdWx0LiBQYXRjaCA2IGNoYW5nZXMgdGhlIHRp
bWluZyBvZiBsb2FkaW5nIEdWVC1nLiBBY2NvcmRpbmcgdG8gdGhlIGRpc2N1c3Npb24gaW4gdGhl
IGxhc3QgZW1haWwsIHRoaXMgd2lsbCBicmVhayBvdXIgZGVzaWduIG9mIGdvbGRlbiBNTUlPIHNu
YXBzaG90LiBBbHNvIG1vdmluZyBHVlQtZyBjb2RlIGludG8ga3ZtZ3Qua28gcmVxdWlyZXMgdGhl
IGRpc2N1c3Npb24gb2YgZGVmaW5pbmcgYW5kIHNocmlua2luZyB0aGUgaW50ZXJmYWNlcyBiZXR3
ZWVuIGk5MTUgYW5kIGt2bWd0LiAgSSBndWVzcyB0aGUgaWRlYWwgd2F5IHRvIHRha2UgQ2hyaXN0
b3BoJ3MgcGF0Y2ggaXM6DQoNCjEpIFdlIGhhdmUgdG8gZmlndXJlIG91dCBob3cgdG8gZGVhbCB3
aXRoIGdvbGRlbiBNTUlPIHNuYXBzaG90LiBJdCdzIGEgbGl0dGxlIGJpdCBoYXJkIHRvIHRha2Ug
dGhlIHJlLWZhY3RvciBwYXRjaCBiZWZvcmUgc2V0dGxpbmcgdGhpcyBkb3duLiBJbiB0aGUgcHJl
dmlvdXMgZGlzY3Vzc2lvbiwgd2Ugd291bGQgbGlrZSB0byBmaW5kIGEgd2F5IHRvIGRvIHRoZSBz
bmFwc2hvdCBpbiBpbnRlbF9ndnQuYw0KMikgU2hyaW5rIGFuZCByZWZpbmUgdGhlIGV4cG9ydGVk
IGludGVyZmFjZXMgYmVjYXVzZSBvZiBtb3ZpbmcgdGhlIGNvZGUgaW50byBrdm1ndC5rbw0KMykg
R2V0IHBhdGNoZXMgcmV2aWV3ZWQgYW5kIG1lcmdlZC4NCg0KRm9yIDEpIEkgd2FzIHRoaW5raW5n
IHRvIHNlcGFyYXRlZCB0aGUgTU1JTyBoYW5kbGVyIHRhYmxlIGZyb20gaGFuZGxlcnMuYyBhbmQg
bGV0IGl0IGJ1aWxkIGRpZmZlcmVudCBkYXRhIHN0cnVjdHVyZXMgZGVwZW5kcyBvbiB3aGVyZSBp
dCBnb3QgcmVmZXJlbmNlZC4NCjIpIFRoYXQncyBtaWdodCByZXF1aXJlIHNvbWUgbW9yZSBkaXNj
dXNzaW9uLg0KDQpJcyBpdCBwb3NzaWJsZSB0byBzZXBhcmF0ZSB0aGUgcmVmYWN0b3IgcGFydCBm
cm9tIHRoZSB1c2luZyBuZXcgbWRldiBBUEkgc3R1ZmY/IFNvIHRoYXQgdGhlIGRlc2lnbiBvcGVu
cyBpbiB0aGUgcmUtZmFjdG9yIHBhdGNoZXMgd291bGRu4oCZdCBibG9jayB0aGUgcHJvY2VzcyBv
ZiBtZGV2IEFQSSBpbXByb3ZlbWVudD8NCg0KVGhhbmtzLA0KWmhpLg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGlu
dXguaW50ZWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA0LCAyMDIxIDI6NTkgUE0N
ClRvOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT47IEphbmkgTmlrdWxhIDxqYW5pLm5p
a3VsYUBsaW51eC5pbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPjsgWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPjsgV2FuZywgWmhpIEEg
PHpoaS5hLndhbmdAaW50ZWwuY29tPg0KQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5j
b20+OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IHJlZmFjdG9yIHRoZSBpOTE1IEdW
VCBzdXBwb3J0IGFuZCBtb3ZlIHRvIHRoZSBtb2Rlcm4gbWRldiBBUEkgdjINCg0KSGkgWmhlbnl1
IGFuZCBaaGksDQoNCkNhbiB5b3UgaGF2ZSBzb21lYm9keSBmcm9tIHRoZSBHVlQgdGVhbSB0byBy
ZXZpZXcgdGhlIHBhdGNoZXMgdGhhdCBhcmUgZnVsbHkgY29udGFpbmVkIGluIGd2dC8gPw0KDQpJ
IGFsc28gc3RhcnRlZCBkaXNjdXNzaW9uIG9uIHBhdGNoIDYgd2hpY2ggaXMgYWJvdXQgZGVmaW5p
bmcgdGhlIGludGVyZmFjZSBiZXR3ZWVuIHRoZSBtb2R1bGVzLiBJIHJlbWVtYmVyIHRoZXJlIGlz
IHByaW9yIHdvcmsgdG8gc2hyaW5rIHRoZSBpbnRlcmZhY2UuIERvIHlvdSBoYXZlIGxpbmtzIHRv
IHN1Y2ggcGF0Y2hlcz8NCg0KVGhlIG1pbmltYWwgd2Ugc2hvdWxkIGRvIGlzIHRvIGVsaW1pbmF0
ZSB0aGUgZG91YmxlIHVuZGVyc2NvcmUgcHJlZml4ZWQgZnVuY3Rpb25zLiBCdXQgSSB3b3VsZCBw
cmVmZXIgdG8gaGF2ZSB0aGUgc3ltYm9sIGV4cG9ydHMgYnkgZGVmYXVsdCBzbyB0aGF0IHdlIGNh
biBlbmFibGUgdGhlIGZ1bmN0aW9uYWxpdHkganVzdCBieSBsb2FkaW5nIHRoZSBtb2R1bGUuDQoN
ClJlZ2FyZHMsIEpvb25hcw0KDQpRdW90aW5nIENocmlzdG9waCBIZWxsd2lnICgyMDIxLTExLTAy
IDA5OjA1OjMyKQ0KPiBIaSBhbGwsDQo+IA0KPiB0aGUgR1ZUIGNvZGUgaW4gdGhlIGk5MTUgaXMg
YSBiaXQgb2YgYSBtZXNzIHJpZ2h0IG5vdyBkdWUgdG8gc3RyYW5nZSANCj4gYWJzdHJhY3Rpb25z
IGFuZCBsb3RzIG9mIGluZGlyZWN0IGNhbGxzLiAgVGhpcyBzZXJpZXMgcmVmYWN0b3JzIA0KPiB2
YXJpb3VzIGJpdHMgdG8gY2xlYW4gdGhhdCB1cC4gIFRoZSBtYWluIHVzZXIgdmlzaWJsZSBjaGFu
Z2UgaXMgdGhhdCANCj4gYWxtb3N0IGFsbCBvZiB0aGUgR1ZUIGNvZGUgbW92ZXMgb3V0IG9mIHRo
ZSBtYWluIGk5MTUgZHJpdmVyIGFuZCBpbnRvIA0KPiB0aGUga3ZtZ3QgbW9kdWxlLg0KPiANCj4g
VGVzdGVkIG9uIG15IFRoaW5rcGFkIHdpdGggYSBLYWJ5IExha2UgQ1BVIGFuZCBpbnRlZ3JhdGVk
IGdyYXBoaWNzLg0KPiANCj4gR2l0IHRyZWU6DQo+IA0KPiAgICAgZ2l0Oi8vZ2l0LmluZnJhZGVh
ZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0IGk5MTUtZ3Z0DQo+IA0KPiBHaXR3ZWI6DQo+IA0KPiAg
ICAgDQo+IGh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlzYy5naXQvc2hvcnRs
b2cvcmVmcy9oZWFkcy9pOTE1LWcNCj4gdnQNCj4gDQo+IENoYW5nZXMgc2luY2UgdjE6DQo+ICAt
IHJlYmFzZWQgb24gTGludXggNS4xNQ0KPiAgLSBhbGxvdyB0aGUga3ZtZ3Z0IG1vZHVsZSB0byBi
ZSBsb2FkZWQgYXQgYW55IHRpbWUgYW5kIHRodXMgc29sdmUNCj4gICAgdGhlIGRlYWRsb2NrIHdo
ZW4gYm90aCBpOTE1IGFtZCBrdm1ndnQgYXJlIG1vZHVsYXINCj4gIC0gaW5jbHVkZSB0aGUgY29u
dmVyc2lvbiB0byB0aGUgbW9kZXJuIG1kZXYgQVBJDQo+IA0KPiBOb3RlIHRoYXQgSSBkbyBleHBl
Y3QgdG8gcmViYXNlZCB0aGlzIGFnYWluIGFnYWluc3QgNS4xNi1yYzEgb25jZSANCj4gcmVsZWFz
ZWQsIGJ1dCBJJ2QgbGlrZSB0byBnZXQgdGhpcyBvdXQgZm9yIHJldmlldyBBU0FQLg0KPiANCj4g
RGlmZnN0YXQ6DQo+ICBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcgICAgICAgICAgfCAg
IDMzIA0KPiAgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZSAgICAgICAgIHwgICAzMSAN
Cj4gIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NmZ19zcGFjZS5jICB8ICAgODkgLS0NCj4g
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyB8ICAgIDQgDQo+ICBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyAgICAgfCAgIDM2IC0NCj4gIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2V4ZWNsaXN0LmMgICB8ICAgMTIgDQo+ICBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYyAgICAgICAgfCAgIDU1ICsNCj4gIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d2dC5oICAgICAgICB8ICAxMjUgKystDQo+ICBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9pbnRlcnJ1cHQuYyAgfCAgIDM4ICsNCj4gIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2t2bWd0LmMgICAgICB8IDEwOTkgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uYyAgICAgICB8ICAgIDQgDQo+ICBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9vcHJlZ2lvbi5jICAgfCAgMTQ4IC0tLS0NCj4gIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3BhZ2VfdHJhY2suYyB8ICAgIDggDQo+ICBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyAgfCAgIDM3IC0NCj4gIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L3RyYWNlLmggICAgICB8ICAgIDIgDQo+ICBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC92Z3B1LmMgICAgICAgfCAgIDIyIA0KPiAgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2Rydi5jICAgICAgIHwgICAgNyANCj4gIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9kcnYuaCAgICAgICB8ICAgIDEgDQo+ICBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdHJh
Y2UuaCAgICAgfCAgICAxIA0KPiAgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ndnQuYyAg
ICAgIHwgIDE2MiArKystDQo+ICBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2d2dC5oICAg
ICAgfCAgIDE3IA0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L01ha2VmaWxlICAgICAgIHwg
ICAgOSANCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuYyAgICAgICAgICB8ICAzNDAg
LS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmggICAgfCAg
IDgyIC0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0LmggICAgICAgICAgfCAgNDAw
IC0tLS0tLS0tLS0tDQo+ICAyNSBmaWxlcyBjaGFuZ2VkLCA5MjkgaW5zZXJ0aW9ucygrKSwgMTgz
MyBkZWxldGlvbnMoLSkNCg==
