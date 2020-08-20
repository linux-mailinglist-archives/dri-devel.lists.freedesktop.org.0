Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E0424B1CB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 11:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C146E90C;
	Thu, 20 Aug 2020 09:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBFA6E90C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 09:13:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r2so1287029wrs.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0JbEGUpzUPbEtjAsVmRvH6bX5043+AS9qSE1XvD9D/U=;
 b=HAqCRnYoKh4shWP1Bh6iF2OQL1zyAwfk3BldT7lyFCXSdpMbI5McqVXvAg1y2E5Fl/
 PJRjYvURrqHmVTi6+1hqi+MzoxqmfJjkbsv2yAi3BiinfthNgiMYJFXnlbqQFxa6Z2+Q
 9USt7O5dHznyME7cQG9Pc9EGe6vfd/GJApL4neO9QkscPj91V6pZwbPzo5LMTMmWFm4i
 09CDuv2FV4cv8RPcIHCuHvYNgUP7CdFzpNOfobwbe7AYSX2EcHEDaEsgAxgG925H7BnC
 rPm2/6G8Ne1qVDOcsLcg11RLDMNcmshDznM87XgprKE9l3MFiwpM9U3ZkEhOmcSSBTI4
 n0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0JbEGUpzUPbEtjAsVmRvH6bX5043+AS9qSE1XvD9D/U=;
 b=K5rmbLHWHmTr9vpZtNWWNNs0X5fl3mLsjTcnzWDoKruI5tjuC6+/UvjD9cw7Fa/PvI
 8V7Mm9U39AKD2eYWLycGyCn6prgHvOMBkauFQkb6CskiExtmn6uHIIgTK6MjxHtT7PLl
 Ec8n/kknsdRlMthL5rRQSn+sVdm5ZENHR51cZl1qVUlpFZy1CLH7bXIv3w7UlFhZudsL
 JPg/uFHf05SOcOUpUsKeVxkA6N0fBtun+zRvfsQTu6IH+ifyOIqwD6v9Jx6l+c1hrMMi
 Mg9BrxDoJttwM18YsMIq7GC73YiwqbltvwkVM/gXlD8vAGwh3J5YNklp70r7D7Ow8Aqq
 MNFQ==
X-Gm-Message-State: AOAM5305xyxcsakFP1EoOsuspcL28YPc0doYqBNXBMerXqX4jb/anjM2
 ZUct2lYBczW1VqiCkNxen9Y=
X-Google-Smtp-Source: ABdhPJxoY9JmdC2hvKhv7zPTHozm34JZIknaHlVUcr+Fi116POuZOZYfQqOQ5WVjgvJwAFPP1yh0VA==
X-Received: by 2002:a5d:464a:: with SMTP id j10mr2318764wrs.187.1597914807249; 
 Thu, 20 Aug 2020 02:13:27 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
 by smtp.gmail.com with ESMTPSA id
 a3sm3045157wme.34.2020.08.20.02.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 02:13:26 -0700 (PDT)
Subject: Re: [PATCH v1 00/21] add drm support for MT8192
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d723ec4f-b251-5a94-4939-01f2df61f7d8@gmail.com>
Date: Thu, 20 Aug 2020 11:13:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 20/08/2020 08:03, Yongqiang Niu wrote:
> Changes in v1:
> - add some more ddp component
> - add mt8192 mmsys support
> - add ovl mount on support
> - add 2 more clock into mutex device
> - fix ovl smi_id_en and fb null software bug
> - fix ddp compoent size config bug
> - add mt8192 drm support
> - add ddp bypass shadow register function
> - add 8192 dts description
> 
> Yongqiang Niu (21):
>    drm/mediatek: add component OVL_2L2
>    drm/mediatek: add component POSTMASK
>    drm/mediatek: add component RDMA4
>    mtk-mmsys: add mt8192 mmsys support
>    mtk-mmsys: add ovl mout on  support
>    drm/mediatek: add disp config and mm 26mhz clock into mutex device
>    drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
>    drm/mediatek: check if fb is null
>    drm/mediatek: fix aal size config
>    drm/mediatek: fix dither size config
>    drm/mediatek: fix gamma size config
>    drm/mediatek: fix ccorr size config
>    drm/mediatek: add support for mediatek SOC MT8192
>    drm/mediatek: add bypass shadow register function call for ddp
>      component
>    drm/mediatek: add color bypass shadow register function
>    drm/mediatek: add ovl bypass shadow register function
>    drm/mediatek: add rdma bypass shadow register function
>    drm/mediatek: add dither bypass shadow register function
>    drm/mediatek: add aal bypass shadow register function
>    drm/mediatek: add ccorr bypass shadow register function
>    arm64: dts: mt8192: add display node
> 

At least regarding mmsys and dtsi patches, these are not based on upstream. 
Please rebase.

Regards,
Matthias

>   arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 126 +++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_disp_color.c   |  22 ++++
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  41 ++++++-
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  27 +++++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   3 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp.c      |  84 +++++++++++--
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  80 +++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   8 ++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  48 ++++++++
>   drivers/soc/mediatek/mmsys/Makefile         |   1 +
>   drivers/soc/mediatek/mmsys/mt8192-mmsys.c   | 182 ++++++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c            |   8 ++
>   include/linux/soc/mediatek/mtk-mmsys.h      |   6 +
>   13 files changed, 623 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
