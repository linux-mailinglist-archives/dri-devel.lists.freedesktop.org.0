Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEA0759C88
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 19:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A78C10E0F8;
	Wed, 19 Jul 2023 17:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A8E10E0F8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 17:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1689788265; x=1690393065; i=deller@gmx.de;
 bh=OWBVwKAKYUubldyKOngR8zmONyJsgCd+Y+uEyDM72hQ=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=guruUfPdwFDagx0lv+gWEMgDuLsxBie8ub8B5JtGiMzkVFBbmvGzFPVXNbg2wknzgDA/p9r
 GdhfWxrCZ9IRlwpJUx377WhvA9iBJVqkXqrivCxBkE355un6BLBS5up1iN/nbB0HuDjVERAKq
 N3kCju7DY4KzV/2HDKXIP/ZCybPgvKMoTk1eL4LPoQKal2KKXAr3zTArnvueln1Ap1xraF1Df
 qUZo95hk+45qyXR8ttW6rrnJRH+dAe/7CI6FIAKplD2s3xcq/azJPOAUYNbV408RxzXoUi4xs
 rZ9GSoN0U/hYtvvoBDO8lKo8/mUmhdf7wNTotRwkZsb2K/2JIy7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.145.157]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mt79F-1q2qqf473J-00tU81; Wed, 19
 Jul 2023 19:37:45 +0200
Message-ID: <46d933f5-38e4-b46a-f94b-0e9a6e3b2e31@gmx.de>
Date: Wed, 19 Jul 2023 19:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230719081544.741051-1-javierm@redhat.com>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v6 0/4] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
In-Reply-To: <20230719081544.741051-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9cAVIXMKo4AH5+eIgZyiJgdeXzzKeujpS1D6y9fuD67jVW84HDf
 6X2V38hfOBcUmNOb5yqIo83uy2JB29MZz29l+nHTs0Zd14Tqf2zMKa6iX2i/0iV1qu+i3/0
 ke4LmGXBYm1/z7n1kDNfaZWZ25GCHZTuuEo68Tp0hDh5umrojkS/KvhOOKVwRI9nZirMIhJ
 XoJ2a19abU4kJvS9ndLzQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NTSnM/LsKoc=;qDjULDS9Nr+CRmJpIQDxoc2r9ta
 ayn723RKQT33yIGU+FTddVCSAP4do7LD8fZN8xM28rE6o76FDaDiyGo/2DXfwHh2Marc/tKA5
 6ip5ew8OtrsB+zOnO1t8kJESvzZCgajH/fmicRAZ049drOtRFJKCBCoK4IRXeVqa/iX/41wgI
 mm2Df0+Me82D+p+HcMSS0Wjr+pQS+ZGt7CKases4EG74lYCws+80FXf85FA24TgK9QimQnveW
 7+6lhTAqqlA7hZscPl0U6lzAPBzyhxgo7UjZgrOAK4DZtIJF+Xv1/WIdBjn9170+PzEJ/MB74
 He7elFE6hb3stfq2K/WaIsL0n40Ez5FijYsbmI7j4wc6fh3pB4Uy7mNAeN+wXG+pXjwredIYT
 bMpl2y6SBCRVucG192Gps2/LWDLOwGNgaq8KTHyojNz+PbjOSOpUjE4WSqzVqBQAjRPcTCdJ4
 1RZ6R67kxyLqqNwTNPIFle5bUCIrHaHH0CMnY5Oy/SAp4+uHcJkDMKYn3NBL0Eij5UcG5N6No
 p6rwgohIrF1Jm7tWQVMAF5fFZ5443o+DnXpbpj+1QCWL37zgQbhgDbZ9hG5IqmVvd2hAQUOYP
 peJ73QUSxaKvZtRVFwdPYk1Zek9lm1jo7BIeLXEVKibnI7CZIzYe7Yk/EUynTOokinGBy2sG1
 49UHe41dU8UXAuaZd7ls82kDKevGyPPVfTcZeFLTKvyL25AjzdGzUpYv4Fznh4Bm3Vjol4956
 dVVxI4PnahMw6VAoKERfBcy9yCTV79O4LWzD3fLpWtO6mTwkwIROAx72wAS31QbeEfYMq6MOZ
 TZsptI8EwOK9XCcwy7kMX4wKl8e/8HB2r9LS3ZBzWNdQSlVrsQB3W3FTIijHdeawe6AcrD/NM
 x53wATvGkI6VHksLzYhIskR27ZC8G64eF6QWMuho5tTuJYTjkeT72OTWFY5EiDdIG0UqwBHSb
 UdTkiS9VN8fVLJIeavWK4YOEkI8=
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Lee Jones <lee@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jingoo Han <jingoohan1@gmail.com>, Oded Gabbay <ogabbay@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On 7/19/23 10:15, Javier Martinez Canillas wrote:
> This patch series splits the fbdev core support in two different Kconfig
> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB t=
o
> be disabled, while still having the the core fbdev support needed for th=
e

One "the" too much.
(correcting just because this is a cover letter)

> CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automaticall=
y
> disabling all fbdev drivers instead of having to be disabled individuall=
y.
>
> The reason for doing this is that now with simpledrm, there's no need fo=
r
> the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
> now disable them. > But it would simplify the config a lot fo have a sin=
gle
> Kconfig symbol to disable all fbdev drivers.

I suggest to rephrase this, e.g.:
The reason for doing this is that with simpledrm, mainstream Linux distrib=
utions
like Fedora, SUSE or Ubuntu can then more easily enable the DRM drivers on=
ly
by switching off legacy fbdev drivers with one Kconfig option (e.g. for ef=
ifb or
vesafb).

(note: there are quite many other distributions, e.g. debian and the deriv=
ates,
which still need the fbdev drivers for the various other architectures)

> I've built tested with possible combinations of CONFIG_FB, CONFIG_FB_COR=
E,
> CONFIG_DRM_FBDEV_EMULATION and CONFIG_FB_DEVICE symbols set to 'y' or 'n=
'.
>
> Patch #1 moves the auxdisplay drivers to "Graphics support" Kconfig menu=
,
> patch #2 moves the core fbdev Kconfig symbols to a separate Kconfig file=
,
> patch #3 does the FB symbol split and introduces the FB_CORE symbol and
> finally patch #4 makes the DRM symbol to select FB_CORE if the DRM fbdev
> emualtion support was enabled.
>
> Since this series touches three subsystems (auxdisplay, fbdev and DRM),
> I would like to merge it through DRM with the acks of these maintainers.

Sure. Ack from me.

The patch series look good otherwise. You may add:
Acked-by: Helge Deller <deller@gmx.de>

> This is a v6 of the patch-set that addresses issues pointed out by Arnd
> Bergmann in the previous v5:
>
> https://lists.freedesktop.org/archives/dri-devel/2023-July/413943.html
>
> Changes in v6:
> - Don't move FB_{HECUBA,SVGALIB,MACMODES} to config/Kcore (Arnd Bergmann=
).
> - Fix link error when CONFIG_FB_CORE=3Dy and CONFIG_FB=3Dm (Arnd Bergman=
n).
>
> Changes in v5:
> - Take the auxdisplay/Kconfig source out of "if HAS_IOMEM" (Geert Uytter=
hoeven).
> - Fix ifdef guard check in drivers/video/backlight/backlight.c (Arnd Ber=
gmann).
>
> Changes in v4:
> - Fix menuconfig hierarchy that was broken in v3 (Arnd Bergmann).
>
> Changes in v3:
> - Really make a hidden symbol by removing the prompt (Arnd Bergmann).
> - Change FB_CORE to config instead of menuconfig (Arnd Bergmann).
> - Keep "depends on FB" for FIRMWARE_EDID (Arnd Bergmann).
> - Compile out fb_backlight.o and fbmon.o that are only needed for FB
>    (Arnd Bergmann).
> - Make FB_DEVICE to depend on FB_CORE instead of selecting it.
> - Make the DRM symbol to select FB_CORE if DRM_FBDEV_EMULATION is
>    enabled (Arnd Bergmann).
> - Also make DRM select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
> - Make DRM_FBDEV_EMULATION to depend on DRM instead of DRM_KMS_HELPER.
>
> Changes in v2:
> - Keep "depends on FB" for FB_DDC, FB_HECUBA, FB_SVGALIB, FB_MACMODES,
>    FB_BACKLIGHT, FB_MODE_HELPERS and FB_TILEBLITTING (Arnd Bergmann).
> - Don't change the fb.o object name (Arnd Bergmann).
> - Make FB_CORE a non-visible Kconfig symbol instead (Thomas Zimmermann).
> - Make CONFIG_DRM_FBDEV_EMULATION to select FB_CORE (Thomas Zimmermann).
>
> Javier Martinez Canillas (4):
>    video: Add auxiliary display drivers to Graphics support menu
>    fbdev: Move core fbdev symbols to a separate Kconfig file
>    fbdev: Split frame buffer support in FB and FB_CORE symbols
>    drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled
>
>   arch/x86/Makefile                   |   2 +-
>   arch/x86/video/Makefile             |   2 +-
>   drivers/Kconfig                     |   2 -
>   drivers/gpu/drm/Kconfig             |   7 +-
>   drivers/video/Kconfig               |   2 +
>   drivers/video/backlight/backlight.c |   6 +-
>   drivers/video/console/Kconfig       |   2 +-
>   drivers/video/fbdev/Kconfig         | 197 ++--------------------------
>   drivers/video/fbdev/core/Kconfig    | 190 +++++++++++++++++++++++++++
>   drivers/video/fbdev/core/Makefile   |  10 +-
>   10 files changed, 218 insertions(+), 202 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/Kconfig
>

