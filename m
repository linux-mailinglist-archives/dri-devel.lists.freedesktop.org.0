Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D62644DF6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 22:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C880389B01;
	Tue,  6 Dec 2022 21:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70F089B01;
 Tue,  6 Dec 2022 21:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670362118; x=1701898118;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/vWDTaaQ/cE4BXytYituOgK1pbQs0I4K6XKsLGY65XQ=;
 b=ICpXdKdhvFdP4lxJUjyxQH977HCGNmAcAZ8UDch0Biq2l5zokJrRH2RF
 Uev+i8bi1YnS18xqqVz2kt3F/ugFFgShY8IOaMdqHb8Zzyjq0b9CYn83X
 86WCVTBYW3loyqrq1bWPIj1926B2qQzlyanvvdrQ4I5fBPV6b8OhufIba
 c3LdVnm6WRYhfgO8BfPKQYNCB5v9q0XT4BAmmVlMn3kLBS4LPhdYI8NHU
 PtQLS4USzffItpbKgcunGyzhHPXA/irXycsJH/y48e4nGV/5iutrRbqIA
 UMYoVZWSqs9ZWLKtBNfAvp3C79V3pS1IcODRytiBT6ofXvS9DawH+aMeA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="296428526"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="296428526"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 13:28:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="640019138"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="640019138"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 06 Dec 2022 13:28:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 13:28:37 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 13:28:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 6 Dec 2022 13:28:37 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 6 Dec 2022 13:28:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/f0ss42DQWyHbjioIDcO48Y+9SjgZMa5BurX7sGGcF9w3G9MjZVTRDzfbOf8eSbmQPIaNXQSW+BF+AH35jaN4x3I8A7K/zZ1h0XOVEdCzCkNP7djQb69ep0z2HoVCUOPKg3I3IniN2oPGBmgYZ6+6DpKK3tl3qT8fw6/hCk+j+MG+BwOD9ZcVoYfvSdNGlqHxKGSghb67FrJDSim5QanVVB7qmeF7auKvroMWLSRZD2uClXtp5JgHLVPyNXR469kVZ19z8JltWkYZ5z/TYprK6DsQCHG6fy2rRJdRgYlcDSNxh859FdxKlEps7fDonpYv1ocswg5mfZon03NrlnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vWDTaaQ/cE4BXytYituOgK1pbQs0I4K6XKsLGY65XQ=;
 b=E4E8Zp+oNJ1hIgj6FIqiBEb+RkSg8z0smKSXPS42j5Lrsal8NT1Ugj55r+VRA3JmdT9HdyCFJgx/A2xGmQPAYnZUHbSi3ral9gai21kTeU5xVyk3rZt1aVkfcTmG9oV/4J1lBHVcfGZCkAG6vXEdwOXNTnccih/FSm/n8/yB09w24VxR30oI54fsnEMTd2cvIhmIJ8OaSpgimN6MGwvcZ+/69uwEQTJAkXEDg1D3mmm7B3b0Wpe7JDZMyK9cv+mV3uoSWOQgD0xXGXSChQnMulBDF0VmV05y5eDGBnPguLPkRlR1tz0iVZ24GcHpnsTZwHVoDLlcEOJsoJgoTG8nUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB5600.namprd11.prod.outlook.com (2603:10b6:a03:3ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 21:28:35 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 21:28:35 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v9 1/1] drm/i915/pxp: Promote pxp subsystem to top-level
 of i915
Thread-Topic: [PATCH v9 1/1] drm/i915/pxp: Promote pxp subsystem to top-level
 of i915
Thread-Index: AQHZCbkdJGvX60BIuUST8q9fx4KBM65hYLsA
Date: Tue, 6 Dec 2022 21:28:35 +0000
Message-ID: <b69d6671c010149ebdcfc8310a50607b1c24ecd6.camel@intel.com>
References: <20221206212705.344422-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206212705.344422-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB5600:EE_
x-ms-office365-filtering-correlation-id: ab9ea9df-97d7-443c-9bb8-08dad7d0d50a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b/OK7E7aPw8go454g3+5SWdaNrSlPcvvHhhKG+lVKgD/sj44l275MLE3aJiUjyrHOTFFVVoBOlxOV2IZcPz7f4s6wJ6y6Ccu+Y/FYnY2oalfYgg2jACJhKg8DVHpBpplxk1Z6z5XjAFG80E/OVfBWTap3YYzzF09QmNerHZqI6iCZm46dWaZFeuHFo1aSe5z2Mb5kzzxTT3GMOliVvGuyjyJ7/kKsunKv7EPaptMevPFCH8vapW5WbCnliZBx8lZkdWoLsB0D3BCu15DVn2hzphSbZ07o5sM5msWX19UqD7daUdB6UO+rIdVHTmYiYH34lZ3aEkZIQNwtX1AQkPPqwhD6vhpHioXNFTAZVehQe6B7F/f5lEqWNt3ClVE7h5mzjLYrZ8FLBjTVmf1fSF2e+pvmHpOCd/MXARExa+hEqH6J08+9G+p7UwLStzYeTBrw92/uUA2A2TkO5xIg7rHA0dJKWiGK9ZYJU9yrOznuHfPVVWd+6YwHvDr+kc309EHIZFQbHT+rIO86rX08q51rhelN1oAesKrmEydy7EWX1tIwPRBerRRclR5hwMzgKknvMz84ghoXEJYMMiHwGP0AjTYDrOK+5aFKlu1e4ORef2gsTmH0oLDTDUg5BIC8ZdevFBwFePgkJrbQvzDBQfr0TFyaBbdWme+wFA6jfQL2JCd6ap23GFcTIzRkLivbgowV3HGQ36T5JU8WoyZCcMEIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(36756003)(91956017)(5660300002)(82960400001)(86362001)(8936002)(4326008)(41300700001)(2906002)(38070700005)(122000001)(558084003)(66476007)(54906003)(66446008)(316002)(76116006)(6486002)(6916009)(2616005)(66556008)(66946007)(71200400001)(38100700002)(8676002)(478600001)(6506007)(6512007)(26005)(186003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmxKTFhDK2M2T09RQkVtS2szVmdOeEUwWTMzM2ZCRXYwRG5DY0V3YlBoK2xj?=
 =?utf-8?B?dVVabElnZnJzU0xld0JPbVczcWluU2k5cDI1a2dOSm0vdGxJRmE1OEp1V2hi?=
 =?utf-8?B?aHpTZ3o5YmNvRjJtUENSQ2xsMG9HWUZRdGliQVlVbW95d1JocjhXcWFONE9x?=
 =?utf-8?B?RmlsamxSNEpJZkJyTWJqQ2lieG9pMTREUEN5MG85bGJMVUhPbFV4clZQUlpi?=
 =?utf-8?B?a3JwSVhPN1h0aGY2LzR5ZkFtWGEyNmkrMXQ3N2lLUUpuL0hqMW9IQUxuM2JE?=
 =?utf-8?B?NDN0eFdPVHo4RUR0Nk4vK1cwNWlSTDE1K2ppRStWVmlQTmtLYThNTWF5MDZp?=
 =?utf-8?B?N0JQcmtxWFh0bkwxWlFRVWxQWGpmQmdwdkZJMnRKNmpGOFhXRHpMMUprSGgx?=
 =?utf-8?B?TVQyeVpvSTBHWCtiTXBlQXQrVFVlL1BLTElzMExOaFdtQmZxYWoxVE1PSXdX?=
 =?utf-8?B?NnRsWW5GblpVN3ZvNUcwNFlqekQzOVp4ZzFkZWlyTWVSLzRLMzQ1UlBGQ2Ev?=
 =?utf-8?B?eXcrNG4weXNYVy9RTjdIUTZ1TDZoRkgyRGtselIxaHhYd1V1VDMwTllsRkh3?=
 =?utf-8?B?ZFFWTG9naHhCYjZzbFRwVjBmM3E3Q1JBd3N2MFpaa09lczdmZXdRbnBhNGYw?=
 =?utf-8?B?eEJlZVltU1JyQ2pxY1o4WnFYNDJtYU02WWxzdGY3bXVsL2VzcTBUbHVLNFpX?=
 =?utf-8?B?OVVOREJ3eW5jMnpuRWNtbXVCNy8xdnRsUEpLUDFtWWgvZkxHQy9hU0dmSE5a?=
 =?utf-8?B?Q1YycForeUt5WnNDKzZrWnhvWk9wS0Y1Qm1sbkZyTVpGbExhdXZEOHNBUGZY?=
 =?utf-8?B?UU5KQmEvUU5YaGZqV1FmUHhzZnUzVVphcVcyRDVHR2w4cTlGd3ZMNjhkRnJ1?=
 =?utf-8?B?R1k4bzlrTkxGUjkvRkl4OFBjM3E5S1dvMVY2aGNoQkJKTFgrQS9qOS9zOXBE?=
 =?utf-8?B?NjZjaXh0OVRCaGRWd2xsVWJDeGZTZDlZT0JEeGJ0TzUzME9TZ052dHFWanZr?=
 =?utf-8?B?T1JFckJWVEUwbnEvdDYrUVo3bExPZkN0bCt1VW5qSHMvOUNWajBCMytlYXBk?=
 =?utf-8?B?Znl3angzWlFlaCtub24vZFJoSGxCa3IzT0crRXh3akJ6b2lsRndvMXk5TXBE?=
 =?utf-8?B?QXc2YXQrUTFVOXFtL2JjcHlvbjBQUjN6R0tFRHlDT08xTTVYc1poc0hYNGVn?=
 =?utf-8?B?YlFSU05ENGxUang4dVFZTTJRNGEwaGdqZVVVSGYwdCtmODRnbjA3ZHhOejc0?=
 =?utf-8?B?MkFtdHpIZC8vNGlJY1J3ZzdQTkxvWWlRaFEzemZ5YU5TbmFOaWhRWU53QzdV?=
 =?utf-8?B?VnV1WWQreitkcVV1KzZjSWFtbGxlRzRmbjdSbnJweno5WGpYTmxsbUgyRWdZ?=
 =?utf-8?B?Q2tweUd4QW1VYXdhYkdwVlZEZkZ5VHF2SFV0TGt4V0o4a1RYU1FMU0ZMR0JW?=
 =?utf-8?B?c3QyMVhOTDRHSXJTNWlyRThiNjdBMHkwSjdGUGpFeEFKcWp0bEkvMDVmQjZG?=
 =?utf-8?B?ZUgzbDl3TkNpUklRMEs0cUFocy9nOUhaWFJkcFRTVkZSWWlyeERZV1htT0dr?=
 =?utf-8?B?bDdhQzluNDE3aHkxZElsckRtamZid3ZLbXBZcllHSFMxUEozdWRGalNlWXF6?=
 =?utf-8?B?NlMzRGp2QWtRZVRkRWZzTSs4VVQwYWdJa0l1TGxPUUNWT3ExYlZRMHNncnBF?=
 =?utf-8?B?S2JQcGNSRHZEbFR0aUNEcFU3S2hoa0UxbldhbEE4TzhhY1hJV1dEc095b0R0?=
 =?utf-8?B?T2NJbEROYTc2SG16NUtxVXR2dmRPaXNibEdNS1o5aVdTQ2t0VHVjbnBHRHlu?=
 =?utf-8?B?T2VLdUtPZXdjZkRhUFJ5QVNxbUdnTnVkR1NNeVBobHpkU0YzK2F2eXFKcUdk?=
 =?utf-8?B?cHB1QzB0Wlk1ejkwOVcwcmp4RVBEeVNZVU9VOXhPMFYxd09ZVnFnd2Y5elp2?=
 =?utf-8?B?YndBdmJZbWZXdVFGczh0ZVJUWTZOeE1Va2tYSE5VNm1LaWRHYURtWm5NMU5P?=
 =?utf-8?B?elFQNGxrK3RSMHBGOHlNdFVBRWcvWTVJcXlKNU9ucW9FSzZSTTV6UURQMXpq?=
 =?utf-8?B?MjJOZmxxZk1JNEd3MXkwcDRzNGhoRDVCaXMxb2gwdCtuQml0LzdiL1kvVERv?=
 =?utf-8?B?bUJGZ1RjS2VqSElRZnhtRlRJQWpkOEhMLzZJR1AvVmRZd2E5T0I5MS9qTkFI?=
 =?utf-8?Q?IKV1o3qj+hK/MwXS3jPFfcg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88A1CD70FE174D448A64E7759259FEBF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9ea9df-97d7-443c-9bb8-08dad7d0d50a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 21:28:35.3219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vgZ7I2EmjaKHBl66LRLiuSoXdcB1smSNiO9ntJ9o+0rnaTEwaSsi39eczrRwGVRNX0y7mccWW3jDd91uEyl1/nF5n6kZvD68TaFUqn2anOOO03yk6KmfEIIKBbjV+Dph
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5600
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBvbG9naWVzLCBpZ25vcmUgdGhpcyAtIHR5cG8gb24gcmV2IGNvdW50IC0gd2lsbCByZXNlbmQg
d2l0aCBwcm9wZXIgdjEwIHN1YmplY3QgKGFuZCBjYW5jZWwgQ0kpDQoNCk9uIFR1ZSwgMjAyMi0x
Mi0wNiBhdCAxMzoyNyAtMDgwMCwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToNCj4g
U3RhcnRpbmcgd2l0aCBNVEwsIHRoZXJlIHdpbGwgYmUgdHdvIEdULXRpbGVzLCBhIHJlbmRlciBh
bmQgbWVkaWENCj4gdGlsZS4gUFhQIGFzIGEgc2VydmljZSBmb3Igc3VwcG9ydGluZyB3b3JrbG9h
ZHMgd2l0aCBwcm90ZWN0ZWQNCg0K
