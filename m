Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE80DF1AA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 17:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5669E89F63;
	Mon, 21 Oct 2019 15:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800051.outbound.protection.outlook.com [40.107.80.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD8189E1B;
 Mon, 21 Oct 2019 15:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxFaZHbMC90CstmciEZf3trQm4ZmmdloAL/HWTrmFfvrSdit7uR6T/NvvUUdi97ofOMpyM4Aiuk0SZcwLiunpW/t6I/RXz8M7NBsAig+oU3/Z13eN9ZV0Cq9Rb0DBQCuCr5cSTjfF3fXimdkyAkDXYlLckhF0wKC8iZwMGRqujph4d8wrSwKxRueEbS7mFu92uQLL/zSs45RHkj2MNHTgIbn/S7c5Ip0iDTn3nVFJO4GvlQmFukeyRFTo7V7lD6WPjUUZKazo55+7Rj/p2a4kTPVrf+YWRgFrg8O1Igveaq1mFCgu2yP/GvIfDns80YUjx/CK+aIllyW8Mug+01mrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB4kB0h6Q/Htk17ng9863atTIxagd5sf9KyLxae2mSI=;
 b=oNCg3/nzNGj3O16kXk9blNUnmBYAcq7rRsaBgpBKMmGJDpG6XgbOQBPU6TXdFXSg2ZxXDXAgaMTz11I/YN/gR5vv8G83H5yWBnXz5Our634gKKRVM0I2xxYs6VHB27HG8w80Q6HvG85hk3mpkEDWrTu0yiKu8eyEgVIY2AcVaT2GQtwdvVlxOuoiFEMR21+JMgLzDJyhC3MCAloryJEC3+OaSb+NrK0E3djp4TBXxkMDr7J4xt90bRXH5IXCYawYvLqAtR9rMKnDGi3pF4F97YynrXQymgxqw4UIGic8W3rqkWQhuXF1Z+oMfdZf8JOR2iFill4krkODwZgiN0z2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2551.namprd12.prod.outlook.com (10.172.120.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Mon, 21 Oct 2019 15:35:36 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 15:35:36 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Cornij, Nikola"
 <Nikola.Cornij@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, Manasi
 Navare <manasi.d.navare@intel.com>, =?Windows-1252?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH] drm: Fix DSC throughput mode 0 mask definition
Thread-Topic: [PATCH] drm: Fix DSC throughput mode 0 mask definition
Thread-Index: AQHViCDBGBjd4qRZ6EarWeAe3wdSv6dlOhSA
Date: Mon, 21 Oct 2019 15:35:36 +0000
Message-ID: <584f5292-c177-34d8-8e2f-0e6661a87f23@amd.com>
References: <20191021150345.igdye4kv35nsk4ox@outlook.office365.com>
In-Reply-To: <20191021150345.igdye4kv35nsk4ox@outlook.office365.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
x-clientproxiedby: YTBPR01CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::48) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84934dda-0919-447e-f0b4-08d7563c516c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB2551:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB255118841C09C251537544768C690@CY4PR1201MB2551.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(199004)(189003)(7736002)(54906003)(8676002)(5660300002)(6116002)(229853002)(2906002)(6246003)(305945005)(110136005)(66574012)(25786009)(6436002)(6486002)(36756003)(4326008)(256004)(14444005)(6512007)(99936001)(3846002)(186003)(31696002)(52116002)(14454004)(4001150100001)(99286004)(8936002)(81156014)(66476007)(476003)(486006)(478600001)(31686004)(102836004)(66066001)(65806001)(65956001)(316002)(66446008)(64756008)(26005)(71190400001)(71200400001)(58126008)(76176011)(53546011)(2616005)(11346002)(446003)(66616009)(386003)(66946007)(66556008)(81166006)(6506007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2551;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iMdJ8YrFTTN6V1C5HKr+wHc9DxwHbokCIRBIm64zkF7LfE39wUPwNlY4R97+5B2we5dEQRt3kHCglyQmaFnwUZAAczCJG4DkzST3dHT8FIek9ckixbtG5QXoiX8kwzEu5pgfrmqrbE2km+rsrznpWL3pqMtkEoCwheZIk4lMFKPfhHw8nG9Dnf8PRyBe8GDWUGGd/b5tEL1cYyPsTjhh6L0GvNKUvvutIA63sh1QCPzkaccW3Nj9SXmZkeUP3S/ZS4Q5dDS6nfs0Wkav9I+qym7wUsBnPBF6YMAewPoQ1vB05r38UE5KteB1LmI52izWgk85ruiy4MqimqIHITjZAOZt6sw4oT7IQTvstp10D+SBbdFWhJGCse1inId+7Hl0rn21A7JfcrsRyWaougZJrm87GUwyXzae/DlXIZRvZZaEUXGJWf/rhTBwDGVDoB2B
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84934dda-0919-447e-f0b4-08d7563c516c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 15:35:36.3083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uQSwjzs7v6ooWwhsyno76jJvIiUUOV7TBHpX+X6rbBQt5QmiGbXvlzz9mXFpfnVvS7tdv3c84y7xXKlIWlgDIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2551
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB4kB0h6Q/Htk17ng9863atTIxagd5sf9KyLxae2mSI=;
 b=WIUS1x3gyCFwFB5inXKKeJUbW9Z71MsEPO8bKYlDItfU3J6ryjN4DjIW4+MzTbKr+z7xX/Vl9jcj/VcpxBmGTZjNJgts3JejNL2MEwI5E87WXGLHihltxw/K6saPyPSJPcQ8oa3FaylFUh0GdipkYTH6sOxoxkHGDTkbLzzd0p0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0963015581=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0963015581==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5AEnsr0KGpggiNbzF6C8RpBBDmYFBFOo5"

--5AEnsr0KGpggiNbzF6C8RpBBDmYFBFOo5
Content-Type: multipart/mixed; boundary="nJMgTaE3fRVCldVSrzx3nOVyfe3neO6fn"

--nJMgTaE3fRVCldVSrzx3nOVyfe3neO6fn
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2019-10-21 11:03 a.m., Siqueira, Rodrigo wrote:
> Commit d7cd0e05 introduced a change at DP_DSC_THROUGHPUT_MODE_0_170
> which is not aligned with the spec. This commit replace 15 << 4 by
> 15 << 0 for DP_DSC_THROUGHPUT_MODE_0_170 in order to make it follow the=

> specification.
>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Nikola Cornij <nikola.cornij@amd.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Fixes: d7cd0e053b1 (drm/amd/display: Add 170Mpix/sec DSC throughput sup=
port)
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  include/drm/drm_dp_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index cfadeeef8492..52024049c59e 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -306,7 +306,7 @@
>  # define DP_DSC_THROUGHPUT_MODE_0_900       (12 << 0)
>  # define DP_DSC_THROUGHPUT_MODE_0_950       (13 << 0)
>  # define DP_DSC_THROUGHPUT_MODE_0_1000      (14 << 0)
> -# define DP_DSC_THROUGHPUT_MODE_0_170       (15 << 4)
> +# define DP_DSC_THROUGHPUT_MODE_0_170       (15 << 0) /* 1.4a */
>  # define DP_DSC_THROUGHPUT_MODE_1_MASK      (0xf << 4)
>  # define DP_DSC_THROUGHPUT_MODE_1_SHIFT     4
>  # define DP_DSC_THROUGHPUT_MODE_1_UPSUPPORTED 0
>=20


--nJMgTaE3fRVCldVSrzx3nOVyfe3neO6fn--

--5AEnsr0KGpggiNbzF6C8RpBBDmYFBFOo5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkiEcMSFhcOGNLtE6LVgVyYwUtuMFAl2t0EUACgkQLVgVyYwU
tuON8gf+Mgje6g3E0+fTAj/6T//tK+k2y7tTD/Tast/oj4gw5ZKZzprYVwXqHfGe
AeJfwbwFtfGjFt21RU62DxwrgK9jDq8LapcNZLYE2ox3AjHGWL+mImXBCKS1gKmY
YlWSt29xA1RI7RD1y3Lo4xSMsstFbpNMP5063sRM5x7J4qUyZSuzTcPVGyYYit5G
VQ+Ofd8Vvb84ILbjD5s4eQik2w3C31TLBlMrDnVsr6Ui01pysx/ZsQgUSReIxI2C
jAIWDhlG8eKIpsP3Xx+BDpZwAST5n6nD8PLVDHfUcKG3xqkkMeYc7QVvbjEGnf+w
UkFpcP9KCK8hvRfh+XS+4AxVUJcCNg==
=BQvT
-----END PGP SIGNATURE-----

--5AEnsr0KGpggiNbzF6C8RpBBDmYFBFOo5--

--===============0963015581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0963015581==--
