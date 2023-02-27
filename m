Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE976A4638
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 16:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ED310E42B;
	Mon, 27 Feb 2023 15:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BEE10E42E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 15:40:23 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id t22so5472118oiw.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 07:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CyTB/8yjHEGeVb5eYubYQqNDzW1fdOoIcMGH96ABpv4=;
 b=oI9zcZYjxrQqI5sYOaUtqe/5zhMZErmABdHSldC6FrXKdAHLIc51dMDe5gV3uHW+Sj
 WduVlXX2H1y0qnMrwVnxVOL79HAsX+q/8PqyZmSxC3+q7tzpSAdM6VvzBN8SwQ1x7DMV
 IYzXTUyH7EroFrtoQC45sSNzp7yFQDODcKIMPCKQMKXnkZtC3eohfaP5y3+hME4QLIUA
 zx9gWufCFU8QRWqia6+SjTJSW+nLIgw2Z164GAbcHI3Q9e1UmOTnGU1/R86td0RUWYe8
 yFfrdDSXHf/vtV5Q2HbH0bMJ0ssqfaOizzn0u6O7K12fvzRYES8no82mhajBy8V7g6gC
 oYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CyTB/8yjHEGeVb5eYubYQqNDzW1fdOoIcMGH96ABpv4=;
 b=Fd369CKN302CDcrVDtU3pp6mL/j3/AoJXcbTmFbxMzWPCbwNbZyfrXkQDmqEQ1bKVJ
 8B4mK2FBeQ9LEEzkf7ir7EWeMpFb6iM37tHp8YLq4Kpjh+xeVhzrt9B+KWJYKxywQXiW
 Q7P+TbnGNVriXIuAXJLI5D2NPaHkH/PCT+IbIQPzh2Gecsd1j/EnYiW6FzOt3xNa1mdj
 klTJN0b8Gurc7MEcBoi1J24n6VgmgKofPhInc+ZCE7MHehslazb/BUPwKDb9v4M2IpbN
 omyG0zeWFj+fqC9aKJOordjgF8d4wsEvgNiwRCNYXae5pGG7NPKU34IV0kGuHfYoI1ev
 UThg==
X-Gm-Message-State: AO0yUKUq7bIQztvUt9Jz7KM9bvwsJwdvM7udNunTLlJ6wrneC6pJ+cpy
 dydiJWGaET+0SK4p86YgJAxRKE2EvQopSmmqBzU=
X-Google-Smtp-Source: AK7set+WPiN+PMC33D7dGKvMOq4tjpD5BANv/fOXy/omKUC1JZ4GUk6hlHvST2Ba9zIlMFuhIdoN5PtweesP99tGF+U=
X-Received: by 2002:a05:6808:486:b0:384:23ed:1ff6 with SMTP id
 z6-20020a056808048600b0038423ed1ff6mr1448259oid.3.1677512422552; Mon, 27 Feb
 2023 07:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20230224180225.2477641-1-robdclark@gmail.com>
 <20230227063821.dg2gbjjwcekbxyzw@sirius.home.kraxel.org>
In-Reply-To: <20230227063821.dg2gbjjwcekbxyzw@sirius.home.kraxel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 27 Feb 2023 07:40:11 -0800
Message-ID: <CAF6AEGsv1G7CPSkCPe3iHGB9JEO4iy+bTbkFLoitmx64U78RJw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Add option to disable KMS support
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 26, 2023 at 10:38 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Fri, Feb 24, 2023 at 10:02:24AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add a build option to disable modesetting support.  This is useful in
> > cases where the guest only needs to use the GPU in a headless mode, or
> > (such as in the CrOS usage) window surfaces are proxied to a host
> > compositor.
>
> Why make that a compile time option?  There is a config option for the
> number of scanouts (aka virtual displays) a device has.  Just set that
> to zero (and fix the driver to not consider that configuration an
> error).

The goal is to not advertise DRIVER_MODESET (and DRIVER_ATOMIC).. I
guess that could be done based on whether there are any scanouts, but
it would mean making the drm_driver struct non-const.  And I think it
is legitimate to allow the guest to make this choice, regardless of
what the host decides to expose, since it is about the ioctl surface
area that the guest kernel exposes to guest userspace.

BR,
-R
