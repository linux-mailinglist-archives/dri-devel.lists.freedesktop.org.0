Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D56DBAD2
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 14:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB5F10E159;
	Sat,  8 Apr 2023 12:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC09E10E0D9;
 Sat,  8 Apr 2023 12:20:15 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id ch3so1909718ybb.4;
 Sat, 08 Apr 2023 05:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680956414; x=1683548414;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qhbv7Y5Jgs9ftPKleaknEhF4CyhB+GwqEo6U+Rr9mIc=;
 b=kewdyz87bq2iHid5EObeNKszKFtBaD+7IqwhaAlfkh4BXU43XHG0n2XFhE+8I64XoZ
 5vf/WXHewQ2r1JosqkV7cmmaF7Xo3YvF0R2w4N6H6HLcWl1GoA2FLD4ofgwx0JxaTTrq
 CSipUN6RQEUZwSJzL3lwv1Zny4ZWY4oDtBZPqBNHgqwrrBaVhKwRgM/zpeASYlW2SZhI
 71EqJEbs7Yhe+LjUaohEKTrE1vaWHdE4ojLs8Vewlr/uKsjzGq2f9FzNuRbS0G7zV1WF
 3SXZPxBoJCq5Ci9ZklpxYDXRQs/JwtNjqxDNdLTG9w7dTOcoV2GFEBeH5krYm5I5IZ02
 8ApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680956414; x=1683548414;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qhbv7Y5Jgs9ftPKleaknEhF4CyhB+GwqEo6U+Rr9mIc=;
 b=GWtB4l7qzeV+kRGdkQ7CZwSe/d7FjM/47Ut+vBGQ62ABQWwHTuPMiJQC205XmYaPKM
 lmEA5QvuHj2/+1HWA7g86E6Tnk6DZseo9JdhDtvENdBEc0MUetopFi0x52mJIqoCRDZu
 xWkC79SrSfzcNF3Z+RzXEo2HampWhi0ueDAxoEgXri6GBXl6+Aae/Qovs3xIHjzwbooT
 C3P7fYI8nZFh2y2HktQhiPPS2qVGSHB66DFGkTSEpbxgPVY7LyUB1NALFrh/ifHYO527
 OTM9c8ugs41931/e0/uncAuP3lpFTbPK6nf/GYHIUJn1+OcgX7j9E4oTov1J3goJHLNi
 uFcw==
X-Gm-Message-State: AAQBX9djJiMASHfzIca5+0fcR7mE/yD+VQQy9jlrhLDtSIl34ZpE7AP+
 KnlYVnK8SXvLIn3XyZJZoKW+B/+AhMwlL4mSmiM=
X-Google-Smtp-Source: AKy350byafsIIuMRDAbzbtG99qHBwJjc6HbvgeYdBJg3DC7Y1cC2snm+nm7ja1eD+czjeKKSwOkkAYx2grZ+GMjtYY4=
X-Received: by 2002:a25:be11:0:b0:b7d:4c96:de0 with SMTP id
 h17-20020a25be11000000b00b7d4c960de0mr993477ybk.5.1680956414354; Sat, 08 Apr
 2023 05:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230406215917.1475704-1-robdclark@gmail.com>
 <20230406215917.1475704-2-robdclark@gmail.com>
In-Reply-To: <20230406215917.1475704-2-robdclark@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sat, 8 Apr 2023 13:20:03 +0100
Message-ID: <CACvgo50nOw-82pc2mEbydWH3=RDXuOKwnBnjmOhV-UYcbjRKQA@mail.gmail.com>
Subject: Re: [RFC 1/2] drm: Add fdinfo memory stats
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
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Rob,

On Thu, 6 Apr 2023 at 22:59, Rob Clark <robdclark@gmail.com> wrote:

> +- drm-purgeable-memory: <uint> [KiB|MiB]
> +
> +The total size of buffers that are purgable.

s/purgable/purgeable/


> +static void print_size(struct drm_printer *p, const char *stat, size_t sz)
> +{
> +       const char *units[] = {"B", "KiB", "MiB", "GiB"};

The documentation says:

> Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> indicating kibi- or mebi-bytes.

So I would drop the B and/or update the documentation to mention B && GiB.

> +       unsigned u;
> +
> +       for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
> +               if (sz < SZ_1K)
> +                       break;
> +               sz /= SZ_1K;

IIRC size_t can be 64bit, so we should probably use do_div() here.

> +       }
> +
> +       drm_printf(p, "%s:\t%lu %s\n", stat, sz, units[u]);
> +}
> +
> +/**
> + * drm_print_memory_stats - Helper to print standard fdinfo memory stats
> + * @file: the DRM file
> + * @p: the printer to print output to
> + * @status: callback to get driver tracked object status
> + *
> + * Helper to iterate over GEM objects with a handle allocated in the specified
> + * file.  The optional status callback can return additional object state which

s/return additional/return an additional/

> + * determines which stats the object is counted against.  The callback is called
> + * under table_lock.  Racing against object status change is "harmless", and the
> + * callback can expect to not race against object destroy.

s/destroy/destruction/

> + */
> +void drm_print_memory_stats(struct drm_file *file, struct drm_printer *p,
> +                           enum drm_gem_object_status (*status)(struct drm_gem_object *))
> +{

> +               if (s & DRM_GEM_OBJECT_RESIDENT) {
> +                       size.resident += obj->size;
> +                       s &= ~DRM_GEM_OBJECT_PURGEABLE;

Is MSM capable of marking the object as both purgeable and resident or
is this to catch other drivers? Should we add a note to the
documentation above - resident memory cannot be purgeable

> +               }
> +
> +               if (s & DRM_GEM_OBJECT_ACTIVE) {
> +                       size.active += obj->size;
> +                       s &= ~DRM_GEM_OBJECT_PURGEABLE;

Ditto.

With the above nits, the patch is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

HTH
Emil
