Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6900711C495
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 05:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5896EC4F;
	Thu, 12 Dec 2019 04:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700077.outbound.protection.outlook.com [40.107.70.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEECD6EC41;
 Thu, 12 Dec 2019 04:05:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyIFZ1aQHAc5TZiKJ2RyJzmeVFYBzux8QL1YwI9EiuKOGD8H8hulRQ6r9LgKdsF+EPB0+u/Dy7BT+b9c2E6PNiqGwOQxMmw9UU0t2nWOmsE60nnytjN9ZvA8QEm2tVQXxnF/Nzxg77nuyX/XMmlSXcTSf2d0QDP3vPfxpipLcY7eOXfr52U3UoWwEzMDdrF5hgxsFNJbHyDlRcacXrOjeDDkuuCPISVRIbr7PULdUUQky1lDIc+NUcHLFHeiZFJERUGW8zxjSUSyz6dQcUG0cWVulBEgIFBIc+I4cwh/gbSSdpsLVwySSrmKCGK4kFNMPLFhccoWJqNC82j2rdGOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KT8SfBO1lNLXtvyHMU+bwjfxV8aOg19dpuFVOPMOSg=;
 b=COH0kiFM+/WBjavqw8qDJp40cZYOVglFt1g/52nXMbz0g/Ef8jadsHKUbZS4DI4Ejent2Q+KtP7eJF/g3wb5Mmx5olhhUQk5fBVNEvyNcQyUMiLRcvxpMb2kM2061+vi37Wo+3GvPMJRy2/isLI4RPK7KrJPHRIRwVKUVL6g38Cq51fP8SCUsHTi+FJVGQmiV6z5EN5SgaDJ8eIpTGZaEeqoWyfDbCF1dm0bfRzzTKiMITv96fab/WHQ6J4k1OVSeNUbrBOrdMOjardhNsk+RWPI5P/O+81uYJhfPY+27h0zscUYbzphOVFgmGwUoBadCrXwxZFqqTHerPy8DL5Zbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KT8SfBO1lNLXtvyHMU+bwjfxV8aOg19dpuFVOPMOSg=;
 b=4Dpz/SVyTkLeW0lYZTZ0LUP9H1ttd5WFugRmLGgXgs6DTt+Xi+T35mf3CsEUe7n8d6QcaIwVcQpo9MET06mj4cW8FKaDRWJ6yDUCEyb5JZIA4yvqIPessNTUxoMYmxhayOXXvG11kj6bANbL3GXiFAw35ZNAywgyj7hoOrEVAt4=
Received: from MN2PR12MB4285.namprd12.prod.outlook.com (52.135.49.140) by
 MN2PR12MB3069.namprd12.prod.outlook.com (20.178.241.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Thu, 12 Dec 2019 04:05:01 +0000
Received: from MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::dc02:3d41:a510:98f6]) by MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::dc02:3d41:a510:98f6%6]) with mapi id 15.20.2538.012; Thu, 12 Dec 2019
 04:05:01 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [RESEND PATCH 4/5] Subject: drm/amdgpu: Redo XGMI reset
 synchronization.
Thread-Topic: [RESEND PATCH 4/5] Subject: drm/amdgpu: Redo XGMI reset
 synchronization.
Thread-Index: AQHVsGMPQ0hUMZkKLki0bfgBcLtYgqe13VLA
Date: Thu, 12 Dec 2019 04:05:01 +0000
Message-ID: <MN2PR12MB4285C0500B7E9363A2CF7B89F6550@MN2PR12MB4285.namprd12.prod.outlook.com>
References: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
 <1576096732-3596-4-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1576096732-3596-4-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-12T04:04:57Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=fbd6c903-7599-435d-a5b9-00008e5ea5e3;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-12-12T04:04:57Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 5c0de862-583b-41d8-91b9-000058a1ba6c
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is ) smtp.mailfrom=Le.Ma@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 75bd1e04-81aa-4e88-f182-08d77eb875dc
x-ms-traffictypediagnostic: MN2PR12MB3069:|MN2PR12MB3069:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB30693C37BB25C5FD812AF46EF6550@MN2PR12MB3069.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(189003)(13464003)(199004)(7696005)(81166006)(8936002)(6506007)(81156014)(26005)(5660300002)(71200400001)(52536014)(8676002)(53546011)(4326008)(86362001)(478600001)(450100002)(55016002)(186003)(54906003)(316002)(66446008)(2906002)(66556008)(64756008)(66946007)(76116006)(66476007)(33656002)(9686003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3069;
 H:MN2PR12MB4285.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: njkEkP/IEzCDRzqV9zRtuU6fLBM5PVjfQzIrzVO17Pd+1CVfaGk7O+aJMZu0/nEPzlzzJqCQSLU3zpxczku8yMAfpBH30buLgEhIfyYR0fU5Pxu65W9eWistkWaOR5tOUBzH4XWovNGcmmz8wXmpsDw4tJT+2lr5IFQiDOekrG0NuTi1vwX7OgYBJDFpWpJuAR/JyOCD5A9Px8QEvLKzg6GHJeD7TIau/js3vAY+hqPSv54Wvl9vLNhBt9wT8sT2kZ7e8WVifF7bslXfzQb5f5X6xLQMMfP4JOmm2Dv/64e0LASWADnfBe+6/iETB7GYXxl4WsIgRgeZ0eqioGf4UfvD04HqJqF6yNMob7ReWz26wAtIVLtaXoSIHvcsk5RuXZdqGDqcRXmPPzcYi8Z/GT75WYFg/gmczyzIGt9SUw/KxHiN/IcKb3HmO6YpknKZD+VbtviOU+8dtZUo/7wuv/uD9Wyoj1Kvc5uWB2Bqujwx38ov9VqDfe+rr7xWNfRf
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bd1e04-81aa-4e88-f182-08d77eb875dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 04:05:01.1306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NLwIEIKsIMqioJHxhRuwWFIQXvghj1hF6hgD/GdN+TZMayf18YrV8ncz1YWcz70j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3069
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1531356626=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1531356626==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4285C0500B7E9363A2CF7B89F6550MN2PR12MB4285namp_"

--_000_MN2PR12MB4285C0500B7E9363A2CF7B89F6550MN2PR12MB4285namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]






-----Original Message-----
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Sent: Thursday, December 12, 2019 4:39 AM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Ma, Le <Le.Ma@amd.com>;=
 Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Gr=
odzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Subject: [RESEND PATCH 4/5] Subject: drm/amdgpu: Redo XGMI reset synchroniz=
ation.



Use task barrier in XGMI hive to synchronize ASIC resets across devices in =
XGMI hive.



Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com<mailto:andrey.g=
rodzovsky@amd.com>>

---

drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 42 +++++++++++++++++++++++++--=
---

1 file changed, 36 insertions(+), 6 deletions(-)



diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c

index 1d19edfa..e4089a0 100644

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

@@ -67,6 +67,7 @@

#include "amdgpu_tmz.h"



 #include <linux/suspend.h>

+#include <drm/task_barrier.h>



 MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");

MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");

@@ -2663,14 +2664,43 @@ static void amdgpu_device_xgmi_reset_func(struct wo=
rk_struct *__work)  {

           struct amdgpu_device *adev =3D

                       container_of(__work, struct amdgpu_device, xgmi_rese=
t_work);

+          struct amdgpu_hive_info *hive =3D amdgpu_get_xgmi_hive(adev, 0);



-           if (amdgpu_asic_reset_method(adev) =3D=3D AMD_RESET_METHOD_BACO=
)

-                       adev->asic_reset_res =3D (adev->in_baco =3D=3D fals=
e) ?

-                                               amdgpu_device_baco_enter(ad=
ev->ddev) :

-                                               qamdgpu_device_baco_exit(ad=
ev->ddev);

-           else

-                       adev->asic_reset_res =3D amdgpu_asic_reset(adev);

+          /*

+          * Use task barrier to synchronize all xgmi reset works across th=
e

+          * hive.

+          * task_barrier_enter and task_barrier_exit will block untill all=
 the

+          * threads running the xgmi reset works reach those points. I ass=
ume

+          * guarantee of progress here for all the threads as the workqueu=
e code

+          * creates new worker threads as needed by amount of work items i=
n queue

+          * (see worker_thread) and also each thread sleeps in the barrir =
and by

+          * this yielding the CPU for other work threads to make progress.

+          */

[Le]: This comments can be adjusted since we switch to system_unbound_wq in=
 patch #5.

+          if (amdgpu_asic_reset_method(adev) =3D=3D AMD_RESET_METHOD_BACO)=
 {

+

+                      if (hive)

+                                  task_barrier_enter(&hive->tb);

[Le]: The multiple hive condition can be checked only once and moved to the=
 location right after the assignment.

+

+                      adev->asic_reset_res =3D amdgpu_device_baco_enter(ad=
ev->ddev);

+

+                      if (adev->asic_reset_res)

+                                  goto fail;

+

+                      if (hive)

+                                  task_barrier_exit(&hive->tb);

[Le]: Same as above.

+

+                      adev->asic_reset_res =3D amdgpu_device_baco_exit(ade=
v->ddev);

+

+                      if (adev->asic_reset_res)

+                                  goto fail;

+          } else {

+                      if (hive)

+                                  task_barrier_full(&hive->tb);

[Le]: Same as above.



With above addressed, Reviewed-by: Le Ma <Le.Ma@amd.com<mailto:Le.Ma@amd.co=
m>>



Regards,

Ma Le

+

+                      adev->asic_reset_res =3D  amdgpu_asic_reset(adev);

+          }



+fail:

           if (adev->asic_reset_res)

                       DRM_WARN("ASIC reset failed with error, %d for drm d=
ev, %s",

                                    adev->asic_reset_res, adev->ddev->uniqu=
e);

--

2.7.4



--_000_MN2PR12MB4285C0500B7E9363A2CF7B89F6550MN2PR12MB4285namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:14.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
p.msipheadera92e061b, li.msipheadera92e061b, div.msipheadera92e061b
	{mso-style-name:msipheadera92e061b;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-compose;
	font-family:"Arial",sans-serif;
	color:#0078D7;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"msipheadera92e061b" style=3D"margin:0in;margin-bottom:.0001pt">=
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;co=
lor:#0078D7">[AMD Official Use Only - Internal Distribution Only]</span><o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Andrey Grodzovsky &lt;andrey.grodzovsky@amd.com&gt; <br>
Sent: Thursday, December 12, 2019 4:39 AM<br>
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org<br>
Cc: Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Ma, Le &lt;Le.Ma@=
amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Quan, Evan &lt;E=
van.Quan@amd.com&gt;; Grodzovsky, Andrey &lt;Andrey.Grodzovsky@amd.com&gt;<=
br>
Subject: [RESEND PATCH 4/5] Subject: drm/amdgpu: Redo XGMI reset synchroniz=
ation.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Use task barrier in XGMI hive to synchronize ASIC=
 resets across devices in XGMI hive.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Signed-off-by: Andrey Grodzovsky &lt;<a href=3D"m=
ailto:andrey.grodzovsky@amd.com"><span style=3D"color:windowtext;text-decor=
ation:none">andrey.grodzovsky@amd.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">---<o:p></o:p></p>
<p class=3D"MsoPlainText">drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 42 &=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----<o:p></o:p></p>
<p class=3D"MsoPlainText">1 file changed, 36 insertions(&#43;), 6 deletions=
(-)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_de=
vice.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<o:p></o:p></p>
<p class=3D"MsoPlainText">index 1d19edfa..e4089a0 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdg=
pu_device.c<o:p></o:p></p>
<p class=3D"MsoPlainText">@@ -67,6 &#43;67,7 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">#include &quot;amdgpu_tmz.h&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&nbsp;#include &lt;linux/suspend.h&gt;<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&#43;#include &lt;drm/task_barrier.h&gt;<o:p></o:=
p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&nbsp;MODULE_FIRMWARE(&quot;amdgpu/vega10_gpu_inf=
o.bin&quot;);<o:p></o:p></p>
<p class=3D"MsoPlainText">MODULE_FIRMWARE(&quot;amdgpu/vega12_gpu_info.bin&=
quot;);<o:p></o:p></p>
<p class=3D"MsoPlainText">@@ -2663,14 &#43;2664,43 @@ static void amdgpu_de=
vice_xgmi_reset_func(struct work_struct *__work)&nbsp; {<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; struct amdgpu_device *adev =3D<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; container_of(__work, struct amdgpu_device, xgmi_reset_work);<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct amdgpu_hive_info *hive =3D amdgpu_get_xgmi_hive(adev, 0);=
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; if (amdgpu_asic_reset_method(adev) =3D=3D AMD_RESET_METHOD_BAC=
O)<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; adev-&gt;asic_reset_res =3D (adev-&gt;in_baco =3D=3D false) ?<o:p=
></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; amdgpu_device_baco_enter(adev-&gt;ddev) :<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; qamdgpu_device_baco_exit(adev-&gt;ddev);<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; else<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; adev-&gt;asic_reset_res =3D amdgpu_asic_reset(adev);<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /*<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * Use task barrier to synchronize all xgmi reset works across th=
e<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * hive.<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * task_barrier_enter and task_barrier_exit will block untill all=
 the<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * threads running the xgmi reset works reach those points. I ass=
ume<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * guarantee of progress here for all the threads as the workqueu=
e code<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * creates new worker threads as needed by amount of work items i=
n queue<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * (see worker_thread) and also each thread sleeps in the barrir =
and by<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * this yielding the CPU for other work threads to make progress.=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; */<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">[Le]: This comments=
 can be adjusted since we switch to system_unbound_wq in patch #5.<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (amdgpu_asic_reset_method(adev) =3D=3D AMD_RESET_METHOD_BACO)=
 {<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (hive)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; task_barrier_enter(&amp;hive-&gt;tb);<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">[Le]: The multiple =
hive condition can be checked only once and moved to the location right aft=
er the assignment.<o:p></o:p></span></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; adev-&gt;asic_reset_res =3D amdgpu_device_baco_enter(adev-&gt;ddev)=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (adev-&gt;asic_reset_res)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; goto fail;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (hive)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; task_barrier_exit(&amp;hive-&gt;tb);<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">[Le]: Same as above=
.<o:p></o:p></span></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; adev-&gt;asic_reset_res =3D amdgpu_device_baco_exit(adev-&gt;ddev);=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (adev-&gt;asic_reset_res)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; goto fail;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else {<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (hive)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; task_barrier_full(&amp;hive-&gt;tb);<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">[Le]: Same as above=
.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">With above addresse=
d, Reviewed-by: Le Ma &lt;<a href=3D"mailto:Le.Ma@amd.com"><span style=3D"c=
olor:#033160">Le.Ma@amd.com</span></a>&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">Regards,<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">Ma Le<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; adev-&gt;asic_reset_res =3D&nbsp; amdgpu_asic_reset(adev);<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&#43;fail:<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; if (adev-&gt;asic_reset_res)<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; DRM_WARN(&quot;ASIC reset failed with error, %d for drm dev, %s&qu=
ot;,<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;adev-&gt;asic_reset_res, adev-&gt;ddev-&gt;unique);<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">--<o:p></o:p></p>
<p class=3D"MsoPlainText">2.7.4<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MN2PR12MB4285C0500B7E9363A2CF7B89F6550MN2PR12MB4285namp_--

--===============1531356626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1531356626==--
