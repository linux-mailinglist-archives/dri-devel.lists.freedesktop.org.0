Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E282B178D27
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 10:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6C46E137;
	Wed,  4 Mar 2020 09:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565686E137
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 09:11:04 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id i10so436331lfg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 01:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MJ2Hq5eEX2EmE0ikEnB02Pg2NR9XF1NIvY54HpwpXio=;
 b=ogxWYSMiocylL80yRmIuJ+7iijGwRA8hSPwq3inJ/HASMaeRFm1w6Wxw3lvdgQDvqP
 CoYjmKVTmDVFlDh5OwF4B742ciA/rLHhCRmhUW3xxJVeVSSuBQnQTAXhdZknA86w8X2X
 d1o1fRQsLvJSaiaVVpWXbm7HPyZ0RTd/45U8dso6lrqZD71Vb/4bMxa1MmqOQ06eOAFv
 vkSHc8qShuaHS8TRWIKF5SdphPxpBTRVkEOkNwea0m/aDDJmRCoL3Myrr9xWs9s8+Tn9
 p8+2lIB7sTlEEDi8UwXFoKytiYlQdzo1eZGBLySIS56w4hPukBKKmL584If0FGFF8Fxl
 1IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJ2Hq5eEX2EmE0ikEnB02Pg2NR9XF1NIvY54HpwpXio=;
 b=WvQSgzP/NIVXdAgKXPj0yN8onWTJ5/YrlA2O/TqYVH3vKyys0sQx9dKZ2EKLYnVOiX
 mMXV3oOw5UhoXvmoUiXpjwny6DUGhm9O38RcN48AbMZp/Z8CrNTV7YYZPMJKjXCROFQu
 1RnuyAtDv6PAC0NbtGjiBLP+Qy7T4hWU3ieCrBAa3Rj27ntv8Gm8qJetJzNmaDNM8gWf
 vcOg+PQRxcfNIsmCHq+s5Ww4EosvFZBbBtYDQpsVF2lzEhv2fiuZyy+mB000HmAJZkco
 zfQcOTw0A55WaH7gW8B/MDweJHTMJTHtmehNkLgj74dyB9IFm9jEqJZWEOiamR+/wu6V
 SFcw==
X-Gm-Message-State: ANhLgQ0bQnGBQs98ak9SlhABu7ghGqis6y8e8gKyb6ciCZRhntjgGSQA
 u2XSb91y9O94JDYl3wDwU8cteYTF2QytiEcfmiFENA==
X-Google-Smtp-Source: ADFU+vtbxdKRCn2ziaQt9SsDEpdV5sURGsBBeCG543tbvdIA+tZkNZXNN9W4rLeghQwKwWSjRgFQ7LXtGa5wM5BE688=
X-Received: by 2002:ac2:44a5:: with SMTP id c5mr1372090lfm.4.1583313062627;
 Wed, 04 Mar 2020 01:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-34-ville.syrjala@linux.intel.com>
 <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
In-Reply-To: <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Mar 2020 10:10:51 +0100
Message-ID: <CACRpkdapumGw5Fp+YaiWkB8uh6me9s2s-Bx_-RqmoqBADJFvEg@mail.gmail.com>
Subject: Re: [PATCH 33/33] drm/panel-simple: Fix dotclock for LG ACX467AKM-7
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 2, 2020 at 9:49 PM Jonathan Marek <jonathan@marek.ca> wrote:

> This is a command mode panel and the the msm/mdp5 driver uses the
> vrefresh field for the actual refresh rate, while the dotclock field is
> used for the DSI clocks. The dotclock needed to be a bit higher than
> necessary otherwise the panel would not work.

I don't know if this predates the support for defining DSI clocks
but for what we have in the kernel right now this is wrong.

struct mipi_dsi_device contains:

 * @hs_rate: maximum lane frequency for high speed mode in hertz, this should
 * be set to the real limits of the hardware, zero is only accepted for
 * legacy drivers
 * @lp_rate: maximum lane frequency for low power mode in hertz, this should
 * be set to the real limits of the hardware, zero is only accepted for
 * legacy drivers

The MDP driver should use these frequencies for a DSI command
mode panel, and the panel driver should define them.

These two clocks are/can be/should be completely orthogonal to
the dotclock/pixelclock inside the panel, which is likely driven from
its own crystal directly from the panel-internal framebuffer.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
