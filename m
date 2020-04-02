Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999ED19BFF7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 13:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C653A6EA56;
	Thu,  2 Apr 2020 11:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B884F6EA56
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 11:13:50 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id x11so2982981otp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6mN1vxpAIxPcq3zgtKOyz6GPK03ELmAvkA669+9LCHY=;
 b=bbzsRmXABvf5+YUGKiMzeDxp0CLBxwFYEVeogxYVqPs8TLZV1jDIRHjwwPlMn+xmmc
 urTSh+iwKWh+4FatPBZAEtWlLdtIs2cpFI7xcQZaAaw/rDxOHl3f0Z+dGYKvUSbywNuk
 B+Fhh/PSsL9cQSF1dmX04K6WHXbb17FtHRfCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6mN1vxpAIxPcq3zgtKOyz6GPK03ELmAvkA669+9LCHY=;
 b=JbXCEUvvuZFZxWEufokj5OPUK2XkJwvDHYLl58LO9f1NMXQFtWVh9oaSz4f7wWXoRs
 OHOEJ+JPo8mYV16/eIJdy+6Qs1bmuY6PYE/VXocVUg8+lE4jmASIUKgIpkiChqjUW8ut
 QJMZn2gXBztoKalBzdRu2K+aiim7db/uUmrbwDVzoaLIjEx98vZ1TqXladP4HZyTXMki
 6h7USYxr/4/y0dY90mWr/aOZDguSHJ7gEh9/ACujaTj+rXumb0LUldCyzXy2C3HstfPX
 w/lnhJtndHNPI8jHFmGBzSK2pFhHxfdUJF7WDcjX2AufuehqUUcNqbnbrcxCGuSaPkKQ
 A29w==
X-Gm-Message-State: AGi0PuYsjKXQ0RnWIrkZfkTfIXapHoqiWptaB0NqGTROniBoXRvKMrhW
 98CrJiQzMR4rVQYxrmwa+G9Mhkew1cFGLUQ0f/8WIg==
X-Google-Smtp-Source: APiQypKoVuG+6C3mRSZs/TjgjoWbK7bRS5UTbOTYH3v7jaG1WKLL4stRe37NcNu382/UUb3g0Bo+t7OhCyk7BfPwSwo=
X-Received: by 2002:a05:6830:15d4:: with SMTP id
 j20mr1878145otr.303.1585826029986; 
 Thu, 02 Apr 2020 04:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAPj87rMCf0qv0mQxKRZZLzhJ3HBG92MdABKM5JJx8KarG_M3DQ@mail.gmail.com>
In-Reply-To: <CAPj87rMCf0qv0mQxKRZZLzhJ3HBG92MdABKM5JJx8KarG_M3DQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 2 Apr 2020 13:13:37 +0200
Message-ID: <CAKMK7uGFJoWEk31RQ8cU5ub5opKb13obz_MWO7BtzmS6yZjW-w@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Create immutable zpos property for primary
 planes
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
Cc: "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 2, 2020 at 12:57 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Thu, 2 Apr 2020 at 11:40, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The R-Car DU driver creates a zpos property, ranging from 1 to 7, for
> > all the overlay planes, but leaves the primary plane without a zpos
> > property. The DRM/KMS API doesn't clearly specify if this is acceptable,
> > of it the property is mandatory for all planes when exposed for some of
> > the planes. Nonetheless, weston v8.0 has been reported to have trouble
> > handling this situation.
>
> Yeah. It didn't even occur to me/us that someone would do that, to be
> honest. We need to have zpos information for all planes that we're
> using in order for zpos to be at all meaningful, and we can't exactly
> avoid using the primary plane. Without knowing the primary plane's
> zpos, we can't know if the overlays are actually overlays or in fact
> underlays.

Maybe we need to clarify docs that if you expose zpos, then you should
expose it on all planes (opting for immutable zpos where it can't be
adjusted)? Care to type up that quick doc patch please?
-Daniel

>
> > The DRM core offers support for immutable zpos properties. Creating an
> > immutable zpos property set to 0 for the primary planes seems to be a
> > good way forward, as it shouldn't introduce any regression, and can fix
> > the issue. Do so.
>
> Perfect. We support immutable properties entirely well, we just need
> to know about them.
>
> > Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
>
> Cheers,
> Daniel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
