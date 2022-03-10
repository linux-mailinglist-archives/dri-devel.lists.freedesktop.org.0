Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B914D5538
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 00:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061A710E1EA;
	Thu, 10 Mar 2022 23:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C33A10E1EA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 23:21:54 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bi12so15552866ejb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PRoRNGVXeBqETfXyFZpgopVazVuZfI/uR73/ovgOFQY=;
 b=L+XUhuaJEipGfKdRYP0YvnmyWyW5lJGOgrzwPa/o+u54QQq4AWVLuHZIvZC0accbpV
 /aSkWVCNDX5cWh2Oc/bP8q8fVsVfvhNyxEAA0ntZB5Npfw7O7eGWb8juxgdRF+bhNvrz
 4Qyf1P6BcBPB2zHBxj/u0XbE8pSOhuWI0rq/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PRoRNGVXeBqETfXyFZpgopVazVuZfI/uR73/ovgOFQY=;
 b=YZOiKyh4nXRhTyBTM1bfOBvglfg31F9wB60gprZ4UEHI4gg/Ckk/pJ7NnKHRNUojgJ
 V36Ch/8XUBAum2pWPneYdcqt4uZKXghog8TtiZc44808Ew3hT80uYwGPzNWgPSoVEzQ3
 p4dWfjqaexiEwCAC0JUuiuShF31BnkeSoUebAFeyZimDosJCi6jkethRMVhH5rIpkYhY
 qj4OQlJjvEoncjxJ981hhnnXhBlMlTFl8y/LewvZkzxQHCepEg+Sa5BhfVf/LxxUH1td
 FzzT1ub8VMqRWA7Cx6Lw7DzLns1lA81BIRrTEeJ77KEQJtvoZbHT5abT/dpC1SVAHKF4
 e4/w==
X-Gm-Message-State: AOAM530NIxYuyu65sNXOWFtEcXTzENL6i+c0TydXgf5hwzbKoEBDFo1D
 xl7+rz4jMTl91PnO6/NSaTeI1wgqY6N6cRfdiEk=
X-Google-Smtp-Source: ABdhPJzCrAyJI8aXvCGlHLsiQwph7yQgPAvpgQWyzA7rsvdOufpuzA+NqJsBA0BuYywZoikaGiti+w==
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id
 o6-20020a170906774600b006cea12e489fmr5990586ejn.551.1646954512709; 
 Thu, 10 Mar 2022 15:21:52 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 w19-20020a05640234d300b00416baf4cdcasm1124523edc.48.2022.03.10.15.21.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 15:21:52 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so4407678wmq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:21:51 -0800 (PST)
X-Received: by 2002:a7b:c042:0:b0:389:7336:158b with SMTP id
 u2-20020a7bc042000000b003897336158bmr5478597wmc.15.1646954511190; Thu, 10 Mar
 2022 15:21:51 -0800 (PST)
MIME-Version: 1.0
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Mar 2022 15:21:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U3fLvixpJfGxzmJd89+yVEDgbNYPsfJtq92QObUxw=3A@mail.gmail.com>
Message-ID: <CAD=FV=U3fLvixpJfGxzmJd89+yVEDgbNYPsfJtq92QObUxw=3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/bridge: ti-sn65dsi86: Support non-eDP
 DisplayPort connectors
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 10, 2022 at 7:22 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> Implement support for non eDP connectors on the TI-SN65DSI86 bridge, and
> provide IRQ based hotplug detect to identify when the connector is
> present.
>
> no-hpd is extended to be the default behaviour for non DisplayPort
> connectors.
>
> This series is based upon Sam Ravnborgs and Rob Clarks series [0] to
> support DRM_BRIDGE_STATE_OPS and NO_CONNECTOR support on the SN65DSI86,
> however some extra modifications have been made on the top of Sam's
> series to fix compile breakage and the NO_CONNECTOR support.

This confused me a little bit. As far as I know Rob's series is
abandoned and he's not working on it. I assume that Sam will
eventually re-post his series, but it had unsolved problems and the
bpp solution he had totally didn't work because nobody was setting
"output_bus_cfg.format" [1]. Did you solve that? ...or you're just
going to let your patches sit there and hope that Sam will solve the
problem and re-post his series?

I'll admit I didn't go through your git tree to figure out if you
solved it some way. If you did, I would have assumed you'd have
re-posted his patches in your series w/ the solution...

[1] https://lore.kernel.org/r/CAD=FV=WW6HWLOD9AzTpjwva9UHY=AR+LABEWqJQznz6Nbb4sOw@mail.gmail.com/

-Doug
