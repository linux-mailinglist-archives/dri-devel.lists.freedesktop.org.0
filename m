Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE415091A4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 22:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883AB10E2E2;
	Wed, 20 Apr 2022 20:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DB010E2E2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 20:52:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c10so3903418wrb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3JjZNfNNHQddbdE7dRgADOWUcU0u4ilUb+2W95f9XPQ=;
 b=SqaFUo4HiNRx7FlnZCFSLKKmNu8cokMvMms2aXqn9dVke/sHmWt61etrPD6pHpgYsm
 /JhAHP+U8ZD3zcXjm35+qPwUlHO04DPYzc7tenBl+r02Nssi/kPo5R3cdJuCymWyG470
 k8X0k798mZUyAGoFDLEY9lVSjpm+pBmccS6ZBRzO5SAGTlspbPaxP27AtVLvflgiBi+J
 ryd9TKY83fKMoJcscH3oj1G/r/tjKWkKk7cq4ckLHJ2xvva3zKZc/OULGOQqohYlmcGC
 nUCWrJ4Z+LSEryBIpsTpYJBKq/Lxl7/GJxzWRHKHj+eV26KIyD8Sj/+t5xXh00d588pH
 LvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3JjZNfNNHQddbdE7dRgADOWUcU0u4ilUb+2W95f9XPQ=;
 b=LIpZPzFsztFsRt3kyit0j/L1iNY89wgUd1q60r4Py/YWkqBqFEY2A6BP/E7IatOjqC
 sEuYKldAMfk2AEKgM0bp/b1KPBVrqKpFTAHnnSGMcMFpTA5VgBhvgX6OJA7GfTOHcpQI
 nbfsHSDIFrcnUFHe887zGFPYjSCLw0KKW1gO7gFilODHujJ64TuEUlDMuRi3w/mC8XW5
 WyiRMf41vHFWllJ3o1n7illd9k0qJKQhA7JE6HgPJoX0B9D7sQfOPWNZ3ldAQGsBfkCP
 /8KgTcO28cBAOWuwCrtvYQyUieOuslL+pVmHVR+iQtNcnYyR5v1b5UnUoHc/7LLUqGcA
 uRLg==
X-Gm-Message-State: AOAM5334F54g0mgL8ZtRZooeQiIBVKafl7C6wFzwJIJqeINWF9cST8C5
 jZ4J11N3rWtsqY3BExpCqnRKC36AJ2Q2/ukmENQ=
X-Google-Smtp-Source: ABdhPJzOo1DhAuiY+5Uhag0ddv/uQcNDfet82duBL/2Pe2QDUaGvHxuQDJtfJ4FBWifkOPS997BAlwzC7+B000PtZ7Q=
X-Received: by 2002:a05:6000:154a:b0:20a:9529:aa8d with SMTP id
 10-20020a056000154a00b0020a9529aa8dmr12838371wry.93.1650487920552; Wed, 20
 Apr 2022 13:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
 <YkZulslrzeurp43U@ripper> <YkatbpubQjwBWOiK@aptenodytes>
 <Ykx1yQGROqyiu/yJ@orome>
In-Reply-To: <Ykx1yQGROqyiu/yJ@orome>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Apr 2022 13:51:47 -0700
Message-ID: <CAF6AEGvD0VAA2u0LzcZg01O44GbWn7PWa3VPQF1LP-mL5syX1Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm: of: Properly try all possible cases for
 bridge/panel detection
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 5, 2022 at 10:01 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Fri, Apr 01, 2022 at 09:44:46AM +0200, Paul Kocialkowski wrote:
> > Hi Bjorn,
> >
> > On Thu 31 Mar 22, 20:16, Bjorn Andersson wrote:
> > > On Tue 29 Mar 06:27 PDT 2022, Paul Kocialkowski wrote:
> > >
> > > > While bridge/panel detection was initially relying on the usual
> > > > port/ports-based of graph detection, it was recently changed to
> > > > perform the lookup on any child node that is not port/ports
> > > > instead when such a node is available, with no fallback on the
> > > > usual way.
> > > >
> > > > This results in breaking detection when a child node is present
> > > > but does not contain any panel or bridge node, even when the
> > > > usual port/ports-based of graph is there.
> > > >
> > > > In order to support both situations properly, this commit reworks
> > > > the logic to try both options and not just one of the two: it will
> > > > only return -EPROBE_DEFER when both have failed.
> > > >
> > >
> > > Thanks for your patch Paul, it fixed a regression on a device where I
> > > have a eDP bridge with an of_graph and a aux-bus defined.
> > >
> > > But unfortunately it does not resolve the regression I have for the
> > > USB based DisplayPort setup described below.
> > >
> > >
> > > In the Qualcomm DisplayPort driver We're calling:
> > >
> > >     devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> > >
> > > and with the following DT snippet the behavior changed:
> > >
> > > displayport-controller@ae90000 {
> > >     compatible = "qcom,sc8180x-dp";
> > >     ...
> > >
> > >     operating-points-v2 = <&dp0_opp_table>;
> > >
> > >     ports {
> > >             #address-cells = <1>;
> > >             #size-cells = <0>;
> > >
> > >             port@0 {
> > >                     reg = <0>;
> > >                     dp0_in: endpoint {
> > >                             remote-endpoint = <&display_driver>;
> > >                     };
> > >             };
> > >     };
> > >
> > >     dp0_opp_table: opp-table {
> > >             ...;
> > >     };
> > > };
> > >
> > > Prior to the introduction of 80253168dbfd ("drm: of: Lookup if child
> > > node has panel or bridge") this would return -ENODEV, so we could
> > > differentiate the case when we have a statically defined eDP panel from
> > > that of a dynamically attached (over USB) DP panel.
> > >
> > > Prior to your change, above case without the opp-table node would have
> > > still returned -ENODEV.
> > >
> > > But now this will just return -EPROBE_DEFER in both cases.
> >
> > Oh that's right, the -ENODEV case was just completely removed by my change.
> > Initially this would happen if !of_graph_is_present or if the remote node
> > doesn't exist.
> >
> > Now that we are also checking for child nodes, we can't just return -ENODEV
> > when the graph or remote node is missing: we must also check that there is no
> > child node that is a panel/bridge.
> >
> > For the graph remote case, we can reliabily return -EPROBE_DEFER when
> > of_graph_is_present and the remote exists and of_device_is_available.
> > Otherwise we can go for -ENODEV. I think getting -EPROBE_DEFER at this point
> > should stop the drm_of_find_panel_or_bridge process.
> >
> > On the other hand for the child panel/bridge node case, I don't see how we
> > can reliably distinguish between -EPROBE_DEFER and -ENODEV, because
> > of_drm_find_panel and of_drm_find_bridge will behave the same if the child
> > node is a not-yet-probed panel/bridge or a totally unrelated node.
> > So I think we should always return -EPROBE_DEFER in that case.
> >
> > As a result you can't get -ENODEV if using the of graph while having any
> > (unrelated) child node there, so your issue remains.
> >
> > Do you see any way we could make this work?
> >
> > > I thought the appropriate method of referencing the dsi panel was to
> > > actually reference that using the of_graph, even though it's a child of
> > > the dsi controller - that's at least how we've done it in e.g. [1].
> > > I find this to be much nicer than to just blindly define that all
> > > children of any sort of display controller must be a bridge or a panel.
> >
> > Yes I totally agree. Given that using the child node directly apparently
> > can't allow us to distinguish between -EPROBE_DEFER/-ENODEV I would be in
> > favor of dropping this mechanism and going with explicit of graph in any case
> > (even if it's a child node). I don't see any downside to this approach.
> >
> > What do yout think?
>
> This patch has recently starting causing failures on various Tegra
> devices that use drm_of_find_panel_or_bridge() for the case where the
> output might be connected to an eDP or LVDS panel. However, that same
> output could also be connected to an HDMI or DP monitor, in which case
> we obviously don't want a DT representation because it's all
> discoverable.
>
> If I understand correctly, that's similar to what Bjorn described. In my
> case I was able to fix the regression by returning -ENODEV at the very
> end of the function (i.e. no matching ports were found and no graph is
> present).
>

All the qcom laptops/chromebooks with eDP bridge are also still broken
as of -rc3.. I need to revert the following:

67bae5f28c89 (drm: of: Properly try all possible cases for
bridge/panel detection, 2022-03-29)
80253168dbfd (drm: of: Lookup if child node has panel or bridge, 2022-02-02)

Since it is already -rc3 could we just go ahead and revert those two
and try again next time?

BR,
-R
