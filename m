Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D70154B2F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 19:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0F56FB06;
	Thu,  6 Feb 2020 18:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA206FB06
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 18:32:50 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id f5so5995935ilq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 10:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eo58tkWzFG+QPveuoUYzk/xbxuvYMBHe+JEnvPAZ8SM=;
 b=C78D79JR83iHMAAwItqMeFqfF5QI77M9CbRJ/PUHuwKelJmXyB2Uq+2AL/wLJk3HW7
 zHtgI1OKexik0fFwZH7tQUXNcV9p78bpIFM7vzfxR1Ci9JUjSc3BqjVX89L3M7a6a/bU
 S9Wc8qrkJITb4TgIARKEOeHpPj/L3fol7twHTJiSNKs53NssrvzxxEpygWOavTHxU6/V
 lLl+QqnUQdsWlB8uRUDwz3EY6Qiz4tQtRIAp3sGBr2cUkSv7P2umSXqawyizmhhoolrd
 u/ZgBSoJLfeIY/9yzrTHXYAaUNRddrgtP2fxDoOhYosRi0W7rd5Px9eFfZTE9blQM47r
 T9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eo58tkWzFG+QPveuoUYzk/xbxuvYMBHe+JEnvPAZ8SM=;
 b=lRlKaAcIgXrcWY0WqrWSZedUDE9n1I+l6aVn8dH6ouif1t84gJSAGceXGkm8drtp8d
 xYTWHctbYz4sYarL6KW2RcMg45PymjBFLIT+t7MXrMDNIwzXUxUESimCxMNjuTCe6Nk8
 m2OvRL8hnw3FE2WRNneQFECZ7TD0l725Dz/ZawRoIDVu1yCchvSkGNMyWUPSFj9mQGms
 7OTlRR0mxnmfTMVY6QQGMvjkpz1/DZ45u19gbVSj9pKGYVu/eOK64GsHnzwGkqAGhJsj
 YR9sva7aKYSEopStUKo8lIy8TiLzefVxio0NEaNRqRmsDl6KRqUlgQwr6CoJyCXPZukm
 nTsg==
X-Gm-Message-State: APjAAAVMgIGwz/WIedKKXTNKgKvewIhGcoJ7QoMC3KKdUb+AZdbQT1Xh
 Zult3RQs3dKUwsi3g93MvA3mtF1gX7gQvznPoxI=
X-Google-Smtp-Source: APXvYqwCwRuEwlR45CzsvgbiELUaIE5822wDHqy5FFXZa8qhVDAli6WE/pbnGUoZZnSZCnYk433yOCAV900RWp3C6rA=
X-Received: by 2002:a92:4a0a:: with SMTP id m10mr5427074ilf.84.1581013969410; 
 Thu, 06 Feb 2020 10:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20200205105955.28143-1-kraxel@redhat.com>
 <20200205105955.28143-3-kraxel@redhat.com>
 <CAPaKu7SCk_3yeTtzFTTU_y-tyo8EDS7vR8i+mk829=0D-UjLQA@mail.gmail.com>
 <20200206064338.badm6ijgyo2p5mmc@sirius.home.kraxel.org>
In-Reply-To: <20200206064338.badm6ijgyo2p5mmc@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 6 Feb 2020 10:32:38 -0800
Message-ID: <CAPaKu7S0E7Dm66UMkxb+3cwXuX3EXggFD0w66fv8exH4cQH==Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/virtio: resource teardown tweaks
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 5, 2020 at 10:43 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > -
> > > -       drm_gem_shmem_free_object(obj);
> > > +       if (bo->created) {
> > > +               virtio_gpu_cmd_unref_resource(vgdev, bo);
> > > +               /* completion handler calls virtio_gpu_cleanup_object() */
> > nitpick: we don't need this comment when virtio_gpu_cmd_unref_cb is
> > defined by this file and passed to virtio_gpu_cmd_unref_resource.
>
> I want virtio_gpu_cmd_unref_cb + virtio_gpu_cmd_unref_resource being
> placed next to each other so it is easier to see how they work hand in
> hand.
>
> > I happen to be looking at our error handling paths.  I think we want
> > virtio_gpu_queue_fenced_ctrl_buffer to call vbuf->resp_cb on errors.
>
> /me was thinking about that too.  Yes, we will need either that,
> or a separate vbuf->error_cb callback.  That'll be another patch
> though.
Or the new virtio_gpu_queue_ctrl_sgs can return errors rather than
eating errors.

Yeah, that should be another patch.
>
> > > +       /*
> > > +        * We are in the release callback and do NOT want refcount
> > > +        * bo, so do NOT use virtio_gpu_array_add_obj().
> > > +        */
> > > +       vbuf->objs = virtio_gpu_array_alloc(1);
> > > +       vbuf->objs->objs[0] = &bo->base.base
> > This is an abuse of obj array.  Add "void *private_data;" to
> > virtio_gpu_vbuffer and use that maybe?
>
> I'd name that *cb_data, but yes, that makes sense.
Sounds great.
>
> cheers,
>   Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
