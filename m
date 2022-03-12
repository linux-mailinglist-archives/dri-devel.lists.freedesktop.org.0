Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBEB4D6F3A
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 14:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0113810ED95;
	Sat, 12 Mar 2022 13:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C708310ED95;
 Sat, 12 Mar 2022 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647091988; x=1678627988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=1Wtbj3Wx0DAOZTJL9tJXWaxJHWM5AzmFO6g4LzjH8oE=;
 b=ERH/SPbd0FrbASaMP1Dya3ME40ogMvcPmG7w/6KJ3mAvpyRQxhRzTpLl
 /TK1fY7Vx53F8FfUI0MNUStyiiKOftObsXhbsbJgTF+Qyd1mJg2NAPziA
 7DImRNqr6cjt2m+1jgwoGgxoxsHvQEAAMzDGHkP+FpRystuXaSrgR5LR7
 P2710XRKkPHch0ayBHEUxQmwoUdt/5KUCy6LtLcOdBUcW/mVW/G+nTdkJ
 EYoiD1nVZbVneeK5v6SsLMo3GUu5sdCJ0tUZPn7fuQAQEHIYnH9rO5cQs
 b3LKRGmAJXFi5ZMV+/TsxFaSRpNzcZup0p3UoM0EvbgSXDn7GU9X5sley g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="316514797"
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; d="scan'208";a="316514797"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2022 05:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; d="scan'208";a="579632255"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 12 Mar 2022 05:33:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 12 Mar 2022 05:33:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sat, 12 Mar 2022 05:33:07 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sat, 12 Mar 2022 05:33:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMXcxd6GzNLzgBJ7ymiWsHt1uVvLDUXy0MiiAR0ERoPmfKB86c6gnOnBkeW52VMonY8mzbVdJSVYKr8oa+bFIC1lbGXccshA6GT7FjwqwLBWykyojooSmxWqE5jQ/2Eo6Oo0RwftBgfxilhwXhYX5lb0TziwIA1MLDyhccDcDt4YSM/96oIxsJoV6t8aQ25/VJTcJeTTBl2oCSXPSbuuoaFp9j4qsUlF6TCWIMTLT+N+WLDXWOrqGltyZwGXdKTnVsVDnLGc7DXzUqlLtaz6vVP7oDMBE/m15CtY+v0HQCpxT6YVYz8XT2txxwpQxOqBsim/3zWCQloqZf/CTclkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF0DbaKpghyrCJpMVbU3l/g1FM1qQtMaBP9NNTsICAw=;
 b=mhwGgq5k7s2ilXw41vklj5u2ZuIHQxG9kwis77uYQBPzHF/4HYJ+v32h1w6XfxOtkPkZ94zMhr2EMIhgqwzDf958NiNlmSQhtFaOSUtIN33VqS6czVePT8Hfg6kxVWM7oWQcer0OXQNYJ69J4hA9nL8sD573tTFPiSrVu4EqAru4a88vE5jVUf6MhGeFzR8VFCPfS820penrLJeU3PcdApLZCMHh74AnS5/bxo+008V5DYrmQZY2PBDxw30ptmBZlRL3LcRJhf84S/uL+FDMxFctdeRoL/PJFD0VxCtZu9IHlyt4lawCuQT8waMz8KaSl7IKxKUUH15zHzFKt5ZA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2710.namprd11.prod.outlook.com (2603:10b6:a02:c7::24)
 by BN6PR11MB3940.namprd11.prod.outlook.com (2603:10b6:405:82::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Sat, 12 Mar
 2022 13:33:04 +0000
Received: from BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22]) by BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22%7]) with mapi id 15.20.5038.031; Sat, 12 Mar 2022
 13:33:03 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: Drew Davenport <ddavenport@chromium.org>
Subject: RE: [v6 1/5] drm/edid: seek for available CEA block from specific
 EDID block index
Thread-Topic: [v6 1/5] drm/edid: seek for available CEA block from specific
 EDID block index
Thread-Index: AQHYNaGBJH4J7OeB8UinGV2ifq93aqy7tR2A
Date: Sat, 12 Mar 2022 13:33:03 +0000
Message-ID: <BYAPR11MB2710B3F90A42777EB7A95930A30D9@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <20220311012218.19025-1-shawn.c.lee@intel.com>
 <20220311012218.19025-2-shawn.c.lee@intel.com>
 <YivcB+lv/BMdhoEO@chromium.org>
In-Reply-To: <YivcB+lv/BMdhoEO@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ea526e0-05f9-43fc-f471-08da042cd5cb
x-ms-traffictypediagnostic: BN6PR11MB3940:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB39407BD368E23052FBDFAD93A30D9@BN6PR11MB3940.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /mjAMUhzpfnvwl1vFvNGPIWiE8DNmrSGH6HMcohIrUKrccq/kJTyBPh1ZSL8u7wvJjYTeug/whcBkhltWWOlg2o4KUf9SJYMl6QjhyRhkLKLcRlE8CfpPA+WaCxyf8MtwdkS7X7ta/c+Zvo8JhzwG4f93vcAGqelPfc0f5jJKFNS0YzKm5rqF/fm0rcuJRpoe+QDOGuFaDHURzzUD4jgOPht/Qp5oouuSpx7PYcNLaUSyivSK9MPjWGkzsAX5E+usWn5JmOwCL+saLfZgS2NDmYlcnHqYVIjaKfeR9KF7E3LBgkIef67Vl188Ou2wgOZbu/9sUGqO6GXZKPJeEu5cXGZ5pgZIqG/ET096nDaoaKUDl6WQtHvEIecaRcOdAzYHozAMU3ilRAUjwiPfsr11p227fSbe7NxrhvGRMlrkbSYzPnsP079EPmoJShNx7D02929Ms0Xy0YzhaPdTYdUkriZods7FghwigHo6OCojkqJs9/uLp7bfXbPDJpCusQBwWPt3Osfkhxw/NnKNJcX7YU3Q9lkQUIRKyrmICkbU6QHrbge9Av/tn69D519yGAVPzbW7s9yNlJZPw1jAz9Pc/wBtQEFP4gWdO2RQMM/AIC0kcm/gh3Pt7V15eHbfU5QvKzmcy360fdRl2wd2DvVQK3WlleU2QzbY2dd99VL21SLEcpxPjWHgzRs80VUu5710SwQkfHDiqsFJ3n7mPuueQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2710.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(316002)(6916009)(38070700005)(54906003)(8936002)(186003)(83380400001)(5660300002)(52536014)(26005)(8796002)(2906002)(86362001)(9686003)(7696005)(66556008)(66476007)(76116006)(66946007)(8676002)(66446008)(4326008)(64756008)(55016003)(33656002)(508600001)(71200400001)(82960400001)(38100700002)(6506007)(53546011)(55236004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0ltXT8K0STZ+sJW9WxwG+dd6fgWSfTQd4POGqk2xK+qaEi3sx+39qItt3b7Q?=
 =?us-ascii?Q?vPZwAZ8Muezq4xL398H7ddG7xHpniTvLdDR2OrHnHSAa7WFplBmMIHGFqio0?=
 =?us-ascii?Q?W0QPltrKqMi8K2F4cEoOXu6fPT4GZW8uEHTbXf19uMdIEZBRBgiU3aCRlyfV?=
 =?us-ascii?Q?JGY5nNY+yz1Ck0uOchHMfA3N0YBOValST3r9NMJLozIjhI6gHwwq7hb4USLI?=
 =?us-ascii?Q?y66EpmAG0d/qX2bm0iw1lVVrncFSZ9USwpYuuGApRFqS4ZVES4tRqrvNCMbJ?=
 =?us-ascii?Q?/v+RX1/FwJOVax/bVy42pJ5kaIKI+X3QWXQeWeWGzrJmZYbARunr6Q1NBO8J?=
 =?us-ascii?Q?26kKHAqL0KjNaWDewocM5rRGguKhTNFUEzmvuLw8t9vbzGCzbRAsTz5FyL1y?=
 =?us-ascii?Q?b9AKHkl27XjYDgsu8prk/YuvjLBu0PdVovfOM1mwpEeEUu7AVlEiHJgzB6bS?=
 =?us-ascii?Q?bQaLP1ds+v56FalFL0MuTKb7rzrmD8B3ndIR7tGSx12A4Q9/kXTvoCeZb683?=
 =?us-ascii?Q?Op6BgA8WfDP4z9lfAFXqv05wstORCTA30QUYYGqyHST9MjvaQvS/M2EBqKTW?=
 =?us-ascii?Q?C6ZR30D7BjlICziqHM2U961W2nL+GJbERu18sFpuvmWHiVYbUmFaZvzlkLpy?=
 =?us-ascii?Q?YUdlYb2NOWnBnSpUUyhCLWh4jqDsgIqlY9BddLE0ZZ3nXgoDDsWv1V4Oasuu?=
 =?us-ascii?Q?poapkdqX5xTskR68sp7jMwzJ054WRPTQcY9lptI2+eAfHqlvXCw4w4zFtqJ8?=
 =?us-ascii?Q?B/uOw7ulrSEpLxSf5Vg0pUENJzkCnz3HbJA87inDxMiQQR1NpGXRDaocK3xp?=
 =?us-ascii?Q?EqHuHea/rV014Bj+Zd7NxQaBbPdz+KB97pOvzncosRQ2dtF7rMZSSMuOgbdZ?=
 =?us-ascii?Q?0+jnIKOcsJ+Vctr1JU9gm4cvZucTP4HPXYoDa9TtG+SqigP1Iz2IHF0va91e?=
 =?us-ascii?Q?g+elJ7WRK1djZ7iBhjWKNDCZC0JuJp979C9rNYLF3rTZiUjwXAC9iNbOguD5?=
 =?us-ascii?Q?R85U0P+Zb0bi29ucmDjlBv75J9NzHtggkfXs8IoaxckWcVRAWbvcjONjsLwm?=
 =?us-ascii?Q?BJ35/OUVq/CXOZNHzan4rNnDafW/vcP8jbGBp5wKpa4MbQk2bfdNXFTDzExU?=
 =?us-ascii?Q?r42beC71jGgpcHHS8gz9lcqqA3G89VVQKNWsBn/W/OCXk58gmuv3jtGLaFbt?=
 =?us-ascii?Q?TLwZJBnckzWrMYD6qRz3cpyNn+4vUu2kf25tsEuANcCm6pnh8D8WF1kLtFld?=
 =?us-ascii?Q?sbElqAOLnu1Jywpo/MIfROWM6lKzgMusQ39JwUybYQrdqdI8vTWAfpHJcP4O?=
 =?us-ascii?Q?ZONULEybLea51eS9nJM6+Z9hKMdvEaaVRVEu+dpjAFfUD4hB0rrZz4u8m6Zx?=
 =?us-ascii?Q?0/GMOrYI/oE5yzdpco6EkAobHoN9DSbWHsTdh4cdD4WkDmN3nBhaQOoYgiOU?=
 =?us-ascii?Q?uKjzn/s8grsxLltZwaI2ol7GJna/cWW3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea526e0-05f9-43fc-f471-08da042cd5cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2022 13:33:03.6613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HjORydReCniIfTJifXjfh3wUFk9U5xIYkWPQGStb/tgoXmHhQqqkGfPGR7LB8SjHQdLa24RPtz2zMZYlufMr1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3940
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
Reply-To: "20220311012218.19025-2-shawn.c.lee@intel.com"
 <20220311012218.19025-2-shawn.c.lee@intel.com>
Cc: "Chiou, Cooper" <cooper.chiou@intel.com>, "Tseng,
 William" <william.tseng@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, March 12, 2022 7:41 AM, Drew Davenport <ddavenport@chromium.or=
g> wrote:
>On Fri, Mar 11, 2022 at 09:22:14AM +0800, Lee Shawn C wrote:
>> drm_find_cea_extension() always look for a top level CEA block. Pass=20
>> ext_index from caller then this function to search next available CEA=20
>> ext block from a specific EDID block pointer.
>>=20
>> v2: save proper extension block index if CTA data information
>>     was found in DispalyID block.
>>=20
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 43=20
>> +++++++++++++++++++-------------------
>>  1 file changed, 21 insertions(+), 22 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
>> index 561f53831e29..e267d31d5c87 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -3353,16 +3353,14 @@ const u8 *drm_find_edid_extension(const struct e=
did *edid,
>>  	return edid_ext;
>>  }
>> =20
>> -static const u8 *drm_find_cea_extension(const struct edid *edid)
>> +static const u8 *drm_find_cea_extension(const struct edid *edid, int=20
>> +*ext_index)
>>  {
>>  	const struct displayid_block *block;
>>  	struct displayid_iter iter;
>>  	const u8 *cea;
>> -	int ext_index =3D 0;
>> =20
>> -	/* Look for a top level CEA extension block */
>> -	/* FIXME: make callers iterate through multiple CEA ext blocks? */
>> -	cea =3D drm_find_edid_extension(edid, CEA_EXT, &ext_index);
>> +	/* Look for a CEA extension block from ext_index */
>> +	cea =3D drm_find_edid_extension(edid, CEA_EXT, ext_index);
>>  	if (cea)
>>  		return cea;
>> =20
>> @@ -3370,6 +3368,7 @@ static const u8 *drm_find_cea_extension(const stru=
ct edid *edid)
>>  	displayid_iter_edid_begin(edid, &iter);
>>  	displayid_iter_for_each(block, &iter) {
>>  		if (block->tag =3D=3D DATA_BLOCK_CTA) {
>> +			*ext_index =3D iter.ext_index;
>This could still end up in an infinite loop in patch 2 in the case that th=
ere is no CEA_EXT block in the edid, but there is a CEA block in the Displa=
yId block.
>
>Repeating my review comment from elsewhere, consider the case:
>- If there are no cea extension blocks in the EDID,
>  drm_find_edid_extension returns NULL
>- drm_find_cea_extension will then return the first DisplayId block
>  with tag DATA_BLOCK_CTA
>
>If the version of the cea data from DisplayId block is less than 3, the lo=
op will restart and call drm_find_cea_extension the same way, returning the=
 same DisplayID block every time.
>
>Setting *ext_index inside the display_iter_for_each block doesn't change t=
his, since we're not checking it.
>
>But I don't think we want to use the same *ext_index both to pass into drm=
_find_edid_extension and for tracking the next DisplayId block to check.
>This might end up in similar infinite loops or skipping DisplayId blocks.
>
>Maybe you'll need to pass in two indexes to drm_find_cea_extension, one wh=
ich is passed to drm_find_edid_extension, and the other to keep track of th=
e next DisplayId block to check.

As you mentioned, this situation would cause infinite loop. We may need two=
 different parameters to store CEA and DisplayID block index.

Best regards,
Shawn

>>  			cea =3D (const u8 *)block;
>>  			break;
>>  		}
>> @@ -3643,10 +3642,10 @@ add_alternate_cea_modes(struct drm_connector *co=
nnector, struct edid *edid)
>>  	struct drm_device *dev =3D connector->dev;
>>  	struct drm_display_mode *mode, *tmp;
>>  	LIST_HEAD(list);
>> -	int modes =3D 0;
>> +	int modes =3D 0, ext_index =3D 0;
>> =20
>>  	/* Don't add CEA modes if the CEA extension block is missing */
>> -	if (!drm_find_cea_extension(edid))
>> +	if (!drm_find_cea_extension(edid, &ext_index))
>>  		return 0;
>> =20
>>  	/*
>> @@ -4321,11 +4320,11 @@ static void drm_parse_y420cmdb_bitmap(struct=20
>> drm_connector *connector,  static int  add_cea_modes(struct=20
>> drm_connector *connector, struct edid *edid)  {
>> -	const u8 *cea =3D drm_find_cea_extension(edid);
>> -	const u8 *db, *hdmi =3D NULL, *video =3D NULL;
>> +	const u8 *cea, *db, *hdmi =3D NULL, *video =3D NULL;
>>  	u8 dbl, hdmi_len, video_len =3D 0;
>> -	int modes =3D 0;
>> +	int modes =3D 0, ext_index =3D 0;
>> =20
>> +	cea =3D drm_find_cea_extension(edid, &ext_index);
>>  	if (cea && cea_revision(cea) >=3D 3) {
>>  		int i, start, end;
>> =20
>> @@ -4562,7 +4561,7 @@ static void drm_edid_to_eld(struct drm_connector *=
connector, struct edid *edid)
>>  	uint8_t *eld =3D connector->eld;
>>  	const u8 *cea;
>>  	const u8 *db;
>> -	int total_sad_count =3D 0;
>> +	int total_sad_count =3D 0, ext_index =3D 0;
>>  	int mnl;
>>  	int dbl;
>> =20
>> @@ -4571,7 +4570,7 @@ static void drm_edid_to_eld(struct drm_connector *=
connector, struct edid *edid)
>>  	if (!edid)
>>  		return;
>> =20
>> -	cea =3D drm_find_cea_extension(edid);
>> +	cea =3D drm_find_cea_extension(edid, &ext_index);
>>  	if (!cea) {
>>  		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
>>  		return;
>> @@ -4655,11 +4654,11 @@ static void drm_edid_to_eld(struct drm_connector=
 *connector, struct edid *edid)
>>   */
>>  int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)  {
>> -	int count =3D 0;
>> +	int count =3D 0, ext_index =3D 0;
>>  	int i, start, end, dbl;
>>  	const u8 *cea;
>> =20
>> -	cea =3D drm_find_cea_extension(edid);
>> +	cea =3D drm_find_cea_extension(edid, &ext_index);
>>  	if (!cea) {
>>  		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
>>  		return 0;
>> @@ -4717,11 +4716,11 @@ EXPORT_SYMBOL(drm_edid_to_sad);
>>   */
>>  int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)  {
>> -	int count =3D 0;
>> +	int count =3D 0, ext_index =3D 0;
>>  	int i, start, end, dbl;
>>  	const u8 *cea;
>> =20
>> -	cea =3D drm_find_cea_extension(edid);
>> +	cea =3D drm_find_cea_extension(edid, &ext_index);
>>  	if (!cea) {
>>  		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
>>  		return 0;
>> @@ -4814,9 +4813,9 @@ bool drm_detect_hdmi_monitor(struct edid *edid) =20
>> {
>>  	const u8 *edid_ext;
>>  	int i;
>> -	int start_offset, end_offset;
>> +	int start_offset, end_offset, ext_index =3D 0;
>> =20
>> -	edid_ext =3D drm_find_cea_extension(edid);
>> +	edid_ext =3D drm_find_cea_extension(edid, &ext_index);
>>  	if (!edid_ext)
>>  		return false;
>> =20
>> @@ -4853,9 +4852,9 @@ bool drm_detect_monitor_audio(struct edid *edid)
>>  	const u8 *edid_ext;
>>  	int i, j;
>>  	bool has_audio =3D false;
>> -	int start_offset, end_offset;
>> +	int start_offset, end_offset, ext_index =3D 0;
>> =20
>> -	edid_ext =3D drm_find_cea_extension(edid);
>> +	edid_ext =3D drm_find_cea_extension(edid, &ext_index);
>>  	if (!edid_ext)
>>  		goto end;
>> =20
>> @@ -5177,9 +5176,9 @@ static void drm_parse_cea_ext(struct=20
>> drm_connector *connector,  {
>>  	struct drm_display_info *info =3D &connector->display_info;
>>  	const u8 *edid_ext;
>> -	int i, start, end;
>> +	int i, start, end, ext_index =3D 0;
>> =20
>> -	edid_ext =3D drm_find_cea_extension(edid);
>> +	edid_ext =3D drm_find_cea_extension(edid, &ext_index);
>>  	if (!edid_ext)
>>  		return;
>> =20
>> --
>> 2.17.1
>> =20
