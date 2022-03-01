Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE814C8995
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 11:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B63110E631;
	Tue,  1 Mar 2022 10:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37C089819;
 Tue,  1 Mar 2022 10:44:05 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id r7so17968825iot.3;
 Tue, 01 Mar 2022 02:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dohQLzfhr7wZu6SxVtIw3CHG42SObGN2SXyswtlVBsg=;
 b=WrUDonvN2fO25UTk5VNVhFhd8gruRaN5xzDoP4JD0Sakac0hlwGn0vLFs4yYd4XAFv
 uZKJIKn4j7cuELvqeeSDPXMNu2C1n0MsJpfl9rt1CcXMWz8ysAwYiWu0FU5ssFw8GnBu
 KImb7bl4uZxpEQ889GR2FwiQtAowT5cOncwrkuheaR+UErGWa6dJdP5knzUj9ZNji+C6
 SaCIGAmJwbqyXPo1H+nGW/xKoV4Sv5xxMQcmeQv2UvCQ1LPx9cytIPoPatO3xtpXO37Q
 QL3drAKRoTDr8u6LO2OfPrWDqwyTUyYOMOn4N3XOwbIN3FW3QG+ijjXJMFfWWnQ72HyS
 YuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dohQLzfhr7wZu6SxVtIw3CHG42SObGN2SXyswtlVBsg=;
 b=fYEMdJ5+FPFFp3tHfuZPkEAWnlaVjOSk+jEwi0Zs/1MrGGl4oUqs+8BDM0Vgya38KA
 qzRLCa+edwLcuP3fYStVZnB1NvNnl09yxNuo3HebCp3P3JHPPbhdFwl3OnPBm7Sz3Ozr
 67QMuAYmWMdhfZAIEG6WLqFpMuqRjiA3SMXhplV4Jwr5qnxpYH+ys4BUqVPiMRI2Uzi7
 WA5WU7yHEmgU2ZM7Ot3XFCoQne/KkjXw//wVAN10KKEKMqUJH0x+h74r9/TjonUTwAiL
 U+vGvAVuv9Av4VHp8MBGv4DFJlLYSDxnIORsxHwG7eW7tlVq2IkwdCdrTBrKCHrWlasZ
 BdNQ==
X-Gm-Message-State: AOAM533SnM0QXgX5LSqPIab4VInY97qK1zVsjNG9XJ+hBOVF3fwvE8Uv
 R2Lb+xMp0f5T6OzZIFOQyD60FiD0BtcxwfOQtoQ=
X-Google-Smtp-Source: ABdhPJw1aZ/CGkeAZM6RKVYVHBay0f9lMjJdsMqyLhdijbZf60uaKu7bggqdaHiabrS+XPZY5qiqhEF5Hass1iDJqZk=
X-Received: by 2002:a6b:661a:0:b0:640:dd42:58ff with SMTP id
 a26-20020a6b661a000000b00640dd4258ffmr18921633ioc.64.1646131444958; Tue, 01
 Mar 2022 02:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Mar 2022 11:43:53 +0100
Message-ID: <CANiq72=wmYeBcJvRbBgRj1q_cHjZBVjxStXSu-8Ogv5bJhCqpA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org,
 Alex Shi <alexs@kernel.org>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <src.res@email.cn>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Btrfs <linux-btrfs@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 11:32 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> -under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
> -(including some C99 features). ``clang`` [clang]_ is also supported, see
> +under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11
> +(including some C17 features). ``clang`` [clang]_ is also supported, see

I think the "(including some C17)" bit would not make much sense
anymore. There were no major changes in C17 and GCC implements
`-std=c11` and `-std=c17` as basically the same thing according to the
docs (and GNU extensions apply equally to both, I would assume).

When I wrote the "(including some C99 features)" I meant that GCC
implemented some C99 features as extensions in C90 mode, and the
kernel used some of those (e.g. the now gone VLAs).

With that changed, for `programming-language.rst`:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
