Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039C48B7AC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 20:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDE710EA8D;
	Tue, 11 Jan 2022 19:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E32610EA8D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 19:55:40 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id b127so87110qkd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=4UkALJo42zyNVJNxiAZxEL17ovop2sEjH0povRmnj1A=;
 b=JlKqfCOeysMqlHnuqY++ZmDpdFM97icn5cmQu4EmLRpBUDXZOx+S08RK8aGzNsNcy5
 pnf3ELRLIWxhIi1zMOdGfgjLavGmc3wEmSCJQihL1Yi6clc1Zu5EpfN3Y/JnRyAbl+Ns
 sVoFNDKrWsd5gzlEr4lJn5eI5Yu5lwB3QEsB0VYD0/lRJtgyLY0pqeW8b1LeQK2t3YuR
 CFVPUSaNbHQTPp+f9w6RzFKsXnZFaaNqzTa2fJRh9qyC1HZeNACl5lvo4GzT88+pbXnq
 fi3Te4GcybtCQW+Fp7Uo9x5Xne9VLHIheYBq2qZkpmXtdr/T4pjOQK4enu5gipc7ZxLR
 fBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=4UkALJo42zyNVJNxiAZxEL17ovop2sEjH0povRmnj1A=;
 b=pctjNui4QOPuwvcz3+im2qj0RDdataOqbp+5e7/4+hmD/cNLU9s4Y+S75Skmu9zjiv
 tmhNST/Y9vnBd4JfuKH2O8i1smulK8Jao1hrh913KMeE3BV40Yb+JRr0Z0k0+DamMQCc
 9ZfhpduaV9Kz9rBxRuSB7XHepPJoYRZYIsQUNC8ptWcG1W/3i/Q5P8DKYiPuGHTGlJ7l
 KLkitzOkWC8hovQfqF/JAQUcQ3czLNZ7pe3oZthphnc5COKcZIzt34a3ivmNjjsdZXfH
 bMS1Zsh5vnPMJq1Rn3qqEVqnMMkE65DqAKl97fPhhGgwFiSDsOQ35W5mf19q1RJqSHky
 /awg==
X-Gm-Message-State: AOAM5331lt4+vNXq1/wB4KjIXSznXMhdr3preuaHdRZAER4DX5KFSm0e
 szQC4MTsQYWsa6SJgYdx0JfZHg==
X-Google-Smtp-Source: ABdhPJw8dTHlooGde6P0GPheEh0aByt4tzNuOPVs95bnwX/Ye4l3dIP0O99YINdvrXfK851DNqYdPw==
X-Received: by 2002:a05:620a:2702:: with SMTP id
 b2mr4221539qkp.299.1641930939261; 
 Tue, 11 Jan 2022 11:55:39 -0800 (PST)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
 by smtp.gmail.com with ESMTPSA id
 g5sm7610395qtb.97.2022.01.11.11.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 11:55:38 -0800 (PST)
Message-ID: <91a41f3a17f94d25f84054daa1854603d113ecaf.camel@ndufresne.ca>
Subject: Re: [PATCH v4, 00/15] media: mtk-vcodec: support for MT8192 decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Tue, 11 Jan 2022 14:55:35 -0500
In-Reply-To: <20220110083442.32604-1-yunfei.dong@mediatek.com>
References: <20220110083442.32604-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Yunfei,

Le lundi 10 janvier 2022 à 16:34 +0800, Yunfei Dong a écrit :
> This series adds support for mt8192 h264/vp8/vp9 decoder drivers. Firstly, refactor
> power/clock/interrupt interfaces for mt8192 is lat and core architecture.
> 
> Secondly, add new functions to get frame buffer size and resolution according
> to decoder capability from scp side. Then add callback function to get/put
> capture buffer in order to enable lat and core decoder in parallel. 
> 
> Then add to support MT21C compressed mode and fix v4l2-compliance fail.

Perhaps you wanted to append the referred v4l2-compliance output (fixed) ?

As we started doing with other codec driver submission (just did last month for
NXP), can you state which software this driver was tested with ? I have started
receiving feedback from third party that MTK driver support is not reproducible,
I would like to work with you to fix the situation.

regards,
Nicolas

> 
> Next, extract H264 request api driver to let mt8183 and mt8192 use the same
> code, and adds mt8192 frame based h264 driver for stateless decoder.
> 
> Lastly, add vp8 and vp9 stateless decoder drivers.
> 
> Patches 1 to refactor power/clock/interrupt interface.
> Patches 2~4 get frame buffer size and resolution according to decoder capability.
> Patches 5~6 enable lat and core decode in parallel.
> Patch 7~10 add to support MT21C compressed mode and fix v4l2-compliance fail.
> patch 11 record capture queue format type.
> Patch 12~13 extract h264 driver and add mt8192 frame based driver for h264 decoder.
> Patch 14~15 add vp8 and vp9 stateless decoder drivers.
> ----
> Dependents on "Support multi hardware decode using of_platform_populate"[1].
> 
> This patches are the second part used to add mt8192 h264 decoder. And the base part is [1].
> 
> [1]https://patchwork.linuxtv.org/project/linux-media/cover/20211215061552.8523-1-yunfei.dong@mediatek.com/
> ---
> changes compared with v3:
> - remove enum mtk_chip for patch 2.
> - add vp8 stateless decoder drivers for patch 14.
> - add vp9 stateless decoder drivers for patch 15.
> changes compared with v2:
> - add new patch 11 to record capture queue format type.
> - separate patch 4 according to tzung-bi's suggestion.
> - re-write commit message for patch 5 according to tzung-bi's suggestion.
> changes compared with v1:
> - rewrite commit message for patch 12.
> - rewrite cover-letter message.
> ---
> Yunfei Dong (15):
>   media: mtk-vcodec: Add vdec enable/disable hardware helpers
>   media: mtk-vcodec: Using firmware type to separate different firmware
>     architecture
>   media: mtk-vcodec: get capture queue buffer size from scp
>   media: mtk-vcodec: Read max resolution from dec_capability
>   media: mtk-vcodec: Call v4l2_m2m_set_dst_buffered() set capture buffer
>     buffered
>   media: mtk-vcodec: Refactor get and put capture buffer flow
>   media: mtk-vcodec: Refactor supported vdec formats and framesizes
>   media: mtk-vcodec: Add format to support MT21C
>   media: mtk-vcodec: disable vp8 4K capability
>   media: mtk-vcodec: Fix v4l2-compliance fail
>   media: mtk-vcodec: record capture queue format type
>   media: mtk-vcodec: Extract H264 common code
>   media: mtk-vcodec: Add h264 decoder driver for mt8192
>   media: mtk-vcodec: Add vp8 decoder driver for mt8192
>   media: mtk-vcodec: Add vp9 decoder driver for mt8192
> 
>  drivers/media/platform/mtk-vcodec/Makefile    |    4 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   49 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |    5 -
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  168 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |    6 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   14 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |  284 ++-
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   40 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |    5 -
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c |    6 +
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |    1 +
>  .../mtk-vcodec/vdec/vdec_h264_req_common.c    |  311 +++
>  .../mtk-vcodec/vdec/vdec_h264_req_common.h    |  254 ++
>  .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  416 +---
>  .../mtk-vcodec/vdec/vdec_h264_req_multi_if.c  |  605 +++++
>  .../mtk-vcodec/vdec/vdec_vp8_req_if.c         |  445 ++++
>  .../mtk-vcodec/vdec/vdec_vp9_req_lat_if.c     | 2066 +++++++++++++++++
>  .../media/platform/mtk-vcodec/vdec_drv_if.c   |   36 +-
>  .../media/platform/mtk-vcodec/vdec_drv_if.h   |    3 +
>  .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |   37 +
>  .../platform/mtk-vcodec/vdec_msg_queue.c      |    2 +
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |   54 +-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   15 +
>  .../media/platform/mtk-vcodec/venc_vpu_if.c   |    2 +-
>  include/linux/remoteproc/mtk_scp.h            |    2 +
>  25 files changed, 4248 insertions(+), 582 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_req_if.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c
> 

