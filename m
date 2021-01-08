Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618972EF998
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50986E0DE;
	Fri,  8 Jan 2021 20:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B169A6E0DE;
 Fri,  8 Jan 2021 20:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW0qI10Jto8WDvrIpG/YebReRn36Hl9miOF0Hsm7cj07J0T2t1UDlVcArisF0q4mboS6DvHynC6kbLnSs3b6bHJLQ1UIRZQYmdoDwm8pb16/gHKkh6HoeAUPuZ9qKmhOnUQllt/LLm95NhEKxLtdpwJl1cZpOubld0MNhOU/XorpZEOMn4hipYuRM4uZpw9fM6kPQ3tBZJdOTQLN5PgFz3yv5YIG3qq0nKO8h1JU7Zqe37RTu50PDl4QQxJO0PmvwzKArj+lDEZY9lRvq6SWvpmvf1V0ztbQayvRcMbZ1Ln7UIU7kINon82JcjFNxZlhgDKpEqEVNtuBceSm2TOJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QXCgtib3Do4QvkoEIah68AI7tOh38rg2FtihTmk/D8=;
 b=DyuguC4yGFrRwE2/k90KAlZ0qvXKt+KDpMI+9eJIuVgMc2AvYo18vIDWmMPepjUpmJr2W+OOFCNZyFZajYvBcJeWxsvYDr71/kts4JlKE+F0sY9ijZGSdLcZSClQxReKT0zhLS2Jxo7qFDwY4D8Hret4P1PgqJkKe+EGyVuqBZmAneMPPRTwXHxeIT/D0jfntupvauc0RmpQdwaz9KqIrIvJGPRfst+EAC+UAI8f6Uf4lK16Gu0+1nNO6Yl0th37gmajaVn7zcNgz4mLR7dpcO3rxSEzyOSfWuQ3+lg+sIiWbRs/wlMZF9sav3HkWIy3jiez7vX5z2gj8yhsYSH5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QXCgtib3Do4QvkoEIah68AI7tOh38rg2FtihTmk/D8=;
 b=LVPva4O5FREFwh5nhQLlaWUzrFXkESZ56OnSHSSs7wE2soUVe521KmkX84LMem5ZXZw6PFlyNJnEcO/y/fJif/07qgGJk8SR9VdpyZT9uy4Q5D2yu1OFQD1kbW1qh2f+59/EMfB8c6Xv2e3eR+xP6DKPA0B+FGQ8r6f6D68f7JU=
Received: from MWHPR12MB1629.namprd12.prod.outlook.com (2603:10b6:301:3::23)
 by MW2PR12MB2537.namprd12.prod.outlook.com (2603:10b6:907:6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 20:52:18 +0000
Received: from MWHPR12MB1629.namprd12.prod.outlook.com
 ([fe80::893b:d8d7:459a:8fe5]) by MWHPR12MB1629.namprd12.prod.outlook.com
 ([fe80::893b:d8d7:459a:8fe5%8]) with mapi id 15.20.3742.011; Fri, 8 Jan 2021
 20:52:18 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] MAINTAINERS: update radeon/amdgpu/amdkfd git trees
Thread-Topic: [PATCH] MAINTAINERS: update radeon/amdgpu/amdkfd git trees
Thread-Index: AQHW45+y7JxhprASQUCpDf35ovBAu6oeIhWAgAAW5zE=
Date: Fri, 8 Jan 2021 20:52:18 +0000
Message-ID: <MWHPR12MB162977B49AF804C7BF339C0BFEAE0@MWHPR12MB1629.namprd12.prod.outlook.com>
References: <20210105201548.1374211-1-alexander.deucher@amd.com>,
 <CADnq5_OSJQEOOF3N5Z3uX1LY=p0xHJYAukPNj7kGn06teJG5Gw@mail.gmail.com>
In-Reply-To: <CADnq5_OSJQEOOF3N5Z3uX1LY=p0xHJYAukPNj7kGn06teJG5Gw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-01-08T20:52:17.201Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2001:18c0:41d:7b00:9cf9:5ede:b4af:58b3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 05b633e6-78ae-4739-2dac-08d8b41749a9
x-ms-traffictypediagnostic: MW2PR12MB2537:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR12MB25375B0754E6F29ADBFDBAE1FEAE0@MW2PR12MB2537.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DCvMxFZZPKEJIoxvfhEVhreWLgRdEpuiOD/wRHzgazF/8XtchTppBfm4K7sq9Bo7HJ5S0uivh4ERKroQrWkzz8Tw3+gj+O7odmKSyjoJzr9Be+rxGMS+zgCMP3ppS1x5gscM5Ya95A5lvLksZphXeD97VWU90ej++29R7RZvcSZoCfROk0EED3WdVuPTwOcXhFRUCytgD6ESFDIDbuPO+HD9D5LepYdG0SSr6TAc2dgck7YdpNrnSsT6C257BfxMqCAKB612mzjLicJnYLsR+uo4UoMlQhhCfhuaS4DRt0iSW6vFvChkaNiyOsSkqqi0QochC+6ABhV75I4aEBumuQUBblyWUI8YuYlKrf11iVW6ucENf+I4QLnJqsi7XfWw49t4Z++EUqOC1XNNEKrxNaNIkeRXTPSWb3lgop/sAO4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1629.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(8936002)(7696005)(53546011)(83380400001)(52536014)(316002)(110136005)(66574015)(19627405001)(4326008)(6506007)(966005)(45080400002)(66446008)(186003)(2906002)(66476007)(66556008)(76116006)(66946007)(64756008)(91956017)(55016002)(33656002)(15650500001)(86362001)(8676002)(9686003)(5660300002)(478600001)(166002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?kCQqpCyT3sHmxdkZNFLlGuVF6Tt7fY+RPQ4+9nlAYq02+RTu4xVHaMiqhr?=
 =?iso-8859-1?Q?h6NgNQ8hKtiL7LwKTou7OqMn6enPa7n0t9aG/EoMKxVJ/ptL6g2MBdl0x0?=
 =?iso-8859-1?Q?i6kVpUE2ydbdTZAyqgMxtCGN1eQ+Tz1olpdqb1vEbVa5keiHEow2nfvEZk?=
 =?iso-8859-1?Q?JLrIabDLd37aRmkUbYB42lFaMYChW5Bjz3UTIVgePM26nIHWHLj+Hu4IYj?=
 =?iso-8859-1?Q?75zZG2BTiS8AJoGPayYSc9YvbfckZFlGCe9AVBD5tpkeyCrYNJt1RyHy1w?=
 =?iso-8859-1?Q?vauZHWRpQUjeENG0eXATreszNClIRX95L5TueUy3cdlLAHRMNeiuAMR2MA?=
 =?iso-8859-1?Q?Hf1lj3CygVY8D0VTqEiZJ5gcmlv4rDUO/PVNyO7xJVEixcXP9ha9JHzTmt?=
 =?iso-8859-1?Q?Kj9vfeIRwA+W5jJb7Srsx8BnnVYa1dMAKD4FfR93YzqLG7x8PqZdnWwZD3?=
 =?iso-8859-1?Q?8YQo6hgdnhrZo6v5DdcovMXoPQvjmPnt9pDCbSg64VzV9SvBMnaTDoJI2y?=
 =?iso-8859-1?Q?R7GeXgOJZrDXzPipK1WDgtGdg63ciitgcMtLSZEyPJfH8FHjyyMHxL+4oV?=
 =?iso-8859-1?Q?R8K0wBufUYTwEcVKrxSMgB0Y01LRUtaTCEVLEMVZ20I9gzNryxMhOvhDIr?=
 =?iso-8859-1?Q?4/Eq8a7M6tmdQQd2YVu1BVugQmyit3qBF8sY55XQmZIqRgWKUNf0FaPuFg?=
 =?iso-8859-1?Q?rujV4/HVylSURmhfSLovl8qEKGAtC14qckIWDhWWe3Ti9WqEeL6+awkBrA?=
 =?iso-8859-1?Q?ZqFTLh/KjCHxk4vUZ2phDBQecfoXXrkvo6RxaLoPguS3iqwGIFb18YUYHa?=
 =?iso-8859-1?Q?k7fcfTrGxKc7Z/tTNvrl/xJ4x1pieIlb0NhGmcmb6Sg9BHFjCDrzDo2eQv?=
 =?iso-8859-1?Q?SaOWcPUWdYMjxR4ee1jKyWEt3YCn+bUdgv7eLrgjHL1yd4xxzySYz4dcDv?=
 =?iso-8859-1?Q?w0ezbdw+Kt/1ZWF2d9fVp4L3KN2ZcQlTDQxk96mZerlfe37ap0F3r0cUBV?=
 =?iso-8859-1?Q?2wWrsbA/QcYBW1G5z8y4ZobG2v0EHniYa21ro+qDvXJh6bC/L8uBeuCTXY?=
 =?iso-8859-1?Q?Mb5JMqwXnp6lBDlK5Ywc1es=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1629.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b633e6-78ae-4739-2dac-08d8b41749a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 20:52:18.4597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uLz2dwR79Bm1V9ucSXKqQj/yK0SqVzMKiUvuCm+r6EPC3Z65ClD6g1W3XVThkzQvLD8BOaaVCP7k5lkZ7KxF2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2537
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1792636627=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1792636627==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHPR12MB162977B49AF804C7BF339C0BFEAE0MWHPR12MB1629namp_"

--_000_MWHPR12MB162977B49AF804C7BF339C0BFEAE0MWHPR12MB1629namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Why not just https://gitlab.freedesktop.org/agd5f/linux ?
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Alex Deu=
cher <alexdeucher@gmail.com>
Sent: Friday, January 8, 2021 2:30 PM
To: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI develop=
ers <dri-devel@lists.freedesktop.org>; Dave Airlie <airlied@gmail.com>; Dan=
iel Vetter <daniel.vetter@ffwll.ch>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] MAINTAINERS: update radeon/amdgpu/amdkfd git trees

On Tue, Jan 5, 2021 at 3:15 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> FDO is out of space, so move to gitlab.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Ping?  Any objections?

Alex

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eb18459c1d16..e2877be6b10d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -907,7 +907,7 @@ AMD KFD
>  M:     Felix Kuehling <Felix.Kuehling@amd.com>
>  L:     amd-gfx@lists.freedesktop.org
>  S:     Supported
> -T:     git git://people.freedesktop.org/~agd5f/linux
> +T:     git https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux.git&amp;data=3D04%7C01%7Cslav=
a.abramov%40amd.com%7Cb4e8adc5393c4b052d6908d8b40bd5db%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637457310677496846%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat=
a=3DxK4Oo8juN%2FoF1jVnLclPtt9MKLzRQ3GPiercdH9ogFE%3D&amp;reserved=3D0
>  F:     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd*.[ch]
>  F:     drivers/gpu/drm/amd/amdkfd/
>  F:     drivers/gpu/drm/amd/include/cik_structs.h
> @@ -14596,7 +14596,7 @@ M:      Alex Deucher <alexander.deucher@amd.com>
>  M:     Christian K=F6nig <christian.koenig@amd.com>
>  L:     amd-gfx@lists.freedesktop.org
>  S:     Supported
> -T:     git git://people.freedesktop.org/~agd5f/linux
> +T:     git https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux.git&amp;data=3D04%7C01%7Cslav=
a.abramov%40amd.com%7Cb4e8adc5393c4b052d6908d8b40bd5db%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637457310677506842%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat=
a=3DANez%2BLHaergD6Lae8arcJDyibaf5yPgRyrBfzBpd3vY%3D&amp;reserved=3D0
>  F:     drivers/gpu/drm/amd/
>  F:     drivers/gpu/drm/radeon/
>  F:     include/uapi/drm/amdgpu_drm.h
> --
> 2.29.2
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cslava.ab=
ramov%40amd.com%7Cb4e8adc5393c4b052d6908d8b40bd5db%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637457310677506842%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D=
gyiwTSaZfiAQpII%2BJUprm5wINz5QEWdQYnm05WoDbD0%3D&amp;reserved=3D0

--_000_MWHPR12MB162977B49AF804C7BF339C0BFEAE0MWHPR12MB1629namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Why not just&nbsp;<a href=3D"https://gitlab.freedesktop.org/agd5f/linux" id=
=3D"LPlnk801264">https://gitlab.freedesktop.org/agd5f/linux</a>&nbsp;?</div=
>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Alex Deucher &lt;alexdeucher@=
gmail.com&gt;<br>
<b>Sent:</b> Friday, January 8, 2021 2:30 PM<br>
<b>To:</b> amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Maling list =
- DRI developers &lt;dri-devel@lists.freedesktop.org&gt;; Dave Airlie &lt;a=
irlied@gmail.com&gt;; Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] MAINTAINERS: update radeon/amdgpu/amdkfd git tr=
ees</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, Jan 5, 2021 at 3:15 PM Alex Deucher &lt;al=
exdeucher@gmail.com&gt; wrote:<br>
&gt;<br>
&gt; FDO is out of space, so move to gitlab.<br>
&gt;<br>
&gt; Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
<br>
Ping?&nbsp; Any objections?<br>
<br>
Alex<br>
<br>
&gt; ---<br>
&gt;&nbsp; MAINTAINERS | 4 ++--<br>
&gt;&nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index eb18459c1d16..e2877be6b10d 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -907,7 +907,7 @@ AMD KFD<br>
&gt;&nbsp; M:&nbsp;&nbsp;&nbsp;&nbsp; Felix Kuehling &lt;Felix.Kuehling@amd=
.com&gt;<br>
&gt;&nbsp; L:&nbsp;&nbsp;&nbsp;&nbsp; amd-gfx@lists.freedesktop.org<br>
&gt;&nbsp; S:&nbsp;&nbsp;&nbsp;&nbsp; Supported<br>
&gt; -T:&nbsp;&nbsp;&nbsp;&nbsp; git git://people.freedesktop.org/~agd5f/li=
nux<br>
&gt; +T:&nbsp;&nbsp;&nbsp;&nbsp; git <a href=3D"https://nam11.safelinks.pro=
tection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Fl=
inux.git&amp;amp;data=3D04%7C01%7Cslava.abramov%40amd.com%7Cb4e8adc5393c4b0=
52d6908d8b40bd5db%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637457310677=
496846%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DxK4Oo8juN%2FoF1jVnLclPtt9MKLz=
RQ3GPiercdH9ogFE%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
freedesktop.org%2Fagd5f%2Flinux.git&amp;amp;data=3D04%7C01%7Cslava.abramov%=
40amd.com%7Cb4e8adc5393c4b052d6908d8b40bd5db%7C3dd8961fe4884e608e11a82d994e=
183d%7C0%7C0%7C637457310677496846%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DxK=
4Oo8juN%2FoF1jVnLclPtt9MKLzRQ3GPiercdH9ogFE%3D&amp;amp;reserved=3D0</a><br>
&gt;&nbsp; F:&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_amd=
kfd*.[ch]<br>
&gt;&nbsp; F:&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/<br>
&gt;&nbsp; F:&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/include/cik_struc=
ts.h<br>
&gt; @@ -14596,7 +14596,7 @@ M:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alex Deucher =
&lt;alexander.deucher@amd.com&gt;<br>
&gt;&nbsp; M:&nbsp;&nbsp;&nbsp;&nbsp; Christian K=F6nig &lt;christian.koeni=
g@amd.com&gt;<br>
&gt;&nbsp; L:&nbsp;&nbsp;&nbsp;&nbsp; amd-gfx@lists.freedesktop.org<br>
&gt;&nbsp; S:&nbsp;&nbsp;&nbsp;&nbsp; Supported<br>
&gt; -T:&nbsp;&nbsp;&nbsp;&nbsp; git git://people.freedesktop.org/~agd5f/li=
nux<br>
&gt; +T:&nbsp;&nbsp;&nbsp;&nbsp; git <a href=3D"https://nam11.safelinks.pro=
tection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Fl=
inux.git&amp;amp;data=3D04%7C01%7Cslava.abramov%40amd.com%7Cb4e8adc5393c4b0=
52d6908d8b40bd5db%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637457310677=
506842%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DANez%2BLHaergD6Lae8arcJDyibaf=
5yPgRyrBfzBpd3vY%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
freedesktop.org%2Fagd5f%2Flinux.git&amp;amp;data=3D04%7C01%7Cslava.abramov%=
40amd.com%7Cb4e8adc5393c4b052d6908d8b40bd5db%7C3dd8961fe4884e608e11a82d994e=
183d%7C0%7C0%7C637457310677506842%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DAN=
ez%2BLHaergD6Lae8arcJDyibaf5yPgRyrBfzBpd3vY%3D&amp;amp;reserved=3D0</a><br>
&gt;&nbsp; F:&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/<br>
&gt;&nbsp; F:&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/radeon/<br>
&gt;&nbsp; F:&nbsp;&nbsp;&nbsp;&nbsp; include/uapi/drm/amdgpu_drm.h<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%=
7C01%7Cslava.abramov%40amd.com%7Cb4e8adc5393c4b052d6908d8b40bd5db%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C637457310677506842%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;amp;sdata=3DgyiwTSaZfiAQpII%2BJUprm5wINz5QEWdQYnm05WoDbD0%3D&amp;amp=
;reserved=3D0">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=
=3D04%7C01%7Cslava.abramov%40amd.com%7Cb4e8adc5393c4b052d6908d8b40bd5db%7C3=
dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637457310677506842%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000&amp;amp;sdata=3DgyiwTSaZfiAQpII%2BJUprm5wINz5QEWdQYnm05WoDbD0%3D&a=
mp;amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MWHPR12MB162977B49AF804C7BF339C0BFEAE0MWHPR12MB1629namp_--

--===============1792636627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1792636627==--
