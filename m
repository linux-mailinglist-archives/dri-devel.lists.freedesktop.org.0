Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A7F30D760
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 11:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DCC6EA4C;
	Wed,  3 Feb 2021 10:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0406EA4C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 10:23:44 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id m1so4648495wml.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 02:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=YVcGpKd8+eC2YQ5xYyo7fYllHOO2iPEn0qmRLD8c4tk=;
 b=XcTmJyWd74nvKmKqGb0lHYbm4BberuwObLIrEVZVDU5MFPGSgRvwBVl691DtsVL32v
 PoxSztsiW9kqnY7fWODTxJQ24Xut19EQmALlq/oOlmCC/lE28uXGaC0MT/lTB3vpqnHz
 OO6YtZ53iIHcnPn/3H7K8/Ji389pkKLCfJXYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=YVcGpKd8+eC2YQ5xYyo7fYllHOO2iPEn0qmRLD8c4tk=;
 b=ftaIZmE7whn0uvN0uc/4jFdVJ2q7EZT6ieRa1zx6zv5kaIqvuqxdS0PUtqTpGat+ix
 OLeSaRBC/LOppLfVe4rmSVWN2yB1CSTFly/CyGECKUaDIk5QWa497JXtA7p6wM5ixkRy
 GcxJmPE8LLlQwUqPzgJAXsFXgta0w5u6stl27z2xMRqRCIok4TFHc1DUljsFHJL+7ZWN
 JB7DNdGOaw673WSqqD1BnwuWS+zpDVQFrxeH1iaOyuaZt9QfD7pKRsEH64uy4sYYkvFm
 8MPKvaDp/YbJju9QDKjze7FtcnPvQXn4EfX0g/dthB/4gUzTeZKiX/zK0ucVNRj9uekn
 O93g==
X-Gm-Message-State: AOAM533lVOkyjXIxazvDSRwIxQ8a9jEcNIt5J9JUIDuAqdZFYKNnwhbw
 8/ch40XUeniXgIEAbm/YBn3cQg==
X-Google-Smtp-Source: ABdhPJwiI5aD5dqY1ckorWBWkPtWhv80Z2HTWzG7jeWjpVya/U1sTYHLj7xvi3ENjtXKYY1O+EVTCA==
X-Received: by 2002:a7b:c3ca:: with SMTP id t10mr1325153wmj.138.1612347823070; 
 Wed, 03 Feb 2021 02:23:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b3sm2351907wme.32.2021.02.03.02.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 02:23:42 -0800 (PST)
Date: Wed, 3 Feb 2021 11:23:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
Message-ID: <YBp5qzLBBMJE0Yhn@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Michal Hocko <mhocko@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>,
 dri-devel@lists.freedesktop.org, Andrei Vagin <avagin@gmail.com>,
 Kalesh Singh <kaleshsingh@google.com>, Hui Su <sh_def@163.com>,
 Michel Lespinasse <walken@google.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jeffrey Vander Stoep <jeffv@google.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 kernel-team <kernel-team@android.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 linaro-mm-sig@lists.linaro.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Suren Baghdasaryan <surenb@google.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux API <linux-api@vger.kernel.org>
References: <20210126225138.1823266-1-kaleshsingh@google.com>
 <CAG48ez2tc_GSPYdgGqTRotUp6NqFoUKdoN_p978+BOLoD_Fdjw@mail.gmail.com>
 <YBFG/zBxgnapqLAK@dhcp22.suse.cz>
 <ea04b552-7345-b7d5-60fe-7a22515ea63a@amd.com>
 <20210128120130.50aa9a74@eldfell>
 <c95af15d-8ff4-aea0-fa1b-3157845deae1@amd.com>
 <20210129161334.788b8fd0@eldfell>
 <wgUb8smQArgjbRFYMPYVDmukBT-_BrqG2M6XIOkWdBcW_x-m4ORnl3VOvH3J4wrsNGMoOXqMAro0UmkdVXFNso9PEiNCFGEeruibhWsmU34=@emersion.fr>
 <f680ced7-3402-4a1e-4565-35ad7cd0c46d@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f680ced7-3402-4a1e-4565-35ad7cd0c46d@amd.com>
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
Cc: Michal Hocko <mhocko@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, dri-devel@lists.freedesktop.org,
 Andrei Vagin <avagin@gmail.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hui Su <sh_def@163.com>, Michel Lespinasse <walken@google.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jeffrey Vander Stoep <jeffv@google.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 kernel-team <kernel-team@android.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 linaro-mm-sig@lists.linaro.org, Hridya Valsaraju <hridya@google.com>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Suren Baghdasaryan <surenb@google.com>,
 kernel list <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 03:22:06PM +0100, Christian K=F6nig wrote:
> Am 29.01.21 um 15:17 schrieb Simon Ser:
> > On Friday, January 29th, 2021 at 3:13 PM, Pekka Paalanen <ppaalanen@gma=
il.com> wrote:
> > =

> > > > Re-importing it adds quite a huge CPU overhead to both userspace as=
 well
> > > > as the kernel.
> > > Perhaps, but so far it seems no-one has noticed the overhead, with Me=
sa
> > > at least.
> > > =

> > > I happily stand corrected.
> > Note, all of this doesn't mean that compositors will stop keeping
> > DMA-BUF FDs around. They may want to keep them open for other purposes
> > like importing them into KMS or other EGL displays as needed.
> =

> Correct and that's a perfectly valid use case. Just re-importing it on ev=
ery
> frame is something we should really try to avoid.
> =

> At least with debugging enabled it's massive overhead and maybe even
> performance penalty when we have to re-create device page tables all the
> time.
> =

> But thinking more about that it is possible that we short-cut this step as
> long as the original import was still referenced. Otherwise we probably
> would have noticed this much earlier.

Yeah kernel keeps lots of caches around and just gives you back the
previous buffer if it's still around. Still probably not the smartest
idea.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
