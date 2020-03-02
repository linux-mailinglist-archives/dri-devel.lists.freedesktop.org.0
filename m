Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70633175C17
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 14:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A646E415;
	Mon,  2 Mar 2020 13:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4243F89C86;
 Mon,  2 Mar 2020 13:49:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPGXnUEd03rpi8mq8kMHuYC4xGBuXIDY8FwBPNYUrm344BPrjR7Ow+R5B06kGxMm81TP4Q1SVgtBJ6Pdt9kMbsm0ca2dfVlKbLGNRLQwQ2GdAdh3yNQB0Lrxd8IEuI/2Mq45BRiBcgae2MJd1m4732FQR+DOh97QCZiWOHXVQiWgbs7vK3N65rgSgeYuQsgdN0VgXWGDXI3mYVD94IW1QJlraNZvZ894vSG84IkZb2YxsdRP+Bmegl9e0KdFROrgJjvRWJL/j1wAYdgjhzR00DvBQn9pAyfFE/M6W6VNWneH1omHQ1NJD8yk1JH4BemnDROk0WZBPuKyzs5+tep/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8gp/o6Q/RICGDfUNxMWYOlfUJrGj9agDwDRnZLrarc=;
 b=Y0l3Q5N/7tXPCFYGmlb0p1yJeSsHeGfO0MxSCmJ6HI2lspsNUhBCF7tokA5gKhuIpzI1xm36mwuTIlIkK+PseV8jbpFjmvEnvcxYTSWTWVwSkIUAO3pGZ6moxESIulcid+qCTBB1DjSwAzdIV0RL2lLinE2qWYR4k+xLvHUns/X2oXo26UbmYYqnC2rivdZhQruOPZasrG04Z6aKBvqwjNA/N0dlbXNofUT6NL4w880CpftEVnkdQ7lS8y2fJkmT6jMjEIgG9EnFXWGaghxnpVoZuirCkTxMNY5iezTCMJcYxcGM/JqMSyZo0wbzqvUxhOheD6DSyWj+dGp3ed9SeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8gp/o6Q/RICGDfUNxMWYOlfUJrGj9agDwDRnZLrarc=;
 b=Lo3iX1OLOCfMXyLruiT18lZG5/9Ob52vt+/efdxctnU0JA/zWxX9GDXby3QmawL0XEjsLSccBDVhzcaffl7nJc/AKLmCSCSM64e77x+ZYYTypQKu5shnPgKAIrOJBwreIRwmGcS2ScuXeI1dn3QWFUqCjBJavMU02E2oiNAXzeo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (2603:10b6:907:9::27)
 by MW2PR12MB2490.namprd12.prod.outlook.com (2603:10b6:907:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Mon, 2 Mar
 2020 13:49:32 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5%6]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 13:49:32 +0000
Date: Mon, 2 Mar 2020 08:49:28 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v2 0/2] drm/amd/display: dc_link: cleaning up some code
 style issues
Message-ID: <20200302134928.6hmq4sbbiaeb3f6q@outlook.office365.com>
References: <cover.1582907436.git.melissa.srw@gmail.com>
In-Reply-To: <cover.1582907436.git.melissa.srw@gmail.com>
X-ClientProxiedBy: YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::39) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (165.204.55.250) by
 YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15 via Frontend
 Transport; Mon, 2 Mar 2020 13:49:30 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 012e6c96-bac6-4121-ed63-08d7beb088f3
X-MS-TrafficTypeDiagnostic: MW2PR12MB2490:|MW2PR12MB2490:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2490657CBD2C3FFCD249A67798E70@MW2PR12MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 033054F29A
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(54906003)(6916009)(86362001)(4326008)(316002)(52116002)(7696005)(44144004)(8676002)(8936002)(21480400003)(81156014)(81166006)(6506007)(966005)(1076003)(5660300002)(66556008)(66476007)(9686003)(55016002)(66946007)(956004)(16526019)(2906002)(478600001)(26005)(186003)(2700100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2490;
 H:MW2PR12MB2524.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0X3lYUbCSAnt03fhWSLOYkDEMVHs9wzmxTJYsu95azo0Al1AjDen9hpQ2xzkbjzlWQsK3+6jSr9RbnnhXKCu1KsM2S/oRQl5l828gBMbTp2GG+t+XRMC5WlL6QE5YbqG6AVtrJb+Aj7uzE7MymJv2zM1+x9upDsjC0chCrlHhX3Zu9l8ivDDQQL99aC8cg2ZamQdj0DNeD/DxANM1kOQ/VZREf49KMr2DKykRaQxRa4CP5sO3U/T7Mu0i51/8NyaL2vHDy60sOF/UWeaOHxhqToiAEDywf/Bx/tdN37jbHaHRYiopKExsifHI+vfsHRncJVaNRyEEv+ZzqWab7595zJIQaW1Fa0JgOPseorw2LxoHdd4MU3H3NwRv6plI65qm9JFBiJmQzYrOczEVgF+NFep4v1gCLP+FVVG6cvnxn0uVTr4ITVRakxwICZ1Zca/qcq6LCiND6hLkJeMSF/BFc41Ua/49Vbq7SCb968Yv1Dpbrozi8r0a+RiRY6muBY/uPwXG+dc9Nx94Dbw71ZZ0m2TCIWKjPAymEWAYZTNXYvoGFoZn9gXmkiB25JNO2/GPH78ccs4sM/9YxReFJssfz3c/7+l7M7gMUN3YGj9kA09Q37ZhpsdWN9uyA1X3qw5DusSCNqusxvPLjYO19B5Ow==
X-MS-Exchange-AntiSpam-MessageData: 9yAZAs8apDM2FX3d+RXNQbagq4o8d+HzuVVjlMntRTKfsfNxjo6+E2ENVGbsHmMR0ya/eNOERRfxOEE8vt6ZNPC/MxTdhki6VmQHsYeUzArBkiWckdmSmlBz2rA7XqLb2HqBoljCW5OZBIWrIFTwrQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012e6c96-bac6-4121-ed63-08d7beb088f3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2020 13:49:32.1631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBT50aUZSEWDW/dSuyi+CNLQyBn10WzO5RA+kCKexV154MQaKcGT20hmE93eAOFVZ10Sbsi09w/Y0naR4/XvNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2490
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0079139813=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0079139813==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p5r3n5x4juuylipi"
Content-Disposition: inline

--p5r3n5x4juuylipi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Applied!

Thanks

On 02/28, Melissa Wen wrote:
> This patchset solves some coding style issues on dc_link for readability
> and cleaning up warnings. Change suggested by checkpatch.pl.
>=20
> Changes in v2:
> - Apply patches to the right amdgpu repository.
> - Remove unnecessary {} added in the previous version.
>=20
> Melissa Wen (2):
>   drm/amd/display: dc_link: code clean up on enable_link_dp function
>   drm/amd/display: dc_link: code clean up on detect_dp function
>=20
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 64 +++++++++----------
>  1 file changed, 30 insertions(+), 34 deletions(-)
>=20
> --=20
> 2.25.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--p5r3n5x4juuylipi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl5dDuMACgkQWJzP/com
vP+OqRAAmENIUUb4rc8hYif7WJxd/7yCgD6zzs5pWUK+JPD0deoXlkeyWoAinVPr
/RgShcu3ZEhwVV+WVqD+Nrg1Oeh9Fup+V/crxugKLNe3T8XWPfOhGYDZMtywv/O/
wFYnBzRO7y0gNOtz45lhCQXno2YX471Bn/7IF7eLfE2S3KcUPV94AyJjnXuaOx08
tiEC+2vte93sY1/Ef0yHKq9LfjwJoxndPZoy2LQpEQ9NycOvBz1e692PHQ5CcyIQ
VGNb3Et/J1CuPcbLqCYahPfr5QMJJH3To/SGjRSM5Lw2Tut1gpgOsGGbzSYAkJr+
KAoqIDQjSdGWTT+JdBPqXuBh0rZ3rfdgKVHlNGuovQ3j+++JesR/z/c1/nb0It4E
ymYC+KGRkThuNoaIrWoLrmGVDPQjuKoOf37P+Ovoq7psSZHK8h3INJTE1teobHtp
49JhTmIs74Whb/gfui7mkD3Vj0sR+WAeLwiUJmrf9RTpfB5V4CZ7gLzyBip6O0zY
Ltxen1FNMvh2CYCz0rDBQ3XsrgsdAWAiApF9g9yazNiS8LbdZo73I+3oHVyGaZly
1GAV9ACJCdsIcLhWZgD14uCt3Kq4UlW9aLqzrgMlWKWcj8LheqW4E0KWWAgIsIkP
2dKbaNU/3pjhyiFOt1L5L7L9PrkumuNNaoTq/WHbkQHpRhLSGv4=
=5QDp
-----END PGP SIGNATURE-----

--p5r3n5x4juuylipi--

--===============0079139813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0079139813==--
