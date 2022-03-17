Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8144DBCB6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 02:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D529110E07D;
	Thu, 17 Mar 2022 01:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4635710E075;
 Thu, 17 Mar 2022 01:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gX7FkkmfowbikBXTRl0mFLrsY9DDPR6BP+d0/AeK3x8YbwBmkc2nKYHQBZyXDSr3Vb+2kJxu1Kx7DuoZ9ge8+1eGTuUzJ64KN9QyZxQiPVJcusKh71zC0rBe+DH29hH69t0dDpTv9V7c3/DMKC+HMLWfi87DZRDhPQPcNQRcisft/Blg/okZPuhkqlfDWlnmeCV9Pi18Ny6mM0/Niexz/PlgsIGs/0qDcoFMo8hy5iPPXwQbkUIerBq7bD2UO+ErMMWELTOzMoCt048bsRNc1jjp2aqzBTfrLByfFoHEZEYdUwZv/uiitlWcwlvQ0v2Qvr7zZXIl4EUp0yysvXjhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjhuYY6YTYCwq11pOcsU/XDkqcx3vG6b6366J2IinUU=;
 b=Glq1hVLB1cVKI3sy1RawA2zwV4jvNSgPR+/EjK4pt3J7sRSmeEHQ2BtgoCc603+QjlYE/ifeqtLBMoHSEhW5YWsgeDzIZ71Vv0YFPm2QUL7r0BhBaWRpjrqfpaUaRgQAPLYdZGwmmjb72Ckxg7G/Te9aKHhbS22mfodhWiKDvKfwKFJTk0ULnrKNX6xcoemnB40WXIjdA2ILsBYGfIcd2ZmNMqNx3kFfq0F6uR+InCMILMkMVydT5/6VvSxmsob6CT3viIOy+pGzDTynDodqKIOsHYTlT3ZxSi+YHqlksdgWgONS0SLyus30XXFTOy65kWG/GK9k/PKzSNas3t1uMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjhuYY6YTYCwq11pOcsU/XDkqcx3vG6b6366J2IinUU=;
 b=Tou3iQvlrhPa2gXwMTdDz+B5MneuteEt+qsqbaTsKrEP8HU5S6tu6U08I8dzKXwIGRLgpPomnYzc3AnmZPXW7Fh3Fu2wdooRxaliytA/IlUQTLQR8qE/WSaeb/hIZOWc/Sc9QPq9sDYRYmf5qkVvXHGJn68Pwo0JtbI81nSh+d8=
Received: from DM6PR12MB5021.namprd12.prod.outlook.com (2603:10b6:5:208::17)
 by CH0PR12MB5106.namprd12.prod.outlook.com (2603:10b6:610:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 01:57:28 +0000
Received: from DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::60d5:7585:9936:5104]) by DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::60d5:7585:9936:5104%6]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 01:57:28 +0000
From: "Yat Sin, David" <David.YatSin@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: amd-gfx Digest, Vol 70, Issue 199
Thread-Topic: amd-gfx Digest, Vol 70, Issue 199
Thread-Index: AQHYOZS2c6Lvy/QIfkeV2+L69kSD96zCz5Sg
Date: Thu, 17 Mar 2022 01:57:27 +0000
Message-ID: <DM6PR12MB50212F8389AA6EB60A1A2D7A95129@DM6PR12MB5021.namprd12.prod.outlook.com>
References: <mailman.598.1647476383.943.amd-gfx@lists.freedesktop.org>
In-Reply-To: <mailman.598.1647476383.943.amd-gfx@lists.freedesktop.org>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7745aa3a-4b40-42ca-7c63-08da07b97d67
x-ms-traffictypediagnostic: CH0PR12MB5106:EE_
x-microsoft-antispam-prvs: <CH0PR12MB5106BD895FA447006ACB8D2F95129@CH0PR12MB5106.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M9b/6BVMm92g/21Y2CVaePMXRXnjblTiV/ifUeUBFuVbDSn25SAyR4UfFx3wDTGNUIu0XblLbAf5jHfqGiwcwkKEc8NZ5WY54k7GrEMlfDitbReNhy5OdhIZSBhWt9sQblUwHbLuVCxTtEEBckkmZhT/pgQfKbWqn178+aiOAolLNsSfTudpGOEUbbHOGni6f9LZuxEIKAb8PDszJ/YyLqz1YHE863+GNoWC2RHR8c34UNmVVxnE0jZXbOWyzbcgQ1Pew83hMrdK9WT4UvwtITezEczgwgGKuZ3C+jOVlFdFYZhwc4SyRH7qrQn5V0meZuAzW5AlusACNq7dOfsrcIH/mwW+orumm7ikwlMgTgNgNFpDPewSILiApH2MW+jxWXYeMDPoJ2A/9zFYyAZMljkE6qKrBy9o5LafjKeSj2YbmhLvYPp1hg59xRbwdkIrn1gBtnbz65RbAyq06a7Q+NRtm97/eNh9MYPybxnjcXeZQv4osIBuMnf4NY+9t8g4m+OckaQKUj8rdeQ0U2M7rCaSV/mTyaTiHk47LOMXWfTHn7tYH4krcoOFXs7LdyoJbyzkuB6VmvfMuOeOMk/ZPk5RTUBBQqXqS6cv6wN6AihE63X8HIwxZDbDqVXbWnJWVPkZxnCSFQaRonCNPvwwAAys8J02GFZzugbyKbh041mH94teonIYh1hwTVaqyYtoD6iBNQl0SqgzvYOLgB2uaw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5021.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(186003)(83380400001)(38100700002)(122000001)(26005)(8936002)(52536014)(5660300002)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(55016003)(2906002)(76116006)(508600001)(7696005)(316002)(9686003)(450100002)(71200400001)(110136005)(33656002)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kkyfpA2zFo6cUeBI6DYX4FMI26GfEeAb1LgMUlsKf6iEJpGW2ul7CSA122KM?=
 =?us-ascii?Q?h1q2hSsA4yqwbPYJqDIASBk4kqfGwQQd3MyPoBBSdBXAOYEqUMxawnAsMByT?=
 =?us-ascii?Q?qOyFPyFfwkZubSC2hwjHacPAY+IA8T31ff3XcecXwjSuWujoMaCiL0EG34rt?=
 =?us-ascii?Q?SSgEbIKPakk6aKeGId+nOne1Bo9+RVIxwLFvpmFwrhQLGlbgGLYzT6+3QTah?=
 =?us-ascii?Q?eHRgE/qXFZM7DGk/aJEdCrWPd+QrpdcSxqJygDxbcW1ckC+E0i2PveOIz8ZW?=
 =?us-ascii?Q?VSwbWbdMwpV1wLod5WpMd9UC6GrL3Gd25U5VlDpdT4ZBFF1oXP6FO7vqd6DQ?=
 =?us-ascii?Q?AXSGxka7k9hFaIQwoXDlJBEjIfEfzoXYLm4bJWXF6p2wTE9chLS+q7grABup?=
 =?us-ascii?Q?bE+VT+lO6QEcFYqRV5Y+gP8//5Xr42ZzoLvCSe2D6atCbPYB61nNDvy5yDs4?=
 =?us-ascii?Q?kMreijCIPRxJtYvtwMiVqFMQAhqsCe6gDoOsxXPvRB+xCVRp8DM2UNrBAdVY?=
 =?us-ascii?Q?J7KVvScEw3DoZtqCfwtt0r57BT+qukTFJ7ARl/xP66UpKSN6Uedssu3YAA2G?=
 =?us-ascii?Q?Nb9GBa5arIGuXwt/efzo5qdMIV64oCsxt0+7tD7nJWaL8CzryhIfAT/lVxp1?=
 =?us-ascii?Q?Yl12Ih/SakSFLJCWizW77t6u3aUfQ/fl6B87EOxH5hFKOo0eTwMMnSwY3enM?=
 =?us-ascii?Q?DmmkG+IF/b6KmkARuubl21YyMamPKnV8i7XY0UfF+BfknefIpG5RGc4+5QU0?=
 =?us-ascii?Q?iKZoVX5iqJQb45LPecRuAbVaqJb6fKqs20XEpyFr8mtPh/4VhcEC+SsVlFZZ?=
 =?us-ascii?Q?RdTdzjPyxuGF7KI3K4JG7rtAxHcFCkTaaaZEVfDvntwvkjCuZkFlvPxQsMTR?=
 =?us-ascii?Q?hs8gJ7hLAMuZPgm+KAclvg1DOJyHUJBLHKK6H8D6HFuy0mvg4GgQihpVch3B?=
 =?us-ascii?Q?qa0gl7vJDMBnaRx9l2MqNgN1daR4c8M3ysq757fAo4JHssg5fZZOIE+KRaAx?=
 =?us-ascii?Q?G4/WI0/Nyg5V6uFsSvVR/JoHmbhw1jBdawaHlhfpuLpdzUkMPMEqGIXIkhTC?=
 =?us-ascii?Q?3OTC9wqDAjbQOaM0MHECsOsCSbjBGO40sCNz8jiuhcAN9tpvKIYa4LkdJoe0?=
 =?us-ascii?Q?dVm/tLanz5gDI4JAym8HXuhPGzANOJKYz+NHA2W9hwCTjYGEWlG4bTVtw2F6?=
 =?us-ascii?Q?clHgxtD2pjjziE1yzIS45fAihR7ucOuVFwelvX/Y0MYoQLtvLWWNwpKF9PmP?=
 =?us-ascii?Q?mV/M99UCTz+hpzSiv3UTBGDxrJ+nOx3nEcluiXNBTOpfXncxakZs4g4wm/FO?=
 =?us-ascii?Q?1vbOE0zHZTqucRe8pMOZocQbf3IMZkoIY/PiEHTLpB0a132eJGpsfM4XmFy6?=
 =?us-ascii?Q?VpdM6lgA41o+PNCKDsWOxxyrC2oDDAqxWfcWwtcWQdkWITUMLXXP8mnFgllK?=
 =?us-ascii?Q?bSMSZ9o29z6uyK3kVS2OqMK5+mMKHWdN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5021.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7745aa3a-4b40-42ca-7c63-08da07b97d67
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 01:57:27.9063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 85QISGhlFCzo74c5NdtrEusQUr2Q+yqfgpF82gQxrlTULqSO0Ts6GiaFCkKdpeS5zZnKTtV1Ihq/ETDIXdj5DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5106
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



>=20
> Use proper amdgpu_gem_prime_import function to handle all kinds of
> imports. Remember the dmabuf reference to enable proper multi-GPU
> attachment to multiple VMs without erroneously re-exporting the underlyin=
g
> BO multiple times.
>=20
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 ++++++++++--------
> -
>  1 file changed, 21 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index cd89d2e46852..2ac61a1e665e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -2033,30 +2033,27 @@ int
> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>  	struct amdgpu_bo *bo;
>  	int ret;
>=20
> -	if (dma_buf->ops !=3D &amdgpu_dmabuf_ops)
> -		/* Can't handle non-graphics buffers */
> -		return -EINVAL;
> -
> -	obj =3D dma_buf->priv;
> -	if (drm_to_adev(obj->dev) !=3D adev)
> -		/* Can't handle buffers from other devices */
> -		return -EINVAL;
> +	obj =3D amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
> +	if (IS_ERR(obj))
> +		return PTR_ERR(obj);
>=20
>  	bo =3D gem_to_amdgpu_bo(obj);
>  	if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
> -				    AMDGPU_GEM_DOMAIN_GTT)))
> +				    AMDGPU_GEM_DOMAIN_GTT))) {
>  		/* Only VRAM and GTT BOs are supported */
> -		return -EINVAL;
> +		ret =3D -EINVAL;
> +		goto err_put_obj;
> +	}
>=20
>  	*mem =3D kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
> -	if (!*mem)
> -		return -ENOMEM;
> +	if (!*mem) {
> +		ret =3D -ENOMEM;
> +		goto err_put_obj;
> +	}
>=20
>  	ret =3D drm_vma_node_allow(&obj->vma_node, drm_priv);
> -	if (ret) {
> -		kfree(mem);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_free_mem;
>=20
>  	if (size)
>  		*size =3D amdgpu_bo_size(bo);
> @@ -2073,7 +2070,8 @@ int
> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>  		| KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
>  		| KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
>=20
> -	drm_gem_object_get(&bo->tbo.base);
> +	get_dma_buf(dma_buf);
> +	(*mem)->dmabuf =3D dma_buf;
>  	(*mem)->bo =3D bo;
>  	(*mem)->va =3D va;
>  	(*mem)->domain =3D (bo->preferred_domains &
> AMDGPU_GEM_DOMAIN_VRAM) ?
> @@ -2085,6 +2083,12 @@ int
> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>  	(*mem)->is_imported =3D true;
>=20
>  	return 0;
> +
> +err_free_mem:
> +	kfree(mem);

Should be kfree(*mem)

Regards,
David

> +err_put_obj:
> +	drm_gem_object_put(obj);
> +	return ret;
>  }
>=20
>  /* Evict a userptr BO by stopping the queues if necessary

