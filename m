Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E22D68279E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 09:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F4510E147;
	Tue, 31 Jan 2023 08:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5701810E147
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 08:53:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C69F0B81A7C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 08:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE203C433A8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675155236;
 bh=JRJCmS7TbfihSxBfK2OlvDfGSJCL2cPfzKd3PSOst4I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=e0WzMsnXMRgESaubaTkB9p7ctnndIMMwUJLZYY2btHtiLh5di4VpWu52eCP9dxAnL
 yvDs4wZz64JrZ1tf2tXp6YmtBKARaS8Hj5nfh1MkL5Mb7AYD1ogervNbxNUf/zNOAK
 KEMySNNUvRRH2u3zjHB8HRTyqtlzV5ahX2wCW0tHXCu5zZ/bZJAbLdg/efleEi5Ymk
 yWxN8V38htp20sOk16CDFI6EKGeYZviq+KoQTtt95qFPpfv4/W8k7bT9lnoyY02RxC
 gO2RjyXBddRUuOs4jUqogCMNSchFuX4+l8pOk4/ILagiBFFqlS3SrdjuP9A8lRDljm
 5gQHuWywTJGIA==
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-50660e2d2ffso194714977b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 00:53:55 -0800 (PST)
X-Gm-Message-State: AFqh2koMnXI/i5SkeOrCtXt+yHIbAgpoe8h4+gcQnCv/llDztlNryz1g
 /und5by+zhutjdhTRwnDgNeAFYhgmy2cTXlvyvo=
X-Google-Smtp-Source: AMrXdXt9H80BxARzMJJWDaxQGGFOEhNQbEiRDMS6HuGbtD0/x3qYCDvGhyZLLu6Gk5B3Ci3YWGlZ2hpvM4AKOSMrydU=
X-Received: by 2002:a81:14d3:0:b0:459:ef5d:529c with SMTP id
 202-20020a8114d3000000b00459ef5d529cmr8910623ywu.211.1675155234934; Tue, 31
 Jan 2023 00:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20230127221504.2522909-1-arnd@kernel.org>
In-Reply-To: <20230127221504.2522909-1-arnd@kernel.org>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 31 Jan 2023 10:53:28 +0200
X-Gmail-Original-Message-ID: <CAFCwf10RRFUqYEATg7p-LmKSEkFtAhneufJTdezFA7i3HJaDDw@mail.gmail.com>
Message-ID: <CAFCwf10RRFUqYEATg7p-LmKSEkFtAhneufJTdezFA7i3HJaDDw@mail.gmail.com>
Subject: Re: [PATCH] [v2] accel: fix CONFIG_DRM dependencies
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 28, 2023 at 12:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> At the moment, accel drivers can be built-in even with CONFIG_DRM=m,
> but this causes a link failure:
>
> x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_dev_init':
> ivpu_drv.c:(.text+0x1535): undefined reference to `drmm_kmalloc'
> x86_64-linux-ld: ivpu_drv.c:(.text+0x1562): undefined reference to `drmm_kmalloc'
> x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_remove':
> ivpu_drv.c:(.text+0x1faa): undefined reference to `drm_dev_unregister'
> x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_probe':
> ivpu_drv.c:(.text+0x1fef): undefined reference to `__devm_drm_dev_alloc'
>
> The problem is that DRM_ACCEL is a 'bool' symbol symbol, so driver that
> only depend on DRM_ACCEL but not also on DRM do not see the restriction
> to =m configs.
>
> To ensure that each accel driver has an implied dependency on CONFIG_DRM,
> enclose the entire Kconfig file in an if/endif check.
>
> Fixes: 8bf4889762a8 ("drivers/accel: define kconfig and register a new major")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: rearrage the DRM dependency rather than requiring DRM to be built-in
> ---
>  drivers/accel/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index 834863902e16..c437206aa3f1 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -6,9 +6,10 @@
>  # as, but not limited to, Machine-Learning and Deep-Learning acceleration
>  # devices
>  #
> +if DRM
> +
>  menuconfig DRM_ACCEL
>         bool "Compute Acceleration Framework"
> -       depends on DRM
>         help
>           Framework for device drivers of compute acceleration devices, such
>           as, but not limited to, Machine-Learning and Deep-Learning
> @@ -25,3 +26,5 @@ menuconfig DRM_ACCEL
>
>  source "drivers/accel/habanalabs/Kconfig"
>  source "drivers/accel/ivpu/Kconfig"
> +
> +endif
> --
> 2.39.0
>
This patch is:
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
