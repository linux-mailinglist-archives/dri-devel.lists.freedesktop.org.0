Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BCF41B3FA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 18:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1147A89E47;
	Tue, 28 Sep 2021 16:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE94989998
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 16:36:17 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id y197so28100699iof.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 09:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gbSliVYKfi6OEiKVNgoz9cY2l0rN0xMK5ahw6/GvjVU=;
 b=o/zB0ox1togRCdBOlkp7t1bpT5dFS6NC2FP0tyw0GBEGp35UzAs4nbCNCRRZYScvll
 44qimYjx/pglVnAoV4SCEA20ZqFYppRGfecLLu/LB3c5D2iNbAsc0h0O3vz9P3aTiNQV
 1Hf6EYRs1obAxdoe7pdpXROSReVvI9FAp/BoAi7BolKD6+Ai9r3/ZavA6UVApOI8o3Sd
 gmFgb9iNMOIawuaOR6XZMwai1UO2ZxXYX0k3tDSEEIPzGN+QMbAIgR2LDF6MfgiN12w5
 CUAWamk5aonhDhrSZlw1p3KSuK2qztXUChm/X4QNRuYoQ5P7qGTmPX1rl4isMV0SZg4G
 +XuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbSliVYKfi6OEiKVNgoz9cY2l0rN0xMK5ahw6/GvjVU=;
 b=IrSdJGbJS55X9mA8pBeF2aSAUfSZhdw+7xdVBOeubGQZr7Z0kiKS8Ry4rn2pGEx3b4
 NedmRKotU9yA3qXhR2dx0ihSQ2154eEsTXiKbA2xnhjoNZeoBR5zRHn6VIhKdeqAEcTr
 96lrswgMaP7nXEatFG3RWbebOYMusX8SV+ttRl+bPZ0KihvKLxgNCwAvxoYPJnQG44I7
 5kQDG8vxLprzU93zdwykQd4ZP7lkgKyef5+weQkYXt63YCJ3u/x1ke/8rABFj/LON/R8
 TgqZvTEOOvjl+u3B8bJMHapisZzk52g+cvA/M+emxSwIz9EAQWvChKqoBvx2IhFaew2K
 7sRA==
X-Gm-Message-State: AOAM531ricUz8LIv6/0Jzjpz+Keq8HG8bOF+oE512BAYc7DMSlY5SNAz
 onGj/EtdMl0D2mK3cGRs6bI9LC97zh8+EfZDTp5AOA==
X-Google-Smtp-Source: ABdhPJylFVNbSrJO5vtCtn0DiYbXwitWaqZB8kgndAaEIX7UG+4+79YvDaeJ7FzSYt3GFq0cdqfIY34kVx7Ii2h5z+U=
X-Received: by 2002:a05:6602:1346:: with SMTP id
 i6mr4593936iov.128.1632846976740; 
 Tue, 28 Sep 2021 09:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210914032252.3770756-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=W7uTQ0OZ_YV7UU-4pGinuX=huF1SkBxfNb2R8T1Dx5Tw@mail.gmail.com>
In-Reply-To: <CAD=FV=W7uTQ0OZ_YV7UU-4pGinuX=huF1SkBxfNb2R8T1Dx5Tw@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 28 Sep 2021 09:36:05 -0700
Message-ID: <CAD=FV=Wc=fbGm-H4-Hn-xb-qp4B7yDde-d-WAbTCSaEMnY3frw@mail.gmail.com>
Subject: Re: [v6 0/4] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
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

On Tue, Sep 14, 2021 at 9:26 AM Doug Anderson <dianders@google.com> wrote:
>
> Hi,
>
> On Mon, Sep 13, 2021 at 8:23 PM yangcong
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Compared to v5, squash this with patch #3 in the series in
> > drm/panel: boe-tv101wum-nl6
> >
> > yangcong (4):
> >   drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
> >   dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
> >   drm/panel: support for BOE and INX video mode panel
> >   dt-bindings: boe, tv101wum-n16: Add compatible for boe tv110c9m-ll3
> >     and inx hj110iz-01a
> >
> >  .../display/panel/boe,tv101wum-nl6.yaml       |   7 +
> >  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 745 +++++++++++++++++-
> >  2 files changed, 750 insertions(+), 2 deletions(-)
>
> Still seems OK to me and you carried my Reviewed-by over which is fine with me.
>
> Just to give others time to chime in, I'll reset my snooze and wait
> another couple weeks. If I don't hear anything then I'll work on
> landing.

OK, my snooze came back and nobody said anything. As promised I've
pushed to drm-misc-next:

93ee1a2c0f08 drm/panel: support for BOE and INX video mode panel
76d364d81b55 dt-bindings: boe, tv101wum-n16: Add compatible for boe
tv110c9m-ll3 and inx hj110iz-01a
18c58153b8c6 drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
c43da06c24a4 dt-bindings: drm/panel: boe-tv101wum-nl6: Support
enabling a 3.3V rail

I made some small changes when applying and I've noted them in the
commit messages. Summary here:

1. In the compatible string "inx," should have been "innolux,". The
later is what's documented for Innolux in:

Documentation/devicetree/bindings/vendor-prefixes.yaml

...neither Rob nor I noticed at review time but dim apply-branch
yelled and it was obvious what the fix was. I kept Rob's Ack in place.

2. I swapped the order of bindings and code. Bindings are supposed to
land first.

3. I fixed two whitespace issues (removed blank lines) as reported by
dim apply-branch.

-Doug
