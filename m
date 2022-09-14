Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A9A5B823D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 09:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8FD10E8AB;
	Wed, 14 Sep 2022 07:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3F910E8AA
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 07:50:52 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id c2so14317481plo.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 00:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=I4avPm9oqyy4oz8/uGbih0PRzeZWAWGNVDDB4fwI7lE=;
 b=iFpzIfoyv02vljVXlrGz13Bqq6tAAWLcX9+GAw7TZTOenY3LWhWdfFC1KwCrsll/13
 SfvhjVlS9GlFZD6w4RlOy1d7ojaIsny8nEe0h5NNzORXgbZM6X82vWty41W8VT9j+z00
 vN3BynYcVKaDhvWj40Y+5QNmdAjxoPhnvEAUeQ+auRyNp7LjVMFTd3OjOZTB/vMyHQP+
 Ko2eL5F0wOYIAFfEfAczDMzhdDpNRjSYjqY14ZBunyib6djUk96jPN61C9+4dDiooSbh
 YvZmekClKX38e8lAXHqZjjr2kxX/a9I1OKDeQJUE0vWxjOJosiESLvIbYvB3l6qTWz4k
 K9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=I4avPm9oqyy4oz8/uGbih0PRzeZWAWGNVDDB4fwI7lE=;
 b=t32Yp/AwiRW1Sh0Bu9VHMooG2sjp7LnjxV+tAlh5XYYM/R6L93NN02qX0ZzwLSEaPp
 +keQLSqShsBEE7X6O8ikBVC7/a1PKRUwLu6RRi9ztPUDFMdrsdPA/r39OQxeydubNaVt
 W6Nh4QdN/jcuq9qR2Dxxczajp3z+IB+LnxUGDJzTpX34bUwtnDR5/HzOVYspLBe6evpS
 LS+qS2v2V4gYjL7sSACbR2r/8LkiIEgrUgp33VbaDzGLXhAsOzuQCKh1YNESzLAO4iBd
 Q+s3QYcOsV8EtQfgpVnZ5OhG+Wq7hQYMeONDAZd/ka0jdGu92zbeM0fYdjlJuJZpF0T6
 0yfA==
X-Gm-Message-State: ACgBeo3FqKiSqEsXLYSHv8iKjo9KWTbRVzjt1qj8OWaOxN69rpc7dqKH
 4QFH3fT8VP+bzXxSelidMGxCYDMx8lNLLzSw0Hc=
X-Google-Smtp-Source: AA6agR6XYs9P9U+Y6IpWJ3f3cscC4DrpycuaNkdQM36lUd8I4JFVqL8FY2eKCwhysvg6cLh5phXYYcc+bMovwNcPOl4=
X-Received: by 2002:a17:902:8bca:b0:178:1520:b252 with SMTP id
 r10-20020a1709028bca00b001781520b252mr21734196plo.159.1663141852173; Wed, 14
 Sep 2022 00:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220909115646.99920-1-hdegoede@redhat.com>
In-Reply-To: <20220909115646.99920-1-hdegoede@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 14 Sep 2022 09:50:40 +0200
Message-ID: <CAMeQTsaAoz2XHrOy9-s1nUh4Pa27E8=Ted+8vQ+HRzA=1O2ojg@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/gma500: 1 fix + further cleanups
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 9, 2022 at 1:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Patrik,
>
> Here is another gma500 patch-series with one more bugfix and a bunch
> of other cleanups of stuff which I noticed while doing the previous
> set of bugfixes.
>

Hi Hans, nice cleanups!

I'm rather busy at the moment so you can commit these yourself to
drm-misc-next if you like.

"drm/gma500: Wait longer for the GPU to power-down" can go through
drm-misc-fixes if you prefer. It fixed the timeout message on two of
my CDV machines but I never saw an actual problem from the timeouts.

For the entire series:
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


> Regards,
>
> Hans
>
>
> Hans de Goede (6):
>   drm/gma500: Wait longer for the GPU to power-down
>   drm/gma500: Remove runtime_allowed dead code in psb_unlocked_ioctl()
>   drm/gma500: Remove never set dev_priv->rpm_enabled flag
>   drm/gma500: Remove a couple of not useful function wrappers
>   drm/gma500: Rewrite power management code
>   drm/gma500: Remove unnecessary suspend/resume wrappers
>
>  drivers/gpu/drm/gma500/cdv_device.c    |   2 +-
>  drivers/gpu/drm/gma500/gma_display.c   |  19 +--
>  drivers/gpu/drm/gma500/gma_display.h   |   2 -
>  drivers/gpu/drm/gma500/oaktrail_lvds.c |   1 -
>  drivers/gpu/drm/gma500/power.c         | 156 +++++--------------------
>  drivers/gpu/drm/gma500/power.h         |  18 ---
>  drivers/gpu/drm/gma500/psb_drv.c       |  35 +-----
>  drivers/gpu/drm/gma500/psb_drv.h       |   7 +-
>  drivers/gpu/drm/gma500/psb_irq.c       |  15 ++-
>  9 files changed, 41 insertions(+), 214 deletions(-)
>
> --
> 2.37.2
>
