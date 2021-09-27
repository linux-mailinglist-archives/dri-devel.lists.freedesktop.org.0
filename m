Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF684191B1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 11:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FB66E83B;
	Mon, 27 Sep 2021 09:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448B96E83B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 09:39:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N2Dks-1mz1JU2zGg-013hk2 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep
 2021 11:39:38 +0200
Received: by mail-wr1-f48.google.com with SMTP id g16so50635746wrb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 02:39:38 -0700 (PDT)
X-Gm-Message-State: AOAM530FKlVga8GxZbLYE9chkv7ae/3BTpSJxN0U2gC5gdWwC++fH1rQ
 ew/ojg7bBYvfa1a9ak8A/ANcgqYrGYqVukgF+kI=
X-Google-Smtp-Source: ABdhPJzw8wp0ZsXSNDvP3gv334QGiK0yVNSZyzNIHpmCfkoIjZ41K7Vl7uVq2HYR9WzUuAX6tNcVwXjlGq+HfuyrMz0=
X-Received: by 2002:a1c:2357:: with SMTP id j84mr5135591wmj.1.1632735578051;
 Mon, 27 Sep 2021 02:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <YU8oVDFoeD5YYeDT@kroah.com>
 <CAK8P3a3pdVhjv4J4HSB1cvHU7U_P7TV7HCOYmrK==V_MAnT2BQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3pdVhjv4J4HSB1cvHU7U_P7TV7HCOYmrK==V_MAnT2BQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Sep 2021 11:39:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0gSJrR=rLtyLOH+D-grsoy_9_kOOS-AT3aX8R48p+zww@mail.gmail.com>
Message-ID: <CAK8P3a0gSJrR=rLtyLOH+D-grsoy_9_kOOS-AT3aX8R48p+zww@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:i6E4bntCYxZkVwvz13B7JEgOLTIb9OMB9CCiwPrfADmPNN7xdMY
 o5rgbTyQukcIiL/zlzmeG3dPkGOr5V8LfZdnLZbLUFw8UKpIsNkjPunkiNyAogQLjy/Owlh
 9iSB0lwmpcVtr0chnXIstfqiRzSJ4j3LVs7qGvbc1Bt8zUcsbK8fK+5fm9ljSmm6UTX6Bth
 2ejsyJdSYv3mDuIpdOc0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1sIN3JTl8aE=:ufkF06D2hdBtyv6HKPvNP/
 4dbmByp7rbjd8HTRXBoagncxMhf0YmqFBgeyJ3j/a8M5jM6No2Hnmsy1ucmBJsyXpsnnQ8Yph
 d7iVCQlzqeYisYlW0eHZiQ5itnCprTfohEP6YMSZ6htU1rF/6yb4vNkO8ngP6eMkBim30dRhU
 QX4p4o2ARb7qMZsX92a7jr/MlGpXYAbXHy9LeCg6+o+eRlbYvrHJVLxTKtxI1USZsHTCscKQ2
 INrf14RErYJPQdyUVlSIH8CaHM0CMLELV1uETc+Eo/vfPV4oic3R6QBID0o6i2pMIwqKKitXk
 YSomfc2vPPEpD2bvUg1/yEYGrVykU5BKHzO6L6wBPn/PbEbKiKleERcu2RIIF5GvUtFijpuAt
 tQ9YENMlnztUakkAUfMgX6R35MH4FsEs3T8gYHaxEL9uz4QmBf0GCCQ50rqYODKQO/ByHZmfh
 fRyWptxjesgC6EL3UtSA3xZzfzQxOxOokGHy67QT5oo5QR66qmQN5CyCBHbWcR4SC2xY6ukFc
 WFCSfEX1sI6EG9Ih46kIB6r/3Wo+D7ddkMtJ5swNl1QMgq9g2iAoZ9Ilcpq0hP4N3x2B5X7VH
 GSwD4vlHOtXhQSm4+HvYJd1E27uUOH04dGTQdDPOns+SWvqGM9v+93B1fFB/wbpgbinAU6dIk
 /5tt61tbD/eWzKNFV38PorFBOe46RmFT9g2HSm8uAu3HGe0xJKamwg2AkgfhnjhLnZyaK+MLc
 Gggu2+BA5pAYO+iyvsg8mMVrHrDFxB+MCHhUJLQz/hwVfu0a8Bq7QdR/oHYN8ma05zBxWfmjy
 H0tKwjovKzqbimNsCRUbsCzQV8gtoB+LDJURjBrK3LOD0ENGb3+L1dOJj9CTRppnbk3d5c5OH
 GjfZZUNqMgsAo+sH2efw==
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

On Sat, Sep 25, 2021 at 7:41 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Sat, Sep 25, 2021 at 3:47 PM Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> > Only test-built on x86 allmodconfig, don't know what other arches will
> > pick up, will let 0-day run on it for a bit...
>
> I've added it to my build box doing arm32/arm64/x86 randconfig tests,
> if it doesn't report anything by Monday, it's probably good in that regard.

It found these two, please fold into your patch:

diff --git a/drivers/gpu/drm/armada/armada_gem.c
b/drivers/gpu/drm/armada/armada_gem.c
index 21909642ee4c..711f0cca6f9c 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -15,6 +15,8 @@
 #include "armada_gem.h"
 #include "armada_ioctlP.h"

+MODULE_IMPORT_NS(DMA_BUF);
+
 static vm_fault_t armada_gem_vm_fault(struct vm_fault *vmf)
 {
        struct drm_gem_object *gobj = vmf->vma->vm_private_data;
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index f4cde3a169d8..809f86cfc540 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -11,6 +11,8 @@

 #include "omap_drv.h"

+MODULE_IMPORT_NS(DMA_BUF);
+
 /* -----------------------------------------------------------------------------
  * DMABUF Export
  */
