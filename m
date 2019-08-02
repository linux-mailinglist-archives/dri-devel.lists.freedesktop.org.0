Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17797E797
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 03:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241A288E41;
	Fri,  2 Aug 2019 01:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720065.outbound.protection.outlook.com [40.107.72.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93F26E85A;
 Fri,  2 Aug 2019 01:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5Qd8Y3b457Pj6VJ6AWn8zrM8AitY4boGuruww4drdnjOYBprDZxrOMk8+cyAq7WDjqQUQY50N2sXUnk74J+8m1RfCZXkfPvbJNaImK6WcSE7Q8bfY6qMUGJJPKG2Wd7tSlVBM5qDwpJiGvNR66fHNCeqe/CIUXU0Rx7Z4IkIKSAtMIFqD1RVnhnJk/7/4rtmhd32Knv3TEJiBIKHLY0XKkCxzT0/J/NJ0wZnvhXXbtAHov6sEcmnq2iJB64XaxB4kVd9HTRKaI/ijpgn/1H6mdc79BluEV7+N5BYjrHbwwCJ6x7hyESTQCo7YHrwx4UJAphWod2HehoguaWnuSMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO0G8q/R/OMwGpF4QR6NnEIn4xxhhHEHlOmm3Ax1OSE=;
 b=VctamkOgQxH4VTMTgQ+xL4xvHYsEaQTHMDWT6BN3DRGiVsqebCKMMb21HUkvpJDrXQAqM4JUl4RJd3ziJ2de6vBdMJ5oTfZOR/xP0KQHchddc9JE7Pmo15yq4JmH3Tlm+yN6IKICXpbruGqwgWuj+3SxHw9F3MFm2oTWZcHmxnjjHgbEE8ldx6xb68z+Fn0ajH0nvpNiJaa+353I8LwkBSH1cYgrcW7aiZh5Cnw5MG28MxD+s5uh513aA6r5Yu0iUSzV2C2fCzPl2DaGn8mgtJZTw1UxGAfwLTH9qsKqSsL9NjYjpowIpx0yiDpZvjOxWnTVbj2NoaWfxLZz8XqXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3283.namprd12.prod.outlook.com (20.179.67.152) by
 BN8PR12MB2913.namprd12.prod.outlook.com (20.179.65.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Fri, 2 Aug 2019 01:44:19 +0000
Received: from BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236]) by BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 01:44:19 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Colin King <colin.king@canonical.com>, Rex Zhu <rex.zhu@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH][drm-next] drm/amd/powerplay: fix a few spelling mistakes
Thread-Topic: [PATCH][drm-next] drm/amd/powerplay: fix a few spelling mistakes
Thread-Index: AQHVSESp1ydiQfdGA0ufCF8q93sBrqbnFpSt
Date: Fri, 2 Aug 2019 01:44:19 +0000
Message-ID: <BN8PR12MB32832A7472EA99209E938F53A2D90@BN8PR12MB3283.namprd12.prod.outlook.com>
References: <20190801083941.4230-1-colin.king@canonical.com>
In-Reply-To: <20190801083941.4230-1-colin.king@canonical.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08e09948-b1e5-4703-74cb-08d716eaefc4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2913; 
x-ms-traffictypediagnostic: BN8PR12MB2913:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB29139C4A22B076BE094E8009A2D90@BN8PR12MB2913.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:332;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(71190400001)(71200400001)(53936002)(2201001)(236005)(6306002)(54896002)(9686003)(6436002)(55016002)(11346002)(6116002)(3846002)(476003)(446003)(6246003)(229853002)(86362001)(2906002)(486006)(74316002)(105004)(25786009)(8936002)(186003)(81156014)(52536014)(478600001)(102836004)(53546011)(81166006)(7736002)(7696005)(14454004)(76176011)(19627405001)(4326008)(26005)(606006)(33656002)(6506007)(76116006)(91956017)(2501003)(966005)(66946007)(316002)(66446008)(99286004)(54906003)(14444005)(5660300002)(68736007)(110136005)(256004)(66066001)(8676002)(66476007)(64756008)(66556008)(921003)(1121003)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2913;
 H:BN8PR12MB3283.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VrM5LaFnafeooIJi/BVK7K79cLE4oVgmujOvJvmkecaqjtM3BjPLcx9XFhUgBD72f0tu1US1cwRJnXBzxSAJFBxIhvF3C9PnEpkT8u7P5JHDWTb0zeFtBtE7xBbA9c17+6H4aDFx2FGunsJ0QxZ1pdgFHLMlGFMs/+SIVKoHTQfizcixqsfV7GyMvyCCGANDDVOVwlPy5APBFfYQvrtp4XevIsdiYnR+Xq9vHi/6tLrzzcjWfcqA3g16CEXZfq3tEWC1UMAD47ysniqxYy2NHR2tNfkFY/tVrZ0WHEyvrFIpNcHYZ37RFG0MEywOqi25wWpHe4EngtEE5EhhWe+IziB3PIl3d0WyQcGIbmHRXPof7XEaJoMZUbmaGARTpgsdjw57ev6xmXAZPoqlZ0qlSp+1UCxpumQ/6a9/plLqdrM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e09948-b1e5-4703-74cb-08d716eaefc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 01:44:19.5933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2913
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO0G8q/R/OMwGpF4QR6NnEIn4xxhhHEHlOmm3Ax1OSE=;
 b=XwxAMfuETWr4YvI7/JPt2CIZwFwgUE1gtt400yCjbeHZ/9/uZ7tbWWK3nlaTmfbZQ6FiSjTmuSp4sswoG2IkecJyVb9o/qXH6quySUV1WWx2lb3ExveDrLgCHGgtyuEOvPMtqSN6xhtH5uVmWm6RmqclUV5lap7AegCMDlqNk50=
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1097623463=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1097623463==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB32832A7472EA99209E938F53A2D90BN8PR12MB3283namp_"

--_000_BN8PR12MB32832A7472EA99209E938F53A2D90BN8PR12MB3283namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Colin Ki=
ng <colin.king@canonical.com>
Sent: Thursday, August 1, 2019 4:39 PM
To: Rex Zhu <rex.zhu@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Deucher, Ale=
xander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd=
.com>; Zhou, David(ChunMing) <David1.Zhou@amd.com>; David Airlie <airlied@l=
inux.ie>; Daniel Vetter <daniel@ffwll.ch>; amd-gfx@lists.freedesktop.org <a=
md-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@l=
ists.freedesktop.org>
Cc: kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>; linu=
x-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
Subject: [PATCH][drm-next] drm/amd/powerplay: fix a few spelling mistakes

From: Colin Ian King <colin.king@canonical.com>

There are a few spelling mistakes "unknow" -> "unknown" and
"enabeld" -> "enabled". Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 13b2c8a60232..d029a99e600e 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -39,7 +39,7 @@ static const char* __smu_message_names[] =3D {
 const char *smu_get_message_name(struct smu_context *smu, enum smu_message=
_type type)
 {
         if (type < 0 || type > SMU_MSG_MAX_COUNT)
-               return "unknow smu message";
+               return "unknown smu message";
         return __smu_message_names[type];
 }

@@ -52,7 +52,7 @@ static const char* __smu_feature_names[] =3D {
 const char *smu_get_feature_name(struct smu_context *smu, enum smu_feature=
_mask feature)
 {
         if (feature < 0 || feature > SMU_FEATURE_COUNT)
-               return "unknow smu feature";
+               return "unknown smu feature";
         return __smu_feature_names[feature];
 }

@@ -79,7 +79,7 @@ size_t smu_sys_get_pp_feature_mask(struct smu_context *sm=
u, char *buf)
                                count++,
                                smu_get_feature_name(smu, i),
                                feature_index,
-                              !!smu_feature_is_enabled(smu, i) ? "enabeld"=
 : "disabled");
+                              !!smu_feature_is_enabled(smu, i) ? "enabled"=
 : "disabled");
         }

[kevin]:
thanks correct it.
Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

BR
Kevin

 failed:
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN8PR12MB32832A7472EA99209E938F53A2D90BN8PR12MB3283namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Colin King &lt;colin.king@can=
onical.com&gt;<br>
<b>Sent:</b> Thursday, August 1, 2019 4:39 PM<br>
<b>To:</b> Rex Zhu &lt;rex.zhu@amd.com&gt;; Quan, Evan &lt;Evan.Quan@amd.co=
m&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christ=
ian &lt;Christian.Koenig@amd.com&gt;; Zhou, David(ChunMing) &lt;David1.Zhou=
@amd.com&gt;; David Airlie &lt;airlied@linux.ie&gt;; Daniel Vetter &lt;dani=
el@ffwll.ch&gt;;
 amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-d=
evel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> kernel-janitors@vger.kernel.org &lt;kernel-janitors@vger.kernel.=
org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;<=
br>
<b>Subject:</b> [PATCH][drm-next] drm/amd/powerplay: fix a few spelling mis=
takes</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">From: Colin Ian King &lt;colin.king@canonical.com&=
gt;<br>
<br>
There are a few spelling mistakes &quot;unknow&quot; -&gt; &quot;unknown&qu=
ot; and<br>
&quot;enabeld&quot; -&gt; &quot;enabled&quot;. Fix these.<br>
<br>
Signed-off-by: Colin Ian King &lt;colin.king@canonical.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 6 &#43;&#43;&#43;---<br>
&nbsp;1 file changed, 3 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 13b2c8a60232..d029a99e600e 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -39,7 &#43;39,7 @@ static const char* __smu_message_names[] =3D {<br>
&nbsp;const char *smu_get_message_name(struct smu_context *smu, enum smu_me=
ssage_type type)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (type &lt; 0 || type &g=
t; SMU_MSG_MAX_COUNT)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return &quot;unknow smu message&quot;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return &quot;unknown smu message&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return __smu_message_names=
[type];<br>
&nbsp;}<br>
&nbsp;<br>
@@ -52,7 &#43;52,7 @@ static const char* __smu_feature_names[] =3D {<br>
&nbsp;const char *smu_get_feature_name(struct smu_context *smu, enum smu_fe=
ature_mask feature)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (feature &lt; 0 || feat=
ure &gt; SMU_FEATURE_COUNT)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return &quot;unknow smu feature&quot;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return &quot;unknown smu feature&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return __smu_feature_names=
[feature];<br>
&nbsp;}<br>
&nbsp;<br>
@@ -79,7 &#43;79,7 @@ size_t smu_sys_get_pp_feature_mask(struct smu_context=
 *smu, char *buf)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count&#43;&#43;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_get_feature_name(smu, i),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature_index,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; !!smu_feature_is_enabled(smu, i) ? &quot;enabeld&=
quot; : &quot;disabled&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !!smu_feature_is_enabled(smu, i) ? &quot;enab=
led&quot; : &quot;disabled&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;</div>
<div class=3D"PlainText">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: rgb(0, 0, 0)">
<span style=3D"font-size: 10pt;">[kevin]:</span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: rgb(0, 0, 0)">
<span style=3D"font-size: 10pt;">thanks correct it.</span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: rgb(0, 0, 0)">
<span style=3D"font-size: 10pt;">Reviewed-by: Kevin Wang &lt;kevin1.wang@am=
d.com&gt;</span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: rgb(0, 0, 0)">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: rgb(0, 0, 0)">
<span style=3D"font-size: 10pt;">BR</span><br>
<span style=3D"font-size: 10pt;">Kevin</span></div>
<br>
&nbsp;failed:<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN8PR12MB32832A7472EA99209E938F53A2D90BN8PR12MB3283namp_--

--===============1097623463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1097623463==--
