Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32E02FFE5E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271636E2EF;
	Fri, 22 Jan 2021 08:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538E36E2EF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 08:41:00 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id k9so1222000oop.6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 00:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wOljwRCTbqyi57Y0Livy/H/EyT5660ugsfV4DuzfwqY=;
 b=O0p5VKMoY2x8AgqrSCwbvRe2f+uh5jMDWo8v1uN5BFnIpTYeylv7jXtmw2xwBF6CvZ
 cvAidVCqZX4yBuePIjcFU+6pgnI6q/Ep1Z5C+g7Iacpr5DV3r+R36zNMnln8Q8Lzl9lz
 E1uzZCGg7oqS3+ZlEG+gNKDcsFMA0JCZIyhoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wOljwRCTbqyi57Y0Livy/H/EyT5660ugsfV4DuzfwqY=;
 b=jRCvgHAanSPAYi/0Xav/6d98FSnHsoZQNTmWz45Uh6akvaqIfpTeTpF/QHVuie5b+U
 KESfTn+byshO5X8UXMjJxFLSRxsX6IPcIjc0qnW9zA0g/H9Zlq1oO3xIvSVMRBwbRUCa
 MFlY5GZ27UFQEZIEtiHSYiT9Y/DoDdDxOJ48YwDf0ctCOM7p5vF2AhmtV+C/Ev1/uu16
 nPKbl5I2ThZMTvYawty6yLljCWRugF1X7IwlnjNzl+U3ZZ3y9zTOG+9Y8gBDz3WgGuIm
 9rKnzKel/H4PKZ8LxOESaO72E7t/VlUq7FgRU98nnjJJpfV7ybYgvwyEmjznB65KV+9j
 xlMg==
X-Gm-Message-State: AOAM532P1pqMX5K4zGtVwkAvIkDKi4jDiRC2LapENVcdVsxCisslCkJ9
 7YpLBgodw5NMBzg+j63wB5HZOrTvbJWo72j3/9wx+A==
X-Google-Smtp-Source: ABdhPJxDy+y1OaANdzA4wIMi5FJQjgdMKPG0dL2eTTJxJ2qmVIP8X8bscBmGEkbq8xeEe5veGwWsHRsLPQr71Q6nkYA=
X-Received: by 2002:a4a:9722:: with SMTP id u31mr2968367ooi.28.1611304859529; 
 Fri, 22 Jan 2021 00:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20210122115918.63b56fa1@canb.auug.org.au>
 <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com>
 <20210122182946.6beb10b7@canb.auug.org.au>
In-Reply-To: <20210122182946.6beb10b7@canb.auug.org.au>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 22 Jan 2021 09:40:48 +0100
Message-ID: <CAKMK7uFWFVC0be2foiP8+2=vrqyh1e4mqkuk+2xY+fgSWAExyQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 "Nikula, Jani" <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 8:29 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Daniel,
>
> On Fri, 22 Jan 2021 08:17:58 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Hm that has been in drm-intel-gt-next for a few days, is that tree not
> > in linux-next?
>
> It is not.

Adding -intel maintainers to get that sorted.
-Daniel

> These are the drm branches currently in linux-next:

Oh for ordering maybe put drm-misc ahead of the other subtrees, -misc
is where nowadays a lot of refactorings and core changes land.
Probably doesn't matter in practice.
-Daniel

> drm-fixes       git://git.freedesktop.org/git/drm/drm.git       drm-fixes
> amdgpu-fixes    git://people.freedesktop.org/~agd5f/linux       drm-fixes
> drm-intel-fixes git://anongit.freedesktop.org/drm-intel         for-linux-next-fixes
> drm-misc-fixes  git://anongit.freedesktop.org/drm/drm-misc      for-linux-next-fixes
> drm             git://git.freedesktop.org/git/drm/drm.git       drm-next
> amdgpu          https://gitlab.freedesktop.org/agd5f/linux      drm-next
> drm-intel       git://anongit.freedesktop.org/drm-intel         for-linux-next
> drm-tegra       git://anongit.freedesktop.org/tegra/linux.git   drm/tegra/for-next
> drm-misc        git://anongit.freedesktop.org/drm/drm-misc      for-linux-next
> drm-msm         https://gitlab.freedesktop.org/drm/msm.git      msm-next
> imx-drm         https://git.pengutronix.de/git/pza/linux        imx-drm/next
> etnaviv         https://git.pengutronix.de/git/lst/linux        etnaviv/next
>
> --
> Cheers,
> Stephen Rothwell



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
