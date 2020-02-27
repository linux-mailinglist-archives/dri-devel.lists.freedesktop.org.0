Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2D11721CB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 16:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419116ECD0;
	Thu, 27 Feb 2020 15:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234B36ECD0;
 Thu, 27 Feb 2020 15:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebkdiXGN2NfkhFbdXIEbM3WXAQ41EJePOYXxSFWzs0V6eaIUe0FLRKGwBUd1qfLUmGgA1ZU/U4Zyiej3pIoG2VbII540qklWZTs9EXG4uYlZ5gwMe1espGXwPHZfL5+WdBKYhyPMp2bKzo/8yNH63qkk83rz6RNh/1wfVHVK0hMiZPTz30zcIpIiEZDG8FK0fWL+IXEdRnUyzk6QRINcEMclivbGPs3NWMMLINHZuPu0knln+r6eLClqtdQPzdMXmUeZSo+HzYCxJ2kQxa+ihTWNlyFI0FvogNdEzr6pCPfwKxNCcXCnNiHP76n08E2mD6DeeaE06mJvkET6bq28yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dpu0tdSF473LIBlJShHutnP0/bdNjxGp+FozVEx2B/w=;
 b=c+h/kxnI4JTR/lwzLhLlnWFydYIisMmLXj/IN6zLhIIHtKSW+SW6xBABCZSj+omG90ooES5ojDkOi8yTSnpTGUdmZUVhXuIrvf0t8/gE/0BZsnERe4txkx0A6KwJgPLWdFHLHTWxUCnFgp55WyzXZm0RBI6oI0JWDK7dylfKgTCSjcaYTr6uYU3yyFbarSHWjUwI6o0lbhgPIDut/byjkc+Z1gdfVUEo//OBTB7hgzhQcA5wDmFPAkmiy35O6Tg4NIkdUQoXwBHyA5v6wyJvDt3qaTg1jTQDfj4finQk3p2hv7gyYQoqDO0tDoZbxWxfwfLFE73bMKpMi+oZLZOMtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dpu0tdSF473LIBlJShHutnP0/bdNjxGp+FozVEx2B/w=;
 b=t2N/PT52QtDHfH9Maa0ht1sx/mjHIa2sWw0wnwd4EYvQXBURPx0Z6GzTGJRwk1tnmB3ShFP5xox7e6rAwzDqRoNf4j9NdvcX08D4vpHBlO+AKWBVZS7xQenI3pSwOulGdY/Lp8ZfhSgJhplf6FJHRKXzX6tuK7+2QxC405O6xSQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (2603:10b6:907:9::27)
 by MW2PR12MB2537.namprd12.prod.outlook.com (2603:10b6:907:6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Thu, 27 Feb
 2020 15:05:22 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5%6]) with mapi id 15.20.2750.021; Thu, 27 Feb 2020
 15:05:22 +0000
Date: Thu, 27 Feb 2020 10:05:18 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH 0/2] drm/amd/display: dc_link: cleaning up some code
 style issues
Message-ID: <20200227150518.tchch32d4lcjripr@outlook.office365.com>
References: <cover.1582752490.git.melissa.srw@gmail.com>
In-Reply-To: <cover.1582752490.git.melissa.srw@gmail.com>
X-ClientProxiedBy: YTOPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::19) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (165.204.55.250) by
 YTOPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend
 Transport; Thu, 27 Feb 2020 15:05:20 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f31d48a6-96b4-4b67-21a6-08d7bb967747
X-MS-TrafficTypeDiagnostic: MW2PR12MB2537:|MW2PR12MB2537:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB25370375EEFDABAAB99F940898EB0@MW2PR12MB2537.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(189003)(199004)(52116002)(7696005)(44144004)(956004)(54906003)(6916009)(66556008)(45080400002)(66476007)(66946007)(1076003)(6506007)(2906002)(5660300002)(86362001)(4326008)(478600001)(966005)(16526019)(186003)(26005)(8676002)(316002)(55016002)(9686003)(81156014)(8936002)(21480400003)(81166006)(2700100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2537;
 H:MW2PR12MB2524.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/5qKnMM+7UomcYawLFfQ/Uc4cNp13+7EWKHDpY5Yoetz9A6yvLD0pbHuR5NtX7y0aim9Z6uh3N91qVXLCT036t1eaN4rFXpDoXBgSDb1ntQxMo/q63nRBWQOgdLJj3kXKqWhYfYQ2a1OBrOy6BHexfuBWJ/Kmv4jc2fIdLnIDDlHC+/55t/+Yid8Sk+T40bExh7ZvVZSqoy4fzthmAEDONh0vwKeNc2Vw/imcUQZeQtK89wfq/EeokrpmAbG5I4kSmypOXV2BY81FaRlzVCGXeeXIhQo1ckxoQ66pdiLzkJFf93kNcaRbXt0NFlGplslIsyWAI7pA7rpKJ6/HzOrJEnEQK5BUlnFGvdLjoLSkPTKa3vY5JQ+sDSU2ds7AVx8mnHhUl0aPqc8apFvp8s89BZIEr/aEhqc6JmymYxbqgh1503cRCYZsCNdxQaRPCskgeYI+u/Pvp54c1ujw2oxhES/5w6rspX1vg90fy44GcbOG3cHsOuUJGvGwXSpVvPxQMllBriO/zPnez9WqAWQMo4G4k3nOAnijFDymoTSbGSUI0GwGObVbEthufdlUqVtPvCyG4zbAMexlxrySeTHSzTunHKPZ4RK7n7jLDKniHdTNxOlzcT+edpefd+x2SsT1BkS6Nf2PFWT9r9tz2Qhw==
X-MS-Exchange-AntiSpam-MessageData: 87qc0Bftya0c19GiV0XV4mP3KVsZCokm5L8Nfp3UDyP98v/HfuJX4fBX25j5QWRrHz2JWfVh6IGjlkm12VlFDeKybOgxbsZ5Svdq1ETcMjFr7ZdGLtuENuaYCb+DdYtN6qxdazEJ8mqj7ruGETyFHA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31d48a6-96b4-4b67-21a6-08d7bb967747
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2020 15:05:21.9491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mUojx1Q+QsBHDAGT/RGHG1/JBAl7ewtPn9VFBdCc3fZswzNEteKZ0OfmX90h8P5ZY6JDoOj1wXxumll5H4A5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2537
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0302984301=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0302984301==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fe6g2uh4wkbl7ntv"
Content-Disposition: inline

--fe6g2uh4wkbl7ntv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Melissa,

First of all, thank you very much for this patchset; in general,
everything looks good to me.

I noticed that your patchset does not apply because you made your
changes based on `drm-misc-next`; when you send patches to amdgpu, use
the following repository:

 git://people.freedesktop.org/~agd5f/linux=20

Could you prepare a V2?

Thanks!

On 02/26, Melissa Wen wrote:
> This patchset solves some coding style issues on dc_link for readability
> and cleaning up warnings. Change suggested by checkpatch.pl.=20
>=20
> Melissa Wen (2):
>   drm/amd/display: dc_link: code clean up on enable_link_dp function
>   drm/amd/display: dc_link: code clean up on detect_dp function
>=20
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 67 +++++++++----------
>  1 file changed, 32 insertions(+), 35 deletions(-)
>=20
> --=20
> 2.25.0
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
=2Efreedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7CRo=
drigo.Siqueira%40amd.com%7C7a3e02e3f43447ed4fab08d7bb080d9b%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637183515885211986&amp;sdata=3DbnipkrUtKdO1oO=
Kxdt1th4iIG1%2BBgl2wMPVrdmn3P1U%3D&amp;reserved=3D0

--=20
Rodrigo Siqueira
https://siqueira.tech

--fe6g2uh4wkbl7ntv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl5X2q4ACgkQWJzP/com
vP9D8w/9FuldxyVAimGBIP8iJpTdjBdiO+PHhaO+PFvHu9H3E9h5gg7PWGvahrfI
7WMtjIPAsaH2wR1gjiU+4yHM6PyG1yiZdOqjXpDNJWyGzO1CEurPN34oMsdHhmli
n0HXZROFUWmOwBWB49gnEZ9ReugiOcvD5aOt/JYKUDj4+InF8e+Nss9yhFg+gwAC
TfJ2dolsMcjbdrakHliCQMWPqULpVG1JgErYUXeAN8fSBGwWy47qFZ7d9BUllH+1
iorXYd1wRecQZ1p+xxbBVFtm0oVB/LjwSc2uRrPh7WuIbSl7TChuCVmb0NmN1nIp
Wj/hUiz4GdFrzvwFYEb83CZOw2pjfSoGvn/Ru3oLzWR/9cRhFDF6DhNiX4COI5aT
eDbwRZumMTlEwy9UZHuxxCnfFgVk6ttZRmrUwb2GllLbMBkarl7jYZDT+eGjBrc0
rs+7iVND8NeFqVTkFIG61ljXaA9MaBsawRRvS24Hh5Sw27rafuP+oij61bn/OFTP
j732/HQfdlfM9FbtCwGGnISu65eFgFX1ApvwtesIBUqvBazvI9neDYv2RaAVU/oU
hUDYPuP9JYvJtwiOuI9L52CgfNOpOSy6OYn7oozZrnmHzHI2SLpcisjktTI+UJdk
P5g3YWlqltnP2A75N1zEYusm07YJZx7akpEe+YZEyhIolZqleCs=
=vPgy
-----END PGP SIGNATURE-----

--fe6g2uh4wkbl7ntv--

--===============0302984301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0302984301==--
