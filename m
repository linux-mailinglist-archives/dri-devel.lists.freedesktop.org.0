Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B22EB58F09D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B38110FDC0;
	Wed, 10 Aug 2022 16:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5918710E3B2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:42:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso1307404wma.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc;
 bh=caDNEl7O4r0UYVlzN7+UmHEEEUCui795HHbEaawKiHE=;
 b=S5QQAFrMKCtLcDVFS3bfahOn76A0XBEJv+NC+1I+ozvQZtg7E8LG5y2GP0jzlL7vWg
 KWBrzmzW3DSvxgm28eAHgY8cpKXkwpX56TpvYkpgMSSxTYZBGP3n4HsXnrqeNCIvVHWm
 b1XBCOs4Q+O1dV/vxJKBRqh1GFYoppu4TogsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc;
 bh=caDNEl7O4r0UYVlzN7+UmHEEEUCui795HHbEaawKiHE=;
 b=RXynoHV6NBWSjg6RPrWYiY5c5A1MgzFBngMl1b2vl4zWe8Nwzrt3bA2MMavtJVTFSb
 +gU7+XSdcD85+1GCmI8QUkJc/i1KhHHNdWRrSoRMD/VU1H9ma4TrBHifTecqIJimRGvl
 3stAH052w/da1oDd9UhzgxRM4imz6V5Na8zMRUIFR/NGp0aRZKBvVlYET2SpiN+tzvIA
 daK7k1A9OJqhHW4mrxp3kdwC0iwkD3UqK1Uy0ggYksvMVw6RauDvi6nLDqLtJZ8eaIaK
 6pyoh+tPo0TJ0PVNJnsjchFDD+zE802t/YcHayHMzVhsx83JMK20BCguvNsu6fWLyua2
 0TOg==
X-Gm-Message-State: ACgBeo1wywalkILAIixNWuZuiUzUnJd5DQCU3mIql/p7D3O8CTW8aBnt
 PBGwOwhD2mzQncDz7OZnSDWytg==
X-Google-Smtp-Source: AA6agR5M8dV1awXpkYQGRJWDfCDyLSLcsB22cqRYuR/yCVmcd1U/JfV3GxdJUr7JouwwYx1ndTJnOA==
X-Received: by 2002:a05:600c:4fd5:b0:3a3:4664:6d55 with SMTP id
 o21-20020a05600c4fd500b003a346646d55mr3163330wmq.73.1660149771921; 
 Wed, 10 Aug 2022 09:42:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a05600c384400b003a4eea0aa48sm3120158wmr.0.2022.08.10.09.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 09:42:51 -0700 (PDT)
Date: Wed, 10 Aug 2022 18:42:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <jstultz@google.com>
Subject: Re: [RFC][PATCH 3/3] kselftest: Add drm_syncobj API test tool
Message-ID: <YvPgCRqMz1bw9gmI@phenom.ffwll.local>
Mail-Followup-To: John Stultz <jstultz@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Chunming Zhou <david1.zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Shuah Khan <shuah@kernel.org>,
 dri-devel@lists.freedesktop.org
References: <20220712042258.293010-1-jstultz@google.com>
 <20220712042258.293010-3-jstultz@google.com>
 <44e2cb41-641c-2a50-3e38-284e4504f012@amd.com>
 <CANDhNCrPhJacBjQZ4DMhmo9iaxBov8m8tbTqdU07PheaKFbE-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCrPhJacBjQZ4DMhmo9iaxBov8m8tbTqdU07PheaKFbE-g@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Chunming Zhou <david1.zhou@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Shuah Khan <shuah@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 08:52:53AM -0700, John Stultz wrote:
> On Tue, Jul 12, 2022 at 12:43 AM Christian König
> <christian.koenig@amd.com> wrote:
> > Am 12.07.22 um 06:22 schrieb John Stultz:
> > > An initial pass at a drm_syncobj API test.
> > >
> > > Currently covers trivial use of:
> > >    DRM_IOCTL_SYNCOBJ_CREATE
> > >    DRM_IOCTL_SYNCOBJ_DESTROY
> > >    DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD
> > >    DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE
> > >    DRM_IOCTL_SYNCOBJ_WAIT
> > >    DRM_IOCTL_SYNCOBJ_RESET
> > >    DRM_IOCTL_SYNCOBJ_SIGNAL
> > >    DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT
> > >    DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL
> > >
> > > And demonstrates how the userspace API can be used, along with
> > > some fairly simple bad parameter checking.
> > >
> > > The patch includes a few helpers taken from libdrm, as at least
> > > on the VM I was testing with, I didn't have a new enough libdrm
> > > to support the *_TIMELINE_* ioctls. Ideally the ioctl-helper bits
> > > can be dropped at a later time.
> > >
> > > Feedback would be appreciated!
> >
> > DRM userspace selftests usually go either into libdrm or igt and not
> > into the kernel source.
> 
> Appreciate the pointer, I'll rework and submit to one of those projects.

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#testing-and-validation

There should be already a ton of syncobj tests, so probably more just work
needed to make them work on vgem so we can test them all without a
suitable hw driver loaded.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
