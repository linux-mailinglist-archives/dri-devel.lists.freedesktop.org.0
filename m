Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89743144498
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 19:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939E36EE3F;
	Tue, 21 Jan 2020 18:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7016EE3A;
 Tue, 21 Jan 2020 18:51:20 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id d17so1218404vke.5;
 Tue, 21 Jan 2020 10:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vzm7KiAuxIHFWHMUsQurGmpJebv1EAQ0i/6tG7hqwWM=;
 b=rdTZP8tcjc/E6aNmaI3Zsqu+dnBKnwTtuWLQDsOj0i11vnfT2mTt5BLL+znSLBGAOl
 3Rr0qNIhFCSXXUdsjNvb0Pi/w05q9T1djt1LbBMzhtFsHm4mYkByskPMaJIUx8aK3zKF
 BZLaLzv0SK/7Zf370h3Tom07L9XQpYwr9KD+fPnDh38YgcPuUMiiRtze16Y/4at+bavr
 W2zDC5ZBGYQE1VwYIcs/otQdrXPl1o3dIR2jNDprN4+5QrAkdUe5ZuzYiXgMzGSBsr24
 QD4zlIrNG6IYYFJ/2TboRm70vdOpQWnFlANBR8SQnt+zp+ShrB5WySYnaYFPnQoZ+26l
 FsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vzm7KiAuxIHFWHMUsQurGmpJebv1EAQ0i/6tG7hqwWM=;
 b=deEOnurzhuxERrt3jRl3tlUeUOPopQFK6l6N9XPRRc9ipGNKiT0TYeXnZ4eimczVR+
 84nK+LA4SlBoHjd428+pUmhQYtfbuXPjzDSQh1IumTzCaGvQMnHDDIitr9vH0abc3A6y
 Tr31CTStHpuG7mzQu3ttt3WgFhJcyPcqUlmHR58B6TVxiw5s6byfiiZbg8K34wDjk1s8
 Fo0WZ8N4xvxQJ7AyDVAOXPABO7UjHjJBjxQUmgAj2BbCAVHSxaA1j+Yl7QZUxYvSZQyl
 +X8osGRVGUxazM7+oVmXZCcKy30LFreX9VLkJM4X7jSMq6h6jhRxKP57Fm7QftmikfzK
 tInA==
X-Gm-Message-State: APjAAAUjukBYSZ5MS40Q0MSfOTsz/VO5+dZyRdMTw/QaHD0ooWSSuhNR
 T/6Qle3Qc2+ugBRAG9Ba0nSOBxrDXwNc+tcpSzc=
X-Google-Smtp-Source: APXvYqxt079HsP7qRa2kr1LZM45f8785ghu9w3nE5UnA2p+ILaaqgJVSB33n+p70rTN9/3uOsig9Qjo2deJEvNnRKYc=
X-Received: by 2002:ac5:c291:: with SMTP id h17mr2942212vkk.22.1579632679383; 
 Tue, 21 Jan 2020 10:51:19 -0800 (PST)
MIME-Version: 1.0
References: <20200120164343.2262-1-imre.deak@intel.com>
In-Reply-To: <20200120164343.2262-1-imre.deak@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 21 Jan 2020 18:52:03 +0000
Message-ID: <CACvgo53pH+=wN=PpkqQNH9NYspjDKu_=z7739Af+GPFQ6W7_=Q@mail.gmail.com>
Subject: Re: [PATCH libdrm] intel: drm_intel_bo_gem_create_from_* on platforms
 w/o HW tiling
To: Imre Deak <imre.deak@intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jan 2020 at 16:43, Imre Deak <imre.deak@intel.com> wrote:
>
> Platforms without a HW detiler doesn't support the get_tiling IOCTL.
> Fix the drm_intel_bo_gem_create_from_* functions assuming the default
> no-tiling, no-swizzling setting for the GEM buffer in this case.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Seems like it this can happen only in vgpu cases.... which explains
why it was not raised earlier. Regardless:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

Aside: might want to do similar patch for mesa. Be that for
classic/i965, gallium/iris and/or the Vulkan ANV driver.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
