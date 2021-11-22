Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD159458EF2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 14:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96406E049;
	Mon, 22 Nov 2021 13:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDE96E049
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 13:06:10 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id t5so76910783edd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 05:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U+eXAwnCmXED1ZG+mcGp01uKeH0lDqF3ueA82gmamHU=;
 b=o6cU7i5hhB6IcDEmhKwvIlVLcfJs4S5ISzdl24IXUzMX7ny7eMptSArI6WmzVsFaK/
 4JH3g8RVoD55i5nSxUKwnqR5VbEZdUI1hG9azHbf1DwVUFSL1RKhYGIGEi6SC32D6aTB
 CkkQjsbbBiIg6q6CxPZA1osPG5Zn2QjGu5J9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+eXAwnCmXED1ZG+mcGp01uKeH0lDqF3ueA82gmamHU=;
 b=rgA4S1YISnQBYspF4MbmawMGWM7spPA0sWacEUNFO3tPKCgukfJIyhEv+Ww6Lv3Dq6
 PgDDEmvMCTbAHVb1JTIHq2RT0Maf2AvOnP646UuRy6Bs50ITNBPpmbvBRrKkmQTVZPaT
 0ywtERRF3OQ7i/JB6TkyahKCJ4BFgIjnUat1QLw2+gh5piybLU9xQ8NzMsd0RI5t0BOJ
 0aF/X2462G0uQAT8OR2vCvgGqUuDKs9FqT0QxfsKLoCl+e6mSb1p6NFnBUjjbWMTlV/o
 ulgDqw7yrN6XIo93GTi2+/1mWYE972d5ksxV1JZyCe5cqrWud9xFUEOBkBdwOSAm7MZT
 1GZA==
X-Gm-Message-State: AOAM530E1qvF0tzhn9yRbtqgfUPLL+Mfq+eZh2gLiRWFOeOLT/vR7Xjt
 7ncjGewkJG2FMr5CCGZqazEz7kMMlH7liaKkjfG5FA==
X-Google-Smtp-Source: ABdhPJxwQ8huXu/Wvbdw8NgjJIssNO17n1w1LiQRy0pQw4AwA3aV0rzvh8z/ewnlTttvr7KdSJV8NNlsuw/vVhJyygU=
X-Received: by 2002:aa7:dc15:: with SMTP id b21mr66127296edu.237.1637586368833; 
 Mon, 22 Nov 2021 05:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-5-jagan@amarulasolutions.com>
 <20211122100759.qw6lvwb33ciemg2y@gilmour>
In-Reply-To: <20211122100759.qw6lvwb33ciemg2y@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Nov 2021 18:35:58 +0530
Message-ID: <CAMty3ZDDQR-OkjqEfb1ZYZG+oLN2ZOv-2GLxs3AdeDHqUD8fjQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm: sun4i: dsi: Add mode_set function
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 3:38 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Nov 22, 2021 at 12:22:20PM +0530, Jagan Teki wrote:
> > Get the display mode settings via mode_set bridge function
> > instead of explicitly de-reference.
>
> What's wrong with dereferencing the mode?

Nothing wrong with dereferencing, however we have built-in API to that job.

Jagan.
