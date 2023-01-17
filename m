Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E866E59F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE2010E2FC;
	Tue, 17 Jan 2023 18:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3B710E2FC;
 Tue, 17 Jan 2023 18:09:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2RG6T0gBtI/QZEHEvH1kPY97Syql3bstsHEjbRrt+RhOV8Q4Ulcrw1QSADH38s9gFCPxKwVSLlzdvKx7BYXEsHWEgyo/fOZzlrXeAauc08xpa8lhno5FCmqknIKfcNBaitPXTTOUUUNIu0+z8Vh2/wn6SUhpucl1fTqefXw8eePWEWOzR0dTBN79PwIM9fKob70iMBvieEimDd1fQpZq4PoQZPAhCzYUlpkJKbA2ijchVsd999gENK5SiQ7uMN5NnNOapKd1jj0HmNRuJvyIm5PXHfGaPqKKBhLhfrGlQEHfRRY6QtP0KgdWPZ5hA/Z1KhWfH1nhINdYWzLCThw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ealXIeCoobKSQKEzlizstH+yg7rncn+KgL2966DjYvQ=;
 b=FJ2Mh6FshiyYrAfgZSXGrxiL8ObOwo20UqbESf+zxDAqY9JHbC2AJ9h8uJvnPi9/qFpl31JLH8MEVZ9GKT3TUiRRVlkgzZ70jznyyj/U+KcgeLwvvXuvYIJJ3HaXD1QuBVPUEHlojiqMbe9QlBH/qachgcYqwg3NHukU6xSo9qvB3qkQjfnOxMrBGqSJ6AMSKieWKsdBuINzjc7Z1+IbQ/5ZnUlxnFajWNWgqmA1o5fokIzrdO8k9W4c7xHP39/PvZC0jO6GsA0rFXT18s4jbxNaKrLJEvJi0fI8zfRxeUKFskwrvvWplExOcPj8QGNvCjUO0+TvHBcX4HruDAU+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ealXIeCoobKSQKEzlizstH+yg7rncn+KgL2966DjYvQ=;
 b=xbR+hAmr5YNCQjqh4zPEPYExJEB6EPLIe+fD3kRQRDmmngmw1x6QLzp3vhOhpapcMSIrnCKvla3JyqcDnAW0cGAshi2aJIpbxl6uy9NAuRymGrz2RkTeIUHTvsL6h+paPBucYTWRcf3csgoVplKlvbwLGt59CX/wyqJLHVvvwFA=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6195.namprd12.prod.outlook.com (2603:10b6:a03:457::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 18:08:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%8]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 18:08:59 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] drm/amdgpu/vcn: Remove redundant indirect SRAM HW
 model check
Thread-Topic: [PATCH v2 2/2] drm/amdgpu/vcn: Remove redundant indirect SRAM HW
 model check
Thread-Index: AQHZKp2l1MSpqVkrKES+9mLYPlTkJa6i5/Ig
Date: Tue, 17 Jan 2023 18:08:59 +0000
Message-ID: <MN0PR12MB6101FE6B2CC0AABB239DB06BE2C69@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230117175836.914304-1-gpiccoli@igalia.com>
 <20230117175836.914304-2-gpiccoli@igalia.com>
In-Reply-To: <20230117175836.914304-2-gpiccoli@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-01-17T18:08:58Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=1cea829e-de52-49ea-8527-2bfd31cf2150;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-01-17T18:08:58Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 9502d296-c0fa-43d2-876e-85890abbba4a
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6195:EE_
x-ms-office365-filtering-correlation-id: 6f8f4834-d1c9-4354-060c-08daf8b5e838
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Pjzuzy1IzDL4/R7UcWk/rUL0CeQjbGKcvFGx+j++ZgmoF1ADxsqqq1AiI9uuKn0dVYXyvkWYozXVYpqimLXu+2rVyD4k4083pwysW4M3qhxoibmKaHEVgZAf2iBja0VP8AjOsHw9+LeAvdYTfylqrdm25SSVQlIOCREmOs0g269y93JI/OdbHSdjW9CKpajnSlb746mBf0zVlvbKBmcLnL+5N7J/m92zJd6aDXnB5GYDCry85J+p+IBkamwsn8TEOOmKksNfV5+eAZ5AxNRR/nUQwj6+or1AYze6pMHkfmGrDWcXJ9o9tw77aeulGl1hAW3oAif68YM+B1eZllmsu+CjgNaRObdTlVTCrf/lN+g7M/KVfxuR1G0nh+/tt+Nm+6gPV7+X+09WAi+WmKCxAPSAByo3IdNZTHrNnPJqWnfVTr/9yspnTpNLJxCi79D4cfFFe85DFfZL2kjb62SK8W6ggVgPv0Q1euITMnwXKtbnTe8hafTX/7vj01MVN1rIZ6RwiXbJU8H4TIuwqiW85ow/5Z1dKIsJoRmjp0LjUMTJnC+KMH6KgJWso1FF79trxTmAa4sZym2WNtv4R6E2+MM7nXO3vrtZZ3JVleHHh+RLOTRfUOcjCmeQG8eILUuUN4pPgPQlHElqXJJ8cilHYGCaYaD2hiiTIN5RT2CdW02croueWVmY+L6yV2G5S59YPP68HCjM882WPFR5pQqmpwJXumX2lh56y92hhbMhgw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199015)(55016003)(33656002)(186003)(71200400001)(478600001)(7696005)(110136005)(45080400002)(54906003)(9686003)(26005)(2906002)(6506007)(41300700001)(52536014)(8936002)(5660300002)(316002)(4326008)(66476007)(8676002)(76116006)(66446008)(86362001)(66556008)(64756008)(53546011)(66946007)(38100700002)(38070700005)(122000001)(83380400001)(84970400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FXpTs+Fdd3W0IwQzcTyGN2+Sg5D+zsab4SNn8YACTKrdxOJgaJHce00osaLU?=
 =?us-ascii?Q?wWV+iZw1b3MnFrKnKBcCwCCkjq48SzIwbG3VfCYZy3JXjv0SUOq0tQybLsk/?=
 =?us-ascii?Q?YoR2lz+vFN8DnCwy5zchg5xjTkiPb1E4G2wAqsQWNgX1gCKrqRB+qK67EzZH?=
 =?us-ascii?Q?YtIFJCgR7HtohhYw5kPxjR98vegVKccZ9nkZvVwR/3UT4T9efK1vtUiMHLdm?=
 =?us-ascii?Q?+vSW7FT+n5nF63IlqCl9xR/dXASRh72re/MIUBBEJCM8cl62q2hgg1sRTHTQ?=
 =?us-ascii?Q?e+GssOTAe/ZB39QggRDJ98+JNn0WeMQX7Y2LrEyzBIFl2/3XWYNgzdZtmRTa?=
 =?us-ascii?Q?zWjlRAn9enwUMF9c2MTWNdgI8imnjqEo68LB4FNt9YTPs4rjTLNrAJjAN/He?=
 =?us-ascii?Q?2UWLKYfhB6lgsl5vQm86YU3ZG1dDgAjWYgd+IHtIhJhPh9vChRVjvdnl+Oil?=
 =?us-ascii?Q?4XPwX9Fq5q/rxVjQF5lm3Gt5rJrM3H6sNC/EN7A1JSA1POSQV885XslRjHzh?=
 =?us-ascii?Q?bAVjEm0LAydXftufdZkS9fcw84GRt8jHW1u0FewBzpJhd6HCrPtoaET96obg?=
 =?us-ascii?Q?DOdN4Z3vpGkZ0R4AoffsMnkGfK1t4nqiIjP73/m9Uu7HXxwAI1JHmKpKIZhI?=
 =?us-ascii?Q?A5coQWuihQWKQQ95ZGWG/XGOcXR/luEj7eImeki+1t866wE/b1xez1NYRs35?=
 =?us-ascii?Q?hAVvgS6Nwpag6vsGwaocoU2P3pkAOn3AqgN4iUol4gLgVYhUy7SxEmadpyVa?=
 =?us-ascii?Q?qc1Z2apDsAqhAPuMTuDjIJpsUoz1DM3rJlAbxUjO3yOvk4IYo4yHWggv9zeF?=
 =?us-ascii?Q?1NyZbMPJz4QKK79I732NgSjO45nDozPXlqpqsckhJ6XvhCoYCNcjjd0ySWvf?=
 =?us-ascii?Q?xHuTiOHGQHbQzrhjzbMG+Zxhz9EFMjz/Z7ZNVwPURpC91g+o/y1+3sO+y4wS?=
 =?us-ascii?Q?8stV4Ab8YO6DkAaagPB1bejQgyUOH3szE5egmVM8iJo30E5pyz+gQsTh9st4?=
 =?us-ascii?Q?rgGrJ49CsmhqxsM9PVVPP3z1UgxFgvSlHbk7RS/8jwlT3t5ytAO2Cm7jWz9z?=
 =?us-ascii?Q?IAuSybZdNRBgxX0d9Bej02qeOY7ELBby5s9qBpmCfrzQntudHoDb9XMUKCRx?=
 =?us-ascii?Q?ISQ+nSQG7s2v4mbXwm5Al7UZLOLtimkNZgjCD/k14CfzKUq/ogj9m1g1c17Q?=
 =?us-ascii?Q?K864AL+2r9U70MuJ5j8X+Ey4DodPa93RF7Y7366nA6MLMewZm9tZwsTDMtC4?=
 =?us-ascii?Q?Ho642CCbm6c2CKSo7hgfC+6i7XuIXmOY23g6DixT5O3zUlhY8Vd9EWzixTj4?=
 =?us-ascii?Q?EMuJNmq2gpkkggXJWhaAc9DG2cDdUNk4q2ljLviuI4TPOaXZFMw+duqbxhqG?=
 =?us-ascii?Q?fXxlJ7o/W4IXjm/j1ZDFVPjjTXVOh888Q6jKugJp1nJkWZWhAzTLO0rZf1MW?=
 =?us-ascii?Q?6WBGBcYs765luoaN/1OTN1l0ETSl9Q+R5QRVm8qXsqhtwkeP79Ld1vw495rR?=
 =?us-ascii?Q?BXK6cuhLtvsI9BoxzytUylRa+eS4hCqrcMMlnsdfRWMGHD6ZtcOtCfTVB9Kl?=
 =?us-ascii?Q?Ny6tK3ucHXlG4ACexWI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8f4834-d1c9-4354-060c-08daf8b5e838
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 18:08:59.4632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jZPozl7xXSViGhD2Lf5OnxeYkA/KyVN8MldFo1V8QobFyo/eSKgXEqdSlqpg8PgTAOuD+yH5Eali8m20ZF4LNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6195
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhu,
 James" <James.Zhu@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]



> -----Original Message-----
> From: Guilherme G. Piccoli <gpiccoli@igalia.com>
> Sent: Tuesday, January 17, 2023 11:59
> To: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> kernel@gpiccoli.net; kernel-dev@igalia.com; Guilherme G. Piccoli
> <gpiccoli@igalia.com>; Zhu, James <James.Zhu@amd.com>; Lazar, Lijo
> <Lijo.Lazar@amd.com>; Liu, Leo <Leo.Liu@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>
> Subject: [PATCH v2 2/2] drm/amdgpu/vcn: Remove redundant indirect SRAM
> HW model check
>=20
> The HW model validation that guards the indirect SRAM checking in the
> VCN code path is redundant - there's no model that's not included in the
> switch, making it useless in practice [0].
>=20
> So, let's remove this switch statement for good.
>=20
> [0] lore.kernel.org/amd-
> gfx/MN0PR12MB61013D20B8A2263B22AE1BCFE2C19@MN0PR12MB6101.na
> mprd12.prod.outlook.com
>=20
> Cc: James Zhu <James.Zhu@amd.com>
> Cc: Lazar Lijo <Lijo.Lazar@amd.com>
> Cc: Leo Liu <leo.liu@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Should have added this tag too:
Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>

Looks good to me, thanks!
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>=20
>=20
> V2:
> * Changed the approach after ML discussion- instead of cleaning up
> the switch statement, removed it entirely - special thanks to Alex
> and Mario for the feedback!
>=20
> Notice that patch 3 was dropped from this series after reviews.
>=20
>=20
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 81 +------------------------
>  1 file changed, 3 insertions(+), 78 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 1b1a3c9e1863..02d428ddf2f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -110,84 +110,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device
> *adev)
>  	for (i =3D 0; i < adev->vcn.num_vcn_inst; i++)
>  		atomic_set(&adev->vcn.inst[i].dpg_enc_submission_cnt, 0);
>=20
> -	switch (adev->ip_versions[UVD_HWIP][0]) {
> -	case IP_VERSION(1, 0, 0):
> -	case IP_VERSION(1, 0, 1):
> -	case IP_VERSION(2, 5, 0):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(2, 2, 0):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(2, 6, 0):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(2, 0, 0):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(2, 0, 2):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(3, 0, 0):
> -	case IP_VERSION(3, 0, 64):
> -	case IP_VERSION(3, 0, 192):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(3, 0, 2):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(3, 0, 16):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(3, 0, 33):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(3, 1, 1):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(3, 1, 2):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(4, 0, 0):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(4, 0, 2):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	case IP_VERSION(4, 0, 4):
> -		if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
> &&
> -			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -			adev->vcn.indirect_sram =3D true;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> +	if ((adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP) &&
> +	    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> +		adev->vcn.indirect_sram =3D true;
>=20
>  	hdr =3D (const struct common_firmware_header *)adev->vcn.fw-
> >data;
>  	adev->vcn.fw_version =3D le32_to_cpu(hdr->ucode_version);
> --
> 2.39.0
