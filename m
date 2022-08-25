Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA055A1672
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 18:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEC110E4EE;
	Thu, 25 Aug 2022 16:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FA010E4BA;
 Thu, 25 Aug 2022 16:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661443991; x=1692979991;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=A7LrF+W8QAjAyc5nDnlB7U/8KbL0AVVHIZd3n9GyZ28=;
 b=O/q45QCR8b9/fdt3nd4m7W0M9vUVHvZ8A+TXRQLMcT4TOTm6kx7zI0jx
 eU3JB1Za+BH/jHFbm+KX7oqpZUJZYX4YTrt8AKZzHBLyO96PTBQU3NqgG
 uS8jbDEc0c2y/sliA1ov08I3phbsnq3NCZrsmSEFlryy3ipsQY7nQXeH2
 AmuXglNrCXHMBD5j/HfeUBzhqPZxXvrXVStmyMmyilBEq+eGJ2QEe6e95
 h4qmvSqT3BkoPnfIKvIhYawVam+eKkmxZzmv9hA/ghqDTjdrvryx9tY99
 YKmFiLGm+q2f5vzP2o3xm+amF+HpQEaWoRrnTjtremjy998mOA7idaKoG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="356003305"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="356003305"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 09:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="699519001"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2022 09:11:46 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 09:11:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 25 Aug 2022 09:11:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 25 Aug 2022 09:11:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsyBtEwl9ZRJq67vxOsqOYrMZ9ubooFYlS7ayQaaM1GZTxez4xXTtCxMy0jRaikb5ztp1EnchEPL5ptAkeCJJbi83HFxM2GfearGOxh5aoJmv7AIyzbwZcJvac0tKlb33f0IdLnUkvWRb+oJ4E6YdkT50IFU4+OVX4MfyKHuexeD/Ujy58emuC7XSU9uxMhxIo+l0SG/skSRXG1sh328OGDfJTiyddOvgVox5rWKEaSoSk3gqpIQsiVzJeadhub3wrw/4ZYFqJMG2aq27lJRd25jRGNPmaN1ZHRrQj8IZqYY/SFrRaAOg7V2/h6KF/DsBC4+222r2CYKjNU9vxRB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7LrF+W8QAjAyc5nDnlB7U/8KbL0AVVHIZd3n9GyZ28=;
 b=UU/fBmAZzAhPS0qKVSPh9k91WJFM+2oLfvXPk+R4iFHCdmENSih00dT8v/VHM9iZ0Szi5tDxABDYptfXFvFdcPxS6AtvobF6lnqv1sREhZr/yHWksXgqZEJp+WZffgBA7Dp7cEHV+HlDzi+U5uY9hkDty4Q+p34tltJM5miD2vfT0WaipJHDyD+pkoF2FXN8i0PgiUObFyRgD4s0v25JOdleCaQdHTPRzc28n8l5wIYmVARrNGZ0lkhvRCqyEbbVChvoPrhDYnyqp+20rzWXow5K6WrLxULpeaLLZ4pGhkDOZeipwe3gtOU2Y3SAEuF7WiYhNWw93dQqWdFa6LVbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 16:11:19 +0000
Received: from CO1PR11MB4962.namprd11.prod.outlook.com
 ([fe80::cc64:11a0:a0c1:93af]) by CO1PR11MB4962.namprd11.prod.outlook.com
 ([fe80::cc64:11a0:a0c1:93af%8]) with mapi id 15.20.5566.014; Thu, 25 Aug 2022
 16:11:19 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: Add missing DP DSC extended
 capability definitions.
Thread-Topic: [Intel-gfx] [PATCH 1/2] drm: Add missing DP DSC extended
 capability definitions.
Thread-Index: AQHYtgtCsVQgHRAZDE+SzLzYoFO5Wq2/zocA
Date: Thu, 25 Aug 2022 16:11:19 +0000
Message-ID: <4446a0d8ac34e652446fcbadf8b2d8f8c4971793.camel@intel.com>
References: <20220822094037.15483-1-stanislav.lisovskiy@intel.com>
 <20220822094037.15483-2-stanislav.lisovskiy@intel.com>
In-Reply-To: <20220822094037.15483-2-stanislav.lisovskiy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7859e73d-79f2-4229-cd98-08da86b47259
x-ms-traffictypediagnostic: PH0PR11MB5577:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iVw46kr59UjiOlDhnM7+owyTKnsUNzXahss1wc1CamHu85++7IGCSadE80x5em2nz3ZHEVCfOpPEABtspOp7KiM3g9OXhbrOhHNJVzMhefXZE2FYJkVxZ3gXbJIq0J6OHjyBelb1JduVNxNiwhbUIqlSKBvra90EpUUvCgUiM+U1YXBmkFTheb6DiD8/aTNdMHAkW5xI52ZOysSsErkqeLSv14P+IKOjWmrQUedAms+G9vctXc7oImhTkdE/WSnCHEGfoba2eCQBINUKtxm+yswu97XypyyZ03CK1pwgcoGuXQpIdbsjG4gM39MKpMfaXLx7OkmU0U/I8/ZXACUwY3xtuz06HkgpIv7VBrTEp9YbU4GylpMYRPf+FDXuupOyqkPEAjuiFdxtCIMyZeUTgPNA0AjjRLpuZ4hN3GyVPoYdlUgv7jtxneqT6gFypK09zEeYiKxiUJmewtYqgf+HGuLwxWQlSIhEOp73QwFZhfGxWYus1pWEnJxoPKLbXdl9GGJCSEQ4QBKSbbfGa+Xixplrh+AokoAlxjV7ZVOnUMpUHsXEUX7PH499TIJmESLu0p7fn7mLhbHPOQT/eFLnllNokA+S39HH99jcJQx6afF8jNoMFiozsoMr/M75ctfrXA71z0RIeP15GlLvbJ4EiPHKeNNT9VmIp9KxafcLJWWKKMQDuhOGMwJrUYB5THK+/maQTt45Ax5Q/gmNYFrdbNrlYDAfd4MDuAQbaIePtR8XCqgVKk773bHw6ZuDeGH5Ph3kXk8l8Z7iTa+jtUhYeTEkToX+3Vrw9RVVom9JToQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4962.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(366004)(346002)(136003)(19627235002)(71200400001)(316002)(110136005)(54906003)(5660300002)(41300700001)(2616005)(6506007)(2906002)(186003)(6512007)(26005)(107886003)(36756003)(38070700005)(86362001)(82960400001)(83380400001)(6486002)(478600001)(4326008)(64756008)(66476007)(91956017)(8676002)(76116006)(66946007)(66556008)(450100002)(66446008)(8936002)(38100700002)(122000001)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnVzcjRHT1phd09RQzBVeHozaW1MUGFhQ0lXRnJNZWlGWnNhQzZKSm1wTENP?=
 =?utf-8?B?MzE4QS9hSUJBbTZRazBHckJlRjR5WlB6aE1YR1lydlQ5dmNWcUVsdW1JVGVI?=
 =?utf-8?B?aEtHQ3FoQmVvR1hQYWlnei9jYjRORTB3RVFVUm52aSt3MEVmQmNBL2RVbGl2?=
 =?utf-8?B?dCtnSHdSNjJ2V3JKMlNPS1Q0Q2lCUFkwaThkUUdlekFxdjBkeFU3aXZveVZt?=
 =?utf-8?B?RUNMaEdWZFIzZEpSNkcxL1NsTUROUGh2OUZQOVR1UFpXb1V6WjVwRnBHeHh5?=
 =?utf-8?B?eWllNTFSd0k0bDZVeHJLNmRIdHVzVFdrSklnMit1b3RhQXlBNE1CSGkvRm16?=
 =?utf-8?B?ZXcwb0p1SnU3alBGUWplWmVmbmgyYmxYZnl6Y0IrRVZoY2xLUjRwK1QwMmE2?=
 =?utf-8?B?dGRENjNuamZPVXRReXhNNUZPNjloQUtXUVY2ZWlXbTh2dTRYelJBcUxYNE5M?=
 =?utf-8?B?SXhJM0dXeFljV3JYdXlEVldKWFVzSU1PdjVXVkZOaURXbUQ5VS9ZV1d4NnpF?=
 =?utf-8?B?SlpDNGJkN29NK2xwMTh2RlRTbGd4cjd3MFNUZWpWOHJtTkN1VFdvNWlmWnVW?=
 =?utf-8?B?ZWU3VXNNbzNrQmNZTm53ZnRhNmVRZURQd0JPVURYYkN1WGVDQWdOZStZcEF1?=
 =?utf-8?B?VWUzTFB6ZGFXMHFCQnNkZE5jcjhOVk05eUdPNDZ0azJ0TGVrUFkvVUprZ0tQ?=
 =?utf-8?B?QzQzYnM0OEtlK01jWndqTU1HbFVzK2grd2F5d3BpRzl3N1Y4VXpOclJablBl?=
 =?utf-8?B?Y09mTU1pQWkyMmhBdWo2RWgzSnhxTVpPK2t2YmR0aEJCdWdXSndscWxVWnNM?=
 =?utf-8?B?dWZkaDk2bW5NZXowcDVxaDE4RDZpUktiY0dqRjZmT2NldXpIU01EU3lxY0RL?=
 =?utf-8?B?cnR5ZWFwZlZhZEdubjFsNzM1R0d5a3VIWHFLNHpnN3BxV1lWbW5RZ3FUVFNS?=
 =?utf-8?B?VGRKU3dGc0dDREtwNHJMMjJMQTM2UkwwTkliK3VTWXZEWHo1MGtXdGdlYXI3?=
 =?utf-8?B?S3RDcnNwRUNrUnpIaUNxSW51YitKTmZ4cFpFVytmbHFLZW5qK0FmTllRaHFT?=
 =?utf-8?B?TmdiNHRVWmk4QVV0S2huN1BuamlaTlJFK1BoWjFYb05OSmJpZkJOMkFlQS9j?=
 =?utf-8?B?dWNycUwwR2JSQ3ZxaGxjbHlHS0JJTFhnTDA2NW5TQlJRdjlNWjVrZmM3aGNp?=
 =?utf-8?B?Z093cE5tMm5LanZjcXV3cVF0ZDVZdnhteHZHcy9wY2pMT3dXMkRrRiszbUdj?=
 =?utf-8?B?MDJmWklQdE84TUgvOURveHRhVHFqT1lPdkRVcVJvNHdsK3pab29WaHZyb25Z?=
 =?utf-8?B?U2FxcjJwcHdrVjFabCtDNGY2M2lRb0RlVnJoaWZjeHkzTUM3NDRJRXc0TzAx?=
 =?utf-8?B?Zk5DM1Z5UkJvV1cyRi9wN0RiVUJmMUpadDFHQzdSQXFtbkZJaVZCODhUcXcv?=
 =?utf-8?B?cGVKWlh0T1EwOHpYams3MXAwbCtYcGFlUElBVnkyd2dtOXFlZDR2SkhBL3lU?=
 =?utf-8?B?ZFN3bVJMdEdzaWdXM2l5WFpxUWRzMUxWWDA0aElxQk5vbVpSMFhCNEp0akRi?=
 =?utf-8?B?YXdHNDdLL1E0TmxTYjdtbVJEbGc4Rng5aktxYXljaXpzblYwdlptZnRYQ2Vm?=
 =?utf-8?B?Y010Uy9Id1hCekQ0eEJBQ2ExOHBiaFF4b25NWlBJcE1JMU9Lb29IQi9EeUls?=
 =?utf-8?B?aTFNUm5DMURVL2o2SnlMYUttS3hQbXJyRzhvbDZDVHpnS0tlL29wenB1SnZh?=
 =?utf-8?B?b1I0cWZSV2ZURWpJWDhvZ2FlVXhvdmxaR1dDd2ZkRHVEdXdITUdrMEhmSWJx?=
 =?utf-8?B?YTB6ejB6YlBLbjFUUldhVkVSd3krT2tKQUgxSncxWTRwcnd1cWFSMHNsWGNm?=
 =?utf-8?B?TDdEUXVGRHFsdXBpNEQvd2c3WStkbmpVNFVIQnNsZUdjWFdFRjE4eFFFTGo3?=
 =?utf-8?B?QlJwejgrVzVxYWg2Y1pJMnNNMzhQdVpVaExvaHdGUit3ZlQ5d3hQa21mTEph?=
 =?utf-8?B?UGZhQTcwemY3SDk4SlQwMm1RRGNRWk92ZjlVbDExc1dtVEJ5em5raFMzRVdU?=
 =?utf-8?B?dkp6RVV3U0xBNmJqWitHOVlSdGR5d2k0Zko5Lzd4VmV5Ym5KR2tYb3dydC94?=
 =?utf-8?B?eGcvaGZiZlBzUlZOQ2pTSEVVSmVKajFvYSsrbFhiOWFkeHpQK0wvdjJZWVAv?=
 =?utf-8?Q?4s4inZL4JpvjThsu9OW9Na0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCC5B719FB95D24995ECFB575D06BAEE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4962.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7859e73d-79f2-4229-cd98-08da86b47259
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2022 16:11:19.6601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tUQbIRsPkTvJ+693ADxhLfIudSauCc1tJqkpE7LK8PoJhSYiSZF7bARa7a7A1HaHPtvINsYfy5cVRnrbOVJ3cuGwtwZ273iICoF/us4SF7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50
ZWwuY29tPgoKT24gTW9uLCAyMDIyLTA4LTIyIGF0IDEyOjQwICswMzAwLCBTdGFuaXNsYXYgTGlz
b3Zza2l5IHdyb3RlOgo+IEFkZGluZyBEUCBEU0MgcmVnaXN0ZXIgZGVmaW5pdGlvbnMsIHdlIG1p
Z2h0IG5lZWQgZm9yIGZ1cnRoZXIKPiBEU0MgaW1wbGVtZW50YXRpb24sIHN1cHBvcnRpbmcgTVNU
IGFuZCBEUCBicmFuY2ggcGFzcy10aHJvdWdoIG1vZGUuCj4gCj4gdjI6IC0gRml4ZWQgY2hlY2tw
YXRjaCBjb21tZW50IHdhcm5pbmcKPiB2MzogLSBSZW1vdmVkIGZ1bmN0aW9uIHdoaWNoIGlzIG5v
dCB5ZXQgdXNlZChKYW5pIE5pa3VsYSkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGFuaXNsYXYgTGlz
b3Zza2l5IDxzdGFuaXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4KPiAtLS0KPiDCoGluY2x1ZGUv
ZHJtL2Rpc3BsYXkvZHJtX2RwLmggfCAxMCArKysrKysrKystCj4gwqAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2Rpc3BsYXkvZHJtX2RwLmggYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oCj4gaW5k
ZXggOWUzYWZmN2U2OGJiLi4wZDA1ZTMxNzJmOTYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0v
ZGlzcGxheS9kcm1fZHAuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgKPiBA
QCAtMjM5LDYgKzIzOSw5IEBACj4gwqAKPiDCoCNkZWZpbmUgRFBfRFNDX1NVUFBPUlTCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwNjDCoMKgIC8qIERQIDEuNCAq
Lwo+IMKgIyBkZWZpbmUgRFBfRFNDX0RFQ09NUFJFU1NJT05fSVNfU1VQUE9SVEVEwqAgKDEgPDwg
MCkKPiArIyBkZWZpbmUgRFBfRFNDX1BBU1NfVEhST1VHSF9JU19TVVBQT1JURUTCoMKgICgxIDw8
IDEpCj4gKyMgZGVmaW5lIERQX0RTQ19EWU5BTUlDX1BQU19VUERBVEVfU1VQUE9SVF9DT01QX1RP
X0NPTVDCoMKgwqAgKDEgPDwgMikKPiArIyBkZWZpbmUgRFBfRFNDX0RZTkFNSUNfUFBTX1VQREFU
RV9TVVBQT1JUX1VOQ09NUF9UT19DT01QwqAgKDEgPDwgMykKPiDCoAo+IMKgI2RlZmluZSBEUF9E
U0NfUkVWwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MHgwNjEKPiDCoCMgZGVmaW5lIERQX0RTQ19NQUpPUl9NQVNLwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAoMHhmIDw8IDApCj4gQEAgLTI3NywxMiArMjgwLDE1IEBACj4gwqAKPiDC
oCNkZWZpbmUgRFBfRFNDX0JMS19QUkVESUNUSU9OX1NVUFBPUlTCoMKgwqDCoMKgwqAgMHgwNjYK
PiDCoCMgZGVmaW5lIERQX0RTQ19CTEtfUFJFRElDVElPTl9JU19TVVBQT1JURUQgKDEgPDwgMCkK
PiArIyBkZWZpbmUgRFBfRFNDX1JHQl9DT0xPUl9DT05WX0JZUEFTU19TVVBQT1JUICgxIDw8IDEp
Cj4gwqAKPiDCoCNkZWZpbmUgRFBfRFNDX01BWF9CSVRTX1BFUl9QSVhFTF9MT1fCoMKgwqDCoMKg
wqAgMHgwNjfCoMKgIC8qIGVEUCAxLjQgKi8KPiDCoAo+IMKgI2RlZmluZSBEUF9EU0NfTUFYX0JJ
VFNfUEVSX1BJWEVMX0hJwqDCoMKgwqDCoMKgwqAgMHgwNjjCoMKgIC8qIGVEUCAxLjQgKi8KPiDC
oCMgZGVmaW5lIERQX0RTQ19NQVhfQklUU19QRVJfUElYRUxfSElfTUFTS8KgICgweDMgPDwgMCkK
PiDCoCMgZGVmaW5lIERQX0RTQ19NQVhfQklUU19QRVJfUElYRUxfSElfU0hJRlQgOAo+ICsjIGRl
ZmluZSBEUF9EU0NfTUFYX0JQUF9ERUxUQV9WRVJTSU9OX01BU0vCoCAweDA2Cj4gKyMgZGVmaW5l
IERQX0RTQ19NQVhfQlBQX0RFTFRBX0FWQUlMQUJJTElUWcKgIDB4MDgKPiDCoAo+IMKgI2RlZmlu
ZSBEUF9EU0NfREVDX0NPTE9SX0ZPUk1BVF9DQVDCoMKgwqDCoMKgwqDCoMKgIDB4MDY5Cj4gwqAj
IGRlZmluZSBEUF9EU0NfUkdCwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICgxIDw8IDApCj4gQEAgLTM0NCwxMSArMzUwLDEzIEBACj4gwqAjIGRlZmluZSBE
UF9EU0NfMjRfUEVSX0RQX0RTQ19TSU5LwqDCoMKgwqDCoMKgwqDCoMKgICgxIDw8IDIpCj4gwqAK
PiDCoCNkZWZpbmUgRFBfRFNDX0JJVFNfUEVSX1BJWEVMX0lOQ8KgwqDCoMKgwqDCoMKgwqDCoMKg
IDB4MDZGCj4gKyMgZGVmaW5lIERQX0RTQ19SR0JfWUNiQ3I0NDRfTUFYX0JQUF9ERUxUQV9NQVNL
IDB4MWYKPiArIyBkZWZpbmUgRFBfRFNDX1JHQl9ZQ2JDcjQyMF9NQVhfQlBQX0RFTFRBX01BU0sg
MHhlMAo+IMKgIyBkZWZpbmUgRFBfRFNDX0JJVFNfUEVSX1BJWEVMXzFfMTbCoMKgwqDCoMKgwqDC
oMKgIDB4MAo+IMKgIyBkZWZpbmUgRFBfRFNDX0JJVFNfUEVSX1BJWEVMXzFfOMKgwqDCoMKgwqDC
oMKgwqDCoCAweDEKPiDCoCMgZGVmaW5lIERQX0RTQ19CSVRTX1BFUl9QSVhFTF8xXzTCoMKgwqDC
oMKgwqDCoMKgwqAgMHgyCj4gwqAjIGRlZmluZSBEUF9EU0NfQklUU19QRVJfUElYRUxfMV8ywqDC
oMKgwqDCoMKgwqDCoMKgIDB4Mwo+IC0jIGRlZmluZSBEUF9EU0NfQklUU19QRVJfUElYRUxfMcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHg0Cj4gKyMgZGVmaW5lIERQX0RTQ19CSVRTX1BFUl9QSVhF
TF8xXzHCoMKgwqDCoMKgwqDCoMKgwqAgMHg0Cj4gwqAKPiDCoCNkZWZpbmUgRFBfUFNSX1NVUFBP
UlTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwNzDCoMKgIC8q
IFhYWCAxLjI/ICovCj4gwqAjIGRlZmluZSBEUF9QU1JfSVNfU1VQUE9SVEVEwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDEKCg==
