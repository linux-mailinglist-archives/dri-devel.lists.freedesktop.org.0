Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3FB59F9D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869A46E95C;
	Fri, 28 Jun 2019 15:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750075.outbound.protection.outlook.com [40.107.75.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D7B89842;
 Fri, 28 Jun 2019 15:49:18 +0000 (UTC)
Received: from DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) by
 DM6PR12MB4025.namprd12.prod.outlook.com (10.255.175.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Fri, 28 Jun 2019 15:49:07 +0000
Received: from DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25]) by DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25%2]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 15:49:07 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: Colin King <colin.king@canonical.com>, "Wang, Kevin(Yang)"
 <Kevin1.Wang@amd.com>, Rex Zhu <rex.zhu@amd.com>, "Quan, Evan"
 <Evan.Quan@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH][next] drm/amd/powerplay: fix out of memory check on
 od8_settings
Thread-Topic: [PATCH][next] drm/amd/powerplay: fix out of memory check on
 od8_settings
Thread-Index: AQHVLcggwxoCrhU+BkiwhUlh4PXsHKaxNnaq
Date: Fri, 28 Jun 2019 15:49:07 +0000
Message-ID: <DM6PR12MB32096A1C759F688B42A8519FFEFC0@DM6PR12MB3209.namprd12.prod.outlook.com>
References: <20190628151354.14107-1-colin.king@canonical.com>
In-Reply-To: <20190628151354.14107-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9f86e6c-dc14-4ac4-5d30-08d6fbe02787
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4025; 
x-ms-traffictypediagnostic: DM6PR12MB4025:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB4025142D145668E852737139FEFC0@DM6PR12MB4025.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(229853002)(6246003)(8676002)(446003)(7696005)(2501003)(11346002)(9686003)(81156014)(81166006)(476003)(486006)(54896002)(6306002)(52536014)(71200400001)(6436002)(71190400001)(76116006)(68736007)(73956011)(91956017)(64756008)(66446008)(66476007)(66556008)(74316002)(66946007)(55016002)(8936002)(6606003)(5660300002)(53936002)(6116002)(7736002)(256004)(3846002)(2906002)(54906003)(110136005)(316002)(33656002)(606006)(236005)(478600001)(966005)(72206003)(14454004)(25786009)(66066001)(99286004)(76176011)(19627405001)(4326008)(6506007)(53546011)(102836004)(26005)(186003)(2201001)(86362001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4025;
 H:DM6PR12MB3209.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uk93kDoqn93oG8bgKzHhUhgthTuVkJAiWaUZd455xvqe/aqIXwuMnWyjCrtFE/9EbMiCseZiey13zHN5SbKRrPqTB5EuZwv33T9eVYu/A6g+nqLca4Cmwx1SVZfKhmtH90edhC1javRC/uIhrhGwLVU7JccHPjRtkZjqQL37og/+CGyWYrsgd2kwtjlLNKR3bKc9v+v7E5G0LZq90sVD7IgCW8Qa0tHxrrL8zglZX6ArNj1kEbt9YufZNVD4T85lGeWKNVF+uiZwaTMRw5ST8lpgOj/U93IO8toMrD8VNjodfZ4bFCRH2oFMNmvj6JLylRJKhRi8sejx0IM9+j9rG0rNC1XEXHD2aXeU9wpV/8cfCjXWSyA8gSeBzLce8oUowAicr+4OE6f+1YCYL2MoK7LkCRjogVD/gMIDeNhCKPE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f86e6c-dc14-4ac4-5d30-08d6fbe02787
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 15:49:07.2723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4025
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u72mdB+1VYZ6CBG7K4gBeOlxJCHlN/L4A05sQbDki6g=;
 b=qH9K8dXlf2nY1y6otEC2GTP9PEyx4YjpnOD/NgMO8bsFl+mfo6fEm2VXxNdRrauoVLi1BPs7r8YzGSX9t35UJ9D4nvxRynV6865HG8Ad7nHN0JS3h7sNh/I6Y/ZJbI2hNHTepFug0ssuQeAcSQNWLEUnqwzRhlLvFPfGYxkE3YA=
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
Content-Type: multipart/mixed; boundary="===============0828944034=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0828944034==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB32096A1C759F688B42A8519FFEFC0DM6PR12MB3209namp_"

--_000_DM6PR12MB32096A1C759F688B42A8519FFEFC0DM6PR12MB3209namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Slava Abramov <slava.abramov@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Colin Ki=
ng <colin.king@canonical.com>
Sent: Friday, June 28, 2019 11:13:54 AM
To: Wang, Kevin(Yang); Rex Zhu; Quan, Evan; Deucher, Alexander; Koenig, Chr=
istian; Zhou, David(ChunMing); David Airlie; Daniel Vetter; amd-gfx@lists.f=
reedesktop.org; dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/powerplay: fix out of memory check on od8_se=
ttings

From: Colin Ian King <colin.king@canonical.com>

The null pointer check on od8_settings is currently the opposite of what
it is intended to do. Fix this by adding in the missing ! operator.

Addressed-Coverity: ("Resource leak")
Fixes: 0c83d32c565c ("drm/amd/powerplay: simplified od_settings for each as=
ic")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index 0f14fe14ecd8..eb9e6b3a5265 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -1501,8 +1501,7 @@ static int vega20_set_default_od8_setttings(struct sm=
u_context *smu)
                 return -EINVAL;

         od8_settings =3D kzalloc(sizeof(struct vega20_od8_settings), GFP_K=
ERNEL);
-
-       if (od8_settings)
+       if (!od8_settings)
                 return -ENOMEM;

         smu->od_settings =3D (void *)od8_settings;
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB32096A1C759F688B42A8519FFEFC0DM6PR12MB3209namp_
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
<b>Sent:</b> Friday, June 28, 2019 11:13:54 AM<br>
<b>To:</b> Wang, Kevin(Yang); Rex Zhu; Quan, Evan; Deucher, Alexander; Koen=
ig, Christian; Zhou, David(ChunMing); David Airlie; Daniel Vetter; amd-gfx@=
lists.freedesktop.org; dri-devel@lists.freedesktop.org<br>
<b>Cc:</b> kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org<br=
>
<b>Subject:</b> [PATCH][next] drm/amd/powerplay: fix out of memory check on=
 od8_settings</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Colin Ian King &lt;colin.king@canonical.com&=
gt;<br>
<br>
The null pointer check on od8_settings is currently the opposite of what<br=
>
it is intended to do. Fix this by adding in the missing ! operator.<br>
<br>
Addressed-Coverity: (&quot;Resource leak&quot;)<br>
Fixes: 0c83d32c565c (&quot;drm/amd/powerplay: simplified od_settings for ea=
ch asic&quot;)<br>
Signed-off-by: Colin Ian King &lt;colin.king@canonical.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c | 3 &#43;--<br>
&nbsp;1 file changed, 1 insertion(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index 0f14fe14ecd8..eb9e6b3a5265 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -1501,8 &#43;1501,7 @@ static int vega20_set_default_od8_setttings(struc=
t smu_context *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; od8_settings =3D kzalloc(s=
izeof(struct vega20_od8_settings), GFP_KERNEL);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (od8_settings)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!od8_settings)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;od_settings =3D (v=
oid *)od8_settings;<br>
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

--_000_DM6PR12MB32096A1C759F688B42A8519FFEFC0DM6PR12MB3209namp_--

--===============0828944034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0828944034==--
