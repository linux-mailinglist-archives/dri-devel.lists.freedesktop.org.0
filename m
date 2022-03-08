Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F464D242A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 23:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B3A10E294;
	Tue,  8 Mar 2022 22:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161AE10E270
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 22:23:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r10so296189wrp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 14:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VLNTenH17gTL++hzFtoUTNEHN+pSYqZsQ93MYsewbsE=;
 b=B+Y+aj0Kp1KcmHD1TJUXHwyix6ApB1/FqwmXZGhx1wcc4TAOmxh9gxTlBgAGamLqPE
 vpKcowdhEgZzk2U98r53D5Hy1Scrw6xH8PQcSydekPlZ5HI3qiA9pxOFbKVYi/9OQf1Z
 2z+/4YhPKMZ9oKQH20k7HP91wcJX8Isk8gqkO9jES0i3L0GPwD3p1LcGOB9U6h/BRgsQ
 8084feHyzqqtSFPTbppFkm13Ecg1wAy6AkYXNngnc+JaHTQVPUGmgGjdIb5GLtIM4Q/G
 bFqhl4gpP3fujkTcmelxXGFmAibfXsgFjzDNGvuS4OkzK2lYWp6unZQFj+/yXcyvAvNf
 Zjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VLNTenH17gTL++hzFtoUTNEHN+pSYqZsQ93MYsewbsE=;
 b=jdWy8KYQYKgd/duiynFYuQdLx3IkscXQZpRMy2IXGG+kMwyKo81nlb/kbEEkDMnF+s
 dXScgEYJBoUkfoj+FYbcqh4LCVFtHQIi36KIjXWgQ8lQZJvfTl5zb9Mrrb8x3Ut3uFjV
 QhZujE5z8wtuq0tDFYnAfELSF+MXY+7auezyu+BUbKp5RFZ8i5MDvJZdY1ne8QIPbWrA
 J4UlelF6yQPFUs8UHgDtT43knx9fePo6H3d/iFN95vv3kW2qdbcmH8KDyx+dedGkdlHl
 ej5hYxPj7i2WeV5B8p/IWq5ejuU2icPUltMPhdxP1IUQzWQsSZ/weU99M2F/l9LzNLbh
 I+hw==
X-Gm-Message-State: AOAM531uA92K5FEF8T/f+L2OueYRSe2ZpP4ra/hZh1JAEVHABHXNDqKR
 0epjn3LYdtvGiFJA3PydX/AO8ul+VQINXp6NOwA=
X-Google-Smtp-Source: ABdhPJyGuPzIrRNVs2k9a2b1qGUaqAliN4KUm5RnUtzkOdj1rRLWp/R6GjNYrs64hWACoBMY67pIWSlhNB+JjFA13n4=
X-Received: by 2002:a05:6000:15c5:b0:1f1:e64d:e4c3 with SMTP id
 y5-20020a05600015c500b001f1e64de4c3mr11545524wry.328.1646778234465; Tue, 08
 Mar 2022 14:23:54 -0800 (PST)
MIME-Version: 1.0
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <CAF6AEGt=aVJ9nR+Wv+bJEFZrn-cNOSNXG1TaJr=Cx-FTgutwKA@mail.gmail.com>
 <d2290971-ea22-8203-631e-b896c76a994b@collabora.com>
In-Reply-To: <d2290971-ea22-8203-631e-b896c76a994b@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Mar 2022 14:24:22 -0800
Message-ID: <CAF6AEGuR8B6z+z=VFQ6y01wbboYS_qpkghD1GYdLES_RZOW1wA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 11:28 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 3/8/22 19:29, Rob Clark wrote:
> > On Tue, Mar 8, 2022 at 5:17 AM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> Hello,
> >>
> >> This patchset introduces memory shrinker for the VirtIO-GPU DRM driver.
> >> During OOM, the shrinker will release BOs that are marked as "not needed"
> >> by userspace using the new madvise IOCTL. The userspace in this case is
> >> the Mesa VirGL driver, it will mark the cached BOs as "not needed",
> >> allowing kernel driver to release memory of the cached shmem BOs on lowmem
> >> situations, preventing OOM kills.
> >
> > Will host memory pressure already trigger shrinker in guest?
>
> The host memory pressure won't trigger shrinker in guest here. This
> series will help only with the memory pressure within the guest using a
> usual "virgl context".
>
> Having a host shrinker in a case of "virgl contexts" should be a
> difficult problem to solve.

Hmm, I think we just need the balloon driver to trigger the shrinker
in the guest kernel?  I suppose a driver like drm/virtio might want to
differentiate between host and guest pressure (ie. consider only
objects that have host vs guest storage), but even without that,
freeing up memory in the guest when host is under memory pressure
seems worthwhile.  Maybe I'm over-simplifying?

> > This is
> > something I'm quite interested in for "virtgpu native contexts" (ie.
> > native guest driver with new context type sitting on top of virtgpu),
>
> In a case of "native contexts" it should be doable, at least I can't see
> any obvious problems. The madvise invocations could be passed to the
> host using a new virtio-gpu command by the guest's madvise IOCTL
> handler, instead-of/in-addition-to handling madvise in the guest's
> kernel, and that's it.

I think we don't want to do that, because MADV:WILLNEED would be by
far the most frequent guest<->host synchronous round trip.  So from
that perspective tracking madvise state in guest kernel seems quite
attractive.

If we really can't track madvise state in the guest for dealing with
host memory pressure, I think the better option is to introduce
MADV:WILLNEED_REPLACE, ie. something to tell the host kernel that the
buffer is needed but the previous contents are not (as long as the GPU
VA remains the same).  With this the host could allocate new pages if
needed, and the guest would not need to wait for a reply from host.

> > since that isn't using host storage
>
> s/host/guest ?

Yes, sorry, I meant that it is not using guest storage.

BR,
-R
