Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34538265CF0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ED26E9F6;
	Fri, 11 Sep 2020 09:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439776E8EC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:56:47 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id q200so1415702vke.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jMNd+T+UNfCVr+CXnjIejg7CHK/Hrj3c15AGf/Lni4s=;
 b=OLQY8CBgvSgvqOOZ1F80DQ8A00e821Xa7oY1WuVGUdLMuLrVcVaqshMleGCbWAG0lj
 dS+x50+Ix4U1GsXsEDUfsQFmuojnGadQwYRzQbA9m/k/gR58N7L6SFKRc8CsrNfwhsDo
 rbyjLbiP+AoK8JlUOFZBmU1QfoDcF0wfIAOA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jMNd+T+UNfCVr+CXnjIejg7CHK/Hrj3c15AGf/Lni4s=;
 b=uSX6KM7Js3G8VvnYaA2GIuu7IFfCxhFYlJaHUcMXqmFYAGJInakUf/c8UrxNAaL2Mk
 eJtkINoWXP7jwJoTdFiMysrKd3YFqC5cZJ46niCPUWSWnl5XOcaWnrB21RRY4UmPihKz
 Eqg++YSStyroIxGFDYvVFKYUZeYzeKh50QCaVkkKKX0/a85LGoYq/wO4tytoEZdl2wbp
 0mxulea2fV9Q155RQPe9Ek+jL2t7Za2jAov5uns/ff29QuXufvDz0pFqQuJLAOJVGSoS
 pB4K0OsN/C6B/MJs9rfG+XTPxkr9sPWi0TWC4zozOkvsbmaYsA3Uizwpdo+MSock+VXe
 jAZQ==
X-Gm-Message-State: AOAM530unDnSBkOWZX/fd+CP31NPTGQk8Bu479TIFPN98xP9LT3ISrBc
 OnrDusyTXxoWDBUwsfqYLylrhRXOKXSK7rtYR42VwA==
X-Google-Smtp-Source: ABdhPJxE1ZfuGN1KRdRowmJ7nrh6ctQzwgoEZ9M1uyX1WgB7L0k40U9i9Smv6bBpO24+vOVSa4hq49qDmHiFKdKFJ5I=
X-Received: by 2002:a05:6122:1193:: with SMTP id
 x19mr3196524vkn.23.1599731806715; 
 Thu, 10 Sep 2020 02:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-5-gurchetansingh@chromium.org>
 <20200902221514.GE1263242@redhat.com>
 <CAAfnVBnfbwc07au1OMec8g5yHC0D3yXc88nOtTopO4sitYf8ig@mail.gmail.com>
 <20200909070349.uyvg44xakdftibxh@sirius.home.kraxel.org>
 <CAJfpegsMEZoCQe7frsr9Kaq6EZsuRFWP3zs7sgrxnUDLzfcx_w@mail.gmail.com>
 <20200909092646.GA438822@phenom.ffwll.local>
 <CAKMK7uHzES32APTafwYjWc=-hswGe3q7Re4Rw354hKwA+mb0zg@mail.gmail.com>
 <CAAfnVBkbmxB7jdE3W2x3fjsiQYvJ1nimPNsk7qZnJKQJB7JrKw@mail.gmail.com>
In-Reply-To: <CAAfnVBkbmxB7jdE3W2x3fjsiQYvJ1nimPNsk7qZnJKQJB7JrKw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 10 Sep 2020 11:56:35 +0200
Message-ID: <CAJfpegvngPguV3PFtCnP05c12Pwm_+9yng4=FWaaGuDHtezXYw@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] virtio: Add get_shm_region method
To: Gurchetan Singh <gurchetansingh@chromium.org>
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 2:28 AM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:

> That sounds like an excellent plan !
>
> I will send out blob v3 (incorporating kraxel@'s feedback) once the topic pull request (it seems Miklos will do this?) for the shm region patches has been merged into drm-misc-next.

I split out the three patches into:

  git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#virtio-shm

Thanks,
Miklos
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
