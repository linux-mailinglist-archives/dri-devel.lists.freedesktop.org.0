Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CE57891A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 20:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B3211AE29;
	Mon, 18 Jul 2022 18:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F61211ADE9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=1k7ygd7TjVU/0OeLc8vN7pGFtYh4D8DdF58kU5beJu0=;
 b=VxuZdz71LN8l4OHMA30tuoiK0Nr/nISJyIbR4puSlqXqtLNJ3R9E8Ki5Y/fB//0ToLWnFzY6Ksx2v
 q15Tp+N3bjxKD5yb8cNSHhlL3Fn5bRvCp2wA20B/b8kotzJ8eyHD3W0jwgxlwEAS7y8yp9aYUCPRij
 D6w4iTRCC6nKQbdz1oAl9YkjdJBz4iHoVhli1MdsAc3QdBqKAH5OIBdeojkex0vvXW5oFokXNW+08W
 aIVUQfOp1MMmHhJ2Eo8oeIrL8vAjG4XGjO59HSG5vDKD2i9lhICvJrNx36s5unvTPFFMNLi1SgQk//
 otsKVYz1SQ0DcHOoKxmADC+NiOX02UA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=1k7ygd7TjVU/0OeLc8vN7pGFtYh4D8DdF58kU5beJu0=;
 b=jL/3JsawqxR14ggldJXwk5X9UoFKRKl4/PCzdAI+J8QjN2tXmDPVlJnoASEn5F/EpOlFEotQOERIw
 yI/yZMXCA==
X-HalOne-Cookie: fb423e04bf4d0af1a45399369f4e4409c2acada4
X-HalOne-ID: 7dbadd68-06c3-11ed-a6c8-d0431ea8a283
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 7dbadd68-06c3-11ed-a6c8-d0431ea8a283;
 Mon, 18 Jul 2022 18:00:22 +0000 (UTC)
Date: Mon, 18 Jul 2022 20:00:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 12/12] drm/todo: Add bridge related todo items
Message-ID: <YtWftDRPYcP5p+i1@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-5-sam@ravnborg.org>
 <CAPY8ntB2gXoUbUJhDLWVX3szaEKKKhnOO-qsKRZkMp1jDOt0Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntB2gXoUbUJhDLWVX3szaEKKKhnOO-qsKRZkMp1jDOt0Qg@mail.gmail.com>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philip Chen <philipchen@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On Mon, Jul 18, 2022 at 11:27:37AM +0100, Dave Stevenson wrote:
> Hi Sam
> 
> On Sun, 17 Jul 2022 at 18:58, Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Add todo in the hope someone will help updating the bridge drivers.
> >
> > v2:
> >   - Updated descriptions in todo.rst
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 10bfb50908d1..fbcc232e0bc1 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -480,6 +480,26 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
> >
> >  Level: Starter
> >
> > +Drop use of deprecated operations in bridge drivers
> > +--------------------------------------------------
> > +
> > +&struct drm_bridge_funcs contains a number of deprecated operations
> > +which can be replaced by the atomic variants.
> > +
> > +The following is more or less 1:1 replacements with the arguments
> > +and names adjusted:
> > +* pre_enable => atomic_pre_enable
> > +* enable => atomic_enable
> > +* disable => atomic_disable
> > +* post_disable => atomic_post_disable
> > +
> > +* mode_set is no longer required and the implementation shall be merged
> > +  with atomic_enable.
> 
> The dw-mipi-dsi and msm DSI host controller bridge drivers are
> currently relying on mode_set as a convenient hook to power up the DSI
> host prior to pre_enable of the bridge chain. Removing it is therefore
> going to break those.
> 
> There is a proposed mechanism to allow for the removal of this hack
> [1], but it's still waiting on R-B tags and/or discussion from bridge
> maintainers (gentle nudge as you are one of those maintainers).
I have over time gained some knowledge of how bridges works and have
applied a few patches - but the maintainer role belongs to others.
I just try to help a bit.

I will review the referenced series - could you then in return
review this series?
> 
> And do you mean merge with atomic_enable, or merge with
> atomic_pre_enable? atomic_pre_enable would be more applicable for
> almost all the bridges I'm aware of as they want to be configured
> before video starts.
Thanks, yes you are right. I will update the text to refer to
pre_enable as this is often the right choice. Looking at how many
bridges who implements mode_set, or are not yet atomic, this will
take a while before we can drop it.

	Sam
