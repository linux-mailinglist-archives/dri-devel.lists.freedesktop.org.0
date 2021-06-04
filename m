Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A587539AFF4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 03:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D0E6F554;
	Fri,  4 Jun 2021 01:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275766F553;
 Fri,  4 Jun 2021 01:37:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g8so12061859ejx.1;
 Thu, 03 Jun 2021 18:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DmDwyfiUpk4MzADbJZuAJIcu3kCE/Kytx8Q+Lh8fxLg=;
 b=D1MmLWnh/4tPMDvS54FuKlMsDPerGoj9PNax6boNdMKfbt+pbam3+WqgKAOTFAGPox
 qKUfbWwBVdjZ0rEkIErTtnaE5c4YMt6kMcehXGcSwvrOtBrtM0WzIorwWpMMZPUg/0dS
 7jxQXfN0wgaJIboKk9Y9s3X8KxRnGe5ep+gCn3rOlXfe5YPfjequIkgJDgMhHVn3oXrH
 EBlzPYxaiYXTJqE8m8B5lHNQUzsNnhNMF+Xnlu+FnApCi06Mihj1dGrvRR24XQ1GEDQn
 p9pOJxOMvF7z3dvTmYHyedyWqTPlE6xE7NCZ+/httq0bmJOshxXY5DHkwEZHZzXsK0Zl
 ybFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DmDwyfiUpk4MzADbJZuAJIcu3kCE/Kytx8Q+Lh8fxLg=;
 b=PQnW8qnfZ4QS9EDkfaduBuRhzaVDGHp5znEkrgWjXnqcMwKcN2B/lpBL7zedpXfnLU
 wwqFrA+Hh+ejSbJqNA5yefN453YMWhItTanQ+FUW/iPuVCp1BhSfPz6P6i8jf/0VKcMv
 Vz2ssfgmhAjFYFXIYaQZAjh7bYVJCOLj3EKHbRxnZXghSyDBSHx+7Cit9u+0yrhxG/Io
 bQfBJHSZ7/BtmeYnqEKp8koSKdzRLbKs+4yOQDSADACRNqpsj+TJOg/cGmB2f1QStZIf
 d+iWhR+fdl1wWn2oaD66g2W3ms3mzVycYrYLdDxeMi6i0pKZa8tDcA8dv/PNxOO5DSDH
 55xg==
X-Gm-Message-State: AOAM533WcEgbzHhKVok6nLrQ21tLaN0grn8UYcLb/wliUPfDe8ufiuAz
 oAWPsnm3sJdNerzvCCffIblh9gxAYidr15ryVi4=
X-Google-Smtp-Source: ABdhPJxKo2rMgh/XfOxymxh2x0163+/YrtzFqMwn6wsiH74huoJoqb6VdRHmuvv/zq4K/a5cKaG+2sFhpBzadDUwSD0=
X-Received: by 2002:a17:906:4747:: with SMTP id
 j7mr1878454ejs.419.1622770635803; 
 Thu, 03 Jun 2021 18:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
 <CADnq5_Nfs_j9XE1Siou2wGYuwd5cvTD1T7m9gFpS9z74D=AuAQ@mail.gmail.com>
In-Reply-To: <CADnq5_Nfs_j9XE1Siou2wGYuwd5cvTD1T7m9gFpS9z74D=AuAQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 4 Jun 2021 11:37:04 +1000
Message-ID: <CAPM=9tznFeKrL-La1RqCtAib4N+Stf=2epQYabrm=vYnds6LwQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug feature
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Jun 2021 at 07:20, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Please open a gitlab MR for these.
>

I'd really prefer these tests all get migrated out of here into igt. I
don't think libdrm_amdgpu really should have tests that test the
kernel level infrastructure.

I know some people at AMD had issues in the past with igt because the
i might have stood for intel back in time, but at this point I think
we should be moving past that.

Dave.
