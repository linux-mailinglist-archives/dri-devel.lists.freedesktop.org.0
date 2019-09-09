Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E49B6AD3E3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714AF898AA;
	Mon,  9 Sep 2019 07:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710074.outbound.protection.outlook.com [40.107.71.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9A8898AF;
 Mon,  9 Sep 2019 07:30:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/DqIBKgcF2MiHHEQegqUDC7XhVoxP7JIRJLBR0hJqlrUKb+hRzZ/2YzH4z5rQ1NwrRdMvG8ZmDfFZ9XkAkgI761K+baOsOY6xEE6gtPRWWmO7GKCdGG+tEJoHj+LaeFqOprzP0264WCUTgYP9dL4ZOElpjVwzapOVfiI9EtKCk6egjJPQ3CrfVeMaJCcy+X6g0w2/+G7SCdGWwzSJSlSM8ooKRPtvV0JlUkWRQbYLRbtNgqBdHb0zD1eX1FarGCmko3Cwa6VRDfvoFZ9SB2hGiDXwJsQ9Q2xddCGclEVI53zKkzMFrAAroBOGzcCUfG414KSdupUHXLHwmxDk+i0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx1tZRdqCgrNwkuJbT9hOLq0UyCdJ286HYreUKwQ+xE=;
 b=Q57Ky/Dv0C+i5ajgHiU2qsLRK3XQlty5Y1oiQELM6tHAGT52KFiIUbsWWylghBeuwdi7GGWVgdYAhrnaPSUfHKgmVzkY9B4ZLKC1vr/E1+8qnXuSh83pFGaIEmq1hw9evYYWAMnCYKQtkre4HjGthXAGyab9OQd37q3cvJXh5vp/sf5OBf1RZTgc9iRrlVkQZDmc3riqgnYHuLXtkV9d65LkFe6PyQ3TQyLXGWUkt6DmQtSWVi9jntmP2Krl4GkDYzjOQ7JzjPSzijiHQBEBaZhhLi0tAM0vTotbB6UfcyBaScttc5nM0MbBUWtq5NCUwO/WbraRNAeNyMQkOiQWLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2944.namprd12.prod.outlook.com (20.179.81.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 07:30:46 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 07:30:46 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Austin Kim <austindh.kim@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amd/powerplay: Remove unnecessary comparison statement
Thread-Topic: [PATCH] drm/amd/powerplay: Remove unnecessary comparison
 statement
Thread-Index: AQHVZt+4pnUa4TLLckGCkUOUTo58nqci8x8v
Date: Mon, 9 Sep 2019 07:30:46 +0000
Message-ID: <MN2PR12MB3296741B0679058F6021D26DA2B70@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190909043148.GA112744@LGEARND20B15>
In-Reply-To: <20190909043148.GA112744@LGEARND20B15>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72207c1d-bcfd-4542-1334-08d734f7a14e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2944; 
x-ms-traffictypediagnostic: MN2PR12MB2944:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2944C2A78B0AAADD0DEFF107A2B70@MN2PR12MB2944.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:199;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(199004)(189003)(64756008)(14454004)(256004)(14444005)(110136005)(54906003)(316002)(66556008)(66476007)(6436002)(91956017)(5660300002)(66446008)(76116006)(71200400001)(606006)(2501003)(71190400001)(66946007)(4326008)(446003)(11346002)(86362001)(486006)(2201001)(476003)(7696005)(229853002)(8676002)(81156014)(55016002)(6306002)(6246003)(9686003)(25786009)(53936002)(66066001)(53546011)(6506007)(102836004)(54896002)(186003)(105004)(33656002)(99286004)(76176011)(236005)(6116002)(52536014)(19627405001)(3846002)(74316002)(478600001)(7736002)(26005)(2906002)(81166006)(966005)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2944;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RK0jMtF+x6twvWT3vQTRFcqLxzTeL6vjKcG7ZPYeCPcjdiRTTlZ7x7ap25LFjj7LgfGAINoVYFmihQJ4nLQl5BcDZTc1m3BJ4d66NeZ8hipkFOdB8WtqZXZlvprOTfqQGx3tY8IjAOxbXTpPkpWuUcnQyVlAzPy5Jk513nmZfbnRCop82SHAIY+4srG6W53Yhh8iY4KutvU3rEmYDbLE3OY4wuVXIclIqI+DTMhM3IjBQfL/nj/Jd5FBwGOjAUbeBoL+fQ+YANl1Cb/46V3ZmD6czJwcZ6fAXgA+auf0H3yBS3Ux7ZD4dTS5HWvYcMhq4FjdIqWImfID/bOnihtOfIIwv42JQm4Wdc1l2Su+cIm9clAo/q1EwEEyc6ynzdC1VNu2Zue9wxMI5vhGdKSlYcqV/rupKgxpon76at9QYck=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72207c1d-bcfd-4542-1334-08d734f7a14e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 07:30:46.2440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aJ3n8Wx5Ifed+tPunAfrcX5AoUTaOQXhuNyJ/DI+WIvOo0x9+FGLEzsqkivtUC2Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2944
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx1tZRdqCgrNwkuJbT9hOLq0UyCdJ286HYreUKwQ+xE=;
 b=BXMP+JpxsVKF8RApUrZck4Sr4Y1dkKs8QCGBCn7Lsr/eIJEI2Pn8O8WYoU8wjbJhea4YioeEKZNlbo0IS0Paah4U98DmHypV7b4VTKDboBC5yFbr2cdNWAgKK7rqKjgkxxxy+lNHPNbZq2LDAshxUqILffD/5yt/zFRbqRr2efc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1339884331=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1339884331==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296741B0679058F6021D26DA2B70MN2PR12MB3296namp_"

--_000_MN2PR12MB3296741B0679058F6021D26DA2B70MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Austin K=
im <austindh.kim@gmail.com>
Sent: Monday, September 9, 2019 12:31 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; airlied@linux.ie <airli=
ed@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>
Cc: Zhou, David(ChunMing) <David1.Zhou@amd.com>; amd-gfx@lists.freedesktop.=
org <amd-gfx@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-ke=
rnel@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.fre=
edesktop.org>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: [PATCH] drm/amd/powerplay: Remove unnecessary comparison statement

size contain non-negative value since it is declared as uint32_t.
So below statement is always false.
        if (size < 0)

Remove unnecessary comparison.

Signed-off-by: Austin Kim <austindh.kim@gmail.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index 12c0e46..3c7c68e 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1134,9 +1134,6 @@ static int navi10_set_power_profile_mode(struct smu_c=
ontext *smu, long *input, u
         }

         if (smu->power_profile_mode =3D=3D PP_SMC_POWER_PROFILE_CUSTOM) {
-               if (size < 0)
-                       return -EINVAL;
-
                 ret =3D smu_update_table(smu,
                                        SMU_TABLE_ACTIVITY_MONITOR_COEFF, W=
ORKLOAD_PPLIB_CUSTOM_BIT,
                                        (void *)(&activity_monitor), false)=
;
--
2.6.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296741B0679058F6021D26DA2B70MN2PR12MB3296namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Austin Kim &lt;austindh.kim@g=
mail.com&gt;<br>
<b>Sent:</b> Monday, September 9, 2019 12:31 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; airlied@li=
nux.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;<br=
>
<b>Cc:</b> Zhou, David(ChunMing) &lt;David1.Zhou@amd.com&gt;; amd-gfx@lists=
.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; linux-kernel@vger.k=
ernel.org &lt;linux-kernel@vger.kernel.org&gt;; dri-devel@lists.freedesktop=
.org &lt;dri-devel@lists.freedesktop.org&gt;; Koenig, Christian
 &lt;Christian.Koenig@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: Remove unnecessary comparison st=
atement</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">size contain non-negative value since it is declar=
ed as uint32_t.<br>
So below statement is always false.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (size &lt; 0)<br>
<br>
Remove unnecessary comparison.<br>
<br>
Signed-off-by: Austin Kim &lt;austindh.kim@gmail.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 3 ---<br>
&nbsp;1 file changed, 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 12c0e46..3c7c68e 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -1134,9 &#43;1134,6 @@ static int navi10_set_power_profile_mode(struct s=
mu_context *smu, long *input, u<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu-&gt;power_profile_=
mode =3D=3D PP_SMC_POWER_PROFILE_CUSTOM) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (size &lt; 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<=
br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_update_table(smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; (void *)(&amp;activity_monitor), false);<br>
-- <br>
2.6.2<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296741B0679058F6021D26DA2B70MN2PR12MB3296namp_--

--===============1339884331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1339884331==--
