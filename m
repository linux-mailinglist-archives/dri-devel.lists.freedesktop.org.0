Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E66421BE1
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 18:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66232897D7;
	Fri, 17 May 2019 16:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720065.outbound.protection.outlook.com [40.107.72.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A1C897D7;
 Fri, 17 May 2019 16:44:32 +0000 (UTC)
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2814.namprd12.prod.outlook.com (52.135.107.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 16:44:30 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 16:44:30 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Quan, Evan" <Evan.Quan@amd.com>, xiaolinkui <xiaolinkui@kylinos.cn>
Subject: Re: [PATCH] gpu: drm: use struct_size() in kmalloc()
Thread-Topic: [PATCH] gpu: drm: use struct_size() in kmalloc()
Thread-Index: AQHVDI2qe/CUJDlUrE6nllhDkI7lB6ZvhnyW
Date: Fri, 17 May 2019 16:44:30 +0000
Message-ID: <SN6PR12MB2800A7AEC22121C8704CBB09870B0@SN6PR12MB2800.namprd12.prod.outlook.com>
References: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
In-Reply-To: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [52.230.217.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 183261d0-08ad-4198-3800-08d6dae6eedb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2814; 
x-ms-traffictypediagnostic: SN6PR12MB2814:
x-microsoft-antispam-prvs: <SN6PR12MB2814D724666E47EE2CE713FE870B0@SN6PR12MB2814.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(189003)(2201001)(71200400001)(66066001)(5660300002)(71190400001)(256004)(76176011)(7696005)(229853002)(102836004)(86362001)(72206003)(476003)(66556008)(6116002)(91956017)(66446008)(73956011)(64756008)(66476007)(6506007)(76116006)(3846002)(14454004)(478600001)(66946007)(53546011)(186003)(26005)(52536014)(486006)(54896002)(4326008)(2501003)(99286004)(68736007)(55016002)(2906002)(9686003)(25786009)(54906003)(7736002)(81166006)(74316002)(6436002)(8936002)(446003)(33656002)(110136005)(8676002)(53936002)(81156014)(316002)(11346002)(6246003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2814;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9aMHIr2/mnR7KVselUBlsZhYWiRqSRIMgfsad44TVwEhfHUhVh5hh48iMaqMP5RchwiT+qryVFXpf7ISgjkZrT9pbTT0yc1gXjZf8tt0AFk/oSWGIa1jfNqaJs5mBBth66Y4CIbH+xRW64medWwhvQoDdXfAm5iHbC25AAxQ2vHMsO7wI7MfPjTJ6Sv+UgbsFB71sd6a2kBdnS3C/yWdzNx5ADhvtzu6GCj1kaEoVcNMvLKdxAZNfkaPfUlaFN2hKkPGoqKgLkVuyZoen4Xqeas2SUt9gn9LSzUXcKXkLxOy1lq2hYynj/KsfA+rIgQqBPvYW4jnlKOwPHT/5/bq7Ak9kh8vgLPd69wFwDnDzs8eMryoidKfkfUZA8Z1p3fmC5EudKs4qOacQDXo/UlKbsNg1YUxF2+k1soCqxZsA14=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183261d0-08ad-4198-3800-08d6dae6eedb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 16:44:30.2422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2814
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBrEaskM81ovRRWC32zQAZvPsK6ULpWgt6a4/wvj/78=;
 b=KewFQzkxujj/Y+PaaaridL9+GZ32YskHW9pwHxwf3gxNWR/NSLXjBWarchm0NzzQLudydXPOvIB8VKahM99KvCY3uKD4CiRe5raO5ri6czNOzszWWGXcrF9EnUJHoaVS1Yd9iMzAVmBgQpVolhFZeTfUj93o6pERNyvJdKyQgbQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "xiaolinkui@kylinos.cn" <xiaolinkui@kylinos.cn>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0836305734=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0836305734==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR12MB2800A7AEC22121C8704CBB09870B0SN6PR12MB2800namp_"

--_000_SN6PR12MB2800A7AEC22121C8704CBB09870B0SN6PR12MB2800namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am going to put more members which are also array after this struct, not =
only obj[].  Looks like this struct_size did not help on multiple array cas=
e. Thanks anyway.
________________________________
From: xiaolinkui <xiaolinkui@kylinos.cn>
Sent: Friday, May 17, 2019 4:46:00 PM
To: Deucher, Alexander; Koenig, Christian; Zhou, David(ChunMing); airlied@l=
inux.ie; daniel@ffwll.ch; Pan, Xinhui; Quan, Evan
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; xiaolinkui@kylinos.cn
Subject: [PATCH] gpu: drm: use struct_size() in kmalloc()

[CAUTION: External Email]

Use struct_size() helper to keep code simple.

Signed-off-by: xiaolinkui <xiaolinkui@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index 22bd21e..4717a64 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1375,8 +1375,7 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
        if (con)
                return 0;

-       con =3D kmalloc(sizeof(struct amdgpu_ras) +
-                       sizeof(struct ras_manager) * AMDGPU_RAS_BLOCK_COUNT=
,
+       con =3D kmalloc(struct_size(con, objs, AMDGPU_RAS_BLOCK_COUNT),
                        GFP_KERNEL|__GFP_ZERO);
        if (!con)
                return -ENOMEM;
--
2.7.4




--_000_SN6PR12MB2800A7AEC22121C8704CBB09870B0SN6PR12MB2800namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
I am going to put more members which are also array after this struct, not =
only obj[].&nbsp; Looks like this struct_size did not help on multiple arra=
y case. Thanks anyway.</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> xiaolinkui &lt;xiao=
linkui@kylinos.cn&gt;<br>
<b>Sent:</b> Friday, May 17, 2019 4:46:00 PM<br>
<b>To:</b> Deucher, Alexander; Koenig, Christian; Zhou, David(ChunMing); ai=
rlied@linux.ie; daniel@ffwll.ch; Pan, Xinhui; Quan, Evan<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; =
linux-kernel@vger.kernel.org; xiaolinkui@kylinos.cn<br>
<b>Subject:</b> [PATCH] gpu: drm: use struct_size() in kmalloc()</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
Use struct_size() helper to keep code simple.<br>
<br>
Signed-off-by: xiaolinkui &lt;xiaolinkui@kylinos.cn&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 &#43;--<br>
&nbsp;1 file changed, 1 insertion(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c<br>
index 22bd21e..4717a64 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
@@ -1375,8 &#43;1375,7 @@ int amdgpu_ras_init(struct amdgpu_device *adev)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (con)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return 0;<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; con =3D kmalloc(sizeof(struct amdgpu_=
ras) &#43;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(struct ra=
s_manager) * AMDGPU_RAS_BLOCK_COUNT,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; con =3D kmalloc(struct_size(con, =
objs, AMDGPU_RAS_BLOCK_COUNT),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL|=
__GFP_ZERO);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!con)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return -ENOMEM;<br>
--<br>
2.7.4<br>
<br>
<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_SN6PR12MB2800A7AEC22121C8704CBB09870B0SN6PR12MB2800namp_--

--===============0836305734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0836305734==--
