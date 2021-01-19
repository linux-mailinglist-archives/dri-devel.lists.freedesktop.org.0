Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159142FB438
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7363E6E848;
	Tue, 19 Jan 2021 08:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51196E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 04:16:49 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id q2so35444046iow.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 20:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZJDrgzZmYXfIo0lGIMXEXiySIw3gPtBzcGCID7s8Rw=;
 b=LcbM3pmru0ucPXbMjeSV2nKL0tNYuwj4P09n7fLfJPRKFXp2iIi7QXy/+oQYIs9uvG
 VHMTvgy0LY64CPN9Ugci67iTo1g4+gw9SR79kPv+XTLTCZFvDAc7wp+iKxqK2y6H6EWf
 Qvmw/MOkOu0xWdJ9HNukA/J8BdAgyhfZSMpMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZJDrgzZmYXfIo0lGIMXEXiySIw3gPtBzcGCID7s8Rw=;
 b=ZRW+2jBJeic/hTgS2RC+f5FZAszlFZtdRfoDSxOMJU4OmB2zVKexXD9/GLHOr1kkCL
 Za01ONJmAxiII5iyBbfE6hXq250EFLfWhOdEPbHFPsUlnupG6R6M4Z9kUOMe9cCnE0cB
 MqMw44uw+8ucsX8ZGTONHzx0nyyi86uzim0pliFlSLsDO29URNc/ynO4vZb9sHCjCIT4
 /k6EuDDIL0YYBQyxPq395Qi1cYGyedW2N6wxosLVqNL3wA947gnwhc4HiUilGz9pdnfg
 MXVyv+O2LdPFloDiffYPOhL1DU1jRlMU2yFSwdGFBjJ3LyxA4ZvqMXRaq3yOxG0cSw99
 Kk4A==
X-Gm-Message-State: AOAM530CXLxbnOOavj6lLm8P9TrDVXhyVNvYud6gNfUBPCUy8TIHqJHe
 JKFqiKuLyaQypk2ioWXYtgrDOlLbsJ08T1qRNpA6mg==
X-Google-Smtp-Source: ABdhPJx1/ogNcijA0/Z5AfgmfPpBpPyqkRKX8ipSYmZcentmAty4lVh6xCNc6+Ml/YaghCmRKnI08Jm+P91hO3WNZy4=
X-Received: by 2002:a05:6e02:1a8e:: with SMTP id
 k14mr1905628ilv.308.1611029808923; 
 Mon, 18 Jan 2021 20:16:48 -0800 (PST)
MIME-Version: 1.0
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 19 Jan 2021 12:16:23 +0800
Message-ID: <CAJMQK-j_5oWcLSrsVAvjkDKUJOSeZbS6aqZQML9etYJLctRX7Q@mail.gmail.com>
Subject: Re: [PATCH v4, 00/10] soc: mediatek: mmsys: Use function call for
 setting the routing registers
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 5, 2021 at 3:06 AM Yongqiang Niu <yongqiang.niu@mediatek.com> wrote:
>
> The following series are intended to prepare the mtk-mmsys driver to
> allow different DDP (Data Display Path) function call per SoC.
>
> base 5.11-rc1
>
> change since v3:
> - move register operation into mmsys path select function
>
> Yongqiang Niu (10):
>   soc: mediatek: mmsys: create mmsys folder
>   soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
>   soc: mediatek: mmsys: move register operation into mmsys path select
>     function
>   soc: mediatek: mmsys: Use function call for setting the routing
>     registers
>   soc: mediatek: mmsys: add mt8183 function call for setting the routing
>     registers

patch 01 ~ 05: I've tested on a mt8183 device, so

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

>   soc: mediatek: mmsys: add component OVL_2L2
>   soc: mediatek: mmsys: add component POSTMASK
>   soc: mediatek: mmsys: add component RDMA4
>   soc: mediatek: mmsys: Use function call for setting mmsys ovl mout
>     register
>   soc: mediatek: mmsys: add mt8192 mmsys support
>
>  drivers/soc/mediatek/Makefile             |   2 +-
>  drivers/soc/mediatek/mmsys/Makefile       |   5 +
>  drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 254 ++++++++++++++++++++
>  drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 110 +++++++++
>  drivers/soc/mediatek/mmsys/mt8192-mmsys.c | 149 ++++++++++++
>  drivers/soc/mediatek/mmsys/mtk-mmsys.c    | 180 ++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c          | 373 ------------------------------
>  include/linux/soc/mediatek/mtk-mmsys.h    |  25 ++
>  8 files changed, 724 insertions(+), 374 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
>  create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
>  create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c
>  create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c
>  create mode 100644 drivers/soc/mediatek/mmsys/mtk-mmsys.c
>  delete mode 100644 drivers/soc/mediatek/mtk-mmsys.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
