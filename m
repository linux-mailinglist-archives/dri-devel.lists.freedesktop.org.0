Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4DE3F8CDF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 19:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9F06E874;
	Thu, 26 Aug 2021 17:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB0A6E874
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 17:22:08 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id u7so4053435ilk.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qKQjjsM4J8O5CgSWAuv+6gyXK0hCVd/AxIuqKbifVi8=;
 b=c5DyMLynQk1gn4WXQI278terFJZS6NE0EbIEyUor/Df3RXEATH9/MTDp2/GBb+5mPd
 Cq1tHPUfEhEuzDPPiFJPCHKQlf10zJxJ8h68Nq3ZH4yMP837kdjazwLbnbPymm7UH629
 yNB3j6kxRc7fWi+9sdt9TmGchIiCjY81a9kEE/puyORvKpHae0aSEORdzQH8MrPP5sX4
 DKHTC8exfKX1zbTSqdain05CO2fSIYxjZLcJpTGZSUFi6HUbPOD818vVvNqdFfL23gR5
 6tmJPrJlnZXKYj7oOXjDwniYn/FUdIYpC9iioYnzIwW+OOUsC+j/8HtK09Eu3q/HL3mq
 31mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qKQjjsM4J8O5CgSWAuv+6gyXK0hCVd/AxIuqKbifVi8=;
 b=DDVOMdnzWWEyr0HHAa/Zy9iHrgely/xyhLDcTm6n+eLTdk0zv6UUg30tFE+hCspRa6
 LAMH6wvUN0dcl4EjQjR0t8orM1H5JeUuTiScyPH1vZSFBhmt+eeGRhvaOFF7TQ7EX6+E
 +5voC5sJddOQeF2imqshy9B3yDyql1TOJCRT5DUrB2kPxXOJfJBKj+qP/+5A4Agd3z3z
 613YuMAlK+n1emFIhLDOf27hAqhAFOq5qtpwZjIpwRNkfct4iTdlEqBlBIIBi/dffxvo
 29w18F7YDDeICpWiC5kBiinRIxJsHxg9BbFKQt9lbbWyQB0/+vuz7WSFJT5Gt0nZ/F/5
 TCnA==
X-Gm-Message-State: AOAM5327nsDaPidO4n2rRWcd1c8xLvEE0sQwPz5PLsYQeqmH6Ckeid9C
 cwvf9DgaCcjNzEESN/zng11RdqSSCNqtRQNBKsXt4Q==
X-Google-Smtp-Source: ABdhPJzEP6d3k2PmiDaAY6pcR6U/TWQ8ba7bFfwnlUzENowhcCUx9XWHwgdsT9momgcLgJkyDpiLoam3ywnLdyU69E8=
X-Received: by 2002:a05:6e02:168d:: with SMTP id
 f13mr3602680ila.12.1629998527624; 
 Thu, 26 Aug 2021 10:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210826110311.613396-1-yangcong5@huaqin.corp-partner.google.com>
 <20210826110311.613396-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210826110311.613396-2-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 26 Aug 2021 10:21:54 -0700
Message-ID: <CAD=FV=WSQBpGTxYKur03VoR1=UN6MekbSxT_sOy7udxWXDG95g@mail.gmail.com>
Subject: Re: [v3 1/2] drm/panel: support for BOE tv1110c9m-ll3 wuxga dsi video
 mode panel
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 26, 2021 at 4:03 AM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Add driver for BOE tv110c9m-ll3 panel is a 10.95" 1200x2000 panel.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/Kconfig              |   10 +
>  drivers/gpu/drm/panel/Makefile             |    1 +
>  drivers/gpu/drm/panel/panel-boe-tv110c9m.c | 1303 ++++++++++++++++++++
>  3 files changed, 1314 insertions(+)

Breadcrumbs: discussion continues in the cover letter of the earlier patchset:

https://lore.kernel.org/r/CAD=FV=UFDRG9TJis28Wtsz9RVhp3Xk35stpLyY5ExLx3=8yxPQ@mail.gmail.com

Quick summary: discussion is leaning toward just supporting these new
panels with the existing `panel-boe-tv101wum-nl6.c` driver.

-Doug
