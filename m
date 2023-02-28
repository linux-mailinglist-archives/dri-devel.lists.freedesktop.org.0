Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1733E6A5B10
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 15:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD4F10E4C9;
	Tue, 28 Feb 2023 14:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2203710E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 14:50:32 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-536b7ffdd34so279473737b3.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 06:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KKdp4nkQEKQ7cUOJDiwmXh7PoHitk4oEoH3Q9MQjDXM=;
 b=JB1QHx2j3b/cX2y0x6Odj/lJVaVYS8682mJWoJrt/uHKkyFFRVMyQlZpD02Swdzo4C
 414teE/O1UWZv58up2pVyntrc3IpdswCkrwynkmmy3rd4zEpLj5jJIsm4bCcK3mjLqJ6
 iPy1llxyWNKIy9lv34NVGKHi89KShkj09WscU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KKdp4nkQEKQ7cUOJDiwmXh7PoHitk4oEoH3Q9MQjDXM=;
 b=vmD5TWql/a6qK+ONo2dEnmVEf1EBfXHEXfIErjE3FMb+bYtM78vym40Jw5u/Ks4YeT
 i084ZeqfFW/+kv54HzTO8zeP1s85WRMgJn5oNAyMocoC4u3kGMIKRxlH9ti9dmKzWRld
 y9MiHe+8VK5uEyd9pXNeuD3Q62R5vT3OvNxcq1xUIvlnpwPHfGrpAOwiUUoXJFIh8o9s
 divvrotcb7jhvUob2nOr96NQYq4oolObmrKqz2G2WC6o7tX7RNg8Eq2WSE0VRgaWRMn9
 wlp1hyWMbpF4F8ysFmpJtcof++v+XiBvAGrAmwGyAVYbwvWYomqmpIfmjQUiYLUCEFbx
 fFUA==
X-Gm-Message-State: AO0yUKWGotWus7bivCmW9BzSOOrs7qoPSN1jNxp/uKnebjV0nU7JdsEn
 Hn5qer+oOWHAyMOkC+4rwDxzctTfzXDcmG/GkPedNQ==
X-Google-Smtp-Source: AK7set9qPs6GM32Hpd5vlWQ17TAbMGQxBBZIS3TDjB5zrydEv4fShl5eDwE2P1wnct31EGmJM244y5PfPn4FfLu5jMQ=
X-Received: by 2002:a81:b664:0:b0:52e:cea7:f6e3 with SMTP id
 h36-20020a81b664000000b0052ecea7f6e3mr1774088ywk.10.1677595831183; Tue, 28
 Feb 2023 06:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-5-jagan@amarulasolutions.com>
 <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
 <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
 <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de>
 <20230228121046.jfq6dqyuphfmqemi@houat>
 <CAMty3ZAYAsShnBPRirLCb+S-Ysg5TaNP9OC3xszNWwtJH5VREg@mail.gmail.com>
 <20230228143506.x73ojgtuld2yzrv3@houat>
In-Reply-To: <20230228143506.x73ojgtuld2yzrv3@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 28 Feb 2023 20:20:19 +0530
Message-ID: <CAMty3ZCW=ZYtu3=W2GPm9PPJ6R6Ot5M+ntW=1si9WS8svSniWQ@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 8:05 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Feb 28, 2023 at 06:04:39PM +0530, Jagan Teki wrote:
> > On Tue, Feb 28, 2023 at 5:40 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Mon, Feb 27, 2023 at 08:41:22PM +0100, Marek Vasut wrote:
> > > > > If we go ahead with no need for DRM-managed helper at the moment, then
> > > > > find the panel hook in host.attach and then drop 2/18.
> > > >
> > > > The panel lookup must happen in .bind/.probe for exynos/imx respectively ,
> > > > that's really all that is required here. Then you can drop 1,2,3/18 and get
> > > > this series applied (I hope) .
> > > >
> > > > Can you implement just this one change ?
> > > >
> > > > There is no need to use drmm_* helper for now, that can be improved later if
> > > > possible.
> > >
> > > Yeah... The drmm helper isn't needed per se, but not using it will
> > > create a use-after-free pattern that is very easy to miss.
> > >
> > > I'd really prefer not to add a new helper that favors an unsafe pattern,
> > > but the driver seems to have a whole bunch of them anyway so it's not
> > > really a big deal.
> > >
> > > Which also raises another question: if it's code that is only really
> > > relevant in the context of that driver, why are you creating a helper
> > > for it in the first place?
> >
> > I can answer this question as I did add these helpers.
> >
> > 1. DSI-specific helper added since it is a good candidate for
> > common/helper code, based on the comments in V9 by Marek. V
> > https://patchwork.kernel.org/project/dri-devel/patch/20221209152343.180139-8-jagan@amarulasolutions.com/
> >
> > So, I have added this to the common drm_of code in V10.
> > https://patchwork.kernel.org/project/dri-devel/patch/20221214125907.376148-2-jagan@amarulasolutions.com/
> >
> > 2. DRM-managed discussion was commented on in V11 by you, so from
> > where all discussion moved.
> > https://patchwork.kernel.org/project/dri-devel/patch/20230123151212.269082-3-jagan@amarulasolutions.com/
> >
> > 1) helper wouldn't be an unsafe helper as it can reuse many DSI
> > drivers but 2) helper might be an unsafe helper at the moment.
>
> You're wrong. The first one is unsafe, for the same reason than the devm
> one you did is unsafe: the assumption everyone will get (and the one you
> implemented in your driver) is that the bridge reference will be put
> back at remove time.
>
> The DRM/KMS structures however are free'd only when the last user closes
> the file descriptor of the KMS device, so your driver functions will get
> called after remove has been called.
>
> If you are using the panel or bridge in any of your KMS hooks
> implementations, this is now a use-after-free.
>
> The drmm variant is safe though, because drmm actions run not when the
> device is removed but when the DRM device is last closed.

Okay. So, even if we manually use drm_of_dsi_find_panel_or_bridge in
mipi_dsi_host_ops.attach and drm_panel_bridge_remove() in
mipi_dsi_host_ops.detach KMS doesn't aware of it and is still unsafe.
- am I correct?

Jagan.
