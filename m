Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3FE2E71DB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 16:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15758925F;
	Tue, 29 Dec 2020 15:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CB68925F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 15:37:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ep2Nq5/2tSWx2nG0+ttNaTdnacD4Mhn7yEC/KGNj1Ip/46cyhI1dDt5cMkdOjZMIlM5b9KwZgcJYKp412nGypWI0V6fgRvV0nIYBnsbGgfNn1BZl6dxMNXyehN4oi8VNAweulcwnphquC8QqMhA2ot6eFR7VM2LQmLiWCF4cGwzfQDvLokTgrG4X5bkaQ6+cQe4/yGycEJUeEizq+DRH7cpjFCN2dfZw28ZmQGh+W2rrcW5zAfd0bYe7EsrcyOk1XDLl7qGhekR5fW8Sq6odjfM7RUCWlyTAN1zWIIzmhEczX2/5LuSbU39vXO2z9srVuTHQTLZWKnfmln55fCM+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfvHgZbE/vzy0UMoTGqw+3sm5TQQTnFWuP9KErPts0w=;
 b=FSrby8pgTYfRsx3i6seARZA/PTaXIrvb0ExIJrPT97B4GNuSdbUN3cFs2sKrz+sKQsBC1IBMhqx5jHe7numLcrNN4BTWVHDQu9E49ypYkyzdY4jK05vD3FCvH1jp6DvgxIKtlurRZuvoYGiVKfKtQIodDALUBgpEI98ZE3DvugkIZ7RQGqi5sOK5ZP6VkQwMzMFiCb6YR6dtHPPld2n+WorkRKriVCt2xWvSGfXC+oXowYRZ5hs7tmESuW3FLOvb3LlcIczD8Y6m/2vEqMz2VwgoSI4VRJdvRpS3hjcqVtffN0RyMBBp2H0yBuG5uLRfMOX6/BbJ+JStWzFidr02Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfvHgZbE/vzy0UMoTGqw+3sm5TQQTnFWuP9KErPts0w=;
 b=YZsOfBDW5cSIu4XFDYlb78hLtabesbzcKlEO/0br4yo/nHJ8++3hk7YB0RK4S0PmV2inDwWJn7GUME3Hdwo/KoNFqFVRVe5/6gdXu/cZ5BEn0YEtJcyLJIdhXcJEq2dd8EMjUISNhPDaSAgp8rtZeUzpxMRck18vwMPzQcpRtUI=
Received: from DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16)
 by DM6PR12MB4057.namprd12.prod.outlook.com (2603:10b6:5:213::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.28; Tue, 29 Dec
 2020 15:37:20 +0000
Received: from DM6PR12MB4267.namprd12.prod.outlook.com
 ([fe80::4ca0:5892:b4f2:e2c7]) by DM6PR12MB4267.namprd12.prod.outlook.com
 ([fe80::4ca0:5892:b4f2:e2c7%9]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 15:37:20 +0000
From: "R, Bindu" <Bindu.R@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Wu, Hersen"
 <hersenxs.wu@amd.com>
Subject: Re: [git pull] drm fixes for 5.11-rc1
Thread-Topic: [git pull] drm fixes for 5.11-rc1
Thread-Index: AQHW2kQakBB65Ep59UWyYc9ntTaK/qoONBuAgAAFZVI=
Date: Tue, 29 Dec 2020 15:37:20 +0000
Message-ID: <DM6PR12MB42679D211553881EB5F1A8FDF5D80@DM6PR12MB4267.namprd12.prod.outlook.com>
References: <CAPM=9twrkJdUqTLXXsNygtzkrc4P2iyw4kwU1T83D4_+-gdpDA@mail.gmail.com>
 <CAHk-=whf+kw=YSDbmvgiSvNL9ckHc8EpkTgZzMXu-bMw941GYQ@mail.gmail.com>,
 <CADnq5_N_2iYnh13p-z5vrvNK9rzKV-5TYtCC-FiEYjvi--_org@mail.gmail.com>
In-Reply-To: <CADnq5_N_2iYnh13p-z5vrvNK9rzKV-5TYtCC-FiEYjvi--_org@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-12-29T15:37:20.226Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2607:fea8:4ce1:13a0:a479:eba9:f79d:c0ae]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 47368f86-95e6-4162-aeed-08d8ac0fa18d
x-ms-traffictypediagnostic: DM6PR12MB4057:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB405735841C8208D30D483B70F5D80@DM6PR12MB4057.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:339;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xuJCDzBInStLEAqLhK7DGmMF0ETpeWM+JkgytY65idUPY231EE3890/EyUd4SKg3MGLNS6GR26EPNerMCVtpa5uU+Wttfnu+zbxq6qAKagGIIwOguEvTvYuoGCV9tsJGPlDm9v4cI8t6Y0M+sGlVmXsMW64cqb7t6WIcbWMgszzeJmBYX9ahz4pzImb+GxNE7H7cEYFBLjXwyt2jE6kW8Aqz+gc8NPeWO7Gg5xjhR4RWN04B2LfTbjAJza2a//BTE316CnW6YS68zLeFtnL9PrThyA26sifdsLPwnc6tnqOPIZ4r9lTAduNd5m7/LmR0EnzFMZi92P4WnjdvhzK5ZfJfSU/EiUb/zTGe/YAF0KLWnt++c0O6e9rrlSxmJciXNKZljG3DO5XYY2ipLGCeBHMC30jlgxnnLvemTCsnLm0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4267.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(186003)(478600001)(5660300002)(55016002)(166002)(6506007)(86362001)(66446008)(2906002)(66556008)(66476007)(83380400001)(316002)(76116006)(966005)(9686003)(33656002)(66946007)(4326008)(71200400001)(8676002)(110136005)(8936002)(7696005)(64756008)(54906003)(53546011)(52536014)(19627405001)(6636002)(45080400002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?rLEe+zTjsmFGwD0SsgpfnUtiWaU1ezk8iJi11t4h8yiJwmUsVPIa/b4yxu?=
 =?iso-8859-1?Q?fKxa++N+ON+KteQI2WWLzNVkdn2Y43nRYt4FG7uj1yyIF6UgVLj/CBcKxa?=
 =?iso-8859-1?Q?shdT9dh7aBD2HMQnTZNZZhVo3gmYnWd+EaDpYVjFubMwHK1cHOXLSW7gPQ?=
 =?iso-8859-1?Q?mubzj6H1LCRVA+Jh5z8EO18ATwLYka3cG7+2H34dkH4LQc6OlKvBkJ4sbD?=
 =?iso-8859-1?Q?zwQWnOd10r+3p1aqkXSVKE/Mqo13ASzss1i4ZHF7Y1EWSqQGZBm3/y78kT?=
 =?iso-8859-1?Q?f+rcuteA4FOOJxdp/kXVyS7hshEeviFBDqovjK09khwzaIAEXm2MiBVqHg?=
 =?iso-8859-1?Q?U+Ue++dVR9CJzanR2NBoC0TZieUXXK7o1ilZ+rFtIrvUEwDXmvm3EOsXR2?=
 =?iso-8859-1?Q?PFSub04kOgu9VLt+Q7k5NBYyUBk4eShtbDC6S15PAiHJ7cEi0qp1ybKTD/?=
 =?iso-8859-1?Q?PuXCB6VgZgBvpidJQsKICceY+UQZuVbJRyF0IQrVNgA+B8HdX31rboineX?=
 =?iso-8859-1?Q?T4VrsGHQZwpYt7SSgdqQ4IZyhcn6/Old6wiY1bA24QKlOlwnILb7uq/qj5?=
 =?iso-8859-1?Q?3IUyV47zi6xQkEOBAOrLmS3HbSz4F4/WOq/0HTELEfKa7V6D1PeFcwlBvj?=
 =?iso-8859-1?Q?coVBZxxTWx5siakK4Zz4iOIgm5BJo4EVgMWr0B7+9rPDhMfWkGZ1f03gsB?=
 =?iso-8859-1?Q?crK9osYZKwH76Gkj5h9QlYefYHIkjttUoFaUWTK2wqfufyH66YdjhWABN3?=
 =?iso-8859-1?Q?WXbPVDl82IAqPBBQboaF2yvY6Zjvs7OsqTL0PXyvPV8IUsKHX28OtTGVhr?=
 =?iso-8859-1?Q?9DBmXqJFn6vOgr9gje4YeAvflBFvDa+ZkJE1Amvtk35hakUhBYU6zAu+/z?=
 =?iso-8859-1?Q?gUIYSVjMYMxbMjmdKh9xj0TZsmyQv5L6egTA5Nz3IA3ku1vtw2UNya9kDS?=
 =?iso-8859-1?Q?HI8XG5wxCSDiezIKIBE21MgfXICp4RarJ49ON8ilisLDxrOkMtwt5UOr9z?=
 =?iso-8859-1?Q?nKNc4Bl/KheC3uDWfVLvnyuUkL8QIxj7awxpEzjbMZvgA6Q8ZLFzyFvt2T?=
 =?iso-8859-1?Q?Cj/3LORbThfo9Hf5H1Kkuzg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4267.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47368f86-95e6-4162-aeed-08d8ac0fa18d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2020 15:37:20.6305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ks7UcuXVzA22V0usXm7skugFNMR9Wsr3cRYVZ4RlOgbjWm2vYJjQdIxtuKbuYEcaaf0hT3UbuMeoTF6Ee0VjQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057
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
Cc: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Pavic, Josip" <Josip.Pavic@amd.com>
Content-Type: multipart/mixed; boundary="===============0190156440=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0190156440==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB42679D211553881EB5F1A8FDF5D80DM6PR12MB4267namp_"

--_000_DM6PR12MB42679D211553881EB5F1A8FDF5D80DM6PR12MB4267namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

++Siqueira.

Regards,
Bindu
________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Tuesday, December 29, 2020 10:07 AM
To: Linus Torvalds <torvalds@linux-foundation.org>; Wentland, Harry <Harry.=
Wentland@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wu, =
Hersen <hersenxs.wu@amd.com>
Cc: Dave Airlie <airlied@gmail.com>; Pavic, Josip <Josip.Pavic@amd.com>; R,=
 Bindu <Bindu.R@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; D=
aniel Vetter <daniel.vetter@ffwll.ch>; LKML <linux-kernel@vger.kernel.org>;=
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [git pull] drm fixes for 5.11-rc1

On Thu, Dec 24, 2020 at 5:28 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Dec 23, 2020 at 6:29 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > Xmas eve pull request present. Just some fixes that trickled in this
> > past week. Mostly amdgpu fixes, with a dma-buf/mips build fix and some
> > misc komeda fixes.
>
> Well, I already pulled and pushed out my merge, but only noticed
> afterwards that clang complains about this, and I think it's a real
> bug:
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_mpc.c:475:6: warni=
ng:
>      variable 'val' is used uninitialized whenever 'if' condition is
> false [-Wsometimes-uninitialized]
>
> and it sure is true: the code literally does
>
>         uint32_t val;
>
>         if (opp_id < MAX_OPP && REG(MUX[opp_id]))
>                 REG_GET(MUX[opp_id], MPC_OUT_MUX, &val);
>
>         return val;
>
> so clearly 'val' isn't initialized if that if-statement isn't true.
>
> I assume 'opp_id' is always presumed to be valid, but that code really
> is disgusting.
>
> Just make it return 0 (or whatever) for invalid, possibly together
> with a WARN_ON_ONCE(). Ok?

Harry, Nick, Hersen,

Can you take a look?

Thanks,

Alex

>
>              Linus
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%7Cbind=
u.r%40amd.com%7Cae8f547c9287426b9b9408d8ac0b7b73%7C3dd8961fe4884e608e11a82d=
994e183d%7C0%7C0%7C637448512618562550%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D4g=
cQRS3HI4u1UEWu35Ze1w5CLWmAof5nouCFQoKEQD0%3D&amp;reserved=3D0

--_000_DM6PR12MB42679D211553881EB5F1A8FDF5D80DM6PR12MB4267namp_
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
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-size: 11pt;">++Siqueira.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-size: 11pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-size: 11pt;">Regards,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-size: 11pt;">Bindu </span><br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Alex Deucher &lt;al=
exdeucher@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, December 29, 2020 10:07 AM<br>
<b>To:</b> Linus Torvalds &lt;torvalds@linux-foundation.org&gt;; Wentland, =
Harry &lt;Harry.Wentland@amd.com&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kaz=
lauskas@amd.com&gt;; Wu, Hersen &lt;hersenxs.wu@amd.com&gt;<br>
<b>Cc:</b> Dave Airlie &lt;airlied@gmail.com&gt;; Pavic, Josip &lt;Josip.Pa=
vic@amd.com&gt;; R, Bindu &lt;Bindu.R@amd.com&gt;; Deucher, Alexander &lt;A=
lexander.Deucher@amd.com&gt;; Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;;=
 LKML &lt;linux-kernel@vger.kernel.org&gt;; dri-devel &lt;dri-devel@lists.f=
reedesktop.org&gt;<br>
<b>Subject:</b> Re: [git pull] drm fixes for 5.11-rc1</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Thu, Dec 24, 2020 at 5:28 PM Linus Torvalds<br>
&lt;torvalds@linux-foundation.org&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Dec 23, 2020 at 6:29 PM Dave Airlie &lt;airlied@gmail.com&gt; =
wrote:<br>
&gt; &gt;<br>
&gt; &gt; Xmas eve pull request present. Just some fixes that trickled in t=
his<br>
&gt; &gt; past week. Mostly amdgpu fixes, with a dma-buf/mips build fix and=
 some<br>
&gt; &gt; misc komeda fixes.<br>
&gt;<br>
&gt; Well, I already pulled and pushed out my merge, but only noticed<br>
&gt; afterwards that clang complains about this, and I think it's a real<br=
>
&gt; bug:<br>
&gt;<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_mpc.c=
:475:6: warning:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; variable 'val' is used uninitialized whe=
never 'if' condition is<br>
&gt; false [-Wsometimes-uninitialized]<br>
&gt;<br>
&gt; and it sure is true: the code literally does<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t val;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (opp_id &lt; MAX_OP=
P &amp;&amp; REG(MUX[opp_id]))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; REG_GET(MUX[opp_id], MPC_OUT_MUX, &amp;val);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return val;<br>
&gt;<br>
&gt; so clearly 'val' isn't initialized if that if-statement isn't true.<br=
>
&gt;<br>
&gt; I assume 'opp_id' is always presumed to be valid, but that code really=
<br>
&gt; is disgusting.<br>
&gt;<br>
&gt; Just make it return 0 (or whatever) for invalid, possibly together<br>
&gt; with a WARN_ON_ONCE(). Ok?<br>
<br>
Harry, Nick, Hersen,<br>
<br>
Can you take a look?<br>
<br>
Thanks,<br>
<br>
Alex<br>
<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; Linus<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; dri-devel@lists.freedesktop.org<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;dat=
a=3D04%7C01%7Cbindu.r%40amd.com%7Cae8f547c9287426b9b9408d8ac0b7b73%7C3dd896=
1fe4884e608e11a82d994e183d%7C0%7C0%7C637448512618562550%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;amp;sdata=3D4gcQRS3HI4u1UEWu35Ze1w5CLWmAof5nouCFQoKEQD0%3D&amp;amp;=
reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=3D04%7C01%7Cbi=
ndu.r%40amd.com%7Cae8f547c9287426b9b9408d8ac0b7b73%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637448512618562550%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdat=
a=3D4gcQRS3HI4u1UEWu35Ze1w5CLWmAof5nouCFQoKEQD0%3D&amp;amp;reserved=3D0</a>=
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR12MB42679D211553881EB5F1A8FDF5D80DM6PR12MB4267namp_--

--===============0190156440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0190156440==--
