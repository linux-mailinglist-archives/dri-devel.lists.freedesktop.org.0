Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360DAA02817
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 15:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCBA10E1F9;
	Mon,  6 Jan 2025 14:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mxqJ1DiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB1110E0BE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 14:33:42 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e3983426f80so19768477276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 06:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736173961; x=1736778761; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=parYT9glsnlPG/f3M8WwTH6w3s55tBA7mvmEK8sknGk=;
 b=mxqJ1DiFl05oOx0cxBkc0v58Vpgpttj6haolSsMC/KoBYeVGaQLjJvQWGEZA1Eiqtr
 ew6UPuXsnl6auEd3pUgcjLP2tZWDWj5vof6aIezjw1DEBO93KphXXK9fKODiD5GFueAL
 z+pFvy/InmoZ86BEzjkMVYKQYBD+46799eZoWkomiDKSnvRNbwoy68u6QVNFdcZWzyBu
 2u9C6fx5yyO66952LcofWujUNtomto4q+tJYwTaw6zb9qEdxuFArlV4kU3uZs30dHNXa
 cjVKSaEr5wFyRzJQDxbxzg/V+2o0fOziaNQtqJBFYxmDbaDXORVSjX6zpNeyi3MkgHrg
 Dkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736173961; x=1736778761;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=parYT9glsnlPG/f3M8WwTH6w3s55tBA7mvmEK8sknGk=;
 b=rrKgi/N5yT485uDxEPj1/hPGWwltRKVIQE0ZfTJMlOOYMCv1rd4ELnYFP0+yPOXKKC
 ww/OJtIIuWnSwQ38wMlpKev8sr7AuqM5cW+A82Os7F879uLpPok1f3DFPE2wowvlz1vI
 jDQzacAUHKOvLqhhAXpuOeJRaIMKqNzdZSPfeBEm0+poV7xJI8HZTt3kqoRgTnruBolk
 LEHOfATZajSH7qhntDVfcDWalONGKr1lU95CjF1wK4tSiWJSg1kLUklQUH5HhelzDTEv
 p9Y2lWATfJMmVqFZa1Rs9TXpeUNDFhVM0LfAfV4koPKIWoQnPYLU3rpz3uNnjot8L4ZR
 abxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8pG3J7bD2K5A+LAwCIJQohQ58ZFLR7EkCVsCpDfiuuRpt+A9MexNQuizXWabDzTVFR/lsjKKMfIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8D6wIRVSizpXhtPbV9Qy96x/dTU0ryzH0VA7Tb9d7g+gBNZTb
 dc6y2+TsKe+txETdRYhvZKkAU9boofF3ZwvFxnfrlSQ8Si+z3vkzBTpuYJV3BaJmHVqy0cYdWcM
 9JwNwblul2c3Xp8eX1SSCY8FsAerQrvY5jJ0Syw==
X-Gm-Gg: ASbGncuUXZ24khsuIBjJEGdmwfk06mLPeZzNReDxpbS21ZvFoBshExKjxYQifIb/0BC
 3SLFOWd0AwQnzhfp5ZFISriZ2e3gSjkTXC1JX7DEFdtEPHwhMkiZUWM5gTrkWvfaN2Yg3VA==
X-Google-Smtp-Source: AGHT+IFCYJMMVkJai/tt6UL5o1Vxw9p+5FHL/IKoKcM5cfmGtRMK7HxGPa/26NkrbF5OXzwxL3mZCjRDFbu+belYShA=
X-Received: by 2002:a05:690c:f84:b0:6ef:6d61:c258 with SMTP id
 00721157ae682-6f3f821384bmr340409657b3.27.1736173961192; Mon, 06 Jan 2025
 06:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
In-Reply-To: <20250106-vigorous-talented-viper-fa49d9@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 6 Jan 2025 14:24:00 +0200
Message-ID: <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Simona Vetter <simona@ffwll.ch>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Jan 2025 at 12:39, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> Most of these comments affect your earlier patches, but let's work on
> the API-level view.
>
> On Tue, Dec 31, 2024 at 11:39:58AM +0100, Luca Ceresoli wrote:
> > + * When using refcounted mode, the driver should allocate ``struct
> > + * my_bridge`` using regular allocation (as opposed to ``devm_`` or
> > + * ``drmm_`` allocation), call drm_bridge_init() immediately afterwards to
> > + * transfer lifecycle management to the DRM bridge core, and implement a
> > + * ``.destroy`` function to deallocate the ``struct my_bridge``, as in this
> > + * example::
> > + *
> > + *     static void my_bridge_destroy(struct drm_bridge *bridge)
> > + *     {
> > + *         kfree(container_of(bridge, struct my_bridge, bridge));
> > + *     }
> > + *
> > + *     static const struct drm_bridge_funcs my_bridge_funcs = {
> > + *         .destroy = my_bridge_destroy,
> > + *         ...
> > + *     };
> > + *
> > + *     static int my_bridge_probe(...)
> > + *     {
> > + *         struct my_bridge *mybr;
> > + *         int err;
> > + *
> > + *         mybr = kzalloc(sizeof(*mybr), GFP_KERNEL);
> > + *         if (!mybr)
> > + *             return -ENOMEM;
> > + *
> > + *         err = drm_bridge_init(dev, &mybr->bridge, &my_bridge_funcs);
> > + *         if (err)
> > + *             return err;
> > + *
> > + *         ...
> > + *         drm_bridge_add();
> > + *         ...
> > + *     }
> > + *
> > + *     static void my_bridge_remove()
> > + *     {
> > + *         struct my_bridge *mybr = ...;
> > + *         drm_bridge_remove(&mybr->bridge);
> > + *         // ... NO kfree here!
> > + *     }
>
> I'm a bit worried there, since that API is pretty difficult to get
> right, and we don't have anything to catch bad patterns.
>
> Let's take a step back. What we're trying to solve here is:
>
>   1) We want to avoid any dangling pointers to a bridge if the bridge
>      device is removed.
>
>   2) To do so, we need to switch to reference counted allocations and
>      pointers.
>
>   3) Most bridges structures are allocated through devm_kzalloc, and they
>      one that aren't are freed at remove time anyway, so the allocated
>      structure will be gone when the device is removed.
>
>   4) To properly track users, each user that will use a drm_bridge needs
>      to take a reference.

5) Handle the disappearing next_bridge problem: probe() function gets
a pointer to the next bridge, but then for some reasons (e.g. because
of the other device being removed or because of some probe deferral)
the next_bridge driver gets unbdound and the next_bridge becomes
unusable before a call to drm_bridge_attach().

>
> AFAIU, the destroy introduction and the on-purpose omission of kfree in
> remove is to solve 3.
>
> Introducing a function that allocates the drm_bridge container struct
> (like drmm_encoder_alloc for example), take a reference, register a devm
> kfree action, and return the pointer to the driver structure would solve
> that too pretty nicely.
>
> So, something like:
>
>
> struct driver_priv {
>        struct drm_bridge bridge;
>
>        ...
> }
>
> static int driver_probe(...)
> {
>         struct driver_priv *priv;
>         struct drm_bridge *bridge;
>
>         ....
>
>         priv = devm_drm_bridge_alloc(dev, struct driver_priv, bridge);

Ah... And devm-cleanup will just drop a reference to that data,
freeing it when all refs are cleaned? Nice idea.

>         if (IS_ERR(priv))
>            return ERR_PTR(priv);
>         bridge = &priv->bridge;
>
>         ...
>
>         drm_bridge_add(bridge);
> }
>
> Would work just as well.
>
> I also don't think we need explicit (at least for the common case)
> drm_bridge_get and drm_bridge_put calls for bridge users.
> drm_bridge_attach and drm_bridge_detach can get/put the reference
> directly.

As I wrote previously, I think drm_bridge_attach() might be too late for that.
It sounds like drm_of_get_panel_or_bridge() and of_drm_find_bridge
should increment the refcount, possibly adding a devres action to put
the reference.

> And we'll also need some flag in drm_bridge to indicate that the device
> is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> because now your bridge driver sticks around for much longer than your
> device so the expectation that your device managed resources (clocks,
> registers, etc.) are always going to be around.

-- 
With best wishes
Dmitry
