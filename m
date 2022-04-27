Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8D9511669
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 13:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C5E10E3E0;
	Wed, 27 Apr 2022 11:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11B510E3E0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 11:52:44 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g23so1612664edy.13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 04:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FrT1A6ut1uHKtiSP9a1wbP1BfO/8mxv8g9Z5KDxbsgg=;
 b=D9kCHFcz6/5eS56jF4XO7+B8nsp/FXL//Gs7ZpwFJ3ITljvLViSfef0c1agsVezvvb
 TAoBp12GBo4zOFJ3Z1XOQWKGN/j4dDEFGn6C+dMW7e3K+adHJVTG7+gZKXbxjXswHIpK
 4zmg9dTBOqNWSubqRmBalWlXPzCfv1BVk54lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FrT1A6ut1uHKtiSP9a1wbP1BfO/8mxv8g9Z5KDxbsgg=;
 b=iHxfQbs/yAwMrySVCdcLf9FAXiIa1Mp0F9/lxs2Czv842LsOfqpK4HHRNtbousjZDC
 IIRWRQBhuBps/RKgCzWPMXb+obTJwenp/2ne2Qk9gPRPAg+yceU8Ycz2bebKk49A7tt+
 ElM2RoRECJON6YL1H1kIe1jCLyrk1+IgiWubJk9xsOgVXdmaSgbmtzbdRQoMeP7UmAMi
 j7J+/MiPSfqPWJ7k3SI7Bu3stgRsWLMAp8K5KN3zzFoXJxbR8xRiT1sxuVfeGnAWwOed
 tVhxevQUT/v35uixJDVnjAMiWGFNXFQ0xKsRijIdA3mYGxi6B78vISrJ1fazShnVauMO
 m5AQ==
X-Gm-Message-State: AOAM530uhln66Z1jkS15hCkMTO7uWJxwlgI4CF0tQ2XpeGw7uPXJDYsb
 bOAPdaHU6G56FVs4lXOtkYz2PSMoKbGCpeHjJoacUA==
X-Google-Smtp-Source: ABdhPJzYWsmTaAC0VH47hY2rZx4yVkhqdbfMoHddMAJ4KislzzUG4O781iD+rcleMDYil+1uX244oGBdSJF69e/fHpg=
X-Received: by 2002:a05:6402:c9c:b0:425:d5e0:b69 with SMTP id
 cm28-20020a0564020c9c00b00425d5e00b69mr21314156edb.271.1651060363213; Wed, 27
 Apr 2022 04:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <CAMty3ZCLEMv4cqUcUGUAkLtH8tmh1WO582cDjZWynAifZJy=_w@mail.gmail.com>
In-Reply-To: <CAMty3ZCLEMv4cqUcUGUAkLtH8tmh1WO582cDjZWynAifZJy=_w@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 27 Apr 2022 17:22:32 +0530
Message-ID: <CAMty3ZAkw0rssCzR_ka7U9JeoGxJr5JPM7GWDfd1dob9goL-BQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
To: Maxime Ripard <maxime@cerno.tech>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 12:29 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Thu, Apr 21, 2022 at 1:54 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > + Linus
> > > + Marek
> > > + Laurent
> > > + Robert
> > >
> > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > bridge")' attempted to simplify the case of expressing a simple panel
> > > > under a DSI controller, by assuming that the first non-graph child node
> > > > was a panel or bridge.
> > > >
> > > > Unfortunately for non-trivial cases the first child node might not be a
> > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > DisplayPort, or an opp-table represented before the panel node.
> > > >
> > > > In these cases the reverted commit prevents the caller from ever finding
> > > > a reference to the panel.
> > > >
> > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > > panel or bridge")', in favor of using an explicit graph reference to the
> > > > panel in the trivial case as well.
> > >
> > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > switched drivers.  Do you have any suggestions on how to proceed to
> > > succeed in those use cases as well?
> >
> > I guess we could create a new helper for those, like
> > devm_drm_of_get_bridge_with_panel, or something.
>
> I think using the same existing helper and updating child support is
> make sense, as there is a possibility to use the same host for child
> and OF-graph bindings.
>
> I can see two possible solutions (as of now)
>
> 1. adding "dcs-child-type" bindings for child-based panel or bridge
> 2. iterate child and skip those nodes other than panel or bridge. or
> iterate sub-child to find it has a panel or bridge-like aux-bus (which
> is indeed hard as this configuration seems not 'standard' i think )
>
> Any inputs?

Checking aux-bus with the sub-node panel can be a possible check to
look at it, any comments?

--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -244,6 +244,25 @@ int drm_of_find_panel_or_bridge(const struct
device_node *np,
        if (panel)
                *panel = NULL;

+       /**
+        * Devices can also be child nodes when we also control that device
+        * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
+        *
+        * Lookup for a child node of the given parent that isn't either port
+        * or ports.
+        */
+       for_each_available_child_of_node(np, remote) {
+               if (of_node_name_eq(remote, "port") ||
+                   of_node_name_eq(remote, "ports"))
+                       continue;
+
+               if (!(of_node_name_eq(remote, "aux-bus") &&
+                     of_get_child_by_name(remote, "panel")))
+                       continue;
+
+               goto of_find_panel_or_bridge;
+       }
+
        /*
         * of_graph_get_remote_node() produces a noisy error message if port
         * node isn't found and the absence of the port is a legit case here,
@@ -254,6 +273,8 @@ int drm_of_find_panel_or_bridge(const struct
device_node *np,
                return -ENODEV;

        remote = of_graph_get_remote_node(np, port, endpoint);
+
+of_find_panel_or_bridge:
        if (!remote)
                return -ENODEV;

Jagan.
