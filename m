Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5BD34460C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9137C6E49D;
	Mon, 22 Mar 2021 13:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB1B6E492
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 13:41:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o16so16873098wrn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=INfilF6yJ4n21X8RhKBBngxEv/hMuyhn5BRihkpsfgA=;
 b=io+iYRCg6GaY95pphBE1/bMCkySNq7Vy/aUanS9UBP1u8pI80cQ2C8RQxqoJMwYCbL
 PE+acndxmzgJEsRrQegGkTxCXvt9ke5GN7W/wP7xbWYLIta17mNGslxztsSvwQckaoyR
 MuzA777DZFmQnsDOpjWILEL/6GqHT1H6tSiHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=INfilF6yJ4n21X8RhKBBngxEv/hMuyhn5BRihkpsfgA=;
 b=uKZkPPlMiaC2mMQ0blPxu7h6QkcnfLG6YyHG1BA1GaCURfwPMwjCedsEPwLgvMhGea
 zLCV9pzM6BWYjIkiBkYZYo5YEAHjxvxk1Mydw2Q6ZjX8MVyzZ0SHzUNRYlhvX/mWEwER
 jHfz+rJWdb7iaSJUM7Fr+jD9iEvBchLvRTyBLFgZeayzDRQXR2W+kbYRntH5ULU25N94
 DGt02beTF9UO/Fsadn8C+5rGJZUD8i+OJy6BTPaOoDDZ5aWt6guGsbgqspK5aWME1uIM
 M70Q/Pjc5v7gr96GyOo6bQ8a2iOWf5VdV1ZZvmvDVyp3au5eK7GFdy40yMZiv5TuAkPW
 wbcA==
X-Gm-Message-State: AOAM532+cIZrAi6LttLU8U5/R8yUvr8b4yPz/KUFYnJl0C2VNn6w/c7e
 UZevV+lhTCZW/UAzctCxqB4Tin06RIPy7Ypc
X-Google-Smtp-Source: ABdhPJzXdS64VI8wvFOc0kn6WRqDgAZqVSVrNUlPARFJokzXA1wv3l9i98oRhjn5Moj8HQlmAI59eA==
X-Received: by 2002:a1c:e341:: with SMTP id a62mr16547323wmh.152.1616420498315; 
 Mon, 22 Mar 2021 06:41:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y16sm20062607wrh.3.2021.03.22.06.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:41:37 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:41:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 Default request/fence expiry + watchdog (rev3)
Message-ID: <YFiekGrvT25CPEw3@phenom.ffwll.local>
References: <20210318170419.2107512-1-tvrtko.ursulin@linux.intel.com>
 <161611666102.8628.1124825882873170304@emeril.freedesktop.org>
 <39d7d721-4e52-89b2-8efe-54cb7768ec6c@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39d7d721-4e52-89b2-8efe-54cb7768ec6c@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 01:37:58PM +0000, Tvrtko Ursulin wrote:
> 
> On 19/03/2021 01:17, Patchwork wrote:
> 
> Okay with 20s default expiration the hangcheck tests on Tigerlake pass and
> we are left with these failures:
> 
> >       IGT changes
> > 
> > 
> >         Possible regressions
> > 
> >   *
> > 
> >     igt@gem_ctx_ringsize@idle@bcs0:
> > 
> >       o shard-skl: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/shard-skl10/igt@gem_ctx_ringsize@idle@bcs0.html>
> >         -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19806/shard-skl7/igt@gem_ctx_ringsize@idle@bcs0.html>
> 
> Too many runnable requests on a slow Skylake SKU with command parsing
> active. Too many to finish withing the 20s default expiration that is. This
> is actually the same root cause as the below tests tries to explicitly
> demonstrate:
> 
> >   *
> > 
> >     {igt@gem_watchdog@far-fence@bcs0} (NEW):
> > 
> >       o shard-glk: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19806/shard-glk7/igt@gem_watchdog@far-fence@bcs0.html>
> >   *
> > 
> >     {igt@gem_watchdog@far-fence@vcs0} (NEW):
> > 
> >       o shard-apl: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19806/shard-apl1/igt@gem_watchdog@far-fence@vcs0.html>
> >         +2 similar issues
> >   *
> > 
> >     {igt@gem_watchdog@far-fence@vecs0} (NEW):
> > 
> >       o shard-kbl: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19806/shard-kbl7/igt@gem_watchdog@far-fence@vecs0.html>
> >         +2 similar issues
> 
> The vulnerability default expiration adds compared to the current state is
> applicable to heaviliy loaded systems where GPU is shared between multiple
> clients.
> 
> Otherwise series seems to work. Failing tests can be blacklisted going
> forward. Ack to merge and merge itself, after review, I leave to maintainers
> since personally I am not supportive of this mechanism.

Yeah I think we have some leftovers to look at after this has landed on
igt side, since with 20s we're rather long on the timeout side, and some
of the tests need to be resurrected with the preempt-ctx execbuf mode I
think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
