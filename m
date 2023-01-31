Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B24C683756
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 21:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED3110E040;
	Tue, 31 Jan 2023 20:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BA110E040
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 20:16:36 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id 78so10910319pgb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 12:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Am8Z7TkpcdDZ8GRL/LneNulRFJmC6a0UjMBT8TzAGTs=;
 b=QUkF0DxBy7WyhNMn/+Y1eVegdNj5n1Tnfaz8RfohJjBMATVcZGLq5ny6pD0J34rQyz
 2JMuMo5/iIyVd2LyWi1mzQlHa/25nypMNvJWXwVEB6GuhVS85sorsXsTce6WINHZotMR
 6y7sQvZh5KPrExjuTY0E+hpZmwXGMBjF1XBE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Am8Z7TkpcdDZ8GRL/LneNulRFJmC6a0UjMBT8TzAGTs=;
 b=wr4Q4oiN8wAYz3QGMeuIW4qUMQx5lXDU6IODGLR9Fvk11ezuyxEYnD/IH+f7pidMOV
 VTxMeR+Q4/g5M3uZMijNpIW21Nb6Emwh6ziy3OJr79sxk2opO2X1DEC/d29rw0zB0syR
 hlg45LZdj0oXsj3MG2J2JJTZDXbNN/eJ+NUS1ylau85iR/PxpTdjruGMT2HHplFIXUxR
 DDSVieLGxA/MGpyqthjW0+n5LjgZ2n0X2I0NbqQxyRhNuiX2F0uGgSiolBGdN2dy4mKQ
 VA5Hi1xd2aNdEI1U3je3bebEyyDwlPf6nOBgra9MwM4LQLSOg+pMo1Ku86PFOYGA0ZJu
 +bcQ==
X-Gm-Message-State: AO0yUKUDQ/XjTSMXkTC7mS+Gd46ZroaddiL3uUPsvfLE8h+RhOkXYpcy
 6P+VNKG2yVaDJ6NwDPwylGFObMzCB4/XhmqRNDeTW/fpvcE/DozZ
X-Google-Smtp-Source: AK7set9OkhSjU8TN/f2hRWvQ1VR0Q5ugDNILjcngdVc7Yrkmts/q3dd2kbN9jc8WcSWKxReo+7fq26qAIePDkXB5LuQ=
X-Received: by 2002:a63:5418:0:b0:4d7:fc60:7ec1 with SMTP id
 i24-20020a635418000000b004d7fc607ec1mr3440901pgb.106.1675196195971; Tue, 31
 Jan 2023 12:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20230131200842.341272-1-greenjustin@chromium.org>
In-Reply-To: <20230131200842.341272-1-greenjustin@chromium.org>
From: Justin Green <greenjustin@chromium.org>
Date: Tue, 31 Jan 2023 15:16:25 -0500
Message-ID: <CAHC42RfBvn2jGKnPzCOmnZHvFyaXBXMJFfswKFjXxuTzk+mraQ@mail.gmail.com>
Subject: Re: [PATCH 0/2 v6] drm/mediatek: Add support for 10-bit overlays
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

My apologies, I accidentally mangled the version history. It should
actually read:

v2:
 * Rebase and resolve merge conflicts with the AFBC patch.
v3:
 * Moved 10-bit support detection to mtk_disk_ovl.c
v4:
 * Moved formats to mtk_disp_ovl.c and mtk_disp_rdma.c
v5:
 * Minor style adjustments per checkpatch.pl
v6:
 * Refactor patch into patch series.
 * Add formats directly to private data.

On Tue, Jan 31, 2023 at 3:08 PM Justin Green <greenjustin@chromium.org> wrote:
>
> This patch series adds support for 10-bit overlays to the Mediatek DRM driver.
> Specifically, we add support for AR30 and BA30 overlays on MT8195 devices and
> lay the groundwork for supporting more 10-bit formats on more devices.
>
> 1. Refactor plane initialization logic to allow individual DDP components to
> provide their supported pixel formats.
>
> 2. Add AR30 and BA30 support to the MT8195 overlay driver.
>
>
> Version history:
> v6:
>  * Refactor patch into patch series.
>  * Add formats directly to private data.
>
> v5:
> * Removed some dead defines.
> * Refactored mtk_ovl_set_afbc().
>
> v4:
> * Move modifier validation to format_mod_supported function.
> * Add modifiers to drm_universal_plane_init() call.
> * Make comparisons to DRM_FORMAT_MOD_LINEAR explicit rather than relying on
>   DRM_FORMAT_LINEAR being equal to 0.
> * Gate AFBC control bit writes on device compatibility.
>
> v3:
> * Replaced pitch bitshift math with union based approach.
> * Refactored overlay register writes to shared code between non-AFBC and
>   AFBC.
> * Minor code cleanups.
>
> v2:
> * Marked mtk_ovl_set_afbc as static.
> * Reflowed some lines to fit column limit.
>
>
> Justin Green (2):
>   drm/mediatek: Refactor pixel format logic
>   drm/mediatek: Add support for AR30 and BA30 overlays
>
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 89 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
>  8 files changed, 168 insertions(+), 18 deletions(-)
>
> --
> 2.39.1.456.gfc5497dd1b-goog
>
