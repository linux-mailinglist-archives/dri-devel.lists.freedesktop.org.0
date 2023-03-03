Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6256A8E8E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 02:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327F110E5B2;
	Fri,  3 Mar 2023 01:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58B410E5B2;
 Fri,  3 Mar 2023 01:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677806105; x=1709342105;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VnVtwY/dZhs1neN7N+hl4t+/9bjAoP+3YVA7C/07yls=;
 b=nIYK8C0kU9zOaLt3tylu39KDsaWdE4weqLDuoxiliXspu7PoIc4QvRIJ
 L4g7VlLsvS6RzEnyNMyyvjK0Ks/XVEMFi6/UiMDTmhV/eOMhIVa6Zu/5l
 pobycTqBWL5L7mKSrtd64W3C3xzTn8aRIjmnr0s7X/lQfkhz618CJP9Nn
 zBzveApvaD3wg/BJMsApHufFV5UZNcKbViMPBx6Lx9TFtdlgPmSTf71dX
 wjOOIiHDQyjdkEINAj7QFhfD4DSD1I3Xfu+kcTYS3DSieVStX5IMB7PFh
 V8nq9vwkb3h0Yzy8DPdHrGjozyoXdlMfZN8F7Q3wvZBPkwXgxq8vndhdR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="333637797"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="333637797"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 17:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668474993"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="668474993"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 17:15:02 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 17:15:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 17:15:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 17:15:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGrnMRUVQHSLNUaqELgy2vPxeGga46Epbq2iw6RWx2z7vk2d6w0p5X2vIWosFMmntgTGPdpzHSvxUTQ3QgOh3N1LlgQERld121t6RHHw8AvlsLLPgR5YrXXQJx28/XH8D2XGLyWKe5QVeWWl3IYWZjZ+XMNhekdVhXVkWRtnr/Feyh5WWPTHTpoH333/X5WXEbszRoGusDA3x25FvNyOotJ9+FLhAgK8cxhXoJrZBOzheNkaMURhd1QPBW7VU58+zkY57kMA6aCIje2i9Sz4pRgprFqKH7NpzLkgkSh2JLDfrRjBBG+TGtgjkc7lKmz5BfDgJndIpqMxDCDNVwl3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnVtwY/dZhs1neN7N+hl4t+/9bjAoP+3YVA7C/07yls=;
 b=elBC8vQczNfbxiSi7Cyd+u5E2vZMOKjBX/iXWPi8G8fPh0PpYkIBfutCdaRAif1NY06q6WDo2aQpkCZJ5d+zFQT2lZMqKdlf9FytNJ/riVSNnqb/h9Rs86Su8ofHLG9nQ/cUIkp/XtaclBiv66XO8o8sRi9OodM6c5j08F67VLs7PhvtZhsmDzbjCT8lkolf/TAb3Q+GeFpNsaOmKjokfwSn2jWQY5aMVB/l05sGO5C+3+mQgMBd5YXFkRWsvka+pPnCb8wygNI7WbDj9opibkyen0GeGjyxKKpz+bVceAmo6w1HSUFj2uAS8Oq5/WWVs/F489eIgoQcCvMhn+Jz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.30; Fri, 3 Mar 2023 01:14:59 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%8]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 01:14:59 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Thread-Topic: [PATCH v6 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Thread-Index: AQHZSxtw0ftM7ODP7UydFzUfg/4jtq7oROuA
Date: Fri, 3 Mar 2023 01:14:59 +0000
Message-ID: <3a278bfaedbd5976845b3bf489f513be5c574df9.camel@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230228022150.1657843-4-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS7PR11MB7740:EE_
x-ms-office365-filtering-correlation-id: 89e60f65-208b-45ba-e9b4-08db1b84b582
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QHS/eAx3u88sAlUY8QBL3iWhCY8C2sfS70XUv87LMUG1CV67ZOAKlyX46EAuv/kxcoy11QUfT3ComfpZxjH3Kwspy4buLOvawPkVExWiV+Y44XX5sonEaORvO4/RRVtcWD/Q4DSOYwoptWrWek4taUf5dfU0J4bu9dy0Qs8vsYlXXMZ8/NGIM19im2q2IaI2/4KZmnMRVtDS9qkxrx928EncB7YeK2lEl1Hz8qbubpBSb+J03ktNy+8l5kvGSX5N0dzZAfeYcero0YQeWpRC2tf0U48xnMxxp7SwFb9Y/E53y7wl0C7GgxSmFe55vSS+z/elZcLoEMMu6mLc+nJsxRYjvOsMmjPRAINy8gRUSrdUhpOeK4KhH0wTp68iScl46+iFiILzGxtREXGfkR16ELvY/W9JM5Y6N0BSnZ0IKvfinOIEtCNqSaKiyflQ/oXzPddUXQKFpetWLphqgg2QbvfnGcfgA6EmJrwB/Z7jNRV7EWDIHlv67efpO9aP0Z/3rY9QZUNxyjRw+jHX8R1Rt1tZf5myqZoqn3vvCg5ul07kDEqLE9Cc7z4pW+7AqBOJjZYtQMulmoC3+62JQdjilWiJ59XtIGtuapibgbMJO8hppDnKKXnuV75MMHuZRGMs/wxEOi1tw2vnnfKBmwZIPoNwd27J22Iy7fzzQ8wv6dvBCKz+RdKwi6VU272MnGqS5QeMEte63qRIH8B/ex/RuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199018)(66556008)(36756003)(66946007)(86362001)(8676002)(8936002)(66476007)(41300700001)(4326008)(66446008)(2906002)(6916009)(5660300002)(64756008)(122000001)(82960400001)(38100700002)(107886003)(76116006)(91956017)(6486002)(71200400001)(316002)(38070700005)(54906003)(2616005)(478600001)(83380400001)(6512007)(186003)(26005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RG5WSjgzem5oVG0wQ21DTFJ6dzVEZzFZazNDZlNYREdtbHY0SGEyd2xYNFN4?=
 =?utf-8?B?QUZkVEh6VDhMWmZaQkdBV2FvVUF5cmNhL1h1WHpuK2MrSU91dHRMNk16eERw?=
 =?utf-8?B?cGF0RE0rdU1MR0t5QWp4a3BsalIzeU9kS0U0WGlLellWZFdpZ3FaamFINHJD?=
 =?utf-8?B?d2dCVWNCUGVocjBNblB0QXhyT1ViWjVmSlZJRVlSQkluR0RZM0U4czdUSDMw?=
 =?utf-8?B?cys1Z2ZSKzlxSnQwVnByZ0pzZmZuNitKcnE5c2xIRmFKR2NheG1rSktUcFhy?=
 =?utf-8?B?WGFsS3gvZDRRQ3ZvMmdQeW9ReWg0dE5VVytqN1JOS2NoczZ5VzdOSlpMcEhZ?=
 =?utf-8?B?MERpT1ZzbWtIclM5SERBcStLdFBOTXRpMW9sSjVnVjJFRXJrY0pnT2lZUjRH?=
 =?utf-8?B?dXVxNHJPZTE4UzFGREY3L284OXZhQWR2amJETzJjV1ZJckFwMFUwYXNTbG10?=
 =?utf-8?B?MkFjelZEaWVCRGR1K3R2WjdNTW1maDFCUTNiUUxnMFlDRlB3MDkzOTh4SDJk?=
 =?utf-8?B?dTczcm9KN3ZPbis5TWdJdDB4N2R5Qkd1VXl3S3lKdHUreFRRd0ovWlpQUXY2?=
 =?utf-8?B?T3JzZEVTSytMaFhHdnBMbGN2alNleVQyQWtFMzVyQk90NmJDNDRneVgxL2lG?=
 =?utf-8?B?S01LOGVDYW95V2JZN09RbmdreWU4bXJqdmNLSG45R0RKamppYXYzYlVGcXFP?=
 =?utf-8?B?WGc1V1JhWms1NUcrdzBPRkc2Rjd1ZFJ3VW1CUzhMRFJkMno4SUt1Q0xFck5O?=
 =?utf-8?B?dUxZYW11Y1JzcGFTcVB5N1ZWeExJaXR3WSsvMm9sR0N3WXdPRkJTMUNJbmUz?=
 =?utf-8?B?anRvbFhyRDN4KzdGUXhIYzFRdVdSUGR3aW9VNmJYT0hGaDljcUw3ZENYZDl1?=
 =?utf-8?B?VFhqS044TE40RjJsRG12ZE9SaVdYUmRhaFhBTXltamxxTWxYNlNhZDJWUDBM?=
 =?utf-8?B?aDc1MEwyNWo4Z1RsUDNYVW1ERTFzbjdCQmRQK08velVrbWlyRE9YT25EekNh?=
 =?utf-8?B?Zm53bHdaazBodVFDTnQyQ3FjM1VLUzdCZFpwME1BT0lLSlFqaThGNksyZXQ3?=
 =?utf-8?B?eEUwcThXNk1iazdQWThhVlpaYTRvSGQxdFVnT1RYZlRqQ3RrQWZFUE5TSjFQ?=
 =?utf-8?B?WStiM3EzaGtBdkhzTlk0b1AyR1IvcXEvRXRMYnMvRG1sRzlaUnhJQWFoc2NQ?=
 =?utf-8?B?WklVRWs3dWFacEVQeGFpTExGT3d6K0RSOUtqMEp3NGw5ZGJzRkpIYmRSUTFG?=
 =?utf-8?B?WW9ZNSthZmZrRnFuRkg5b2UyeGVlR2pmanU2YUhEN0xmSHNKYXFybHR5NjYw?=
 =?utf-8?B?TW82c1o2TE9WOEJuQ2E4ZlpVczFSTEdTUUd3YVgrczBXWWxYU2RDVDhHMzMw?=
 =?utf-8?B?b1UreWJEOXJzU3daUFBDaGVNeXdsSWN4WmtTTVlyMGhCWnRueHVIMk5WWk56?=
 =?utf-8?B?MXBUQlBxaEJ1Y1ZHN0JKNmN6V2FXMzJxeEl2MGVTRlIrOVhnU09zWjlPblMr?=
 =?utf-8?B?SDBtL0N2dnhtZnRwZHBKa2pzaDNjai9kNjZjQVpsQzJQSGcxejU2bk9QaDJ1?=
 =?utf-8?B?dEhzc0NPcUIwRndnQTMvSm81S1J3M1JzQ20xQ1h6aVdhTWM3ZjVRdDBDRkQw?=
 =?utf-8?B?U2gzdHpIVFVvT2FBUDBMZktORXdyaTFjSkdXNVhIQ2JNMnRSWWp2YlF1YlBD?=
 =?utf-8?B?bktoT0o2cXo5MUUyYjMyNWtzNll2UU8waFhiYzI1NTlsb1daOG5iaEo2Y3ov?=
 =?utf-8?B?c21WMEhTUEY1TW5FdWsyQTllOWFMbzZLaFBkVEYrb3l5YXJySDVNUit6bWJp?=
 =?utf-8?B?OUc1dzZhdThSV1BLOFJieWFCQ041SUtTLzZBdk5xd1F6Vy9BSFBlTHZMWThD?=
 =?utf-8?B?RnlMTklGd1ZYRTNZNDJrY2lXN0VtaGFZMHdpek5KRHZHT1NBZWs1NkIySU5Z?=
 =?utf-8?B?UG13ZHp1eklUUHRkVXFjTThIVTVkY0xGTmpHcWRnak9yTWoyMGM2aUlmY1pM?=
 =?utf-8?B?cm1RUFUwZDY1eHFnTE44WWMrTG1UemF3UG9LYVBQY2tlWFlySEtLT0RBem1l?=
 =?utf-8?B?VTMxbVQzdDIxcVBmL2x0ZGpKd2Y5YTM4WmdYVEpyZ3IwOGdOT1VsNVZ2TzB5?=
 =?utf-8?B?TDhnVE1OZ0hrWkFIUm1LbXh4bHl5REJsVW0xOEp4NzgvMHB5UXRCQWhPdU5S?=
 =?utf-8?Q?eUZv9/k1ZpjdGIa93t9cMDPhAx/B4K/qrYw/g/TaGd6C?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <896F392A55562045A73DFBF59B1CE68E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e60f65-208b-45ba-e9b4-08db1b84b582
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 01:14:59.7320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whMoabswtmtGlB+ix1QvDGlRYkWVcW7JfsEIU5u6crA/BRCrsfTuMrHJ5NkZMPteJngmBqwSW4SHFOwMTI95fX5Xy5DA8zLMBxFh8vqbgZbMSoG5lHzmzsvNvv6AVGtv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTAyLTI3IGF0IDE4OjIxIC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBBZGQgaGVscGVyIGZ1bmN0aW9ucyBpbnRvIGEgbmV3IGZpbGUgZm9yIGhl
Y2ktcGFja2V0LXN1Ym1pc3Npb24uDQo+IFRoZSBoZWxwZXJzIHdpbGwgaGFuZGxlIGdlbmVyYXRp
bmcgdGhlIE1UTCBHU0MtQ1MgTWVtb3J5LUhlYWRlcg0KPiBhbmQgc3VibWlzc2lvbiBvZiB0aGUg
SGVjaS1DbWQtUGFja2V0IGluc3RydWN0aW9ucyB0byB0aGUgZW5naW5lLg0KPiANCj4gDQphbGFu
OnNuaXANCg0KPiAraW50DQo+ICtpbnRlbF9nc2NfdWNfaGVjaV9jbWRfc3VibWl0X25vbnByaXYo
c3RydWN0IGludGVsX2dzY191YyAqZ3NjLA0KPiArCQkJCSAgICAgc3RydWN0IGludGVsX2NvbnRl
eHQgKmNlLA0KPiArCQkJCSAgICAgc3RydWN0IGludGVsX2dzY19oZWNpX25vbl9wcml2X3BrdCAq
cGt0LA0KPiArCQkJCSAgICAgdTMyICpjbWQsIGludCB0aW1lb3V0X21zKQ0KPiArew0KPiArCXN0
cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZzsNCj4gKwlzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycTsN
Cj4gKwlpbnQgZXJyOw0KPiArDQo+ICsJcnEgPSBpbnRlbF9jb250ZXh0X2NyZWF0ZV9yZXF1ZXN0
KGNlKTsNCj4gKwlpZiAoSVNfRVJSKHJxKSkNCj4gKwkJcmV0dXJuIFBUUl9FUlIocnEpOw0KPiAr
DQo+ICsJZW1pdF9nc2NfaGVjaV9wa3Rfbm9ucHJpdihjbWQsIHBrdCk7DQo+ICsNCj4gKwlpOTE1
X3ZtYV9sb2NrKHBrdC0+YmJfdm1hKTsNCj4gKwllcnIgPSBpOTE1X3ZtYV9tb3ZlX3RvX2FjdGl2
ZShwa3QtPmJiX3ZtYSwgcnEsIEVYRUNfT0JKRUNUX1dSSVRFKTsNCj4gKwlpOTE1X3ZtYV91bmxv
Y2socGt0LT5iYl92bWEpOw0KPiArCWlmIChlcnIpDQo+ICsJCWdvdG8gb3V0X3JxOw0KPiArDQoN
CmFsYW46DQpkZXBlbmRpbmcgb24gdGltaW5nIChhcHBlYXJzIHRvIGJlIGEgcmFjeSB0cmlnZ2Vy
IGV2ZW50KSwgaW4gPDUlIG9mIHRoZSB0aW1lIHdoZW4gSSB0ZXN0ZWQgdGhpcyBpbnRlcm5hbGx5
LA0KSSBhbSBzZWVpbmcgbG9ja2RlcCBpc3N1ZXMgd2hlbiBydW5uaW5nwqBsaXZlX3NlbGZ0ZXN0
cyhndF90aW1lbGluZXMpIMKgZm9sbG93ZWQgYnkgYSBQWFAgdGVhcmRvd24gYXQgcHhwLWZpbmku
DQpUaGUgbG9ja2RlcCBrZXJuZWwgbG9ncyBwb2ludCB0byB0aGUgc2VxdWVuY2Ugb2YgY2FsbGlu
ZyAiaW50ZWxfY29udGV4dF9jcmVhdGVfcmVxdWVzdCIgZm9sbG93ZWQgYnkNCmk5MTVfdm1hX2xv
Y2svbW92ZV90b19hY3RpdmUvaTkxNV92bWFfdW5sb2NrIGZvciB0aGUgb2JqZWN0cyAoYW5kIGhv
dyB0aGUgaW50ZXJuYWwgd3ctbG9ja3MgdnMgdGltZWxpbmUtbG9ja3MgYXJlIHRha2VuKQ0KDQpJ
bnRlcm5hbCBkaXNjdXNzaW9ucyByZWFsaXplIHRoYXQgaSByZWFsbHkgc2hvdWxkbnQgYmUgdXNp
bmcgdGhlc2UgZnVuY3Rpb24gY2FsbCBzZXF1ZW5jZXMgYW5kIHNob3VsZCBpbnN0ZWFkDQpmb2xs
b3cgd2hhdCBvdXIgd29ya2Fyb3VuZCBiYXRjaCBidWZmZXJzIGRvOg0KDQoodGhlIGZvbGxvd2lu
ZyBpcyB0aGUgY3VycmVudCBmaXggcHJvcG9zYWwgZnJvbSBpbnRlcm5hbCBkaXNjdXNzaW9ucywg
YnV0IGkgc3RpbGwgbmVlZCB0byBkbyBtb3JlIHRlc3RpbmcgKw0KZGVidWcgYmVmb3JlIGkgcmUt
cmV2IGJ1dCBpIHdhbnRlZCB0byBwdXQgdGhpcyByZXZpZXcgY29tbWVudCBmaXJzdCBzbyB0aGUg
Zm9sbG93LXVwIGFjdGlvbiBpcyBub3QgbG9zdCkNCg0KaTkxNV9nZW1fd3dfY3R4X2luaXQoJnd3
LCBmYWxzZSk7DQppOTE1X2dlbV9vYmplY3RfbG9jayhwa3QtPmJiX3ZtYS0+b2JqLCAmd3cpOw0K
aW50ZWxfY29udGV4dF9waW5fd3coY2UsICZ3dyk7DQppOTE1X3JlcXVlc3RfY3JlYXRlKGNlKTsN
Cmk5MTVfdm1hX21vdmVfdG9fYWN0aXZlKHBrdC0+YmJfdm1hLCBycSwgRVhFQ19PQkpFQ1RfV1JJ
VEUpOw0KDQpzdWJtaXQgKGJyZWFkY3J1bWJzLCBpbml0LWJiLCBmbHVzaC4uLikNCg0KaTkxNV9y
ZXF1ZXN0X2dldC9hZGQvcHV0KHJxKTsNCmludGVsX2NvbnRleHRfdW5waW4oY2UpOw0KaTkxNV9n
ZW1fd3dfY3R4X2ZpbmkoJnd3KTsNCg0KYWxhbjpzbmlwDQo=
