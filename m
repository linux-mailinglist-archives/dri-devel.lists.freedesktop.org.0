Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D772B4DCD85
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 19:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A76610E68A;
	Thu, 17 Mar 2022 18:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564DF10E49C;
 Thu, 17 Mar 2022 18:24:51 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r6so8547884wrr.2;
 Thu, 17 Mar 2022 11:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5WOWImhAUqDCpINz5GAMHG6O7lsNY7VMT01bdVagZWc=;
 b=aq6DxaZijrN5HrtIcyJc8/ndCbKMm4kjpXUP+iUT09yTZppIbKxEHZb/r7JKNq5AlX
 msy8fbXcZNH5bFBn0r1JrWF+4/zw+lpu9VNyrrMbKj76h1sJINSdXAeXLr5eFkKuIKt+
 ysbfM666oKJRhu/VnQNVuqjDaMjzJiXrmxA7/w6/2OMVjNIaWHgjgDG1RfP3MLc17E3X
 yLitqncP0ZG3GC9a+4ONnVrzyerUWaCH8v92bJd8l/mkZ3aLCliELsK2aPLaj64UmYyu
 BUelbuhAC707tKScoxuuav+bkU0e5MPdUgiWtsIRujlGk0By8c7wccwTEuaYkfnIUX5S
 Qrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5WOWImhAUqDCpINz5GAMHG6O7lsNY7VMT01bdVagZWc=;
 b=W2wn+LKDLgEJPT2Ky/ws95lgOG1HdoGHgyCUK925xTHmUZXpV1nK1Up07FfsSEiVIQ
 V7qbFe11G0vNpOXhVP4b6yz/2WXeDdr0chuTZ2DBcZhD0J2tAkNlTOA8AtFaLZCefz++
 cNVBNv7VsRQ05C23iOKbNHJgELmG97oSaFe9OxTqN+2lVCk6woy6hXM01TgXLbbw+hNl
 gTQvnA6z6zwqcI6ZTsj+kVSUVclHBsd5wJY2tF2FTe17tCU1r1ukQ6ArvTMFtgNFVXcI
 CoW3sbPeXL2gTogQXAcRzfJb2uJfUVZw6zqjQCDDFM9UBp5ygNiRHQiM9zmLcttxAnwc
 wBrw==
X-Gm-Message-State: AOAM5320YqQVNMuP1MuW3Wns9whevPed77LCnbMPJsDC0Gra5dPWNNez
 MMgqFIlR37PBrnM0qpzfH5jHTaXF6pKvrsfb5xQ=
X-Google-Smtp-Source: ABdhPJwnz53z1Rtn2kSyDL8yXaceWrJVmARz5BjG/m7nsW0MZePheVDYKySSeb2wxNNkLlOqQKGmpMyw2VSnnqTRnT8=
X-Received: by 2002:a05:6000:170c:b0:203:df21:742c with SMTP id
 n12-20020a056000170c00b00203df21742cmr5175530wrc.574.1647541489710; Thu, 17
 Mar 2022 11:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
 <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
 <CAF6AEGsyFAOPmHqT7YX1wsukP4-gYAstCukr89r9w28V0YSCUw@mail.gmail.com>
 <3a475e5a-1090-e2f4-779c-6915fc8524b1@amd.com>
In-Reply-To: <3a475e5a-1090-e2f4-779c-6915fc8524b1@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Mar 2022 11:25:31 -0700
Message-ID: <CAF6AEGtPrSdj=7AP1_puR+OgmL-qro0mWZDNngtaVPxpaCM76A@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 11:10 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
>
> On 2022-03-17 13:35, Rob Clark wrote:
> > On Thu, Mar 17, 2022 at 9:45 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 17.03.22 um 17:18 schrieb Rob Clark:
> >>> On Thu, Mar 17, 2022 at 9:04 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 17.03.22 um 16:10 schrieb Rob Clark:
> >>>>> [SNIP]
> >>>>> userspace frozen !=3D kthread frozen .. that is what this patch is
> >>>>> trying to address, so we aren't racing between shutting down the hw
> >>>>> and the scheduler shoveling more jobs at us.
> >>>> Well exactly that's the problem. The scheduler is supposed to shovel=
ing
> >>>> more jobs at us until it is empty.
> >>>>
> >>>> Thinking more about it we will then keep some dma_fence instance
> >>>> unsignaled and that is and extremely bad idea since it can lead to
> >>>> deadlocks during suspend.
> >>> Hmm, perhaps that is true if you need to migrate things out of vram?
> >>> It is at least not a problem when vram is not involved.
> >> No, it's much wider than that.
> >>
> >> See what can happen is that the memory management shrinkers want to wa=
it
> >> for a dma_fence during suspend.
> > we don't wait on fences in shrinker, only purging or evicting things
> > that are already ready.  Actually, waiting on fences in shrinker path
> > sounds like a pretty bad idea.
> >
> >> And if you stop the scheduler they will just wait forever.
> >>
> >> What you need to do instead is to drain the scheduler, e.g. call
> >> drm_sched_entity_flush() with a proper timeout for each entity you hav=
e
> >> created.
> > yeah, it would work to drain the scheduler.. I guess that might be the
> > more portable approach as far as generic solution for suspend.
> >
> > BR,
> > -R
>
>
> I am not sure how this drains the scheduler ? Suppose we done the
> waiting in drm_sched_entity_flush,
> what prevents someone to push right away another job into the same
> entity's queue  right after that ?
> Shouldn't we first disable further pushing of jobs into entity before we
> wait for  sched->job_scheduled ?
>

In the system suspend path, userspace processes will have already been
frozen, so there should be no way to push more jobs to the scheduler,
unless they are pushed from the kernel itself.  We don't do that in
drm/msm, but maybe you need to to move things btwn vram and system
memory?  But even in that case, if the # of jobs you push is bounded I
guess that is ok?

BR,
-R
