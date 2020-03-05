Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7559179FF8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 07:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E7A6E053;
	Thu,  5 Mar 2020 06:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565296E053
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 06:27:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id t21so3593751lfe.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 22:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xq//95yjsv7+XKegrjWDJjduvVLydzGY1CCr26JRJX0=;
 b=wwmtiwfo83gTY1AbBywyXtOMQY5QtCCHRB6odhbptbBjuGae73b5vi9c4en0jAZYKO
 wrJQMlNEa6IQN3lfTLussifMAoO93ANuCoHTGX3/hJPXJrL3bjZ76cu7KkaRzdkvDEqw
 wF2FYemsGmx4SGTr0kkRWUW9ti449qT4p4IS+bT8riHGzRf0YINKAdw+/xZQJNmmA1rs
 tufmreK9UlDHd1TOH4sACWXKC1EoIHp99fjaJ/h1msCabj0tDE+4Jb2YKLLpR10Z7BcH
 1DJRWbSx+BXAMhOt0bw+XtAbLQh9I3I3w7hbGtKfH/xg+q4DAsui2M+rHP+iW4Y3HfBP
 M6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xq//95yjsv7+XKegrjWDJjduvVLydzGY1CCr26JRJX0=;
 b=iqIFZ02joyq/RvCP/5YRk0LSVgnioBjyucFvFx6UPzzwJY+2mdA93qUBfK5w/1UXT6
 8A4Ud1IxTeL4L9bDC44INu6Fd3cvtaLsL2zXAEY50E/ARQVefZo00Gc18tA5e/1u4s6+
 AFw/ZwKzy8TdY0g60gw6I+Ir66ljAAz8CoqFd4rB8tUcyl+KLuwk4dHJ7GHu8lEkwWlh
 BxJehURXcxWcfajZgCLfqdsAYrgwUtl+caFul1ZrFvZAWDEJmxFzWgnZGZGkadOp3gxi
 WqFyNf3wW4ALw9kttO1qcYi8JBr4aQjSToqNKLSKktoGZXzfEyOrHvDTAtAQq5scbILA
 Pb/w==
X-Gm-Message-State: ANhLgQ2aObl9iOARbUC+JUcjeiEUsVdqobRDBtQBy/NG6k7MBtHRJPrM
 T9vHN0UcXQdWG+uvaCiHOrZ4dp8ER5PLUHwXg/3uXw==
X-Google-Smtp-Source: ADFU+vuIH9zBxxLqZtdH9/DZxQEUyDZ0MnJdYsWJ87Je00SAS3Xu9AyzQ3h8Y5lWSmWB1RxyaDx2gvx0kniZuk88wh8=
X-Received: by 2002:a05:6512:322d:: with SMTP id
 f13mr4459613lfe.24.1583389656693; 
 Wed, 04 Mar 2020 22:27:36 -0800 (PST)
MIME-Version: 1.0
References: <20191218084320.312561-1-pbrobinson@gmail.com>
 <78a1badd7c08ca39e7f62c6b66addeb2bf485a1e.camel@suse.de>
In-Reply-To: <78a1badd7c08ca39e7f62c6b66addeb2bf485a1e.camel@suse.de>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 4 Mar 2020 22:27:25 -0800
Message-ID: <CADaigPW9HyH4GtjY2Y4dSDe8EoevtS5HY1=Vk4GSOHWKduH6_w@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/v3d: Add ARCH_BCM2835 to DRM_V3D Kconfig
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 18, 2019 at 6:39 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Peter,
>
> On Wed, 2019-12-18 at 08:43 +0000, Peter Robinson wrote:
> > On arm64 the config ARCH_BCM doesn't exist so to be able to
> > build for platforms such as the Raspberry Pi 4 we need to add
> > ARCH_BCM2835 similar to what has been done on vc4.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
>
> v3d's upstream implementation doesn't support RPi4 for now. So I don't see how
> we could benefit from this.

All you need is a compatible string for making this driver work on
pi4's v3d, so this seems like a good change to be making, to me.

Peter, feel like defining the compatible string too?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
