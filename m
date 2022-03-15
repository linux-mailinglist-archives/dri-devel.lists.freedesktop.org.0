Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B91C4D9B6F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF0710E3D1;
	Tue, 15 Mar 2022 12:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB1C10E3D1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:43:34 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id kj21so11973723qvb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fEAT5UUsmyhaWxfcdGvh7mL5N8nTzlfAjcT9ivAGrCk=;
 b=cJ3yz86PEJDMILIQDbCRMD2eU82iXa2ZdXQiRq/hGWWqGtCRC3levbgE1ET08LU9JZ
 Idn5sFu8lxnTQL1hHkWMqNUUNohvVuk33T7Er5pIDgobs0u9fwZ51Y0BYG7sEic/uHli
 gBxt9aBWt25EJoNh2wcv5sbrlTOfvSGOLDznrsFb6S7YuIIlfaB09htbwydgfWEHkhFW
 lzEDYnuMGPHCPfylp0nNT5oN+UIU6NITjEKoJO9NerR3bfgpLmlcU6VgyLOPtgM//zqd
 ZDwG53dsSK1qMWwtZCaS2kCNFkzEoQ2FGVH7My+q7d1fBMrkGuaEZLIU/AJf3uA/zUeo
 eY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fEAT5UUsmyhaWxfcdGvh7mL5N8nTzlfAjcT9ivAGrCk=;
 b=aPrZwHV5PhADT3gfBv5CIYrIXjLYEM/Kko/EzJkTc8UqZDEiE+hBE0fE/inzOCRvob
 opysrafcF+wCkWBwVpPCunr4QEIzONayJlvhxHiNVG5L8kCJJd1CGXSRhoNW+pqA5i6i
 8lGZn7nZfI91SloBaFzDOLu3riJZI5i0nFNeDa59imrY8xtCuhJx6NRe7seaoYciSOcM
 pJP9JLAWl7i0/9M4tMpUWrX6a8nTfRgZNrXyUROjngXWtvxSyoXHjNq2NhYJvvvBQR/d
 hbCzv2/SUbJr8kfgp7gSRnbT3M1SNxqeogTI+THIo6VeEv4mJx2fyo4hE4D+iYWpuvsR
 c5Fw==
X-Gm-Message-State: AOAM533bVV6k11REx16LZCHY2TVxM3DohzVcZjqv+GJJ/mg68o5rHDNq
 grjOyXUKZBgLncAGKZ90RzWnyLgXjPNGLkSIpG0=
X-Google-Smtp-Source: ABdhPJyoBonLxpVxdTKXm42VxIsdx96swV25W1RhjgHw2hK2gkTM/mwRVMnfK/H+pC9Fm5nWO7+Bak6+7qLijWaZH/I=
X-Received: by 2002:a05:6214:262a:b0:439:2d7c:a4fb with SMTP id
 gv10-20020a056214262a00b004392d7ca4fbmr18312638qvb.121.1647348213749; Tue, 15
 Mar 2022 05:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-8-dmitry.osipenko@collabora.com>
In-Reply-To: <20220314224253.236359-8-dmitry.osipenko@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 15 Mar 2022 12:43:22 +0000
Message-ID: <CACvgo52-pd-g=ZnR=m0T7W2yQ4i7_Q6gWy22=vm-fX+eA-YwQg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/virtio: Support memory shrinking
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings everyone,

Food for thought: Would it make sense to have the madvise ioctl as
generic DRM one?
Looking around - i915, msm & panfrost already have one and the virtio
implementation [below] seems as generic as it gets.

On Mon, 14 Mar 2022 at 22:44, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:

> +#define VIRTGPU_MADV_WILLNEED 0
> +#define VIRTGPU_MADV_DONTNEED 1
> +struct drm_virtgpu_madvise {
> +       __u32 bo_handle;
> +       __u32 retained; /* out, non-zero if BO can be used */
> +       __u32 madv;
> +       __u32 pad;

This seems to be based on panfrost/msm yet names (bo_handle vs
handle), layout and documentation varies.
Why is that - copy/paste is cheap :-P

HTH

-Emil
