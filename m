Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D08E8488
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 10:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621046E1A2;
	Tue, 29 Oct 2019 09:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820074.outbound.protection.outlook.com [40.107.82.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747DC6E19B;
 Tue, 29 Oct 2019 09:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REpZKTRudZZcaj0YReIhCMdPHPa/1pipiTLYgVeDbEPIKOrja9y2cBnlL9ooC+lC6YtNND8/MMIzCjhy8q4T9HXvnZlBYcimmuTFVCHGOuzVRwX+hBgEgNkI/7iRvVOteATvk/WbOmwgQu3v8wX01AtM2OfBjnzmAvbaouLL2tbxI9172ge48hP9xzteRpCJxE+hKoeIpb0R98Wis/Iks+g+S1KywmDWO6Y0+2wRxh42YwR1QmEQrCtNAe7uZ7FJChfx1OZPzXI7WgmNtj+Vnhhr2lJFpOUi3/suGTRZSY8D1OcCFXUO2dytGnDq57jt+yx1eoaLKEgwKBNjYldHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z3CGXIC/IxcwdCev9nOF03Da5W60Imix4qfJrJURZY=;
 b=KQI+hPMi6/Vd6QaVNCVsJaCUM7klwj19QIEAU2H4OgdD4KbpOMrDm0GYhphS2Cojvf5XNfMfgncyIMNPsTXD5obMYle/0JTO3w42iLzuxjwQ/m08sBaPi8dcrAHzrrnGV8R4q7q10MlEMyO3j2lg87+rHHN0ET852iREV+F7Fko9wZdR8EeKM9yeISkrvCdm2CF8jHO3TSH98DCTlM8mLn/wFEGMMYUL7Iry6J410e+qrU16HuqM2h7vaXhVjuk21vjYMmQs88UmUL41ltZ9Z31ieIPm/VOrJ6kp9sBSpMVyxbqq+iL+MVdLKqhJ7D3hEilnT4C3adv+Nsc1OFxoqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4077.namprd12.prod.outlook.com (52.135.50.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Tue, 29 Oct 2019 09:33:14 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::3db4:a949:8b89:33be]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::3db4:a949:8b89:33be%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 09:33:14 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "StDenis, Tom"
 <Tom.StDenis@amd.com>, "xywang.sjtu@sjtu.edu.cn" <xywang.sjtu@sjtu.edu.cn>,
 "Xiao, Jack" <Jack.Xiao@amd.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: amd: amdgpu: Remove NULL check not needed before
 freeing functions
Thread-Topic: [PATCH] drm: amd: amdgpu: Remove NULL check not needed before
 freeing functions
Thread-Index: AQHVjjoHIAB4wkrfs0irqM/KindPaqdxWa8x
Date: Tue, 29 Oct 2019 09:33:14 +0000
Message-ID: <MN2PR12MB329687D0CBC265443C4A667AA2610@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20191029091943.GA10258@saurav>
In-Reply-To: <20191029091943.GA10258@saurav>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f2feec9a-7e07-4e3a-e01c-08d75c5305c9
x-ms-traffictypediagnostic: MN2PR12MB4077:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB407743BF5C9C1CA581E8447FA2610@MN2PR12MB4077.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(189003)(199004)(478600001)(256004)(19627405001)(105004)(8676002)(6436002)(186003)(74316002)(4326008)(45080400002)(33656002)(25786009)(7736002)(486006)(8936002)(71200400001)(71190400001)(11346002)(86362001)(81156014)(446003)(2201001)(476003)(14444005)(81166006)(66066001)(2171002)(6246003)(229853002)(66446008)(54896002)(76116006)(66476007)(64756008)(9686003)(52536014)(2906002)(3846002)(316002)(7696005)(6116002)(6506007)(66556008)(76176011)(53546011)(66946007)(55016002)(99286004)(5660300002)(14454004)(110136005)(26005)(102836004)(2501003)(91956017)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4077;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zqI3tM0uGKZDoYGEguOxH6XYYCNCl042bosZVrhiRBHiw/k3Ff1ucUArKR9yPM+BcoBOivi1V33bjUwIFzxlK4gbXM3a0GBHijNePWJlbmfELKXMc1y1P4ese8yf+eJVY4pc1HMt3Zp7jkn6GLBamcdRlnw84/k6oS51QcLaKW8taN43jYX0YO6OzLX115dCOxGoPACbZiPRO87PB/dDCcksd7mGXItHMNYw8sjl9ZBRpj0s2Vu/+LHsIuldFPB+wj5yCM1N64rtq8HYGuNjr3o8ndY8gPba//RA6PpATCoQmibg6XLgDfHF2SIzBlINP8VyaensRB5nKjnBzcsahhaUsESD8Bk1ysxnBqBFEWeUSz2QVmzdPhmfEtJBQEl09XcmAJyHShlaaFC0q2yfr3XJIStR99Jl8o+K+026cSWB4ajWjvtTGbUjMl3bWKVW
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2feec9a-7e07-4e3a-e01c-08d75c5305c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 09:33:14.3782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eq+OYqYuIEF8AGZkDtaMf7qwKYMFf/3hoGYWn4/0wRAp6fhMRz2xvdwVc5WP5QXs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z3CGXIC/IxcwdCev9nOF03Da5W60Imix4qfJrJURZY=;
 b=sPRsqNMDPz5Y/SVzOKNCLnfwMNXznEbKTqCGg60hcpNQNAsuU3rxsmvmRnEWJaeGPdZypGY8KKvIswSNkr7oUqPWoJdxilsbSuwoktA7Qf5Ep3m/h3fkNefK1xMXs+no4eHwEdZbyOpmdMkUOze13vepLZJQytR48OWWWJytZcs=
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
Cc: "saurav.girepunje@hotmail.com" <saurav.girepunje@hotmail.com>
Content-Type: multipart/mixed; boundary="===============0852697260=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0852697260==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329687D0CBC265443C4A667AA2610MN2PR12MB3296namp_"

--_000_MN2PR12MB329687D0CBC265443C4A667AA2610MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Saurav,

the driver already has the same fix patch,
you can pull the latest driver tree and check it again,
thanks.

From 2032324682c1ca563e33c56e51d9ae17a2b38105 Mon Sep 17 00:00:00 2001
From: zhong jiang <zhongjiang@huawei.com>
Date: Tue, 3 Sep 2019 14:15:05 +0800
Subject: [PATCH] drm/amdgpu: remove the redundant null checks

debugfs_remove and kfree has taken the null check in account.
hence it is unnecessary to check it. Just remove the condition.
No functional change.

This issue was detected by using the Coccinelle software.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Best Regards,
Kevin
________________________________
From: Saurav Girepunje <saurav.girepunje@gmail.com>
Sent: Tuesday, October 29, 2019 5:19 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Zhou, David(ChunMing) <David1.Zhou@amd.com>; airlied=
@linux.ie <airlied@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>; StDenis, T=
om <Tom.StDenis@amd.com>; xywang.sjtu@sjtu.edu.cn <xywang.sjtu@sjtu.edu.cn>=
; Xiao, Jack <Jack.Xiao@amd.com>; sam@ravnborg.org <sam@ravnborg.org>; Wang=
, Kevin(Yang) <Kevin1.Wang@amd.com>; saurav.girepunje@gmail.com <saurav.gir=
epunje@gmail.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop=
.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; l=
inux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
Cc: saurav.girepunje@hotmail.com <saurav.girepunje@hotmail.com>
Subject: [PATCH] drm: amd: amdgpu: Remove NULL check not needed before free=
ing functions

Remove unneeded NULL check before freeing functions
kfree and debugfs_remove.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_debugfs.c
index 5652cc72ed3a..cb94627fc0f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1077,8 +1077,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 =
val)

         ttm_bo_unlock_delayed_workqueue(&adev->mman.bdev, resched);

-       if (fences)
-               kfree(fences);
+       kfree(fences);

         return 0;
 }
@@ -1103,8 +1102,7 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)

 void amdgpu_debugfs_preempt_cleanup(struct amdgpu_device *adev)
 {
-       if (adev->debugfs_preempt)
-               debugfs_remove(adev->debugfs_preempt);
+       debugfs_remove(adev->debugfs_preempt);
 }

 #else
--
2.20.1


--_000_MN2PR12MB329687D0CBC265443C4A667AA2610MN2PR12MB3296namp_
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
Hi Saurav,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
the driver already has the same fix patch,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
you can pull the latest driver tree and check it again,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
thanks.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Courier New&quot;, monospace;"><i>From 20=
32324682c1ca563e33c56e51d9ae17a2b38105 Mon Sep 17 00:00:00 2001</i></span><=
span><i><br>
</i></span>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace;"><i>Fr=
om: zhong jiang &lt;zhongjiang@huawei.com&gt;</i></span><i><br>
</i></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace;"><i>Da=
te: Tue, 3 Sep 2019 14:15:05 &#43;0800</i></span><i><br>
</i></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace;"><i>Su=
bject: [PATCH] drm/amdgpu: remove the redundant null checks</i></span><i><b=
r>
</i></div>
<div><i><br>
</i></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace;"><i>de=
bugfs_remove and kfree has taken the null check in account.</i></span><i><b=
r>
</i></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace;"><i>he=
nce it is unnecessary to check it. Just remove the condition.</i></span><i>=
<br>
</i></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace;"><i>No=
 functional change.</i></span><i><br>
</i></div>
<div><i><br>
</i></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace;"><i>Th=
is issue was detected by using the Coccinelle software.</i></span><i><br>
</i></div>
<div><i><br>
</i></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace;"><i>Si=
gned-off-by: zhong jiang &lt;zhongjiang@huawei.com&gt;</i></span><i><br>
</i></div>
<i><span style=3D"font-family: &quot;Courier New&quot;, monospace;">Signed-=
off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;</span><br>
</i></div>
<i><span></span></i>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Best Regards,</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Saurav Girepunje &lt;=
saurav.girepunje@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, October 29, 2019 5:19 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Ch=
ristian &lt;Christian.Koenig@amd.com&gt;; Zhou, David(ChunMing) &lt;David1.=
Zhou@amd.com&gt;; airlied@linux.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.c=
h &lt;daniel@ffwll.ch&gt;; StDenis, Tom &lt;Tom.StDenis@amd.com&gt;;
 xywang.sjtu@sjtu.edu.cn &lt;xywang.sjtu@sjtu.edu.cn&gt;; Xiao, Jack &lt;Ja=
ck.Xiao@amd.com&gt;; sam@ravnborg.org &lt;sam@ravnborg.org&gt;; Wang, Kevin=
(Yang) &lt;Kevin1.Wang@amd.com&gt;; saurav.girepunje@gmail.com &lt;saurav.g=
irepunje@gmail.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.fre=
edesktop.org&gt;;
 dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; l=
inux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;<br>
<b>Cc:</b> saurav.girepunje@hotmail.com &lt;saurav.girepunje@hotmail.com&gt=
;<br>
<b>Subject:</b> [PATCH] drm: amd: amdgpu: Remove NULL check not needed befo=
re freeing functions</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Remove unneeded NULL check before freeing function=
s<br>
kfree and debugfs_remove.<br>
<br>
Signed-off-by: Saurav Girepunje &lt;saurav.girepunje@gmail.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 &#43;&#43;----<br>
&nbsp;1 file changed, 2 insertions(&#43;), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_debugfs.c<br>
index 5652cc72ed3a..cb94627fc0f4 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c<br>
@@ -1077,8 &#43;1077,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, =
u64 val)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_unlock_delayed_work=
queue(&amp;adev-&gt;mman.bdev, resched);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fences)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; kfree(fences);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(fences);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
@@ -1103,8 &#43;1102,7 @@ int amdgpu_debugfs_init(struct amdgpu_device *ade=
v)<br>
&nbsp;<br>
&nbsp;void amdgpu_debugfs_preempt_cleanup(struct amdgpu_device *adev)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;debugfs_preempt)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; debugfs_remove(adev-&gt;debugfs_preempt);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_remove(adev-&gt;debugfs_p=
reempt);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;#else<br>
-- <br>
2.20.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB329687D0CBC265443C4A667AA2610MN2PR12MB3296namp_--

--===============0852697260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0852697260==--
