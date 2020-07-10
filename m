Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2837821B18A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 10:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ABF6EBA3;
	Fri, 10 Jul 2020 08:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717B86EB9B;
 Fri, 10 Jul 2020 08:44:59 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id b77so2566134vsd.8;
 Fri, 10 Jul 2020 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MHXlflOXGuztUVgAtLl/DuS9kIGjLj5v35ORjMrhjPE=;
 b=EEQvmCMHjyclSAhI44+gIuqzh+C/J5qzex5wrhW9B0YcxTb/LLpF2j1KmeCXe3r1cs
 sSzo+IO+LroLSEAqbmoNWnJeHHsHwKtxjXCPXTXIx/dtxX2R92YsUyhmIv9SqHInHdWN
 zpvdll5+a8KMZUmi4mN0LMQojweykbDStLGfxo3v1iN7LL3YxO0IfawqU4lEAtU7H0b4
 qILzAEgOGEM4ndIV7zfhHvsn9H2m1aqXXJw3XF1xGsjZXyQDAo1mn6k9lTSNxFB50avF
 h7lL1geyw6ipxhGJV/fCtnr0uYt4rbxqEF73WVGPaCbs4q+Yr+6GXnvtXZUT4Hc30MAq
 ji4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHXlflOXGuztUVgAtLl/DuS9kIGjLj5v35ORjMrhjPE=;
 b=G/Mnw8H/8jbS2SX0NBItrcS4RN0+XuAPB8lekEDlvYh6/BP5yKfTrEQ6BdZ9BfQ/wR
 fU0kwCbikgX98szSRoq5eKdl0t+R6e7ayY247jYriudsQJk4ITUFM8usQZpG9OR9Qw2U
 mFkGSNWFBkD2C99jZ4JLhGqMEiYifDhlLeHaZELUK4x0Iyz97fnlaB4pjIWoc0xXRGGd
 5jX9ovGQJleiLLjz9qVJSZDW6vc3ZHzmOx5IPjNXGWZ9E05H7C6Hn5eD43MypUG867Gm
 pBWRw2hDemKReBLkllHRYzb2NoyISymTH9WUcOCi+58hXOwqbDcLTn2PoIcPa6vkvH4R
 CaEw==
X-Gm-Message-State: AOAM530ms8Wb76AjaatZLQ8wl9mhz5uv1UP92DBhLbP+e1QMS5+WkKa2
 jgJDgXCERwHb0euzdWsgMzBYUOIKxUZS2iGMidaav5MVMu4=
X-Google-Smtp-Source: ABdhPJzIYoseFJB38+HV5mT96b+B83dWVVvKzIDLfH7eNTLgMVXIfXPCAJ9zwTfECX3rxBx84h1GzMhh0nzGD75UN+4=
X-Received: by 2002:a67:fa5a:: with SMTP id j26mr11750292vsq.95.1594370698604; 
 Fri, 10 Jul 2020 01:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200710074143.306787-1-christian.gmeiner@gmail.com>
 <58ef264448eb3ea75f846513210a5430b75b44c6.camel@pengutronix.de>
In-Reply-To: <58ef264448eb3ea75f846513210a5430b75b44c6.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 10 Jul 2020 10:44:47 +0200
Message-ID: <CAH9NwWfQfejtup6hHi68gE_VJs2RkL=298NURELqt3kVfc_AVA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add support for GPU load values
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
 Russell King <linux+etnaviv@armlinux.org.uk>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hoi Lucas

Am Fr., 10. Juli 2020 um 10:31 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Hi Christian,
>
> Am Freitag, den 10.07.2020, 09:41 +0200 schrieb Christian Gmeiner:
> > This patch series add support for loadavg values for GPU
> > sub-components. I am adding a SMA algorithm as I was not
> > really sure if EWMA would be a good fit for this use case.
>
> 1 second is a pretty long window in GPU time. Why do you feel that a
> simple moving average is more appropriate than a exponentially
> weighted one here? Note that I haven't given this any thought myself
> and haven't made up my mind yet, so this is a honest question to
> understand the reasoning behind your choice.
>

I played with both variants but I 'feel' that SMA might be a better
fit. To be honest I
have no background in signal processing and stuff like this so.. I
will go the route you
guide me to :) I have kept the "interface" for SMA equal to the one EWMA uses
so I can easily switch between them.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
