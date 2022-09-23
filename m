Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED9B5E7CB5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 16:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B75110E990;
	Fri, 23 Sep 2022 14:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E15110E990
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 14:18:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id z13so994891ejp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Ru59U2esiIhk7+EF+2LbnUHsFAZoPlTGUQLU9H/L14c=;
 b=lHeWZbXQLCDE5ZurhMHvC4i50bxjwMsuwGjWkCl6Gy9Gdaga5OTJi0ceH3MH4cPaZR
 QPz2VWjHblPDQPMUXr1e61RR7DbdGhRqKMaqv7SJLh57MkA/sHifI+zV8QbXUtyk4dH5
 imJtdwNU5fnhqDFcQYI2xB7/fI0W9pP9n4zUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Ru59U2esiIhk7+EF+2LbnUHsFAZoPlTGUQLU9H/L14c=;
 b=6Lj0RGQ6+7Vn7xK4GGF6HydqSddyAg7VTDss7gfJFDjxTVMZx7sHy9BBOzT8k/3O9o
 ENUJKTX95BXjxoNGQZZ3FeQe26hJRT/9iVhLKUnUy5F911joAsSCMGLdHTUuJG+3enCF
 uURmP9p4IJ5FpqXQuZ4D9Z/LxlkJysK1NzXS+hQJgPYRs6TejN8fU9XdehpfvF4Eo+gG
 G3dGnysVkjGss6VZtyynxH0S0WBrcMdg7O6dq06mE+EEOjUbf0pqvSOrF5g9cK6HLUbm
 Z8jXFMVbI+Cis7RtlzwZxyY0N2fADlKROTeN+/ltoY1iRpJuCiy7S5SZ/iOaqh9qTGT4
 lWQg==
X-Gm-Message-State: ACrzQf3ngXEZFAYcOF3TysWbbmZE4X2MsmmC8A+PC5UvFbi7tgG0G90S
 d1UZyAmYz/EeiST3HZBIn9YMnsF9Xmg7Dg15
X-Google-Smtp-Source: AMsMyM47SzT+jIOm9K3eSU7zmDDyrQTFm5+elfTg+19RzphE4MsA5dIT8jTS8o6T0BmpPeaxYdqXEw==
X-Received: by 2002:a17:907:94c6:b0:77d:7ad3:d065 with SMTP id
 dn6-20020a17090794c600b0077d7ad3d065mr7308169ejc.149.1663942687587; 
 Fri, 23 Sep 2022 07:18:07 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 q14-20020a1709066ace00b007803cffd31fsm4010724ejs.215.2022.09.23.07.18.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 07:18:05 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id e18so318395wmq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:18:05 -0700 (PDT)
X-Received: by 2002:a05:600c:19cf:b0:3b4:c8b6:15c6 with SMTP id
 u15-20020a05600c19cf00b003b4c8b615c6mr13369432wmq.85.1663942685258; Fri, 23
 Sep 2022 07:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220822180729.1.I8ac5abe3a4c1c6fd5c061686c6e883c22f69022c@changeid>
 <CAD=FV=W5X2XvvKT5tq+1ywJSmVB0TAHquGgn02uNmn4s-sqndg@mail.gmail.com>
 <CA+ASDXMetKHtL8Hm_=S7xPcHX19FDaCoXtHmh=E6i6pLEXQZ0g@mail.gmail.com>
 <CA+ASDXOMYGgaJSrxQUNFhN+9qT-kfedk_UJJnOO58iJpWdxu1w@mail.gmail.com>
In-Reply-To: <CA+ASDXOMYGgaJSrxQUNFhN+9qT-kfedk_UJJnOO58iJpWdxu1w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Sep 2022 07:17:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xqbx+fzPMYv8VJ-u3=tJf7cX-bmpHhWSOvs6tQU+cRiA@mail.gmail.com>
Message-ID: <CAD=FV=Xqbx+fzPMYv8VJ-u3=tJf7cX-bmpHhWSOvs6tQU+cRiA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm: bridge: analogix/dp: add panel
 prepare/unprepare in suspend/resume time"
To: Brian Norris <briannorris@chromium.org>
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
 Zhang Zekun <zhangzekun11@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, xuqiang36@huawei.com,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 12, 2022 at 11:48 AM Brian Norris <briannorris@chromium.org> wrote:
>
> On Thu, Aug 25, 2022 at 11:06 AM Brian Norris <briannorris@chromium.org> wrote:
> > On Thu, Aug 25, 2022 at 10:37 AM Doug Anderson <dianders@chromium.org> wrote:
> > > Given that this is _not_ an area that I'm an expert in nor is it an
> > > area where the consequences are super easy to analyze, I'm a little
> > > hesitant to apply this to drm-misc-next myself. Ideally someone more
> > > familiar with the driver would do it. However, if nobody steps up
> > > after a few weeks and nobody has yelled about this patch, I'll apply
> > > it.
>
> For this particular patch, I'd be interested in whether Zhang Zekun
> has any feedback (even a Tested-by?), since they were patching this
> function in the first place, which is why I paid attention:
>
> Subject: [PATCH -next] drm/bridge: Add missing clk_disable_unprepare()
> in analogix_dp_resume()
> https://lore.kernel.org/lkml/20220816064231.60473-1-zhangzekun11@huawei.com/
>
> But in absence of that...it has now been a few weeks :)
>
> I'll also mark this to come back to again in a week or two, in case
> somebody is still hoping to wait longer.

At this point people have had plenty of time and plenty of warnings to
speak up if they cared. Since this is a fix, I threw this in
drm-misc-fixes.

cc62d98bd56d Revert "drm: bridge: analogix/dp: add panel
prepare/unprepare in suspend/resume time"

If anyone comes along with a late objection, we can always revert the revert.

-Doug
