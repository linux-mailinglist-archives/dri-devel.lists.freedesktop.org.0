Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B12E71A6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 16:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAEB892F0;
	Tue, 29 Dec 2020 15:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDAB8928F;
 Tue, 29 Dec 2020 15:15:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2sgVHTW0SaxX3Z5SMRo+PSy2fupHi4lo+awqcAXz/Flr1wJv8/68UDLq+5tWBDdTnhu5Fd1gtaAOGtJCDaBzzG+35biqFUR6K7IKI/AOMZnNE60mdXeZEYmNyjx6WTP5IaOK7lYvs1nbaDo3hfpnWCeUc5ha0pRnSERFfDt3MEe5wCBp9gAiJlqpgXfWZYn9j46+r1rWikhra/eQ3YBuxqmFSU1uPuAsKl7/vXqIPG8cBTk3+BGxniab4pt0wpqDfNI+vfP5np7XArAtX4mIiQNl/jFmDGsSRCIsbudNeoGZt5EIvmhElY+/1FIzshngJh8gM57h9toAq4roVPMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wm16imKMtrqo5eUAfV6FYhtT6SiVt6QakD13PlP95fI=;
 b=eBPAHGOUB6QCrvZMTGSZyZ9GoKvosD6/LrIOyHrldSNdPS6QWbpQL2c8wzuX2e+9dOVeGi1ZPqQASzx4z6GYrnnQZbgDoGO1if6AqGFT7Qz88ICmjYaxNt9xD6GeI1EdvD9aOh4/lo0QTKBu7SjOvXmXd4M1ejj4k/vLJLQmKIWtuHam4wyl82xZt/Mx7QbzPYwTFXdbqHzKiD2wn83TsiYzGNRa+0PLBRBoX7Y/F+zVwG4/nuK1yZI4uQacun/bx0gQhJCLYn/wUxSeIp8YoH+Oh8jfAFpshQtIICdFHgFUquXl7WQvkLMY/d2baND7s9HKWdRwLU9Td/dKSyOb2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wm16imKMtrqo5eUAfV6FYhtT6SiVt6QakD13PlP95fI=;
 b=QYULIQL+pl/IWCW1NbDrntQNhCJRe9BpDLXlD9YhqAKxw2Ltc8fRwEyQCtVqTWcF2xDER/t6d+BwKqFu4IxE7P/JjoNGNPcAR4luOhf/HBA7WN1vUFoyAD1S8wk8+8lbnAcow8oKy4T/TNQyL2ATVtyXAuUuGwjRmeewvsBJkXk=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4045.namprd12.prod.outlook.com (2603:10b6:208:1d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.30; Tue, 29 Dec
 2020 15:15:23 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af%4]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 15:15:23 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, Linux List Kernel Mailing
 <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [bug] Radeon 3900XT not switch to graphic mode on kernel 5.10
Thread-Topic: [bug] Radeon 3900XT not switch to graphic mode on kernel 5.10
Thread-Index: AQHW3G87ywXkQsMVxU2mT8PUtoWaXaoLKhYAgAMHgog=
Date: Tue, 29 Dec 2020 15:15:23 +0000
Message-ID: <MN2PR12MB4488AAA880BA8896EEA97491F7D80@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <CABXGCsPsXSTh+WO2XESOU+Q1ocrWmS1c1YJFarzmA=woK_ke5Q@mail.gmail.com>,
 <CABXGCsPBBDX3ozAgtT174nesiM+Gx4UkQi+PD27jB3i9OQ=G0g@mail.gmail.com>
In-Reply-To: <CABXGCsPBBDX3ozAgtT174nesiM+Gx4UkQi+PD27jB3i9OQ=G0g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=True;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-12-29T15:15:22.557Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=AMD
 Public; MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.78.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bd81810e-9495-4675-0542-08d8ac0c9035
x-ms-traffictypediagnostic: MN2PR12MB4045:
x-microsoft-antispam-prvs: <MN2PR12MB40451B62E7278A75F776C51DF7D80@MN2PR12MB4045.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pYgpj3P1eCTC9WogfGnlwLoSqf/o8ai6Rs+TEP6qPbIibmebu53CjhnU7g7Lf4FpV6pYp8GHWm4oHJi+lGUx8Sd9BAQ5WlJpRwYiGf/100cm83S/EKB+i+lypPRvUJ68/k/aH7NHKDVWvOY9WiN9sRu6167NKY2w0BSia3Qcn6Xi6OWTBLEbyfPtzV0vqTT4X22a03HVjz6iQ+TiHJOhxqRQnXLxBsNKXP9qswyLOQKCwClMsLzCCh0PdhfV8us32aiErmbQbn0UiIi/7+Lk2epZU1uZ3hEYA3FwI/BfzlfKH0AZmWQZmSUShAfjLxc+zqgwcXwh2u14uwieWLNtIasypta1dvMwAP/KSujg3AwYQh2zIlfj7LIO/yVwvGHwhTlsDAcSwJ3DjsweVZB1ZKvYkdWfffT4kSR2zGLi7b8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(55016002)(76116006)(966005)(64756008)(66946007)(5660300002)(316002)(33656002)(9686003)(66446008)(6506007)(53546011)(71200400001)(110136005)(7696005)(8936002)(52536014)(478600001)(186003)(26005)(166002)(86362001)(83380400001)(66556008)(45080400002)(66476007)(19627405001)(8676002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LbucVPI5GeIqdAW7ZrL87lFjugNZ9DP2IxgP7I8Hs0/huYjqRNXtg98Z8r12?=
 =?us-ascii?Q?7MivMjeh+mG+55zcq018DWG9RP4sEKSk2mEiYlp2YAKyHMAOKKyxrc8HhMv+?=
 =?us-ascii?Q?m0j4inmFtS7VxotPQp5n0elDTlkWmt0SaBkID4Hl6m1DJTJOSeYaGPpZ/Ats?=
 =?us-ascii?Q?idhIO6UbVU/6zIaMsSta+ONf++ZtZXvSDxMFuiRI6MIKE3OwWm/6GEI1/hSp?=
 =?us-ascii?Q?ZBg1nMKNdVTIUkYaGYAWqXdJ6l24+JQLm+OzClIkKUFQcTj4rr+mdQaZHi5h?=
 =?us-ascii?Q?X+kHdfsM/spn9l6tYXtGAXaPcLzj5ogfnbuJuGAdJnCDWMZ26kICdR2hMg75?=
 =?us-ascii?Q?lc/NOewfmzbjxmyW+ca6amoWk50vmdj71dtxFIDYOeLRNtpPjKsG1EA0YXS7?=
 =?us-ascii?Q?SJ+7159/Ma+xs3oV6DMMHGhWX8qQd4BmFZoD4Cypuhcj9ErukoxLOOsVQYcJ?=
 =?us-ascii?Q?IBLfcruhohzvpS1DuDiV8a143uNPNuYx9lofPJVTEvYESGNEy1SILqJQLVwD?=
 =?us-ascii?Q?vzEiKfaZVWp8fW2wh6f0B9RHEE+QeAvQ6AgNIraq/vhtya8/yV9lla3ue5id?=
 =?us-ascii?Q?Tg9vkDfaxqv84mcDm2vSVoT44Ic4Mdph5JO+ket1o4QPZrQIouOCXvlRjdyU?=
 =?us-ascii?Q?x4ZataEGelg7MpKcEsM9oC+abtc8tI4HqwA9mP+ls/3kK94yw3JoxpHemDPJ?=
 =?us-ascii?Q?5/S30xWg9+1tUYzwCKVOLf65LBM+e+/qOK9iY+309YGIWAWuf/JDu7Hq5nby?=
 =?us-ascii?Q?iv7xpFPDh5IY9hDWwhl2TbEVvPpQVx6W4Bli2tRmadAfx6cX3kSt7QfnulOX?=
 =?us-ascii?Q?rZtm7zD/1k6vWPZj2noVdymkCCZDqA1jtlp+D0Puwf6WLncYz83q0FCPvYU9?=
 =?us-ascii?Q?twFobS6/OxGaJKui8Qq5XLoHC1A3+p44+FS+a5MmhyXEokcGXQJhLqY8FQ5j?=
 =?us-ascii?Q?66LZJDVoyyVWvu4WBNJW+u0yvjFqA7DCldPQG74nQE4=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd81810e-9495-4675-0542-08d8ac0c9035
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2020 15:15:23.1246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Na8lTjjoEdPRfRnkl3qi/ARm5h1DAsxRyzf3dk3L0pcPvqH4BEOc43Vj4wZTcpcoHzIoII2giIk0WlLFnSbIjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4045
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
Content-Type: multipart/mixed; boundary="===============1125289520=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1125289520==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4488AAA880BA8896EEA97491F7D80MN2PR12MB4488namp_"

--_000_MN2PR12MB4488AAA880BA8896EEA97491F7D80MN2PR12MB4488namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

It looks like the driver is not able to access the firmware for some reason=
.  Please make sure it is available in your initrd or compiled into the ker=
nel depending on your config.

Alex

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Mikhail =
Gavrilov <mikhail.v.gavrilov@gmail.com>
Sent: Sunday, December 27, 2020 11:58 AM
To: amd-gfx list <amd-gfx@lists.freedesktop.org>; Linux List Kernel Mailing=
 <linux-kernel@vger.kernel.org>; dri-devel <dri-devel@lists.freedesktop.org=
>
Subject: Re: [bug] Radeon 3900XT not switch to graphic mode on kernel 5.10

On Sun, 27 Dec 2020 at 21:39, Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
> I suppose the root of cause my problem here:
>
> [    3.961326] amdgpu 0000:0b:00.0: Direct firmware load for
> amdgpu/sienna_cichlid_sos.bin failed with error -2
> [    3.961359] amdgpu 0000:0b:00.0: amdgpu: failed to init sos firmware
> [    3.961433] [drm:psp_sw_init [amdgpu]] *ERROR* Failed to load psp firm=
ware!
> [    3.961529] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* sw_init
> of IP block <psp> failed -2
> [    3.961549] amdgpu 0000:0b:00.0: amdgpu: amdgpu_device_ip_init failed
> [    3.961569] amdgpu 0000:0b:00.0: amdgpu: Fatal error during GPU init
> [    3.961911] amdgpu: probe of 0000:0b:00.0 failed with error -2
>

# dnf provides */sienna_cichlid_sos.bin
Last metadata expiration check: 3:01:27 ago on Sun 27 Dec 2020 06:53:25 PM =
+05.
linux-firmware-20201218-116.fc34.noarch : Firmware files used by the
Linux kernel
Repo        : @System
Matched from:
Filename    : /usr/lib/firmware/amdgpu/sienna_cichlid_sos.bin

linux-firmware-20201218-116.fc34.noarch : Firmware files used by the
Linux kernel
Repo        : rawhide
Matched from:
Filename    : /usr/lib/firmware/amdgpu/sienna_cichlid_sos.bin

# dnf install linux-firmware-20201218-116.fc34.noarch
Last metadata expiration check: 3:02:11 ago on Sun 27 Dec 2020 06:53:25 PM =
+05.
Package linux-firmware-20201218-116.fc34.noarch is already installed.
Dependencies resolved.
Nothing to do.
Complete!

Looks like firmware is present. So I didn't understand why the kernel
cannot read firmware.

--
Best Regards,
Mike Gavrilov.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Calexande=
r.deucher%40amd.com%7Cf76668be26de4be7d0af08d8aa88a8dc%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637446851228684932%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdat=
a=3DNOQO9oeX9gOmM7aOThep5kjURTTn14N5nNkhGx7rofQ%3D&amp;reserved=3D0

--_000_MN2PR12MB4488AAA880BA8896EEA97491F7D80MN2PR12MB4488namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#317100;margin:15pt;" al=
ign=3D"Left">
[AMD Public Use]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
It looks like the driver is not able to access the firmware for some reason=
.&nbsp; Please make sure it is available in your initrd or compiled into th=
e kernel depending on your config.<br>
</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Mikhail Gavrilov &lt;mikhail.=
v.gavrilov@gmail.com&gt;<br>
<b>Sent:</b> Sunday, December 27, 2020 11:58 AM<br>
<b>To:</b> amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Linux List K=
ernel Mailing &lt;linux-kernel@vger.kernel.org&gt;; dri-devel &lt;dri-devel=
@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [bug] Radeon 3900XT not switch to graphic mode on kerne=
l 5.10</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Sun, 27 Dec 2020 at 21:39, Mikhail Gavrilov<br>
&lt;mikhail.v.gavrilov@gmail.com&gt; wrote:<br>
&gt; I suppose the root of cause my problem here:<br>
&gt;<br>
&gt; [&nbsp;&nbsp;&nbsp; 3.961326] amdgpu 0000:0b:00.0: Direct firmware loa=
d for<br>
&gt; amdgpu/sienna_cichlid_sos.bin failed with error -2<br>
&gt; [&nbsp;&nbsp;&nbsp; 3.961359] amdgpu 0000:0b:00.0: amdgpu: failed to i=
nit sos firmware<br>
&gt; [&nbsp;&nbsp;&nbsp; 3.961433] [drm:psp_sw_init [amdgpu]] *ERROR* Faile=
d to load psp firmware!<br>
&gt; [&nbsp;&nbsp;&nbsp; 3.961529] [drm:amdgpu_device_init.cold [amdgpu]] *=
ERROR* sw_init<br>
&gt; of IP block &lt;psp&gt; failed -2<br>
&gt; [&nbsp;&nbsp;&nbsp; 3.961549] amdgpu 0000:0b:00.0: amdgpu: amdgpu_devi=
ce_ip_init failed<br>
&gt; [&nbsp;&nbsp;&nbsp; 3.961569] amdgpu 0000:0b:00.0: amdgpu: Fatal error=
 during GPU init<br>
&gt; [&nbsp;&nbsp;&nbsp; 3.961911] amdgpu: probe of 0000:0b:00.0 failed wit=
h error -2<br>
&gt;<br>
<br>
# dnf provides */sienna_cichlid_sos.bin<br>
Last metadata expiration check: 3:01:27 ago on Sun 27 Dec 2020 06:53:25 PM =
+05.<br>
linux-firmware-20201218-116.fc34.noarch : Firmware files used by the<br>
Linux kernel<br>
Repo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : @System<br>
Matched from:<br>
Filename&nbsp;&nbsp;&nbsp; : /usr/lib/firmware/amdgpu/sienna_cichlid_sos.bi=
n<br>
<br>
linux-firmware-20201218-116.fc34.noarch : Firmware files used by the<br>
Linux kernel<br>
Repo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : rawhide<br>
Matched from:<br>
Filename&nbsp;&nbsp;&nbsp; : /usr/lib/firmware/amdgpu/sienna_cichlid_sos.bi=
n<br>
<br>
# dnf install linux-firmware-20201218-116.fc34.noarch<br>
Last metadata expiration check: 3:02:11 ago on Sun 27 Dec 2020 06:53:25 PM =
+05.<br>
Package linux-firmware-20201218-116.fc34.noarch is already installed.<br>
Dependencies resolved.<br>
Nothing to do.<br>
Complete!<br>
<br>
Looks like firmware is present. So I didn't understand why the kernel<br>
cannot read firmware.<br>
<br>
--<br>
Best Regards,<br>
Mike Gavrilov.<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%=
7C01%7Calexander.deucher%40amd.com%7Cf76668be26de4be7d0af08d8aa88a8dc%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637446851228684932%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;amp;sdata=3DNOQO9oeX9gOmM7aOThep5kjURTTn14N5nNkhGx7rofQ%3D&amp;a=
mp;reserved=3D0">https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=
=3D04%7C01%7Calexander.deucher%40amd.com%7Cf76668be26de4be7d0af08d8aa88a8dc=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637446851228684932%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;amp;sdata=3DNOQO9oeX9gOmM7aOThep5kjURTTn14N5nNkhGx7rofQ%3D=
&amp;amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB4488AAA880BA8896EEA97491F7D80MN2PR12MB4488namp_--

--===============1125289520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1125289520==--
