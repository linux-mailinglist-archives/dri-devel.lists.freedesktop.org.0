Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AA54E7A98
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 21:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7110E0D5;
	Fri, 25 Mar 2022 20:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F004C10E0D5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 20:04:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 827FFB81DEA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 20:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F58C004DD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 20:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648238697;
 bh=JI28cFosj0hQbiQ6cYI23TSiq2VzCwRhljqgvQDbbQ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GQzDytrmidWl11PE7mtefAgXudCIC5wg7deMIrHPFvoK33hiKNb2LWZpkWQFKow0x
 Ty9B9vw7hrbJe+wp1YeescGfNE5FZw8JlVlKTonO78PDQK2mf3YsGV4oCGjoWsWT22
 oRd3py9q+DMmyQCHf8h/xqabTxUmEpN9JkmdJbiZnlfh/9vQHfKXzR8+kNUEWUq7Kq
 sxgPcUH4UhQ5JaiHotjc27whL2rYnSXH1w0dybOQbZrhOAsc9gsg+nSd3nlBXB5nRK
 18cFOewREj6hRa4PJQD4fCnsD4T3NRok3824hD/mJrX+oi2AGT7l9kZhtpxdvGpPG0
 o6TOXeVquUgQg==
Received: by mail-ej1-f42.google.com with SMTP id r13so17421004ejd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 13:04:57 -0700 (PDT)
X-Gm-Message-State: AOAM533Tikt0Vqbk6K8M/HeBaOvDaN0KCG6l04AOYJFnkMX6T+8GNyAo
 +bpNrwGaXU/tVeFbe98PlQGDidutXb+SFG+UEQ==
X-Google-Smtp-Source: ABdhPJxIvvSbFL4Y+P7z8qk4Jutm9EIjreGeujAgtNHussiNQ0ZYgeUd3M6mdAAI87dQAF9rWTSVQaigvBxy0g4IjHU=
X-Received: by 2002:a17:907:1c1b:b0:6e0:6618:8ac with SMTP id
 nc27-20020a1709071c1b00b006e0661808acmr13342258ejc.82.1648238695556; Fri, 25
 Mar 2022 13:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
 <CAL_JsqJqb6HYN5cw7GsyFobZxFmhU-ci8w4HKQEdFsx=bC_F3w@mail.gmail.com>
 <CAPM=9tx+YeOCBZ0WRcSMKTyUYr5ngySratZ0K8tmRZ0rCaFf8Q@mail.gmail.com>
In-Reply-To: <CAPM=9tx+YeOCBZ0WRcSMKTyUYr5ngySratZ0K8tmRZ0rCaFf8Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Mar 2022 15:04:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ7EN0_4qxZL55j2GOHc_D0zEeH1TS+Dp5WJA1bPdgwEQ@mail.gmail.com>
Message-ID: <CAL_JsqJ7EN0_4qxZL55j2GOHc_D0zEeH1TS+Dp5WJA1bPdgwEQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.18-rc1
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 10:01 PM Dave Airlie <airlied@gmail.com> wrote:
>
> > FYI, this breaks the DT bindings. The relevant patches didn't get
> > reviewed nor run thru automated testing because their encoding was
> > 'charset=y'[1]. (While email clients seem to just ignore that
> > encoding, patchwork and b4 do not.) linux-next is still broken and has
> > been since Mar 2[2]. v2 of the fixes[3] have been posted since Mar 9,
> > and still aren't in linux-next.
> >
> > It doesn't have to be fixed in this PR, but it needs to be fixed
> > before rc1. Otherwise, no one can test their bindings using rc1. In
> > general, there's no reason fixes need to wait until after rc1 as
> > Chun-Kuang suggests[4].
>
> With the conflicts that Linus merged, can we get this rebased onto
> Linus merge, and submitted to him?

I applied the series without issue on Linus' current tree aa5b537b0ecc
("Merge tag 'riscv-for-linus-5.18-mw0' of
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux") and
confirmed the binding errors are fixed. Must be some difference in
what's in the Mediatek PR...

b4 shazam -lsSt 20220309134702.9942-1-jason-jh.lin@mediatek.com

Rob
