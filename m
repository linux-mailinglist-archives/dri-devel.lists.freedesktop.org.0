Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8471BFA60
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 15:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860B56E8BC;
	Thu, 30 Apr 2020 13:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F886E8B5;
 Thu, 30 Apr 2020 13:53:10 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id d6so1747594vko.4;
 Thu, 30 Apr 2020 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xLM3Mk937Oh+kSeDjRFBcaol/6OjmOkPDKlDAfcwvms=;
 b=d/0KYkPsRQZIFji7RHbv+zDuqMn9lY3U5VspdIt6/Qytf7FyHShQqWB5Jst04edgKY
 MD+RBVoHPHClv0JwWjKokUQGkAQ2ShPGa9xRat0uuyao7ALfBcwH+oRgvFShjDeNH0wv
 IGpqzWW212ZaEfDkdygW+IMIaKUoELVTjFT/B4JJ3XHvvRqKD4IvXG0JdZf84JTam1a5
 KEiOEhxhcnmwDZwvn8SKjL7AsDje3FPgcLVFFyS+14DJUHu9oHZD2PDdmiBsz0Ku7eyt
 A6BuwA2PFLzXUzDD5W7sYvZ2IGwCnFuVUbyFhKJLsZpslb4OeThDgMbViimbUu3RFaE3
 Gu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xLM3Mk937Oh+kSeDjRFBcaol/6OjmOkPDKlDAfcwvms=;
 b=bshKgKUURwxuZnD+69YsfBxHbUPXZS3Xi7pBvk3/9WwjtU+wLfcqQyz8RRcFQFbpQT
 sE/EAXVabmyoO2M8I4sL6dgbNJi/C4AKbLhqw68RSLzezdz60yFqw5+OneHyO7sMJvap
 dvtF/JRlpN30YeYSbYQJhRWzu1TNGHGxch1enLkccjjaeZo6hPw1hbCJqtFNMwv5vCda
 cN0ceMbMzLFDa5LDQeTPytdKjbmKj9bIGpWmOcqtvabJ3cfwuehYrhTqV9sfBspzZ4MZ
 jc0XJRPGY6pO5vAcZt8jYQr191yhoijtpzXASufb4byMA43yURq+rTKb6JOM6/06ltDb
 20hQ==
X-Gm-Message-State: AGi0PuYu+tSbtXdNPb+LarVPu4tDzqNO3DwVDqjUDkXe8ytWEI0hN0r8
 maPorXhvk2oMsDuITM53m9y6T6wFD8TTVQLiLNLD9w==
X-Google-Smtp-Source: APiQypL8FdYx+IepK+fZasytNcJzkFUdJwL9ep2fcm73mD4M8IUe//OPkYH2aip9Pf10044EI7pPLksy8fwXgwaaEB4=
X-Received: by 2002:a05:6122:12a:: with SMTP id
 a10mr2526587vko.51.1588254789448; 
 Thu, 30 Apr 2020 06:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200428171940.19552-1-ville.syrjala@linux.intel.com>
 <20200428171940.19552-17-ville.syrjala@linux.intel.com>
In-Reply-To: <20200428171940.19552-17-ville.syrjala@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 30 Apr 2020 14:50:52 +0100
Message-ID: <CACvgo50i8sqhDAyWawcaPUSd=GkKLFWJ_DVSHeq8UvJBh3OwRQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/16] drm: Replace mode->export_head with a boolean
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville

I don't fully grok the i915 changes to provide meaningful review.
There are couple of small comments below, but regardless of those

Patches 01-11 and 14-16 are:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

On Tue, 28 Apr 2020 at 18:20, Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:

> The downside is that drm_mode_expose_to_userspace() gets to
> iterate a few more modes. It already was O(n^2), now it's
> a slightly worse O(n^2).
>
Personally I'd drop the O() sentence, or change it to
It already was O(n^2), now it's slightly worse O((n+y)^2).

> Another alternative would be a temp bitmask so we wouldn't have
> to have anything in the mode struct itself. The main issue is
> how large of a bitmask do we need? I guess we could allocate
> it dynamically but that means an extra kcalloc() and an extra
> loop through the modes to count them first (or grow the bitmask
> with krealloc() as needed).
>
If the walk is even remotely close to being an issue, we could
consider the bitmask.
I don't think that's the case yet.


Hmm the original code never discards any entries from export_head.
I wonder if there's some corner case where we could end with an "old"
mode showing in the list?

For example:
- creates a user mode via drmModeCreatePropertyBlob()
- calls drmModeGetConnector() and sees their mode
- optional (?) does a modeset to and away from said mode
- removes their blob drmModeDestroyPropertyBlob()
- calls drmModeGetConnector() and still sees their removed mode.

If this is a bug (?) that we care about, we might want to add an igt
test for it.
Conversely, if this is a behaviour we want to keep this patch needs some work.

HTH

Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
