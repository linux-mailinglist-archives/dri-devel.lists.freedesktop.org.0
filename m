Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FD442841F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 00:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFDE89740;
	Sun, 10 Oct 2021 22:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386CB89740
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 22:57:44 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id m199so6654495vka.6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 15:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qoIad/gz3NIIFODvhJsBwOdDldsuEM2apX7DRlGW2Zg=;
 b=pgvRYcOKPNEwyErPnmoVyJgr9bWAy7+b4x3NK6+9+cpQ2JUz8LpH2EbuvYt62l3tFM
 jUKPpvDQALsTL4v2A7/A6r3cz2Pd4S2LifADH6RZ96qycBj3xJtP3rZkeiaAe9zyMNkB
 k9ce51TNzmorolgNmk7j3RUJLyVXLgJJaQUfWduj2+KZwRkmV9T/VQm+3uyplm5H3i06
 Al+qObIxTDOYOSviuUhqCOsZKHTPzkSritDUejVYb4O9Fkf7HbuwjvXSSBX6zOHYA6ji
 vlExcYBPO+V2KHiRZ1Pcv+/jb6/gcgNItlq0NSFcdq00cbLZES146pQOYqyOTR+GQMqu
 NUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qoIad/gz3NIIFODvhJsBwOdDldsuEM2apX7DRlGW2Zg=;
 b=pJY0KaZFAd2t5LmGq4tSlUr9ewFUSPBMiY2pUZcrrVGoiNXWGyFf4cUxHFIc2bpFfs
 X+d3hXsHNuSBM/covZtZjXWheVjzc+FIQhLzCQLvKNjl7r6NGQtJ2dOEd4CUNwhsrKFr
 RgNW30TErDDpP2uVLhAp9Svo2T8O2E2q6p7N/+AFK9Ku4LB9Yt9ObdOvDsKeA0uowDM+
 44M0wS0uqfCfCm31qv6nzAVzWZ911VpyO5WsocKpw0xqF24GUlbPtWVxMtw/7vBRZB57
 hgMErMx/aSNd/LJ61MayMCDhbvK4H5t4AJmshnx0cpm1ojjcVPYgnzlRcsIpVMWhI0Fk
 TS2A==
X-Gm-Message-State: AOAM531U8eZglw2ukqtJLEC244Z3rqDZ4fIMMFSvDL6VNjSmFD34VPGr
 96cjz8f9gJGerIy3MGEL0PcX5DOUmbuo4nuxe/mG3n70
X-Google-Smtp-Source: ABdhPJx9ztQcBU9YhMVfqnmRuhByE6vXSMSHcrX6BRZFmdRNEVS+OzYahgGooNOiw4+l7JeGbdierdlRzF/4E98dQ6w=
X-Received: by 2002:a1f:2515:: with SMTP id l21mr17235092vkl.13.1633906663201; 
 Sun, 10 Oct 2021 15:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DkOT6-c67akbj_c8Bq9+kDsaC51ovMP23QLOCArKx1eQ@mail.gmail.com>
In-Reply-To: <CAOMZO5DkOT6-c67akbj_c8Bq9+kDsaC51ovMP23QLOCArKx1eQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 10 Oct 2021 19:57:32 -0300
Message-ID: <CAOMZO5AuEi_pi9wSb1HGS3GCffj3bOOS7sVVf4Z4F5LMyk-o1g@mail.gmail.com>
Subject: Re: imx_ldb: lockdep warning on 5.14.x
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Tim Harvey <tharvey@gateworks.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 10, 2021 at 12:39 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> I am getting the lockdep warning below on a imx6q-sabred running 5.14.9.
>
> Haven't debugged this yet, but just wanted to report in case someone
> has any suggestions.

git bisect shows that the guilty commit is:

commit f4b34faa08428d813fc3629f882c503487f94a12
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu Jan 21 16:29:55 2021 +0100

    drm/imx: Annotate dma-fence critical section in commit path

    drm_atomic_helper_commit_hw_done() is the last thing (no plane cleanup
    apparrently), so it's the entire function. And a nice comment
    explaining why the wait_for_flip_done is ahead, unlike the usual
    sequence.

    Aside, I think since the atomic helpers do track plane disabling now
    separately this might no longer be a real problem since:

    commit 21a01abbe32a3cbeb903378a24e504bfd9fe0648
    Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Date:   Mon Sep 4 12:48:37 2017 +0200

        drm/atomic: Fix freeing connector/plane state too early by
tracking commits, v3.

    Plus the subsequent bugfixes of course, this was tricky to get right.

    Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
    Cc: Philipp Zabel <p.zabel@pengutronix.de>
    Cc: Shawn Guo <shawnguo@kernel.org>
    Cc: Sascha Hauer <s.hauer@pengutronix.de>
    Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
    Cc: Fabio Estevam <festevam@gmail.com>
    Cc: NXP Linux Team <linux-imx@nxp.com>
    Cc: linux-arm-kernel@lists.infradead.org
    Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

If I revert this commit on top of 5.14, the lockdep warning is gone.

Daniel,

How do we fix this?

Thanks
