Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10287768F39
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 09:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A8D10E1C8;
	Mon, 31 Jul 2023 07:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A1910E1C8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690790011; x=1691394811; i=deller@gmx.de;
 bh=zQ7p0g7OWN3Jmy1po2324Kzdhqc+F8FXPGSMTaI9/aY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YdGEhzo1i1AYVukxqjgcZLwSIMETXawn5VNn7cPI4+JVaBbQHJy9nG4bwT8dBneSO6nly9W
 kpkwwHpe70n9kNohDEX08tdLnJrzXT1vajIOwMqFwb9+uYfUrpfJ6ccRQPSveVueFj016J3do
 WF+XxoenELa9BFhd+CxpsZ8NjjmcP6NTvHAWnaR/GHl4nkky94TjBX895Oby0QtrbO0AdEOPr
 vsOzQ1dXurvJjyoNRQCF13peZ9dSUJxOgdOHye9Z3ie0RX8N27zOoKsXBsWJWiXbpqBDevSvL
 6/qALfHEld1Xngtd2UBzzkEoa2DdKjP8ElBJnfym13UoHctavNLQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.238]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3mz-1qIqe01H91-00TVbk; Mon, 31
 Jul 2023 09:53:31 +0200
Message-ID: <6d3dd245-9a13-cfd9-5c21-a0dc12f791bc@gmx.de>
Date: Mon, 31 Jul 2023 09:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] fbdev: Use _DMAMEM_ infix for DMA-memory helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
 javierm@redhat.com
References: <20230729193157.15446-1-tzimmermann@suse.de>
 <20230729193157.15446-4-tzimmermann@suse.de>
 <e25eaae4-dcc9-7864-c655-f9e739db7970@gmx.de>
 <bd0338f7-d79e-dfff-581b-b16352c5371c@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <bd0338f7-d79e-dfff-581b-b16352c5371c@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eXa7s6M1llANEHFMEo700DizZYFZgAsRz1viifEZvu21zswGNGi
 eo8O+xQNWFIpqUGpxgOUgBRi5AY+En2KtTjEfrykYZBJqhWfsdo5sUu7b9aKd5Ux1HKjfz2
 WnzEvWltz9mmTVAPXJOYG+xCTJVjMb/no/uPO18dLGTMf8V9dNCt/U+g4oFGciSYlY1jVAw
 rnbfKUSsuRkFdKQY6nmyw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OK8+QnJPtZE=;wcPvtbmEPJD3qLoDezq4J+UcGnC
 hF4HB+AT7DefKZZZ8oI47k450XR5hceNQrXKwQYiuWeNC8yJa4/NVJkaRsHcu3ESsm9zFTuBq
 wU6zcex+Tn+Tkrf5TEdarvlAn4QF0xkAeUoBF/pCagYI8yPow8AWPMJ9xw6e1tZBAZbGcfhb+
 lK1VaVQNNEwrJDIjl/64rcsfBGgve4YwDgRpa5bVw3QcQOgrAWqXe7EibmtKxidjRfV9qqMfN
 PiHj/pNt12/raP0Tzjv5Ie3D0e0J7Rp8tizsvayDNDdFxBgEb5eHLHuAFZOOK1G3c32v5Ih+4
 FAHkqEVw8BOKsd0mz/vBaIlct91gdRtZq2DURGaIpc102DSycnlxs1IZayYZK/2IEcWFJTAru
 kLIC1E6HZLNOHzL5wPTB7FNYHJxufcm0n30FRxS4u4ipMqBqeEGH6iPOO1s+PgngmF4Qul/Fd
 jEMAiu1Q8eFAccPvCB4W+5aEox0tfpeCurH3ZhIpYfQElkloOjQ9mdLDuIvdVzMrThd6V7fnj
 iJmnLijIxNXcZFiRx63MCN5u8VpS8JvNrp5BFraHT9qFBqXEK4mRTO2l4pgl1zlMuTyx5CueH
 BCpGXWR/zWeSt6xxzgb1fCSsMT3ICkN/nuKVPea0N7XCXqz28DLkqI1l1Dokhrjtj60n4vESx
 SW+d80jTFE0umoe9DBn97X+fG3Q8/wf2O0kX98PAsqR3qExa/muSjsT4FWR32wC1MmkBZRRUW
 P9GhIUpteh2typS/VurFfkth2JOY0z1UwXGPcRqALiIDMzl7Q5OeAJWxeBWGLfguKODJeQQUG
 tMvKcRpQbycfRh8DL5YY9EEhaPGkLE06K/22Fp8B3AgfGbH4I6RuRCeQXiArRLVdmmdiKATjk
 CM5TrNX0MrNXuJtM+DZMcUf8rd8UED+GrMtnLUd7nWJXKfnBtarO8D9Pt+gFHi0mSH793p3hL
 1ZQiUpZ1n6invW+CUiydDDPAogY=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/31/23 09:30, Thomas Zimmermann wrote:
> Hi
>
> Am 30.07.23 um 18:20 schrieb Helge Deller:
>> On 7/29/23 21:26, Thomas Zimmermann wrote:
>>> Change the infix for fbdev's DMA-memory helpers from _DMA_ to
>>> _DMAMEM_. The helpers perform operations within DMA-able memory,
>>
>> Since "DMA" stands for "Direct Memory Access", people already
>> know that it operates on memory. I don't think we need
>> to add "MEM" here.
>> So, maybe we should drop this patch and just keep "DMA"?
>
> I think I'd rather leave it to DMAMEM. It's a bit redundant, but it's
> consistent with the other names and it's clear.  Otherwise, someone
> might thing these helpers are for using DMA engines of some kind.

Ok for me.

Thanks!
Helge

>
> Best regards
> Thomas
>
>>
>> Other than that you patch series looks good!
>> Acked-by: Helge Deller <deller@gmx.de>
>>
>> Helge
>>
>>
>>> but they don't perform DMA operations. Naming should make this
>>> clear. Adapt all users. No functional changes.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>> =C2=A0 drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 =
+-
>>> =C2=A0 drivers/gpu/drm/drm_fbdev_dma.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>>> =C2=A0 drivers/gpu/drm/exynos/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 4 ++--
>>> =C2=A0 drivers/gpu/drm/omapdrm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 drivers/gpu/drm/omapdrm/omap_fbdev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 4 ++--
>>> =C2=A0 drivers/gpu/drm/tegra/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 drivers/gpu/drm/tegra/fbdev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>>> =C2=A0 drivers/video/fbdev/core/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 include/linux/fb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>>> =C2=A0 10 files changed, 15 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 34da733e8606..b51c6a141dfa 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -224,7 +224,7 @@ config DRM_TTM_HELPER
>>> =C2=A0 config DRM_GEM_DMA_HELPER
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on DRM
>>> -=C2=A0=C2=A0=C2=A0 select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
>>> +=C2=A0=C2=A0=C2=A0 select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose this if you need the=
 GEM DMA helper functions
>>>
>>> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbd=
ev_dma.c
>>> index 6db168f94290..6c9427bb4053 100644
>>> --- a/drivers/gpu/drm/drm_fbdev_dma.c
>>> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
>>> @@ -62,9 +62,9 @@ static const struct fb_ops drm_fbdev_dma_fb_ops =3D =
{
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .owner =3D THIS_MODULE,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_open =3D drm_fbdev_dma_fb_open,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_release =3D drm_fbdev_dma_fb_releas=
e,
>>> -=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMA_OPS_RDWR,
>>> +=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMAMEM_OPS_RDWR,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_FB_HELPER_DEFAULT_OPS,
>>> -=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMA_OPS_DRAW,
>>> +=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMAMEM_OPS_DRAW,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_mmap =3D drm_fbdev_dma_fb_mmap,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_destroy =3D drm_fbdev_dma_fb_destro=
y,
>>> =C2=A0 };
>>> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/K=
config
>>> index 661b42ad4873..733b109a5095 100644
>>> --- a/drivers/gpu/drm/exynos/Kconfig
>>> +++ b/drivers/gpu/drm/exynos/Kconfig
>>> @@ -7,7 +7,7 @@ config DRM_EXYNOS
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_DISPLAY_HELPER if DRM_EXYNOS=
_DP
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_KMS_HELPER
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select VIDEOMODE_HELPERS
>>> -=C2=A0=C2=A0=C2=A0 select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
>>> +=C2=A0=C2=A0=C2=A0 select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select SND_SOC_HDMI_CODEC if SND_SOC
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose this option if you h=
ave a Samsung SoC Exynos chipset.
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fbdev.c
>>> index 4ccb385aff52..a379c8ca435a 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
>>> @@ -49,9 +49,9 @@ static void exynos_drm_fb_destroy(struct fb_info *in=
fo)
>>>
>>> =C2=A0 static const struct fb_ops exynos_drm_fb_ops =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .owner=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D THIS_MODULE,
>>> -=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMA_OPS_RDWR,
>>> +=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMAMEM_OPS_RDWR,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_FB_HELPER_DEFAULT_OPS,
>>> -=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMA_OPS_DRAW,
>>> +=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMAMEM_OPS_DRAW,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_mmap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D exynos_drm_fb_mmap,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_destroy=C2=A0=C2=A0=C2=A0 =3D exyno=
s_drm_fb_destroy,
>>> =C2=A0 };
>>> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm=
/Kconfig
>>> index d3c4877e465c..b715301ec79f 100644
>>> --- a/drivers/gpu/drm/omapdrm/Kconfig
>>> +++ b/drivers/gpu/drm/omapdrm/Kconfig
>>> @@ -4,7 +4,7 @@ config DRM_OMAP
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on DRM && OF
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on ARCH_OMAP2PLUS
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_KMS_HELPER
>>> -=C2=A0=C2=A0=C2=A0 select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
>>> +=C2=A0=C2=A0=C2=A0 select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select VIDEOMODE_HELPERS
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HDMI
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default n
>>> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/om=
apdrm/omap_fbdev.c
>>> index 5b33c789e17a..6b08b137af1a 100644
>>> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
>>> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
>>> @@ -106,13 +106,13 @@ static void omap_fbdev_fb_destroy(struct fb_info=
 *info)
>>>
>>> =C2=A0 static const struct fb_ops omap_fb_ops =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .owner =3D THIS_MODULE,
>>> -=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMA_OPS_RDWR,
>>> +=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMAMEM_OPS_RDWR,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_check_var=C2=A0=C2=A0=C2=A0 =3D drm=
_fb_helper_check_var,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_set_par=C2=A0=C2=A0=C2=A0 =3D drm_f=
b_helper_set_par,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_setcmap=C2=A0=C2=A0=C2=A0 =3D drm_f=
b_helper_setcmap,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_blank=C2=A0=C2=A0=C2=A0 =3D drm_fb_=
helper_blank,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_pan_display =3D omap_fbdev_pan_disp=
lay,
>>> -=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMA_OPS_DRAW,
>>> +=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMAMEM_OPS_DRAW,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_ioctl=C2=A0=C2=A0=C2=A0 =3D drm_fb_=
helper_ioctl,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_mmap=C2=A0=C2=A0=C2=A0 =3D omap_fbd=
ev_fb_mmap,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_destroy=C2=A0=C2=A0=C2=A0 =3D omap_=
fbdev_fb_destroy,
>>> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kco=
nfig
>>> index 39452c8480c1..84e7e6bc3a0c 100644
>>> --- a/drivers/gpu/drm/tegra/Kconfig
>>> +++ b/drivers/gpu/drm/tegra/Kconfig
>>> @@ -12,7 +12,7 @@ config DRM_TEGRA
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_KMS_HELPER
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_MIPI_DSI
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_PANEL
>>> -=C2=A0=C2=A0=C2=A0 select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
>>> +=C2=A0=C2=A0=C2=A0 select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select TEGRA_HOST1X
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select INTERCONNECT
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select IOMMU_IOVA
>>> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbd=
ev.c
>>> index 206a399c42d6..db6eaac3d30e 100644
>>> --- a/drivers/gpu/drm/tegra/fbdev.c
>>> +++ b/drivers/gpu/drm/tegra/fbdev.c
>>> @@ -59,9 +59,9 @@ static void tegra_fbdev_fb_destroy(struct fb_info *i=
nfo)
>>>
>>> =C2=A0 static const struct fb_ops tegra_fb_ops =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .owner =3D THIS_MODULE,
>>> -=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMA_OPS_RDWR,
>>> +=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMAMEM_OPS_RDWR,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_FB_HELPER_DEFAULT_OPS,
>>> -=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMA_OPS_DRAW,
>>> +=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_DMAMEM_OPS_DRAW,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_mmap =3D tegra_fb_mmap,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_destroy =3D tegra_fbdev_fb_destroy,
>>> =C2=A0 };
>>> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/co=
re/Kconfig
>>> index 28e771a46df6..baf7e852c75b 100644
>>> --- a/drivers/video/fbdev/core/Kconfig
>>> +++ b/drivers/video/fbdev/core/Kconfig
>>> @@ -136,7 +136,7 @@ config FB_DEFERRED_IO
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB_CORE
>>>
>>> -config FB_DMA_HELPERS
>>> +config FB_DMAMEM_HELPERS
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB_CORE
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select FB_SYS_COPYAREA
>>> diff --git a/include/linux/fb.h b/include/linux/fb.h
>>> index 76472482dc30..d255263c2d1d 100644
>>> --- a/include/linux/fb.h
>>> +++ b/include/linux/fb.h
>>> @@ -579,11 +579,11 @@ extern ssize_t fb_sys_write(struct fb_info *info=
, const char __user *buf,
>>> =C2=A0=C2=A0 * Helpers for framebuffers in DMA-able memory
>>> =C2=A0=C2=A0 */
>>>
>>> -#define __FB_DEFAULT_DMA_OPS_RDWR \
>>> +#define __FB_DEFAULT_DMAMEM_OPS_RDWR \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_read=C2=A0=C2=A0=C2=A0 =3D fb_sys_r=
ead, \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_write=C2=A0=C2=A0=C2=A0 =3D fb_sys_=
write
>>>
>>> -#define __FB_DEFAULT_DMA_OPS_DRAW \
>>> +#define __FB_DEFAULT_DMAMEM_OPS_DRAW \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_fillrect=C2=A0=C2=A0=C2=A0 =3D sys_=
fillrect, \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_copyarea=C2=A0=C2=A0=C2=A0 =3D sys_=
copyarea, \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_imageblit=C2=A0=C2=A0=C2=A0 =3D sys=
_imageblit
>>
>

