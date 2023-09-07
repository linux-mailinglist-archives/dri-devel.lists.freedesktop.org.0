Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F5E796FCE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 07:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525A110E758;
	Thu,  7 Sep 2023 05:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1769210E758;
 Thu,  7 Sep 2023 05:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694063774; x=1725599774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UKmPX0MUBCUDY6WdYdG2st05L6s97qMY2CWoa3c9koU=;
 b=bLuQTQz9bmTyQGKnFZBzEmHPjtb2IZubpjbamCoQ88E/MmIy9VrBo1K7
 UwakmPjRQFEeIr9dMd/CIejoiDrpnMwzDzOhEFPtTo7tfaepQAlh3h8Zn
 O09mbqGDbCrqdiF5+zL7LJO7k6LYdHnVD3G2bjNlO4XtdXaPty+kfNR7o
 BbgTw55BUxMGFtUSGDa6dASNmHCneYx7Yrj3S5jCoru50eYVcauQtRzu8
 kDIAWETX3T4Pr1+RcNahVbx1+Aj0sXLVI6RcLv+/iU+ruNTSYopJYGVSf
 26FQaFEfiyQkUWrf5pD6XtkAr5Lfvi6i0skHTkuKobegGwFFAx/DaKlAI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356742331"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="356742331"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 22:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="811980073"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="811980073"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 22:16:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 22:16:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 22:16:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 22:16:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UggdMVGbPSOJ1waBVUWzqHII6Ed2k13rHOAFwbxcEJKGv/Vnfme9rqWtWTjiVCdxOQr4vps4g5GqOEQRvY4q/fa93GTRFtWwY5RLYqKe2s8B5nR5nXhYnAy5noIjfUkOI+3QTtjz24e0zOX3sjnOeTs4q4GspQdcyOb9SmHrhvhYq6KeskWrGqbxPMO3ZrcuLBXWSRgpQkB9jM/WdBJ21z6I8ApTQTutTfulyNkpkvi0Gzyd+d2VlRI044K60ilMmirwqXaOa+mTXOAd5gJRMp76Qc0LOpUX/PHmj1Wz1E8rXAZTbwB8jcC2zNOO+wblsoyv1I7G6J+6Xe26TfGfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKmPX0MUBCUDY6WdYdG2st05L6s97qMY2CWoa3c9koU=;
 b=R9n1bqevu1iDNvlg0YwW0q4EjqdswsIYKjyKUfEXUU0Ea+wNF7D7a6qeOCRTIj9VhtvVX8QmIoITwlbUcoRb3m1onAsRpWhEwTTpiJygtPcSUoAvEeip7/OpaxQhGO+TOr8ar+d7X87FCxQWaBVBtD6jN+K8IiTnL5iVSDZtTc0FX4VfhWm4zo+km+Zqc5xt569Gm5A9ajIivtof4vyz9UVe0rj0jV69EsZT386VZK2PFeeHm7Cg0WB03rz/P+i+n6PcQo5D21aTVtQJJ5SAOgmkizVdrSCQES0GEZqRZL6UP1vVpIG2UqByEZhkUbLhBfhiVbDm432Afp+Ponh8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL1PR11MB5528.namprd11.prod.outlook.com (2603:10b6:208:314::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 05:16:11 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 05:16:11 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Thread-Topic: [PATCH v4 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Thread-Index: AQHZ4SB78sPBBV5wZUSIN4leQin3NLAO0pGA
Date: Thu, 7 Sep 2023 05:16:10 +0000
Message-ID: <6bac37e66c9b59d1a9c74c29a1562fdb4dbe183b.camel@intel.com>
References: <20230907001549.81262-1-alan.previn.teres.alexis@intel.com>
 <20230907001549.81262-3-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230907001549.81262-3-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL1PR11MB5528:EE_
x-ms-office365-filtering-correlation-id: 40a3010d-8144-4e59-7811-08dbaf618cb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dFD2zRMsvhbZdkM8I5DZ3imQVvzmmpQB+U3CuxB0HgNdNeuv9yAa74ReneKI/vI5Yp3t7y5A4EIhrWMOLPinKKRauRlzvyfx0u3gW8qwf/b6FTupE6enMWASoCkRcWkrQhODIeE4cqY72UIdHjqdJTQvzZ9S9vguJq0TIcaLUxblfyyYCVOHaUR4GEm+v+e7+AQLYEB15KRxfJuOF4yf7CPL5LiXxCFTykVSbP1cEEveANR+vTR6wAGmVaC8bpODD19QUJDzHOIPfcpTSOgexP2BLVs5U4ShaHqgYzWqqmLdxuOf3vfsXo2MMQwOz+eH6DuXKc+G54Htvs/f7qLInbxigPHKNgUkeAYwz+lEO2VBx1HtHS0fVHnX5HCawxNrIanBXra6vqI5CzVOFNUiAyqNJYWn28Gr1qaP+AEp7BUI7wsPsERdBLo56AQOl/ftkKQMTlQMaCMMevDYly1X1L9GA6TwnAnNA0WJvrRQbm/HcaEWbeEATnps+oEd3ly3cBNnQGoU1Vkl7HlQiGgT41eNOqzBMCaB0Jd45B1lCL7z2tW83taJrHsm1CHu54REn3/ozQb3yYwQ0rTN7bBWwVOxDz2soIOvFKBCI/6mFSyd1NadKRty+GsICqxG30q3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199024)(1800799009)(186009)(66476007)(64756008)(54906003)(6916009)(316002)(66446008)(2616005)(122000001)(107886003)(71200400001)(86362001)(91956017)(66946007)(76116006)(66556008)(2906002)(15650500001)(8676002)(41300700001)(4326008)(8936002)(4744005)(5660300002)(450100002)(38100700002)(38070700005)(478600001)(6512007)(26005)(6506007)(6486002)(82960400001)(83380400001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clhWZGdCZnlTVXoyb2NtNEN6a2ZhY0RhRjUxQW9Qc3llZGJXQ2Z5WHRkSEtm?=
 =?utf-8?B?dWRsc1h1RlpYNEtaMmU3dEJaZjcxSHpDNjZvZlREK3BuTU9KdTVWeHIxTTI5?=
 =?utf-8?B?eXd1M1J6RzMwYzkveFN1T25GVDRsYVF4QzVJZnBsdktSNURGNVkzMWk0REJI?=
 =?utf-8?B?T0dPdW55TU0wbnFuN1pZRXhTNDZqRVphMjdEdWNXakZrdERhVEVlTGtMUG9J?=
 =?utf-8?B?YWE4SGZqYTZNL1ppRzZHQnVHaGxTVG5wOU8zSWI2Nmk2dWpCemZ0R29yKzVF?=
 =?utf-8?B?UitEVGNPTEFzTVVpMm5haklncEZxb1QrL1hNNnAydDFkSUZUSC8rL0JBRFYx?=
 =?utf-8?B?djRwRHdlUVlWREE4USs5MGdER2N4cTZaM01SbHJCbmVNVzd3MFJrZDRVRExR?=
 =?utf-8?B?ZlZJT1QyNEVYZ2JyMittZFNweEZManRROTJUcEsxZ0tzZ3pnTGtya3NhRTY5?=
 =?utf-8?B?OC9uOFVpVEJxUjAyRGQwa2hrTG81NmIxU1NleDlBS3FxNWZBNHJMUmJWdUR1?=
 =?utf-8?B?Q3pidU9GNnFYWTg4V3JTc0Z6ZTJkN3RUUUdzSnFhUGE2R1d5eTA2bHcraFIw?=
 =?utf-8?B?TVJXK0RFQ25mUnpiZzV2d0N3Mm9zOGQ0RTlGQWlkK1FkMllHVDgzdEp0SGF2?=
 =?utf-8?B?Mnp6RTRQN29ZdkdOajA2M09LZHMrWGV0dHRLTEtJSWd1dUl1NWxUdnNabGxp?=
 =?utf-8?B?Y2IyR3M2d1hNQW5tZTFLVGRob2IxZU9weUFxSzVxd1JBQlZHQUJRd2ZKMlQw?=
 =?utf-8?B?T2crcFhDcGg5amRZU1V2bEVYUXB0R3VYOVlYT2hwL3JzbW1XNzJaTU0zeVdo?=
 =?utf-8?B?YW1QK2k3dDY1RS8zWElPcHRaeXBmMmw4TDMvSXYzeUpYYWdzTkFvOFRQVU5h?=
 =?utf-8?B?RkVBWkF2VWJ6d1hmc3h1RU8yNjJucEE4K1lkWHplbWNpSi80RHB0MVorTU9a?=
 =?utf-8?B?bSt2WUxJRCtDeEZFb0F0NkM3RDZJdEI1MlQ0SGRWZkpUd2dBU0FhaXZOUU01?=
 =?utf-8?B?M3A0My9kcDl6K1hraE5zR1FpNm0wNzExakJseTR4WFRxNHNQVmhJOFRnTzRy?=
 =?utf-8?B?b1NQZG5tdkNUdnJGRHI1VGNHWW5aT1ZsN3BhZkVSVDJzVjNuSnBneTRjVURQ?=
 =?utf-8?B?MCtFRVFuYlRIVWxUaUJFTFZ1OUZXWjRnVnRhd281Tm1FVFM0RURITCtub2oy?=
 =?utf-8?B?OU1YQlgwTlNRR0IyNFVUeHVKeGMvdW5OWm1SSEcrK3BVUzZrMmZ1bTJheEVp?=
 =?utf-8?B?RVBVekROT0hWVmZkMzRZNjdxOFFMNVh0dzZySTltSnYzWXVWRU5IYVVvK3lD?=
 =?utf-8?B?SVY5WU8vM0VNOGt6bjI5aVpsSCtFMmNiUHVNcWZlU0tRcmNiT2Q1QmFvZE9D?=
 =?utf-8?B?bGN2bm5MdTZuYmVod1U0UFJlYUpJajIrcEpYSjZCTnNvUDZBdUpDV29PTVRl?=
 =?utf-8?B?a2x4K1pqK0RINE80RSt4aDFTK1FZd01ZeGJiZEE5d3VtdGt4bExqNG50eE11?=
 =?utf-8?B?Nkh5UTNSMUtkdHBtbXRBVk1IMUVIRTRZc01tVFZxdk9LNWNTUnFJclZrV3c3?=
 =?utf-8?B?TERmUXNLRnI3SzNOV29RNStRVVhRRlk5TnBQSUNYVTZ3OEhqRTlpUW1jdU9q?=
 =?utf-8?B?QmZmVXM2QTN0Q1p6bGpKRWU2VklZeDZmSXh5OEpjWkMxNnZGaHFpa2EwM2My?=
 =?utf-8?B?Znd2Ylk3L0RPeUZLaHk0Z1RZUko4WUs0aUlEZm9adkZHR2VwS2E1VWZxdUhj?=
 =?utf-8?B?Q1RFd0g2YkFPcnNoNjJMVG5oajFFUm1WRlNYdmg5cVA1NVpYUzBaRktIcHJo?=
 =?utf-8?B?b3FpN2JHK0lWaEhFZXBwaGszd3NjNjZtODBrVXFsRmh5a21kUVZabjFSSEZk?=
 =?utf-8?B?R0lTK2w0ZzhmQUp3TGZtMXNnLzkxc1JkaWxFdG4xR1U1N2dRSmptek5jUnZI?=
 =?utf-8?B?V3dPVVFEU0lQSWJ5TjFZR1pIOVhDNUFIMkd0RjlQR3UyR05PWFg5Zk9uaHhC?=
 =?utf-8?B?RnZ1Y08vMEF1NjRGNGRGRSthcVUzM09MLzVOU2t6eVNRRTMvV3ZNQlZ1Q3Rt?=
 =?utf-8?B?bmtFWnhrKzN3NGl5NHhLZXFwd2loZklnUlZaVDlHczh1dHR5R3h0Y1YrYVFT?=
 =?utf-8?B?UFVFNHo4MHd0UHB0cTgwMm1GZ241WlBxUTJxVFMyUUk2Sm9JSitPbFYyRnln?=
 =?utf-8?Q?sBm1V7AUGur+vWh2BsiSHQg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A832E2140A7EA5478C5014393612906D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a3010d-8144-4e59-7811-08dbaf618cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 05:16:10.9686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: diCf5h1Bxj9OM+IofQEgBvhDk7YP+5sUGISIV6omVQpwB9pV0Dw4TZCBCFasSIW0ErJJkM+Zf5R/7ysIDogcpy3bGwQeAvXjaGAtgBhDGGxqg9ER54t9Jp25ezxM62+R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5528
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

T24gV2VkLCAyMDIzLTA5LTA2IGF0IDE3OjE1IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBVcGRhdGUgdGhlIEdTQy1mdyBpbnB1dC9vdXRwdXQgSEVDSSBwYWNrZXQg
c2l6ZSB0byBtYXRjaA0KPiB1cGRhdGVkIGludGVybmFsIGZ3IHNwZWNzLg0KYWxhbjpzbmlwDQoN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9jbWRfaW50ZXJmYWNl
XzQzLmgNCj4gQEAgLTE0LDggKzE0LDggQEANCj4gDQoNCg0KPiArLyogUFhQLVBhY2tldCBzaXpl
cyBmb3IgTVRMJ3MgR1NDQ1MtSEVDSSBpbnN0cnVjdGlvbiBpcyA2NUsqLw0KPiArI2RlZmluZSBQ
WFA0M19NQVhfSEVDSV9JTk9VVF9TSVpFIChTWl82NEsgKyBTWl8xSykNCmFsYW46IG15IG1pc3Rh
a2UgLSBkaWRudCBmaXggdGhpcyBiZWZvcmUgcG9zdGluZyAtIHNob3VsZCBoYXZlIGJlZW4gUEFH
RV9BTElHTig2NWspDQoNCg0K
