Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5589663EAA8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 08:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B642810E54A;
	Thu,  1 Dec 2022 07:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3AE10E54A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1669881435; bh=1TG7t7iGxI5iBeZfr7K40KtO8/tCvEl9OlJVEZXqzdw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=IXXS/ihDLD5r8o14UFrcAyCArHgi7HmLAv0BnsoiEfOZGjm0P1u5N1fUE2XmKrbTa
 Q2WMF07+M3Cu6d5qGgtxj7Eh8cqCrg4Kf1x+xLQweirrBP6N5gL0cckat36ref6v+A
 dH0vLbZ0xBUoMlaBzfd/u+yZi0ZtH9qLljT3UiBT9ww17bxSB5q8dE3DUD4IIjGWA2
 MLevw/Z8GKp9pblHcEr3SnlT7PZPZZaEDNDGxXioAiaPCaTDiWljB/UR4dnlt4AKZC
 24GzfmzwAzqSNoIuAe/0WAJ4599Z5CntJSSZkL4N5JvIzd/qRdRiOCMxzTFNB1qAMg
 9pp7Jh0RefuhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.178.52]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKlu-1pKu2r1YOA-00OmnK; Thu, 01
 Dec 2022 08:57:15 +0100
Message-ID: <a3e1bbd6-9ff8-6cb2-4034-05055f499c6d@gmx.de>
Date: Thu, 1 Dec 2022 08:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] fbdev: geode: don't build on UML
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20221130215544.28497-1-rdunlap@infradead.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221130215544.28497-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PpGogZnW6HhwaMr7tc/5/1UjEN/jHdMDXMece1a88p3qFJsxYnH
 pqyNgQ/pEphLd1DIZWkKcguwYgCFIlM/UAVYmmDvU4V/9pMH6vnOOfLlzPzNPwI/kxh0pHP
 szX0goj+isPJtRkSFRy/nL1DAaJSEUTKyyVL8ZeVlTri8IO49fLLLjCX8w0oMQsM7p21wVx
 UZjay3b7hdJqUaQGrFhiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5PKJk0yIPzM=;kqh16m3VshbvOOXZdkeQQw4m8pN
 34hBkfxHn/b/W2s3sZWRvyww+JuLDdbgq7wd5S/CedBb9F5snxlzC6c90vOT5v1LCw4wvIRL7
 1CL43JEfPXgGbdEUkAzy17TxIh8YdhnX2LmCVWz0FoRE03GiCczJBKDAamo5TlqlRUhFecgr2
 QrCxSIjn4gFMbAbTjMGUiYqdKI6MOHJzvNgGbXVmxqGxrIEzSv3Ob5XEm3m/auy6jJhhgsdqa
 6/gUSFChG1uyAvfszTwnCeFCRi9WlAdxU1GBLPz+nedkqCvC46eFUhZsvLy7W34ibGd26ASlo
 GHGAPfNiY8HrPbYtNW3Mnca7wFXieyosEWEv2YcqxnMd0AnKDbySkRaIX6Ho2TWfx+zv3VAoz
 I4dmkor/6GgN4N0rq+TVvol2MZbpg2nSadAA/0WP7IBXklp6gAqbfXq5ghJpAeQlmyoCF7QuK
 4P/Do+tVzGxsDTU9mZAnjvoeVFGFvFvtenlWQfTJaqpCyOwYrNZRDjiJ3vcbg7otT1exnogbB
 xyaBOI5VdFVQDwziE7F0iDKWxJarly376Zp0w48+8ZajRLoSiGY/mQfyVHPNs95sTWYbagw5k
 A8lWTojjckEY3wPiK8ORXum4TGEMu4R27hPNRgE5eJaBopcYgmLEmVQBO5UO5FFOp0Y0wGcs3
 cRhlLRrWb3STkYZk3VfRfwymh/dC6rA53NAu0U6FmQTjUJtJwhDLsuUGUbUyxRE1sU7yLTVWy
 CwDvoS69jjogATmheSXUOBThpXfg+cgmFLi+xJ3B9ZLqeutY5XNfXPaKAgN9buh9Ndz7OS0Zn
 U0UT8KY9fWGEETAt46b1h5SiktUpYGwMwpROxvcXD+W2X0hh4Bvcfu/U1ffT/tlIsGSIp7U+C
 aBQDmZsh0aaaaNgqb7kdl3spPh75hba0jk1e+xbn7D4BlngYDPdtxLhtQBSnnuZGzhrvP55UF
 7lXH5zWou3FdKyj4IS80Xh2Zb+k=
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
Cc: linux-fbdev@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-um@lists.infradead.org, linux-geode@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Andres Salomon <dilinger@queued.net>,
 Johannes Berg <johannes@sipsolutions.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/30/22 22:55, Randy Dunlap wrote:
> The geode fbdev driver uses struct cpuinfo fields that are not present
> on ARCH=3Dum, so don't allow this driver to be built on UML.
>
> Prevents these build errors:
>
> In file included from ../arch/x86/include/asm/olpc.h:7:0,
>                   from ../drivers/mfd/cs5535-mfd.c:17:
> ../arch/x86/include/asm/geode.h: In function =E2=80=98is_geode_gx=E2=80=
=99:
> ../arch/x86/include/asm/geode.h:16:24: error: =E2=80=98struct cpuinfo_um=
=E2=80=99 has no member named =E2=80=98x86_vendor=E2=80=99
>    return ((boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_NSC) &&
> ../arch/x86/include/asm/geode.h:16:39: error: =E2=80=98X86_VENDOR_NSC=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98X86_=
VENDOR_ANY=E2=80=99?
>    return ((boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_NSC) &&
> ../arch/x86/include/asm/geode.h:17:17: error: =E2=80=98struct cpuinfo_um=
=E2=80=99 has no member named =E2=80=98x86=E2=80=99
>     (boot_cpu_data.x86 =3D=3D 5) &&
> ../arch/x86/include/asm/geode.h:18:17: error: =E2=80=98struct cpuinfo_um=
=E2=80=99 has no member named =E2=80=98x86_model=E2=80=99
>     (boot_cpu_data.x86_model =3D=3D 5));
> ../arch/x86/include/asm/geode.h: In function =E2=80=98is_geode_lx=E2=80=
=99:
> ../arch/x86/include/asm/geode.h:23:24: error: =E2=80=98struct cpuinfo_um=
=E2=80=99 has no member named =E2=80=98x86_vendor=E2=80=99
>    return ((boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_AMD) &&
> ../arch/x86/include/asm/geode.h:23:39: error: =E2=80=98X86_VENDOR_AMD=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98X86_=
VENDOR_ANY=E2=80=99?
>    return ((boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_AMD) &&
> ../arch/x86/include/asm/geode.h:24:17: error: =E2=80=98struct cpuinfo_um=
=E2=80=99 has no member named =E2=80=98x86=E2=80=99
>     (boot_cpu_data.x86 =3D=3D 5) &&
> ../arch/x86/include/asm/geode.h:25:17: error: =E2=80=98struct cpuinfo_um=
=E2=80=99 has no member named =E2=80=98x86_model=E2=80=99
>     (boot_cpu_data.x86_model =3D=3D 10));
>
> Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: linux-um@lists.infradead.org
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Andres Salomon <dilinger@queued.net>
> Cc: linux-geode@lists.infradead.org

applied.
Thanks!

Helge


> ---
>   drivers/video/fbdev/geode/Kconfig |    1 +
>   1 file changed, 1 insertion(+)
>
> diff -- a/drivers/video/fbdev/geode/Kconfig b/drivers/video/fbdev/geode/=
Kconfig
> --- a/drivers/video/fbdev/geode/Kconfig
> +++ b/drivers/video/fbdev/geode/Kconfig
> @@ -5,6 +5,7 @@
>   config FB_GEODE
>   	bool "AMD Geode family framebuffer support"
>   	depends on FB && PCI && (X86_32 || (X86 && COMPILE_TEST))
> +	depends on !UML
>   	help
>   	  Say 'Y' here to allow you to select framebuffer drivers for
>   	  the AMD Geode family of processors.

