Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B02778465
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 01:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB24110E614;
	Thu, 10 Aug 2023 23:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B1F10E090;
 Thu, 10 Aug 2023 23:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691711721; x=1723247721;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wfVCw0ZyyabaE4w8L4obgsBeiEgxXLzBqBZzCayFBXQ=;
 b=hQa6CKd4VR84dMal5J3Kk1Dx7KDdv0TTsP/BRCxr+ssaW/XkJszZW2+d
 JkyWgGHOnN++2Ew21pUEHmk0CFBzVCiQDWiXiBAstRiLGZd9JpZY5bpnr
 IYDvB57O2x4kzRfKYwOEXMDjy1FRoVX/gX2jzIS7QcpbxyosMcTWNrIy/
 npnnGn9A+Ftr6Cl4eR36tTC7Z6a2v4HFHYTJKZNnYpXmlSpDQT1ixopwz
 1zBSUieTQWZI7eZZ+yYQO+ccCrnmzZJA+3VIAMKmdtgEC9aDyNM0scpww
 P4KPV5e77gvf5Mr0OfwtN5YQoJOqOPd+0oF0ZFq+MDfYG/URdenzp6Pbl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="435447246"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="435447246"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 16:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906234203"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="906234203"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 10 Aug 2023 16:55:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 16:55:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 16:55:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 16:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkQIf/8WfLawOplphnD7kQc049UonpmN5IeGasqnCHB7FlK7tElUKDoinO/1AvI4D79t3fJrVJQVUl1kTf+LtTBMEZWACHeR97ElqtaBhbeCwmJuk2M6g6pJaWuQ478CmSdGxB3rVvbxjB/8NVqoVn+C4EF8058PvPHFRq0sE9+N4ZZlwe+XH1Cm/uD5kGFzGYkr6MHfU6FmTaFPYgSTyu5Tl/XNI2WXo6NquO+4B6HKtSBmVQO/TEME2mhv5gnyijdD0F14YsYjZeDCq89jl/p0DkDIQ2tnlGzPOK82HSNAQuGVG0OdZZhEegn6vPlStVykwDVWcmdzS4zr3MFaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfVCw0ZyyabaE4w8L4obgsBeiEgxXLzBqBZzCayFBXQ=;
 b=gNIsvNUmisljdNEz2hy6JvkyDW4eOznz8jGiR+b1oC7iwmdiPdAC2lqSulBERJFvE3j08jrQ8fhy63+PRsjK/nqXGWTL70v2qJT2qmtGV+G3mRjSpOwb2EODoflHn+3hAIrr0pfKN0Xgpg6fxva35yUtN0moogknLjtpmD7fjmTi5IBU/WWx82S5nBDo592daJJoz9+Yo2gqaBrw1WPBJAVubsJjtkfrr1lPOMQ0OHKVHLlFVBlh75Vz3q1E1F1FYdGXU4XjCdyGzCWw10WIgn2rLTNbo4jyD9/sEvBxeR3o+4s1kZxNFLR0qwsctegjwhaUS9cBnXozsRSntUTGdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.28; Thu, 10 Aug 2023 23:55:18 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 23:55:18 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/i915/pxp/mtl: Update gsc-heci cmd size and timeout
Thread-Topic: [PATCH v1] drm/i915/pxp/mtl: Update gsc-heci cmd size and timeout
Thread-Index: AQHZsQGtcU5ATjOH9Eub2ELkc2/ROq/kajaA
Date: Thu, 10 Aug 2023 23:55:18 +0000
Message-ID: <5ce59609fe1f8464ee59bfca5c6ff9ed24bb633d.camel@intel.com>
References: <20230707183426.1952655-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230707183426.1952655-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB4999:EE_
x-ms-office365-filtering-correlation-id: 1f0722dc-c64e-4f59-881d-08db99fd404d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NwdDUN7ns9RMXxpeE3cX/tE0SyJ6nsKo3Ud77SzOvWsIqAgSwH78fZ8ZB74GtwKnUaUDemuSGxnC7RrihAcE8lUOtjFB/+LCtFI15K6jd1lov6s3GO7/slxDNh/CAnbswJmQdxkqx+zfF+d7r7uPhQ7E5uHmJNZgCQHqK0ouAmpaRTLNlj3iUq8DBbvLvi5TdMdB1txZj7JZ7gaRTmdtPYUHP0+gjQKeYT78X2kNgAy5/3WAAgWF3BbBFsSiKPIfJVOI7Annxv0Li2E3B81O/onGYqri6WNXpVlAUuqDXt4Yamoqm2HpMP+LKgYltX5RCZB/ra0ItN2WyTsO4JqTuKzNRB101z4EVIZM1QrghJHlh0BhSJrDv+cBUVH4qddP+PLfUgXkRJ+Zq5g+sIeS3bSceGXVH+YRMHxxHEXaswAk0PFJk//sWx2Om4xll/C8YYpQY302RtYD+EZkw3P+P8i2cDc9u71YwW7iN3y18VqKsl57swuf9zSDQgBOI6EtPeyL6n9rlExDxf0tmYr+miRsSjWnaCKtf2SRKaUzNPfcNBqgAj1+1amF/zRBOFXbMpHn7uDHWNnPWC9n+JeFj0XaWM1rEqOQlilgJjTX/NMJVCgD7DBrDqnLn/ArLyKm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(136003)(366004)(396003)(186006)(451199021)(1800799006)(76116006)(38100700002)(66946007)(316002)(64756008)(82960400001)(8676002)(4744005)(2906002)(86362001)(5660300002)(8936002)(38070700005)(41300700001)(83380400001)(6916009)(4326008)(91956017)(66556008)(66446008)(66476007)(15650500001)(71200400001)(26005)(107886003)(6506007)(122000001)(450100002)(6512007)(36756003)(2616005)(6486002)(54906003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDYrY2FXbEJoajF6cjVhM0dHWkxybVZGZmJhVUU3U01RV1laQU9DL0lPbDg4?=
 =?utf-8?B?ZmgwZ2VPZmkwNDVrUndxZDNjV0NPYzlQTVJLcUpCREVSNUZqTjVweGZDVHFZ?=
 =?utf-8?B?NVhUREJzcVJGUndtL2lJcEZDU1BPcWxUQXBOdnJRclpoN05pdkF2N25vNEsz?=
 =?utf-8?B?NGNqQ3pmZTBpZ0cwRFd2QlJ0b0hadjBxUFMrK1kzNlVWRHdLb3FhTG5acDNC?=
 =?utf-8?B?TjRFNi9mSi80S1ZUbnVEK013MlJ3dWhScTZEdUVDdmFiOTZKTEltNW96KzFB?=
 =?utf-8?B?dzI2SWYrdG85dTFrUzF1Z0dUYk9yKzUxSUx2NkxrYTNhNHo0UzY1TFh4dElr?=
 =?utf-8?B?OTVDMTU0ZHRmaXhBSnR5VlVNYmtKeWtpWlhQbk9IVCs2ays2cU9vOGFtcEQz?=
 =?utf-8?B?c0tsS3J5V1NTS2VmT1B0d25VUk83WU93VEgvY2hLZ09MQlNmalFKNEdtQlN2?=
 =?utf-8?B?UXppc0kvazdteWFPOG1Xd0tOU2FxQSt0bkdtb3NaVk5GQUN1QWxvVG1zTWdQ?=
 =?utf-8?B?YjZUWE9wZWNBT3lsOWVwcXVhNEVjcUpWa0tDMGhUUDZoZGcxTGpMM3BGMXNo?=
 =?utf-8?B?R2lHSVh3SFlvdU9WU0syTHkzY3h6dlZJaDE3WWlVOGVrYW1KU2JuZjhCVTd4?=
 =?utf-8?B?T01YTk1HRDNjWmlKLzE2RmZPRnJTaGNEVS9GN05kMlYwZHNoTGdCVDZZL0FX?=
 =?utf-8?B?RDZnT2Z0bVEyNHVIUnpFN3lhNklNTkppaEM5UzlMaW1UdklqcmlUVXJaTzRC?=
 =?utf-8?B?dTBEQkoyTkpNOFVYelgvcWFsN0RRVG9sMTZTL3ZLRUYvL1ptRHpMdDVXeHUv?=
 =?utf-8?B?Q1IzWVY5UmdDV0cwc2Q0MzV4TUF5ZGJtRVhnMnZlbklpZEZCQnNwMlhaZjRm?=
 =?utf-8?B?NFc1VUM1bC9ob25LVWZUSFBjVjB5U2FJU3BkcDZ1SXFZNGFwMlBOOWNMNkl2?=
 =?utf-8?B?Wlhicmt3UW12L0dUZEVXNGZyVnNjZlhFOFk1MklxaitTaGkycmZvempOa1pN?=
 =?utf-8?B?WDFpTmJtODFrOGNrcWF1ckk0d1Y2QXVleUpVdlBBRWtRMm5WMTBtUkNZRjEx?=
 =?utf-8?B?WE8wWVliOVZRcTY5ajhTNXhTNEE0aUZsTUhFcUt4OHB1NVhMYmpRVWFjdU4v?=
 =?utf-8?B?VjVncnNlVUdodXFrTGVUSVlIc25SNzZkekRUbzl5ZlNQVFdpZkt1UHZpeksx?=
 =?utf-8?B?UjRFYTNVQjVjc1dxS0pyRG1iUk1hMFRTRTVESW9oenV4dUFXa2Vic3NoL2Ey?=
 =?utf-8?B?OU13bmZqTnlnelU3U2YrRjBZVitxTTdPQnM3K1p2TnVoSGNzT3Q1VGdsRG9K?=
 =?utf-8?B?U0Y3d2QwTjhxTVJHcG9tQ0QvZzZrQ3pTdnVQYlRNQ08vbnlFbmZMZFpMenhz?=
 =?utf-8?B?eGc1djZMNjZTQWhHMGF1RTJnM2NlT3pHRXRxV0lia1ZCMEJUQlkrMXNKckVT?=
 =?utf-8?B?dVlTbFBnT2puTTlrNmFDSUpyV0RKbm1Ud1BWMHYrT1BsWGUzUnZKT2p3ZWUy?=
 =?utf-8?B?SjY3Z0ZNQnhTUjRBL1Fsa2hkMjRvY0dNNWlRYWpMaWNjYjRCK0ZSYktjNXZX?=
 =?utf-8?B?Skd6RC9ORnNwVXg5YWhlN2hVUytyK1Y1YVlDN3lZQ3RYS3A3UkFUR290bjRY?=
 =?utf-8?B?MGRRVTh2d3pHbU5QTEpFNmE2L05rNFlPVEJMVXM1YkJmUDRsTzZuaEZpcnBh?=
 =?utf-8?B?TS9XOFZrV28xcFVWa29LV05nQS9ZMGVnK011WTNRckc3RFAwU2Y2dWQ0YXls?=
 =?utf-8?B?UU8xZ3dzTFQxRnZjYzRVSlZrY0VYU0wrWVluV1JYSlV6V3EycEl2NWptUVBs?=
 =?utf-8?B?YStNQ2djNGttQU40RnZRWDFYSk9lMFBOWUdzeGJjZ1lFbDhTSVU1cmhyWmVM?=
 =?utf-8?B?ZEhxcGpYWEJMaDdRakNhbW1HcUlYTlpiV0toeS9xM0JmZjRTTE00N3N0S2Uv?=
 =?utf-8?B?Sy93V2d2bzhDanBlN1hiaUVXMDhpOWYxM1MyTXJUMXY0TFk0MWpTai9OcHE2?=
 =?utf-8?B?bmdDendydjJva3JpVzhZdjFNbjB1SDRyRnVyaThPaWpuN0plQkhRbUM4UlRE?=
 =?utf-8?B?LzYzNHNGUGVQenpKSmpXYWpDTWc3YjhmTnhWbTZocUpvSjBMT1lYSWp4dlF1?=
 =?utf-8?B?bEVDUVh2QWY2T3NzS0J1WDhYUFZqUkFXZFo0cWhPQW5aWmhKUytCbng3WFZy?=
 =?utf-8?Q?ybmuoqGPdz70/o4lMJ0/TdE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68BCD056A2F1FE4DB778FBE68AE2523F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0722dc-c64e-4f59-881d-08db99fd404d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 23:55:18.7529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzfM6xYuLMETMyUSuBFZwBfOov61k692xybrWuAbqq+7I0fQPBtDbdKJ6xrdRqwdjyvf1y+W/kUrOUknOMWvqRa902sDFhscbzZTauEQyesJ54cehM5/hRcr7M+s23bt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA3LTA3IGF0IDExOjM0IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBVcGRhdGUgdGhlIG1heCBHU0MtSEVDSSBwYWNrZXQgc2l6ZSBhbmQgdGhl
IG1heCBmaXJtd2FyZQ0KPiByZXNwb25zZSB0aW1lb3V0IHRvIG1hdGNoIGludGVybmFsIGZ3IHNw
ZWNzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVz
LmFsZXhpc0BpbnRlbC5jb20+DQoNCkknbSBnb2luZyB0byByZS1yZXYgdGhpcyBhbmQgY2hhbmdl
IHRoZSBzdWJqZWN0IHNsaWdodGx5IHRvICJVcGRhdGUgZ3NjLWhlY2kgY21kIHN1Ym1pc3Npb24N
CnRvIGFsaWduIHdpdGggc3BlYyIuIFRoZSB0d28gY2hhbmdlcyBpbiB0aGlzIHBhdGNoIHdpbGwg
YmUgaW5jbHVkZWQgYnV0IHRoZSBjbWQtcGFja2V0IHNpemUNCmlzIG5vdyB0byBiZSBpbmNyZWFz
ZWQgdG8gNjRLLiBBbHNvLCB0aGUgY291bnRpbmcgb2YgdGhlIHRpbWVvdXQgbmVlZHMgdG8gc3Rh
cnQgZnJvbSB3aGVuDQp0aGUgcmVxdWVzdCBoYXMgaGlzIHRoZSBjbWQgc3RyZWFtZXIgaGFyZHdh
cmUgKG5vdCBmcm9tIHdoZW4gdGhlIFBYUCBzdWJzeXN0ZW0gaGFzIHRocm93biBpdA0Kb3ZlciB0
aGUgd2FsbCB0byB0aGUgR3VDKS4gQWx0aG91Z2ggdGhpcyBsYXR0ZXIgY2hhbmdlIHdvdWxkIGlt
cGx5IGEgbG9uZ2VyIHRpbWVvdXQgcGVyaW9kLA0KdGhlIGNoYW5nZSB0byBvYnNlcnZlIHRoaXMg
bG9uZ2VyIHRpbWVvdXQgc2hvdWxkIGJlIGFwcGxpY2FibGUgdG8gY29kZSB0aGF0IGlzIGFjdHVh
bGx5DQp0cmlnZ2VyaW5nIGEgUFhQIHNlc3Npb24gY3JlYXRpb24vdGVhcmRvd24uDQoNCkluIGFk
ZGl0aW9uIHRvIHRoYXQsIHdlIGFsc28gbmVlZCB0byB1cGRhdGUgdGhlIExSQyBjb21tb24gZGVm
YXVsdHMgdG8gaW5jbHVyZSBmb3JjaW5nDQp0aGUgcnVuYWxvbmUgYml0IGZvciBQWFAgY29udGV4
dHMgKGFzIHRoYXQgaXMgdGhlIHVwZGF0ZWQgaGFyZHdhcmUgc3BlYydkDQpleHBlY3RhdGlvbiku
DQoNCi4uLmFsYW4NCg0KDQogDQoNCg==
