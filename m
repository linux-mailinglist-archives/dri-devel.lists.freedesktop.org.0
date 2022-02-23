Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB474C18D4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C194D10EE27;
	Wed, 23 Feb 2022 16:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B3B10EE27
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 16:38:01 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qx21so53549936ejb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 08:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VPh9TCCU1FAJ6L0nw1r/yFMlEhqZ0iSV9KTRMCutr8E=;
 b=LqlwQWPOa8LXnqmHsYoTpK4pvbOYGbQQ34WteGLMrkIism5/Klc4XRpHAKol7aLTvb
 zlqRHuYFwYNvqS42HbRPQYvPlXyznC8WhT63ZydGLurfb6iWZaxbpd2x21IN2BjfpcVp
 BenWI+IUL6RI9X4xoURquHRBIn2YSHISDzImY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VPh9TCCU1FAJ6L0nw1r/yFMlEhqZ0iSV9KTRMCutr8E=;
 b=6pbINy6RbPZBQrbfxKjlJAVlPj4Ai0sQ/w/qrS7dJ5sYJadeLTwBOrFdIKSOSZfkQy
 WVKh9JDLcqtwUWt+zdHykazKqkKgprTE3KQyT+nIu4PYYL4DYkQokqG1WV8gw4QQKhOn
 8wSdsZYFPUBymCk52fSI378Io/cq47O0ejyFpoYXr1Wt8Olrx2A7D+onadZ39LdybKL0
 aVslgNw9FQVhMcNHUyX+e4N0nsOKeVD26EaTUnuvXMYNKDi4JHEUmNbgHVdvxSZs/TvT
 CXHeszefJkmtHGZjgpDv2Ddg0w9P1GkiJFoqCuHlqumZ4SY73H8B7jqOmUEEGhM7vAx7
 nqEg==
X-Gm-Message-State: AOAM533H+dc9sxHuVJwKOif7yMDDiTFyCsB0/g5C7VaV7DQhL77ZH9+D
 iEKV4GLfUtP7bUxAOmRNdMtM1vvoUOfn1fVn4io=
X-Google-Smtp-Source: ABdhPJyS9S/S+qfryn7zKDtnDVsQoHPjGdrQIYd9UcAoklUHF42z4/Pn/DcBfMgkdW8JsWE6Ll2TLA==
X-Received: by 2002:a17:906:6b8e:b0:6cd:7d22:e5b6 with SMTP id
 l14-20020a1709066b8e00b006cd7d22e5b6mr436902ejr.259.1645634279519; 
 Wed, 23 Feb 2022 08:37:59 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id w12sm68612ejv.43.2022.02.23.08.37.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 08:37:58 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id d3so24939432wrf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 08:37:57 -0800 (PST)
X-Received: by 2002:a5d:64ea:0:b0:1ea:8148:6b97 with SMTP id
 g10-20020a5d64ea000000b001ea81486b97mr308399wri.679.1645634277050; Wed, 23
 Feb 2022 08:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20220222141838.1.If784ba19e875e8ded4ec4931601ce6d255845245@changeid>
 <CACRpkdbQ9U22afR74YiZs95qCm7dnLb2k4_nT3Le__hJPpDGUw@mail.gmail.com>
 <YhXBIxbx63IXBU7L@pendragon.ideasonboard.com>
 <CAD=FV=UV+3PNF=O8Zv4UJK50gvDx=WHbamLLhH5ANZUBeCxjdQ@mail.gmail.com>
 <YhZY+FLTlv7V5BIB@pendragon.ideasonboard.com>
In-Reply-To: <YhZY+FLTlv7V5BIB@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Feb 2022 08:37:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UrNtsY0Adqd40ME1O74w2aaPWsey_ySGDQYEk-rLb4cw@mail.gmail.com>
Message-ID: <CAD=FV=UrNtsY0Adqd40ME1O74w2aaPWsey_ySGDQYEk-rLb4cw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Properly undo autosuspend
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Brian Norris <briannorris@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 23, 2022 at 7:55 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> > How about a middle ground, though: we could add a devm function that
> > does all the magic. Somewhat recently devm_pm_runtime_enable() was
> > added. What if we add a variant for those that use autosuspend, like:
> >
> > devm_pm_runtime_enable_with_autosuspend(dev, initial_delay)
> >
> > That would:
> > * pm_runtime_enable()
> > * pm_runtime_set_autosuspend_delay()
> > * pm_runtime_use_autosuspend()
> > * Use devm_add_action_or_reset() to undo everything.
> >
> > Assuming that the pm_runtime folks are OK with that, we could
> > transition things over to the new function once it rolls into
> > mainline.
> >
> > So this doesn't magically fix all existing code but provides a path to
> > make this more discoverable.
>
> Sounds like a good idea. I wonder if this could be handled by
> devm_pm_runtime_enable() actually. If a driver calls
> devm_pm_runtime_enable() and then enables auto-suspend, can't the
> runtime PM core reasonably expect that auto-suspend should be disabled
> at .remove() time ? The pm_runtime_disable_action() function could
> disable auto-suspend unconditionally (assuming
> pm_runtime_use_autosuspend() and pm_runtime_dont_use_autosuspend() don't
> need to be balanced, if they do, then I'll just go cry in a corner).

I like your idea. I think you're right that we can just leverage the
existing function. This yak didn't look to hairy, so I posted a patch:

https://lore.kernel.org/r/20220223083441.1.I925ce9fa12992a58caed6b297e0171d214866fe7@changeid

I guess now we see what Rafael thinks. ;-)

-Doug
