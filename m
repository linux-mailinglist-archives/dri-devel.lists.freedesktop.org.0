Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1845F210564
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A156E40A;
	Wed,  1 Jul 2020 07:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F446E40A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:50:52 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n23so25827593ljh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uz2HVrjjWvM9xtc3pLsQOyiOISHzNTG2GYwMVCw6J4o=;
 b=tvs2DSdH9VtwLW7TdYV8ZAqaUg/zZ8haHmG8YpMOlppKeOLLQbv5ErlxCiEgo2/eXK
 77As9LEMtO5Mk/n8z5uLzjqYSo5Mhn8o4iSVjroURbmuoqH6xpj0dvP6gPfFOJT1rvwV
 T2pZTjcKOppqeOjFBTHlhjsr5ALmNO3j9hUdL1PUtLuvgZ4PFaHTyYG2fVCwkaBuYKwo
 xussbvQg1VFQaVTB9vB8oSf+Qx7zJtAb8ihs1wIwWwwHktc9Sf3sDhxwGFZTMY1sBJB4
 iaEN1xgQeU6zhego2PxrwsM12K2MdRSrNT/wEmTm9whZ6UZ247TkW8wtJ14MkpaKfZ7t
 mIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uz2HVrjjWvM9xtc3pLsQOyiOISHzNTG2GYwMVCw6J4o=;
 b=iRXcfe0tySzm2WnDw3eV9aCYwZL2znD51/XgYXrtVpL+QrRHU8C/K5D+u/QAHsVdeX
 8LhTn4sNOoQ1wOwppnn6jUqwnfxf1DLNmWdRFdMWGkrhG75N03wju1waknR0xcIZOR0F
 gosPNcUtigVRWVOeLb6wRFm4TTRHmFH8xqKUIzXw1L6e47g5+vro2ckij1hFH3oWMT1d
 0iXGCspek9TUjcrg+QJBKoihZdH0iREaRP+vAmAtWZu9WWtAiAUf4QfNbuYNKMREdxaQ
 qlXghI10owVehxNuw8uc+MmQMOWXb9Mes3hO4+3HGPBL+aKY8tUJY7MasUAbElAPsNUT
 gSbQ==
X-Gm-Message-State: AOAM530Laf1lkAFaRZTkh7Cdg6jVFB2cGa+CXG/sdwGiv/v9vtctrVuW
 U8xNF273rMFTjSzSqVjaKWi7zXBXXaAGk+OiAIDpgzRX55M=
X-Google-Smtp-Source: ABdhPJwgrorp6PW7xMBimsg+9NrZkVcYegomjAzeg6KTUWqMNqo6scmxWP7ixbhDL9EU3lg5KTkr+7Ecj790mtBVXkk=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr7003529ljg.144.1593589851375; 
 Wed, 01 Jul 2020 00:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-10-megous@megous.com>
In-Reply-To: <20200626005601.241022-10-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 09:50:40 +0200
Message-ID: <CACRpkdZcMA_Y_eH8_TL09Z0_DADDcUy5s_S45UfrnoSKmNgtXw@mail.gmail.com>
Subject: Re: [PATCH v5 09/13] drm/panel: st7703: Add support for Xingbangda
 XBD599
To: Ondrej Jirman <megous@megous.com>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Luca Weiss <luca@z3ntu.xyz>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel used in
> PinePhone. Add support for it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
