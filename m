Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECEF5072FC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C19A10F0AD;
	Tue, 19 Apr 2022 16:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E63A10F0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:32:44 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id bg24so15916733pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+beZKhadRb9QR42fP8opIh478PeXQ0qU4zFY/sETBqY=;
 b=kMjol9V1uY4GXuzugDURnjy4OL0zU3Kg9Sl71oCy6WD3M64lIJrWISqaCrVfpUDowz
 f/vEiXwG4l58b+bxXYnG09TkvPqHTwO8QcgBrkVBzNILvLexWG/zYhvtdqNhrqvqzn8/
 /laU5shLdQ5E+Jnjg56PvuSOYvxwg+IbXVgT5qBxyaDMZdskTu5kktj3IwolBZqZepjD
 yXs8eDs0w/nY6LkjFzxKG6qkqxe+PaJz3Q5uAaREH0ucJN8SKf386d3CqfW7PQ/LIs94
 wkB1tZuWaPAGrFnXB2QGRceVBzMXTtcPQ9fxjXR0RIe9y4H/cKFvUfXEsQTSimEFr87a
 nt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+beZKhadRb9QR42fP8opIh478PeXQ0qU4zFY/sETBqY=;
 b=GSQw8m7o5XdUSia0aR3C7gJJKKeq20swCGuBPRy5v94rnYVyFYKsJkDq6TPEXj8Jwb
 B0C4bYZFiKhd5SITutdrYmGeV6I0H6DeSCgzXg0P29VtPmwmmswcO0YT5kB6fe4GTvsx
 Pe6ZQgzPO9o5ebas559hMDW7ktKjsccjziu46fhhU+ZYU8bXTMcfs02zgXR9FEOPkRPn
 UPXYprPVTSSKwxsBI5GgMRFwaauPE1ogYawOxF02Zp7VJiLemjlLUKnFG7NGU3T2iraI
 v5Ot0cme4HpsJH30K0zMV2x7+Ju5HyljoPlpF0b3TlVpEqBPJFeVFkzBCBo4VseUvmpu
 CTsg==
X-Gm-Message-State: AOAM533pdGR21jLIfhRgVqHVn/dpOvRUA9acTVQ28XDC2jC8/jbeZdai
 YjcvjB0dyFT2igPHl+kXpe0T/CAGx9WMFz6cZulwYP3Dz30=
X-Google-Smtp-Source: ABdhPJx+0ojjTdq9N+q8WWzG1w7KU/sBXKZQo/lqOyZDziKDKzmIAXjaEVd0n4p7TGFBLF/kXrKOMbcOFFkd9Ou1E5Y=
X-Received: by 2002:a17:90a:6501:b0:1ca:a7df:695c with SMTP id
 i1-20020a17090a650100b001caa7df695cmr19913891pjj.152.1650385963261; Tue, 19
 Apr 2022 09:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649989179.git.Sandor.yu@nxp.com>
In-Reply-To: <cover.1649989179.git.Sandor.yu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Apr 2022 18:32:32 +0200
Message-ID: <CAG3jFyuhe9CJBLuqKH9u9NSujkqkOhh4NJ59xOD8xEVNO7gnEg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] DRM: Bridge: DW_HDMI: Add new features and bug fix
To: Sandor.yu@nxp.com
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, shengjiu.wang@nxp.com,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cai.huoqing@linux.dev,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 hverkuil-cisco@xs4all.nl, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Apr 2022 at 04:43, <Sandor.yu@nxp.com> wrote:
>
> From: Sandor Yu <Sandor.yu@nxp.com>
>
> This is new features and bug fix patch set for DW_HDMI DRM bridge driver
> that has verified by NXP i.MX8MPlus.
> Two new feature added:
> 1. Add GPA interface for DW_HDMI Audio.
> 3. New API for reset PHY Gen1.
> Two bugs fixed:
> 1. Enable overflow workaround for all IP versions later than v1.30a.
> 2. Clear GCP_Auto bit for 24-bit color depth to pass CTS.
>
> v1->v2:
> 1. Save CEC interrupt registers in struct dw_hdmi_cec
> 2. Restore CEC logical address register by cec->addresses.
> 3. Default enable overflow workaround for all versions later than v1.30a.
> 4. Add clear_gcp_auto flag to clear gcp_auto bit for all 24-bit color.
> 5. Remove i.MX8MPlus specific reference.
>
> v2->v3:
> 1. Drop the patch of Add CEC Suspend/Resume to restore registers.
> Because it is not a general feature for other SOCs, their CEC engine are
> enabled in suspend for CEC wakeup.
> 2. More detail comments for patch GCP only for Deep Color.
> 3. Address coments for patch GPA driver and move enable_audio/disable_audio
> from dw_hdmi_phy_ops to dw_hdmi_plat_data.
>
> Sandor Yu (4):
>   drm: bridge: dw_hdmi: default enable workaround to clear the overflow
>   drm: bridge: dw_hdmi: Enable GCP only for Deep Color
>   drm: bridge: dw_hdmi: add reset function for PHY GEN1
>   drm: bridge: dw_hdmi: Audio: Add General Parallel Audio (GPA) driver
>
>  drivers/gpu/drm/bridge/synopsys/Kconfig       |  10 +
>  drivers/gpu/drm/bridge/synopsys/Makefile      |   1 +
>  .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    | 199 ++++++++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 186 ++++++++++++++--
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     |  16 +-
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        |   2 +-
>  include/drm/bridge/dw_hdmi.h                  |  11 +-
>  7 files changed, 400 insertions(+), 25 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c

Fixed two checkpatch --strict formatting warnings.

Applied to drm-misc-next.
