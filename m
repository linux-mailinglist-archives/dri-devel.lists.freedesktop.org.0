Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B1A645757
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 11:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F6410E381;
	Wed,  7 Dec 2022 10:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8304A10E381;
 Wed,  7 Dec 2022 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670408179; x=1701944179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bOI87dwnpAAYIcz4pwj8gVbWAQ6uyu7QkvnMF9Kcpb0=;
 b=klJtoJkVkajXsZaswSDJmUqr0aEglSEee70w2NwIfUqLpr3Jk/4jju9Z
 p0/NKc8BEFJGe6u0AqAhOGLGeDQV+eS0R/iaFd1skvyJFcY8MeS9YnKXo
 2uQh5Z7gMTogYeEqZONaADrn99KHeGa1twxhn+jgoFnFe1FQ+YH+Qf2y5
 Zkdmp0EiOrNih5LERjfFcaOLbwlzHpBWWqauSd9DBXzbtWfiyLga8aPB3
 EGk2tATZuPFz5GTpbsYVu1f2isPsGzHhJBQrD0wsYIs76x/d4NSDLha4W
 b7JI7zc9zR6vcp7HI42Pro91L82y1sTmWtyZN0ud8SMiY4QfCkxUm6l3x g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="318711543"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="318711543"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 02:16:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="679083420"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="679083420"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2022 02:16:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 02:16:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 02:16:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 7 Dec 2022 02:16:10 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 7 Dec 2022 02:16:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HG61oU1qfu2q3Ayd3mLdZdc+d0zSJGwFnx8lXAXFQZ1gvtDXuemfRYPTGIZs108xlCAqJAMdf4CsX+CKvMamutKS8Et94CWzHOIbYDjdfRxVEEWGyZ6XL0YSENZ/TTnbo5fViYAz+/tfuGwAS/VfMYrrpGhcHVpLgXWjYXcUwA9zV022IGKsVSEhB757mLppi65Y6UBuzRYKyFhn6jlAa9plpiVOrSESaphFqjz9Rzc0s/Bcx1ljyY+cghHQaXg+OrS+f6agBfN85USrTEnX/f6YUkUMrz6Q5vHiuvvAwZKgXvAmJrcjFLiCQ81UTVoI1rEwYkMX8h34pebwL5uz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOI87dwnpAAYIcz4pwj8gVbWAQ6uyu7QkvnMF9Kcpb0=;
 b=K0tr0vFfREnI/Tcmelr+ZzfYlUA8xRjQ/Gz2VX+hOUwEMBJ4ARZt2aBDWbTj7InN3v2H07e0Hx1M6hL7DYA564Dfn/EnRJhULjw9+yetYPIphWp2yNphezw7axheIv+cnYQk9eSuy1pM+OlYcl5P/k9U4gprX0bTlh6y5aLo3cpLD3yFMGzM1ANrxo4Owu5FdCY9P2qLzWKOj0qFbo3RYyvGraXuRyw2TSwFPeVAOenxNbGwQMs7uZ8YHDBuwJ3LZH5FRgA+5RkG7c2SAWlGB5Pmw1nwHtSQq+LJPdCLuP292evpNwf75l0wnRbcTRib/Y+p2uO8N9C2pVLmeG3lRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH0PR11MB5425.namprd11.prod.outlook.com (2603:10b6:610:d0::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Wed, 7 Dec 2022 10:16:03 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 10:16:03 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gsc: GSC firmware loading
Thread-Topic: [PATCH] drm/i915/gsc: GSC firmware loading
Thread-Index: AQHZCTFCzrPc/5mGp02dHRqdSLHf1a5iODeA
Date: Wed, 7 Dec 2022 10:16:03 +0000
Message-ID: <7fdc90e651313c3238e66b1a5879300c4680cb28.camel@intel.com>
References: <20221206011908.2745508-4-daniele.ceraolospurio@intel.com>
 <20221206051555.2758268-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20221206051555.2758268-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH0PR11MB5425:EE_
x-ms-office365-filtering-correlation-id: 2916abbb-ffdc-4701-3f9d-08dad83c0be5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vWR9zPen2nQlQntelLoyw1oYVKiyx7njFtiujFI+zPcmEamTZtV9nmzLokLwC50RHDLNE+MY9nYB4raidlfBIq6h1H0KMxOa4lrCxXPOEew37QDuUfGwU7n7ADnGUtcRMPpOb61DYOlHNLAR7+NnMIf05WKl6VQ6FFW1lx2QcHHegsA9FuGurNR/DAFRu0pxCI25ksJWdb+gFbwAWACm7QzjNmvtIBTt4mVwyKjZov4Oa57OMD9rQt239gsdAlE07ZeXV4Og6lhiJRbOaG/TlpWDwgzsEziwwmwEOLDD4oBlzd5a/nn4jFevQXaSZN+d/1CDq7pyLY6YhYAktmHPzKZx+9SJySXO7tCj1FJ+W2ysYdL0yOp1Q5SUSqRr+sx83P9Lsm3D/vVd7yM6EWY8Z5JJhdfzO6t7sdKVlEuWagzRnBz93QRo5XvOoQ5pZlaQljFQ2tguxsADOjYvXjiSxciAHI7V84RHRro8qiu+EuVcAgh9Se9j4gDIxF1XoseDTLLBp7IjWTPZSMrwUI9MCaWMpmTMegy3GLRz2EnGdLSmKoWPWM7rhE2XjJiBeZ/nUyCHsWYjxlRZdBFPKLUmMOF66HCvEpq7eUM/4yg0XF/cJsM9HLDSvDcI0K3PdjCoRVPaH7XvaRGFdQRgNe6nRSJEZz+6Teg0Cy5IyAtXqHfKNRqunbXludSDarC3Z5T9JiUuU43M9FggRHvC/ovWxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199015)(6486002)(4326008)(66946007)(26005)(82960400001)(66446008)(64756008)(66476007)(8676002)(122000001)(91956017)(107886003)(76116006)(2616005)(450100002)(66556008)(2906002)(478600001)(6512007)(38100700002)(86362001)(38070700005)(6506007)(36756003)(71200400001)(54906003)(110136005)(316002)(83380400001)(8936002)(5660300002)(41300700001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekhOQW9zQnREZXZMdFNEalVGT0gwbU8wUnMrajhGdElwYkFSTlV1R3hKT3Rq?=
 =?utf-8?B?WFNUSjR1ZXNubzFtZExjQmE0WVJhRFA2QkJaQlY1cktSQ0lMWmRicTJjc2N4?=
 =?utf-8?B?Uk1zTFhRaDc4NjF2Skt6RUxQMFc1SnNlamExQy9ia05POVlNNCs1dHBwcGZM?=
 =?utf-8?B?L2RNT1lWZVFBT1B6R2NPaTA5aFJTaFB1ZTN3WFRYY3J2WTJzR1Qwck5pZ3dD?=
 =?utf-8?B?MjNmN1kzaXdXUkVvZGNYOVliUW1KRlJrbEVGaVVDUVV4dURWaWJodDRPRndj?=
 =?utf-8?B?VnhPTS9TZTB4QmhLS3B5eHhvZkhUbjR2ZmJnYVZ3RDVCNzBmdDJubExBam02?=
 =?utf-8?B?YTZCY3dHSzJ2V0N0eDN6b2Y4bUh1YnBXQkpzQXAzNlNpMGRFMWVrUHBDU3lh?=
 =?utf-8?B?MkZ6VXArcTBINlYza1pXTWdCT3RjbkdaT3hhVkRBWlREbWplbHptR0xrUCtj?=
 =?utf-8?B?REt0YnZGNXh3WVpGczY0TUd5ZzdhU25zczR2VGFmcTZJV2wySzFTVXRSRC9x?=
 =?utf-8?B?Nk9VeGFaeDQrMHkyNnQ2WG5KQXhPZ08xSkVHcDlzZk5IYUtFdVplejBRSDZl?=
 =?utf-8?B?ak45VlJjOGQrVG9hd3dneW4vejJIMWdwUjBscTY0Z1BFTlJyczB4YWFqaUlD?=
 =?utf-8?B?d3Jwa1A4S1FQb3lXMW93cVo1TVp2eTh5TjgvOTJCeWVRVGJ1Vkhuc25qblU5?=
 =?utf-8?B?VnRQQVdRazFwY2t2WGJzdStjbWdwOVlzNExQK09xc1FNSmtsSWgrTlYxSnZD?=
 =?utf-8?B?R0UxNmE2K1lXVkNoK1NDczJ2bkRzc2xEbnZXc3lMUFJ1blVqamREQlBOcDc2?=
 =?utf-8?B?bWJ3OGkvT1VhV3Z5azIwWXlkQnZxOGpjSWVCVEFaRUxJZDNmdEd2N3dsRkRl?=
 =?utf-8?B?ODdIWFo2c3RUSXFHSGVMTDdtLzR3TFNLQVZTV085ZDFRY0N2SHdjcHNwdU5Z?=
 =?utf-8?B?UGRMZ2Jvc1pVRzQ3aDhEOHBDNG02Q2Y1RTNLTWFkVitVOGtMRmR2TTNILzg2?=
 =?utf-8?B?TzF5SU51Yjl5UFJTeWJDQTUyRjRIVW40NFBKUWVJS1V1MlZZNmE2NHNFTDkv?=
 =?utf-8?B?M1U0Z1VvZE9xMXNDNWh1VktFcHE2R3VIeExRQ1BIa3dMS3VOOEZpMTl0cG5l?=
 =?utf-8?B?MEVoK3N3dnFQTVZDQ0Q4amJCdTNVNjQrRmdaMC8wL21iL1E5bzliQUx5WlUv?=
 =?utf-8?B?Y2ZiK0daY2VhaVk1bHB6NENMQW0xd2xReG4rb3pTOXlXR21TSFdpL1RHRE5x?=
 =?utf-8?B?Mk94TDJiYitoRGp4VTJWNHBnak1lMXJHRlNXN0FrTk53Ky9aSWtNUDhISXpk?=
 =?utf-8?B?Y0ltR05mMDU5NjU4RzdJYzRWNG9Fc0g3cXVHVFdQdnZ1Nk11MnowOFRNS1pJ?=
 =?utf-8?B?Q2YyaURDQ3UyYXIrS0UvbkRvdEdDd1ZYbE9WWFpmMTdRU3ptc1AvdzZrR2ZK?=
 =?utf-8?B?N2Vqd25ZV0xaMFkwbGIzc2hFZ1lFZjRBM2NRU2MzT3djL0FtSDIvUEZPbkRv?=
 =?utf-8?B?MWFERTFJbDVkVUNWOTUxczRHVHlDR0pkMkMweVI2YlU1dVIzRGpxTkZ1Mmhp?=
 =?utf-8?B?ZDFEK3c0UStYOXJRNG90RkJwYmdzeWVtOWlNMk85Rk1rdUpQc2dsRGhkYkJG?=
 =?utf-8?B?VFF5M2svMHlScnQzZDZuQ2UwWUxIcDd2dEt0UHZtK3REYStGd2hMOFJpckll?=
 =?utf-8?B?eXZ6RXpmRnY3cnZvc3RmSzF5QzJ3emU4OTRiZkJJUkNHQmtETHBuWnVXV04v?=
 =?utf-8?B?NTUvUDNtSG9nT2RjUFdPSnZmZXo5YWNUOERWTC83dkkxNnQwUHU0V1pjMzR0?=
 =?utf-8?B?VkpSZVdlaW9IK3cxYzlXb2pHd3JkdVErQ3ZKenlBWmhyaDJmMlcyMzhORGxI?=
 =?utf-8?B?dm5pY29mUHlLVllzSlpXWllYYWRQdzJRa0JNOFFIeWI0dEl6eml4NitQbHl6?=
 =?utf-8?B?N2NoZEdNLzBEZDNZM0xVZVlkY0ZBZzl3c2h0Q3VDVTU2aHg4Y0F1OVV6dmR5?=
 =?utf-8?B?bmsvNGRjZnZNNXVJSWRPM1c3Zld1ditQRnl2L3MzdmpFdGMxZkZBMWpKRVIv?=
 =?utf-8?B?WXZtYVlHanpZamc5Qjd6c3c1VGNMUFkzTnJvbkdZMlZNSWZaTU5LRzdhNVU5?=
 =?utf-8?B?ZWttaStlbnBUMUs0cGkxUndKK0w1dFFXeVJvVGtyVyt3bzJmUktWZmdCTGVx?=
 =?utf-8?Q?NY8cAvs2f/AaFSPhwmQT/HY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F40D9243EBF7F498B813F1CBED019D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2916abbb-ffdc-4701-3f9d-08dad83c0be5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 10:16:03.5088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HtyELZtQX+wTe4Q1c5UhMLP1XTwbsKr78qn6hK/OghwmreXQZF8A6j5f+5FjOTUFhlzK73GnquohdfpDIXm7bbj7peAphWGFwrpmdvROS30eFHAm/k04xpZqznWaV1cF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5425
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGlmZmVkIHRoZSBwYXRjaGVzIGFuZCByZXZpZXdlZCB0aGUgY2hhbmdlcyAtLSBpLmUuIHRoZSB1
c2Ugb2YgdGhlIHdvcmtlciBmb3IgdGhlIGdzYyBmdyBsb2FkaW5nIGNtZCBzdWJtaXNzaW9uLg0K
QWxsIGxvb2tzIGdvb2QgLSBqdXN0IGEgZmV3IG5pdHMgYmVsb3cuDQoNClJldmlld2VkLWJ5OiBB
bGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg0KT24gTW9u
LCAyMDIyLTEyLTA1IGF0IDIxOjE1IC0wODAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSB3cm90
ZToNCj4gR1NDIEZXIGlzIGxvYWRlZCBieSBzdWJtaXR0aW5nIGEgZGVkaWNhdGVkIGNvbW1hbmQg
dmlhIHRoZSBHU0MgZW5naW5lLg0KPiBUaGUgbWVtb3J5IGFyZWEgdXNlZCBmb3IgbG9hZGluZyB0
aGUgRlcgaXMgdGhlbiByZS1wdXJwb3NlZCBhcyBsb2NhbA0KPiBtZW1vcnkgZm9yIHRoZSBHU0Mg
aXRzZWxmLCBzbyB3ZSB1c2UgYSBzZXBhcmF0ZSBhbGxvY2F0aW9uIGluc3RlYWQgb2YNCj4gdXNp
bmcgdGhlIG9uZSB3aGVyZSB3ZSBrZWVwIHRoZSBmaXJtd2FyZSBzdG9yZWQgZm9yIHJlbG9hZC4N
Cj4gDQo+IA0KPiANCkFsYW46W3NuaXBdDQoNCg0KPiAraW50IGludGVsX2dzY191Y19md191cGxv
YWQoc3RydWN0IGludGVsX2dzY191YyAqZ3NjKQ0KPiArew0KPiArCXN0cnVjdCBpbnRlbF9ndCAq
Z3QgPSBnc2NfdWNfdG9fZ3QoZ3NjKTsNCj4gKwlzdHJ1Y3QgaW50ZWxfdWNfZncgKmdzY19mdyA9
ICZnc2MtPmZ3Ow0KPiArCWludCBlcnI7DQo+ICsNCj4gKwkvKiBjaGVjayBjdXJyZW50IGZ3IHN0
YXR1cyAqLw0KPiArCWlmIChpbnRlbF9nc2NfdWNfZndfaW5pdF9kb25lKGdzYykpIHsNCj4gKwkJ
aWYgKEdFTV9XQVJOX09OKCFpbnRlbF91Y19md19pc19sb2FkZWQoZ3NjX2Z3KSkpDQo+ICsJCQlp
bnRlbF91Y19md19jaGFuZ2Vfc3RhdHVzKGdzY19mdywgSU5URUxfVUNfRklSTVdBUkVfVFJBTlNG
RVJSRUQpOw0KPiArCQlyZXR1cm4gLUVFWElTVDsNCj4gKwl9DQo+ICsNCkFsYW46IE5pdDogSSBz
ZWUgeW91J3ZlIHB1dCB0aGUgLUVFWElTVCBiYWNrIGFnYWluIC0gbm90IHN1cmUgaWYgd2UgbmVl
ZCBpdC4gSSdtIG1hcmtpbmcgdGhpcyBhcyBOaXQgc2ltcGx5IGJlY2F1c2Ugd2UNCmRvbnQgY29u
c3VtZXIgdGhlIHJldHVybiB2YWx1ZSBmcm9tIHdoZXJlIGl0cyBiZWluZyBjYWxsZWQgLSBidXQg
aXRzIHN0aWxsIHdlaXJkIHRoYXQgd2UgYXJlIHJldHVybmluZyBhbiBlcnJvciBpbiB0aGUNCmNh
c2Ugd2hlcmUgRlcgaXMgYWxyZWFkeSB0aGVyZSBzbyB3ZSBza2lwIGxvYWRpbmcgYW5kIGFsbG93
IG5vcm1hbCBvcGVyYXRpb25hbCBmbG93IChub3QgZXJyb3ItaW5nIG91dCkuDQoNCkFsYW46IE5p
dDogbm90IHN1cmUgaWYgd2Ugc2hvdWxkIGV4cGxhaW4gaW4gdGhlIGNvbW1lbnRzIGhvdyB3ZSBj
YW4gYWxyZWFkeSBmaW5kIHRoZSBnc2MtZncgcHJlLWxvYWRlZCAoSUlSQywgaXQgY291bGQNCmJl
IGEgcHJpb3IgZHJpdmVyIHVubG9hZCB0aGF0IGRpZG4ndCBkbyB0aGUgRkxSPykuDQoNCj4gKwlp
ZiAoIWludGVsX3VjX2Z3X2lzX2xvYWRhYmxlKGdzY19mdykpDQo+ICsJCXJldHVybiAtRU5PRVhF
QzsNCj4gKw0KPiArCS8qIEZXIGJsb2IgaXMgb2ssIHNvIGNsZWFuIHRoZSBzdGF0dXMgKi8NCj4g
KwlpbnRlbF91Y19md19zYW5pdGl6ZSgmZ3NjLT5mdyk7DQo+ICsNCj4gKwlpZiAoIWdzY19pc19p
bl9yZXNldChndC0+dW5jb3JlKSkNCj4gKwkJcmV0dXJuIC1FSU87DQo+ICsNCj4gKwllcnIgPSBn
c2NfZndfbG9hZF9wcmVwYXJlKGdzYyk7DQo+ICsJaWYgKGVycikNCj4gKwkJZ290byBmYWlsOw0K
PiArDQo+ICsJDQoNCkFsYW46IFtzbmlwXQ0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Vj
L2ludGVsX2dzY191Yy5jDQo+IGluZGV4IDY1Y2JmMWNlOWZhMS4uMzY5MmJhMzg3ODM0IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuYw0KPiBAQCAtNyw4
ICs3LDE5IEBADQo+ICANCj4gICNpbmNsdWRlICJndC9pbnRlbF9ndC5oIg0KPiAgI2luY2x1ZGUg
ImludGVsX2dzY191Yy5oIg0KPiArI2luY2x1ZGUgImludGVsX2dzY19mdy5oIg0KDQpBbGFuOiBh
bHBoYWJldGljYWwgb3JkZXJpbmc/ICAobm90IHN1cmUgaWYgdGhpcyBpcyBhIGhhcmQgcnVsZSwg
Zm9yIG1lIGl0cyBhIG5pdCkNCg0KPiAgI2luY2x1ZGUgImk5MTVfZHJ2LmgiDQo+ICANCj4gK3N0
YXRpYyB2b2lkIGdzY193b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCkFsYW46IE5pdDog
d291bGQgbmUgbmljZXIgdG8gY2FsbCBpdCBnc2NfbG9hZF93b3JrZXIgdW5sZXNzIHRoZXJlIG1h
eWJlIGZ1dHVyZSBwbGFucyB0byBleHBhbmQgdGhpcyB3b3JrZXIncyBzY29wZS4NCj4gK3sNCj4g
KwlzdHJ1Y3QgaW50ZWxfZ3NjX3VjICpnc2MgPSBjb250YWluZXJfb2Yod29yaywgdHlwZW9mKCpn
c2MpLCB3b3JrKTsNCj4gKwlzdHJ1Y3QgaW50ZWxfZ3QgKmd0ID0gZ3NjX3VjX3RvX2d0KGdzYyk7
DQo+ICsJaW50ZWxfd2FrZXJlZl90IHdha2VyZWY7DQo+ICsNCj4gKwl3aXRoX2ludGVsX3J1bnRp
bWVfcG0oZ3QtPnVuY29yZS0+cnBtLCB3YWtlcmVmKQ0KPiArCQlpbnRlbF9nc2NfdWNfZndfdXBs
b2FkKGdzYyk7DQo+ICt9DQo+ICsNCg0KQWxhbjpbc25pcF0NCg0KDQo+ICBzdHJ1Y3QgaW50ZWxf
Z3NjX3VjIHsNCj4gIAkvKiBHZW5lcmljIHVDIGZpcm13YXJlIG1hbmFnZW1lbnQgKi8NCj4gIAlz
dHJ1Y3QgaW50ZWxfdWNfZncgZnc7DQo+ICsNCj4gKwkvKiBHU0Mtc3BlY2lmaWMgYWRkaXRpb25z
ICovDQo+ICsJc3RydWN0IGk5MTVfdm1hICpsb2NhbDsgLyogcHJpdmF0ZSBtZW1vcnkgZm9yIEdT
QyB1c2FnZSAqLw0KPiArCXN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZTsgLyogZm9yIHN1Ym1pc3Np
b24gdG8gR1NDIEZXIHZpYSBHU0MgZW5naW5lICovDQo+ICsNCj4gKwlzdHJ1Y3Qgd29ya19zdHJ1
Y3Qgd29yazsgLyogZm9yIGRlbGF5ZWQgbG9hZCAqLw0KQWxhbjogbml0OiB3b3VsZCBiZSBuaWNl
ciB0byBjYWxsIGl0ICJsb2FkX3dvcmtlciIgdW5sZXNzIHRoZSBmdXR1cmUgcGxhbiBpcyB0byBl
eHBhbmQgdGhlIHNjb3BlIG9mIHdoYXQgZWxzZSB0aGF0DQp3b3JrZXIgY291bGQgYmUgdXNlZCBm
b3IuDQoNCkFsYW46W3NuaXBdDQoNCg0K
