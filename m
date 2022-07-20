Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF69C57BF51
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 22:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7F010F30B;
	Wed, 20 Jul 2022 20:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FEA10F30B;
 Wed, 20 Jul 2022 20:46:31 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z13so8202351wro.13;
 Wed, 20 Jul 2022 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yual+k0S39VkU2OsIy3nk2KtEx0KbJ5iYiilefMKUWk=;
 b=YX6HSpa8BFZGx9SFYAxxWa4VQZ6IhL2rt2/qeAzyorvrTkpAKTZOzR82GpNU5EWI/G
 MIH4tZbmTXwIV0Fqygekyy98+JQfEqOpH83XBp5CDlejy5JZzgRIwugncB1fMyurEEkf
 ghaEhrrD0URXHoWoDEa25+VE9zL5N643hCPhm8ngQPnW4+lWD+ZUGkXRZWMWde9SHshD
 ICkzMLrXvzCp0Sly+wJMCF84wmFIWcV4UubIfh5z2wLKnjSCZezdUlZUvHMaFwKnQjLK
 g5Kb6SBTGnU+jBGJQN+7CU9JoYdR4E61x9orT4A957oUKd+SRGDvnOa2xXj8LQeBrfAg
 L8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yual+k0S39VkU2OsIy3nk2KtEx0KbJ5iYiilefMKUWk=;
 b=B5s6TJd1CCoAn47/hd1A4i2RZLiMiaP/ovRM6ePjc/6YRp7hiUkPiMAO0sH/03xO/w
 6Uh9NkE/ju54ZxAJeVlFb3PHtU0c/5ZUmRcI8EEbOSGgf75NNSgi7fK7vnLV3FBEgtg+
 o/e3yWR7H0KWpYouRinYRJleFWSSIu9meIILyBsEe0Z4HmcNziVEyy6ol6yFNZ7mjSf7
 K17Bltat8P0tgN27DUM/2JEt72KoxxNvIqoaSrEvCB6mH4TQAaAZGKa9RpQdO800Tu8h
 4nbKi26cHdU0H6GYBJ3asLduxptpIDBtF2nzA+zfCr1Z6sed/9GhSF0qIeQbMcVturvK
 vHkg==
X-Gm-Message-State: AJIora+bqFLisd/yvv3D+4eeqwIa6ANkp2LMeF8WlSkgyjKci2cbeTVp
 RZzG3PPlBZjlz5lAM4oCLM+vDgp/0J3XhSXXMvA=
X-Google-Smtp-Source: AGRyM1tc+GHmhBMH4z23k38O3VsoI83iv8iT9CVz2a5wXrMvi8H++V0L9SkFW/C/gj+OeExTpBds1T3N7UWHN154Owo=
X-Received: by 2002:adf:e187:0:b0:21d:64c6:74f0 with SMTP id
 az7-20020adfe187000000b0021d64c674f0mr31131852wrb.221.1658349990406; Wed, 20
 Jul 2022 13:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
In-Reply-To: <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Jul 2022 13:46:52 -0700
Message-ID: <CAF6AEGt_J6f1T+-6KtyCrUJrY2fh7Sz10L1AV1FSe8hueGREtQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Set panel orientation when directly connected
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, patches@lists.linux.dev,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 8, 2022 at 8:25 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jul 6, 2022 at 12:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Set the panel orientation in drm when the panel is directly connected,
> > i.e. we're not using an external bridge. The external bridge case is
> > already handled by the panel bridge code, so we only update the path we
> > take when the panel is directly connected/internal. This silences a
> > warning splat coming from __drm_mode_object_add() on Wormdingler boards.
> >
> > Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
> > to set orientation from panel") which is in drm-misc
> >
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> I don't personally have objections to this, but (to my understanding)
> "the future" is that everyone should use panel_bridge. If we made the
> move to panel_bridge today then we wouldn't need to do this. In
> general I think panel_bridge would end up letting us delete a bunch of
> code...
>
> See commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with
> panel-bridge") for when this was done by ti-sn65dsi86.
>
> Then again, I spent a small amount of time looking into this and it's
> definitely non-trivial. Still likely worthwhile, but not worth
> blocking a tiny fix like this. It also should be fairly obvious that
> we should delete this when we switch to panel_bridge.
>
> Thus:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll assume that we'll just snooze this commit until drm-misc-next
> merges into a tree that msm-next is based on, which will probably be
> the next -rc1. If desired and Acked I could land this in
> drm-misc-next, but it's probably not worth it?

if you want to land this patch via drm-misc, which might be the
easier/faster route, then:

Acked-by: Rob Clark <robdclark@gmail.com>

BR,
-R
