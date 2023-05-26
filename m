Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04982713030
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 00:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997BE10E0EB;
	Fri, 26 May 2023 22:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51EF10E0E5;
 Fri, 26 May 2023 22:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685141876; x=1716677876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7WGG1MlGGp52lJXFZ8rU6PcIUSQwAJNdOX7wOca42A8=;
 b=lFVpKQU9AkWY/IOCbci8Bg57Tiy09cGbIIS1H2g+93l6SsK65MP32JbD
 aL0XOw+dl6Xq/862pTXWuxKRuu1Hpd0NwNmG+5tgOvbq4YVg+K4Xl0BAd
 6WJxvyBHP1uL8RfuJnzIr5jLsjJkuiG4rAPIZcZYAN1IKhrKrypcD3Vfe
 WAqT5Y8ayI67dKl1A8QVJAw92s+fypuvywW6TOK0DY6kqAm7ORgO73e1z
 Rf0ZXKrOGFiqmKq+WriAzi9kDT3sK9J2pxM6ZeW+3ZfVmDGPSBhgGJ8IR
 F8SpK5Ac54iAxOmefWoXbh92hnhxRwPjlpPvOXEp6jTKzrEtlp83USisK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343823591"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="343823591"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 15:57:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="736164647"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="736164647"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 26 May 2023 15:57:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 15:57:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 15:57:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 15:57:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 15:57:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbyoDrzABgll8lVCXcHfes63JVMjbHwpJ9xPzKF/ZXVIAYakETwMSzyyyNGJ96iX+EFTtcEc0ZXygSTMMcy8uXRESliy2PfHAF4686A07OdQRiSewR96Xbb7V3Ekb466DfkO23vums/bGZ/rGmsM/ZbWPj4HtgfuME3+wp5tvwguI0V0j7UWLyag9zBbp88s+xF1Z5eueXbhW1hWHsdSSdCfxMm/0O9vL2W/NzJ93hIF/CCXMIf83snQtRtgxMzhwPUY+/omrmNfPil5S36oklzBBbtpX3VPJikeOB8J1CilZWtSuxXYNGditPkIvCM1lKCs+pH8dOuFYRZGO3rWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WGG1MlGGp52lJXFZ8rU6PcIUSQwAJNdOX7wOca42A8=;
 b=dJaqnf9eJBP5K1qmOPCHOdVxLNmHGaM2uIAIPdcRa2M+Sx944BIdwLz9YrdvaPKmMW1XDtniHsGt8/Tx5z1eWA835jSxdS38cBs1HgXQOPKUylrTxb+2crxHx0Wdc4Jl0dGkonG1v0KHXeGH/86nHFAFa3zRbVHQSrZETP9XTZ5FehqdZH15Aptzq30icJaZRrU+2kkn4VOoPNWtemJnEHRSbAQJRUvlIp0Jk5grebfmOEFFuEEbRjR65sXYh95NA0DX2Q5WuzLyfLdxfMsfYWsC7vmaX+m3m6YXgRYTccJARwoo1dZDvnq5SAnMa+5x/FLhiR7jmMRCROlyekjGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CYYPR11MB8387.namprd11.prod.outlook.com (2603:10b6:930:c8::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Fri, 26 May 2023 22:57:52 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d1ab:847f:78e4:a306]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d1ab:847f:78e4:a306%4]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 22:57:52 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/i915/uc/gsc: Add a gsc_info debugfs
Thread-Topic: [PATCH 6/6] drm/i915/uc/gsc: Add a gsc_info debugfs
Thread-Index: AQHZf2tln2uj94bTo0S3qc9XZ1lTSa9tTCWA
Date: Fri, 26 May 2023 22:57:52 +0000
Message-ID: <63637814b7d02639de39287ec92eace9f3aff46a.camel@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-7-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230505160415.889525-7-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CYYPR11MB8387:EE_
x-ms-office365-filtering-correlation-id: 6d8c2d12-186b-4f6b-b79f-08db5e3ca2b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YYFfeEH7ICuQfG7ILSVprnKRA5MAfae3rlaJ98WNOi6SILOF6K62FhOY3ummdFrocmLpGlTxPSu+5hc2h5VIeE6JrPvoOLTQXCOY5VrtnFehSsO0IOj+3zPg8jOQLMMo2K8UyeoOVGx0ZPjnUoJcWEENbA2uv9sQs3jGJQB17vhQZ0p9+ypJacOzwW/yPxMsASXSeVrFxiIFm+co+i43U3b+RrQqFhPLDsXIxQGLToD/kLnsVC04Y57cxn8cf16sLtY0n3FZINy1iVS60/Zf04MIqxEV6vmc8FbR4mgJFQOTqSuLjg3SvDw0TvyqHrfQg1TNO9ywbrChDud2yiL9oXpnqAFVdR5xY+klzu31UB9RyNhiLsLovMmwn7rvZkwsEUTRUajvoTxCjVHOUvnPSx93lOfe0Omq5aXa38btGkO/+Bl9OeMsV92nvU1RWCYSPkBvAWDj04dq8IdcSG8ZeLyg85qkOhFDXJTIBWmAkK3SSBBSnMlclL8EvnH+CjOyAK7TeFsPENjDwuWXefuyHn24+iqplyEvOlvWFR3FmN0vj25lRgNRlNFXncQLsYX8HEV5XR9kJPzs5GNJwTZicDlGwsHyrdG2ZvoNYm3x64bskdKBhFtc+IIkLtCc/5NX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199021)(450100002)(66476007)(66556008)(66446008)(64756008)(76116006)(91956017)(66946007)(478600001)(54906003)(316002)(4326008)(110136005)(86362001)(36756003)(38070700005)(83380400001)(2616005)(107886003)(6506007)(6512007)(186003)(26005)(8676002)(2906002)(5660300002)(6486002)(71200400001)(8936002)(82960400001)(122000001)(38100700002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkswY1M0QzVCTzdoNTE1RlkzUXQ3SmRXTVRvZEorUVc5ZTJtR3krVlU2Mngz?=
 =?utf-8?B?TmNOWGhsR25OUzQ0VjdFS2ZmRFVmeHlPWWVrOFRuSHVKeWRyQjdYdGM1d0Z6?=
 =?utf-8?B?SSs1STVKYTdZaWxYRFV2NzVZZ3EyRk91VFdwc3R2U0sxSTdta2huM2N4YXh4?=
 =?utf-8?B?VnI5WE1POHlpbCtuVkFtUGlBN1BVZWZ2cXMyeTVuSUtqVXZmeDBQeGswT0p2?=
 =?utf-8?B?SmVJWnlySGJ3Z2NWSVVFTVpzdTIzdGFIaXRvaExSTm83bDNYRUppUzdDcFNX?=
 =?utf-8?B?cDRRZTQ3aFNMUzBQK0pSaDJkRDZjV2VyWkpMenA2VHZxVlF2SnRuczdkaG5Y?=
 =?utf-8?B?MEdQQVlMUjY4ajFIbUFla3lJaVlLV0h5aDYwWUJyd1FOYWpjNmNrNE9kOWtO?=
 =?utf-8?B?NFQ1UW03Zkc1M1FaeEdtQkJWRDFYcC9PQjVpdjJQNHdIbVNRaFJnS25DMEhm?=
 =?utf-8?B?KzR3eWtLbTkvRmpiV2huZGhDeWJKT2RQbUFFUXpNZ3IwVkptam94WEFmbm01?=
 =?utf-8?B?VytQYUNnTWJVaXRTRlZuNlhUNnpmWjFQZlM1TUZiR25tak9VRzZTV2lGeTEx?=
 =?utf-8?B?RStqakw1K1NCMnByUW94Wm5LRFdhSElGYkd5SmVmNEVQQklKdGxzNDB5Wis3?=
 =?utf-8?B?empmR0lMR3UwdU1KQ2VkL2VaRWpENk5YcmwrRWYxUVR3QmZMN1FGbU5uSFlk?=
 =?utf-8?B?b0NyUnluNUp1bGxzMllncktSUi9tOGFzNDRqak1oY1ltT1NKbGFVbzJEdUZW?=
 =?utf-8?B?N2h5aXE2REZXcEFkRGlKbVBxVWx3RmVzMGgwSUhBKzdYcGM4bGdMZUl3RXJz?=
 =?utf-8?B?Um5uZDRZQi8yZmtFZDcxQUJvMGlzVHBmOVVNTmZrcUs5VWkwM2cvVzA2UnhU?=
 =?utf-8?B?VGdiT21NU3VBMklObk52ZnB6Q3ordndnQXIzRjJVY3NNVzJQNzkxNkhPSDJ1?=
 =?utf-8?B?RDZBa0QyZlpyODllNG1VU3dLWnRpWjJ0dzdRN244NTlISnd3QjNwMnMxUURR?=
 =?utf-8?B?cUdFTC9uZ01DOGlSLy9UMWlVVWVwRDNYNUFYaS8xMU04R3h3OGVqNWw5cUlW?=
 =?utf-8?B?N2ZtRTRGY2R4TTBYOXZ6RVZIWHF3NUlTM1lnVHlreGNkRlBYcmdOeFhabElV?=
 =?utf-8?B?ZXlsLzJWeERlazl4QWR1cWxOcldNUTBNcmFBTWsvcmFnYzhCU1IvdHZUdHRX?=
 =?utf-8?B?Q2owQkg3RTFhQWsyL2NpeVZjcUtxeE1wNDJDWjJaZzlnVWd2U0YxS1JWUkN3?=
 =?utf-8?B?T1gvbFdmUEVlOFNGWjNCR0J5WmZMcjJzUlJiVW9IZVZzYUVkRC9lUytreDRF?=
 =?utf-8?B?SGVhMjhLc2syTytvQU5QV1JuZ2RuN21GcDBRbGxkRVE5V25iZzhFMVVGUjVq?=
 =?utf-8?B?T3o4dHlwL0FLZ3Y0bDd3K3RSbDlmdi9vQVJ5b0I3MFhaV01ZUHdJdjQvWEZ5?=
 =?utf-8?B?SGhJYTVjMFVDbmMxV3BzRTFkTTBnc3ZoRGllY2QvS29ZT1RCbjFFZ1FJYTNY?=
 =?utf-8?B?aU9IaWtnNDVtNENXSXR3N29lMnQ3Z0RCZFJLZEVMcE13WWtvQkVCN1VWbXQw?=
 =?utf-8?B?d0lvZkF4cFVxQ00rQlh5akdaNjlKSWZEZDdKdTluMFdiLyswNEJNSU0vMnA2?=
 =?utf-8?B?c3BLY1dVLzllTEtVNEdpeFQvaFFpOGhPUHUvVk9NTjhIU3JWZ0hpcVRSdmo0?=
 =?utf-8?B?OTUzVTZOYjFtSlFoUHRMZVFpY25PTDRsQit0MDZZMW16YUdTeVJRL2Fka1ZQ?=
 =?utf-8?B?YXlSYnA2N0lVeGFKTzBXVkw4UmhWS1kxR2x4N2ViV0V2N2pGKzJaVEQ2SXBK?=
 =?utf-8?B?VkU3Q1ZVeWMyaS96S244NFRsblFFSzV1RU0xS0sraTdwYXlsYnZBY2pMOFJx?=
 =?utf-8?B?US93UEVjd251WVgzYldsQ2JMbytnSFpuMzNxbVNwWGZybDlXbk0yRFd3QzdH?=
 =?utf-8?B?SGJwTEdMZC92WkZwT3p4TDhoZENhWktEWHVQSFZHR1RrOS8reElxY1FDY2Ex?=
 =?utf-8?B?eDNNQnBBOWpFM3IwbnhUZE5zKzBUdlVNdFRDQmFVT21UTGNpTzR5K2kzdzhM?=
 =?utf-8?B?SmNuWVZZcWhpOS9mRjVTUGxHNlFUWkhvTnVJK25nQmtZTWtlZExhWVNTMlFS?=
 =?utf-8?B?eU5OZUE0dngwME5aUGVtN04rU0JQY010S0pPaHFEb2hPMC9WRGRMWnRGT2tB?=
 =?utf-8?Q?p0VEucw+fW5unASKMEnCayI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A0E392FDEDF044A9EC44861690FE402@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8c2d12-186b-4f6b-b79f-08db5e3ca2b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 22:57:52.3671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZby5MpT18RCPqyN/ZkjpdvWjyw3teR6LDFEbu8rikOe5nC5UXicEYirKP6NbFIY+PKvhrR0d/c3QOCEM/8eXwTOEPYbw4vBOPHJCH8yzOGlT/89LN9mlnP1ow4SeZKH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8387
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

T24gRnJpLCAyMDIzLTA1LTA1IGF0IDA5OjA0IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gQWRkIGEgbmV3IGRlYnVnZnMgdG8gZHVtcCBpbmZvcm1hdGlvbiBhYm91dCB0
aGUgR1NDLiBUaGlzIGluY2x1ZGVzOg0KYWxhbjpzbmlwDQpBY3R1YWxseSBldmVyeXRoaW5nIGxv
b2tzIGdvb2QgZXhjZXB0IGZvciBhIGNvdXBsZSBvZiBxdWVzdGlvbnMgKyBhc2tzIC0gaG9wZSB3
ZSBjYW4gY2xvc2Ugb24gdGhpcyBwYXRjaCBpbiBuZXh0IHJldi4NCg0KPiANCj4gLSB0aGUgRlcg
cGF0aCBhbmQgU1cgdHJhY2tpbmcgc3RhdHVzOw0KPiAtIHRoZSByZWxlYXNlLCBzZWN1cml0eSBh
bmQgY29tcGF0aWJpbGl0eSB2ZXJzaW9uczsNCj4gLSB0aGUgSEVDSTEgc3RhdHVzIHJlZ2lzdGVy
cy4NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9n
c2NfZncuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY19mdy5jDQo+IGlu
ZGV4IDBiNmRjZDk4MmIxNC4uMzAxNGU5ODJhYWIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfZncuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC91Yy9pbnRlbF9nc2NfZncuYw0KPiBAQCAtMTIsMzYgKzEyLDMxIEBADQo+ICAjaW5j
bHVkZSAiaW50ZWxfZ3NjX2Z3LmgiDQo+ICAjaW5jbHVkZSAiaW50ZWxfZ3NjX21ldV9oZWFkZXJz
LmgiDQo+ICAjaW5jbHVkZSAiaW50ZWxfZ3NjX3VjX2hlY2lfY21kX3N1Ym1pdC5oIg0KPiAtDQo+
IC0jZGVmaW5lIEdTQ19GV19TVEFUVVNfUkVHCQkJX01NSU8oMHgxMTZDNDApDQo+IC0jZGVmaW5l
IEdTQ19GV19DVVJSRU5UX1NUQVRFCQkJUkVHX0dFTk1BU0soMywgMCkNCj4gLSNkZWZpbmUgICBH
U0NfRldfQ1VSUkVOVF9TVEFURV9SRVNFVAkJMA0KPiAtI2RlZmluZSAgIEdTQ19GV19QUk9YWV9T
VEFURV9OT1JNQUwJCTUNCj4gLSNkZWZpbmUgR1NDX0ZXX0lOSVRfQ09NUExFVEVfQklUCQlSRUdf
QklUKDkpDQo+ICsjaW5jbHVkZSAiaTkxNV9yZWcuaCINCj4gIA0KYWxhbjpzbmlwDQogDQphbGFu
OiBidHcsIGp1c3QgdG8gYmUgY29uc2lzdGVudCB3aXRoIG90aGVyIHRvcC1sZXZlbCAiaW50ZWxf
Zm9vX2lzLi4uIiBjaGVja2luZyBmdW5jdGlvbnMsDQp3aHkgZG9uJ3Qgd2UgdGFrZSB0aGUgcnVu
dGltZSB3YWtlcmVmIGluc2lkZSB0aGUgZm9sbG93aW5nIGZ1bmN0aW9ucyBhbmQgbWFrZSBpdCBl
YXNpZXIgZm9yIGFueSBjYWxsZXJzPw0KKGp1c3QgbGlrZSB3aGF0IHdlIGRvIGZvciAiaW50ZWxf
aHVjX2lzX2F1dGhlbnRpY2F0ZWQiKToNCiAgICBzdGF0aWMgYm9vbCBnc2NfaXNfaW5fcmVzZXQo
c3RydWN0IGludGVsX3VuY29yZSAqdW5jb3JlKQ0KICAgIGJvb2wgaW50ZWxfZ3NjX3VjX2Z3X3By
b3h5X2luaXRfZG9uZShzdHJ1Y3QgaW50ZWxfZ3NjX3VjICpnc2MpDQogICAgYm9vbCBpbnRlbF9n
c2NfdWNfZndfaW5pdF9kb25lKHN0cnVjdCBpbnRlbF9nc2NfdWMgKmdzYykNCg0KDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Yy5jDQo+IGluZGV4IDJhZTY5M2IwMWI0
OS4uNTQ3NWU5NWQ2MWM2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91
Yy9pbnRlbF9nc2NfdWMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRl
bF9nc2NfdWMuYw0KPiBAQCAtOSw4ICs5LDkgQEANCj4gICNpbmNsdWRlICJndC9pbnRlbF9ndF9w
cmludC5oIg0KPiAgI2luY2x1ZGUgImludGVsX2dzY191Yy5oIg0KYWxhbjogbml0OiBub3QgdGhp
cyBwYXRjaCdzIGZhdWx0LCBhbHBoYWJldGljYWxseSwgaW50ZWxfZ3NjX3VjLmggaXMgYWZ0ZXIg
aW50ZWxfZ3NjX3Byb3h5LmgNCj4gICNpbmNsdWRlICJpbnRlbF9nc2NfZncuaCINCj4gLSNpbmNs
dWRlICJpOTE1X2Rydi5oIg0KPiAgI2luY2x1ZGUgImludGVsX2dzY19wcm94eS5oIg0KPiArI2lu
Y2x1ZGUgImk5MTVfZHJ2LmgiDQo+ICsjaW5jbHVkZSAiaTkxNV9yZWcuaCINCj4gIA0KPiAgc3Rh
dGljIHZvaWQgZ3NjX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgew0KPiBAQCAt
MzAxLDMgKzMwMiw0NiBAQCB2b2lkIGludGVsX2dzY191Y19sb2FkX3N0YXJ0KHN0cnVjdCBpbnRl
bF9nc2NfdWMgKmdzYykNCj4gICAJcXVldWVfd29yayhnc2MtPndxLCAmZ3NjLT53b3JrKTsNCj4g
IH0NCj4gKw0KYWxhbjogYnR3LCB3aHkgYXJlIHdlIHB1dHRpbmcgaW50ZWxfZ3NjX3VjX2xvYWRf
c3RhdHVzIGluIGludGVsX2dzY191Yy5jIGlmIHRoZSBvbmx5IGNhbGxlciBpcyBnc2NfdWMncyBk
ZWJ1Z2ZzPw0Kd2h5IG5vdCBqdXN0IG1ha2UgaXQgYSBzdGF0aWMgaW4gdGhlcmU/IHVubGVzcyB1
IHBsYW4gdG8gY2FsbCBpdCBmcm9tICJlcnJfcHJpbnRfdWMiIC0gdGhlbiBjYW4gd2UgYWRkIHRo
YXQgaW4gbmV4dCByZXY/DQoNCj4gK3ZvaWQgaW50ZWxfZ3NjX3VjX2xvYWRfc3RhdHVzKHN0cnVj
dCBpbnRlbF9nc2NfdWMgKmdzYywgc3RydWN0IGRybV9wcmludGVyICpwKQ0KPiArew0KPiArCXN0
cnVjdCBpbnRlbF9ndCAqZ3QgPSBnc2NfdWNfdG9fZ3QoZ3NjKTsNCj4gKwlzdHJ1Y3QgaW50ZWxf
dW5jb3JlICp1bmNvcmUgPSBndC0+dW5jb3JlOw0KPiArCWludGVsX3dha2VyZWZfdCB3YWtlcmVm
Ow0KPiArDQo+ICsJaWYgKCFpbnRlbF9nc2NfdWNfaXNfc3VwcG9ydGVkKGdzYykpIHsNCmFsYW46
IHRoaXMgd2FzIGFscmVhZHkgY2hlY2tlZCBpbiBjYWxsZXIgc28gd2UnbGwgbmV2ZXIgZ2V0IGhl
cmUuIGkgdGhpbmsgd2Ugc2hvdWxkIHJlbW92ZSB0aGUgY2hlY2sgaW4gdGhlIGNhbGxlciwgbGV0
IGJlbG93IG1zZyBhcHBlYXIuDQo+ICsJCWRybV9wcmludGYocCwgIkdTQyBub3Qgc3VwcG9ydGVk
XG4iKTsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCmFsYW46c25pcA0KDQoNCg0KPiArCQkJZHJtX3By
aW50ZihwLCAiSEVDSTEgRldTVFNUJXUgPSAweCUwOHhcbiIsIGksIHN0YXR1cyk7DQphbGFuOm5p
dDogZG8geW91IHdlIGNvdWxkIGFkZCB0aG9zZSBhZGRpdGlvbmFsIHNoaW0gcmVncz8gKHNlZW1l
ZCB1c2VmdWwgaW4gcmVjZW50IG9mZmxpbmUgZGVidWdzKS4NCmFsYW46c25pcA0KDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWNfZGVidWdmcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjX2RlYnVnZnMuYw0KPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmRhOWY5NmI3MjI5MQ0K
PiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVs
X2dzY191Y19kZWJ1Z2ZzLmMNCj4gQEAgLTAsMCArMSwzOCBAQA0KPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIwIEludGVsIENv
cnBvcmF0aW9uDQphbGFuOjIwMjM/DQoNCmFsYW46c25pcA0KDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWNfZGVidWdmcy5oIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjX2RlYnVnZnMuaA0KPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmM0MDVlNTU3NDI1Mw0KPiAtLS0gL2Rldi9u
dWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Y19kZWJ1
Z2ZzLmgNCj4gQEAgLTAsMCArMSwxNCBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IE1JVCAqLw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIwIEludGVsIENvcnBvcmF0aW9u
DQphbGFuOjIwMjM/DQphbGFuOnNuaXANCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvdWMvaW50ZWxfaHVjLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRl
bF9odWMuYw0KYWxhbjpzbmlwDQoNCiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L3VjL2ludGVsX3VjX2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Vj
L2ludGVsX3VjX2RlYnVnZnMuYw0KPiBpbmRleCAyZjkzY2M0ZTQwOGEuLjZkNTQxYzg2NmVkYiAx
MDA2NDQNCmFsYW46c25pcA0KDQoNCg0K
