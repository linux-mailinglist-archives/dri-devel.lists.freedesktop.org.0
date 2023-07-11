Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221B74FAA0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 00:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A7610E444;
	Tue, 11 Jul 2023 22:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3DE10E444;
 Tue, 11 Jul 2023 22:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689113207; x=1720649207;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1W2lSiYUepuQNkqgPNb8TjAaZNoY/PrPQHJiMKSssn0=;
 b=W8mKpLJGDs1wtF9PSXixtqPl3EJi0b8k6oXQokVRkDM+6L6VZ4BZLj3i
 K8MDLrd7vVFTnHA6/rHVZaaPJM7Rzv1avFmOfRrf3dRNtf/SNzPKolE8H
 W4QqS/Cg6dylcGuIa8Q+zQCp6L96yptcgqz3c+PvIkIlZveyu3BBcLQ6j
 d2gSKE46xd4EChUj5CSzJBNz8rbSNozAmq9yOaOIVXiJaBS0kmTvEGLgO
 M3kJcCWtiY7iFiotQ5HWBN5b87uUh220BMxf+WFTY+6SdVYG+zKAEdbx+
 gX1B91y9siNaBSAPJTcKGMWxGzFreblzSsbnek+fG7U1jnpBbjYHqK/nM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="368283874"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="368283874"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 15:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="750938525"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="750938525"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 11 Jul 2023 15:06:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 15:06:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 15:06:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 15:06:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 15:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjC6Ga8uQQJS0rEYKQPMJnvbcr7Jegv4WzJgcWUobvKOm410cXtgZu+7D/johSI+/1JAh9zDPsludk8CwSmSA9wCmUUtOUx35r5CasM2UDdC0yE/qX+v2H0xqlesq5KMWe9z8oR/KRjK5ZuIt3OJV6BzcxeRe0ydiall++2NlCW/LDYfTieYYlZ0/tb9aYvLTS5F2lKfwFemBrDJMrAKwI7pNdlHhCp8mPo4oxJYkzZ/CDKc0ZPauiNOL4CO8M+nxj/DbZDlpvK0UbmutYAMWNoLoEqWpX/wa/moyBCV1d7Prey8EN9NTjyg+AY/O7bzXamidQCpr/U3/ecVOT4lJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1W2lSiYUepuQNkqgPNb8TjAaZNoY/PrPQHJiMKSssn0=;
 b=VfOTRO6M5oUIwvBE48CHj3ISxu5Nt7xZlHBIjeiujIO4YL0kYq/GJeL18Yg9ZvxZ/sM/Zm8tBd50X03MkJxOdwwyHgtu6N9NrHiBuCh3GzqSGzJrgrT2GlVXzZkck29fU2VB5ENiHITqHAC2pJF4GbIcCFxCfUWbAudKF4KRhef7qKFCs44JueBTC+TCKk3SSzIYys2XzAW3J4BPGQjFoY6ra1CUG6RcUzSMUQ4c7qhh++hDaS4iSqBLjLGj49SWjHfhXmAh0wDRzMpLRXFXYf8ryi5mtvhiRP8m859PvomHLTRwU3405lj/1cIwwuoXw1QjpwHd4vPJYwvx/XdWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA0PR11MB4560.namprd11.prod.outlook.com (2603:10b6:806:93::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.25; Tue, 11 Jul 2023 22:06:43 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::f674:6c10:d181:ac70]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::f674:6c10:d181:ac70%6]) with mapi id 15.20.6588.017; Tue, 11 Jul 2023
 22:06:43 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/selftest/gsc: Ensure GSC Proxy
 init completes before selftests
Thread-Topic: [Intel-gfx] [PATCH v3] drm/i915/selftest/gsc: Ensure GSC Proxy
 init completes before selftests
Thread-Index: AQHZqspHHM/XQjd/10GCdk8gDbshi6+iUFCAgBKhUQCAAAnGgIAANvYA
Date: Tue, 11 Jul 2023 22:06:43 +0000
Message-ID: <4e7a39ae0810de5ac3001389f9250a47745e567a.camel@intel.com>
References: <20230629204248.1283601-1-alan.previn.teres.alexis@intel.com>
 <29d9e289-42f8-8ae2-ad2b-9ddfe8c848cc@linux.intel.com>
 <20c097ddcc2eb63f25a766becbcd0d779855afe5.camel@intel.com>
 <c24b73cf-34e1-f7e3-b77f-da853bdd56ef@intel.com>
In-Reply-To: <c24b73cf-34e1-f7e3-b77f-da853bdd56ef@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA0PR11MB4560:EE_
x-ms-office365-filtering-correlation-id: ed5e68e3-a2ac-4620-c4ed-08db825b1cab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LnDxwOblfY22wU2mi7vteDgnSZ1xGg7V6EBV3687qAiOMF3CKWPZch5VE33BKDWF00JeVEFWG5gNHPM+x07deEA56ysZJmvEg5xGh82nUOtlnUUclyYUx22jGnCYJ2pOCiO6HJy89HwDT5uvHGFdjvxahlBipd/zr7tpM0W6U1pqno+cpPGHbNES9vvt3GRkhkEorBqHWarv7AeLScGcJXxt6E1k9K/cuRUF3GY9iY/0SlM06nUwj/IdT5aRAoDsy32/nJQLnwwlBws9wS9AMM+9FfCZl3HBbiGaTu5RT06vr94lEz7UiNyXWVKAavNqPMD+hIJ1etP+D23kcaSGCk2v3CvpgK/UuVSXRZmqgqy3VJdNgKiBjwmHscRZZ95X0Tf0lhCRcEPwjIqWd5UGD2iCJGlckeRJUS9sQjyKxdTsm2sGgX6F4k1uh1rfZLrlx7c92Vljbo50yUbbn4956lK2ToYluSx9toq+hEXhQz3yATieZbX66KEiolZjghd5tlcNSANG6MapX8pOY4dVniXFRl2/eCoMFn6vFVM33n3IscYVbQtpeJfJje7WW/mYyuxjexAEKg+c8CKugjZgaPmu5ayCRF82xrJ4jKO11PXU5FB35TrQHKnH0rSyzNz9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(2906002)(38070700005)(122000001)(82960400001)(6512007)(38100700002)(26005)(186003)(6506007)(2616005)(86362001)(5660300002)(8676002)(36756003)(76116006)(71200400001)(110136005)(91956017)(6486002)(478600001)(316002)(4326008)(64756008)(66446008)(66476007)(41300700001)(66946007)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHpsUjVhSk5hUUR0dEtDTjlmYWJpSDFZZkVzRGhNNUIzc1BrcHVFd0FKa2N6?=
 =?utf-8?B?TXY1cVNBTzFlVVdvNFRkUENaQ3h4Q2ZYMkV5STNpVFJjSnRBTWkxd05ScjRB?=
 =?utf-8?B?QjdQZTRKbEVzV3ArTjZURklkUVJCbkgySjU4dXlBUjVObUZoa3U3cllNcXIv?=
 =?utf-8?B?YmNFdVRwOXh3YkNEUWo0SnMxcXlJZjdTb3ZXT2lBaUNTelptUmt3Q1NhcHVF?=
 =?utf-8?B?UVNKQjYzOEN5N0NvUVBXU1JHRmZuNkdISk9qTTRoWWFzYldKZEY0UGlwdmNr?=
 =?utf-8?B?aW9ncW5aamNHcTVkVlVXUnQzejJHQVNWbFlJQlJ2eVA1cjNvN3NENjFkZWZq?=
 =?utf-8?B?cllXR3U2TUJrK2hlRnc5QzMycjMwTmVrNjhTREVXWDlZaG0zVGpmODN2dWVs?=
 =?utf-8?B?NTJwTWJLTHE1UERvUmU1d29DcTBzenRJbnJYNFZjdHQ4bUY2bk8ySFc2RlRh?=
 =?utf-8?B?ejMrMVlMYTBJYWVCQWNGY0RLY1BocXZYVFhlOVZQQkw0Ulg5WjFFV01ZbFB0?=
 =?utf-8?B?SHhnWVZ0bzFzUytsZ3kxakxCUk1udGNCd1J0MlVtZ0E3Tmo1MWlxaEMvMzhp?=
 =?utf-8?B?c3NMNllFaGc1c0tBL1NGVitjTGpHVjBQR2hBdkRBcWV4YWFFdHBSYTJ3c3lK?=
 =?utf-8?B?RFd6ZGxpVHpTck5jcEQyUitrN2g5ZWFNTFAxNjVnZ0h4OGQ0UFF5Y3dUcndN?=
 =?utf-8?B?eDVtWnR2SjFJSkJrWFpsZ2hob2phOGdCMzZnQzNKaTdsSWd5bFJnbW9vNFBR?=
 =?utf-8?B?R3JlbXBEVzBVeDVoZWFBN1JtZUtleU5xRUJQOHgwVzBITkN0N05sNmtaMGhm?=
 =?utf-8?B?ZEtlcnR1TXd2cjd1cjBOYlgra1pMdHRrcW5BVzUvS0h6d0JsdzExQzNEQm1q?=
 =?utf-8?B?UTZwa1ByR3JCNXVZaHhObE5GQjdVcmhXejNsTm8xcGp6UTFzWHBHMitJUGhs?=
 =?utf-8?B?cUdpZHgraGlXbXVERW9sT21GSHc4RGVRdXdjTTRPdUV5WVlDUjhIVElXRmxH?=
 =?utf-8?B?YUM1UzlwNmpndU9nVHFpMnNrejhhUTlqS213ZDhuVUNQSkVyV0pQbjhaVFVF?=
 =?utf-8?B?Nm4xdFc1Q1F1NU45TmRZTU14dW83Wlo3TVA3Tks3UkxoclJhN1NVdnFQMC9v?=
 =?utf-8?B?dDBPVmVPWjBteVBIbjRyRnkzZkdHejVxWkZKVzRKQlhOdytEeE96SWVzSThp?=
 =?utf-8?B?ZzYyZjlZeWZCV0ErNHZVOGNIaEM1VWtYZjJqUzBnVnpnemlWWkVSL3hRa3E4?=
 =?utf-8?B?dEdKTDVGc24vMmFYL3BoaDgyazM4TlVRbkZDWE8rNGRWQkw4S3Bnc3VlcHlR?=
 =?utf-8?B?N2ZmRys5cmptcm9Xd3RBOHZWajZ4MnpleDdHVGdoNFhGSFZnWWRTWWExK3lC?=
 =?utf-8?B?TXFQalJsZC9nSVpGRG9qbmxqSlo3Q1o2M0lnL0J6MjI1emJERFUyWVdTSFdP?=
 =?utf-8?B?RmdnS1VPeDRXS0lzWkNFYUExZVNoU1B5M3NQb0hYdmI4T2ZEOWQxaS9YeUlQ?=
 =?utf-8?B?YkFMd1J1RlQxNVovbHRzTXdIc3V1cHNEQ3YvNmxtQzZlSjVRcUZLTFBvam4z?=
 =?utf-8?B?d1JIcmVEMDJId01JR0IzSHpEekEzS0lIb2Q0SUY4ZVByRXR6dmxlMVplWHVn?=
 =?utf-8?B?OVd6bUtZVTRNVlJzNzFYN3RDYnpTTi9lWXE5RnE5QWlLZVBFOTFvM09udzBS?=
 =?utf-8?B?TDRHNVhIUXBSNE4yRzFubE5VSllycms3eUhOTUZCa2JRL3I3VDRSQU00bGFJ?=
 =?utf-8?B?MWJvUkYra3hVQmE0NUhraUoxY0NUSVZFdVFNVld5WG5UNWkwa1NmU2xWQ0hP?=
 =?utf-8?B?aXZCd0tZNDA5YzRVMFRYc21pWG9aZUw1bkVFdE5nRjlqSGtSeHRzcUlVZjlO?=
 =?utf-8?B?WWNQQXFQY0NOTnY1RUhWMGdhaXFVWDJ6Q0hhVWJXa0E0UXk5ZThIdXFZY2lr?=
 =?utf-8?B?a1hiN1V1clUzV01NazI5TU91MFNiYmsycCszWjFWdDNGcFdBdk1vbjhQTGw2?=
 =?utf-8?B?UkpocDV4SHplSHhzVDhOSHFnYi9maUZDUkdYbHRJTTVGaE1EZnJtYzZrallu?=
 =?utf-8?B?ck9UdmdTMlZ6R2pHa0Y1Nmd0UDhBNXB3NXhQaWVMR1NQTnhNL1VFTFY3NllT?=
 =?utf-8?B?VjkvbTlnM0RBRDBVOHJWalpmanlCdGdlSVBqS1JYY2JWS1MvUm4yN3FLN09R?=
 =?utf-8?Q?Y4iXT6z5V1kpFAIiQo0+hvQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E5514EE9A67CB43BB4BFAC035F41D84@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5e68e3-a2ac-4620-c4ed-08db825b1cab
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 22:06:43.7462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvNq5hJV+feaHMVxYbv1KWFM1c28OMkqb2MbH7Y/IQj+YPSY+RkRb78kmdoJUe4sKr1iUGNWrHGx+ix4T7weQbZf3kaCU9BtDlW2QcXymZefU705PnxWl4bby3kWDMex
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA3LTExIGF0IDExOjQ5IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gPHNuaXA+DQo+ID4gPiA+IEBAIC0xMzQsNiArMTkzLDggQEAgc3RhdGljIGlu
dCBfX3J1bl9zZWxmdGVzdHMoY29uc3QgY2hhciAqbmFtZSwNCj4gPiA+ID4gICAgew0KPiA+ID4g
PiAgICAJaW50IGVyciA9IDA7DQo+ID4gPiA+ICAgIA0KPiA+ID4gPiArCV9fd2FpdF9vbl9hbGxf
c3lzdGVtX2RlcGVuZGVuY2llcyhkYXRhKTsNCj4gPiA+IFdoeSBkb2VzIHRoaXMgbmVlZCB0byBi
ZSB0b3AgbGV2ZWwgc2VsZnRlc3RzIGFuZCBub3QganVzdCBhIHdhaXQgZm9yDQo+ID4gPiBpbnRl
bF9nc2NfdWNfZndfcHJveHlfaW5pdF9kb25lIGluIHRoZSB0ZXN0cyB3aGVyZSBpdCBpcyByZWxl
dmFudCwgdmlhDQo+ID4gPiBzb21lIGhlbHBlciBvciBzb21ldGhpbmc/DQo+ID4gQWxhbjogaXQg
d2FzIGFuIG9mZmxpbmUgZGVjaXNpb24gYmVjYXVzZSB3ZSBkaWRuJ3Qgd2FudCB0byByZXBlYXQN
Cj4gPiB0aGUgc2FtZSBjaGVjayBmb3IgYWxsIHBlcm11dGF0aW9ucyBvZiBzZWxmdGVzdHMnIHN1
YnRlc3RzIChpLmUuIGNvbnNpZGVyaW5nDQo+ID4gbW9kdWxlIHBhcmFtcyBjYW4gZGljdGF0ZSB0
byBza2lwIHNvbWUgc3VidGVzdHMgYnV0IGV4ZWN1dGUgb3RoZXJzKS4NCj4gPiANCj4gPiBBbnl3
YXlzLCBsZXQgbWUgZ2V0IGJhY2sgdG8geW91IG9uIGhvdyBob3cgbWFueSBzZWxmdGVzdHMnIHN1
YnRlc3RzIGFjdHVhbGx5IGV4Y2VyY2lzZSB0aGUNCj4gPiBuZWVkIGZvciBwcm94eS1pbml0IHRv
IGNvbXBsZXRlIC0gaWYgaXRzIGp1c3QgMS10by0yIHN1YnRlc3QgSSdsbCBtb3ZlIHRoZSByZW1v
dmUgdGhlIGNvZGUNCj4gPiBmcm9tIGhlcmUgYW5kIG1vdmUgdGhlbSBpbnRvIHRoZSBpbmRpdmlk
dWFsIHN1YnRlc3RzLg0KPiANCj4gSSBkb24ndCB0aGluayBpdCBpcyBnb2luZyB0byBiZSBlYXN5
IHRvIGZpZ3VyZSBvdXQgd2hpY2ggc2VsZnRlc3QgYXJlIA0KPiBpbXBhY3RlZC4gQWxsIHNlbGZ0
ZXN0cyBsb29waW5nIG9uIGFsbCBlbmdpbmVzIG9mIGNvdXJzZSwgYnV0IGFsc28gdGVzdHMgDQo+
IHRyaWdnZXJpbmcgR1QgcmVzZXRzIGFuZC9vciBtZXNzaW5nIHdpdGggdGhlIHN5c3RlbSBpbiBv
dGhlciB3YXlzLiBBbnkgDQo+IG5ldyB0ZXN0cyBhZGRlZCB3aWxsIGFsc28gbmVlZCB0byBiZSBl
dmFsdWF0ZWQuDQo+IA0KPiBJTU8gdGhlcmUgaXMgbWluaW1hbCBpbXBhY3Qgb2YgaGF2aW5nIHRo
aXMgY2hlY2sgb24gZXZlcnkgdGVzdC4gV2hlbiANCj4gcnVubmluZyBzZWxmdGVzdHMgd2UgbG9h
ZCBpOTE1IGFmdGVyIHRoZSByZXN0IG9mIHRoZSBzeXN0ZW0gaGFzIGFscmVhZHkgDQo+IGZ1bGx5
IGJvb3RlZCwgc28gdGhlcmUgYXJlIG5vIGRlbGF5cyBpbiBnZXR0aW5nIHRoZSBtZWkgY29tcG9u
ZW50IHVwIGFuZCANCj4gdGhlcmVmb3JlIHByb3h5IGluaXQgaXMgc29tZXRpbWVzIGNvbXBsZXRl
ZCBldmVuIGJlZm9yZSB0aGUgc2VsZnRlc3QgDQo+IGNvZGUgc3RhcnRzOyB3aGVuIHdlIGRvIGhh
dmUgdG8gd2FpdCwgaXQncyB1c3VhbGx5IGZvciBhIHZlcnkgc2hvcnQgDQo+IHRpbWUsIGJlY2F1
c2UgdGhlIGV4cGVjdGVkIHRvdGFsIGV4ZWN1dGlvbiB0aW1lIGZvciB0aGUgR1NDIHdvcmtlciB3
aGVuIA0KPiBub3QgaGF2aW5nIHRvIHdhaXQgZm9yIHRoZSBtZWkgY29tcG9uZW50IHRvIGxvYWQg
aXMgfjc1MG1zICh+MjAwbXMgZm9yIA0KPiBHU0MgbG9hZCArIDIwbXMgZm9yIEh1QyBhdXRoICsg
fjUwMG1zIGZvciBwcm94eSBpbml0KS4gSGF2aW5nIGEgZmV3IA0KPiBzZWNvbmRzIGFkZGVkIHRv
IHRoZSB0b3RhbCBzZWxmdGVzdHMgcnVudGltZSBpcyBJTU8gYSBiZXR0ZXIgb3B0aW9uIHRoYXQg
DQo+IGhhdmluZyB0byBtYWludGFpbiBhIGxpc3Qgb2YgaW1wYWN0ZWQgdGVzdHMuDQo+IA0KPiBE
YW5pZWxlDQo+IA0KDQpUaGFua3MgRGFuaWVsZSAtIEkgY29tcGxldGVseSBmb3Jnb3QgYWJvdXQg
cmVzZXQgb3Igb3RoZXIgc3lzdGVtIGRpc3J1cHRpdmUgdGVzdHMuDQpGb3Igbm93IEknbGwgcmUt
cmV2IHRvIGFkZHJlc3MgVHZydGtvJ3Mgb3RoZXIgY29tbWVudHMgYnV0IHdpbGwga2VlcCB0aGUg
d2FpdGVyDQphcyAnb25jZS10b3AtZG93bicgZm9yIG5vdyBhbmQgd2FpdCBmb3IgVHZydGtvJ3Mg
dGhvdWdodHMgb24gdGhhdCBuZXh0IHJldi4NCi4uLmFsYW4NCg==
