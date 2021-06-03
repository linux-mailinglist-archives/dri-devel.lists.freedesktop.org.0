Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B670B39A46A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D0E6E0EC;
	Thu,  3 Jun 2021 15:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135F86E0EC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:20:53 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id f84so9425813ybg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ayR+oC2ZCFKyXSE4/7tCBP1MfALSswdduEpz8GZerc=;
 b=NElpKBptFZbTDMXan23Mnqj0BrbJdvPhV8W+DQXUML46ULiH1SstwZbM1mimNlFfgw
 Pvr6NaGNgze5HdZIRCkUei5uHloYe+Cwmj33zMfJfOcQMvpJAuDnl7tJPTjCag2G2olS
 GdE/IBmnjMURsSLZdX031SJmEzJ8OB1oXrxVEt3aybm0MEdEpsBdGaonO7WGOK5e89bR
 mYMShUCAQ6lth31cXqBH5sSEGLfGcmbn15kwVd0Rm9sSCwC4QrtdMV8AWvENcEINiFpc
 XmgY8enECpHT8+bcrpeh2QeklKHCp5QGA+ja2xIRJrD3uUJE/OR6T5BuYBoZJnyn0mI7
 NFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ayR+oC2ZCFKyXSE4/7tCBP1MfALSswdduEpz8GZerc=;
 b=XZTvJL+FiJ3WbKHSH9S6/kTq80bw5L3yL4EpUNnCAJ6WHYRFVNRuM4jsC2u5O99rb3
 LXeyDsoTkoPwUPaudJMFVRtC8EkVj4rHANrtpPwMxgd4p+5PdOTQc+I56dwv+TFLTYow
 lIIuxCrYSjdVpIZP6SAfyq8esJGbxLJCeVlm8VpmhR1qDqzb6afmOv0GcHJYvpJXvaKC
 KOx7+xBT4lzDoa3vq3x8nQJzWnB8iFeQ+KJrWrxCsl5SyRth8auLnem4cqsKHRv7/gtt
 ODoaeqLwgOzRWnFhm03dEDlOt/8kGZaE1PUO9u2dBRm6r+SH/qrBoDcI1u5WMaBdKrae
 1h8Q==
X-Gm-Message-State: AOAM5333biCcjAKTDlMs5QjO2Hcj70QOGmryoMB6b2pKhPTqZjYqla3b
 9wwDpjfJqUIXd4Cju1cjoooWnlWyZsQubSOmbwCcNu6uVY0=
X-Google-Smtp-Source: ABdhPJz1uxXV2HvKlEryO48j6H9WVHqK2SCo6XIyvkynEWGc3K+9WFLqTJMcFkrA2sDOASxkCOMj6WE9Tu0Dox76OyY=
X-Received: by 2002:a25:cd85:: with SMTP id d127mr687297ybf.432.1622733651962; 
 Thu, 03 Jun 2021 08:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210602164149.391653-1-jason@jlekstrand.net>
 <20210602164149.391653-2-jason@jlekstrand.net>
 <YLiRYMZQjTwLzkbM@phenom.ffwll.local>
In-Reply-To: <YLiRYMZQjTwLzkbM@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 3 Jun 2021 10:20:40 -0500
Message-ID: <CAOFGe94CzTkL9mfBfCjL339+T30mNVFtufzS5gzv1NHXvfOCiA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Revert "drm/i915/gem:
 Asynchronous cmdparser"
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 3:22 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 02, 2021 at 11:41:45AM -0500, Jason Ekstrand wrote:
> > This reverts 686c7c35abc2 ("drm/i915/gem: Asynchronous cmdparser").  The
> > justification for this commit in the git history was a vague comment
> > about getting it out from under the struct_mutex.  While this may
> > improve perf for some workloads on Gen7 platforms where we rely on the
> > command parser for features such as indirect rendering, no numbers were
> > provided to prove such an improvement.  It claims to closed two
> > gitlab/bugzilla issues but with no explanation whatsoever as to why or
> > what bug it's fixing.
> >
> > Meanwhile, by moving command parsing off to an async callback, it leaves
> > us with a problem of what to do on error.  When things were synchronous,
> > EXECBUFFER2 would fail with an error code if parsing failed.  When
> > moving it to async, we needed another way to handle that error and the
> > solution employed was to set an error on the dma_fence and then trust
> > that said error gets propagated to the client eventually.  Moving back
> > to synchronous will help us untangle the fence error propagation mess.
> >
> > This also reverts most of 0edbb9ba1bfe ("drm/i915: Move cmd parser
> > pinning to execbuffer") which is a refactor of some of our allocation
> > paths for asynchronous parsing.  Now that everything is synchronous, we
> > don't need it.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Reviewed-by: Jon Bloomfield <jon.bloomfield@intel.com>
>
> This needs the same Cc: stable and Fixes: lines as the dma_fence error
> propagation revert. Otherwise the cmd parser breaks, which isn't great.

Done.  I may have to create multiple versions of this patch for Greg
but I can do that.
