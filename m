Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E73424C5C62
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 15:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE29710E366;
	Sun, 27 Feb 2022 14:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D6310E366
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 14:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645973397; x=1677509397;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=MWS+zACAH33x2oXUt/zShQA7Rtq14N2hyxOLfU0GcVM=;
 b=CIIXhfs+NcM3pq5tipeHf47Jtw5z8OSBPy38pyfVgEXISUFO5fBi/gTR
 DkuM7m2hendc9CtAQFeV9tSYy5QPjWYkulDjq4U0UWJbxB6pKx/SwRhpN
 YyboZ5cwRUc3J9HqUds3Xo1nA7XZ9l1nFGDNVOppUeOdt35U8vZ6L2QOA
 Gu0fV2ZoAm7M6UXw170SjNlFQ+zjEIAIkSbswoMnSILcXsH1ayvByn2Gu
 SNUlHP0g1X+skprTxgyELENadvrRVBxFfOlkSxRkB9HhwXGrO82XLOrE1
 F6W/D0cxNTRqOliPs0nKNfjN6rw1/B2x7p7JMUMaUpL82R22W+YnHfUqv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="251573744"
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; d="scan'208";a="251573744"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 06:49:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; d="scan'208";a="777842362"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 27 Feb 2022 06:49:56 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 27 Feb 2022 06:49:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 27 Feb 2022 06:49:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 27 Feb 2022 06:49:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD5481geVCb8s1HDxP/6n2s3E3QZAR1JOZACIi4GAyjRqCnQs5Om1ZwYtcSD5XtBblzXreYgbLAtkLXjc7uKwjbytdmKr+p4yEBlYdrgEEUDFsQNIfHyM7KixnL/QgB4WnhUk7zQlfyhVhzhgWBurh0PZorGrePI9rQWoe1KYMnXeY50jAktDzKhI/XcpBSnagkxqDfEztC0k755GhocygEEC5l0TinEoKuU7jlrP9lituvBFYMgQBtdnMxcwD0+okm2Qc70O3ER0ZS/ss1TJcKGiQA/oqHzVaxByvF6Y6bi6+s4uL/6xrnw+aVj1ZpFy9T9mUGJ7BceU1Hwnv98mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiywnNeKF8uJrQXW4Q6iBJnrf78GZDx7PzI5xNuj8wg=;
 b=Y4ApMVndl0jTSak6xlw33Ir8F9cuBLT4D1ihazjyY/vMRIHRFwPRLr1KDFsHMJm8a1prppCgYGqipthXTqsL72BRYce3wgHaP5o7XoxlgZviwscdzlBR/3sFlBwp43ifjg/XPYuycQwCDtxxEpdg2mnPPSQ3amhGkveTxDC92+OSDzw8lzQHzFDROdgAaTmI8WFGQ7c8d9JwEaCzD78bxMmkxrxKS2rg8zkVH7PHyl3IV00ied7UceNfDFMTHTL70oBwbBiA4Ml2dW84Q94xyy/WnPUr5xsASIJNoBm4xRxhicyWNYbMHN60WH47YfYWtlVHDW3BI+gT0+vPpM8Aeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2710.namprd11.prod.outlook.com (2603:10b6:a02:c7::24)
 by SA2PR11MB5212.namprd11.prod.outlook.com (2603:10b6:806:114::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Sun, 27 Feb
 2022 14:49:54 +0000
Received: from BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22]) by BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22%7]) with mapi id 15.20.5017.026; Sun, 27 Feb 2022
 14:49:53 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH 1/3] drm/edid: parse multiple CEA extension block
Thread-Topic: [PATCH 1/3] drm/edid: parse multiple CEA extension block
Thread-Index: AQHYKYdqvQK+ErZciEO/yrkMYXo6zqykjGcAgALrcGA=
Date: Sun, 27 Feb 2022 14:49:53 +0000
Message-ID: <BYAPR11MB27103636B3DDD0E8B5553187A3009@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <20220224141625.19070-1-shawn.c.lee@intel.com>
 <20220224141625.19070-2-shawn.c.lee@intel.com> <YhkWJsa10jwNXT62@intel.com>
In-Reply-To: <YhkWJsa10jwNXT62@intel.com>
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
x-ms-office365-filtering-correlation-id: 1ab0a139-e75d-4384-a1c3-08d9fa006a3a
x-ms-traffictypediagnostic: SA2PR11MB5212:EE_
x-microsoft-antispam-prvs: <SA2PR11MB5212BFBFA763EAE67800BD3BA3009@SA2PR11MB5212.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UIz1kVpyKVafLn/Tzr4gJNfYbhGhpia+MpsIp7K+E8UC5g7FtOKW8V5DYnZ6W/h0JAKjUOeSQQWOlhZMLDqAVgZTtEMndfdPuJ/jssw5IvZ/l4vDkvCNwfPBjw9kgqWHnZiGYCRnEvGmJ7cdyLdGNTOWMxvnMotNMtZ5YtkF3ScZSIibmyO0cqeWbD01MaSYixJJGT2JzKPfLN3qUmESk8zNuPf2av8nSHejQpgyl5BzVj/GL2tdEdGDwhMqHuzgSumcQEDr1IZWlOTN060Hzo0b9lCyYHsTTwtN+o46bikakCwmkN2JMySAbmAMUuBkJn4uc9sxyKxMAg+OXqhvopecl41x7W8MJV0vHZsTKkH/eqvZcg1IP8oQm+OFs+Wr4okCMduk/mUawnARWRsHTPPG+2sQUUG5oAEVqGpnaH44w3R+6wuGhb3TAqmlQf12UnoX3+zUl0+o/fKVxZDIw/9wn9Iv+cS76R4TA6HFljHqO3nM7acyH44L69CrU+cmnJcT2RIQU2PQJyVxybO84SR6QyQdKflhfXPBotCoiCQZGXE/pI2k2ogBS0MOWEslLZYw6h2xY6TamlrkwnXOX3Dy/0QOM3XBcGdXOcr+jZL+pTriNhka7tQtiGP0DbEb11j1GdFddBn5IQcdU5NGjkOKAgo8x4196Ib7wDQYBULTzRSWd2gPRNO/cdU+M5p8OajixUd74tgYtZbEP0iNTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2710.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66574015)(71200400001)(5660300002)(122000001)(54906003)(7696005)(508600001)(26005)(6506007)(9686003)(186003)(38070700005)(52536014)(55236004)(64756008)(66476007)(66446008)(53546011)(4326008)(66946007)(66556008)(8936002)(82960400001)(76116006)(8676002)(8796002)(33656002)(83380400001)(316002)(6916009)(86362001)(38100700002)(2906002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rT86hLDLEjAMDi9w8m6UuzhxXoLmXYkAAHdaaKDxRdCeSJLuMWG34GBkwc?=
 =?iso-8859-1?Q?srwnODim1LQ6GPOsQLC5L+JcHf620NjaoUisVRacMYD08b5yZopsh6XW+i?=
 =?iso-8859-1?Q?5rRvNQAKaJgNGEYRyL2D0wRr85QFJUIeCRtVf9yYfDgK48AZaD5Tp6WVEC?=
 =?iso-8859-1?Q?2YwlJPBXMNRwdKQWScb64YlunoiMq3zIVHMKmNG4IRkre/D6OwILluigVP?=
 =?iso-8859-1?Q?+yrgue1JwhliFIQdD/j2sxIDX/omfIv59ZCBMO52a78sRWMO+WYmbr0Aca?=
 =?iso-8859-1?Q?7U7g3IvAvve8dWWxvePI5EeLYukjrZiALiIHwlyYtMqAgRtbhHcUZLr6aQ?=
 =?iso-8859-1?Q?+2hguOYCDyPy07PsTm9sSwPneyt3ilfqCG+N3L2Np1B2lcMjnXLZISX/1t?=
 =?iso-8859-1?Q?RcoDVl7xmFeraAUl+ElBpomqqktP2LdSNU+v7m6q8jGdvBG6JNdLit1pPO?=
 =?iso-8859-1?Q?CRet8piWHAHPdvA/jEkP4VkfSe7Pb6sjes8r/jEMVFg/5+nH6YJpPNyyZQ?=
 =?iso-8859-1?Q?LtzUCb19av1tgt5xV7V4FSmwjta6CUvtlBbtwULBoSO0WszNuUxZpFI6iw?=
 =?iso-8859-1?Q?o1Dme3FG0k4PHGnb72LUWTF9x1NXwB3idLH/lIkypvGxHFWeq9RB/iqpxG?=
 =?iso-8859-1?Q?pdFoRM+3YKNtYyKDRyXxaoxUq97qyOEAP+EwBu+Kw1aQcBIDu5GjcNOqew?=
 =?iso-8859-1?Q?DVEHo9jCFiFkA6aVc0kCTXO9WwqeIkQ0S4mkNTmtFEO4el2BVRg/M6QBj5?=
 =?iso-8859-1?Q?MLl1Dlwq91ygj+KTetAqtX3izz90Q1nxK2PXDq2gqC7kBLEMqfMupZTRZV?=
 =?iso-8859-1?Q?Ysub6gET9xunTy4hWu2cy2A4+vLrBYtGzlTdvVH8Fpxux/sR/67BqVxelr?=
 =?iso-8859-1?Q?Yx8KkYfPUXHUmVV1e7U+qkzteCXuOaPEE8eyw0TGzKQ/+eSJEcQbJ6QLQB?=
 =?iso-8859-1?Q?KtHfSoEoaWPMzlXC8i4rtOYL0StqPQBFjwszybOQkvO9a9NRvc6xLnhPWb?=
 =?iso-8859-1?Q?B4ckCkDf4oa0ak8GhRNAOf67K9dU1NdxMtQe0DrqI0UlW+ed9lqY25Whj8?=
 =?iso-8859-1?Q?IWk3tC2AIjDuSl6xuNWcdBlBROaCWYMgUSMDKx31nGqbVE/0QzSf9dD10g?=
 =?iso-8859-1?Q?j5fwSW62YAu+IqkI+8DHfuHbTL2EcLo06jcLbDaVV4+uUrIi3eTyj2qi6i?=
 =?iso-8859-1?Q?YtP0sJhWa5qOljrtY0/v1O3Ya20tR7Occj9V0BqA1F/vICPRPSdZ/egdOl?=
 =?iso-8859-1?Q?H570U3QyBkMI8fFbzBlsoCHU9meXUjVSnlzTZHBUQuAsSkmQdvCi0mDiRS?=
 =?iso-8859-1?Q?svLJbWcAh+CIhhCmpAZ5SvLrJfN2UTgKoOBEqqQCsRcCxBcdVvJk7as51o?=
 =?iso-8859-1?Q?R0awVUXbM21Ts3sacZrb6p1EvI2M25P/MNkNVkTPaVBshzzwrsxB4i24TK?=
 =?iso-8859-1?Q?q5F+jwI/ryrNbPNUkjPczPsd//Y0SMxJ7Xt2n73l/AP/M9FigUt05KvP0C?=
 =?iso-8859-1?Q?GXPDodXm54AxpRx5kzPVdpob9zCLdIFrgUvwte2+n3laDrRpI7cLgnbhvx?=
 =?iso-8859-1?Q?e6DLTJ8Jhvgc95mTQwW/Kabn0WtyGsGH3eep/f2Rnp2Fsz9A9wJ+LiHMt7?=
 =?iso-8859-1?Q?gOZ2kMDqQfyFee+kwEB/6QEAy0A1bmDm90KhU5MZFw0HlByiYgfnnrow?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab0a139-e75d-4384-a1c3-08d9fa006a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2022 14:49:53.3963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c3EDu22DalzQiVpjli1o/46cBmXWiWqCLPr+i/kALosxpMnxbPM3ootW5NcrRIrOS/mCZE3SvkqVj1YlzKTeVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5212
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
Reply-To: "20220224141625.19070-2-shawn.c.lee@intel.com"
 <20220224141625.19070-2-shawn.c.lee@intel.com>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Saturday, February 26, 2022 1:47 AM, Ville Syrj=E4l=E4 wrote:
>On Thu, Feb 24, 2022 at 10:16:23PM +0800, Lee Shawn C wrote:
>> Try to find and parse more CEA ext blocks if edid->extensions is=20
>> greater than one.
>>=20
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 110=20
>> ++++++++++++++++++++-----------------
>>  1 file changed, 60 insertions(+), 50 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
>> index a504542238ed..19426f28b411 100644
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
>> @@ -3643,10 +3641,10 @@ add_alternate_cea_modes(struct drm_connector *co=
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
>> @@ -4321,46 +4319,58 @@ static void drm_parse_y420cmdb_bitmap(struct=20
>> drm_connector *connector,  static int  add_cea_modes(struct=20
>> drm_connector *connector, struct edid *edid)  {
>> -	const u8 *cea =3D drm_find_cea_extension(edid);
>> +	const u8 *cea =3D NULL;
>>  	const u8 *db, *hdmi =3D NULL, *video =3D NULL;
>>  	u8 dbl, hdmi_len, video_len =3D 0;
>> -	int modes =3D 0;
>> +	int modes =3D 0, ext_index =3D 0;
>> =20
>> -	if (cea && cea_revision(cea) >=3D 3) {
>> -		int i, start, end;
>> +	for (;;) {
>> +		cea =3D drm_find_cea_extension(edid, &ext_index);
>
>Please split this into two patches:
>1. do the *ext_index stuff
>2. do the loop
>

Thanks for comment! Will split this patch to two in next version.

>> =20
>> -		if (cea_db_offsets(cea, &start, &end))
>> -			return 0;
>> +		if (!cea)
>> +			break;
>> =20
>> -		for_each_cea_db(cea, i, start, end) {
>> -			db =3D &cea[i];
>> -			dbl =3D cea_db_payload_len(db);
>> +		if (cea && cea_revision(cea) >=3D 3) {
>> +			int i, start, end;
>> +
>> +			if (cea_db_offsets(cea, &start, &end))
>> +				continue;
>> =20
>> -			if (cea_db_tag(db) =3D=3D VIDEO_BLOCK) {
>> -				video =3D db + 1;
>> -				video_len =3D dbl;
>> -				modes +=3D do_cea_modes(connector, video, dbl);
>> -			} else if (cea_db_is_hdmi_vsdb(db)) {
>> -				hdmi =3D db;
>> -				hdmi_len =3D dbl;
>> -			} else if (cea_db_is_y420vdb(db)) {
>> -				const u8 *vdb420 =3D &db[2];
>> -
>> -				/* Add 4:2:0(only) modes present in EDID */
>> -				modes +=3D do_y420vdb_modes(connector,
>> -							  vdb420,
>> -							  dbl - 1);
>> +			for_each_cea_db(cea, i, start, end) {
>> +				db =3D &cea[i];
>> +				dbl =3D cea_db_payload_len(db);
>> +
>> +				if (cea_db_tag(db) =3D=3D VIDEO_BLOCK) {
>> +					video =3D db + 1;
>> +					video_len =3D dbl;
>> +					modes +=3D do_cea_modes(connector, video, dbl);
>> +				} else if (cea_db_is_hdmi_vsdb(db)) {
>> +					hdmi =3D db;
>> +					hdmi_len =3D dbl;
>> +				} else if (cea_db_is_y420vdb(db)) {
>> +					const u8 *vdb420 =3D &db[2];
>> +
>> +					/* Add 4:2:0(only) modes present in EDID */
>> +					modes +=3D do_y420vdb_modes(connector,
>> +								  vdb420,
>> +								  dbl - 1);
>> +				}
>>  			}
>>  		}
>> -	}
>> =20
>> -	/*
>> -	 * We parse the HDMI VSDB after having added the cea modes as we will
>> -	 * be patching their flags when the sink supports stereo 3D.
>> -	 */
>> -	if (hdmi)
>> -		modes +=3D do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
>> -					    video_len);
>> +		/*
>> +		 * We parse the HDMI VSDB after having added the cea modes as we will
>> +		 * be patching their flags when the sink supports stereo 3D.
>> +		 */
>> +		if (hdmi) {
>
>Looks like you're potentially using stale information here from previous l=
oops. Please move all the possible variables to a tighter scope so this can=
't happen.
>

Yes, you are right! I will modify these codes and send patch v2 for review =
later.

Best regards,
Shawn

>> +			modes +=3D do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
>> +						    video_len);
>> +			hdmi  =3D NULL;
>> +			video =3D NULL;
>> +			hdmi_len =3D 0;
>> +			video_len =3D 0;
>> +		}
>> +	}
>> =20
>>  	return modes;
>>  }
>> @@ -4562,7 +4572,7 @@ static void drm_edid_to_eld(struct drm_connector *=
connector, struct edid *edid)
>>  	uint8_t *eld =3D connector->eld;
>>  	const u8 *cea;
>>  	const u8 *db;
>> -	int total_sad_count =3D 0;
>> +	int total_sad_count =3D 0, ext_index =3D 0;
>>  	int mnl;
>>  	int dbl;
>> =20
>> @@ -4571,7 +4581,7 @@ static void drm_edid_to_eld(struct drm_connector *=
connector, struct edid *edid)
>>  	if (!edid)
>>  		return;
>> =20
>> -	cea =3D drm_find_cea_extension(edid);
>> +	cea =3D drm_find_cea_extension(edid, &ext_index);
>>  	if (!cea) {
>>  		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
>>  		return;
>> @@ -4655,11 +4665,11 @@ static void drm_edid_to_eld(struct drm_connector=
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
>> @@ -4717,11 +4727,11 @@ EXPORT_SYMBOL(drm_edid_to_sad);
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
>> @@ -4813,10 +4823,10 @@ EXPORT_SYMBOL(drm_av_sync_delay);  bool=20
>> drm_detect_hdmi_monitor(struct edid *edid)  {
>>  	const u8 *edid_ext;
>> -	int i;
>> +	int i, ext_index =3D 0;
>>  	int start_offset, end_offset;
>> =20
>> -	edid_ext =3D drm_find_cea_extension(edid);
>> +	edid_ext =3D drm_find_cea_extension(edid, &ext_index);
>>  	if (!edid_ext)
>>  		return false;
>> =20
>> @@ -4851,11 +4861,11 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
>>  bool drm_detect_monitor_audio(struct edid *edid)  {
>>  	const u8 *edid_ext;
>> -	int i, j;
>> +	int i, j, ext_index =3D 0;
>>  	bool has_audio =3D false;
>>  	int start_offset, end_offset;
>> =20
>> -	edid_ext =3D drm_find_cea_extension(edid);
>> +	edid_ext =3D drm_find_cea_extension(edid, &ext_index);
>>  	if (!edid_ext)
>>  		goto end;
>> =20
>> @@ -5177,9 +5187,9 @@ static void drm_parse_cea_ext(struct=20
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
>
>--
>Ville Syrj=E4l=E4
>Intel
>
