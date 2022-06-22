Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E00555179
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 18:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860DB1136E1;
	Wed, 22 Jun 2022 16:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3211136E8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YZfT4wGMjS+w5JXzSrGh2Gc/p6tagSC8EnQnAKHsf80=;
 b=cTxh/EHWZuKNyai48Gk4qAXfvcYbdE8WeUPLyCUlmxLMqzCnpLe+7XVZU+M/B0MyAdhCmt92N7Z58
 nZCqJiyQhP03z2ip51yEi6e/ZGMUQ0mhshZuFegbbfMIMlHRG8u/NZw2K5YqfuwNDKlVYl3GWCsu/W
 0R47YMREWTflVmo9VmImUBIc1X3xiweHUGbwzgrxKmopq+Yaasm0wfSMyiiYeIEHMXTFYEKJU/Z7Xi
 GK4uhNbJ6iLcIOYEysxCUShklcIsC8SqQe/NCI5RhabX9CboBqigP+80zJj7figWd4zhEZ+f/0srjn
 7JeZ0k3SWRcXz/Y5DTchsYrX6VeOBoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YZfT4wGMjS+w5JXzSrGh2Gc/p6tagSC8EnQnAKHsf80=;
 b=sFcrJiKz0QZz9E/j2x+4XsYIySigZOqck7RHRvg4QPYF+glSsPPgB69CQgTRHXi/tYfmn8WwiB5Yx
 9kMZMZ2AQ==
X-HalOne-Cookie: 65a49dd9f9931d16ca2994feca41cbb9a675061d
X-HalOne-ID: afd11c86-f24a-11ec-a915-d0431ea8a290
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id afd11c86-f24a-11ec-a915-d0431ea8a290;
 Wed, 22 Jun 2022 16:45:13 +0000 (UTC)
Date: Wed, 22 Jun 2022 18:45:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 0/9] drm/bridge: ps8640 and ti-sn65dsi86 updates
Message-ID: <YrNHF4F/Kj/MlbAK@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <YgAc11fkN9m7QoEc@ravnborg.org>
 <165589244641.1149771.3796337289343458935@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165589244641.1149771.3796337289343458935@Monstersaurus>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

On Wed, Jun 22, 2022 at 11:07:26AM +0100, Kieran Bingham wrote:
> Hi Sam,
> 
> Quoting Sam Ravnborg (2022-02-06 19:09:11)
> > > 
> > > The code builds - but needs testing.
> > 
> > Hrmff, no it does not build. The fixes was by accident not included.
> > Will wait a bit for feedback before posting a v2.
> > 
> >         Sam
> 
> Do you have any plan to send a v2 on this series?
> 
> I have built up a series to extend the ti-sn65dsi86 which is now based
> on this. (which means I'll have an implied Tested-by: tag for these as
> well).

That is too good not to do something about it. I will give it a spin
this weekend - I do not have time until then.

	Sam
