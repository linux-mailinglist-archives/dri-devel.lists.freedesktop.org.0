Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736971D28F7
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 09:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA5D6EAD0;
	Thu, 14 May 2020 07:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15186EACE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:42:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f134so16921634wmf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZWA9/LMqA4b3VlkBF3EXJYQj3K5659B/XXUAdyVkaXU=;
 b=SSi66/0Y6hCtpBzDagUQu9nsZHe3sRZSl8P800sQoFV2TAZ5v4l3iaf4v8fz6VmXko
 nOv7BPDtFdnDMQjNIod9HVy4irAHLWTfwE7H2uqirVq3ARJ/g9Z+wOzaV8rVyH/P5Rpy
 pA0x/k4IqKeUmpP5+c/Te+umtmZ/SY74KHWVsIA+8Mg9KjnhRDrFyjcKIDF1WPTfneWz
 Ddc36yuLnqp5QnSguImjev5Kw/DzWkbjWGGJXAielnV+px3Gr4Y+cWe+3msptsslr4q5
 cwJlVeVjCt9vl9AO1Tqfn/CGMtMpP5eGQDSjCuMMjTzm32WmF9GkRw9YUvYVfvdBy8LV
 US+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZWA9/LMqA4b3VlkBF3EXJYQj3K5659B/XXUAdyVkaXU=;
 b=GHHDoQQhdE0yBykh4P+2Yj93Vy4gT6ebnAf+q/ouumVm1GA+NTZMtlI+FnS6NV7L1B
 Hw1QomLeblhAnmv/9k9cc9wjRcnClpxhEk68atMtE5O55GUqDRHw9Y4TX+PclI4PeoqA
 ZV0olaHW7DXKoM5IEJ2R4pxq4Is4XwjA8h++yW6hj/u44wzjR7For7SpoNfypBUf0iE5
 oxJu3TK8311R9oBK0W9yU1L6xYdmG8grZVadq3E3FSRzQ0PAa6z+6PpnmTe23tWbh5yD
 bSE6ytQxCAcOasJ+xz9NR3KQIdbhy/nKTpkzVtTFp2Hq1it+5LSmeOVqQNjBY7GouBMv
 3ZpA==
X-Gm-Message-State: AGi0PuYhPBIbMz3cgdIsVMECcAsuf4kINxwK7zCs81978pOOXHbm9Vm2
 uwaR46Zq6UGxs+hrbhN9rLR1XfpqB1toEANegjY+ew==
X-Google-Smtp-Source: APiQypIg1w3Jf7o/5wr4EHLUqu7AUcSm30r5cMiIA6xX1z8nEimMwDLIWcsrEf5C1hR1JZLcNv66F+pEKdDXTKTaHmU=
X-Received: by 2002:a1c:9e52:: with SMTP id h79mr46889694wme.84.1589442119280; 
 Thu, 14 May 2020 00:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200408162403.3616785-1-daniel.vetter@ffwll.ch>
 <CAPj87rMJNwp0t4B0KxH7J_2__4eT7+ZJeG-=_juLSDhPc2hLHQ@mail.gmail.com>
 <CAKMK7uFU7ST9LWmpfhTuk1-_ES6VU-cUogMnPjA15BWFsEVacw@mail.gmail.com>
 <CAPj87rNRLsGJcGEM3dYnitYMwjh7iMNjo9KT=xcDZ0hebRC9iw@mail.gmail.com>
 <CAKMK7uG6krmntPW6Mud7aouvM=NRspYHoBdKeSwxS8wDwDZRkQ@mail.gmail.com>
In-Reply-To: <CAKMK7uG6krmntPW6Mud7aouvM=NRspYHoBdKeSwxS8wDwDZRkQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 14 May 2020 08:40:21 +0100
Message-ID: <CAPj87rO1oG00ipUA57a1kGu7K2=-ugTreM7QXy_tWjbZ+KzkFg@mail.gmail.com>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Stone <daniels@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 May 2020 at 08:25, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Thu, May 14, 2020 at 9:18 AM Daniel Stone <daniel@fooishbar.org> wrote:
> > On Thu, 14 May 2020 at 08:08, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > I'd be very much in favour of putting the blocking down in the kernel
> > at least until the kernel can give us a clear indication to tell us
> > what's going on, and ideally which other resources need to be dragged
> > in, in a way which is distinguishable from your compositor having
> > broken synchronisation.
>
> We know, the patch already computes that ... So would be a matter of
> exporting that to userspace. We have a mask of all additional crtc
> that will get an event and will -EBUSY until that's done.

Yep, but unless and until that happens, could we please get this in?
Given it would require uAPI changes, we'd need to modify all the
compositors to work with the old path (random EBUSY) and the new path
(predictable and obvious), so at least preserving the promise that
per-CRTC updates are really independent would be good.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
