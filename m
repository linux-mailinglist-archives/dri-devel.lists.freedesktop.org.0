Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC3696E87A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 05:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C9B10E96B;
	Fri,  6 Sep 2024 03:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SjVhECET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1D110E96B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 03:59:42 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e0875f1e9edso1683999276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 20:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1725595181; x=1726199981;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfVD/q7F+JKD3UzO/fT8ClWpD55SocqiF+c9R4xtWQs=;
 b=SjVhECETtCSLF4x1ZW0pQVDkDDN58FHW4V/zt76GmHtiYrhU23Pxm8lR/Cts86GEJK
 y95F+q4O+FVBlBVdCGjbglWmW4qTd9caYQzFlVchQkHwDl0k/Y0rP9WAk8EA9L55y7d9
 t6QkdUFGd6Op102sKD0pfaPoWpY2cyoVEmU3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725595181; x=1726199981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfVD/q7F+JKD3UzO/fT8ClWpD55SocqiF+c9R4xtWQs=;
 b=XwxRqfRL4lSv0FgOTJ+nSP8UVFQT9kU8Z5F6zeJRleOifygGhjawOsggUuhPLjR/fM
 b741pXv6kwbx2Ysd2VmCY1QhOoywSJn+VYuKA6asWSaf3E6C09FKy/kJGysSLyZB4PUB
 wXXynyPzkVonJ1xvEU0NrnxKhH/UaDRgis7h2SS4lHQ7J/EClEIcLTaqakOIY+j8mC0Z
 K7cCPuP0V416G4lAd1PFCVTWHzvKnDOL9Jy3HMBDzIEaQ/UMiBnrmdRADCIyVrym0hOM
 Ize5QoiUXl8cN9ncgQ/l+62sZP/bbIL0d92DLZbfp8h3F5hpNktNrtJYJK9nbfRCzIYn
 bRHw==
X-Gm-Message-State: AOJu0YwaRQsGTrHz1+MgGrCxGbew1CXjuxK6c94TPw12n2uVekJe/phI
 BYKx3m6t0Z4V1QuyDd8aiSXxx6o6bjfALERD2A/7JtMd1JCY7XE37P/tdUACZbkY1Z3esiHsxwV
 +OkW7HROBLErFO7SXiA1h5njZ2MKpG3xaFRyL
X-Google-Smtp-Source: AGHT+IFZ8oHj14O1FJPL2aY2PpSu/7WZ5BiNlwxJ/Edd7cT4nbZFdKUXLcHEF1G8rRl+GUj643T25EuSl+B1QHAmpMo=
X-Received: by 2002:a05:6902:18d5:b0:e1d:15c5:b4bb with SMTP id
 3f1490d57ef6-e1d34a247fbmr1481215276.48.1725595181484; Thu, 05 Sep 2024
 20:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240905181710.154732-1-ian.forbes@broadcom.com>
In-Reply-To: <20240905181710.154732-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 5 Sep 2024 23:59:30 -0400
Message-ID: <CABQX2QMvg-A9tnwwm1O3s5bhhd_w5==YqtLM5Jrk8psniAsKvA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Add tracepoints
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 5, 2024 at 2:17=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com>=
 wrote:
>
> Adds the necessary files to create tracepoints for the vmwgfx driver.
>
> Adds a single tracepoint for command buffer completion. This tracepoint
> can be used to time command buffer execution time and to decode command
> buffer errors. The submission time is also now recorded when the command
> buffer is submitted to hardware.
>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/Makefile        |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c |  9 +++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_trace.c  | 32 +++++++++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_trace.h  | 62 ++++++++++++++++++++++++++
>  4 files changed, 102 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_trace.c
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_trace.h
>
> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Mak=
efile
> index 46a4ab688a7f..482c1935bde6 100644
> --- a/drivers/gpu/drm/vmwgfx/Makefile
> +++ b/drivers/gpu/drm/vmwgfx/Makefile
> @@ -10,6 +10,6 @@ vmwgfx-y :=3D vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.=
o vmwgfx_drv.o \
>             vmwgfx_simple_resource.o vmwgfx_va.o vmwgfx_blit.o \
>             vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o=
 \
>             vmwgfx_devcaps.o ttm_object.o vmwgfx_system_manager.o \
> -           vmwgfx_gem.o vmwgfx_vkms.o
> +           vmwgfx_gem.o vmwgfx_vkms.o vmwgfx_trace.o
>
>  obj-$(CONFIG_DRM_VMWGFX) :=3D vmwgfx.o
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmw=
gfx/vmwgfx_cmdbuf.c
> index 94e8982f5616..1ac7f382cdb1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
> @@ -27,6 +27,7 @@
>
>  #include "vmwgfx_bo.h"
>  #include "vmwgfx_drv.h"
> +#include "vmwgfx_trace.h"
>
>  #include <drm/ttm/ttm_bo.h>
>
> @@ -141,6 +142,7 @@ struct vmw_cmdbuf_man {
>   * @man: The command buffer manager.
>   * @cb_header: Device command buffer header, allocated from a DMA pool.
>   * @cb_context: The device command buffer context.
> + * @inline_space: Whether inline command buffer space is used.
>   * @list: List head for attaching to the manager lists.
>   * @node: The range manager node.
>   * @handle: The DMA address of @cb_header. Handed to the device on comma=
nd
> @@ -148,19 +150,20 @@ struct vmw_cmdbuf_man {
>   * @cmd: Pointer to the command buffer space of this buffer.
>   * @size: Size of the command buffer space of this buffer.
>   * @reserved: Reserved space of this buffer.
> - * @inline_space: Whether inline command buffer space is used.
> + * @submit_time: When the CB was submitted to hardware in jiffies.

In general it looks good but what's the reason for the submit_time?

z
