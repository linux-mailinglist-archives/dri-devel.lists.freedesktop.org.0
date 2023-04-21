Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE59E6EA855
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 12:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AD910E0F8;
	Fri, 21 Apr 2023 10:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9CA10E04A;
 Fri, 21 Apr 2023 10:27:08 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-54f8d59a8a9so17557577b3.0; 
 Fri, 21 Apr 2023 03:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682072827; x=1684664827;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1jDlW0W3MhjA8VbvOr9JFFYadMRZj0oB2XjEN8u/ZQs=;
 b=Jq29MVaVXQLS7/50058udG92P2tJ0UekckHnIlgksme797+yXQe/r1AZ4lHs6wJmM3
 68UCR52u1/x0QZPBwDYQC/+6TpzG3a8XR8OnW+Usfo6Lna4M1f7uF7w9BeRa1aD06cMl
 zGL9krAi1vZ3U5UyV+Dl4j5XfFhrXqTgk/dPt3WpF1wqAXu44UUqaWLHNcjgV8b3zGjU
 dutK14XNfjEG+u2galkQfJXW/wAtUUJeqXrDXCeEVrEdt33M8X4iB/PsrMPsSqmyizi5
 xGCiDATgeh9PHT84RlBa7BJERI6ne2eFDP3lBcKxKS1LVBKsCtxb2+PJ0gnXGCFR8QLp
 pBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682072827; x=1684664827;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1jDlW0W3MhjA8VbvOr9JFFYadMRZj0oB2XjEN8u/ZQs=;
 b=Pg6Qs1DJx5fEGVSGI9hhK8Rx9lz0zgSJQrv1ra26T9Tydbszn2rsp6ILvTqooxOjUT
 +Dn1ZzhiHMPNVGbAF1zi+6fR64Vz65NUu07MG+nrT54HpCMuln3s2H2IIeal+xE+Vc8m
 MGQEe5IF2A7f23+6nJT+wxfz3ZlM46rpfZ83+ng4wM3DN/Q9u133/ndam5/n6Jnja92G
 wjOz6dC+ozt8f5kBOsIW4DbsI6xzAT3u9ZM4jCXjDwO2TzgrdoJi0ZCZprCvHZFlm2Nz
 EsuvdeZZ25BOEbyPkHBHQ2sdACCzZog9+HYvWEGurTHKKd5ljosy3BQCVeURTEEPobS5
 XGYg==
X-Gm-Message-State: AAQBX9fGWLJfwbQTZhLa9NhUGWvw2nJbjINE/dXHPdl5EbrjamZVKODl
 Ymgux6k2UAKNxrssqbfsa5SbIPu/E3jTfjqJ5Ec=
X-Google-Smtp-Source: AKy350Z7RE8rSiaLK/lDI02fKHY8C/Hkm8qnkU6IUdScLzIa6Hrc+QXATCBAVcaBw4SmzH5UZ0SVAeWWaxXJZEHiMro=
X-Received: by 2002:a81:6fd5:0:b0:541:6d79:9291 with SMTP id
 k204-20020a816fd5000000b005416d799291mr1599574ywc.43.1682072827166; Fri, 21
 Apr 2023 03:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-6-robdclark@gmail.com>
In-Reply-To: <20230412224311.23511-6-robdclark@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 21 Apr 2023 11:26:55 +0100
Message-ID: <CACvgo525ogS4LSZDUyaqjSqjJWj=qLRkphji5469=3obFXoMrQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] drm: Add fdinfo memory stats
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Apr 2023 at 23:43, Rob Clark <robdclark@gmail.com> wrote:

> +/**
> + * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
> + * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
> + * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
> + *
> + * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
> + * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if
> + * it still active or not resident, in which case drm_show_fdinfo() will not

nit: s/can/can be/;s/if it still/if it is still/

> + * account for it as purgeable.  So drivers do not need to check if the buffer
> + * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
> + * as purgeable even while it is still busy on the GPU.. it does not _actually_
> + * become puregeable until it becomes idle.  The status gem object func does

nit: s/puregeable/purgeable/


I think we want a similar note in the drm-usage-stats.rst file.

With the above the whole series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Fwiw: Keeping the i915 patch as part of this series would be great.
Sure i915_drm_client->id becomes dead code, but it's a piece one can
live with for a release or two. Then again it's not my call to make.

HTH
Emil
