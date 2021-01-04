Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE62E9689
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 15:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A45C89F31;
	Mon,  4 Jan 2021 14:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A26089F31;
 Mon,  4 Jan 2021 14:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGJu8z8kXCiUiJ0Eg59FYAMpsycGzEqHgNIVGToU1WJgjt1WIp7oA9JtYuFyhu8PTVnY5oU1k1YNJQPAOY4e9Fahl2qBSbiSWjo9J6TW9HlynkI/UnTJl9rpfDccQ99xexeJmuDyIuRmkzIje6oFx7ciLakwK2U/mSmmv9DWy8Xiu6T2LDCfItXA2I4sBcvUy3qoZwyfv78kANK9ys0jiUGRl7VszD3toGKnaJ+KZsDAe+VKLFBkpCSVZxq7xiRvAY1/zk5+1RMilt7K6e4wf6U3Vr2J4ule6huvwiKptk4z4TfU+SbYD+YOcWlfogmXsnakRTWh8mhfV1Q5wypoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nG4DK87FyJBHwFeqgQbZAWA9LMt9fa3mRIT5OCQvZ3Y=;
 b=k3PMYefu10Ic7cJwvHgI8e+UFkxSsoGcN64ify9B+zD9zGxxl8FYEUqh+dHzhEKxnSnh52RfVFR+MnxqP5DeZ+mzSN0TL3qLPlQffxc8ko/gqMfNdE3jAzxR3ZggethxWB3d2yL2lrnmmJrLus4+JEBEB1e1+YhAVVR5awWlUbrJrAEUzmiYTAKAeq4jMYVAGDFoG6rR3AnGS8Wi7t8XxlTYEbqrfgNcV79l5iBF2W9m6lzlTnMSErIwDbY/L2ixsMNTsmAYvGX2gBNn0TipC8uaFtQteGHz8+K2qXkVfjRgs1lof0r3e8jRUOYR1Kdf+InYqdfxLBi1MAPKovXezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nG4DK87FyJBHwFeqgQbZAWA9LMt9fa3mRIT5OCQvZ3Y=;
 b=NA93CLT2pTY/IUL7ZCnfVzTx1xZumaOQOlr7rhcFY3dHe0bUczp3KOAyci0i+RhEKv7N8WuB/tVRvEPlDxXgF6ikE0PMnfKWYL3OJBSBaQD4tOBkMcCfSMsB7eFcg7gGQTwTXAt2BK2lnxHMLVjdORN57P15ETragzfGdAe3GHg=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4829.namprd12.prod.outlook.com (2603:10b6:208:1b6::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Mon, 4 Jan
 2021 14:01:25 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af%5]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 14:01:25 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Davide Corrado <davide@davidecorrado.eu>
Subject: Re: amdgpu does not support 3840x2160@30Hz on kaveri apu
Thread-Topic: amdgpu does not support 3840x2160@30Hz on kaveri apu
Thread-Index: AQHW4TgwKhK/bfTKhUetBAcvabUGHqoXgPIA
Date: Mon, 4 Jan 2021 14:01:25 +0000
Message-ID: <MN2PR12MB44884E8F0C885F8DCDCF37CDF7D20@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com>
In-Reply-To: <CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-01-04T14:01:25.086Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: davidecorrado.eu; dkim=none (message not signed)
 header.d=none;davidecorrado.eu; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.78.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4e350433-f7fb-4a89-2e34-08d8b0b939e2
x-ms-traffictypediagnostic: MN2PR12MB4829:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4829E3B6E7ECB557EF529549F7D20@MN2PR12MB4829.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IIZoSkX/oL4rCqhUMWKnnICmR1Rh5cjB/0SZskJfzcgqxWWGH0qx35kd/jweZvEe/pNYQFPfeBRbzhMKfefHNPs3CqmAKR0ZkQFBE2lNsNl0lKfQSOYzf/hoOcypJcdVr5tECD9MPZU8VLE7AhoHGQpVdCJprLP5AZ9SYoSWAi76+HjpLGzsO6p0mMNQvZNKJ6h3tuaV+xIsNq2cGpU1bH9mLBw6S3JX14lKUvlESeGyE6+zl0QD7IsVu/6Fu0fWDzcDkxn1+wKAhOAIzoN4amYKA2bGv8WtezComHFnCbguzrCP5rJBjLM8Fh7GyPsIPPPuTHcPaEVsd6n8xG1nniu/27K5Xo+zRSoY/5fBBuKtCD28C/l0WIXo2Rz/3tKvuceR5+rVGC4Gr8t7zAGmJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(19627405001)(186003)(33656002)(52536014)(316002)(2906002)(5660300002)(55016002)(66946007)(7696005)(9686003)(64756008)(66446008)(66556008)(54906003)(66476007)(76116006)(86362001)(71200400001)(6916009)(4326008)(53546011)(6506007)(8936002)(478600001)(8676002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Bj5XUalqaPsor9aJjXg9A47rpuZNUub/CXPAzWU1q5/RJpaOlX9VfPiSeOm7?=
 =?us-ascii?Q?AJvaf9+vvYTP3TLrZa9zF8+RhprOzFgsmeJCM8wU4Vz+nGEEayxFu8d6HyOn?=
 =?us-ascii?Q?PcQom4FnKyKNBBXQ98MCKJJFkd+eHovf85ZmRv2fDiCnSmQIiCT+ulzXuttG?=
 =?us-ascii?Q?Pq1AoAg+gFrBPuGg80hw3OEkxJ/UAqWk4gQE4gZmjzo13G5C2Y7xdmAR0UqM?=
 =?us-ascii?Q?KwAl2Y73eDrV5g4MslxYzOmOxQg01GC1vQnnQhN6vvsxAK42GtE5Kl3od4F2?=
 =?us-ascii?Q?fXVdrQDJcoE2x5eRY66QXW3qXr8V55kFs/zVuDY1gg7RxTt0qwzs8ElE7YYo?=
 =?us-ascii?Q?mIZuMXKwzJmoQ7FzWBEkGfF5CPKeRarX+ZVZ677ko2cgFSpxoeAcLb8o3ME+?=
 =?us-ascii?Q?TjLtXh/GMSpYKwFSyEIzZ5kp/+xjYeiFDsqtamZZGNcqoSkIDd0yTvHVG4Ue?=
 =?us-ascii?Q?DjSZ1u0apzZ1slX4VbIiAVSBHvPJrowUAAe9aO0PXfP5ZAgZHC1nvAGkVKHh?=
 =?us-ascii?Q?VQqlLImCiSFVmvUfH1AF5Cx8c3YhXsScUI1jzoQ5he1L53oPFX5kaMLG+bZo?=
 =?us-ascii?Q?NgmGtW6KngSUsrwS/a8B6uIVstFWTsuwcisYcGpj5m5w1h7WySGWovKYE7eX?=
 =?us-ascii?Q?juh1df46tPVr3jOXyPeii1zza9qFWMtLxzR70KoPPMqzHoeNoWcOowAUkdJi?=
 =?us-ascii?Q?WgmD6KRwN43NL3akwc1bfu8O1i9JYl6rHsGs1tCpr4fuHmos6IF3yoYVYISv?=
 =?us-ascii?Q?FZ4iHRk1xIBXWlLlstFxRdXmb+dIR0hTUh/ZzAhexa58WQh9RUhXbh50mF4F?=
 =?us-ascii?Q?GHS9UvCv/d7ol+kUmMvW9NskAoJ5XJ2Xw08wQkonQNikMEcsXtHLKhAgH8cE?=
 =?us-ascii?Q?RwLTunN3ByNLdfliUykFfX7UIt31x4KN2QJZVSUrulTtzLZrZmCxYpFcAHkl?=
 =?us-ascii?Q?7h9sBz6wCb2EobXez2dVthmfhLEJvFz7GSev7v6QK+k=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e350433-f7fb-4a89-2e34-08d8b0b939e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 14:01:25.8263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uhCcaLR6hXsEkWf2G1cVJvuf89EcBx6ZE+65YqcwCKpuEiLP9Aa7uBvopBwDew2MIXsH71N4mCYCnrPzHm4nog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4829
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1273368910=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1273368910==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB44884E8F0C885F8DCDCF37CDF7D20MN2PR12MB4488namp_"

--_000_MN2PR12MB44884E8F0C885F8DCDCF37CDF7D20MN2PR12MB4488namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

You might try enabling DC (the newer modesetting infrastructure).  Append a=
mdgpu.dc=3D1 to the kernel command line in grub.

Alex

________________________________
From: Davide Corrado <davide@davidecorrado.eu>
Sent: Saturday, January 2, 2021 1:50 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: Koenig, Christian <Christian.Koenig@amd.com>; airlied@linux.ie <airlied=
@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>; amd-gfx@lists.freedesktop.or=
g <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-dev=
el@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.=
kernel.org>
Subject: amdgpu does not support 3840x2160@30Hz on kaveri apu

hello, I'd like to report this issue that I am having since I updated my di=
splay (samsung U28E590). The amdgpu does not support the native resolution =
of my new monitor, which is 3840x2160. Using a HDMI or DVI connection (I tr=
ied both, same results), the maximum supported refresh is 30Hz, so I'm stuc=
k with that (don't have a displayport). The radeon module works fine, I'm h=
aving this issue just when I use amdgpu (which I'd like to, because perform=
ance is better).

Some info of my hardware:

cpu: AMD A10-7870K Radeon R7, 12 Compute Cores 4C+8G
kernel version (I tried different ones and different linux distros, same re=
sults!): 5.9.16-200.fc33.x86_64 #1 SMP Mon Dec 21 14:08:22 UTC 2020 x86_64 =
x86_64 x86_64 GNU/Linux
Monitor: Samsung U28E590.

description:
If I boot the system using amdgpu and no video mode selection, the system b=
oots but I don't get a screen during boot and in wayland. I can connect usi=
ng ssh, so the system is running fine, just no display; If I force a full H=
D resolution with "video:" in the kernel line, I can see the boot process b=
ut the screen disappears when wayland starts (because the default resolutio=
n is 3840x2160@30Hz). Using a full HD monitor results in no issues, so it m=
ust be related to this very 4k resolution.

As I have already stated, radeon module works with the same software/hardwa=
re configuration.
thanks you so much for your time :-)

--
Davide Corrado
UNIX Team Leader

Via Abramo Lincoln, 25
20129 Milano

Tel +39 3474259950

--_000_MN2PR12MB44884E8F0C885F8DCDCF37CDF7D20MN2PR12MB4488namp_
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
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
You might try enabling DC (the newer modesetting infrastructure).&nbsp; App=
end amdgpu.dc=3D1 to the kernel command line in grub.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Davide Corrado &lt;da=
vide@davidecorrado.eu&gt;<br>
<b>Sent:</b> Saturday, January 2, 2021 1:50 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; airlied@linu=
x.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;; amd=
-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel=
@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;;
 linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;<br>
<b>Subject:</b> amdgpu does not support 3840x2160@30Hz on kaveri apu</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>hello, I'd like to report this issue that I am having since I updated =
my display (samsung U28E590). The amdgpu does not support the native resolu=
tion of my new monitor, which is 3840x2160<i>.</i> Using a HDMI or DVI conn=
ection (I tried both, same results),
 the maximum supported refresh is 30Hz, so I'm stuck with that (don't have =
a displayport). The radeon module works fine, I'm having this issue just wh=
en I use amdgpu (which I'd like to, because performance is better).</div>
<div><br>
</div>
<div>Some info of my hardware:</div>
<div><br>
</div>
<div>cpu: AMD A10-7870K Radeon R7, 12 Compute Cores 4C+8G</div>
<div>kernel version (I tried different ones and different linux distros, sa=
me results!): 5.9.16-200.fc33.x86_64 #1 SMP Mon Dec 21 14:08:22 UTC 2020 x8=
6_64 x86_64 x86_64 GNU/Linux</div>
<div>Monitor: Samsung U28E590.</div>
<div><br>
</div>
<div>description:<br>
</div>
<div>If I boot the system using amdgpu and no video mode selection, the sys=
tem boots but I don't get a screen during boot and in wayland. I can connec=
t using ssh, so the system is running fine, just no display; If I force a f=
ull HD resolution with &quot;video:&quot;
 in the kernel line, I can see the boot process but the screen disappears w=
hen wayland starts (because the default resolution is 3840x2160@30Hz). Usin=
g a full HD monitor results in no issues, so it must be related to this ver=
y 4k resolution.<br>
</div>
<div><br>
</div>
<div>As I have already stated, radeon module works with the same software/h=
ardware configuration.<br>
</div>
thanks you so much for your time :-)<br>
<div>
<div><br>
-- <br>
<div dir=3D"ltr" class=3D"x_gmail_signature">
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">Davide Corrado<br>
<div>UNIX Team Leader<span><br>
</span></div>
<div><br>
</div>
Via Abramo Lincoln, 25<br>
20129 Milano<br>
<br>
Tel +39 3474259950<br>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB44884E8F0C885F8DCDCF37CDF7D20MN2PR12MB4488namp_--

--===============1273368910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1273368910==--
