Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9598D9E5436
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 12:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E6010E5AF;
	Thu,  5 Dec 2024 11:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i4wgeoXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5658E10E5AF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 11:43:03 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e333af0f528so823833276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 03:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733398982; x=1734003782; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=foW0/KGDo9eGD4oVVo4WypJSTUBY0HMIRisvLT2/meA=;
 b=i4wgeoXKibTUdUb3Sa92XPYUXnbPqRy2iPOMctTY0XrZSh4GPL6zLmjAGuGKBc6glQ
 J2ozooMr8lHzFvzMBZftHPgF05KQE+y+jFMOgYrx7YDiOaBcK9m11o1C933SSE9aTka+
 3CLqLU6zgpsrwi02EFOVvoFwVp66omcey0I6ZAiqqYEl7A5vwEdCuJHnSkPW4NRLMUp9
 ImLNGKJkzySbiuomHoNX0i9i5LRrL+JBeL0KsZ8BfGiae6eoout2BocENID5sV52gCia
 355lqx2dEo7XCOX+BeAhJtu1IkKZETrjRCLtEOOQVYQBhgFJY+rNF/37RHFPZNaV0Or+
 7vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733398982; x=1734003782;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=foW0/KGDo9eGD4oVVo4WypJSTUBY0HMIRisvLT2/meA=;
 b=WENuwVfsTsldipSvu7WUN9/Yi97xrZ2cYPjw8DuTJJoOv4HMyQZfYR69PWlOPGTJkJ
 bVLPeT2XpV36RotIRxfPHbgcILuKhkifM3lwXWUpMS7jcQig5WUcsjAKGh9+kLWjx71q
 6xudS1xPgqMjZEjalCbV4oe0zNrYXT89y2zvform4swezPTQqf7MwISsHSYppExiOwow
 KIq7YogS5RLb2IRI8LTFoGleYAS1gKtFIJ4+ipWC11lQTowiJpK+jKuwvGQ4DDlrZuTg
 lShOYbdA87PuJDyup40JgPWHXc31j764uMKeKbkVU4le3k6iKTMzNnfQeEBgaaCQDZvK
 LMmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXujON5Fo5nYLYXYcxOdjoqVkxBsz6z00rNL6KlfD1mIsM4ORX8o//Yjr6qsc7KnxM3bOH5sZWCUoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4QP+qMKvyIIIKvXEUUp68ipd0+zfOOVVITq2/g3X4vozBTsnL
 P+d4g2A1P1wCQnidslXTNbfdTZJTMDW38crh1Aav5tt5FnN/9U8mysQBTGqFtwFPc91bvwkx+8x
 RO0iZ8a/lKbwoer0wazgd8ilgSfYc0lWVpBscCQ==
X-Gm-Gg: ASbGnctH4E/81NLNZPylNk8BJ/iE4plVpXl9VJa0PXKP7vEzFr1eJPYHIDmCfrJrHVI
 Xz/UmuYu+ql2cFT7Jc7L4+kWbKFuaEYKC2XjQ1CL9ayZebw==
X-Google-Smtp-Source: AGHT+IEHe0hEqVxHW1W6LA/XnWI/0yeqMuF4kFnDKLb5IX3EJI4UID7Ltgg79MyMh35EoVOtfkZnRY3ZbH01erDTs/A=
X-Received: by 2002:a05:6902:2b07:b0:e39:8d52:e308 with SMTP id
 3f1490d57ef6-e39de228e92mr7181180276.26.1733398982302; Thu, 05 Dec 2024
 03:43:02 -0800 (PST)
MIME-Version: 1.0
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <hd2kom5acz47c3mkjuauxhauahkt7vq2qoilppwn34iidldhos@rb5ydcayhtlj>
 <054a0278-428f-49cb-b0f0-182c5bb3b61b@nxp.com>
 <TY3PR01MB113469CCF62FCC801F15C6B2286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <3243b983-2f22-4254-b7e6-0f7ef0ae725c@nxp.com>
In-Reply-To: <3243b983-2f22-4254-b7e6-0f7ef0ae725c@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Dec 2024 13:42:51 +0200
Message-ID: <CAA8EJpqAjx+K2GdKt=gLxsETa7nvH57f3RVbhhL6EftiN_8EuA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
To: Liu Ying <victor.liu@nxp.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 "tomm.merciai@gmail.com" <tomm.merciai@gmail.com>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Thu, 5 Dec 2024 at 11:01, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 12/04/2024, Biju Das wrote:
> > Hi Liu Ying,
>
> Hi Biju,
>
> >
> >> -----Original Message-----
> >> From: Liu Ying <victor.liu@nxp.com>
> >> Sent: 04 December 2024 03:43
> >> Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
> >>
> >> On 12/04/2024, Dmitry Baryshkov wrote:
> >>> On Tue, Dec 03, 2024 at 06:21:29PM +0100, tomm.merciai@gmail.com wrote:
> >>>> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >>>>
> >>>> Introduce it6263_is_input_bus_fmt_valid() and refactor the
> >>>> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> >>>> format by selecting the LVDS input format based on the LVDS data
> >>>> mapping and thereby support both JEIDA and VESA input formats.
> >>>
> >>> For the patch itself,
> >>>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> A more generic question: is the bridge limited to 4 lanes or does it
> >>> support 3-lane or 5-lane configurations?
> >>
> >> According to ite,it6263.yaml, the bridge supports all the data mappings(jeida-{18,24,30} and vesa-
> >> {24,30}) listed in lvds-data-mapping.yaml.  lvds-data-mapping.yaml specifies the data lanes(3/4/5)
> >> used by each of the data mappings.  So, the bridge supports 3, 4 or 5 data lanes.
> >
> > In Renesas SMARC RZ/G3E LVDS add on board, only 4 LVDS Rx lanes connected. The 5th one is unconnected.
> > What is the situation in your board Liu Ying?
>
> The adapter cards I'm using to connect with i.MX8MP EVK have only 4
> LVDS data lanes routed out.

What about the bridge SoC. I don't understand why the driver gets
limited by a particular add-on card.

-- 
With best wishes
Dmitry
