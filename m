Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF774F1960
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356D410E8E6;
	Mon,  4 Apr 2022 16:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CA210E8E6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 16:36:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C168DB816F4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 16:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7251CC34112
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 16:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649090156;
 bh=fslE+bfMzXZmNqVRUnqwIZ3RkklMdihxp3zMSxU6z0I=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=tr+x/YygrnYsb2LWxQJiZNToAq1q4prwXauJcbinUsS+406bkOHw7jOFv2gz8atZH
 dEpwPDgBlXPKoevWPBxYKN1UzF5OwOA/3Z/HtPwyhnajyQccjFWwpK98epFkjoHrhN
 0RyLh/Auc+BIqGDzHHQvIPie+RWRV1zq2SPTadhHpHDKUYPMs7NQOrNJtFzczJHW4W
 swVjR9+aQq26cFufsnTCiaGR9gH7EtlKPKOCggynZUPoI6JOD+lcGWyKP0IXiwm0OJ
 PsxO0yWpovWcotXNqgkOUBn3hYVzP3Thy6agGDvh+9Tezz2K0p1kk5v4/CbN03h+aX
 Afbr8OT2fdLGA==
Received: by mail-vs1-f52.google.com with SMTP id s19so8633514vso.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 09:35:56 -0700 (PDT)
X-Gm-Message-State: AOAM530DpLbC138VAkSw9PKiAwqyNYFKhbbphvSBkyyUx2jPG5Sh56eE
 Mhjbp5UoReASUJLnGvd4SqGdpfiKSg/Isa6wcRc=
X-Google-Smtp-Source: ABdhPJyGDIDlaUpId0PQ0DUCRmbqlA3kvbWrDcX2Sdu8iqF2EW/GtKuxF6yNUyp90p1RHeqPpBRip7a/5T56K1Xl5/I=
X-Received: by 2002:a05:6102:3bd2:b0:325:44ac:69c3 with SMTP id
 a18-20020a0561023bd200b0032544ac69c3mr291093vsv.63.1649090155446; Mon, 04 Apr
 2022 09:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-5-wens@kernel.org>
 <CABxcv=nLQdz9bVrfqw1MaKREh0uRBvc4wX14AORETaDJAin-Fw@mail.gmail.com>
In-Reply-To: <CABxcv=nLQdz9bVrfqw1MaKREh0uRBvc4wX14AORETaDJAin-Fw@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 Apr 2022 00:35:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v66P+5Tj7BgUJCayWjB6UZhQ5wSFdX=RcwRqX4bYw3UOBg@mail.gmail.com>
Message-ID: <CAGb2v66P+5Tj7BgUJCayWjB6UZhQ5wSFdX=RcwRqX4bYw3UOBg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: ssd130x: Add support for SINO WEALTH SH1106
To: Javier Martinez Canillas <javier@dowhile0.org>
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
Reply-To: wens@kernel.org
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 1, 2022 at 6:10 PM Javier Martinez Canillas
<javier@dowhile0.org> wrote:
>
> On Wed, Mar 30, 2022 at 9:09 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> >
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The SINO WEALTH SH1106 is an OLED display driver that is somewhat
> > compatible with the SSD1306. It supports a slightly wider display,
> > at 132 instead of 128 pixels. The basic commands are the same, but
> > the SH1106 doesn't support the horizontal or vertical address modes.
> >
> > Add support for this display driver. The default values for some of
> > the hardware settings are taken from the datasheet.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  drivers/gpu/drm/solomon/ssd130x-i2c.c | 11 +++++++++++
>
> Thanks a lot for this patch. It's very nice to see that another
> variant of the OLED controller is being supported!
>
> I wonder if we should also list SH1106 in the
> drivers/gpu/drm/solomon/Kconfig file so people can find it ?

I can add it to the help text if that helps?

Recently someone mentioned that users are more likely to find drivers
via compatible strings though. And I believe there's also a tool in-tree
that finds all drivers given a device tree.

> ah, one comment I forgot in 3/4 but that also applies to this patch, I
> believe the convention in DRM is for the subject line to be
> "drm/ssd130x:" instead of "drm: ssd130x:"

Ack.

> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>


Thanks
ChenYu
