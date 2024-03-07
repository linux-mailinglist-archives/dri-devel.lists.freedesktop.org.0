Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 859468758AF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F4810F551;
	Thu,  7 Mar 2024 20:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SEux2K3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513A110F551
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 20:41:09 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dc742543119so257614276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 12:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709844068; x=1710448868; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2pm64rJrWGf2TC7i7wriz0x1Yj7IyNIZ1jq+izBNKQc=;
 b=SEux2K3wG72FrqtW4DF+h31mjAUQP8tRkoVA1xu92nC9K51vYL2jC3VdhMSljObnoj
 fLlLzHlD7zqkmeZvv0lUjamnnGFUuEEeP2snWIWnVAXTW3Sz2SnO/ppWo6inOj1U/o88
 moq6R2MPrKCqw8b/WIopzhJI4obx8Ohk7m/o2FCCpv+b6XAAW3GX1grDQ9ARi91nxdHr
 odI1KqlqWc2tii473XxKAmnx58GfXvPuDkjvMgMcDSDJydY6m7lNFPVtqVpQCP/Gj7CP
 hg3mgr1aYSMFxKggxSzmOBANSJaikF6hUJptuf7/AgXbURFOp6n6QqZhaoqzWt+ISFw+
 hUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709844068; x=1710448868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2pm64rJrWGf2TC7i7wriz0x1Yj7IyNIZ1jq+izBNKQc=;
 b=pXpctznYvvq74ebz6YfDqiJi+7x7NbZvymSEI7fU1E1Di48XaHbphNfcG9k3NTIx+a
 Cs/O6ZKA4RMGX9K/EnnWqQoaS6adNRN6+0lqndK9euebZK9jYr277F9awJibuUuwIWPi
 wBBGn500qQNAmpPAXydLGhbtfz7y/nuVA6veydXmcaZOEIASykhHcQlj/ACqyc23s5Z6
 jkqe/L2kRtCZYzBsIsoDyAuQJtqJDe/Pik+wC5pCddgltun05DVQhgAsHDFRIbXAw6PI
 C+gcO6VXPEz/NRsnDKhxUV8iadac6uj9gcJpwzqBc+P50lmp1yeKGB7SKacoE4fGLw4F
 +SKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWviqVjhi1RllYnSmkOnSQSrAdgjJMITK5BTEYxxHJXFH38uv1wu/g2+rqD3pQQSsdllrWFs9cbyqRMsUvJzd3gKwE89+d6AjDz1uBrlk0d
X-Gm-Message-State: AOJu0Yy+w+6aSaS0cutHWcs124kqu03EbVZfHgDiusgic3eYUXmkNs3I
 Adl8KBbMFDTVgL+o219o9YgBYCzEFhjOI6RGNeiPOi58EcoyVCnKBpN1j+qC6bbHYK//4lHM+jO
 bTgtZtUKPdDoPL2yHYfmTWU2ATqDJFRyCTgJo8w==
X-Google-Smtp-Source: AGHT+IHkjxheAmKWL1zaxlw07oKvsmcoHtfNta5lFV/Ex3O+sqsAW8w16SuKppgIm8WsgtsUjDTPVMnvFKFSfSaSs3Y=
X-Received: by 2002:a05:6902:1347:b0:dcc:7131:ad4a with SMTP id
 g7-20020a056902134700b00dcc7131ad4amr15089431ybu.62.1709844068015; Thu, 07
 Mar 2024 12:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
 <20240307172334.1753343-2-sui.jingfeng@linux.dev>
 <CAA8EJpp8tsHi0RhsJXG+r6nOsV3AUC_n6jNHL0Cr6Ku2h3NMog@mail.gmail.com>
 <45f59f31-1f03-4a96-adb6-25c7cdd5e8a1@linux.dev>
 <CAA8EJpqq1-cEke6wEFZFDnpz4tFBcL6HF3=Qtf-8Q3WbogLS8A@mail.gmail.com>
 <c84fcdba-af50-4212-a8e3-f492c2b02ce4@linux.dev>
In-Reply-To: <c84fcdba-af50-4212-a8e3-f492c2b02ce4@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 22:40:56 +0200
Message-ID: <CAA8EJppTcPO3j7GpGcGbKPUjQ=3rTMMOrU1SYR3mtkWLztf2qQ@mail.gmail.com>
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

On Thu, 7 Mar 2024 at 22:32, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2024/3/8 03:37, Dmitry Baryshkov wrote:
> > On Thu, 7 Mar 2024 at 21:20, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> >> Hi,
> >>
> >>
> >> On 2024/3/8 02:43, Dmitry Baryshkov wrote:
> >>>> +
> >>>>    MODULE_AUTHOR("Ajay Kumar<ajaykumar.rs@samsung.com>");
> >>>>    MODULE_DESCRIPTION("DRM bridge infrastructure");
> >>>>    MODULE_LICENSE("GPL and additional rights");
> >>>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> >>>> index 3606e1a7f965..d4c95afdd662 100644
> >>>> --- a/include/drm/drm_bridge.h
> >>>> +++ b/include/drm/drm_bridge.h
> >>>> @@ -26,6 +26,7 @@
> >>>>    #include <linux/ctype.h>
> >>>>    #include <linux/list.h>
> >>>>    #include <linux/mutex.h>
> >>>> +#include <linux/of.h>
> >>>>
> >>>>    #include <drm/drm_atomic.h>
> >>>>    #include <drm/drm_encoder.h>
> >>>> @@ -721,6 +722,8 @@ struct drm_bridge {
> >>>>           struct list_head chain_node;
> >>>>           /** @of_node: device node pointer to the bridge */
> >>>>           struct device_node *of_node;
> >>> In my opinion, if you are adding fwnode, we can drop of_node
> >>> completely. There is no need to keep both of them.
> >>
> >> But the 'struct device' have both of them contained, we should *follow the core*, right?
> >> They are two major firmware subsystems (DT and ACPT), both are great and large, right?
> >> Personally, I think the drm_bridge should embeds 'struct device', after all, drm bridge
> >> are mainly stand for display bridges device. And also to reflect what you said: "to
> >> reflect the hardware perfectly" and remove some boilerplate.
> > struct device contains both because it is at the root of the hierarchy
> > and it should support both API. drm_bridge is a consumer, so it's fine
> > to have just one.
> >
>
> What I really means is that
> if one day a 'struct device *dev' is embedded into struct drm_bridge,
> we only need to improve(modify) the implement ofdrm_bridge_set_node().
> This is *key point*. Currently, they(of_node and fwnode) point to the
> same thing, it is also fine.
>
> For the various drm bridge drivers implementations, the 'struct drm_bridge'
> is also belong to the driver core category. drm bridges are also play the
> producer role.
>
> >> I think I'm not good enough to do such a big refactor, sorry. I believe that Maxime
> >> and Laurent are the advanced programmers who is good enough to do such things, maybe
> >> you can ask them for help?
> > Well, you picked up the task ;-)
>
>
> Well, my subject(title) is "*Allow* to use fwnode based API to get drm bridges".
> not "Replace 'OF' with fwnode", My task is to provide an alternative solution
> for the possible users. And to help improve code sharing and improve code reuse.
> And remove some boilerplate. Others things beyond that is not being taken by
> anybody. Thanks.

Ok, I'd defer this to the maintainers decision then.

>
>
> >
> > But really, there is nothing so hard about it:
> > - Change of_node to fw_node, apply an automatic patch changing this in
> > bridge drivers.
> > - Make drm_of_bridge functions convert passed of_node and comp
> >
> > After this we can start cleaning up bridge drivers to use fw_node API
> > natively as you did in your patches 2-4.
>
>
> Yes, it's not so hard. But I'm a little busy due to other downstream developing
> tasks. Sorry, very sorry!
>
> During the talk with you, I observed that you are very good at fwnode domain.
> Are you willing to help the community to do something? For example, currently
> the modern drm bridge framework is corrupted by legacy implement, is it possible
> for us to migrate them to modern? Instead of rotting there? such as the lontium-lt9611uxc.c
> which create a drm connector manually, not modernized yet and it's DT dependent.
> So, there are a lot things to do.

Actually, lontium-lt9611uxc.c does both of that ;-) It supports
creating a connector and it as well supports attaching to a chain
without creating a connector. Pretty nice, isn't it?


-- 
With best wishes
Dmitry
