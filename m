Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7F9493E09
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 17:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D9010E325;
	Wed, 19 Jan 2022 16:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5187510E2FA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 16:12:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so6457178wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 08:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IBNFO4yxXqNmzn3LqT1fqeVE0Vjj1TW/ZplMTx0IYeM=;
 b=MQr0BtryerQqcLEuI0DElKIG7cQxegSKc/WT1hPc451G5Yn8RbzK7WwDSXqpH7jRvP
 1/a0XuTWXJuGmQko7S+Kzs3k/SQjGUAfFdkyR+pmNCjcdPIK3tnS1lk5crJPWeaUn8I7
 rT3UnFiD3r5TfX7tqGKWkbHxiZ/qNc0Q4JP/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IBNFO4yxXqNmzn3LqT1fqeVE0Vjj1TW/ZplMTx0IYeM=;
 b=hnrmHEYKCZzXxAjZa1IiXp/IVZVR+EmPSK70EkVt1nFmDtv++P5nNCXHv4xIj3S070
 DhOlmtKxQvngztFkv9r66v5bf9lZ4W7EwBizJ9mWpD+FQM/UkCarLTcgkgUnLC/tR4o1
 3Y7iTlVLzej1CPaus/ffaw1KhEonfcKd42dJWKU2px1pKzMydrWFWlzRGvYBwmKAlnde
 FEaMOWjWOBH9c16XRca4kJ4sVn2zwvd2mWNc42iXHtAD6fPWCt87+0wpcPWrer1MVQWH
 MERls4GnTRLh/wfpgxDxbDPlnuc8MoB4CzTD3NS7mxD836XSWaOWL8kkJXexydITPqUP
 1ivg==
X-Gm-Message-State: AOAM53044dp1O1YO5stSCrgninYUyoeT24TkIG8hge9FcajZy/q+n/Id
 iMe5ox0ZRfAvpy5pKnbpMIDXQA==
X-Google-Smtp-Source: ABdhPJwBHCGP+vHdPD/q/Mbp64vMrk1/UObTxORaUhfXLkLFSfvOhE0vVBDtxcDkKyUcSdeEdz13Fg==
X-Received: by 2002:a05:600c:1d06:: with SMTP id
 l6mr4300906wms.174.1642608721894; 
 Wed, 19 Jan 2022 08:12:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j31sm27007wms.2.2022.01.19.08.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 08:12:01 -0800 (PST)
Date: Wed, 19 Jan 2022 17:11:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [RFC 00/10] drm: selftests: Convert to KUnit
Message-ID: <Yeg4Tx3VFlWVzohI@phenom.ffwll.local>
References: <20220117232259.180459-1-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220117232259.180459-1-michal.winiarski@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 linux-kselftest@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, Arkadiusz Hiler <arek@hiler.eu>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@riseup.net>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 12:22:49AM +0100, Michał Winiarski wrote:
> KUnit unifies the test structure and provides helper tools that simplify
> the development. Basic use case allows running tests as regular processes,
> leveraging User Mode Linux.
> For example, to execute all DRM unit tests:
> ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm
> (the tool also allows using QEMU instead of UML by adding e.g. --arch=x86_64)
> 
> For developers - it means that it's easier to run unit tests on the development
> machine, tightening the feedback loop. When using UML, it also simplifies using
> gdb for debug (since the kernel is just a regular process).
> For CI systems - DRM tests can be moved from being executed on device under
> test (that's also running IGTs and so on) to being executed on buildsystem
> during build (just like checkpatch.pl).
> 
> All tests were renamed - IGT prefix is no longer used.
> 
> Compared to selftests executed by CI using IGT, there's one functional
> regression - KUnit test runner is not catching WARNs.
> To solve this, we could either go in the similar direction that UBSAN went in:
> 1195505 ("kunit: ubsan integration")
> Or we could expand the test runner to catch WARN signature in dmesg.

I think catching WARN signature in dmesg makes sense, assuming Kunit has a
standard WARN format. It would be nice to be consistent here.

I haven't looked at any details, but yes so much I want to see this done.
I'll cc a bunch of people I've talked with about this conversion,
hopefully I got them all. Maybe they can help with review and getting this
all landed!

Cheers, Daniel

> Pastebin to preview the output and execution times:
> https://gitlab.freedesktop.org/-/snippets/4139
> 
> -Michał
> 
> Michał Winiarski (10):
>   drm: test-drm_cmdline_parser: Convert to KUnit
>   drm: test-drm_plane_helper: Convert to KUnit
>   drm: test-drm_format: Convert to KUnit
>   drm: test-drm_framebuffer: Convert to KUnit
>   drm: test-drm_damage_helper: Convert to KUnit
>   drm: test-drm_dp_mst_helper: Convert to KUnit
>   drm: test-drm_rect: Convert to KUnit
>   drm: test-drm_mm: Convert to KUnit
>   drm: selftests: Convert to KUnit
>   drm: test: Simplify testing on UML with kunit.py
> 
>  drivers/gpu/drm/.kunitconfig                  |    3 +
>  drivers/gpu/drm/Kconfig                       |   22 +-
>  drivers/gpu/drm/Makefile                      |    2 +-
>  drivers/gpu/drm/i915/Kconfig.debug            |    1 -
>  drivers/gpu/drm/selftests/Makefile            |    7 -
>  .../gpu/drm/selftests/drm_cmdline_selftests.h |   68 -
>  drivers/gpu/drm/selftests/drm_mm_selftests.h  |   28 -
>  .../gpu/drm/selftests/drm_modeset_selftests.h |   40 -
>  drivers/gpu/drm/selftests/drm_selftest.c      |  109 -
>  drivers/gpu/drm/selftests/drm_selftest.h      |   41 -
>  .../drm/selftests/test-drm_cmdline_parser.c   | 1141 --------
>  .../drm/selftests/test-drm_damage_helper.c    |  667 -----
>  .../drm/selftests/test-drm_dp_mst_helper.c    |  273 --
>  drivers/gpu/drm/selftests/test-drm_format.c   |  280 --
>  drivers/gpu/drm/selftests/test-drm_mm.c       | 2487 -----------------
>  .../drm/selftests/test-drm_modeset_common.c   |   32 -
>  .../drm/selftests/test-drm_modeset_common.h   |   52 -
>  .../gpu/drm/selftests/test-drm_plane_helper.c |  223 --
>  drivers/gpu/drm/selftests/test-drm_rect.c     |  223 --
>  drivers/gpu/drm/test/Makefile                 |    7 +
>  .../gpu/drm/test/test-drm_cmdline_parser.c    | 1027 +++++++
>  drivers/gpu/drm/test/test-drm_damage_helper.c |  667 +++++
>  drivers/gpu/drm/test/test-drm_dp_mst_helper.c |  429 +++
>  drivers/gpu/drm/test/test-drm_format.c        |  356 +++
>  .../test-drm_framebuffer.c                    |  109 +-
>  drivers/gpu/drm/test/test-drm_mm.c            | 2426 ++++++++++++++++
>  drivers/gpu/drm/test/test-drm_plane_helper.c  |  312 +++
>  drivers/gpu/drm/test/test-drm_rect.c          |  249 ++
>  drivers/video/Kconfig                         |    4 +
>  29 files changed, 5558 insertions(+), 5727 deletions(-)
>  create mode 100644 drivers/gpu/drm/.kunitconfig
>  delete mode 100644 drivers/gpu/drm/selftests/Makefile
>  delete mode 100644 drivers/gpu/drm/selftests/drm_cmdline_selftests.h
>  delete mode 100644 drivers/gpu/drm/selftests/drm_mm_selftests.h
>  delete mode 100644 drivers/gpu/drm/selftests/drm_modeset_selftests.h
>  delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.c
>  delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.h
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_damage_helper.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_format.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_mm.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.h
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_plane_helper.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_rect.c
>  create mode 100644 drivers/gpu/drm/test/Makefile
>  create mode 100644 drivers/gpu/drm/test/test-drm_cmdline_parser.c
>  create mode 100644 drivers/gpu/drm/test/test-drm_damage_helper.c
>  create mode 100644 drivers/gpu/drm/test/test-drm_dp_mst_helper.c
>  create mode 100644 drivers/gpu/drm/test/test-drm_format.c
>  rename drivers/gpu/drm/{selftests => test}/test-drm_framebuffer.c (91%)
>  create mode 100644 drivers/gpu/drm/test/test-drm_mm.c
>  create mode 100644 drivers/gpu/drm/test/test-drm_plane_helper.c
>  create mode 100644 drivers/gpu/drm/test/test-drm_rect.c
> 
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
