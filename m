Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2897E9CFE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 14:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B10510E375;
	Mon, 13 Nov 2023 13:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8DA10E09E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 13:19:46 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso6803453a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 05:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699881585; x=1700486385; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a11+eNzvbF/kcPW9cn/ZnakaOTTklV9oL65Bkb1+y/k=;
 b=lhukNrRAAtoYpIcfq3tL9z4rKuQtZ6z4WSTqbFD2i5v2t2Gm3gDQ7RCT7UEWO8hgba
 5K2CKC9aKH2C4LMcv9lo1HQtOQ6ttkw0pYLfe473VRVlnLaYux/tW62ZBa5yt0bNmIi1
 sa4iAnPtMeqzD7hEUA0+QR5/3AsUNI+9spXPWX9TRE2aHYTx/IUJLkdmpDGX8gUylmhF
 957f5u8CPB2fwi7TFDNU6UsCIYnAj4OD2k2aArgXv+zQs0JhVLCMGxtlKN/bFmRS8amw
 4BFZ6BPknRZkIC2ihtZNknnl6nds+TMzgLxK7L4pGFU1GY2sLWF0y8OogC7DhyVIuGz1
 nLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699881585; x=1700486385;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a11+eNzvbF/kcPW9cn/ZnakaOTTklV9oL65Bkb1+y/k=;
 b=wdPYmt2WRjM9pdLt3alFYTGXyNwtQIjjNYC+548++dAbFMXGEMLgjQh/q70+T+T6J6
 lBN27zWbrQlZIrKM9zWxcGB1+rkQfBbCvVRBquqaBzNdvK1LJAZNSpcrVLE2Id8+CiaL
 AFl9xIXfUlk3KwCRRizczgZrj+K7gAWpBv8OZFeWLtnUqn7xb2mIXyzbQU7zqkA7jfnl
 wA7nDv6sBZtNv3CuisSA775QiFFwCwUEVb+0Si90Q7lQgf2v+Awl4c13LbhMemOigJnO
 zxeS9KgNe+6WOoX4yEXlMrHp9FSEu6x45tZsIAgVBKpsJ3hjdBDco8LnXgMnk08W1TGM
 ZQhQ==
X-Gm-Message-State: AOJu0YzXc10UCrKtaGricnde8wo8eBO6bDW/MTl7UW6IflU3p1zSnUMq
 5/zc2VKPPNmzfFQXsmzeaJkcKn2m6OR6SYqEGec=
X-Google-Smtp-Source: AGHT+IHZ1mrDGCDvnEEZdKV40pAG5QOVaBtnmaQQxpB8mtkmNVOSVGIKXdmvf+TFCt/wVxUanlemmdwWbrlwjW5k6ew=
X-Received: by 2002:aa7:d6d1:0:b0:53e:b8e2:1d58 with SMTP id
 x17-20020aa7d6d1000000b0053eb8e21d58mr4690928edr.13.1699881585138; Mon, 13
 Nov 2023 05:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20231113085305.1823455-1-javierm@redhat.com>
 <9f3d3c8d-fbf1-485b-9c2a-4d442733954d@suse.de>
 <CA+Y=x3khfKx_oQYABMSCAPOEuDWyZ+MyTHK=JufH8fC-m6z7Xw@mail.gmail.com>
 <8734x9steb.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <8734x9steb.fsf@minerva.mail-host-address-is-not-set>
From: Andrew Worsley <amworsley@gmail.com>
Date: Tue, 14 Nov 2023 00:19:33 +1100
Message-ID: <CA+Y=x3=AC8uFyq2n7GmWLFR8xbw__SRiFmGSxo914gN3e5HQxw@mail.gmail.com>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Sergio Lopez <slp@redhat.com>, devicetree@vger.kernel.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Rowand <frowand.list@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Nov 2023 at 23:57, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Andrew Worsley <amworsley@gmail.com> writes:
>
> Hello Andrew,
>
> > On Mon, 13 Nov 2023 at 20:18, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Am 13.11.23 um 09:51 schrieb Javier Martinez Canillas:
> >> > Some DT platforms use EFI to boot and in this case the EFI Boot Services
> >> > may register a EFI_GRAPHICS_OUTPUT_PROTOCOL handle, that will later be
> >> > queried by the Linux EFI stub to fill the global struct screen_info data.
> >> >
>
> [...]
>
> >
> > I applied the patch and just the simpledrm driver is probed (the efifb is not):
> >
>[...]
>
> Great, thanks for testing. The patch works then as expected. Can I get
> your Tested-by then ?

Sure absolutely.
>
> >
[...]
> We were talking with Thomas that the sysfb design seems to be reaching its
> limits and need some rework but currently you either need some driver that
> matches the "simple-framebuffer" device that is registered by OF or won't
> get an early framebuffer in the system.
>
> That could be either simpledrm or simplefb. But if a DT has a device node
> for "simple-framebuffer", how can the OF core know if there is a driver to
> match that device? And same for any other device defined in the DTB.
>
> It's similar on platforms that use sysfb to register the device (e.g: x86)
> since either "simple-framebuffer" is registered (if CONFIG_SYSFB_SIMPLEFB
> is enabled) or "efi-framebuffer" (if CONFIG_SYSFB_SIMPLEFB is disabled).
>
> That means CONFIG_SYSFB_SIMPLEFB=y and CONFIG_DRM_SIMPLEDRM disabled won't
> work either, even if CONFIG_FB_EFI=y which is the case you are mentioning.
>
> What I think that doesn't make sense is to remove conflicting framebuffers
> from drivers that can only handle firmware provided framebuffers. As said
> in the other thread, drm_aperture_remove_framebuffers() is only meant for
> native DRM drivers.

Ok - I'm taking it that conflicts between EFI and DT didn't happen in the past
but when they do DT wins. I guess there may be more such conflicts in
the future so
would be resolved in a similar way as more drivers are updated to
support DT settings.
Perhaps one day all drivers would have DT settings and this could be
standardised in some way.


> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
Thanks

Andrew
