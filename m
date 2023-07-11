Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E943D74F3FD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 17:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2BA10E0D3;
	Tue, 11 Jul 2023 15:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1308 seconds by postgrey-1.36 at gabe;
 Tue, 11 Jul 2023 15:46:11 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8C810E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1689090368; x=1689695168; i=deller@gmx.de;
 bh=10xMRkjlDtxZS9LQyRHHnsW87xAMUprLN04Jvmm+ctI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=conMbIE+nxzY1Ihl5gk4rASMagP3eSIKPLkMUeO6/ZvgOZzo7Ab1Bg8ex+Ls7LSn/jXxLDn
 8V5X0NbouhxtvH7SQrMG7cXZtcwFYfHLNbtItK46cGi8gZdJtwoN5YGGqJb9Q5kI698pnisuO
 37OawNy05VPw42nAUnYZPhtF5w6+vRQcTIk2AanIXP0SfOsmuDvvVDoDTDeLciyUB8dPQwhY4
 NNb/oigsZ1YiQaHzRRBVtVe/42Q/08JYqaS58QOf7Uoh5wnvzMHJsmnJKxoA3yolfQuk4UXh1
 aMu9avW7Y1+roZIGDxXa1qNCSf4E/VJbhmeSPYmqLHRPFG610nLw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.147]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zFZ-1pxXrX15Wd-015041; Tue, 11
 Jul 2023 17:46:08 +0200
Message-ID: <4de35c35-c00d-d21a-bcd1-dc878137eb94@gmx.de>
Date: Tue, 11 Jul 2023 17:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] of: Preserve "of-display" device name for compatibility
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Michal Suchanek <msuchanek@suse.de>
References: <20230710174007.2291013-1-robh@kernel.org>
 <a0aa122d-38a1-d4be-edc1-a49b4e5e9b6b@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <a0aa122d-38a1-d4be-edc1-a49b4e5e9b6b@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OekAkpBqUCxuG1+JyXZyC7/2fpPfrldaJSFdZme0KAcMxvUfeoN
 veCEfU7iFi+a33ulHh5TfAyA1lGOR+hPuATf/vCJiEjRac5ET/QcWuzxRrXC/JbS9tIaNNa
 8WwNTT3gM669xDj/3PmH4YPkl4FGnnA9IPPBTBzjkuxWQZn0X5XPAeF9kgFzwGk3/c7n9ww
 dKADfwpo0wxkxshZ5IxAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZN1cWxUa0fI=;fgbb/uD6p39KTmTtmPiJHwFZeeg
 a6ylHQ320VvmzbF5ViY2jAzht3LKGyiN5mBiVzbuoperXxo1A5RCyZ9AbMr1TENEFsUeyhkQG
 VJkdW2TdDh8pMKSCGItqXSk862RgTlb2O+NgbKaIXDrS0CysuppJIC7dCOygf82xW3oDU8M4B
 VeUNgqtLzVn00ABC1r0t2RCukrSqeHlZwmu8T0t2uoiuZZP5OFLE9ii2aAo4pa79/KiIVq4UZ
 AA1iFKyAD9OMi6p3Yv8D5qdw/NGG6m9M6QKbXpQ9qXMTma4zxLoM1lS0gRXlnKGlZOkc9F7dp
 FLLe+rH72FXy+aFqsESouj5ZBiQAwxr9Ypks8sObOYHhC5Gre1Ng5iX3KKLCZ3N1vTjHmtT3C
 u9efBJOAZIqyxe6gWMD9ZuMqVx2Jmq8NUe85tggFvLqD/cPo1sDjAs9ucqpNh9tB7OJmZ+37M
 p6z/ndoguoWpdHGzq8HOhogzQOy/z85R/vIm0cqYcEZD6CAzQU35KXgNTI402sq9pofZHFM/Q
 KnEU+XZUiHQOCFMh0aO+Kq3uiomuEF+CfWnouQdZCj5Jo6mDnSHY6V93UpHakHj89PgP6sf+b
 OS8ytbbXKGXV6cRSJ1nEGlASaoVhn17+CdaAW6hXAT4L1AOXTjFkjsXrAhemqqRkZ7nxBtzNH
 oJt7XHN3XQLfFnnDUY8cBqT2jGz2xS1kkp+h2UZJiKEGnXEFboacK6wmu4KSZDgQlIea81XGy
 pF5jWciGmh5kiw8XiUsLJvytLcvrIfdmhyf+jaFsOzjjTXC8be8BfAo4xcI0LvC51oJgwNo/q
 R23YoKr1vm3x3QwssM5zuYL+XeshlwHTBmkGWRdYrcT+QSqFWPawgI6cgcuApesYBAzI61klm
 g6jGs/FULM7IqHKwHw9lRNzo+Ntvv+JDsWX17ZWFbS/FCIWJBfrcyVIc1Xs8pYG4WidLz8OaM
 +nOMIKFX5QL15qy+J/1PrsmggL4=
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cyril Brulebois <cyril@debamax.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/11/23 08:00, Thomas Zimmermann wrote:
>
>
> Am 10.07.23 um 19:40 schrieb Rob Herring:
>> Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique=
"),
>> as spotted by Fr=C3=A9d=C3=A9ric Bonnard, the historical "of-display" d=
evice is
>> gone: the updated logic creates "of-display.0" instead, then as many
>> "of-display.N" as required.
>>
>> This means that offb no longer finds the expected device, which prevent=
s
>> the Debian Installer from setting up its interface, at least on ppc64el=
.
>>
>> Fix this by keeping "of-display" for the first device and "of-display.N=
"
>> for subsequent devices.
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217328
>> Link: https://bugs.debian.org/1033058
>> Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
>> Cc: stable@vger.kernel.org
>> Cc: Cyril Brulebois <cyril@debamax.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Helge Deller <deller@gmx.de>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Helge Deller <deller@gmx.de>

Who will pick up that patch?
Shall I take it via fbdev git tree?

Helge

>
>> ---
>> =C2=A0 drivers/of/platform.c | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 051e29b7ad2b..0c3475e7d2ff 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -552,7 +552,7 @@ static int __init of_platform_default_populate_init=
(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (!of_get_property(node, "linux,opened", NULL) ||
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !of_get_property(node, "linux,boot-displ=
ay", NULL))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
 =3D of_platform_device_create(node, "of-display.0", NULL);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
 =3D of_platform_device_create(node, "of-display", NULL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 of_node_put(node);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (WARN_ON(!dev))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>

