Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF483E0397
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70B26EA53;
	Wed,  4 Aug 2021 14:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A4F6EA8F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628088215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kFYUSa3dRghMYe581f3uqD6OPPYe5RTO9O4Oxh6XB5I=;
 b=h6YfQdkZuRAUFPXGQPbuvIDrBoRMM7dAh2zjigGl6DURyYPr+rYS6obbzCtvK20Y+rETfz
 5QeRGaGbzyyQ/KSVvrlRxW4o+GUKvoKCCwqyZi7tbCRUWEXjlHwFn/1jtBtw+azqPwOWVP
 gxdIGjFhEZ6fD+p8b1iLUPk9HhIhhmA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-IwEE5pxyOpmqoIkDDI8Ivg-1; Wed, 04 Aug 2021 10:43:31 -0400
X-MC-Unique: IwEE5pxyOpmqoIkDDI8Ivg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n17-20020a7bc5d10000b0290228d7e174f1so376267wmk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 07:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kFYUSa3dRghMYe581f3uqD6OPPYe5RTO9O4Oxh6XB5I=;
 b=Q9Y1Yp66aOiROVOj/aXciz5BsgZI+bl1PN9m87V1BCaNALvZQGjVzvWsARaoGbg/a6
 aULUTwJixTcmF8BbFNt5ROB7oRqbrsP9ccpErR5Bz2Wf3f+E7crUZYMf38VtkbKmjT1Q
 j/6z+UEG7AtoxFavt9SNCcmtzFF7I8figz+PaTUPWS4qQVX4xFbuKHUtmr4HIO51ViEz
 gWdFX01///z/Rwu2EUc27QYan56vJIgca9W/u3ZqU4uPYUBav59qL9javPHoBTfO6BVz
 xe3+Pc/WtbERGh95UvkqFmZv/551N1LRQhzbmjUQVl9QHPyzPLuXSUuv3M53jiYNYqbw
 YY0A==
X-Gm-Message-State: AOAM530bjaA02+dxxO52FnzXC2kYKD92hTdiGZ1Db99UD/s91cR+17sA
 27c+IvlDzKuvSQwyzBiPUD+J1sxG45eKq6AZhvMa+14nPoXifJxVPCyVdjltyeVkN1bpMay72kt
 QqIj/25EQOHEYpLdjTy47X/4U1D2a8qhtFBADFkCIxP8F
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr10229064wmm.171.1628088210718; 
 Wed, 04 Aug 2021 07:43:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwKeR2z5x/HL0NvZb68pP377KTS2HGMKbAH8tOqgYY8tWUV+n8t4legpd8joDAklG+ZHncu46UdSv0kNWBp5Q=
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr10229050wmm.171.1628088210589; 
 Wed, 04 Aug 2021 07:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
 <20210804141049.499767-1-kherbst@redhat.com>
 <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
In-Reply-To: <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 4 Aug 2021 16:43:19 +0200
Message-ID: <CACO55tsLpURTm=Jf=4gRVtYQbit5h2OBYw_MFb6Vf1PFvTV7dw@mail.gmail.com>
Subject: Re: [PATCH] depend on BACKLIGHT_CLASS_DEVICE for more devices
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, 
 Ben Skeggs <bskeggs@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 4, 2021 at 4:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Wed, Aug 4, 2021 at 4:10 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > playing around a little bit with this, I think the original "select
> > BACKLIGHT_CLASS_DEVICE" is fine. Atm we kind of have this weird mix of
> > drivers selecting and others depending on it. We could of course convert
> > everything over to depend, and break those cycling dependency issues with
> > this.
> >
> > Anyway this change on top of my initial patch is enough to make Kconfig
> > happy and has the advantage of not having to mess with the deps of nouveau
> > too much.
>
> Looks good to me. We'd probably want to make the BACKLIGHT_CLASS_DEVICE
> option itself 'default FB || DRM' though, to ensure that defconfigs
> keep working.
>

okay cool. Will send out a proper updated patch series soonish.

>       Arnd
>

