Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E613875756
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 20:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E4C10F521;
	Thu,  7 Mar 2024 19:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DxPY7EkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A980110E7DF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 19:37:26 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dcc4de7d901so1216273276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 11:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709840245; x=1710445045; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D+atELKvQOOLnHOaCYsPXNofIf9HuHvn8BNu51WCFxw=;
 b=DxPY7EkKHS+ta0C8zYXyzurWxE8ie/KxNZ/7NTdvDBoLKcEHPjyjJBugznK1xQzl0P
 FcrCTrvTXjBidsTapr7UlJyKz0axCrcOiTn7QpQcQhtYH26YYhwSEPlC4wiUiUVmjpD7
 Nq9Zo28LQL+xtYFnsopAkNleWxJKsFf41vXqbQ5lqQ9ONY4xhEPP1U3zBG4zeeQryx7i
 d1OLIrnjplKsWag5T0lu9lteHf59AKIloj7ewHRVoaledNea55YHCH7iHluZeOCKlqjk
 E05CyeSLPe82GR7hSaCfdyyEf77V/5YVJarPzHIH4WcCXGARKgdhImyhPXldnrsq2/3t
 +z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709840245; x=1710445045;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D+atELKvQOOLnHOaCYsPXNofIf9HuHvn8BNu51WCFxw=;
 b=C6dIEPMZfD8OKd0P4pkT7UDZzknQGhrVt/tCY/LYffh52AdqD49dfN921rH2hMoMud
 yHmG2NJ0VdR13qm7DXU8YcJuc1mcAUg9rtUrwMQHEilrbuhj4vNrb2DXn3q94OYYGnt1
 MDWQr9fYXM4E21UC3z15mYwCjEkmwq6eYDYJcn6pVJhd4aFa3hBgN4bBZqQsktvnhXzM
 2dyOwXgQZxI2E3O6+4oHsqMf8KlQ8uEjnIxfY867gUzEtXy90KYwStXkD4sCesOkZpOe
 VkHI17QpfRmqqfeiDo3H8akvxQfZBImpOKb8tlCQZ0UXKCfL1mx+ZZatS2l74lkqkyui
 T2+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQCS/dDb32ImF2sTj1HIejF+L1YIL7xejgu412XLqM/2SN1Cm9ZLW97C0nLyNd9bEBtOV5cdbVwj6kZgz9iD2PaSnD2LSyI0dpOY9ORUwa
X-Gm-Message-State: AOJu0YykPnRvF6DjXzi58QRdOOn9EMV5PJ2ShG+PQhQmTgWVEsYVA7at
 BYvvjmpa20stpng7jmPa6vmyA6gMFPyCcAExBF0rQxzElZxIb3FxSNe704cJ8qJJ+C2A5/VN74j
 h1C9aeWJyaTGAGYlohFL+UiPG1H+Ypf3KWiBrnQ==
X-Google-Smtp-Source: AGHT+IFAnShZV5B8zjpb+Ymnm9dteFJx1LbcFdYtXwIKtOPBCLHsKmz4rnlqziHI0HmbJieqTl2MvvMl+PazihZSUw8=
X-Received: by 2002:a25:d502:0:b0:dbd:553d:9d6a with SMTP id
 r2-20020a25d502000000b00dbd553d9d6amr15441308ybe.40.1709840245408; Thu, 07
 Mar 2024 11:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
 <20240307172334.1753343-2-sui.jingfeng@linux.dev>
 <CAA8EJpp8tsHi0RhsJXG+r6nOsV3AUC_n6jNHL0Cr6Ku2h3NMog@mail.gmail.com>
 <45f59f31-1f03-4a96-adb6-25c7cdd5e8a1@linux.dev>
In-Reply-To: <45f59f31-1f03-4a96-adb6-25c7cdd5e8a1@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 21:37:14 +0200
Message-ID: <CAA8EJpqq1-cEke6wEFZFDnpz4tFBcL6HF3=Qtf-8Q3WbogLS8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: Add fwnode based helpers to get the
 next bridge
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Phong LE <ple@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, 7 Mar 2024 at 21:20, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2024/3/8 02:43, Dmitry Baryshkov wrote:
> >> +
> >>   MODULE_AUTHOR("Ajay Kumar<ajaykumar.rs@samsung.com>");
> >>   MODULE_DESCRIPTION("DRM bridge infrastructure");
> >>   MODULE_LICENSE("GPL and additional rights");
> >> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> >> index 3606e1a7f965..d4c95afdd662 100644
> >> --- a/include/drm/drm_bridge.h
> >> +++ b/include/drm/drm_bridge.h
> >> @@ -26,6 +26,7 @@
> >>   #include <linux/ctype.h>
> >>   #include <linux/list.h>
> >>   #include <linux/mutex.h>
> >> +#include <linux/of.h>
> >>
> >>   #include <drm/drm_atomic.h>
> >>   #include <drm/drm_encoder.h>
> >> @@ -721,6 +722,8 @@ struct drm_bridge {
> >>          struct list_head chain_node;
> >>          /** @of_node: device node pointer to the bridge */
> >>          struct device_node *of_node;
> > In my opinion, if you are adding fwnode, we can drop of_node
> > completely. There is no need to keep both of them.
>
>
> But the 'struct device' have both of them contained, we should *follow the core*, right?
> They are two major firmware subsystems (DT and ACPT), both are great and large, right?
> Personally, I think the drm_bridge should embeds 'struct device', after all, drm bridge
> are mainly stand for display bridges device. And also to reflect what you said: "to
> reflect the hardware perfectly" and remove some boilerplate.

struct device contains both because it is at the root of the hierarchy
and it should support both API. drm_bridge is a consumer, so it's fine
to have just one.

>
> I think I'm not good enough to do such a big refactor, sorry. I believe that Maxime
> and Laurent are the advanced programmers who is good enough to do such things, maybe
> you can ask them for help?

Well, you picked up the task ;-)

But really, there is nothing so hard about it:
- Change of_node to fw_node, apply an automatic patch changing this in
bridge drivers.
- Make drm_of_bridge functions convert passed of_node and comp

After this we can start cleaning up bridge drivers to use fw_node API
natively as you did in your patches 2-4.

>
> Beside this, other reviews are acceptable and will be fixed at the next version,
> thanks a lot for review.
>
>
> Best Regards,
> Sui
>


-- 
With best wishes
Dmitry
