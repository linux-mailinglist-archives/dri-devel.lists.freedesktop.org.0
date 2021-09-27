Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F318D41A122
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 23:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3706E513;
	Mon, 27 Sep 2021 21:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354256E027
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 16:56:23 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id t2so10725682qtx.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 09:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LxG4HPV4FXiyd9Nx3Il3K8msxXap3JQb5VLOGuZR7VY=;
 b=lg1n7FUxcNqWTq5zo6ikpYbbg1qh5zQzLTJ8zwUneGdbsMi0M8mPV5zE8+Xcnd4HAQ
 gP4NyCqJ20CSOR+CPqKX/7qhd/sNzEYzCKw4BD4XJoCDHPDw+ma36rX2v5+8bAAdsQXE
 1U8inMUrBNXMZLxmcTjggGzHf9MKW1SPst+Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LxG4HPV4FXiyd9Nx3Il3K8msxXap3JQb5VLOGuZR7VY=;
 b=77gf6U/8lrum/R/zvKIHAsNaWFewCjN2iUEfO5aC5dso4/HFFY3eSjEgx8f9BdD00f
 d5x6Jj7jTAz+dHNGK5HcptGT1zaGW3edjcCG1bfNvYuwTqvObEI1fA3nD76lDMANBSp1
 PS73fEaSL9DKnOSSl+uNkRuUnq/TkxX6m/vRazmZI8au9qC5vfHm0BeBBpfNGIjhPMJY
 28ouRr+2lPO7Q3S9qf/YgBUivYDfsn4cd9cfOgmXTPAcBdaB9710MEXV0g/IWBPv/nX7
 RHg6NWZHqFok0bLZFKtQuYdQ21GtvwexvvdI5F7zyE/nG7ApGM0PizLYF+liMl3aTyfG
 iOhQ==
X-Gm-Message-State: AOAM5331fpQ+8Ra+hLj+/YfGtMbYSBybIVHgX9BBDueBaiwKgPQJmuB6
 mSZnq9FWTMZvJkPUgr29fN32pT7y6/PuaEvJx9S4Rw==
X-Google-Smtp-Source: ABdhPJxks+ildD0Q8dRhHE4wWhlya4id4tdrl9iWX9N3kBCiqQIO9AuMcdOLdKpmnSNIRpILzZVNT9+rwNTdRNHeUGM=
X-Received: by 2002:ac8:1c6:: with SMTP id b6mr855002qtg.221.1632761781171;
 Mon, 27 Sep 2021 09:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
In-Reply-To: <20210901083215.25984-1-yunfei.dong@mediatek.com>
From: Steve Cho <stevecho@chromium.org>
Date: Mon, 27 Sep 2021 09:56:10 -0700
Message-ID: <CAC-pXoNT8AFA2j1DiD9M_uGb92fVcukTGDKVURaGjwpPstcwqQ@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 27 Sep 2021 21:05:15 +0000
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

Hi Yunfei,

> This patch dependents on : "media: mtk-vcodec: support for MT8183 decoder"[1] and
> "Mediatek MT8192 clock support"[2].
>
> 1: Multi hardware decode is based on stateless decoder, MT8183 is the first time
> to add stateless decoder. Otherwise it will cause conflict. This patch will be
> accepted in 5.15[1].
Just a few basic questions. What kind of "conflict" are you expecting here?
Are you referring to kernel "5.15" here?
Probably not. If yes, then that sounds strange to me considering our
current kernel uprev plans and current kernel used for MT8183.

> 2: The definition of decoder clocks are in mt8192-clk.h, this patch already in clk tree[2].
>
> [1]https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
This link seems to be no longer available.

> [2]https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
