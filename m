Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE8749C88E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535E310E8C2;
	Wed, 26 Jan 2022 11:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1578310E8C2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:24:18 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 g15-20020a9d6b0f000000b005a062b0dc12so7832802otp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 03:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CCtOvzmb9/mx72Ui1G8gLBm5A9F1BJtElWdIDXeMmF0=;
 b=KN8ygqBrm2dd9m4JKpN0ivDz9vFAd4sM+Jo250JWFfS7Fb0jrfDxVtjeWag9YgMJzO
 Ai4COV/8AMUKGvKvgGkScYEDjMJiWVqqXKZyFyEl/tJxqAuJNa3cxzEaswKPlkWjpIGb
 F5u56sCs+46RCDVor9dn7G4nmOEvnFb1fLPmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CCtOvzmb9/mx72Ui1G8gLBm5A9F1BJtElWdIDXeMmF0=;
 b=O06LkDsqtHAmZ+kfoVEGJ0cdlC7z/Jxo4SroQimFsqNvQmcynyKrKiYl1DDO+BsJRu
 xuLTG8VETdsz2euuiukTUOu0+oIwnIDrhyEXjfk+SOk/Tkpq7cu2z2z3PML3PTH0XdCx
 Abtb+ey8BEI4Syb3SXnnh7tUXIsPZYyJrWSIXlLC4Js7NqhjHbxZ+wxWrR4XSjsCpvCV
 CU3e74LlI8KJ0CzgHdt+SLmEuXOdARAwwdstdvKoBc/oHz5v6Y+EC0ZOOlxm0jMXHCYH
 rUpOd4lBlw3yvojpPGFJFskbMN7aCetSafR8IcqjDwXx8r8SCp27dyCSSS91V/OhYj1P
 LZ5g==
X-Gm-Message-State: AOAM533CEGxTyGNDaCrOSVpPqV+d+GP2pz0ae3pZhXcsecLg7gwi5spF
 oy4ccR+PAfB7aTlPdep6OY2SoBlQy1jWxre7eGSmXQ==
X-Google-Smtp-Source: ABdhPJyJ434k8CTtwA2xfNAfr6EGCCAY/54kbGMlKb50hwBQ2htN+9NdPN5HmH3wpOHEdJ2kuYTIeZNw6vajtaWaJbE=
X-Received: by 2002:a05:6830:2704:: with SMTP id
 j4mr17448609otu.323.1643196257387; 
 Wed, 26 Jan 2022 03:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
In-Reply-To: <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 12:24:06 +0100
Message-ID: <CAKMK7uEqwyZuVheqyNG33Un4WK1cd1B+WBYbCmi20fZi0qVG2w@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:18 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> On 1/26/22 11:59, Helge Deller wrote:
> > On 1/26/22 11:02, Andy Shevchenko wrote:
>
> [snip]
>
> >> P.S. For the record, I will personally NAK any attempts to remove that
> >> driver from the kernel. And this is another point why it's better not
> >> to be under the staging.
> >
> > I agree. Same as for me to NAK the disabling of fbcon's acceleration
> > features or even attempting to remove fbdev altogether (unless all
> > relevant drivers are ported to DRM).
> >
>
> But that will never happen if we keep moving the goal post.
>
> At some point new fbdev drivers should not be added anymore, otherwise
> the number of existing drivers that need conversion will keep growing.

And that point was about 5 years ago, and has been discussed at some
plumbers meanwhile, resulting in the staging TODO patches to make
these drm drivers to destage them.

Fixing bugs in fbdev is all fine, reopening it for merging new drivers is not.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
