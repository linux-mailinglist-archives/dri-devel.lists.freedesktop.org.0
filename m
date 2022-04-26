Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ABE50F024
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 07:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6F6112421;
	Tue, 26 Apr 2022 05:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAD1112421
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 05:20:27 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id w124so7753054vsb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 22:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qmipgUUMUxm6hMiwU+RA9EjYQMfT2FPr6LOz5agz4nY=;
 b=YReamCBovqxWJMpctPfDpKZNrx1dmPy/xjCTi+m48IelAKatIYLGf3lCKhKQFPrsgZ
 AsDjGq/B7lC/s/JDzPp/2t3Id3Z4WppDo5cfo0N1xS9bcRDTjSMFMmregTw0QqtHUT5+
 QqTubU+P2H7VCCr/CXPw+q2O7r2G6RaT7rU8Rjww1FVngj29exEVbfRnwW9XMQisQ2fP
 T3So57d/E5ftsGh1/V159jPSYVkNlCk2m4hH1uj5zv+pazl5KzRgbryKHTc3uK5Q0gDV
 HCXHahhWEwRey/g5xxUpmiNIYc2g1oIAOmIcCcwnekFqEk0bOQaQNjzWmgIntpiCoe4/
 CtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qmipgUUMUxm6hMiwU+RA9EjYQMfT2FPr6LOz5agz4nY=;
 b=g4dCjO6fwlZBnNAVzMAc+fCecZcff1/7BR981vAYuC8PK8EOKrqrVGKmLUTe52Ep5u
 K3DuBJiJjcXHjMP+Tvkfu3QdcDN7KSg09hENwIhFcY9f17k6rdH9i4I+oHkvEWlpaIVF
 Kw2+Ax+N1jX/RjYfITP20cIM5EzesodGQoCKYQ8cAST0tAQGFC1bIQ/ndF0SRXgO/ZfR
 x9Jo346qpYVannDyBM4w/XE3grbe44jkLvMsw7wGDxETZMdujUmALQNyQUmWtzlexW5i
 3rEcK8WpYjtmlixboNL5eQxnSWHbaHNnh38OP5p4k9IJGf5lWEA1z6mnKWDGyXmplyG0
 nALg==
X-Gm-Message-State: AOAM530Qn1dt9wwMzcsXdcN1PmD+iEUNh0NBtWp1wZOx21VwjXxhIjjn
 rEDazIEvshmwf0w2dFW6IxQZYf3YAZ3VDTq68JM=
X-Google-Smtp-Source: ABdhPJwW7mSpFATTE7BSdK+yHISsvHvDyufD5OFhDBveJm9IFoOlVggyKp3WbRiXt2XfYMoessN1mzZ2tYzvpxGGMho=
X-Received: by 2002:a67:dd03:0:b0:32c:a569:4f17 with SMTP id
 y3-20020a67dd03000000b0032ca5694f17mr4129187vsj.86.1650950426553; Mon, 25 Apr
 2022 22:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
In-Reply-To: <20220419135908.39606-1-cai.huoqing@linux.dev>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 26 Apr 2022 06:20:14 +0100
Message-ID: <CALeDE9NJcruoVU1v0uG2GSJFoPbsob+YTzW94wG2+DbPiu2xKA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/nvdla: Add driver support for NVDLA
To: Cai Huoqing <cai.huoqing@linux.dev>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 3:08 PM Cai Huoqing <cai.huoqing@linux.dev> wrote:
>
> The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> which is integrated into NVIDIA Jetson AGX Xavier,
> so add driver support for this accelerator.
>
> NVDLA introduce:
> http://nvdla.org/primer.html
>
> User mode driver:
> https://github.com/caihuoq/nvdla/tree/main/sw/umd
>
>
> Cai Huoqing (2):
>   MAINTAINERS: Add the driver info of the NVDLA
>   drm/nvdla: Add driver support for NVDLA

Are there device tree bindings that are required to test this IP, are
there additions for the Xavier SoCs to test them? They should also be
published as patches as part of this series.

>  MAINTAINERS                             |    7 +
>  drivers/gpu/drm/Kconfig                 |    2 +
>  drivers/gpu/drm/Makefile                |    1 +
>  drivers/gpu/drm/nvdla/Kconfig           |    8 +
>  drivers/gpu/drm/nvdla/Makefile          |   19 +
>  drivers/gpu/drm/nvdla/nvdla_bdma.c      |  200 +
>  drivers/gpu/drm/nvdla/nvdla_cache.c     |  215 +
>  drivers/gpu/drm/nvdla/nvdla_cdp.c       |  300 ++
>  drivers/gpu/drm/nvdla/nvdla_common.c    |  295 ++
>  drivers/gpu/drm/nvdla/nvdla_common.h    |  835 +++
>  drivers/gpu/drm/nvdla/nvdla_conv.c      |  683 +++
>  drivers/gpu/drm/nvdla/nvdla_drm.c       |  695 +++
>  drivers/gpu/drm/nvdla/nvdla_drm.h       |  127 +
>  drivers/gpu/drm/nvdla/nvdla_engine.c    |  233 +
>  drivers/gpu/drm/nvdla/nvdla_engine.h    |  272 +
>  drivers/gpu/drm/nvdla/nvdla_gem.c       |  393 ++
>  drivers/gpu/drm/nvdla/nvdla_ioctl.h     |   99 +
>  drivers/gpu/drm/nvdla/nvdla_pdp.c       |  446 ++
>  drivers/gpu/drm/nvdla/nvdla_reg.h       | 6411 +++++++++++++++++++++++
>  drivers/gpu/drm/nvdla/nvdla_rubik.c     |  217 +
>  drivers/gpu/drm/nvdla/nvdla_sched.h     |   52 +
>  drivers/gpu/drm/nvdla/nvdla_scheduler.c | 1005 ++++
>  drivers/gpu/drm/nvdla/nvdla_sdp.c       |  728 +++
>  23 files changed, 13243 insertions(+)
>  create mode 100644 drivers/gpu/drm/nvdla/Kconfig
>  create mode 100644 drivers/gpu/drm/nvdla/Makefile
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_bdma.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_cache.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_cdp.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_conv.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_drm.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_drm.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_gem.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_ioctl.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_pdp.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_reg.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_rubik.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_sched.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_scheduler.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_sdp.c
>
> --
> 2.25.1
>
