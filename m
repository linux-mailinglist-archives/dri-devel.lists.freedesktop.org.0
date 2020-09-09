Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5311263E7A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C656E212;
	Thu, 10 Sep 2020 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3806D6EA0E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 07:13:23 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id w23so429215uam.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 00:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CVOXiOEzuPIPELtkzIBti2oTVQlq254I82Oqaqw5WGE=;
 b=Vd7ST+5j8sDHceUYPBeyqlywLA2yav/L80K9J/su39UL2ARenE6HVq7J9pUqGCK5cn
 may0jaNWa4mHvGzlNk1o6DmLGK+L9Ts+rfMpW+Ygae+//xUstSYdD4dFDVyAgls/bmE2
 Ohsgs+7xy//7gnNWYPSyH5otScdntWyDQR8qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CVOXiOEzuPIPELtkzIBti2oTVQlq254I82Oqaqw5WGE=;
 b=kNmOEx1jSYGMOnhAViCD/eoWOMqQ6tMyzrZpzKw1nbvTMYAH1cmDO+uZCg/5MH7Iyq
 8WqXx8urWH6mFVhy6uavpjimkxmJKd6AZqPeT/0zWDaEayIk6ARCpSJO+vl1vSuosmgL
 uFOlGDQmO1JRGBHdGYISjcrF9X0JugS05SZj6ChTJUmMIxlUuXWP2nAKlbQoP+YzMc8X
 CtuQksjKcX94JoQyMwdEcbMjV+/ZEU9tSi0xMdtgHqUhUKKocA42FU5GfNJCIEleViHH
 2DR6qwj70Yl40uGFudZMGhjyOcZa4IknpmYluHMzDSRr5+QdcwZj7VWRkFfWGEOiZdp4
 RIrg==
X-Gm-Message-State: AOAM533Xj2XBGRJjvwljxEM+BDXla+aTnoit9qxAXnRVuCMwl63ymC9J
 Dx6Wk5USb+QjDt++G23IJ61cVTAT7h8LEKdW9nVMFA==
X-Google-Smtp-Source: ABdhPJyKDXjrH4Rdx8HoBvuhILp7Bm5NPUOe54OLFKaVIpD1ZUiGiEhtU0K/vJkW6aIffWUWo3xWlZcwq9ZB+SH09G0=
X-Received: by 2002:ab0:32d:: with SMTP id 42mr1633870uat.107.1599635602680;
 Wed, 09 Sep 2020 00:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-5-gurchetansingh@chromium.org>
 <20200902221514.GE1263242@redhat.com>
 <CAAfnVBnfbwc07au1OMec8g5yHC0D3yXc88nOtTopO4sitYf8ig@mail.gmail.com>
 <20200909070349.uyvg44xakdftibxh@sirius.home.kraxel.org>
In-Reply-To: <20200909070349.uyvg44xakdftibxh@sirius.home.kraxel.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 9 Sep 2020 09:13:11 +0200
Message-ID: <CAJfpegsMEZoCQe7frsr9Kaq6EZsuRFWP3zs7sgrxnUDLzfcx_w@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] virtio: Add get_shm_region method
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 9, 2020 at 9:04 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Sep 02, 2020 at 05:00:25PM -0700, Gurchetan Singh wrote:
> > On Wed, Sep 2, 2020 at 3:15 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > > Hi Gurchetan,
> > >
> > > Now Miklos has queued, these tree virtio patches for shared memory
> > > region in his tree as part of virtiofs dax patch series.
> > >
> > > I am hoping this will get merged in 5.10 through his tree.
> > >
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=dax
> >
> >
> > Terrific ... !  Maybe we can queue the version Miklos has in drm-misc-next
> > to avoid merge conflicts ?!?
>
> I guess it would either be merging the fuse tree into drm-misc-next,
> or cherry-picking the three virtio shm patches from the fuse tree.

Maybe cleanest if we'd do a separate branch for the virtio patches and
pull that into both the fuse-next and the drm-misc-next trees?

Thanks,
Miklos
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
