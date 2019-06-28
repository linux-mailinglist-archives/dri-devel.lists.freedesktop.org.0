Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DFC59F76
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA8E6E952;
	Fri, 28 Jun 2019 15:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0487C6E952;
 Fri, 28 Jun 2019 15:48:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=MyZnkRSeCkYbLnmiNjbBSCy640Ojeuab7C/2xVGBagpqewrc2xe8FKu/eAUF1DXTFZLG1vfU+ksOVGMACkK6hQgVPY/A2aeXD6C1QBqid9ladQpDnkAewNv0WHlqlQ1jeN3kpC+GI2nMCmIVHhkdxT+bnRZIBldQbuJ3SwvHZGU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6QVh3ssGzWZQaAe2yAJgD3ge3l6+XDY8p5N5x4gYB8=;
 b=RcIv/Ek0ZmBo4/S5f0nSBKoRYjVo4t9ketY+mP1BAeRcBnwiu8eQuiTMQOEtA2RnFhkgl/tCQsOmB37U61EwEqwANAbfOKofZcqxluHYuRhCfU98OVUggIijO6336dHyOCm+ePdI4+M0hQjAPV9fXmiOX8TNBEXPUjbcvBHArvE=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) by
 DM6PR12MB2780.namprd12.prod.outlook.com (20.176.118.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 15:48:53 +0000
Received: from DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25]) by DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25%2]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 15:48:53 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: Colin King <colin.king@canonical.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Xiao, Jack"
 <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH][next] drm/amdgpu/mes10.1: fix duplicated assignment to
 adev->mes.ucode_fw_version
Thread-Topic: [PATCH][next] drm/amdgpu/mes10.1: fix duplicated assignment to
 adev->mes.ucode_fw_version
Thread-Index: AQHVLcgeJcRlLim+BkGszKIxseMbfKaxNk+5
Date: Fri, 28 Jun 2019 15:48:53 +0000
Message-ID: <DM6PR12MB3209CF61E36FF1614BDD8C77FEFC0@DM6PR12MB3209.namprd12.prod.outlook.com>
References: <20190628150539.12195-1-colin.king@canonical.com>
In-Reply-To: <20190628150539.12195-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e4f5598-6bfc-4332-cb77-08d6fbe01f39
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2780; 
x-ms-traffictypediagnostic: DM6PR12MB2780:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB2780232278DB4BCC0938C3BEFEFC0@DM6PR12MB2780.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(199004)(189003)(19627405001)(186003)(66556008)(55016002)(54896002)(9686003)(6246003)(486006)(606006)(86362001)(2906002)(73956011)(66946007)(25786009)(6306002)(7696005)(316002)(66446008)(64756008)(2201001)(91956017)(14454004)(476003)(33656002)(54906003)(53936002)(53546011)(72206003)(99286004)(76116006)(110136005)(66476007)(11346002)(236005)(4326008)(966005)(256004)(14444005)(446003)(6116002)(3846002)(6606003)(229853002)(2501003)(478600001)(102836004)(66066001)(5660300002)(6436002)(8936002)(6506007)(81166006)(68736007)(74316002)(52536014)(7736002)(81156014)(76176011)(71190400001)(71200400001)(26005)(8676002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2780;
 H:DM6PR12MB3209.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wZqV+7XHD8DpFFjt5xILrXrXuo7lQrCd5ryNvhfUElMIsOGppdKpEwTSkckurrFmFn8fZNpxRS1Twp6JASqETKwMtYw8cBIpFda/T9yX11JVL0Y7aVjHhN7ei1sxfghN7i7Hp2fav0TPJ6MH+EUSNgVjU+kwkmXBxirDm8MKafSzWKz7gDYglxqDSo+JiVgWUCPVJiSdVVKVAaEO2U9jUTPEmVbZN+wXO28ozZkN82rc6tclDmuVVCwLkyNd8+68xPq7e5vInCTjFr/0StM+txpABXIUpkdq3k4LUnrrb5WkYysXZvdNs+NupCHgKqeWCD2+tYPPk8wromduFUzdhoepoRO6v6MEfOUn+qKJ71qzVZWq98RsqjPw6DjxmenfplX0TJWTqbq1xLcANdC+Jcsi2rKe4VYrUpAbsG8ad+Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4f5598-6bfc-4332-cb77-08d6fbe01f39
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 15:48:53.3282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2780
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6QVh3ssGzWZQaAe2yAJgD3ge3l6+XDY8p5N5x4gYB8=;
 b=pzHfwWAlW/Uaeif7gHfAsoGTORBgOk3lM2Fzs+Yg0IKe55zkTD2laK5M4tNOEhLygLWWvykY0yHxrmU7F301pgAg9mxGQyoCojBtLvLCfw/NIH6PDewYAh6o0YYPPYSfANQEGUaJb5TFfrgX2UJYC1e2hF1S574a+paBaw357YE=
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
Content-Type: multipart/mixed; boundary="===============2106832640=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2106832640==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB3209CF61E36FF1614BDD8C77FEFC0DM6PR12MB3209namp_"

--_000_DM6PR12MB3209CF61E36FF1614BDD8C77FEFC0DM6PR12MB3209namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Slava Abramov <slava.abramov@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Colin Ki=
ng <colin.king@canonical.com>
Sent: Friday, June 28, 2019 11:05:39 AM
To: Deucher, Alexander; Koenig, Christian; Zhou, David(ChunMing); David Air=
lie; Daniel Vetter; Xiao, Jack; Zhang, Hawking; amd-gfx@lists.freedesktop.o=
rg; dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu/mes10.1: fix duplicated assignment to ade=
v->mes.ucode_fw_version

From: Colin Ian King <colin.king@canonical.com>

Currently adev->mes.ucode_fw_version is being assigned twice with
different values. This looks like a cut-n-paste error and instead
the second assignment should be adev->mes.data_fw_version. Fix
this.

Addresses-Coverity: ("Unused value")
Fixes: 298d05460cc4 ("drm/amdgpu/mes10.1: load mes firmware file to CPU buf=
fer")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/a=
mdgpu/mes_v10_1.c
index 29fab7984855..2a27f0b30bb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -91,7 +91,7 @@ static int mes_v10_1_init_microcode(struct amdgpu_device =
*adev)

         mes_hdr =3D (const struct mes_firmware_header_v1_0 *)adev->mes.fw-=
>data;
         adev->mes.ucode_fw_version =3D le32_to_cpu(mes_hdr->mes_ucode_vers=
ion);
-       adev->mes.ucode_fw_version =3D
+       adev->mes.data_fw_version =3D
                 le32_to_cpu(mes_hdr->mes_ucode_data_version);
         adev->mes.uc_start_addr =3D
                 le32_to_cpu(mes_hdr->mes_uc_start_addr_lo) |
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB3209CF61E36FF1614BDD8C77FEFC0DM6PR12MB3209namp_
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
<p style=3D"margin-top:0;margin-bottom:0">Acked-by: Slava Abramov &lt;slava=
.abramov@amd.com&gt;</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Colin King &lt;colin.king@can=
onical.com&gt;<br>
<b>Sent:</b> Friday, June 28, 2019 11:05:39 AM<br>
<b>To:</b> Deucher, Alexander; Koenig, Christian; Zhou, David(ChunMing); Da=
vid Airlie; Daniel Vetter; Xiao, Jack; Zhang, Hawking; amd-gfx@lists.freede=
sktop.org; dri-devel@lists.freedesktop.org<br>
<b>Cc:</b> kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org<br=
>
<b>Subject:</b> [PATCH][next] drm/amdgpu/mes10.1: fix duplicated assignment=
 to adev-&gt;mes.ucode_fw_version</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Colin Ian King &lt;colin.king@canonical.com&=
gt;<br>
<br>
Currently adev-&gt;mes.ucode_fw_version is being assigned twice with<br>
different values. This looks like a cut-n-paste error and instead<br>
the second assignment should be adev-&gt;mes.data_fw_version. Fix<br>
this.<br>
<br>
Addresses-Coverity: (&quot;Unused value&quot;)<br>
Fixes: 298d05460cc4 (&quot;drm/amdgpu/mes10.1: load mes firmware file to CP=
U buffer&quot;)<br>
Signed-off-by: Colin Ian King &lt;colin.king@canonical.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/mes_v10_1.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/a=
mdgpu/mes_v10_1.c<br>
index 29fab7984855..2a27f0b30bb5 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c<br>
@@ -91,7 &#43;91,7 @@ static int mes_v10_1_init_microcode(struct amdgpu_dev=
ice *adev)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mes_hdr =3D (const struct =
mes_firmware_header_v1_0 *)adev-&gt;mes.fw-&gt;data;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mes.ucode_fw_vers=
ion =3D le32_to_cpu(mes_hdr-&gt;mes_ucode_version);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mes.ucode_fw_version =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mes.data_fw_version =3D<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; le32_to_cpu(mes_hdr-&gt;mes_ucode_data_version);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mes.uc_start_addr=
 =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; le32_to_cpu(mes_hdr-&gt;mes_uc_start_addr_lo) |<br>
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

--_000_DM6PR12MB3209CF61E36FF1614BDD8C77FEFC0DM6PR12MB3209namp_--

--===============2106832640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2106832640==--
