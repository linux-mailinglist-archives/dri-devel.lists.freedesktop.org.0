Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEF53E4F96
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 00:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040B389762;
	Mon,  9 Aug 2021 22:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADDF89762
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 22:56:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0E2C61051
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 22:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628549801;
 bh=le2FcSvENoj3hrefZj7sakOX2dkeEYx7FD9qxYK/jQw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NNdRq02GLg9wjwBo/6/2zDkDYGR/IYuRKV5VnR5FhoPiQHtFmuKri9PLx7IFg0ue4
 ydt7JJeO/VgUckeo8gCA8niT2BvgNBeb9cZy2Q8gx5m4J3ovw3aT3uA6FtcSsZHF1u
 z3Ac9HxKiZLTzDady/7PDQENVXDbxMRz5i4MaTUGgBCxWEweydUSSUWCgoebIKy3uO
 Ede9hKZDmfjRyd+p2zj5boO4FnEJqfiz6YGU9N1Ia93WkvHr/s4u2/wbiQqG/cvf0g
 otc1vh7cduQ+v83HKSEOq+15AEmN1D5HG/GvnA2KrtMv0ztlQ77ClxNIX0H1h0SBSD
 xcYEODZ+HNC5g==
Received: by mail-ed1-f50.google.com with SMTP id by4so8375740edb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 15:56:41 -0700 (PDT)
X-Gm-Message-State: AOAM533RcczSPkge4EgZCKF+9dan45JdBUp8UEFINBZtSUKBtUoKtNPD
 URzvCK79qvBEkNM8euPVqlA86HUOG9b5tMq5Aw==
X-Google-Smtp-Source: ABdhPJyJO6KX6JXEEKLEmaw2sV5nQHqxVwr/Ne6ZINqdDfnozeqZMjHNGDM6I7av1klZ4mqIiPfkWEepM1sEw9g3Wvo=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr927183edt.194.1628549800294; 
 Mon, 09 Aug 2021 15:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210730212625.3071831-1-dianders@chromium.org>
 <20210730142537.v2.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
 <1627911583.050984.918758.nullmailer@robh.at.kernel.org>
 <CAD=FV=U63qGf+RTOe=X+BYK06OuJM5N5Vy6zcA8+7ka1CFLwcg@mail.gmail.com>
In-Reply-To: <CAD=FV=U63qGf+RTOe=X+BYK06OuJM5N5Vy6zcA8+7ka1CFLwcg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Aug 2021 16:56:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKbZvQ_aXMMDUZL2sizy9LxJ-Z5Qw6WL-gOxBE8TCTyYA@mail.gmail.com>
Message-ID: <CAL_JsqKbZvQ_aXMMDUZL2sizy9LxJ-Z5Qw6WL-gOxBE8TCTyYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: drm/panel-simple: Introduce generic
 eDP panels
To: Doug Anderson <dianders@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@linux.ie>, Linus W <linus.walleij@linaro.org>, 
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Steev Klimaszewski <steev@kali.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Mon, Aug 9, 2021 at 4:20 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Aug 2, 2021 at 6:39 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, 30 Jul 2021 14:26:20 -0700, Douglas Anderson wrote:
> > > eDP panels generally contain almost everything needed to control them
> > > in their EDID. This comes from their DP heritage were a computer needs
> > > to be able to properly control pretty much any DP display that's
> > > plugged into it.
> > >
> > > The one big issue with eDP panels and the reason that we need a panel
> > > driver for them is that the power sequencing can be different per
> > > panel.
> > >
> > > While it is true that eDP panel sequencing can be arbitrarily complex,
> > > in practice it turns out that many eDP panels are compatible with just
> > > some slightly different delays. See the contents of the bindings file
> > > introduced in this patch for some details.
> > >
> > > The fact that eDP panels are 99% probable and that the power
> > > sequencing (especially power up) can be compatible between many panels
> > > means that there's a constant desire to plug multiple different panels
> > > into the same board. This could be for second sourcing purposes or to
> > > support multiple SKUs (maybe a 11" and a 13", for instance).
> > >
> > > As discussed [1], it should be OK to support this by adding two
> > > properties to the device tree to specify the delays needed for
> > > powering up the panel the first time. We'll create a new "edp-panel"
> > > bindings file and define the two delays that might need to be
> > > specified. NOTE: in the vast majority of the cases (HPD is hooked up
> > > and isn't glitchy or is debounced) even these delays aren't needed.
> > >
> > > [1] https://lore.kernel.org/r/CAD=FV=VZYOMPwQZzWdhJGh5cjJWw_EcM-wQVEivZ-bdGXjPrEQ@mail.gmail.com
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - No longer allow fallback to panel-simple.
> > > - Add "-ms" suffix to delays.
> > >
> > >  .../bindings/display/panel/panel-edp.yaml     | 188 ++++++++++++++++++
> > >  1 file changed, 188 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/panel-edp.example.dt.yaml: bridge@2d: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > \ndoc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/patch/1511822
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
>
> I think it's a dependency problem. No hits here:
>
> git grep aux-bus v5.14-rc5 -- Documentation/devicetree/bindings/
>
> ...but I get hits against "linuxnext".

Am I supposed to figure them out? A simple "'aux-bus' warning is fixed
by commit XYZ in foo tree' in the patch would help. Then I won't send
the failure email (I do review them, so it's not your free testing
service :) ). If you list the dependency then I'm not going to spam
folks with failures. If you don't then I will so no one applies things
without dependencies (as often they are not queued).

> Rob: I'm hoping that this can
> still be in your queue for review even with the bot warning.

Sometimes, but you don't have to guess. You can look at patchwork.
Though there is a latency between sending failure emails and my
changing PW state.

In any case, it looks good to me.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
