Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8870154BB2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94386FB18;
	Thu,  6 Feb 2020 19:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F6D6FB17
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:12:39 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id x2so6137688ila.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ru+inu1PmEIJ9vDnJLv1Qr4gQtvZqrjXnMpeSc0T07w=;
 b=dOu8k7co1W3I1l1ud/O4tNq6yrR8hg9NmPtIwy/s1Z6lQY342ZljFEmid3M8nHnKoE
 o6EgzYmkeJe2Zuz2J3Vz99vNyFGmG5pEZQddN+ZtJBEGBSrIGW1REL64YKWw0eC4HOF2
 8IkPafFKv5Gs9Dp6vgisxTnweTLTpT+i5SCPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ru+inu1PmEIJ9vDnJLv1Qr4gQtvZqrjXnMpeSc0T07w=;
 b=LBJuEfMJRth+T0Mh6zBDd49K+SWfFEmnf2uwJCQVDENFOb4AG6shiB2FyxNnvmTiE7
 xW3R5Akucnn0ZoM5+OKhGs6agm0yphq93PCb35NrM8K/19Pv3/8Ualu9xjnUb4BCwVpy
 85jjy3CrovkbskeDLbzuFNTuP7woK3G4wJBUKFTYbrYQMxglPeEfFdZdlHRaZrJ32Gly
 TClj9iZiK7Nzufs4zCaa6vyK9ztfAjgfgU1nlebjso+4S8q0rSfGnWua29Iklw6OZHD+
 4Qp2A5zMKqL+/GtzAKf9AR9IdWBaMlCSrTHtU8XD5fnER1kVhpzyQPQFmxmMizTr2Ht9
 nQAg==
X-Gm-Message-State: APjAAAV8lz96M3OjzCPakhbb+lv4TZidKAdKC9MfQY8qOUt05ms4XZ+M
 H/21rmIXbZsvNYdPGhFgdYnvVwMUUPU=
X-Google-Smtp-Source: APXvYqyEnsDZDYg/u/avzzjwxFZJ636ng4qBo/ZPy9s/onh9N0e/TUfT/nhcHy+4WPlLAQRJcbeSJQ==
X-Received: by 2002:a92:c703:: with SMTP id a3mr5220886ilp.89.1581016357871;
 Thu, 06 Feb 2020 11:12:37 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id v10sm111922iol.85.2020.02.06.11.12.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 11:12:36 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id f10so6152465ils.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:12:35 -0800 (PST)
X-Received: by 2002:a92:508:: with SMTP id q8mr5345001ile.187.1581016355450;
 Thu, 06 Feb 2020 11:12:35 -0800 (PST)
MIME-Version: 1.0
References: <1580935697-28195-1-git-send-email-jcrouse@codeaurora.org>
 <CAF6AEGv9jVEO=QDY3DWts3w9aPxQ6fSBt2nydoqWdf5JenK=jA@mail.gmail.com>
In-Reply-To: <CAF6AEGv9jVEO=QDY3DWts3w9aPxQ6fSBt2nydoqWdf5JenK=jA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2020 11:12:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U7iWY1z5mwS0FyHyAA5EoFkAYzL-HKRaFMbRkMu6ffkg@mail.gmail.com>
Message-ID: <CAD=FV=U7iWY1z5mwS0FyHyAA5EoFkAYzL-HKRaFMbRkMu6ffkg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Fix a6xx GMU shutdown sequence
To: Rob Clark <robdclark@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 5, 2020 at 1:00 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Feb 5, 2020 at 12:48 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") missed
> > updating the VBIF flush in a6xx_gmu_shutdown and instead
> > inserted the new sequence into a6xx_pm_suspend along with a redundant
> > GMU idle.
> >
> > Move a6xx_bus_clear_pending_transactions to a6xx_gmu.c and use it in
> > the appropriate place in the shutdown routine and remove the redundant
> > idle call.
> >
> > v2: Remove newly unused variable that was triggering a warning
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Without this patch I'm seeing some really bad behavior where the whole
system will pause for a bit, especially if it has been idle.  After
this patch things are much better.  Thus:

Fixes: e812744c5f95 ("drm: msm: a6xx: Add support for A618")
Tested-by: Douglas Anderson <dianders@chromium.org>

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
