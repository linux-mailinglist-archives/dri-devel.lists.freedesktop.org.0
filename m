Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85B60280E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 11:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515C210EF04;
	Tue, 18 Oct 2022 09:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7DE10EF00
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 09:13:58 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ot12so30728308ejb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Idjyf+fiBtwH7k36sAjmH9HqP1/Ck02WOzId2Gki5U=;
 b=dmDv93UCxu/zTzmKbg6KJGK8I8wyJrLiGWjJfzouWhLf2y5TaD1I4tIIU8Wv0GFBUS
 d2WEkONnQbZ8MfnKqfCcL4bFcHp0xOfUjD2Yy/PhoUjVhlsAgVzPrjRVOqvsi2qHDbL5
 0Q68L5iq2FHlyuqkfM/6wBtEsgsCw8uLcYU9CFS0Wnp/KcP/LDr75eY5yqsnghtbyJAe
 oEo1h9r79cyhqJdL7XcuI5NbknMsEpw/htETShHYFZ71DywA80yflY6W8MYwhzIuPgH+
 QiSXBr+DGZ7OlUpInuOpkV/r2UGc/A9Yx5kUA9y/a3xz28e6KHk4q5oPKL6oBM86Q+gH
 XubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Idjyf+fiBtwH7k36sAjmH9HqP1/Ck02WOzId2Gki5U=;
 b=Z/Aln27JKKcmA33OFxeyEFggadQU+Nt34R9hsSCKKCjvYVA/G2pQt+EiNgCz86aARz
 8dlga2p+iZMiLWqTDrl9LTAPsyfPxajzBmtdpLBnEL7DCq6E22YMEtWV0JF5Dhz7iNkq
 B7y75Vycd0a7UvO7Ji6ClLuMHe4cvYL0OKbrI6NYIETY+NRkCVX/76f+4164R0DGEnOH
 1xcQ4Q7tupYaE40ig1t3JO1fOgLhuyWhmw364ECOjFFslfHh4nNNTNRzL2gDu7d2ogZ8
 H+WeIhwLhMJmiNOcRH9dyIcaiL8NYA0TGCrk98zuEhWqbNvUgAMBDufWQAx+NtV+abeN
 b7ng==
X-Gm-Message-State: ACrzQf39fJQ+fBRPNVExD9pJSR2myDXONFljU0w4uzjbTzTupv10h8uZ
 5spcq8WP5dPcq3Am5IhzA9hh7Nvvza/vJ63t7Kffsg==
X-Google-Smtp-Source: AMsMyM6cMJ+m/fAi4hyXn/T9OQXrxe/WfQZ2jVs3r9AR8zihQXLDktuOPfOQQJ14bNuv8EbTZEOUgCMaNEUfHMKeFOM=
X-Received: by 2002:a17:907:a06b:b0:78d:d25f:b726 with SMTP id
 ia11-20020a170907a06b00b0078dd25fb726mr1573710ejc.203.1666084437317; Tue, 18
 Oct 2022 02:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221012221159.88397-1-marex@denx.de>
 <CACRpkdZd_fNYv2sFRJX7nacz1dAp-dAxEzDfTMRKAy4nB6Jbvw@mail.gmail.com>
 <30a171e3-1b82-34a5-e018-349349e246c6@denx.de>
In-Reply-To: <30a171e3-1b82-34a5-e018-349349e246c6@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Oct 2022 11:13:45 +0200
Message-ID: <CACRpkdZhe4ie+X+i20q1NmvXCv3XM=4pcnU=W-93n2ik+ZcdMA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/panel-sitronix-st7701: Fix RTNI calculation
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 11:03 AM Marek Vasut <marex@denx.de> wrote:
> On 10/18/22 10:53, Linus Walleij wrote:
> > On Thu, Oct 13, 2022 at 12:12 AM Marek Vasut <marex@denx.de> wrote:
> >
> >> The RTNI field is multiplied by 16 and incremented by 512 before being
> >> used as the minimum number of pixel clock per horizontal line, hence
> >> it is necessary to subtract those 512 bytes from htotal and then divid=
e
> >> the result by 16 before writing the value into the RTNI field. Fix the
> >> calculation.
> >>
> >> Fixes: de2b4917843c ("drm/panel/panel-sitronix-st7701: Infer horizonta=
l pixel count from TFT mode")
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> ---
> >> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> >> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: Thierry Reding <thierry.reding@gmail.com>
> >> ---
> >> V2: Clamp the htotal to range 512...1008, so RTNI always fits the bitf=
ield
> >
> > I tried to apply this to drm-misc-fixes but the branch has not yet
> > been moved forward to v6.1-rc1.
>
> Can I maybe get RB until then ?

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I've been told to go and poke the DRM git people at IRC to rebase
the fixes branch.

Yours,
Linus Walleij
