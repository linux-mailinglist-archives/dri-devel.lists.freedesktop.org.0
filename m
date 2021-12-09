Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4946F1F5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C175A10E186;
	Thu,  9 Dec 2021 17:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AA310E141;
 Thu,  9 Dec 2021 17:32:03 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id bj13so9684511oib.4;
 Thu, 09 Dec 2021 09:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hJMC/6XGazdnpccU1SQFAtAT2eakAt5TuZ88RaVgxf4=;
 b=eaLDWdfmaDJowcYporVuPQkkPacWkuZRRERLd1GACogc2yYGlTn5IDnpIJc5mytXH4
 G/opa3HpphlOfK8X5P/kXyD543tW27MG3AslNkWsNnW3ggm3ab3fsWwkBi/Ylin2u6ia
 RsgiLjLCdxaylUkoUpbixv1XciOxOepBy238qS6+C6TZStvE9tQ5sH9E6vM4WniyvcJV
 x1vg/0T5dqnm2QpeQMZUTGhCHXbfjHtnVcaSH7Wld71CkZdiIRLom0/Y+uPPqNOP4ubQ
 aD/Tg18M+4pkVQHTB1rjodGfVBvQpk5BsdoixzTgp04VGI+Hm8GnSuOii8/OSjKnkiup
 KWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hJMC/6XGazdnpccU1SQFAtAT2eakAt5TuZ88RaVgxf4=;
 b=U1MEBLQ5IRH43IgvLVnesvbiIG/ZuQRDbl7GL/9ncBFEX43CbAuYa7vhLZc1Wgi/Yc
 DAmaN9lLzAfr3Z+zv6t0zV01de8X1zVDRsIV1n/PyHfJ6qJdbUj+et+8hgsMhOD1AqMP
 Tw5Mf1Ukm4Be/3n0uNrJzyNTGNZa9B0Hyxw7MMPICtbPCVtaRLVBypM/XKvbtQY7Vtcn
 /XYWWsUPTkUueGcm+uB7n3maOZuYFP4dPxgpyjQXK7XUPnjZODYYzSxt0cgkTupSjG3u
 d0YGjE3+wtqBIc1axlVMhtq/97ov34LoDqyCHGAQBAZSpj/9y0TQa/tomrobw/pAKtfi
 K+kQ==
X-Gm-Message-State: AOAM532MhRlYL+7qAMn5Z41gfQ17TJ8Fcg3rqgkv50VRk4xGF6slUkxC
 JvQ4i3O9+qxNdSLdPpovBojO2niw7DIgQzxqeC8=
X-Google-Smtp-Source: ABdhPJy6MHVWih4d5IPimIIFxsxWSoGf18XPipyVKTtGgk4agVOpT2bIzZbdI42ON7pCuoF5rqlXzl4H8MRN5iRXWCk=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr7080461oib.120.1639071121305; 
 Thu, 09 Dec 2021 09:32:01 -0800 (PST)
MIME-Version: 1.0
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
In-Reply-To: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Dec 2021 12:31:50 -0500
Message-ID: <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 xinhui pan <Xinhui.Pan@amd.com>, kasong@redhat.com,
 Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=C3=A1lvez?= <siglesias@igalia.com>,
 kernel@gpiccoli.net, kexec@lists.infradead.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, pjones@redhat.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Young <dyoung@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, Vivek Goyal <vgoyal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 9, 2021 at 12:04 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Hi all, I have a question about the possibility of reusing a framebuffer
> after a regular (or panic) kexec - my case is with amdgpu (APU, aka, not
> a separate GPU hardware), but I guess the question is kinda generic
> hence I've looped most of the lists / people I think does make sense
> (apologies for duplicates).
>
>
> The context is: we have a hardware that has an amdgpu-controlled device
> (Vangogh model) and as soon as the machine boots, efifb is providing
> graphics - I understand the UEFI/GRUB outputs rely in EFI framebuffer as
> well. As soon amdgpu module is available, kernel loads it and it takes
> over the GPU, providing graphics. The kexec_file_load syscall allows to
> pass a valid screen_info structure, so by kexec'ing a new kernel, we
> have again efifb taking over on boot time, but this time I see nothing
> in the screen. I've manually blacklisted amdgpu in this new kexec'ed
> kernel, I'd like to rely in the simple framebuffer - the goal is to have
> a tiny kernel kexec'ed. I'm using kernel version 5.16.0-rc4.
>
> I've done some other experiments, for exemple: I've forced screen_info
> model to match VLFB, so vesafb took over after the kexec, with the same
> result. Also noticed that BusMaster bit was off after kexec, in the AMD
> APU PCIe device, so I've set it on efifb before probe, and finally
> tested the same things in qemu, with qxl, all with the same result
> (blank screen).
> The most interesting result I got (both with amdgpu and qemu/qxl) is
> that if I blacklist these drivers and let the machine continue using
> efifb since the beginning, after kexec the efifb is still able to
> produce graphics.
>
> Which then led me to think that likely there's something fundamentally
> "blocking" the reuse of the simple framebuffer after kexec, like maybe
> DRM stack is destroying the old framebuffer somehow? What kind of
> preparation is required at firmware level to make the simple EFI VGA
> framebuffer work, and could we perform this in a kexec (or "save it"
> before the amdgpu/qxl drivers take over and reuse later)?
>

Once the driver takes over, none of the pre-driver state is retained.
You'll need to load the driver in the new kernel to initialize the
displays.  Note the efifb doesn't actually have the ability to program
any hardware, it just takes over the memory region that was used for
the pre-OS framebuffer and whatever display timing was set up by the
GOP driver prior to the OS loading.  Once that OS driver has loaded
the area is gone and the display configuration may have changed.

Alex


> Any advice is greatly appreciated!
> Thanks in advance,
>
>
> Guilherme
