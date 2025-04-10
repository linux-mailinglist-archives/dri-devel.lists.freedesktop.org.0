Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B93A85C97
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7740710EB8B;
	Fri, 11 Apr 2025 12:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HVPZmD5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE9E10E9C7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:46:35 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e614da8615so1743374a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744292793; x=1744897593; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s3Tv77bW0aU9RBMscUYQTaZLK3cWTZ2jDWR8IUulQ9A=;
 b=HVPZmD5qhe9iOnYlyYd7vc4+Si/F7AC4uG0RBA93l5tLbMHvNca3rPeNW9MWfOZOOJ
 dlXOlKRv74tuDiJTcOJAGvn/4CJnZtNVPwngEEMXNd0Kf/RMXrOSDRp3DZ8Jxfwya510
 sr5fTpf2JmPBrl+xzRBLjgyBv2wPc+hbQVae+rEzFs9LPZByhrFObX923mgisoBjBztw
 inL2Vtt92+vysXQnjyiTT72WzSCkzBhYkn6VuyHP7iEyrMN7wLkD19gUtrq4tCbBzC2s
 Ig2/p+du3DjXy1/iQAX0c5nmrucn9eRq7/FRlFgMo4oRcsBOO1zLaQTNu0HPIg0TeYvu
 fyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744292793; x=1744897593;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s3Tv77bW0aU9RBMscUYQTaZLK3cWTZ2jDWR8IUulQ9A=;
 b=uJME6yFOmH3hbFXVb8tyGzRpDQp2ri0AVdfxu3nYzkd530iFJ1gmCS15XRHstPMBFq
 X1vIWSMGbZtW94O0nPaueMWj2vf6jGx4UnonvNXAjbH2RFQeEiyAhXoS8/f9KFKfJwlX
 2qQnEt35viGOut89IF152vHvKgx4+8U9BmY9ybo7D82Hv8hkvcGKmLZ8CNGccYwd3zJx
 J+5awExKf/2QKC327uiC6JgQwBrrEwzxyTCd5AqIKkAxVTIh6GghgGjNIpFAL8wDQm60
 pydHoeePiHjkJeioJWNkJWRayLaxABhiycFwD9AwmdVDS7rc7PVohhFadYAyrhtZSPXi
 o56A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/1dphAw3A/k/aPrUzD16CYGrrfB2kAmUG/uZHOLHtHB+Azp8giqCy+8hj0gaCQu+n09UIvOxyi/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx075jxSzhiH+KEVI91kgG+KjRdR8dEK+fGM+9WjKn9q/siWeAS
 DrWA1QWR6dpIwI5gDNYL9qQSNj0XFSF5gZENSl3FCGcdLXqwhG7bH7mGkstqduQkZMdzR6TROui
 W47kHB07ENOr8HHwzGIq0UkXxeG/VQ/WW
X-Gm-Gg: ASbGncuJCzAXCj79tWXMvffCedsILDY+bv2uZsbRJflfqutIvV9FBwI9BvymczbExk1
 TZ5VHdijJ6ZTjhllvFwnPrCJ12r5zWsfmBT4LPifPUCs+9jiqFJNWCqwsvnltHaAc+THdhy/y2K
 EWGTX8WSD9IOfPUAq/Vy8ANg==
X-Google-Smtp-Source: AGHT+IHiZFDgujiOG3UnHGeTx0KUPl+GHBXPb9fdrtmfKTuXg91n647EErsdZP3zN0Q/Y37TV62Z4t7VfBh5GpvARCI=
X-Received: by 2002:a05:6402:268b:b0:5e5:334e:86d9 with SMTP id
 4fb4d7f45d1cf-5f32a138efdmr2440544a12.13.1744292793246; Thu, 10 Apr 2025
 06:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 10 Apr 2025 19:16:16 +0530
X-Gm-Features: ATxdqUEdXHiyPPzlQQzx8sGDVrj8q4dzBzZE7dD5ZZvqIMWxRPwWGuOzBSchz3Y
Message-ID: <CANAwSgTp26r-xeiSDkdX21Sp3RQtfh42JV4fCgirLkHZYuGD-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 jbrunet@baylibre.com, neil.armstrong@linaro.org, 
 Furkan Kardame <f.kardame@manjaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 11 Apr 2025 12:12:44 +0000
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

Hi Martin,

On Thu, 10 Apr 2025 at 03:30, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> meson_drv_bind_master() does not free resources in the order they are
> allocated. This can lead to crashes such as:
>     Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c8
>     [...]
>     Hardware name: Beelink GT-King Pro (DT)
>     pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
>     lr : component_unbind+0x38/0x60
>     [...]
>     Call trace:
>      meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
>      component_unbind+0x38/0x60
>      component_unbind_all+0xb8/0xc4
>      meson_drv_bind_master+0x1ec/0x514 [meson_drm]
>      meson_drv_bind+0x14/0x20 [meson_drm]
>      try_to_bring_up_aggregate_device+0xa8/0x160
>      __component_add+0xb8/0x1a8
>      component_add+0x14/0x20
>      meson_dw_hdmi_probe+0x1c/0x28 [meson_dw_hdmi]
>      platform_probe+0x68/0xdc
>      really_probe+0xc0/0x39c
>      __driver_probe_device+0x7c/0x14c
>      driver_probe_device+0x3c/0x120
>      __driver_attach+0xc4/0x200
>      bus_for_each_dev+0x78/0xd8
>      driver_attach+0x24/0x30
>      bus_add_driver+0x110/0x240
>      driver_register+0x68/0x124
>      __platform_driver_register+0x24/0x30
>      meson_dw_hdmi_platform_driver_init+0x20/0x1000 [meson_dw_hdmi]
>      do_one_initcall+0x50/0x1bc
>      do_init_module+0x54/0x1fc
>      load_module+0x788/0x884
>      init_module_from_file+0x88/0xd4
>      __arm64_sys_finit_module+0x248/0x340
>      invoke_syscall+0x48/0x104
>      el0_svc_common.constprop.0+0x40/0xe0
>      do_el0_svc+0x1c/0x28
>      el0_svc+0x30/0xcc
>      el0t_64_sync_handler+0x120/0x12c
>      el0t_64_sync+0x190/0x194
>
> Clean up resources in the error path in the same order and under the
> same conditions as they were allocated to fix this.
>
> Reported-by: Furkan Kardame <f.kardame@manjaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> This issue was reported off-list so I'm unable to provide a link to the
> report.
>
> I'm not sure which Fixes tag fits best. My preference so far is
> Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
> but I'll happily take other suggestions as well.
>
Thanks for this Fix.

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

I have tested with the following script on AML-S905X-CC
---------
#! /bin/bash
set +x

cd /sys/bus/platform/drivers/meson-drm/
for i in $(seq 1 10); do
        echo "========================" $i
        echo d0100000.vpu > unbind
        /usr/bin/sleep 1
        echo d0100000.vpu > bind
        /usr/bin/sleep 1
done

Thanks
-Anand
