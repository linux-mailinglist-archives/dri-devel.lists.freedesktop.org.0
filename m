Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F5D44F448
	for <lists+dri-devel@lfdr.de>; Sat, 13 Nov 2021 18:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643F3730C2;
	Sat, 13 Nov 2021 17:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0A9730C2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 17:07:09 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r12so51308008edt.6
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 09:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRHTN+KJ/0jakG/3S1m86FduFSvoZNR/waj5CoABhhY=;
 b=AI5EgBuhXv3ifPQ/QJGAcgXo9vjiG/by8UhhOa7KCZNrvEzzpepwyfZxQwC1UOwsTg
 3NZXmVOf8DUa+Rt2QZOWgxDJuoswYf8qCtbhrV+XAj0eYtpUMzeJaj3aEp1I532no0eE
 8qsaWz4Ud04P5QaZPk1SnPlYrcPiAhAz2LsOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRHTN+KJ/0jakG/3S1m86FduFSvoZNR/waj5CoABhhY=;
 b=24ueAgQtSsFPhwDhsVON+QHxuulK/Hov13Eg2uoQa8LWsRQOaTzSsl/eCQUTP24Nvs
 U8yVOXvLwarvmwK+Y808zgUUwDiQ2NuD6CEzBG4s1WIV5Z+9bKx4PswXucKxARi5bhgU
 /0WOiKOgGae8weIee0Bn0B6PsUqhK6uo1LSqqD93swiZ1KF/uP1PGbl0wgiBYmyrraG/
 6+sKFWTHDpWyBeKZ1qgNt6cFGTpOTx52bPEfkDgjyroojiADhYPMuPEtswqQE/7WUU1w
 raRczsfdirY52bCm0Yz467hchIQtWf/5oj8pmPmw4/FypZyTFKdnAAK9p/3cOXQoeoR+
 jhYA==
X-Gm-Message-State: AOAM531xNwtvzJfhXBj/6C2SuRZ9b6bwMs2lT5RztIwSWJLMo51WUjrV
 dAwGxL3k5mdJ+XbmmcDAGu05SR+WbqXiBaPWVRqbUA==
X-Google-Smtp-Source: ABdhPJwGP1iH54aBaYVC33bjqbgQctUZp4Pi4rXKBOfxyi1+bPS5kw2APZGmPTqMUBDICCtmS9pO8y+RNk0rZrzATh4=
X-Received: by 2002:a05:6402:5146:: with SMTP id
 n6mr24252309edd.126.1636823228182; 
 Sat, 13 Nov 2021 09:07:08 -0800 (PST)
MIME-Version: 1.0
References: <CADVatmOuOk6RoZF=M9sZm2L=9NuDDsSNNCJJbAtkgScG0og1Ww@mail.gmail.com>
 <CADVatmP_Sn+SS5Yu5+7sJJ5SVpcaZcW8Z_Bj5vmYz9g3kJD86g@mail.gmail.com>
In-Reply-To: <CADVatmP_Sn+SS5Yu5+7sJJ5SVpcaZcW8Z_Bj5vmYz9g3kJD86g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 13 Nov 2021 09:06:57 -0800
Message-ID: <CAADWXX80QGk7MwZ7A-n+1+GHv=yrA0qrw-70Z=pFSEsc3UXfgQ@mail.gmail.com>
Subject: Re: regression with mainline kernel
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Verne <nverne@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ Hmm. This email was marked as spam for me. I see no obvious reason
for it being marked as spam, but it happens.. ]

On Thu, Nov 11, 2021 at 12:52 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> # first bad commit: [cd7f5ca33585918febe5e2f6dc090a21cfa775b0]
> drm/virtio: implement context init: add virtio_gpu_fence_event

Hmm. Judging from your automated screenshots, the login never appears.

> And, indeed reverting cd7f5ca33585 on top of debe436e77c7 has fixed
> the problem I was seeing on my qemu test of x86_64. The qemu image is
> based on Ubuntu.

Presumably either that commit is somehow buggy in itself - or it does
exactly what it means to do, and the new poll() semantics just
confuses the heck out of the X server (or wayland or whatever).

And honestly, if I read that thing correctly, the patch is entirely
broken. The new poll function (virtio_gpu_poll()) will unconditionally
remove the first event from the event list, and then report "Yeah, I
had events".

This is completely bogus for a few reasons:

 - poll() really should be idempotent, because the poll function gets
called multiple times

 - it doesn't even seem to check that the event that it removes is the
new VIRTGPU_EVENT_FENCE_SIGNALED_INTERNAL kind of event, so it will
unconditionally just remove random events.

 - it does seem to check the "vfpriv->ring_idx_mask" and do the old
thing if that is zero, but I see absolutely no reason for that (and
that check itself has caused problems, see below)

Honestly, my reaction to this all is that that commit is fundamentally
broken and probably should be reverted regardless as "this commit does
bad things".

HOWEVER - it has had a fix for a NULL pointer dereference in the
meantime - can you check whether the current top of tree happens to
work for you? Maybe your problem isn't due to "that commit does
unnatural things", but simply due to the bug fixed in d89c0c8322ec
("drm/virtio: Fix NULL dereference error in virtio_gpu_poll").

And if it's still broken with that commit, I'll happily revert it and
people need to go back to the drawing board.

In fact, I would really suggest that people look at that
virtio_gpu_poll() function regardless. That odd "let's unconditionally
just drop events in the poll function is really REALLY broken
behavior.

              Linus
