Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25291C6301
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 23:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163246E42E;
	Tue,  5 May 2020 21:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478D66E42E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 21:24:37 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id y10so991388uao.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 14:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xD9oC230/p7xdIyNhq/DI72VMWwLQ0pXEid/2VB2RIE=;
 b=mjnNLkkpMuBQM4TIComyfZixfgQHhE7tuFWValYOOMp5lib8ve2bEYRSkPoc6w3DfW
 x+MXBWW0cMkQbuC/d4jz2iCfV4rJYanNXcJZAoAycgsG6CSrTebEpKdKS1Jiumphdr4L
 iCabexNFAQFv7/oUMBhn7gE3sdcfhe6/b55/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xD9oC230/p7xdIyNhq/DI72VMWwLQ0pXEid/2VB2RIE=;
 b=T+O4NwSG5KcFZXwuNjZvVLmVOH3V0BpOvGBhPNlrRou8S8rxYSvFm+feVXcz3fB2LF
 +HAetFF2UceIUpAv9MVY8CQDhZQZnBGqnzWFqLQCRq1p0aady7HHVFJQPFoVOJzhNmYO
 Yqg6hmcHC/SnwQoTQi1NbnfGMIkN5qp5xmzo121vFo/Qo4hEh5vKn1iD5yqV7VVoYMeB
 m4SXbAQIsmfluny98VxLtLe/BkWSF/Ki6+QsrAzTfXT9hGPZ/2brfewPjbHi29fMw8et
 opvgtGiXZQ1nHRGhFt3BFfGWr/siwE2KEEzyNVPlQFUpauVxiHvup9dyyHEzceuhiktf
 cp3Q==
X-Gm-Message-State: AGi0PuaGGuKj9kjp+y5gnT6x9Vt7peru57KgEIuHglpvkLoQlkrOmRA7
 N4ryu74lWlsWBxklgC/lkP7idG1sk1g=
X-Google-Smtp-Source: APiQypLhuU+JOGIhrvGI5z7yg4gqM+wgyodkbc1aD1PUF14diXqc7fvMtg9HXNwtJcO6iAXAB5vOGQ==
X-Received: by 2002:ab0:6806:: with SMTP id z6mr4345931uar.0.1588713876137;
 Tue, 05 May 2020 14:24:36 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id 64sm105240vkx.12.2020.05.05.14.24.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 14:24:35 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id x136so122731vsx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 14:24:35 -0700 (PDT)
X-Received: by 2002:a05:6102:4d:: with SMTP id
 k13mr4884961vsp.198.1588713874617; 
 Tue, 05 May 2020 14:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200505082436.GD9658@pendragon.ideasonboard.com>
 <CAD=FV=WjUpwu5204K8yHzqsJv4vQX5S5CArH1Kj_kqjhZzTc9A@mail.gmail.com>
 <20200505210609.GA6094@pendragon.ideasonboard.com>
 <CAD=FV=UnGOYh8JX2=fEAqPN7wqANc0QevTirNO-WUDYMPqXcrg@mail.gmail.com>
 <20200505211401.GC6094@pendragon.ideasonboard.com>
In-Reply-To: <20200505211401.GC6094@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 May 2020 14:24:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WgRC-HViMxttF4VK+n48HNRuqAau8S7mgx6oSWsbZcgA@mail.gmail.com>
Message-ID: <CAD=FV=WgRC-HViMxttF4VK+n48HNRuqAau8S7mgx6oSWsbZcgA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering +
 polarity
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 5, 2020 at 2:14 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> > I'll add this documentation into the comments of the yaml, but I'm not
> > going to try to implement enforcement at the yaml level.
>
> Why not ? :-)

Because trying to describe anything in the yaml bindings that doesn't
fit in the exact pattern of things that the yaml bindings are designed
to check is like constructing the empire state building with only
toothpicks.

If you want to suggest some syntax that would actually make this
doable without blowing out the yaml bindings then I'm happy to add it.
Me being naive would assume that we'd need to do an exhaustive list of
the OK combinations.  That would be fine for the 1-land and 2-lane
cases, but for 4 lanes that means adding 256 entries to the bindings.

I think the correct way to do this would require adding code in the
<https://github.com/devicetree-org/dt-schema> project but that's
really only done for generic subsystem-level concepts and not for a
single driver.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
