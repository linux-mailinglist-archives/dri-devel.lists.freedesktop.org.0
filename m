Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288EF4183B2
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 19:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04216E44E;
	Sat, 25 Sep 2021 17:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDA86E44E
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 17:41:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mc02Z-1mzNlP0zRH-00dZKE for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep
 2021 19:41:20 +0200
Received: by mail-wr1-f49.google.com with SMTP id d6so37280188wrc.11
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 10:41:19 -0700 (PDT)
X-Gm-Message-State: AOAM530KyNsQet1ULSvjwpH0BHg/LRrm9CT84K5aXXAQNiNRYp/pft2w
 1KaLnbhF6tbswiuM7aepXsGbhK2+rxiKk+FNRvI=
X-Google-Smtp-Source: ABdhPJzD7fF7tq6rLYrEB//7e7yO+zDI+S3dCg1d1r0r2MDWO3yvErGx3x5MkLRhsuk0e3xLvLsqeGf1sDbZc+8mutY=
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr7831419wmj.1.1632591679710; 
 Sat, 25 Sep 2021 10:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <YU8oVDFoeD5YYeDT@kroah.com>
In-Reply-To: <YU8oVDFoeD5YYeDT@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 25 Sep 2021 19:41:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3pdVhjv4J4HSB1cvHU7U_P7TV7HCOYmrK==V_MAnT2BQ@mail.gmail.com>
Message-ID: <CAK8P3a3pdVhjv4J4HSB1cvHU7U_P7TV7HCOYmrK==V_MAnT2BQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3mDVV2OZnyyKXEgOyU/VrXOKNzEHpAonJBpHUICX/B4t8V1LACF
 JUM3lcTq8u5Z+PVPiLRIxivQYesam+LZbWcsll61G1gx5lwAdOmB1/uLgjo7G2lp8194I8L
 IXFPZNmKSHGqGjUFUm5kY+5wyJdBzz1ylYKFDAaJYHkGD/m40EFtNrFJGBENEQt8ZMHLZ3N
 RF4IY/aZWvaYqufKbuAwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6fyjXhuonjM=:MWLduuJDsncTTSBFzy9wyh
 Q+LdNEZ8/uhNmaahcki4gcWhl9c7ZKQVE9lbsDWQllzR1ByQCQPpvLAR9yJ/IKv7hx3VU+cuk
 urv1GppbTog6yoLVjgmRjifPFDKSFsgtSONHZgnqVD2AuwWX289FJXzMPhG9U4821rOBM3TPf
 YAu5SdRXy/J9u+mOpGx5vvraV2UcB2CaB/s+mg22fmIK3/7G33i1QgPcnMsXccQh3gpouT4zS
 imPfYWZbz1d0ou5JCbMelQ//KYmpo6RdCjCJYy05prPvaZpY836PevhBbgPbFuVP9hH80ecEj
 TJpDxoDzdxVtR2ku+FN4lQrAKJ2YQD6kCK4DU/wqd7nDq0nUbqajErXR5yiw0YpNjQiMdeRfL
 uHUS/CMLYeZd3CBYjgcdf6ULke9PB9WbFxiIt7qQAVH7hjd/atHHOBBtFCnaOdzuf20tN94aS
 gepCMsgsgfPCj/XOJi0Fcd69jfk45AgJNAPKg6rZE4coY2Lxb0KabHZuYm6/DUriYNTGKkr1c
 umYgFB3HfwacdByRACKHFmi33R4gjQY7Wn/jvO+PZXOboon0qJzauZc1VjmLqOqxNxr8pM5rI
 x9r/r/nn9U37gW80phS2/vl0F5IxDc0NbvcDE0gAemEd7TZcxw0MwCR3aONspu5GIc9OmHXqM
 MGbWfwsmZwTEAEVP7ilV0k+Ah0vEWuW+mo9n5tCptdgOfjvHb2Q18IfGmxAkDvHeFk3Z/lgYW
 unKI/JrLI5cu0+2Y5z3hwCSp+GjOjSfHF+4NnPptApU9otdsG9JgQTT9TdkaRoQM4o2FStUy4
 JB07FDbDAQtNGvOf9e1/sQa/sFPLNLX9Bg2aKfvSbtGA6BY+USaE/PfcCaus8ga47Weg0nuVb
 c13uPUwPCRFunOCwrpAw==
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

On Sat, Sep 25, 2021 at 3:47 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> In order to better track where in the kernel the dma-buf code is used,
> put the symbols in the namespace DMA_BUF and modify all users of the
> symbols to properly import the namespace to not break the build at the
> same time.
>
> Now the output of modinfo shows the use of these symbols, making it
> easier to watch for users over time:
>
> $ modinfo drivers/misc/fastrpc.ko | grep import
> import_ns:      DMA_BUF
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> The topic of dma-buf came up in the Maintainer's summit yesterday, and
> one comment was to put the symbols in their own module namespace, to
> make it easier to notice and track who was using them.  This patch does
> so, and finds some "interesting" users of the api already in the tree.
>
> Only test-built on x86 allmodconfig, don't know what other arches will
> pick up, will let 0-day run on it for a bit...

I've added it to my build box doing arm32/arm64/x86 randconfig tests,
if it doesn't report anything by Monday, it's probably good in that regard.

      Arnd
