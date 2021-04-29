Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E1E36E9F9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E63F6EE6C;
	Thu, 29 Apr 2021 12:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F9A6EE65;
 Thu, 29 Apr 2021 12:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W70G6HsQDDQmUTjt1L4Y5fT7JqB9RzAsrwYZu560LtG9OV+8pxm6a+lC/oe05ClFZJ+DPZUQ16ohlUcoGlzGzn/TmeQc5r0e29Jsne0TMaMKIX9eNunL0SAavWt8tPwCkUBEUxCrWJMKURvwRdRlaY4XWk6WqYl8cyGQF6TNo4If3TOgs7w/zcLPH5x8ofkhmiyuKAroTZb8EaNs1CRNrZNsoYg/819zBmSwH0eEWOm6MS6VMKjIKSK4jOn2xawMdBjz4IiMg852BeOSLAUVotXHoXlH1Q3WM7orAeKme/rFzP0UFqnOcm61+gh8Eh5o02zX1BCyAtFyVwTe0skRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77EKHJO2+lORrpFR7iFZ2OmAw4LsrUTPhYOiUpL2W68=;
 b=QOfYtfl6edbefGUfozuWL1y5oX6NgzP6V4Ji8lajKnQ1px4HMablOtlgE77FizR2LsCxDLlUogRNb73WEtMw1kq1q/CTU/WonyG+Ayoi8/T8ynvwaGs11cFbZYv8KoSUjFvPOcFlUF5WvrQk1zc/K+C6oM2WH6KGugw1NoEs4pusklKrtByR1WwUTmR7YNOEYGas/nz80LLNtyWSM95zjmCQS3SPgtJKJO+MDbXZGx3ijKUBvmsjAK1f/O2hJxywCyaLVxGK8Tdrl+W9dSpbtSR+iX8TTIvH+TqE/G7ucO1COMk/HrF+UIxno39PfLVY3IjRAxBBiXgcQxvivotpAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77EKHJO2+lORrpFR7iFZ2OmAw4LsrUTPhYOiUpL2W68=;
 b=WhyO3GWq2Ppp7BQ85LqiMAVxStFV2/kKEpMqf5vFiYH6PzMIaVlpEEVYuPwvtUlaPH2OSpM/y8sA457KVBgMzo4xcdxQYUbAIrHDgCOio5/dGWL/w/aqgGdmuEA8S8B7WvD+KINefZQ5TAaU+BwxSuL38pSVu5VUPOn6q1H0ABo=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM5PR12MB1145.namprd12.prod.outlook.com (2603:10b6:3:77::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.27; Thu, 29 Apr 2021 12:05:08 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 12:05:08 +0000
Date: Thu, 29 Apr 2021 08:05:04 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] drm/amd/display: Remove duplicate include of hubp.h
Message-ID: <20210429120504.sjruq5a3w2hdtusy@outlook.office365.com>
References: <20210429030412.18344-1-wanjiabing@vivo.com>
In-Reply-To: <20210429030412.18344-1-wanjiabing@vivo.com>
X-Originating-IP: [2607:fea8:56e0:6d60:9d3b:95a7:19db:40c3]
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:9d3b:95a7:19db:40c3)
 by YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Thu, 29 Apr 2021 12:05:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0d27faf-5ed8-4668-8c47-08d90b070849
X-MS-TrafficTypeDiagnostic: DM5PR12MB1145:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1145EDAC5CEE1BDC71EAB449985F9@DM5PR12MB1145.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q58yVJtupTaUNHU9N/11jR9TnZowgRCqh4wzk3J8Bj2Z38KnJS14RWvLDxTXgg8MjNdNWFQl/25gAJ7vpAvQOCL3Xl41IIE4Z7L7nqRmL8RgYN7zdjvI3Yq5AptI2T5fGh023IwWpAqkaEqNCcQS91KrFgZ0UubGt5LjqN0WY8DvB+XsH3g5AQwHo46SnubdTGHcLtd/boNpBsaAE1vGILQUAoMZ0F+zNmaCJgjjj1P6oW6F8OclJ50bKGac3unlnspgrg6h0n31y/cm85G5aeZAgWOYdIexUPHXTQWWF8d6z5DCSqtL+cXGz8qyqaGiW9M1jUxfMv8FG5wkrCEeJMK4OcHIY6soKX55mOaoCSqZ7wLtvOBd4ydLItPGs049FlixTEXVsn0z1IUlR4mjNbjH54sBungdSZj12kcnYA+x6k8eIhRK6rfopNUQmTUYRn3RdUmNPf8Te9o/Au6rrsjrPZotM6pYlypTNnO/I34AsQSYYVFWVR88g2tHIfCF20WlcH8/+Y8L2rn9hTzG9gMjvHYIsb8nuw7qcNTevT9LaegZ6lx1pOFN1tYxQI1JZbVpIAHkSPt+D4piKkMee5IWAziIw7ZoJGYgzVlZwTKohsMQ8sQgFha/hXSOj5gukuohQjrPnHQREJpgq9Kbyo2uPrsYjBaliVYkmx8MTbhKkRG9/EZdBS0G/jnDku28ZoAIhdd4yqS90E+j0dHgsPjkky5ewXBc4fYBNZw/Vfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(52116002)(478600001)(9686003)(2906002)(6506007)(6666004)(966005)(54906003)(21480400003)(6916009)(5660300002)(186003)(8676002)(83380400001)(16526019)(38100700002)(4326008)(86362001)(8936002)(1076003)(7696005)(316002)(66476007)(55016002)(66946007)(66556008)(44144004)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IfBAJkdayhyLzrD4nlE5zt1JD5qy5VVcD9Z7KwRvZbtWj0/isfC/ZzuMs7Si?=
 =?us-ascii?Q?ou48Jj1xuKNe1q6kOhGcZlg/tc6d4rsTusc86CZs6KjsxYtzxBx7lZm3ZkzC?=
 =?us-ascii?Q?bmscCh+++C5Ju0Su1UGfI1LXCqa27p5r8a9HZtguagyJydH0x/xK8bVqH2I0?=
 =?us-ascii?Q?n2uFUk92r13s8N/WITDcaPbmBFLss6oIQ0YAM56rPXNpJ5zpbXATD9h0tHDY?=
 =?us-ascii?Q?89IX8itL1Aw7dmQeXvBDOAW0AC/beuyzDwviKu4wOEDVwAKtEAaeHe/juAJQ?=
 =?us-ascii?Q?dGpgIQeXr1A5SOvXpEoLfx4cqivJztIJe/ylmdsGezwhcvAVrqL3IjxUEFLj?=
 =?us-ascii?Q?xicy7ji9nPZvimH/m1ijfQbzcmgdFaaMxXtNVJ+EiXLy7P2kMM53MPvdoBRI?=
 =?us-ascii?Q?my/MwWgmW/TDqfxfns+iF5CRIJLXK/Hf8FWLrXR/EKy/uh4M9xglQX3qCYNh?=
 =?us-ascii?Q?ZAmvrVyToAFTX2UAiBYKPrx0wtlEuF19CEMbwXjkgz3uQX+g/m82S5oH5gIN?=
 =?us-ascii?Q?YyKQc7ukDalmlCaEPgDIqGentCBjxqo/pUymRnOXEHFzPdGe3z4tPnYyL3xg?=
 =?us-ascii?Q?DBE/xXhWbJpP/n+3DbBX9VZSnHnMjuBEzRdGB8bap+N80lTA7o0wZj0FO7Oj?=
 =?us-ascii?Q?vExoOwzNVFVcxY+t59OM8tM2zBCSf4fi367XRmrxu5ZjdiO5+qR+WXadPHHA?=
 =?us-ascii?Q?qv9kZME5egc+Qm4ZINNEsPZ9XJRmjJzunrkXV4yuybBFmDtPrKOtVmARY5Mk?=
 =?us-ascii?Q?rgOdgOi71f0Aqz+TMXhViaWQIOYpMcmHPRXqNctIAtPJqkqABPM/uEum4Alw?=
 =?us-ascii?Q?7z3jlOye0mWN9B4CNFNelUfrxZgaVA66BhlNWnrqNrPFYZa8sEWTwu8oy9SJ?=
 =?us-ascii?Q?7oa5Vpmcm1C5e0MjuSo1eP/FY1XgqzFVyOInuMgTfgN0BDkE41m7GyYMEmMR?=
 =?us-ascii?Q?b+0P6DZE6YGjdhGO3EOGhJJ080X2K+jfJvUd4o0JJCTYpyF+5XkJHdLNMZhi?=
 =?us-ascii?Q?j8BxR04v3TTyTLyzewI+2edl6EMwfUC8A7uIizeCSTgKipEyRQA91IHLfpHJ?=
 =?us-ascii?Q?EZIXHo/bZ01Z34uMeszCgQzaudAhRrpOcopCBYdw9mlRHfkEnbTb0PtF0j/2?=
 =?us-ascii?Q?yyok55v72PT7KxZIYjW222bZdL5HCK5ulAOYSXCvT4+Puo7fth+9Ry00B9uq?=
 =?us-ascii?Q?RYBochRuiAbygz6/I/9eN8/8o2sTdnk8d3AHDkI0aEmnEJ2nCDCuEzWaGfUO?=
 =?us-ascii?Q?jZZZpJbV3wSYjA/hzHTKb7HurgyDeCevZR0yUy5B2voM7UvrSThhZl8Dy61x?=
 =?us-ascii?Q?jF2fcjscTSGRwx5GmHspSUZhPSFVFj2jd+PUV1sIRK+jQfQGZ6mOhD7su8Vp?=
 =?us-ascii?Q?653D7Hv0WVeGopHmDnvq2V4akTgu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d27faf-5ed8-4668-8c47-08d90b070849
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 12:05:08.4078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPua8WGTf5FEp1PCFXT03SHbChYBInx82DrRJw5R6EpS+3mNgYtxA+ULtrldtai/nv7y1ERIsL8t8nWW4SQlUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1145
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, dri-devel@lists.freedesktop.org,
 Chiawen Huang <chiawen.huang@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, kael_w@yeah.net,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1280017746=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1280017746==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qz4nnjzgkciv5dyg"
Content-Disposition: inline

--qz4nnjzgkciv5dyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Nice catch!

Are you using any tool to identify this problem?

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 04/29, Wan Jiabing wrote:
> In commit 482812d56698e ("drm/amd/display: Set max TTU on
> DPG enable"), "hubp.h" was added which caused the duplicate include.
> To be on the safe side, remove the later duplicate include.
>=20
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/a=
md/display/dc/core/dc.c
> index 8f0a13807d05..dcaa6b1e16af 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -58,7 +58,6 @@
>  #include "dc_link_ddc.h"
>  #include "dm_helpers.h"
>  #include "mem_input.h"
> -#include "hubp.h"
> =20
>  #include "dc_link_dp.h"
>  #include "dc_dmub_srv.h"
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--qz4nnjzgkciv5dyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCKoOsACgkQWJzP/com
vP+agQ//arVeQU82/PUFoyXH7PTUt3SQKVbpyBnC0yxDsBX5JblvMkNkPQKhrOUm
HASRepMZjw19i1+B6NJ8s4v4BYutE7/nVf5AaNSu+b9Sl2I7xGwDnnr8r3M20Ni0
+xSf5XGFyX/VlPEwtuZhGZwgZALavJ5gFIC+otsuE6ACkr29BNSZyeHsXd8COSSl
oErm05YBOta2DHW12aekcgBfqHHSabf7L2ETLbc5505YJf39L74Hb3h4JFgQqiZf
yof2vyKFShNON17hsIpOGhPHqmHHLwmSMQCUIVhG7VGj4hz5zPT/T2+DdU94nddW
s5/ov9eXkJcHyExNKXoVzxjlxWjgomOfgr5FVbZeknJZw0bg9GnqRz9Nqg8LsqAL
pzW9MStHhePSPxdQI0lAFeszrg10orVV7e/k5sKmWzjeU2UfPZ5ZITorsguRKTPv
hNIhzKzZhaxM1BCxjbQvwP9M6IuBZgVCVcYaVTrDSj9nvRpOgzhHhMIuWRp0/gPH
SZBm07Z6fUiYlZ0HznG+TLXQcfFpGRuZDqNtJ2H0ET8Cf/t1aFU7KiElSaPJ3z/J
SaN2MMK/Lt+9QrDn46/ZH/bx2/4R68DtgkZMf+p1JvNbabpap7oBIqGx/RHwaFBk
SF0tzO81Y7E0t7Cbw3uCFkUqVe51jnP+HyW17uQDkqP0uPYmUhM=
=txRg
-----END PGP SIGNATURE-----

--qz4nnjzgkciv5dyg--

--===============1280017746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1280017746==--
