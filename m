Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4540536932
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 01:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EA310E108;
	Fri, 27 May 2022 23:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE2010E15B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 23:41:15 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id i187so10256653ybg.6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 16:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i6fxNe1Yr6PM7bPFKoIRTPqlhmZN8j/BfeWdZm7S+GE=;
 b=kh+ddXudedr/FfFvhJB31s60mRvJ61namZkEwazfz5hKURIbMiIzy59PZfFNwztdbo
 EuA/8/g2Shr45xriJg7oTsLTLYol/pLhi6xS3K45Uwp/CPioC9tIHhBUMrOyN+cmRHAH
 4louErDjJjimWMfZiJTYRLUZCH86PxlLRpYaaTln4aUHrNM1/dCz1C0ERRQf4MEFxvay
 +3vZmR8YG5zewoq7jQKqY/jdprEpklh8LIdX9/B7mmyT+/SgFPrUIqpzU2Hix5xAWJHw
 H4ePD6ixeJJApDOVfWgW2mw0r/coqR1QswjYnLY0bJGcyi3+cZunR8QzaELqxi/8c1C0
 8FWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i6fxNe1Yr6PM7bPFKoIRTPqlhmZN8j/BfeWdZm7S+GE=;
 b=21XmwDgynzvjN75a4NSXCuLT7tnowmLrck7DNF5+zBlZmYzi8EA4eNuMbEADLYXpj1
 ELrw/ZZLr0bQFslYBLX1nQPYByeUxdtp996+Ae8Q7/Qk4LzyKC8T52B1H+/HjkO8ksy7
 FL1hO0X78jSmdk0k8hUsVD59VZCWi8boBq72bmJgyaYeceNmGG+wh38uyfWOSmJuLoP3
 cy5CwswXkvRv0YRMIeawQUpUTS3oEnTz3HPNO4muLFJ04JTmjf4RHYSMOyTx9NtPsxXu
 Bwp+tWZtv73vdDaSzI86QCmd2O0xkdrIw7tQWAyQS0WMG6ayxzczdfay9XTNmsQ8/YFG
 8EXg==
X-Gm-Message-State: AOAM533wzl70fVW4LqJS+DsM39E6PHayzrJk+Mkbn6eIj6SgcOIiAb2j
 xt6TDDBUv66LNCAffDRW7wEXftKkvEs1slAn82w=
X-Google-Smtp-Source: ABdhPJxXE8RcGKITbfw6RqG9GXDU78NhnsekVk7tM1yeTVB7yk+R8s15LGau3IhaA6ubVznIFuJUNbFyDrBtslEK9qc=
X-Received: by 2002:a25:bccb:0:b0:655:879e:e1b2 with SMTP id
 l11-20020a25bccb000000b00655879ee1b2mr15636924ybm.364.1653694875094; Fri, 27
 May 2022 16:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
In-Reply-To: <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 28 May 2022 00:40:38 +0100
Message-ID: <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 27, 2022 at 7:56 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, May 27, 2022 at 2:07 AM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> >         declared with attribute error: BUILD_BUG_ON failed: sizeof(*edid) != EDID_LENGTH
> >
> > And, reverting it on top of mainline branch has fixed the build failure.
>
> Hmm. That BUILD_BUG_ON() looks entirely correct, and if that sizeof()
> doesn't work, then the code doesn't work.

<snip>

>
> Very strange. It would be interesting to know where that sizeof goes
> wrong, but it would seem to be something very peculiar to your build
> environment (either that config, or your compiler).

I just tested with various values, sizeof(*edid) is 144 bytes at that place.

My last good build was with fdaf9a5840ac ("Merge tag 'folio-5.19' of
git://git.infradead.org/users/willy/pagecache")
And my setup has not changed in anyway since then. Also verified the
build failure on my laptop.


-- 
Regards
Sudip
