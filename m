Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51038372BCD
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 16:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5065E6EB0B;
	Tue,  4 May 2021 14:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BCB6EB0B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 14:15:59 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b17so7612898ede.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZJSqmj+wy6JuYx+4z24wGvoXTHPcGpdQL2jEMIJXU5Y=;
 b=AnmANjLtiT9XfLAmW1a8QsWD/BdR16WP2KoemiCgEfb214k6b9Uym73/klLD0DTAV+
 r9vPzqP9+u0RCbcWkjBDdXtDuRL/8TG1zhieC4iButUsmGx2zR8wuCUSu339QzLIj+fu
 HSq9gZwinTCIwWY/w5lghifJiXJbAwMc1dFWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZJSqmj+wy6JuYx+4z24wGvoXTHPcGpdQL2jEMIJXU5Y=;
 b=FZUzVgT5i2uUyRhlCOAJ8NhlR+Fr9A+s+FYzexI2UAldcNrrdlOccdbno4Qc4AL2kO
 xebc4cye8EP9k9BjqUviFXp7swevOMZDV8+6VhrgKPMWW7dhCrCMltASuQySCCaNNmIu
 HwTpGtOJ7M/2/DP1uwvA3sL03jUUfsqpSLFeEd8e5r6jnclongf0/WAQ5YktOdgZVFgc
 Ge6gK9u3hFKV76AzzOzOv2SQD8d/3DNG2UeWmfkY4y1A9RJFYG03KsNRQzf3uDq6ebFB
 /RnOHfJgPMvdysTMekEClPZA+LwHe2odoDW2V/198Y+5LA49nvYYJQJ1ckRX2hiDXxqM
 2sxw==
X-Gm-Message-State: AOAM531auEYK6o1culhEBDAia/ZyO6hW1IEpgKCKYL16wtQNslqocmQm
 EpcdjNpcyApL1NixdrCSdDnbsg==
X-Google-Smtp-Source: ABdhPJy3zJnIUEgzB6XoUo3m/PEBgbuqBQkrErrlgJ4UQOvDUuwb3m7WJ5ZwdiLHzY5cIOo8+c/Eaw==
X-Received: by 2002:aa7:c7cc:: with SMTP id o12mr26648673eds.291.1620137758386; 
 Tue, 04 May 2021 07:15:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s8sm14419420edj.25.2021.05.04.07.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 07:15:57 -0700 (PDT)
Date: Tue, 4 May 2021 16:15:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC] Implicit vs explicit user fence sync
Message-ID: <YJFXG/THrjXqQjyN@phenom.ffwll.local>
References: <20210504132729.2046-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Tue, May 04, 2021 at 03:27:17PM +0200, Christian K=F6nig wrote:
> Hi guys,
> =

> with this patch set I want to look into how much more additional work it
> would be to support implicit sync compared to only explicit sync.
> =

> Turned out that this is much simpler than expected since the only
> addition is that before a command submission or flip the kernel and
> classic drivers would need to wait for the user fence to signal before
> taking any locks.

It's a lot more I think
- sync_file/drm_syncobj still need to be supported somehow
- we need userspace to handle the stall in a submit thread at least
- there's nothing here that sets the sync object
- implicit sync isn't just execbuf, it's everything. E.g. the various
  wait_bo ioctl also need to keep working, including timeout and
  everything
- we can't stall in atomic kms where you're currently stalling, that's for
  sure. The uapi says "we're not stalling for fences in there", and you're
  breaking that.
- ... at this point I stopped pondering but there's definitely more

Imo the only way we'll even get the complete is if we do the following:
1. roll out implicit sync with userspace fences on a driver-by-driver basis
   1a. including all the winsys/modeset stuff
2. roll out support for userspace fences to drm_syncobj timeline for
   interop, both across process/userspace and across drivers
   2a. including all the winsys/modeset stuff, but hopefully that's
       largely solved with 1. already.
3. only then try to figure out how to retroshoehorn this into implicit
   sync, and whether that even makes sense.

Because doing 3 before we've done 1&2 for at least 2 drivers (2 because
interop fun across drivers) is just praying that this time around we're
not collectively idiots and can correctly predict the future. That never
worked :-)

> For this prototype this patch set doesn't implement any user fence
> synchronization at all, but just assumes that faulting user pages is
> sufficient to make sure that we can wait for user space to finish
> submitting the work. If necessary this can be made even more strict, the
> only use case I could find which blocks this is the radeon driver and
> that should be handle able.
> =

> This of course doesn't give you the same semantic as the classic
> implicit sync to guarantee that you have exclusive access to a buffers,
> but this is also not necessary.
> =

> So I think the conclusion should be that we don't need to concentrate on
> implicit vs. explicit sync, but rather how to get the synchronization
> and timeout signalling figured out in general.

I'm not sure what exactly you're proving here aside from "it's possible to
roll out a function with ill-defined semantics to all drivers". This
really is a lot harder than just this one function and just this one patch
set.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
