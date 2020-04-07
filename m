Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739621A0A09
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 11:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF116E7F1;
	Tue,  7 Apr 2020 09:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE916E7FA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 09:27:00 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id a49so2362915otc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nPe041wtYnw+L7YStvPaALToe3s0hcalxRt4ebfIIoQ=;
 b=SfuVyQJh3rq55wdMyFMVbQBmSBNzBhHhLnY7/U1lXtVgeAoJD1Q56lXbOzZ8YjG3Bl
 E/oo7b0IIjn3ru4xntlcEqc7nLwCJA+kMJI//691ItLXBzD6d5MEe3MqqUKOsE4d+BCW
 Mlb0yt91fccLmUgF9JeG8Q9WuCc1RbXpsoH+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nPe041wtYnw+L7YStvPaALToe3s0hcalxRt4ebfIIoQ=;
 b=kq72c6/fB6eMjoS7okFwnf7gtbd7yfpQZEuOtPvC7ZDfVvp503GAJFpaccfw1yVj8Y
 fFQ3SaCePK5Dyv1QcBcmNQ1LudfMh1xSFnreKwLu0dTJMa4Qw4omDgvRAfMg5JK9+paT
 Xo29MfqRKV2VoZ6ndftqx+NTvjKhOlgu2Q0hx+fkBtlisC7Hft5PVRNf1HQzMM8Ns2wI
 OUAiC7R+TEXFm0hF9QF8Jn3WHBlAQtgVbkhBhO982EonaDtgGnj6FNjq44V1nXp90oH6
 WD3yGd4bVimy4XbWM/FmQjEwUJUrXO039rbF4rfKHHj0mxpi18QTOqT7I+DW7ILioo0a
 M96g==
X-Gm-Message-State: AGi0PuZpALA7KSDg07oW3PfwY7WMQC5sORqDfE4WzBAhM3o3SDm8qgR3
 /sAsUb648LDF4AFRmYHJ/782wgnqvxiK6ejZrQrB9g==
X-Google-Smtp-Source: APiQypKNI0YeXXUM7A+J8Apslf+lsw0YBOsWrfotn8Le7lnXUOjTXiB0OMPjog50oJxIt36L03iB3xNG1Dv9FF5XRUQ=
X-Received: by 2002:a4a:c819:: with SMTP id s25mr1123867ooq.6.1586251619677;
 Tue, 07 Apr 2020 02:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <20200403152400.55fe5eac@eldfell.localdomain>
 <CAPj87rOzsd4wLtkaZt4Xj5ndwHjU7iXQZnnU=+1QSXC2Xdf4Yw@mail.gmail.com>
In-Reply-To: <CAPj87rOzsd4wLtkaZt4Xj5ndwHjU7iXQZnnU=+1QSXC2Xdf4Yw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 7 Apr 2020 11:26:48 +0200
Message-ID: <CAKMK7uGhJpHPbQVjJSnzD7mqMmtgGt-PX0SqKwmZ9A+OVEp8aA@mail.gmail.com>
Subject: Re: KMS enums and bitfields UAPI
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 7, 2020 at 10:19 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Fri, 3 Apr 2020 at 13:24, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > On Fri, 03 Apr 2020 10:15:21 +0000 Simon Ser <contact@emersion.fr> wrote:
> > > At the very least, having a clear policy for both kernel public headers and
> > > user-space would help a lot. Right now it's unclear for both parties what to do
> > > regarding enum values.
> > >
> > > What do you think?
> >
> > I do not think it is unclear at all. You have to query the kernel for
> > value by string names. Maybe it's not clearly communicated though?
> >
> > But I also don't have anything against changing that policy, if kernel
> > maintainers agree.
>
> I'm in the same boat. The existing policy (runtime enum name lookups
> are the only correct thing, and the presence of anything else in
> headers is merely accidental) seems pretty clear to me. But I'd be
> totally fine with changing it too, though it might require a cap to
> say that this kernel version lets you use the stable integer
> enumerations, and anything else requires runtime lookup.
>
> I had a quick look to see how drivers used properties, and was
> pleasantly surprised to see that only the (very old) Intel driver,
> VMware and QXL drivers have custom properties. So maybe we don't have
> to really worry about vendor-extended properties too much ... though
> someone will definitely try to use it on some kind of nightmare vendor
> BSP and have to fork libliftoff for it at some point.

Not sure what you grepped, but I'm also seeing amdgpu, armada, i915
and gma500, nouveau, radeon, rcar and sti create custom properties.

But yeah we've definitely become a lot better at this, with the
cracked down rules on drm properties and what you all need to supply
before merging is ok.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
