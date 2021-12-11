Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBE6470F80
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 01:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D180F10E689;
	Sat, 11 Dec 2021 00:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E8E10E688
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 00:35:44 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso11331095ota.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 16:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e5x1ZjLFt2D7tDxJkUBVGLXNcKm1tzU4wK9evqtEkww=;
 b=O7hwBTF5k+CrSbVIJz7E/Ja3jnkWRmNNlGupROLqkAREKGvQ7klIt163ni1FQLHeIy
 lqXa+Q079+k8F8KqDCPqC2c0wLokSb7E39OH17K3im5utFF9U5L6MDLtFc4Ci4d6qeA5
 HAH2qe5ECgoRCiFKH3z0nW5vBh/UaDGurQ7R3U8/HaBRvMjxm+TK/o1ICV9J03f9/yxU
 FprbGD+dqdt1muP1VFGPUJKlCJZJQtBZtH1wXKKNO3U92hiExCF/1LgCkChHZm58/skJ
 c39v2CAVrlbZ5NH4ksghAc9FDOosX56s8hhX3DUCR3AZ9445uzQXOeoj9k4XVBRbYSNv
 +VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e5x1ZjLFt2D7tDxJkUBVGLXNcKm1tzU4wK9evqtEkww=;
 b=TmX+1lPDfzAomdtlw53SVzjUVzJILKN/LiXL4DD2PQ8p9pTbcuLDpii/jtlJRUeOkn
 pDwczxa9guBeWNXkRFUTTKLZU4OyrZhC6M3BD+5sVbWCqEfQOiy1P78Dc2xXJZVhur5E
 Iadu1uo5Kfj/u4pkEVZremGIbQevGEpI4JlACVSZzlki6dAuyHbdAfK8xdepVOw0ZX65
 9FWfZIRqkGwoYdHDBDqoLzhtfJFeuZ5uBfxv1h9qApdhwH4ue4uy5rdFIAOoIcSLGqi4
 qacmOQE8OsC9jUI/VRy1VBmheYm+BjQcVpO/Cz6I+ZpGiS+vPbNCAitj+BdYkA7OZXJB
 l3Bw==
X-Gm-Message-State: AOAM533vOZ9iC38CjSQst23z+PfKhlS2MHoEQlR94TFpkBJl9NvwBfXl
 yYlMwgjYgBV/uRyc07cT0WQoUeYccVHLE1AnaOcuUg==
X-Google-Smtp-Source: ABdhPJzikiVI8vcao0kj+q441azYFjZ6pqZrjkhHa3ehGwijjFUBuob39jPpZnmU8LWbI38sHbTYQoddgoE2n4/7fKo=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr13978796otg.179.1639182944229; 
 Fri, 10 Dec 2021 16:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
 <20211210174819.2250178-3-jagan@amarulasolutions.com>
 <CACRpkdb4JGCNyjncqgh8=3wWi4BRCqGNuLyTBRzLiVLK38UzqA@mail.gmail.com>
In-Reply-To: <CACRpkdb4JGCNyjncqgh8=3wWi4BRCqGNuLyTBRzLiVLK38UzqA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Dec 2021 01:35:32 +0100
Message-ID: <CACRpkda=yAk9kQ20ey+am7xjuVDvgDcup6B5vxb3WeuzMiy+kQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: bridge: Switch to devm_drm_of_get_bridge
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 11, 2021 at 1:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Dec 10, 2021 at 6:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:

> > -               dev_info(dev, "connected to panel\n");
> > -               d->panel = panel;
>
> How does this assignment happen after your patch?
> I'm using that...
>
> devm_drm_of_get_bridge() needs some more argument right?

Actually it is only used in unbind right below:

       if (d->panel)
                drm_panel_bridge_remove(d->bridge_out);

If it is not needed at all after your patch (because devm removes
the bridge) then also delete this code, and delete the
struct drm_panel *panel from struct mcde_dsi at the top
and possibly also drop the header #include <drm/drm_panel.h>
entirely.

Yours,
Linus Walleij
