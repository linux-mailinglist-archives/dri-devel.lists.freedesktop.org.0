Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848159F85
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6336E959;
	Fri, 28 Jun 2019 15:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740041.outbound.protection.outlook.com [40.107.74.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E666E959;
 Fri, 28 Jun 2019 15:49:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=FCYUGz/B4N1irV+YEn6LNFeOUfN3uYviIKL3oyOst7CiUbL7UoOstCt7uuY8wi7oe+Tv6TQQ1cDj1811yB4ooRC8caiikmHIxKepIkLzmSp1hjuXO5sJlQoZTKTLfdBK9RImuwaX1y7UCL5TWO/S30w4onqmpZQaXjysUuXO+5I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAJeu/Czyb5I8vE8Fs2uIcolrzPii7zEBSkOfp2gKRo=;
 b=oR+d7ZWOON7c2cdIx9bYlHWGtcv+5TuwxEhf7CJap3KfKmtWA1vcAop+UL9Di5SC72OCpulfUup8KYe9Yb4FJYurOaWA4zHDdGATlwZy9+6oYTYMoF25UBq1H7F4gJ0mY+oL/jKl6rRBA9+KZK5NbZwcQbm7Kib6aPkL6O7N3g8=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) by
 DM6PR12MB2780.namprd12.prod.outlook.com (20.176.118.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 15:48:59 +0000
Received: from DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25]) by DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25%2]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 15:48:59 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: Colin King <colin.king@canonical.com>, Rex Zhu <rex.zhu@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH][next] drm/amd/powerplay: remove a less than zero uint32_t
 check
Thread-Topic: [PATCH][next] drm/amd/powerplay: remove a less than zero
 uint32_t check
Thread-Index: AQHVLcgfXRULHS0I5kSf5ZMR7m8yBqaxNmzv
Date: Fri, 28 Jun 2019 15:48:59 +0000
Message-ID: <DM6PR12MB32091B2F2143517D750AF4C5FEFC0@DM6PR12MB3209.namprd12.prod.outlook.com>
References: <20190628152804.16954-1-colin.king@canonical.com>
In-Reply-To: <20190628152804.16954-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53e1e190-0511-421a-2555-08d6fbe02306
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2780; 
x-ms-traffictypediagnostic: DM6PR12MB2780:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB27801783E8D5A5802B1051AEFEFC0@DM6PR12MB2780.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:628;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(199004)(189003)(19627405001)(186003)(66556008)(55016002)(54896002)(9686003)(6246003)(486006)(606006)(86362001)(2906002)(73956011)(66946007)(25786009)(6306002)(7696005)(316002)(66446008)(64756008)(2201001)(91956017)(14454004)(476003)(33656002)(54906003)(53936002)(53546011)(72206003)(99286004)(76116006)(110136005)(66476007)(11346002)(236005)(4326008)(966005)(256004)(14444005)(446003)(6116002)(3846002)(6606003)(229853002)(2501003)(478600001)(102836004)(66066001)(5660300002)(6436002)(8936002)(6506007)(81166006)(68736007)(74316002)(52536014)(7736002)(81156014)(76176011)(71190400001)(71200400001)(26005)(8676002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2780;
 H:DM6PR12MB3209.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XONgpaR+jiCyqbQYyLMGoIXaPMIxEpDpxhTHMnWgDOJYrow2fZRaOZYHxYo5++AEQIl/YzdhopxWABv1c93NIM9EL1QOjG4KbuIWFZljUzHo+1bF8bSkDHkM/1f/G7g7Fck34lkAPs0mOrIUQ5Fm9w3GWorEcWXKgiVEz6wGrAVX2/1UcKT1bgv2slUfJHlf622z6ik9mSeKneUlGNjdYcYUFlhPv8+KvRQMIXwuudPFLHY6Pjomcw3LV7Q1pwX8XGpiH4Zhifs90vPDmw6krnECiBMvkomsO+KNVv2mBNtQGETnGgyt04Xp3aT4rJSe1Q6AddzgmDhE24P+ccoA8zR4dZwiXXKDHalqG6zPcz/oGFsHs7POZOcmrmcc1+J9CJg8mM0G+LLlPyou/lX9w4RNnkvZqViuM1fyGe8zVYU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e1e190-0511-421a-2555-08d6fbe02306
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 15:48:59.8055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2780
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAJeu/Czyb5I8vE8Fs2uIcolrzPii7zEBSkOfp2gKRo=;
 b=WMM/BXZq+b4HOpDXL17pxfJJVSusfMjtNdwaWEhcvW6cWUKhG36tsYUE/kAXw8LzFpMkKY3OGzO2NRQmq9tt9KCSapK8YEb+FRz+Pt8bupRxu7bGoBeShT9iAKvEZ1xmSDnFxBEfIYoL8C7w7wNJ5pn8GQ1sTvAi71J4NuZdyZM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Slava.Abramov@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0944244373=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0944244373==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB32091B2F2143517D750AF4C5FEFC0DM6PR12MB3209namp_"

--_000_DM6PR12MB32091B2F2143517D750AF4C5FEFC0DM6PR12MB3209namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Slava Abramov <slava.abramov@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Colin Ki=
ng <colin.king@canonical.com>
Sent: Friday, June 28, 2019 11:28:04 AM
To: Rex Zhu; Quan, Evan; Deucher, Alexander; Koenig, Christian; Zhou, David=
(ChunMing); David Airlie; Daniel Vetter; amd-gfx@lists.freedesktop.org; dri=
-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/powerplay: remove a less than zero uint32_t =
check

From: Colin Ian King <colin.king@canonical.com>

The check to see if the uint32_t variable 'size' is less than zero
is redundant as it is unsigned and can never be less than zero.
Remove this redundant check.

Addresses-Coverity: ("Unsigned compared to zero")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index ac151da..6ea48d6 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1043,9 +1043,6 @@ static int navi10_set_power_profile_mode(struct smu_c=
ontext *smu, long *input, u
         }

         if (smu->power_profile_mode =3D=3D PP_SMC_POWER_PROFILE_CUSTOM) {
-               if (size < 0)
-                       return -EINVAL;
-
                 ret =3D smu_update_table(smu,
                                        SMU_TABLE_ACTIVITY_MONITOR_COEFF | =
WORKLOAD_PPLIB_CUSTOM_BIT << 16,
                                        (void *)(&activity_monitor), false)=
;
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB32091B2F2143517D750AF4C5FEFC0DM6PR12MB3209namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;">Acked-by: Slava Abramov =
&lt;slava.abramov@amd.com&gt;</span><br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Colin King &lt;colin.king@can=
onical.com&gt;<br>
<b>Sent:</b> Friday, June 28, 2019 11:28:04 AM<br>
<b>To:</b> Rex Zhu; Quan, Evan; Deucher, Alexander; Koenig, Christian; Zhou=
, David(ChunMing); David Airlie; Daniel Vetter; amd-gfx@lists.freedesktop.o=
rg; dri-devel@lists.freedesktop.org<br>
<b>Cc:</b> kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org<br=
>
<b>Subject:</b> [PATCH][next] drm/amd/powerplay: remove a less than zero ui=
nt32_t check</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Colin Ian King &lt;colin.king@canonical.com&=
gt;<br>
<br>
The check to see if the uint32_t variable 'size' is less than zero<br>
is redundant as it is unsigned and can never be less than zero.<br>
Remove this redundant check.<br>
<br>
Addresses-Coverity: (&quot;Unsigned compared to zero&quot;)<br>
Signed-off-by: Colin Ian King &lt;colin.king@canonical.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 3 ---<br>
&nbsp;1 file changed, 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index ac151da..6ea48d6 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -1043,9 &#43;1043,6 @@ static int navi10_set_power_profile_mode(struct s=
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
sp;&nbsp; SMU_TABLE_ACTIVITY_MONITOR_COEFF | WORKLOAD_PPLIB_CUSTOM_BIT &lt;=
&lt; 16,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; (void *)(&amp;activity_monitor), false);<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB32091B2F2143517D750AF4C5FEFC0DM6PR12MB3209namp_--

--===============0944244373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0944244373==--
