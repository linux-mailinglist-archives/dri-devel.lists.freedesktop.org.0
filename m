Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA546EC91A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F8010E15B;
	Mon, 24 Apr 2023 09:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B7310E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 09:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1682328942; i=deller@gmx.de;
 bh=yTHDRa5GrOM5P/U7F/tlSANNP9N/Y9bFvN20rrCdkPQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=F3rPQi1+I4gmF+pOG2S0LNoxKXTRzShZijkV9aqCVuXR6vpFa8DHkPNxKNVmwwWYJ
 QTDRlVPZO7JxFI9UnQSkbVlmAXwnpJxqSUJsxTjaCSwyViL9f7BuwsBpKdc8gRyRnR
 F4TZX/Y+9vKbeJTK84gmHE50nFPgRMcbz+y27c/5K/LMq41MS4Ew+upmZ1QRVnplBo
 UM5oHwUGD+LhVtlUuwCxhNSxbya7JK8XeRxNlaQ0geYUiCinJZCRkHkU7IlS+eRIKu
 ZOXARPnQ8hZFOsUYbwUNgukki9HTC9yNvdbocwMoa+t8WPXDTftrgA7y1F/eHdy77A
 oHB6gf+F58uDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.242]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlXK-1qXOga2qn8-00jovs; Mon, 24
 Apr 2023 11:35:42 +0200
Message-ID: <10077a22-3055-75dd-2168-310468618f99@gmx.de>
Date: Mon, 24 Apr 2023 11:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] drm/ofdrm: Update expected device name
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Cyril Brulebois <cyril@debamax.com>
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-3-cyril@debamax.com>
 <CAMuHMdW4rZn4p=gQZRWQQSEbQPmzZUd5eN+kP_Yr7bLgTHyvig@mail.gmail.com>
 <5694a9ab-d474-c101-9398-eea55aab29df@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <5694a9ab-d474-c101-9398-eea55aab29df@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3kP7ktou073M4fKwqgFVglqpXsTOVkudI9TiAb2jmS61p79Utkj
 bfKy597ABOj5a6ia0vbIHLBRiCPzRO3TO4d8iV7ihpFva7jJulDIVLkHIhpab/XObR5Izkb
 mgQfkyaFnCx9VGQABpm9RG9LFkRBEhZhZUJux+Bmo1XmparDwkl0Z45YcHxCliiT2VpfBoE
 cpM1B5JUmxQk9WZ5qX9Tg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:efosCe5Ci2I=;fSTK6kN/XxzU8cnmLNXQ8yrbYW9
 bIuYXFo/RQFlNaXx2v+Cs3VzcUlxdioipOp8IoCiyur5pCgM0ejBNU++WZ9jm18gx4S+DiZtF
 A9z2pxIyP2UYptCogM3hOTzD4sbMCLLWn6tNPAuxrupIaRVQQUGjdP3LW1BPVp2H5QEFXEk7j
 qp3doz4Zu+E+VD7l+7m9wAWFsridFWVvk0Fbu87zKM7lEfsyO/zzdnbQJlCNZEDjHDI7Khcfw
 wI7pCLtjk8K5Uc4SzTvIfPL1bus6D1GzkVBP/IqVMy79sScMiAYAat9UyoFgtPEEYW7O7IBS6
 9XhF2luW4u+zULDATwMQ+3FNBPSgyFmeFIBUro9KrvNWTvKlbgvrd4pZXYjQ5iXUx+aARFOXD
 wcohb4sUCZg8jZST2ISbtbnxiBlAtmDyDj1PNi57CtdeaWW0rZE8whJ91ucwlB037WB1HyiZv
 ChEIT49J+n7JSvG5FZf5t/dmdHk7rK6iTjxZfzLwiD41NMS8rN6aeLu/rXsLJZ0PbKwGxwODw
 0avi1Go6Pt0Vh4S7U+au6mIwL7LxBgcFyP7+fFw5VXo9zU2/E0EtNDN3QQmgiN1y6EwyphFiT
 gRaP/vM2hdUjNQRseJsOP6NxCpgKQ5AHGK5JFi3w+EKddp3Ch2VMIjxWKACBJvB6FJpDsaDvN
 CeAW5cG8Avhj1x8dGT+pgMXLvhav7GvLlWFKhwQcjp2pV91wittAgxzzixr7y+jusEwlFM0ZI
 /B5WylxOR94G2LONBhSOas8v6/8v78IgVrlb/15/V23Q3wq5mjVoABQXz9DFR7HiH9t2lRgOD
 menH8eLaeHnQHaAqQR+6XYiC1RhAsV6GOquabipihSAvGi3aFh35PHrwpVUqOzUfLawkQ4NCp
 sl8NziNDVkv/YMB1W8axAtcuIUKJmldg4qEuSC5AKnnfMqO2xTgJWqECVBMzF/Fr4iNTEDMVo
 bBcX7VmIYqL5gwxFuGg7mNIHSWE=
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
Cc: linux-fbdev@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Suchanek <msuchanek@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/24/23 11:07, Thomas Zimmermann wrote:
> Hi
>
> Am 24.04.23 um 09:33 schrieb Geert Uytterhoeven:
>> Hi Cyril,
>>
>> CC DT
>>
>> On Wed, Apr 12, 2023 at 12:05=E2=80=AFPM Cyril Brulebois <cyril@debamax=
.com> wrote:
>>> Since commit 241d2fb56a18 ("of: Make OF framebuffer device names uniqu=
e"),
>>> as spotted by Fr=C3=A9d=C3=A9ric Bonnard, the historical "of-display" =
device is
>>> gone: the updated logic creates "of-display.0" instead, then as many
>>> "of-display.N" as required.
>>>
>>> This means that offb no longer finds the expected device, which preven=
ts
>>> the Debian Installer from setting up its interface, at least on ppc64e=
l.
>>>
>>> Given the code similarity it is likely to affect ofdrm in the same way=
.
>>>
>>> It might be better to iterate on all possible nodes, but updating the
>>> hardcoded device from "of-display" to "of-display.0" is likely to help
>>> as a first step.
>>>
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217328
>>> Link: https://bugs.debian.org/1033058
>>> Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
>>> Cc: stable@vger.kernel.org # v6.2+
>>> Signed-off-by: Cyril Brulebois <cyril@debamax.com>
>>
>> Thanks for your patch, which is now commit 3a9d8ea2539ebebd
>> ("drm/ofdrm: Update expected device name") in fbdev/for-next.
>>
>>> --- a/drivers/gpu/drm/tiny/ofdrm.c
>>> +++ b/drivers/gpu/drm/tiny/ofdrm.c
>>> @@ -1390,7 +1390,7 @@ MODULE_DEVICE_TABLE(of, ofdrm_of_match_display);
>>>
>>> =C2=A0 static struct platform_driver ofdrm_platform_driver =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver =3D {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .name =3D "of-display",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .name =3D "of-display.0",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 .of_match_table =3D ofdrm_of_match_display,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .probe =3D ofdrm_prob=
e,
>>
>> Same comment as for "[PATCH 1/2] fbdev/offb: Update expected device
>> name".
>>
>> https://lore.kernel.org/r/CAMuHMdVGEeAsmb4tAuuqqGJ-4+BBETwEwYJA+M9NyJv0=
BJ_hNg@mail.gmail.com
>
> Sorry that I missed this patch. I agree that it's probably not
> correct. At least in ofdrm, we want to be able to use multiple
> framebuffers at the same time; a feature that has been broken by this
> change.

Geert & Thomas, thanks for the review!

I've dropped both patches from fbdev tree for now.
Would be great to find another good solution though, as it breaks the debi=
an
installer.

Helge
