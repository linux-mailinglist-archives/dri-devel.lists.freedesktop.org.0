Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389919B724
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 21:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A479C6ED25;
	Fri, 23 Aug 2019 19:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780059.outbound.protection.outlook.com [40.107.78.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC726ED23;
 Fri, 23 Aug 2019 19:38:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4Mh7dV8aGIr67zN+Bc6NpqBnZSX5sUvfGKS+BnanNTj+VJmrFdU7W1PUngGcKVwBmYGOsKZsvaz7XXUI0Tqf3H47LxCnuPn5Oz/GeAzOaEyMuoX3VXP47amcOwaiJvv2TgRWrwBQs20tlATuolgrkjv0eQx/3mVk5Ucpd9DpuEHa5fE/rJ+YRH8g4tMSOYIOj7ctO1fG0SURuIr0yEzq4WDoddWFL7b+q60Rf+w+wC1D+EI7fKMNrMStkDu/aL61WUhCgQ/B2TZd7Vv+nvqYBn1Q5DyE3/CzZIwv8XQ9LSJoZiAV7im0+WP8kreYJtR+Phwj80aGMEtZDyOn/2RNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNeSuMNmlot3xqvqc6lG5k7z7E0LBNAj+XfF4kk5Nbw=;
 b=EtQApTjs1lU9AGcSgeOXIsG1j4S0M/3sW5sXhvO2m/hssj+LKkVWbrJQk0Hmf6QAqH7mTDgxMAcOBKo9qqbvrFkZuzG14kz9e3u2d4CAXErrBFeYia3r2Tz4+YrdiHc4hrLxDojfpxkaru58QycgLiLZoTWwOD3PwTGOzDQQ5BB74SyOBUYjb/SNgQjGwPo891auCG/NEZU9ZV9yFPyp93N+x3lzsjsNuaZ33Pm0InipynBTBUeUKEw0SBJBcG94+9UFq4KGZ1zU0bs3dpgSsYTpvGcAWGFXgHPeG5G69MKkucQoSTwsT4qiyMzY9JiGYYTQXp82XqPvO7YC6L6LqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com (10.172.75.146) by
 CY4PR1201MB0199.namprd12.prod.outlook.com (10.172.78.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 19:37:59 +0000
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::1dca:a430:30e9:2335]) by CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::1dca:a430:30e9:2335%5]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 19:37:59 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>
Subject: Re: [PATCH] drm: Add LTTPR defines for DP 1.4
Thread-Topic: [PATCH] drm: Add LTTPR defines for DP 1.4
Thread-Index: AQHVWTtlZ/MqugNHyEyjQDzi8fC43acI5JUAgAA9eYA=
Date: Fri, 23 Aug 2019 19:37:59 +0000
Message-ID: <20190823193755.yiwxlvdgbsexlihd@outlook.office365.com>
References: <20190822224607.m73g3a2a23zww644@outlook.office365.com>
 <8105f436-91af-3c63-7ada-a5800df43a52@amd.com>
In-Reply-To: <8105f436-91af-3c63-7ada-a5800df43a52@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::20) To CY4PR1201MB0086.namprd12.prod.outlook.com
 (2603:10b6:910:17::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2e22887-7b3c-43da-8b65-08d72801675f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:CY4PR1201MB0199; 
x-ms-traffictypediagnostic: CY4PR1201MB0199:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01997FCD967065BB6B8BCBC698A40@CY4PR1201MB0199.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(6116002)(53936002)(3846002)(66946007)(66616009)(66476007)(66556008)(64756008)(66446008)(71190400001)(446003)(11346002)(25786009)(71200400001)(14444005)(486006)(54906003)(476003)(14454004)(6512007)(256004)(6306002)(9686003)(3716004)(99936001)(1076003)(316002)(4326008)(6506007)(6436002)(386003)(81166006)(53546011)(186003)(81156014)(8676002)(6246003)(102836004)(5660300002)(229853002)(6636002)(305945005)(6486002)(66066001)(86362001)(7736002)(76176011)(478600001)(26005)(99286004)(8936002)(6862004)(2906002)(966005)(52116002)(450100002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0199;
 H:CY4PR1201MB0086.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kM5cFXAhgRjShqzJQDE9zt/pdlltvRrSKYwLl5n2bmQIlvgAKvDeSD5B6MJ8a/dW/iqFuWudWAi1wDpo9boN69L2RNEsn6vCQNni0S+2m8StgldW1iSAH7i9WHfuOOfX8APomUnR44Kd7G+I/fybsF1r0LjGyzQiQjv14T1hL4qP9wVArdMAcOfb/P/QWF/SYHJVz4TvSINnE9Zkhg4JyTDaUR0plGLi6t2ujp8bm+2ymLv8p0XU2n0L3GzZze+CiDxO8Fppemh/uvQyCPfElc+rBhNpeQNXvJsnRhM6jaHJ3CHRzzrx1jwUJJYZgVb44jaBpxyIgaeOzWz2rpR3ICqyCCCG3ocxKe6cLG3gNDiFv4rGJIA9eNVX+QWn5SVqkslVwamgM1n97Of6d1ILBU98x+hUVwEZmpbIpIUnDIo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e22887-7b3c-43da-8b65-08d72801675f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 19:37:59.4425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOJ1gRmI1nh7H3JUyTRS9teFX0VR6yTNBuZ5Wmug3bLqQX20ozHEdf+N2PT1rkSLB2rh6WYsdXv4NJBH+H4z6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNeSuMNmlot3xqvqc6lG5k7z7E0LBNAj+XfF4kk5Nbw=;
 b=NcFZF/CN5flmDZ+4/STf4bgzx2Czp1MDMJfrpYDcV/EQUA04rt7TGyOzqmMh6PZwJpju6b5f06i1y1oTqSnpXUJtjYXrQJqJYIl0LNARSncjvozT5HiWoCtvxDV2bIKSnquX5B30NII7W6xYbDCWxx8Ebp+OUFZsWraWhas453I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Berthe,
 Abdoulaye" <Abdoulaye.Berthe@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2105480782=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2105480782==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sja2kg3yq4wg4ipx"

--sja2kg3yq4wg4ipx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Harry,

Thanks for your feedback, I'll prepare a V2.

On 08/23, Wentland, Harry wrote:
> On 2019-08-22 6:46 p.m., Siqueira, Rodrigo wrote:
> > DP 1.4 specification defines Link Training Tunable PHY Repeater (LTTPR)
> > which is required to add support for systems with Thunderbolt or other
> > repeater devices.
> >=20
> > Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> > ---
> >  include/drm/drm_dp_helper.h | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >=20
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 8364502f92cf..8336d960da7f 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -134,6 +134,32 @@
> >  #define DP_SUPPORTED_LINK_RATES		    0x010 /* eDP 1.4 */
> >  # define DP_MAX_SUPPORTED_RATES		     8	    /* 16-bit little-endian */
> > =20
> > +/** Link Training (LT)-tunable Physical Repeaters - DP 1.4 **/
> > +#define DP_LTTPR_REV                                  0xf0000
> > +#define DP_LTTPR_MAX_LINK_RATE                        0xf0001
> > +#define DP_LTTPR_REPEATER_CNT                         0xf0002
> > +#define DP_LTTPR_REPEATER_MODE                        0xf0003
> > +#define DP_LTTPR_MAX_LANE_CNT                         0xf0004
> > +#define DP_LTTPR_EXTENDED_WAIT_TIMEOUT                0xf0005
> > +#define DP_LTTPR_TRAINING_PATTERN_SET_REPEATER1       0xf0010
> > +#define DP_LTTPR_TRAINING_LANE0_SET_REPEATER1         0xf0011
> > +#define DP_LTTPR_TRAINING_LANE1_SET_REPEATER1         0xf0012
> > +#define DP_LTTPR_TRAINING_LANE2_SET_REPEATER1         0xf0013
> > +#define DP_LTTPR_TRAINING_LANE3_SET_REPEATER1         0xf0014
>=20
> Can we align the register naming with the spec and to align with the
> rest of this file?
>=20
> The seem to take the form of DP_<name-from-spec>
>=20
> E.g. call this one DP_TRAINING_LANE3_SET_PHY_REPEATER1
>=20
> Same for all other registers.
>=20
> Keeping the naming consistent makes it easier to search.
>=20
> > +#define DP_LTTPR_TRAINING_AUX_RD_INTERVAL_REPEATER1   0xf0020
> > +#define DP_LTTPR_TRANSMITTER_CAPABILITY_REPEATER1     0xf0021
> > +#define DP_LTTPR_LANE0_1_STATUS_REPEATER1             0xf0030
> > +#define DP_LTTPR_LANE2_3_STATUS_REPEATER1             0xf0031
> > +#define DP_LTTPR_LANE_ALIGN_STATUS_UPDATED_REPEATER1  0xf0032
> > +#define DP_LTTPR_ADJUST_REQUEST_LANE0_1_REPEATER1     0xf0033
> > +#define DP_LTTPR_ADJUST_REQUEST_LANE2_3_REPEATER1     0xf0034
> > +#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE0_REPEATER1   0xf0035
> > +#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE1_REPEATER1   0xf0037
> > +#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE2_REPEATER1   0xf0039
> > +#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE3_REPEATER1   0xf003b
> > +#define DP_REPEATER_CONFIGURATION_AND_STATUS_OFFSET   0x50
>=20
> With a cursory search I can't seem to find this in the spec. Where is
> this coming from?
>=20
> Harry
>=20
> > +#define DP_LTTPR_FEC_STATUS_REPEATER1                 0xf0290> +
> >  /* Multiple stream transport */
> >  #define DP_FAUX_CAP			    0x020   /* 1.2 */
> >  # define DP_FAUX_CAP_1			    (1 << 0)
> >=20
>=20




--=20
Rodrigo Siqueira
https://siqueira.tech

--sja2kg3yq4wg4ipx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1gQJMACgkQWJzP/com
vP+lrQ//fyXX66ak9HWFSGEuD6SNP4isgeQj0smEZVdzYAiDKYIVTAdOUVdRySbY
Mx0sNqft6DT7mF1CKnExA+WCCLpQNnCFjs8Vtva8d/3izjVtRX5Au+pztx6v1IGL
p8Of5fNKfCdPqIT15qsVxMrFNKSzUOMo3d7L4Lh0iTJqSIlF9t6Fpr96JWLzJDEh
sgrvNaISJzzlpIMOOwNjhuKCdXXAla+4UJitB0UsrwYlZhe0VXpdn7DMqWoy7Dgt
nAumMIJBK+aV0XFjr/dp4BHNzMc7q3muwS5nT41Pw8qdxWap1MFf2LQ/jtzgE0y7
yTwjjCX54olRFnY/EuzOd8kl7MNIzzIBF3nkc932Uvx1OLzz0+uloU44rrNMANGb
LUefgwLska4xBwZPak2Sl5K8EQLEcHBfsMGqizBhCDwUQ/yxFu7PCKhTmqdh9G6Y
9h5pF9wfLRnsKvHriWO23Cr4jBetxL+BN2Ymu89P3NLux1KBxiMOCd41WNH5Vg1V
wFZtkXIjzhUu36el2pJub+Dp6UTcXR8jsxAIKQKhreuy3LRBov3RKmAmb2xtH55r
IWI7nal0pItXCjX2QFJAESrIUugi2cBMgFMm1heDzmTHpbtZzopLnqeHhkNgSqtR
L7P6d1HlhiaL7igTSTEBrEUL6No7SOZqgqE12S1ZPX1xm/JCHgY=
=/cFN
-----END PGP SIGNATURE-----

--sja2kg3yq4wg4ipx--

--===============2105480782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2105480782==--
