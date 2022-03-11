Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB74D6984
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 21:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD8010EA6E;
	Fri, 11 Mar 2022 20:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB6610EA6E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 20:35:33 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id g1so19258267ybe.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 12:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nXu5FvclyoU3IQGtRTFEc/40irlUZmJmytCjKQRmSfw=;
 b=nEwheLqGl8CpuUJsliXrLQ8/W8qyFeQvwjZO49N9KrLF5ubJwyY+D4znXL5b2Ngbyn
 uP60A+dzMdiSE2dNmIt/iNr/MeKeHmXMC1Wl28kuQxUBUGrA8SYzcjCifNiyHFwxWjfQ
 EnaNgcxmPtTQiGJB8/r8cem8I39Xt5UYLZmlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nXu5FvclyoU3IQGtRTFEc/40irlUZmJmytCjKQRmSfw=;
 b=eMi5XJEyLFLz2i9CmHt9IEHwBTjumCrytHCmwe5M1ha2olc0e95mD1StTrUOnZYHT4
 em9bhkD/Gu3nX8SqaM5Acbu/PyDXGUfFaXtp0aVhRanlbGBAcmRpaEDkvAW2b1eAdJei
 +TieLkinOxIrsiut3ccIS0PXKDNlYvirWz77PNkpyZeaVf8blz4DcmMt1ZiPdTjht5rM
 dZHAdnDDkz/1Hil7Nw+AbU7uFjdvB/wy2iq3YonndQTKleafWNXZhrJdc3K32MK4aDyG
 oxy19CNvMcmfbne8ep/l4QSeFOm1wLgMaGBXz9edin4v1+0aDGuoFW3w5pEsh6BctjGs
 GayQ==
X-Gm-Message-State: AOAM530fx9t6GJKjpzGzDPnht4UsExWtuTtq4AL0Y2vWFoEmLUbdiUfE
 l9YVp9yzlm2eqf4SIFOuCyIcIkMi5Vus0KXNCYHxjw==
X-Google-Smtp-Source: ABdhPJzjB/bOZmuSxfo3eS9lg90aZ4c7jPTbHxw+ZDVTpKVs7he/nRQvmLURWDDngakxoh4DQMIi+6qqK3amLafJqYM=
X-Received: by 2002:a5b:787:0:b0:624:107a:6c45 with SMTP id
 b7-20020a5b0787000000b00624107a6c45mr9187162ybq.24.1647030932299; Fri, 11 Mar
 2022 12:35:32 -0800 (PST)
MIME-Version: 1.0
References: <20220308125140.e7orpvocrerr5xdv@houat>
 <dd68f569-7fe3-dc00-b2f0-536b066ec37a@denx.de>
 <20220308134921.zebs533xeazq46ts@houat>
 <1ac9057e-fb6d-02f8-78df-c6518fb6e897@denx.de>
 <20220308162158.j5czx7krscaeqtsy@houat>
 <423c5f19-7b7c-dbc7-7482-34a0537bec21@denx.de>
 <20220310105352.v7jqjchshaaajsmd@houat>
 <c60112b4-5095-11ad-0da4-c84bb30bf77f@denx.de>
 <20220310141807.5yqho4gloz4lrdjt@houat>
 <17281de1-1299-19ee-ece3-767ef7e8a32b@denx.de>
 <20220311162956.vm7qsrzauw7asosv@houat>
 <f232a522-88d5-8bee-1f68-193c3960c5c5@denx.de>
In-Reply-To: <f232a522-88d5-8bee-1f68-193c3960c5c5@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 12 Mar 2022 02:05:20 +0530
Message-ID: <CAMty3ZDh0dN8z5V3sQDhR6D9zxGOZtzN05JB2E7tRJ3JB9tmmA@mail.gmail.com>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Sat, Mar 12, 2022 at 1:32 AM Marek Vasut <marex@denx.de> wrote:
>
> On 3/11/22 17:29, Maxime Ripard wrote:
> > On Fri, Mar 11, 2022 at 11:36:58AM +0100, Marek Vasut wrote:
> >> On 3/10/22 15:18, Maxime Ripard wrote:
> >>> On Thu, Mar 10, 2022 at 01:47:13PM +0100, Marek Vasut wrote:
> >>>> On 3/10/22 11:53, Maxime Ripard wrote:
> >>>>> On Tue, Mar 08, 2022 at 10:41:05PM +0100, Marek Vasut wrote:
> >>>>>> On 3/8/22 17:21, Maxime Ripard wrote:
> >>>>>>> On Tue, Mar 08, 2022 at 03:47:22PM +0100, Marek Vasut wrote:
> >>>>>>>> On 3/8/22 14:49, Maxime Ripard wrote:
> >>>>>>>>> On Tue, Mar 08, 2022 at 02:27:40PM +0100, Marek Vasut wrote:
> >>>>>>>>>> On 3/8/22 13:51, Maxime Ripard wrote:
> >>>>>>>>>>> On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut wrote:
> >>>>>>>>>>>> On 3/8/22 11:07, Jagan Teki wrote:
> >>>>>>>>>>>>> On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrote:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> On 3/8/22 09:03, Jagan Teki wrote:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Hi,
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> [...]
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
> >>>>>>>>>>>>>>>>          static int chipone_parse_dt(struct chipone *icn)
> >>>>>>>>>>>>>>>>          {
> >>>>>>>>>>>>>>>>                 struct device *dev = icn->dev;
> >>>>>>>>>>>>>>>> +       struct device_node *endpoint;
> >>>>>>>>>>>>>>>>                 struct drm_panel *panel;
> >>>>>>>>>>>>>>>> +       int dsi_lanes;
> >>>>>>>>>>>>>>>>                 int ret;
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>                 icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
> >>>>>>>>>>>>>>>> @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone *icn)
> >>>>>>>>>>>>>>>>                         return PTR_ERR(icn->enable_gpio);
> >>>>>>>>>>>>>>>>                 }
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> >>>>>>>>>>>>>>>> +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> >>>>>>>>>>>>>>>> +       icn->host_node = of_graph_get_remote_port_parent(endpoint);
> >>>>>>>>>>>>>>>> +       of_node_put(endpoint);
> >>>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>> +       if (!icn->host_node)
> >>>>>>>>>>>>>>>> +               return -ENODEV;
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> The non-ports-based OF graph returns a -19 example on the Allwinner
> >>>>>>>>>>>>>>> Display pipeline in R16 [1].
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> We need to have a helper to return host_node for non-ports as I have
> >>>>>>>>>>>>>>> done it for drm_of_find_bridge.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> [1] https://patchwork.amarulasolutions.com/patch/1805/
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> The link points to a patch marked "DO NOT MERGE", maybe that patch is
> >>>>>>>>>>>>>> missing the DSI host port@0 OF graph link ? Both port@0 and port@1 are
> >>>>>>>>>>>>>> required, see:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml#n53
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> What is "non-ports-based OF graph" ?
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> I don't see drm_of_find_bridge() in linux-next , what is that ?
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> port@0 is optional as some of the DSI host OF-graph represent the
> >>>>>>>>>>>>> bridge or panel as child nodes instead of ports. (i think dt-binding
> >>>>>>>>>>>>> has to fix it to make port@0 optional)
> >>>>>>>>>>>>
> >>>>>>>>>>>> The current upstream DT binding document says:
> >>>>>>>>>>>>
> >>>>>>>>>>>>           required:
> >>>>>>>>>>>>             - port@0
> >>>>>>>>>>>>             - port@1
> >>>>>>>>>>>>
> >>>>>>>>>>>> So port@0 is mandatory.
> >>>>>>>>>>>
> >>>>>>>>>>> In the binding, sure, but fundamentally the DT excerpt Jagan provided is
> >>>>>>>>>>> correct. If the bridge supports DCS, there's no reason to use the OF
> >>>>>>>>>>> graph in the first place: the bridge node will be a child node of the
> >>>>>>>>>>> MIPI-DSI controller (and there's no obligation to use the OF-graph for a
> >>>>>>>>>>> MIPI-DSI controller).
> >>>>>>>>>>>
> >>>>>>>>>>> I believe port@0 should be made optional (or downright removed if
> >>>>>>>>>>> MIPI-DCS in the only control bus).
> >>>>>>>>>>
> >>>>>>>>>> That's out of scope of this series anyway, so Jagan can implement patches
> >>>>>>>>>> for that mode if needed.
> >>>>>>>>>
> >>>>>>>>> Not really? You can't count on the port@0 being there generally
> >>>>>>>>> speaking, so you can't count on data-lanes being there either, which
> >>>>>>>>> exactly what you're doing in this patch.
> >>>>>>>>
> >>>>>>>> I can because the upstream DT bindings currently say port@0 must be present,
> >>>>>>>> see above. If that requirement should be relaxed, sure, but that's a
> >>>>>>>> separate series.
> >>>>>>>
> >>>>>>> And another upstream DT bindings say that you don't need them at all.
> >>>>>>
> >>>>>> Which "another upstream DT bindings" do you refer to ?
> >>>>>
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> >>>>>
> >>>>>>> Yes, there's a conflict. Yes, it's unfortunate. But the generic DSI
> >>>>>>> binding is far more relevant than a single bridge driver.
> >>>>>>
> >>>>>> That seems to be the wrong way around, how can generic subsystem-wide
> >>>>>> binding take precedence over specific driver binding ?
> >>>>>
> >>>>> This is the binding of the bus. You're part of that bus. You're a child
> >>>>> node of that bus, but nothing ever mandates that your parent node uses
> >>>>> the same convention. And some don't. And since your bridge can be
> >>>>> connected to pretty much any DSI controller, you have to use the lowest
> >>>>> common denominator, not make up some new constraints that not all
> >>>>> controller will be able to comply with.
> >>>>
> >>>> It seems to me the ICN6211 DT bindings currently further constraint the
> >>>> generic DSI bus bindings, and that seems OK to me.
> >>>>
> >>>> Let me reiterate this again -- if someone wants to relax the requirements
> >>>> currently imposed by the ICN6211 DT bindings, fine, but that can be done in
> >>>> a separate patchset AND that needs DT bindings update. Furthermore, there
> >>>> are no users of this ICN6211 bridge in upstream DTs, so there is currently
> >>>> no bridge which would operate without OF graph using this driver.
> >>>
> >>> And let me reiterate this again: something that used to work for a user
> >>> doesn't anymore when your series is applied. This is a textbook
> >>> regression. I suggested a way forward, that you don't like for some
> >>> reason, fine. But pushing through a regression is just not acceptable.
> >>
> >> How can this be a regression if this mode of operation could not have ever
> >> been supported with valid upstream DT bindings in the first place ?
> >>
> >> Should we now require that kernel drivers somehow magically support all
> >> kinds of random broken DT bindings in addition to ones which pass YAML DT
> >> validation ?
> >
> > The thing is, as I told you multiple times already, it was broken from
> > the bridge standpoint, but not from the controller's. If it had been
> > correct for the bridge, it wouldn't have been for the controller. So,
> > same story.
> >
> > The only difference is that it wouldn't affect you, but I don't see how
> > it's relevant.
>
> I'm sorry, I do not understand this answer.
>
> >>>>>>> So figuring it out is very much a prerequisite to that series,
> >>>>>>> especially since those patches effectively make the OF-graph mandatory
> >>>>>>> in some situations, while it was purely aesthetics before.
> >>>>>>
> >>>>>> The OF-graph is mandatory per the DT bindings of this driver. If you
> >>>>>> implement invalid DT which does not contain port@0, it will fail DT
> >>>>>> validation.
> >>>>>>
> >>>>>> If this requirement should be relaxed, sure, it can and I don't think it
> >>>>>> would be hard to do, but I don't see why that should be part of this series,
> >>>>>> which follows the upstream DT binding document for this driver.
> >>>>>>
> >>>>>> If I cannot trust the driver DT bindings to indicate what is and is not
> >>>>>> mandatory, what other document can I trust then ...
> >>>>>
> >>>>> Oh, come on. Doing that, you also require OF-Graph support for the DSI
> >>>>> controller you attach to, and you can't require that. This is very
> >>>>> different from just requiring a property that doesn't have any impact on
> >>>>> any other device, and you know that very well.
> >>>>
> >>>> Currently the ICN6211 DT bindings DO require that kind of bridge.
> >>>
> >>> And while this wasn't enforced before, you make it a hard requirement
> >>> with this series. This is what changed, and what caused this whole
> >>> discussion.
> >>
> >> The current DT bindings already make it a hard requirement, so no, nothing
> >> changed here.
> >>
> >> Unless what you are trying to ask for is support for broken DT bindings
> >> which do not pass YAML DT validation by this driver, but that is very
> >> dangerous, because then the question is, how far should we support such
> >> broken bindings. What kind of broken is still OK and what kind of broken is
> >> no longer OK ?
> >
> > If it ever worked in a mainline release, it must always work. See:
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/ABI.html
>
> > As far as I'm concerned, it's the sole criteria. So to answer your
> > question, if it was broken but worked at some point, yes, we need to
> > keep supporting it. If it never worked, no, we don't.
>
> There are no users of this driver in any mainline release.
>
> DT is ABI, and ICN6211 DT bindings says port@0 is mandatory. If this
> driver worked with some broken downstream DT without port@0, then that
> downstream depended on undefined behavior which I cannot fathom how it
> can be considered part of kernel ABI. That downstream should fix its DT
> instead.

Yes, agreed that ICN6211 DT bindings say port@0 is mandatory. However,
marking port@0 (after fixing DT binding) with non-I2C-ICN6211 is still
valid and we can see many examples of adding a bridge as a child to
the DSI host (without port@0) and it is not broken DT binding at all
(at least when it comes to DSI).  You are correct and port@0 is
mandatory for I2C-ICN6211.

Since the driver and this series trying to support the non-I2C and I2C
based ICN6211 bridge. I think it is valid to make changes according to
this series - IMHO.

Thanks,
Jagan.
