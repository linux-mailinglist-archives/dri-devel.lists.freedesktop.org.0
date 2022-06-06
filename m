Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85253E56F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1AA112471;
	Mon,  6 Jun 2022 15:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2CF112471
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:26:06 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id c2so19304739edf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 08:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jyxL+BH8EJsxCMAAiGGCnlS8DDdn5hMkob0TGGobKOQ=;
 b=MuDldpm1cvqxr24yvJdNMyzrGSjeMSKf+Bab5l69mqs7HvGPDxQ8Q1fe4WoY0H+G5r
 l9Bm1R3E5SCPxyYhhjozppQo48CSVDtR6gCNdS9FHy3q0sm0D6jQAvjcaS3bpbJGbp/P
 r1P/JbiX/z/W9OLBkbGU6jO4HkqX8KRdb+wms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jyxL+BH8EJsxCMAAiGGCnlS8DDdn5hMkob0TGGobKOQ=;
 b=JrV0vMk124bEUO8ZWyvEIrTwO/fioOHNeXGrKWkspLJTZpYiWg6Wpu2BKTMuF7NG28
 OGfuTzXXwq1MvX8FPLJRY6U1PMRx58cY1XjQo7KfUBjPNgEDjSgpMa6xDBfX/CYWwRxm
 i5Qu9TJi/d4u1PddOe8GNDi3JBBmBU+eDy2e+wN116jfYnwIwOFZCUERM0VTtwpM9grB
 wEAz8KfjuLTLRaMvCh+pIMcdmPlw/GME42S5mRnIWEIGVQWSiRDAm48UteFLVT8wFXGj
 U4om6eRjZykOvn72lx2eHXAF+th2IwRv9f5RdVz3Wi/4XdNe8z2wulPW4ab8TrgJASLN
 qwJA==
X-Gm-Message-State: AOAM530v2pxmdfEbyO4hhND8uuygVP4ERTvM6nfdIYbdSHfLAN1dP4gI
 3/IVylfghPkrunbp9OAiR86jcVgD59lYVkMyWcIAAw==
X-Google-Smtp-Source: ABdhPJxhQN3Xu1w0I4dYqU9lpzE49XRnQMcVNRaxVrPyusT/cmzzOtLDPj++i33HivGz/uQU6S5aCoH0N0W9ykdflaU=
X-Received: by 2002:a05:6402:84a:b0:423:fe99:8c53 with SMTP id
 b10-20020a056402084a00b00423fe998c53mr27231732edz.195.1654529164971; Mon, 06
 Jun 2022 08:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-5-hsinyi@chromium.org>
 <CAD=FV=XQbXK13M_X_AsqSPS+D_zQqLtAGFGz=YbHoPu3bcvhZQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XQbXK13M_X_AsqSPS+D_zQqLtAGFGz=YbHoPu3bcvhZQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Jun 2022 23:25:39 +0800
Message-ID: <CAJMQK-gWsMp24O2doGJtvgNCWQvjsx-6N5S9dx+PdTO1_H7Yyw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/panel: lvds: Implement .get_orientation
 callback
To: Doug Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 6, 2022 at 10:27 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > To return the orientation property to drm/kms driver.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > v2->v3: add comments for notice.
> > ---
> >  drivers/gpu/drm/panel/panel-lvds.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> > index 27a1c9923b09..239527409b00 100644
> > --- a/drivers/gpu/drm/panel/panel-lvds.c
> > +++ b/drivers/gpu/drm/panel/panel-lvds.c
> > @@ -102,15 +102,29 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
> >         connector->display_info.bus_flags = lvds->data_mirror
> >                                           ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
> >                                           : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
>
> Can you rebase your patch and send again? There's a context conflict
> with the above line because your tree is lacking commit 83c784e70036
> ("drm/panel: lvds: Use bus_flags from DT panel-timing property")
>
Rebased in v4.

> In any case:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
