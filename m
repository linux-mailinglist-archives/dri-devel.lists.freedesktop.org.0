Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2DA5785F4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 17:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F2914AE40;
	Mon, 18 Jul 2022 15:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3523814AE40
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 15:00:29 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id b11so21705341eju.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 08:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eooUgife9U1zCuw2O22tHhBUqpAOE+2WWVN89617T78=;
 b=Xp2fvghoQXNZ/NRtbCCeO0sQn+l8oFj9qukAp4tpdwjtw+AsEMhnZuct4E60MtuMNv
 eRnLq081IpXsvykbDKQPxXLpQIvVS2xwn/1pme8xcqTiKlMn09k4Nf/57WOBMJjBXw7e
 la42aLKRum7LOdsRtP/AqA1N7YvuNitBDoAAVXJYUyqTmyzAxUqtLEJ939ewB6BGHL+R
 SJcRSpLYhwr+7ZZK1V2Fa8Deil7lTMgP8TN9+oWd/7OnMMrWW+nOhbdpGAB7K0vjKSNg
 aGSJLh+nBznfa600eRiGgbWl0VU2ikq82Os4Xv6dBpkbhmVS5FQt1g2vroyYG9k/UrWr
 bArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eooUgife9U1zCuw2O22tHhBUqpAOE+2WWVN89617T78=;
 b=JlCyYA1NO5qE4yYFx912SWdgE3UEBULWCEDa1mq3tuauxvI3HsZzgYdyi4YtS60hBq
 Np9Uz5/MVk2Zpse+LHQTNbdrQV/2kP/3fKSejpiNH1eEVnr5n5GTmbXbbumPNdgTrUsk
 rHxeoNm99qOFrov+hFExqNgOokrMjTqec2gzQA0wBiL/gwNgBF84hJiz/hkf9RrTg8bb
 g9ibBMJMGBGpDycZFlnVhHc94F2MXZNztB1n3qoWNMhlyWmx1XZvrm7Zp5vFZtusswVe
 uoYo29agzn1snLw56tMGU43clcnmYiEJfIVGbxVbAQlhIpCeOMsTjgc8TgpctEJK3U/1
 7UAg==
X-Gm-Message-State: AJIora9NMrbzI6UapqoPrdKi9Wyt2mq4vl/6QSWGo5rUrsQ84+VbQ4JD
 /qHAmnQLFvgBTWD99cfzQXOusjLC4l0FcQ7lJxCAcw==
X-Google-Smtp-Source: AGRyM1sMiC4JS8YNSCN5xAUqwbxJ+wY89mLTG21IvGoCz2WcUfoL6mPwD6HdpXHN/Smsossn9TJpeFcJFtEsazwqZuU=
X-Received: by 2002:a17:906:9b14:b0:72b:7c96:58c9 with SMTP id
 eo20-20020a1709069b1400b0072b7c9658c9mr26685860ejc.648.1658156427681; Mon, 18
 Jul 2022 08:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220707012330.305646-1-windhl@126.com>
 <CAG3jFysYDVh2wk4VXePfZ_pwPvoa0EgP3Lv3pXXF6eu8W-Yt1g@mail.gmail.com>
 <1b561938.37f8.182112a6d7d.Coremail.windhl@126.com>
 <5bf4e0af.3a37.18211855fcf.Coremail.windhl@126.com>
In-Reply-To: <5bf4e0af.3a37.18211855fcf.Coremail.windhl@126.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 18 Jul 2022 17:00:16 +0200
Message-ID: <CAG3jFyu3JGqHgMMcd+ECKmqR3yJFMJrj82sGU9nRM4njEMWSow@mail.gmail.com>
Subject: Re: Re:Re: [PATCH] drm:bridge:analogix: Fix refcount bugs in
 anx7625_parse_dt()
To: Liang He <windhl@126.com>
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
Cc: andrzej.hajda@intel.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Jul 2022 at 15:35, Liang He <windhl@126.com> wrote:
>
>
> At 2022-07-18 19:56:09, "Liang He" <windhl@126.com> wrote:
> >
> >At 2022-07-18 19:54:18, "Robert Foss" <robert.foss@linaro.org> wrote:
> >>Hey Liang,
> >>
> >>
> >>On Thu, 7 Jul 2022 at 03:25, Liang He <windhl@126.com> wrote:
> >>>
> >>> There are two refcount bugs in this funcion:
> >>>
> >>> BUG-1: 'pdata->mipi_host_node' will be assigned a new reference with
> >>> of_graph_get_remote_node() which will increase the refcount of the
> >>> object, correspondingly, we should call of_node_put() for the old
> >>> reference stored in the 'pdata->mipi_host_node'.
> >>>
> >>> BUG-2: of_graph_get_endpoint_by_regs() will also increase the refcount
> >>> of the object and its new reference will be assigned to local 'ep0', so
> >>> there should be a of_node_put() when 'ep0' is not used anymore.
> >>>
> >>> Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
> >>> Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> >>> Signed-off-by: Liang He <windhl@126.com>
> >>> ---
> >>>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >>> index 53a5da6c49dd..f39b9be19eaf 100644
> >>> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> >>> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >>> @@ -1624,6 +1624,7 @@ static int anx7625_parse_dt(struct device *dev,
> >>>         anx7625_get_swing_setting(dev, pdata);
> >>>
> >>>         pdata->is_dpi = 1; /* default dpi mode */
> >>> +       of_node_put(pdata->mipi_host_node);
> >>>         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> >>>         if (!pdata->mipi_host_node) {
> >>>                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> >>> @@ -1638,6 +1639,7 @@ static int anx7625_parse_dt(struct device *dev,
> >>>                         bus_type = 0;
> >>>
> >>>                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> >>> +               of_node_put(ep0);
> >>>         }
> >>>
> >>>         if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> >>> --
> >>> 2.25.1
> >>>
> >>
> >>This patch does not apply on drm-misc-next, could you please rebase it
> >>and send a v2?
>
> >>
>
>
> Hi, Rob, may I rebase it with linux-next/master ?

Ideally not, sometimes this will cause issues where I can't pull your patches.

> As I cannot find drm-misc-next, or can you teach me how to rebase that branch?

git remote add linux-misc git://anongit.freedesktop.org/drm/drm-misc
git fetch linux-misc
git rebase linux-misc/drm-misc-next

>
>
> Thanks a lot,
>
>
> Liang
>
> >>Rob.
> >
> >Thanks for your reply.
> >
> >I will rebase it soon.
> >
> >Liang
