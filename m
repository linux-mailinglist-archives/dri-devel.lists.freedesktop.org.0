Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749623D5A79
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 15:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636B56E959;
	Mon, 26 Jul 2021 13:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BE86E95C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 13:41:04 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 27ecbc45-ee17-11eb-8d1a-0050568cd888;
 Mon, 26 Jul 2021 13:41:18 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 52681194B7A;
 Mon, 26 Jul 2021 15:41:19 +0200 (CEST)
Date: Mon, 26 Jul 2021 15:40:57 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v2] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
 features
Message-ID: <YP67aeAOIVgpMdca@ravnborg.org>
References: <20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YP1nmsofOs5KHre+@ravnborg.org>
 <CANMq1KD_6DoNR9PvO9wrpEQc5BDwx6952mwz0poCw=hu+HsUbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANMq1KD_6DoNR9PvO9wrpEQc5BDwx6952mwz0poCw=hu+HsUbw@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 MSM <linux-arm-msm@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Xin Ji <xji@analogixsemi.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 lkml <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

On Mon, Jul 26, 2021 at 08:38:18AM +0800, Nicolas Boichat wrote:
> On Sun, Jul 25, 2021 at 9:31 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > On Tue, Jun 29, 2021 at 07:47:21AM +0800, Nicolas Boichat wrote:
> > > Many of the DSI flags have names opposite to their actual effects,
> > > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > > MIPI_DSI_MODE_NO_EOT_PACKET.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >
> > Hi Nicolas,
> >
> > in this thread:
> > https://lore.kernel.org/dri-devel/20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid/
> > I see that several people added their Reviewed-by.
> >
> > Please either add the tgas if missing, or elaborate why you left them out.
> 
> Oh simple, I just forgot.
Yeah, know that feeling.
> 
> I regenerated the patch so it's a bit different from v1... Not 100%
> sure if I can add those, since those were for the overall patch:
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>.
> 
> Those 2 shouldn't be a problem:
> Reviewed-by: Xin Ji <xji@analogixsemi.com> # anx7625.c
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org> # msm/dsi
> 
> > I was suprised this had not landed yet.
> 
> Yep. Let me know if you want me to send a v3 with those tags.
Please resend a v3 with the tags.

	Sam
