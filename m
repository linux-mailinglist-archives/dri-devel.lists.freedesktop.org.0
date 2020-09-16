Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92E626CE7D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 00:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7B56EB3E;
	Wed, 16 Sep 2020 22:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5FA6EB30;
 Wed, 16 Sep 2020 22:16:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c18so8411131wrm.9;
 Wed, 16 Sep 2020 15:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZJbHM5GLEFqmZf5YDukzyyKsuKMxt478ZSZuSRvZkc=;
 b=YbgcezctoTpesK9Vn+Fu+mwCd3hsWbIDEU52IQdslrUb+Ap876SC5v6UMOP1IX8p5n
 iAUxfp7X/v8PzvUtRalX00PMuk3Bcazksi2CFRRHk9kTmBk1JQZM6E+AHFPV2669eoWK
 L2Q0lFNgaPncWusmuNe/EAQOdTa1svzqvQNf1Sfao/PNu1IanjU5D0WbQ8F7yZc5yM19
 GlKcc9JW0gYfjpK6/tBe8mR+Xlkenwd/ZxzdjS1ZTTR2tfcj/7LpixCAFfZkXr5fAPNe
 1xrHmhnLZ4866sEs+12id4RJbmrhNBfQ2JFLNnjMyiI7FmaLPlKvSdrKwqGxqSBrW1k/
 D+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZJbHM5GLEFqmZf5YDukzyyKsuKMxt478ZSZuSRvZkc=;
 b=qBL3u3wj3ViNQH62Ic2cHybvjE9jlAoJ4NNWfCH52pjRk5aLt7QQP2fmMZraC3F5lj
 Eii0ORYiKR6TBLNzk1dQGJZQMszHjvTqFkbp5C5cuYTxJYSsjB7J8rqJQ72f6yCTlqoi
 J+sifgRaLdI4JrltPUagEH+e2QTNwNXBYyUA2PxgclbpjIOsOqA6kQxAQUOxge4Yj3xo
 MHI9AFwnU1Xumy+Se6t3hUDqa7IhxA10ifBGvIBU5bG0sETJ/Iz2OqvDMHzpWMddOYFw
 gP9jAW1hwKS3Et86ENZpMohfa/biiG+wEpCJgreoMTt4B/gjFg15kDjZP+2OuywAsM4m
 5uWA==
X-Gm-Message-State: AOAM533X+hMv+SgNq1QIsoM6mYOmb+rE9GzUBhsJOQ9QHDd+8SkmB3lO
 dEyQDRvyrP7zWD4l+txvjCIqsDg2iozIJ8gxr1E=
X-Google-Smtp-Source: ABdhPJxHLm+4tK1Ak7NtwFEzBVza8jJx93jLiSVjLTLjmnzQSGAEncFXw7Q3jKCRhc1iUiswX6J9NJnhg4Nt9Tm43lU=
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr28518162wro.362.1600294596003; 
 Wed, 16 Sep 2020 15:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200915184607.84435-1-alexander.deucher@amd.com>
 <20200916070436.GA9392@lst.de>
In-Reply-To: <20200916070436.GA9392@lst.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Sep 2020 18:16:25 -0400
Message-ID: <CADnq5_P9nEZDiB0Fx_tsK1GCB_NJ-AOnx7Fd=706tZ4aKrmPzA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/radeon: handle PCIe root ports with
 addressing limitations"
To: Christoph Hellwig <hch@lst.de>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "for 3.8" <stable@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 3:04 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Sep 15, 2020 at 02:46:07PM -0400, Alex Deucher wrote:
> > This change breaks tons of systems.
>
> Did you do at least some basic root causing on why?  Do GPUs get
> fed address they can't deal with?  Any examples?
>
> Bug 1 doesn't seem to contain any analysis and was reported against
> a very old kernel that had all kind of fixes since.
>
> Bug 2 seems to imply a drm kthread is accessing some structure it
> shouldn't, which would imply a mismatch between pools used by radeon
> now and those actually provided by the core.  Something that should
> be pretty to trivial to fix for someone understanding the whole ttm
> pool maze.
>
> Bug 3: same as 1, but an even older kernel.
>
> Bug 4: looks like 1 and 3, and actually verified to work properly
> in 5.9-rc.  Did you try to get the other reporters test this as well?

It would appear that the change in 5.9 to disable AGP on radeon fixed
the issue.  I'm following up on the other tickets to see if I can get
confirmation.  On another thread[1], the user was able to avoid the
issue by disabling HIMEM.  Looks like some issue with HIMEM and/or
AGP.

Alex

[1] https://lkml.org/lkml/2019/12/14/263
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
