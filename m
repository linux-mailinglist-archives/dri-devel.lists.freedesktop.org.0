Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEB14B19DF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 00:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D076310E991;
	Thu, 10 Feb 2022 23:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4343710E991
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 23:55:39 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id c6so20199679ybk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 15:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NBgjpXZigvKnq2ReZid/vVB+xdrDhkSnQh0scwSixew=;
 b=xZbxhSdG7BP+bJnrVyoE2lszS+OHv+a+H3cQQ/XSPeuBnunccAuxwGYKSfskaMedG+
 M854Z+EZQraXLGral30yOEGTBOxMdz2uKrWOI4zvQlOOUMiIBbEj99+ZHDFFoIPOYpHX
 FWVn8PSeldaBpwu8/kCQdARjDyNTXAQ6Gc3X6ARJRIb/8EfAQjg9JJTpALPioBWNXJms
 GbUG5ppLhIkhcipfpkHzhmLVaYwOfmwgN+/Mp1E6pB7sM8K5YmMFALbSjsySG7zeVMyN
 2ZYQFhiHmgerzNCmL1Pb6REYcyjuhJXQDBIy3ElkgmmTYutzGkK8emj4JbhcDG45LwX5
 yaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBgjpXZigvKnq2ReZid/vVB+xdrDhkSnQh0scwSixew=;
 b=f5Rgg8V0rdfFAxXtc2Prvoi+Qb7jxEeMeLq4Adi6M97xsu91IdYk5DH/f+N9uY/rFm
 6AKcm7xuiGsejr1cxEG7gQkjMaiG6p9//azrPp1bwF8HJ09U1pnEfB9hQUjFhrA5mK7w
 g9BrOjBmaCJU8gqbham+/NPRF5CZjGb0rC5OWc3HWuMFQGdV+dU5Jhoz9KAwGubV1mzN
 11SBPkr/ona6deMF9nHw67UePk5PeYXeEb8mwTc1Bzg52dQXlxU+ukOVl2ZlNf/Oo34+
 ImwePkceK2T2XGJ9j4e+26lRj57aBKeFp+JtfLJ7lzYA1ejIouDWo1GIY2M+CgDcEYTa
 qSTw==
X-Gm-Message-State: AOAM532ZcvnzJde21WtYkna3+75YbcKFjgeoMcuJAiSzn6qOoI8U0kLK
 /KzAtL2qvZR5sNuBOBSzNmou1hQvrta8+5HqLLDKrA==
X-Google-Smtp-Source: ABdhPJwipupTHC/BooALieYlhlXLEn3fYioHlw3JUyAr99lmECPcYnKONg/T+vXDZIAm5NxFs4SAErzm0/3TmmckDVg=
X-Received: by 2002:a81:4cc3:: with SMTP id
 z186mr10395825ywa.140.1644537338489; 
 Thu, 10 Feb 2022 15:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20220120150024.646714-1-paul.kocialkowski@bootlin.com>
 <20220120150024.646714-4-paul.kocialkowski@bootlin.com>
 <CACRpkdZnw-Tf2eQwO+LZRW4UacR09qWRWct00=XLb4pfa-N3=g@mail.gmail.com>
 <CAMRc=MewxfQqM+QvzqjP05Qe5TeiEx+iiOFZLmieqCCVOL9UGQ@mail.gmail.com>
In-Reply-To: <CAMRc=MewxfQqM+QvzqjP05Qe5TeiEx+iiOFZLmieqCCVOL9UGQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Feb 2022 00:55:27 +0100
Message-ID: <CACRpkdb2d2q8DjgjG5_h3TH0ppugAEVyRvYGhNMrWy3fzq2Jcw@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] gpio: logicvc: Support compatible with major
 version only
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 8, 2022 at 10:55 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Sun, Jan 30, 2022 at 1:43 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, Jan 20, 2022 at 4:00 PM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> >
> > > Support the newly-introduced common compatible for version 3.
> > >
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Are there dependencies between the GPIO patches and the rest?
> > Doesn't look like that.
> > Can Bartosz just merge the GPIO stuff to the GPIO tree?
> >
> > Yours,
> > Linus Walleij
>
> Except I'm seeing there's no agreement on the actual compatible yet in
> the previous patch.

Yeah I noticed that after writing that :/

Yours,
Linus Walleij
