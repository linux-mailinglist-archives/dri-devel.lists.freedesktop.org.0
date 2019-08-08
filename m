Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001886512
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9886E856;
	Thu,  8 Aug 2019 15:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5C26E52C;
 Thu,  8 Aug 2019 15:03:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HW26jcEJhaQM/eSK+1dTlOD1WRiP16LO4OBXGgnBVOs7d3xxW6p2CFpE0WR0KPnymJb++E5SXpRL3Zi/k6sF1kNqSs9i6bFM1C0JdEmCWLbPyea5MaZDYLc0qV25c2QGqpy+6i+Jv4wEht/eTO9fsxjKkoRkWuhTjilMXvu/nIIUDsfVgmk5Dw91mudIG9yad3Pu7YeQQBvwLVymxxA3hibeZpCJBlrukkelJ0724Ndcj6W+LfTZeU+PHmuMdVv2qHxbtsqXkcyoc5oBL20qFwZ5+/TLkDewc5Vz82dDXCrA+vfaOBoPRZN2M5zH/PGegV9cfM5fLg9TZSKgeyCpIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XDBeM8urZP9uv3vr6YBmR3IWHnMGI9eayt7X3QxGIg=;
 b=H96zIVQlxfIHSKG8qGs5NIbMa21z3akYT0r4o0/n1gv2j+6bdURm04H3rmVUV0bfcIyBEK9AloS/Mtt+wef6PZrgQO0TA52ix4KkfViD3snJylKS0lMNkFgRm4E9S1qijXGaCqPz81giryADZdJYeGxqdXvANbkDLGUb8CzrZCgBJxmqOyMYKqqN3X0QwoiAf9JrRYOcdE2Ak2btBc3TAVz8lYRPz/Fscxyf0UXRkbVH4XyPXJLRgnZT6o70jdYRvljpf0PkBWjJkUQJdz8c40/mJGcz3JM+MzHGaA+AGiIXADpGBjzfVDlAk5KnAVpz3RHxuw/X4J8ULiic3XU+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1345.namprd12.prod.outlook.com (10.168.225.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Thu, 8 Aug 2019 15:03:47 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 15:03:46 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, =?iso-8859-1?Q?Michel_D=E4nzer?=
 <michel@daenzer.net>, Kai-Heng Feng <kai.heng.feng@canonical.com>, "Olsak,
 Marek" <Marek.Olsak@amd.com>
Subject: Re: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
Thread-Topic: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
Thread-Index: AQHVTR6wloWPB/uc2ESZN+ag59LVUKbv2PmAgAAcUwCAANWugIAAHDWAgAABSYCAAHH9nQ==
Date: Thu, 8 Aug 2019 15:03:46 +0000
Message-ID: <BN6PR12MB1809CF339E9855E854551552F7D70@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <3EB0E920-31D7-4C91-A360-DBFB4417AC2F@canonical.com>
 <MN2PR12MB330979BAFF5BCC758258D54CECD40@MN2PR12MB3309.namprd12.prod.outlook.com>
 <624BFB8F-B586-492E-BEA6-4B138DAEC831@canonical.com>
 <MN2PR12MB3309680845257BC66644133CECD70@MN2PR12MB3309.namprd12.prod.outlook.com>
 <615a4948-d0f9-46fc-f43e-2025455e9af6@daenzer.net>,
 <MN2PR12MB3309A9960E429AA5B0A8AD19ECD70@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3309A9960E429AA5B0A8AD19ECD70@MN2PR12MB3309.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.170.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be760471-b0f4-4223-cffe-08d71c119c7f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1345; 
x-ms-traffictypediagnostic: BN6PR12MB1345:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB13454F53828D017727C4255AF7D70@BN6PR12MB1345.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(189003)(199004)(13464003)(6436002)(476003)(71190400001)(102836004)(9686003)(2906002)(76176011)(66446008)(66946007)(6116002)(76116006)(66476007)(53546011)(3846002)(33656002)(64756008)(19627405001)(99286004)(54896002)(52536014)(7696005)(66556008)(26005)(5660300002)(6506007)(105004)(53936002)(236005)(6306002)(6246003)(11346002)(446003)(186003)(256004)(66574012)(486006)(4326008)(25786009)(71200400001)(55016002)(6636002)(229853002)(66066001)(110136005)(54906003)(316002)(8936002)(86362001)(7736002)(478600001)(74316002)(8676002)(966005)(606006)(14454004)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1345;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3DlKSiwKJuxHrVedQtFnuPYJ0ZNgVFW5/Sf51cABS2DNo18uFdBRZ0YGq2ucrUeaLwXH2xHjYhlP16Qe6mjg49uORR7Al0Kgb3l2awTXomZTLWr/L6hbwCOM99FokIOZAWguZn2xSzgnlANVFEIfy1GtNVXS7JXwvi3zuDw7CfjbhB3j27mWZckKSkZ2aAG2GlrkO+I4lfUgeplcTq6nREDVIUTDL0y11eQXqki2PrvFCXguCNWLZqyL/ydUka4lPTq2HcdeDuQYOKUzMa0nCIwe3gM4VOTj68Aftc1gJHhOTicOaE5HNbMSBugGUWD8p3exjXoUiK3o8PCyiOrPSm3LhEM/TSqTF47hgZDwoyglIsen3g6DBcDvZzbqu1TWas8ae6Ax/oDCKQWenOf0UUhPpOgGyx+AFB1h/zHlsUU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be760471-b0f4-4223-cffe-08d71c119c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 15:03:46.0698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CFNVUcaEr35sVWLSwoTmhROD/OI7rjQWRu/GeX0szt/yz8KIKt1NSXs5J4OxKX5QaovFnDvz70Z7VxxE1E8bUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1345
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XDBeM8urZP9uv3vr6YBmR3IWHnMGI9eayt7X3QxGIg=;
 b=nR5c1pUsFDcJa2BclhUD/vImIg9a/s/RqcOBdkR10j3hpzEVb+j71LoiDk3lrhDBzIQzZMileJR201tII74v4IuJzp29jvoOhM1hDUUoW59rTyvWASbNI+eCs4v3qQJGeY/SYnV88jvuPkqF8lAf/+xd8XgoHnSG9+A91c7L+Rc=
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Anthony Wong <anthony.wong@canonical.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0110663079=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0110663079==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809CF339E9855E854551552F7D70BN6PR12MB1809namp_"

--_000_BN6PR12MB1809CF339E9855E854551552F7D70BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Maybe we can check if iommu is enabled in the driver and do the appropriate=
 thing with respect to gfxoff, assuming this is not platform specific.

Alex
________________________________
From: Huang, Ray <Ray.Huang@amd.com>
Sent: Thursday, August 8, 2019 4:14 AM
To: Michel D=E4nzer <michel@daenzer.net>; Kai-Heng Feng <kai.heng.feng@cano=
nical.com>; Olsak, Marek <Marek.Olsak@amd.com>
Cc: Zhou, David(ChunMing) <David1.Zhou@amd.com>; LKML <linux-kernel@vger.ke=
rnel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org=
>; Anthony Wong <anthony.wong@canonical.com>; amd-gfx list <amd-gfx@lists.f=
reedesktop.org>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Ch=
ristian <Christian.Koenig@amd.com>
Subject: RE: [Regression] "drm/amdgpu: enable gfxoff again on raven series =
(v2)"

> -----Original Message-----
> From: Michel D=E4nzer <michel@daenzer.net>
> Sent: Thursday, August 08, 2019 4:10 PM
> To: Huang, Ray <Ray.Huang@amd.com>; Kai-Heng Feng
> <kai.heng.feng@canonical.com>
> Cc: Zhou, David(ChunMing) <David1.Zhou@amd.com>; LKML <linux-
> kernel@vger.kernel.org>; dri-devel@lists.freedesktop.org; Anthony Wong
> <anthony.wong@canonical.com>; amd-gfx list <amd-
> gfx@lists.freedesktop.org>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>
> Subject: Re: [Regression] "drm/amdgpu: enable gfxoff again on raven serie=
s
> (v2)"
>
> On 2019-08-08 8:29 a.m., Huang, Ray wrote:
> >> From: Kai-Heng Feng <kai.heng.feng@canonical.com> at 00:03, Huang,
> >> Ray <Ray.Huang@amd.com> wrote:
> >>
> >>> May I know the all firmware version in your system?
> >
> > Seems to the issue we encountered with IOMMU enabled. Could you
> please disable iommu in SBIOS or GRUB?
>
> The driver needs to work with the IOMMU enabled. If nothing else, ROCm
> only works with IOMMU I think.
>

Yes. ROCm in APU required IOMMU v2. So far, I am asking Kai-Heng to do some=
 tests to make sure the issue that was encountered by us before. (+ Marek)

Thanks,
Ray

>
> --
> Earthling Michel D=E4nzer               |              https://www.amd.co=
m
> Libre software enthusiast             |             Mesa and X developer

--_000_BN6PR12MB1809CF339E9855E854551552F7D70BN6PR12MB1809namp_
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
Maybe we can check if iommu is enabled in the driver and do the appropriate=
 thing with respect to gfxoff, assuming this is not platform specific.</div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Huang, Ray &lt;Ray.Hu=
ang@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 8, 2019 4:14 AM<br>
<b>To:</b> Michel D=E4nzer &lt;michel@daenzer.net&gt;; Kai-Heng Feng &lt;ka=
i.heng.feng@canonical.com&gt;; Olsak, Marek &lt;Marek.Olsak@amd.com&gt;<br>
<b>Cc:</b> Zhou, David(ChunMing) &lt;David1.Zhou@amd.com&gt;; LKML &lt;linu=
x-kernel@vger.kernel.org&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel=
@lists.freedesktop.org&gt;; Anthony Wong &lt;anthony.wong@canonical.com&gt;=
; amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Deucher,
 Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christi=
an.Koenig@amd.com&gt;<br>
<b>Subject:</b> RE: [Regression] &quot;drm/amdgpu: enable gfxoff again on r=
aven series (v2)&quot;</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">&gt; -----Original Message-----<br>
&gt; From: Michel D=E4nzer &lt;michel@daenzer.net&gt;<br>
&gt; Sent: Thursday, August 08, 2019 4:10 PM<br>
&gt; To: Huang, Ray &lt;Ray.Huang@amd.com&gt;; Kai-Heng Feng<br>
&gt; &lt;kai.heng.feng@canonical.com&gt;<br>
&gt; Cc: Zhou, David(ChunMing) &lt;David1.Zhou@amd.com&gt;; LKML &lt;linux-=
<br>
&gt; kernel@vger.kernel.org&gt;; dri-devel@lists.freedesktop.org; Anthony W=
ong<br>
&gt; &lt;anthony.wong@canonical.com&gt;; amd-gfx list &lt;amd-<br>
&gt; gfx@lists.freedesktop.org&gt;; Deucher, Alexander<br>
&gt; &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian<br>
&gt; &lt;Christian.Koenig@amd.com&gt;<br>
&gt; Subject: Re: [Regression] &quot;drm/amdgpu: enable gfxoff again on rav=
en series<br>
&gt; (v2)&quot;<br>
&gt; <br>
&gt; On 2019-08-08 8:29 a.m., Huang, Ray wrote:<br>
&gt; &gt;&gt; From: Kai-Heng Feng &lt;kai.heng.feng@canonical.com&gt; at 00=
:03, Huang,<br>
&gt; &gt;&gt; Ray &lt;Ray.Huang@amd.com&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; May I know the all firmware version in your system?<br>
&gt; &gt;<br>
&gt; &gt; Seems to the issue we encountered with IOMMU enabled. Could you<b=
r>
&gt; please disable iommu in SBIOS or GRUB?<br>
&gt; <br>
&gt; The driver needs to work with the IOMMU enabled. If nothing else, ROCm=
<br>
&gt; only works with IOMMU I think.<br>
&gt; <br>
<br>
Yes. ROCm in APU required IOMMU v2. So far, I am asking Kai-Heng to do some=
 tests to make sure the issue that was encountered by us before. (&#43; Mar=
ek)<br>
<br>
Thanks,<br>
Ray<br>
<br>
&gt; <br>
&gt; --<br>
&gt; Earthling Michel D=E4nzer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://www.amd.com=
">
https://www.amd.com</a><br>
&gt; Libre software enthusiast&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; Mesa and X developer<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809CF339E9855E854551552F7D70BN6PR12MB1809namp_--

--===============0110663079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0110663079==--
