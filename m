Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2833291C3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 21:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2320A6E89A;
	Mon,  1 Mar 2021 20:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9AF6E89A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 20:33:10 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id p15so12177521ljc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUAIpvEkTlSXH3WpLcUzPSeK+taFsATzFW6uBRGm5Zo=;
 b=r9I1mk8ry9Qaofll5knF/RLPp3sNzGH6X9W0ow0yHchZVd9TyWunN6es1so1AaorDy
 CH0Q8WNk08fBPnOkQLqgrSjoKyzDHNPvxVo3NwAyGY4UNvEVf1/+qUZH/UXPdp2x6yXt
 HeybVa4BH8vntonQ4wH0E1P7tjcDeXgzPmuhLEPHAqQQjfPZviyYTw8y7OKWVULIVqGy
 XxgP/649J19AVvuWO1KLxpNtZzf6NKQk/LE1CC7Db1z/KeAiC1TueGU4IHyZEwj+j3KO
 UDwThgdYvCi0MHgkRu1Te7lM1p2SEoi9Y/ASM3/aleHCWaEUJtIUFivb80XWdCTRFTcQ
 NBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUAIpvEkTlSXH3WpLcUzPSeK+taFsATzFW6uBRGm5Zo=;
 b=DdcDsm+s7VEnKkXxJTB+yo3NT5BvDx8fPe9DXGoximpwtGVA1uw6YqMnnw+MrBE3f6
 Me9j5uABPUWm/u2kWTN9mEmvV3+ODSBHa1pOhHy7sp1mN79n1NXrRdywIL9nGdDIpWY0
 OUSuuio4ZwilYRy/EK27yfU9euNUxUZXkzpMBTIGs1LEN182wowWV3kArM7foam7Ke0f
 7gC7rp9/WrvF6ZG+pk9igV5oAmZn3h5JVs2+quuHcJylyWjCjlcwRzk+f8MmqG1W+Z/u
 /pw/191WR4vaolgm9etyWMITgwbP51uCeJggkKTfx4Rb6rrKbQbXOTD1kLvrzOzzHQog
 WC3Q==
X-Gm-Message-State: AOAM530vU2h5Pk4UfBwAlkaVSWMvpHlpHxQYmt4fVo7aKyn0wymavCCp
 S/Q1ziK/N2V24qNMO+Fp4AMEXDztja+sfzTmMhL2Dg==
X-Google-Smtp-Source: ABdhPJweFvJ+LUXwqlJDYWW1Fn8lDlfe4M+n4J5Dmozp+belyfrpQ2uuwRv/yZDlpNcl3/LYsxhlvZV+EJ9CqZgBu60=
X-Received: by 2002:a2e:8ec6:: with SMTP id e6mr10243435ljl.257.1614630788746; 
 Mon, 01 Mar 2021 12:33:08 -0800 (PST)
MIME-Version: 1.0
References: <20201217140933.1133969-1-robert.foss@linaro.org>
 <CAG3jFyuzjbPsMBOOgc2DBBT92H7FPBNdJLKWHF8+7K10LujMbw@mail.gmail.com>
In-Reply-To: <CAG3jFyuzjbPsMBOOgc2DBBT92H7FPBNdJLKWHF8+7K10LujMbw@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 1 Mar 2021 12:32:57 -0800
Message-ID: <CALAqxLXwvP0-FTSajHnLSc9fDRuQifQQwJKo-71jFVSX4SfRhw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: lt9611: Fix handling of 4k panels
To: Robert Foss <robert.foss@linaro.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Peter Collingbourne <pcc@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Anibal Limon <anibal.limon@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 1:50 AM Robert Foss <robert.foss@linaro.org> wrote:
> +Sam Ravnborg
>
> I think this patch is ready to get pulled into the drm-misc tree.
>
> On Thu, 17 Dec 2020 at 15:09, Robert Foss <robert.foss@linaro.org> wrote:
> >
> > 4k requires two dsi pipes, so don't report MODE_OK when only a
> > single pipe is configured. But rather report MODE_PANEL to
> > signal that requirements of the panel are not being met.

Hey All, I just wanted to follow up on this patch as it seems like it
missed 5.12 ?

Just wanted to make sure it didn't slip through the cracks.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
