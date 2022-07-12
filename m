Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F3571FF8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 17:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524F214BC20;
	Tue, 12 Jul 2022 15:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFF712B9EC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 15:53:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id p4so4991045wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zsJYeJMzYlfchoyhqcYMlXXcIufBbaJhfBIHb8zwwSQ=;
 b=gw/KFQdJ9JRUU7g6lqNSyqfre+WjyR6C5Q8qOW1vetF8YDFm+o9PnNOj4OiYiW+4jM
 21ozEHT0wjlMx1wqfYwIrj+cDyDvYKW+jLGW0Vp1qID4hDCOs28hmMYB1rGA4EAx2oj7
 3hOOoMJkILQEr6BgSPoO/xi8TShwptp8t2Ey85OIU48Bs6qdkWHO8+eeWXUw+ZHdLwRq
 Qs0kdw4JZHYNvmTybTfm3otKNdz4gOQUzVrQjimJK9rwCwHyYOatS/82WBU3NBHgUW2/
 5kuGS74i0LhQafgbgONlgnpqmnZwubk6GRCCSqQYxkT2OChP6ZxkMf61QP8MZgviGugt
 WQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zsJYeJMzYlfchoyhqcYMlXXcIufBbaJhfBIHb8zwwSQ=;
 b=BOrUMPsGZQ7YkQPN/f69V8ZruNRiuIb0apcC0kuiA9MJz4RulC3tr3GuT6HERM1sJQ
 BdMHLqAKstIzvPoC8rpzaKMRvEmU0ZOnjKeY+kAS4qaoHq4XD909dVZJItVchXIsATQy
 T2oNUlaJkxhN9gcyprAyAHo7qXkWFMZXdxUsRPnNLXEwYKkCBd/ciJjlIRLcUqemBhxF
 NILv6f5cxo7JHnvVzRvKpCxUG2/GnTJLqH8LvAZYQzSsD1aQ8l2yZp4UOOeMRan6MZAr
 Cm2hy8G035IQdziF87AIARrvJTWGoVfNxVXMccYL8k2Kat9RgKqbAS2xK1z4FgdRkV/d
 UouQ==
X-Gm-Message-State: AJIora8vyuBQzvosMrzCq1NLM00FKzuhgSl4TE3CM8xNjfZ9E3bmKL4z
 Hjqp9hj+vNEk4pZPCUl0HLH68lGWJhqeyVqe9iuT
X-Google-Smtp-Source: AGRyM1t+yrnEq9cKm/OAPFzrU5umggLNBl1nhf3RM8sC1K9l5Y10G/Ylf/WpJKAFTrggYCcyC1Nz2OO5uvyvyqG6STU=
X-Received: by 2002:a05:600c:3b03:b0:3a2:ead2:c844 with SMTP id
 m3-20020a05600c3b0300b003a2ead2c844mr4600729wms.129.1657641184963; Tue, 12
 Jul 2022 08:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220712042258.293010-1-jstultz@google.com>
 <20220712042258.293010-3-jstultz@google.com>
 <44e2cb41-641c-2a50-3e38-284e4504f012@amd.com>
In-Reply-To: <44e2cb41-641c-2a50-3e38-284e4504f012@amd.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 12 Jul 2022 08:52:53 -0700
Message-ID: <CANDhNCrPhJacBjQZ4DMhmo9iaxBov8m8tbTqdU07PheaKFbE-g@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/3] kselftest: Add drm_syncobj API test tool
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Jason Ekstrand <jason@jlekstrand.net>, Shuah Khan <shuah@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 12:43 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 12.07.22 um 06:22 schrieb John Stultz:
> > An initial pass at a drm_syncobj API test.
> >
> > Currently covers trivial use of:
> >    DRM_IOCTL_SYNCOBJ_CREATE
> >    DRM_IOCTL_SYNCOBJ_DESTROY
> >    DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD
> >    DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE
> >    DRM_IOCTL_SYNCOBJ_WAIT
> >    DRM_IOCTL_SYNCOBJ_RESET
> >    DRM_IOCTL_SYNCOBJ_SIGNAL
> >    DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT
> >    DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL
> >
> > And demonstrates how the userspace API can be used, along with
> > some fairly simple bad parameter checking.
> >
> > The patch includes a few helpers taken from libdrm, as at least
> > on the VM I was testing with, I didn't have a new enough libdrm
> > to support the *_TIMELINE_* ioctls. Ideally the ioctl-helper bits
> > can be dropped at a later time.
> >
> > Feedback would be appreciated!
>
> DRM userspace selftests usually go either into libdrm or igt and not
> into the kernel source.

Appreciate the pointer, I'll rework and submit to one of those projects.

thanks
-john
