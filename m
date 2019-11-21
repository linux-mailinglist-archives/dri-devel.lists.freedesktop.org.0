Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A4C1056B4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 17:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFBA6F469;
	Thu, 21 Nov 2019 16:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820080.outbound.protection.outlook.com [40.107.82.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDDB6F469;
 Thu, 21 Nov 2019 16:13:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m13ugm9qauh3Cql/kT+ep453yil2Dlc8oWF4eBM1I6ehl1kM0W/XoUQCy4pb+lQrq8d/UOk54dBREjWzjc30xPxPweXCGdae1JQ3Dt/nuE9og3c4lVS73D6bGYZqT6hotenj5NVjeyKy3oW0gCaP1X9UASO4XoUjgVVE0D/pqbcNMBiVhI8e0iKHhFNNpAZUvH577xZA3DDZA02025AbtSLsd0wtzizPsVbSbhtY8mP1e8YzJnMLcxprVm2z/LKfpCFrRgIQxxoa/uZUSDhEJLaSa85ZIzY3Z22XuBkYgEZXaZIAGRN/b+MQV6Gl+yJWlD6c5TKe9WLe0iB164M7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2wzMdtl8Xv1DTtVaxk0cD/m5z3ms7SPgMO5KWTxLZQ=;
 b=ZCN2L4umhKzlaZ3a6bPMz8QYsAeNHZu6RYt5h9L3lDy73URsLqWqLYdXDTtSIUjzAtAgXWcGg2yqd3yl67i4csOTnKPUSxCqzl9wc6vfkb4y3QSb0oJoB8jUQeqCJ2rQYVVyUORWFBblCGPLxidvt5RdI1dzmQkmbydxb61JkYLYxm05WnsLMzvq9dDXM9d+wMWeKpr7eDrsb54hW7g0UMFsZicvw5E1w+O6mUWrzH9j6nBL3wL5k8SEUldPfvrDEk1eIxJmZFK4j2dNVz4NlSyaZUYw0tnmDy9t1+CFOo5Dxz8TpremTy5L3JoGZnNHZUeIQ7ZJ4nZhXU5s3BTFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1813.namprd12.prod.outlook.com (10.175.80.21) by
 CY4PR12MB1687.namprd12.prod.outlook.com (10.172.65.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 21 Nov 2019 16:13:22 +0000
Received: from CY4PR12MB1813.namprd12.prod.outlook.com
 ([fe80::dc23:193b:9619:a4fc]) by CY4PR12MB1813.namprd12.prod.outlook.com
 ([fe80::dc23:193b:9619:a4fc%4]) with mapi id 15.20.2451.031; Thu, 21 Nov 2019
 16:13:22 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/amd: Fix Kconfig indentation
Thread-Topic: [PATCH] drm/amd: Fix Kconfig indentation
Thread-Index: AQHVoG+5uDRBIFeGbke8CRsqJA7wsKeVzDsh
Date: Thu, 21 Nov 2019 16:13:22 +0000
Message-ID: <CY4PR12MB1813D2AE8B11E5F190581995F74E0@CY4PR12MB1813.namprd12.prod.outlook.com>
References: <20191121132930.29544-1-krzk@kernel.org>
In-Reply-To: <20191121132930.29544-1-krzk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.59.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 97245512-027f-4bd9-ffae-08d76e9dbafe
x-ms-traffictypediagnostic: CY4PR12MB1687:|CY4PR12MB1687:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1687B0A6EB798BD4235302E1F74E0@CY4PR12MB1687.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(189003)(199004)(55016002)(54896002)(6436002)(229853002)(256004)(446003)(316002)(54906003)(2906002)(2501003)(9686003)(6246003)(105004)(110136005)(6506007)(102836004)(53546011)(11346002)(4326008)(186003)(26005)(71190400001)(71200400001)(76176011)(7696005)(66946007)(86362001)(66066001)(81156014)(25786009)(99286004)(14454004)(478600001)(8676002)(6116002)(33656002)(66556008)(66476007)(7736002)(64756008)(74316002)(66446008)(3846002)(76116006)(8936002)(81166006)(52536014)(5660300002)(19627405001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1687;
 H:CY4PR12MB1813.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3dYIJFQSVzNQdMEFpnUUQvyQdrnpw2+5l9iyn44JWrEgG8uzHUqEM8cVn3ZGkZlyoAZ2Yrkou1z9G0n6xyRfXgmUjUDo6nTW6ghPSG1FQdz/gBjZC5mk1l/mmcvzMEJS1miXuraCzXZt4rbTUOjqqrjmZjXPoI0SPhU9uNU3O9tiq4oAFGtObw1Pozp90fIQVlBDUBTeQ2KbxTsCgYhzxblMkHiHJb2O3AQ5zOuc22vQ4okM3kON2USIVUe4bT17yig/klRyZLFQ6HhJWU0eWfBv4BDmyfCDzpPjw/L5hvIVHo52E4lnm/QP9FoGPb3B4POwa340SzxurNeA8IZrzvw2kc4Z3wIFoPowcebb6Ti44d9epGsYnZnJvTUhJeISx3X0UiISmFn26REd24gKSGK2Iy46iAIzaV8y+esWJTJhp0YcecTdvxtlgORbOBHM
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97245512-027f-4bd9-ffae-08d76e9dbafe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 16:13:22.1249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l3OO8isARI/eS49pVNShR1H1zlP8W7yBGt0qpl3yvArZnqsviCNVIEhnczaYOubUjKI0w0olJVgaMnYoPNh0rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1687
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2wzMdtl8Xv1DTtVaxk0cD/m5z3ms7SPgMO5KWTxLZQ=;
 b=OEl+KiGLboJZ1T1du0kfNZHpHSxQfeZT8Uc7IJadS2vTIryXyPwvGDL18m6k24aHuhsrpUc8pHzjLnDjbpJNFqz6VYCd60YJonCUPb4nvCISrYS66mbyTlYMxY3d6BEVtzhA5iP1pFED6Qn91MQbTfj/wDjbUzfM5bSMP/zHfxA=
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0849829786=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0849829786==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR12MB1813D2AE8B11E5F190581995F74E0CY4PR12MB1813namp_"

--_000_CY4PR12MB1813D2AE8B11E5F190581995F74E0CY4PR12MB1813namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Krzysztof Kozlowski <krzk@kernel.org>
Sent: Thursday, November 21, 2019 8:29 AM
To: linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>; Deucher, Alexander <Alexander.De=
ucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(C=
hunMing) <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vet=
ter <daniel@ffwll.ch>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedes=
ktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org=
>
Subject: [PATCH] drm/amd: Fix Kconfig indentation

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
        $ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpu/drm/amd/acp/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/acp/Kconfig b/drivers/gpu/drm/amd/acp/Kcon=
fig
index d968c2471412..19bae9100da4 100644
--- a/drivers/gpu/drm/amd/acp/Kconfig
+++ b/drivers/gpu/drm/amd/acp/Kconfig
@@ -2,11 +2,11 @@
 menu "ACP (Audio CoProcessor) Configuration"

 config DRM_AMD_ACP
-       bool "Enable AMD Audio CoProcessor IP support"
-       depends on DRM_AMDGPU
-       select MFD_CORE
-       select PM_GENERIC_DOMAINS if PM
-       help
+       bool "Enable AMD Audio CoProcessor IP support"
+       depends on DRM_AMDGPU
+       select MFD_CORE
+       select PM_GENERIC_DOMAINS if PM
+       help
         Choose this option to enable ACP IP support for AMD SOCs.
         This adds the ACP (Audio CoProcessor) IP driver and wires
         it up into the amdgpu driver.  The ACP block provides the DMA
--
2.17.1


--_000_CY4PR12MB1813D2AE8B11E5F190581995F74E0CY4PR12MB1813namp_
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Krzysztof Kozlowski &=
lt;krzk@kernel.org&gt;<br>
<b>Sent:</b> Thursday, November 21, 2019 8:29 AM<br>
<b>To:</b> linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt=
;<br>
<b>Cc:</b> Krzysztof Kozlowski &lt;krzk@kernel.org&gt;; Deucher, Alexander =
&lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@a=
md.com&gt;; Zhou, David(ChunMing) &lt;David1.Zhou@amd.com&gt;; David Airlie=
 &lt;airlied@linux.ie&gt;; Daniel Vetter &lt;daniel@ffwll.ch&gt;; amd-gfx@l=
ists.freedesktop.org
 &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt=
;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> [PATCH] drm/amd: Fix Kconfig indentation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Adjust indentation from spaces to tab (&#43;option=
al two spaces) as in<br>
coding style with command like:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $ sed -e 's/^&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /\t/' -i */Kconfig<br>
<br>
Signed-off-by: Krzysztof Kozlowski &lt;krzk@kernel.org&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/acp/Kconfig | 10 &#43;&#43;&#43;&#43;&#43;-----<b=
r>
&nbsp;1 file changed, 5 insertions(&#43;), 5 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/acp/Kconfig b/drivers/gpu/drm/amd/acp/Kcon=
fig<br>
index d968c2471412..19bae9100da4 100644<br>
--- a/drivers/gpu/drm/amd/acp/Kconfig<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/acp/Kconfig<br>
@@ -2,11 &#43;2,11 @@<br>
&nbsp;menu &quot;ACP (Audio CoProcessor) Configuration&quot;<br>
&nbsp;<br>
&nbsp;config DRM_AMD_ACP<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Enable AMD Audio CoProcess=
or IP support&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; depends on DRM_AMDGPU<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select MFD_CORE<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select PM_GENERIC_DOMAINS if PM<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Enable AMD Audio CoPro=
cessor IP support&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; depends on DRM_AMDGPU<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select MFD_CORE<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select PM_GENERIC_DOMAINS if PM<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Choose this option to enab=
le ACP IP support for AMD SOCs.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This adds the ACP (Audio C=
oProcessor) IP driver and wires<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; it up into the amdgpu driv=
er.&nbsp; The ACP block provides the DMA<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CY4PR12MB1813D2AE8B11E5F190581995F74E0CY4PR12MB1813namp_--

--===============0849829786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0849829786==--
