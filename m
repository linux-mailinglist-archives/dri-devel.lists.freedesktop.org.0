Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A167E842C81
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 20:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB2211346F;
	Tue, 30 Jan 2024 19:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8E2113498;
 Tue, 30 Jan 2024 19:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U40FX4rGxMNkyPO3iXfGDR+lTq8l1yoDQSK4+s3PN4tzXqfaUvyS9my7ufOtjbd2VoUB1Mm4jnkjlGhrTQxkuTgX8s5Oe0DShT7SGzK5MvX5qtDh30cG0o9aQ8AdXBvKUMO2wDPSV4rvKAy9tqsfvzLUDI3dUv7Yh/yg5fYCvnl/FfVEIN3/17mJfqzM5SFH6uSfsauO6coQMd0kYdsfLbQiWR7vSnvH78UE+S+D9oerjohRLo8OvI91A3udk4kjFVMV8RVXA1LtSuN3WVGka7zN8KAfPtjBXAcnBETbmuH4aE7n9nvoQwnRK58Rtn/zegn4unWJXr1PrHgMaY2RZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cydh1HhoZmfkzM4zFnMwIsH82wOKZ7SUw8tQY2eroy4=;
 b=l0i3WHdR26O2K2h7bfxyeyDnrPlPwderl1avhnL5fpK6yCzt/1g6PlKFTZkRjCdiBf8v1zZZ2+QqJIOdzNja2/JzWPtnGbbNSUkrkEzs/F5TwMu0ZGtOblYDrAQrLOJ0wJxxKZlKOz8WAI5gf5LrbEt1cHvFuXl09vd4CxIpc9gYEy1686esR7e/7US8CIY7MMcPiBuSydXvdg5W4Y2Qs+cTJ15abc471Km/Xi9qO/IWoI/lZvt1ZFGi/MUSD87pjH8STcfd2THNUomaszCnae8lZ5GsccI6Niv5JMBKOE+8m1XgJKGCtJTILsLUY7XfRGdZvpH5eA5wxw1SVbc53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cydh1HhoZmfkzM4zFnMwIsH82wOKZ7SUw8tQY2eroy4=;
 b=J1j01JHVb5ao+yHvg1lCLss6grS/tkCB0kHbkiLGs5T+4BbraGevu4fKGXwm7EJzglwD/0pqpcb8HTs9jnfuCBfBRd+dp+q//OxdwfKFBsxCYoqWsprCmO1dkIbUwrqfwFasmPRHWGWkFUOvRSnih6FoLSDdAZhXv/lHpnPNT1U=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5047.namprd12.prod.outlook.com (2603:10b6:208:31a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 19:21:52 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::9288:f78d:b34e:9b52]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::9288:f78d:b34e:9b52%7]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 19:21:52 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Qiang Ma <maqianga@uniontech.com>, "lexander.deucher@amd.com"
 <lexander.deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "sunran001@208suo.com"
 <sunran001@208suo.com>, "SHANMUGAM, SRINIVASAN"
 <SRINIVASAN.SHANMUGAM@amd.com>
Subject: RE: [PATCH] drm/amdgpu: Clear the hotplug interrupt ack bit before
 hpd initialization
Thread-Topic: [PATCH] drm/amdgpu: Clear the hotplug interrupt ack bit before
 hpd initialization
Thread-Index: AQHaU4cDdnUjG/LfxES2tZRMh9MU2LDyu1Yw
Date: Tue, 30 Jan 2024 19:21:52 +0000
Message-ID: <BL1PR12MB5144CE51F819FA7E011CF9BBF77D2@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240130093522.19914-1-maqianga@uniontech.com>
In-Reply-To: <20240130093522.19914-1-maqianga@uniontech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=6d68e7d2-d7dd-4e5d-bc31-5116b5158530;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-01-30T19:19:15Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|BL1PR12MB5047:EE_
x-ms-office365-filtering-correlation-id: c18d8906-c6c5-4d78-cfe3-08dc21c8b6b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WkpzXj4YL4d7HV67/GV/y5PwpomjoNv7qzfX4HLcwEaIkBJdJysIhhL7GEsuam6pH+zDSA4iOZ+53Cz/UF2Yi4vCxcVUcB2MGTX//f2O+LdHa1fmrFTGxaXXMG7DOus4C5O4u7nqXDBzG41A4wUwTW9EPRSekjT0O6ik4N/s/rGEROou9JOhN96rnjz+97jklPQDIoB94ID69N2np9T+3Q+oLH/3ABOkLqUag4oi8hMfquIjQQVZ1fSo9XfrqcRC7vMdu0CuHP50K/04rhFS/8nKFrWzHG0xPYbNCHafMI4nTgiC74bdpb+au/EXvondpMA+lCSLYfDAnChSL2pl1q+j3ba6Lb/stkb06YHAp6gAPUSaLxcj40wpCQ4VJ7DM1pLcYJSC5SI/y/rvP5/QlJX6YSoNV9h5Dm5b3lIW9kNsSRGRRHt7oyu9VT+wiyVMSUoKJG6Dzw1A86rtej+yg2mo0OEnUpkIn5oTTFu5GRyv6DA7iTc3pY7IeUUegO+c8y3NYEQ0W/VdYTcHArBTFJLGRRw3lZPjvvgpZq9ZBW+EFzrPgkfJqwM+HVoWaBxRbSQ5A7JmLnbnx2Ib5uZFLFbtsYvytMKZyQFh34Glyze2imPwdzHoPiMUpAlEXaPR1hrCpvJuriRNn0sBCFLTxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(921011)(83380400001)(26005)(9686003)(66556008)(7696005)(6506007)(38100700002)(122000001)(4326008)(8936002)(66946007)(5660300002)(66446008)(71200400001)(2906002)(478600001)(76116006)(41300700001)(52536014)(54906003)(64756008)(8676002)(66476007)(110136005)(53546011)(316002)(6636002)(38070700009)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aUXd28Sn19F2YXTadBuSqT4hgEF3p/SL0xKSmhgUEhEuS4KWnbmSqQIXbMy6?=
 =?us-ascii?Q?zt86zufoxHYW9iyJmqwsp+Zf/bE8CzITmMcOuXkysoKmS0Tn1XF+nQBNIAeX?=
 =?us-ascii?Q?ASnokFfCEsZBXlE69dJuYTgxP1fYWjs7boX2Zt+YDXlr4OMyN/ZjKBHxzF9L?=
 =?us-ascii?Q?2YNLwFBHpSbLiJA0R8D38feIU8FihMfYGS+b0vlrLUO+4eltCzNAObuTSo8z?=
 =?us-ascii?Q?SJU4UMRbonhXhGCKpxM3TTWK5rzMJB4yHhkB+//JMMrkGrQVT2AtgWuirgvm?=
 =?us-ascii?Q?bgvf28CofoeSs/S+7+efoUz847VCmfoTnIwQaz735rqsrGKfBcCg0G4TSlXZ?=
 =?us-ascii?Q?2uqHmw1C/ZlsmsKEMB5ltyy8GhmB4xP9P9FgdLUQnuELL325xJaX2cXDF7bQ?=
 =?us-ascii?Q?89VlLeXI2mWQVAh/syv4gd4ieeRiRmYclaKrMRxcLX4BVFRQw+OHMgXfYpkB?=
 =?us-ascii?Q?6ocoIPwnBnT2IVqhlTbvP0JLwr4EI1JZDLIVFFBthd7X2Mvi3xgodLUjngeU?=
 =?us-ascii?Q?wa6qqGWZ3ABngEmxbnmahsXBdSzxKGz8r+/tvyoE1S3dTf9l3OgL/0CDOmAW?=
 =?us-ascii?Q?VpNvmjfW3F1FW1cjmmZfEASUqmg59JceAWLVWKWxOcvkp6Iv4ULhmybl8y1h?=
 =?us-ascii?Q?0fZrL5X3g7Z7/PgozBmJckFmTJg4xBKo6731Wai4fGz4X1/zzO1K8swsmepo?=
 =?us-ascii?Q?ZrnRnogm/gpunLvongf0DsA76lLBXsy9K7IRK8u9kZpiGORHAa+pR1SCYOJu?=
 =?us-ascii?Q?cytW147h3mCVbsMZScRp+d4uIP0z2Jy/0Wv0zKz9pwG+j6+TU7BEknIMNR9A?=
 =?us-ascii?Q?VgQaNno1VEmNIUrFKwL5u3OH1dhtSQzieLroWlHA/TnLQVJO1JE4ohs5e4fb?=
 =?us-ascii?Q?HbYGbPc9PabH7YaxwgOQCHOhAY9oVfunfO7szO8y8t35JLiyCLiD5WQEDDRv?=
 =?us-ascii?Q?VEhu3Ol456RQH2uxOcz7S7eddfUG9WBHcfU5G6xYCnEVyaJqR2IKeQwjGNsx?=
 =?us-ascii?Q?/LAAMjzQl0RgMP6/ELog3Gaa+7E97OmTMvSCrFSFGsmACAaldTMoKVtmX43l?=
 =?us-ascii?Q?xtEVcQKkezL3NPpKKphVa9pqE5z5ZbKOekKVcC43C90IhPlPrV0DY8N/hVHe?=
 =?us-ascii?Q?v7N+jLuRkmB8mguPoRAhdopi/2ESkMK60Ct0p9pil3V/EGBTQB6v1MkrcR63?=
 =?us-ascii?Q?UOGxSkBfINlPFNFBibVd3in6eFf8gNDflkBD0k1WK8SPfuHovxG46HSmRNFQ?=
 =?us-ascii?Q?ooS2kcx677Zn9CBHzO+PVMGGwBBddApJCuJxLAooVFn1vGyGwiHDlNTvt6Sl?=
 =?us-ascii?Q?mKAi11GBYiqThFFp+ge7ruY35jaYOx/WJVWqhh4PTMKSzl8NAYA0qsmC1BRz?=
 =?us-ascii?Q?25SepnEQoLiA1yFlnm1kMhbZrmc/DKs2zXZC78Bi8a0pU/sIF9BgBbpi1s1o?=
 =?us-ascii?Q?SPzZOgRpX+hMchNSiSSKLuYYncYr60cjfndQOZFw5ryJPIykC8B1uUDauXwh?=
 =?us-ascii?Q?uaRgDlZEYNEWp3eH6Z3SS+ivJsyxnhCtEJzoeoJuKp3kK+UX7wAG+cNkTaBu?=
 =?us-ascii?Q?ht8UpNK7Cmo82cIdEj4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18d8906-c6c5-4d78-cfe3-08dc21c8b6b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 19:21:52.2109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F5KO+uswnqvh2OLaWKjYZTseS/HYi/15w/mBe+SjxBi/kVyoMrBi73GKcXgr5NOEIwZ2KO5z4WZ+KiMcs4Yh0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5047
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Qiang
> Ma
> Sent: Tuesday, January 30, 2024 4:35 AM
> To: lexander.deucher@amd.com; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch; sunran001@208suo.com;
> SHANMUGAM, SRINIVASAN <SRINIVASAN.SHANMUGAM@amd.com>
> Cc: Qiang Ma <maqianga@uniontech.com>; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/amdgpu: Clear the hotplug interrupt ack bit before h=
pd
> initialization
>
> Problem:
> The computer in the bios initialization process, unplug the HDMI display,=
 wait
> until the system up, plug in the HDMI display, did not enter the hotplug
> interrupt function, the display is not bright.
>
> Fix:
> After the above problem occurs, and the hpd ack interrupt bit is 1, the
> interrupt should be cleared during hpd_init initialization so that when t=
he
> driver is ready, it can respond to the hpd interrupt normally.
>
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c |  2 ++
> drivers/gpu/drm/amd/amdgpu/dce_v11_0.c |  2 ++
> drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 20 +++++++++++++++++---
> drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 20 +++++++++++++++++---
>  4 files changed, 38 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index bb666cb7522e..11859059fd10 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -51,6 +51,7 @@
>
>  static void dce_v10_0_set_display_funcs(struct amdgpu_device *adev);
> static void dce_v10_0_set_irq_funcs(struct amdgpu_device *adev);
> +static void dce_v10_0_hpd_int_ack(struct amdgpu_device *adev, int hpd);
>
>  static const u32 crtc_offsets[] =3D {
>       CRTC0_REGISTER_OFFSET,
> @@ -363,6 +364,7 @@ static void dce_v10_0_hpd_init(struct
> amdgpu_device *adev)
>
> AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
>               WREG32(mmDC_HPD_TOGGLE_FILT_CNTL +
> hpd_offsets[amdgpu_connector->hpd.hpd], tmp);
>
> +             dce_v6_0_hpd_int_ack(adev, amdgpu_connector->hpd.hpd);


Should be dce_v10_0_hpd_int_ack().

>               dce_v10_0_hpd_set_polarity(adev, amdgpu_connector-
> >hpd.hpd);
>               amdgpu_irq_get(adev, &adev->hpd_irq,
>                              amdgpu_connector->hpd.hpd);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 7af277f61cca..745e4fdffade 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -51,6 +51,7 @@
>
>  static void dce_v11_0_set_display_funcs(struct amdgpu_device *adev);
> static void dce_v11_0_set_irq_funcs(struct amdgpu_device *adev);
> +static void dce_v11_0_hpd_int_ack(struct amdgpu_device *adev, int hpd);
>
>  static const u32 crtc_offsets[] =3D
>  {
> @@ -387,6 +388,7 @@ static void dce_v11_0_hpd_init(struct
> amdgpu_device *adev)
>
> AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
>               WREG32(mmDC_HPD_TOGGLE_FILT_CNTL +
> hpd_offsets[amdgpu_connector->hpd.hpd], tmp);
>
> +             dce_v11_0_hpd_int_ack(adev, amdgpu_connector-
> >hpd.hpd);
>               dce_v11_0_hpd_set_polarity(adev, amdgpu_connector-
> >hpd.hpd);
>               amdgpu_irq_get(adev, &adev->hpd_irq, amdgpu_connector-
> >hpd.hpd);
>       }
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 143efc37a17f..f8e15ebf74b4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -272,6 +272,21 @@ static void dce_v6_0_hpd_set_polarity(struct
> amdgpu_device *adev,
>       WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);  }
>
> +static void dce_v6_0_hpd_int_ack(struct amdgpu_device *adev,
> +                              int hpd)
> +{
> +     u32 tmp;
> +
> +     if (hpd >=3D adev->mode_info.num_hpd) {
> +             DRM_DEBUG("invalid hdp %d\n", hpd);
> +             return;
> +     }
> +
> +     tmp =3D RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
> +     tmp |=3D DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> +     WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> +
>  /**
>   * dce_v6_0_hpd_init - hpd setup callback.
>   *
> @@ -311,6 +326,7 @@ static void dce_v6_0_hpd_init(struct amdgpu_device
> *adev)
>                       continue;
>               }
>
> +             dce_v6_0_hpd_int_ack(adev, amdgpu_connector->hpd.hpd);
>               dce_v6_0_hpd_set_polarity(adev, amdgpu_connector-
> >hpd.hpd);
>               amdgpu_irq_get(adev, &adev->hpd_irq, amdgpu_connector-
> >hpd.hpd);
>       }
> @@ -3101,9 +3117,7 @@ static int dce_v6_0_hpd_irq(struct amdgpu_device
> *adev,
>       mask =3D interrupt_status_offsets[hpd].hpd;
>
>       if (disp_int & mask) {
> -             tmp =3D RREG32(mmDC_HPD1_INT_CONTROL +
> hpd_offsets[hpd]);
> -             tmp |=3D
> DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> -             WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd],
> tmp);
> +             dce_v6_0_hpd_int_ack(adev, hpd);
>               schedule_delayed_work(&adev->hotplug_work, 0);
>               DRM_DEBUG("IH: HPD%d\n", hpd + 1);
>       }
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index adeddfb7ff12..141e33a01686 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -264,6 +264,21 @@ static void dce_v8_0_hpd_set_polarity(struct
> amdgpu_device *adev,
>       WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);  }
>
> +static void dce_v8_0_hpd_int_ack(struct amdgpu_device *adev,
> +                              int hpd)
> +{
> +     u32 tmp;
> +
> +     if (hpd >=3D adev->mode_info.num_hpd) {
> +             DRM_DEBUG("invalid hdp %d\n", hpd);
> +             return;
> +     }
> +
> +     tmp =3D RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
> +     tmp |=3D DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> +     WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> +
>  /**
>   * dce_v8_0_hpd_init - hpd setup callback.
>   *
> @@ -303,6 +318,7 @@ static void dce_v8_0_hpd_init(struct amdgpu_device
> *adev)
>                       continue;
>               }
>
> +             dce_v6_0_hpd_int_ack(adev, amdgpu_connector->hpd.hpd);

Should be dce_v8_0_hpd_int_ack().


>               dce_v8_0_hpd_set_polarity(adev, amdgpu_connector-
> >hpd.hpd);
>               amdgpu_irq_get(adev, &adev->hpd_irq, amdgpu_connector-
> >hpd.hpd);
>       }
> @@ -3189,9 +3205,7 @@ static int dce_v8_0_hpd_irq(struct amdgpu_device
> *adev,
>       mask =3D interrupt_status_offsets[hpd].hpd;
>
>       if (disp_int & mask) {
> -             tmp =3D RREG32(mmDC_HPD1_INT_CONTROL +
> hpd_offsets[hpd]);
> -             tmp |=3D
> DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> -             WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd],
> tmp);
> +             dce_v6_0_hpd_int_ack(adev, hpd);

Same here.

>               schedule_delayed_work(&adev->hotplug_work, 0);
>               DRM_DEBUG("IH: HPD%d\n", hpd + 1);
>       }
> --
> 2.20.1

