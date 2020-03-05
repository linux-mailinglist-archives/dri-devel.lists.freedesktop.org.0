Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F417B806
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9EE6EC9B;
	Fri,  6 Mar 2020 08:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A3D89A0F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 08:51:03 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id c19so2080435qvv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 00:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=El/sfTpddW1bZLTnEnZCZcYJORrAN8Tq9vEVAml0EDE=;
 b=Vx/5vkxdn/hKg0Q8e8NxBkcGhDJsI7LG99cvLlcR/CVLIZ3nLfz++O1Kmbsg/jzf9L
 zKzg6AUYXpm1eBFv9Q/0M27de2rBPlAOqTARP+BlnJoakmL7bC0yE+sPNk6GGceazIs7
 OFDwJ48nJmQd4RvveTIeupNBOekk28UEEb3QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=El/sfTpddW1bZLTnEnZCZcYJORrAN8Tq9vEVAml0EDE=;
 b=XcCzQbqlBlLOKbDOEO65SMqw6b4gkxIFa71DO9j3N+zFmpswcJU9pMakiav+nfXPVB
 ceMOVzz5Vz+p325KFLmoxLauEU5yJt2uWXzYO8iijQ80PDRaUSg9wpWGOeor+0cNkqAB
 ayuYGhzd8Yb/g9eqimR4NTVfc5XVdQDzHfIO7nPzfqLyqG2kskdds2GF3951UNrx5Gh1
 pL9iCBQ6W1Af4n4ymFFuISTF+KTma1V0QuFYgBDZ2HmvApuWS8/BP3eW5U6QDfMzTxo0
 l3KqAAinb4t2mi+3PfNwvLxTuGB9mQYH8VhuS/aw/L9NdtqT9qMLiY3cJ9GNhoMqBPmt
 9Ldw==
X-Gm-Message-State: ANhLgQ1iUdIvbBmQlfLGXMI7tXIdMp0IhHDJsFnkEVWJyEH8g2RkVyI6
 U8uEaVebXxd0p626vSePwjGopCvPXhSvGOsR+0tu9g==
X-Google-Smtp-Source: ADFU+vuXxgY7/ed9EAAffDRefWFzcupI8LrsMya2Q/mcmPS0VFPAjByjJPtT1mwbJ0eu/04sihvT5tTllkXJEr3T8J8=
X-Received: by 2002:a05:6214:10c1:: with SMTP id
 r1mr5594398qvs.70.1583398262104; 
 Thu, 05 Mar 2020 00:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20200302121524.7543-1-stevensd@chromium.org>
 <20200302121524.7543-5-stevensd@chromium.org>
 <20200304080119.i55opxkhk4kdt4hp@sirius.home.kraxel.org>
In-Reply-To: <20200304080119.i55opxkhk4kdt4hp@sirius.home.kraxel.org>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 5 Mar 2020 17:50:51 +0900
Message-ID: <CAD=HUj7jS5jaRmiJwtGMSQZnR8Qd0VvPkBSbs1d-nATdczWdZA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/virtio: Support virtgpu exported resources
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 linaro-mm-sig@lists.linaro.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 4, 2020 at 5:01 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > +     if (vgdev->has_resource_assign_uuid) {
> > +             spin_lock(&vgdev->resource_export_lock);
> > +             if (bo->uuid_state == UUID_NOT_INITIALIZED) {
> > +                     bo->uuid_state = UUID_INITIALIZING;
> > +                     needs_init = true;
> > +             }
> > +             spin_unlock(&vgdev->resource_export_lock);
> > +
> > +             if (needs_init) {
> > +                     ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, bo);
>
> You can submit a fenced command, then wait on the fence here.  Removes
> the need for UUID_INITIALIZING.

Synchronously waiting is simper, but only doing the wait when trying
to use the UUID can help to hide the latency of the virito commands.
That can save quite a bit of time when setting up multiple buffers for
a graphics pipeline, which I think is worthwhile.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
