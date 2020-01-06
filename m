Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A291310CC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 11:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0323F6E24E;
	Mon,  6 Jan 2020 10:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A832F6E24E;
 Mon,  6 Jan 2020 10:49:12 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id c129so12366937vkh.7;
 Mon, 06 Jan 2020 02:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XFzoZ86uEVjKWHiIx7n2HpYErMeQnxrhPD0oWb4wVqg=;
 b=WfWGYz/RCLTMwYaL53SGSjgLV/BZVFTf8Hb1W6MeEDhZLlbxlTOclpavebEKZo+Ouk
 vucaQKlXWfG9VXqw3WSM9fFrPH0i1ATOv5CdsFE9IleLn7p0nf8anBRhZ8plRZnRfSpl
 yRBzIpzcxcPx1Eymy9tYDLrtnX92vNWAU5fD4a8Oa58sTGy6kGvJxdxpbs4fYS+Ik2zO
 WurZZKXjWBTPzBB0Sd38L7GtvWt50cNfqP3LrRKRPYfpu2SCbaKcZdiBD4iyskUscUWK
 gQ/j2Uo+8mR0LzlegzrTGfO0T3QtDlNw0vTwkseEk/SlZ/GH4n9GHvc/YhvV2eZXo4bN
 ityA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XFzoZ86uEVjKWHiIx7n2HpYErMeQnxrhPD0oWb4wVqg=;
 b=mzm5wprqkIPSK7WqWI+xFMSnrTGiJ0HTMccJwyizKL/bsOlSJV6bzkVG9+701BCRYU
 jRiYEVdz66W4AeULckADteiwDHm12c7jMIaEaJvxdd0qxtWmxGX3BI8hQ/q4vZwRv0Jw
 B6fB8mE3WRSiD1LbHMwQL7nl7f080jsYj0QtL5mdgqBqsuvyRIwOzijiCNmp9J+rxvFQ
 ncgD7C1f7wbbcUGHyzgXtaZyUwn6KSosj9URSQYvMNH67ezSg638qb4eUza6iqc1Q4Hx
 vdcddA+Q9WAS9JNGRoDU7tvzzx4G9YIRx7SdhuaNfLGKKbbZ6fTc7nLUTS910wGF8hUi
 gmIQ==
X-Gm-Message-State: APjAAAVmvmD6xV6WXLZS0+iEtsy4WzX+5kI/kwaH+eEx/MuP0qtZw9Vy
 mRESL/yfZ2IfCZrHYx7GbxluPFbZBo0mUMT8F4M=
X-Google-Smtp-Source: APXvYqxOZUpCU+5AFy4RLqhuDjx2AX6pxI9Zqbzh0mrMGe9Q/Xewjj0d9R3JxH1tbh0/Jpc5LMD095MmnifN/SM3DZ4=
X-Received: by 2002:a1f:1806:: with SMTP id 6mr56157586vky.85.1578307751707;
 Mon, 06 Jan 2020 02:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
 <20200102100230.420009-6-christian.gmeiner@gmail.com>
 <82299ef95e44190d9bcea29bacb5651f3dc75b64.camel@pengutronix.de>
In-Reply-To: <82299ef95e44190d9bcea29bacb5651f3dc75b64.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 6 Jan 2020 11:49:00 +0100
Message-ID: <CAH9NwWfS2GwL1kTYOOp8tnvCCXkMBQuOarBjiWXOQELWKPEM8A@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/etnaviv: update hwdb selection logic
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

Am Mo., 6. Jan. 2020 um 11:15 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> On Do, 2020-01-02 at 11:02 +0100, Christian Gmeiner wrote:
> > Take product id, customer id and eco id into account. If that
> > delivers no match try a search for model and revision.
> >
> > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> > index eb0f3eb87ced..d1744f1b44b1 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> > @@ -44,9 +44,26 @@ bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
> >       struct etnaviv_chip_identity *ident = &gpu->identity;
> >       int i;
> >
> > +     /* accurate match */
> >       for (i = 0; i < ARRAY_SIZE(etnaviv_chip_identities); i++) {
> >               if (etnaviv_chip_identities[i].model == ident->model &&
> > -                 etnaviv_chip_identities[i].revision == ident->revision) {
> > +                 etnaviv_chip_identities[i].revision == ident->revision &&
> > +                 etnaviv_chip_identities[i].product_id == ident->product_id &&
>
> Why not simply make this:
> (etnaviv_chip_identities[i].product_id == ident->product_id ||
> etnaviv_chip_identities[i].product_id == ~0U)
> and similar for customer and eco ID?
>
> With this we don't need two different walks through the HWDB, as long
> as the more specific entries in the DB are ordered to the front of the
> array.
>

Works for me too.. will be change in v2.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
