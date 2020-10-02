Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EACC282314
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 11:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF806E334;
	Sat,  3 Oct 2020 09:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539626E9C9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 20:29:59 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id q1so2422247ilt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 13:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FhLp+gt/aFZ8a4cP9x5681ANW42efWsw5G3/zOdmKDI=;
 b=X78OeGMYE53vGxb6k7lJIAAX5siDmGTwGVBI6xwQZvoBjcxdsD1qiH0bw/CtXso8db
 sytPoZj/jAHfB/8NE2BxOWXSc1ng3oP2txcd2XZwNKGihs45h/Q9uyaCjkA+ccm6c6tW
 fCvNUS0esgkVhmbkvg9SsQM7Uz/a9QFmfLHjGTIe72ahexXK800zFFqN5SjRUk+GOaMw
 O40BUylaKSQELxQAWGDYbon4oJmYAG3lpVYHBAnyQxznaZqSXXqnuaEJSyj4mM0eiUXz
 U7T1pD8DbP1ex5ZsE2ach1NoMp0bdHz+A0tcfW14Su3sVI5lBy2+Lnku86PDQuNqD/Ik
 CBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FhLp+gt/aFZ8a4cP9x5681ANW42efWsw5G3/zOdmKDI=;
 b=CN2LjXkEUBVD3C7zB5L820j12juiCWxOcqF8lRYJMKcMsSYx47yr8JLKRTWacdX9eP
 uw+5Ve8qWZAfFvrEjNkHZieDp4efc85OvwBTY68ePyoMmlzG7Tbtz4YrR3EmmcHbystp
 Cjg5QDVDe5FxPKs3pDuShGxcozVRRG6gZUfdgyBzLGzz1We385bsBGS9XAvEhxPM+cGn
 VHWyj40ZELipi0qdGB/2mzETEunJFd/pNWSthSM2E768x/QADZg+EUrgjCarTivgzjMA
 ik4XjoBDnxkVqmVk7VKkjk7Lx4vqLjLSZfNaArjdNVf5N34MiWMcLzWeyNuIdlRFPcsj
 +cWA==
X-Gm-Message-State: AOAM530oROmRYvJMso8reGae3vYKW44J3NQC6oD0bY46SW96O0B6XL2/
 Ew2sh2ZHAGjR/1SoEoBiseCYsj+brC/cfXoqxg0=
X-Google-Smtp-Source: ABdhPJyvzpaKKuH7o6oSQQFWKdaUonXVTmblHyAmich7fPwzQ1o1+ONhbgPkZQ2NRNj/1dCDzVqV+XIA1KkybHm6acQ=
X-Received: by 2002:a05:6e02:10ce:: with SMTP id
 s14mr3275546ilj.239.1601670598656; 
 Fri, 02 Oct 2020 13:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200927230422.11610-1-chunkuang.hu@kernel.org>
In-Reply-To: <20200927230422.11610-1-chunkuang.hu@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 2 Oct 2020 15:29:47 -0500
Message-ID: <CABb+yY1zq0+sqXuSzkkX9+dTaTZgg5HJyQLC3N-yZx35QLLvDQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Mediatek DRM driver detect CMDQ execution timeout by
 vblank IRQ
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailman-Approved-At: Sat, 03 Oct 2020 09:23:39 +0000
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 27, 2020 at 6:04 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> CMDQ helper provide timer to detect execution timeout, but DRM driver
> could have a better way to detect execution timeout by vblank IRQ.
> For DRM, CMDQ command should execute in vblank, so if it fail to
> execute in next 2 vblank, timeout happen. Even though we could
> calculate time between 2 vblank and use timer to delect, this would
> make things more complicated.
>
> This introduce a series refinement for CMDQ mailbox controller and CMDQ
> helper. Remove timer handler in helper function because different
> client have different way to detect timeout. Use standard mailbox
> callback instead of proprietary one to get the necessary data
> in callback function. Remove struct cmdq_client to access client
> instance data by struct mbox_client.
>
> Chun-Kuang Hu (4):
>   soc / drm: mediatek: cmdq: Remove timeout handler in helper function
>   mailbox / soc / drm: mediatek: Use mailbox rx_callback instead of
>     cmdq_task_cb
>   mailbox / soc / drm: mediatek: Remove struct cmdq_client
>   drm/mediatek: Detect CMDQ execution timeout
>
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  54 ++++++---
>  drivers/mailbox/mtk-cmdq-mailbox.c       |  24 ++--
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 146 ++---------------------
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  25 +---
>  include/linux/soc/mediatek/mtk-cmdq.h    |  54 +--------
>  5 files changed, 66 insertions(+), 237 deletions(-)
>
Please break this into two patchsets - one for mailbox and one for its users.
Also, CC original author and recent major contributors to mtk-cmdq-mailbox.c

Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
