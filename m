Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324DC727088
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3E210E114;
	Wed,  7 Jun 2023 21:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B3310E066;
 Wed,  7 Jun 2023 21:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686173019; x=1717709019;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ozKsWFo5G4u9jf1rcjy4lfF+ednqJP2umXL1j3Cd3DI=;
 b=TKWU4TLjAeGeU5L8ElOJlSOVXEzhyvLcror7HYoIHcCIb9tGMIjV+drz
 nJownjavq/MHjsw/vKJPftcyOOXCpRm8mmctHzVtfCw6tRIr2goW+DcX3
 FnOr1Jgzj6z8uiNjwIgxurt8zIzMoCifyQXM53UFJ4sJmlD2g4hkkWhdX
 +bvvpxlkfcoi+BMMfFWijPWHBFykPKer08gX0x+T+KJPpCZJ2cfL4vGfS
 lrD4vtMBbWAUbeT3UHjeJn8aEp8RxGRq1KNF7iBLzIi/52QcNoRO8B2gX
 WY7aEaCwwDaEg9kwljSlIm+qAAyxRJW252GaDcR3N5yVRom6GQwj/SGzK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="341766677"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="341766677"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 14:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="799541041"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="799541041"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2023 14:23:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 14:23:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 14:23:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 14:23:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 14:23:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=We3UT99//dXxACOD0u5XdIus5i12h2JBZTGwFDqMT08muOhH6LhlmxDQhQffxCYaR4Y3YTJuC2oHScOIemIyC1vdbNfwp24r9YH5+FUKP2prdQlAfg4v9U/D2X0RKDZzVC/Y6hBsCkfo/iDIWdMm2gnDFxNt9EvsfXPlP0krWG/IN0F6AJKCYS1DGWSkvIU2A/oVUk+vZ5J4nZLGpngDVYMxQ7xYzmd/Xdy8kYITa4HOrDecv+eYqaKbQGVXoc5DiyjtsFO25ntRr2w2xq3ulV+Hq98JSxBilHf1dQ9L0AAK4AF4OKFQtgORVx3KkXoJSrvPA3A8m6CD4L1gw05xVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozKsWFo5G4u9jf1rcjy4lfF+ednqJP2umXL1j3Cd3DI=;
 b=NR6lmaWemklR2kMcmASLo9LuWJJyiMWcDtbpd+mpsxJWqnkkeQOn0nlRiL28CcmUuVrlhNJWUfyY/3RsNceRX3G+T53GfVcVwAGP5OCW+vM5oh51/SqzfuIaGSnf9dHr2fqUEklXLji5+r/RuaIy4oYjoXxMDYP1OLi3R3+YKjZfz5kdrav0y5ECj/SwC3kZr1Qi2Pjbo5GDGGubO/RYrMTouNUgDrWWpbOHZzkvrzEOc1j1jRe0PeaCxtKgKB+alJf0kfNhB+48fIuRFCt+AxJj8WmqR+YaRqoXWK3Z0YQZWxLiMeG2XgWaYz+YzofErb+cGc45PXH161CawjBZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB5504.namprd11.prod.outlook.com (2603:10b6:5:39d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Wed, 7 Jun 2023 21:23:30 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2%6]) with mapi id 15.20.6477.016; Wed, 7 Jun 2023
 21:23:29 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/i915/mtl/gsc: Add a gsc_info debugfs
Thread-Topic: [PATCH v3] drm/i915/mtl/gsc: Add a gsc_info debugfs
Thread-Index: AQHZmC/m/oeKZ/Rhakeo38ORElD4ia9/3DiA
Date: Wed, 7 Jun 2023 21:23:29 +0000
Message-ID: <afac28b003e7d7c1169741efc26f22b00c8465ec.camel@intel.com>
References: <20230606022402.2048235-5-daniele.ceraolospurio@intel.com>
 <20230606043209.2056271-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230606043209.2056271-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB5504:EE_
x-ms-office365-filtering-correlation-id: d4eaa8a0-d464-43ea-a610-08db679d7073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RYrqJYK0vkgcTz0h2sgk9ANmxCWn8SYiJ5PpQWZ8YEhSAuU7Eqck55DhaGWMoox47u326tvFz26w9kCDhZKIYn5m6wRy2sHimZErg/VWcq7ArJnhbn2zk+ja9pnoWLD3U1o3pgM+nqfGkB8v0fbPrbmdxOOY1l6IP/hxj1HsAZ7xm19E3/zpnZ2CHhPtDUefPuYirbl4VozmnrpW5CTqTor+z3JPRCGxBsMxpuHQmKYqbuuIlx149FTLSGa85D3Rcd6WRkMK2ekWmO8jm7bP9N5k38KQ02Fqi+NwR1F6S+kYYbK8aBYAwvHM3HBsHOdYNyQdvZuG+43aKAGd10L/2icxQ+xfbRLVtfw9nKdBXC1/TlMiEv2Vkt3pj228QeWH7wVjjOKVxE+oDLKbpSgMRv5veE/2d9x9m8FjRNYIEGK9J4w3QfJM5STmYlyNLfZaL2LAWDCk1ulX3Ix9qhbBS4u8NVLsSv9gLspjFAZFwh6CNps2yxeuGZ5npWss0LYfWAnOIbEDPtgG7P8aAOoof+zX6YDjFUmaixvhP8St4mxywnr+/ej8dH2keewrtE2Rw00uSwHKiMzzTuy5ZGfrNlvN1BPNdLIUYkDcclSjNq6m7Bt/s1Psh87tHu0PdX8V
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199021)(66946007)(76116006)(450100002)(91956017)(38070700005)(66446008)(64756008)(66476007)(66556008)(4326008)(71200400001)(110136005)(54906003)(478600001)(316002)(26005)(41300700001)(8936002)(8676002)(6506007)(6512007)(107886003)(86362001)(4744005)(5660300002)(2616005)(36756003)(2906002)(122000001)(82960400001)(38100700002)(186003)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGd1VXZ4UVF0VE9WeERONnZOWnlVUTA3K2xXRklHMlRnakVpVXVFNXpoWlVq?=
 =?utf-8?B?b1pSYThtNnAvU3dkMXI0Q2ttdXk2U3g4UXRDcldxcnpIU3ZhWmNKSldpVFBK?=
 =?utf-8?B?VDVhLzZtSUtPWkZkMHdmS0ZmSDN1WTFFQkZibFBKaWNJNjBwM1ZKaFQzM2Fq?=
 =?utf-8?B?UXdocWhrN21rcmMwbmo3YWlIYnpVREVlS1gwM0UxYTZFMTJkcnpoTnM5ZjJH?=
 =?utf-8?B?VFR2L3hxblBvSWxRTU90aktZNVpoekhuaHdHSXdzSExGQk1oR1JOQ2d5R0F5?=
 =?utf-8?B?NW5kd2Q2eHlncnllb1hFOSt2eEMyL1R0UDZBOVFOWnl1SlZ0dzRDVUt6RnZq?=
 =?utf-8?B?UWVCeVVqN0dUZjYzRUdsZm4rN3Rob0hxblFuQ2pjK3lwK0VRS25uREtCZkV0?=
 =?utf-8?B?dmpNaU9mNERFaDN6Q3RLTnR4MUxDNlZmSmVaT1pFYjlSZ0VaZS9icmFEUFhI?=
 =?utf-8?B?ZFQ2Z21sVmxndEljaUtabmtLRVJiYTVDZHc2MHRkYmlDRWcxdTYrM1M0VmlD?=
 =?utf-8?B?cjV2dlJEbUtZRy9RdlNsSVoyczdhR2orV2pTWXVmSzR5VGwxRjVQYUFFd2ZT?=
 =?utf-8?B?L2ttSnJjK2tuVDlBMEdJcEFBNXc2b1lEOE9VOGhRbS9Kdm5VejNkcGdXdHdy?=
 =?utf-8?B?NHhJWXovTWxPcC93V2tsYU1pcktCcjdmUUhhUzFwOTlKeE1tRFJXenBXMUU4?=
 =?utf-8?B?dzVSbDlvUHhOWDJiS1NqU1kxUHplME9VYzFKRlpWUVFEVjdNbGU1ZjdGN1Fq?=
 =?utf-8?B?VHZhemlyREVsZjFDZDRPakd3bWF3MndESEdlZWlyOTYyU1B2WTRuRjBCN2pI?=
 =?utf-8?B?QlhkckwwK0hCZHFYZHZ2dVZScXNMaG5JTEdHalZvejJ6MklhcjVybWQxb1ND?=
 =?utf-8?B?Ylk1ck9SNGx6c0ZZNjdZNXh2eEtzVk9kMVVqRkRocllBbDNOOTZ1MVR5d3ZK?=
 =?utf-8?B?YTFSQlpyZDg3c0g0VU9PY3ZCNWt1YXRVYURXMVhyam5DUE1DYWhaSzE2dWor?=
 =?utf-8?B?VXpUWVdMc1ZKZGE0LzA3NzdqbmpjeTROUzRpTGpXYk50UXZxYkhCOTUrblRl?=
 =?utf-8?B?RFVlNTJSR2I2L0VHc2F0Q2xtcGZzenVkZjM2b3RZb05udk5VWlRZUldUUGR1?=
 =?utf-8?B?ZHBRNWVBQ2NzMUJsQlZuSzdmSXpMSlBOZTJ2YURaVVZndExxNVRFWkk3cXhJ?=
 =?utf-8?B?WFN6Tnd6aUY4OWgwVVM3WnlJRStyTEV3QzExZmEzenI4NTIxSzZwU2ErdzhG?=
 =?utf-8?B?UGF6Zlh3U3psVHJzYXEwc1RpS1VZcWNTY3ArQklKTUxQVEVXaWF4OE5oT01v?=
 =?utf-8?B?NzRVVWFDTzhPd1VBcDA1LzNPbG90b2p4VlUvRjdCc0hvbHdJcy91ZjJuREZW?=
 =?utf-8?B?QmFsQVZlTm9TTTJWMGx3WUdwQ1Q4aFkrdllpbW42U2c3RGhmV0lLS1YzTVUr?=
 =?utf-8?B?bHVvTUpSOWNVZXFJNnRVVDJURWxsTU4va1dGdzVBQndrZDc0V2trZGluNTc5?=
 =?utf-8?B?YVdCMjFOTk1WYjMwQ0tmdHlKNDdvM3Z5SUtRemtUVnoyM2JZdlhNNjRNVTU4?=
 =?utf-8?B?UlBsaGZvc2dDeW5vem1vMm5oMEUwZ1ZDSWN1dnhRRmZUK0pUMjB2SUtOZmcv?=
 =?utf-8?B?SERrRzkyb0tQZzVza3RMaENGQ1dWbllpclV1eGRuUHA3WjFNQnF4QkFncW5D?=
 =?utf-8?B?ekh1ZFhCeGVFbGdvMUVrV3N5YnRadHhqdzY0aDZ0YkRlM1FJL0h3eHFjeUFM?=
 =?utf-8?B?aUtPTWgzVWJiTXB2WkxsYVJweFRBZkFmTFJ6dk0zV01CTDd1TlphTDZmKzV5?=
 =?utf-8?B?U1V3czF3T29zZFNodjVub2tOR1ZrdzV0WGFZcWRFdURZa0lNNHRSVlFvdGtU?=
 =?utf-8?B?TDREcUtWbDlBb1NlV2hKQ3d4eCtHd1NQdXRITytCZ1hNekpIRWpsaGJwWW5a?=
 =?utf-8?B?MDdhUUNEcG40V2U4N0lvNEZBc2Q2Tmc2RW9wWGp5Syt5WEVTZVZ0dk1XblNV?=
 =?utf-8?B?QTNGNjMvL2hUOUhEVU9uN2JTdUFnUlg4VXpkSUkzNzNUaytIWW4zYVJjeTVo?=
 =?utf-8?B?V2tqL3ZieE9Hc2N4ejVEL1FoMVR3d2hrZ0d2YjJ0YVh2QXhhMzNSMFd1VFBt?=
 =?utf-8?B?cDRueWhwbWVoOTdCY3JBaDlTYm9JYjFqTHNTV3d0VTZURGdod1lFK3hIV1BY?=
 =?utf-8?Q?VbtLHgUYkuQoUfCAkzUkpRI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A56C58EF2DAC241937DC06E829CCD5D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4eaa8a0-d464-43ea-a610-08db679d7073
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 21:23:29.7038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKOYAlZS4xIbEoTKCY0a0SkieO8JsSp6nFXtvNgoPFbTdmmVju31v/gjHoUaY1A5Sp1ivkBD1cC3SyI9Uz2kF4S/aWxazIowXXA9AYnrEwnxRZbBxCU7x06tV0Y8ls8K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5504
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

T24gTW9uLCAyMDIzLTA2LTA1IGF0IDIxOjMyIC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gQWRkIGEgbmV3IGRlYnVnZnMgdG8gZHVtcCBpbmZvcm1hdGlvbiBhYm91dCB0
aGUgR1NDLiBUaGlzIGluY2x1ZGVzOg0KPiANCj4gLSB0aGUgRlcgcGF0aCBhbmQgU1cgdHJhY2tp
bmcgc3RhdHVzOw0KPiAtIHRoZSByZWxlYXNlLCBzZWN1cml0eSBhbmQgY29tcGF0aWJpbGl0eSB2
ZXJzaW9uczsNCj4gLSB0aGUgSEVDSTEgc3RhdHVzIHJlZ2lzdGVycy4NCj4gDQo+IE5vdGUgdGhh
dCB0aG9zZSBhcmUgdGhlIHNhbWUgcmVnaXN0ZXJzIHRoYXQgdGhlIG1laSBkcml2ZXIgZHVtcHMg
aW4NCj4gdGhlaXIgb3duIHN0YXR1cyBzeXNmcyBvbiBERzIgKHdoZXJlIG1laSBvd25zIHRoZSBH
U0MpLg0KPiANCmFsYW46c25pcA0KDQoNCmFsbCBsb29rcyBnb29kLiAob2ZjIHdlIGRvIGhhdmUg
dG8gZm9sbG93IHVwIG9uIHRob3NlIDIgYWN0aW9ucyBmcm9tIGxhc3QgcmV2J3MNCmNvbnZlcnNh
dGlvbiAodGhhdCB3ZSBhZ3JlZWQgc2hvdWxkIGJlIHNlcGFyYXRlIHBhdGNoKS4gRm9yIG5vdywg
dGhpcyBwYXRjaCBpcw0KDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRl
cmVzLmFsZXhpc0BpbnRlbC5jb20+DQoNCg==
