Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD10E419F9F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 21:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5D589E0C;
	Mon, 27 Sep 2021 19:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4BB89E0C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 19:57:46 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so26035576otj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 12:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ONQHO/Bzi5LFkOtwJS2vhWiuGqb/wIXJtxU1fHbPl8=;
 b=Wb7xiO1cI0MfWuS+695CXwjxtBdtVtrQvJDK9SFDz1vxh7CK3HOiUog8QJXp6qtWBL
 EL1KbLzoz+pYkbwOA24q0ibT8HzvO7QIIcPl35X9CIzWQzBHd2SS/aJR089sVLOfem9+
 i2BXO4Fe4jZMytYXFF4Gv74oA+ImkhvoOKDMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ONQHO/Bzi5LFkOtwJS2vhWiuGqb/wIXJtxU1fHbPl8=;
 b=6La5BO0JTyg7fkx+Q9hJdaHm3/IzGL6kanFBsJ/5D2Rq5b3C/lXjrBVWKjgjl3gJGI
 Y2xpuUwAvPhzsDPAZK2W8mcMfSOgqhXgNjJVpT2SHF/XlhRaO3fpf4UcgSV+AygN+q+4
 fyryYtvsSFmyd3ycDf0v44/0tZT9NsdqkbEVo7+PFvQy2xDx4jKwr00fvKmLcLpkBfN5
 UOWNU8Av2lPRgCl1uNQUKANJi3Gb7Mqu+lBMKKvp26qnHIX7JynRyth0NLfI5MnyOzaL
 6RwedGMdxvBspU088M+2hos+vFXC+XBoG1g9CuvTINf9ksDaZsx0QsleTZGFrkqwoC69
 L8WA==
X-Gm-Message-State: AOAM532LcWGrbvnYfMypmmEdM1s51mMiiXWeirNcIzmh0lZaDT/PTiGu
 pBgo9osjn5mAWMJ6CR7Wzk32wop1auEozw==
X-Google-Smtp-Source: ABdhPJz/0gzdMkGsdUGbt6DgrXrQKRxDhbhrZPD6j7rCXYtG+cF++RD8nioCa0t5umSZqIPo2paxlA==
X-Received: by 2002:a05:6830:2690:: with SMTP id
 l16mr1582034otu.99.1632772665674; 
 Mon, 27 Sep 2021 12:57:45 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com.
 [209.85.167.174])
 by smtp.gmail.com with ESMTPSA id n73sm4258271oig.20.2021.09.27.12.57.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 12:57:45 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id e24so17194415oig.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 12:57:44 -0700 (PDT)
X-Received: by 2002:a54:4393:: with SMTP id u19mr659705oiv.77.1632772664480;
 Mon, 27 Sep 2021 12:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210927175944.3381314-1-briannorris@chromium.org>
 <20210927105928.v2.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
 <CAMcCCgS_r17Lj_qPX9TdH3=7D_tiXu9OzL=dDNS+9MZyOUv-+Q@mail.gmail.com>
In-Reply-To: <CAMcCCgS_r17Lj_qPX9TdH3=7D_tiXu9OzL=dDNS+9MZyOUv-+Q@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 27 Sep 2021 12:57:33 -0700
X-Gmail-Original-Message-ID: <CA+ASDXMyaWfg07UEcbN_N4WBK=PzVO+SnwZ=VnjL2hJDWvOxDw@mail.gmail.com>
Message-ID: <CA+ASDXMyaWfg07UEcbN_N4WBK=PzVO+SnwZ=VnjL2hJDWvOxDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/rockchip: dsi: Hold pm-runtime across
 bind/unbind
To: Tom Hebb <tommyhebb@gmail.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wenst@chromium.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, 
 Linux Kernel <linux-kernel@vger.kernel.org>, aleksandr.o.makarov@gmail.com, 
 stable <stable@vger.kernel.org>, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 27, 2021 at 12:18 PM Tom Hebb <tommyhebb@gmail.com> wrote:
> Reviewed-by: Thomas Hebb <tommyhebb@gmail.com>

Thanks!

> Thank you for catching this, and sorry that my original fix broke things.
> There had actually been a report of this breakage from my patch, but I
> missed that email until it had already been merged and then didn't have
> time to follow up on it. Totally my bad.

No worries. It was a 1 step forward, 1 step backward kind of a thing
anyway -- things were broken in many cases before your patch too (with
very similar-looking symptoms) -- so the net result is still good,
having both issues fixed.

I'm not sure how that ideally should have been handled [1], but it's
totally fair to not have time to follow up on everything. At the
worst, we could have reverted things; but again, I'm pretty sure
things were broken just as well without your fix, just with a
different root cause.

Regards,
Brian

[1] Don't accept (or, revert?) your bugfix until what may or may not
have been a regression is fixed? I'm not sure.
