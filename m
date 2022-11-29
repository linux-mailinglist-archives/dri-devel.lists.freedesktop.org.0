Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B8C63C29E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 15:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A48B10E0A8;
	Tue, 29 Nov 2022 14:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D6F10E068;
 Tue, 29 Nov 2022 14:33:07 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id v13so579721oie.3;
 Tue, 29 Nov 2022 06:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AlmTEqK3obGypOIeoBM6UEH5n1+C5l9b9H7iWEpLH6A=;
 b=T/LZqpzYOLPC+SZBUJ97PsVPVerwBk1U08wSBBHEf59T/BeIJk7uDC6xo9oqgB+kk8
 jKRa0UFcCdD0RXnXzE+hKzXSTggvAkErCA/ygSqBkdWPTBzdMA7lMTUI0ahU9ywh7fmv
 EMxzwIpJ4uMOzUXjIE7u+QeSNQBjIfVEYDMNYL796FCjAjgIxCNz6ejxPALDvqwK6hCZ
 vizWC3c+uMBTdBXWX1YdDSxogjWCFcJXqXTr1JkV7IY1Jp9PaOh/1ClELRuwDaUJvF7C
 Tq/j64LLphVJBbhZwuvpOQl8VNrDWHqFCAV0rIlLaai7wzmvgPYfjrPsMOjlasP2KBb7
 SPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AlmTEqK3obGypOIeoBM6UEH5n1+C5l9b9H7iWEpLH6A=;
 b=r8+ppRWd5ovhhBI4fminG1jcA9tyCwBmFBmQOGL+km5yCJPqH81iqntzeZj8XBYls2
 aiZiUX6ehqzDly1TUJ3ckjHM7mglPOeebaBbLyeMe4hi4ZWvz5LKyMFJEK0miNtRwYE4
 f7p7DOY48RJoJhuswPjnAcqvqdcg863WjzvyKF9PFzVl9raBZC96Sba1ZMVy86N5vGLw
 EB5JkADJidVby9gg7SKs8TwYfy73B5LwHzUMHwlQmWFwQNdh2l9ckHqwJAv1IuqxoX7P
 7YHEjkNBPjkqfI4JwzpVc6/XeqK5BVX40fFc5QnhkQDg0430bGapem6lb7Yl7rwH4pTo
 CVmA==
X-Gm-Message-State: ANoB5pmQXih/UPCG0S1tLzCwgabV5NMzapG/+M3WqPqqvmiml6uJ5nQJ
 gmDZ+WqOLFthjNePONIr/dKcaoSK85kUEGjAG4U=
X-Google-Smtp-Source: AA0mqf7wcKy4cktH/5nqgVCvLUDw6AoK1wuY7UTYnVx4X7TPkCjyyLY89WuLCnrPeXqUh/OBJXIaTNio8vMumqL4bVw=
X-Received: by 2002:aca:d17:0:b0:35b:c9e7:b124 with SMTP id
 23-20020aca0d17000000b0035bc9e7b124mr730939oin.46.1669732386601; Tue, 29 Nov
 2022 06:33:06 -0800 (PST)
MIME-Version: 1.0
References: <Y4Mz0glMNwDPaFPO@itl-email>
 <CADnq5_NfupG-DzNDJfntg+uSWH2m_8mLfj=ddkMdnNYNRhXWUw@mail.gmail.com>
 <Y4Vngz5tTA74Qr8L@itl-email>
In-Reply-To: <Y4Vngz5tTA74Qr8L@itl-email>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Nov 2022 09:32:54 -0500
Message-ID: <CADnq5_P8kuSsSFatMq4g0r2yE3TW0Rqzm07+Kpv9wKTi0GGS-Q@mail.gmail.com>
Subject: Re: AMD GPU problems under Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>
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
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 8:59 PM Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Mon, Nov 28, 2022 at 11:18:00AM -0500, Alex Deucher wrote:
> > On Mon, Nov 28, 2022 at 2:18 AM Demi Marie Obenour
> > <demi@invisiblethingslab.com> wrote:
> > >
> > > Dear Christian:
> > >
> > > What is the status of the AMDGPU work for Xen dom0?  That was mentioned in
> > > https://lore.kernel.org/dri-devel/b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com/
> > > and there have been bug reports to Qubes OS about problems with AMDGPU
> > > under Xen (such as https://github.com/QubesOS/qubes-issues/issues/7648).
> >
> > I would say it's a work in progress.  It depends what GPU  you have
> > and what type of xen setup you are using (PV vs PVH, etc.).
>
> The current situation is:
>
> - dom0 is PV.
> - VMs with assigned PCI devices are HVM and use a Linux-based stubdomain
>   QEMU does not run in dom0.
> - Everything else is PVH.
>
> In the future, I believe the goal is to move away from PV and HVM in
> favor of PVH, though HVM support will remain for compatibility with
> guests (such as Windows) that need emulated devices.
>
> > In general, your best bet currently is dGPU add in boards because they
> > are largely self contained.
>
> The main problem is that for the trusted GUI to work, there needs to
> be at least one GPU attached to a trusted VM, such as the host or a
> dedicated GUI VM.  That VM will typically not be running graphics-
> intensive workloads, so the compute power of a dGPU is largely wasted.
> SR-IOV support would help with that, but the only GPU vendor with open
> source SR-IOV support is Intel and it is still not upstream.  I am also
> not certain if the support extends to Arc dGPUs.

Can you elaborate on this?  Why wouldn't you just want to pass-through
a dGPU to a domU to use directly in the guest?
Are you sure?  I didn't think intel's GVT solution was actually
SR-IOV.  I think GVT is just a paravirtualized solution.  That aside,
we are working on enabling virtio gpu with our GPUs on xen in addition
to domU passthrough.

>
> > APUs and platforms with integrated dGPUs
> > are a bit more complicated as they tend to have more platform
> > dependencies like ACPI tables and methods in order for the driver to
> > be able to initialize the hardware properly.
>
> Is Xen dom0/domU support for such GPUs being worked on?  Is there an
> estimate as to when the needed support will be available upstream?  This
> is mostly directed at Christian and other people who work for hardware
> vendors.

Yes, there are some minor fixes in the driver required which we'll be
sending out soon and we had to add some ACPI tables to the whitelist
in xen, but unfortunately the ACPI tables are AMD platform specific so
there has been pushback from the xen maintainers on accepting them
because they are not an official part of the ACPI spec.

Alex

>
> > Additionally, GPUs map a
> > lot of system memory so bounce buffers aren't really viable.  You'll
> > really need IOMMU,
>
> Qubes OS already needs an IOMMU so that is not a concern.
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab
