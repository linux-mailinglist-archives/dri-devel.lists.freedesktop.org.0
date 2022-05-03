Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3687E517B1F
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 02:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F4C10E5E8;
	Tue,  3 May 2022 00:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E4510E5E8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 00:03:35 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g20so18247989edw.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 17:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qlJAUMGYAP2sfhw3muK8IOz0vX6SzhMv8EiUYPTfbg=;
 b=finFp6cBU21LJ1YmXsE6j4apxxRe669GessTvnsh4YWJ9XQdWzD8Ui6Ys588YritxG
 yCFaD1UJJGuOUuMZk+vgupElOA0ELwnHlLKJKmr/W770GpXuDhK2GYZddx1WlSFgHLOl
 9Wa5AFZsB+z9hpR2M2rD0WxDolxZexIZ8eIMWu3FOj6eCQfVT0daoA7y3XepwVwq4M78
 cFG23B2FiH67A3kUNp56dfqz4n1lcVb/fsgvcryYHn7NVM/v0u0zvQ/xKm6NLjOmk6hv
 9MU/+E/fyGrjCQ2X/qo/bLfut9XOil6LTTtbXOSi0u7336c2FOKV5pZWBu4IKiId8EBo
 DrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qlJAUMGYAP2sfhw3muK8IOz0vX6SzhMv8EiUYPTfbg=;
 b=hUueHrd7i+Z6fS/xf7gwUZHy2R/G/w4zN1DOHQ3c1Pdcjqaq/cUdhh3CsiNTjF1hxO
 odd/rqlqv6tA/gMtbCqEuOpzNEt7dpR63OwwV1Ph+NItPUM7UXt8UGFlmj5q1ryWVN7h
 GjZ+k5SB/FI747x2A+176RbVSNbFiWm7mearIkMqXynvz22fnIrhLRNr6X8W3QDhluN0
 PqbAas8OPrqKuD5YHMTmdx5Jvb3nP2P2o8tTXNlCsMtegFl1qeEqPyZ6/eVpn6XsigRu
 8RyHzAQ8hZFmCRrO/fc8gfxCCjvrjgqIDeIPfrCfvOip6ZAA/yysZcpujaEzPR6iqksB
 /97Q==
X-Gm-Message-State: AOAM533uVE7b5GliooejTgowNtEQtqX0pIuGj9HavmmsAPrExHNZTfFk
 /8NMme8S3HthacWrcoh1s9LTE9AwdqcIqxssikBGCg==
X-Google-Smtp-Source: ABdhPJzekvQHsUyHer/iEJZt2iLvSmVooDPlrpgjZH6ut+yIqHxIbMmUDNKMsFyQEIajiy9F56uhnMqfwmfTXbJlsMw=
X-Received: by 2002:a05:6402:210:b0:41c:9ca7:7660 with SMTP id
 t16-20020a056402021000b0041c9ca77660mr16102347edv.145.1651536213533; Mon, 02
 May 2022 17:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
 <YmfYi5G7hMKLAH3T@pendragon.ideasonboard.com> <YmfoiD0r8MD/kr1N@aptenodytes>
 <20220426125401.yyrhg6aeafdjw4ad@houat>
 <20220426125544.mroteu3hvyvlyb6g@houat>
 <Ymft0SM5GNHXjkVb@aptenodytes> <20220426131944.b26rqqmk7gpcplbg@houat>
 <Ymf4nmQAkEciwyt/@aptenodytes> <YmhfsGAJjSmSPs/l@ripper>
 <YmjyEZs0ND2D9Yki@aptenodytes>
In-Reply-To: <YmjyEZs0ND2D9Yki@aptenodytes>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Mon, 2 May 2022 19:03:22 -0500
Message-ID: <CAOCOHw6QnJZZWmPCzF=tBidiuDrQ75YWPQhdujfmwRpqjOw4xA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 2:34 AM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi Bjorn,
>
> On Tue 26 Apr 22, 14:10, Bjorn Andersson wrote:
> > On Tue 26 Apr 06:50 PDT 2022, Paul Kocialkowski wrote:
[..]
> > > Bjorn, what do you think?
> > >
> >
> > I'm okay with the idea that it's up the driver to check that the output
> > port references an usb-c-connector - either before the call or upon
> > drm_of_find_panel_or_bridge() returning an error.
>
> Actually I'm starting to think might be wrong on this one: there's a
> display-connector bridge driver that should register a bridge, so
> drm_of_find_panel_or_bridge should work. Did you have that driver enabled?
>

I don't have this driver enabled, but that seems like it would solve
the problem when the remote node is a dp-connector.

Unfortunately in my particular case, I have a usb-c-connector. So I
don't see that I would be able to reuse this straight off.
But I assume that this is trying to say that the USB Type-C code is
supposed to provide a bridge for each of the connectors exposed by my
USB Type-C controller?

I've been building on top of drm_connector_oob_hotplug_event() to
achieve this (with the link in the other direction)...

Regards,
Bjorn
