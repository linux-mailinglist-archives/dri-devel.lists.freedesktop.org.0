Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5689A7282
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 20:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219FD10E114;
	Mon, 21 Oct 2024 18:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PQq72o7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5242810E17A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 18:39:28 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e297c8f8c86so4756742276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729535967; x=1730140767; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=34R/dNE8HXN8cXfAhV6Xc5PQ3mIsbC84k66fTKDzlwI=;
 b=PQq72o7yQo1iTgL7iUtfTIkLvGWi/8srTJvk/LkrwRj2xyCR3zw4lXrIYINVYdEpgv
 9n0lsP8NvbzXgJU4Zce7KTTFgTXlQjRcBIxywIWq8LzA6AlfV8Ut3PFBnA8eykLooyHE
 LqPwUW5YFh1ZoU7sOLdzzVcBaftbRS1IPxA2n7RlFtOeiZMHAy+ZgjLE9e+q0x3c/FTy
 YBwATgpTz67PtHd/B4Cpc4UZDRWzzjy8L23Xj7+T212/xwtHmMSSgsLvthKvWeDB8Kv7
 xeddPvUCx0YKriT+Mx5SlNwM5Du1VbcYwbbxdR8kKwbi4QQ1iTsRtpKUpeaiQg8yvtNj
 9BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729535967; x=1730140767;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=34R/dNE8HXN8cXfAhV6Xc5PQ3mIsbC84k66fTKDzlwI=;
 b=S/MtOQ5qaU0KBGDUK8yni1DZkpowxsKltiQEu3IZbH2/CmULdD/wnf4SGxyemnUi9x
 QjvLf6m90cp4aOPfJht1JaP0PGH3UkAtpO6Cl4VEmnJBqzIwWCtnrKNpMxerxXuued9p
 h8H3nJ1zhgFQAayndX0YoS3RuZYw2Z5a3aZFzfHKxBc6S8xfImAVrUcjrQ/x0zvFYp7b
 C3DbmKyKugh9fzdGsePrU3Zi2OPRA+sJQ4AqaPiD+ywhOZAU7+CnlIFM4Nm4TUbh1UU9
 CLBa38xPKfldgZdzIl//Tu4m/daonlbwuiwgf00qh0f5ByP5TgB4pD7297OOwnG+vdej
 D4KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU87uCP4ivdUST5ouR5dn6LeJHkhEYa06MU4VYD/7WAWQBevtUvW9nlLxfQEH1f6qUaMhNR06by9pE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv3Pc8WudoLX5nKVnKitNvlGtLK4ttHozqJfIIHvjivEbUUL7l
 oIzTNYaRoohl3NBC1/ArV3Nijn3Egfoc/oiFpmWHH+pmXi59PyeB/6FWl/pM7xyocsKEomHUyOF
 e++p2+861jDfxJT/Tx2qpOWevTD5Uw00QhXVv3g==
X-Google-Smtp-Source: AGHT+IFUtzy4nEfmeAZLA6OqFoY+qkzKSiEJKjCbr+Uwochx0DFN9spMl20epPP5wKuksfjY9jpL3cFJaHJiFCPwPnM=
X-Received: by 2002:a05:690c:46c7:b0:6e3:2c80:5413 with SMTP id
 00721157ae682-6e5bfc8e733mr126862177b3.23.1729535967399; Mon, 21 Oct 2024
 11:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-6-aradhya.bhatia@linux.dev>
 <m7t4hsa3lcszjbipxlypf655uspoxw3xfyy5jo3n3bnmqaiqcf@6wti5f477gve>
 <c8a42d96-c02e-4ce0-acd8-3fdc5eecd208@linux.dev>
In-Reply-To: <c8a42d96-c02e-4ce0-acd8-3fdc5eecd208@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 21:39:17 +0300
Message-ID: <CAA8EJprWwKyyh5JvsmXnJC7QbybxEmwnAceMBgUr96uGzEJMtQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] drm/bridge: cdns-dsi: Use pre_enable/post_disable
 to enable/disable
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, 
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, 
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
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

On Mon, 21 Oct 2024 at 20:07, Aradhya Bhatia <aradhya.bhatia@linux.dev> wrote:
>
> Hi Dmitry,
>
> Thank you for reviewing the patches!
>
> On 10/20/24 17:27, Dmitry Baryshkov wrote:
> > On Sun, Oct 20, 2024 at 01:35:30AM +0530, Aradhya Bhatia wrote:
> >> From: Aradhya Bhatia <a-bhatia1@ti.com>
> >>
> >> The cdns-dsi controller requires that it be turned on completely before
> >> the input DPI's source has begun streaming[0]. Not having that, allows
> >> for a small window before cdns-dsi enable and after cdns-dsi disable
> >> where the previous entity (in this case tidss's videoport) to continue
> >> streaming DPI video signals. This small window where cdns-dsi is
> >> disabled but is still receiving signals causes the input FIFO of
> >> cdns-dsi to get corrupted. This causes the colors to shift on the output
> >> display. The colors can either shift by one color component (R->G, G->B,
> >> B->R), or by two color components (R->B, G->R, B->G).
> >>
> >> Since tidss's videoport starts streaming via crtc enable hooks, we need
> >> cdns-dsi to be up and running before that. Now that the bridges are
> >> pre_enabled before crtc is enabled, and post_disabled after crtc is
> >> disabled, use the pre_enable and post_disable hooks to get cdns-dsi
> >> ready and running before the tidss videoport to get pass the color shift
> >> issues.
> >>
> >
> > Not being an expert in the TI DSS driver, would it be more proper to
> > handle that in the TI driver instead? I mean, sending out DPI signals
> > isn't a part of the CRTC setup, it's a job of the encoder.
>
> I haven't done a feasibility analysis of moving the CRTC bits of TIDSS
> into the encoder, but even if it were possible, it wouldn't solve the
> issue.
>
> The bridge_enable() sequence gets called _after_ the encoder has been
> enabled - causing the TIDSS's DPI (enabled from encoder) to still be
> up and running before the DSI has had a chance to be ready.

But then you can move CDSI setup to pre_enable, so that all setup
happens before encoder's (= DPI) being enabled.


-- 
With best wishes
Dmitry
