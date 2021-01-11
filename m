Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF72F1A38
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 16:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464816E107;
	Mon, 11 Jan 2021 15:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8FD6E104;
 Mon, 11 Jan 2021 15:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd6l3ClMynfBu5LpsTGgarwaOJj6cC+AL9uPPK7nO/AV+32BStIZt5jW4ZSuh1PIbLHXACXzAf7aLZQpcRu7KvXXRj3DfoRo1AVK/0eG/NLxA2v2nuaG0q1VaroHI/ZyCxKuCKsaGj167fIe2x+JO5Z219uV90tscYNTUZqZQ9oNYEuXta55+fJE9JYeY5DpDX+gPin6W/h2crcrpTDMhXT+Nx5PScqQ78JkKvhXaVO0qVIyCB4hZ3lChP3iN/1+r1agZxphrLRXZvWL82m3vlUH8FSN3rxydFcrAHzSnayjCz8OZo6e55Yj+Wldmsy/taVy3M8DaTok2Z+fP3ou7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf7ndCX71yvmobf6Hl3XCDs9Zw1GQBOkPt2IuAg/JhY=;
 b=nyUZXwcDq0/Yn057WXjsUavVw+3GNNyfyzqUT6EKz6gyqWZ2MMv31F9xH2xeQ5RAXK2J+bn7E0OkOob8IIEkn1E7H5rwcXKzzRbSMRzRGX+2ZaZDi+t+DFmNmsG2cFITGLuidbn3HdbI3UMURcKM8/IwQagmmcxn8cdiQlCrU2K2AEffDHmSm4vv+DSDMCncjsx0/+UMPad+tujRYu98xSYo+ClxcYHJ054bMQ/W1PvnZpkSKko+5t7TUZE7qAocltJdWoSvNT24YmdDwx8pwKuBuzla9vBfaymMgAlSd+MeUWifcvv0HqONwmNehiRq/TEbAlIvs++/CAmgESHX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf7ndCX71yvmobf6Hl3XCDs9Zw1GQBOkPt2IuAg/JhY=;
 b=N+lCKGdj23Qp2c2cmJe690LJCsshd9AGZk/3j5A6mDeASTPPy78myoOWiSLhTg+nSciqHoV4eqkf+ny9bV/KRAtBZ6r9w55X3eUDg1N4bswoJUF0QdDWcOpOP+wCu1bGnApk2i4o8gqwXgo1KF+Zu2ttKfaTBDzg3kxMiXXbmrQ=
Received: from MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21)
 by MWHPR1201MB0062.namprd12.prod.outlook.com (2603:10b6:301:54::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 15:54:39 +0000
Received: from MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::858e:d929:4fab:5ac3]) by MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::858e:d929:4fab:5ac3%9]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 15:54:39 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH -next] drm/amd/display: tweak the kerneldoc for
 active_vblank_irq_count
Thread-Topic: [PATCH -next] drm/amd/display: tweak the kerneldoc for
 active_vblank_irq_count
Thread-Index: AQHW5/ZPMz7oaDCkAEGZfcUZuxkncqoik8N0
Date: Mon, 11 Jan 2021 15:54:39 +0000
Message-ID: <MW3PR12MB45540B2E1C07A2A666D4A938F9AB0@MW3PR12MB4554.namprd12.prod.outlook.com>
References: <20210111084640.28500-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210111084640.28500-1-lukas.bulwahn@gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-01-11T15:54:39.235Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.54.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 85fb8d02-480c-449e-4133-08d8b6493423
x-ms-traffictypediagnostic: MWHPR1201MB0062:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1201MB006291E003B45EB7997E13B0F9AB0@MWHPR1201MB0062.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vePWLlHDpKaYhKXhYg9LxF/Zq+enYwgmEgt6VZbZI5+vPMAvVxxNQqaq5gzuzzB2eA/lgFu3zzeISP0pqBd3bDpqZO36gA6dxKVviVlWh31HR2KXmFL/xPWiXGustZifuENThUUP7+lCB+bSV7AXm+3Kpm7JG3X7ocmO3DqdQQKkVsKD9iAMy4VXKj9g7+evqdXD1egOs7caK+AXEReQr+tgGJo4xqbOM3ZN1eL5noSYofZum1caDgu5OAVYZCoP4mPc1pRhxvwtb2jSsA9LNvLpR98ziy8icgpipTsbjpV2nokhHj7R0Runke7q3iWDsoD1ctOYXskOSAdV+ND9Jjzo44bcF1pnktewqKCsqxvJjRAtmqgzPNiltqy2GHFKvy+0gLFobb7V0mFG+FPR1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4554.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(8936002)(9686003)(2906002)(55016002)(66556008)(7696005)(186003)(26005)(316002)(52536014)(91956017)(76116006)(66476007)(33656002)(66446008)(66946007)(64756008)(71200400001)(6506007)(5660300002)(19627405001)(53546011)(110136005)(478600001)(86362001)(8676002)(83380400001)(4326008)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?jmvh2WMFRQ3t6PTf1Jg95Thp4HDm8aDCg4p2Uw5oUi+Xo39kj+n1qEmBHf6x?=
 =?us-ascii?Q?u+P+pBMEESRxiqKI4oNM9aLIhYSgV6NXsFzsfZet3pYSzppLBbo+ZcH31Bcd?=
 =?us-ascii?Q?SnIhxoV9nWAmAdTxF5vyj58h9Jgcd5SCHztkkBKTbudOLHub+6SggRkBWiwi?=
 =?us-ascii?Q?i0/MCW0KewTuBpVlvHDwfD+2Fa1Ko+zfOki5tQan+Q+1O88Nj5hMxorepNI1?=
 =?us-ascii?Q?I3asZKPp6+SybxP9Cb9+UIVCkvJxp8PUr4Kbu3r55O/AONF55117m9yHmaQv?=
 =?us-ascii?Q?ThM8+/Xh9ZCbvgNgEtTkldBJ3GurzZDaMi5UsU/Ox8bzW1tAGWXhgbRP+Uv4?=
 =?us-ascii?Q?wbYgz1dG1ksrpPNBZbmnmK1fXQ403hvr1djhZy9zOZERblLaWXFitaz9T8jg?=
 =?us-ascii?Q?y5AW4umz0cziXfym52ipEeB95cyM8udMhhKenFv9P//67DMIikyG7+9+W5or?=
 =?us-ascii?Q?NpnR/eGyKu2Q+PFCgHAuaTtITZT2UlPlZ1nEvUhO8d9k4T0KM2flobVDCmQD?=
 =?us-ascii?Q?ZTmtH6d+4PbBO6KuhzhAJ5RrVormMGsD7AxNPtmJk25t8ABQa8jP5s/C8nvL?=
 =?us-ascii?Q?WflOYx0HwNZc52d24lJUXvihB0jzQPEa0E1kBoLG086pmdkIRqdup0fN99Wy?=
 =?us-ascii?Q?o7V3v8CgUEYvGDNWFrv+SH+H6Kycs0vddGh2G0Nc0HiH3THJbelCQat4+3Se?=
 =?us-ascii?Q?R/K9AdjM1bTDjYYqHfqqbTppv4RK3TzL2pKt+FnO+IGmsLdmjGA8qrWBib9O?=
 =?us-ascii?Q?j8rHjhy7YHZatiE1txUsAZhAK4nD1Isp9TsOD5WER7cG2/3L7V6N0p/lziGR?=
 =?us-ascii?Q?wY/fy4ayQRJjsuaep3lszh2iS0RCoWLHNuSuHuoN9xUZ45R8DgxW7Nu2r48f?=
 =?us-ascii?Q?YzQBgMpbugeJheuFleSF4EtJ9/mFpgTzlnXM83ZGZsDWA9PyOtCvrCu2L0MG?=
 =?us-ascii?Q?ope+KXXM3/AogJ1Otvu5O+cfnAGC1fwceX3zp6Psm1w=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4554.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fb8d02-480c-449e-4133-08d8b6493423
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 15:54:39.4627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TvJ2F7fcvB9olv0tR4n+1Tr9JbI52q++KMHKVWTHIGFkhJVgn4B7lUdq/o58+AAL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0062
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1196092215=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1196092215==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_MW3PR12MB45540B2E1C07A2A666D4A938F9AB0MW3PR12MB4554namp_"

--_000_MW3PR12MB45540B2E1C07A2A666D4A938F9AB0MW3PR12MB4554namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Thanks,

Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
________________________________
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Sent: January 11, 2021 3:46 AM
To: Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Kazlauskas, Nicholas <N=
icholas.Kazlauskas@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>=
; Koenig, Christian <Christian.Koenig@amd.com>; amd-gfx@lists.freedesktop.o=
rg <amd-gfx@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linu=
x-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-doc@vger.ker=
nel.org <linux-doc@vger.kernel.org>; kernel-janitors@vger.kernel.org <kerne=
l-janitors@vger.kernel.org>; Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH -next] drm/amd/display: tweak the kerneldoc for active_vbla=
nk_irq_count

Commit 71338cb4a7c2 ("drm/amd/display: enable idle optimizations for linux
(MALL stutter)") adds active_vblank_irq_count to amdgpu_display_manager
in ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h.

The kerneldoc is incorrectly formatted, and make htmldocs warns:

  ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:
    340: warning: Incorrect use of kernel-doc format:          * @active_vb=
lank_irq_count
    379: warning: Function parameter or member 'active_vblank_irq_count' no=
t described in 'amdgpu_display_manager'

Tweak the kerneldoc for active_vblank_irq_count.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies on amdgpu's -next and next-20210111

Bhawanpreet, Nick, please review and ack.

Alex, Christian, please pick on top of the commit above.

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index f084e2fc9569..5ee1b766884e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -337,7 +337,7 @@ struct amdgpu_display_manager {
         const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;

         /**
-        * @active_vblank_irq_count
+        * @active_vblank_irq_count:
          *
          * number of currently active vblank irqs
          */
--
2.17.1


--_000_MW3PR12MB45540B2E1C07A2A666D4A938F9AB0MW3PR12MB4554namp_
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
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span data-markjs=3D"true" class=3D"markb327xo29l" data-ogac=3D"" data-ogab=
=3D"" data-ogsc=3D"" data-ogsb=3D"">Thanks,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span data-markjs=3D"true" class=3D"markb327xo29l" data-ogac=3D"" data-ogab=
=3D"" data-ogsc=3D"" data-ogsb=3D""><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span data-markjs=3D"true" class=3D"markb327xo29l" data-ogac=3D"" data-ogab=
=3D"" data-ogsc=3D"" data-ogsb=3D"">Reviewed-by</span>:
<span data-markjs=3D"true" class=3D"markbdktt4kvc" data-ogac=3D"" data-ogab=
=3D"" data-ogsc=3D"" data-ogsb=3D"">
Bhawan</span>preet Lakha &lt;<span data-markjs=3D"true" class=3D"markbdktt4=
kvc" data-ogac=3D"" data-ogab=3D"" data-ogsc=3D"" data-ogsb=3D"">Bhawan</sp=
an>preet.Lakha@amd.com&gt;&nbsp;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Lukas Bulwahn &lt;luk=
as.bulwahn@gmail.com&gt;<br>
<b>Sent:</b> January 11, 2021 3:46 AM<br>
<b>To:</b> Lakha, Bhawanpreet &lt;Bhawanpreet.Lakha@amd.com&gt;; Kazlauskas=
, Nicholas &lt;Nicholas.Kazlauskas@amd.com&gt;; Deucher, Alexander &lt;Alex=
ander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&g=
t;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;;=
 linux-doc@vger.kernel.org &lt;linux-doc@vger.kernel.org&gt;; kernel-janito=
rs@vger.kernel.org &lt;kernel-janitors@vger.kernel.org&gt;;
 Lukas Bulwahn &lt;lukas.bulwahn@gmail.com&gt;<br>
<b>Subject:</b> [PATCH -next] drm/amd/display: tweak the kerneldoc for acti=
ve_vblank_irq_count</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Commit 71338cb4a7c2 (&quot;drm/amd/display: enable=
 idle optimizations for linux<br>
(MALL stutter)&quot;) adds active_vblank_irq_count to amdgpu_display_manage=
r<br>
in ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h.<br>
<br>
The kerneldoc is incorrectly formatted, and make htmldocs warns:<br>
<br>
&nbsp; ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:<br>
&nbsp;&nbsp;&nbsp; 340: warning: Incorrect use of kernel-doc format:&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @active_vblank_irq_count<=
br>
&nbsp;&nbsp;&nbsp; 379: warning: Function parameter or member 'active_vblan=
k_irq_count' not described in 'amdgpu_display_manager'<br>
<br>
Tweak the kerneldoc for active_vblank_irq_count.<br>
<br>
Signed-off-by: Lukas Bulwahn &lt;lukas.bulwahn@gmail.com&gt;<br>
---<br>
applies on amdgpu's -next and next-20210111<br>
<br>
Bhawanpreet, Nick, please review and ack.<br>
<br>
Alex, Christian, please pick on top of the commit above.<br>
<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.h<br>
index f084e2fc9569..5ee1b766884e 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h<br>
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h<br>
@@ -337,7 +337,7 @@ struct amdgpu_display_manager {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct gpu_info_soc_=
bounding_box_v1_0 *soc_bounding_box;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @active_vblank_irq_count<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @active_vblank_irq_count:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * number of currentl=
y active vblank irqs<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MW3PR12MB45540B2E1C07A2A666D4A938F9AB0MW3PR12MB4554namp_--

--===============1196092215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1196092215==--
