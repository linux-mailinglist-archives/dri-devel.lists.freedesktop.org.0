Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 276E159196C
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 10:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14247113C56;
	Sat, 13 Aug 2022 08:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9B2B4B41
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 14:01:50 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id e205so1411635ybb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+SFgv9h1iU3RaW1EzL8Sx1GBNpviMfrfYSjOlKJNalY=;
 b=GexBwlzNcUg/qU5qiIjT+qVLabhItlMZab8kXhbIgYg/s9YqOoVrhlLXym1XIzz6Px
 Rk/RcoIczEJHjJ97VO0fTIPsq3HYyPVaW/JUIMNQ3cN5X/KmTDLGFCtxREsLBL1kWy5k
 GUARJmL+g5kLqA7tIYXDo9XtXSX4f+3BJX1JbJdmAck4z/iUxKOTWqtTOr5UiBmmNL0s
 NVZsUn5yWc2PEnvIy9Yqpg2lQDkclvsn72rdBGNwa7cy9OVzMz5JtbAwcV386nrB9Ufe
 QkAw64GzOwXZeuGlRILLthaFnMXQ1T8n8RRiuSz8NZzbZR/OM0XraZCMKwZT/Yzcz/01
 k7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+SFgv9h1iU3RaW1EzL8Sx1GBNpviMfrfYSjOlKJNalY=;
 b=GEjrvUIoEh0TpDSSI7LCdbBFWuxLBbsN8J8F/rxX2Fz1sBCe+cw69l+EZpFVyTDZzr
 uE27eYEyag9ZY70pDI+ZFrh8X60G3WngWHNn0Mbt9tPmHVZ29o5qOmz03t3S3/cc1exH
 gwYUQBv4mx2albAC058e3I9SDyaaLGI0MhH2gSbgMwG+BxOjCYgvndrcHXTcB46dYgRg
 ZfahgeCInt9BSDIOzDRM1YlWlN6VIB9l7ZDwGYlX3ymzItOXzKz/hlgHVkNNiSlfJ4DB
 GmwSv3ojHFbcKycve81D08HK1+bPvyVkLUOWffybtkdYl+45p0hCm8j2zmsFFopRd/p0
 xciA==
X-Gm-Message-State: ACgBeo2CDvqrXkWDNmf3bUoJGCLEUMCfIh3W8/YAp6WboAHwphx76P0P
 c2Q+870MVGdo8bhkPIpze6F2dn0x7zWvMCpmohSKZA==
X-Google-Smtp-Source: AA6agR6wQfVo93oLxu/F6/VJXBQ5LP7rYTWu4LmoAHDNLeE2RTl1HyOisioe9Yvs8j7bCHes1v8fGpO512CYJNhfzF0=
X-Received: by 2002:a05:6902:124b:b0:67b:5d4e:c98d with SMTP id
 t11-20020a056902124b00b0067b5d4ec98dmr3734245ybu.475.1660312909389; Fri, 12
 Aug 2022 07:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220811135637.6332-1-olivier.masse@nxp.com>
In-Reply-To: <20220811135637.6332-1-olivier.masse@nxp.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 12 Aug 2022 19:31:38 +0530
Message-ID: <CAFA6WYN6TdTR+O7UXe3D=5-5gRt5h7VhFYpGtyGGge-k3e_ShA@mail.gmail.com>
Subject: Re: [PATCH 0/1] tee: Add tee_shm_register_fd
To: Olivier Masse <olivier.masse@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 13 Aug 2022 08:23:14 +0000
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
Cc: clement.faure@nxp.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jens.wiklander@linaro.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Olivier,

On Thu, 11 Aug 2022 at 19:26, Olivier Masse <olivier.masse@nxp.com> wrote:
>
> Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
> shared memory from a dmabuf file descriptor.
>

IIRC, here you are trying to fill the gap for OP-TEE SDP use-case. But
the use-case should be described here, its current status with OP-TEE
upstream and which platform you have tested this interface with?

-Sumit

> Etienne Carriere (1):
>   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
>
>  drivers/tee/tee_core.c   | 38 +++++++++++++++
>  drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
>  include/linux/tee_drv.h  | 11 +++++
>  include/uapi/linux/tee.h | 29 ++++++++++++
>  4 files changed, 175 insertions(+), 2 deletions(-)
>
> --
> 2.25.0
>
