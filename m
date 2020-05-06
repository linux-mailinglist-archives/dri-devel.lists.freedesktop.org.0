Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C61C64FB
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 02:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2034A89DD3;
	Wed,  6 May 2020 00:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E90789DD3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 00:19:04 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id j1so199775vkc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 17:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxf7PIfuQA1AmzwbgiAc6qi52bK5LTEy5mM67o299pg=;
 b=YP9DojNnvL0GKT59bxFJk7GMLrsEk2LCd5aowl6qLFcQdpPAxIs6zTVGg2i6fYhDJz
 dyvRxqWVH9vP7aAeBY2R+7ovwrMKFqgr+zf5hfdg2ome+cQL9T+tX2oEiMp15mZ3FxB7
 qL0Sg3ZHqsoiZp8InrBjMlJzG2kBeeYmEkBsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxf7PIfuQA1AmzwbgiAc6qi52bK5LTEy5mM67o299pg=;
 b=b2BFtACvmwppkP2Ao8qIhE/N7eDTu9tSEDPp0af/AsA0gpeJhxwysyuY56qVbWFh0Q
 3uGI+qiOGl7V/AUMo/Wq3Wn8tmBbIhIHAzhAHFEYQsoTR42lTXo8bw+89IgUheg0RZu0
 sVtHeMi8q2PeIPhzh4NZKog4Yjz/3zoe0BvdZ0+bkRbYKK89TVSDlrSRnwzD0Oltoq0B
 5zGAnYh8+Yl4lxIjiWj6qGoCiI/+rQSGjuda3IJdIeNof+2ZeyR3yTxSv1ZnEMK705LX
 u2Y+59+XslCnDliLmpjBkn6Z2C5xYwdvLkPo7igCdGDkuSBTMn9Nxorg5qIEeMqOLJhF
 otfQ==
X-Gm-Message-State: AGi0PubqxAfQsrQGmQ8mUnEj9lD+5vZKLZ6Afx0w9PEQmTrQTvBYCeXI
 CgKQzVitpHc2wT9MO/+7qt91sXet5PU=
X-Google-Smtp-Source: APiQypKp0X6a04hAvfO+shUPM6WdO68XnCpNZovvrsKPWfiS3V4/Ax7FTSRBaPNb631a4H5o9xqzdA==
X-Received: by 2002:a1f:a6d2:: with SMTP id p201mr5078434vke.7.1588724342290; 
 Tue, 05 May 2020 17:19:02 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id x25sm39833vso.5.2020.05.05.17.19.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 17:19:00 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id a5so18330vsm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 17:19:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4d:: with SMTP id
 k13mr5406597vsp.198.1588724340078; 
 Tue, 05 May 2020 17:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200505082436.GD9658@pendragon.ideasonboard.com>
 <CAD=FV=WjUpwu5204K8yHzqsJv4vQX5S5CArH1Kj_kqjhZzTc9A@mail.gmail.com>
 <20200505210609.GA6094@pendragon.ideasonboard.com>
 <CAD=FV=UnGOYh8JX2=fEAqPN7wqANc0QevTirNO-WUDYMPqXcrg@mail.gmail.com>
 <20200505211401.GC6094@pendragon.ideasonboard.com>
 <CAD=FV=WgRC-HViMxttF4VK+n48HNRuqAau8S7mgx6oSWsbZcgA@mail.gmail.com>
In-Reply-To: <CAD=FV=WgRC-HViMxttF4VK+n48HNRuqAau8S7mgx6oSWsbZcgA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 May 2020 17:18:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U8_Krob9oftJjzrYs1zrbLr9WZ-HSStv5_rbq9MpTChw@mail.gmail.com>
Message-ID: <CAD=FV=U8_Krob9oftJjzrYs1zrbLr9WZ-HSStv5_rbq9MpTChw@mail.gmail.com>
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

On Tue, May 5, 2020 at 2:24 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, May 5, 2020 at 2:14 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > > I'll add this documentation into the comments of the yaml, but I'm not
> > > going to try to implement enforcement at the yaml level.
> >
> > Why not ? :-)
>
> Because trying to describe anything in the yaml bindings that doesn't
> fit in the exact pattern of things that the yaml bindings are designed
> to check is like constructing the empire state building with only
> toothpicks.
>
> If you want to suggest some syntax that would actually make this
> doable without blowing out the yaml bindings then I'm happy to add it.
> Me being naive would assume that we'd need to do an exhaustive list of
> the OK combinations.  That would be fine for the 1-land and 2-lane
> cases, but for 4 lanes that means adding 256 entries to the bindings.
>
> I think the correct way to do this would require adding code in the
> <https://github.com/devicetree-org/dt-schema> project but that's
> really only done for generic subsystem-level concepts and not for a
> single driver.

OK.  Looked at your review of the .yaml and the "uniqueItems" is
probably the bit I didn't think of.  With that I can limit this but
it's still a little awkward.  I still haven't figured out how to force
data-lanes and lane-polarities to have the same number of items, too.
I'll add this as an add-on patch to my v2 and folks can decide if they
like it or hate it.

# See ../../media/video-interface.txt for details.
data-lanes:
  oneOf:
    - minItems: 1
      maxItems: 1
      uniqueItems: true
      items:
        enum:
          - 0
          - 1
      description:
        If you have 1 logical lane it can go to either physical
        port 0 or port 1.  Port 0 is suggested.

    - minItems: 2
      maxItems: 2
      uniqueItems: true
      items:
        enum:
          - 0
          - 1
      description:
        If you have 2 logical lanes they can be reordered on
        physical ports 0 and 1.

    - minItems: 4
      maxItems: 4
      uniqueItems: true
      items:
        enum:
          - 0
          - 1
          - 2
          - 3
      description:
        If you have 4 logical lanes they can be reordered on
        in any way.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
