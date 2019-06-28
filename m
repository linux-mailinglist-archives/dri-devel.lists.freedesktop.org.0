Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119F59E75
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83816E942;
	Fri, 28 Jun 2019 15:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770050.outbound.protection.outlook.com [40.107.77.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB2C6E941;
 Fri, 28 Jun 2019 15:10:39 +0000 (UTC)
Received: from DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) by
 DM6PR12MB2971.namprd12.prod.outlook.com (20.178.29.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 15:10:37 +0000
Received: from DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25]) by DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25%2]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 15:10:37 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: Colin King <colin.king@canonical.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: fix a missing break in a switch statement
Thread-Topic: [PATCH] drm/amdgpu: fix a missing break in a switch statement
Thread-Index: AQHVLcGcbGOMZzlHb0eko5a85R9etqaxK6By
Date: Fri, 28 Jun 2019 15:10:37 +0000
Message-ID: <DM6PR12MB320959692BDD1D04CF096469FEFC0@DM6PR12MB3209.namprd12.prod.outlook.com>
References: <20190628143320.5182-1-colin.king@canonical.com>
In-Reply-To: <20190628143320.5182-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e8b062e-27fd-4431-9327-08d6fbdac6e2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2971; 
x-ms-traffictypediagnostic: DM6PR12MB2971:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB2971DD33B16032D91B46163FFEFC0@DM6PR12MB2971.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(199004)(189003)(68736007)(8676002)(19627405001)(476003)(81156014)(6606003)(478600001)(76176011)(3846002)(486006)(8936002)(2501003)(7696005)(71200400001)(71190400001)(7736002)(446003)(6116002)(52536014)(81166006)(74316002)(11346002)(5660300002)(26005)(186003)(99286004)(102836004)(229853002)(33656002)(6506007)(86362001)(236005)(66066001)(73956011)(66556008)(2201001)(110136005)(256004)(91956017)(54906003)(66446008)(25786009)(6246003)(72206003)(606006)(64756008)(9686003)(66476007)(966005)(6306002)(54896002)(66946007)(2906002)(6436002)(316002)(55016002)(14454004)(53546011)(76116006)(4326008)(53936002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2971;
 H:DM6PR12MB3209.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F9qVit6Mgjj8m6u4wgJAtQWTHqIvL9o4psZUYAmWlmIxi0u79DGH9bDNCIM+WLOdtR3EYjtfBUkB/T79hQf/JVtkrRFDLWv9MVtn0eMca79MncBjXtHm8BuhmSzeuzm9zE4Lr0NlUu6BO1OWufAJAODQ6luxi9OfzpBPnaNq0iBTpDfaAVYq25VvzAD0xDBPBKvplamiVsSQVW0MStlfLCpISQYfG+wBkw4DemRwAtl2wq1cj3pqXPme+LMtUsHk7shGobN85MzsREyaLsdCBts4ojVr8fV8WMxCxnbiC4ukgrv0q/4gsOER5kSCSJlIkURRk71dViWNaiZ3cuFgj7LLU1wkWfpnNTpHsRiUrszJuqWigz8Z5ECVCqKWW7/MDOGXjwovHHvPXTW3edi3AG93JlhoaV8jApphqSZPaT0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8b062e-27fd-4431-9327-08d6fbdac6e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 15:10:37.7224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2971
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9woFGoHF9NfE6b+KTgk73PJ1E/kRW+Evuuj8xd+Nv7U=;
 b=V9gDGqt1AzKKktP60N2ekxdmAJzzwlQ0vjYwX8VcT7x3P7ZsIXpHgvRljCkBDC3fZ2LMgW7wHiiivNuilhhpRkS/yHBeBUv2AdfvZC/aAvc7em1d3CVz+AobwOqw/Y6TQLcpj+lfD0+p0ZWFCY5x2aYBZFNmDvx+ORXa4pnHe9U=
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
Content-Type: multipart/mixed; boundary="===============1506752371=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1506752371==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB320959692BDD1D04CF096469FEFC0DM6PR12MB3209namp_"

--_000_DM6PR12MB320959692BDD1D04CF096469FEFC0DM6PR12MB3209namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Slava Abramov <slava.abramov@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Colin Ki=
ng <colin.king@canonical.com>
Sent: Friday, June 28, 2019 10:33:20 AM
To: Zhang, Hawking; Deucher, Alexander; Koenig, Christian; Zhou, David(Chun=
Ming); David Airlie; Daniel Vetter; amd-gfx@lists.freedesktop.org; dri-deve=
l@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix a missing break in a switch statement

From: Colin Ian King <colin.king@canonical.com>

Currently for the AMDGPU_IRQ_STATE_DISABLE there is a missing break
causing the code to fall through to the AMDGPU_IRQ_STATE_ENABLE case.
Fix this by adding in the missing break statement.

Addresses-Coverity: ("Missing break in switch")
Fixes: a644d85a5cd4 ("drm/amdgpu: add gfx v10 implementation (v10)")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c
index 2932ade7dbd0..c165200361b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4608,6 +4608,7 @@ gfx_v10_0_set_gfx_eop_interrupt_state(struct amdgpu_d=
evice *adev,
                 cp_int_cntl =3D REG_SET_FIELD(cp_int_cntl, CP_INT_CNTL_RIN=
G0,
                                             TIME_STAMP_INT_ENABLE, 0);
                 WREG32(cp_int_cntl_reg, cp_int_cntl);
+               break;
         case AMDGPU_IRQ_STATE_ENABLE:
                 cp_int_cntl =3D RREG32(cp_int_cntl_reg);
                 cp_int_cntl =3D REG_SET_FIELD(cp_int_cntl, CP_INT_CNTL_RIN=
G0,
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB320959692BDD1D04CF096469FEFC0DM6PR12MB3209namp_
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
<b>Sent:</b> Friday, June 28, 2019 10:33:20 AM<br>
<b>To:</b> Zhang, Hawking; Deucher, Alexander; Koenig, Christian; Zhou, Dav=
id(ChunMing); David Airlie; Daniel Vetter; amd-gfx@lists.freedesktop.org; d=
ri-devel@lists.freedesktop.org<br>
<b>Cc:</b> kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org<br=
>
<b>Subject:</b> [PATCH] drm/amdgpu: fix a missing break in a switch stateme=
nt</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Colin Ian King &lt;colin.king@canonical.com&=
gt;<br>
<br>
Currently for the AMDGPU_IRQ_STATE_DISABLE there is a missing break<br>
causing the code to fall through to the AMDGPU_IRQ_STATE_ENABLE case.<br>
Fix this by adding in the missing break statement.<br>
<br>
Addresses-Coverity: (&quot;Missing break in switch&quot;)<br>
Fixes: a644d85a5cd4 (&quot;drm/amdgpu: add gfx v10 implementation (v10)&quo=
t;)<br>
Signed-off-by: Colin Ian King &lt;colin.king@canonical.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c<br>
index 2932ade7dbd0..c165200361b2 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
@@ -4608,6 &#43;4608,7 @@ gfx_v10_0_set_gfx_eop_interrupt_state(struct amdg=
pu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cp_int_cntl =3D REG_SET_FIELD(cp_int_cntl, CP_INT_CNT=
L_RING0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TIME_STAMP_INT_ENABLE, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; WREG32(cp_int_cntl_reg, cp_int_cntl);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_IRQ_STATE_ENAB=
LE:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cp_int_cntl =3D RREG32(cp_int_cntl_reg);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cp_int_cntl =3D REG_SET_FIELD(cp_int_cntl, CP_INT_CNT=
L_RING0,<br>
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

--_000_DM6PR12MB320959692BDD1D04CF096469FEFC0DM6PR12MB3209namp_--

--===============1506752371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1506752371==--
