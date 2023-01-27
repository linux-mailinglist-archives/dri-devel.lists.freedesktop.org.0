Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B5667E298
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 12:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F115510E453;
	Fri, 27 Jan 2023 11:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0882D10E453
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 11:04:49 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-50660e2d2ffso62635587b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 03:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vtCufjftzRG8lvlWQ1wO1skFf5C5cc2e3diz04sQ88E=;
 b=jfhucjcR/CC4IxF2b6WCyWc+ciiF+Lhhitd8XNp3JNOlUyy3wZT8XKSeVWHsCAhQEm
 UjUBzdvWfLVfTC/ga+WY2MKTvA/YVx3IzSbGZ0ReyWlGlrq64wln0rPhDk5/2F8itOs/
 NLf06A7kwz+XPXLB7/Myq61A5Je0k6xVlOzRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vtCufjftzRG8lvlWQ1wO1skFf5C5cc2e3diz04sQ88E=;
 b=WIWmQFpsscJu0QC8WqYU2tVQpBGb4nvjTSHU6hpaVbqb9h0R/4K/opFMuQcQio1bq/
 FezArt8uZEOB6j+4m5B2E8MRPAh4sxJyoPQoVbdV8ZCurytTH0kyIxTv14S9zKuchR6b
 rJLgGFLYZ+STZe7M2R86f6CkeB57+D1YHrMCtT8Enu7X2zQe7XyMbsleHSVnDcziliZe
 oppjOU4oxm3hCBxZnyKasZOEtvVwVn7w5aHSEGZMix9s0BfMHEbRzLz3bPIqV/8D7otN
 iWzl0GYoTdr0qNaTtBrAisbMg+TjJqso2HAU+A+RW6gwLKDFqSTay9yjC+7OcFJMt1BB
 j46A==
X-Gm-Message-State: AO0yUKXCtQL3MWLJUpDmiQAm2WLqGbOSvWJOqgUEHwHJIt8PIt2YDj7u
 3Yqfzqvb+IG8l6bNF6vgTzetiSyX7Q2LDpOA59eqjA==
X-Google-Smtp-Source: AK7set8v0lN6UBHY9MeualzWu6LkDZ/SC4SMQIhNB9JsmTFq3XcVeVlTm8QaFA6gZBPVsOQ496jRh0BZreSEXYOG6IU=
X-Received: by 2002:a81:7302:0:b0:506:52b5:94e2 with SMTP id
 o2-20020a817302000000b0050652b594e2mr1637824ywc.230.1674817488164; Fri, 27
 Jan 2023 03:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
In-Reply-To: <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 27 Jan 2023 16:34:36 +0530
Message-ID: <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, marex@denx.de
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
Cc: linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, frieder.schrempf@kontron.de,
 kyungmin.park@samsung.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 4:26 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 27/01/2023 11.39, Jagan Teki wrote:
> > On Fri, Jan 27, 2023 at 4:03 PM Rasmus Villemoes
> > <rasmus.villemoes@prevas.dk> wrote:
> >>
> >> Hi Jagan and others
> >>
> >> I'm trying to test this series on our imx8mp-based boards, which has the
> >> mipi-dsi connected to a ti,sn65dsi86 bridge (in turn connected to a
> >> full-size DP-connector). But I don't know how to add the proper nodes to
> >> imx8mp.dtsi. My current, obviously incomplete, attempt is
> >
> > Please use this repo - https://github.com/openedev/kernel/tree/imx8mm-dsi-v12
>
> Thanks, but that's exactly what I'm doing, and I don't see any
> modification of imx8mp.dtsi in that branch. I'm basically looking for
> help to do the equivalent of
>
>   88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
>   f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support
>
> for imx8mp in order to test those patches on our boards (we have two
> variants).

Marek, any help here, thanks.

Jagan.
