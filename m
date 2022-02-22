Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC4E4BF40E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7127110E410;
	Tue, 22 Feb 2022 08:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA0310E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645519746; x=1677055746;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=u0Ul7Q66HyKgeei9fSlY6o5bPkA1oKzxfs4VmaNdxk8=;
 b=Lr7pjOc7whkaiTQq4NcMaHhMTapRtZgxYS6oH877cpe0K1nx0DnMdy4J
 lTAL88Y4OEwIPV7noOg/NhUQMT4coHTk5P8/14/9xQpPed7QnekaZg6oe
 tyCsKxkaE7+aJKdOePHN7BQFHUzSXA2GhUeb1K3y9M+KCfXagwD0TMfid
 M81MdX2fzfboMlV7dd/r3NIYFx0LW/bEXEsiDwe0JjPeaOKypOoH1D8Qu
 I1gOEkzX/Y6xpsmd10qBBZMkFNVlTfnkVH5uf8RvFZDbXU2tZrIHbXt3E
 yQXG7/ANq8JmFGUqmrsnWHLD1i6MWLQEpuPE60YGIhghxm89Jr6+e8y3X g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="239060868"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="239060868"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 00:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="532143180"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 22 Feb 2022 00:49:05 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 00:49:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 00:49:04 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 00:49:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4cdRLUADtbapqMUNMePLwYv7l/wHaqfn5d+Si0zKt490n/L5qhD4pHjFJeFToWgjvncSy5BEUpmE2PJyquCrYX4ziOeDbv04LHPJejqQIyvX8DNiQPPOZdaWxLMsDbE5bDrwbNX1Tb9Rk2IfUaITjzP1ijg9uQ4wmL9Up854NWFfdvCtyi12kSqRe0p14t+QNaFqhhlYxU7gjnNn8HS/BtVsWKfP572asptPHTLPd/NRVeIAw/cF7M4J8D61/PhgnH6yXTwoIyBNj9vRti/5UmvI2PkA1EZdVLetZXaJVp5k3RXIQPFgp19FwW080Bv3ttuSMGNbt329GVvSRn7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVgIXRGmc3LXKgczNj829Mq91pXBHpYC8xle7fSLn0c=;
 b=RRX8HU97zYFuc4pRbV1XG7bn3l754bzwhMrrYFWH0rRnEO0MS9uo68dqfQ7qibSWU1Fe6KGPp8eZRU1UH9+icsLo3lYxrbVqeAL4nXiLy1xrQAQ2SUSGJKbtfNPJHPqCxviH4COpAu3U91EFlN304bhQc3MgdD6CLEyxiN7JIaS7EZ8XDSCFtInSRWOT10HbyOqpq5C0E0EOybpNIkquc4cg82iOZ8S5G35px9jJJMSr/fiOClOJpcIWNoV573e+KoovFu7YEjVVOIRYMP6KhrsNhsG8rFCT18CNdkqLC3BZC/cWwuRvJWCVxXJ58PpA+cetFOI5x5XPBi1+JOG6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2710.namprd11.prod.outlook.com (2603:10b6:a02:c7::24)
 by MN2PR11MB4142.namprd11.prod.outlook.com (2603:10b6:208:135::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 08:49:02 +0000
Received: from BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22]) by BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22%7]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 08:49:02 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH 1/3] drm/edid: parse multiple CEA extension block
Thread-Topic: [PATCH 1/3] drm/edid: parse multiple CEA extension block
Thread-Index: AQHYJ7UXvVsfpogWeU6/GAuCl1AejqyfLAgAgAAN1/A=
Date: Tue, 22 Feb 2022 08:49:02 +0000
Message-ID: <BYAPR11MB2710855870B692B581F8C201A33B9@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <20220222063819.5279-1-shawn.c.lee@intel.com>
 <YhSQgtQp7Ou2WqNB@intel.com>
In-Reply-To: <YhSQgtQp7Ou2WqNB@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92e91d97-a184-4981-6940-08d9f5e02cca
x-ms-traffictypediagnostic: MN2PR11MB4142:EE_
x-microsoft-antispam-prvs: <MN2PR11MB41421BC4AC5A3DEAA326C4B6A33B9@MN2PR11MB4142.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QT2ytud56LAbEmLK2K1tv58i8yEtRw8CoGfa3EFtoAPIU+3flAzgx6GubftvTzVYP0kWXDsBHjMzOZTFC3PlrdWNs4OJrgnHDIneKJ5ODrVdZr0xA/QorBvuBFF6JHX61RlcvnN7tu4M7vZ5eeprvI5dQzInDxyDKP1uUt1qcNI8fG7d46i0Kmevn7442Xdm52+GncClHzjQxHAEEEsRKBtqtypOh6uU7e4uwKgIT8M+FvUXXRdceM0iRtH/hR46SpxfpXiCmeMUk8bo27rR8IVpzPhl0zi5v7nUugA3IQGFlZfNRUpIoXRASnY3/+N/64rCuu2OWtVvVUgdX2fbPJV7zHzHbIK5wOnSs7HJVlp06aMEo8b0Efry+aZdaFTJxBh9zKGoHVSuJQfE9vsC7ZWzC1Pa/xvkBKp37dCsVePiAmGYGryJEjv8tqsm0kKVVDgVIKEg3hkU2ho0AIO6gUaQUurR9vhnsoW3C1vXfXrCjgllT62JsgkJ61pwOBL59akN59yaO1xziPmRHH0LhKjRvUwRnWRXQhjauIfILFM4WGR9/g1czHsRxy1CU6py/HLfwLzcyysta0jKJgXdK42Q9DeGuXNdpqmYMWFrnMF7a8JafXF9IT4ZR+arlflx9jRITqACYP/xLJYAe7C8KEPSsiKWKWICDNxBCyAvvGE0spYXpyfIjhWo4OJXNp2Re9KPALXNy9ykLJVGG5LwQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2710.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(55016003)(4326008)(8676002)(316002)(33656002)(6916009)(86362001)(122000001)(66556008)(66446008)(66476007)(54906003)(76116006)(66946007)(71200400001)(64756008)(66574015)(83380400001)(508600001)(5660300002)(55236004)(9686003)(7696005)(6506007)(52536014)(2906002)(38070700005)(38100700002)(8936002)(82960400001)(8796002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZpQE3K0AZA3B3aw9iKkjGOlIYxm2SqAlAijdZeHNYKlLEkMIjNPSukbL0M?=
 =?iso-8859-1?Q?2p1ExNO28Ivtm//l55m4uri4On7/x0/XYDJlhIgSuVb5NhfiaD/Cwo688T?=
 =?iso-8859-1?Q?IOq/t56vZtSHKk3JaYrzGrh49Q3jn5kfv9cg8jK2d1l2ASoYZyy8bfUYkW?=
 =?iso-8859-1?Q?VgmB/Ulc6uOam/g2lFx/SUuayVQLKLShRxBe25ql3esPbo7cqmLFtncGP7?=
 =?iso-8859-1?Q?uY5PnQPIx3c7SLvgOgfwWIy4jhyWrHgi1iqdqQp03iZzz7/ABiFRlaH/OO?=
 =?iso-8859-1?Q?sZ7pDyrm9AHz+QAHnMHVJEEABuqpnPW8EReHx7MlHHONDEVQrOK5N/RfYr?=
 =?iso-8859-1?Q?vt1WkpvSGQgISgXg7B3nr/mdRTu35Ydfr+0hE0WqkaqiomGTpyabaqgQzh?=
 =?iso-8859-1?Q?xUhlpsQ7e/roT8AosoaN6s/G5dqCKYi29WcfWtDazgbUzMNN2Wu/+H8RXf?=
 =?iso-8859-1?Q?OI8u/qLvJgRzRSpnlHN8HWy2u2DChQ/cNxmacTgSDw6yDq0G8ARaURmvF6?=
 =?iso-8859-1?Q?0jX662oVgpmHO2N6JWwVgE8g8zWdeGHyTKgR/VUHUwnSGbMg/dACOfjjMO?=
 =?iso-8859-1?Q?15zp0cNH1PTfnkt1C4MhiJvQtuFk6RXKPndFCMAJgm/C/fZQYh1S/ZXboL?=
 =?iso-8859-1?Q?sP2X4nj9+02osqQRXgkS+jvpnG4RwDn8EOC42645/OIAkFsHTU5rV2pZF4?=
 =?iso-8859-1?Q?ck/2P5o4Q7kyJZQHuBJ1p8H5uNCB2Xule4U+03mOyrj/Ok2kqUxnISoKau?=
 =?iso-8859-1?Q?URo8vaUbKBJbrYBgI0uJ4M9KETPWzPPmBAw31/JlJJ76dUgWpD+SqzFq2o?=
 =?iso-8859-1?Q?Uwcgt/y9DqN52ugt+m/e80eDB3Bt0A40zPWPBhFu8Vb8e29elX3zCLxtG5?=
 =?iso-8859-1?Q?LLPuodtBMzP46SWjTEEA9fVY9CBfxExXI1a+J0BRLpJmpAJAPm4KShGz17?=
 =?iso-8859-1?Q?a3sp9sNeY68jAwxWxg4rWmzYNLca+crkOSzK5ACmiTZZRc1es29oWX7VoY?=
 =?iso-8859-1?Q?K5NjskJVJftgAr3vGwCtRlVo5Z1V5vpocOrrf9Hy3JmcQDvwYulCztYXK1?=
 =?iso-8859-1?Q?0a+NiylbmheCdnO4Gobb92XHwxICsg19/VQLTk8KAk0ku/8JfDt5FEPxME?=
 =?iso-8859-1?Q?BurvnWxh6J/u8nQyWLEXoRu/gMVNBwM8QdT7Eljl6E5E9kGUOeNOp/NdYN?=
 =?iso-8859-1?Q?3KluAITeW/4JrSwIQ/cDDks38JWoClDSVqYFkZLHD+ebAewcyEVIF1nmGR?=
 =?iso-8859-1?Q?cn9/qAwy0O9hq+hkyYakExVz9cAcox2T9so7zJ1iRYbaMjCvlNn9Uo79X2?=
 =?iso-8859-1?Q?K6GoTojbTYpHRddtBXl2fRAuoklwLAu6ylMRaCn8koluh9NgpXJHt502Iw?=
 =?iso-8859-1?Q?6ZhQVTOgHabDgSQ77oh1NABv25P7KwvZhmXjO+T4KUA1QPs+QeDBjY53SA?=
 =?iso-8859-1?Q?AAvgo0GjJd1eOof3SO1CksKIlDpptBgyydBqSeVZo/Pg764jEAyJsMFJnB?=
 =?iso-8859-1?Q?v3FKLztJNIbtF8cMaJyMzrYK44qI30giUeFf0LNbVMvBKZz8ZKPeIUWTQQ?=
 =?iso-8859-1?Q?G8oKFf5Zhd92VhI606CoaT61H0go3tWmS/1UM1rA6ED34RSZeX9AfAg3Ij?=
 =?iso-8859-1?Q?wTFt4+kI7CBxwX/i5LfU/2atQBgkTbwiAl7hCJgAVwCJZrpD1MdzGPtQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e91d97-a184-4981-6940-08d9f5e02cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 08:49:02.1484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: poA7c6tIpk40QsvK9Wac//N2X6t/f1UQ71iIqrqG6yBCaVybtNGg0ejWBSnoObS+HFrzgkEDzabLf4g5HtnDAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4142
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
Reply-To: "20220222063819.5279-1-shawn.c.lee@intel.com"
 <20220222063819.5279-1-shawn.c.lee@intel.com>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 03:28:17PM +0800, Ville Syrj=E4l=E4 <ville.syrjala@=
linux.intel.com> wrote:
>On Tue, Feb 22, 2022 at 02:38:17PM +0800, Lee Shawn C wrote:
>> Try to find and parse more CEA ext blocks if edid->extensions is=20
>> greater than one.
>>=20
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 75=20
>> +++++++++++++++++++++++---------------
>>  1 file changed, 45 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
>> index 12893e7be89b..3d5dbbeca7f9 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -4313,43 +4313,58 @@ add_cea_modes(struct drm_connector *connector, s=
truct edid *edid)
>>  	const u8 *cea =3D drm_find_cea_extension(edid);
>>  	const u8 *db, *hdmi =3D NULL, *video =3D NULL;
>>  	u8 dbl, hdmi_len, video_len =3D 0;
>> -	int modes =3D 0;
>> +	int modes =3D 0, j;
>> =20
>> -	if (cea && cea_revision(cea) >=3D 3) {
>> -		int i, start, end;
>> +	if (!cea)
>> +		return 0;
>> =20
>> -		if (cea_db_offsets(cea, &start, &end))
>> -			return 0;
>> +	for (j =3D (cea - (u8 *)edid) / EDID_LENGTH; j <=3D edid->extensions;)=
 {
>
>That looks rather illegible. I think we want a drm_find_cea_extension(cons=
t struct edid *edid, int *ext_index) and then just loop until it stops givi=
ng us stuff.
>

I will modify drm_find_cea_extension() to find out next CEA from *ext_index=
.

>There are also several other callers of drm_find_cea_extension().
>Why don't they require the same treatment?

My suspicion is the original design judge edid->extension would be zero or =
one. And only one extension block would available.

Best regards,
Shawn

>
>> +		if (cea && cea_revision(cea) >=3D 3) {
>> +			int i, start, end;
>> =20
>> -		for_each_cea_db(cea, i, start, end) {
>> -			db =3D &cea[i];
>> -			dbl =3D cea_db_payload_len(db);
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
>> +			modes +=3D do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
>> +						    video_len);
>> +			hdmi  =3D NULL;
>> +			video =3D NULL;
>> +			hdmi_len =3D 0;
>> +			video_len =3D 0;
>> +		}
>> +
>> +		/* move to next CEA extension block */
>> +		cea =3D drm_find_edid_extension(edid, CEA_EXT, &j);
>> +		if (!cea)
>> +			break;
>> +	}
>> =20
>>  	return modes;
>>  }
>> --
>> 2.17.1
>
>--
>Ville Syrj=E4l=E4
>Intel
>
