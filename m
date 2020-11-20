Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090E92BA5CE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 10:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAB96E890;
	Fri, 20 Nov 2020 09:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5F06E890
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 09:19:57 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id a130so1594061oif.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 01:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jhnpxo2sArXvguoaVzqBosbDRHLB3NkgDvsLpZno65I=;
 b=RNI2HBtvCQwPc9Dv21xXHHrh4IRyu3SOyUkUHT/cUGZyAYFl29N43Wa+o6OjRDYYYj
 IUkr/gd2UA/NlHkJ4KxWKjEPpTRw6h1Z+88rtulbGaQhxmhTzN5lHj0AGVvhw9C3DX6G
 bfa/MjPMDneB+M1WdqcNMQufZEvlaSrrdAxu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jhnpxo2sArXvguoaVzqBosbDRHLB3NkgDvsLpZno65I=;
 b=cyYAz9f7FTzc/HGvCsTFVFqqkMO5DUmirnElW1Sygckn+RZPqU4NvPwTg3vxQNFOW1
 v+BzTxvoAe01gnwRwD3wzLJV2jhEXs66r/TPjy858zNDDk1Ay+PJETGzjfnvcjxN0s/W
 /MtXDjWL+39rJUYzKvLS+pvMxhV2lbQ27Y8hZAoPxi12uIhzd3l1Dd6C2zSl9kGNR1UT
 2CSikWVb1QgsUM/SpVscpEzt39GHROXkzzFWQI2CE+S2qNReocAd6yj9Jj5IYE6h3ODT
 8bEZ9z/MsTxed7L+p6lLtYhVcu7+19aTHQOKcI+VSU6jPVWvlwfdXGqrg3LzD7GKnfXs
 2SMA==
X-Gm-Message-State: AOAM533jk59gZYfiwnRHTxQDlB/hAEUieHpLEAOY/3+QCn7p/qWtlNQJ
 CVPiKaV6ZewULYsj4KO1TKUPlxVJEMumLgjc3HwmMA==
X-Google-Smtp-Source: ABdhPJx0yNcz0cTepYjoA4Rsw+r5hkk5xpPMY5tkIvQeXctMfeQl+rc55sUDDM0JPcWN8+M04YnYLlob+bsLfiifRi0=
X-Received: by 2002:aca:7506:: with SMTP id q6mr5843056oic.128.1605863996607; 
 Fri, 20 Nov 2020 01:19:56 -0800 (PST)
MIME-Version: 1.0
References: <PwfAVfVzxSH9UbOc2njhv2b7Kislwt2Xq4HBGrGBSc@cp4-web-040.plabs.ch>
 <CAKMK7uHskOYggQBCuUeTY0neDCa2QvyrwUW2vsnqg_-=BtF8rw@mail.gmail.com>
 <u1OGSOQeSatIoIRKimxHe3TbFT9bM0J-Gz4xs8PT0wyBZZjSyzFYhTNlA7SHtCA8knSo8eVRIm70sLvLyKRhya7wm0X3Q4k2XVuoXhmcSx0=@emersion.fr>
In-Reply-To: <u1OGSOQeSatIoIRKimxHe3TbFT9bM0J-Gz4xs8PT0wyBZZjSyzFYhTNlA7SHtCA8knSo8eVRIm70sLvLyKRhya7wm0X3Q4k2XVuoXhmcSx0=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 20 Nov 2020 10:19:45 +0100
Message-ID: <CAKMK7uHhuQppuVGOgvbJ5FGra_yQKjQku20wJNRhfW5yJaqWKg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: document drm_mode_get_connector
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 9:46 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, November 19, 2020 4:06 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > > +       /**
> > > +        * @connection: Status of the connector.
> > > +        *
> > > +        * See enum drm_connector_status.
> >
> > Please add & so it becomes a link in the generated docs (and pls check
> > the link goes to the right place).
>
> Per [1], just prefixing the enum name with "enum" is enough to generate a link.
> I prefer this style over the ampersand because it makes the raw text easier to
> read. The result looks like this [2].
>
> [1]: https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#cross-referencing-from-restructuredtext
> [2]: https://l.sr.ht/o7Kb.png

Ah nice, I missed that this was updated. We have a ton of & in our
kerneldoc that probably could be dropped ...
-Daniel

>
> > > +        */
> > >         __u32 connection;
> > > -       __u32 mm_width;  /**< width in millimeters */
> > > -       __u32 mm_height; /**< height in millimeters */
> > > +       /** @mm_width: Width of the connected sink in millimeters. */
> > > +       __u32 mm_width;
> > > +       /** @mm_height: Height of the connected sink in millimeters. */
> > > +       __u32 mm_height;
> > > +       /**
> > > +        * @subpixel: Subpixel order of the connected sink.
> > > +        *
> > > +        * See enum subpixel_order.
> >
> > Same here.
>
> This one doesn't generate a link, because enum subpixel_order is undocumented.
> As soon as it's documented, the link will be created.
>
> The enum is weird in the first place: it has CamelCase members and no drm_
> prefix.
>
> > With the nits addressed: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> I'll fix the other issues you've raised, thanks for the review!



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
