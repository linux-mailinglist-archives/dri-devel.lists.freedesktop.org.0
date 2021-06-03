Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D031439AD69
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 00:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A628F6F516;
	Thu,  3 Jun 2021 22:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C6B6F516;
 Thu,  3 Jun 2021 22:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5ZgkHx6Gh123/aefmwTYvy8pDU4QeurjaEn+IX3bqcDNOWltsY22reZxJJmr43KmMkDRNG4uKsb4WwvBnUQZVeM2jWwa7M9aoyW7W/QRJ9hsG/f1PU815AJRyxOFYqWh9JnZgE7hZnxX4AYKlCJbS5Vz43gcLPKmPCoMGCdU06G3Qpr9+yL/1sB2yk+VvBAgAlKFJGUkL4i8MoqAk2fycwlVmKllut94BnjUOCo2VWAo8uAFgFZg7GYq8LGZtLsr1ddJ+BiVpt6YuBnZlbTshC+qLf9hJM1lHrQSetAwmBqgnZnHvSXscmc3pOPTOvKwszBr/4uaCnr37bm4imDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGxOQrUektKxpc2zRg6ZnXPQzNaMF2SQlhLMIppY3fk=;
 b=LRAWYpuL12+qdTh/0YvaljOqrPc0P8qF1+VyOlFFzbywuqbFdAY67ch7L5y5idy7b1Wj10Ydx49/OOsepwQYplnudq5TC5tLDLNe87eERE7MI1Bp4wLpxpai6uOC6QPeqX77Z174QXbIbcGV8PtlG404SM4DbkHJPiZh+TqZQ8auRPJzVFhAArH9Sf8HMol/xtZl92bYrDyE+/QnLr/F6WKoG2UbIlv+2bHUMlmBY3aqeYxpe0SmZhl8E16iAT+5RrUxIm1rUwHRKnx0wmaWy9h1mfpr0N60dy+mSsXO7OdKbvPUjdIqTKTBGBIKvAg7t2yn3vdoq3BSVpIIQv2a3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGxOQrUektKxpc2zRg6ZnXPQzNaMF2SQlhLMIppY3fk=;
 b=DgKF+k1rQUJlZn/BR6d4sbJTy9f3sZMmZofHGljBkhj0MkruYgVdGT6MSfM8FQvOBUCYR9esHlN23RPe67VMiDxLT+vx1EuKSE5lHFTQGNbJd71JIjsdMjuZRN5F6dzdOOSDzUGPiDRo1X4pzRlgs68bwEGlpldpiyl/yv9YFqc=
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2400.namprd12.prod.outlook.com (2603:10b6:802:2f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 3 Jun
 2021 22:02:40 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 22:02:40 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug fe goature
Thread-Topic: [PATCH 0/7] libdrm tests for hot-unplug fe goature
Thread-Index: AQHXWMQraihSVYDu7Ui0lJ5urwi5BQ==
Date: Thu, 3 Jun 2021 22:02:40 +0000
Message-ID: <SN6PR12MB46230F8575C786B53056FE79EA3C9@SN6PR12MB4623.namprd12.prod.outlook.com>
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>,
 <CADnq5_Nfs_j9XE1Siou2wGYuwd5cvTD1T7m9gFpS9z74D=AuAQ@mail.gmail.com>
In-Reply-To: <CADnq5_Nfs_j9XE1Siou2wGYuwd5cvTD1T7m9gFpS9z74D=AuAQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [199.119.233.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4686104d-5e11-4c78-7397-08d926db4e79
x-ms-traffictypediagnostic: SN1PR12MB2400:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB2400CD5FBC6C9B2E791BE14CEA3C9@SN1PR12MB2400.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 20praPVyg3thzzrQabCI/wnlH2g7+PU5x6f0gqIPZQraUj2Ym58TMD//rVECAlT6j1U2thmEzHL9XQzfGvA/oOoR0ZEn/+JWte/vboPPHLCNHYEpgh8hc8EV0ov4NeavBPQZYpPoMnXEIA9jmZ9Sh24aCUOmZHiuod8SyegqF37RRWlXaaHVQX9ru4A8hhNrJH1wounqIR0Gg9Nv0/grgwM2oTaJ1RGLvIP2begSaaCT4uHWJCF2Rh2unGPPcPr4/LV+Ud3gXQXKI/Y4gageaK2g9LB9/Ac6FkSWok4hnKEOMSd4G1B17PQWBTOgdkMTLG8wfn4sH4xKRkwC0bzkt0pkLIEohdw8eNUhfiLPwwb6O2XiYR+oxVr31RKIwnKIvc4sUIwd/0XdgtWkkxi6SwRYtB3N/fDyBMFEbJjac05K8XR5EnCAjXB4Zqqliqccb0n/mIhNeZALoWSnvRfnonnt7y3U0gchHRqWqGcXnXghrAk3hmE6mdrguGaN2ScNVQSDajGOxnKvVDDaFsrqQZXiFSGM64+VALpUV3xLyhMAHA2YH25VF+/dAvv8CPNrgjNvJJkTDVDzjsipJzeLKrx0cmr6bTFqYsjq3slb07g/KNv20SyasWm0p3lJHE6T
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(38100700002)(122000001)(9686003)(6916009)(26005)(186003)(45080400002)(2906002)(6506007)(66574015)(53546011)(55016002)(8936002)(71200400001)(966005)(86362001)(478600001)(7696005)(33656002)(316002)(4326008)(91956017)(54906003)(52536014)(166002)(66946007)(76116006)(8676002)(5660300002)(66446008)(66556008)(66476007)(83380400001)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?4Rv2yfTl7XLXynUVIoGP1X3r0suriXbPSXfKIhQnR8QfCIMb9/uyZphgq4?=
 =?iso-8859-1?Q?ZTNhgksSPnCXlez8zhXgOSf+mbFQ38i95SZCCjTNU2wh/6RTMi/CxXZUZv?=
 =?iso-8859-1?Q?8LSMSdj56C70C0VrWJHPfto3ljrtmllnOtCO3U1c3H6M4l3EIYnXrUQO/B?=
 =?iso-8859-1?Q?zDM6td4vlRdMw6M25hbcv9MX3W2rv52WPlsp8ygmPkVkebW2mGUl54PGLK?=
 =?iso-8859-1?Q?jHxGo+pDJJjqwPJUltQec2+EVVJNi2dMChRxcNhwj/3y720GPni9aO4w30?=
 =?iso-8859-1?Q?BWOVsnOpKCDHHkIRK+batQ1Xqt++eH68aDrpiATVhbyr5Gi7Yd8laRYDCl?=
 =?iso-8859-1?Q?D63UoKG+7nsB5B87WlA2dPdDLgePMwv9Ir8Bq9mQM+Y/jFNLJ+UReScvMa?=
 =?iso-8859-1?Q?dd/53sOd7MrbVDcx4b9RiQpFzdZYbo9sjfzNejIFebqEhCF2gJC4FixGiN?=
 =?iso-8859-1?Q?AyZvLYfSyKOitV6+p5tOzDQKaJdBaDfpI+Wkk9GD7TMK9+69Me2J0MMMf+?=
 =?iso-8859-1?Q?tEjlJ9/Pqk6I+TAlrdL8LCGFXjmzBJ7YuO/iYE9QEHFA1lOhwQ7lS5Tlf0?=
 =?iso-8859-1?Q?y0PqA5AlWT6Uztd1fm+4+3yVaadd2zyYghXZiq8nSsiBM8hQGv4/QIAVvJ?=
 =?iso-8859-1?Q?XOH2aSFAHEErMTtt3KsPsk/6Ph4zKK6O72rPbJKkIgds/tkLQwuIKfgzB9?=
 =?iso-8859-1?Q?U9QqoUsOSzTC2Au/+LbsnFTgRjp6T2gRsqbM5n2M7P1S4fYw517rfwLFs5?=
 =?iso-8859-1?Q?5Xs1Y1vB7XzImcJTKt74g135uTZbJn9IOxFRTDOi9iHXPd5lqMZdiGTCqq?=
 =?iso-8859-1?Q?u9J8ndL0jeUpMDiNnFSKk/oCjcfmheTlCSxRXnhjXEk5cVU8n5khZM1dMs?=
 =?iso-8859-1?Q?gjqm8YdadcxCzVzu5qcnK7qLrbygEYrUTGhP3FblrCVpvg15kJxXz/l6qP?=
 =?iso-8859-1?Q?gOk64/TKFiMg9JDVrlalLir0rC9g0XoQ9qvxuI3gXBYoOBzyqsdpfig5Wa?=
 =?iso-8859-1?Q?JY3eI2KNm4K54dQvu8cia8gzoHscVo3su+nKJJ5zCAFlnsnd+nXm5A2fWZ?=
 =?iso-8859-1?Q?8ZNGFpYbPzXjtqdPRqzyHh2pNHNqqLu8NXDLUlJr6NdOzggVjK99EcUHxB?=
 =?iso-8859-1?Q?sKI2NBTEUTw6GWONIp1dFICWp9P56sWFy/5zcaYa11zzfvmCMLJFhaTARe?=
 =?iso-8859-1?Q?UuR+cD9B52H5g6BVREeJIKCRtbcNCDwstlLIv1iyRkuxTxHkHJFTe9Y3Vz?=
 =?iso-8859-1?Q?JXl7gjoCyq040BeH7J2sS6j7nKAA3vmom3N1pni/YLK4nT4F3EGYbQHm3t?=
 =?iso-8859-1?Q?OrTtXu4vjDkdbz9r1w8ybbB4GVPe1wh/HDH1aqUvgjZW4O0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR12MB46230F8575C786B53056FE79EA3C9SN6PR12MB4623namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4686104d-5e11-4c78-7397-08d926db4e79
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 22:02:40.4222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: acao/NrCRXMAzLRMoluyKcfWX7GVblm4NaHTHnYhKvuUvywW76ZAfCtSWTEO3Tmo8yi9bCMtyLKIzBUbx8IYkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2400
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_SN6PR12MB46230F8575C786B53056FE79EA3C9SN6PR12MB4623namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is libdrm on gitlab ? I wasn't aware of this. I assumed code reviews still =
go through dri-devel.

Andrey

________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: 03 June 2021 17:20
To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx=
 list <amd-gfx@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deuche=
r@amd.com>; Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug feature

Please open a gitlab MR for these.

Alex

On Tue, Jun 1, 2021 at 4:17 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Adding some tests to acompany the recently added hot-unplug
> feature. For now the test suite is disabled until the feature
> propagates from drm-misc-next to drm-next.
>
> Andrey Grodzovsky (7):
>   tests/amdgpu: Fix valgrind warning
>   xf86drm: Add function to retrieve char device path
>   test/amdgpu: Add helper functions for hot unplug
>   test/amdgpu/hotunplug: Add test suite for GPU unplug
>   test/amdgpu/hotunplug: Add basic test
>   tests/amdgpu/hotunplug: Add unplug with cs test.
>   tests/amdgpu/hotunplug: Add hotunplug with exported bo test
>
>  tests/amdgpu/amdgpu_test.c     |  42 +++-
>  tests/amdgpu/amdgpu_test.h     |  26 +++
>  tests/amdgpu/basic_tests.c     |   5 +-
>  tests/amdgpu/hotunplug_tests.c | 357 +++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build       |   1 +
>  xf86drm.c                      |  23 +++
>  xf86drm.h                      |   1 +
>  7 files changed, 450 insertions(+), 5 deletions(-)
>  create mode 100644 tests/amdgpu/hotunplug_tests.c
>
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Candrey=
.grodzovsky%40amd.com%7C8fb7f614798b4d19572e08d926d57530%7C3dd8961fe4884e60=
8e11a82d994e183d%7C0%7C0%7C637583520507282588%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DozqlNQACGvLJugQ2GNvFl8CKgAH0thqMRpWjHpURlyc%3D&amp;reserved=3D0

--_000_SN6PR12MB46230F8575C786B53056FE79EA3C9SN6PR12MB4623namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
Is libdrm on gitlab ? I wasn't aware of this. I assumed code reviews still =
go through dri-devel.</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
<br>
</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
Andrey</div>
<div><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> 03 June 2021 17:20<br>
<b>To:</b> Grodzovsky, Andrey &lt;Andrey.Grodzovsky@amd.com&gt;<br>
<b>Cc:</b> Maling list - DRI developers &lt;dri-devel@lists.freedesktop.org=
&gt;; amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Deucher, Alexande=
r &lt;Alexander.Deucher@amd.com&gt;; Christian K=F6nig &lt;ckoenig.leichtzu=
merken@gmail.com&gt;<br>
<b>Subject:</b> Re: [PATCH 0/7] libdrm tests for hot-unplug feature</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Please open a gitlab MR for these.<br>
<br>
Alex<br>
<br>
On Tue, Jun 1, 2021 at 4:17 PM Andrey Grodzovsky<br>
&lt;andrey.grodzovsky@amd.com&gt; wrote:<br>
&gt;<br>
&gt; Adding some tests to acompany the recently added hot-unplug<br>
&gt; feature. For now the test suite is disabled until the feature<br>
&gt; propagates from drm-misc-next to drm-next.<br>
&gt;<br>
&gt; Andrey Grodzovsky (7):<br>
&gt;&nbsp;&nbsp; tests/amdgpu: Fix valgrind warning<br>
&gt;&nbsp;&nbsp; xf86drm: Add function to retrieve char device path<br>
&gt;&nbsp;&nbsp; test/amdgpu: Add helper functions for hot unplug<br>
&gt;&nbsp;&nbsp; test/amdgpu/hotunplug: Add test suite for GPU unplug<br>
&gt;&nbsp;&nbsp; test/amdgpu/hotunplug: Add basic test<br>
&gt;&nbsp;&nbsp; tests/amdgpu/hotunplug: Add unplug with cs test.<br>
&gt;&nbsp;&nbsp; tests/amdgpu/hotunplug: Add hotunplug with exported bo tes=
t<br>
&gt;<br>
&gt;&nbsp; tests/amdgpu/amdgpu_test.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 42 ++=
+-<br>
&gt;&nbsp; tests/amdgpu/amdgpu_test.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 26 ++=
+<br>
&gt;&nbsp; tests/amdgpu/basic_tests.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 5 +-<br>
&gt;&nbsp; tests/amdgpu/hotunplug_tests.c | 357 +++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; tests/amdgpu/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 1 +<br>
&gt;&nbsp; xf86drm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 23 +++<br>
&gt;&nbsp; xf86drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 1 +<br>
&gt;&nbsp; 7 files changed, 450 insertions(+), 5 deletions(-)<br>
&gt;&nbsp; create mode 100644 tests/amdgpu/hotunplug_tests.c<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=
=3D04%7C01%7Candrey.grodzovsky%40amd.com%7C8fb7f614798b4d19572e08d926d57530=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637583520507282588%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;amp;sdata=3DozqlNQACGvLJugQ2GNvFl8CKgAH0thqMRpWjHpURlyc%3D=
&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%7C01%7Candr=
ey.grodzovsky%40amd.com%7C8fb7f614798b4d19572e08d926d57530%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637583520507282588%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
amp;sdata=3DozqlNQACGvLJugQ2GNvFl8CKgAH0thqMRpWjHpURlyc%3D&amp;amp;reserved=
=3D0</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR12MB46230F8575C786B53056FE79EA3C9SN6PR12MB4623namp_--
