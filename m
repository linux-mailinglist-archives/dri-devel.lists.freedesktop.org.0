Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C1681F9E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 00:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C0410E1D5;
	Mon, 30 Jan 2023 23:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128E710E1D5;
 Mon, 30 Jan 2023 23:28:07 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id jf11so6268773qvb.4;
 Mon, 30 Jan 2023 15:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bmBE85HsciAbIIMS0yOe3l7FgaHGQXtcytfZQJSmxO0=;
 b=S0uq6kVOcVxXjbSrSgERLfItROwiDvkdWRHnN2GdDsQRuqeyQ7177xQJhPsIKqho56
 Fo1Vk4z/X8u/F+LOUPIlH1foeDJQ2GXsLkaBmL3O1iNPMD4oMIEcD4zl+NQq+gMUMYPa
 fHkd+/iDTKHlmDIC+7EkIojMdYdwlRGRfnBykTZzurvxQ27gj+7zPrxNUoK4OWgzJHdG
 i1IlkmiPLbqabThOF1jCgwfm4ba+p3F19MOMdmC32ITYqM00NXC231RnxO1VSA4h8c8j
 m4ToedpT1zsTm1gDtVZzhgSJ2xKLrGZ7baEd1OlZCAJm2EuAX9wCUpWP0yCZtfFBbtEb
 GW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bmBE85HsciAbIIMS0yOe3l7FgaHGQXtcytfZQJSmxO0=;
 b=3NT8iPfbaAi+2zJ+IAeDk7jC1i9KPzjdQhxLhglFFYespr1dG+vafljyAJq1FT4ADv
 PH7E6GMI2hkMYRWs70AdNj6GioKy++r/yaOnhYofJvkgwGDlHhggQZ7w4c6JiAW+otPK
 4FnhZxkEiIC1krMIt3QyO+tPMp4Q4CjvoFe+no+cPsHg5Q0NzFqAYbl/+2hFG5vZ9Y8f
 9/QGQ97fN14SRvX52+5XTeY8vTnwAaOzxDkYD1004UCI23Q/WoFyiaGvUF5US+L20h3I
 DfSBAdo01GZIvNL/ul5iCo86iRasP+zhC/B3jjo0e1x49uVAsU+ygCfY0Wwif5HBWv/Q
 UgYA==
X-Gm-Message-State: AO0yUKV0MIXnQ31MiNTRQBVcP3qN/LttQ0+iZqoiXzMbuvQb89ABRd6I
 Qo8LrtrCnc2uQsJThyNAz5q5SQYphFjS1ghg284=
X-Google-Smtp-Source: AK7set9or4XA7meh3Hg8ca4eIDcBBKeqU6thMY4tegDekaLTVqEMt8XXBu9cHQZoNCthUBN3zU2lm+DakWHrVo4U13s=
X-Received: by 2002:a05:6214:11b0:b0:53b:f96b:4e20 with SMTP id
 u16-20020a05621411b000b0053bf96b4e20mr409435qvv.27.1675121287028; Mon, 30 Jan
 2023 15:28:07 -0800 (PST)
MIME-Version: 1.0
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
 <3ab28896-70e9-6f90-5b97-e5397b06e715@googlemail.com>
 <a163dd7b-c5d1-a07b-a816-7a2dfd3edfd4@leemhuis.info>
 <ab1b0f73-6b4e-8602-2999-b7bec25d92db@googlemail.com>
 <CACAvsv4sOtPjCVnEcKd2RCUqYWxSn5XKyksbS-Bds2qCqyusVw@mail.gmail.com>
 <1cdb84ac-f7a8-66ba-98fc-3db302b49a5a@googlemail.com>
 <dab6eb81-db3f-8fa1-84ad-9b40e209514b@googlemail.com>
In-Reply-To: <dab6eb81-db3f-8fa1-84ad-9b40e209514b@googlemail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 31 Jan 2023 09:27:54 +1000
Message-ID: <CACAvsv5iYdF3P8AbyrbYo3zGmYRYhxDWn7WbAR5V9qHpbgBXRA@mail.gmail.com>
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Chris Clayton <chris2553@googlemail.com>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Karol Herbst <kherbst@redhat.com>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Jan 2023 at 09:09, Chris Clayton <chris2553@googlemail.com> wrote:
>
> Hi again.
>
> On 30/01/2023 20:19, Chris Clayton wrote:
> > Thanks, Ben.
>
> <snip>
>
> >> Hey,
> >>
> >> This is a complete shot-in-the-dark, as I don't see this behaviour on
> >> *any* of my boards.  Could you try the attached patch please?
> >
> > Unfortunately, the patch made no difference.
> >
> > I've been looking at how the graphics on my laptop is set up, and have a bit of a worry about whether the firmware might
> > be playing a part in this problem. In order to offload video decoding to the NVidia TU117 GPU, it seems the scrubber
> > firmware must be available, but as far as I know,that has not been released by NVidia. To get it to work, I followed
> > what ubuntu have done and the scrubber in /lib/firmware/nvidia/tu117/nvdec/ is a symlink to
> > ../../tu116/nvdev/scrubber.bin. That, of course, means that some of the firmware loaded is for a different card is being
> > loaded. I note that processing related to firmware is being changed in the patch. Might my set up be at the root of my
> > problem?
> >
> > I'll have a fiddle an see what I can work out.
> >
> > Chris
> >
> >>
> >> Thanks,
> >> Ben.
> >>
> >>>
>
> Well, my fiddling has got my system rebooting and shutting down successfully again. I found that if I delete the symlink
> to the scrubber firmware, reboot and shutdown work again. There are however, a number of other files in the tu117
> firmware directory tree that that are symlinks to actual files in its tu116 counterpart. So I deleted all of those too.
> Unfortunately, the absence of one or more of those symlinks causes Xorg to fail to start. I've reinstated all the links
> except scrubber and I now have a system that works as it did until I tried to run a kernel that includes the bad commit
> I identified in my bisection. That includes offloading video decoding to the NVidia card, so what ever I read that said
> the scrubber firmware was needed seems to have been wrong. I get a new message that (nouveau 0000:01:00.0: fb: VPR
> locked, but no scrubber binary!), but, hey, we can't have everything.
>
> If you still want to get to the bottom of this, let me know what you need me to provide and I'll do my best. I suspect
> you might want to because there will a n awful lot of Ubuntu-based systems out there with that scrubber.bin symlink in
> place. On the other hand,m it could but quite a while before ubuntu are deploying 6.2 or later kernels.
The symlinks are correct - whole groups of GPUs share the same FW, and
we use symlinks in linux-firmware to represent this.

I don't really have any ideas how/why this patch causes issues with
shutdown - it's a path that only gets executed during initialisation.
Can you try and capture the kernel log during shutdown ("dmesg -w"
over ssh? netconsole?), and see if there's any relevant messages
providing a hint at what's going on?  Alternatively, you could try
unloading the module (you will have to stop X/wayland/gdm/etc/etc
first) and seeing if that hangs too.

Ben.

>
> Thanks,
>
> Chris
>
> <snip>
