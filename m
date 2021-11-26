Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA0445EBB7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 11:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364236E93D;
	Fri, 26 Nov 2021 10:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E53C6E933;
 Fri, 26 Nov 2021 10:35:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 137so7721388wma.1;
 Fri, 26 Nov 2021 02:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=yWMPT9gdUeJoBqjhtlnpMwe+xCg6/aY12TZNureZlQE=;
 b=L48KoTYS5dIsStjP372ocwxx4k9uRC254TXTt1fOJQ5//81huyKei+Nj8mR151LGf+
 R47EetCPNsMiITtcbHWZOvdKSF+S/G52/WuBpgGsCQjhFwJ9M1Sdwj3WGXDdy9VTaVtE
 PTzKc8ODKvUoDRAY85zp5hglbHlyEREbCufIL2F2d8t/8cY2m2VbaFKMP/BRZtY+8YsM
 Pco0tFDLXebwJ+TFow3kbHNTCIcmwfPzKExDc9EwuL0BJieyoKt968AfJcVypZ0M2K9J
 ruUoqVEe5DwFeNtgPlQQcla35vQWaIEckkwA4GQr0KlP+UjAD+dDq42qnskioajlCUBq
 Vonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yWMPT9gdUeJoBqjhtlnpMwe+xCg6/aY12TZNureZlQE=;
 b=x54OuADmC5Dol3266ZCwPzlmJaE/gLZVDMgI/HMEfzAH30ilMuM7pI/UZYZwF+VAup
 pjY3jGBIdz4S35vRXcUlaG0OadOVWWowY7ZXlV5S94ocAteaI8njvKsrIKtd/PZ0luuh
 O6Jnddy/IxEDcgnbParmR9X4qB9RapCENW7DKzKUicK286Z2VyiVYBSwV5T3tErzXUbK
 VDgpnx1g/qylXFrfwOKY+al0RQBTPH5Trvc0N57dz58kb+ATfy0mUfBhz+G5XlOyrRNS
 1pSoDqO5cR1moZ3v+xjrrQOp4ulk7anOcsD/RDT521opTGZJkDM2+66QEy8kFkf+oMQc
 JN5Q==
X-Gm-Message-State: AOAM5316uSvvhofyYR6p7dNURy68UqMwWlvrv47GgnA0+jYcVRqDBD9H
 VAwLD6MQlh16UMc09bXsUu0=
X-Google-Smtp-Source: ABdhPJwc/9KgeEHWhy3ewx0imoHrOYefqaEGmG78xusEOMnYDmxuHMddMUdx/gAnsSyZ3YzPxFxo+w==
X-Received: by 2002:a05:600c:1d06:: with SMTP id
 l6mr14084629wms.97.1637922905985; 
 Fri, 26 Nov 2021 02:35:05 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:108:c3ea:37df:ad4c?
 ([2a02:908:1252:fb60:108:c3ea:37df:ad4c])
 by smtp.gmail.com with ESMTPSA id e7sm6986597wrg.31.2021.11.26.02.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 02:35:05 -0800 (PST)
Subject: Re: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Simon Ser <contact@emersion.fr>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
 <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <aa16c8ca-1126-0f6f-c201-362a2abc2341@gmail.com>
Date: Fri, 26 Nov 2021 11:35:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a general comment. Could you name the new subdirectory "amdgpu" 
instead?

DC is just a component of the amdgpu driver and I think it would sooner 
or later make sense to group together the amdgpu documentation in one 
folder.

Regards,
Christian.

Am 25.11.21 um 16:38 schrieb Rodrigo Siqueira:
> Display core documentation is not well organized, and it is hard to find
> information due to the lack of sections. This commit reorganizes the
> documentation layout, and it is preparation work for future changes.
>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
>   .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |  4 +
>   Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     | 29 ++++++++
>   Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     | 42 +++++++++++
>   Documentation/gpu/drivers.rst                 |  2 +-
>   5 files changed, 76 insertions(+), 75 deletions(-)
>   delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
>
> diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
> deleted file mode 100644
> index f7ff7e1309de..000000000000
> --- a/Documentation/gpu/amdgpu-dc.rst
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -===================================
> -drm/amd/display - Display Core (DC)
> -===================================
> -
> -*placeholder - general description of supported platforms, what dc is, etc.*
> -
> -Because it is partially shared with other operating systems, the Display Core
> -Driver is divided in two pieces.
> -
> -1. **Display Core (DC)** contains the OS-agnostic components. Things like
> -   hardware programming and resource management are handled here.
> -2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
> -   amdgpu base driver and DRM are implemented here.
> -
> -It doesn't help that the entire package is frequently referred to as DC. But
> -with the context in mind, it should be clear.
> -
> -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
> -supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
> -Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
> -
> -To determine if DC is loaded, search dmesg for the following entry:
> -
> -``Display Core initialized with <version number here>``
> -
> -AMDgpu Display Manager
> -======================
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :doc: overview
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> -   :internal:
> -
> -Lifecycle
> ----------
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :doc: DM Lifecycle
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :functions: dm_hw_init dm_hw_fini
> -
> -Interrupts
> -----------
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> -   :doc: overview
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> -   :internal:
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
> -
> -Atomic Implementation
> ----------------------
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :doc: atomic
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
> -
> -Display Core
> -============
> -
> -**WIP**
> -
> -FreeSync Video
> ---------------
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :doc: FreeSync Video
> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> new file mode 100644
> index 000000000000..bbb8c3fc8eee
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> @@ -0,0 +1,4 @@
> +Display Core Debug tools
> +========================
> +
> +TODO
> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> new file mode 100644
> index 000000000000..3685b3b1ad64
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> @@ -0,0 +1,29 @@
> +===================================
> +drm/amd/display - Display Core (DC)
> +===================================
> +
> +*placeholder - general description of supported platforms, what dc is, etc.*
> +
> +Because it is partially shared with other operating systems, the Display Core
> +Driver is divided in two pieces.
> +
> +1. **Display Core (DC)** contains the OS-agnostic components. Things like
> +   hardware programming and resource management are handled here.
> +2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
> +   amdgpu base driver and DRM are implemented here.
> +
> +It doesn't help that the entire package is frequently referred to as DC. But
> +with the context in mind, it should be clear.
> +
> +When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
> +supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
> +Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
> +
> +To determine if DC is loaded, search dmesg for the following entry:
> +
> +.. toctree::
> +
> +   amdgpu-dm.rst
> +   amdgpu-dc-debug.rst
> +
> +``Display Core initialized with <version number here>``
> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
> new file mode 100644
> index 000000000000..7ce31f89d9a0
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
> @@ -0,0 +1,42 @@
> +======================
> +AMDgpu Display Manager
> +======================
> +
> +.. contents:: Table of Contents
> +    :depth: 3
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :doc: overview
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +   :internal:
> +
> +Lifecycle
> +=========
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :doc: DM Lifecycle
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :functions: dm_hw_init dm_hw_fini
> +
> +Interrupts
> +==========
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> +   :doc: overview
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
> +
> +Atomic Implementation
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :doc: atomic
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
> diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
> index b4a0ed3ca961..dffe52d837cd 100644
> --- a/Documentation/gpu/drivers.rst
> +++ b/Documentation/gpu/drivers.rst
> @@ -5,7 +5,7 @@ GPU Driver Documentation
>   .. toctree::
>   
>      amdgpu
> -   amdgpu-dc
> +   amdgpu-dc/amdgpu-dc
>      i915
>      mcde
>      meson

