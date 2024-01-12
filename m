Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B287C82C330
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 16:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4B410EB29;
	Fri, 12 Jan 2024 15:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CDF10EB29
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 15:59:24 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-dbdb124491cso5223918276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1705075163; x=1705679963;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OOjkY6qLcUDJ6pAB2XOnTphDRYpUaH4ZDZBnldaqt/Y=;
 b=nhqWuzQnY53zHb8dgtb46NeChAi6XCSxwhwtsfsDnraAKCIdf1EUJXsS3EVDW+ftRy
 NRJoAGE0CvSTr2poyEpqqPNYl+Q6NmNLmkj23oF8gG7FpJmZywtnPxoMnkgugOaAapcM
 D4teJWKqcz6mybynGCjzQjiau7PAP3DerV+QZSOdzdjuLPd0cJYHTqFw6j3NyIFZpL+Y
 81pXbda+CAXu/5c61WKq5iuVZOeRj2MJwH6Ezdbwlqe6NqsYIkdKeGgNbHWBSCU4zVMp
 cRpuueVnyNbGElh0cSbnkRRk3k1nUrf2vc9LyFL41KlKKZSLwSc515l2YON2xFY8gYox
 RpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705075163; x=1705679963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OOjkY6qLcUDJ6pAB2XOnTphDRYpUaH4ZDZBnldaqt/Y=;
 b=rlBxla0ID8dTXZOhUXrTBbWHeVI1/ddgvLqtaaxvFD27SfgWfFPx0t8i7hewV9Gzio
 QBvMq4khmZPYR7+sYywKfArYGRfAAeclNqlLziTB/30NofQ3tkczcMV3AyU7jw4OuPOY
 SzSzruj+XCvV7t21XVULkZ9X8pYUMIJqDEwm85gSQ3lUuamRdf36CxTLZ9BqjXRgcHF/
 ZYvq3r8CcAtG4VEZ6y+V6f0d3cAWMdLmkdrcVrKgaYhg92BhRXR63Lkgg9CQmnIlm1K6
 PvtN6PyR0WMqK814fVoUIO8hNbNiZXaUXumdyoUzEXz1tGBoj5Ev7pVA0Ot1Vv7eUj0h
 yqFQ==
X-Gm-Message-State: AOJu0YwHZXmVBR1BHeDWt0AyH7NjOjnznSyEW4qcbYZFgs+SFESgwV6s
 XG/zUjdPWN1EhPh+e/3yGPfHsEUtbwlHzrf2goI0z4g+IfIx/g==
X-Google-Smtp-Source: AGHT+IHr3UudPwurXaz4S+dT72h2sVx6HX8ltwQ55glZrlvIRFVV+m1zueg0vrLt+5IAqr6Wt0L8KbJCDVH/13I+Tbw=
X-Received: by 2002:a25:8106:0:b0:dbf:3d61:8d03 with SMTP id
 o6-20020a258106000000b00dbf3d618d03mr551130ybk.28.1705075163182; Fri, 12 Jan
 2024 07:59:23 -0800 (PST)
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <CAPY8ntCs9EAYsxwjkscms3kqoC0N8+CcTHoyrG+gFMc0Mh=cwg@mail.gmail.com>
 <337mubsn42zlpuoqqvqmsjtdww4kg3x6lo6brdos5o6xgwjdwo@cxfad2pk2so2>
In-Reply-To: <337mubsn42zlpuoqqvqmsjtdww4kg3x6lo6brdos5o6xgwjdwo@cxfad2pk2so2>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 12 Jan 2024 15:59:06 +0000
Message-ID: <CAPY8ntDbM=j6YP3A5TNHoK73eTj0uUvnbAS0cZtxHgVoeuOFrg@mail.gmail.com>
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Fri, 12 Jan 2024 at 13:59, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi Dave,
>
> On Thu, Dec 14, 2023 at 02:43:37PM +0000, Dave Stevenson wrote:
> > On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > The i915 driver has a property to force the RGB range of an HDMI output.
> > > The vc4 driver then implemented the same property with the same
> > > semantics. KWin has support for it, and a PR for mutter is also there to
> > > support it.
> > >
> > > Both drivers implementing the same property with the same semantics,
> > > plus the userspace having support for it, is proof enough that it's
> > > pretty much a de-facto standard now and we can provide helpers for it.
> > >
> > > Let's plumb it into the newly created HDMI connector.
> >
> > To have such a significant proportion of the patch being kunit tests
> > when there was no reference to such in the commit text was slightly
> > unexpected.
>
> Thanks for your review. Does that mean that you would prefer the tests
> to be in a separate patch?

If there was a need for a respin, then I think ideally yes, or at
least a mention in the commit text ("Let's plumb it into the newly
created HDMI connector*, and add appropriate unit tests*").
Overall I'm not that fussed though.

  Dave
