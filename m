Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B25401518
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 04:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC4E89AB3;
	Mon,  6 Sep 2021 02:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8965A89AAD;
 Mon,  6 Sep 2021 02:55:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uiuvr8uQy91uvDoISPKYbQwdJ3/fXnmiDLpNqsjBJOcje7nrHkUpj4QLzNhMG+A99dDeUs8m8QUOOt591psogosAQZclAlRZYnh3ld7N1h8z4+1IknikfyFr4Wb+4UdiCSdI6vgXBLE3TMqlFZbMKxolBcBimc/Oym1N8+tE1vpAmwCDThoaprsI+Li8TrXRkG9B6wFSzqDerXB8zivWuDpAiEXzEanJyHkxIUJWJofb/BFetInb9ia6S3yfUCSbNKmMKx5z40IGoV4YKykNF1m2LR5CbMvniZCjr2WCXTDv70Y7avfc5+F8w6B6eRMVe/gD4AB5bObVwLnyIRZ7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=XxU2QPXxVGchcNWMb3gUEL3CkFZkN1wprRHxhztEhXY=;
 b=FMDvFX3fveUWnxXIEyUVhl3zlW62CyirOs3Ex26+R41EZbdIGpvlWnQi0L+dotcyjlEyTQIioP215JcdHaNgiyIjvPyLDf4Pr9dl8W3HH1HZduTZuTCAmJYFCDV7pmSjNv/jNorea2nrgxCJl1SAUSn1u1a4yAAJaeAKdT06vnU2EbWscLcwip32vigXb94veCiQNFCT7srPAXnuP+8W2NTfJaYqpPrVNnju+AYe0Z3m5IpSBeUkrVnFSR7G8cuSNUBD/bQgTV7GH37JGFTEaRgHwBblVqFphmQZbsYMFRSHKTVlx/1c+WNkuL0iNa5OmFsBDdmatNuBrO4II5h7qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxU2QPXxVGchcNWMb3gUEL3CkFZkN1wprRHxhztEhXY=;
 b=5Dji2cKbLn9j3czROB0r4qibeKI0VI8fSAIPTtHnPdsb5ZLeR2cilMLFL6GRF+hSt/kePN+nqRzWJYKlMq/M6/zjuzgTRr7gEw69ufM7GTGlbC93MoHsVUgqayZt4dI3V1CwN5Wv89jdP1D7lr4ry0RTjuV9XpXzBB/LbJxQozU=
Received: from CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 by CO6PR12MB5393.namprd12.prod.outlook.com (2603:10b6:5:356::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Mon, 6 Sep
 2021 02:55:34 +0000
Received: from CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::b87e:9edf:b7fc:68a6]) by CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::b87e:9edf:b7fc:68a6%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 02:55:34 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "chenli@uniontech.com" <chenli@uniontech.com>
Subject: Re: [PATCH v2 2/2] drm/amdpgu: Use VRAM domain in UVD IB test
Thread-Topic: [PATCH v2 2/2] drm/amdpgu: Use VRAM domain in UVD IB test
Thread-Index: AQHXorvQyBdrKYEtM0WaAd5AOAc+z6uWTyrQ
Date: Mon, 6 Sep 2021 02:55:34 +0000
Message-ID: <CO6PR12MB547336E26E78BE1A014410B1A2D29@CO6PR12MB5473.namprd12.prod.outlook.com>
References: <DM4PR12MB516520B50E5C61FD3C23D9CC87D29@DM4PR12MB5165.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB516520B50E5C61FD3C23D9CC87D29@DM4PR12MB5165.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-06T02:55:32.963Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d95d58b4-1810-4018-82a5-08d970e1cc12
x-ms-traffictypediagnostic: CO6PR12MB5393:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR12MB539312870140975807ADD03EA2D29@CO6PR12MB5393.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:92;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XrO+IY7LMsgP5sddxnzKG64zfInLm12uYwuJW9vWgY44qxwmvSdDLWcXWYSUC4gX+Sgkk/FvUWtLf/XczLnIz7/6l5ULGIBZNbDsji4zXD/8Q3D6eXE6FaifA5cs9/YK26X2ieE07lEUSbYhJQPK06tCl/mc+Y/951eqSLdgofTe/xtgLIxWgisAQGFh54/C6RhRjt9EvKMRxviHxmkUdaM5HgDVngjddH6n7XOKoDWPJdCe6gCT4PxhSgvP+s6zWow7bREv4zxpr1lXMlyVR5fiyOxNllgF1IR2FTM21cv+fCXen+gpF51zGMgUKekJdXZz1mtycDpEAPMNFdeJR9po+weIDGROyYtoK0r66a4bIf6YI5RfdQJMIV5iLYxmUgbYc2D+Jv7rpcAWKQ5WdjBD2i23yzMXah6njorYaWf+pJwQHbCFnH/9H0LHLs2qEisTfQzWLcSc+b3pmfzxT4TJlmN14OfJfhBFn7v+pz4ojywLRWZQHPhqxeGreY3kbscvYbQqM2baHDXtDNTGKXewsDPJ4TITlfAHT0ZhtxR+5CHxvQgynbnLIkDlzTpBXM1oo9lX9CG6flr/on8VtEU/VGmEuNBKmXTthtLvK0gkzgfDu4FjWjtaqPlLKqD7sEHu+mKVNrxWTxz0mU2Q/d8B0MaKpjoHYvJIJguIfJq5sCQq614GhyHN/VuQ8BwMKOb7RSLBch7oh29lwFnRRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(8676002)(55016002)(19627405001)(52536014)(33656002)(64756008)(8936002)(76116006)(91956017)(66446008)(66556008)(66476007)(66946007)(38100700002)(86362001)(110136005)(54906003)(71200400001)(508600001)(5660300002)(186003)(26005)(38070700005)(53546011)(6506007)(2906002)(7696005)(9686003)(122000001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Qv47Xu7SyXf1Pciu3EA3egIQjNjFVoVzFQ8WkswMfIGsc0XbMMafGG/npR?=
 =?iso-8859-1?Q?BZNriz4a+9upOOyMHnlic6dXXmANa/f9IfJuuYT3XaLXKlB3K5Sa10v6R8?=
 =?iso-8859-1?Q?zEaYyuwNpP9l6bfhl9c3lg/hTFUj2qqn5ppqFWW+afPGKUYoOBeTPv1o85?=
 =?iso-8859-1?Q?x6yO9+NB0C9p0zPrI63zqeK4mjGmU8uY2sherHf0Pa2qD9p8UT5IGB4ztL?=
 =?iso-8859-1?Q?Cw4PpxYBJVCg+Jv5jnD+C19QZc9c4+nJgj47IOZ3Jp0rlTOdn6xiCLV4S8?=
 =?iso-8859-1?Q?g5RiMzpYr6B8zXHlPKm1VTWc6+A3J7lz/Tij4siW9OzFEnhDlLFNuf9cKw?=
 =?iso-8859-1?Q?WXU7oVfSpLi+quPJU0NUNxMiB6kQjPmpmnTA3dQU71TtcML/H2K+0DLciZ?=
 =?iso-8859-1?Q?w3ksrVpwq/cAaIY5Vr3DyriNc80zyHZX6XnqLu20h2wAv7hXHR4T76feul?=
 =?iso-8859-1?Q?sr0NVPFKdXxPeGj2Q0cNo3InXSiDG1eeefJ9aqHSU4/0BTHQC1pAnDMpQN?=
 =?iso-8859-1?Q?5WVV2p0pZZdS5cnIcER7tGyjddTqyGwhdbna6CecqpecpTV4i7NL+e3MbT?=
 =?iso-8859-1?Q?pghCjWkHwJpQfGidSzMw0XXVXsfVH08/Hrz0+V1o1GOSXAlaZlXpqGE0rT?=
 =?iso-8859-1?Q?mudoq5H6EqE4zDC5XXod7SB6bJji2wYKDI2B4cf9i1niw2Ce5dXjpEznbF?=
 =?iso-8859-1?Q?1gBv4s49R6hqwQCZjNqe6cWq+CSgA5g2Ea4VommAJc/PttKpq3lkyLCYsU?=
 =?iso-8859-1?Q?RgAYvzdm/+O6bv0e1PerBTumbXqsYjcOkjtiqRHGk1pthSYyR9iCCSmyFc?=
 =?iso-8859-1?Q?hoLYRZTAS+/4Au5BzrCqv2Erqdr3kORJFOAqvyMK4u1lhWTaD12gIlLbgr?=
 =?iso-8859-1?Q?oXfioIi5vyTMW0QzAJcam2gvXDShB25lMKlJKP9kTGjzxTDcDAVF0cZO2C?=
 =?iso-8859-1?Q?Ex+oVga75qh8Vl39uI2kq4nahqcnT8ygtO+uD21tlmF+co+yPwrXgX6Xek?=
 =?iso-8859-1?Q?po62c7KE4LFPylWMlYkb0/phSEgcKzHVrUjVuVYqYzLJa5grB5xYTdDeMU?=
 =?iso-8859-1?Q?4v7N2U1hGR6PaE5fW8TtpH26IU+fS2u16vrYrR4YA+72eAm6xYxslyoV5n?=
 =?iso-8859-1?Q?51YN0yrvubceSpO7aE+7SkpP9/EptPZCKzCuXWPlVzzg4hXqLbHnyLCFko?=
 =?iso-8859-1?Q?X7ywCKDO+gUCa16CNYh3nBsY9/vHgSgxgWbCVaMeMK0PNdatCsW+JY9ArW?=
 =?iso-8859-1?Q?gfn3oVr1vJdD4gXFbPD9hvRn7huZGA4EQqzWzG6kv283LzMkqKh5KGREUx?=
 =?iso-8859-1?Q?UMmKurwAMVlsnqrFBFqK5jLq0zY1SRONPQ8wC+wI1gFKeIBd4V53coJY2E?=
 =?iso-8859-1?Q?9O+694n457?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB547336E26E78BE1A014410B1A2D29CO6PR12MB5473namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95d58b4-1810-4018-82a5-08d970e1cc12
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 02:55:34.1421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+pL9LDSD4RW3591MAb4Erhh9HqTf3mUTg3mC/rYAhvNF0+0hkS23n4Vwb2zl7/P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5393
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_CO6PR12MB547336E26E78BE1A014410B1A2D29CO6PR12MB5473namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]



________________________________
From: dri-devel <dri-devel-bounces@lists.freedesktop.org> on behalf of Pan,=
 Xinhui <Xinhui.Pan@amd.com>
Sent: Monday, September 6, 2021 9:10 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Cc: Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander <Alexa=
nder.Deucher@amd.com>; chenli@uniontech.com <chenli@uniontech.com>
Subject: [PATCH v2 2/2] drm/amdpgu: Use VRAM domain in UVD IB test

[AMD Official Use Only]

[AMD Official Use Only]

Like vce/vcn does, visible VRAM is OK for ib test.
While commit a11d9ff3ebe0 ("drm/amdgpu: use GTT for
uvd_get_create/destory_msg") says VRAM is not mapped correctly in his
platform which is likely an arm64.

So lets change back to use VRAM on x86_64 platform.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_uvd.c
index d451c359606a..e4b75f33ccc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1178,7 +1178,11 @@ int amdgpu_uvd_get_create_msg(struct amdgpu_ring *ri=
ng, uint32_t handle,
        int r, i;

        r =3D amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
+#ifdef CONFIG_X86_64
[kevin]:
It's better to replace this with macro of CONFIG_64BIT to cover more cases,
do you think it is ok ?

Best Regards,
Kevin

+                                     AMDGPU_GEM_DOMAIN_VRAM,
+#else
                                      AMDGPU_GEM_DOMAIN_GTT,
+#endif
                                      &bo, NULL, (void **)&msg);
        if (r)
                return r;
@@ -1210,7 +1214,11 @@ int amdgpu_uvd_get_destroy_msg(struct amdgpu_ring *r=
ing, uint32_t handle,
        int r, i;

        r =3D amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
+#ifdef CONFIG_X86_64
+                                     AMDGPU_GEM_DOMAIN_VRAM,
+#else
                                      AMDGPU_GEM_DOMAIN_GTT,
+#endif
                                      &bo, NULL, (void **)&msg);
        if (r)
                return r;
--
2.25.1


--_000_CO6PR12MB547336E26E78BE1A014410B1A2D29CO6PR12MB5473namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
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
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> dri-devel &lt;dri-dev=
el-bounces@lists.freedesktop.org&gt; on behalf of Pan, Xinhui &lt;Xinhui.Pa=
n@amd.com&gt;<br>
<b>Sent:</b> Monday, September 6, 2021 9:10 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;<br>
<b>Cc:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Deucher, Ale=
xander &lt;Alexander.Deucher@amd.com&gt;; chenli@uniontech.com &lt;chenli@u=
niontech.com&gt;<br>
<b>Subject:</b> [PATCH v2 2/2] drm/amdpgu: Use VRAM domain in UVD IB test</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">[AMD Official Use Only]<br>
<br>
[AMD Official Use Only]<br>
<br>
Like vce/vcn does, visible VRAM is OK for ib test.<br>
While commit a11d9ff3ebe0 (&quot;drm/amdgpu: use GTT for<br>
uvd_get_create/destory_msg&quot;) says VRAM is not mapped correctly in his<=
br>
platform which is likely an arm64.<br>
<br>
So lets change back to use VRAM on x86_64 platform.<br>
<br>
Signed-off-by: xinhui pan &lt;xinhui.pan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 8 ++++++++<br>
&nbsp;1 file changed, 8 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_uvd.c<br>
index d451c359606a..e4b75f33ccc8 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c<br>
@@ -1178,7 +1178,11 @@ int amdgpu_uvd_get_create_msg(struct amdgpu_ring *ri=
ng, uint32_t handle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r, i;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_create_reserved(=
adev, 1024, PAGE_SIZE,<br>
+#ifdef CONFIG_X86_64</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText">It's better to replace this with macro of <b>CONFI=
G_64BIT</b> to cover more cases,</div>
<div class=3D"PlainText">do you think it is ok ?</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Best Regards,</div>
<div class=3D"PlainText">Kevin</div>
<div class=3D"PlainText"><br>
<span></span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; AMDGPU_GEM_DOMAIN_VRAM,<br>
+#else<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AM=
DGPU_GEM_DOMAIN_GTT,<br>
+#endif<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &a=
mp;bo, NULL, (void **)&amp;msg);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return r;<br>
@@ -1210,7 +1214,11 @@ int amdgpu_uvd_get_destroy_msg(struct amdgpu_ring *r=
ing, uint32_t handle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r, i;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_create_reserved(=
adev, 1024, PAGE_SIZE,<br>
+#ifdef CONFIG_X86_64<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_=
GEM_DOMAIN_VRAM,<br>
+#else<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AM=
DGPU_GEM_DOMAIN_GTT,<br>
+#endif<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &a=
mp;bo, NULL, (void **)&amp;msg);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return r;<br>
--<br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CO6PR12MB547336E26E78BE1A014410B1A2D29CO6PR12MB5473namp_--
