Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6147A3A373D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 00:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B406E1F4;
	Thu, 10 Jun 2021 22:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6057E6E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 22:39:03 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f30so5664611lfj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 15:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IKiUR9q7IRH9RDtJ7qUTB3Y+piHrSfJz/dSB5CkqL7E=;
 b=ceuRDLcyzsXefbmdPG9I/V+E4/Nocd3hkdUSHq0c+42VDDPmzCp2roUJlnzRD2nEz8
 ypMGjldMH6iDgQ2ea1xdCYVzd6FvrBn3bH0OH++GOK+KnCk0CLDv45trU0tSPccfygzD
 v/Ndnn4dDqNhfEj1qxZo8w2S0x3SVr1ZaUr+uBoRER/IpWZKkfmqdhLk6t68d6vUAupc
 99QrXQ4OOK3uCkkC7ihTO80y5rMbHDS+8uddtf/RxsiiDfgcyu7gIMNqhzMmsvIVahyq
 q5//YVnPn/8wbNE09RbNlMZ1ff0LEgP9vF97R8hoJgui0n5F5+2aNUnBtrQNuf5J2GlC
 4AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IKiUR9q7IRH9RDtJ7qUTB3Y+piHrSfJz/dSB5CkqL7E=;
 b=tbgBHf1iZLCqJs4GTKQyiQfXO2eNoXkKNHe6yZE/xu3LJc8Ekm2+s4L0i4i+GjrPIr
 +AdXg65qX3Ama1Oa/8zvrH1Tlt/aBRmpcB0hbkNVPum4moJJfFbyQhvIQgvFxj3v6o06
 qtsHsiNxjbCcDdiR+M72rftb+MKpHr3NDWsiPCGzI2NDGom2djqKvAgyzcPusDQk6X+D
 cM5h+SGwYNTgeEQ5H6F4030lcZFloJQroWUxa748tgUFUzSGoej5w3wyN7lAmDX/9h4w
 gkqY7Che/oqQa4SlPMOwMtwg4RzBS8dedHnZM0BJyuzs0A30qzyMSF0kK7mEc3XwOB35
 +DDw==
X-Gm-Message-State: AOAM530aRCWav94weH3f8jweAV3u/kRjunLrLUyE2Xr0ufiRNT0NXOno
 /hleQTByATtggMPN3beOdmtcbeiZ6tZx3IZO1xck/A==
X-Google-Smtp-Source: ABdhPJy2Up0qaRmtX3q+ZWXdPVV/wYeOufGAyKI2iPQ8qrRHOYJ+f9H2vK2A0at1koieNXMiYThs4Y+9W5p70p5h2OA=
X-Received: by 2002:a05:6512:2105:: with SMTP id
 q5mr596575lfr.649.1623364741775; 
 Thu, 10 Jun 2021 15:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210610220527.366432-1-linus.walleij@linaro.org>
 <CAD=FV=XVCNZTPmvLPx7uvU8r8uuHai2Mxpxt0-Jv-ryD=grAMw@mail.gmail.com>
In-Reply-To: <CAD=FV=XVCNZTPmvLPx7uvU8r8uuHai2Mxpxt0-Jv-ryD=grAMw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jun 2021 00:38:50 +0200
Message-ID: <CACRpkdZ3=sjxi4VUi35Fa51amoxroOf1GLQP8A2kfZxVgsHwkQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/panel: db7430: Add driver for Samsung DB7430
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 12:30 AM Doug Anderson <dianders@chromium.org> wrote:

> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
>
> I would still prefer it if there was some type of error checking since
> SPI commands can fail and could potentially fail silently. What about
> at least this (untested):
>
> #define db7430_dbi_cmd(_db, _cmd, _seq...) \
>   do {
>     int _ret = mipi_dbi_command(_db->dbi, _cmd, _seq);
>     if (_ret)
>       dev_warn(_db->dev, "DBI cmd %d failed (%d)\n", _cmd, _ret);
>   } while (0)
>
> Then at least you know _something_ will show up in the logs if there's
> a transfer failure instead of silence?
>
> If you truly don't want the error checking then I guess I won't
> insist, but it feels like the kind of thing that will bite someone
> eventually... In any case, I'm happy to add this now (especially since
> the DBI stuff is Acked now).

This looks more like something that should be done in
mipi_dbi_command() in include/drm/drm_mipi_dbi.h
which claims:

 * Returns:
 * Zero on success, negative error code on failure.
 */

But no it does not return anything:

#define mipi_dbi_command(dbi, cmd, seq...) \
({ \
        const u8 d[] = { seq }; \
        mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
})

I'll fix up the include and apply then we can think about
what to do with mipi_dbi_command().

Yours,
Linus Walleij
