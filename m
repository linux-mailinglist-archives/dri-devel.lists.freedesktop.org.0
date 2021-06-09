Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291D53A1CF4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 20:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8296EACA;
	Wed,  9 Jun 2021 18:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEE26EACA;
 Wed,  9 Jun 2021 18:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPrfXE3VU2lt+JMIOXGbKdszBQoUs72wsBH+OQXPWHJYICqSlcUmtu3UPsbbu63jPcOodT02xy1wrDq1M8tY5650KJQmCuCMxyfm9T9pVHrxQwekFIbtNx+TAw84RCDN5JatOgezE4gtnIq2xUTYT9bV4pa6x1UOnVgsj05Nx2Gj4BfSL3QIN4wJgbhBrxIYTxhjNr5pZssbzRpiyoHLhoP7LcQqhSTkB15Fl1UmiD+czxeQtwCA/msM09sCsgmR3BX0nNrIipsW3qbJrIVDUqtjmzY5rSDbAV28cuVIuI1EqI5/aW9WHXZqzxmUmYbDVLpZ6SwxB1Th593JVFWPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7SYrA9dsJ3PbY8y4sCOYSUvTnWsvXxTkjmgbrJokW8=;
 b=Tbv8bvuCXsYCIEWv1YXR/S4lySwxHLTiGzCwMUmq92+T4zrqIztSqIWBoQCpmZWf0evy7MThNKqmZQ2LIAyXi+dsCqPHP8V2zi09Z5t7EZnzh3JsfHdn3s++QPi+QkHnDMDgskCypLc80iUsJh5zEx2mHcIuzsr0Yijd0ljFYY8Nwr3YPZ4tCwc534v1jPUJQdfw4aFiqbJGwKJZ2lhaW/ieZ+7zze9RcoFnGJ7X18Uc7diKbWZae5Mn4T5We+Hk3ucOwf4UPxGTtizsGTlwpdqFY592cDSwvV6t9TjcEIMVlGH5wL4YohfVrPe3Zu38q4VY2yVmjwKwSZ2MCvIpsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7SYrA9dsJ3PbY8y4sCOYSUvTnWsvXxTkjmgbrJokW8=;
 b=OBLey/tBkaDb27VBIHymsHrkArat7hKr5FomiNvmsOy3BjAaVgE2GoiwZbUKyS4487goDbhEPwgcoUTUAa3M8P+bKy3v9+KZQqyWd1Ma/nQzz0+s8Cep1YLijySeM+0d8/VKNlKv0EEaAV+KxyVeRE4yYy0KCUB/7We+8lqy0y8=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21; Wed, 9 Jun 2021 18:43:31 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::5531:f7ab:4bd2:2925]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::5531:f7ab:4bd2:2925%3]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 18:43:30 +0000
Date: Wed, 9 Jun 2021 14:43:26 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] drm: display: Remove duplicate include in dce110
Message-ID: <20210609184326.wuyxpphkx3cor2je@outlook.office365.com>
References: <20210608030126.23206-1-wanjiabing@vivo.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pxzjlqqtxgfwedd3"
Content-Disposition: inline
In-Reply-To: <20210608030126.23206-1-wanjiabing@vivo.com>
X-Originating-IP: [2607:fea8:56e0:6d60:c986:fe95:a01e:6369]
X-ClientProxiedBy: BN9PR03CA0648.namprd03.prod.outlook.com
 (2603:10b6:408:13b::23) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:c986:fe95:a01e:6369)
 by BN9PR03CA0648.namprd03.prod.outlook.com (2603:10b6:408:13b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 9 Jun 2021 18:43:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d305a7f-f1fa-4559-d212-08d92b767a1c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4268:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB42687D87C86073106291A84198369@DM6PR12MB4268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQzK3mN4Yl2hmdalTszdff1d/4Eg0ec9OsfhVUaRI1d4J2f0qaMgZC+bHHE23iymabyJTEQbzYNkzdJAP91hwkhBV91ko2lIcGnKBitz8XqPU6nf5aMlL734XKRrFOAoQlwNk4R8jIU95FAO+YrmaybdNzG/92A9EbCi7VBWJCKwVrnK+J60oCYzsKz5NrbGP4xpxAVBnypwDb3g6LM9gSmbaoDjQZQa6z6kkFHUkb8EgXcDISPytGs2+vtmUT8F7r8tIMb/0oZeD/m0P03ZWPPKamjbwneD3TywGlwcmMLDNOoJPFVkAwUU2q7pMi+mGYCLtWeqcakbQoU6YWTseFQsvhuoCRphfjCbBIkSsWgpvU4iKsWg76nFgJgREijokPRZk9dDzQ8Zr11OrZKUlzt2Ap70sXXIQmynZGdeKd1tvr1aMbMMEdZ2vMB3/63C3I7xn+vCt9liCWxhmuQ+GJasbnTce+hZACdIpmvRnYgjgMoGDzqyv2jZ+O4m7CmFPM4DRZFENnCs0DEL3RFEKx342F3tl2bCPijnDirRJFxewS5tEOow4hEE1yRnnpG9ElSJ+x97YrdFoYciWs2BKDopZAJFgE/UaPaRuhqBHYvp941GTPUt28HlWeuovo9Lo03X6Bxv7Q8gqu2j5O55HVY7SIZWWUVEpGmz4cLynFyZwDVZVaeQatfXEJ95lHfRZGxCT2mnGkvrPMutuMia8elUBdectN95qk18heDZ2Sar4SymCjMi8GhwVsoPMH3Vzh5PtQDTQ/QiMXsC7z+pbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(8676002)(6916009)(16526019)(186003)(21480400003)(8936002)(4326008)(66946007)(66556008)(66476007)(83380400001)(9686003)(5660300002)(38100700002)(966005)(52116002)(316002)(2906002)(7696005)(44144004)(86362001)(54906003)(55016002)(1076003)(478600001)(6506007)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x1FYg6eBoKfJg15a3Tiz5daO6Jimri1vSNlxX2PRV/FmDCYddyRAmar44q27?=
 =?us-ascii?Q?Qhp1gayrWOfF2eQGhP6xGBVRZb0bxbqtRi/Zx/lNevs9zI0zkcJtoe/ykWdW?=
 =?us-ascii?Q?2x7OZt5u5N2lzYFzS3EcVeqwmBx+Id2Dq3haiXdy+oX0jhdzw5ov2HPcGkbS?=
 =?us-ascii?Q?9o36H5JXJCVO970cOJ8nQxnQQcq+3RLaUZRBaQCWbc0xAxLrQUR39+om8pPD?=
 =?us-ascii?Q?QNzEOEsIDBCtJBasMYVMp80jAv3KofgfNMGQna1Cucmu4LXJfq99QFoHMzn8?=
 =?us-ascii?Q?lqDc1+yTF8Nq7lI3z/SHCvuVQAHc5QN7XbK9sQsrysa0VFRrD/IU2FOO1iNK?=
 =?us-ascii?Q?YbMDuIfEl/0Um4IpkGMUXDE96zNOPRrwHqoYtNycRCL01lPCgW1fHoydEwZx?=
 =?us-ascii?Q?+4mLucgBisgRCpmiuZS5SlYGlmXdePRHoxvcnmSRF6xOv6xxGZKUDzefIFis?=
 =?us-ascii?Q?K6jhLfJxUxo9M10CtqCnvDJf55Lz90nICx+p/qQwzWCG3D2qb+SYzdA2wWdw?=
 =?us-ascii?Q?IHdt4KcEsVThux3mxv7yqt8dNS3GoOH121yWl+vUn17V6F6nxI6DeKXY92JE?=
 =?us-ascii?Q?ZiZolafQ5MxtUce3uI80PUyFMgXerrSM3evCmEgc3ZROriKbWODEqcKJWhvT?=
 =?us-ascii?Q?sNRyXaKtv3WzXjuqYN608bAfZUh3/mU/+GO/OGd3XT8wcEf24UHex1UPIBPg?=
 =?us-ascii?Q?HDiQBJuO4guGeD5WOBpuYw8R+CxwZAcQdJeGq2mpQKZYnnXQ0xAlZtBV9R4+?=
 =?us-ascii?Q?ICx0W9CKQe5kgf7HEJL9p1dW3ZQISSASIpadOO00Qkcg458zbM/0PqtisUJT?=
 =?us-ascii?Q?MZ153QF+JzL03yfIUEpcilod9rUveNhy2o6ouv4m0OIIOQPt5XDlQYuNyma1?=
 =?us-ascii?Q?tcVwsOwkRDNfegL5p7X4xTRjQGoqv2iB93PG9N+RHnSetLLsr3pp5rqUJIRf?=
 =?us-ascii?Q?EJSwAjs+5VD3cpZEA2wxB8mSwSp6smZKtlrEzcra0DA5DCBiQi08ty1emfi7?=
 =?us-ascii?Q?VCDrkkDexHe8TYqy34qGK4WXNoxTV+jlmECFoOMAxUWvOeSPAiJc0sPgK3/j?=
 =?us-ascii?Q?lWkxDKfaMrpuzYvKV4jDoPap1YkwGMi/gGq5vZ7TUbsEs0+TOOMtwhDcHLPf?=
 =?us-ascii?Q?C5zd2M4MKwiRnxOPHclV0EL62FZrxWlJutMEusu8r7mAe8HHUG05nS2Czv8l?=
 =?us-ascii?Q?lwLhcPjWSEGpQsaCkJrFp19envJ1bEAmZfkP4QVJOGB1R/PMpqIfiLGXOEkY?=
 =?us-ascii?Q?9Uk28rUUgXUziSV+sV5V8dm+nNh47wHAQgEIa4P1g8mMrywO6oTY4equ6mRD?=
 =?us-ascii?Q?Jlgs8VPsLWu5VHO8gX6CPw5yh6m2TfU0EKU3txeBpLOavrt+Fi2fH7K8iToy?=
 =?us-ascii?Q?yKKg6KUEkiDIOb2ns8C7yIJVsxO5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d305a7f-f1fa-4559-d212-08d92b767a1c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 18:43:30.7208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGRgqXrxy7V8loz2V6ApYzE08DdDtlTaeJV0eZFJUFrefR10yvNnY0aXyE6AaKA/WIF+IEFwOKiSvjnO+/0mYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
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
Cc: Ashley Thomas <Ashley.Thomas2@amd.com>, Jake Wang <haonan.wang2@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jun Lei <jun.lei@amd.com>, Lee Jones <lee.jones@linaro.org>,
 Hugo Hu <hugo.hu@amd.com>, amd-gfx@lists.freedesktop.org,
 Yao Wang1 <Yao.Wang1@amd.com>, Michael Strauss <michael.strauss@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>, Chris Park <Chris.Park@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--pxzjlqqtxgfwedd3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/08, Wan Jiabing wrote:
> Fix the following checkincludes.pl warning:
> ./drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> 35      #include "dce110_hw_sequencer.h"
>     69  #include "dce110_hw_sequencer.h"
>=20
>=20
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> index a08cd52f6ba8..e20d4def3eb9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> @@ -66,7 +66,6 @@
> =20
>  #include "atomfirmware.h"
> =20
> -#include "dce110_hw_sequencer.h"
>  #include "dcn10/dcn10_hw_sequencer.h"
> =20
>  #define GAMMA_HW_POINTS_NUM 256
> --=20
> 2.20.1
>

lgtm,

Thanks

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--pxzjlqqtxgfwedd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDBC8kACgkQWJzP/com
vP82yg/9HgXoRpwNifZPPEC9y7ER9TnVuRQDjr4cnVFVldPct3pPhSTzKiA0xSxb
THkq8BP5iCEIcz7heKfsH7h2kTflTFXljbNVhAUq0T1y1Avaras48jSLFNcvo/Jg
2jmxAtHJgLXAZIteQ5O0SbTnNUg+6i4TOfTJUYG26Z3nSThWg8fRvWm1LilePWT4
Cof/599FCatvSrx3YlFSmvS2b1Iujhmy4AtA8DCPK5qA5UtHStXEJKX9lLbIo+3g
og+AJOBLO3ATD3A9rSCaoAuTEgas8SQLZ4hUdwDNLU5tKHqcEl0DcJ2n+52S7DQ2
5hIbBPHDeKuanPGBIEVOzv1+wa2GLoRifsMdsMm7dn9BSq33ujilIimDw2osRvrF
WcSZyI510eh5PEKup0TPTLgQ01y3a29cyuy/LAOteqsD75kx+JPgGuZh65KjnrKV
AeR8Mm8mGEVgQVU/OU/kQoL/Suo3t7eCBXdZPu805TlHEh4S1ExpHdg9VZQuzrBD
BwG7lAYqQ4FPc5R5b92sCPFw+kH6qNihoYooMFIuxBWirhZWruu6zs1sexCLnkaX
VqwJPE98/PVlNra5+CktvA0MVTa9uE8wbmSzwiJdy1HHJlg53/SC02kvkisNQepZ
TJH1JPrV/rZA+ObBPlYfcvRwTbs5zc+IpqhiAEUN4XSSAIED2L4=
=PJj6
-----END PGP SIGNATURE-----

--pxzjlqqtxgfwedd3--
