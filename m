Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57417769CE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 22:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A5710E105;
	Wed,  9 Aug 2023 20:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A05B10E105
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 20:23:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 480E66487C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 20:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1425C433CB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691612593;
 bh=MQkMgXVK0Iv2CbRNe6q7avixv9soJv+sQGItjFys3LE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HqpuP1Y7qiTul4zAUT55W82D/f/AwZMc9wSRuzyxfb7y1BmhRAxTnJBtV8zySOzze
 +y50HFirdRM2ym5bCWn1KV0CC+1s+zxGC87rNTTG895b6tf5SvtLE6dRIQ75fAUYAW
 hiVpzBNfbUlyqAO3dAkMLsJPW3Y5KeuqHOZ0zOMQoOVulOvqvL9sPR2fCA1JXDN07b
 skpjaJRzvMvgf6pV4lQIBhYB+lR3emEBR5Qo/0d0Plc+/Q4XHXDWrcoVwJIJXSV+sY
 pkEtcbQFcCOZMShfsomZx9LeQ2FZcSySzMSeoTEW7XekDuPALHolRT+ewPAviBhsDd
 t62M367EWLnog==
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2b9c0391749so3873711fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 13:23:13 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz53pjrlCImQwNVLnyyrPo86jxEcnlLiKv3Z2ike+fnMYLsw2Sl
 aTghtv7T/Yy9qacISg2tIwEvgzLDnE+k44KnZg==
X-Google-Smtp-Source: AGHT+IHJ2Uagqotm5su+Wo4/3QQo2rkLk6CbSEr3QENYRaE2lK8VV/sgQ6Eoa68zLLMEssU8JaWqnCzosJN5lPh+3hw=
X-Received: by 2002:a2e:9842:0:b0:2b9:ec57:c330 with SMTP id
 e2-20020a2e9842000000b002b9ec57c330mr183459ljj.7.1691612591709; Wed, 09 Aug
 2023 13:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
In-Reply-To: <20230809165330.2451699-1-boris.brezillon@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 9 Aug 2023 14:22:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJgymu8r0ApXmYkwL2dk5o5KyZ8iG14t7th_heJY5uP+w@mail.gmail.com>
Message-ID: <CAL_JsqJgymu8r0ApXmYkwL2dk5o5KyZ8iG14t7th_heJY5uP+w@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] drm: Add a driver for FW-based Mali GPUs
To: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 9, 2023 at 10:53=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hello,
>
> This is the second version of the kernel driver meant to support new Mali
> GPUs which are delegating the scheduling to a firmware.
>
> The RFC has been dropped as the major blocking points have been addressed
> (request to use drm_sched, request to implement a VM_BIND-like ioctl,
> request to use drm_gpuva_mgr for the VM logic, lack of PM/devfreq support=
).
>
> This series is based on drm-misc-next and depends on some drm_sched [1]
> and iommu [2] changes.
>
> A branch containing all those dependencies is available here[3], and
> here [4] is another one containing all the patches needed to have
> a working GPU on rk3588 on top. The CSF firmware binary can be found
> here[5].
>
> The mesa branch used to test this new driver is available here [6].
> It's still under development and it's just a gallium driver right now,
> but we are working on that ;-).
>
> Here is a non-exaustive changelog, check each commit for a detailed
> changelog.
>
> v2:
> - Rename the driver (pancsf -> panthor)
> - Split the commit adding the driver to ease review
> - Use drm_sched for dependency tracking/job submission
> - Add a VM_BIND ioctl
> - Add the concept of exclusive VM for BOs that are only ever mapped to a
>   single VM
> - Document the code and uAPI
> - Add a DT binding doc
>
> I tried to Cc anyone that was involved in any development of the code
> I picked from panfrost, so they can acknowledge the GPL2 -> MIT+GPL2
> change. If I missed someone, please let me know.

Panfrost was largely based on etnaviv, vc4, v3d, and msm. Those are
all GPL2 (or 2+) only. How is relicensing that code okay? Also,
panfrost depends on drm_gem_shmem_helper.c (at least) which is GPL2.
Does that get re-implemented in a MIT licensed environment?

Maybe some drivers are enough of a silo to get away with MIT
licensing, but I wouldn't be comfortable claiming it.

Rob
