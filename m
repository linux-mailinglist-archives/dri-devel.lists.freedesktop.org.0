Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C68B27D66F9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1830910E61A;
	Wed, 25 Oct 2023 09:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5105D10E619;
 Wed, 25 Oct 2023 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698226581; x=1729762581;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rTPq8k6EB0gcU+Dfa21MCZlC07VTvdXvFWmKVcI7sso=;
 b=G3w4Xe0fdOk4WakCTIOanW3ihEqwAZhz1wZ+/zLac+TPC0Zr3nfkt5sv
 yRp2sFs01g97Quc5tVQvNorA1kU7nj5HRTvKKAzNzp35+JmV6zRrP76kY
 3H8FOZLSHetvYGKSVOPMShxy89d/x63JYBcybEh+777tBfhUu6Tj1ipof
 MF75LsnhwmqtWxnc8L7mFo9+gEy4dX52qT1jPrs8QruylS9AYyqb3f9vN
 26hfujt1gahD9QWdxsOvwsRg7w7YKo4AdJw7FxGgLnP9wrckJidI7bn5N
 QCTMbrbS7WhV78oFJJnlhZJN80Ek2AJQ7YV3HyTMtvDBnqCdBEdVmyakL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="387087111"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="387087111"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6475125"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 02:35:01 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 02:36:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 02:36:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 02:36:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HA4ocWAXzGTGQgbfSILLnvSKmI2NQSb2hSpgXv48/0MhshkpK4FLYXESg93J9kg8WGX/8YOrKWX6yE3hdLICqzPZyY6OygSukCQfUYfvzmtvFyh5JXEpEwW4PfHAbJbbCSErTY5sjoBvqTqvIX6j+o98J2BrmjPQyKHnl/M1NsqVea08OZqRFS51GlbqWNytcVZDDCTnMaAzOB7Go4GccmQvuhEPd+rCI3ji4VYUfV6LTXMB0QACfoWls9m7Tye0neAUchHJACp91pThMyLR7dkxUM8mWa+zV2WGsGtXsgZniEJerasxMHx+VeCOuP1sKHAypgjPC2acv0V0BxVoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTPq8k6EB0gcU+Dfa21MCZlC07VTvdXvFWmKVcI7sso=;
 b=dZQIeC40QWSdGEGWaeXWnkuoqkH4orK75FE8+YJwKw4lIjdmSB7UdETrohOKtIOr8B3cekVG3Yhl49VH8oNFHxJmNrMu/zNF1voeehsSzZQozUOZIKulAJUZD51l3qVuBMJ13ov289itIWq3my5+Hv6Eax++NiqjY80ikpGilG4n5NmqS/cbFppDc77Qn93lTJdjHaiWvbET/W14vF5crQengrHOm60mJXgH7Lcwrd5flF73AtcKVI+rzFcjR8oK4RvGOTHZYZmZdg+Aowx2uKEEOMz+/4baXq0Cn+uLfbsn+I9KmZ4jjd6JEddDy6ITARuWDFqr9XibS5L8KU2Ijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 09:36:12 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6907.028; Wed, 25 Oct 2023
 09:36:12 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v5 6/7] drm/i915: Implement fbdev client
 callbacks
Thread-Topic: [Intel-gfx] [PATCH v5 6/7] drm/i915: Implement fbdev client
 callbacks
Thread-Index: AQHZ8S1nghLJGRRpgEWoEvB95dAdgLBaawQA
Date: Wed, 25 Oct 2023 09:36:12 +0000
Message-ID: <07431faca53e93e502006484c362ce08d36a6335.camel@intel.com>
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-7-tzimmermann@suse.de>
In-Reply-To: <20230927102808.18650-7-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW4PR11MB5889:EE_
x-ms-office365-filtering-correlation-id: fdf952e1-0150-43a1-1de1-08dbd53dd3a6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qLrTm86qCMG4uLRrNXc1bY1zTwdU2DsQnLAV6n9dEy4uH4PIaYh/vWvZXuzH0+FM3ap057jMHRA0o8Vma+gQwWVhOZw/1jcIvvwMs/UJ3IbaaaWvoFRjfmu8Bnx67Z86RiINFS/Q8MvzLzBzwrjeoEDAY4bvSzD2gNPhTraEnqakHKL/WbPyQXvR1CzTNSoVSMEWsTN021FC+IWqWOaEuh9CiOHavdaFTEl8Cfju5+WiWpFRhPZzqGWWvg0DlGQgOUudewXI/YtXt2bpiE5ZuzuyCzC89KYXd8aptoKUQmfQJJdJBZOt8FvX12kMOfTUrCnNhgh+Qv04KdNz39heMirwIA/MLyl8VZB3Yez/Wkr5O16tqFm3x9AIFLIEki+9VUEbVp5hWmkcuAwz3fYpXftrtFNzLpFAWgMGibOaXvNm6g2eJtwtaZhXJ+Go9bnX6FRfuKByIAO0CtUJ6w38YZFQBkoq+3rIJ3nOy7cCOglGf3WXaN40o5Rxmp8iWHW/wHPavA2Nlp/A9/1dxD8RlRa+hd6x9dVbbgBhXtYFfs0w2bhOi2D94pm0WLfITtX8vJygqGbNIPzkqvqObBQnCYzlpC8Bh8Gi2dA1lMzo3CXj059q/qOWlug47j84HlLwT+RSegGfUdgjRCtVjo/jsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(38070700009)(26005)(921008)(38100700002)(2906002)(5660300002)(36756003)(7416002)(8676002)(4326008)(66946007)(8936002)(71200400001)(6506007)(82960400001)(478600001)(41300700001)(66556008)(2616005)(110136005)(122000001)(66446008)(316002)(76116006)(91956017)(66574015)(64756008)(54906003)(66476007)(6486002)(83380400001)(86362001)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bE41aFB4S0UvVXJ1YUxIZis5WXZoNHA0SUxxODFXRUpnS2ZINVpJaUhFZXBx?=
 =?utf-8?B?NzVlZnRlOVN5bEZ5UVdQVWx3Z3lxRDFCS1MzSG1KNER0L3UrN1pscDJkOFZL?=
 =?utf-8?B?d1FSREhPcVVUZ241NEpUZDFVZ3V3dE95TzYrVkhlUmpTaTE3YURpaGtXK0Zn?=
 =?utf-8?B?bjlWbHZkSkpFQVZkL3ZxZ3NrV2VObk0ySkNFNUhESU95L1lsYzZsYlZEU1dY?=
 =?utf-8?B?RWpGeVBqcmRhYmpEVUpkd00yTHRxWkM2OFFMeHVCalpQQjBOeXZqZDcvNFhw?=
 =?utf-8?B?N254U2gvbFpJblV3dnF4QmVnbWh5MitoYVpaYWFqMFcwanIvSE80Tks3eC8w?=
 =?utf-8?B?Wm9JK3VMWlRkeGt1NmppNGJ6VUx3TTQrU0tjN0Q3SkdsSURiVmJSNVd3aFNC?=
 =?utf-8?B?KzF5cU1jNWZyMjBrT0lZTXhVVmdOQ3ZrMTlqbVE1WE1tYzJESzUyenBqM0pv?=
 =?utf-8?B?bDFDVW1NUEdacDBoMXl4YkN0OVFEU29jRzN6dHNybis4c3ZsOC9jR05uTEpi?=
 =?utf-8?B?S3NGNDVYaFdFMmd2a1VIVFprUC9BL0FxYldsVFgvbEc1dEhPazNGY3Jha3ZJ?=
 =?utf-8?B?azdWVWQ1NFRqMGtwK2FVbnJwSFlDOHhnNmpjMys1NU4zUzYvZGJKTFgrTm5M?=
 =?utf-8?B?YnhXV21ORzgyM3QydGxGb3ZzT0RiV3BrNWJ4R05aaVNKUUU0cmdJNUVpMHBU?=
 =?utf-8?B?V1lKRnNVbG5TNC82MkpVSHlGUzJaK3lFN0x5MXNWNGV3b2NadWtZbWlxZEhN?=
 =?utf-8?B?YVlCZVE5V1Avc1l6ckZ5Vi9QV0Q2UzdSdlg5d1ZLREQ4dWdGQ0JVM3l5eFd5?=
 =?utf-8?B?OTNJNTEyT041WGFrWUVOYTZUMmQ3MW80alluN3VTZnJZZGhsSDhwMnF4YXM5?=
 =?utf-8?B?RUNCdE5ybHFEVmpwMzl5aFVNc2s5aGVibFd5Z04xQ1dsV0lhQm4vKzJpeFJq?=
 =?utf-8?B?S3EwZnM2ZnhNampuM3czQWR2U1FoK1l3TTRZbm1FU3JzY25qWjVHbFdZTVVn?=
 =?utf-8?B?TlVsTytvWUJlaFZ4OUdDMWVucU1UOGVBZXF0QjBMQVZpbGwxSWdHRHhqbHht?=
 =?utf-8?B?UUFXVGFLTk1ZallRMFRsWDhYbFVEOVJ5OVZDMCtEakdlODlGcnhoaXVkVTZE?=
 =?utf-8?B?WUpxSEY4SGtoRWZUQmdCa05Tb2tjT2I3NURMb3FPNlg0VDFRZW5WZ1ArWEF5?=
 =?utf-8?B?RElKc1A0bmpUSlVPNG1YK1JuUmQwUE4yanhaUWNyN2hQNGZpOW16QzZ1K1ht?=
 =?utf-8?B?K0VBUkwzeFQrL0pCclltMndyTUczLzhZRVBmRE1rVTZkdWxWT01Dc2lIQTJn?=
 =?utf-8?B?VGhUaURieGZzdTl2S0VUQ05ieGpLcDk2SGJ2TjlpK0RoRkNUdmxrbHhkZnRS?=
 =?utf-8?B?MTRybDdubDVDNzI3dTVQSS9DSE8renRML2RuK3FWdStsQUhuUThHS1FpeDdB?=
 =?utf-8?B?dUF1L3d1TkFGbk4zR2U4TzNEMk1adU9QQ09TdUFiTElUUUVWd3pPQkRqMDA3?=
 =?utf-8?B?MSt1cVZzMEdxY0U3OGdrM1hrZml5cUN2cnpHeW9RMG80d1owNS84OVAvWWts?=
 =?utf-8?B?RjhBRDBBYnhrejJCV0djOUlHUTNuc0wwMFk2dU10NWVST2taL3BKd1BnYlVZ?=
 =?utf-8?B?QVNYNVdGV3V2L2hzZ2pWVkY5a2JvNHlDNS9jUlA1K1pzS1pHaEVYbEh5elJr?=
 =?utf-8?B?RE9Mays3UWZVcDFXU2xRVHZyeUwzc3FGR0pSUDZxTkZuM2JuVFQzQjFtVm9l?=
 =?utf-8?B?TTZib085TjVRRFo3QlFaUSs3STVjdDdmdzFkbHU0YU5CaXpuMEgrSTBJRk95?=
 =?utf-8?B?Tzc3M0kvLzBEUGVEUGhScGkvZjRLbklVSlNDVW8rVXhIQ21acGxSbkhaOXRF?=
 =?utf-8?B?cGZDUHNLd1EraHFaRjFPemlYRytCYUtwSTZpS2dtOXliNXBzSTlKbWlJNGdt?=
 =?utf-8?B?SlBUYnd1RHNVVXBBYmtoK2NkOGxkajF3TnRDVzlPWk1hSFFaMFFVYU56bjNh?=
 =?utf-8?B?cklTTHRld3R2MXZ6SnFtd1NycWo3MStQUjBkZVdqZVdSS3ppdHE5M0hDdGFZ?=
 =?utf-8?B?KzRDVmtZalN5enYvVzRpdk0rUW5CWWEwbmovR3Q1U2JueVNFT1dpcnBzMEpq?=
 =?utf-8?B?VTlzbUJkMTEvUEtMYmpocmFkRjd6SFRWOW1kWTBEc0phWTBqdXdmZGJZSTh4?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3D4C58001E3B94FB9F508C4C4C2E993@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf952e1-0150-43a1-1de1-08dbd53dd3a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 09:36:12.3220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wb1HrN17i9lG+tj8+Sftnc1OzD5xdHffoQNjvNdezU+xeViiqQR75wcZ1We3bLIepjmDW/W55zJROL9ZMY/qUx5mMs0A0q9RuZObCPULvUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5889
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLCBjb3VwbGUgb2YgaW5saW5lIGNvbW1tZW50cy9zdWdnZXN0aW9ucyBiZWxvdy4N
Cg0KT24gV2VkLCAyMDIzLTA5LTI3IGF0IDEyOjI2ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3
cm90ZToNCj4gTW92ZSBjb2RlIGZyb20gYWQtaG9jIGZiZGV2IGNhbGxiYWNrcyBpbnRvIERSTSBj
bGllbnQgZnVuY3Rpb25zDQo+IGFuZCByZW1vdmUgdGhlIG9sZCBjYWxsYmFja3MuIFRoZSBmdW5j
dGlvbnMgaW5zdHJ1Y3QgdGhlIGNsaWVudA0KPiB0byBwb2xsIGZvciBjaGFuZ2VkIG91dHB1dCBv
ciByZXN0b3JlIHRoZSBkaXNwbGF5Lg0KPiANCj4gVGhlIERSTSBjb3JlIGNhbGxzIGJvdGgsIHRo
ZSBvbGQgY2FsbGJhY2tzIGFuZCB0aGUgbmV3IGNsaWVudA0KPiBoZWxwZXJzLCBmcm9tIHRoZSBz
YW1lIHBsYWNlcy4gVGhlIG5ldyBmdW5jdGlvbnMgcGVyZm9ybSB0aGUgc2FtZQ0KPiBvcGVyYXRp
b24gYXMgYmVmb3JlLCBzbyB0aGVyZSdzIG5vIGNoYW5nZSBpbiBmdW5jdGlvbmFsaXR5Lg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQo+IC0tLQ0KPiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZHJpdmVyLmPC
oMKgIHzCoCAxIC0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2
LmPCoMKgwqAgfCAxMSArKysrKysrKy0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9mYmRldi5owqDCoMKgIHzCoCA5IC0tLS0tLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kcml2ZXIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMiAtLS0tLS0tLS0t
LS0tLS0tLQ0KPiAtLQ0KPiDCoDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzNCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXlfZHJpdmVyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXlfZHJpdmVyLmMNCj4gaW5kZXggNDRiNTlhYzMwMWU2OS4uZmZkY2Rk
ZDE5NDNlMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5X2RyaXZlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheV9kcml2ZXIuYw0KPiBAQCAtOTYsNyArOTYsNiBAQCB2b2lkIGludGVsX2Rp
c3BsYXlfZHJpdmVyX2luaXRfaHcoc3RydWN0DQo+IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpDQo+
IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgaW50ZWxfbW9kZV9m
dW5jcyA9IHsNCj4gwqDCoMKgwqDCoMKgwqDCoC5mYl9jcmVhdGUgPSBpbnRlbF91c2VyX2ZyYW1l
YnVmZmVyX2NyZWF0ZSwNCj4gwqDCoMKgwqDCoMKgwqDCoC5nZXRfZm9ybWF0X2luZm8gPSBpbnRl
bF9mYl9nZXRfZm9ybWF0X2luZm8sDQo+IC3CoMKgwqDCoMKgwqDCoC5vdXRwdXRfcG9sbF9jaGFu
Z2VkID0gaW50ZWxfZmJkZXZfb3V0cHV0X3BvbGxfY2hhbmdlZCwNCj4gwqDCoMKgwqDCoMKgwqDC
oC5tb2RlX3ZhbGlkID0gaW50ZWxfbW9kZV92YWxpZCwNCj4gwqDCoMKgwqDCoMKgwqDCoC5hdG9t
aWNfY2hlY2sgPSBpbnRlbF9hdG9taWNfY2hlY2ssDQo+IMKgwqDCoMKgwqDCoMKgwqAuYXRvbWlj
X2NvbW1pdCA9IGludGVsX2F0b21pY19jb21taXQsDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMNCj4gaW5kZXggZDllNjk0NzFhNzgyYS4uMzlkZTYxZDRl
NzkwNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9m
YmRldi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJkZXYu
Yw0KPiBAQCAtNjM4LDcgKzYzOCw3IEBAIHZvaWQgaW50ZWxfZmJkZXZfc2V0X3N1c3BlbmQoc3Ry
dWN0IGRybV9kZXZpY2UNCj4gKmRldiwgaW50IHN0YXRlLCBib29sIHN5bmNocm9ub3VzDQo+IMKg
wqDCoMKgwqDCoMKgwqBpbnRlbF9mYmRldl9ocGRfc2V0X3N1c3BlbmQoZGV2X3ByaXYsIHN0YXRl
KTsNCj4gwqB9DQo+IMKgDQo+IC12b2lkIGludGVsX2ZiZGV2X291dHB1dF9wb2xsX2NoYW5nZWQo
c3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gK3N0YXRpYyB2b2lkIGludGVsX2ZiZGV2X291dHB1
dF9wb2xsX2NoYW5nZWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCg0KTm93IGFzIHRoaXMgaXNu
J3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIGNhbGxiYWNrIGFueW1vcmU6IE1heWJlIHlvdQ0KY291
bGQgcmV0dXJuIGVycm9yIHZhbHVlLzAgPw0KDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IGludGVsX2ZiZGV2ICppZmJkZXYgPSB0b19pOTE1KGRldiktDQo+ID5kaXNwbGF5LmZiZGV2
LmZiZGV2Ow0KPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBzZW5kX2hwZDsNCj4gQEAgLTY1Nyw3ICs2
NTcsNyBAQCB2b2lkIGludGVsX2ZiZGV2X291dHB1dF9wb2xsX2NoYW5nZWQoc3RydWN0DQo+IGRy
bV9kZXZpY2UgKmRldikNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fZmJf
aGVscGVyX2hvdHBsdWdfZXZlbnQoJmlmYmRldi0+aGVscGVyKTsNCj4gwqB9DQo+IMKgDQo+IC12
b2lkIGludGVsX2ZiZGV2X3Jlc3RvcmVfbW9kZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2
X3ByaXYpDQo+ICtzdGF0aWMgdm9pZCBpbnRlbF9mYmRldl9yZXN0b3JlX21vZGUoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUNCg0KU2ltaWxhciBjb21tZW50IGFzIGFib3ZlLiBJLmUuIHJldHVybiBl
cnJvciB2YWx1ZS8wID8NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+ICpkZXZfcHJpdikN
Cj4gwqB7DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW50ZWxfZmJkZXYgKmlmYmRldiA9IGRl
dl9wcml2LT5kaXNwbGF5LmZiZGV2LmZiZGV2Ow0KPiDCoA0KPiBAQCAtNjgxLDExICs2ODEsMTgg
QEAgc3RhdGljIHZvaWQNCj4gaW50ZWxfZmJkZXZfY2xpZW50X3VucmVnaXN0ZXIoc3RydWN0IGRy
bV9jbGllbnRfZGV2ICpjbGllbnQpDQo+IMKgDQo+IMKgc3RhdGljIGludCBpbnRlbF9mYmRldl9j
bGllbnRfcmVzdG9yZShzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCkNCj4gwqB7DQo+ICvC
oMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUo
Y2xpZW50LT5kZXYpOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoGludGVsX2ZiZGV2X3Jlc3RvcmVf
bW9kZShkZXZfcHJpdik7DQo+ICvCoMKgwqDCoMKgwqDCoHZnYV9zd2l0Y2hlcm9vX3Byb2Nlc3Nf
ZGVsYXllZF9zd2l0Y2goKTsNCj4gKw0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+IMKg
fQ0KPiDCoA0KPiDCoHN0YXRpYyBpbnQgaW50ZWxfZmJkZXZfY2xpZW50X2hvdHBsdWcoc3RydWN0
IGRybV9jbGllbnRfZGV2ICpjbGllbnQpDQo+IMKgew0KPiArwqDCoMKgwqDCoMKgwqBpbnRlbF9m
YmRldl9vdXRwdXRfcG9sbF9jaGFuZ2VkKGNsaWVudC0+ZGV2KTsNCj4gKw0KPiDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIDA7DQo+IMKgfQ0KPiDCoA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9mYmRldi5oDQo+IGluZGV4IDA0ZmQ1MjNhNTAyMzIuLjhjOTUzZjEwMmJh
MjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJk
ZXYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmgN
Cj4gQEAgLTE5LDggKzE5LDYgQEAgdm9pZCBpbnRlbF9mYmRldl9pbml0aWFsX2NvbmZpZ19hc3lu
YyhzdHJ1Y3QNCj4gZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpOw0KPiDCoHZvaWQgaW50ZWxf
ZmJkZXZfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpOw0KPiDC
oHZvaWQgaW50ZWxfZmJkZXZfZmluaShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYp
Ow0KPiDCoHZvaWQgaW50ZWxfZmJkZXZfc2V0X3N1c3BlbmQoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgaW50IHN0YXRlLCBib29sDQo+IHN5bmNocm9ub3VzKTsNCj4gLXZvaWQgaW50ZWxfZmJkZXZf
b3V0cHV0X3BvbGxfY2hhbmdlZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsNCj4gLXZvaWQgaW50
ZWxfZmJkZXZfcmVzdG9yZV9tb2RlKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdik7
DQo+IMKgc3RydWN0IGludGVsX2ZyYW1lYnVmZmVyICppbnRlbF9mYmRldl9mcmFtZWJ1ZmZlcihz
dHJ1Y3QgaW50ZWxfZmJkZXYNCj4gKmZiZGV2KTsNCj4gwqAjZWxzZQ0KPiDCoHN0YXRpYyBpbmxp
bmUgaW50IGludGVsX2ZiZGV2X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gQEAgLTQ0
LDEzICs0Miw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlbF9mYmRldl9zZXRfc3VzcGVuZChz
dHJ1Y3QNCj4gZHJtX2RldmljZSAqZGV2LCBpbnQgc3RhdGUsIGJvDQo+IMKgew0KPiDCoH0NCj4g
wqANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlbF9mYmRldl9vdXRwdXRfcG9sbF9jaGFuZ2Vk
KHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYpDQo+IC17DQo+IC19DQo+IC0NCj4gLXN0YXRpYyBp
bmxpbmUgdm9pZCBpbnRlbF9mYmRldl9yZXN0b3JlX21vZGUoc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUNCj4gKmk5MTUpDQo+IC17DQo+IC19DQo+IMKgc3RhdGljIGlubGluZSBzdHJ1Y3QgaW50ZWxf
ZnJhbWVidWZmZXINCj4gKmludGVsX2ZiZGV2X2ZyYW1lYnVmZmVyKHN0cnVjdCBpbnRlbF9mYmRl
diAqZmJkZXYpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIE5VTEw7DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9kcml2ZXIuYw0KPiBpbmRleCBkZTE5MTk3ZDJlMDUyLi44NjQ2MGNk
ODE2N2QxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJpdmVyLmMNCj4gQEAgLTkyNCwy
NyArOTI0LDYgQEAgc3RhdGljIGludCBpOTE1X2RyaXZlcl9vcGVuKHN0cnVjdCBkcm1fZGV2aWNl
DQo+ICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVy
biAwOw0KPiDCoH0NCj4gwqANCj4gLS8qKg0KPiAtICogaTkxNV9kcml2ZXJfbGFzdGNsb3NlIC0g
Y2xlYW4gdXAgYWZ0ZXIgYWxsIERSTSBjbGllbnRzIGhhdmUNCj4gZXhpdGVkDQo+IC0gKiBAZGV2
OiBEUk0gZGV2aWNlDQo+IC0gKg0KPiAtICogVGFrZSBjYXJlIG9mIGNsZWFuaW5nIHVwIGFmdGVy
IGFsbCBEUk0gY2xpZW50cyBoYXZlIGV4aXRlZC7CoCBJbg0KPiB0aGUNCj4gLSAqIG1vZGUgc2V0
dGluZyBjYXNlLCB3ZSB3YW50IHRvIHJlc3RvcmUgdGhlIGtlcm5lbCdzIGluaXRpYWwgbW9kZQ0K
PiAoanVzdA0KPiAtICogaW4gY2FzZSB0aGUgbGFzdCBjbGllbnQgbGVmdCB1cyBpbiBhIGJhZCBz
dGF0ZSkuDQo+IC0gKg0KPiAtICogQWRkaXRpb25hbGx5LCBpbiB0aGUgbm9uLW1vZGUgc2V0dGlu
ZyBjYXNlLCB3ZSdsbCB0ZWFyIGRvd24gdGhlDQo+IEdUVA0KPiAtICogYW5kIERNQSBzdHJ1Y3R1
cmVzLCBzaW5jZSB0aGUga2VybmVsIHdvbid0IGJlIHVzaW5nIHRoZW0sIGFuZA0KPiBjbGVhDQo+
IC0gKiB1cCBhbnkgR0VNIHN0YXRlLg0KPiAtICovDQo+IC1zdGF0aWMgdm9pZCBpOTE1X2RyaXZl
cl9sYXN0Y2xvc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gLXsNCj4gLcKgwqDCoMKgwqDC
oMKgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSB0b19pOTE1KGRldik7DQo+IC0NCj4g
LcKgwqDCoMKgwqDCoMKgaW50ZWxfZmJkZXZfcmVzdG9yZV9tb2RlKGk5MTUpOw0KPiAtDQo+IC3C
oMKgwqDCoMKgwqDCoHZnYV9zd2l0Y2hlcm9vX3Byb2Nlc3NfZGVsYXllZF9zd2l0Y2goKTsNCj4g
LX0NCj4gLQ0KPiDCoHN0YXRpYyB2b2lkIGk5MTVfZHJpdmVyX3Bvc3RjbG9zZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3QNCj4gZHJtX2ZpbGUgKmZpbGUpDQo+IMKgew0KPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IGRybV9pOTE1X2ZpbGVfcHJpdmF0ZSAqZmlsZV9wcml2ID0gZmlsZS0+
ZHJpdmVyX3ByaXY7DQo+IEBAIC0xODIyLDcgKzE4MDEsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9kcml2ZXIgaTkxNV9kcm1fZHJpdmVyDQo+ID0gew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FLA0KPiDCoMKgwqDCoMKgwqDCoMKgLnJlbGVhc2Ug
PSBpOTE1X2RyaXZlcl9yZWxlYXNlLA0KPiDCoMKgwqDCoMKgwqDCoMKgLm9wZW4gPSBpOTE1X2Ry
aXZlcl9vcGVuLA0KPiAtwqDCoMKgwqDCoMKgwqAubGFzdGNsb3NlID0gaTkxNV9kcml2ZXJfbGFz
dGNsb3NlLA0KPiDCoMKgwqDCoMKgwqDCoMKgLnBvc3RjbG9zZSA9IGk5MTVfZHJpdmVyX3Bvc3Rj
bG9zZSwNCj4gwqDCoMKgwqDCoMKgwqDCoC5zaG93X2ZkaW5mbyA9IFBUUl9JRihJU19FTkFCTEVE
KENPTkZJR19QUk9DX0ZTKSwNCj4gaTkxNV9kcm1fY2xpZW50X2ZkaW5mbyksDQo+IMKgDQoNCg==
