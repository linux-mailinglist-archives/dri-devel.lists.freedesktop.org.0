Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E60862E692
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 22:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3726010E668;
	Thu, 17 Nov 2022 21:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9466310E668
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 21:14:41 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id n12so8230563eja.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=voXeWb+QPjKes3H0GEUnCg0sCJ4iBXmH4ELS4bNeRjo=;
 b=lQ5vo2Bdc4fiK3vsDriKITSkd4NYFMZOqcmVYWtTY530icIftzFPZilgZcMYOvnk9d
 I/33Uwh1ltnAMlV+WXcPuhKvc8GcYgLle6mBS7qyuXou51ASShr5DLf7hqpqFZ+IhlRQ
 rSDz/INWQkkGunIB1Vz0CU60uvmHbADYTBiTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=voXeWb+QPjKes3H0GEUnCg0sCJ4iBXmH4ELS4bNeRjo=;
 b=n050E2XD34ZO7Q060sgZGJNipDilrVPPfqrsDGP7qn/XGuv2206cYcU/SqBrVnOyok
 iKHEA3fuRRWVhcpFtNblymvnsszqPSd2SCVKD93/xilcCfKy99Oc2jtUjb3KVfdl+TKu
 DYl7XOqTjuac9GSkNT4ZdNbdugvF/8eZB+Te2+q2CcuqU3pT9kdmySZGrnl33Caspxpz
 fQ/r17Y+3qPSID68khf8IU6jZYYDtMfd6hZml0n+3rWj63ViR2zwxqrF/O79Jb/Y43Bg
 qSkTCSC9klZFwly1bNu3/r1YpBwGdtpu1T8p9V67aW94P7+Opd9wlu8b4yBgSNmbPn71
 f2Ow==
X-Gm-Message-State: ANoB5pmXufLCGsPwH2fK7CEfGF3cz2knGSAA2lvYbmE0uM444IMiFx61
 wPqPVTVGSTtmtxVHaM1tpqqqtEc9lvSxdORg
X-Google-Smtp-Source: AA0mqf63Pu4GXRqXwb57P9s7Ki5NIWHMR5QyF47Rnm/DCXiFBd0Bpvb1RGC8bhLX7ujgWZu6fBOL/Q==
X-Received: by 2002:a17:906:274a:b0:7ad:aedb:2e6d with SMTP id
 a10-20020a170906274a00b007adaedb2e6dmr3564625ejd.536.1668719679271; 
 Thu, 17 Nov 2022 13:14:39 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 ky26-20020a170907779a00b00722e50dab2csm833377ejc.109.2022.11.17.13.14.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 13:14:36 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id l14so5991909wrw.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:14:36 -0800 (PST)
X-Received: by 2002:a5d:53c4:0:b0:236:7741:fa7b with SMTP id
 a4-20020a5d53c4000000b002367741fa7bmr2614666wrw.138.1668719675985; Thu, 17
 Nov 2022 13:14:35 -0800 (PST)
MIME-Version: 1.0
References: <20221110145102.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
 <CAD=FV=V6HAwvKskWvggxx8J3y_PkiisPzY5YzMV8BMTb3oSxpg@mail.gmail.com>
In-Reply-To: <CAD=FV=V6HAwvKskWvggxx8J3y_PkiisPzY5YzMV8BMTb3oSxpg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Nov 2022 13:14:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WaBWR24BwgyiCA+mYUSt_=R2Mpdt8Wjo4w+9vyZz5mEA@mail.gmail.com>
Message-ID: <CAD=FV=WaBWR24BwgyiCA+mYUSt_=R2Mpdt8Wjo4w+9vyZz5mEA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Use ktime_get_boottime for delays
To: Drew Davenport <ddavenport@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 11, 2022 at 12:44 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Nov 10, 2022 at 1:51 PM Drew Davenport <ddavenport@chromium.org> wrote:
> >
> > ktime_get is based on CLOCK_MONOTONIC which stops on suspend. On
> > suspend, the time that the panel was powerd off is recorded with
> > ktime_get, and on resume this time is compared to the current ktime_get
> > time to determine if the driver should wait for the panel to power down
> > completely before re-enabling it.
> >
> > Because we're using ktime_get, this delay doesn't account for the time
> > that the device is suspended, during which the power down delay may have
> > already elapsed.
> >
> > Change to use ktime_get_boottime throughout, which uses CLOCK_BOOTTIME
> > which does not stop when suspended. This ensures that the resume path
> > will not be delayed if the power off delay has already been met while
> > the device is suspended.
> >
> > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> >
> > ---
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Nice!
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> My plan will be to land this to drm-misc-next early next week (Tuesday
> maybe?) unless someone has any objections.
>
> BTW: any chance you'd be willing to post against two similar drivers:
> panel-simple.c and panel-samsung-atna33xc20.c? They have nearly the
> same code (and, yes, these drivers are purposely copies since there
> was overall consensus that having one giant panel driver to handle all
> possible panels was getting far too confusing)

Breadcrumbs: after discussion, this got vacuumed up into a larger
series and is now at:

https://lore.kernel.org/r/20221117133655.2.Iebd9f79aba0a62015fd2383fe6986c2d6fe12cfd@changeid
