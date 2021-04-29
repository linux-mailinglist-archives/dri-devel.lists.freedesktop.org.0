Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE9836EA09
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668A16EE76;
	Thu, 29 Apr 2021 12:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B482E6EE79;
 Thu, 29 Apr 2021 12:08:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+N00UCjYGw/M4lElH9d7ScxPYQWpZMD2G/i/cJ+1AqfQHi2QSP/BHg0gOX2MiwYqpUygcuV2Rhl6+uTgt/CJuGetzSQhFSYUz6ENwRbcqkRWLcQv5VtWDdrb8sd7dQQ1dVAPv0t/cFyY60pqW2kpArtGMOEnYz3DhTsBwATMbPzHzvaX0tkPAUPrNydhRyqQOEK2OCol8FqHC8XO6D0R6DYIMVHZfhkfaSwrUekkxEw/W2l4YjK9Pbhs9TXW7tAefKDdKgYQ7s8vBPOrtndYqfjOW95bJQJe6D/dDr8SQmDuxNhJhx9BjFsg85bLQn48+jC1ZMe1LAKaflGd167YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ2/NF36K3MSCPvKA7ywNRqA1WNqgzjbXa3ExVuH4+w=;
 b=G6nzbTBEz+wcs+S5fpb9gEVm89hrFtLfQ6OhtjtQDu5UTsSKriRYulAzRZuARJUlRuPzetjpr+YA7luG5UV857RGEo/8g/ZR++AVqtY8Cjk0QhPvcNA9MNO2uqDAOQTHXBV9suyrdC4csxF912F19WeevLljZWAKCfU1G77mGltCuWfMVWhYJl35+cjrwiPbkxUkIJehbuuCoVT2o/XIYj2X+QxbkLWCuA4UTBCLvx9A5fURIJMH2tuveTUB+IW5aIq2mTs4XTGM2p9wigDt2MNrZhi83dnnpZSrcHtVq/8RYvcrzaPfxt2aRhTWzvqqqeyiDVQllwxYe/XOSNSVOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ2/NF36K3MSCPvKA7ywNRqA1WNqgzjbXa3ExVuH4+w=;
 b=Sl/VvRgBuY8zfAzSyyu+fVSIvwx6wwEjBkUW6cmgcN3FAVBEaOhZcFZBax9pmTi0QexbQzbStWbb/s1HuPbMYbBl/Nn3S3V/blAy7nl+SzOu/K5rVO5neUhOhMpCVdmEyofS535se36b9qJcFluo9k5C5gCD+RrDO3gIIrXzaGU=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM5PR12MB1833.namprd12.prod.outlook.com (2603:10b6:3:111::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21; Thu, 29 Apr 2021 12:08:45 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 12:08:45 +0000
Date: Thu, 29 Apr 2021 08:08:41 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] drm/amd/display: Remove duplicate declaration of dc_state
Message-ID: <20210429120841.egvj3m23kehofsfc@outlook.office365.com>
References: <20210429031804.19487-1-wanjiabing@vivo.com>
In-Reply-To: <20210429031804.19487-1-wanjiabing@vivo.com>
X-Originating-IP: [2607:fea8:56e0:6d60:9d3b:95a7:19db:40c3]
X-ClientProxiedBy: YT1PR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::43)
 To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:9d3b:95a7:19db:40c3)
 by YT1PR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Thu, 29 Apr 2021 12:08:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ed7f0b1-d459-4665-7011-08d90b0789b6
X-MS-TrafficTypeDiagnostic: DM5PR12MB1833:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB18332606021F6393DFCEA745985F9@DM5PR12MB1833.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nrU5kbGuc8jiAgWLKyCWzdW8CVtjd285QGTNEksvTvanC/+VvK7LHRt12bk4aHJX5+LRQOQ3GvKtDIozrUZalgD9MSsQgycdXk3nnYFC2HmCYOeYXqMdkjsPRh+OUHaLkR3ZyfsdVjnh6hDcuKW9RKvgfqhQ5E9KQBrxB13GbuJ9Yrw/1dPMzZ/J6OMnC+b0BsuMvjrO2qvAFGfwGbmHzvSJw6YoTgL8xg2ch6OVEFHaOol1QGh71/C/ZECdbcyofmtnvcmGD85C56f06PXCnkTug239vp3iuoW/AsWeC3jcNeEPUz0847v3yN+TyJwxDGqq5ByeuxuTSUQkybvaD2RtAACjUbUAkthjaR46RqkDIzhaGMwBfUfzhZHwHm02u7+LGcmaeXzbudQmce/+A/8u8hMCqHcLGv3ek3prNidzfQa0sz/hmr3Zfk3WJTlVToX0W5yB8oOMA66XUHXH7gDBzDEeN8ouIFwhjPk+8PmdGjCr+Fr1hpKpTjxjxtSqOgXLR+78stZTw3oeEq+P/5YozVtpFeR2yil+jfAIthlwvdUFyNRoE3dXAZJtd/CHp2VAfBeAlGp4/c01GjnvWhgTtl+IG9XCi6+lGuFxvL8Hfv+s+jaekylZB4y/PchOaUjMrRVhbtNgph4yu/Z4XiZi0HkF1mQ1kP9O+ukhSmo65nqT6d699P7E3yL5hS3+q9IhbC4XcC/QSTtryczab8uO0sUyz0T77vZ3sQMx3uQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(966005)(9686003)(16526019)(66556008)(86362001)(54906003)(6506007)(66476007)(8936002)(316002)(8676002)(1076003)(186003)(38100700002)(66946007)(6666004)(4326008)(55016002)(52116002)(2906002)(21480400003)(44144004)(7696005)(6916009)(478600001)(5660300002)(83380400001)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?94T0MNY3a2e9PddscjJpM4OEm5KWVEXVEmH1o4KUUt93AfxdASiULyiKpUaW?=
 =?us-ascii?Q?KD+z+nsX5jbDANJjFTyCv5ciBnr8tcAVp71i56mfhZSsm940IwzKQT8yPEoN?=
 =?us-ascii?Q?xixjpV3tFll6F+Gtg8IBI0kz1YihFNgA5KdXpkDtMX+OKUuizYqh/ilIZpiX?=
 =?us-ascii?Q?SJ0CFdQygdO1Ruw6exTq9Bv2GZ4tBJQilaeSSObWsGZ/KbcpiMlGraiTut8X?=
 =?us-ascii?Q?iJu4lfnaAEzfAfMLXWWudLZnbfGYPF0fw/zeFvFqJ0t7isoPqu3NVA+5RnFw?=
 =?us-ascii?Q?Npcwwz/0yzf2TTYZH3SwBcelh/hT/r7uFz+V6OR6XlPX6WIZCl2zWQj5QYsY?=
 =?us-ascii?Q?hsSFwutTzcVhmn8Sx0hkrmY/p5gq6So++i94eUjyskifBTGdKLezxf3FkTdh?=
 =?us-ascii?Q?hnyjQ82mCywRt6AhgUnIvJsuCR8NjizchJTjMq2lZuxnhA7bjEANrKdrdbnQ?=
 =?us-ascii?Q?rhvUKct4pQQ1YwYT/kKUu9H1MO/D6oj1mZI9A3YEj9CpOEzhg+sye2mLNX2b?=
 =?us-ascii?Q?XBv56jj8WUoTcYlkyjl7vuEzW6+7K7erFdLAJMwh242YQmi/ySPnu5M8gtmu?=
 =?us-ascii?Q?GDWO3JsVtQMMrfpzZ2U91zi1cWdvc3tpxjM6XCoYSNQY/cQxX10dhv/zHwy4?=
 =?us-ascii?Q?vXT3xWx/5+yDutInVv8GIlepqPF3J4q7fOT2eG6tOgS3pmhR5qlI69doCwkk?=
 =?us-ascii?Q?AML6qcJ349N9asuwdx6t8oGh3D7V6dy3lPPAGB2W8RZLvEaq9M9ckZRy3Yro?=
 =?us-ascii?Q?TsBnQdDYzlo0RfkNdgdPLU+xYPG+N35m/7XqFEMFjRMm/XVWBk7NhJufigyG?=
 =?us-ascii?Q?X/2XpY0XZ9utmh0pzXsVwCIJLpG41ddAf6oVIcSwaWS+hEf3CVaBiqwExfdR?=
 =?us-ascii?Q?dnCUBhba7Yzc4gkgLUQgUCRxgNAGz24Vy/dAJ7dQLbpumgaANYCAtu7dR3Sa?=
 =?us-ascii?Q?kEVV6qG0VGNwU78it7pGUh4rX7xXZd9jVEtR9vvnLzV8Ai+7YG33f0dm7pc7?=
 =?us-ascii?Q?u0sSS9DLhJsqPVRpmor15yDjnygEdQnjum6rlSMFrG3m4n1PjzSXBhJKn6JY?=
 =?us-ascii?Q?D8XnM+XWeJwVbhaED5ueRMA5SWHZYJ99zBevKjgtCWdWiL0MZq2soS7bgDuy?=
 =?us-ascii?Q?ZcoFebrSVLDwN2LQDHMIK8cFo6cx8f9EEQZwQARUFTeEM8xbBKBK05Ykmyxd?=
 =?us-ascii?Q?DSfy9B7COGyWUkMetRDSXR6+lx6uC9tepi6JKmuHovithogQJq1cS63vEG3Z?=
 =?us-ascii?Q?FWgAgdQQcsV9WDqoOX9yxNd7EMN1eJS1ajKZIynWzxgAmN+U7+ZtS3UbXb2g?=
 =?us-ascii?Q?Yd366LsT8qGqqtFkLGq+lDuWDo34Q7CRLHWov2RsGHUNMT06ZzZujHRF3FkZ?=
 =?us-ascii?Q?RMbJTi5CNNQ8w3LM7d6zFExla3am?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed7f0b1-d459-4665-7011-08d90b0789b6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 12:08:45.5006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jE80B5dS84KMMw+3shLlru/OIlp59hDmorVtsEHTyyFtn6QQjZapL0ZDRwuBDwMAFo7c1rs+ow1/g1iU9LB30A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1833
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
Content-Type: multipart/mixed; boundary="===============1033528712=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1033528712==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z6ktmvaoxarxrbps"
Content-Disposition: inline

--z6ktmvaoxarxrbps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Wan,

Instead of remove the first dc_state, remove the second one.

Thanks

On 04/29, Wan Jiabing wrote:
> There are two declarations of struct dc_state here.
> The later one is closer to its user. Remove the former duplicate.
>=20
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/di=
splay/dc/dc.h
> index 8108b82bac60..cad045db6ea2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -276,8 +276,6 @@ enum surface_update_type {
>  /* Forward declaration*/
>  struct dc;
>  struct dc_plane_state;
> -struct dc_state;
> -
> =20
>  struct dc_cap_funcs {
>  	bool (*get_dcc_compression_cap)(const struct dc *dc,
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--z6ktmvaoxarxrbps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCKockACgkQWJzP/com
vP94bBAAtGyCjm1gSmBANOcbgahugjq1wi2TZpPmrOu4aqbH0y7dS84tV15laNWX
bCGFCHb7vGRf4kkg83sLrLTcrmx619AYgBBHZkBoQXQBU6la1cNrJwtjFqy7YLoR
IKHdj8Zv+kQMMmXjANGnWTYzwnMXvWD/JDI1B1IT6RMoEO7RJRpj6+HHT2RTRHlT
YPJpkQo9DFIaaIrETObA+DxDppEbWSSQ8PRiWI/jIAdCgh4QODpSPFEdr2lUMZfJ
y12jtf9gqmXd4eVP0UCYnBCzkrAPp9rcIoWAjjYnX2rvvrnM0HvMsWjVky44i73Q
os0T67doFL47cCHW9g0VN9kzOCKrbksNpnWGsLuSeW1SUhhallVyrLHw/hEvBz9n
3jbe6Ctc8QHiwUJZtGp5KDWbFd/SyhIe8skgwonR0iiQQXP8uoHebvxyAvFrJIyr
Z3Al0Kc4s2dgKgVxGIYP0U3fk/fQMBJ/aYTOgZKP1YtRd/yutmWhqzgjTWxkpR84
wq40Xy1oOPZr4DbU2B2wd+r8ShNsVYHalQmflRGF2nty8Z0ieg9tyorcz5tnJSFT
HOBRV7OgQP3uUOrWoJXXklw5SzpfIFCHQCZUbOlyTwjiCQ1CBvL6uGTPuhFabid9
VRixtiXhzMCC+4utSACPQhiMyYw49ely1Qe0aHjSd6L2l+PVc60=
=gbfm
-----END PGP SIGNATURE-----

--z6ktmvaoxarxrbps--

--===============1033528712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1033528712==--
