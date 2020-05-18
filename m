Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360F61D7999
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 15:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798DA6E154;
	Mon, 18 May 2020 13:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076946E154
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 13:20:09 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 62so5529194vsi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=smFwrGW+2ZYyRm3yJx9TvCDHllY75XTU0ZDXk/besJY=;
 b=P/j+l4rloAGJ5+zOh7ldG3MH1MdKGjKsbOchWEgDz0r3TcptKxJ1Bp8HWPcC1S3fmm
 rX/Ml0ruOt+Zix5rJNR8BVurvVsN/K4gCUQfEm62amnKjAll6C/pestSxWW+iWgQY9jy
 tTWNTrDxkQrfrVc+lNfLeVJrBgZ7/vicsqJWKimsblBlPKhR/CVoKdlJ3NNCPiHj0qtI
 bJ6v+HqXqrmGR0xZPvzDg/uhV1AwqgA3sHXFT5MkuzYewlbMnfUAmm2kngveuxpuS8e+
 8bF+VeDJ1VAOdMMzqlMvEgvuvxO+HvNfpuR4H+ZPstuBIbaUn4xjW0RSWNyPxwHa3724
 uDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=smFwrGW+2ZYyRm3yJx9TvCDHllY75XTU0ZDXk/besJY=;
 b=b8Wtwam0BgZbkKapjamFxGrNvueflGFBEgnZtAflpkW6Dp9h/vlEmtaFC6pX7tGnec
 L1YR2ecTvqwDu9L4NU5BQqkyqnwzTYIOafeN+CGG6CQwcsGAJMvCXWYaYt8NYNd8nLDW
 yBbzvlOV9qSSxIp5yxYn78hHUpwwYLm+u497baBVb0OuTZPc6rFz+r+b6Kh/tR35E6OX
 lX9W4ChGR2u9bPxqrWm4rJFHv0Whmf+LnavkqtGXrdEjdXJfajklGo2e+ybL367DNdwv
 B16HYAhPd1kStVJqGAaFuNqkOe0Z3rQGtKr9mBwLQHKojc/l1pzomcilb8KQ8XOGb4Hx
 bvmg==
X-Gm-Message-State: AOAM531SKuRh6mguuDsOkIOPSKO0XwxdbkH0onQDGqIruc8uUTp71At9
 zEyNC3zjPyngOrgl+wdDX+DLIeKtOwVmakwSo60=
X-Google-Smtp-Source: ABdhPJyB9j3yxm/3uct+3is6hkBldRsVNEHECFEnQ4z23rMWJaJ9Tdo/jYPHQ+KXggCqQyHhC6tZDoDIkFVYF/4KxZU=
X-Received: by 2002:a67:be19:: with SMTP id x25mr1506536vsq.37.1589808009106; 
 Mon, 18 May 2020 06:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <87d071aedu.fsf@mpe.ellerman.id.au>
 <CGME20200518112226eucas1p1aa59db1e75cf0f91454b8714c828444c@eucas1p1.samsung.com>
 <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
 <3bd8fb59-2a91-64d7-bef9-d5f717c49bfb@samsung.com>
In-Reply-To: <3bd8fb59-2a91-64d7-bef9-d5f717c49bfb@samsung.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 14:19:57 +0100
Message-ID: <CACvgo53=Vv7R-8BP32iQXwgvfxjJ8W5XCBmMq-tdUG-wUN6_4A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 May 2020 at 13:48, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
>
> On 5/18/20 1:19 PM, Emil Velikov wrote:
> > Hi Michael,
> >
> > On Mon, 18 May 2020 at 08:30, Michael Ellerman <mpe@ellerman.id.au> wrote:
> >>
> >> Emil Velikov <emil.l.velikov@gmail.com> writes:
> >>> As mentioned in earlier commit, the riva and nvidia fbdev drivers have
> >>> seen no love over the years, are short on features and overall below par
> >>>
> >>> Users are encouraged to switch to the nouveau drm driver instead.
> >>>
> >>> v2: Split configs to separate patch, enable nouveau (Bartlomiej)
> >>>
> >>> Cc: Antonino Daplas <adaplas@gmail.com>
> >>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> >>> Cc: linux-fbdev@vger.kernel.org
> >>> Cc: dri-devel@lists.freedesktop.org
> >>> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >>> Cc: Paul Mackerras <paulus@samba.org>
> >>> Cc: linuxppc-dev@lists.ozlabs.org
> >>> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> >>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
> >>> ---
> >>> Hi all unless, there are objections I would prefer to merge this via
> >>> the drm tree.
> >>
> >> Have you tested that the resulting kernels work on the relevant
> >> hardware?
> >>
> > Sadly, no I haven't. I'm updating the defconfigs as requested by the
> > fbdev maintainer.
>
> I've just noticed that v1 (patch #1/1) & v2 (patch #1/2) lack
> Cc: to powerpc Maintainers so they cannot see the context of
> changes in this patch.
>
Haven't see any instances of fbdev/drm patches being Cc to arch/ developers.
As such I made sure the commit message illustrates 1/2 as clearly as possible.

> Also you've proposed v1 yourself and it has already contained
> modifications to defconfigs (removal of setting the config
> options for the old drivers) in addition to marking the old
> drivers as BROKEN.
>
> It now turns out that v1 has also never been tested. :(
>
> Please don't submit untested patches without marking them
> as such.
>
Does x86 box with nv34 GPU count as testing? I suspect not :-(
It was been using nouveau ever since I bought it 15+ years ago.

Will be more careful in the future.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
