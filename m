Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0DF4D9B7F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B15A10E2A1;
	Tue, 15 Mar 2022 12:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6365910E2A1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:47:35 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id v2so6442890qtc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B7pEXwFzgo4rOox6nVDFmgxOXeOCcTVTTlTiwKE1qAQ=;
 b=AxLlzrZFFinx3v3qxcSJwG8kMMDCTJfPy3a238z9DU+++nlTT8+pv9T22v9CjOFgk/
 nRzcbWMhrqTTrxDXGG364svExwF4vANPV/0VH4H0bh8g2/lDL1iJo7fm2ZUEbzLICyh3
 Us6w9epVMrwVwDxq22P94dmbZtRRhL4Kz0dwGa2ChzZ2skWq4YyOFJzEimcpWT2mpB42
 /eLjmoDlK/7nRK6COKRe/x7eAZH5CHk9Uk6MVZZumeyZafQjFa6oNWzJDiG4JPQhre8q
 uWqEfO0TLPI5RMdyfaRxz3rCbG+gq/dcfiZZSVAmMLznCkZFUcOxmvn2KwgQvIU+2P1m
 LRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B7pEXwFzgo4rOox6nVDFmgxOXeOCcTVTTlTiwKE1qAQ=;
 b=baKgzvRqT6Arzs/gmtO+Tw5+dI5AxqmtQ5ZuRkOTJwyzxAMyoIhlrLn/exa5brTgrL
 GizGsbw5+D2jwogKOSlu0zwfWbPdSMSsmFvZpLSM8AyN4QFFUyigYeCHBAFrnNlsuzb5
 RGpHtlFScjkC/J2XCsFn4/pNdtHrMf7gahJogD4hR8NkkdeiMsEcWSBK2fyAuoGgeLEI
 u9pougbSxBxtm0BgytjQGZ1U4kZfefwEjm145Yx6mKx7srLdNKn47SU+QS2auo7T8PhV
 aOvYwLxa5o5L76crX90UgoKpHKhVeiDp0IwTuHAtuehjmkX1ombr7NcD1JJcw2Fk7abK
 WcrA==
X-Gm-Message-State: AOAM5336tnLdcqekMJGq5LZp3r8otNkCg/7XxALUMb8yx6poU9z/2n+a
 Zjah7Bi8t5v5TWeIbotcnTkhNDnHRA0I82l0tec=
X-Google-Smtp-Source: ABdhPJxoKSVtwYVfQbcSJEII0PVgKvOgzB/w3kHMi5aRoRnGhYo75quRtlNpytcbBPbJJCtdyRKPqLjju3VOFwaNqok=
X-Received: by 2002:a05:622a:134d:b0:2e1:ce33:5d2d with SMTP id
 w13-20020a05622a134d00b002e1ce335d2dmr8848701qtk.407.1647348454540; Tue, 15
 Mar 2022 05:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 15 Mar 2022 12:47:23 +0000
Message-ID: <CACvgo50Fxn6D1d2_20etnL1TWfNkzJFydyDgr6DwGKFoxzg0_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add memory shrinker to VirtIO-GPU DRM driver
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

On Mon, 14 Mar 2022 at 22:44, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:

> Dmitry Osipenko (8):
>   drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
>   drm/virtio: Check whether transferred 2D BO is shmem
>   drm/virtio: Unlock GEM reservations in error code path

These three are legitimate fixes that we want regardless of the shrinker.

Please add the respective "Fixes" tag, so they find their way in the
stable trees. With that, them 3 are:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

HTH
Emil
