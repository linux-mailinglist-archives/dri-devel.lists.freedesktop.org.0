Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D87A02832
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 15:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1A410E621;
	Mon,  6 Jan 2025 14:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OO0CpOjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B115F10E4AE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736174349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6oSnI2Lig1spsfEVHlYI2kgTw2FubRd9Y15d0vJju8=;
 b=OO0CpOjUs+lOh/RfBpaFXGhRw/bV5Ow4wTzarybnNBcGW0fP0niAWqu7BOZI24TNUPWI/O
 TbTEx+vbv0Bp9tmgI1Ij/to5ilQ5fknegUf6/P0Y7g25sPUSLcSSPr3Eg8QKmODeEDtwao
 nv6hBD2FfIXd0PPjacXPCg5Rn+Hg5Aw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-4j13ysaFM0OVXSPCjbBR0w-1; Mon, 06 Jan 2025 09:39:08 -0500
X-MC-Unique: 4j13ysaFM0OVXSPCjbBR0w-1
X-Mimecast-MFC-AGG-ID: 4j13ysaFM0OVXSPCjbBR0w
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aaf8396f65fso417234566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 06:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736174347; x=1736779147;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q6oSnI2Lig1spsfEVHlYI2kgTw2FubRd9Y15d0vJju8=;
 b=i0WYB9VavKEYIS+XCIZ5OEUwTUoreyvrWSkc3JN3OuHLEqecYzSYaLKEOB1Asz98dC
 vnAuYr863qBxLPY/NxgRQrPRnXx5nEE64F6k1hMOqw+0ksJElHBODUY2Jkng6fqhugxA
 PWh6PbPGKo1oKQuxiTVhtcb5dcAz1PflgnPDjfmsiNSGWKRtzZnpLH/ug5TQqHU7SaLk
 /kcDX0is7Hn/t7g6DuK7iCl6BXJ+e8wHA79Bpx3MnfC3vrgo7peLFhmmuQEVfcK/7iT1
 H62tNI/x7qGOxp/IqAiHRCy28zbGdZn/ueoARGnYBbchC+BhfND3fXldeEwbsEjcrEKh
 NKDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2PjEsytMWJimUNQjQqNJDMFt/H8dQ8K0egAlyB6V5OOGFO4wXw1SgmweOGLH07CdSgfggg6i96Tw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTX3o5Cm+1x2n+YuAAvU/fooaOd/N8tnPdx872mQ2svb9U8ib3
 QEWsfEoLlS1gvdIahqgbc00eO8c9RHJ5yYO3X4Yur1icEQeSfbvY1KWTVAkOr5H5ElYtqT5bkIX
 XObNkQBGQn/P9RArMPz5DoPru8U0OmZsxEROs1xNmQUhTZer8bfjAOScj3N9vVHixeQ==
X-Gm-Gg: ASbGncsl2ZNP0nsvevXewJX53adz4or7fArLc3Q9SkuFrtApM6bIJxUnwVvpWV+pg7U
 xPPxlnJDFM/CaiUKZV7WHEkGd4GTs7xJEyBeN5bO7kXFuWw1zOIOxPqZUyzcpzqsIPqlCdK0Iy8
 7T7/Oy8NVmmcU6cUWIOwd6BKe1qSNKbfznnYDtPkyzU8zCWhmj8RV/6ML+sMP5xuBEKlDNiTyTm
 e5nn5bQnnzxNCGYglt2K6SgKQp07YicU5d5tQiuDIPLyQ7Pv62NYRUvJvqk
X-Received: by 2002:a17:907:1a4f:b0:aae:8841:2bba with SMTP id
 a640c23a62f3a-aae88412f5dmr3206571666b.22.1736174347402; 
 Mon, 06 Jan 2025 06:39:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFl7rC4AEl9euwkgETj36SbElgteQwjiebI8fZXTKTAHMNd02bFuomv1fXkZ6yzi9MEY4ipxw==
X-Received: by 2002:a17:907:1a4f:b0:aae:8841:2bba with SMTP id
 a640c23a62f3a-aae88412f5dmr3206568666b.22.1736174346959; 
 Mon, 06 Jan 2025 06:39:06 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f066130sm2274536866b.183.2025.01.06.06.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 06:39:06 -0800 (PST)
Message-ID: <a969298e-0986-470c-9711-703af784d672@redhat.com>
Date: Mon, 6 Jan 2025 15:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] vbox: arm64 support for vboxguest
To: Christian Kujau <lists@nerdbynature.de>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org
References: <5020bcc7-eea4-b0f5-30c1-1da12efdca8f@nerdbynature.de>
In-Reply-To: <5020bcc7-eea4-b0f5-30c1-1da12efdca8f@nerdbynature.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oOWHQAUfrPjWHaqpD5w7TjUZTHmvOKbK_93_WnlcPKw_1736174347
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Thank you for your patch.

On 15-Dec-24 8:52 PM, Christian Kujau wrote:
> My last email[0] still had "RFC" in the subject line, but no comments were 
> received. So, in an attempt of stupi^W boldness, this is the same patch 
> again, with RFC removed and ready for mainline, maybe?
> 
> Hello,
> 
> now that VirtualBox able to run as a host on arm64 (e.g. the Apple M3 
> processors) I was wondering if there are any plans to port the vboxguest 
> driver to that platform? I added ARM64 to the Kconfig files (see below) on 
> vboxguest and vboxsf, and also for vboxvideo, and it compiled just like 
> that and at least vboxsf appears to work just fine.
> 
> I don't know how to test vboxvideo yet (the module loads just fine), but 
> if we at least enable to option in the Kconfig file at least people would 
> be able to test it :-)
> 
> Thanks,
> Christian.

This part (the body) of the commit msg really should just describe
the what and why of the patch, the info you are providing above would
be something to put into a cover-letter not into the actual commit
message itself.

Also no Hello + thanks/regards in the commit message please
(that too is more something for the cover-letter).

At the moment this patch does 2 things in 1 patch, that
is it enables ARM64 support for both the vboxvideo
driver under drivers/gpu/drm/vboxvideo/Kconfig and
for the other vbox guest drivers under
drivers/virt/vboxguest/Kconfig + fs/vboxsf/Kconfig

The latter 2 go hand in hand and by testing vboxsf you
have also tested the vboxguest driver since that is how
vboxsf talks to the host. So enabling ARM64 support for
those in a single commit is fine.

But please split out the untested vboxvideo changes into
a separate commit. 

As for testing those, if you start the virtualbox uI, then
select the VM you are testing with (and do not start it,
or if started stop it first),

Then click on "Settings" then under "Expert" and then "Display"
you should be able to change the "Graphics Controller" setting
from the default "VMSVGA" to "VBoxSVGA". Save this as new
setting (press Ok) and then start the VM, now lspci in the
VM should show:

00:02.0 VGA compatible controller: InnoTek Systemberatung GmbH VirtualBox Graphics Adapter

and:

lspci -d "80ee:beef" -v

should show the driver being used is vboxvideo, e.g. :

user@vbox:~$ lspci -d "80ee:beef" -v
00:02.0 VGA compatible controller: InnoTek Systemberatung GmbH VirtualBox Graphics Adapter (prog-if 00 [VGA controller])
	Subsystem: VMware Device 0405
	Flags: fast devsel, IRQ 18
	Memory at e0000000 (32-bit, prefetchable) [size=128M]
	I/O ports at d010 [size=16]
	Memory at f0000000 (32-bit, non-prefetchable) [size=2M]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
	Kernel driver in use: vboxvideo
	Kernel modules: vboxvideo

Note virtualbox upstream consideres the vboxsvga adapter deprecated, so they
may have disabled it for ARM VMs. So if you cannot select it, then it likely
simply is disabled for ARM VMs and we should not enable the vboxvideo driver
for ARM64.

Regards,

Hans




> 
> [0] https://lore.kernel.org/lkml/f088e1da-8fae-2acb-6f7a-e414708d8e67@nerdbynature.de/
> 
> Signed-off-by: Christian Kujau <lists@nerdbynature.de>
> 
>     vbox: Enable VBOXGUEST on ARM64
> 
> diff --git a/drivers/gpu/drm/vboxvideo/Kconfig b/drivers/gpu/drm/vboxvideo/Kconfig
> index 180e30b82ab9..dfe92bf23bde 100644
> --- a/drivers/gpu/drm/vboxvideo/Kconfig
> +++ b/drivers/gpu/drm/vboxvideo/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config DRM_VBOXVIDEO
>  	tristate "Virtual Box Graphics Card"
> -	depends on DRM && X86 && PCI
> +	depends on DRM && (ARM64 || X86) && PCI
>  	select DRM_CLIENT_SELECTION
>  	select DRM_KMS_HELPER
>  	select DRM_VRAM_HELPER
> diff --git a/drivers/virt/vboxguest/Kconfig b/drivers/virt/vboxguest/Kconfig
> index cc329887bfae..11b153e7454e 100644
> --- a/drivers/virt/vboxguest/Kconfig
> +++ b/drivers/virt/vboxguest/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VBOXGUEST
>  	tristate "Virtual Box Guest integration support"
> -	depends on X86 && PCI && INPUT
> +	depends on (ARM64 || X86) && PCI && INPUT
>  	help
>  	  This is a driver for the Virtual Box Guest PCI device used in
>  	  Virtual Box virtual machines. Enabling this driver will add
> diff --git a/fs/vboxsf/Kconfig b/fs/vboxsf/Kconfig
> index b84586ae08b3..d4694026db8b 100644
> --- a/fs/vboxsf/Kconfig
> +++ b/fs/vboxsf/Kconfig
> @@ -1,6 +1,6 @@
>  config VBOXSF_FS
>  	tristate "VirtualBox guest shared folder (vboxsf) support"
> -	depends on X86 && VBOXGUEST
> +	depends on (ARM64 || X86) && VBOXGUEST
>  	select NLS
>  	help
>  	  VirtualBox hosts can share folders with guests, this driver
> 

