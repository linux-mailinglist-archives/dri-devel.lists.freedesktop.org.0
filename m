Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01421D979F
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 15:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391F96E366;
	Tue, 19 May 2020 13:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3B16E342;
 Tue, 19 May 2020 13:25:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9ZFUZ4ZxE909I9uXX6Txv57779V8iX7Oe4v1gL4KT6WCyFI9YL0gaKVZrhKntEUvJHmHKJWim/pAZLatR3bDs3yhZ36Pt+W87IK/WO6WYPnEDFvqG3QFUwWx3xW2xFJMMgIp6AcBf9Q7dGQtYUoyTqCFRXhGoyBfWDlO3Qla3GR2r5OCWWeKJmgkMFrxwf83fWzXC+RbVFFRIqhN8aSUhYmS0v5HtHHmAPqOPRDYeh7ZT89be20+XNTNj2Lb5VP/7HaDv6NT45bxWxCFLS5Jf5/eftlE99C6d+X93sJIOnn217FMSaTTcdVdOUyb8cOURXW6yX0QK5pxdp2N+6CBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgKqJ0t9Qn0Rt82LHm+nH3kySoOoM8LCfY7xcjjVnNs=;
 b=MgUCrGxyZ2pJQXGvC6sC7xLpWRh/kutMEYme56katplfT+setLeiEyf5Kmua2L0vyOjWLL3x0q7/QlnlxWfZYOPm7x4pcXp7Qgkk6xdLFkmAELd7egISeC4JNISov5SKVVdcaOgFbY/rZxMXQb2mDwbI/XcOvl7BUFIauZX1S4fpb13Bu/h7epO0XYeYcngu35D2HgXP9jGfchwYM1ie04ifcRLBZMSQmlpYF+ZwVPpKI3777P9PT3uwTgQXZKSjyL55/itM51ki5xKNWCbEgE/cojFToiyLLbtC5G98+HHJ1B0rX4XCi2yQ5x7rosqON/BO8AnkjvgHiC0u18WuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgKqJ0t9Qn0Rt82LHm+nH3kySoOoM8LCfY7xcjjVnNs=;
 b=BxfT7BKhz5xehxCUXstWrcRMV9ziYJH9SRwgnOdqtxmacRsI3dLInDRJbUTzW5Aj1pdrVnoF4iEERTfjUzrr/8uLZ+30tyCJ8N80SE/g8L6BxFwbJsAcjdJSf5q3bUBSiQsmPtY5blBrK6bVXh9UtHIQ12iRROkdZoQMr9dlT64=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3774.namprd12.prod.outlook.com (2603:10b6:208:16a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 19 May
 2020 13:25:46 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::313c:e4d2:7dd2:2d72]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::313c:e4d2:7dd2:2d72%5]) with mapi id 15.20.3021.020; Tue, 19 May 2020
 13:25:46 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?Windows-1252?Q?Marek_Ol=9A=E1k?= <maraeo@gmail.com>, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.6 33/50] drm/amdgpu: bump version for invalidate
 L2 before SDMA IBs
Thread-Topic: [PATCH AUTOSEL 5.6 33/50] drm/amdgpu: bump version for
 invalidate L2 before SDMA IBs
Thread-Index: AQHWJHu9VxGgA9T09Uin+3s+X1WVCKiugECAgAD4rEo=
Date: Tue, 19 May 2020 13:25:46 +0000
Message-ID: <MN2PR12MB448885DDE200B4137C2C18F9F7B90@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20200507142726.25751-1-sashal@kernel.org>
 <20200507142726.25751-33-sashal@kernel.org>,
 <CAAxE2A4cWMctuCzm-ftdzDT=p9d5973XSZAstC0-OuJ0WE9ASQ@mail.gmail.com>
In-Reply-To: <CAAxE2A4cWMctuCzm-ftdzDT=p9d5973XSZAstC0-OuJ0WE9ASQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=True;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-05-19T13:25:45.707Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=AMD
 Public; MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [71.51.180.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fb1ecb50-a5c2-43e1-29d4-08d7fbf8239c
x-ms-traffictypediagnostic: MN2PR12MB3774:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3774FDB8E8A22776DBF94D65F7B90@MN2PR12MB3774.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EjGlAJSvHalat2juUO5VdQibkaPZoJhLs8SsQ9VtxVccZgbxawP8PCDTFRRlEEXuMaR5lOjJjlb4MprxJKV2D3LUaQEhKu7FkAp0+yYaGSgiQ1MA+wwPndS/llmzGb1vD2g8aqkt/CFTRNiMNcsKDcSjQkYJEp9YVQsvyk5S45sHwjluaz1ZXhVmPZEvjEtv0zJ6/Sd+RryLv2syYudP3KyS0+Ah+tUcET7V+hufoJGI26vEwx/9nd9YuiqtPsUr2ORQgO8p1bW9DOB8frTj65p5ficnr4XRl9rUYY9O5vFoJCaUaJzfg5p5vUHTYccUvn8UnKF5nKrhvQmUhphNhlqSTyI4v/Y0+UC1utL2feuz/hCa2Jc4BjVIarz2zqbKatytBoTWfd8nt4cuYzp8EY/OTObJLIvxLYrZ3kIsR9WYXkmsdNtNnRjRJojPs5TJYX31ErNN9Kpm/lB3xm6Zv0PC6LjNj+9stQv9RSHsb2g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(71200400001)(966005)(26005)(55016002)(9686003)(6506007)(53546011)(8676002)(76116006)(66946007)(478600001)(2906002)(66476007)(66556008)(33656002)(64756008)(66446008)(4326008)(86362001)(5660300002)(52536014)(54906003)(110136005)(7696005)(316002)(8936002)(186003)(66574014)(19627405001)(166002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uwYc8pOK+TvqgS46a9Z7CNPd86diAvcxlZ0biGjLYUqj+cr3zS2HyRrKJrk6PAu44nmsEYzhZhzAIw+Wba/otIc5eDROfHnjbK87yAJyD7TuFLziTcKn4Z/5Ss65ljQfgPXexb5ktNLlZZdkaxty3bT+VR9z24Tv5YTkL7wwlybuNfJ1FLpqRyqkNe1vPiCkdLzyBxnMNqEowvDa3GG8Crkfxm5B36PxHlpKdzow0ruVCegPeMOVQQVujXpke9/cYlhpTJXt2rUbKf+O2o+ROzRUc+qxYo3LFaDTb1hHjGa6WJQ4GDyVCkw/m9bovOTGQEBFHLuQhP5d6ExYKhULr/AoUcZRBPOsZ+JoqWjQmPvuuWF4mFamVURtArmz+dpnM0EAlSpjfZSJlCBC2BF5kud91+ucnXAO75m8+FNzBPuKLiFAHRGGDK6+kv+tdF8I61yf2Z9uWh9RRCfTonvhgjGO1Q1QUjJXpaN5DLD9hCE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1ecb50-a5c2-43e1-29d4-08d7fbf8239c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 13:25:46.2887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PeFHxkGn1uGA9X+6h9OoY35IdQGmnvmH/lPyjvyK10vVKZj7lMK7NH75/28IshFxSqWO4ebFRYQmhf4H0jtFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3774
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
Cc: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>, "Olsak,
 Marek" <Marek.Olsak@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============2021665512=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2021665512==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB448885DDE200B4137C2C18F9F7B90MN2PR12MB4488namp_"

--_000_MN2PR12MB448885DDE200B4137C2C18F9F7B90MN2PR12MB4488namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

Yes, please drop this patch for stable.

Alex
________________________________
From: Marek Ol=9A=E1k <maraeo@gmail.com>
Sent: Monday, May 18, 2020 6:35 PM
To: Sasha Levin <sashal@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; stable@vger.k=
ernel.org <stable@vger.kernel.org>; Pelloux-prayer, Pierre-eric <Pierre-eri=
c.Pelloux-prayer@amd.com>; Olsak, Marek <Marek.Olsak@amd.com>; amd-gfx mail=
ing list <amd-gfx@lists.freedesktop.org>; dri-devel <dri-devel@lists.freede=
sktop.org>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christi=
an <Christian.Koenig@amd.com>
Subject: Re: [PATCH AUTOSEL 5.6 33/50] drm/amdgpu: bump version for invalid=
ate L2 before SDMA IBs

Hi Sasha,

I disagree with this. Bumping the driver version will have implications on =
other new features, because it's like an ABI barrier exposing new functiona=
lity.

Marek

On Thu, May 7, 2020 at 10:28 AM Sasha Levin <sashal@kernel.org<mailto:sasha=
l@kernel.org>> wrote:
From: Marek Ol=9A=E1k <marek.olsak@amd.com<mailto:marek.olsak@amd.com>>

[ Upstream commit 9017a4897a20658f010bebea825262963c10afa6 ]

This fixes GPU hangs due to cache coherency issues.
Bump the driver version. Split out from the original patch.

Signed-off-by: Marek Ol=9A=E1k <marek.olsak@amd.com<mailto:marek.olsak@amd.=
com>>
Reviewed-by: Christian K=F6nig <christian.koenig@amd.com<mailto:christian.k=
oenig@amd.com>>
Tested-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com<m=
ailto:pierre-eric.pelloux-prayer@amd.com>>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com<mailto:alexander.deu=
cher@amd.com>>
Signed-off-by: Sasha Levin <sashal@kernel.org<mailto:sashal@kernel.org>>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 42f4febe24c6d..8d45a2b662aeb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -85,9 +85,10 @@
  * - 3.34.0 - Non-DC can flip correctly between buffers with different pit=
ches
  * - 3.35.0 - Add drm_amdgpu_info_device::tcc_disabled_mask
  * - 3.36.0 - Allow reading more status registers on si/cik
+ * - 3.37.0 - L2 is invalidated before SDMA IBs, needed for correctness
  */
 #define KMS_DRIVER_MAJOR       3
-#define KMS_DRIVER_MINOR       36
+#define KMS_DRIVER_MINOR       37
 #define KMS_DRIVER_PATCHLEVEL  0

 int amdgpu_vram_limit =3D 0;
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx<https://nam11.safeli=
nks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fmai=
lman%2Flistinfo%2Famd-gfx&data=3D02%7C01%7Calexander.deucher%40amd.com%7C2b=
b4939b162b4d66d57708d7fb7bd608%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7=
C637254381604715852&sdata=3DuJEI0CDUeUbUGUgnhnobpKygBueEGg6UqwgzkEtIsh8%3D&=
reserved=3D0>

--_000_MN2PR12MB448885DDE200B4137C2C18F9F7B90MN2PR12MB4488namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#317100;margin:15pt;" al=
ign=3D"Left">
[AMD Public Use]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Yes, please drop this patch for stable.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Marek Ol=9A=E1k &lt;m=
araeo@gmail.com&gt;<br>
<b>Sent:</b> Monday, May 18, 2020 6:35 PM<br>
<b>To:</b> Sasha Levin &lt;sashal@kernel.org&gt;<br>
<b>Cc:</b> Linux Kernel Mailing List &lt;linux-kernel@vger.kernel.org&gt;; =
stable@vger.kernel.org &lt;stable@vger.kernel.org&gt;; Pelloux-prayer, Pier=
re-eric &lt;Pierre-eric.Pelloux-prayer@amd.com&gt;; Olsak, Marek &lt;Marek.=
Olsak@amd.com&gt;; amd-gfx mailing list &lt;amd-gfx@lists.freedesktop.org&g=
t;;
 dri-devel &lt;dri-devel@lists.freedesktop.org&gt;; Deucher, Alexander &lt;=
Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.c=
om&gt;<br>
<b>Subject:</b> Re: [PATCH AUTOSEL 5.6 33/50] drm/amdgpu: bump version for =
invalidate L2 before SDMA IBs</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Sasha,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I disagree with this. Bumping the driver version will have implications on =
other new features, because it's like an ABI barrier exposing new functiona=
lity.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Marek<br>
</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, May 7, 2020 at 10:28 AM Sas=
ha Levin &lt;<a href=3D"mailto:sashal@kernel.org">sashal@kernel.org</a>&gt;=
 wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
From: Marek Ol=9A=E1k &lt;<a href=3D"mailto:marek.olsak@amd.com" target=3D"=
_blank">marek.olsak@amd.com</a>&gt;<br>
<br>
[ Upstream commit 9017a4897a20658f010bebea825262963c10afa6 ]<br>
<br>
This fixes GPU hangs due to cache coherency issues.<br>
Bump the driver version. Split out from the original patch.<br>
<br>
Signed-off-by: Marek Ol=9A=E1k &lt;<a href=3D"mailto:marek.olsak@amd.com" t=
arget=3D"_blank">marek.olsak@amd.com</a>&gt;<br>
Reviewed-by: Christian K=F6nig &lt;<a href=3D"mailto:christian.koenig@amd.c=
om" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
Tested-by: Pierre-Eric Pelloux-Prayer &lt;<a href=3D"mailto:pierre-eric.pel=
loux-prayer@amd.com" target=3D"_blank">pierre-eric.pelloux-prayer@amd.com</=
a>&gt;<br>
Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com=
" target=3D"_blank">alexander.deucher@amd.com</a>&gt;<br>
Signed-off-by: Sasha Levin &lt;<a href=3D"mailto:sashal@kernel.org" target=
=3D"_blank">sashal@kernel.org</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 &#43;&#43;-<br>
&nbsp;1 file changed, 2 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 42f4febe24c6d..8d45a2b662aeb 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -85,9 &#43;85,10 @@<br>
&nbsp; * - 3.34.0 - Non-DC can flip correctly between buffers with differen=
t pitches<br>
&nbsp; * - 3.35.0 - Add drm_amdgpu_info_device::tcc_disabled_mask<br>
&nbsp; * - 3.36.0 - Allow reading more status registers on si/cik<br>
&#43; * - 3.37.0 - L2 is invalidated before SDMA IBs, needed for correctnes=
s<br>
&nbsp; */<br>
&nbsp;#define KMS_DRIVER_MAJOR&nbsp; &nbsp; &nbsp; &nbsp;3<br>
-#define KMS_DRIVER_MINOR&nbsp; &nbsp; &nbsp; &nbsp;36<br>
&#43;#define KMS_DRIVER_MINOR&nbsp; &nbsp; &nbsp; &nbsp;37<br>
&nbsp;#define KMS_DRIVER_PATCHLEVEL&nbsp; 0<br>
<br>
&nbsp;int amdgpu_vram_limit =3D 0;<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01=
%7Calexander.deucher%40amd.com%7C2bb4939b162b4d66d57708d7fb7bd608%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C637254381604715852&amp;sdata=3DuJEI0CDU=
eUbUGUgnhnobpKygBueEGg6UqwgzkEtIsh8%3D&amp;reserved=3D0" originalsrc=3D"htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx" shash=3D"VAPmgi26LcB/k=
sdTS0iKaO1gfo9OB1JH8GmQQFjotKsRmhPuT0piirbA/yFnDeWQLl&#43;KMcs8KOY8uKGQaG4/=
s8n9lxJDoR2XsOZAQJQlvgid1hHfg/I9wtqQAAK1Oly&#43;MJtKsFsiGmHxCH&#43;NNQa7vPy=
LQvIWHrwBtCb43RqMWj8=3D" rel=3D"noreferrer" target=3D"_blank">https://lists=
.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB448885DDE200B4137C2C18F9F7B90MN2PR12MB4488namp_--

--===============2021665512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2021665512==--
