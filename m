Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D65A3C99F8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 09:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CFE6E581;
	Thu, 15 Jul 2021 07:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903A6E581
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 07:55:48 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id 8so8280301lfp.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xfxlv8kb+dV90008LUKSaosCI+CrD0YPJuZfLy/Uh+E=;
 b=lbzPguOWgJvzoyfvKyutWLO3F3sMLYJw+65bfButrKsFlGU8h39r/Ent5K0KbzoFCs
 j2G2QQbATELlPYvPleE3QYnz+VDuq352184KSpWQinJKXfp8SzaTTTTykk5SUvg1oiW2
 Lkz/N33t/ZVUOgZSbb/DzN3ubeR0Em+L9foCrCUyZ3fSa94MVCEVGAR8yXkecTRMvUA7
 5SvyXljsgE9tzqoNIc98Y9Y1l8Zorx6G6p+3b2XidxUaWwy6IroP5F2rmSDFUlg5MKRv
 rP4iWs5kQRSboWV7biaYVD/MW0wcqtZPrzGkoWmzZKyay+Als545uupikvRVszS9P43d
 mbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xfxlv8kb+dV90008LUKSaosCI+CrD0YPJuZfLy/Uh+E=;
 b=gOb7bhBuP2fMkQNJHrIrTGoduJhEwuUhTFz4aGC/B6WPp3yivXvYnqJFSIkniPhiq9
 NshWgcuUNI9CbMANytVaM7sWrIUr1Ez/jL6JEGXGEu5ZDN/rAQF+zagYs2UMlBxIfVz3
 OmDVswgV6EzmqqjbNP9dh7v/BaI83BWRBgLt9LtGf0YzpxGHJhBF0Ol1Qk1dSeGorFSQ
 2kiuBTdKY4Yh4uPzR7rOoIKSJe+XNwBkhL/Qm/belEZBRDgGZvRJS2CFq4ZVCTVyBLck
 pL0slc06+NI1bAlTeDHuOZEzyl3wyf2gsLbSUsgJbZyRc3YhM+//g5gCxyudukoBShSF
 TZpQ==
X-Gm-Message-State: AOAM533QCU8HqmJeHLrLMzpxQhDgqm+i/gn4H026OyAh3kKud+fJXyTx
 AlJn9ztdsTqAAAAb+DRXpopDwh2Xec3fQySRp6E0WA==
X-Google-Smtp-Source: ABdhPJzq0NcMby1ZYDoH6Gc2O4jRrDN131uswMJddh1XV6xqDsxnUSBj6TXTxXOPxfuEJHbAofFla2oYYbmWFpTpv0A=
X-Received: by 2002:a05:6512:b1d:: with SMTP id
 w29mr2381579lfu.291.1626335746318; 
 Thu, 15 Jul 2021 00:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210714225002.1065107-1-linus.walleij@linaro.org>
 <20210714225002.1065107-2-linus.walleij@linaro.org>
 <CAD=FV=WnO+vH_6-KC8WZ4AyGY9knWz6ecK3Hwqy9CQX1RnZzQw@mail.gmail.com>
In-Reply-To: <CAD=FV=WnO+vH_6-KC8WZ4AyGY9knWz6ecK3Hwqy9CQX1RnZzQw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Jul 2021 09:55:35 +0200
Message-ID: <CACRpkdauv+UUAFwOgOJdVGEo+5-z89QHH-ZisWRLNBFsbhmhAA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v4] drm/panel: ws2401: Add driver for WideChips WS2401
To: Doug Anderson <dianders@chromium.org>
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
Cc: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 4:25 AM Doug Anderson <dianders@chromium.org> wrote:

> > - Alter the logic so that we assign the backlight handle to
> >   panel->backlight directly and save some code.
>
> Officially this is disallowed according to comments. ...and I quote:
>
> /**
>  * @backlight:
>  *
>  * Backlight device, used to turn on backlight after the call
>  * to enable(), and to turn off backlight before the call to
>  * disable().
>  * backlight is set by drm_panel_of_backlight() or
>  * drm_panel_dp_aux_backlight() and drivers shall not assign it.
>  */
>
> I do not personally know the motivation of not letting drivers assign
> it, but with the words "shall not". Yikes!

I think it's a documentation bug. I trust Sam more than the docs.
I'll send a patch.

Yours,
Linus Walleij
