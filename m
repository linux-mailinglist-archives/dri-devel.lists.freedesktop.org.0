Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C04C3BA9FA
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 20:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED6589B48;
	Sat,  3 Jul 2021 18:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979C689B42;
 Sat,  3 Jul 2021 18:22:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v5so16653821wrt.3;
 Sat, 03 Jul 2021 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xB2P4tf2ZnREI1OThuK+uDcZdI5i8XE4aLNhKgcZeXQ=;
 b=gHFzYWzfyhEza4GLHis81G5QxNeU0PQUL7vO4Zc/BkHi4DXFsGXSxb+cDZa/0btK2G
 p1wExGiWY/WhIAxd5h/iQbyin+7dJzwDDbP8cXrOqKZGEHPshVQRq9kVEmi+2wtTlCki
 quJFPI6HX8Oij+CN2tKuoXEiCTF7P3EhmMWrPyzdC5/Ti1hP5N/GiC/SToGYILYfPTRo
 vLaMIFSoE6JKTH1RoOOmrVMsg0nTzGBgA1e2ANlRUxLLgg3W0NpmPkVL1qvo5qc97U7F
 XxPekd46d2lV8hCS3gxSlYfkTSHOnDBfiJPtfO//9gJhJGAJg1mUxBkioP7h5qVVWco6
 TYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xB2P4tf2ZnREI1OThuK+uDcZdI5i8XE4aLNhKgcZeXQ=;
 b=mKD4/vugTI7ag6ey8vILN9yxoST9sRwO186nA9clEenxuivPTwnfVDVNB/ovHdl6Ks
 oau6p9xP03WMVGmC1NVd9AgXycNhl0dPB778FqkIkvHZrHuwSxLzf701ZNUw7mmsUHdE
 QFFmShPomeDD5ky1rhXxNQ33KvIoq7vavBMlw8cBCgMCqZMrlKPie0u38UBCQDlluRYl
 MXQQN/1nr0ZumLbBqKAAJ1kFzfLBFBIl9sXd2/1jqwPGTiVvLOS+u6cF0oQie8lBOU6N
 sDn66Xl6DUslIbSE5NVVP8IshF2Lv5goZ0E2oyLpN5aWXBIeZlSEUktbxalfj7rHNMqJ
 DIqQ==
X-Gm-Message-State: AOAM532FwWR8O6ZfPlSZbqcO2EFYDSD6JCCd1H+K1pqxJBZRwL5qI9fc
 lVGnhIAm+iICvR1OY4KY5gJcvgwdHRas8dtYpIQ=
X-Google-Smtp-Source: ABdhPJxC5BxID5OlR6PtE6kMNgXsqNv2B4grb90ehKfdlYRt5kItejvy6CCRRR/aD/dDxY4dfmgfatoC7VoJvXbSkTY=
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr6354866wrt.132.1625336577239; 
 Sat, 03 Jul 2021 11:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <1625311962-14185-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1625311962-14185-1-git-send-email-kalyan_t@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 3 Jul 2021 11:26:59 -0700
Message-ID: <CAF6AEGs6ochnO=CdOk8U9ZFSecv8JSiA=L9es_rcFReJ3Sz7dQ@mail.gmail.com>
Subject: Re: [RFC] Inline rotation support in dpu driver
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 3, 2021 at 4:32 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> This change adds support for inline rotation in the dpu driver.
> When inline rotation is enabled the VIG pipes will directly fetch the image
> from memory in a rotated fashion
>
> Inline rotation has following restrictions
> 1) Supported only with compressed formats
> 2) max pre rotated height is 1088
> 3) restrictions with downscaling ratio
>
> Queries:
>
> 1) Since inline rotation works for fewer pixel formats with specific modifier, how can we provide this information to the compositor so that
> chrome compositor can choose between overlaying or falling back to GPU. In the patch it fails in the atomic check.
>
> 2) If a display composition fails in atomic check due to any of the restrictions in overlays
> can chrome compositor switch it back to the GPU and re trigger the commit ?

The correct way to provide this information to userspace is for the
atomic test step to fail.  Admittedly the CrOS compositor makes some
invalid assumptions that if a given state was valid in the past, it
will be valid in the future.  But I don't see height/format/downscale
restrictions as a thing that would change from frame to frame.

BR,
-R

> posting it as RFC as validation is not complete, please share early comments on this.
>
> Kalyan Thota (1):
>   drm/msm/disp/dpu1: add support for inline rotation in dpu driver
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 47 +++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 20 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 93 ++++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  2 +
>  4 files changed, 128 insertions(+), 34 deletions(-)
>
> --
> 2.7.4
>
