Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90C03A1D11
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 20:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF6E6EAD0;
	Wed,  9 Jun 2021 18:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2DC6EAD4;
 Wed,  9 Jun 2021 18:48:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XidD4IxrJPY/M8ntQMsZ3ldIMmc8pURlJmyFdZeWCaR2kLkaAegDUW9UGMGZ1In+3xnZMlGvb6BPwGnbW/MyUMH2eEGWw5yX3iDmbF1wene+TOf8PnZ+7zMrKWqMhNggS3smJbDFlM6ejmpfotPeZViy+5/IcjpNMT93hBBzU1KpIlht+dqtE9PIFIYsdVt3Y0ucDWmsoOW/CjW56w9Jc1jacRom2uSW7OC4BBgFYGD5v6k8tPTwYlPqqxhs5ElvDZB68GZq+lLx+FmJ/Jmun9le3GcEGdCyaS9K6qa1hpl/jpapF8FD65eqablxnBEkUjwtHbWjdx8bGlFhS9gehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCciIAq0De2nouvtwU09epE/1joyzNcWsSBVR+Keq8Q=;
 b=dmU1zCgjPqQfrf+zR5HgYpDfVs068yTMGv6jXaj2BN4d4wibr2HuE1sWHnUlVucUKQIc4yYw550pZTZL/2YwHMS8nuP9R7eaRMJS+bqdT6lBAiev+HHe3lTk7Ywz+f4HBK9bGScpcFxhlUcZ5uOJo+nncGyF2czIH2EbKIeTfcJErtVxRZuXxKOHnigpMKWdgFb8rCiT48yi/QF9MEDAzCLdBj+BagYkHqRMJAnzabfbiDo3JlKxK2hbiMNlW7VLG6HUBQefB66YL/CVnLNqYyJ4RYblUSAoaJCK+AtJYA6IvLxsvbariwT61L2Fz9p1sYcPRVtYwZjzR7bQSW7MAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCciIAq0De2nouvtwU09epE/1joyzNcWsSBVR+Keq8Q=;
 b=T47Dhbty+sikfjCHAwFUkff2Tq7OzTIYpd0JHgNA09jiW1Z/wV14+sM90I3Sz3BffDUmztDGkgWrBlhICxLOJyVG6ZUTPwH/gqExx3hAZL94K3pOl2KTUGPgY6LIA/h0Tzo4dIEI1phmtu+ZCI4uWWnGtu4byT9cWmb3tTr5eAg=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM5PR12MB1147.namprd12.prod.outlook.com (2603:10b6:3:79::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20; Wed, 9 Jun 2021 18:48:00 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::5531:f7ab:4bd2:2925]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::5531:f7ab:4bd2:2925%3]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 18:48:00 +0000
Date: Wed, 9 Jun 2021 14:47:56 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] drm: display: Remove duplicated argument in dcn31
Message-ID: <20210609184756.rewxv73j2jj4bfys@outlook.office365.com>
References: <20210609030202.113368-1-wanjiabing@vivo.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eopa2fko4xm7eg37"
Content-Disposition: inline
In-Reply-To: <20210609030202.113368-1-wanjiabing@vivo.com>
X-Originating-IP: [2607:fea8:56e0:6d60:c986:fe95:a01e:6369]
X-ClientProxiedBy: BN9PR03CA0549.namprd03.prod.outlook.com
 (2603:10b6:408:138::14) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:c986:fe95:a01e:6369)
 by BN9PR03CA0549.namprd03.prod.outlook.com (2603:10b6:408:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 9 Jun 2021 18:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76b42928-816f-4e72-2577-08d92b771ab9
X-MS-TrafficTypeDiagnostic: DM5PR12MB1147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1147BCD7577E995BBC26E6B298369@DM5PR12MB1147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJVpX+ueR9jKt4TQbC/lNhinb7uzMAYCl1rgZMvoqLBqfjkgNFKI7s+iKDfGqz3J/7Dpi3Qsra70yiut2TzrEmQJJScKKZ15J+l/P+u2Z37XpGRSGLP/NK/WIMB+cB7J5dM3k6fD0te47xmwO4OZZEqSGLyaI3MmCMrvx5ITJVwJv70PF40noVb5s83Ea98Hrky9EvXiYsINnf07qjy2a6clY7vY/0XKudEQp9M6fD6lYVqrztZnrlc7G7McSRNIMv2JbkiLopyRttuUdvsVycBley2zyTlhzjOticE45ibvI4oz6D42yUaNxictOkME47f9fhEUKqSawp39ycsoUisvPoBTwVm+4oEH4rV/hGd7BdZGwvwwovSeYJgvAr/salrFIHQa7OGj8+PgZUIUocwZ72u+LYCBQW493VQkuN8yfD1JrhKXW4OXq7VojQCj8ZUFxNdGWa2y6/cAJT/7TXS+XbVo5+WDAOmZaIKoi+VcVhI/hv9NHDlHeSyUx/mVZ/5qF8AhjaWYTGoY1a6xzL6lAw3vIXavyrRAsVRaQ3dVmXSf1mFEeyPF9cH6dRyScJSSAg40LK1LhnZzlrkAzUoiZq+75Z0QEvdpDwmZ4MmnRifExiZqB6xXs0xjc67TYxnPttwYd14gnNvt4kFtoKPFy/6RTT+YD3Igyz6xZRaVK9ELPNM5VIdWSH6xlF93f7dFL4ceJIrAiBdOpoeARWfUwn++xLce67qx55mcWuzZv+QXCrMQ2xDCMYm2dYoxFwjyoyaY0tj0lUPvAS7+Qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(9686003)(55016002)(2906002)(8676002)(16526019)(6506007)(66556008)(7696005)(44144004)(54906003)(186003)(5660300002)(52116002)(86362001)(4326008)(6916009)(478600001)(1076003)(83380400001)(966005)(8936002)(21480400003)(66476007)(38100700002)(316002)(66946007)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sB9yRF9eV9t+T31pUez9MYj0zh7N5VXs4Lr9hXXbtE9rxw5E5SkIrhIiVRmd?=
 =?us-ascii?Q?GsYRThTvIZxdnHdI00TBTGjcJOAeq5YmTLUhfKaeB92QNj2XNTKJKc/KNF/O?=
 =?us-ascii?Q?RjqUdbRfm6vp6GqhKlw8v5KdnR9nR//3r9sKlN4jIqlNKyQSCtxWimW51hA4?=
 =?us-ascii?Q?bjTeLtg9BIyxLETLcSC/wFcUmVpuGOSs0/jkPLk7EdjMTB8MqhlhVKwYCgnv?=
 =?us-ascii?Q?ax0iBYQV1B5vG00gEU531CpzvfaA5Vtt7Hc49W2r2NvesKzMnniEYxeDdGfM?=
 =?us-ascii?Q?avLSvhxBVWjsapkQYPPxw+BerULUxSWU35wBbjW68Dc/qlgYjgGJh94Kkh65?=
 =?us-ascii?Q?gE6HkRAqo0cuISsoSZc+XNVICMD5Zg+lBMmsYmzx1tScSJUgfX2vx8U/lUcA?=
 =?us-ascii?Q?w0eVUYtu7pXgjH7iBJdhlk7z7LbzAs1MV2RsvxpeLWk89qkizRkRTgP+sFP/?=
 =?us-ascii?Q?CYPrHmXSYN/K3nM/zS5BPqWFXNsAjB5uY8dFqNhnrMC5K4iwCRJfP4g9/epv?=
 =?us-ascii?Q?3p6V0ZYkrsarQFv9NmtfIS1JgqC3KGGkWuAivfgWNACULEb3skQqoOiMSR9e?=
 =?us-ascii?Q?o5vaXHDbgeyeep7WNksZDPKX7f9kpQ81jTqWSLzNotOr7LyMCxXcBI5KwDFW?=
 =?us-ascii?Q?KFETfE8T+tI8AXUvDW8dHH9oM40z9iR6nREgc7XffqzRbJcRjRU1hEgwx+lz?=
 =?us-ascii?Q?NX9GD2IlNNgYW72Lblu28W80cSND6iYQ2xh+hWmwI+H/AH3ssGxtSP1zpxkT?=
 =?us-ascii?Q?vTwcyFDlIh63hil0EErvlQ9X7vMNr/5Umb2Kw47dUEojJfZVPVYBwOZ7X8hs?=
 =?us-ascii?Q?4DTdn2VkdDQOnNYl8chqYTLMoiBkpCJ9NnQdblMJM/FoEBZhwcxxlnZ95aMj?=
 =?us-ascii?Q?xlMc3Kv1cED2KslwGaUvABhkssskWPrCZlfYtu2npECJCbRMVu5Sl4gnY+yF?=
 =?us-ascii?Q?M+RuHGlRjxcWA2LfXqDYdm+6HJBlQlSiuk72iL/xVVoaXeAO5F1ilsiR/mf+?=
 =?us-ascii?Q?W/0VUUG17Y+/sqnHWeH9FlEfPsQnNTHihnAlV9mxK+OMwSetgveoCiBg21tw?=
 =?us-ascii?Q?Bjqff8uiB8c8MbFaWCBqYQeA0HJq+6NCMjU9pn91Dxj0hqsa65sqYA9PoIWl?=
 =?us-ascii?Q?KTVQK50bZyz/36TKph2HbF9datSCHpQKx+uxmWGBqkixS2ZYEZOECoX0NkWL?=
 =?us-ascii?Q?biGCSNS1ioS+djGOt/5arHnyPjrbBKJI8lRQUgADT4RP31ErWN1Zj1M04HiV?=
 =?us-ascii?Q?7/O5JsyGlfQ0mnqjyhciZId+riAE7Ctpk8dm+l2uFqSfAQuyqYA7nrOfq1rd?=
 =?us-ascii?Q?lihXrddqZWGvxxeDh4sXKYoGbjiZ90j5K3quHwsAg/Ox8oqOWsOinYr32D+9?=
 =?us-ascii?Q?+xrmA78AJTTUR4ntxqh1CsPeL7ew?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b42928-816f-4e72-2577-08d92b771ab9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 18:48:00.1208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxG+St6+qWdbXBqHSmBMkGhvY0cAGmNNISS6522MSiTcmbOUBQAUERYqH9/QMXJISdLnL9SXFrOoRUC1gZt3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1147
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
Cc: Chris Park <Chris.Park@amd.com>, dri-devel@lists.freedesktop.org,
 anson.jacob@amd.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Jun Lei <Jun.Lei@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--eopa2fko4xm7eg37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/09, Wan Jiabing wrote:
> Fix the following coccicheck warning:
> ./drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c:
> 3539:12-42: duplicated argument to && or ||
> ./drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c:
> 5677:87-123: duplicated argument to && or ||
>=20
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31=
=2Ec b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> index d655655baaba..06fac59a3d40 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> @@ -3536,7 +3536,7 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
>  		*BytePerPixelDETC =3D 0;
>  		*BytePerPixelY =3D 4;
>  		*BytePerPixelC =3D 0;
> -	} else if (SourcePixelFormat =3D=3D dm_444_16 || SourcePixelFormat =3D=
=3D dm_444_16) {
> +	} else if (SourcePixelFormat =3D=3D dm_444_16) {
>  		*BytePerPixelDETY =3D 2;
>  		*BytePerPixelDETC =3D 0;
>  		*BytePerPixelY =3D 2;
> @@ -5674,7 +5674,7 @@ void dml31_ModeSupportAndSystemConfigurationFull(st=
ruct display_mode_lib *mode_l
>  	for (k =3D 0; k < v->NumberOfActivePlanes; k++) {
>  		if (v->ViewportWidth[k] > v->SurfaceWidthY[k] || v->ViewportHeight[k] =
> v->SurfaceHeightY[k]) {
>  			ViewportExceedsSurface =3D true;
> -			if (v->SourcePixelFormat[k] !=3D dm_444_64 && v->SourcePixelFormat[k]=
 !=3D dm_444_32 && v->SourcePixelFormat[k] !=3D dm_444_16
> +			if (v->SourcePixelFormat[k] !=3D dm_444_64 && v->SourcePixelFormat[k]=
 !=3D dm_444_32
>  					&& v->SourcePixelFormat[k] !=3D dm_444_16 && v->SourcePixelFormat[k=
] !=3D dm_444_8
>  					&& v->SourcePixelFormat[k] !=3D dm_rgbe) {
>  				if (v->ViewportWidthChroma[k] > v->SurfaceWidthC[k]
> --=20
> 2.20.1
>

+ Anson

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--eopa2fko4xm7eg37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDBDNsACgkQWJzP/com
vP9h4w//Yh70A8dQa5QRqWNKbjr8mB5Nxmq6p7VcchHJGYQvBV/KxJBbYCBOpPgV
TEURwIEO3duLYBve3N/7K4iA6+qCDb//8XzzyWReUL0eMmUyS7JzRZon6XL+Cbq4
RTBEBjNbAD79n8htQ833+n/mRZxRS+qz+LFED0bZO36mynR2GIpF1m53PDGf8wMK
VaIiFdoyYi4B7JjdH17+osp3Q7PBXlK3Z+oAFbTVonYRpz4VPwgQ5SLZ4mSvTGcZ
7pthtllF4fZNev/7JIm8noaq9WulMGHmWuyGQ4wMI/PtidAyNziL88/y7n6hVpkx
TYbt7b6AHj9+NNfEtUNkG7hyqB2UgbGBRzgZfZlpr9p2XxWdy8fbun7pR7xk5xnI
O43N0vVADGcaPMtKEq5ydGfS2y27y9btjnhW2q5gVQ/it7lfseZP9BLdatsOWzXB
kEHKyPPKZenSqRbXvXdTocI3Wwnx6PCzqq7anl+cHaz3MK5qxOzx8TL2Al4Gc7LS
cXNIfIAvChbkPo6dyXEx2TKIEuwcRGmy57JC0Xoh3EEDlkNdcOOpFK+L+TXLQLzL
9VZ/FNmk3odisw9bZ2yiT0BF9iXCoPfLvVBxtrHUsYCRJsQm5DPq/DXEKQ7ZQxLS
weUGLe5tGWXw7MXFviwEoXMyUdo/pSQvaf56YIQ60dg3eQ4Rh74=
=MgFQ
-----END PGP SIGNATURE-----

--eopa2fko4xm7eg37--
