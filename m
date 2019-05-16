Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A520403
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 13:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7881989385;
	Thu, 16 May 2019 11:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710075.outbound.protection.outlook.com [40.107.71.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D6889385
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 11:03:37 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3376.namprd12.prod.outlook.com (20.178.240.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Thu, 16 May 2019 11:03:36 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9daa:c9ea:c94e:ae45]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9daa:c9ea:c94e:ae45%3]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 11:03:36 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re:[PATCH libdrm] enable syncobj test depending on capability
Thread-Topic: Re:[PATCH libdrm] enable syncobj test depending on capability
Thread-Index: AQHVC9S26afyd2i5ZUioEtn386aMRaZtkvsAgAADYCE=
Date: Thu, 16 May 2019 11:03:36 +0000
Message-ID: <-yw2q6u7xkjpo-i83eg9msudz1wgjn7w-b101h0-sfv5ag1noxjz2wg54r-iuw7ml-f519uls55cqypexnfa-et96uc-nx96jg5fu1d3-wn1hxg-td9bpo5n1nbv-wmnwfr84y609mm8lnpxqaf92-n4k5l3.1558004611599@email.android.com>
References: <20190516104642.21450-1-david1.zhou@amd.com>,
 <278437b6-c5f0-209b-443b-573b4143f944@amd.com>
In-Reply-To: <278437b6-c5f0-209b-443b-573b4143f944@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [112.64.119.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d15dc7b1-ebd5-45ee-7a5e-08d6d9ee24fa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3376; 
x-ms-traffictypediagnostic: MN2PR12MB3376:
x-microsoft-antispam-prvs: <MN2PR12MB337663199AE092C16ADE00B5B40A0@MN2PR12MB3376.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:357;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(366004)(396003)(136003)(346002)(199004)(13464003)(189003)(2501003)(102836004)(7736002)(64756008)(316002)(186003)(54896002)(6512007)(26005)(8936002)(8676002)(6436002)(3846002)(6116002)(66066001)(476003)(91956017)(446003)(11346002)(81156014)(9686003)(6486002)(66556008)(66476007)(66946007)(73956011)(76116006)(53936002)(66446008)(486006)(99286004)(2906002)(25786009)(5660300002)(72206003)(76176011)(478600001)(68736007)(71200400001)(71190400001)(6506007)(14454004)(86362001)(81166006)(256004)(110136005)(87826002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3376;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ifIUBLYvfDkLgqdMloWGblNpzBzCNYO5x14ZQmIqjGQ47A55VX6pvNl5+qj9okStyYxVcy3XOzvycdjASRlSwvjH2YaDqsQSLx19QTIcn3uOyzvR5LmEvrFiojiMRFkxrwO7b1wnU/QuJDcX/hLFf1uE1XR4AJOg1Xl/VoW4BVmmq20TgyvSKpM9Eo1jKQRCkTs8mBgX/wtJp9nEkA7BllxknplrspXZwjecm4yk2v98opJyk5xmC6SPaXz5QSUACUf1HpF9L6UjLk1DvsY1SUVG+Jm+OhsbnKEpf/iYiJfUbX+5sqrdewpfG7sIS+PPbz7SW3M7ysJONiy70zNhRSicFtVchGRxoc7Wy74TJ2Ys3iZbyW0GVC2969LMMWhp99BDiaBwANyd3HWUqndJR+dcvpmpF8b1vHuyRLHd1fw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15dc7b1-ebd5-45ee-7a5e-08d6d9ee24fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 11:03:36.3141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3376
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2KgGn5AxEJkYy0E45PdMQ7NvrzS+tEDXJx0NVsrob4=;
 b=4TCpBRNbC0aNoTR5LMTi5aLloA/fp34sjLIHXKrF/XRYqKZMSXLNOIzkSUDSEphz/Yua0+fc1V7qLCJgMAQaMXT8xOANt9CFvCGUQfgtqr2im/vJDphUCDr0tjkc4a/DyMFrRbz/mv+V5FytmBNA0wrgfZPMRdxtRdvWb0isyqE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0198026322=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0198026322==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_yw2q6u7xkjpoi83eg9msudz1wgjn7wb101h0sfv5ag1noxjz2wg54ri_"

--_000_yw2q6u7xkjpoi83eg9msudz1wgjn7wb101h0sfv5ag1noxjz2wg54ri_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

could you help push this patch as well?

Thanks,
-David

-------- Original Message --------
Subject: Re: [PATCH libdrm] enable syncobj test depending on capability
From: "Koenig, Christian"
To: "Zhou, David(ChunMing)" ,dri-devel@lists.freedesktop.org
CC:

Am 16.05.19 um 12:46 schrieb Chunming Zhou:
> Feature is controlled by DRM_CAP_SYNCOBJ_TIMELINE drm capability.
>
> Signed-off-by: Chunming Zhou <david1.zhou@amd.com>

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

> ---
>   include/drm/drm.h            | 1 +
>   tests/amdgpu/syncobj_tests.c | 8 ++++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/include/drm/drm.h b/include/drm/drm.h
> index c893f3b4..532787bf 100644
> --- a/include/drm/drm.h
> +++ b/include/drm/drm.h
> @@ -643,6 +643,7 @@ struct drm_gem_open {
>   #define DRM_CAP_PAGE_FLIP_TARGET    0x11
>   #define DRM_CAP_CRTC_IN_VBLANK_EVENT        0x12
>   #define DRM_CAP_SYNCOBJ             0x13
> +#define DRM_CAP_SYNCOBJ_TIMELINE     0x14
>
>   /** DRM_IOCTL_GET_CAP ioctl argument type */
>   struct drm_get_cap {
> diff --git a/tests/amdgpu/syncobj_tests.c b/tests/amdgpu/syncobj_tests.c
> index a0c627d7..869ed88e 100644
> --- a/tests/amdgpu/syncobj_tests.c
> +++ b/tests/amdgpu/syncobj_tests.c
> @@ -22,6 +22,7 @@
>   */
>
>   #include "CUnit/Basic.h"
> +#include "xf86drm.h"
>
>   #include "amdgpu_test.h"
>   #include "amdgpu_drm.h"
> @@ -36,6 +37,13 @@ static void amdgpu_syncobj_timeline_test(void);
>
>   CU_BOOL suite_syncobj_timeline_tests_enable(void)
>   {
> +     int r;
> +     uint64_t cap =3D 0;
> +
> +     r =3D drmGetCap(drm_amdgpu[0], DRM_CAP_SYNCOBJ_TIMELINE, &cap);
> +     if (r || cap =3D=3D 0)
> +             return CU_FALSE;
> +
>        return CU_TRUE;
>   }
>


--_000_yw2q6u7xkjpoi83eg9msudz1wgjn7wb101h0sfv5ag1noxjz2wg54ri_
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
<div>could you help push this patch as well?<br>
<br>
Thanks,<br>
-David<br>
<br>
-------- Original Message --------<br>
Subject: Re: [PATCH libdrm] enable syncobj test depending on capability<br>
From: &quot;Koenig, Christian&quot; <br>
To: &quot;Zhou, David(ChunMing)&quot; ,dri-devel@lists.freedesktop.org<br>
CC: <br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Am 16.05.19 um 12:46 schrieb Chunming Zhou:<br>
&gt; Feature is controlled by DRM_CAP_SYNCOBJ_TIMELINE drm capability.<br>
&gt;<br>
&gt; Signed-off-by: Chunming Zhou &lt;david1.zhou@amd.com&gt;<br>
<br>
Reviewed-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; include/drm/drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<br>
&gt;&nbsp;&nbsp; tests/amdgpu/syncobj_tests.c | 8 &#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; 2 files changed, 9 insertions(&#43;)<br>
&gt;<br>
&gt; diff --git a/include/drm/drm.h b/include/drm/drm.h<br>
&gt; index c893f3b4..532787bf 100644<br>
&gt; --- a/include/drm/drm.h<br>
&gt; &#43;&#43;&#43; b/include/drm/drm.h<br>
&gt; @@ -643,6 &#43;643,7 @@ struct drm_gem_open {<br>
&gt;&nbsp;&nbsp; #define DRM_CAP_PAGE_FLIP_TARGET&nbsp;&nbsp;&nbsp; 0x11<br=
>
&gt;&nbsp;&nbsp; #define DRM_CAP_CRTC_IN_VBLANK_EVENT&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 0x12<br>
&gt;&nbsp;&nbsp; #define DRM_CAP_SYNCOBJ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x13<br>
&gt; &#43;#define DRM_CAP_SYNCOBJ_TIMELINE&nbsp;&nbsp;&nbsp;&nbsp; 0x14<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /** DRM_IOCTL_GET_CAP ioctl argument type */<br>
&gt;&nbsp;&nbsp; struct drm_get_cap {<br>
&gt; diff --git a/tests/amdgpu/syncobj_tests.c b/tests/amdgpu/syncobj_tests=
.c<br>
&gt; index a0c627d7..869ed88e 100644<br>
&gt; --- a/tests/amdgpu/syncobj_tests.c<br>
&gt; &#43;&#43;&#43; b/tests/amdgpu/syncobj_tests.c<br>
&gt; @@ -22,6 &#43;22,7 @@<br>
&gt;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #include &quot;CUnit/Basic.h&quot;<br>
&gt; &#43;#include &quot;xf86drm.h&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #include &quot;amdgpu_test.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;amdgpu_drm.h&quot;<br>
&gt; @@ -36,6 &#43;37,13 @@ static void amdgpu_syncobj_timeline_test(void);=
<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; CU_BOOL suite_syncobj_timeline_tests_enable(void)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t cap =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; r =3D drmGetCap(drm_amdgpu[0], DRM_CAP_S=
YNCOBJ_TIMELINE, &amp;cap);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (r || cap =3D=3D 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return CU_FALSE;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return CU_TRUE;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
<br>
</div>
</span></font>
</body>
</html>

--_000_yw2q6u7xkjpoi83eg9msudz1wgjn7wb101h0sfv5ag1noxjz2wg54ri_--

--===============0198026322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0198026322==--
