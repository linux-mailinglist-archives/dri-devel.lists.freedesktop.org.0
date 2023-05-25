Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DE7710F3D
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1DA10E6B7;
	Thu, 25 May 2023 15:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDBC10E191;
 Thu, 25 May 2023 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685027542; x=1716563542;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=4uOLoamm46DVNFBhEnzZFJfktMedRlgBWovh5iA0Mto=;
 b=D+ES7+qc9ppOd0XUyavS+UYPoQJBWTW9HZAy8fe7R0AVXqo1ZiqfvkE4
 43OluqGLPYTnY2UB2oKPHVoqYyW9hV/l/1ksh82AMipdyyDzlAMddmVQC
 RWZUUEeVrLWHTZ20A8EKcKTpVpMdy9PevmfrXW2xGbrJ/oTgFOF/lPEGC
 5Zm1ZNgYsYa523A+DNXpjgh9pBVHdqkA5OWai8RAJGv0VW919CJoVMoro
 lKptlqq3arFJJVftvdg1PysgouqmVqzbj63LilF//uhzziUbWXxSITKCd
 ioKTsebkzivQGPWru2SszXt1oYu+YehcPfCvdIky8dKAjaLNfw1qIGsbG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="352758876"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
 d="scan'208,217";a="352758876"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="879157520"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
 d="scan'208,217";a="879157520"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 25 May 2023 08:12:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 08:12:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 08:12:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 08:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2hao0TmTpuZLNM8jritRveJD8M66ZFx4VEn2yOR6cLN/CSfgK16s/puP3Q951f4ZT7WI+bUuFBl5CeyezPXWN2doA9iacGDwh0Gs3Te2E55PtzN4myj6Dldjf9s5bY+IbJvOmUdiWwD2A4HDdfNZ1lDtKBXRHeIOTvfusOP/h7rM6+1DBTlr8ssBAnJhsFy3zAGO+w16D9ra9HCUL2JJNFwHOfAjoZXf9BOg9hb6eY1vQBLuLQ5OORgcBNHVg9Qqx22RfY8ltO5gkkLvXF9gNiXRCcqiFZMIgfFG7+/bAO2q85FTJrRmeNa5z27oyDSc2CXcKTTFjYc4mQW5vJuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAU7zprlKCd4qKCxb6t/Ndov6Q38WZx2JzS1JCEKjp0=;
 b=hKqBF6RTnoId62d6Ia1t9ne8+OvqUBpwUWTlCQPTOvQW9nMuaalwEyY4U344Htiwj+h+jqpYnhmNnysac6s0iZUj9SobqBmu3wpm19fpZ/kb/NJhCH8PNRcGduyD59KOlN1TsJhGN5T2ZMbLgasAEm2QOl3Kzyid8xu8CmkpHHVjL0aEv0oTbYl7O1IVbbLW/tVme8zb6BAmipL9bm4XbKFHftZ34Ekb8h+HiZwRfmm0GMs6bm/7H5LQB7j1TWk0Vn9SGOHW3h1GVW6A/ffDj16b6VJdF2OHaxE5D11O4HxKtkzKIPVr3nCGO26zYYMwfpZP5a3SNpU98pINhmfKyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by PH7PR11MB5943.namprd11.prod.outlook.com (2603:10b6:510:13f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 15:12:06 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008%3]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 15:12:06 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Topic: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Index: AQHZjnqnJ8PZ7Ur6xkyxJe9rIFJU0a9qqhsAgABvbA8=
Date: Thu, 25 May 2023 15:12:06 +0000
Message-ID: <BYAPR11MB25673475B8C523F25A54DC029A469@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230524200255.443021-1-fei.yang@intel.com>
 <78124d6f-7f46-afbe-d320-9dad77082f3b@linux.intel.com>
In-Reply-To: <78124d6f-7f46-afbe-d320-9dad77082f3b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|PH7PR11MB5943:EE_
x-ms-office365-filtering-correlation-id: 29773526-22f9-4148-584e-08db5d326744
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: udjROOMFh+TBKo1jxp5VMTpgNrBNy9g1gqZoRGPQSZMqjQYb3HyzL0Szr4DlUGXEEbLo+t6V7vD1FPaqDUPfktuq4wSG1DDPQt0d9MY9XNSv4kzgjh9D9J6gAKec8K55W8w2yFFomjs9G7D5/q7RbDfYXUqpBwKD5pKKxJb3bt6+xyA/2LvYbF+gN8gqzTvNGphSdyJn3mVXKEmFlC0fyTnl0AzfhFJcmdX9GKgBmPOEXPf68sdcBsS49rltZ44Nik/ucSveHCg5EduEcQeV7C2riBPrLrET51D3F+/VY7Fr9SlK5fUKFHDW68WEU0rd6FVtp7hYTpAPRy9d2DtSs2XzkjXlPBwu4QPO4btPEN6PuGInXzSRBm1YHyfNooMm2NORLBzL9/Hqdrsb1lXI/aMOGkKNhneIPxQ7AbfbgVu4N2BDvAVLLNYs/E7m7MXXu7dYfVTE7ZTgcB4HfNK2W+IzxO6RyBS+BD2BI0mG/1Ju4XTtdL3C+AuJY+p5Mm1SOWIhdpCmOve8pMglS3GHN59OViBUlhKGo/cDM0t9kly3u3y4CJjj3qcKQPAaQq3H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(19627405001)(2906002)(5660300002)(83380400001)(52536014)(8936002)(8676002)(64756008)(478600001)(66946007)(71200400001)(4326008)(66556008)(76116006)(7696005)(54906003)(41300700001)(316002)(110136005)(66476007)(66446008)(966005)(55016003)(33656002)(82960400001)(86362001)(186003)(6506007)(9686003)(53546011)(122000001)(26005)(38070700005)(166002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kzvu5iJwvZTYjgx4XafunzdaezCFAYecBI4r/siatE7UDnpWff6JIn71O5?=
 =?iso-8859-1?Q?o/LXmnELijfxN3HAIk4C3LF4K11xnML31J7IquUqDK+djaa+6Bo3PcS3Qz?=
 =?iso-8859-1?Q?qR2bokZBQ8OoOi1K5PsMC0QVnJNtWSvOrRRXtzpX7f3IwlIp8KT6NvgWXu?=
 =?iso-8859-1?Q?xdxkC+VwBTmh4brVoK34pl9daMCvaddCsxfjGQKSoLzaHyJ618+r0HhGc9?=
 =?iso-8859-1?Q?u3ui8ZsjsbRLvPfnyCii9430ZvZ/4SbP+xI/LvpcFs8dj7mmL5UFCBQYtO?=
 =?iso-8859-1?Q?Ab/aJHheJd8k1whpndPihMz5vQ6S84ZUNYVy8uhelOck06LLeL31EE7lT3?=
 =?iso-8859-1?Q?ovF3yp4eUGiYaI90x/xuf0QBmTH0VFLbqoDJEw5qppeayf3Cehjn6bwg0i?=
 =?iso-8859-1?Q?yq9rHtUXoPRjfd5YfwAmyS7LPLoZo3Jo7a+GTMy26FaUc8HdBhGthjj0Mu?=
 =?iso-8859-1?Q?mG637SzDNisz8pTz6PKx0rSkWTuWXiSqOC9rc8BgizU9YfpAdCa0XqjqB6?=
 =?iso-8859-1?Q?gshlJbE9ON9REnhKx7XSgVH/05oENfCLRXgjTRJQfKHAPUWSHKaNeI9U2I?=
 =?iso-8859-1?Q?051VN8APDDuAleTkZG4pe8ho5iUmgRhesiu8OFoRHVkiogbq1DLbYSrKm+?=
 =?iso-8859-1?Q?ScGAP7IbIOV7MqeZmIVRepij11Tdr+Qfoq8Qn85HwBxbUf5hjFFrIDtA/l?=
 =?iso-8859-1?Q?eG/6pR8QKch0PgCW484DOGEOoQPeGAMXqzNnAjO+ldKGUfSqjEZsJfC1A8?=
 =?iso-8859-1?Q?y1/QAthddiXNNHKg200hA7a7Sri0FamdQlybLJ4A+vPEX+JK60/LFlzbFR?=
 =?iso-8859-1?Q?puvkLShi7m+/qbJhJLX/7+roAO+KbFkhBE2J/WTwoD5Pg+5CWFSO1EAjyt?=
 =?iso-8859-1?Q?Yze3pZsPhjS6g72XyeW2kjxzFumRRj6IrglJOabvqQ5C9eUdDlYpQZ7rwa?=
 =?iso-8859-1?Q?FHoAmMo4J2T175PkaXF9zu52y5WsKgyCX9YRhq09pjwUQQyvbDDM15XFXt?=
 =?iso-8859-1?Q?MEc749L9ydATge3wmGfTSC1P9JMLZgFi6+TPHHJ45JZvXDFh9kCxioamBb?=
 =?iso-8859-1?Q?AzTQOmWK8gNEe7p7MT074OBoo/gV8lUhGe+ktUkGdPG0GKF3u8IdIRa9Vk?=
 =?iso-8859-1?Q?IesWJviWCZa+dcxbOqtOqyRTj8exJdqKFrw471cKKQ/Iowv0hxQTs4QJ1D?=
 =?iso-8859-1?Q?ZWmwK57Z8Ud6+7R8Y5CM4nr+LRChU1f298G1OZJeSFY5WGf4CwQv/BJY20?=
 =?iso-8859-1?Q?4OUfEcV3ugrYhirya4yTzFrObXHX2wEjLx9Oq7ESaexFHXYhmAcKWltqU8?=
 =?iso-8859-1?Q?d/xhSvCaVNUKfK3R+4VNVYsqAPVRdqAsGCJwfqVWLD+BJkuImlFbexLyFY?=
 =?iso-8859-1?Q?TWaNFWWgSnp1hRnOaSlKELKYDxoO1j46K0a8hPYh84EmJiT5gddEyiCGk1?=
 =?iso-8859-1?Q?YEi5kDt+BwuT2WJYST6EOU6lni0jBROaSwdhHejwtM38QJvvCYUfDy9h6u?=
 =?iso-8859-1?Q?enGGt7Q27sDDXfbcXgD+gbPOzDSwneIfxWaxH70dtO5i+pFFpJeIjYjBxh?=
 =?iso-8859-1?Q?MNJ4W3udGMqoESvluhumBhcuQ4Iwiyl21b+5Je/aV9dxIhQduko+EQYkfm?=
 =?iso-8859-1?Q?En0xDVt4HmXMM=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB25673475B8C523F25A54DC029A469BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29773526-22f9-4148-584e-08db5d326744
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 15:12:06.4852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QD6GsI/SLd9RyXe5IlDIbT8VUuOkOMzdSFEGibZVqOdzMNapneZMG9p5AvawSDSg5q2ur11c8NXStckOL1yJjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5943
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB25673475B8C523F25A54DC029A469BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sounds weird to have a platform restriction on uAPI though. UMD not using t=
his extension is not a problem, is it?



From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Sent: Thursday, May 25, 2023 1:33 AM
To: Yang, Fei <fei.yang@intel.com>; intel-gfx@lists.freedesktop.org <intel-=
gfx@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Vivi=
, Rodrigo <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set cache =
at BO creation


On 24/05/2023 21:02, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> This series introduce a new extension for GEM_CREATE,
> 1. end support for set caching ioctl [PATCH 1/2]
> 2. add set_pat extension for gem_create [PATCH 2/2]
>
> v2: drop one patch that was merged separately
>      commit 341ad0e8e254 ("drm/i915/mtl: Add PTE encode function")
> v3: rebased on https://patchwork.freedesktop.org/series/117082/
> v4: fix missing unlock introduced in v3, and
>      solve a rebase conflict
> v5: replace obj->cache_level with pat_set_by_user,
>      fix i915_cache_level_str() for legacy platforms.
> v6: rebased on https://patchwork.freedesktop.org/series/117480/
> v7: rebased on https://patchwork.freedesktop.org/series/117528/
> v8: dropped the two dependent patches that has been merged
>      separately. Add IGT link and Tested-by (MESA).
> v9: addressing comments (Andi)
> v10: acked-by and tested-by MESA
> v11: drop "end support for set caching ioctl" (merged)
>       remove tools/include/uapi/drm/i915_drm.h
> v12: drop Bspec reference in comment. add to commit message instead
>
> Fei Yang (1):
>    drm/i915: Allow user to set cache at BO creation
>
>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>   include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
>   3 files changed, 83 insertions(+)
>

Do you also have a Test-with: run against the new IGT somewhere?

Regards,

Tvrtko

--_000_BYAPR11MB25673475B8C523F25A54DC029A469BYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<p class=3D"MsoPlainText ContentPasted0" style=3D"margin:0in;font-size:11pt=
;font-family:Calibri, sans-serif">
Sounds weird to have a platform restriction on uAPI though. UMD not using t=
his extension is not a problem, is it?<o:p class=3D"ContentPasted0">&nbsp;<=
/o:p></p>
<p class=3D"MsoPlainText" style=3D"margin:0in;font-size:11pt;font-family:Ca=
libri, sans-serif">
<o:p class=3D"ContentPasted0">&nbsp;</o:p></p>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
</div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr" class=3D"elementToProof"><font face=
=3D"Calibri, sans-serif" style=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b=
>From:</b> Tvrtko Ursulin &lt;tvrtko.ursulin@linux.intel.com&gt;<br>
</font></div>
<div dir=3D"ltr"><font face=3D"Calibri, sans-serif" style=3D"font-size: 11p=
t; color: rgb(0, 0, 0);"><b>Sent:</b> Thursday, May 25, 2023 1:33 AM<br>
<b>To:</b> Yang, Fei &lt;fei.yang@intel.com&gt;; intel-gfx@lists.freedeskto=
p.org &lt;intel-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; Vivi, Rodrigo &lt;rodrigo.vivi@intel.com&gt;<br>
<b>Subject:</b> Re: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set=
 cache at BO creation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText"><br>
On 24/05/2023 21:02, fei.yang@intel.com wrote:<br>
&gt; From: Fei Yang &lt;fei.yang@intel.com&gt;<br>
&gt; <br>
&gt; This series introduce a new extension for GEM_CREATE,<br>
&gt; 1. end support for set caching ioctl [PATCH 1/2]<br>
&gt; 2. add set_pat extension for gem_create [PATCH 2/2]<br>
&gt; <br>
&gt; v2: drop one patch that was merged separately<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commit 341ad0e8e254 (&quot;drm/i915/mtl:=
 Add PTE encode function&quot;)<br>
&gt; v3: rebased on <a href=3D"https://patchwork.freedesktop.org/series/117=
082/" data-auth=3D"NotApplicable">
https://patchwork.freedesktop.org/series/117082/</a><br>
&gt; v4: fix missing unlock introduced in v3, and<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; solve a rebase conflict<br>
&gt; v5: replace obj-&gt;cache_level with pat_set_by_user,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fix i915_cache_level_str() for legacy pl=
atforms.<br>
&gt; v6: rebased on <a href=3D"https://patchwork.freedesktop.org/series/117=
480/" data-auth=3D"NotApplicable">
https://patchwork.freedesktop.org/series/117480/</a><br>
&gt; v7: rebased on <a href=3D"https://patchwork.freedesktop.org/series/117=
528/" data-auth=3D"NotApplicable">
https://patchwork.freedesktop.org/series/117528/</a><br>
&gt; v8: dropped the two dependent patches that has been merged<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; separately. Add IGT link and Tested-by (=
MESA).<br>
&gt; v9: addressing comments (Andi)<br>
&gt; v10: acked-by and tested-by MESA<br>
&gt; v11: drop &quot;end support for set caching ioctl&quot; (merged)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remove tools/include/uapi/drm/i915=
_drm.h<br>
&gt; v12: drop Bspec reference in comment. add to commit message instead<br=
>
&gt; <br>
&gt; Fei Yang (1):<br>
&gt;&nbsp;&nbsp;&nbsp; drm/i915: Allow user to set cache at BO creation<br>
&gt; <br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 ++++++++++=
+++++++++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gem/i915_gem_object.c |&nbsp; 6 ++++<=
br>
&gt;&nbsp;&nbsp; include/uapi/drm/i915_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 41 ++++++++++=
++++++++++++<br>
&gt;&nbsp;&nbsp; 3 files changed, 83 insertions(+)<br>
&gt; <br>
<br>
Do you also have a Test-with: run against the new IGT somewhere?<br>
<br>
Regards,<br>
<br>
Tvrtko<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB25673475B8C523F25A54DC029A469BYAPR11MB2567namp_--
