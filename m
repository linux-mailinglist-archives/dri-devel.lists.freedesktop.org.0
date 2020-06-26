Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E2020AB65
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 06:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB29E6E39C;
	Fri, 26 Jun 2020 04:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7871B6E39C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 04:44:05 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id k4so4300654otr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 21:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DAJaCkJFFm7kDUaY1JSd+xLbKI187JICCdu1DC7/qME=;
 b=xKU8wsnL0SlmU0Mecj4Uquab8z+bS/JPU9n43Y9aKdlxeQSF/WqqleMgsp4Y1h9Pj2
 sgSdwfZCNcxH58t24B7Myz/69yJFpsGfr9TO418QasPeYbHX8e/8ODAHYG9E//NypUo7
 7n9k7+M6ioUljU9IoFCZnYkiaU28a2oH7HGp26u6CHXergEMLNZu98JW+VV/m6pUTIY4
 MTj1hbL4zZtc+5cJeUNydk7ovX5iGCc8N64rDweJuHQoLbnenRdQqnl6A9VSRoyKBCd2
 GR2UvxrjlwrEQ+utrrphfKP8PQ7ppIKkc/bfss5Yqo6sLNUVgQDiO97mLh2xJc8t+5ZN
 irRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DAJaCkJFFm7kDUaY1JSd+xLbKI187JICCdu1DC7/qME=;
 b=CF0iiQv8tFAy5NRQ2tte9LxRp2vzwEXXOKEYtOWnn+NYsY5DMHg+JSo7AjrXOFfs+y
 V1pOBway61jhwofJCW+rCnM3m33BV5BfNEs9eFVJ2oZd/1cmsyL8v4D1QE/RnSjJlAtp
 qK5ZnDAq1f1K8mMHZq/ROj6eTpWQK5Z4WzyYvG5TiEfOJfvRUXDu9fDYpfSrninGnGqK
 hC0ld8R3Bk5Kml1uL2Oz35zwrKgBRl8umq65K4w6NL2eyLCFr3aagpYU2p8XBGqotFwS
 uShnIf3MO1+a+4LZNGWGlwQ76qcgOJuak1hGbMgWuGvrRQs3H7+dAjYEYojnhrFvv8in
 6LOQ==
X-Gm-Message-State: AOAM533H7/wy/dklNWLZ45hPvkWmuSU1LGDiU9eOc/+Up2K3X2S9Bogh
 4MI91oo/luAaUM6V6Eg6oZaMihB/O22d3TfQjjYHxw==
X-Google-Smtp-Source: ABdhPJx/nZ1UQGzZJKgEEXd9C4IXgwVoQJZKbA7qsHwv0cwFG9hKIQoy5mTwIN6Scxz29ig2h7tYmAMvaCZ5CCHDdLI=
X-Received: by 2002:a9d:64da:: with SMTP id n26mr954400otl.36.1593146644703;
 Thu, 25 Jun 2020 21:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
 <CAPM=9txhX5TVUdWibRFc1C+ip5a8-c07jZawds=k5T5pBTPASA@mail.gmail.com>
 <874kqzndxj.fsf@intel.com>
 <CAKMK7uErpxoFrT_K==7-PMGyg_eqF07T50eYfh5BFQLzra7TbQ@mail.gmail.com>
In-Reply-To: <CAKMK7uErpxoFrT_K==7-PMGyg_eqF07T50eYfh5BFQLzra7TbQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 26 Jun 2020 10:13:53 +0530
Message-ID: <CAO_48GEa2ZgMph-1ZdsMcOdomZc4zNuRcNn_DoBZS3sNZa-LTg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] Revert "dma-buf: Report signaled links
 inside dma-fence-chain"
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Jun 2020 at 01:24, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Ignoring everything else ...
>
> On Thu, Jun 25, 2020 at 9:28 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > As a side note, there seem to be extra checks in place for acks when
> > applying non-i915 patches to drm-intel; there are no such checks for
> > drm-misc.
>
> One option to generalize that that I pondered is to consult
> get_maintainers.pl asking for git repo link, and if that returns
> something else, then insist that there's an ack from a relevant
> maintainer. It's a bit of typing, but I think the bigger problem is
> that there's a ton of false positives.

Right; for the particular patch, I wasn't even in the to: or cc: field
and that made it slip from my radar. I would definitely ask any one
sending patches for dma-buf directory to follow the get_maintainers.pl
religiously.
>
> But maybe that's a good thing, would give some motivation to keep
> MAINTAINERS updated.
>
> The other issue is though that drm-misc is plenty used to merge
> patches even when the respective maintainers are absent for weeks, or
> unresponsive. If we just blindly implement that rule, then the only
> possible Ack for these would be Dave&me as subsystem maintainers, and
> I don't want to be in the business of stamping approvals for all this
> stuff. Much better if people just collaborate.
>
> So I think an ack check would be nice, but probably not practical.
>
> Plus in this situation here drm-misc.git actually is the main repo,
> and we wont ever be able to teach a script to make a judgement call of
> whether that patch has the right amount of review on it.
> -Daniel

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
