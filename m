Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FD3A3364A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 04:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5AF10E217;
	Thu, 13 Feb 2025 03:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="J9w6IyQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazolkn19012063.outbound.protection.outlook.com [52.103.2.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C2710E217
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 03:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrglksH9MBdag7pvHbn0pqSkRz2ZLHVlMk1V4Xbj5K4YQ5xZl3PGKzLCUZLfygXaw4uO6WamUjlKZTPu5Pm8PCsVaVLPKhu8BNesdrq7QHRJWaClpYOuOmfxM6Cya/KoZb+hoat72OWAV9ME7BI+3I/GPrczJFJQgX3adCs7C2OguaZMk3hKiz2GHSgk6iKvJAISpR8OLIKiyZv8D9mBDjyjcty3seTdYglimy2zVMCEoYlH9GGQ1YmXY76o8bNLd+3mX9+kuOEimdTLnvUT3Bt/ZG68EE5Rxj3X2doi0awf3KiunBk/HpT0he8bfBqVKG5vzfTvI5PQRHBY+9r2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEJ3iglVUpZCAsVZjuWhUbxA5KpIl62eWU5XXNJe2s8=;
 b=AUhmjT0NJAPkR0fATqn4/7I36SVorNMYsIp/hFdX3dyDHTHysWiPeQdv+W7duAJsV3WCg5BHs8sCHpFw4sPg30kz6ia1GmblE/oZKPOFZgyArmpF40FrsaA+Se8wo56yHzEZquqDAFGFnecTCSWOMQ9DdstaONvRAnYRGc+sfChrHpjHa6QpQosbzQ+BXUIdHaVo2AyoJUqioTiLffOoTg8OKdR7j60u+TvChVeUGPlkUsMlVWX4F0nuuvgxee33hwWP7VdyGXvYqYfT5pMlVFgdhJ2AUY8l6ufWxB3RRp0eIKWdyrTmKYOYd09cYjwkGge0HFxBVREccXClf1z7Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEJ3iglVUpZCAsVZjuWhUbxA5KpIl62eWU5XXNJe2s8=;
 b=J9w6IyQwq2wmwbG17cP37zOA3O1SM2dJufEvgs/xb6WfUzHqRPgSdO+1L8v4Alrjo8mvY8VWXXhr5sh6DgP6zLcOaLMz8RXfwVf4hCvfUToVuwyKL+4bHqvoZzpk4Dwu7vRWmk4mPdzwMuacJBBdbwJ1kAACUZ5PsPHQEmU+acsnjDONj2Zq9l/1huwTdZWWk5k8VVNpXhjYXXNK+wc+pxKpttxDjgHlF+I6C+7ei8uHzG9kchHlNtilaU5qh57F0Tm3i2PLrRfMfaYs3+agx8Tz7xOwdxBmGS9iBRkDe7gOWa9E5BFfMpQC28ogay7xth4haPwcWAE7c74ct1gW9A==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by BY5PR02MB6929.namprd02.prod.outlook.com (2603:10b6:a03:230::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 03:43:07 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8422.010; Thu, 13 Feb 2025
 03:43:07 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
CC: "haiyangz@microsoft.com" <haiyangz@microsoft.com>, "wei.liu@kernel.org"
 <wei.liu@kernel.org>, "decui@microsoft.com" <decui@microsoft.com>,
 "deller@gmx.de" <deller@gmx.de>, "weh@microsoft.com" <weh@microsoft.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH 1/1] fbdev: hyperv_fb: iounmap() the correct memory when
 removing a device
Thread-Topic: [PATCH 1/1] fbdev: hyperv_fb: iounmap() the correct memory when
 removing a device
Thread-Index: AQHbe03JMSfrBLANP0SDwaGKm7HxS7NAe2OAgAAbBUCAAAt0gIAAH9WAgAOyT7CAAB4KAIAACFCQ
Date: Thu, 13 Feb 2025 03:43:07 +0000
Message-ID: <SN6PR02MB4157A86150A5F7055F30E43BD4FF2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250209235252.2987-1-mhklinux@outlook.com>
 <20250210124043.GA17819@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB4157B0F36D7B99A5BF01471CD4F22@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250210145825.GA12377@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250210165221.GA3465@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB4157C1DF0A0101EEF4CA79E2D4FF2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250213030650.GA24166@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20250213030650.GA24166@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|BY5PR02MB6929:EE_
x-ms-office365-filtering-correlation-id: 8b9f4a98-bf1c-4171-da39-08dd4be08769
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|19110799003|8060799006|8062599003|461199028|102099032|3412199025|440099028|12091999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?j7Fd70XX5o3jiX1039b+I/rmY7D8z/xP4ZT2/eLgDZAjin66bmjc6SLvKw5k?=
 =?us-ascii?Q?fNcwXIA4UNeNraL8YQgNRqFpuIpi4/I+b6uJTvGLKXeJ3a69Mcep1QEyOUyZ?=
 =?us-ascii?Q?cIkazj/5Y6tUWhgJpjn3q1m2J1hG7Ibkq+uWHXue16vBtNwYBHvXFea487kw?=
 =?us-ascii?Q?URuLlqypGFbldovSG79/6sF1AA2NBGj5cFxl/z4yv5T59+FXF3a5SL08PZOT?=
 =?us-ascii?Q?IR3coEYrpzo0xthhSU2uasF13LFaWCm89g/o36Y+byZL6r3owWf2+Ji3Wz34?=
 =?us-ascii?Q?yYhIRIsscN7yPGkX0Vew9WcJ+B/3gbTtFCdIW7OrchTWH+m4LPMTX0uk3KyE?=
 =?us-ascii?Q?xnOTjRZbX6C04ejwQZYNMBJqVvsq1zyKO8Ufo1JHDzxI76/44L6SiaZRo2sn?=
 =?us-ascii?Q?q5tdwW0SCzS512QM58x/8AXQ+lkF8S/xM1i0HzLSQLmOulY6VxK0UpV8aeV+?=
 =?us-ascii?Q?b9YfCOt4f/ZUyctRnyvz+QbnOIvJkAjrrUTPDmdimXTmlzj1czHbwRnKNVx2?=
 =?us-ascii?Q?NBYXDB8oOvn/bClbL7gCoVa7aqTr2voTgmUZHvsfyspOsuZXlupIorlM3svS?=
 =?us-ascii?Q?a+ro47u3UutjyYtdc44xMUrFbo6x+Hl5vPEhXKAwt+JWlQbEsgVhsSBfhyqJ?=
 =?us-ascii?Q?3KfHmKC62VODLLCEv7cqZE/tiNieGqYrDQHLO/Xfw9cP2n90GWPHShJ3l0+y?=
 =?us-ascii?Q?S4xUBZJNq8bGMfAKBIs8I927JDhDFLbSruvlJVyLXXuabIuErA8Z1hGy5d7S?=
 =?us-ascii?Q?kK59fQkc8GPLEVyP9wIDyvhvOjQ6xDy5DAUuLZHrF910mL095utveXiIAlc2?=
 =?us-ascii?Q?eXgcj69iRkl4NGvzXlREGaCbdUrpoVTn79oeKpDH93/TApjnGU1CG32kdD/C?=
 =?us-ascii?Q?LE84g1Q2OTgOma+JMGVV52JDcYOZcmX/dNaAl8PbdwsuiYrZXJ974NkKhZHE?=
 =?us-ascii?Q?aSckI6/Zhfj3ceXSI47NKfZ/mc1plg8Lmu4l5xRfOFH5Sb1jm8n/j3skK8Yl?=
 =?us-ascii?Q?jj/giAsAbv6mOOo/meaK2+bDkoeWLxBD4QeYP4L+fDuioUq069C3m5pM4XqA?=
 =?us-ascii?Q?t5AO5gwpsp3zuIZvtZr+m6EWYxn2UQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LCpzpC/Uri0VWjuyjcv3HH2EB/ws2exuOOATgdDjwG5p9Vu1UAt2V2mbeCrp?=
 =?us-ascii?Q?9J0EpVSRJJwldMD/DeaXIrZylpwRAdaRwoYMZBb2eggyh8yvVc2Y1I9e8Lxg?=
 =?us-ascii?Q?5hz6PA0say1YPtu4X3t68LcKSCJuHeYdwz4KE0rdxw/LgqUp6XwIbaTkXekk?=
 =?us-ascii?Q?hreAVyNCf1NY6j/+bKaVnVsTMR3/gBpyCZGbPL26Shn9O1wt6WQLMuUg42Cm?=
 =?us-ascii?Q?C4hYzIQyrtU0JPYK45507NL1weXPBbWuUgb+s88/peMffTfArd70xB4dwgii?=
 =?us-ascii?Q?erjY3EfhdmGWjlOPhJzLy7Smk0Ypop+kJxxStnYv5mVuklH9PXSAYUNQ/D71?=
 =?us-ascii?Q?d0y6s1I6hMkujehMQ7qwM7o+nPirhudn/P355gskWkbe8i+jLyCeIQebtJdx?=
 =?us-ascii?Q?hltEXqZq/zV9W2Eli2qaH7FOvzpo4kanmsA2tivEVAR8siKyp97HKMV1TeRU?=
 =?us-ascii?Q?9+Mghf4/FHVP25gnwFy8LUZByq12OWiVhol+rmXpWx1lyiFV7m8tWuTXqgbM?=
 =?us-ascii?Q?wqbvsRu1KcmZvCeZYVOE+TXBWr+eYKCjXKNYPugVUo7v0Fu+Gttl9T+V+NM9?=
 =?us-ascii?Q?ccqkUEn3ARJQN8TFagcvEheim4SAmGaZPxgLKEaXHjybh0jQAEewF1Ym5JDp?=
 =?us-ascii?Q?Ets3cUWXtSaXcOyVFy69DYmdY1FxxkEmk0vLI7q6nX6AxuISg/9yHjcoJzy3?=
 =?us-ascii?Q?6wy/ZvcctzW61d0gI/p1NbN/t3lNayfxRgYr3t8wpOhMDBkz6827hiW3u9ls?=
 =?us-ascii?Q?XaIlWf7eANc1HtesnU7s9Rs4EMRZ4gboXedBb8y8RK6w9x5VkdTtW9cPuJ/7?=
 =?us-ascii?Q?ftrILJ/LHchJa1NSzYa4n9TjFxLlvTAMG5Fz2cIOauReAlAQHVDtpLuju7v5?=
 =?us-ascii?Q?hMgJWCZHma9NH/Hk/ulaPdRCU3sGeSEwWr8gsZTfsVLnH92MsaFwSwrjTZDq?=
 =?us-ascii?Q?5TvXZay2D4ze2JnQK8IgcWgsPQrd47CUmsM1WX5FEYGEi/KGK/Vs1i8E/MuG?=
 =?us-ascii?Q?L77Lw7rPCZIjOJJyKngIO8XHwLLgLzzMxHIEKb9WgK1c8PwBOlICc7wv0VKF?=
 =?us-ascii?Q?fMtU7o5OC6q16jqkFEYbxx+44fEwA+jtVWADzMhQ3NL60/GCIm8YFPOAtfSx?=
 =?us-ascii?Q?Jw5HJdruXZs/NXIPwafuLW39HmntvSrtgjORiVbFUyhyw2Ug5afatsnLyU27?=
 =?us-ascii?Q?Rk7Gtbb80pUzFNygkM4NjCjmNaN5y/o5tsitCx4j+4miP8Nms5G/9vpql2o?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9f4a98-bf1c-4171-da39-08dd4be08769
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 03:43:07.2827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6929
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

From: Saurabh Singh Sengar <ssengar@linux.microsoft.com> Sent: Wednesday, F=
ebruary 12, 2025 7:07 PM
>=20
> On Thu, Feb 13, 2025 at 01:35:22AM +0000, Michael Kelley wrote:
> > From: Saurabh Singh Sengar <ssengar@linux.microsoft.com> Sent: Monday, =
February 10, 2025 8:52 AM
> > >
> > [snip]
> > > > > >
> > > > > > While we are at it, I want to mention that I also observed belo=
w WARN
> > > > > > while removing the hyperv_fb, but that needs a separate fix.
> > > > > >
> > > > > >
> > > > > > [   44.111220] WARNING: CPU: 35 PID: 1882 at drivers/video/fbde=
v/core/fb_info.c:70 framebuffer_release+0x2c/0x40
> > > > > > < snip >
> > > > > > [   44.111289] Call Trace:
> > > > > > [   44.111290]  <TASK>
> > > > > > [   44.111291]  ? show_regs+0x6c/0x80
> > > > > > [   44.111295]  ? __warn+0x8d/0x150
> > > > > > [   44.111298]  ? framebuffer_release+0x2c/0x40
> > > > > > [   44.111300]  ? report_bug+0x182/0x1b0
> > > > > > [   44.111303]  ? handle_bug+0x6e/0xb0
> > > > > > [   44.111306]  ? exc_invalid_op+0x18/0x80
> > > > > > [   44.111308]  ? asm_exc_invalid_op+0x1b/0x20
> > > > > > [   44.111311]  ? framebuffer_release+0x2c/0x40
> > > > > > [   44.111313]  ? hvfb_remove+0x86/0xa0 [hyperv_fb]
> > > > > > [   44.111315]  vmbus_remove+0x24/0x40 [hv_vmbus]
> > > > > > [   44.111323]  device_remove+0x40/0x80
> > > > > > [   44.111325]  device_release_driver_internal+0x20b/0x270
> > > > > > [   44.111327]  ? bus_find_device+0xb3/0xf0
> > > > > >
> > > > >
> > > > > Thanks for pointing this out. Interestingly, I'm not seeing this =
WARN
> > > > > in my experiments. What base kernel are you testing with? Are you
> > > > > testing on a local VM or in Azure? What exactly are you doing
> > > > > to create the problem? I've been doing unbind of the driver,
> > > > > but maybe you are doing something different.
> > > > >
> > > > > FWIW, there is yet another issue where after doing two unbind/bin=
d
> > > > > cycles of the hyperv_fb driver, there's an error about freeing a
> > > > > non-existent resource. I know what that problem is, and it's in
> > > > > vmbus_drv.c. I'll be submitting a patch for that as soon as I fig=
ure out
> > > > > a clean fix.
> > > > >
> > > > > Michael
> > > >
> > > > This is on local Hyper-V. Kernel: 6.14.0-rc1-next-20250205+
> > > > I run below command to reproduce the above error:
> > > > echo "5620e0c7-8062-4dce-aeb7-520c7ef76171" >
> > > /sys/bus/vmbus/devices/5620e0c7-8062-4dce-aeb7-520c7ef76171/driver/un=
bind
> > > >
> > > > When hvfb_remove is called I can see the refcount for framebuffer i=
s 2 when ,
> > > > I expect it to be 1. After unregistering this framebuffer there is =
still 1 refcount
> > > > remains, which is the reason for this WARN at the time of framebuff=
er_release.
> > > >
> > > > I wonder who is registering/using this extra framebuffer. Its not h=
yperv_drm or
> > > > hyperv_fb IIUC.
> > > >
> > > > - Saurabh
> > >
> > > Here are more details about this WARN:
> > >
> > > Xorg opens `/dev/fb0`, which increases the framebuffer's reference
> > > count, as mentioned above.  As a result, when unbinding the driver,
> > > this WARN is expected, indicating that the framebuffer is still in us=
e.
> > >
> > > I am open to suggestion what could be the correct behavior in this ca=
se.
> > > There acan be two possible options:
> > >
> > >  1. Check the framebuffer reference count and prevent the driver from
> > >     unbinding/removal.
> > > OR
> > >
> > >  2. Allow the driver to unbind while issuing this WARN. (Current scen=
ario)
> > >
> >
> > >From looking at things and doing an experiment, I think there's a 3rd
> > option, which gets rid of the of the WARN while still allowing the unbi=
nd.
> >
> > The experiment is to boot Linux in a Gen2 Hyper-V guest with both the
> > Hyper-V FB and Hyper-V DRM modules removed. In this case, the
> > generic EFI framebuffer driver (efifb) should get used. With this drive=
r,
> > a program can open /dev/fb0, and while it is open, unbind the efifb
> > driver (which is in /sys/bus/platform/drivers/efi-framebuffer).
> > Interestingly, there's no WARN generated. But when the hyperv_fb
> > driver is loaded and used, the WARN *is* generated, as you observed.
> >
> > So I looked at the code for efifb.  It does the framebuffer_release()
> > call in a function that hyperv_fb doesn't have. Based on the comments
> > in efifb.c, we need a similar function to handle the call to
> > framebuffer_release().  And the efifb driver also does the iounmap()
> > in that same function, which makes we wonder if the hyperv_fb
> > driver should do similarly. It will need a little more analysis to
> > figure that out.
> >
> > You found the bug.  Do you want to work on fixing the hyperv_fb
> > driver? And maybe the Hyper-V DRM driver needs the same fix.
> > I haven't looked. Alternatively, if you are busy, I can work on the fix=
.
> > Let me know your preference.
> >
> > Michael
>=20
> Thanks for your analysis, its a good to know about fbib driver is not hav=
ing
> this issue. We can take it as a reference.
>=20
> At the first look I see efib driver is having a fb_ops.fb_destroy functio=
n
> which gets called after put_fb_info (responsible for decrementing the
> ref count).=20

Yes, that's exactly what I was thinking.  If some user space program has
/dev/fb0 open, the driver can be unbound and the unbind will succeed.
The user space program will get an error the next time it tries to referenc=
e
the open device file descriptor. Presumably the user space program will
close /dev/fb0 at that point, or just terminate with an error, in which cas=
e
Linux will close /dev/fb0 as the user space process terminates. In either
case, fb_info sticks around until that happens and causes the refcount to
be decremented to 1, and then the destroy function is called to do
the final cleanup and free the memory for the fb_info structure.

At least that's what I think happens based on the comments in the
efifb driver. :-) But I have not spent time checking all the details.

> Also it uses devm_register_framebuffer which handles the registration
> and unregister of framebuffer more gracefully.
>=20
> I will work on this.
>=20

Sounds good.  It's in your court.

Michael
