Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC639B8F25
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 11:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A3310E993;
	Fri,  1 Nov 2024 10:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="luimrJye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6B910E993
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 10:27:27 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6e38ebcc0abso20996007b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 03:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730456846; x=1731061646; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ss7HqrCAEiDCK7gqRMfrbIK/DUBAZAaK1W9KPoORIq8=;
 b=luimrJyevJYHLaMBLCnLEWBVqWAQizB2rUnUQpZcF/JUbgch2mvwmv5IGiQxkhXWyu
 xy5gD4r0xEjnxmXEvV7+54MYcSm70U2UD5Sbm1vVaVa0iieScd5xPzdVAHFHst/2Lmme
 UX7Ww/d5ZzSiGh2qIeLD96b5Ebc4bnOKqWV39W59p+EtCoBkHUhKPKZEUOQCnicfdrGi
 nnTxmrZW5AaChVUeIN3SUCR98AAg1cLToYCYKMruy7PCMoJ5Q/3BPmeHz41bD9BcSDWe
 MFtTbHevUKXTATEu1oR16eRw5ACW6Wbo0pEIWgKPMZTR1JEemzk/S/lq0qwLHNNIcdaN
 gTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730456846; x=1731061646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ss7HqrCAEiDCK7gqRMfrbIK/DUBAZAaK1W9KPoORIq8=;
 b=kzwGlPxD6G9G4WPd4E8E6eYP5AmTG3jEYcaBPohnhSpvwnGfAAxMwrUCesVwDEXrkz
 4UPphHGpuZu8Cuyeczo0cw02Hx2Vg6fV5p2rp57yRpggTu5EfFf53aae7YALgAvFJUNW
 3WGxoS6jvnZk4w49+3lwpJPvRgvmwTRYCbIu2QBstaLRzGJ6a3PDQSJjMhw9sgdj0hFs
 BYQ1QNsehXUW1BKsEn3YlQVygoUs+DihAG25a3JiS/x+PYoRYwm9lVCvUYxOcydO+L2s
 MQo+rh08tA2mtruDP+FUxMdWQqdIykJgr6a2WTPk3fO94w7JjdIhlNhGThkJJeIIl/5z
 uSPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd2BD3QS8awXwhNhJJrwhxn8lnsTzK1eeJOcns/sQW+3/a4gZg++zBOd/vQY5K8UExoxyRCFoDGyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/bzRkavAdgLV4v0WA92Yjm2lBULK3NR/WC4+Uo/AZr85k6kpU
 5+9oUxkAPEiSDfrOnObQLpUqj1SQY8Cut0rNlkzW1XsXlfY0mT7PY7bi2C2Y0BN8aHEceLe9qoG
 bbBS2rtoGwCkKfBSY5ffDPpMZOZE6pEKO0jf1Vg==
X-Google-Smtp-Source: AGHT+IHqsmm863M+Us1qtGisvRlwff+vHDuYIqJfop4OczcmkVIeT6lVuYCgjUig4zLqPpFZkem2bNxaAPeuwbz870I=
X-Received: by 2002:a05:690c:fcb:b0:6e2:e22:12d9 with SMTP id
 00721157ae682-6e9d8aa1115mr220680307b3.35.1730456846182; Fri, 01 Nov 2024
 03:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <172951608323.1285208.3162107667310691864.b4-ty@linaro.org>
 <230b5910-6790-44cb-90ed-222bee89054d@linux.dev>
 <c2a4cc3a-2ffc-46f3-8636-238cd561f7aa@linaro.org>
 <751a4ab5-acbf-4e57-8cf4-51ab10206cc9@linux.dev>
 <ZyOvAqnuxbNnGWli@hovoldconsulting.com>
 <30fefafc-d19a-40cb-bcb1-3c586ba8e67e@linux.dev>
 <20241101092049.GJ2473@pendragon.ideasonboard.com>
In-Reply-To: <20241101092049.GJ2473@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Nov 2024 12:27:15 +0200
Message-ID: <CAA8EJprEDV2JViB9kQS2H1p=NgF+PcataEejC97DBo=aU5g5kw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, Johan Hovold <johan@kernel.org>,
 neil.armstrong@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Abel Vesa <abel.vesa@linaro.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Fri, 1 Nov 2024 at 11:20, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Nov 01, 2024 at 11:49:07AM +0800, Sui Jingfeng wrote:
> >
> > On 2024/11/1 00:23, Johan Hovold wrote:
> > > On Thu, Oct 31, 2024 at 11:06:38PM +0800, Sui Jingfeng wrote:
> > >
> > >> But I think Johan do need more times to understand what exactly
> > >> the real problem is. We do need times to investigate new method.
> > > No, I know perfectly well what the (immediate) problem is here (I was
> > > the one adding support for the of_node_reused flag some years back).
> > >
> > > I just wanted to make sure that the commit message was correct and
> > > complete before merging (and also to figure out whether this particular
> > > patch needed to be backported).
> >
> > Well under such a design, having the child device sharing the 'OF' device
> > node with it parent device means that one parent device can *only*
> > create one AUX bridge child device.
> >
> > Since If you create two or more child AUX bridge, *all* of them will
> > call devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0),
> > then we will *contend* the same next bridge resource.
> >
> > Because of the 'auxdev->dev.of_node' is same for all its instance.
> > While other display bridges seems don't has such limitations.
>
> Brainstorming a bit, I wonder if we could create a swnode for the
> auxiliary device, instead of reusing the parent's OF node.

This will break bridge lookup which is performed by following the OF
graph links. So the aux bridges should use corresponding of_node or
fwnode.

> This would
> require switching the DRM OF-based APIs to fwnode, but that's easy and
> mostly a mechanical change.

-- 
With best wishes
Dmitry
