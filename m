Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5209555BB93
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 20:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7D111ABD6;
	Mon, 27 Jun 2022 18:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E448711ABD0;
 Mon, 27 Jun 2022 18:18:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXmM8Aa+BvqzX4WYAdyah6ma6OiU+iq7z0I2KaQQo9MWOcWmODoJJhWz4iVaA/Zd/QCN94z6s73fENg99S9q2q+84cAtIhKtvPetzp97DQfMcapogm3SWvDLWIoc0v3ZaIrMxzl2nYYPojs/qqZY4/CYa5m9WAdXjzMjWSOnnQN5AkXRQzTU7sD6B9DmJe92Y8SKR9UFb+Q2SPTLl4qxpl8ct9qemJ8kFcn16z70GaO5EMRQpO83VJ3ZgJcOliuSOivpOhrSHoQBOG/nQWNgshitg9RrK1wPYHVr4NR1cg7O0D60eSVV3SybQWzkd0AsXJcfbNDVc/7XEOvmLRD9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVF4Li3LhfaDRJyZwG6ZInwYvVHl8xUaYW9JxMUY6G0=;
 b=g93eAN8EdY5iqClyAlyjc6Zt8igM3MLD2kxpOkjkETDpX5n9e3BvsSuxst+nxvHsFsRj67mEKbafcZ53oM/06F6Yhms/cuPYnkwDFlAgYVUt+yGSD6ueTT3ka+xylzquxHPy71r9KGGBlZCwB3XDN9ZGgUJABH3JlFfzXly6Q2C66WOhkfvMwjvzmQsY2B2c7KwVlvei7Y+oePbktC5kWT+1tHhj9AEK0U0xCZ0mPtTs9ak5LPFZXHMJdP7eW7n+7QyOdx6zWGtW0O3JVuE6FVDnS/9PjEmW/sNFrSYOkf/Lj8E4bAU6kS7e7lIT+6cZgEiUFfXJ06gWw1tAff1ZKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVF4Li3LhfaDRJyZwG6ZInwYvVHl8xUaYW9JxMUY6G0=;
 b=Bh2t+TlZ37k8BKyX8+9bEfS9KSDQjKtcpGwfYJzcXW5NFuZm/V1Xx+wxbMy+I+eZTfS54rvHyWqRkkqYBnTDDyqfeEdg+HeGs+os/Nn8m0ulk97YohSpn7jdp/y51/fmDZ3Q4KUY7SN4+JmahdJhes3gs5vzpGC2U8cb8Ms12qg=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH0PR12MB5075.namprd12.prod.outlook.com (2603:10b6:610:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Mon, 27 Jun
 2022 18:18:16 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::589b:a1f6:9c87:a8ba]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::589b:a1f6:9c87:a8ba%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 18:18:16 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm: amd: amdgpu: fix checkpatch warnings
Thread-Topic: [PATCH] drm: amd: amdgpu: fix checkpatch warnings
Thread-Index: AQHYiiW9de+ky4v8Gk6KiKpE/Is28a1jj+oA
Date: Mon, 27 Jun 2022 18:18:16 +0000
Message-ID: <BL1PR12MB51446E8B038638B916529967F7B99@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220627125834.481731-1-Vijendar.Mukunda@amd.com>
In-Reply-To: <20220627125834.481731-1-Vijendar.Mukunda@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-27T18:17:05Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=a25d9b6f-d79c-49d4-80e6-8858df9f19ed;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-06-27T18:18:14Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 7d1d8476-840b-4bd1-94d6-ed122d06278a
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ec531de-d8ef-487e-ed16-08da586967dd
x-ms-traffictypediagnostic: CH0PR12MB5075:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o5EDEPwYfTUda58OyBPNp2XKeqNmoRYJno5MJMQndKkoKJvfIiYtQG/6/pP5e3UcPbmrmzQLZx9XPbsdbAm+a8pXhtO4fJatpvfuHCc4HivN3W/ZTEMx4L1mtCLScbg9YM0Wef3x1c/mN6/9fLKmE9RFGdAp1ZWRmqQWrsD11unBGeyTCcE0u2ZZ4j8oKX5/7Ta01MSf657+o6+GgU9pJt4yo0EdjiZ3e66/9ZE75mY5+JHaU1bcdD2sYGOcOemh9SAbEx0bN7cRbKVMUhSPeKsSck9lzjTqf7xM50viV1fA8QmsUscXHIsvtzbW0aiDMgcgT9+pdbwEnwq6q4UPiMLTKH8/5+wgtGD5e6qgzW5CK5YAEJVzv0FdqPvbw6+EOrzPs16u3ZYwxOHxNnpTitCnSwJ6CjyqtfuDEjVZ6wfKE2RhyS377OddtHReO1NJPTjrg7+0cC0UHHqmQRoUhvPpRBmrVO1VvfWdepA5Hyw8welk0rTj/zCQ9fnSkuXtl1/W6LP21wgIOkDAl9WCd99Tloh2RhjYcNB3/hFAe/OBC5IsUInNo7p9ZqL7dWXUY7py4KgwgyuhdywFCqBfZmQU4tBgEBzHih/6/WCZ/PqiPxzmCQuDliAtHAYIG2CVbylSJ2KwmgFgCl6e4Hdqg0HcIh/bf0w2rztelmmzU0iLsGjvMa4MenAiR1tu1IUbPH+5zU0eCuJR56fiPepPZFp4EIEKu01GMPopamNnGrWKV7DsLj9cxvK3gzMKYh5pzWKf1U061pPvL5/nmvljg8yLS2Y/MJrK+NK8owBlC0w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(66446008)(66946007)(478600001)(6506007)(64756008)(33656002)(186003)(66556008)(76116006)(8936002)(122000001)(66476007)(5660300002)(110136005)(8676002)(52536014)(7696005)(55016003)(83380400001)(38070700005)(86362001)(71200400001)(26005)(316002)(41300700001)(2906002)(9686003)(38100700002)(54906003)(53546011)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GV6YICpBgxlroxHKOJUY87kPHH+aFR1nhrbxHy9f370WnvBzQKLWbJT8SJkR?=
 =?us-ascii?Q?lOk1yj6TfxfkrGnwrpRm/bBU5Q3ql/akrd8BH1HbrzEpbGLUfJoeGJ1c/JQr?=
 =?us-ascii?Q?xKHij4NJUkpo7eXd8kh5365zgOsIw35uM6uhjA8CFYRhl1ao4D4UQtzWUq0I?=
 =?us-ascii?Q?GMe709cDvBsMUwgTd406KCoWAbqhzCMfH6UOpGTXxzIxnfISu1SasAQoYe+1?=
 =?us-ascii?Q?fcKcRHZA2KkEOI4FvYD5gLS3Wye6cnEAE7HJv/CQWQ6gvSzxATVfpHi3PzvS?=
 =?us-ascii?Q?ZP2w6DRIH6t+kgI31ypAMc67ni+/wHsrWdPw4wDIvbL1mSeiBNFKfOMczHVf?=
 =?us-ascii?Q?aiL96aenm5zymiga/zedrdXpyv6Lx+F71iHEBujQJNDuXJ711prUIMe6aRKn?=
 =?us-ascii?Q?FrnrVyXZLIIMqAeNDAmct96KQRcBqtOF4XO0PTWFE+WzpXw/65a9O0fv2Mdt?=
 =?us-ascii?Q?3LJXLQ4DcJDivMNsV58vXVnXxFF3Gc+a3izlStA+1NlDw5lFjrT2RRzdmvsR?=
 =?us-ascii?Q?X+E0DVSOJ1MF3JigoodJpU2Eo21tMYJ+hNwLrED8ytbmZqVYimksp7ogvk80?=
 =?us-ascii?Q?CKjLoirWiEkC4EHq2skByyVLGhxUcocYbY2xxn6YoENsfm/OdxxZ257j/G9S?=
 =?us-ascii?Q?gR7yd3DByVnu9x+kE5fGXB/C+6kJuPKj0DHt3RSPGO7F8EZmmc5Fbjz6asul?=
 =?us-ascii?Q?aqP+k+7Fc1d3ps+mP1FcT2JgxzepshTsSqoieg8pv0BBvNmg4lP8I6Fp7tkO?=
 =?us-ascii?Q?8UKgxs7Uav/fqF+vy0V1WADoNOyli2z+n8UIdpJ56I6Dizkvcxy+ucI/2Tlu?=
 =?us-ascii?Q?uglBadvwkTL/eHDSOulEdguiyrBAbkKGxPOp81a1dBhb60xJ8F8IAE8GlT8Y?=
 =?us-ascii?Q?Jz+KmIRVu/zRrLuvoLTMW3L4y6gg3tVtteR77w9KX6hPtXqO1KMCGuMF4ZbW?=
 =?us-ascii?Q?dbRQmqL4GsA3Vb2jrdD/PvqbPJSzBRu+WBQMEdUhSa3iy50kWihK5rb1KJ9P?=
 =?us-ascii?Q?X1XaZC610rnjFpp8FpKV7LEGCiinTEDD37rkUBdmZfU34c2rlALn6rTHSGGT?=
 =?us-ascii?Q?mqCljXKoZ14iyAT70N0eBlhN0+7zisSg9+9aSAnJSdivd2/mmvhWnN5nleMI?=
 =?us-ascii?Q?FdypCQBGB4k3zyqh3958nluE70X5Xf4drZ2JlydQokPfeH8cC9eQYSdiLQ5y?=
 =?us-ascii?Q?JfWj90R31/+/R98l98VRtiWWwcySUqehG4WyXPE3Bf5eTvznnNahQdylxNVn?=
 =?us-ascii?Q?KkgtdsKgU6Hg6ajyrW6hkTNrU89faISVUBo4KFPDe+vOL9fnQkpb9TLrqNSP?=
 =?us-ascii?Q?sbudi/NJKPE6Wy+L49wmEhTiW2QlJrd5wQpp8Lvw6XXeF1nWQ0xoXlR7iz9v?=
 =?us-ascii?Q?PFEc1LBLH6ETz7Le7HD53y7nFE9ZSXA0ovPViLjv78sv8kKlRGoMavmMVBP4?=
 =?us-ascii?Q?MNSoOeXI7fZMP5oq2P4q8UFxgVEwc9irYx1bpg66SjCUpyA2EToA3Z3VtVZ/?=
 =?us-ascii?Q?ZBc0j6AbkHRqyNGP1wH/BcpXy8SMboEeGsqasJ43fmfCwxFz0Woj8SDi7hUz?=
 =?us-ascii?Q?Ghui/8W7QTtmUZ11qt7FObc8oQ1FJ6R7qSUUuOxM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec531de-d8ef-487e-ed16-08da586967dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 18:18:16.3130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qHNeGI6OZ9b9+dkg5dzokJaxfsOO1KwC16iL1OdjfEGrODl9ZiObDPvMQkTT+5/uRB6RiCWkMs76RF2sXRncA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5075
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
Cc: "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 David Airlie <airlied@linux.ie>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Vijendar Mukunda
> Sent: Monday, June 27, 2022 8:59 AM
> To: broonie@kernel.org; alsa-devel@alsa-project.org; dri-
> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: Dommati, Sunil-kumar <Sunil-kumar.Dommati@amd.com>; David Airlie
> <airlied@linux.ie>; Hiregoudar, Basavaraj <Basavaraj.Hiregoudar@amd.com>;
> Pan, Xinhui <Xinhui.Pan@amd.com>; open list <linux-
> kernel@vger.kernel.org>; Kai-Heng Feng <kai.heng.feng@canonical.com>;
> Daniel Vetter <daniel@ffwll.ch>; Mukunda, Vijendar
> <Vijendar.Mukunda@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>
> Subject: [PATCH] drm: amd: amdgpu: fix checkpatch warnings
>=20
> From: vijendar <vijendar.mukunda@amd.com>
>=20
> Fixed below checkpatch warnings and errors
>=20
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:131: CHECK: Comparison to
> NULL could be written "apd"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:150: CHECK: Comparison to
> NULL could be written "apd"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:196: CHECK: Prefer kernel
> type 'u64' over 'uint64_t'
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:224: CHECK: Please don't use
> multiple blank lines
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:226: CHECK: Comparison to
> NULL could be written "!adev->acp.acp_genpd"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:233: CHECK: Please don't use
> multiple blank lines
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:239: CHECK: Alignment should
> match open parenthesis
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:241: CHECK: Comparison to
> NULL could be written "!adev->acp.acp_cell"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:247: CHECK: Comparison to
> NULL could be written "!adev->acp.acp_res"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:253: CHECK: Comparison to
> NULL could be written "!i2s_pdata"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:350: CHECK: Alignment should
> match open parenthesis
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:550: ERROR: that open brace {
> should be on the previous line
>=20
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 27 +++++++++----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> index cc9c9f8b23b2..ba1605ff521f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> @@ -128,7 +128,7 @@ static int acp_poweroff(struct generic_pm_domain
> *genpd)
>  	struct amdgpu_device *adev;
>=20
>  	apd =3D container_of(genpd, struct acp_pm_domain, gpd);
> -	if (apd !=3D NULL) {
> +	if (apd) {
>  		adev =3D apd->adev;
>  	/* call smu to POWER GATE ACP block
>  	 * smu will
> @@ -147,7 +147,7 @@ static int acp_poweron(struct generic_pm_domain
> *genpd)
>  	struct amdgpu_device *adev;
>=20
>  	apd =3D container_of(genpd, struct acp_pm_domain, gpd);
> -	if (apd !=3D NULL) {
> +	if (apd) {
>  		adev =3D apd->adev;
>  	/* call smu to UNGATE ACP block
>  	 * smu will
> @@ -193,7 +193,7 @@ static int acp_genpd_remove_device(struct device
> *dev, void *data)  static int acp_hw_init(void *handle)  {
>  	int r;
> -	uint64_t acp_base;
> +	u64 acp_base;
>  	u32 val =3D 0;
>  	u32 count =3D 0;
>  	struct i2s_platform_data *i2s_pdata =3D NULL; @@ -220,37 +220,32
> @@ static int acp_hw_init(void *handle)
>  		return -EINVAL;
>=20
>  	acp_base =3D adev->rmmio_base;
> -
> -
>  	adev->acp.acp_genpd =3D kzalloc(sizeof(struct acp_pm_domain),
> GFP_KERNEL);
> -	if (adev->acp.acp_genpd =3D=3D NULL)
> +	if (!adev->acp.acp_genpd)
>  		return -ENOMEM;
>=20
>  	adev->acp.acp_genpd->gpd.name =3D "ACP_AUDIO";
>  	adev->acp.acp_genpd->gpd.power_off =3D acp_poweroff;
>  	adev->acp.acp_genpd->gpd.power_on =3D acp_poweron;
> -
> -
>  	adev->acp.acp_genpd->adev =3D adev;
>=20
>  	pm_genpd_init(&adev->acp.acp_genpd->gpd, NULL, false);
>=20
> -	adev->acp.acp_cell =3D kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
> -							GFP_KERNEL);
> +	adev->acp.acp_cell =3D kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
> +GFP_KERNEL);
>=20
> -	if (adev->acp.acp_cell =3D=3D NULL) {
> +	if (!adev->acp.acp_cell) {
>  		r =3D -ENOMEM;
>  		goto failure;
>  	}
>=20
>  	adev->acp.acp_res =3D kcalloc(5, sizeof(struct resource), GFP_KERNEL);
> -	if (adev->acp.acp_res =3D=3D NULL) {
> +	if (!adev->acp.acp_res) {
>  		r =3D -ENOMEM;
>  		goto failure;
>  	}
>=20
>  	i2s_pdata =3D kcalloc(3, sizeof(struct i2s_platform_data), GFP_KERNEL);
> -	if (i2s_pdata =3D=3D NULL) {
> +	if (!i2s_pdata) {
>  		r =3D -ENOMEM;
>  		goto failure;
>  	}
> @@ -346,8 +341,7 @@ static int acp_hw_init(void *handle)
>  	adev->acp.acp_cell[3].platform_data =3D &i2s_pdata[2];
>  	adev->acp.acp_cell[3].pdata_size =3D sizeof(struct i2s_platform_data);
>=20
> -	r =3D mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell,
> -								ACP_DEVS);
> +	r =3D mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell,
> +ACP_DEVS);
>  	if (r)
>  		goto failure;
>=20
> @@ -546,8 +540,7 @@ static const struct amd_ip_funcs acp_ip_funcs =3D {
>  	.set_powergating_state =3D acp_set_powergating_state,  };
>=20
> -const struct amdgpu_ip_block_version acp_ip_block =3D -{
> +const struct amdgpu_ip_block_version acp_ip_block =3D {
>  	.type =3D AMD_IP_BLOCK_TYPE_ACP,
>  	.major =3D 2,
>  	.minor =3D 2,
> --
> 2.25.1
