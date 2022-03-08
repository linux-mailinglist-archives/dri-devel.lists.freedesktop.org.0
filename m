Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C44D1652
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFFB10E251;
	Tue,  8 Mar 2022 11:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2F310E251
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:32:58 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id p15so38533529ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 03:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4aTbXAelWOVgWCAyoW1GlVbHyxLTBA3LwDn7Z1eEzsE=;
 b=Z9RDnBv6PyqBxE7qtAHcaxAz/hnw1/8bDd2DYZ7twiZCLkyjijERAGLEUjpT5BJ22C
 2PU9cc1uPdOaaGxFJUNCIiVnHVsdh2M7QgN3azTHpDpDTgw9xNUgPbSBPFvnaJwOadv2
 ugINW9MfynKFdOYat7hGmPi5obhFIHfMAMuHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4aTbXAelWOVgWCAyoW1GlVbHyxLTBA3LwDn7Z1eEzsE=;
 b=OSYLIbghM+hU6ChN6FvBFmCdkQ/JHBCxW+cXkSxoZrS+JYs3En0WFOVZInyXJvBQoK
 EiLD3jtQW+HQ2J4iS5EmGvVnYDaBzCPCRNmO5YJCRH1s7RtoPwwBjar5kV32MyFtD2Q7
 I+NWVq89VFS/DHTKblCCPObU8hVqn70e9hHJxGXv8yQ2wmDFUui7WSdcJ1m7NZy70Z0l
 uwNRQdZcW8Q47mdpq++KKUepyxPonW8veymyjy6F+twmNb2U2cT7RIF5VK57UUJnohh1
 l1u2CugSwcrbZkC9Z9SWCCwJ6ik3iGw4N2W2DFs+fUkj6THuGbrUoj5sgAB8LYycST4l
 n34g==
X-Gm-Message-State: AOAM531Cof+6nabAIciLp4YpXXQC+3vowGeB4znZpUgvw61eqrijukYc
 mrLGnYTsMC/wk5BG9b+ZqviaX9EdkMIew9N7pBfi++oTs1cUuA==
X-Google-Smtp-Source: ABdhPJx+qOWc8+4XUrNr+y8VTeseVxbBw7kgz/Hkxsvw+1MzyqGsBjXIVvBl8eyA64Qq8KqYKmNbb82HqWRx8ZurcxQ=
X-Received: by 2002:a17:906:c59:b0:6b9:59d8:263e with SMTP id
 t25-20020a1709060c5900b006b959d8263emr13157138ejf.770.1646739176946; Tue, 08
 Mar 2022 03:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
In-Reply-To: <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 8 Mar 2022 17:02:45 +0530
Message-ID: <CAMty3ZBhbXgX5nsCPPUrYSjO2-J6LYd5D88u556gfXCMWpekug@mail.gmail.com>
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Tue, Mar 8, 2022 at 4:00 PM Marek Vasut <marex@denx.de> wrote:
>
> On 3/8/22 11:07, Jagan Teki wrote:
> > On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 3/8/22 09:03, Jagan Teki wrote:
> >>
> >> Hi,
> >>
> >> [...]
> >>
> >>>> @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
> >>>>    static int chipone_parse_dt(struct chipone *icn)
> >>>>    {
> >>>>           struct device *dev = icn->dev;
> >>>> +       struct device_node *endpoint;
> >>>>           struct drm_panel *panel;
> >>>> +       int dsi_lanes;
> >>>>           int ret;
> >>>>
> >>>>           icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
> >>>> @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone *icn)
> >>>>                   return PTR_ERR(icn->enable_gpio);
> >>>>           }
> >>>>
> >>>> +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> >>>> +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> >>>> +       icn->host_node = of_graph_get_remote_port_parent(endpoint);
> >>>> +       of_node_put(endpoint);
> >>>> +
> >>>> +       if (!icn->host_node)
> >>>> +               return -ENODEV;
> >>>
> >>> The non-ports-based OF graph returns a -19 example on the Allwinner
> >>> Display pipeline in R16 [1].
> >>>
> >>> We need to have a helper to return host_node for non-ports as I have
> >>> done it for drm_of_find_bridge.
> >>>
> >>> [1] https://patchwork.amarulasolutions.com/patch/1805/
> >>
> >> The link points to a patch marked "DO NOT MERGE", maybe that patch is
> >> missing the DSI host port@0 OF graph link ? Both port@0 and port@1 are
> >> required, see:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml#n53
> >>
> >> What is "non-ports-based OF graph" ?
> >>
> >> I don't see drm_of_find_bridge() in linux-next , what is that ?
> >
> > port@0 is optional as some of the DSI host OF-graph represent the
> > bridge or panel as child nodes instead of ports. (i think dt-binding
> > has to fix it to make port@0 optional)
>
> The current upstream DT binding document says:
>
>      required:
>        - port@0
>        - port@1
>
> So port@0 is mandatory.
>
> So I don't think any change is needed to this patch ?
>
> > Example OF-graph is on the commit message.
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/drm_of.c?id=80253168dbfd256bca97cf7f13312863c5a7f2e5
>
> It seems the current upstream DT bindings only support DSI hosts which
> do provide an endpoint, because port@0 is required per DT binding
> document. If you want to support the other options as listed in the
> aforementioned commit, then you would have to extend this driver and its
> bindings, but that is out of scope of this series.

Your comments seem to be valid, thanks.

Jagan.
