Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A551E845D
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 19:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B6C6E8D5;
	Fri, 29 May 2020 17:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4216C6E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 17:10:42 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e4so136940ljn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 10:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KPyuBRcQNbJ+VwGdtXFWatMMnCegtJoH/pNmZ2I0xk4=;
 b=epFNEYzhQc/n0QzWyV0AZT8WyDCpcgXqFs7jRR0aPYJXObEFlNvKpdg/z+0Oqd2fje
 iC0bnCh1DJRkHOQTWL/p2lJMcbnz4cYT/m80OChPKMC8bmcLYM0qG0GL6GH349hR9ww5
 CeXEe0Fhzh2sAcU5z7NH+bV788b16SLr4Dqr4AkwjjTzEbBB2uoFtq/pEwVoZ4BpH39Q
 kglleLZcSxoRu2e6LruwJ8dsRQuJp3qZvEe6eWDdbsEKW0oifOqkJg6mnNTzX4LWnBbs
 893SBh6RjFikYbQ3Td27qV9XGv+Cbg5/O7WJdc9tod8QbJbs6qVplRZDjtqdtbqc9HCn
 BNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KPyuBRcQNbJ+VwGdtXFWatMMnCegtJoH/pNmZ2I0xk4=;
 b=M+TFBRzLduhVqVdenfEb+VDxqkvjaT/46oJaOPpiCVAlUKWwUptcrMfkIgBfQSJOEw
 Xd4gzLKoltSVJn26Mkpy6v6KFy3Dz5vtorx+Gs3AroP5bCN40I9UMHW1U7n38wuEa77L
 M8GJ+bWrHazt2XSMHjH3ItKu5pj1iZ/tF9STlTBIXhbuF8EFurSxTEdCVWgm3snm4AGf
 FAHGaVwvJ1z0N98LC6/jSVWgluLR1zuwDZcD+J93Misv1ujcF7fs6Bye4+2iE8C8cSHw
 dExLchgcJ4WICfZ4aFmRhgSYJvg+wWxpR1D5AWIqY3yRK87ROtSkH8uqx5GPx4HYmKG7
 jBgA==
X-Gm-Message-State: AOAM53130orP8tzc0mdPRySCVWWS4SvuFpShIcOx9dMChPqcGqlwTcNI
 5yGRIe9EvCQt7KSxWOWXc2ISAMh/9z1SXKUTf2p/rw==
X-Google-Smtp-Source: ABdhPJx/N8vREFnso39ZcReWkXU6GMlXvj7l0GILCl1g6Nn+TjvNS/JorZF9vSwyo1a4DWyjZ2dRdQ205jXKNKaL3Wc=
X-Received: by 2002:a2e:a552:: with SMTP id e18mr4467216ljn.162.1590772240367; 
 Fri, 29 May 2020 10:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200528170604.22476-1-rohan.garg@collabora.com>
 <CADaigPUZ3j35iBKtOyR=3WWKuu+V_PcPEgrk7-FzZWb6QSabbQ@mail.gmail.com>
 <4235324.LvFx2qVVIh@saphira>
In-Reply-To: <4235324.LvFx2qVVIh@saphira>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 29 May 2020 10:10:29 -0700
Message-ID: <CADaigPUKm-FSb8nVEPZQWn3f6_VWKN_hXqT-U7MzWLXhKJ3H+w@mail.gmail.com>
Subject: Re: [PATCH v6] drm/ioctl: Add a ioctl to set and get a label on GEM
 objects
To: Rohan Garg <rohan.garg@collabora.com>
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
Cc: kernel@collabora.com, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 6:44 AM Rohan Garg <rohan.garg@collabora.com> wrote:
>
> Hey Eric!
>
> On jueves, 28 de mayo de 2020 20:45:24 (CEST) Eric Anholt wrote:
> > On Thu, May 28, 2020 at 10:06 AM Rohan Garg <rohan.garg@collabora.com>
> wrote:
> > > DRM_IOCTL_HANDLE_SET_LABEL lets you label buffers associated
> > > with a handle, making it easier to debug issues in userspace
> > > applications.
> > >
> > > DRM_IOCTL_HANDLE_GET_LABEL lets you read the label associated
> > > with a buffer.
> > >
> > > Changes in v2:
> > >   - Hoist the IOCTL up into the drm_driver framework
> > >
> > > Changes in v3:
> > >   - Introduce a drm_gem_set_label for drivers to use internally
> > >
> > >     in order to label a GEM object
> > >
> > >   - Hoist string copying up into the IOCTL
> > >   - Fix documentation
> > >   - Move actual gem labeling into drm_gem_adopt_label
> > >
> > > Changes in v4:
> > >   - Refactor IOCTL call to only perform string duplication and move
> > >
> > >     all gem lookup logic into GEM specific call
> > >
> > > Changes in v5:
> > >   - Fix issues pointed out by kbuild test robot
> > >   - Cleanup minor issues around kfree and out/err labels
> > >   - Fixed API documentation issues
> > >   - Rename to DRM_IOCTL_HANDLE_SET_LABEL
> > >   - Introduce a DRM_IOCTL_HANDLE_GET_LABEL to read labels
> > >   - Added some documentation for consumers of this IOCTL
> > >   - Ensure that label's cannot be longer than PAGE_SIZE
> > >   - Set a default label value
> > >   - Drop useless warning
> > >   - Properly return length of label to userspace even if
> > >
> > >     userspace did not allocate memory for label.
> > >
> > > Changes in v6:
> > >   - Wrap code to make better use of 80 char limit
> > >   - Drop redundant copies of the label
> > >   - Protect concurrent access to labels
> > >   - Improved documentation
> > >   - Refactor setter/getter ioctl's to be static
> > >   - Return EINVAL when label length > PAGE_SIZE
> > >   - Simplify code by calling the default GEM label'ing
> > >
> > >     function for all drivers using GEM
> > >
> > >   - Do not error out when fetching empty labels
> > >   - Refactor flags to the u32 type and add documentation
> > >   - Refactor ioctls to use correct DRM_IOCTL{R,W,WR} macros
> > >   - Return length of copied label to userspace
> > >
> > > Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> >
> > I don't think we should land this until it actually does something
> > with the label, that feels out of the spirit of our uapi merge rules.
> > I would suggest looking at dma_buf_set_name(), which would produce
> > useful output in debugfs's /dma_buf/buf_info.  But also presumably you
> > have something in panfrost using this?
> >
>
> My current short term plan is to hook up glLabel to the labeling functionality
> in order for userspace applications to debug exactly which buffer objects
> could be causing faults in the kernel for speedier debugging.

So, something like "when a fault happens, dump/capture names of nearby
objects"?  That would certainly be nice to have!

> The more long term plan is to label each buffer with a unique id that we can
> correlate to the GL calls being flushed in order to be able to profile (a set
> of)  GL calls on various platforms in order to aid driver developers with
> performance work. This could be something that we corelate on the userspace
> side with the help of perfetto by using this [1] patch that emits ftrace
> events.

I'm curious how BO names are part of profiling?  Do you have the
ability to sample instruction IP and use that to figure out where time
is spent in shaders, or something?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
