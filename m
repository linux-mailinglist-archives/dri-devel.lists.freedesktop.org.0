Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F64ADEEF3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAA710E028;
	Wed, 18 Jun 2025 14:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WKKxAKmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6792610E028
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:14:08 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-606b6dbe316so14519595a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 07:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1750256047; x=1750860847; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JWbyA4a1n1aVjvP6ctgBaCKRdhrm2Tmki3ui2GQz4OQ=;
 b=WKKxAKmBAjLamA58YtoBrw0Z25XWJgy7yPObpfdKmzFskObLIc9inP7PZlV/yONf+f
 MYUrNLLV58ZcU3cxNJpDN7Y54ZnA/LDEm4qCCKy6UO9URF/N6V/iypYfQ6UBuyxT/D44
 hHnofx/b16vYHu1FHPZ8yF4qqkbolRqSD4FhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750256047; x=1750860847;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JWbyA4a1n1aVjvP6ctgBaCKRdhrm2Tmki3ui2GQz4OQ=;
 b=lEKrEsqMudf96Nqvg3f1XBOKK//YLfKLcxYnxt4IxmMRKHG52iKCHNCqoXednWTMV2
 DqpF8JAZf0uU+ncjwxywQhdJ0KjGFOwJLSvRS0RWgz/bGwTa2OXV2AbHXByUQrMRTInR
 ftSDNvGEjIq9vYrv76t8weHWIeJtjFvz4fIggPo4rLvtJDvbTkoMeg/p6yKsLRipz+xh
 49gejKlxf/3HG0zHcYJT9TKYP6plEXglaDdv0l5fZeItGKe6EOlNRaT/SFoqrI5I3SCh
 FrPVeFmYev+nLymaU8vLeBbiy+rMmgy2Fmu8lQsHzjG15XP3mhbb2vA+LxfwgY4ARFgk
 rTyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdxD9AtHo1iIQmO4T/RGQBUWbameCMSYEuNu1s5+4PSML/b65oeSG/dgQp8fapDWrhOM3hvYViJ/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaYeyURNZhs4y0FzUNimM24usAeMPilffPL5Gp+Xmbou6WaEau
 6uZDt2GQSeWVs1MQCvAlm9imE65rAJsxGVqy4DsENu0T1DDXtyxv7v1cuahEMHvzMSw=
X-Gm-Gg: ASbGncs479PEvzHPMu/ffuIRWVPInwNkI8QnIgNzWhXEdgtU1pTzP+axwDpcgbcAxMA
 Idu54L2pWmqE/3iR1eaZCQSMGVa+TZGI2zk33Qe48xKfcQdGjlqQHHawJNvQr4CO/jQqW47hJ/w
 xZraEEOLfFgv44QgcmfxtTeNkRfXjGZjKQwWRMCeiFnQbVFII4I+DGeVRR4yo0K+CCD90G7Wd6f
 lNUkpJzQVNaqKsNqVVwjbI/dXmuxwnz/8tiEAMQkayCkDzrEO2HZZa8kPw5TtofDPYU5f1sK0KU
 uGt1nSKKXYb/3Ol5nZwQTQLNL4zZFcI96hAxNPEY+y6WoLAzrjyku/9EqZ7eZK7kIOUnAVcuog=
 =
X-Google-Smtp-Source: AGHT+IGsqCmrJXzMwPM+oH1kv5sMlk4UVUkN2dXKJGBUjRXie2yVHLpK2+aze7LyMOOgssnqt0k33w==
X-Received: by 2002:a05:6402:274c:b0:607:f63b:aa31 with SMTP id
 4fb4d7f45d1cf-608d0853447mr14785409a12.6.1750256046873; 
 Wed, 18 Jun 2025 07:14:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4ae68a2sm9640327a12.79.2025.06.18.07.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:14:06 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:14:04 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Mario Limonciello <superm1@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 5/6] ALSA: hda: Use pci_is_display()
Message-ID: <aFLJrHdfrTmoyhin@phenom.ffwll.local>
Mail-Followup-To: Mario Limonciello <superm1@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <20250617175910.1640546-1-superm1@kernel.org>
 <20250617175910.1640546-6-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617175910.1640546-6-superm1@kernel.org>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Tue, Jun 17, 2025 at 12:59:09PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> The inline pci_is_display() helper does the same thing.  Use it.
> 
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I think the helper here is still neat, so for patches 1-5:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

And a-b for the vgaswitcheroo patch for merging through the pci tree or a
dedicated pr to Linus, since I guess that's the simplest way to get that
done.

Cheers, Sima
> ---
>  sound/hda/hdac_i915.c     | 2 +-
>  sound/pci/hda/hda_intel.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index e9425213320ea..44438c799f957 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -155,7 +155,7 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
>  
>  	for_each_pci_dev(display_dev) {
>  		if (display_dev->vendor != PCI_VENDOR_ID_INTEL ||
> -		    (display_dev->class >> 16) != PCI_BASE_CLASS_DISPLAY)
> +		    !pci_is_display(display_dev))
>  			continue;
>  
>  		if (pci_match_id(denylist, display_dev))
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index e5210ed48ddf1..a165c44b43940 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1465,7 +1465,7 @@ static struct pci_dev *get_bound_vga(struct pci_dev *pci)
>  				 * the dGPU is the one who is involved in
>  				 * vgaswitcheroo.
>  				 */
> -				if (((p->class >> 16) == PCI_BASE_CLASS_DISPLAY) &&
> +				if (pci_is_display(p) &&
>  				    (atpx_present() || apple_gmux_detect(NULL, NULL)))
>  					return p;
>  				pci_dev_put(p);
> @@ -1477,7 +1477,7 @@ static struct pci_dev *get_bound_vga(struct pci_dev *pci)
>  			p = pci_get_domain_bus_and_slot(pci_domain_nr(pci->bus),
>  							pci->bus->number, 0);
>  			if (p) {
> -				if ((p->class >> 16) == PCI_BASE_CLASS_DISPLAY)
> +				if (pci_is_display(p))
>  					return p;
>  				pci_dev_put(p);
>  			}
> -- 
> 2.43.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
