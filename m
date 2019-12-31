Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB812DBE0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 22:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFE289D5F;
	Tue, 31 Dec 2019 21:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F9D6E233
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 14:19:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i16so35360259edr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 06:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9y1tmY4RwLs4Y1ujy/qNU7zmo877ZYf9RQx8Ho+O9iY=;
 b=XznbIAtguo9Bm13nZNKcGfWNbF9HeJqRmin10NcTYgr1Vw046xRj9+rzrUJU4NHprt
 Tkc0HmqBKaz7bpKSK9WQmS5/yJeSasVdRatCqWVYWuS5RL6y4ugWYo5qEWfMc2iAZ1CB
 pJ85G4GnkNzDYQmXK8F8MVqL2js7V2uXdLzFhvlZBVg2/RA7nzliUNg1iMDN5ogPCpwZ
 Ng2sw6pCeLjKh4JoSXyR4Nf3BnV9ap6rVwvJqnX33r1QmXkwcpjux8OejB9tvc+i4Psy
 y8fDgkJZ8Nhcp6JAAMUcJbepMq52Lu2nqTIeJ1FUuMqo2CfwLbrAooynJ/rUT5SJ+pX9
 Ar0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9y1tmY4RwLs4Y1ujy/qNU7zmo877ZYf9RQx8Ho+O9iY=;
 b=j9h59PE5K1m19DCE8zq54YGElu9JXsW45Y36PyW7ChWNtc8qKe1sgAbNpPEWFay1wz
 5c71OahZnFUtTV3dodjsPsz2sv2rIoibnMTU+3Set6lnrkfpca8/dWGJbfV2V3+9o/zQ
 TcKTRZNAV1ivmHlwoxMT1GIw3o6lZad15lgMydsc53Ylc3daQT+W2SSCPluusWMuZGJK
 b80Mowyf9Ebyxm+PW2fT/a+HI2b/EIPoNERom+yVMQPQdD9EL4B6XfQaqchc3ful/3l+
 DVjIawE1dd34JG/kg5U4BP0kTerXk5sQMeKP6Vj4iXPThUHsjM71Tpi3kZTnlxZ6BmhA
 MWyg==
X-Gm-Message-State: APjAAAVqtjuonlUii5K/sP1Mdi9lSXexoMajZyKGMSLq5pQuEmMwqTVU
 6KBoxVueEqS9Z4AKe+5TBYss5+pWrna8wa1+j2I=
X-Google-Smtp-Source: APXvYqzEOkZZG/2vGecnH7059nruHo6x8SX+ETSVkcqY8CFP1LYgZ/RDi4F7iof47RA91e8QSwcGekMXLc/GWHZYaCE=
X-Received: by 2002:a17:906:339a:: with SMTP id
 v26mr77221660eja.2.1577801995388; 
 Tue, 31 Dec 2019 06:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20191227173707.20413-1-martin.blumenstingl@googlemail.com>
 <20191227173707.20413-2-martin.blumenstingl@googlemail.com>
 <CAKGbVbs365C_44p9VyW33n5r2s7VKgOzpZWCZ2rAHZ+f2sic1A@mail.gmail.com>
In-Reply-To: <CAKGbVbs365C_44p9VyW33n5r2s7VKgOzpZWCZ2rAHZ+f2sic1A@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Dec 2019 15:19:44 +0100
Message-ID: <CAFBinCBMKBry+ynmk1byC+UweMPbQcpHnGE2CxKJVJBcrY5+QQ@mail.gmail.com>
Subject: Re: [RFC v2 1/1] drm/lima: Add optional devfreq support
To: Qiang Yu <yuq825@gmail.com>
X-Mailman-Approved-At: Tue, 31 Dec 2019 21:04:21 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qiang,

On Tue, Dec 31, 2019 at 3:54 AM Qiang Yu <yuq825@gmail.com> wrote:
[...]
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index f522c5f99729..851c496a168b 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/xarray.h>
> >
> > +#include "lima_devfreq.h"
> >  #include "lima_drv.h"
> >  #include "lima_sched.h"
> >  #include "lima_vm.h"
> > @@ -213,6 +214,8 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
> >          */
> >         ret = dma_fence_get(task->fence);
> >
> > +       lima_devfreq_record_busy(pipe->ldev);
> > +
> >         pipe->current_task = task;
> >
> >         /* this is needed for MMU to work correctly, otherwise GP/PP
> > @@ -280,6 +283,8 @@ static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
> >         pipe->current_vm = NULL;
> >         pipe->current_task = NULL;
> >
> > +       lima_devfreq_record_idle(pipe->ldev);
> > +
> >         drm_sched_resubmit_jobs(&pipe->base);
> >         drm_sched_start(&pipe->base, true);
> >  }
> > @@ -348,6 +353,8 @@ void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> >
> >  void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
> >  {
> > +       lima_devfreq_record_idle(pipe->ldev);
>
> This should be moved to the else {} part of the following code. As you
> have added the save
> idle record to the lima_sched_handle_error_task which is just the if
> {} part of the following
> code, so no need to call it twice for error tasks. BTW.
> lima_sched_handle_error_task is also
> used for timeout tasks, so add idle record in it is fine.
oh, that is a good catch - thank you!
I will fix that in the next version


Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
