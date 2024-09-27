Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35F19889A7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 19:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1510E058;
	Fri, 27 Sep 2024 17:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="Dz/3rdtg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1A910E058
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727457857; x=1728062657; i=w_armin@gmx.de;
 bh=wtDpYwOAOKofX4RvJxSntDIhYtfMCgqh7rhIZgRfwJ8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Dz/3rdtgo8HuFlpeYoPdpN+wDz0PfnvnSpLNwil0ESUUAQ9nmXjSonO005/zCIZC
 0c2rHHLImM8hjjtDR4X9/6wWgfcaiZvUr34A9p8YNLjumH0cY4OzVtyusuhzpsXCH
 YCt14HS5mN8WwoWmVi2duCr+uvtmTj4NpOr77QhXAhFouTNcwEqgmdUoy6A1QaXFV
 GEDNwwHFNnYxxdtbVoW+CKamT7UxHRX9qIp89mUjq6knmkv7MKwcuSXKw0gedecB7
 QnJvKLLh160Z6bLJBOzZiLwOW1QU39RWjDfk4zvaeCTDKvJ8dKyW4KsvXswasOw5a
 RwJCRPSbwa8RZYTb1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1sOnoW3TbW-00QuPw; Fri, 27
 Sep 2024 19:18:42 +0200
Message-ID: <95d1342d-f2a1-4f55-b8f9-d1ede1207aaa@gmx.de>
Date: Fri, 27 Sep 2024 19:18:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, jelle@vdwaa.nl,
 jikos@kernel.org, lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, platform-driver-x86@vger.kernel.org
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ad01bc38-3834-44c9-a5e3-540a09a20643@gmx.de>
 <3dde4572-78a0-4a93-916a-563b7150f078@tuxedocomputers.com>
 <3e5630c0-2ab4-49fc-8b91-988b327bdcf8@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <3e5630c0-2ab4-49fc-8b91-988b327bdcf8@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VFjl67dLNrv6Jc4tqj4gacATd5Ifbha8xEOZ4lw5in4oH2CWA8t
 MYnzLPSKY1axuJqaUQMWHFQYPKO1pZAxYxN0X8Mmd2AkbecbkzKKo/RgtKAz8ANi73lMeXI
 t/h2gowUjE3f+AAMAmK1Rm4hqp+m8gFY7wGH6HQ4lq5P917kN9fxelePqkrx7szzQZOd4ud
 o0/LSuuDcFwKE0aNNKjnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mkdCgxxG4ek=;lMBCRP/gdU7wWRErQ6or8squvLl
 BoO3yyWFfg+VY/Q0dI/e1P+k36eFpXq7qM+HfeUQ7T5jW8R+GB+i7AerSCD2Usuxzzwht6Gln
 wtGzlTvLjYOyJ2Q3lpUcWAGCP9LUwh9GQQRTCBax2TDAUCBnQh6kpsJy4SVaGDcxIMeMGXrrF
 C3Ka58d21WWKx2BU7yHOiek0192rVKTRKUE5pqIToL1wzfJYsxMFBoeV9z9TfTslAPuMiH5Mb
 xsMFZEZTMY5QyT2+10dTzPy8hNM/MK2YRNgToPrXx+XCjB02+DeZM3pRoZ78KdKL9hO/DYzKV
 cvxVlECe9H1BH7UI7ZGdVkyze4IoXaVdfbMkkq8BmJ1pALLLrs/icpyAlz1lYFPiEddSWLt4+
 kGSGZnkaFxhCedkg0YbYe3EDs9MfxLb5oUx9+jCmbi+tnBNLcRG8lvEX9bKVOyrLpj7owdahR
 /1zKUmny8axUCGd3rTU5fuBTtFZsElNXQTB1sQLafL+2TJ0hc97TJLd5zeU6fZH5NYQAGxpy6
 rgMsxQEONZXq7DJ8wmtbhBnQNKKl2BVGBFUUhvErBl0CEYwTw8Gi4LMS/A3UQFCtOH/k95O32
 6e5h1dzCwV883SLw+5yfciiHwa/++VCR/53cQKCZMckBFmStu4kGP42X/8FMFZRIHr0VuXy5l
 O0s7h+sGduWGTxLNJ/5+uZ3f6dNs9hpIKzwz/yslGiqgaVQR5R6gO8qseNvBYnc3mqjTGEqZd
 v4oleeCphNJPQNjfCGOGAooR+jxnJKwk5yZ6F5ooNCIqGf0h40FX6oM3Uyarz6ylXzYnJA/QT
 nZ856Vk0JIk9xTKPoAweX95g==
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

Am 27.09.24 um 13:24 schrieb Werner Sembach:

> Hi,
>
> an additional question below
>
> Am 27.09.24 um 08:59 schrieb Werner Sembach:
>> Hi,
>>
>> Am 26.09.24 um 20:39 schrieb Armin Wolf:
>>> Am 26.09.24 um 19:44 schrieb Werner Sembach:
>>>
>>>> [...]
>>>> +// We don't know if the WMI API is stable and how unique the GUID
>>>> is for this ODM. To be on the safe
>>>> +// side we therefore only run this driver on tested devices
>>>> defined by this list.
>>>> +static const struct dmi_system_id tested_devices_dmi_table[] =3D {
>>>> +=C2=A0=C2=A0=C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TUXEDO Sirius 16 Gen1
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
MI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
MI_EXACT_MATCH(DMI_BOARD_NAME, "APX958"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>> +=C2=A0=C2=A0=C2=A0 },
>>>> +=C2=A0=C2=A0=C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TUXEDO Sirius 16 Gen2
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
MI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
MI_EXACT_MATCH(DMI_BOARD_NAME, "AHP958"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>> +=C2=A0=C2=A0=C2=A0 },
>>>> +=C2=A0=C2=A0=C2=A0 { }
>>>> +};
>>>> +
>>>> +static int probe(struct wmi_device *wdev, const void
>>>> __always_unused *context)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tuxedo_nb04_wmi_driver_data_t *driver_data=
;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (dmi_check_system(tested_devices_dmi_table))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>>
>>> Hi,
>>>
>>> please do this DMI check during module initialization. This avoids
>>> having an useless WMI driver
>>> on unsupported machines and allows for marking
>>> tested_devices_dmi_table as __initconst.
> I wonder how to do it since I don't use module_init manually but
> module_wmi_driver to register the module.

In this case you cannot use module_wmi_driver. You have to manually call w=
mi_driver_register()/wmi_driver_unregister()
in module_init()/module_exit().

>>>
>>> Besides that, maybe a "force" module parameter for overriding the
>>> DMI checking could be
>>> useful?
>
> Considering the bricking potential i somewhat want for people to look
> in the source first, so i would not implementen a force module parameter=
.
>
Ok.

> Kind regards,
>
> Werner
>
>
