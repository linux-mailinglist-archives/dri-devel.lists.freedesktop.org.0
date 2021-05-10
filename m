Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E27379938
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 23:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1BB6E919;
	Mon, 10 May 2021 21:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A85E6E914;
 Mon, 10 May 2021 21:34:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7EJUUBs16VesZAlRLoA7VdcckfQU/9BuFNUDYpuZWLKomsTOiqDGWyLEgsH/h9tl9X4/BEan8Dyc5N8lVW6IEd4HNtPs+vV/atEU9wZsC2pSRAwGATOjEpZIKdY2JV0F5VWUocNC+WFOkIhdENdXxdAD50lVKekLSSAzUdWiHluzMt9Xqhy6dtjoSk3ohH1wJep1qbZb1PzvWCovBTM/ZTvoSZ2TbKrUaO39lnfL7c4vWIrEeYSnJE4vXu4mr771e6hQS2OtUbQ1KhXPSnH8wIAjHqXedK/t20oo+R/hGWFtIvYe1ACF1vPZzRfz1CrxOAJNpfyiK1Zq6SMvjHdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8s4kcuajm8ZL11ZDs7ouAIJXNBGDOTSShkX9I32AK8=;
 b=lKotCya5SAplKj9ssiVkcpre4nKXdxYiRpfMpM4w8VsnW+AeZr1PX1Ma0SRetZGeg8n0puMD0oKe9lot7l506U7Zrj0w0Npv+RPfD7uBHnkViGDnmW5tISXp2gkT6oJVH2hgkgqUO90tTnld88u1RnlZN4DtMNe/+/Z/8EkJOatiGLlgUGyNeje2URNkWfkghP5J5o0oQYrHtiUgvdDxK7e3Y2f0sR2A127a7K7MYpEd54nHB4YOZ1WDYPA6Xgbg0SXfLBi5VtG1+V9t2jt2HwqClizPsDvX20QG54EnS8fRzLWK1vstSjDy6jcnOQkFd7I1VrEajksMxG+A+mZJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8s4kcuajm8ZL11ZDs7ouAIJXNBGDOTSShkX9I32AK8=;
 b=4f95PsQgQx6vsrISsDItXwrlF+BZPwVqfvTLmYg9z+WDXUYyMWNBkYj3GAxlHa5+fKOVqkQVjto3et20HitK0IOrniGYywkoKiLQN1ebRZOlyM2+48K1IXhi67Y7HgDmwQIt6KSI6H/rAgrswCqQYJIzyAY6S1J3v3hmUkt5tP4=
Authentication-Results: czerwinskis.de; dkim=none (message not signed)
 header.d=none;czerwinskis.de; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM5PR12MB2581.namprd12.prod.outlook.com (2603:10b6:4:b2::36) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.29; Mon, 10 May 2021 21:34:01 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 21:34:01 +0000
Date: Mon, 10 May 2021 17:33:56 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Rouven Czerwinski <rouven@czerwinskis.de>,
 "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Subject: Re: [PATCH] drm/amd/display: remove unused function
 dc_link_perform_link_training
Message-ID: <20210510213356.ddqnz4yyqo4ngkp4@outlook.office365.com>
References: <20210508181951.129548-1-rouven@czerwinskis.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5iiisomfo5jomjiq"
Content-Disposition: inline
In-Reply-To: <20210508181951.129548-1-rouven@czerwinskis.de>
X-Originating-IP: [2607:fea8:56e0:6d60:e50c:fb14:3ae:933b]
X-ClientProxiedBy: BN6PR18CA0002.namprd18.prod.outlook.com
 (2603:10b6:404:121::12) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:e50c:fb14:3ae:933b)
 by BN6PR18CA0002.namprd18.prod.outlook.com (2603:10b6:404:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Mon, 10 May 2021 21:33:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87d82bd9-4d1d-4209-c5b6-08d913fb538e
X-MS-TrafficTypeDiagnostic: DM5PR12MB2581:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2581491939E59FB17BAC8AF598549@DM5PR12MB2581.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n/CPmfHRxKM0KnZMtGm7WdmSHXa33oerGoSBq8Gt2cIL6WnmhOI+o7oi/SAOuPOK+OhuzUNGk2q+APpr/lIjifsPFHGjuIJ98+37Bkj76qgsNQJs/r6j8YP4yKQZBC4GS9UKAw6mFafsKVXBJAtAdpHczl1THoYEdR8uxZ3DKwZpBjlep1ttprfP/IZYu1+VXsoyGm/WTj4cjq1T1Cn+3TqHm1iJ38b8C6cMt9CVufxY0DBnehCzaFkeETZVHZ8mKy2XgRmDlvdhJFtU+QPSxXSPbB2qMj4XsrIDNPzQvk9sa5wcbLjHaxrQfQKbLtNpABukjtInSHlSZO68FwgoG/Au9Rk2YktbEnKVagSvamgoGTrjrHxm7IkYRIUaFxK4trzrgtYpQJqd9GTNBBniEoGqLMd1ZxlLoIQkUOgpb6drFKNYMsYsP8OSvtW1eKn/yvqAYw09RzkbcVqc4w+CHlVz/fb0W/Uf+ptScRIdLcoqAQOxyjddFXy+dPiA4dAiYvYG6hsfPtbGhf9PUUpcxI0chYwSrdYoaWgJ+7QKOHc2bz5n4p4BUXZ/sQLGK+ZB5KtAjtBDmoWVydhtw1Pl53iUQmFsqUaYR0Vainb/ngIE9i8GFj+bUixW26LiHPvF2V87tC7ASAG4hh1czgsp1dKQgVyJ3ScZ+slxh72bV4YimSf3AktgJkOvPPfobRiyGkRP9WWgiD6uNJVFEtiahnrJvhHXpMEU7Bon5nTbdho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(8676002)(478600001)(66556008)(86362001)(45080400002)(83380400001)(66946007)(7696005)(1076003)(66476007)(966005)(52116002)(8936002)(38100700002)(54906003)(5660300002)(2906002)(186003)(21480400003)(6506007)(44144004)(6666004)(4326008)(9686003)(316002)(55016002)(110136005)(6636002)(16526019)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fiiFpY2VF1SRyyNT/jJWLktFUmEc2x67D+Ve04A5ggoKd0jTlPwG08H3CuxS?=
 =?us-ascii?Q?DsQnXnf9EK21NXy6KmEsjIG1dNQRg6KPxI1Qh5zSO558/zviFsv9bTz3Hqi/?=
 =?us-ascii?Q?/wkdiexSVRoD8bs8hdHI7EjOSrvu5THl4c+MZkXb+vQGTYUlr0r19O+0FJrX?=
 =?us-ascii?Q?Tru+BU+IbPTgO9PkdlsbSQ/zcFNp5e59QjN7DIGbGtseACErRd5v9if35sJx?=
 =?us-ascii?Q?jchsg+r/LOH9H/nLHXNYCwmazSG0kIpdRzbDwqkipNPOTEYXVxKxo2dT7MP/?=
 =?us-ascii?Q?FUzvJ2e/bM9Og05PlR4w4C7PmbkaaKF92k9jPMJvqHGu2+Lk8K8mIPUWElQa?=
 =?us-ascii?Q?NrLiSyZTod0Rp4aWx/ysUjn7C4cXFBh/hnRVi1oMipbZTFocoCaBFLA6RE8t?=
 =?us-ascii?Q?VeFs1q93G5Q0ce8/Pp+/2TvPycoDvzF0tJExztKCS1eU8k+Z7tqFjyyMJfpy?=
 =?us-ascii?Q?nOUC3Ip/ZkYrDkVSLSoCWDxLUCEwVs568Yx3q3qXTnfPKappE+q7ZDA6pYiR?=
 =?us-ascii?Q?FnxLKkUVHwMTpBYaX71kbNmXPxLDV41YGgiWG3iiCA6WteWshJZOd32naA35?=
 =?us-ascii?Q?+RflQF7PLlklRdf+tPJjtfjRIlOjFWn8fs0OPojd1bB7sSzRjsKrBckgVx5P?=
 =?us-ascii?Q?XelFYu0RzK7+lseJDRH9Dv0gQJFgK+UAf6fRL71xcpnEA9jZEZOEoz+OoT3n?=
 =?us-ascii?Q?Fd47BA6vHKIJpE36gmMOFYVEy5PFLtpWAAJ+npxqHaZPQWga0IdtP5lw4xAU?=
 =?us-ascii?Q?hgQfXlfosM+7eGR1hRhMEnUXg91rhjHWAgoH/dM5qFD4STZo21DEkZ5FfLnN?=
 =?us-ascii?Q?wIxhvjrmIyiQj4kQ8U+ApSSxKev9CMq019/7jH6FNSCkU/hiiUskOShyFvni?=
 =?us-ascii?Q?2+iPzTfk2DyDogONI3Xxch31d2BuKUHKaC5ezY5N6MzR+sbdeYTWeemZY7U1?=
 =?us-ascii?Q?91/Waw4Wnkb2TFYAKqkwCVl6UAcjxNz/YanIY0YpZ+UuhT5G98RUCnZ6qXMC?=
 =?us-ascii?Q?RAgpq+w42uEOSDQGzjYQh0hU4cyWhDZoGKNPZ5f+0taFMUMjHro40eGq0dte?=
 =?us-ascii?Q?HrN6RV3ls9kRcUweSYrIJ3PW4y0Urv4LyYA8QZxMkYIOM9EqG91C5yQq012s?=
 =?us-ascii?Q?Fcl0iAKggWlibmOSHSbTgB//9l+FUWVTTWW9npEmeOI6QAL3UTZAONHXwRef?=
 =?us-ascii?Q?Myxl4pVTE0QM744iwbWqYO6jgVt4yDDOUlFJAV04MvS/dg/Yrd/cxHdSQFaH?=
 =?us-ascii?Q?B2UVeOsWbMlbwKg+u78EcXISET56+baY2Bj7iMX5AbeKTKDjsgDVv5h6wonK?=
 =?us-ascii?Q?30Yi/+FYQLf+LaeoI8On968KbZfkT6N/lfHzwTdiD6TpNRIuXh+DRV+a9aDb?=
 =?us-ascii?Q?uDNTkH7WinYi69XzOyJJQBpdESOn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d82bd9-4d1d-4209-c5b6-08d913fb538e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 21:34:01.0879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSkM0KyGQl5KhPFPNuAGw6ujnuHBD/N7UvJGMQqBreN0gtVzMegcZpWYW75iXB/avukhso2o/zXx9CUPeGBq2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2581
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
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>, kernel@pengutronix.de,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--5iiisomfo5jomjiq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

LGTM,

Jay, any comment?

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 05/08, Rouven Czerwinski wrote:
> This function is not used anywhere, remove it. It was added in
> 40dd6bd376a4 ("drm/amd/display: Linux Set/Read link rate and lane count
> through debugfs") and moved in fe798de53a7a ("drm/amd/display: Move link
> functions from dc to dc_link"), but a user is missing.
>=20
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 13 -------------
>  drivers/gpu/drm/amd/display/dc/dc_link.h      |  3 ---
>  2 files changed, 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_link.c
> index 3fb0cebd6938..55c5cf2264b3 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -3553,19 +3553,6 @@ void dc_link_set_drive_settings(struct dc *dc,
>  	dc_link_dp_set_drive_settings(dc->links[i], lt_settings);
>  }
> =20
> -void dc_link_perform_link_training(struct dc *dc,
> -				   struct dc_link_settings *link_setting,
> -				   bool skip_video_pattern)
> -{
> -	int i;
> -
> -	for (i =3D 0; i < dc->link_count; i++)
> -		dc_link_dp_perform_link_training(
> -			dc->links[i],
> -			link_setting,
> -			skip_video_pattern);
> -}
> -
>  void dc_link_set_preferred_link_settings(struct dc *dc,
>  					 struct dc_link_settings *link_setting,
>  					 struct dc_link *link)
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/a=
md/display/dc/dc_link.h
> index fc5622ffec3d..45c927cd27ab 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_link.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
> @@ -363,9 +363,6 @@ bool dc_link_is_hdcp22(struct dc_link *link, enum sig=
nal_type signal);
>  void dc_link_set_drive_settings(struct dc *dc,
>  				struct link_training_settings *lt_settings,
>  				const struct dc_link *link);
> -void dc_link_perform_link_training(struct dc *dc,
> -				   struct dc_link_settings *link_setting,
> -				   bool skip_video_pattern);
>  void dc_link_set_preferred_link_settings(struct dc *dc,
>  					 struct dc_link_settings *link_setting,
>  					 struct dc_link *link);
> --=20
> 2.31.1
>=20
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
=2Efreedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7CRodr=
igo.Siqueira%40amd.com%7C9724972184d64ad6e7e008d913010665%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637561717696066502%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;s=
data=3DvUFEeBJwjTDnI9l8MGDiW8%2FoX7LINZi%2FfD4A004QfLs%3D&amp;reserved=3D0

--=20
Rodrigo Siqueira
https://siqueira.tech

--5iiisomfo5jomjiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCZpsQACgkQWJzP/com
vP9M0A/+NBbj7WJiiyUt5nux2faTu8ULmnTYYKDTfd+uiBd8BMTETnF7zLXw8oxG
uQqjVB2WgUTaQ7Z+BiQ5eFdRfQH2/JCv/w6CAJS8FwCHUTIGWNO4o6C28fxCY6PQ
pUL7RDzpr4wrPOS900WhEzi4o69HeCHOF755Z6dL11Dyuwa8XROB6wa311wmQEch
gJ/07Ud0B3jixiosFv14r+xlIlXBmPZs145FEWQDbPJEnLj4X73vfp4G7gFDxYxj
AUkYeVb686prSqyyWmL0pgQSbImdHJy5ZoDFe/qfpO84j3BxW5V0mO8NRCAt4Thr
PnuYrI6vjChLO+bFYgpkcza+q+0UURSYevzVCLdLU1lgZ2lTbj+WoZrWX5MNqwAx
WjDR9NycP7TA8GWgSj4wWbk4SLF+65/yrVS6r2qbceBJMLmamYRJBZNzY0i8zPXi
I7pGiV+wTUMM8aRE0cY+MpN+WQrm10g3PQmYvdlSI3aR1N2YXy8IJfk7vM0p1cNi
1cNWd8Leo2YAF48G4btwfpogQ1QV8VHER24tNsAjGptl/mSiGsPzp8uY6rEaTD+Y
q1Z3nq0gX6uABSphJreVc4FTU5vY7EM0pT5MEm1oyU8oYdvvPYHrA+Mhj1NktNpL
opUXhMIjSHdXBui/d4m50YARz4MKpduRk8oAvIhPwAX675TUsoQ=
=owiC
-----END PGP SIGNATURE-----

--5iiisomfo5jomjiq--
