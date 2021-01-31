Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D40309BA3
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748D26E081;
	Sun, 31 Jan 2021 11:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0DD6E081
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 11:42:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id o5so591919wmq.2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 03:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IlbddDvBgM9r9BSAbx+bNAwgIIR/5LpoWexAqHTbNlc=;
 b=ubnlzceEIjpMwtIMZlWj/gvfGu+hgitokmhXO8nK5+Yp3g4ZZU1zVf7TTGsx5CmMkc
 7TMlOCxor8/YP2R8t6AF1X+dQ8TmajLa2qXKbLELGqvHPEW9cPf79VD5sn5rL3PlQIK7
 z28WAZUI/0O+HyN3amZVQ4yzKcMcHExnC5iiPzxKe2z7VNtw1tDo24ssLsZJgi/r656q
 /ipAIbnx/a4LYbLGIMxo18Ig1YqsoA/PuvaPKBxOzrvbqQMXguS5YDft2qHq3MQP0fTx
 vYFeZOCpPhA17Q7F3w6sVactQORrmI2KAbpteaTvKn+OJeSa2vnvB3Y5RcNxjIVg9RHe
 s5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IlbddDvBgM9r9BSAbx+bNAwgIIR/5LpoWexAqHTbNlc=;
 b=FiRRzTy7ypngAsFe5+owE7Pq9DC547EszmqXGAwGJcUjMEmQxwIzFD4SHs/qz/qDnB
 uuLfqn4HahyDQyFBNMl44A8FGKvdGD9ckIu7po4Qm9CHKMfblqk7UiCwXrDJb0gddGjE
 ttVa78uU9oyh1ktEsr9QIHVZB7IMxkfigRwoQpMvJ1kVANjTzpnZXlNsaRJbEf37DiHR
 Zj2a+kWJyDYjlyAJ+vdJNW/cKDhqDCT9tGpCKzddTTTcDg4c3pd5gj1K1bzBbllZVB0I
 f0qxOR+x5lg/8o8AO5BTIUyg7AJP8g+dpOl8C4b51VHIe1/MElVPTJDrVdVEYLX2sKxE
 w8HA==
X-Gm-Message-State: AOAM5305lhY3PYtOzmR7JgpSFnLJ1050eMWJZa+rLnSfDcQGWeoqkeWC
 8jTNbHXG5acfONpXY4v/u0w=
X-Google-Smtp-Source: ABdhPJyTnZc6n0hZInkXxcAeRNV6DTSQMIMH9BUJ4r7MGmhHKROXEFwCyX/RRWAVGtU65TkuzHbV8w==
X-Received: by 2002:a1c:3286:: with SMTP id
 y128mr10801903wmy.104.1612093345278; 
 Sun, 31 Jan 2021 03:42:25 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id i8sm23952003wry.90.2021.01.31.03.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 03:42:24 -0800 (PST)
To: Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v13 0/8] drm/mediatek: add support for mediatek SOC MT8183
Message-ID: <19742b84-abf1-c308-315e-c117531ed439@gmail.com>
Date: Sun, 31 Jan 2021 12:42:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129092209.2584718-1-hsinyi@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29/01/2021 10:22, Hsin-Yi Wang wrote:
> This series is based on kernel/git/chunkuang.hu/linux.git mediatek-drm-next
> The series is tested on a mt8183 krane device.
> 
> Change since v12
> - fix mtk_dither_config
> 
> Change since v10, v11
> - fix review comments in v9
> 
> Change since v9
> - change several function to rebase to mediatek-drm-next
> 
> Change since v8
> - fix some review comment in v8
> - separate gamma module for mt8183 has no dither function in gamma
> - enable dither function for 5 or 6 bpc panel display
> - separate ddp mutex patch from the whole Soc patch
> 
> Change since v7
> - add dt-binding for mt8183 display
> - base mmsys patch
> https://patchwork.kernel.org/project/linux-mediatek/cover/1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com/
> - base dts patch
> https://patchwork.kernel.org/project/linux-mediatek/cover/20201127104930.1981497-1-enric.balletbo@collabora.com/

These are already upstream since v5.11, right?

Please drop reference in further versions, it confused me :)

Regards,
Matthias

> - add mt8183 function call for setting the routing registers
> - add RDMA fifo size error handle
> 
> Change since v6
> - move ddp component define into mtk_mmsys.h
> - add mmsys private data to support different ic path connection
> - add mt8183-mmsys.c to support 8183 path connection
> - fix reviewed issue in v6
> 
> Change since v5
> - fix reviewed issue in v5
> base https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219
> 
> Change since v4
> - fix reviewed issue in v4
> 
> Change since v3
> - fix reviewed issue in v3
> - fix type error in v3
> - fix conflict with iommu patch
> 
> Change since v2
> - fix reviewed issue in v2
> - add mutex node into dts file
> 
> Changes since v1:
> - fix reviewed issue in v1
> - add dts for mt8183 display nodes
> - adjust display clock control flow in patch 22
> - add vmap support for mediatek drm in patch 23
> - fix page offset issue for mmap function in patch 24
> - enable allow_fb_modifiers for mediatek drm in patch 25
> 
> Hsin-Yi Wang (1):
>   drm/mediatek: add mtk_dither_set_common() function
> 
> Yongqiang Niu (7):
>   arm64: dts: mt8183: rename rdma fifo size
>   arm64: dts: mt8183: refine gamma compatible name
>   drm/mediatek: separate gamma module
>   drm/mediatek: add has_dither private data for gamma
>   drm/mediatek: enable dither function
>   soc: mediatek: add mtk mutex support for MT8183
>   drm/mediatek: add support for mediatek SOC MT8183
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi    |   7 +-
>  drivers/gpu/drm/mediatek/Makefile           |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 198 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  18 ++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 111 ++++-------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  49 ++++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  drivers/soc/mediatek/mtk-mutex.c            |  50 +++++
>  10 files changed, 379 insertions(+), 76 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
