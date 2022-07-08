Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF256BCD4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 17:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835EB10E5FD;
	Fri,  8 Jul 2022 15:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B520210E609;
 Fri,  8 Jul 2022 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657293605; x=1688829605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3ht+J4mD6+QBzvDyY9ZRPvH8cYhZsQ2sSKu9iy5AXEA=;
 b=cFINF9W8tzzkYXcQvCm4lO7FENvj1wZ+3XJc8DvwZbM2gitr8drwQtiw
 oj/ReoPmmgLdZLgZryIqyUNTmT1gwjaXKXcAN1VQmLKYrLbPI9VLP0TAy
 OWrARopETmk27ph7QfaRwcYRiH4Kv7QKUO4CJM8MzHFeXMje7lxIYGqQA
 TzyZQ+qNAEDkELnXNyWeBgURF8fFB5U9oscodLN0ocyS4HImU4L+SFqcO
 MoX6TkCMpd4JnnR1BYZVGutgtHsGEJJPsUBhjCPdin2moPk7EP9ZEtUGX
 eMhzyMWor+mX2yWCUTXdwnqatEPlvF3j0dIkD5XOUnDuL9p3rt+vxIoOw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285043962"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="285043962"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 08:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="770814127"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 08 Jul 2022 08:20:04 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 08:20:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 08:20:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 08:20:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 08:20:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMe2n1WG6kxHuqUaUonajBMFSsqhdshqSRdrnTiIJCaiWm5eA7yB0QIJ46M7hhrqGAkBm1ZFripj8kR5aO4+eTcTgo2nUBe3FxVIGDHW35xAflnd8cxH//lmGiKHbKqno0TVwyMBYjt8yoQdWKJjCj0eqkXaheHfHXByHOkQfm6cGne7MNt8EDY2efN97hABIQBjaGjs2Zk3FGuonCvjHGsEHi0QMVPE+NePoHDd5w6F5NwuzMbLRCBFkbfQ7lwun2gpp+LaHYqh9LdC77XTCEB7AdF9vkmUEQkP9bwisVnSZtRdTu+lYEOL27LCMSWanek8OJ2Q7iTasakH+8CK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ht+J4mD6+QBzvDyY9ZRPvH8cYhZsQ2sSKu9iy5AXEA=;
 b=OgwV2jjtuu90CijYad5GhDe84QoyySc+SXejCu+Vgm31Wkv2NxIWoXJtyNytu7Pr4RH9YWBZR4A7Jtr0+sgWuxmgS1BRDR1gx+1dryYRndAki064Gss+IrVSct+vNAKR5b6A53p9NqAdT3P6pFqkETBMwfNeCDqtJdHrfQGd6kUuYPM/1245TQoHjIc8L16YoWav3DLFlzfOcNvzGdiIMiLWhAujPXgglATTgm2DRcIPcCJqLEqX/95Ikv3pd5+7Klu7abAkIL/wziH3qKySX2NfPcruAFQsOMncNfT+8G+c1hA4vo/ouILYQNj1VeXSv0eWxCxBDe5jKPkKl+Lo5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 DM5PR1101MB2075.namprd11.prod.outlook.com (2603:10b6:4:5a::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Fri, 8 Jul 2022 15:20:01 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3820:8a37:de8b:ccbd]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3820:8a37:de8b:ccbd%5]) with mapi id 15.20.5395.022; Fri, 8 Jul 2022
 15:20:01 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC 08/10] drm/i915/vm_bind: userptr dma-resv changes
Thread-Topic: [RFC 08/10] drm/i915/vm_bind: userptr dma-resv changes
Thread-Index: AQHYjZ0bkJxl2ZwSGkOh5jrGh5tDbK1y6tUAgAGufACAAAfUgA==
Date: Fri, 8 Jul 2022 15:20:01 +0000
Message-ID: <839b728191ae8e7dcc65ad2cf9978f4a7f1b8e6a.camel@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-9-niranjana.vishwanathapura@intel.com>
 <d1c8cd2c44c07ebc7053f192100bf0ee5aa67140.camel@intel.com>
 <20220708145157.GX14039@nvishwa1-DESK>
In-Reply-To: <20220708145157.GX14039@nvishwa1-DESK>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff526144-77a5-41a3-6d96-08da60f55394
x-ms-traffictypediagnostic: DM5PR1101MB2075:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XvoKe+3fdxfi2DX0uc4auEYAN8JIHkufEGwW52nn1NYtSmaobHL08Jd5FcqhdgPqzgDIoyPGDWveeDMXk0kRbHcu+TeAjE+V0OGkjkXpgI5+NZ6Q1fM9l7GIPwGxmJw39vRgJA6q36qU7KekZi7qEpczE9lh18w6B1udgSmdpDnDHsaw3UlvRzPxbIh3n4CkHODnnEI2S7AvmBUOMNIEW7nUT7j85pWbpHNqsZFDXU+0wU/IJk8jJ1SJ5W5M2YuKzrGDMuX5Lt1A7i2Pzf6K4JiIbcxTsQSMFplNNbcx13FcEFJsO6fVxcmWSeMvuIzKSr4PkU1WIk6hoNJtWcZ5HpixI9wmgGKP0imm093eIyE0EK7JM12LsCFPqCZSu1nNtvnLuv2TqtaDexJ+XQ/62d93UlBAUsX0rwVA0AbgZm1XNfORGPobFYCYORlU/F1TT9akuXfTpvkQ7pm21q8hiEtJkJL4YLgoHmPS8gtfP9sjYYFBHuTC0vKx/XzHewhM7vpuQzZZkF11MFEDXj1pf2Tn3LiDf1upHU9XnjnyIs1H7EMpod0NH8ssYt1Eleiu/Y3PDd9QM/pP0Z7rfY8xzmZErCSikRzAo5yKVhlxTT7SJ4EBxRhPzlcs/TBbEVN4jnrsY9s7cRigihjRTt7mYUh8/Ks3bgTKh+1aDmmUw6XZ33cRcCwfYI7IYhIH596GSbRE9AzL+Uhg+H5nqqEprNVZ2jCLvacKE4+6Z/jnAvXH3adcFqNvNYAx3tRuCuGcnU2gk2GUmLzOs5QH6K4HG3rAjub4eFQkMMeeK6bYOQt3e2+aUqVpXGAq2oNNnKqK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(376002)(136003)(346002)(396003)(2906002)(6862004)(5660300002)(2616005)(8936002)(86362001)(26005)(478600001)(186003)(6512007)(6486002)(41300700001)(83380400001)(122000001)(91956017)(6506007)(76116006)(8676002)(64756008)(66946007)(66446008)(66556008)(36756003)(316002)(66476007)(54906003)(82960400001)(37006003)(38100700002)(6636002)(38070700005)(71200400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V29hN1JaSENXcUxuTEN2eXFPbGZ5OU44RjFOOStkMUJ3YUhFcXNpZndjWVJ1?=
 =?utf-8?B?WDNvL1p5c3FmN0FtdHFaaW4xalo1cGdDbTVjRFdIVlNZWURyM2ZDVHpxcXJ4?=
 =?utf-8?B?NGZ2SnlyaEtQRGM1UjhKSDFseUZaSTZEL0dBT2t4bDBjYkRHSUFkWHlOWmts?=
 =?utf-8?B?SXUvZE40YlUzTGkzSllYc1VUM3dQdEFpL0dGVm5NTnhxbW1YcnpmQnZ0aDJs?=
 =?utf-8?B?R2tJZGp4NW5jUnZzRzB5TXF5ZWtpMlAxMXRFdGFWMmxpclRidkJCd21laU5l?=
 =?utf-8?B?bDRTaGJOaGFiemRKbVlpK1YvL1RCekowVkNoZ0lhVkxUOUdFK3lSd3hJVmZy?=
 =?utf-8?B?cFpLc3AybHQ3Ylo2ZFF6UDRuZXNOVWJ2Vk9RRFZwTDUrUXBkbHRQa3ZlWTJa?=
 =?utf-8?B?SkJZc1g5M0ZzeW1RZWRXTHp5Y05EL3NyMjBxQnJKUHpBZFVxMmRMQ0Z0WGIx?=
 =?utf-8?B?UHl6ZHhwYnhYNGlJVlJjMWFRUmVBVlRZSjJ5U1I2T0xqYUpVcVFTclk5d1Np?=
 =?utf-8?B?eVloSmlQYStQOWNWblpQVDN5a3A0dHNjNUlGR1JDV2huQmR1eGF2MWI1TVVU?=
 =?utf-8?B?TXZQb0MrY0J2RXRsL1pBY1gvNVZxNEpEZTBlMVJhbzA2QmhmbmVUZHA3WHBk?=
 =?utf-8?B?MFRSN3djWVBsWTRMYnY5cng1S05wbldUaHpIMnlMZS9oWmFXMG5LR3p1b1l3?=
 =?utf-8?B?enU4ZzV0a05xeHVoSUE1TXJ6dVFDdmdaYi9lMzNTVjdrdWU1T1NMM2V2cWJi?=
 =?utf-8?B?R3BoL2hyNS9ZVmlLd05mL0hFaHdPcWE5WUgxemZkVnk4V293T21QYUZNRHBW?=
 =?utf-8?B?WTA0bVZoYTZ3dzFHQks1ZEk1SlFwN2tqSGFpZXpjS21FYzA1WHRlUFB5V1dz?=
 =?utf-8?B?Rmgxb2hmaXlmOXpHNkVoVGM5Q1pCY1ArSmg5Vmd5VS9FZ1crUTlaNUxxS21s?=
 =?utf-8?B?ZVIrZUZsQjdBQzRzTy9aUkdVY3RaM2ZJNFRRdlZIdW5zNU4vQkRUaGNrR0hB?=
 =?utf-8?B?U1NkSWd0ZVQvbjA1WFFpbFJYR29hUlptOWx1KzdRcy9wVzh1OXRqbFV1SVF0?=
 =?utf-8?B?clpGcUo1RGptd1RoMlljcWNpdHdnWWZGL0crN050NEJObi9JbkJtUzNkNTJo?=
 =?utf-8?B?OXhWK0xXTTRwVzcvNk1SRHgwWkE0bzlIeS9BVC9yV3ZRRHZGOGh0em1FN25I?=
 =?utf-8?B?WmhDU1RiOXk1aUtYaWlPMlNGS01QbTZqYlVIZDZidVpRdTlvUnhFVmUwb2dY?=
 =?utf-8?B?Q0Z2SGpaTHhzOEx2MzZORXA3dy84bFBFM2dXZlQzY29qM3hTSkJnd0VVOXls?=
 =?utf-8?B?RGprYllvMzA4SnRQeis3Ry95Mmw5N3l1TnE5RXBPVVNVSE5pKzJPZDVLNGpa?=
 =?utf-8?B?YXRwYmYyWWl2QjBTdSt4T2dnQzlWaGs5cXVPL3NtYURjdk4rdzdKcXNNWjVl?=
 =?utf-8?B?OGR2NE9vQkJWZG1TTWwxei93MHpTeGJocmJpMnBweHhSZEpldDVLT2kzbzVk?=
 =?utf-8?B?OGxCMGF5RWgwcWV6Y2RrL2xUOHovaEsvWXRBRUh2OFNHcDNsem1zb3d1LzNK?=
 =?utf-8?B?K2ZaZDFkcDlKb2VMdDdiUThvbks4ekFKc3ZWMEgwQ2RNcDg0cGszSmh6Z1Fu?=
 =?utf-8?B?N0NNNTh3Ym42VHloK0VoUm5zazNRZUdjN3JJRVZ4Y3dWZ2J2R05raytjdVNR?=
 =?utf-8?B?MnA1NnpkYmRSeWc2NmwwZDU0Q1pCcHBXV1BjNktPbkNMUE1NQ3pvMXpvc21Z?=
 =?utf-8?B?QWtPNU01V05CT0FXaHlHbFNjSzFJRVVBZUozd29uVFR3d3JJb2YwSXFGamVk?=
 =?utf-8?B?WVRsMkJtMERVN05FZzFjTG83NitSSlNiOGNMQnNxK1kzR2Y1dG5IbU93YTIw?=
 =?utf-8?B?QTIra2UxWWRja0h5Qmk4dFdhK2hDbDlhYVFzdTl3d2l2SEdMZkRuSWpPMWRN?=
 =?utf-8?B?dFkyYlZiTFl6NVNhbjE3MUkyV1lsU0hvb2s1cC9Qd1lMSStEU1psM0szcW5G?=
 =?utf-8?B?WWdKRW1lTjk2WEFEK1FIVVU1aWdTTnE0S3l0TE9IL0x2SHA1R2dWY2ZXWFRB?=
 =?utf-8?B?ZkttOFpxbllSdkMrSTB6WVhtWXpHck5SVHBZS1VoOXMzMjZmbXdhYUNyYjh0?=
 =?utf-8?B?VjlFbjl5OCsxSjhnU3U4R2NLd1FIbFlEQVFOVCt3TkhwSkpTaEFXVG1CaFI1?=
 =?utf-8?Q?cSMQaD+2tMzLZg4NkHySOvw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <159A74E5B9B7354CB1099E07D042BF06@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff526144-77a5-41a3-6d96-08da60f55394
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 15:20:01.1524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y6uzlOnbOcidyEfUfo3EVCvnkILMLPO1yD+YVW6xfojCFX24KrH5v8BDS4oHRyDQq9a8NOzIdwozPxS1/A30h0EzJBNa+NHOWLuLPjqZnEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2075
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Zanoni,
 Paulo R" <paulo.r.zanoni@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA3LTA4IGF0IDA3OjUxIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiA+IFNpbmNlIHdlIGRvbid0IGxvb3Agb3ZlciB0aGUgdm1fYm91bmRfbGlz
dCwgdGhlcmUgaXMgYSBuZWVkIHRvDQo+ID4gY2hlY2sNCj4gPiB3aGV0aGVyIHRoZSByZWJpbmRf
bGlzdCBpcyBlbXB0eSBoZXJlIHVuZGVyIHRoZSBub3RpZmllcl9sb2NrIGluDQo+ID4gcmVhZA0K
PiA+IG1vZGUsIGFuZCBpbiB0aGF0IGNhc2UsIHJlc3RhcnQgZnJvbSBlYl9sb29rdXBfdm1hcygp
LiBUaGF0IG1pZ2h0DQo+ID4gYWxzbw0KPiA+IGVsaW1pbmF0ZSB0aGUgbmVlZCBmb3IgdGhlIF9f
RVhFQzNfVVNFUlBUUl9VU0VEIGZsYWc/DQo+ID4gDQo+ID4gVGhhdCB3aWxsIGFsc28gY2F0Y2gg
YW55IG9iamVjdHMgdGhhdCB3ZXJlIGV2aWN0ZWQgYmV0d2Vlbg0KPiA+IGViX2xvb2t1cF92bWFz
KCkgd2hlcmUgdGhlIHJlYmluZF9saXN0IHdhcyBsYXN0IGNoZWNrZWQsIGFuZA0KPiA+IGk5MTVf
Z2VtX3ZtX3ByaXZfbG9jaygpLCB3aGljaCBwcm9oaWJpdHMgZnVydGhlciBldmljdGlvbiwgYnV0
IGlmDQo+ID4gd2UNCj4gPiB3YW50IHRvIGNhdGNoIHRoZXNlIGVhcmxpZXIgKHdoaWNoIEkgdGhp
bmsgaXMgYSBnb29kIGlkZWEpLCB3ZQ0KPiA+IGNvdWxkDQo+ID4gY2hlY2sgdGhhdCB0aGUgcmVi
aW5kX2xpc3QgaXMgaW5kZWVkIGVtcHR5IGp1c3QgYWZ0ZXIgdGFraW5nIHRoZQ0KPiA+IHZtX3By
aXZfbG9jaygpLCBhbmQgaWYgbm90LCByZXN0YXJ0IGZyb20gZWJfbG9va3VwX3ZtYXMoKS4NCj4g
DQo+IFlhaCwgcmlnaHQsIHdlIG5lZWQgdG8gY2hlY2sgcmViaW5kX2xpc3QgaGVyZSBhbmQgaWYg
bm90IGVtcHR5LA0KPiByZXN0YXJ0DQo+IGZyb20gbG9va3VwIHBoYXNlLg0KPiBJdCBpcyBiaXQg
dHJpY2t5IHdpdGggdXNlcnB0ciBoZXJlIGFzIHRoZSB1bmJpbmQgaGFwcGVucyBkdXJpbmcNCj4g
c3VibWl0X2luaXQoKSBjYWxsIGFmdGVyIHdlIHNjb29wIHVuYm91bmQgdm1hcyBoZXJlLCB0aGUg
dm1hcyBnZXRzDQo+IHJlLWFkZGVkIHRvIHJlYmluZF9saXN0IDooLg0KDQpVZ2guDQoNCj4gSSB0
aGluayB3ZSBuZWVkIGEgc2VwYXJhdGUgJ2ludmFsaWRhdGVkX3VzZXJwdHJfbGlzdCcgaGVyZSBh
bmQgd2UNCj4gaXRlcmF0ZSB0aHJvdWdoIGl0IGZvciBzdWJtaXRfaW5pdCgpIGFuZCBzdWJtaXRf
ZG9uZSgpIGNhbGxzICh5ZXMsDQo+IF9fRVhFQzNfVVNFUlBUUl9VU0VEIGZsYWcgd29uJ3QgYmUg
bmVlZGVkIHRoZW4pLg0KPiBBbmQsIHdlIGNhbGwsIGViX3Njb29wX3VuYm91bmRfdm1hcygpIGFm
dGVyIGNhbGxpbmcNCj4gZWJfbG9va3VwX3BlcnNpc3RlbnRfdXNlcnB0cl92bWFzKCksIHNvIHRo
YXQgd2Ugc2Nvb3AgYWxsIHVuYm91bmQNCj4gdm1hcyBwcm9wZXJseS4NCj4gDQoNCkknbSBub3Qg
c3VyZSB0aGF0IHdpbGwgaGVscCBtdWNoLCBiZWNhdXNlIHdlJ2QgYWxzbyBuZWVkIHRvIHJlY2hl
Y2sgdGhlDQpyZWJpbmRfbGlzdCBhbmQgcG9zc2libHkgcmVzdGFydCBhZnRlciB0YWtpbmcgdGhl
IHZtX3ByaXZfbG9jaywgc2luY2UNCm9iamVjdHMgY2FuIGJlIGV2aWN0ZWQgYmV0d2VlbiB0aGUg
c2Nvb3BpbmcgYW5kIHRha2luZyB0aGUNCnZtX3ByaXZfbG9jay4gU28gdGhlbiB0aGUgdXNlcnB0
cnMgd2lsbCBiZSBjYXVnaHQgYnkgdGhhdCBjaGVjay4NCg0KL1Rob21hcw0KDQoNCg==
