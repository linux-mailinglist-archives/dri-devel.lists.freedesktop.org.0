Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960F64C5C7E
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 16:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F315510E4A1;
	Sun, 27 Feb 2022 15:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EFA10E482
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645974704; x=1677510704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=a8bgAUzbivSY0AafUeufMYcA/cl532BvjpilcfGFtX0=;
 b=NNbSNCvBy9uUAARY6OR0+c0/nJemUdREPw2oW82jvniHjqP0wC4ZHALS
 Up38sKjivKowvIMx8qR5aSPObbtxtT/LfKmQFsD5mkQ+k/oqLR/TrobU0
 5Yo4qQL/L/Ql/mGjnR6ei7Fbu87Q12GyxSjO3kWx5+R9F0zPZM6fsYinV
 bMdLkAjMw0/Tc39xvg1+f8iuiujJfotgwp73HtdaSEDw7QfhQxlSPFiFS
 cTdNfhvIoCr21wUCcYsHQX7Ax7i1+YCrg693phIGY4OV3mGnaJp2Zbo6l
 f/N/QqzIxeuP++TnecRFVsOrk8GQWyAfb75c/vznTh9LcvMIN1gfknIIV g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="251575541"
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; d="scan'208";a="251575541"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 07:11:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; d="scan'208";a="492447871"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 27 Feb 2022 07:11:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 27 Feb 2022 07:11:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 27 Feb 2022 07:11:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 27 Feb 2022 07:11:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfvgRF1T6edNAx1AKTvn6mzpmKQh8JmcKkkr2G9WMCFz5pfbCMUFKw7uOIsiVo4XrMrsEyckr4VjZB6oMsda6A2g0QhSCV9EgIPtZ8i20oYY27EZbGwu0H2/7MPgwP/lNAOQhEi/RBPGWaj4r6+cu+fm5faoEwLW9CgqdVE2LKxqqknXepEM8Hj6rb8QWvPkyogAM71t1s+nbxEauwTvUWXrVDkkDdglqXQ7TK3Grz6MytpkOcOJ6AWm79m+jNf7YPZeH49p/2GyVgWt8YRLlRGsUKHbFdkLCHd3MpsxUtIsuA0d5Z3jsh1zj0OTxsAYkEc4Uht/0qChYzg4EABLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+39Gwg+ocCiYrttDuncmbXYf5JxzKyMsLLRqTPZi28c=;
 b=LS0ORt/5SdeXz5haE/QL7xTe/lRdvx+8W3vt+Y6eh2/j2VTr+j9H7g8i4AKVHqvvT/Kk9CvmsQvAi5bdWSIBQFJCt9WvrbC7+IO9LAzrTfPKXIl6+6O4EzPGaDUtTvjoO54MXwSTgNod+5+D/bhbolbDK/auzia6AqwDZzkb+26Xg9g0n0wzbU2DQU3nzo5XyAzRvmjjwG78raQYg/wYs+M+59h6ALByl9uVX4EP3hqa3Mp65JBpW6Cs5TVdiMcWffH9EnHEp1nqkbfItX1a8Mh4W7cock+Q2UNVraji6bgXc0RS4srDvZHSZordqDcAf+kxxYY6gwflyttVZaVXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2710.namprd11.prod.outlook.com (2603:10b6:a02:c7::24)
 by SN6PR11MB3119.namprd11.prod.outlook.com (2603:10b6:805:cc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Sun, 27 Feb
 2022 15:11:40 +0000
Received: from BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22]) by BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22%7]) with mapi id 15.20.5017.026; Sun, 27 Feb 2022
 15:11:40 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH 2/3] drm/edid: read HF-EEODB ext block
Thread-Topic: [PATCH 2/3] drm/edid: read HF-EEODB ext block
Thread-Index: AQHYKYdkt24Ss8hN3k23Vf1GdJUNsqykkogAgALtUxA=
Date: Sun, 27 Feb 2022 15:11:40 +0000
Message-ID: <BYAPR11MB2710C605A8B68B380AFA6952A3009@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <20220224141625.19070-1-shawn.c.lee@intel.com>
 <20220224141625.19070-3-shawn.c.lee@intel.com> <YhkbSj+GfNyOIWE8@intel.com>
In-Reply-To: <YhkbSj+GfNyOIWE8@intel.com>
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
x-ms-office365-filtering-correlation-id: 29afa742-7c34-4474-beaa-08d9fa037517
x-ms-traffictypediagnostic: SN6PR11MB3119:EE_
x-microsoft-antispam-prvs: <SN6PR11MB3119D5AE5D9DF0682B206453A3009@SN6PR11MB3119.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +GgWL0Hz8GJDOMhw9zUCmiNLiLAKHNmHh7ivOp9adOrHBAXBorS+N7jikQQHRnMlmkltG5am5UgkTU/zyqYw/BAxtkMQNi0mrw6foRQ6jqtVjMe/C/XtN9ly1FV3WzDKlgp7zZ2K1eXX6pyood9kVlbEeGjSeGKedGao7dPD77vdeKK78LerdRg/I7BejgsvksiIiTVAFC+rJqBP7hFWPTvF9stFVby5RHGo2Rc2wHNVXu8B+BTZmgURS0Nf8Ph8XwK1l02/9W9QI2cNshQfV4mpyUZaNpifpzfEAZO7w3rNwEWvQcv0YpO50Bd20Nce5agfB3H4wPrB91Y6Ginli/rxIICgcT4YgpcEvluP9HDv2TZJ2OOiYVWhVB6ORIce95+2rkKJI8HtNlnNoVkzOMOIjtJQ+R89e99Ub9FOxExv6BqzmnqLNqB56l/Rr8VV9fQAU0jmXbgAEWte0ieDjKPa3iWFzJOjFSL2faoC5UMRdhezpdAtze9TTVXzc/wSNvXR9w5NgykhkorePAY9R30y/v7i40kN1bgn9VkfMAh5KcTfSpyPPPCFt/EUfkqhQgpmmzUNvFnB6rDk5BArfGUgYbkqu2MiCIYzJ+5VqY0pQuxR5QiLXKpAy9gfLkXtQdRfuB27pdC6wgEMdMTOEQSW+iOB1GYEYrUFfcU1aRXSLAudndzzyCdCxyFZrsHWYuybHXLlBcgJHHnk5EQWqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2710.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(9686003)(8796002)(8936002)(55016003)(52536014)(55236004)(53546011)(66946007)(86362001)(7696005)(2906002)(82960400001)(8676002)(38100700002)(54906003)(33656002)(83380400001)(66476007)(66446008)(64756008)(66556008)(76116006)(186003)(38070700005)(26005)(6506007)(66574015)(122000001)(508600001)(71200400001)(5660300002)(6916009)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zyZPJdvEWLveZx0NW6OfArE8Gu8tNOpIPcgP4Yke1Xo+yiXsl1RjDg41xF?=
 =?iso-8859-1?Q?UsmbM/F5xp9/A2lBb+H4Ai7OSR3vZGdD9e9OrUeOYhX4LvYdU91vKf1qP+?=
 =?iso-8859-1?Q?qSVdFrb5dEAu/kBGQnBb6nc80JlfOZIPch2XuHt51Z+3WilAHyuZkbVNbX?=
 =?iso-8859-1?Q?u8ezgrx++MdJvx5YKMPcrzdmh6S1OjtTYG2gjLjC7p1T7f6rG+oNDPhMyu?=
 =?iso-8859-1?Q?Co8B8Ibw8/7xrIW6oAM/oYBpJR640RjHThRpKrOhXMsk/wm6E6SVOujpnP?=
 =?iso-8859-1?Q?HlMvw5GIsQxdWAapw8My4xJt2PM4U+pwSM6u6IuR78GGC/hkY/EOpmpPH3?=
 =?iso-8859-1?Q?9pcmRnG7g+Ct6Ai/GOqn8zREURupf2gbNhqJKh5gNrRHDCjyzw+wfNzyQF?=
 =?iso-8859-1?Q?omGz5BAbQLfDpivjMur3P+PLHlkLUvsXlu+cK4yed6yHJmmZRrxWNsvAEU?=
 =?iso-8859-1?Q?6OxzOUstBY5Nv68QkycG5U9S4HBs3diX8HIZ/S/AcT+1INDQhwAGn+S+UR?=
 =?iso-8859-1?Q?k0JXGbr0XPqs95y/RLHdofcBlsZLLs/SRKykYE0nb6hNJqFMVyjNkyOdfU?=
 =?iso-8859-1?Q?teiQwD2GzPaOhjVAsSqNZDFvDSFZkG02CVrQshtkzllG8sREHbYQWPx+5/?=
 =?iso-8859-1?Q?z2d/yIi8hkyhj6TjGpfxyEankIxXLmkmASUoA8dnC9XAUF7aQ2fMoMq3xA?=
 =?iso-8859-1?Q?LLXyyl33EhxSXEB/zxoo4xzwT18ujVT9+weQMUV3WbuX9/pSsM9/w5rQW+?=
 =?iso-8859-1?Q?ntarAVtuQJhPViXP7yl0z9AO+8b4Ej2AQssuawNXznmIkRsZ3REzkqlO3Y?=
 =?iso-8859-1?Q?StmgLDpVldbvVxiwmBr7anANCp0n43pcswJO9jv6LMgzn05nJ5wQxCSd1W?=
 =?iso-8859-1?Q?Hx3GVDVwT4pRtgYxcEmBoA3ZDCNz7KbcLIZ9VSlAqNbcoo9M/CE5uoRh1x?=
 =?iso-8859-1?Q?o7TZdlm2oC/jxelW1nqUcSfkwzv4lhe1SkiL+oTn605vS7dm8gX4bVcl+L?=
 =?iso-8859-1?Q?q/gg+5WQ/YRp04LBfW3IG8+KII1eNVHLNbRAwgFGkdYr6ZT2l1qeBEoAuZ?=
 =?iso-8859-1?Q?DxNq7VfO3ahgifIhrCnatTpZIULcEjpnWM6Fe5IpuVvZqvHSqe1CFzk2XP?=
 =?iso-8859-1?Q?hfVrIYhcMPVBLNKp2a3U1iuUcGrFW8hX/X5ycsriSvDZAofZ2LrLAUs9TK?=
 =?iso-8859-1?Q?9y01F22/o3FDjhoJ6xdvfaDSonGplRis8U3qUyMXcd8C2nRY4hw4MbXisY?=
 =?iso-8859-1?Q?jN/s4AM8/7oEtlJN2msnQsCXcZC6KWeUoQSapgA6i/4GZCwcwfxr81zbbr?=
 =?iso-8859-1?Q?fn3M9N8nVhqBGICPfW/TXvd8P7POoPqDXXzTwYoIq30Jxf1nJI8DytbiOp?=
 =?iso-8859-1?Q?nUa2rEMOeo4ks8ks3+LD1GtNePnIIlaM7XjS1lssxiTD8uh757YKIopoW/?=
 =?iso-8859-1?Q?2JpAxJi3mSrOZ87DBzg+LWQNNIfkgrOCZnF8K8/jCUQrmBGPGeO4RVAJwo?=
 =?iso-8859-1?Q?w5BkBIj2T5cS8I6l3MXGvuAjCXP798gHyn9hzIPFsIkjsNn/el+6jhUDla?=
 =?iso-8859-1?Q?1IpN2xIbnNLOKRDhk8dXlvqg/zAyu9ol6ZkNRuMb7VbpXOq2vP0Y7KGQHu?=
 =?iso-8859-1?Q?dIMky0w2cZIeqhRqOhll1alNbexywNv7XIFg9POjlspC4j4L02IN9WDQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29afa742-7c34-4474-beaa-08d9fa037517
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2022 15:11:40.4409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZYBRl0LS+WjAvmrboPZ/8N4u0abr9C2Gmtr507OHmYMMIl+MF+soaFvma34CNS3SNpUxI7obw4az/asbq0QoKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3119
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
Reply-To: "20220224141625.19070-3-shawn.c.lee@intel.com"
 <20220224141625.19070-3-shawn.c.lee@intel.com>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, February 26, 2022 2:09 AM, Ville Syrj=E4l=E4 wrote:
>On Thu, Feb 24, 2022 at 10:16:24PM +0800, Lee Shawn C wrote:
>> Support to read HF_EEODB block that request by HDMI 2.1 specification.
>
>Please spell out what that thing is and why it exists.
>
>>=20
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/drm_connector.c |  5 ++-
>>  drivers/gpu/drm/drm_edid.c      | 76 ++++++++++++++++++++++++++++++---
>>  include/drm/drm_edid.h          |  2 +
>>  3 files changed, 77 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_connector.c=20
>> b/drivers/gpu/drm/drm_connector.c index a50c82bc2b2f..0f9e3ef00be7=20
>> 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -2137,8 +2137,11 @@ int drm_connector_update_edid_property(struct drm=
_connector *connector,
>>  	if (connector->override_edid)
>>  		return 0;
>> =20
>> -	if (edid)
>> +	if (edid) {
>>  		size =3D EDID_LENGTH * (1 + edid->extensions);
>> +		if (drm_edid_is_hf_eeodb_blk_available(edid))
>> +			size =3D EDID_LENGTH * (1 + drm_edid_read_hf_eeodb_blk_size(edid));
>
>I think we just want a small helper function that gives us the number of e=
xt blocks whether it be from the base block or from this thing.
>
>> +	}
>> =20
>>  	/* Set the display info, using edid if available, otherwise
>>  	 * resetting the values to defaults. This duplicates the work diff=20
>> --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c index=20
>> 19426f28b411..056e735ef932 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1991,7 +1991,7 @@ struct edid *drm_do_get_edid(struct drm_connector =
*connector,
>>  	void *data)
>>  {
>>  	int i, j =3D 0, valid_extensions =3D 0;
>> -	u8 *edid, *new;
>> +	u8 *edid, *new, ext_eeodb_blk_size;
>>  	struct edid *override;
>> =20
>>  	override =3D drm_get_override_edid(connector); @@ -2051,7 +2051,40 @@=
=20
>> struct edid *drm_do_get_edid(struct drm_connector *connector,
>>  		}
>> =20
>>  		kfree(edid);
>> +		return (struct edid *)new;
>> +	}
>> +
>> +	if (drm_edid_is_hf_eeodb_blk_available((struct edid *)edid)) {
>> +		ext_eeodb_blk_size =3D drm_edid_read_hf_eeodb_blk_size((struct edid=20
>> +*)edid);
>> +
>> +		// no more ext blk wait for read
>> +		if (ext_eeodb_blk_size <=3D 1)
>> +			return (struct edid *)edid;
>> +
>> +		new =3D krealloc(edid, (ext_eeodb_blk_size + 1) * EDID_LENGTH, GFP_KE=
RNEL);
>> +		if (!new)
>> +			goto out;
>>  		edid =3D new;
>> +
>> +		valid_extensions =3D ext_eeodb_blk_size - 1;
>> +		for (j =3D 2; j <=3D ext_eeodb_blk_size; j++) {
>> +			u8 *block =3D edid + j * EDID_LENGTH;
>> +
>> +			for (i =3D 0; i < 4; i++) {
>> +				if (get_edid_block(data, block, j, EDID_LENGTH))
>> +					goto out;
>> +				if (drm_edid_block_valid(block, j, false, NULL))
>> +					break;
>> +			}
>> +
>> +			if (i =3D=3D 4)
>> +				valid_extensions--;
>> +		}
>> +
>> +		if (valid_extensions !=3D ext_eeodb_blk_size - 1) {
>> +			DRM_ERROR("Not able to retrieve proper EDID contain HF-EEODB data.\n=
");
>> +			goto out;
>> +		}
>>  	}
>> =20
>>  	return (struct edid *)edid;
>> @@ -3315,15 +3348,17 @@ add_detailed_modes(struct drm_connector *connect=
or, struct edid *edid,
>>  #define VIDEO_BLOCK     0x02
>>  #define VENDOR_BLOCK    0x03
>>  #define SPEAKER_BLOCK	0x04
>> -#define HDR_STATIC_METADATA_BLOCK	0x6
>> -#define USE_EXTENDED_TAG 0x07
>> -#define EXT_VIDEO_CAPABILITY_BLOCK 0x00
>> +#define EXT_VIDEO_CAPABILITY_BLOCK	0x00
>> +#define HDR_STATIC_METADATA_BLOCK	0x06
>> +#define USE_EXTENDED_TAG		0x07
>>  #define EXT_VIDEO_DATA_BLOCK_420	0x0E
>> -#define EXT_VIDEO_CAP_BLOCK_Y420CMDB 0x0F
>> +#define EXT_VIDEO_CAP_BLOCK_Y420CMDB	0x0F
>> +#define EXT_VIDEO_HF_EEODB_DATA_BLOCK	0x78
>>  #define EDID_BASIC_AUDIO	(1 << 6)
>>  #define EDID_CEA_YCRCB444	(1 << 5)
>>  #define EDID_CEA_YCRCB422	(1 << 4)
>>  #define EDID_CEA_VCDB_QS	(1 << 6)
>> +#define HF_EEODB_LENGTH		2
>> =20
>>  /*
>>   * Search EDID for CEA extension block.
>> @@ -4273,6 +4308,37 @@ static bool cea_db_is_y420vdb(const u8 *db)
>>  	return true;
>>  }
>> =20
>> +static bool cea_db_is_hdmi_forum_eeodb(const u8 *db) {
>> +	if (cea_db_tag(db) !=3D USE_EXTENDED_TAG)
>> +		return false;
>> +
>> +	if (cea_db_payload_len(db) !=3D HF_EEODB_LENGTH)
>
>We don't have any defines for the length of other blocks. Don't see why th=
is one should be different.
>
>Also, the spec says
>"The Sources that are compliant to This Specification will not  be adverse=
ly affected by the presence of the additional bytes within  the Length fiel=
d range."
>

Below is what I got from spec. That's why I added definition and check its =
value in block header.
".	Length	[5 bits]  Total length of data block, not including this byte. Fo=
r this Data Block, Sinks that follow This Specification shall set the Lengt=
h field to 2."
                                                                           =
                                                                   =20
>> +		return false;
>> +
>> +	if (cea_db_extended_tag(db) !=3D EXT_VIDEO_HF_EEODB_DATA_BLOCK)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +bool drm_edid_is_hf_eeodb_blk_available(const struct edid *edid) {
>> +	const u8 *eeodb_header =3D (u8 *)edid + EDID_LENGTH + 4;
>> +
>> +	if (!edid->extensions)
>> +		return false;
>> +
>> +	return cea_db_is_hdmi_forum_eeodb(eeodb_header);
>> +}
>> +EXPORT_SYMBOL_GPL(drm_edid_is_hf_eeodb_blk_available);
>> +
>> +u8 drm_edid_read_hf_eeodb_blk_size(const struct edid *edid) {
>> +	return ((u8 *)edid)[EDID_LENGTH + 6];
>
>Not a big fan of these hardcoded offsets and stuff. Seems too easy to scre=
w up.
>

My opinion to add cea_db_is_hdmi_forum_eeodb() here to make sure it is EEOD=
B. If so, then allow this function return [EDID_LENGTH + 6] byte value.
Please let me know if any other comments. Thanks!

Best regards,
Shawn

>> +}
>> +EXPORT_SYMBOL_GPL(drm_edid_read_hf_eeodb_blk_size);
>> +
>>  #define for_each_cea_db(cea, i, start, end) \
>>  	for ((i) =3D (start); (i) < (end) && (i) +=20
>> cea_db_payload_len(&(cea)[(i)]) < (end); (i) +=3D=20
>> cea_db_payload_len(&(cea)[(i)]) + 1)
>> =20
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h index=20
>> 144c495b99c4..22872d9731a8 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -593,5 +593,7 @@ drm_display_mode_from_cea_vic(struct drm_device=20
>> *dev,  const u8 *drm_find_edid_extension(const struct edid *edid,
>>  				  int ext_id, int *ext_index);
>> =20
>> +bool drm_edid_is_hf_eeodb_blk_available(const struct edid *edid);
>> +u8 drm_edid_read_hf_eeodb_blk_size(const struct edid *edid);
>> =20
>>  #endif /* __DRM_EDID_H__ */
>> --
>> 2.17.1
>
>--
>Ville Syrj=E4l=E4
>Intel
>
