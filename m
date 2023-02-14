Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 649AC696204
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB4710E884;
	Tue, 14 Feb 2023 11:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1354910E884
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 11:09:44 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d8so15471138plr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 03:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YV6VJE7WrIiVKYGNmWA3UqKcU/lEHYr8sr/5rV6yN4Q=;
 b=UVI5lcmYUcXnV+Ym1kZVTpGvI60tl9hm40lokSNkXH639b0LI+XWpZOGW6IesL8n4K
 anOIsDUFeoXK1mN9AG+xec16EfFnck2cuIR8pA0pniPnTa6DAS5tziiA8br0ZRn7xfwf
 ZgosuYU9oNEvIqf0FQNOssQ7X/AHrbDQy+ibg+cn0DAnDQCWoLu4sLdFxEkqhL15YOx4
 oidD5VcPcvdyQ2AzGb/HbAzuyhFo4tf8ovdksorwMj4DYZ53KXGBgPOqaHJmXy+ouEeH
 gpXEL470sm9FCWZSra3i+vsQjm65LarkoZiKYFgRHaPYShjqNtTyr57bFvStvU2qecuR
 cN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YV6VJE7WrIiVKYGNmWA3UqKcU/lEHYr8sr/5rV6yN4Q=;
 b=5EIBXBBXYRP40myZe8iPJ2gOjsjzgtRE7OBndOwjY/9CSm7RIVci85MU19bQU6i8+q
 t8PInYS4CDIaZ/QEwOX2vC89pcrlXAUaSJQjEGDhcvomLQPflRd2BreXAuVsGF170jiY
 l2UvBREPfQtyvWhBHXr1GQHeN91cTi1LOAMq6pxebDGQalAxEQ3lzHtODbS9xGFq7j0p
 vqC3db1OsRVembFyH3seXKcJWA0DCqGnfihcWhG0kFzjHWEp04XZMBG1MAYR8Q81eBl2
 xrPT1v9Wp8CP2bIFO7stf6KwZyk6TVHcfBimBn4gi3hD0k86Qje3qFRRmNG2Ziw1SM8C
 W+yg==
X-Gm-Message-State: AO0yUKWJ6We6CGq3AK1ctmiafxJKcNNxRmEqBE5EtFM/eEEP2lMw5QLD
 nBR0+2viM9b1PrjK3avvrzewgiRB0X95TGln90I=
X-Google-Smtp-Source: AK7set/6exmanuIDSEZac7sutaeaZiv4wudKz90YgkooBOyBlwl8OwVUuEyIWeZSeVkDQ9A6w5kW7sNw2jVunnWqny8=
X-Received: by 2002:a17:902:c942:b0:19a:9605:b958 with SMTP id
 i2-20020a170902c94200b0019a9605b958mr570666pla.32.1676372983572; Tue, 14 Feb
 2023 03:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
 <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
 <12d5568f-c12c-970d-0f78-17d6dc7c0c1d@denx.de>
 <6ceb6866-f8a5-072f-3d86-895024fcec79@prevas.dk>
In-Reply-To: <6ceb6866-f8a5-072f-3d86-895024fcec79@prevas.dk>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Feb 2023 08:09:32 -0300
Message-ID: <CAOMZO5C1oau7+YAbadD=8ERiNSLi_Z1k3VC9HVmT8aVpQF5hiQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 matteo.lisi@engicam.com, aford173@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, linux-imx@nxp.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, kyungmin.park@samsung.com,
 Jagan Teki <jagan@amarulasolutions.com>, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rasmus,

On Tue, Feb 14, 2023 at 7:55 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:

> Well, the data sheet for the dsi86 says up to 750MHz DSI HS clock, and
> if the value specified in samsung,burst-clock-frequency is twice the DSI
> HS clk, I suppose I should be good up to 1.5GHz? I have tried many
> different values, but I never seem to get anything through; I think I'm
> missing some piece.
>
> So now I've tried to use these patches on the imx8mp-evk with the
> mipi->hdmi accessory from NXP, just to see if I can ever get any
> graphics through the mipi interface. And there the story is the same:
> the adv7535 bridge gets probed, and can read out the edid from the
> monitor over hdmi. And while the mipi block and the bridge seem to
> attach to each other, I still don't get any output.
>
> Do any of you happen to have this working on the imx8mp-evk, and if so,
> can you share the .dts updates you've done and how exactly you test the
> graphics?

I don't have access to an imx8mp-evk, but I tested the ADV7535 MIPI to
HDMI daughter card on an imx8mm-evk.

Some extra ADV7535 patches were needed. Please check patches 0020-0023
and see if they help.
