Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA13D4451
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 04:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1471D6FD50;
	Sat, 24 Jul 2021 02:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C076FD49;
 Sat, 24 Jul 2021 02:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/6bNpey5UoAGbsxYDvry8kpUTYU068u4LHjY0I3xqsON8hc3CJUCb2LUDfcLmMoxixr/vlcd99bXwUZ6pJEFDsA842861jtdBvIf2IIu2D53k9WahsBUT47EcLatA+AFGdSFC90LedImuMulPi/3SYAXXVXWbfI3c2jjoxWeQHLJKkbg1/MNk2B4q0ozpX/DqZGJ72Mw8gBezGSqjrpwgU+P2gURFDDkEgsF9fDvUUa7OiKK+JwPcWoLP1ORoFRf7LZNa7yJzITBExB537eH35nwtIdCe7h03/FK1NlRhJilZUmmAolwMSOoO9kSkB4C/TcteJHUBK3jEMsChkcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEooi4NUJH3DkVaUz06WQt9V8fTWM6G75KyXM6iDwvY=;
 b=far60Pd7fMyY+Lz30rYa3i1R+aT9aJBjTCQXIHpopcYsC+gEbtUkaBv4spN9Tt0SNw8bxqe465lZT2/3Qu062I2smviGWNeRpsjIneY7k0b9k2ohZJ4rce691fN7EnZlxaAT7icNA1liEJAsBG4nyGI+LTorZEIQ2L9upU9t9vNSZWsfumfx1hTTRm+SzKxl7irq8H93TeSA/uPWUgbpN//MVzHkmxfvLg+c8zKe5HGVNEaH9XZNgpldtYfwYzX3lUWZL0w5ITGgh1H2DhvW/uXmJuMDR/DWghJrPa5RDNEAbMQ91R0GoC7IzCZlJM9peB4llvcY0NCJMZqJL1VwYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEooi4NUJH3DkVaUz06WQt9V8fTWM6G75KyXM6iDwvY=;
 b=2zY/a+gizJef+h8izeSwRfwcJ0A9ifwhnp2KN8RsOP3WWDiAadwly+ujTITUq1p52/K/0bDTeAayiGXIOJrXAmp/CpJttUNigDntBt1TP1T3kVP6QBRF1hpGkeKp03l2SWY5EuWgfKhNEhzm0UeVbePMwLnXL0PnS+pKe68PCgg=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 DM5PR12MB1356.namprd12.prod.outlook.com (2603:10b6:3:74::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26; Sat, 24 Jul 2021 02:07:51 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::453c:6ded:8973:744e]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::453c:6ded:8973:744e%4]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 02:07:51 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Taylor, Ryan" <Ryan.Taylor@amd.com>
Subject: RE: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
Thread-Topic: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
Thread-Index: AQHXflLqz/03gkMzL0CR8n6D/3RZqqtQokmAgADBpoA=
Date: Sat, 24 Jul 2021 02:07:51 +0000
Message-ID: <DM5PR12MB2469E019BB91B58EA547B628F1E69@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20210721170705.4201-1-Ryan.Taylor@amd.com>
 <20210721170705.4201-2-Ryan.Taylor@amd.com>
 <CADnq5_NYP4Gp7DntrnSaSGHuZYzSs_1DfMAjUQv+ksE1jJ9ohw@mail.gmail.com>
In-Reply-To: <CADnq5_NYP4Gp7DntrnSaSGHuZYzSs_1DfMAjUQv+ksE1jJ9ohw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-07-24T02:07:48Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=d727aec6-7048-41a9-8a64-f4b1e707989a;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e9f19d8-cdb3-450a-cce8-08d94e47d77a
x-ms-traffictypediagnostic: DM5PR12MB1356:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB135611056E7A44DEBABB48C8F1E69@DM5PR12MB1356.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hlk++/CLHnIhdE5g8nIHoGp4z0WQTfMmg9QtYuy0j47KP3pvvtuuFBxzKQyUJrkUjk6V6MoPNijTfkn+F0rBlj+DO1yjQwdH9fxQTUzxG70+K7BQlMm3ATpJr0+XU2O48zdhkJXFPhgBfu1ahkQLwPs7c+E9gMqPOjJx4a6PL1U7M+FFp9FrN6+H/4MJkeB2BpoL7yn1sVnoDVrKCNwyaM1Zgd/2vgFywhv/XyXvr7+XDyerDeU6FATqII+rPqmd9wXz6A80sDir3sZMgwg6hO7SPBBUap8XcdCbMyqEY7U+NCkG4U1W2Kin/KYiH83R94oNXTqEtMP8E8aMmNyJ8ysWxXeIH+vDnB0UOLzRM9LMAS9Rnc4A3jQdVn+YXC5EZ5+1+DB6QhqiWnmb4Hl19M/+tQAqb3Oo61G19C808Acxc49h8Fs3YOHP9BKr3ZWHIKV86uhTzb5FzAOvUxXHVNrPvSX+omWwGx45Q7CLvGtlkjM36hk7OjK6jANRCh4jPwX3t0NeMWW6+p4R0LMCNrr4KwA4EmJoXaCE7netWAiqo8l52NmkVU5aiml8s4QkxoOgvPF8VoEfIqZ10JbH/csw1Pi5QOCS7uh8tZo4JSPZBrf8viDFDm8ZeGnN5rzEKD+x+jfmBjyD4q3Pjbm/a3y06Ki9hBv6BhI0vUfZW2cyQ3z4sf1SqEqp2QSqBG58PER6oM4gLvNK0WgvxeFafJDuM2y4oSRAfxye0vZ+VyQHS/KK7Oci1ykucz+H6Z5/NidaIfIQKQtvovvi+UCJZRnOb1LngFtVSxFMgxlBCUw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(33656002)(52536014)(76116006)(2906002)(53546011)(6506007)(66946007)(966005)(6636002)(45080400002)(478600001)(54906003)(66476007)(64756008)(66446008)(83380400001)(8676002)(110136005)(122000001)(55016002)(9686003)(66556008)(86362001)(38100700002)(71200400001)(7696005)(316002)(5660300002)(186003)(26005)(8936002)(30864003)(4326008)(38070700004)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SduqAT4P4HFR264exCXrB6ub453uljLuRGJuapy9FD+WgMvopu6SU6P3M28Z?=
 =?us-ascii?Q?bWxdg/s8a9yKQP7oQSurhMpZhDqePAfg7A+dssu/ZX+V2GsAFBrs1m0p44tq?=
 =?us-ascii?Q?iBMhZQskqHeXNKZrGX9U51Ra8FsJSOCJIQ/j/9+SZvdGBM4A1KNwCx50Mkwj?=
 =?us-ascii?Q?xHiVd/cGWw1qiwQwbfWx9ww7HdfpiNj6V785MaJB+CraHNLpRg/w+DluYaeJ?=
 =?us-ascii?Q?astVcnNqXbQNbH8c3AJ1ipvyg9HHTCGZ8bnL5xuhLeYdCa7ZY1T8y2VRWKlY?=
 =?us-ascii?Q?3SDI6Alf5xQqAfAoIaIo/QB49cHNN5jNit8M+GptViXnfwDmqqhfMFHn/nhy?=
 =?us-ascii?Q?4kMlI1eCMzqKlUTa0bOiQWGcw+ZqxW/y5R0YAl85KWtampOnlwlVQIRfG5dM?=
 =?us-ascii?Q?1QqCTTllWBzFWbs6r+aJIBwMOIKSqY1F/ER9ZD4RxWLhqzNGyrg0ZEyRoI7e?=
 =?us-ascii?Q?iUIbOHILXxvLbRVCmri1kk8AGEWr2pX/oMg+ZaPDIR0Kry3S1/4rkcTDRLe7?=
 =?us-ascii?Q?qjzOPiRjgJVQ8wxTuLUbX2tGfHx6Lal+DCo+SE9e4HBATgP+tfcnzVO7x9of?=
 =?us-ascii?Q?fS5RDdNv2eVfFX2I9EQpDbJKJtEufsgAIuRVNJWm8SJvT0SpqbXysE4okMI2?=
 =?us-ascii?Q?Gwy+MH3YavHw9ypLJcjqzmlqfzmkv4lq7tdXbxpJhAnK0/gDNRJnO/TH/M4D?=
 =?us-ascii?Q?OPYnhqEzHI3T2f2aVYdq6wiN3z/U5hy7dtRWrz5V2A4WIK6/6A0K+UAyRieW?=
 =?us-ascii?Q?2mvN5a5J+tPqkivmwayxVB/9J0ke86aC1Dw60p7fg2zXUjf389tIbEzpJ+PX?=
 =?us-ascii?Q?Z9voti7QJVRam9iHMo/3qi1xgP3Nys+vtoocprLOlWN6oVKKfe3ZR+rv+QJo?=
 =?us-ascii?Q?WdgO5DBrAtL78Yhph2w2bT7rjG+RQZD/iPRRCU/v1JxlEPTsRh+etLGBmWHR?=
 =?us-ascii?Q?AkaKESJsbZduRRKkuc420Es6Uq4DyzzZluYJxCKwZYCZUNtpeRw7Z3JEC6xo?=
 =?us-ascii?Q?5VARNnjabJTS/avNhmpbpLbWBZpYT17JKndyHNqd+5eJ8r7yAwnt5RNNVoWF?=
 =?us-ascii?Q?d7GlYNl2q7TiGAHDg9A4o6INJrSmWjZQi2tM+zqQoUNw+RtBkJjWC5gMefen?=
 =?us-ascii?Q?R7aiJ6gEB/8S6gwjNKVRF0tLnZrbv4boc0JwZWusBwixSJuZ4c4VBrEt8kRC?=
 =?us-ascii?Q?mG6Idg17UnbFitFsEnYcQliaaTrXyNPLjZXEE7825M9NzT3rrhBWQ4wEDoPa?=
 =?us-ascii?Q?aI+SMjjidGJHH8Oa3nNmE9CUHF+sv4n0fLxXHR3Q8SAgD4AabF0fJwA46FP8?=
 =?us-ascii?Q?cOdWcFHfWyHsUSQtC19SkdOC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9f19d8-cdb3-450a-cce8-08d94e47d77a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2021 02:07:51.3570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhhE1CJ8Oq28K3q6JYG1rL5Ze4rKmkciq2UnIoS3sWCSZPWWMyJag5TxgKw833vB1DwtXudojHvPMfb79b5o2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1356
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
Cc: kernel test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Look copy right statement is missed in both amdgpu_vkms.c and amdgpu_vkms.h=
.

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex Deu=
cher
Sent: Friday, July 23, 2021 10:32 PM
To: Taylor, Ryan <Ryan.Taylor@amd.com>
Cc: kernel test robot <lkp@intel.com>; Daniel Vetter <daniel.vetter@ffwll.c=
h>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; amd-gfx list <amd-gfx@lis=
ts.freedesktop.org>; Melissa Wen <melissa.srw@gmail.com>; Maling list - DRI=
 developers <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)

On Wed, Jul 21, 2021 at 1:07 PM Ryan Taylor <Ryan.Taylor@amd.com> wrote:
>
> Modify the VKMS driver into an api that dce_virtual can use to create=20
> virtual displays that obey drm's atomic modesetting api.
>
> v2: Made local functions static.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile      |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 411=20
> +++++++++++++++++++++++  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h | =20
> 29 ++  drivers/gpu/drm/amd/amdgpu/dce_virtual.c |  23 +-
>  7 files changed, 458 insertions(+), 11 deletions(-)  create mode=20
> 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile=20
> b/drivers/gpu/drm/amd/amdgpu/Makefile
> index f089794bbdd5..30cbcd5ce1cc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -120,6 +120,7 @@ amdgpu-y +=3D \
>  amdgpu-y +=3D \
>         dce_v10_0.o \
>         dce_v11_0.o \
> +       amdgpu_vkms.o \
>         dce_virtual.o
>
>  # add GFX block
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h=20
> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 54cf647bd018..d0a2f2ed433d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -919,6 +919,7 @@ struct amdgpu_device {
>
>         /* display */
>         bool                            enable_virtual_display;
> +       struct amdgpu_vkms_output       *amdgpu_vkms_output;
>         struct amdgpu_mode_info         mode_info;
>         /* For pre-DCE11. DCE11 and later are in "struct amdgpu_device->d=
m" */
>         struct work_struct              hotplug_work;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=20
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index d0c935cf4f0f..1b016e5bc75f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1230,7 +1230,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>         int ret, retry =3D 0;
>         bool supports_atomic =3D false;
>
> -       if (!amdgpu_virtual_display &&
> +       if (amdgpu_virtual_display ||
>             amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
>                 supports_atomic =3D true;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c=20
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> index 09b048647523..5a143ca02cf9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> @@ -344,7 +344,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
>         }
>
>         /* disable all the possible outputs/crtcs before entering KMS mod=
e */
> -       if (!amdgpu_device_has_dc_support(adev))
> +       if (!amdgpu_device_has_dc_support(adev) &&=20
> + !amdgpu_virtual_display)
>                =20
> drm_helper_disable_unused_functions(adev_to_drm(adev));
>
>         drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel); diff=20
> --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c=20
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> new file mode 100644
> index 000000000000..d5c1f1c58f5f
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -0,0 +1,411 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_simple_kms_helper.h> #include <drm/drm_vblank.h>
> +
> +#include "amdgpu.h"
> +#include "amdgpu_vkms.h"
> +#include "amdgpu_display.h"
> +
> +/**
> + * DOC: amdgpu_vkms
> + *
> + * The amdgpu vkms interface provides a virtual KMS interface for=20
> +several use
> + * cases: devices without display hardware, platforms where the=20
> +actual display
> + * hardware is not useful (e.g., servers), SR-IOV virtual functions,=20
> +device
> + * emulation/simulation, and device bring up prior to display=20
> +hardware being
> + * usable. We previously emulated a legacy KMS interface, but there=20
> +was a desire
> + * to move to the atomic KMS interface. The vkms driver did=20
> +everything we
> + * needed, but we wanted KMS support natively in the driver without=20
> +buffer
> + * sharing and the ability to support an instance of VKMS per device.=20
> +We first
> + * looked at splitting vkms into a stub driver and a helper module=20
> +that other
> + * drivers could use to implement a virtual display, but this=20
> +strategy ended up
> + * being messy due to driver specific callbacks needed for buffer manage=
ment.
> + * Ultimately, it proved easier to import the vkms code as it mostly=20
> +used core
> + * drm helpers anyway.
> + */
> +
> +static const u32 amdgpu_vkms_formats[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +};
> +
> +static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct=20
> +hrtimer *timer) {
> +       struct amdgpu_vkms_output *output =3D container_of(timer,
> +                                                        struct amdgpu_vk=
ms_output,
> +                                                        vblank_hrtimer);
> +       struct drm_crtc *crtc =3D &output->crtc;
> +       u64 ret_overrun;
> +       bool ret;
> +
> +       ret_overrun =3D hrtimer_forward_now(&output->vblank_hrtimer,
> +                                         output->period_ns);
> +       WARN_ON(ret_overrun !=3D 1);
> +
> +       ret =3D drm_crtc_handle_vblank(crtc);
> +       if (!ret)
> +               DRM_ERROR("amdgpu_vkms failure on handling vblank");
> +
> +       return HRTIMER_RESTART;
> +}
> +
> +static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc) {
> +       struct drm_device *dev =3D crtc->dev;
> +       unsigned int pipe =3D drm_crtc_index(crtc);
> +       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +       struct amdgpu_vkms_output *out =3D=20
> +drm_crtc_to_amdgpu_vkms_output(crtc);
> +
> +       drm_calc_timestamping_constants(crtc, &crtc->mode);
> +
> +       hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_=
REL);
> +       out->vblank_hrtimer.function =3D &amdgpu_vkms_vblank_simulate;
> +       out->period_ns =3D ktime_set(0, vblank->framedur_ns);
> +       hrtimer_start(&out->vblank_hrtimer, out->period_ns,=20
> + HRTIMER_MODE_REL);
> +
> +       return 0;
> +}
> +
> +static void amdgpu_vkms_disable_vblank(struct drm_crtc *crtc) {
> +       struct amdgpu_vkms_output *out =3D=20
> +drm_crtc_to_amdgpu_vkms_output(crtc);
> +
> +       hrtimer_cancel(&out->vblank_hrtimer);
> +}
> +
> +static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> +                                            int *max_error,
> +                                            ktime_t *vblank_time,
> +                                            bool in_vblank_irq) {
> +       struct drm_device *dev =3D crtc->dev;
> +       unsigned int pipe =3D crtc->index;
> +       struct amdgpu_vkms_output *output =3D drm_crtc_to_amdgpu_vkms_out=
put(crtc);
> +       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +
> +       if (!READ_ONCE(vblank->enabled)) {
> +               *vblank_time =3D ktime_get();
> +               return true;
> +       }
> +
> +       *vblank_time =3D READ_ONCE(output->vblank_hrtimer.node.expires);
> +
> +       if (WARN_ON(*vblank_time =3D=3D vblank->time))
> +               return true;
> +
> +       /*
> +        * To prevent races we roll the hrtimer forward before we do any
> +        * interrupt processing - this is how real hw works (the interrup=
t is
> +        * only generated after all the vblank registers are updated) and=
 what
> +        * the vblank core expects. Therefore we need to always correct t=
he
> +        * timestampe by one frame.
> +        */
> +       *vblank_time -=3D output->period_ns;
> +
> +       return true;
> +}
> +
> +static const struct drm_crtc_funcs amdgpu_vkms_crtc_funcs =3D {
> +       .set_config             =3D drm_atomic_helper_set_config,
> +       .destroy                =3D drm_crtc_cleanup,
> +       .page_flip              =3D drm_atomic_helper_page_flip,
> +       .reset                  =3D drm_atomic_helper_crtc_reset,
> +       .atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_stat=
e,
> +       .atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_state,
> +       .enable_vblank          =3D amdgpu_vkms_enable_vblank,
> +       .disable_vblank         =3D amdgpu_vkms_disable_vblank,
> +       .get_vblank_timestamp   =3D amdgpu_vkms_get_vblank_timestamp,
> +};
> +
> +static void amdgpu_vkms_crtc_atomic_enable(struct drm_crtc *crtc,
> +                                          struct drm_atomic_state=20
> +*state) {
> +       drm_crtc_vblank_on(crtc);
> +}
> +
> +static void amdgpu_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
> +                                           struct drm_atomic_state=20
> +*state) {
> +       drm_crtc_vblank_off(crtc);
> +}
> +
> +static void amdgpu_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> +                                         struct drm_atomic_state=20
> +*state) {
> +       if (crtc->state->event) {
> +               spin_lock(&crtc->dev->event_lock);
> +
> +               if (drm_crtc_vblank_get(crtc) !=3D 0)
> +                       drm_crtc_send_vblank_event(crtc, crtc->state->eve=
nt);
> +               else
> +                       drm_crtc_arm_vblank_event(crtc,=20
> + crtc->state->event);
> +
> +               spin_unlock(&crtc->dev->event_lock);
> +
> +               crtc->state->event =3D NULL;
> +       }
> +}
> +
> +static const struct drm_crtc_helper_funcs amdgpu_vkms_crtc_helper_funcs =
=3D {
> +       .atomic_flush   =3D amdgpu_vkms_crtc_atomic_flush,
> +       .atomic_enable  =3D amdgpu_vkms_crtc_atomic_enable,
> +       .atomic_disable =3D amdgpu_vkms_crtc_atomic_disable, };
> +
> +static int amdgpu_vkms_crtc_init(struct drm_device *dev, struct drm_crtc=
 *crtc,
> +                         struct drm_plane *primary, struct drm_plane=20
> +*cursor) {
> +       int ret;
> +
> +       ret =3D drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> +                                       &amdgpu_vkms_crtc_funcs, NULL);
> +       if (ret) {
> +               DRM_ERROR("Failed to init CRTC\n");
> +               return ret;
> +       }
> +
> +       drm_crtc_helper_add(crtc, &amdgpu_vkms_crtc_helper_funcs);
> +
> +       return ret;
> +}
> +
> +static const struct drm_connector_funcs amdgpu_vkms_connector_funcs =3D =
{
> +       .fill_modes =3D drm_helper_probe_single_connector_modes,
> +       .destroy =3D drm_connector_cleanup,
> +       .reset =3D drm_atomic_helper_connector_reset,
> +       .atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate=
_state,
> +       .atomic_destroy_state =3D=20
> +drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int amdgpu_vkms_conn_get_modes(struct drm_connector=20
> +*connector) {
> +       int count;
> +
> +       count =3D drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
> +       drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
> +
> +       return count;
> +}
> +
> +static const struct drm_connector_helper_funcs amdgpu_vkms_conn_helper_f=
uncs =3D {
> +       .get_modes    =3D amdgpu_vkms_conn_get_modes,
> +};
> +
> +static const struct drm_plane_funcs amdgpu_vkms_plane_funcs =3D {
> +       .update_plane           =3D drm_atomic_helper_update_plane,
> +       .disable_plane          =3D drm_atomic_helper_disable_plane,
> +       .destroy                =3D drm_plane_cleanup,
> +       .reset                  =3D drm_atomic_helper_plane_reset,
> +       .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_sta=
te,
> +       .atomic_destroy_state   =3D drm_atomic_helper_plane_destroy_state=
,
> +};
> +
> +static void amdgpu_vkms_plane_atomic_update(struct drm_plane *plane,
> +                                           struct drm_plane_state=20
> +*old_state) {
> +       return;
> +}
> +
> +static int amdgpu_vkms_plane_atomic_check(struct drm_plane *plane,
> +                                         struct drm_plane_state=20
> +*state) {
> +       struct drm_crtc_state *crtc_state;
> +       bool can_position =3D false;
> +       int ret;
> +
> +       if (!state->fb || WARN_ON(!state->crtc))
> +               return 0;
> +
> +       crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crt=
c);
> +       if (IS_ERR(crtc_state))
> +               return PTR_ERR(crtc_state);
> +
> +       ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +                                                 DRM_PLANE_HELPER_NO_SCA=
LING,
> +                                                 DRM_PLANE_HELPER_NO_SCA=
LING,
> +                                                 can_position, true);
> +       if (ret !=3D 0)
> +               return ret;
> +
> +       /* for now primary plane must be visible and full screen */
> +       if (!state->visible && !can_position)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
> +                                 struct drm_plane_state *new_state) {
> +       struct amdgpu_framebuffer *afb;
> +       struct drm_gem_object *obj;
> +       struct amdgpu_device *adev;
> +       struct amdgpu_bo *rbo;
> +       struct list_head list;
> +       struct ttm_validate_buffer tv;
> +       struct ww_acquire_ctx ticket;
> +       uint32_t domain;
> +       int r;
> +
> +       if (!new_state->fb) {
> +               DRM_DEBUG_KMS("No FB bound\n");
> +               return 0;
> +       }
> +       afb =3D to_amdgpu_framebuffer(new_state->fb);
> +       obj =3D new_state->fb->obj[0];
> +       rbo =3D gem_to_amdgpu_bo(obj);
> +       adev =3D amdgpu_ttm_adev(rbo->tbo.bdev);
> +       INIT_LIST_HEAD(&list);
> +
> +       tv.bo =3D &rbo->tbo;
> +       tv.num_shared =3D 1;
> +       list_add(&tv.head, &list);
> +
> +       r =3D ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
> +       if (r) {
> +               dev_err(adev->dev, "fail to reserve bo (%d)\n", r);
> +               return r;
> +       }
> +
> +       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> +               domain =3D amdgpu_display_supported_domains(adev, rbo->fl=
ags);
> +       else
> +               domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> +
> +       r =3D amdgpu_bo_pin(rbo, domain);
> +       if (unlikely(r !=3D 0)) {
> +               if (r !=3D -ERESTARTSYS)
> +                       DRM_ERROR("Failed to pin framebuffer with error %=
d\n", r);
> +               ttm_eu_backoff_reservation(&ticket, &list);
> +               return r;
> +       }
> +
> +       r =3D amdgpu_ttm_alloc_gart(&rbo->tbo);
> +       if (unlikely(r !=3D 0)) {
> +               amdgpu_bo_unpin(rbo);
> +               ttm_eu_backoff_reservation(&ticket, &list);
> +               DRM_ERROR("%p bind failed\n", rbo);
> +               return r;
> +       }
> +
> +       ttm_eu_backoff_reservation(&ticket, &list);
> +
> +       afb->address =3D amdgpu_bo_gpu_offset(rbo);
> +
> +       amdgpu_bo_ref(rbo);
> +
> +       return 0;
> +}
> +
> +static void amdgpu_vkms_cleanup_fb(struct drm_plane *plane,
> +                                  struct drm_plane_state *old_state)=20
> +{
> +       struct amdgpu_bo *rbo;
> +       int r;
> +
> +       if (!old_state->fb)
> +               return;
> +
> +       rbo =3D gem_to_amdgpu_bo(old_state->fb->obj[0]);
> +       r =3D amdgpu_bo_reserve(rbo, false);
> +       if (unlikely(r)) {
> +               DRM_ERROR("failed to reserve rbo before unpin\n");
> +               return;
> +       }
> +
> +       amdgpu_bo_unpin(rbo);
> +       amdgpu_bo_unreserve(rbo);
> +       amdgpu_bo_unref(&rbo);
> +}
> +
> +static const struct drm_plane_helper_funcs amdgpu_vkms_primary_helper_fu=
ncs =3D {
> +       .atomic_update          =3D amdgpu_vkms_plane_atomic_update,
> +       .atomic_check           =3D amdgpu_vkms_plane_atomic_check,
> +       .prepare_fb             =3D amdgpu_vkms_prepare_fb,
> +       .cleanup_fb             =3D amdgpu_vkms_cleanup_fb,
> +};
> +
> +static struct drm_plane *amdgpu_vkms_plane_init(struct drm_device *dev,
> +                                               enum drm_plane_type type,
> +                                               int index) {
> +       struct drm_plane *plane;
> +       int ret;
> +
> +       plane =3D kzalloc(sizeof(*plane), GFP_KERNEL);
> +       if (!plane)
> +               return ERR_PTR(-ENOMEM);
> +
> +       ret =3D drm_universal_plane_init(dev, plane, 1 << index,
> +                                      &amdgpu_vkms_plane_funcs,
> +                                      amdgpu_vkms_formats,
> +                                      ARRAY_SIZE(amdgpu_vkms_formats),
> +                                      NULL, type, NULL);
> +       if (ret) {
> +               kfree(plane);
> +               return ERR_PTR(ret);
> +       }
> +
> +       drm_plane_helper_add(plane,=20
> + &amdgpu_vkms_primary_helper_funcs);
> +
> +       return plane;
> +}
> +
> +int amdgpu_vkms_output_init(struct drm_device *dev,
> +                           struct amdgpu_vkms_output *output, int=20
> +index) {
> +       struct drm_connector *connector =3D &output->connector;
> +       struct drm_encoder *encoder =3D &output->encoder;
> +       struct drm_crtc *crtc =3D &output->crtc;
> +       struct drm_plane *primary, *cursor =3D NULL;
> +       int ret;
> +
> +       primary =3D amdgpu_vkms_plane_init(dev, DRM_PLANE_TYPE_PRIMARY, i=
ndex);
> +       if (IS_ERR(primary))
> +               return PTR_ERR(primary);
> +
> +       ret =3D amdgpu_vkms_crtc_init(dev, crtc, primary, cursor);
> +       if (ret)
> +               goto err_crtc;
> +
> +       ret =3D drm_connector_init(dev, connector, &amdgpu_vkms_connector=
_funcs,
> +                                DRM_MODE_CONNECTOR_VIRTUAL);
> +       if (ret) {
> +               DRM_ERROR("Failed to init connector\n");
> +               goto err_connector;
> +       }
> +
> +       drm_connector_helper_add(connector,=20
> + &amdgpu_vkms_conn_helper_funcs);
> +
> +       ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VI=
RTUAL);
> +       if (ret) {
> +               DRM_ERROR("Failed to init encoder\n");
> +               goto err_encoder;
> +       }
> +       encoder->possible_crtcs =3D 1 << index;
> +
> +       ret =3D drm_connector_attach_encoder(connector, encoder);
> +       if (ret) {
> +               DRM_ERROR("Failed to attach connector to encoder\n");
> +               goto err_attach;
> +       }
> +
> +       drm_mode_config_reset(dev);
> +
> +       return 0;
> +
> +err_attach:
> +       drm_encoder_cleanup(encoder);
> +
> +err_encoder:
> +       drm_connector_cleanup(connector);
> +
> +err_connector:
> +       drm_crtc_cleanup(crtc);
> +
> +err_crtc:
> +       drm_plane_cleanup(primary);
> +
> +       return ret;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h=20
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> new file mode 100644
> index 000000000000..5dab51fbecf3
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _AMDGPU_VKMS_H_
> +#define _AMDGPU_VKMS_H_
> +
> +#define XRES_DEF  1024
> +#define YRES_DEF   764

Squash in the 768 fix here.

> +
> +#define XRES_MAX  16384
> +#define YRES_MAX  16384
> +
> +#define drm_crtc_to_amdgpu_vkms_output(target) \
> +       container_of(target, struct amdgpu_vkms_output, crtc)
> +
> +extern const struct amdgpu_ip_block_version amdgpu_vkms_ip_block;
> +
> +struct amdgpu_vkms_output {
> +       struct drm_crtc crtc;
> +       struct drm_encoder encoder;
> +       struct drm_connector connector;
> +       struct hrtimer vblank_hrtimer;
> +       ktime_t period_ns;
> +       struct drm_pending_vblank_event *event; };
> +
> +int amdgpu_vkms_output_init(struct drm_device *dev,
> +                           struct amdgpu_vkms_output *output, int=20
> +index);
> +
> +#endif /* _AMDGPU_VKMS_H_ */
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c=20
> b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> index 7e0d8c092c7e..642c77533157 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> @@ -22,6 +22,7 @@
>   */
>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_atomic_helper.h>
>
>  #include "amdgpu.h"
>  #include "amdgpu_pm.h"
> @@ -40,6 +41,7 @@
>  #include "dce_virtual.h"
>  #include "ivsrcid/ivsrcid_vislands30.h"
>  #include "amdgpu_display.h"
> +#include "amdgpu_vkms.h"
>
>  #define DCE_VIRTUAL_VBLANK_PERIOD 16666666
>
> @@ -374,6 +376,12 @@ static const struct drm_connector_funcs dce_virtual_=
connector_funcs =3D {
>         .force =3D dce_virtual_force,
>  };
>
> +const struct drm_mode_config_funcs dce_virtual_mode_funcs =3D {
> +       .fb_create =3D amdgpu_display_user_framebuffer_create,
> +       .atomic_check =3D drm_atomic_helper_check,
> +       .atomic_commit =3D drm_atomic_helper_commit, };
> +
>  static int dce_virtual_sw_init(void *handle)  {
>         int r, i;
> @@ -385,10 +393,10 @@ static int dce_virtual_sw_init(void *handle)
>
>         adev_to_drm(adev)->max_vblank_count =3D 0;
>
> -       adev_to_drm(adev)->mode_config.funcs =3D &amdgpu_mode_funcs;
> +       adev_to_drm(adev)->mode_config.funcs =3D=20
> + &dce_virtual_mode_funcs;
>
> -       adev_to_drm(adev)->mode_config.max_width =3D 16384;
> -       adev_to_drm(adev)->mode_config.max_height =3D 16384;
> +       adev_to_drm(adev)->mode_config.max_width =3D XRES_MAX;
> +       adev_to_drm(adev)->mode_config.max_height =3D YRES_MAX;
>
>         adev_to_drm(adev)->mode_config.preferred_depth =3D 24;
>         adev_to_drm(adev)->mode_config.prefer_shadow =3D 1; @@ -399,15=20
> +407,11 @@ static int dce_virtual_sw_init(void *handle)
>         if (r)
>                 return r;
>
> -       adev_to_drm(adev)->mode_config.max_width =3D 16384;
> -       adev_to_drm(adev)->mode_config.max_height =3D 16384;
> +       adev->amdgpu_vkms_output =3D kzalloc(sizeof(struct=20
> + amdgpu_vkms_output) * adev->mode_info.num_crtc, GFP_KERNEL);

You can use kcalloc here.

>
>         /* allocate crtcs, encoders, connectors */
>         for (i =3D 0; i < adev->mode_info.num_crtc; i++) {
> -               r =3D dce_virtual_crtc_init(adev, i);
> -               if (r)
> -                       return r;
> -               r =3D dce_virtual_connector_encoder_init(adev, i);
> +               r =3D amdgpu_vkms_output_init(adev_to_drm(adev),=20
> + &adev->amdgpu_vkms_output[i], i);
>                 if (r)
>                         return r;
>         }
> @@ -428,6 +432,7 @@ static int dce_virtual_sw_fini(void *handle)
>                        =20
> hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
>
>         kfree(adev->mode_info.bios_hardcoded_edid);
> +       kfree(adev->amdgpu_vkms_output);
>
>         drm_kms_helper_poll_fini(adev_to_drm(adev));
>
> --
> 2.32.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
> s.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cgu
> chun.chen%40amd.com%7Ce4b064b3485c4865df8608d94de6a58e%7C3dd8961fe4884
> e608e11a82d994e183d%7C0%7C0%7C637626475284480052%7CUnknown%7CTWFpbGZsb
> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C1000&amp;sdata=3D0bbTKflaP2RPk%2BpboaNNiwffbEw1pW0zkqcxzPWjzmI%3D&amp;
> reserved=3D0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cguchun.c=
hen%40amd.com%7Ce4b064b3485c4865df8608d94de6a58e%7C3dd8961fe4884e608e11a82d=
994e183d%7C0%7C0%7C637626475284490043%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DVQ=
1liQG9OOsBA3NtjS93WNu6NhlLQ0fXQRbLwLmz95g%3D&amp;reserved=3D0
