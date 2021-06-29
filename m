Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A684B3B71BC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 14:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC746E882;
	Tue, 29 Jun 2021 12:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD816E87F;
 Tue, 29 Jun 2021 12:05:24 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id bj15so30700946qkb.11;
 Tue, 29 Jun 2021 05:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NaP02YVlfj2XBRA8PgGnBFZ3ZkjkK4tSn4ikEhyWjkU=;
 b=NxPHGs268DtEsLLScel2wFobjKUflhI1hKtq4NOnsGs9O4YHg4Zb8IPMM+VKsKRoJu
 qlpUjZxoBp2NYGdBGRCqqggWfNuMqP6GIESf7XvuSAKEOaRC3B8cRZRSF9IudZ0c4FmC
 TuWfSY1zHacyWk91MDISt5Uw/h2ZMcCJLS2OZTBT+6ytVXrsYbbAjpcGYeYxeb8UihMf
 /Q6WbrSVvegl1EhPXJa+2P0rtoFACyZV8CbptKlGrHzC1Qfa2F+lNrgUYYMy1S51+ytv
 b3vnxgtnskj+xVrGdCW7w5CXJblvC2m5IBp2R1IysjQUwwVBQ1rWZ0vFTNTTU6uvvesx
 ISoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NaP02YVlfj2XBRA8PgGnBFZ3ZkjkK4tSn4ikEhyWjkU=;
 b=SiDex1V82RQeEi4uYCtjhtG3Jtv/FYTsg9sikNJC5poTJP1MZEVS4uooTabtpXSRg/
 +ujaVLs1eUWsP8YRJP5xDLim/gUgrF291mKmSwMLk+CH2au4AVM/hBOX/kSEn11CZ9SE
 oEYabb4LXm9frW5vHtUqNplxRc9dnvhxeDPydeJzXhllVEg622vEurJ3huhsMdGh69yn
 vIlYv9lET9MR1XrPjGKP22PQ2S+qQz/oh/0lZT7LmUEgpOmWpPXXm22hPD5bsuTX1WQF
 sUpX3nKG1MGK+7drWH067J5MR2mVLjI5feg6g1GeYbAtQ78yMpoB4FylEZBj1be9pQhc
 jJ/Q==
X-Gm-Message-State: AOAM531JrQGs9jvu80YI6trQrpTwJhC0U4AyRGYQcQVhITZW4AJaQL08
 DUPDW3VhuzqwMVwFb+Ezyv91awu2uoRLvJVlVUI=
X-Google-Smtp-Source: ABdhPJzT86vSkD6VIYzMvGrGRTjA2OptahzF2oMcY8ey0pqVmD0MxfeaHwIhPJ2fxhyo46Q0pAZXiM5Utt8AIYAOQNQ=
X-Received: by 2002:ae9:dcc3:: with SMTP id
 q186mr30343512qkf.426.1624968323149; 
 Tue, 29 Jun 2021 05:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210629113713.154654-1-thomas.hellstrom@linux.intel.com>
 <20210629113713.154654-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210629113713.154654-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 29 Jun 2021 13:04:56 +0100
Message-ID: <CAM0jSHONtvX8yUdWzPFgMw340JzdChffVZ_BhMcMYoszzOOfuA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] drm/i915/gem: Implement object migration
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Jun 2021 at 12:37, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Introduce an interface to migrate objects between regions.
> This is primarily intended to migrate objects to LMEM for display and
> to SYSTEM for dma-buf, but might be reused in one form or another for
> performance-based migration.
>
> v2:
> - Verify that the memory region given as an id really exists.
>   (Reported by Matthew Auld)
> - Call i915_gem_object_{init,release}_memory_region() when switching regi=
on
>   to handle also switching region lists. (Reported by Matthew Auld)
> v3:
> - Fix i915_gem_object_can_migrate() to return true if object is already i=
n
>   the correct region, even if the object ops doesn't have a migrate()
>   callback.
> - Update typo in commit message.
> - Fix kerneldoc of i915_gem_object_wait_migration().
> v4:
> - Improve documentation (Suggested by Mattew Auld and Michael Ruhl)
> - Always assume TTM migration hits a TTM move and unsets the pages throug=
h
>   move_notify. (Reported by Matthew Auld)
> - Add a dma_fence_might_wait() annotation to
>   i915_gem_object_wait_migration() (Suggested by Daniel Vetter)
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
