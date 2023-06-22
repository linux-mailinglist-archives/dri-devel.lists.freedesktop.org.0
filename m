Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065173A811
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 20:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C1810E048;
	Thu, 22 Jun 2023 18:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E805B10E048
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 18:19:16 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a04e5baffcso1473939b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687457955; x=1690049955; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=2eCSU8eCreQMQARaqFK0Z7W8VecyujL3iJIi084r8bk=;
 b=hJ2zkmtwhWO4g6OT6PCjZBUnY/2he9q5drY/j/hU4kEwc0SEnsoJHwTW8w45eM3b4w
 RN+PcJ/CqcpXve69GuN6LRpJXwbStZICZdvtuz9ODFbTBwVrIi4df9d37SnQbadciOVX
 PUWTPjiEemuj1TK613lA+nTvPw7a9KxaI1DpKzSwG53ZJ6cICspUvwoP2+qVvLhzdJBO
 XvSD2WpkIhuOezesW//T48I3MF5cbE7ICNuM9mESqaUSO6Sb1IIqLdz128uSW8oE6emF
 WFbEZsha4ORo5ZYpAK507l77w6vQFM/JTqFd6iyy9X378usl35oJycAQ0wWSu9U37mM8
 J7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687457955; x=1690049955;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2eCSU8eCreQMQARaqFK0Z7W8VecyujL3iJIi084r8bk=;
 b=UF02QQEt3bWV240nM3HBa9Ps+Hrv4PLZEzxdcgCLZrX5IqshygQ82GU2ftU7n1rO54
 BxEys2rpSnYiIraWLiJYs1+L5gnqwghuSam74ZzFPwTs+WhelSYzbmRdIQDNDvPyTI5n
 EFdRZfvHGSGckPTuAca0bJ7V3ZhQon8yqEeJBvZokvmE2dmedxjY9ljb3mKieeh6eKh0
 gNy+esqblEeIiAg9FE0+svD9omvxN019laZOIIyV/hkGxGv30y4E/ueR990B7AH4d/IP
 vLE9aSDqKpzRbtrefErbkFfvriC2iMtBBIeV5eC+o12kDelXANzQ8iQ+N6qMlRzFZoMP
 uUAw==
X-Gm-Message-State: AC+VfDw32C2aSILXA3AmowpuPOsPPU3L4ABpi4T94E6Ao35tqLF6BMGs
 NpQAqlaBfSTAUxdlt8iILnZfuR7BV2x8Nvz3W2JBbw==
X-Google-Smtp-Source: ACHHUZ7EBnnb4fJReoZIx5GFM1PIx+0BLy2Aj/TnlqNdQHm7hdf+kUGwMO2gLRRcnjXYslyeHFqv0w==
X-Received: by 2002:a05:6808:8e8:b0:39e:dc23:d835 with SMTP id
 d8-20020a05680808e800b0039edc23d835mr13371412oic.48.1687457955221; 
 Thu, 22 Jun 2023 11:19:15 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 h8-20020a63df48000000b00548fb73874asm5184584pgj.37.2023.06.22.11.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 11:19:14 -0700 (PDT)
Date: Thu, 22 Jun 2023 11:19:14 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 11:18:34 PDT (-0700)
Subject: Re: [PATCH 0/9] Add DRM driver for StarFive SoC JH7110
In-Reply-To: <20230602074043.33872-1-keith.zhao@starfivetech.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: keith.zhao@starfivetech.com
Message-ID: <mhng-17a80922-c7a0-4717-adfa-0959d3dfab77@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kernel@esmil.dk, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sumit.semwal@linaro.org, shengyang.chen@starfivetech.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 aou@eecs.berkeley.edu, mripard@kernel.org, jagan@edgeble.ai,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, macromorgan@hotmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, keith.zhao@starfivetech.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 tzimmermann@suse.de, shawnguo@kernel.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 02 Jun 2023 00:40:34 PDT (-0700), keith.zhao@starfivetech.com wrote:
> Hi,
>
> This series is a DRM driver for StarFive SoC JH7110, which includes a
> display controller driver for Verisilicon DC8200 and an HMDI driver.
>
> We use GEM framework for buffer management and allocate memory by
> using DMA APIs.
>
> The JH7110 display subsystem includes a display controller Verisilicon
> DC8200 and an HDMI transmitter. The HDMI TX IP is designed for transmitting
> video and audio data from DC8200 to a display device. The HDMI TX IP
> consists of  the digital controller and the physical layer.
>
> This series does not support HDMI audio driver.
>
> Keith Zhao (9):
>   dt-bindings: display: Add yamls for JH7110 display subsystem
>   riscv: dts: starfive: jh7110: add dc&hdmi controller node
>   drm/verisilicon: Add basic drm driver
>   drm/verisilicon: Add gem driver for JH7110 SoC
>   drm/verisilicon: Add mode config funcs
>   drm/verisilicon: Add drm crtc funcs
>   drm/verisilicon: Add drm plane funcs
>   drm/verisilicon: Add verisilicon dc controller driver
>   drm/verisilicon: Add starfive hdmi driver
>
>  .../display/verisilicon/starfive-hdmi.yaml    |   93 +
>  .../display/verisilicon/verisilicon-dc.yaml   |  110 +
>  .../display/verisilicon/verisilicon-drm.yaml  |   42 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  MAINTAINERS                                   |    9 +
>  .../jh7110-starfive-visionfive-2.dtsi         |   87 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |   46 +
>  drivers/gpu/drm/Kconfig                       |    2 +
>  drivers/gpu/drm/Makefile                      |    1 +
>  drivers/gpu/drm/verisilicon/Kconfig           |   24 +
>  drivers/gpu/drm/verisilicon/Makefile          |   13 +
>  drivers/gpu/drm/verisilicon/starfive_hdmi.c   |  928 ++++++++
>  drivers/gpu/drm/verisilicon/starfive_hdmi.h   |  296 +++
>  drivers/gpu/drm/verisilicon/vs_crtc.c         |  388 ++++
>  drivers/gpu/drm/verisilicon/vs_crtc.h         |   74 +
>  drivers/gpu/drm/verisilicon/vs_dc.c           | 1040 +++++++++
>  drivers/gpu/drm/verisilicon/vs_dc.h           |   62 +
>  drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 2008 +++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  496 ++++
>  drivers/gpu/drm/verisilicon/vs_drv.c          |  301 +++
>  drivers/gpu/drm/verisilicon/vs_drv.h          |   52 +
>  drivers/gpu/drm/verisilicon/vs_fb.c           |  181 ++
>  drivers/gpu/drm/verisilicon/vs_fb.h           |   15 +
>  drivers/gpu/drm/verisilicon/vs_gem.c          |  372 +++
>  drivers/gpu/drm/verisilicon/vs_gem.h          |   72 +
>  drivers/gpu/drm/verisilicon/vs_plane.c        |  440 ++++
>  drivers/gpu/drm/verisilicon/vs_plane.h        |   74 +
>  drivers/gpu/drm/verisilicon/vs_type.h         |   72 +
>  include/uapi/drm/drm_fourcc.h                 |   83 +
>  include/uapi/drm/vs_drm.h                     |   50 +
>  30 files changed, 7433 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon/starfive-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon/verisilicon-dc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon/verisilicon-drm.yaml
>  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
>  create mode 100644 include/uapi/drm/vs_drm.h

This popped up in the RISC-V patchwork, so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

in case anyone was looking for one -- I definately don't know anything 
about DRM, though, so not sure that means much...
