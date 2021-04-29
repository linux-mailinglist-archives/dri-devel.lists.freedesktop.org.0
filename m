Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547C36EC82
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 16:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB4D6EEB5;
	Thu, 29 Apr 2021 14:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1510A6EEAB;
 Thu, 29 Apr 2021 14:40:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQbu3cMI6MxNBkaXNK6rEysZBTZfDZpWpxWPlkvyIEzzH77RE2Uchn1ssCaZRw1dbWnbPkDjxfV57CSgZYTGDnEcHrxCRY8CwqaMVrofSzZuoUhSj8QCAtfQntr9t4SNdKV7QCtaoM09+6U3LNAAlP6XIW/xoxwh09W8VZQzqgXiYTQ9tMLMOZ8uPeEo0LkK2b71YgjcsS1Rp3Ik3LQdPEncfRj4koxuJqKeyZetWAl2/HIq3zkeF2tlPO+a0G3ALPE6Xll/xt2gso5fITX0vFK2stu4SLp4e4sj3dmN2rJTK26R8pzXbJYOjlmVfC0iRknqHwqkwGUhMesM8h9Q0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qy5uKJBlCrqIqHGOizwdw+ZAeogMYr71az6Ch6vUvhc=;
 b=k1y6gC+vym4qgGDyxpIFQ1A5ERoB07iJBE0aq5/xU8Lm4Y9mPMPG8dYWcGd56Pv6KCy6jTHdG2cTdw5KVLFt7MSF9Uzd+8FLK6od9eJM0GK170qySCSAk9xrBs8fIugexMCYvdvKB78NXGW647JzT+7lkm7h2PmxqJElcDoCUyhptHnGhroaMxWTAGwUR9hgdglgGV4q1vH22+uMXYDfPQ0v2xSfqZeR/Y/QNXUZV0fYdbXiARsF8Bbb34pmoRnurWjLfDboqf9uaoq4cL8BOfDuQe7sWLUK2xCQe7pPPPCT3P3k54HPWASvwaFu+Nv2ivANG667jhibDmXqjBGxWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qy5uKJBlCrqIqHGOizwdw+ZAeogMYr71az6Ch6vUvhc=;
 b=JXoz4Q1N7MjffUGD9nVdI6JRUJaniOYCNMx2bqXsgGvxZx6+QT17ytuY261cXtN4W5HL6aDxe4KwtQljZSZI/Wc7mfjeQpAJmEdJc3Qwu2LhPsgyTozk+2zr/ndjNfy1HfTvVcAVsaF/BlaOn7gB7S034h5416UB0ljliOySDU4=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB2859.namprd12.prod.outlook.com (2603:10b6:5:15d::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21; Thu, 29 Apr 2021 14:40:08 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 14:40:08 +0000
Date: Thu, 29 Apr 2021 10:40:04 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] [v2] drm/amd/display: Remove duplicate declaration of
 dc_state
Message-ID: <20210429144004.bwbengdsr5qjcslc@outlook.office365.com>
References: <20210429123900.25156-1-wanjiabing@vivo.com>
 <20210429143043.psmabddm74bljtpx@outlook.office365.com>
In-Reply-To: <20210429143043.psmabddm74bljtpx@outlook.office365.com>
X-Originating-IP: [2607:fea8:56e0:6d60:9d3b:95a7:19db:40c3]
X-ClientProxiedBy: BN1PR12CA0021.namprd12.prod.outlook.com
 (2603:10b6:408:e1::26) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:9d3b:95a7:19db:40c3)
 by BN1PR12CA0021.namprd12.prod.outlook.com (2603:10b6:408:e1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Thu, 29 Apr 2021 14:40:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78c162c6-0165-498b-c9d4-08d90b1caf6a
X-MS-TrafficTypeDiagnostic: DM6PR12MB2859:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB28595B0E2ED751105675005C985F9@DM6PR12MB2859.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2X7quBkzN3bVedIIcJdaSmqVVRJhrmCFKsjmNqMGcJCJLzAFAkRJjm6A9MwSbjoR1LTF3sP7KbG8Kg84+ALbXd0FA4/Of2WED8+Dl9zS3TOxUvGYRQ3KUI/3egerrQtiBMHJR4qRden5cD1TDjrcdk/bkke4Fghiv+ScaQQXy8MKrDh0Y5KRy3HxQLlPrDiKtQ13uk6zjg/5Vwi823NLCYfyrQkdh577zG9BsBGdthSy9dT/OE8kD/AoU2dR0SCWMs705SKeZrcua9FjJKCKhZwsbgffM4Dn2suwGVNnvIizRTfs5I+qRkq3XMyO+8kF50xrYIEc3XVQmc1u/oTbX0AUIMIevD7hg4lPqkADXDEaOx+68ABqjABswZTktiov9SG/CzHweBghComB8itxdXwiYEouKSaTOfDdUM2oJsa9w7vf6moEyg8u38lI8OiZ3X6h0zmAZpmcYb5oO9eCT8VxkNx8V/L7t2VBeDi5RoZrremZL27qiKSfH1tnUfyF5doZFXpOg4rdr7AOZ/VS1q0RIYfjD5pETooQzK/7iVcq0CuX7RLy52L70+LEF8C86HnhcQk9FiWZzEoDYpDhPtokoZSSWrdoglIgdN/Kej6fIjUm5dGQAvx1p9x+OboA/BGIzYIfahAZPYgnNMcrpUsR8ucrG8G6JOj9qi4iEsi3ftqBPG0ISPMxkKbbFbxT60DxONQKAxSiAoH2F3UjY12GX0FFu28WXd6sNeVH3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(316002)(186003)(66476007)(5660300002)(66556008)(66946007)(1076003)(8676002)(52116002)(38100700002)(83380400001)(16526019)(8936002)(966005)(6916009)(7696005)(21480400003)(6506007)(54906003)(86362001)(478600001)(2906002)(9686003)(55016002)(4326008)(44144004)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mtAcl5HYJ57KmnVvc+4ZuSwSCF5gigV1I4Pe4mMGSZbA41w+GLxSXxzaPDc+?=
 =?us-ascii?Q?dS1xodwgytNDiuXW8QRAcWKWRyCVZEUJdyalf6sF155aFqGpM/Iz1YyN0C8Q?=
 =?us-ascii?Q?Kw9j+XZpnlnQhiNrAMzxtXVwMcVTHjCV6zzeWsMA1W/O3znDOB6uMH1ezquQ?=
 =?us-ascii?Q?XgpcjygxxtrHFVi/GxKMC/GSUeW9JA7i/UyUwgtw2gqgZy9e5l7x09wrGbuo?=
 =?us-ascii?Q?bOQ8AD8eVdAgX5rlnw3xkJiitp90AJ5TFdDmgFlo9QZTbkBRzaBih4GKV5oM?=
 =?us-ascii?Q?EBBt/QwVwOGk6E6rUNbvXTEJ93NmMzQxay7vVQU7O+59U1L1eiXGXXp9pOwb?=
 =?us-ascii?Q?QzFOWznAYbuc1tb+1X8Dim0jy9Rd6yfTmqXuDLifhaD9vMiiCC8eZ9DNM32a?=
 =?us-ascii?Q?e3lfYqpgrWfWmzJwo4jahwz9Kf5mgO+E9Srqb+/1lIbvRGfk+gB75oZJO+E0?=
 =?us-ascii?Q?yOJ5cnwDtw648j1ccLflokdr80of83fY8K2/gki60bmCF9vdvMI7u1f4foMe?=
 =?us-ascii?Q?T1QZXBP6fHrMe4cUCGPHJ2g/s7WchyTf+T68Y1Lk4zZuFidIZtHT8F1OxYJ6?=
 =?us-ascii?Q?k2NOY1x/yHKv23cfI1YTeKe7H5vgIBhsQOuWnQoKa7Hbv6CiZRyJbgLawD3W?=
 =?us-ascii?Q?BHUkilvN35d+56GO72RV2uiyUIsGEuoIBN+AAKh/dZTdIlGBwlci3S0Fva4F?=
 =?us-ascii?Q?+UrmrNiwa51dqgiP4oouwEQOwwCRfzdHiQK4awIxwJB5d0rIlXHu9Zs5ng4r?=
 =?us-ascii?Q?d6dja346lHn1o/obKLbcslMAtZ1pqdhrAvWZPdRJYlyFRMrrToVgU58y7lP2?=
 =?us-ascii?Q?HIWKLM9gaLnotBbg6JpZYfWv0hC/Tm0/xsCg80yZoJB3e4Pe1dVfUdohz86M?=
 =?us-ascii?Q?tWJ0/WHybz3vA50HnqeAOAcemY9HAwGdEWUqvdm0OYmTK2uVQ/pwEOyh7DVZ?=
 =?us-ascii?Q?IuT3glHf0nNFheYcU967KyQWjbBQpTHNrkmXo/8J50MoLuwC23x256Tc+kJk?=
 =?us-ascii?Q?Lsd/Ttd0qfEMcSeCVBHJslHtY+E+N7wyYodGQz+I7/Hdmtq7ymD+sRDkl/ep?=
 =?us-ascii?Q?i3owNCeLec2e/s99PjeQhDvv3VKl8n5trVP/V3HT5SdFzlGqFRFEGYEzlzQA?=
 =?us-ascii?Q?9vQfw5xaDEvcNuWfNYntdx5khq2hKSBHs2fcffldCMLPHV5WB26WzXxIs2yJ?=
 =?us-ascii?Q?QlDkD0cmB7W2WfSY2F5k6joGvJFDWeZxZdTJvCQGdNtE7XUQttHHcDzIklWG?=
 =?us-ascii?Q?+xg6RsWl35+Y1OdgaFCWKBQUaMY3CsDKZoqQPYtXKTm870RaeszQUcKCnGBM?=
 =?us-ascii?Q?HiJ8YhXVJpkfiaM6VBKgpiHntHzSzbwrcAn+CrAeMburMiSaSS3T6XsH4MYg?=
 =?us-ascii?Q?7TC7qO4VfpDgrCyCioY2wRCIQiL0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c162c6-0165-498b-c9d4-08d90b1caf6a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 14:40:08.1345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GotZzSH2EX6xErXwetA97dO0pYT4pX4O1PSZ4G4MbOirTb4gwu+rUCgF5OOWildj/JT1eGHOmf5LOgqalbP/JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2859
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
Cc: Jacky Liao <ziyu.liao@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 kael_w@yeah.net, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1498643951=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1498643951==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gtmxlrpvrztqf5js"
Content-Disposition: inline

--gtmxlrpvrztqf5js
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Applied to amd-staging-drm-next.

Thanks

On 04/29, Rodrigo Siqueira wrote:
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>=20
> On 04/29, Wan Jiabing wrote:
> > There are two declarations of struct dc_state here.
> > Remove the later duplicate more secure.
> >=20
> > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> > ---
> > Changelog:
> > v2:
> > - Remove the later duplicate instead of the former.
> > ---
> >  drivers/gpu/drm/amd/display/dc/dc.h | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/=
display/dc/dc.h
> > index 8108b82bac60..6f3c95b5d1a2 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dc.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> > @@ -594,7 +594,6 @@ struct dc_bounding_box_overrides {
> >  	int min_dcfclk_mhz;
> >  };
> > =20
> > -struct dc_state;
> >  struct resource_pool;
> >  struct dce_hwseq;
> >  struct gpu_info_soc_bounding_box_v1_0;
> > --=20
> > 2.25.1
> >=20
>=20
> --=20
> Rodrigo Siqueira
> https://siqueira.tech



--=20
Rodrigo Siqueira
https://siqueira.tech

--gtmxlrpvrztqf5js
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCKxUMACgkQWJzP/com
vP+MpxAAur5ElvBJVx4aadxytBMkg/IiyzalJP/2nXNB0W2lUYyDb6kQdeZDmVRT
0C3EXp4gOR/wnHgFg1pAh6BqzzN4mmJeePem3/28S0kZB1YzuoPWudiw2tTK3u+S
tcXJ+tv2ZdKvr04KYt5MsSvWxeFeAuaZ/w5Qbdd4G9RHS03EVfiK1KWfp4M9EuYC
gz0b6zK9lX6/6IV2nEFr2C/NVHF8wbO8HGeOkAQAFJTNuR3HtEupDEUTbTYm7NX5
Pyhf/GPpSurpcm34j5n/DGceQ6UWMnztF1mf70qsNDeUuvMW1CYduewj8FO9aFDj
viDAms7xWrCwZYRTI5L4iLFmb4Wgtt3H40G5t0Y8mMMGkMUrRE/D8/l9tsj3s818
g5s5vbtFS8zYUouqz8+YAEdxGRiyynHCrJY6ZoMw/nHMNXLYn5/U5xy37G8tdQMz
culzcC02Wj+SXjsCMW8ygFbLqfO5r8dikx0Ey7MyAl9uGRvPDCsVoCtcb5euRkOk
FignRB7s68Py0NdC01eNgUwPLuketlKRryNUbt5drVzieM5bzMVHV8gk0Z1yz0Sh
uqqD2mvXn8q1TikNtyAudXzE58qR/22pfxY2hXB/WpY9sz5AzB4CCDMM+Imxxhfb
HAJfAPJ+SqGtYj8EP7/erxHGPLKvyrFlYus90RwV/q4R+1AexoQ=
=J3rq
-----END PGP SIGNATURE-----

--gtmxlrpvrztqf5js--

--===============1498643951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1498643951==--
