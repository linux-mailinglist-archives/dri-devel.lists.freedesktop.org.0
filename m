Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69542767043
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C334310E6EB;
	Fri, 28 Jul 2023 15:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D64E10E6EB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 15:12:20 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-56661fe27cbso1492218eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690557139; x=1691161939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjaMvthXtyEQYcvkq0bLm9qV8pkq7yulAkHOM+DpXUI=;
 b=ASVl+frguzcPLx7itWYXGJqq0392xEzilATA4NtPQbxpkaBRiZfZdeHaX9gK+NStY8
 a4IS8lqv7oUvt6mzHlFfx7JRsMJRmZ52KU5em1+LBRgQe6vx4FUPL4oFqBZhcOy3aoXa
 mBoWaDHvCXrFQ3NijMydzYQQzZG++CT9X3h6n7r/cIJCYIyZpLGg94Z3uyxmVaS4kfT9
 GHJxb6qWEGx/qUVcp9glRoiP/h4c0JC6FWR36LSjBfZi9hwUn6e+uqRIZZFLyM+GrfRR
 mh/bJVpa6F6AjXLhAL3EWpiYpFTHRyqLKaZUdGOHU+DJJKgzij0q/hxPvkRiwMwjvSIu
 vbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690557139; x=1691161939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mjaMvthXtyEQYcvkq0bLm9qV8pkq7yulAkHOM+DpXUI=;
 b=k2FxFZS5Aj71mw3gkKS6141hoAFaPnrmus/SvIMtWxR23kxF70zxayYWE+i7sW8Yk7
 AVRh7F2WaSPrrCn2UBoB6SARicdU3WIAR/E2onCwdeTDD82uI+TwEckoHfTq4llEwTsJ
 IyjozsFcaWxx2d2y3ex09gtFelPARBpyKT+jYR3n/VGCdvLrTBTL+GHV2ggWNAHcGoI1
 5cXyaJra5oWiHW2GC0jpKkQRmvJHfUGHkmjkS1arfejpktvv33ynb4fgnCcgaI/oHjE4
 6OWeMgbYRzw0ZjkLdnxrol9sgIjLQypDBIQnTWs8e3f2TZ8T9KAppkLd+ccwiPsloHuP
 CJgQ==
X-Gm-Message-State: ABy/qLb0o2dsqQoVRXVvAC0ApKnE0FmfmaUgSR04CblX7gQwppAokKLW
 19/rDV61/auW4ZmDZ4/eJPs5Z5K4ojRdJyK98Hg=
X-Google-Smtp-Source: APBJJlH7CisTxRfSXWi+jtWDoqf2hNi6nvxfCLWV/15fF/BUdMeGWQfLoQv/sTCEi+b70U5K0KozyMQnY4C+Y5XeVrI=
X-Received: by 2002:a4a:3505:0:b0:566:ff47:2577 with SMTP id
 l5-20020a4a3505000000b00566ff472577mr2796810ooa.1.1690557139598; Fri, 28 Jul
 2023 08:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Pr8Z=vNO3iEpHNqkV0mb8gNzN7Zvf9HSW0Sf3Q0yy=Pw@mail.gmail.com>
 <9b86526b-7afd-6335-e68f-3f390f1c3266@linux.intel.com>
In-Reply-To: <9b86526b-7afd-6335-e68f-3f390f1c3266@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jul 2023 11:12:08 -0400
Message-ID: <CADnq5_Op+W+3gtP9oaihEO7dxj5eNPFvNm=oWgL+zDKZ5qEA8g@mail.gmail.com>
Subject: Re: CPU overhead for drm fdinfo stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Christian Koenig <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 4:36=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 27/07/2023 21:58, Alex Deucher wrote:
> > We have a number of customers using these stats, but the issue that
> > keeps coming up is the CPU overhead to gather them, particularly on
> > systems with hundreds of processes using the GPU.  Has anyone given
> > any thought to having a single interface to get this information for
> > the entire GPU in one place?
>
> Could I have a framed told you so certificate please? :D
>
> Well at least it depends on how much CPU overhead would your users be
> happy to eliminate and how much to keep. So maybe no need for that
> certificate just yet.
>
> I was raising the issue of exponential complexity of walking "total
> number of processes" x "total number of file descriptors" on a system
> from the inception of fdinfo.
>
> So for that issue the idea was to perhaps expose a list of pids with DRM
> fds open somewhere, maybe sysfs.
>
> That would eliminate walking _all_ processes and trying to parse any
> their file descriptor.
>
> But it would still require walking all file descriptors belonging to
> processes with DRM fds open.
>
> If that wouldn't be enough of a saving for your users then no, I am not
> aware it was discussed. Assuming at least you were suggesting something
> like "read all fdinfo for all clients" in one blob. Also in sysfs? I
> think it would be doable by walking the dev->filelist and invoking
> drm_show_fdinfo() on them.

Yes, something like that.  I think generally for telemetry reasons
they want to see stats of the engine times and memory usage of all of
the clients on the GPU.  In our case there is also a lot of CPU
overhead in parsing the memory usage due to the locking of the buffer
objects to get their location.  I'm not sure of a good way to reduce
that.  Maybe caching it to reduce the update granularity.

>
> Out of curiosity are they using the fdinfo parsing code from IGT or
> something of their own?

I think it's a mix.

Alex
