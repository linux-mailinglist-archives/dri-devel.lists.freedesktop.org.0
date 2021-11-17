Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F97345424B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 09:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F47A6E8AC;
	Wed, 17 Nov 2021 08:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Wed, 17 Nov 2021 08:03:53 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2C36E8AC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 08:03:53 +0000 (UTC)
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MGhi0-1ms9Na1jEY-00DqG4 for <dri-devel@lists.freedesktop.org>; Wed, 17
 Nov 2021 08:58:48 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so1382224wmz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 23:58:48 -0800 (PST)
X-Gm-Message-State: AOAM530qWytJyrxeTQcFif8wrGwo6kLCFoUwDU2E9HFhies+NdDXM/cX
 wjFjpiC/q34H7SvSOZb4abzmztUaRwQ2c0i2AZ8=
X-Google-Smtp-Source: ABdhPJxQ+x4Y1Ck1Hf5j/rHJ6qKfOAzp3wcdUpbV+b0x9HS0VH1nbg7XR0thXzSRbQKN9uAm9cLnpA/Gc9tUBUrm4hA=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr74998462wmi.173.1637135927739; 
 Tue, 16 Nov 2021 23:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20211117062704.14671-1-rdunlap@infradead.org>
In-Reply-To: <20211117062704.14671-1-rdunlap@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Nov 2021 08:58:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1cayrsR9J+G6bAkZjK-hGaNzqSQAxB5LS4pvJm_rtpHQ@mail.gmail.com>
Message-ID: <CAK8P3a1cayrsR9J+G6bAkZjK-hGaNzqSQAxB5LS4pvJm_rtpHQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: modify Kconfig to prevent build error
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EBwO2u1H65DXk7852mCHX5AwieQpRzyCOoaAc3AyAJdijg4uosk
 Cjzqs+ndveRs7yLqfR7QdclnjI/lU8acJUouZRS3R9gBSJRHRCJuEDB02dr0kXKuI5hIzFc
 NCLz6Gj7mpB9A/vAUSnfIIQpFMHViwwWUssds2rrjHLJbpF3NQsjz6EzeDVtYpXoxj0Wa48
 v/B0oeu5U6pUlXWf54S/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hm7qFah1s+8=:FoLcZ1rXrCVVAUcByWi88M
 6AYM+kyrsfFb8thNGUBl6iGvRJz1DIKZ4eWZi5XT16a5VHcs44BU4DzRcsdxy0sLWNAsporx1
 YoVW5FmQ85U7qyviHy2mI2+ZMmhAhwB+pIsb5kyIotFD7A0UMjTiK7R8II/2PwMrUgh6yO4mx
 S2Za2l1jjjSPxgmd3agXTvXw+DY1Hnjpw4Scv2522DsMsYX4nC+iW3xvr1pcnvjaa026Lsp5c
 8vAjvRRHBIpFAwWMmSQMdY8wiNFmhOfktpugQDvGts+Za/dN7YeA0nhMsSUzZNx45q6g5C69L
 tfXRXWIcrYiBQoT1VmPyqlSxDEfKJzlQ3DuJ06X5AzzhuvrbvsPX19GNP66t333jpqxizwUWT
 GNynl6X7ul+3gLsLuYOkJOKBYVOTDaVB6VwB5fXLL6PwFiMctaM+AduwEVClQaEKqpVvRKxiF
 XxuqSrbiDtymTU6x7+Bsu5B0fVcE3z5MUzIDkMZTepgw4Be8plZ0ETUbuHLnFPUvZL2DU38en
 sHFa1YRv7rd9y/ui2uSyKzuv2hqC3CYIgBpqrWdjy0TDgAFARUexcxCiKgjmBvkVAVmMXwmmH
 OHkvRfYOfsu0Wnh+JYTo4bt7unqhuurIx7s9TfmWdPAZhSk/snT74BHr1ykahog4CJXOdzwKQ
 +MekiBQU8VXKPhFKYPrOyRblGGpmCzsIYmZIPseOkTpFGH0U9SfYbEVgARyM2tlkan22toDbe
 xXnc95BKLM4nQJ+XbV8dN0oYYiz1AbrFNbbxz11MynO2B4KnSlQJtopl16WExqh3hIIyWYw3K
 fSkEVdzEhMYvTDrwkAAR+iF0Uwe0mgwexF1c4aZCX0oljwCiSg=
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
Cc: Douglas Anderson <dianders@chromium.org>, kernel test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 7:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> When CONFIG_DRM_KMS_HELPER=m and CONFIG_DRM_PANEL_EDP=y,
> there is a build error in gpu/drm/panel/panel-edp.o:
>
> arm-linux-gnueabi-ld: drivers/gpu/drm/panel/panel-edp.o: in function `panel_edp_probe':
> panel-edp.c:(.text+0xf38): undefined reference to `drm_panel_dp_aux_backlight'
>
> Fix this by limiting DRM_PANEL_DEP by the value of the DRM_KMS_HELPER
> symbol.

I think the analysis is correct, but this is not the correct fix since
DRM_KMS_HELPER
is not user-selectable. (Almost) all other drivers that rely on DRM_KMS_HELPER
use 'select' for this, and mixing the two risks running into circular
dependencies.

I see that there are already some 'depends on DRM_KMS_HELPER' in bridge
and panel drivers, so it's possible that we have to fix them all at the same to
do this right. I ran into another problem like this the other day and
I'm currently
testing with the patch below, but I have not posted that yet since I am not
fully convinced that this is the correct fix either.

        Arnd
---
commit a836092fedaac66af03ea9ed7cb13214fd2ab8a2
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Nov 15 16:54:04 2021 +0100

    drm/mipi-dbi: select CONFIG_DRM_KMS_HELPER

    The driver fails to build when the KMS helpers are disabled:

    ld.lld: error: undefined symbol: drm_gem_fb_get_obj
    >>> referenced by drm_mipi_dbi.c
    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in
archive drivers/built-in.a
    >>> referenced by drm_mipi_dbi.c
    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_fb_dirty) in
archive drivers/built-in.a

    ld.lld: error: undefined symbol: drm_gem_fb_begin_cpu_access
    >>> referenced by drm_mipi_dbi.c
    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in
archive drivers/built-in.a

    ld.lld: error: undefined symbol: drm_fb_swab
    >>> referenced by drm_mipi_dbi.c
    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in
archive drivers/built-in.a

    ld.lld: error: undefined symbol: drm_fb_xrgb8888_to_rgb565
    >>> referenced by drm_mipi_dbi.c
    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in
archive drivers/built-in.a

    ld.lld: error: undefined symbol: drm_fb_memcpy
    >>> referenced by drm_mipi_dbi.c
    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in
archive drivers/built-in.a

    This is fairly hard to hit in randconfig drivers, but it eventually
    did trigger for me in a configuration where all other DRM drivers
    are loadable modules, but DRM_PANEL_WIDECHIPS_WS2401 was built-in.

    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 0039df26854b..a03c2761c5f9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -29,6 +29,7 @@ menuconfig DRM

 config DRM_MIPI_DBI
        tristate
+       select DRM_KMS_HELPER
        depends on DRM

 config DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 431b6e12a81f..17a8d603e7d8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -8,7 +8,6 @@ config DRM_BRIDGE
 config DRM_PANEL_BRIDGE
        def_bool y
        depends on DRM_BRIDGE
-       depends on DRM_KMS_HELPER
        select DRM_PANEL
        help
          DRM bridge wrapper of DRM panels
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index cfc8d644cedf..40ec20f3552d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -140,9 +140,8 @@ config DRM_PANEL_ILITEK_IL9322
 config DRM_PANEL_ILITEK_ILI9341
        tristate "Ilitek ILI9341 240x320 QVGA panels"
        depends on OF && SPI
-       depends on DRM_KMS_HELPER
-       depends on DRM_KMS_CMA_HELPER
        depends on BACKLIGHT_CLASS_DEVICE
+       select DRM_KMS_CMA_HELPER
        select DRM_MIPI_DBI
        help
          Say Y here if you want to enable support for Ilitek IL9341
