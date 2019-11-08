Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89826F416C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 08:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FC36F84E;
	Fri,  8 Nov 2019 07:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FB06F84E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 07:36:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 23DE1AC81;
 Fri,  8 Nov 2019 07:36:50 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] drm/udl: Convert to SHMEM
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>,
 airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, kraxel@redhat.com
References: <20191107094307.19870-1-tzimmermann@suse.de>
 <cd38b510-6914-ab38-677a-1ebce8c7d4d5@pr.hu>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <f2f5afa1-59e5-149f-ed58-a5708926ae5a@suse.de>
Date: Fri, 8 Nov 2019 08:36:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <cd38b510-6914-ab38-677a-1ebce8c7d4d5@pr.hu>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0371193126=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0371193126==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ydYlHeyaGHS1QQu0HbHMJsuvelL3K9IWF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ydYlHeyaGHS1QQu0HbHMJsuvelL3K9IWF
Content-Type: multipart/mixed; boundary="IGapvTxYPP53RoPqoqQpCzoBBZ8rIxMxK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>,
 airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, kraxel@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <f2f5afa1-59e5-149f-ed58-a5708926ae5a@suse.de>
Subject: Re: [PATCH v3 0/4] drm/udl: Convert to SHMEM
References: <20191107094307.19870-1-tzimmermann@suse.de>
 <cd38b510-6914-ab38-677a-1ebce8c7d4d5@pr.hu>
In-Reply-To: <cd38b510-6914-ab38-677a-1ebce8c7d4d5@pr.hu>

--IGapvTxYPP53RoPqoqQpCzoBBZ8rIxMxK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi B=C3=B6sz=C3=B6rm=C3=A9nyi

Am 07.11.19 um 16:10 schrieb B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n:
> Hi,
>=20
> 2019. 11. 07. 10:43 keltez=C3=A9ssel, Thomas Zimmermann =C3=ADrta:
>> Udl's GEM implementation is mostly SHMEM and we should attempt to
>> replace it with the latter.
>>
>> Patches #1 and #2 update udl to simplify the conversion. In patch #3
>> the udl code is being replaced by SHMEM. The GEM object's mmap() and
>> free_object() functions are wrappers around their SHMEM counterparts.
>> For mmap() we fix-up the page-caching flags to distinguish between
>> write-combined and cached access. For free(), we have to unmap the
>> buffer's mapping that has been established by udl's fbdev code.
>> Patch #4 removes the obsolete udl code.
>>
>> The patchset has been tested by running the fbdev console, X11 and
>> Weston on a DisplayLink adapter.
>=20
> what's the trick to actually enable the UDL device?
>=20
> With 5.3.8, 5.3.9 or 5.4-rc6 + drm-next and this patchset, I get this:
>=20
> # DISPLAY=3D:0 xrandr --listproviders
> Providers: number : 2
> Provider 0: id: 0x76 cap: 0xf, Source Output, Sink Output, Source
> Offload, Sink Offload crtcs: 2 outputs: 3 associated providers: 0
> name:modesetting
> Provider 1: id: 0x41 cap: 0x2, Sink Output crtcs: 1 outputs: 1
> associated providers: 0 name:modesetting
>=20
> # DISPLAY=3D:0 xrandr --setprovideroutputsource 0x41 0x76
>=20
> # DISPLAY=3D:0 xrandr --listproviders
> Providers: number : 2
> Provider 0: id: 0x76 cap: 0xf, Source Output, Sink Output, Source
> Offload, Sink Offload crtcs: 2 outputs: 3 associated providers: 1
> name:modesetting
> Provider 1: id: 0x41 cap: 0x2, Sink Output crtcs: 1 outputs: 1
> associated providers: 1 name:modesetting
>=20
> # DISPLAY=3D:0 xrandr
> Screen 0: minimum 320 x 200, current 1024 x 768, maximum 8192 x 8192
> VGA-1 connected primary 1024x768+0+0 (normal left inverted right x axis=

> y axis) 376mm x 301mm
> =C2=A0=C2=A0 1024x768=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75.03*+=C2=A0 60.00=

> =C2=A0=C2=A0 1280x1024=C2=A0=C2=A0=C2=A0=C2=A0 60.02 +
> =C2=A0=C2=A0 1152x864=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75.00
> =C2=A0=C2=A0 832x624=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 74.55
> =C2=A0=C2=A0 800x600=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75.00=C2=A0=C2=
=A0=C2=A0 60.32
> =C2=A0=C2=A0 640x480=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75.00=C2=A0=C2=
=A0=C2=A0 59.94
> =C2=A0=C2=A0 720x400=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 70.08
> HDMI-1 disconnected (normal left inverted right x axis y axis)
> DP-1 connected 1024x768+0+0 (normal left inverted right x axis y axis)
> 304mm x 228mm
> =C2=A0=C2=A0 1024x768=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 60.00*+
> DVI-I-1-1 connected (normal left inverted right x axis y axis)
> =C2=A0=C2=A0 1024x768=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75.03 +=C2=A0 60.00=

> =C2=A0=C2=A0 1920x1080=C2=A0=C2=A0=C2=A0=C2=A0 60.00 +
> =C2=A0=C2=A0 1680x1050=C2=A0=C2=A0=C2=A0=C2=A0 59.88
> =C2=A0=C2=A0 1280x1024=C2=A0=C2=A0=C2=A0=C2=A0 75.02=C2=A0=C2=A0=C2=A0 =
60.02
> =C2=A0=C2=A0 1440x900=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 74.98=C2=A0=C2=A0=C2=
=A0 59.90
> =C2=A0=C2=A0 1280x720=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 60.00
> =C2=A0=C2=A0 800x600=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75.00=C2=A0=C2=
=A0=C2=A0 60.32
> =C2=A0=C2=A0 640x480=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75.00=C2=A0=C2=
=A0=C2=A0 72.81=C2=A0=C2=A0=C2=A0 66.67=C2=A0=C2=A0=C2=A0 59.94
> =C2=A0=C2=A0 720x400=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 70.08
> =C2=A0 1024x768 (0x42) 78.750MHz +HSync +VSync
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h: width=C2=A0 1024 start 10=
40 end 1136 total 1312 skew=C2=A0=C2=A0=C2=A0 0 clock=C2=A0
> 60.02KHz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v: height=C2=A0 768 start=C2=
=A0 769 end=C2=A0 772 total=C2=A0 800=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 clock=C2=A0
> 75.03Hz
> =C2=A0 1280x1024 (0x46) 108.000MHz +HSync +VSync
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h: width=C2=A0 1280 start 13=
28 end 1440 total 1688 skew=C2=A0=C2=A0=C2=A0 0 clock=C2=A0
> 63.98KHz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v: height 1024 start 1025 en=
d 1028 total 1066=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 clock=C2=A0
> 60.02Hz
> =C2=A0 1024x768 (0x4a) 65.000MHz -HSync -VSync
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h: width=C2=A0 1024 start 10=
48 end 1184 total 1344 skew=C2=A0=C2=A0=C2=A0 0 clock=C2=A0
> 48.36KHz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v: height=C2=A0 768 start=C2=
=A0 771 end=C2=A0 777 total=C2=A0 806=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 clock=C2=A0
> 60.00Hz
> =C2=A0 800x600 (0x4b) 49.500MHz +HSync +VSync
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h: width=C2=A0=C2=A0 800 sta=
rt=C2=A0 816 end=C2=A0 896 total 1056 skew=C2=A0=C2=A0=C2=A0 0 clock=C2=A0=

> 46.88KHz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v: height=C2=A0 600 start=C2=
=A0 601 end=C2=A0 604 total=C2=A0 625=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 clock=C2=A0
> 75.00Hz
> =C2=A0 800x600 (0x4c) 40.000MHz +HSync +VSync
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h: width=C2=A0=C2=A0 800 sta=
rt=C2=A0 840 end=C2=A0 968 total 1056 skew=C2=A0=C2=A0=C2=A0 0 clock=C2=A0=

> 37.88KHz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v: height=C2=A0 600 start=C2=
=A0 601 end=C2=A0 605 total=C2=A0 628=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 clock=C2=A0
> 60.32Hz
> =C2=A0 640x480 (0x4d) 31.500MHz -HSync -VSync
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h: width=C2=A0=C2=A0 640 sta=
rt=C2=A0 656 end=C2=A0 720 total=C2=A0 840 skew=C2=A0=C2=A0=C2=A0 0 clock=
=C2=A0
> 37.50KHz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v: height=C2=A0 480 start=C2=
=A0 481 end=C2=A0 484 total=C2=A0 500=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 clock=C2=A0
> 75.00Hz
> =C2=A0 640x480 (0x50) 25.175MHz -HSync -VSync
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h: width=C2=A0=C2=A0 640 sta=
rt=C2=A0 656 end=C2=A0 752 total=C2=A0 800 skew=C2=A0=C2=A0=C2=A0 0 clock=
=C2=A0
> 31.47KHz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v: height=C2=A0 480 start=C2=
=A0 490 end=C2=A0 492 total=C2=A0 525=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 clock=C2=A0
> 59.94Hz
> =C2=A0 720x400 (0x51) 28.320MHz -HSync +VSync
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h: width=C2=A0=C2=A0 720 sta=
rt=C2=A0 738 end=C2=A0 846 total=C2=A0 900 skew=C2=A0=C2=A0=C2=A0 0 clock=
=C2=A0
> 31.47KHz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v: height=C2=A0 400 start=C2=
=A0 412 end=C2=A0 414 total=C2=A0 449=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 clock=C2=A0
> 70.08Hz
>=20
> # DISPLAY=3D:0 xrandr --output DVI-I-1-1 --mode 1024x768 --right-of DP-=
1
> xrandr: Configure crtc 2 failed
>=20
> Even after the last command, my monitor say "no signal" from the UDL
> (DL-195)
> device and dmesg has a kernel warning now:
>=20
> [=C2=A0 133.320404] udl 2-1.2:1.0: swiotlb buffer is full (sz: 2211840
> bytes), total 32768 (slots), used 0 (slots)

Have you tried to increase the buffer size? There's a command-line
option to control this setting. [1]

Best regards
Thomas

[1] https://wiki.gentoo.org/wiki/IOMMU_SWIOTLB


> [=C2=A0 133.320410] udl 2-1.2:1.0: overflow 0x00000001199e4000+2211840 =
of DMA
> mask ffffffff bus mask 0
> [=C2=A0 133.320424] WARNING: CPU: 0 PID: 739 at kernel/dma/direct.c:35
> report_addr+0x3e/0x70
> [=C2=A0 133.320425] Modules linked in: 8021q garp mrp stp llc intel_rap=
l_msr
> intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp
> kvm_intel snd_hda_codec_hdmi kvm snd_hda_codec_realt
> ek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_hda_codec
> iTCO_wdt elo irqbypass iTCO_vendor_support intel_cstate snd_hda_core
> intel_uncore snd_hwdep intel_rapl_perf snd_pcm pcspkr
> =C2=A0i2c_i801 snd_timer e1000e snd joydev lpc_ich soundcore ip6t_REJEC=
T
> nf_reject_ipv6 nf_log_ipv6 ip6table_filter ip6_tables nf_log_ipv4
> nf_log_common xt_LOG xt_limit xt_multiport xt_conntrack
> =C2=A0iptable_nat nf_nat xt_connmark nf_conntrack nf_defrag_ipv6
> nf_defrag_ipv4 libcrc32c iptable_mangle i915 udl i2c_algo_bit
> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm cr
> c32_pclmul crc32c_intel serio_raw video
> [=C2=A0 133.320463] CPU: 0 PID: 739 Comm: Xorg Not tainted 5.3.8 #1
> [=C2=A0 133.320465] Hardware name: TOSHIBA 4852E70/Intel H61 Express Ch=
ipset,
> BIOS XBKT200 01/04/2017
> [=C2=A0 133.320467] EIP: report_addr+0x3e/0x70
> [=C2=A0 133.320470] Code: 00 89 4d f8 85 d2 74 44 8b 0a 8b 5a 04 ba fe =
ff ff
> ff 39 ca ba 00 00 00 00 19 da 73 17 80 3d 9c 16 14 d0 00 0f 84 24 09 00=

> 00 <0f> 0b 8b 5d fc c9 c3 8d 76 00 8b 90 5c 01 00 00 0b 90 58 01 00 00
> [=C2=A0 133.320472] EAX: 00000000 EBX: 00000000 ECX: f5b89e00 EDX: 0000=
0007
> [=C2=A0 133.320473] ESI: ffffffff EDI: ecf3921c EBP: ec56bcf4 ESP: ec56=
bce8
> [=C2=A0 133.320475] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS=
:
> 00213286
> [=C2=A0 133.320476] CR0: 80050033 CR2: b7236020 CR3: 2c72a000 CR4: 0004=
06f0
> [=C2=A0 133.320477] Call Trace:
> [=C2=A0 133.320484]=C2=A0 dma_direct_map_page+0x158/0x180
> [=C2=A0 133.320487]=C2=A0 dma_direct_map_sg+0x4f/0xa0
> [=C2=A0 133.320564]=C2=A0 i915_gem_map_dma_buf+0x1b8/0x1d0 [i915]
> [=C2=A0 133.320568]=C2=A0 dma_buf_map_attachment+0x4f/0x90
> [=C2=A0 133.320572]=C2=A0 udl_gem_prime_import+0x43/0x12a [udl]
> [=C2=A0 133.320607]=C2=A0 drm_gem_prime_fd_to_handle+0x97/0x180 [drm]
> [=C2=A0 133.320625]=C2=A0 ? drm_gem_prime_export+0xa0/0xa0 [drm]
> [=C2=A0 133.320642]=C2=A0 ? drm_gem_prime_import+0x20/0x20 [drm]
> [=C2=A0 133.320658]=C2=A0 ? drm_prime_handle_to_fd_ioctl+0x70/0x70 [drm=
]
> [=C2=A0 133.320673]=C2=A0 drm_prime_fd_to_handle_ioctl+0x2f/0x50 [drm]
> [=C2=A0 133.320689]=C2=A0 drm_ioctl_kernel+0x8f/0xd0 [drm]
> [=C2=A0 133.320706]=C2=A0 drm_ioctl+0x21c/0x3c0 [drm]
> [=C2=A0 133.320721]=C2=A0 ? drm_prime_handle_to_fd_ioctl+0x70/0x70 [drm=
]
> [=C2=A0 133.320726]=C2=A0 ? file_modified+0x30/0x30
> [=C2=A0 133.320728]=C2=A0 ? file_update_time+0xfe/0x130
> [=C2=A0 133.320731]=C2=A0 ? page_add_file_rmap+0x72/0xd0
> [=C2=A0 133.320734]=C2=A0 ? fault_dirty_shared_page.isra.122+0x6d/0xb0
> [=C2=A0 133.320750]=C2=A0 ? drm_version+0x80/0x80 [drm]
> [=C2=A0 133.320753]=C2=A0 do_vfs_ioctl+0x9a/0x6c0
> [=C2=A0 133.320757]=C2=A0 ksys_ioctl+0x56/0x80
> [=C2=A0 133.320760]=C2=A0 sys_ioctl+0x16/0x20
> [=C2=A0 133.320763]=C2=A0 do_fast_syscall_32+0x82/0x1c7
> [=C2=A0 133.320766]=C2=A0 entry_SYSENTER_32+0x9f/0xf2
> [=C2=A0 133.320768] EIP: 0xb7f84a75
> [=C2=A0 133.320770] Code: e8 1c 00 00 00 89 d3 eb cf 8d 74 26 00 b8 40 =
42 0f
> 00 eb b5 8b 04 24 c3 8b 1c 24 c3 8b 3c 24 c3 90 51 52 55 89 e5 0f 34 cd=

> 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
> [=C2=A0 133.320772] EAX: ffffffda EBX: 0000000c ECX: c00c642e EDX: bff2=
6be0
> [=C2=A0 133.320773] ESI: 0221ad20 EDI: c00c642e EBP: 0000000c ESP: bff2=
6b88
> [=C2=A0 133.320775] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS=
:
> 00203296
> [=C2=A0 133.320777] ---[ end trace 18cd4f77716f2f5f ]---
>=20
> With your drm-next and your patch set, the call trace is obviously
> different:
>=20
> [=C2=A0=C2=A0 37.486584] udl 2-1.2:1.0: swiotlb buffer is full (sz: 536=
576 bytes),
> total 32768 (slots), used 1536 (slots)
> [=C2=A0=C2=A0 37.486591] udl 2-1.2:1.0: overflow 0x000000011a47d000+536=
576 of DMA
> mask ffffffff bus mask 0
> [=C2=A0=C2=A0 37.486598] ------------[ cut here ]------------
> [=C2=A0=C2=A0 37.486606] WARNING: CPU: 1 PID: 749 at kernel/dma/direct.=
c:35
> report_addr+0x3e/0x70
> [=C2=A0=C2=A0 37.486607] Modules linked in: 8021q garp mrp stp llc inte=
l_rapl_msr
> intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp
> kvm_intel kvm snd_hda_codec_hdmi snd_hda_codec_realt
> ek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_nhlt
> snd_hda_codec iTCO_wdt iTCO_vendor_support elo irqbypass snd_hda_core
> intel_cstate intel_uncore snd_hwdep snd_pcm intel_r
> apl_perf e1000e pcspkr joydev i2c_i801 snd_timer lpc_ich snd soundcore
> ip6t_REJECT nf_reject_ipv6 nf_log_ipv6 ip6table_filter ip6_tables
> nf_log_ipv4 nf_log_common xt_LOG xt_limit xt_multipo
> rt xt_conntrack iptable_nat nf_nat xt_connmark nf_conntrack
> nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle i915 udl
> i2c_algo_bit drm_kms_helper syscopyarea sysfillrect crc32_pclmul
> sysimgblt crc32c_intel fb_sys_fops serio_raw drm video
> [=C2=A0=C2=A0 37.486647] CPU: 1 PID: 749 Comm: Xorg Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
> 5.4.0-rc4+ #1
> [=C2=A0=C2=A0 37.486648] Hardware name: TOSHIBA 4852E70/Intel H61 Expre=
ss Chipset,
> BIOS XBKT200 01/04/2017
> [=C2=A0=C2=A0 37.486652] EIP: report_addr+0x3e/0x70
> [=C2=A0=C2=A0 37.486655] Code: 00 89 4d f8 85 d2 74 44 8b 0a 8b 5a 04 b=
a fe ff ff
> ff 39 ca ba 00 00 00 00 19 da 73 17 80 3d b0 7d 95 d2 00 0f 84 c4 08 00=

> 00 <0f> 0b 8b 5d fc c9 c3 8d 76 00 8b 90 5c 01 00 00 0b 90 58 01 00 00
> [=C2=A0=C2=A0 37.486656] EAX: 00000000 EBX: 00000000 ECX: f68e3e00 EDX:=
 00000007
> [=C2=A0=C2=A0 37.486657] ESI: ed77f81c EDI: ffffffff EBP: ed1e5cfc ESP:=
 ed1e5cf0
> [=C2=A0=C2=A0 37.486659] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 E=
FLAGS:
> 00213286
> [=C2=A0=C2=A0 37.486661] CR0: 80050033 CR2: b7223020 CR3: 2cad8000 CR4:=
 000406f0
> [=C2=A0=C2=A0 37.486662] Call Trace:
> [=C2=A0=C2=A0 37.486669]=C2=A0 dma_direct_map_page+0x158/0x180
> [=C2=A0=C2=A0 37.486673]=C2=A0 dma_direct_map_sg+0x4f/0xa0
> [=C2=A0=C2=A0 37.486744]=C2=A0 i915_gem_map_dma_buf+0x114/0x190 [i915]
> [=C2=A0=C2=A0 37.486748]=C2=A0 dma_buf_map_attachment+0x4f/0x90
> [=C2=A0=C2=A0 37.486781]=C2=A0 drm_gem_prime_import_dev+0x5d/0x100 [drm=
]
> [=C2=A0=C2=A0 37.486802]=C2=A0 ? drm_prime_destroy_file_private+0x20/0x=
20 [drm]
> [=C2=A0=C2=A0 37.486821]=C2=A0 drm_gem_prime_fd_to_handle+0x158/0x180 [=
drm]
> [=C2=A0=C2=A0 37.486838]=C2=A0 ? drm_gem_prime_import+0x20/0x20 [drm]
> [=C2=A0=C2=A0 37.486854]=C2=A0 ? drm_prime_destroy_file_private+0x20/0x=
20 [drm]
> [=C2=A0=C2=A0 37.486871]=C2=A0 drm_prime_fd_to_handle_ioctl+0x21/0x30 [=
drm]
> [=C2=A0=C2=A0 37.486888]=C2=A0 drm_ioctl_kernel+0x99/0xe0 [drm]
> [=C2=A0=C2=A0 37.486904]=C2=A0 ? drm_prime_destroy_file_private+0x20/0x=
20 [drm]
> [=C2=A0=C2=A0 37.486922]=C2=A0 drm_ioctl+0x21a/0x380 [drm]
> [=C2=A0=C2=A0 37.486938]=C2=A0 ? drm_prime_destroy_file_private+0x20/0x=
20 [drm]
> [=C2=A0=C2=A0 37.486942]=C2=A0 ? __send_signal+0x2a4/0x3e0
> [=C2=A0=C2=A0 37.486944]=C2=A0 ? send_signal+0xb0/0xf0
> [=C2=A0=C2=A0 37.486946]=C2=A0 ? do_send_sig_info+0x4b/0x80
> [=C2=A0=C2=A0 37.486963]=C2=A0 ? drm_ioctl_kernel+0xe0/0xe0 [drm]
> [=C2=A0=C2=A0 37.486967]=C2=A0 do_vfs_ioctl+0x3fa/0x6b0
> [=C2=A0=C2=A0 37.486969]=C2=A0 ? kill_pid_info+0x31/0x60
> [=C2=A0=C2=A0 37.486973]=C2=A0 ? ktime_get+0x4c/0x110
> [=C2=A0=C2=A0 37.486977]=C2=A0 ksys_ioctl+0x5d/0x90
> [=C2=A0=C2=A0 37.486980]=C2=A0 sys_ioctl+0x16/0x20
> [=C2=A0=C2=A0 37.486983]=C2=A0 do_fast_syscall_32+0x82/0x1c7
> [=C2=A0=C2=A0 37.486988]=C2=A0 entry_SYSENTER_32+0x9f/0xf2
> [=C2=A0=C2=A0 37.486989] EIP: 0xb7f75b55
> [=C2=A0=C2=A0 37.486992] Code: 00 00 8d 76 00 b8 40 42 0f 00 eb bb 8b 0=
4 24 c3 8b
> 14 24 c3 8b 1c 24 c3 8b 34 24 c3 8b 3c 24 c3 90 51 52 55 89 e5 0f 34 cd=

> 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
> [=C2=A0=C2=A0 37.486994] EAX: ffffffda EBX: 0000000c ECX: c00c642e EDX:=
 bfd13dc0
> [=C2=A0=C2=A0 37.486995] ESI: 01c03520 EDI: c00c642e EBP: 0000000c ESP:=
 bfd13d68
> [=C2=A0=C2=A0 37.486997] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b E=
FLAGS:
> 00203292
> [=C2=A0=C2=A0 37.486999] ---[ end trace cef48717f4fbe0fa ]---
>=20
> It seems I get random successes with mostly failures of this kind:
>=20
> # DISPLAY=3D:0 xrandr --output DVI-I-1-1 --mode 1024x768 --below DP-1
> xrandr: Configure crtc 2 failed
> # DISPLAY=3D:0 xrandr --output DVI-I-1-1 --mode 1024x768 --right-of DP-=
1
> xrandr: Configure crtc 2 failed
>=20
> These messages appear for failed attempts:
>=20
> [=C2=A0 552.197202] udl 2-1.2:1.0: swiotlb buffer is full (sz: 360448 b=
ytes),
> total 32768 (slots), used 98 (slots)
> [=C2=A0 552.387539] udl 2-1.2:1.0: swiotlb buffer is full (sz: 819200 b=
ytes),
> total 32768 (slots), used 210 (slots)
> [=C2=A0 562.139080] udl 2-1.2:1.0: swiotlb buffer is full (sz: 2723840
> bytes), total 32768 (slots), used 206 (slots)
> [=C2=A0 709.666258] udl 2-1.2:1.0: swiotlb buffer is full (sz: 2097152
> bytes), total 32768 (slots), used 20 (slots)
> [=C2=A0 709.868665] udl 2-1.2:1.0: swiotlb buffer is full (sz: 2097152
> bytes), total 32768 (slots), used 14 (slots)
> [=C2=A0 721.728930] udl 2-1.2:1.0: swiotlb buffer is full (sz: 3133440
> bytes), total 32768 (slots), used 6 (slots)
> [=C2=A0 738.187591] udl 2-1.2:1.0: swiotlb buffer is full (sz: 524288 b=
ytes),
> total 32768 (slots), used 238 (slots)
> [=C2=A0 738.373190] udl 2-1.2:1.0: swiotlb buffer is full (sz: 950272 b=
ytes),
> total 32768 (slots), used 664 (slots)
> [=C2=A0 738.990204] udl 2-1.2:1.0: swiotlb buffer is full (sz: 983040 b=
ytes),
> total 32768 (slots), used 24 (slots)
> [=C2=A0 743.599439] udl 2-1.2:1.0: swiotlb buffer is full (sz: 2826240
> bytes), total 32768 (slots), used 156 (slots)
>=20
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>=20
>>
>> v3:
>> =C2=A0=C2=A0=C2=A0=C2=A0* restore udl vmap function that enables cachi=
ng
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* remove obsolete udl code in a separate patch=

>>
>> Thomas Zimmermann (4):
>> =C2=A0=C2=A0 drm/udl: Remove flags field from struct udl_gem_object
>> =C2=A0=C2=A0 drm/udl: Allocate GEM object via struct drm_driver.gem_cr=
eate_object
>> =C2=A0=C2=A0 drm/udl: Switch to SHMEM
>> =C2=A0=C2=A0 drm/udl: Remove struct udl_gem_object and functions
>>
>> =C2=A0 drivers/gpu/drm/udl/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
>> =C2=A0 drivers/gpu/drm/udl/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +-
>> =C2=A0 drivers/gpu/drm/udl/udl_dmabuf.c | 255 ------------------------=
------
>> =C2=A0 drivers/gpu/drm/udl/udl_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0 30 +---=

>> =C2=A0 drivers/gpu/drm/udl/udl_drv.h=C2=A0=C2=A0=C2=A0 |=C2=A0 36 +---=
-
>> =C2=A0 drivers/gpu/drm/udl/udl_fb.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 66=
 ++++----
>> =C2=A0 drivers/gpu/drm/udl/udl_gem.c=C2=A0=C2=A0=C2=A0 | 263 +++++++++=
----------------------
>> =C2=A0 7 files changed, 122 insertions(+), 531 deletions(-)
>> =C2=A0 delete mode 100644 drivers/gpu/drm/udl/udl_dmabuf.c
>>
>> --=20
>> 2.23.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--IGapvTxYPP53RoPqoqQpCzoBBZ8rIxMxK--

--ydYlHeyaGHS1QQu0HbHMJsuvelL3K9IWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3FGxAACgkQaA3BHVML
eiNu4gf+NdJ97Z86OUj9DgBs/1wXFlYe/MvNfOUxH2yKCrVnKLPG8qyr6o8fwN9i
KsvulD21VJY1VQ0mDrsvT2NFInpDds6wz/23LV6yeWV2dEbc+TEuZBx5vxtPEsVe
ow1/QD4yVPwB63iwic2N6TakG9WWz/vxLJZzWUH3jFBcJXUCrE06aJiiynBVgB3w
qUbmntTYYfHBoF/FSVz8pvXgrQZDvDmMLXOgJKD6q45WiPewpcBSRZeEdobE7k2H
mSZn5SMnhPJiGe4SHsgYYOjf1tmrmSQic5c0Pgc93XCbk4RbJu/5jXYVg/D/elib
lmGmZOTt7x07YGq4vsmMLqJbzl8NOg==
=OWpQ
-----END PGP SIGNATURE-----

--ydYlHeyaGHS1QQu0HbHMJsuvelL3K9IWF--

--===============0371193126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0371193126==--
