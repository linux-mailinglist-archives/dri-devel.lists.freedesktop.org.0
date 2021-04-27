Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9EB36BCAD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 02:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680F46E8D2;
	Tue, 27 Apr 2021 00:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28B96E8BF;
 Tue, 27 Apr 2021 00:33:12 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id n21so10874222eji.1;
 Mon, 26 Apr 2021 17:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cf3TJ97HTdCZPoAJ80mQPVhpWi6wBWhAxRGu7SEQjM4=;
 b=IaH+32eyyXKSwgldn4Qc1XdBBjn9AuLmCnkllByIPJuluHtXdDpyFLgx12zkSs/ILp
 UwxvKwN2TPi5glM3+/f6XoiMeci4JbU080FROUfujqYnBQM8P7CJrISBkIprUm0tPM/h
 RgbQv+yPJ0kvF9bd66lWoigaJ4A+C8N5HB3XI+ZqTrCsFZ6DXtNOZz935GDKCziqyzRn
 ANU5nz1Yr0j8dR1w3RVA1pyTDOcPrI879QAkRLxp4p5W1Q0X+E/P0vYP6dv/1nWrWhih
 /magqQ6hrLlELMngiHN+e6qEvRY6D63PwoejGrh4JJ4KiRwPGe717Ar2QebvUfXXFXIn
 Tl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cf3TJ97HTdCZPoAJ80mQPVhpWi6wBWhAxRGu7SEQjM4=;
 b=XxqZDZ/zgj4Kn5C2egrWTHfdykWUpvp8Hvdz18Y+iL0oonuZljJirb/7OXMBVEFNGN
 Z+88H8HzMnYM/iKbnmBDtuLCcFmtZB8+5JCKrxDnyb7pMGOSrUdJC7gJjMdUJkLj5sem
 DXhCaQSz5qS7hBAuStMrZyNRtKFye6GKwjF3qlaoTs/Lgv07Ot6P6xwbnFKzs+qujlaT
 WZTdnzMVHoz+ItVVjlpzSFHTHfOEWyZV/pnimQNintXdsZ3pRG1koQT0XA9XYOwb4MW1
 aPgqjmdfOK2Vy3Az/y8vvGalunflD9hK/73CgL1XhsadoH/TCNS5xg0fEhEvRRVsVCeF
 hV6A==
X-Gm-Message-State: AOAM530v9qvgGaWyc5uheZ4rsYfI0ko4XIVxElZttFvj1b5waZBLO72v
 1YvauYz+uLb+FWCWXjpiculxkBvd6AooAQJZIyg=
X-Google-Smtp-Source: ABdhPJyzt/jeZbwQY12OFBLjpNWM8wFblxT1QEVj/Pv+cKHUMAZBORD1+QoD+F59kc2J1bEIOpu3VnsIA0cy0fPY/Cc=
X-Received: by 2002:a17:906:f42:: with SMTP id
 h2mr21573016ejj.317.1619483591455; 
 Mon, 26 Apr 2021 17:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210423184309.207645-1-lyude@redhat.com>
In-Reply-To: <20210423184309.207645-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 27 Apr 2021 10:32:59 +1000
Message-ID: <CAPM=9tyXBLxhg4htyh6pWgPFg5+WmH-u5+LAi3kx2kYE9mJwuw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v4 00/17] drm: Use new DRM printk funcs (like
 drm_dbg_*()) in DP helpers
To: Lyude Paul <lyude@redhat.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Apr 2021 at 04:43, Lyude Paul <lyude@redhat.com> wrote:
>
> Since it's been asked quite a few times on some of the various DP
> related patch series I've submitted to use the new DRM printk helpers,
> and it technically wasn't really trivial to do this before due to the
> lack of a consistent way to find a drm_device for an AUX channel, this
> patch series aims to address this. In this series we:
>
> * (NEW! starting from V3) Make sure drm_dbg_*() and friends can handle
>   NULL drm device pointers
> * Clean-up potentially erroneous usages of drm_dp_aux_init() and
>   drm_dp_aux_register() so that actual AUX registration doesn't happen
>   until we have an associated DRM device
> * Clean-up any obvious errors in drivers we find along the way
> * Add a backpointer to the respective drm_device for an AUX channel in
>   drm_dp_aux.drm_dev, and hook it up in every driver with an AUX channel
>   across the tree
> * Add a new ratelimited print helper we'll need for converting the DP
>   helpers over to using the new DRM printk helpers
> * Fix any inconsistencies with logging in drm_dp_helper.c so we always
>   have the aux channel name printed
> * Prepare the various DP helpers so they can find the correct drm_device
>   to use for logging
> * And finally, convert all of the DP helpers over to using drm_dbg_*()
>   and drm_err().
>
> Major changes in v4:
> * Don't move i2c aux init into drm_dp_aux_init(), since I think I've
>   found a much better solution to tegra's issues:
>   https://patchwork.freedesktop.org/series/89420/

I've given this a general once over, seems like a good plan and since
it's mostly mechanical.

for the series:
Reviewed-by: Dave Airlie <airlied@redhat.com>

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
