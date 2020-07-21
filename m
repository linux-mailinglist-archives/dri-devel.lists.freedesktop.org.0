Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3379227C04
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018766E546;
	Tue, 21 Jul 2020 09:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA526E546
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KO2B6JIlzIhqGsw29et/ulEO9vUvwPwp/IM8+2yu7VXkSM/AadzDgyfI8i990TtyIcQD+cQvqbVFk8gIUb6/Eg3dz4TynGjpZlksRUTiBJ69DHsdigc/pwcKr7WgH/w6ynzJezKp7ACDqiEFGfRS06RC++vCia03UYFFvJ85BAwkxJwuHdvERqvdtR4B1jNuUdasGILuvrJ4L8GN+BfEYdDagq3K926Qcxhc8+o56Dxr/j8EpAXWy7Nx7g0t066enVUV2nZHvmEhtXXkSG8iBHf/gwsAaEwGlBO2zsE7s0PtIsK2ED+U/LqMiwgRzEFrPXcKPwX/IKB4pGxTrqtI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFeWX5gpngDqDLstuTqPAzSuLGjI4ewhtI0ElUCeAmA=;
 b=JCONPV+b9ASnI+rkQygepjpvcSWqY99o9cd0aJadr7z0Z1JKW/T5AMzzL3eCgfjGMkB5jOP2F873RpLeGiZNkUiPThXrsPVnPkDy+g8Z5nNRsnkCF9zYWS/EEzibsiTLhqDTrJkVms4Psh1PLKH0kQpcJ1Ul0Khth5UzB1JIa4Ty/jQlIk9M4PvhHE9czERg2ATxHDOyWiBFOyQAxljlTtfFnFHCfT4OWc8XYr6qz1R7zJi2w1VsFAWVhEVzxUkaZ8Wnepe7lR/ZxVItbTVo/aDgfZSEVfo/E5su7XTwUT86c0GDZhLj8/RCznXI65bzy53q60XJBkwXZ0J3BZqxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFeWX5gpngDqDLstuTqPAzSuLGjI4ewhtI0ElUCeAmA=;
 b=xRLJnM70owWIOGJ5bZkUEI65KD/v6D4ODQPwu5Nw2evpQrqK3/MX1JO4yEow0SxnF04saOC4zSxgE/7Wla1gS1PaZC7tV+aKGYl/wqWcQRC14pw2xsyC8r1P1hRKg7YYDGzDvio8lJBI/Cb8uD2pezezCLRm0QYUcqUtJuerLCU=
Received: from BL0PR12MB2433.namprd12.prod.outlook.com (2603:10b6:207:4a::25)
 by BL0PR12MB2337.namprd12.prod.outlook.com (2603:10b6:207:45::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.26; Tue, 21 Jul
 2020 09:45:55 +0000
Received: from BL0PR12MB2433.namprd12.prod.outlook.com
 ([fe80::8106:ca24:2065:cf04]) by BL0PR12MB2433.namprd12.prod.outlook.com
 ([fe80::8106:ca24:2065:cf04%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 09:45:55 +0000
From: "Chauhan, Madhav" <Madhav.Chauhan@amd.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH 08/11] drm/amdgpu: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Thread-Topic: [PATCH 08/11] drm/amdgpu: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Thread-Index: AQHWXzEmZLpo1i+/gkOjC3Sde3RdzKkRxBuAgAABlVA=
Date: Tue, 21 Jul 2020 09:45:55 +0000
Message-ID: <BL0PR12MB24337151CF564B084E1A47AA9C780@BL0PR12MB2433.namprd12.prod.outlook.com>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-8-christian.koenig@amd.com>
 <20200721092809.GG6419@phenom.ffwll.local>
In-Reply-To: <20200721092809.GG6419@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-07-21T09:45:51Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=ecffbf3d-d2ca-454d-a361-00004a18f6e3;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-07-21T09:45:45Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: c4bac43d-820b-4550-84cd-000051602925
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-07-21T09:45:52Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 9d295064-b1d7-49f1-9937-00001d5c3ebd
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-originating-ip: [171.61.68.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2160a10c-072f-4cc7-0021-08d82d5add19
x-ms-traffictypediagnostic: BL0PR12MB2337:
x-microsoft-antispam-prvs: <BL0PR12MB233742640D7B7A86128FC9199C780@BL0PR12MB2337.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gcN36Ber/5i9HtFH1n3LnOaWAMDMYlR37c3y9GSBeno0Rk4ehA8N2xCSRogrsDDQQq4UJI6fDb53AV5DzYSdYPU0yowl9wF9QQjnM+HrYm3th4fQ+ruG1B5ekleVEYsFbx9x9ihGx8wg1HHYGBTjfo9IgoN+r/hsKU9redoL+uNZtwBn98JGMK847m1gKezscciPKTnWhZUN72vkxR/YBW/EsNIJ0/Koe/D1ioCE6O9sZYiWGv1uhRIQvFBIGDctoWf1T0KyZMGlaK8yuIjUvKgz/dsqFV8MJgsMPMKCBoxBdIdzjAa/S1aptB4cW/V8LtRSXKKL++Kc0EZOWw/cP5RrW5JpGqc1bQ9JnZUL5rVftYBQ51SE6vTqEQKr8SEruPHLASLRIgq8c9AU9/hmBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2433.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(6916009)(7696005)(6506007)(8936002)(5660300002)(52536014)(55016002)(966005)(86362001)(9686003)(26005)(66446008)(64756008)(66946007)(66556008)(66476007)(186003)(316002)(8676002)(2906002)(76116006)(83380400001)(83080400001)(478600001)(54906003)(4326008)(33656002)(45080400002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Y6ewlCYxMIDD1JI/RsPXIvSwYC97f9s82dZ3k7PlutYX57CrOMh/DtHhucFwY6nmioYupAWrPuf+lK4IzWA7ybx4V4g46UwuzhdWlqsaj60SfelFYh2cziZzVaV+eRKLYguLpKteuq3NTILIzDd+1BKFh5bNqXdfw3AN2Tts/MT7unHIdxJf3T5sTSjFcRE/I13Z7hgGLSkM4EPOeOpaYnZw/9BtxqFKZz8eB0Yu7lTEnVXtN3EGJGw3sydsbdK0DpTpDG4UX3WRVvac0pY75BGNTeAqk8sKP8pOzmifuhA6dJ3U5lJddE749KsjYplBhWWT/QpXzu80dniVfV76NqsDUzhttmhM8noj/CCBwxnzvgJl+zsHQ5qmrPiP3voEA6Ul0axWZNzdQoCpiNFv9ZVex3Tfx3SX9b62IBCQon8o7UGkXmdnCrFwrsuEMhOIn5UhVU+B0Y6xvgigIW0lvmphJkD9TahLf6ofATqPih8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2433.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2160a10c-072f-4cc7-0021-08d82d5add19
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 09:45:55.1455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rk+1iNFnCJp5nxSBvndo9Hj6lPEi6+ekUNO6qCKaRv0y9wkKE+Xl641gjb2QCI+bQXt0DG0MfcKsABrfeRO8vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2337
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
Cc: "michael.j.ruhl@intel.com" <michael.j.ruhl@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

-----Original Message-----
From: daniel@ffwll.ch <daniel@ffwll.ch> =

Sent: Tuesday, July 21, 2020 2:58 PM
Cc: dri-devel@lists.freedesktop.org; Chauhan, Madhav <Madhav.Chauhan@amd.co=
m>; michael.j.ruhl@intel.com; tzimmermann@suse.de
Subject: Re: [PATCH 08/11] drm/amdgpu: stop using TTM_MEMTYPE_FLAG_MAPPABLE

On Tue, Jul 21, 2020 at 09:32:42AM +0200, Christian K=F6nig wrote:
> The driver does support some not-mapable resources, but those are =

> already handled correctly in the switch/case statement in the code.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c =

> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 44fa8bc49d18..0dd5e802091d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -84,7 +84,7 @@ static int amdgpu_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D 0;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> @@ -93,13 +93,12 @@ static int amdgpu_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  		man->func =3D &amdgpu_gtt_mgr_func;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D 0;
>  		break;
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
>  		man->func =3D &amdgpu_vram_mgr_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED |
> -			     TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
>  		break;
> @@ -796,7 +795,6 @@ static int amdgpu_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>   */
>  static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, =

> struct ttm_mem_reg *mem)  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
>  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
>  	struct drm_mm_node *mm_node =3D mem->mm_node;
>  =

> @@ -805,8 +803,7 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_de=
vice *bdev, struct ttm_mem_
>  	mem->bus.size =3D mem->num_pages << PAGE_SHIFT;
>  	mem->bus.base =3D 0;
>  	mem->bus.is_iomem =3D false;
> -	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
> -		return -EINVAL;

This check catches the various special on-board memories, or at least I cou=
ldnt' find where mmap for these is disallowed.

For various on board memories (GDS, GWS, OA). TTM_MEMTYPE_FLAG_MAPPABLE  is=
 not added while initializing the BO manger.
Can you please elaborate??

Regards,
Madhav

-Daniel

> +
>  	switch (mem->mem_type) {
>  	case TTM_PL_SYSTEM:
>  		/* system memory */
> --
> 2.17.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
> s.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7C
> Madhav.Chauhan%40amd.com%7C38d9dcf0a17344b8fa9008d82d586405%7C3dd8961f
> e4884e608e11a82d994e183d%7C0%7C0%7C637309204946382107&amp;sdata=3D4gkueE
> gTCU%2FQBqZS%2BepCLjEp%2F%2FEn%2FmhJl6EjB5LCfsQ%3D&amp;reserved=3D0

--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D02%7C01%7CMadhav.Chauhan%40amd.com%7C38d9dcf0a17344b8fa=
9008d82d586405%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637309204946382=
107&amp;sdata=3Dg%2F4b4hJZZ3XehZmCVRi61GfCiGIwnJZT8nG%2Bb025o6k%3D&amp;rese=
rved=3D0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
