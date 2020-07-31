Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798B4233F10
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 08:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AB16E9DD;
	Fri, 31 Jul 2020 06:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EDF6E9DD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 06:26:21 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id di22so14448191edb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 23:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ksZo/oUSg7rHqTtnj3Pdczm3thCECxVp5kxV9dWwfk=;
 b=jGn1NH8EbRzLSAdIK4BUB3h3UDNRKx/TAhSmIdOVUANmAd+PymsLmRKIHDnBikKYUj
 Fprh/tEoSQAN1U47l/OlNGCLTusI4taMsLX1QcO7rbmJfvI09G9dMeOSCvhYxY1B5gZn
 rZN/mOL1QkpW88936MSWgqsw7wqYwvakMKOc6hOU1VcG0nVTLWZK6mVv9FcqlTB0JY7X
 SG91o4y8D5Ez6rDeck2B3WEWmLGgYYyN9aTwWC2kWVFPv6SZJjoiCDDsp+LVZFaVSeH+
 G92rPE53pp0u57XVe0GnNa8IVjBBhLAi/BUZB0nZQruAaL1Mn29BRiattsUr4AyTbYg8
 EHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ksZo/oUSg7rHqTtnj3Pdczm3thCECxVp5kxV9dWwfk=;
 b=PdH5x+bmvgwxA8xl/g7Lpr6VUqkiMbiRkZH4kbsHAl4lwdu0erWAJbi5KoDJ6NZ2y5
 HR+7/+0m5ENF2dPhI8VphSvZPg5xs0Co/lJjvtOp5G/v6MQAnQvjmtYSvZZDnG35auPm
 MX8aPBz5T4Rfb07J3Dq71dZW7oqliWuexz/EYj1GfSplxgd7h0OVMiEEtgG1eT9kO5UN
 v6XZgVhhL+sIxFUWjep5h1xkEB+EUPGFILN6NnpnQizFmJEjhqSJ9zAzwmJjWS0bMUBC
 cQLyCorcExOt51spHBN9p7s59/ncEh5GjhN7aZLEKzc1tvUIKsS2l1zlxCNcn1Xhqs6W
 smsA==
X-Gm-Message-State: AOAM533LWfaZSFMuB+zcUGtIILsc0TzcY8uMD6K8VrNbtSllnQfBtagQ
 cAZPQktIHoilg1xH43X6eFjdw1PUBASHgN3rro0fsg==
X-Google-Smtp-Source: ABdhPJzcFl5+xSGjGOEujbvOIHC3095RFtJqk/4Kk5qnbKORemv5/z4TWbgGocmxosVwg6WvqzwBuTM+xQYsNLShCVE=
X-Received: by 2002:a50:f396:: with SMTP id g22mr2220395edm.220.1596176780407; 
 Thu, 30 Jul 2020 23:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-4-airlied@gmail.com>
 <20200731054431.GA1544844@ravnborg.org>
 <CAPM=9txyaTd5H3bKvO1Uiz2WaoGWyxYQD0dGnV5HQukkZm8WBQ@mail.gmail.com>
In-Reply-To: <CAPM=9txyaTd5H3bKvO1Uiz2WaoGWyxYQD0dGnV5HQukkZm8WBQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 31 Jul 2020 16:26:08 +1000
Message-ID: <CAPM=9tw13EY2-Aqbp8Q12k7EnM0s8PkBBdkvZWPQt4KB=b3PLw@mail.gmail.com>
Subject: Re: [PATCH 03/49] drm/ttm: split the mm manager init code
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Roland Scheidegger <sroland@vmware.com>,
 "Koenig, Christian" <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Jul 2020 at 15:51, Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 31 Jul 2020 at 15:44, Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Dave.
> >
> > On Fri, Jul 31, 2020 at 02:04:34PM +1000, Dave Airlie wrote:
> > > From: Dave Airlie <airlied@redhat.com>
> > >
> > > This will allow the driver to control the ordering here better.
> > >
> > > Eventually the old path will be removed.
> > >
> > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > > ---
> > >  drivers/gpu/drm/ttm/ttm_bo.c    | 34 +++++++++++++++++++--------------
> > >  include/drm/ttm/ttm_bo_api.h    |  4 ++++
> > >  include/drm/ttm/ttm_bo_driver.h |  6 ++++++
> > >  3 files changed, 30 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > > index 041a0e73cd1b..a658fd584c6d 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > @@ -1503,35 +1503,41 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
> > >  }
> > >  EXPORT_SYMBOL(ttm_bo_evict_mm);
> > >
> > > -int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
> > > -                     unsigned long p_size)
> > > +void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
> > > +                      struct ttm_mem_type_manager *man,
> > > +                      unsigned long p_size)
> > >  {
> >
> > General comment for all the ttm/* changes.
> > It would be very nice with some nice explanations for the exported
> > functions, preferably in kernel-doc style.
> > In case someone that are more or less clueless (like me) would like
> > to understand how a function is to be used or maybe reviewing some
> > random code.
>
> Good point, I just need to make sure I don't add anything for
> something I remove later, but I should definitely add some for the new
> interfaces.

The version in my git branch has docs for all the new apis now.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
