Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F002037994C
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 23:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799B76E920;
	Mon, 10 May 2021 21:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DA16E91F;
 Mon, 10 May 2021 21:38:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+FVEIOcKkmcHO0D4FdH07IqcMSYGwtj60p4jVsmg+UZXpCEcK3NLg8JJyTaQguQ8fmp55b0LkNr/eMlrZj+Ag97ZUhf+vjgP8sTamGk7nPuFjfq/pXKK/qyFrR1dp4sLPa4+L0k6XOxeCflH0Fo1dAMB1W04VUBgwi0Nub1ndZrxxtXR0OZuZVEf1kINhnak2jBZpgllOPOMaDBbk+vNTbil57mYBZtl6Gs9fHdZSshozEnYj2iDwwMVAfFGWqmbsxE7ic+RCmVcDdwmmXz9mJqMJl7sD07czCFNjz5HweMrHVW6lZP70JkwFIUTfqQUV8rlxSgbbYmya2EzMHJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDj30sjZUOF6myuivyaSezkBqOH2NJVm9t5WpPFA1L8=;
 b=OZHMELQ8qiiIjmXl8NLxC3IP/OfNGA8r9pwIM/5n0fGp4hj3VYxhfmaugLPTjKpIZ1gsQN1fxagiQ1HbMN7vxgJ3vRPPVH/0bgKJxgm7PmaREoFhMT5eZZWj4FdW9hOuKJY30uvcsTcwvgDCfspjicayRWK/p9DlsiIw6P87mnJprlNGJGh0yKevZ+I0gLi0AxiPdRhPJq+fDUp1TNkOjMGP/HVrt1nVSMiLVRadVUmdvCpQZrXowG+tLt+AC6yNOuRinDigF/saO0dOdR35rc1Xv9/4YzCS8o73I0gfVM/YMYpJAcieGaP1UxNTu33n51BytWOSdI4a4CFVMxg/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDj30sjZUOF6myuivyaSezkBqOH2NJVm9t5WpPFA1L8=;
 b=FkjaD3nanAF6XvXcB31ACU5Vh7PGhUqo7uYvNtNl65CoL9v36k0a+MkYXobzc8dTUEsOGuJnIQnOLaoi0OzpnPgrCOb+OJ2ro4xcnLMBDdgyeXrS//eDQUs2jkPe8VMZqCs83kUPUM7OpeNcdtNuaxts6VOFuHbqNuLIjwdxVtw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM5PR1201MB2488.namprd12.prod.outlook.com (2603:10b6:3:e1::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.27; Mon, 10 May 2021 21:38:48 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 21:38:48 +0000
Date: Mon, 10 May 2021 17:38:45 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v6 15/16] drm/amd/display: Remove superflous
 drm_mode_config_cleanup
Message-ID: <20210510213845.jrxss62zisqyjeq6@outlook.office365.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-16-andrey.grodzovsky@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wwtxtiw4raziflzj"
Content-Disposition: inline
In-Reply-To: <20210510163625.407105-16-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:e50c:fb14:3ae:933b]
X-ClientProxiedBy: BN9PR03CA0380.namprd03.prod.outlook.com
 (2603:10b6:408:f7::25) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:e50c:fb14:3ae:933b)
 by BN9PR03CA0380.namprd03.prod.outlook.com (2603:10b6:408:f7::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Mon, 10 May 2021 21:38:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2711e1ab-31f0-4f3f-a76a-08d913fbfed3
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2488:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB24881405451528E6DD7EF63498549@DM5PR1201MB2488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:25;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMR+pwT71qF6ajE0vFYO57YPszjvG3KF8EzFXiJH3DU41IhUFkvf4zT1bJ313tjwikJOsjcPtqT994hl61m3ULeyj6SMMCXGScfrGcCzn3+n3tBIGu+gL8oMfyTQCSuxPZhqnPfBpAcNwJMvHvSqpjih5F+s1xNCxPdMMnbICtGUS6DxDqSK6JP+vQkzQiKxDN5oCfJF+2Xnax22MfXiFtQkztjW30IqxnakHMRxqJq/CBnb+LVR61jiNffz+bbozvGLjtpx44dnwipssg+I/BlkLDSMD7k5tEbEnVMMk//7dICACZTo2CytK6cY/uFCPFrjpXqTEj8r8FLKmkct3Fe2GRvgobnpcpVc4wPEWVTU7aihAcEQnmj+Own66kkelcPMGM+EZmuhqs/TjmbzJwbePTapImC3VACot+GTL4KHj9re5MhBogMzX4CM1l8K1hgOtxKzDFZYqJ+Ahxij1d/Lhfl7P3xPFomlBSlQoxxy+fOcPjGiJp2UasQ9gkdOgbPKT5A9Vhc414Rnt1KUTKmuaP0VhYEiO3B4aJbVpt5enzEZQOzzPvCoObmrNJlBtncLuUCzr40Pn2h7MKC7XMjXsg4ToN/vN5CLr7xYOUFDQLNa+LCSx1SBev6Q3r/YkQqeHNugpX9cJeI19o2/qlN09swFFYRpLyHs0xCS6tJd+jCr1FJZPVedTubpNJ5sLeHeF3rjIlQaGDoR9il5SgavZCYchx6kDhpWpcrmP08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(8676002)(316002)(7696005)(86362001)(52116002)(6506007)(6636002)(2906002)(21480400003)(8936002)(478600001)(44144004)(1076003)(38100700002)(5660300002)(4326008)(6862004)(45080400002)(66476007)(966005)(66556008)(66946007)(186003)(16526019)(9686003)(83380400001)(55016002)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HDaC84MVo7ZA0kkwqyxtg50mhO4HmODJGIFQRQpo9bg6keBJUJa8qkSCsssF?=
 =?us-ascii?Q?l+OLXmJZLrDgsygwpFQ9be9IvRigsggxuDXgCKKf9UDEHVXE8YS82EjSRvkA?=
 =?us-ascii?Q?SvGjXgmgOVwVgxJKCu8nUWwMRslV3cRuo1vZkf0sXuKK5N/AdFa2pQgNkjyZ?=
 =?us-ascii?Q?8pFnEsuoRwfC7jhLm7pNDlA9sGh79ehTp1RMDKpYOggF6rzoZaa02GXzLd8S?=
 =?us-ascii?Q?8AcSbGtFuthe4Xpv9MZ1UNRT2WUGelWh6vSgKHmWaYtLrNEYXqpPN9W4ZFca?=
 =?us-ascii?Q?HzY99rIPhmfHJOP8eF8Wo43qLK+Kt6hw/iTYy2IC2gFiIZn09plbfbvocEpm?=
 =?us-ascii?Q?rWaKUwTk/PygqalGrAyqPpXmK7f33LmKEAHao5WpsES+GR24nsWI4ix/zuQP?=
 =?us-ascii?Q?9xqK2nbk6su9d5KKQPfcqwE+4D8bLqYy9ZvBgOegSVcEd/vQYZSJ1qoAVGvv?=
 =?us-ascii?Q?zp6mNc9zB9MbhMNIQDjGJQi04X89MH0N0Z7EXInbsY/6TqviFJRyvtc2vv0a?=
 =?us-ascii?Q?bCaESFGR32y2BiZOgyxHj3yyyCA8cCIKU2fOgmrOTpDPZk4aJSzrROlvaDXT?=
 =?us-ascii?Q?moEFbgeoFEsFrw5CAnALofW3w/KE5CRy0ZWk37DEmMw59ac8I/V9JpEBlFYB?=
 =?us-ascii?Q?79b4GBD0HBACJ5YS//MawBzNa3j+LZ5iIl+I79buy1a7OrKV3Q07m1a9fGRV?=
 =?us-ascii?Q?UH0hJfii4XBRh0kSLmEkHt79uhLoVW90IEyEL3/kefLqmM5JWl56xm3pW+AO?=
 =?us-ascii?Q?HZyWBpJLHNiUy+ScPE4doPnMUCJD06VrHUfWy79Jg0PmQGHKMm7b4cfcooBA?=
 =?us-ascii?Q?NGL0ezeMDE9deyuU/7gYS2x9uymrh3IJu/g3ERkyu6npbJm0A5BoPhTjAF2J?=
 =?us-ascii?Q?fOf0UjwM+PsPOFPXuMsRxJYOHc/CcnWzmL/6cd/ldZCILbmo3Oo82eBnhaiE?=
 =?us-ascii?Q?soQfrXHGzh5L3Rq+51yd+TnZQzpjb+OaDOQaH9kF6qrmsv4fHivJJilCIguv?=
 =?us-ascii?Q?FSktv/ChZoqvAEiefOPG26+3vecIplWN0wV0HAqLKny7O6aTdMVSt7EiXIW7?=
 =?us-ascii?Q?7tNATwl9OuB9ggX6ml40G5r7hFMvoyzuQF7VfNbg7gRgtsnKvk+qnc/mc1/5?=
 =?us-ascii?Q?AtxOhdYfw9mZ1dngaUFdCdAI6+HtYAprY7aoKd1jxafepmpo/UcEAUFQv/rO?=
 =?us-ascii?Q?lR+djRpk3JkqD2SA0HD+B74QzwXM+dVm1ZYSEkGx4pTXcoR3Cf4bEIpf+rtX?=
 =?us-ascii?Q?gS8OQzOfV2LyP7wWZpD29Z2oO6xJbu6n+PFHHOp5jdjgdaAHoP9xJf8JYHt1?=
 =?us-ascii?Q?/gb7VoWEc9QUlOxkVfV6arPFWj5ZgRU7KJogcn4SmaI2ro2I1KEGW4BB+FGc?=
 =?us-ascii?Q?iEneLsDNrE1qfdqtkTTbcSvl5flL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2711e1ab-31f0-4f3f-a76a-08d913fbfed3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 21:38:48.4227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XileMU1NMmmlwmTlBvroWoAEOh0xTygMhmArBeMVaxLHk/yyeoE1ehwRTHH8supR4xGe4zV9juQCAUvnBXpalA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2488
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 helgaas@kernel.org, dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--wwtxtiw4raziflzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

lgtm,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 05/10, Andrey Grodzovsky wrote:
> It's already being released by DRM core through devm
>=20
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 6c2c6a51ce6c..9728a0158bcb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3757,7 +3757,6 @@ static int amdgpu_dm_initialize_drm_device(struct a=
mdgpu_device *adev)
> =20
>  static void amdgpu_dm_destroy_drm_device(struct amdgpu_display_manager *=
dm)
>  {
> -	drm_mode_config_cleanup(dm->ddev);
>  	drm_atomic_private_obj_fini(&dm->atomic_obj);
>  	return;
>  }
> --=20
> 2.25.1
>=20
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
=2Efreedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7CRodr=
igo.Siqueira%40amd.com%7Cd7ebdc33a79d49d6560308d913d1e32c%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637562614440095736%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DOtEAqSIaLB6CgKhLQGhIQc2A%2B6lprqGB31yqQts6OVc%3D&amp;reserved=3D0

--=20
Rodrigo Siqueira
https://siqueira.tech

--wwtxtiw4raziflzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCZp+QACgkQWJzP/com
vP/cEA/+K8Hf+x17vGtOdEpY2qEjKccnSc9phCOeaQGLpp4js8j/B0KFEcYvYihH
QmyojPW8VPD/+1mO2YFIE4G7QQfYSJQ19n9VXNXtsBJ5FzAsJbr00YQzbAqNP2a6
ydQSgJZtis/7UePufzu01bs34VDr4dOPy5ddkHuDDvq1lv2ot+Iyzprv7uOrV7jI
18rStTnC35Ewo4OJuQb8NIEBhlQuKzArYlk/IGThxGeu9WUKNTiqfR4zJo5JTAK5
Xl08Ff+d+uFeh0pBHmJGhhuBUV3/fRnoDw/50nu11MV4txsckQ1jB+MZGqB81muB
R3e4mQKlV963OljpVDx1xGRoZBnA5eTdGFmKXOK7rwK1FEu3seDTuBRFHERsIw+O
JX2DY/SIV8xGNnD/frrrDU9S3KiXCHdhbHAWn983oqHqQRuNK3jgUn5Zp1drBG9e
fs5r5LlV2g1PPVqVZgqpVJjhiIxVZmx0saDSufJgV8ZoHh9qGtQZoUB2A1DnEyBv
PiROwFPmnoOL1uiwzImwscF8YUlvjHS6inRYZvC8STQt+JtsnQpt1Qa/B+p2pBml
EYScFGQoOy8QIPkVeBJ+rhkKlJKwp6NF5wmThl5B6GeOnT8WyXkHh5RmuTZZ5JW/
S+qIPEURW1Pv8wmJ0/Gd5Q5aDHLurL0qlVEeY6HZHGl+5jDNyhE=
=tNex
-----END PGP SIGNATURE-----

--wwtxtiw4raziflzj--
