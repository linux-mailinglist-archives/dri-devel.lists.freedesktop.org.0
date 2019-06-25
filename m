Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37A055105
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656AD6E10C;
	Tue, 25 Jun 2019 14:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750078.outbound.protection.outlook.com [40.107.75.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD3F6E10A;
 Tue, 25 Jun 2019 14:03:27 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1860.namprd12.prod.outlook.com (10.175.98.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 14:03:25 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 14:03:25 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "natechancellor@gmail.com" <natechancellor@gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use msleep instead of udelay for 8ms wait
Thread-Topic: [PATCH] drm/amd/display: Use msleep instead of udelay for 8ms
 wait
Thread-Index: AQHVK16PLo4PGDyH5EeqfQYNLV0oSaasZrMj
Date: Tue, 25 Jun 2019 14:03:25 +0000
Message-ID: <BN6PR12MB18091A9D116FC6E0EB1E32FDF7E30@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <CAPM=9txaQ43GwOzXSE3prTRLbMt+ip=s_ssmFzWsfsTYdLssaw@mail.gmail.com>,
 <20190625140046.31682-1-harry.wentland@amd.com>
In-Reply-To: <20190625140046.31682-1-harry.wentland@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1a81502-ddfc-4cc8-43f3-08d6f975e43b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1860; 
x-ms-traffictypediagnostic: BN6PR12MB1860:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB18605DC44B6088D9790B72E2F7E30@BN6PR12MB1860.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(396003)(39860400002)(346002)(189003)(199004)(6246003)(4326008)(66066001)(68736007)(25786009)(3846002)(6116002)(2906002)(2201001)(74316002)(7736002)(478600001)(6436002)(8676002)(229853002)(81156014)(81166006)(966005)(72206003)(86362001)(8936002)(14454004)(7696005)(55016002)(102836004)(6506007)(53546011)(76176011)(99286004)(11346002)(5660300002)(52536014)(9686003)(54896002)(186003)(105004)(236005)(26005)(6306002)(19627405001)(446003)(53936002)(476003)(486006)(316002)(110136005)(54906003)(33656002)(66446008)(64756008)(66556008)(66476007)(606006)(66946007)(73956011)(76116006)(2501003)(256004)(71200400001)(71190400001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1860;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lzpk2qD90ELDz36M9gGHpUjVka/6t/PJP9dpWA46b1+XWeTzSMiFhoRKu0BXhfEzqeo+CGazYg8H8X5u3UOrUJJlSKMDyiGZYFnSZp4ymWWL6JiIpHdxrbD9K+CqSa36Uhk/nih8d0TDNkxNsBwneLwYcI69zXxszrlFVsVNBCjWVDtXTUA3vmzhj/TmmhLw+uXfCEZDvFUu0jDgx0ToN2djFzbspILhLK0OUKRqjLCZHBTCZibYRRpQ07KwwrpyL6eGArpx8xaWEJzuMfAmxfx8eeZUW0CgHDkocVcoZ0yvq6hOUKmHyF1rH+j5CrYy+Z7ADam10Hzh5YHqlgge4J00ftL4KCFB3xEfz+YNJd25IBIvpxIkE94LOjapBSX2jp93cT98csi78utB8waDSNmniDsBwPqtwfJ/uJLldn0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a81502-ddfc-4cc8-43f3-08d6f975e43b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 14:03:25.2941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1860
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NE30xopzW3LNjUBBD1v9BKUKahF61Ga3WilyRhqaS/g=;
 b=PplEKtY4Cgj6TjPpFOabnY0p8dj8/soAijZc5nEB3p7sSP902j8dUEUaZk60hhxe1ye8Z074DCkFHFz1jIJzdmZQjL+09v3DqrpMMeyaSD/2ML6qUVnCHybzwZbT1jWdoeczNyjmkcywErttOuhopkIr/RcB/ayA+UO0Ln86xEQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lei, 
 Jun" <Jun.Lei@amd.com>, "Koo, Anthony" <Anthony.Koo@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1202757006=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1202757006==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18091A9D116FC6E0EB1E32FDF7E30BN6PR12MB1809namp_"

--_000_BN6PR12MB18091A9D116FC6E0EB1E32FDF7E30BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Harry We=
ntland <harry.wentland@amd.com>
Sent: Tuesday, June 25, 2019 10:00 AM
To: airlied@gmail.com; natechancellor@gmail.com
Cc: Zhou, David(ChunMing); Li, Sun peng (Leo); Koo, Anthony; linux-kernel@v=
ger.kernel.org; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.=
org; Wentland, Harry; Deucher, Alexander; Lei, Jun; Lakha, Bhawanpreet; Koe=
nig, Christian
Subject: [PATCH] drm/amd/display: Use msleep instead of udelay for 8ms wait

arm32's udelay only allows values up to 2000 microseconds. msleep
does the trick for us here as there is no problem if this isn't
microsecond accurate and takes a tad longer.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/dr=
m/amd/display/dc/core/dc_link.c
index 4c31930f1cdf..f5d02f89b3f9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -548,7 +548,7 @@ static void read_edp_current_link_settings_on_detect(st=
ruct dc_link *link)
                         break;
                 }

-               udelay(8000);
+               msleep(8);
         }

         ASSERT(status =3D=3D DC_OK);
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18091A9D116FC6E0EB1E32FDF7E30BN6PR12MB1809namp_
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
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Harry Wentland &lt;harry.went=
land@amd.com&gt;<br>
<b>Sent:</b> Tuesday, June 25, 2019 10:00 AM<br>
<b>To:</b> airlied@gmail.com; natechancellor@gmail.com<br>
<b>Cc:</b> Zhou, David(ChunMing); Li, Sun peng (Leo); Koo, Anthony; linux-k=
ernel@vger.kernel.org; amd-gfx@lists.freedesktop.org; dri-devel@lists.freed=
esktop.org; Wentland, Harry; Deucher, Alexander; Lei, Jun; Lakha, Bhawanpre=
et; Koenig, Christian<br>
<b>Subject:</b> [PATCH] drm/amd/display: Use msleep instead of udelay for 8=
ms wait</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">arm32's udelay only allows values up to 2000 micro=
seconds. msleep<br>
does the trick for us here as there is no problem if this isn't<br>
microsecond accurate and takes a tad longer.<br>
<br>
Signed-off-by: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/dr=
m/amd/display/dc/core/dc_link.c<br>
index 4c31930f1cdf..f5d02f89b3f9 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/dc/core/dc_link.c<br>
@@ -548,7 &#43;548,7 @@ static void read_edp_current_link_settings_on_detec=
t(struct dc_link *link)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; udelay(8000);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; msleep(8);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT(status =3D=3D DC_OK=
);<br>
-- <br>
2.22.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18091A9D116FC6E0EB1E32FDF7E30BN6PR12MB1809namp_--

--===============1202757006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1202757006==--
