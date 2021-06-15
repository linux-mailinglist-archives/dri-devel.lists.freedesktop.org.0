Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3163A7E72
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 14:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CC989B99;
	Tue, 15 Jun 2021 12:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA63F89B99;
 Tue, 15 Jun 2021 12:54:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBDP0A1BbhpDIHs0gIKR6cE3IRgxWMahi3k8KPqqfim7A5pqvjX7f3DZpetX6HjqfhUAa5WDHICEKynzKH7OP4ic/ftD6CYVYqtbEVIS5KBJAmQB27IE2nr/dfL0w0GTocKBDmS6dHAy7Njwg95omEmLd+rpx03j64Ek4tQry3qQCLw7Imgje9UlRuhGW8zDO6niDmxu6ikN+K5hAu/vOddr31vjADFJfXg8c0GpJWZFRmYGTnNziIxRev9N+8LDLxWGgDuavknoWbryx4COfZu97oNRuQu0mUXrDWupKWUOt2Lbg3r6okjhWofLYeM87oimdXpFxx3Rx/hUSiW/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOQRWLIdz//4ZgiCeRnXT8c3Yu7I7HQORgc9Fb5eSCs=;
 b=ZwXjS8NQdMttyoJjv/hu7xbz445uDL4PDE9pLKJBPCwmI7quo9678/2gNRwAI1WrW+AMHq+3WeHe7EhWUDlYv9EeIToH4cNCcJmQlrG9Ss5Mbh1RPw+F0MCMchUZOsw/TP8LfhtP2uuZzpcbXwQtR+kBsYxHtm9LHr5+G8G0+wxIgbL+WhPoLx/ftoDsf1lwbRppwcwXiaTZ4wHIpeifP4o9ssAe9RCNaL12gnov7huor73nIX5XjghLkCsnFMqzGYQbhSGwl109xfIHrhJ8Pl/y4bBRmBHgxW6Lz4gJjZERMHs6SaMZ54ZVflYmTjq7HxqRAOcDXqrM9Vg3Xf8s/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOQRWLIdz//4ZgiCeRnXT8c3Yu7I7HQORgc9Fb5eSCs=;
 b=10cDRmbZCE9mauHbC878etG4Ov8Io7t5p3Wg+5p5dpc6DaO7tGV2sSZmqE00cCUTZiZnaGtG3BFYe7vl6+8BibGRiVXlDVaKb7PECkXZew29uJ1N7TxY+xD5L0QpfW1wtY/oCluQC7F9r2GlC63Z4A5Ly6jbz0AwNKyb2NATywI=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16; Tue, 15 Jun 2021 12:54:06 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::5531:f7ab:4bd2:2925]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::5531:f7ab:4bd2:2925%3]) with mapi id 15.20.4195.030; Tue, 15 Jun 2021
 12:54:06 +0000
Date: Tue, 15 Jun 2021 08:54:02 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] drm: display: Fix duplicate field initialization in dcn31
Message-ID: <20210615125402.nhvl2g7q2da4sb3r@outlook.office365.com>
References: <20210615114410.7708-1-wanjiabing@vivo.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d63avojbpbqa34ex"
Content-Disposition: inline
In-Reply-To: <20210615114410.7708-1-wanjiabing@vivo.com>
X-Originating-IP: [2607:fea8:56e0:6d60:f0be:9db7:9ca7:cd1b]
X-ClientProxiedBy: BN9PR03CA0316.namprd03.prod.outlook.com
 (2603:10b6:408:112::21) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:f0be:9db7:9ca7:cd1b)
 by BN9PR03CA0316.namprd03.prod.outlook.com (2603:10b6:408:112::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Tue, 15 Jun 2021 12:54:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b29afb4-7763-49e2-e2f2-08d92ffca8fc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4338:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB433822D4DAFC16CA9A17107B98309@DM6PR12MB4338.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1puZ49+8TA24GEljBOvXo4JBW4/PlQB3S0WzVn8m4IlMqd6t4Eyx7tixjD+RUKb8MesS1uR+l5b4KcQSXdoQAz6fUZQLHUIxTTJ1rY5BjB0ImtStPYW5qeE5fy9mk2WeCfZRwAPA3CvibFlxrDPKp8yExrqApV4AJP1hIm1sa8+tUkaUhW6MJ0kOvfSXJIFaV1xPBnfMOGAc2157QIbdZe/xQDF8JLFnnYN+FMGOiTye81y1MAlIUvPNPwSGqAVegEiku6E5tKLYvMOTSao3RGuHaTlytCTm6aXV/1yyp9rZMsI/xLqpttQ9SKGXQzlWWSH+mMICvU8j+SvVXalsecJQ5wfYuope32fzJmt+tPdn2ciXrSh2flpolT26CNXQUOAotlRyKYgXImoO0nfPFtlXr5Nzz/JgMOi83uvcrdZ5nnE3cxhGBsnBvU/Eat5wM24h5LaCoSxaPzCjxiWJjmjKZ6Eoqi+7EcSpq/4e561YI0iVUJCQD46dJcPlzPkAlc4bUV8rFK8mFBKfKk/CntumT/q3YUemSN3K7xc400BIKxF8U3/nqFHiqbvA4jBVvPmgb4lNPePfGvAnKYMCGOyAfcBHwFMX6MhdFlR3a9l4tEWSqnRw/iGKFfi+Tnqz40X7iQc3pMHk/kCigZT5MttkY9IKTF+QNAwhjQVFn8hkVfKZ97blk6i2j1tj6+k87pWALMp3Qc52q1SwQU87frEtznmxtpM5FTvMc5bZVlat2pHa4EWFa6T4E9t+66m+Jyg7FdEJCrjzZ+evxOevg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(2906002)(21480400003)(16526019)(186003)(4326008)(316002)(44144004)(8676002)(8936002)(54906003)(6916009)(86362001)(66946007)(66476007)(478600001)(5660300002)(9686003)(52116002)(66556008)(83380400001)(55016002)(7696005)(966005)(1076003)(38100700002)(6506007)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zInnrRh3/H4lyM8+mMqPJ+l2ZHLYdtdu0v00wf48zXIxmr3hYeH8tVQsnfNv?=
 =?us-ascii?Q?D8ma6SpLsNIOpz+fmlIQCGFh0zHBygb2GCaWSXJpJ9Dads/31PtU/LV1nB0u?=
 =?us-ascii?Q?/zfTAPTI9rMs71DUvWbwnb4xKwMwlg09d4hXzEkLXB3PT+QVMWdMojjnErpE?=
 =?us-ascii?Q?uNou/VJA4tR3vJ0KL7xqTB9ac+MXhK+e+8ZuQVwJAjm0C4oPF+obN0J/n1/e?=
 =?us-ascii?Q?UyE1zYsh0EAAAirc7WOHcjIJG1H2fR8FqPTziCbuzy4HsXgXTpEvPoWiGWV/?=
 =?us-ascii?Q?Luh7hUHi4KMRVS+xqPXTt7PkS/OqIyTbzGukzuumdgM7i+h+7V+9AGx1Ujl/?=
 =?us-ascii?Q?heSukuDOq3bS9O82cd9NOJZaBXzhHYxyxXiVAQf+leAUCSrnP1YJlnJuZmNe?=
 =?us-ascii?Q?AqsroGne0jAUDgMHLZjqTWgkvntB6ZLnDyY2/V7stQE6qpqP4L1eG9NIf3vH?=
 =?us-ascii?Q?nGzuE7PFMupM946nICY+KKvurY4y5gEGaipnYaAE9EnKdOc7cs1K5MqwtgTr?=
 =?us-ascii?Q?2/XijSe4+ybvf/oE1/kfXUPXCU63xeLbm4c0cuXgGWQ3C6DMNlK4U/DsOQQi?=
 =?us-ascii?Q?/ZpmGHzaysk5SB2hnudVcZvneM6BUrRpHP1DEug4IHHfimHuREoq1VpDR/T0?=
 =?us-ascii?Q?Bcf0ig00n3Dp8lo9cBueTvJxtGS14Tw7NO6Y8XVErFYQgH9FSby8TLxNJHe6?=
 =?us-ascii?Q?TTRiUwOWp78xQqThx+zfePhd7qWXMbSt0PvgqWd1vTGY0DRGbf+lhNSNg7dm?=
 =?us-ascii?Q?NnV/2OzoHmlYWW7FlXhcjD8yBMGxSRCIlqHPcGMidpLla2KVov4yq/jBho5D?=
 =?us-ascii?Q?mwijWMIaSWT6mRAvF+R+3Yx85vvXU2Bs0wi2ljBOiiEzQrL2EfWr3t72TcXK?=
 =?us-ascii?Q?9Ma7qy1R9NrLFGkv4ays+AGlkstcAQj6O0MX7Rx3UIVqAG0/dwBKSW3uKlra?=
 =?us-ascii?Q?Kmp+ILNw+dJs4RxAi4n26DBPV1jS4mznRHIed8U7D83KlPkH87mhMy9kIjmA?=
 =?us-ascii?Q?fyCL2ltFYqTsPS6hcrY1Rmoi4ggnIvnIrzOiZz9QMJi3divotgV+6ZNAfdjr?=
 =?us-ascii?Q?b3T7MsxeWGwlMqUBncJ9MHIEJro32Jbt2xJfIcA6KoftnBk/DEXzwlErELxm?=
 =?us-ascii?Q?/KtspX664GjWKUbhu2booKS6hXVOWa1NiYuCPnefwwYMAuAy8jDgcdeWt275?=
 =?us-ascii?Q?EjN1/O47bkT1yQk5fMD3FfC5SBEWx9mGp00nBPSjzwwnXBtQIZS5Bpe/KeFG?=
 =?us-ascii?Q?5H0zPSk5Y2sWI7xAUhjcyyz9SBerQqEhim7OvpOWTZI9HHjrSkHHc1WkDiDf?=
 =?us-ascii?Q?D+p+HpUiO05AtHev90ALmUZ9IWc47dfqgqL03JmoCV9dwk/5nqumvTcSFL59?=
 =?us-ascii?Q?aLf04voz27WQdhz3YQoe6wUmNduh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b29afb4-7763-49e2-e2f2-08d92ffca8fc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 12:54:06.6653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIsKYm4QsQz+0eriPhlTGicd9u5rA6aVojKSxumzCNvjrurAIElLUHX+NShX6x2i5dy+NkSamBODxDq0Rizq+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4338
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
Cc: Yongqiang Sun <yongqiang.sun@amd.com>, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Zhan Liu <zhan.liu@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--d63avojbpbqa34ex
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/15, Wan Jiabing wrote:
> Fix the following coccicheck warning:
> drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c:917:56-57:
> pstate_enabled: first occurrence line 935, second occurrence line 937
>=20
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/driv=
ers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> index 0d6cb6caad81..c67bc9544f5d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> @@ -934,7 +934,6 @@ static const struct dc_debug_options debug_defaults_d=
rv =3D {
>  	.dmub_command_table =3D true,
>  	.pstate_enabled =3D true,
>  	.use_max_lb =3D true,
> -	.pstate_enabled =3D true,
>  	.enable_mem_low_power =3D {
>  		.bits =3D {
>  			.vga =3D false,
> --=20
> 2.20.1
>=20

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Thanks

--=20
Rodrigo Siqueira
https://siqueira.tech

--d63avojbpbqa34ex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDIouUACgkQWJzP/com
vP/szBAAq8gms06heoxs6sZwMLPcw9UA/VPNrtwOEWaW/3iIwgp3Ur0PzoJtuqW1
wIy5bYq4dUDJhgFyY6N9wrpKpLyfjvO9WRylx3rIy+RA07eypdHp26NyDJuerc1r
MlM9/sgYmRQzffGAjKKnP/Klp64vdci3wpvfJG3B2GljwGNebOE4uJRhZwg07C/r
QBsApf2ftjz1IKG+jYYNINK7BvhaywTTL03ty0O9KZ0Kh4cPjJ4czNJxm3sZM3Hp
5H7WP8OcQzlxXmIYdy2CRotbLZ3k42UI20TJUOvufDqPaYHQ4UhEinCM3Hz38cOB
nW3mU3Zn/pjBpo0j5Mp3WRnMYg+ZCi6FC4AJAckG6rFrwdTpbrhCg+QAMER+z9MZ
XdmfniqRR0HiBOLyrTONxE7uNMNio+YpWH79HvZjos4lrUkLLjoQJ88xtPBI5Hum
AZj/cEu7QN7tsgCnmi17dr4PrWwju3/mK5Z/6K+tqf2Vcthlz9GHaTVzzEVBmo9E
xtvcWM7xrMVJUCZNAotq+sbB/Wm2BzLDCBrbu6FnWaSs7SV0PdB5XFf69ikBVUEW
tyjna5sDGMjnIkYjz3yx3xmkqVyv1CIx8GB96C/s7wwZEz9ztcJh9iZcOmKJ1bAK
GicbOpDYy0SaaqRpw87ew+I5WWuDGA5ckgT4LFPkRKeDveSwWNA=
=HhcS
-----END PGP SIGNATURE-----

--d63avojbpbqa34ex--
