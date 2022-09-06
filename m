Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF5B5AF3E9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 20:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C5B10E120;
	Tue,  6 Sep 2022 18:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E5110E0E6;
 Tue,  6 Sep 2022 18:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0X5ZSzjtLVy2WUcFj7MNPrRz3QrldDlZOXGMLyt4M/xbT3sZibrXGYOKkunjLVnCF8hMNY5yUqh0WLw1uwxMHGBBnXYvEHnmHWOdKp+75X70GZ6zUnd1/sDSW+oQ6dpC2g6veReKBzjOq73uD0jjWyQwjRd5h8WGyLCs7VrRDcto49tZ6XxA9bs16CrSC2Gwu6vtKyXp8LKGbyrEIX0afY8HgpUN1zGH74qH5KCmHvfISkF+3KbMuV4x3KCQx2F6x1dMeeZcNy7BC4GHXgSmdQOsCIDygrN5U7udtR6Q3tGJWdVQD6AP5vxCIcgEZu3aesEQ9pD/+kHjPcsk25ZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kE75CFqv9047hRzrpj+7r89IgoQZEfeC4NUcb9HWVMA=;
 b=W9pgBS/UmBy9TnII60PVKZd3l5lTLEgz69htJyf+xYps3TlxGvhfL564CuaHbFN5z2yK66Qm27egvnrbTc04CWlvRj7g4Y2oc0wdwYpWkU/M30Ih272Ps1Hntm9tMScezpmtjb+5lqkiatjAFr7ayZuKXq/dx+uLN2xAVIZm5L/AiMIXevcf0xDwUUn6MfJOkG7lmRmCGqDJt2yWw7+lIAZN8r5yW6hZjZhJzWKhJxjy3t1LtGRfhqU8Uz0+CsHODTly7S2gJ+65/jNvB1SjWu/6nbT3K1tvNjwPCRFJxPMgDSSWSeXVLb2DZUBJBGFfYNwTlCAkGyOrTx0MtoIgQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE75CFqv9047hRzrpj+7r89IgoQZEfeC4NUcb9HWVMA=;
 b=aE1bBXdeVDA28YtpFSGeRBm+0V7ib5tGABpvH4fWQF1z1wBKyYjmkub634dDTBRCXYj3ERiguaBg3rdXttU7bgFUlSu03e2Soic5IOMiArGdow8OPDdaAn9b8dms5CiuhVKiCe+agMLD9KSiQv4W6XJkeQYQMenpWjzGWGx0t50=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BN9PR12MB5130.namprd12.prod.outlook.com (2603:10b6:408:137::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 18:48:04 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2428:2f57:b85c:757f]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2428:2f57:b85c:757f%7]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 18:48:04 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Jingyu Wang
 <jingyuwang_vip@163.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_amdkfd_gpuvm.c
Thread-Topic: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_amdkfd_gpuvm.c
Thread-Index: AQHYwQLu96H3UYws/U+s+2p4GZlXfq3SbAUAgABULVo=
Date: Tue, 6 Sep 2022 18:48:04 +0000
Message-ID: <BL1PR12MB51444461B0F15AAF3BE46F91F77E9@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220905083825.23429-1-jingyuwang_vip@163.com>
 <18083c05-7636-2155-610b-2d1347f8585f@amd.com>
In-Reply-To: <18083c05-7636-2155-610b-2d1347f8585f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-09-06T18:48:03.635Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0104586a-20c4-45c6-8238-08da903854e4
x-ms-traffictypediagnostic: BN9PR12MB5130:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bYGk6cJTFx/jlvyHt2krBB7tKsBcGMT+wM3XWMmpOZsUXHUmEo+QekAKoy0tdTzmpLLpNeaRLw7HxcNEJ3gcJFosehIlNzhemCjh/NsMLulSTqUf2RZo4zaYNuqAt6aG0PZ7b3DRkbGTN8Wn0moBsfgtuS6vsu4deNRHUiWDheghAO6gRqFSSdxC4qqRVHpkg5nyOBxX+DXFfzryxddIH5Hdott+JMWmuln2v0kp1RX7K++qciLX0DwXSj615OqlbjRnW88tMBCQABdz46lwlPtRaYxCF663F5saENMG85urD326zubrK7W89wHImu+0ea223cCE935LhVhC/J8i2TKAN9RCOqNRNuGEQcbuVUPyfDJ1hfm6XY/Esz+UiYH3ZIIrLrI7HUsgiknHSvZJQfd1yTIdvTovBaUSs7G82My0FwTu/In48SSAPGWhUhijHd18DNmhgRKH0KulRqV/v8J/5o0QvVUqtWrrk59nlPNd+n3Yl77KH07Te/u3M6NpASvp7GCcK9jIlHzEthgb8yJDCdA/BeaulQ3TVbGYZB8BJQtZ3e5/T0Wv+3aXyYe1d/17KJxSBxe02AEetuo3NmgxYuS0rg7rzhUsULCUk4jK2YdF/W9/xUcpflwLgKA38L7hG3AU1mDbrsmUuSp2NAwbJ80JzG57x2EavYvxAs1qS1xqW2zeJ/P/XP0DnoxNBPkkoSUcaFXAjp/NWAqEbblZO11YD6+4hRtP3o/suq/Ces13yD2ppgogGmHZS51fKVURHUcF4oQ9C9oGNIDPHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(64756008)(6506007)(26005)(66446008)(9686003)(4326008)(66556008)(86362001)(76116006)(53546011)(66476007)(8676002)(122000001)(83380400001)(7696005)(71200400001)(55016003)(38100700002)(316002)(110136005)(33656002)(54906003)(8936002)(66946007)(5660300002)(38070700005)(41300700001)(19627405001)(478600001)(186003)(2906002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2mGkUmwV/13FkvDAoRVsrnYe0ZPG5pJ4TQm6cLIAxtcwYiAq7jaVGIHEPoES?=
 =?us-ascii?Q?zPVuNGWyDKSpTl1qy0Fb4HBIWvpD7o/SA5xYaMBsA6XkqdcdBTismVXFr1Me?=
 =?us-ascii?Q?HSOT4q49RTgvuPXeN9gDbxdqMo179L89FtITTI/nTkXE2LQEO19BCKfRnNFS?=
 =?us-ascii?Q?XGZ73ASeFlf8KzV3aHkDelVV4Qs9fBUAyPzDbizGC3fGQOKrAyVtVoea0Lu2?=
 =?us-ascii?Q?W1eqT5qAsf2NwVtpcRr4bi1fHsJsAXvwfvEBVc6MarczflikqLl4ls4dfcs8?=
 =?us-ascii?Q?pU6spPatCTNG6YEUtzF1vWLR9lPuNYsJ6qM13nEp5Sxd117oWpofSsgMOi6P?=
 =?us-ascii?Q?DrdxovNdhXJEHLroSzds4s7bJygJigSj2CbA63DJLI+VolRz9r6flZMM3qQf?=
 =?us-ascii?Q?pJqJ9pNHHhH0GdZ907JWwvwtjiSB64QCH34wZiRc/II+e5/9vysAKT7pH5eP?=
 =?us-ascii?Q?vFeTw/wqaUk8Ss8QEEkJODOqLI3xfVV3Jmes3mMMogn/iymrTC38LZb9aV0z?=
 =?us-ascii?Q?1kZt/b7qgRKyBilP265V/3vCoP0iXYHZPJP3CGypyvzx9HeHHz3Fo0osGXA0?=
 =?us-ascii?Q?y3iKyTD2zAzuDy5dUc3YMtLtJZz0yGKb7pxACteXpuiGGN7HQMDAp//Kuy2x?=
 =?us-ascii?Q?YPrTUjIvm09fmcKg52Iuz16btHcrkZfC6fLc6zRiYCVdrDmsaZz7aBYyR74v?=
 =?us-ascii?Q?j5owZOSqd60XZ6fbK1TD32m1N2eHpw/szTrTrt5nfq47FYNJ4lHOw6GPWv/9?=
 =?us-ascii?Q?06LhcDSmQyLKmWMNAYMIU0AagwUD7snXCqK/fIycAhwa4gmBt0rXG+/u0LDE?=
 =?us-ascii?Q?I82gretkUQncjsJQwJSUTFGaq1mMOEjiFEX4zupmDHbKbyNZRyAMPgGk8Bh/?=
 =?us-ascii?Q?+R0EdOBd69JSrjuzVia78m7BSfTpbLezChi/lABC11hEYWTfVE0MvrLalgwx?=
 =?us-ascii?Q?uGsT9fikuLdOv25V7piAtPBGLFylHd7ZtAF4iLuDrPvI/5w1eMbOZbajcdQW?=
 =?us-ascii?Q?DiafYhnEpnB0qZ7EkE2qnRAhAfzoDZM4Urf7G8bqmQTHiWpQf6sBiZCV1Rhy?=
 =?us-ascii?Q?XLiGP1ihyBP43Jzspn7ux+vOXM/suVtymEsGYrckQ4uPxYmbsOeUQmoZnfLG?=
 =?us-ascii?Q?jjTDgWG3ymZTXDuqla51C6KfO3wdWRN+KpRGrnLZH2Ves/kzN9GhByjcwr4y?=
 =?us-ascii?Q?CcR76zOZ4Q0IXVy2mZtRgwzcrHLQglBB57+AULkPscYBFqDqmIuNykC58Re1?=
 =?us-ascii?Q?HM3TjBaOlYgCnb+p+EgWHyri4MU+5uAf+ggFCeLwcGRsc/eC218Arwd6vjhF?=
 =?us-ascii?Q?J1ITUc81etq8JcURvfmrnLNDnBdpFIjbfc5hqfxNdEiQ9/b4jLvrm+mqKz0M?=
 =?us-ascii?Q?nQFxPo3DJXqJB6ZCCwGlXTkRmWuY2IeVnmgS3VMFHqBa1RpNTO5AzXAGdWPh?=
 =?us-ascii?Q?9ymArqZB0C2+4SbPK4HGq8Af9LtOarYWFf6Ya7+C7GCvuXk9nbb7Zxrbl2Pe?=
 =?us-ascii?Q?UxcND7KUVC55BAq8J+F9IvvcsfNKM3AKs5NXhgR1pjvaJKX/wdZVBr6oHG3W?=
 =?us-ascii?Q?DbZNUEYZADTdM73S2zE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB51444461B0F15AAF3BE46F91F77E9BL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0104586a-20c4-45c6-8238-08da903854e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 18:48:04.2551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yHN57ejiwzxzLG4Mjbb/h3Cm75rkVqh/yUYjfXaPPLfI+2luXs+KW8tR5EVGTeh80R18oQJ/IcTPaPjJ70TiJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5130
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BL1PR12MB51444461B0F15AAF3BE46F91F77E9BL1PR12MB5144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Yeah, seems to be a mix.  I don't have a strong opinion as long as it has M=
IT.

Alex

________________________________
From: Kuehling, Felix <Felix.Kuehling@amd.com>
Sent: Tuesday, September 6, 2022 9:46 AM
To: Jingyu Wang <jingyuwang_vip@163.com>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <X=
inhui.Pan@amd.com>; airlied@linux.ie <airlied@linux.ie>; daniel@ffwll.ch <d=
aniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vge=
r.kernel.org <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_amdkfd_gpuv=
m.c


Am 2022-09-05 um 04:38 schrieb Jingyu Wang:
> Fix everything checkpatch.pl complained about in amdgpu_amdkfd_gpuvm.c
>
> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index cbd593f7d553..eff596c60c89 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: MIT

I'm not sure if this is correct. We've used "GPL-2.0 OR MIT" in KFD. In
amdgpu there is currently a mix of licenses. Alex, do you want to make a
call on a consistent one to use in amdgpu?

Other than that, this patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


>   /*
>    * Copyright 2014-2018 Advanced Micro Devices, Inc.
>    *
> @@ -1612,6 +1613,7 @@ size_t amdgpu_amdkfd_get_available_memory(struct am=
dgpu_device *adev)
>        uint64_t reserved_for_pt =3D
>                ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);
>        size_t available;
> +
>        spin_lock(&kfd_mem_limit.mem_limit_lock);
>        available =3D adev->gmc.real_vram_size
>                - adev->kfd.vram_used_aligned
> @@ -2216,7 +2218,7 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct am=
dgpu_device *adev,
>   {
>        if (atomic_read(&adev->gmc.vm_fault_info_updated) =3D=3D 1) {
>                *mem =3D *adev->gmc.vm_fault_info;
> -             mb();
> +             mb(); /* make sure read happened */
>                atomic_set(&adev->gmc.vm_fault_info_updated, 0);
>        }
>        return 0;
>
> base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8

--_000_BL1PR12MB51444461B0F15AAF3BE46F91F77E9BL1PR12MB5144namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Yeah, seems to be a mix.&nbsp; I don't have a strong opinion as long as it =
has MIT.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kuehling, Felix &lt;F=
elix.Kuehling@amd.com&gt;<br>
<b>Sent:</b> Tuesday, September 6, 2022 9:46 AM<br>
<b>To:</b> Jingyu Wang &lt;jingyuwang_vip@163.com&gt;; Deucher, Alexander &=
lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@am=
d.com&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; airlied@linux.ie &lt;air=
lied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_amdk=
fd_gpuvm.c</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
Am 2022-09-05 um 04:38 schrieb Jingyu Wang:<br>
&gt; Fix everything checkpatch.pl complained about in amdgpu_amdkfd_gpuvm.c=
<br>
&gt;<br>
&gt; Signed-off-by: Jingyu Wang &lt;jingyuwang_vip@163.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +++-<=
br>
&gt;&nbsp;&nbsp; 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/driver=
s/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
&gt; index cbd593f7d553..eff596c60c89 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
&gt; @@ -1,3 +1,4 @@<br>
&gt; +// SPDX-License-Identifier: MIT<br>
<br>
I'm not sure if this is correct. We've used &quot;GPL-2.0 OR MIT&quot; in K=
FD. In <br>
amdgpu there is currently a mix of licenses. Alex, do you want to make a <b=
r>
call on a consistent one to use in amdgpu?<br>
<br>
Other than that, this patch is<br>
<br>
Reviewed-by: Felix Kuehling &lt;Felix.Kuehling@amd.com&gt;<br>
<br>
<br>
&gt;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp; * Copyright 2014-2018 Advanced Micro Devices, Inc.<b=
r>
&gt;&nbsp;&nbsp;&nbsp; *<br>
&gt; @@ -1612,6 +1613,7 @@ size_t amdgpu_amdkfd_get_available_memory(struct=
 amdgpu_device *adev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t reserved_for_pt =3D=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t available;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;kfd_mem_limit=
.mem_limit_lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available =3D adev-&gt;gmc.r=
eal_vram_size<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; - adev-&gt;kfd.vram_used_aligned<br>
&gt; @@ -2216,7 +2218,7 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct=
 amdgpu_device *adev,<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (atomic_read(&amp;adev-&g=
t;gmc.vm_fault_info_updated) =3D=3D 1) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; *mem =3D *adev-&gt;gmc.vm_fault_info;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; mb();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; mb(); /* make sure read happened */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; atomic_set(&amp;adev-&gt;gmc.vm_fault_info_updated, 0);=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;<br>
&gt; base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB51444461B0F15AAF3BE46F91F77E9BL1PR12MB5144namp_--
