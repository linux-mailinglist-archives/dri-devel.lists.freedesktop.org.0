Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FBB38360F
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 17:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36386E1D5;
	Mon, 17 May 2021 15:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2116E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 15:29:47 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 g15-20020a9d128f0000b02902a7d7a7bb6eso5863149otg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LHuA8eHjuppTIJ75R7cv3VweFNbwB4dqcEtg7HA60qg=;
 b=RMks6CV9lAVCFBcqyvaL15OwQDYYydA46ie8ERZRUW9bdz6Ss2d63nvntdd2ppylbj
 TT1hoAtcrCR7P1QUgAoKu41mbQqWIXoRN7jJxyGntT0uCWz/IiczJZV24UwIWC7mZW89
 iDl7tmzK3OcYBBXrYUDYJ/OJrz6o9/5h4ij88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LHuA8eHjuppTIJ75R7cv3VweFNbwB4dqcEtg7HA60qg=;
 b=K4nzc7tu/Sooc58M7oRI/uBT5S/Rsft8tzYgM613pzAOV419zZ2ppriopljU84p6Ia
 98QFFguiUJ0ewYaF3JcnPk+C71lAMtl217WW8YQ/+HETrc4Iyyw5QbSvaVasDvRQ9qDU
 YA4AhYWIOtDpDu1ZL4AucOc5BQyK8TSEsewQ/2OurpqvCxWMbBitbQX1jH391pkduCC9
 NdHwsBPD7Ux4sYfRZlz7ep3kg9qN1xsOEC48LoQv3/RwlkuAVNo2Jo2vg17ka+1gFySP
 EF/gEcgmZ9EQoJ56ZGyp3zeeM7wLx0/qMFW8nBnhiT0c8uUW8srRRIOjXmZIqRPEtqPY
 x+2w==
X-Gm-Message-State: AOAM530U7mfAKMvuNmXAeGxdM3etI2T4MgUZN3ESVhUnxOgSX1H8pcSJ
 XJvhVIIb7pnM5MTygmNnCRLf70iSX0AZWRPffoVnpA==
X-Google-Smtp-Source: ABdhPJyx4VgXyr7sHxhLzHJfU08wfDCFYrZOk1+l9hfQuvBlJV+AtL3GicGrv7/C44z5A3YFPk7MxSeP6Ot3b+xUVts=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr88425otq.303.1621265387064; 
 Mon, 17 May 2021 08:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <CAKMK7uELBbkhFBQoSfvMx+AKnbk-fgbamBm3sC20-dJwMq3Xmg@mail.gmail.com>
 <YJjg3DRnG1RG6VDK@infradead.org>
In-Reply-To: <YJjg3DRnG1RG6VDK@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 17 May 2021 17:29:35 +0200
Message-ID: <CAKMK7uFsRPod-tAJ8ZrzXM6B_+5VgvRs-U0_TiG75da62cnVnw@mail.gmail.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To: Christoph Hellwig <hch@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux-MM <linux-mm@kvack.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 9:30 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, May 10, 2021 at 09:16:58AM +0200, Daniel Vetter wrote:
> > > End result: not pulling it, unless somebody can explain to me in small
> > > words why I'm wrong and have the mental capacity of a damaged rodent.
> >
> > No rodents I think, just more backstory of how this all fits. tldr;
> > pin_user_pages is the only safe use of this vb2 userptr thing.
>
> Yes, which is why I advocate for just ripping the follow_pfn path
> out entirely.  It could have been used for crazy ad dangerous peer to
> peer transfers outside of any infrastructure making it safe, or for
> pre-CMA kernel memory carveouts for lage contiguous memory allocations
> (which are pretty broken by design as well).  So IMHO the only sensible
> thing is to remove this cruft entirely, and if it breaks a currently
> working setup (which I think is unlikely) we'll have to make sure it
> can work the proper way.

Since I'm not getting any cozy consenus vibes here on any option I
think I'll just drop this.

Stephen, can you pls drop

git://anongit.freedesktop.org/drm/drm topic/iomem-mmap-vs-gup

from linux-next? It's not going anywhere. I'll also go ahead and
delete the branch, to make sure you catch this update :-)

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
