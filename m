Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6915630E54
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 12:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6227B10E035;
	Sat, 19 Nov 2022 11:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063C910E035
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 11:15:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k8so13169299wrh.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 03:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=78O1/6iHkEuXN3VSeklnMlqEoZQcCFMFB/Mazhq/nwA=;
 b=V0Xp51yjJAlhHBPgvQtVoaoFSuD9YwyjObGURAMRYG98DjE8XLwxLWdUDP2eSKRjeH
 zVnxxHbWVOqw6WqyUhapq7/4tkl55bEGU2AHHuWrSBxaokv5eulWOS/a9GAHwcUhtoYv
 SbPVFLmbeosTS/qno/ezN/qXfRwGnD+Zzm00I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78O1/6iHkEuXN3VSeklnMlqEoZQcCFMFB/Mazhq/nwA=;
 b=i8Pe0z/x7jqMgkScoF/AeVuklhqTP7H3pysxMdBO8C9sG1X5t2RHJ0zuY2eQuwkdHu
 gSfdauUHH7lP5wLxuBXgGtvnHYy4Wa1KgrcAq3lomCJK+0Ob8w937GjM+ree2nkxhuK4
 XsoVSra1fGiRqucUd9zw9Qtg4iCJK+bUZ/gSS8SpjC8KpKLgQGOR5NHYpbiX1am3LH3Z
 koGgD3PMsZ5r74DqZfZfHgD7uwAf/Qp2+tyWWv2oyJ/0CpVajoweSOPDYEtTGUbFwLGz
 ItyXxIauPPnXLp0em3htmxIeDNHgofgkOkUak0PfXcwESKL5DjtH4t4A5lfnMIC3a4r1
 mNOw==
X-Gm-Message-State: ANoB5pmvTLmPFv1kej57JHjFOXC+5PHZCW9UmSNxmanlOZMEoCoN1th0
 ARNob3LQh6ji2GfoTwF9FOx+Lg==
X-Google-Smtp-Source: AA0mqf75adIN7mjAoK4dJT+rH9+xb/lnaJV8jespCnrz4KLyrnO+X5p/BJOFgJHyhqr9aDVzRRUc0A==
X-Received: by 2002:a5d:5602:0:b0:22e:4c41:9e45 with SMTP id
 l2-20020a5d5602000000b0022e4c419e45mr647940wrv.468.1668856538422; 
 Sat, 19 Nov 2022 03:15:38 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 d7-20020adffbc7000000b00236c1f2cecesm7039372wrs.81.2022.11.19.03.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Nov 2022 03:15:37 -0800 (PST)
Date: Sat, 19 Nov 2022 12:15:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm/fb-helper: Restore damage worker
Message-ID: <Y3i62GgSkV3Md4Fg@phenom.ffwll.local>
References: <20221118133535.9739-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118133535.9739-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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

On Fri, Nov 18, 2022 at 02:35:32PM +0100, Thomas Zimmermann wrote:
> It turns out that the removal of the damage worker can lead to
> locking cycles. The display update now runs while holding the
> fbdefio lock, which conflicts with locks in the modesetting code
> that updates the display. There's no easy fix for this, so let's
> restore the damage worker. The display update will then again run
> outside of the fbdefio lock.
> 
> See [1] for bug reports.
> 
> [1] https://intel-gfx-ci.01.org/tree/drm-tip/fi-kbl-8809g.html

:-(
 
> Thomas Zimmermann (3):
>   Revert "drm/fb-helper: Remove damage worker"
>   Revert "drm/fb-helper: Schedule deferred-I/O worker after writing to
>     framebuffer"
>   Revert "drm/fb-helper: Perform damage handling in deferred-I/O helper"

On the series: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Apologies for the late ack, I wasn't around yesterday afternoon.
-Daniel

> 
>  drivers/gpu/drm/drm_fb_helper.c     | 30 +++++++++++++----------------
>  drivers/video/fbdev/core/fb_defio.c | 16 ---------------
>  include/drm/drm_fb_helper.h         |  2 ++
>  include/linux/fb.h                  |  1 -
>  4 files changed, 15 insertions(+), 34 deletions(-)
> 
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
