Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E874A0097
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 20:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D581510E1E8;
	Fri, 28 Jan 2022 19:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349DD10E1E8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 19:03:14 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id m6so21241732ybc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3hlBZRfJeaaEMgpDJfGF4VXTiNMRL5u5A8XWDhcHgIU=;
 b=RB+iJtZRYF0dkmWtZQjZrE5l2GCNTyyleglmYgfhw2DfTccUOrvGv9t6I6Yk7N3fd1
 i90XCiFg/0xlIqHxlY0zFOXcxPwjk7qLfB9xsvV/FxdncdXC32oYUY+M/uVFIzbbRkHS
 sGAHLY2u0DS9/gwV0Bw8Llaky5XDQPsalA9CkpoF7O7nCYaGNpqK/b3tj5Zq48+wjJoe
 QMaTbI9e0mRXYA0VjJ2MYyLeZM271Ly4gVi94O4Z7JeGjWaG7KtuFAcrocfly191vqsq
 BP+/8tBvp4hnN0JJUQazPDSUO82daB1GopBf7zqzTLm5faaI3mAwSJt3f4JT1K0I7IBP
 yiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hlBZRfJeaaEMgpDJfGF4VXTiNMRL5u5A8XWDhcHgIU=;
 b=RFQdKEvGFXiSrSBmvuH/MxqbqkuhwcrLSOMEPIppKMwjLtmvSXZACI8ael7KX9qj+Z
 fu8OyP6tf3/6KN62ADYyUeE89srnK9ssH4IitngTz5HXXvTRMtxiwveUGMavZWQyK18T
 jmu7KMXjMl3/y4jsjKw0ppPxGiy/tDgey/Jmi/h7iu4/Mlk99bCakUhuNO3IJwkfLThK
 2sGrVfc8GxDdM4T4NmsgVkFpZAkWH5UMX32/vJz1jGfs2Hr/yZEQl1otiXvdJSksUM+e
 M+oF2Bo/tArYG2LLvytzWR9ZGLJr9AcvCOdnxpyIzlyVjl0rcEOBP37etnokLfuP4Pkx
 uUkA==
X-Gm-Message-State: AOAM531mJZ9q/LtJ+Gn+uz7jDXvOS0fWix7rnkqX8XiunWl+7umSdaw3
 KOeQ7gh74wDQZQ6F1J+QuesSS2RO5wDmZvtkMgU=
X-Google-Smtp-Source: ABdhPJzzfPPKuV+kEV5XP50RjBgFVl8NGNQtLCUEqsEPQE6Z940iaylmOzR016fVVotXJrtEZoq5NTeoaKbhpkUa57Y=
X-Received: by 2002:a05:6902:704:: with SMTP id
 k4mr14250783ybt.355.1643396593140; 
 Fri, 28 Jan 2022 11:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20220126202427.3047814-1-pgwipeout@gmail.com>
 <20220127093307.GJ23490@pengutronix.de>
In-Reply-To: <20220127093307.GJ23490@pengutronix.de>
From: Peter Geis <pgwipeout@gmail.com>
Date: Fri, 28 Jan 2022 14:03:02 -0500
Message-ID: <CAMdYzYomk6_PLgkWSY9owd98vPtFGiHPmAwwnrx8vchf05uYLw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: synopsys/dw-hdmi: set cec clock rate
To: Sascha Hauer <s.hauer@pengutronix.de>
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
Cc: Archit Taneja <architt@codeaurora.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Pierre-Hugues Husson <phh@phh.me>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 4:33 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> Hi Peter,
>
> On Wed, Jan 26, 2022 at 03:24:26PM -0500, Peter Geis wrote:
> > The hdmi-cec clock must be 32khz in order for cec to work correctly.
> > Ensure after enabling the clock we set it in order for the hardware to
> > work as expected.
> > Warn on failure, in case this is a static clock that is slighty off.
> > Fixes hdmi-cec support on Rockchip devices.
>
> You removed this sentence in v2, but I just wanted to mention that
> clk_set_rate() won't fail when the desired clock rate can't be
> archieved. Instead, you will get the best rate that actually can be
> reached. If you want to check that you are happy with the rate you'll
> have to do a clk_round_rate() before setting the rate or a
> clk_get_rate() afterwards.

Thanks, the behavior in v2 is actually what I'm looking for.
I dug into clk_set_rate while checking into its interaction with
clk_prepare and I came to this conclusion.



>
> Sascha
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
