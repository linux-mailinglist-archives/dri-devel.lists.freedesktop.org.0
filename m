Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75076383D36
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C65B6EA5D;
	Mon, 17 May 2021 19:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B62F6EA5D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 19:23:39 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 t4-20020a05683014c4b02902ed26dd7a60so6539933otq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 12:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RgO5PZp5sg1uOBfz6Mo0I/T1+iA05mzESFPtCNaQU/M=;
 b=dzqv6P4+T6AJsl2STE/YPGX+AwgvEtOpPIi/7MmlW7CKBSYhMK2cjZFM7HP6aZSo5A
 vXutRcoufTlpPu9v3aI3Uj7u+KXVnsyhSsbMjQeSnlY1cXAbKnUfdwDulJC+CjEFyKSG
 4p8skbHH/R3nZk7SKOKX6K+iHbSFnhOeZvCwnajObAUGMwgjB40l6RayQY0tQwaNxiLI
 VqgfsrINYcegnyCm4Dvru2/Yxi+C+jYpXgXnd+yA9O4boacGpteapRqdLHpyHEokSo6V
 6K19loSQQRjjq788k4ttQEywq58rwd2Yg6RF6y23fIPxpu3/NLq9BLS/A4jpc4eJMvNY
 bpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RgO5PZp5sg1uOBfz6Mo0I/T1+iA05mzESFPtCNaQU/M=;
 b=aUPXceyEuhmOlfpXI3XED6nObtaz24n52wqvam0amITevtJ1vucCSsccMaLiJO6IQr
 wJ3JKLKY4V+pQkQhdzXcnXEDKEaqLj2Vk19ndtZ8GIDqIhy3QlR2YTiMPiz46ChyvoPS
 +QXDdulwnNjfgepz2gAmYYwQBNRJ5xSnj46ymeiAFKUTtLK1Gdeol+gK2Ki7g6kXzeWK
 s/lYKhUG2hg2HBV3MA2iv94bFKopKfnZBE/xefweko43jDNowiGJFTUFutNb+EUpQVco
 VUMQvCVOeMbyi3f8gVKQitAu/imjOllKnbedJmcMUqnorIzEU8TWvMRoiyFHrUYDhJ0H
 ANMA==
X-Gm-Message-State: AOAM531BoAdCq1Oi7orfihGvl8FyOfruFIQ44dGYqK1NoZqsNdExEWBn
 0PT+rykXKYJQebjJ2neh2H+MF/sALfAgRjml76Q=
X-Google-Smtp-Source: ABdhPJyYEMDOZEmGiHRamUQqPfxH8/7OCMHXD6a0sDixsaX5l5mHTqz1OZyvzkb0toQThpy4wMO9b4hP6cEl465AA/g=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr971495otl.132.1621279418884;
 Mon, 17 May 2021 12:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
In-Reply-To: <503d101d-7273-757a-2809-e272db93c45d@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 May 2021 15:23:27 -0400
Message-ID: <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 3:12 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 17.05.21 um 09:40 schrieb Daniel Vetter:
> > On Fri, May 14, 2021 at 11:00:38AM +0200, Arnd Bergmann wrote:
> >> On Fri, May 14, 2021 at 10:34 AM Greg Kroah-Hartman
> >> <gregkh@linuxfoundation.org> wrote:
> >>> On Thu, May 13, 2021 at 01:00:26PM +0200, Maciej Kwapulinski wrote:
> >>>> Dear kernel maintainers,
> >>>>
> >>>> This submission is a kernel driver to support Intel(R) Gaussian & Ne=
ural
> >>>> Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-pr=
ocessor
> >>>> available on multiple Intel platforms. AI developers and users can o=
ffload
> >>>> continuous inference workloads to an Intel(R) GNA device in order to
> free
> >>>> processor resources and save power. Noise reduction and speech recog=
nition
> >>>> are the examples of the workloads Intel(R) GNA deals with while its =
usage
> >>>> is not limited to the two.
> >>>
> >>> How does this compare with the "nnpi" driver being proposed here:
> >>>          https://lore.kernel.org/r/20210513085725.45528-1-guy.zadicar=
io@intel.com
> >>>
> >>> Please work with those developers to share code and userspace api and
> >>> tools.  Having the community review two totally different apis and
> >>> drivers for the same type of functionality from the same company is
> >>> totally wasteful of our time and energy.
> >>
> >> Agreed, but I think we should go further than this and work towards a
> >> subsystem across companies for machine learning and neural networks
> >> accelerators for both inferencing and training.
> >
> > We have, it's called drivers/gpu. Feel free to rename to drivers/xpu or
> > think G as in General, not Graphisc.
>
> I hope this was a joke.
>
> Just some thoughts:
>
> AFAICT AI first came as an application of GPUs, but has now
> evolved/specialized into something of its own. I can imagine sharing
> some code among the various subsystems, say GEM/TTM internals for memory
> management. Besides that there's probably little that can be shared in
> the userspace interfaces. A GPU is device that puts an image onto the
> screen and an AI accelerator isn't. Treating both as the same, even if
> they share similar chip architectures, seems like a stretch. They might
> evolve in different directions and fit less and less under the same
> umbrella.

The putting something on the screen is just a tiny part of what GPUs
do these days.  Many GPUs don't even have display hardware anymore.
Even with drawing APIs, it's just some operation that you do with
memory.  The display may be another device entirely.  GPUs also do
video encode and decode, jpeg acceleration, etc.  drivers/gpu seems
like a logical place to me.  Call it drivers/accelerators if you like.
Other than modesetting most of the shared infrastructure in
drivers/gpu is around memory management and synchronization which are
all the hard parts.  Better to try and share that than to reinvent
that in some other subsystem.

Alex

>
> And as Dave mentioned, these devices are hard to obtain. We don't really
> know what we sign up for.
>
> Just my 2 cents.
>
> Best regards
> Thomas
>
>
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>
