Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577B24453B8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 14:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B496F382;
	Thu,  4 Nov 2021 13:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D388B6F382
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 13:19:47 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id b13so7200937plg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 06:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6znl9g1aF/ktgrLgP4pKgxmC6R6G/5lzoN2lQ83r4Mg=;
 b=SScnlvLKSBYSwGgZP4vXFrjpR6++jonn1IAkJ/8MW2BJSA2mHq9ozIp5zOWltU4txf
 KEcAkUp7XKW/+xjgW7JHZmku4Gs1DG1S9cxWEc9mAGaJjLIp/M4m6vr+GREIlJkTIG1M
 Q30ULMEpm+YSsPBT+BzB4nLMw1tkXFptMuD90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6znl9g1aF/ktgrLgP4pKgxmC6R6G/5lzoN2lQ83r4Mg=;
 b=onhQTtJ5GkMKOcvhMk7WqvVhpnEdGmBpysnD6sR3mb+Lr+TEBkpJVKlXO3u+3b9w5B
 /QsWjLuFhbvJw3fh8fVYw+IcwgOqYlH8KdVcXl7tRA1qCiHYN7J9mvmDQSavQHVsTNTM
 1AYxyOGsx/1LYkicOWBu3oJMI/+U8Yw7GBA3CzPX45WyygdI3JFX3DLkmhXmYwH0dFtC
 4QEQXptluCWTUqKk/WwQZ+8R8gIpwHv0OHYy2IS3hXudeuEJ7QesOplefDFAgYgqc8Qo
 NfBtMvzSe1hUCP3zbGWHDfPvtZjhFabzH9lLkULAsR9CwLOMukQxX7u+AjbTXu5+d3+q
 SyYQ==
X-Gm-Message-State: AOAM531FI1tuLi9ncDF1pKmyB9OStSILQddmP5RdWysMmxCaGYILHuVt
 sLv3FS5OJ9HVAPt0ihWsY1TY8aYQWF7JbxwvrbCDQA==
X-Google-Smtp-Source: ABdhPJwRuqvbL3YNO+3lAhAYC8fQPcfdCceIuT0J9FcvnJEdBufdZI50ieoIk0wLUXqk5ffazI6KxxaDW3Yu6J/9Ljs=
X-Received: by 2002:a17:902:6a86:b0:13f:f048:9778 with SMTP id
 n6-20020a1709026a8600b0013ff0489778mr44611543plk.27.1636031986615; Thu, 04
 Nov 2021 06:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211016102232.202119-1-michael@amarulasolutions.com>
 <YWrFIz08A8ZVKXvi@ravnborg.org>
In-Reply-To: <YWrFIz08A8ZVKXvi@ravnborg.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 4 Nov 2021 14:19:33 +0100
Message-ID: <CAOf5uwnv=MxqK772YJ3mggkqFQJW+Z3_WrCNHgDPTpDH8d-2Xw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add support for Wanchanglong panel used in px30-evb
 v11
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam

On Sat, Oct 16, 2021 at 2:27 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Michael,
>
> On Sat, Oct 16, 2021 at 10:22:27AM +0000, Michael Trimarchi wrote:
> > This patch series add support for W552946ABA panel. This panel is used
> > in px30-evb v11. All the patches can be applied on top of drm-fixes
> > branch. The last patch is suppose to fix a race when the panel is built
> > in. Tested on px30 evb
> >
> > Michael Trimarchi (5):
> >   dt-bindings: vendor-prefix: add Wanchanglong Electronics Technology
> >   drm/panel: ilitek-ili9881d: add support for Wanchanglong W552946ABA
> >     panel
> >   dt-bindings: ili9881c: add compatible string for Wanchanglong
> >     w552946aba
> >   drm/panel: ilitek-ili9881c: Make gpio-reset optional
> The four patches has been applied to drm-misc-next.
>

I sent another fix on the same panel. Are those patches queued on some tree?

> >   drm/bridge: dw-mipi-dsi: Fix dsi registration during drm probing
> This patch looks like it does not belong in this series.
> Anyway - commented on it as I did not understand the code.
>
>         Sam

Michael
