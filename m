Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD6ACE09B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 16:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C90810E02C;
	Wed,  4 Jun 2025 14:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="iZPzRqHR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CADF10E02C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 14:45:35 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a522224582so416727f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749048334; x=1749653134; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YVZ9LYN/PFsvpkJ55gMLUB/cURcAGit5abXdVlxI7co=;
 b=iZPzRqHRuXF83AxP9o3fV7QZB91evFrAsLhAPIRg5muKBo3ZAl2fAP/DxQW4sS8pAR
 TRAZ7Mqp+moJLZ7Z0mwCIn6KBZBMd4E09T4YuvqGqzW5tYDuP+NRW8RRS0frdtZjEupH
 D164nXcsrhxMFdaZLPeFNxYxh+XjX/3Mt87aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749048334; x=1749653134;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YVZ9LYN/PFsvpkJ55gMLUB/cURcAGit5abXdVlxI7co=;
 b=oywdfop+DH27JJUaVmWavdCfCeeugqMbP5TvKY9yPIyhixDy9RmRHmL/Pjc/z9xeO8
 fl+D0keTRm6GkrF/002+/YpXoKOvN3tycXZeax+J5iYYYk974ek8gdvFCDzXQgtwEE8d
 NfZg/4BDKwU+fthRkHXTblAlhDyZDz+pyiksOmiuUlHg2QULZ6Vybel6ZIxUP5RKroq1
 BZQaKfPhkO6wel06Vjc0knIwwgqKxUkl//+7ts4qs7Phv2YnF98SrBrdH/Ds3K3aAaL5
 Sx0NwpjKCVVs+4sWy3bbhX72Ef2OWBdESmGaRTMNgVKAqnWWv4dmO282HGHUmxf602TT
 gOmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmUQuqbVVGH1+sU1644EmUuydWx38vGdnQb1QNs0l+IEknOaTX7FyaSVeA4No6kWGz22Oia1OAT7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkKQ092D5uJgYzOfhH0Fu27Z4+Hn+K387182+YuzpTW0jkxRqa
 3S7SdN5T6BtFuMQoDS2RS4brvQAodTvsmjxfn3MnNi6+xTtLZmWu5cbFoYOqASNJ7DE=
X-Gm-Gg: ASbGncuK+0PXLSYMy1E237KWQjzZhxn5XP7AlnbWy32bpCGp9BBwTNUFxp0z93cIZH4
 QEywUrRRr9NHjO4iGTodvwsfAeCr2u3/g0MfcNhPP2kCbFN+aCrKSXpcwYBTMSGEF9BD+AL9tPu
 M9Df/5v3DWlyjaouEuhBmDS1DP9p9R47KmmJjn67V9G6AflsH1TPjT/dUH1sJfv9kPTf8zEjDYm
 ZsEDXovRUS4zoGwUKUu2OhMd5kA2GBvgbrGz3jBypgWJFTs1VIpYVrhr4B0hXvNjGM0zNOJ5nAf
 3Xu+UZGtdIimSKVOdDBVxpPtqeA4pAPcVJtJlOseTZnjO28UJgf2ozRp/npTeyE=
X-Google-Smtp-Source: AGHT+IGOzvFV9hOfQGxbhHGh03HLKuvLfdHp1XBpuXusZFIdQzjfviSfpxeGOApY5FswyTJYuDkYTg==
X-Received: by 2002:a05:6000:230c:b0:3a4:dcb0:a5f with SMTP id
 ffacd0b85a97d-3a51dbcd8fdmr2376750f8f.16.1749048333468; 
 Wed, 04 Jun 2025 07:45:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe758besm22135589f8f.51.2025.06.04.07.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 07:45:32 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:45:30 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michael Kelley <mhklinux@outlook.com>,
 David Hildenbrand <david@redhat.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "deller@gmx.de" <deller@gmx.de>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "weh@microsoft.com" <weh@microsoft.com>, "hch@lst.de" <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
Message-ID: <aEBcCjMWZJgbsRas@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Kelley <mhklinux@outlook.com>,
 David Hildenbrand <david@redhat.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "deller@gmx.de" <deller@gmx.de>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "weh@microsoft.com" <weh@microsoft.com>, "hch@lst.de" <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20250523161522.409504-1-mhklinux@outlook.com>
 <20250523161522.409504-4-mhklinux@outlook.com>
 <de0f2cb8-aed6-436f-b55e-d3f7b3fe6d81@redhat.com>
 <SN6PR02MB41573C075152ECD8428CAF5ED46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <c0b91a50-d3e7-44f9-b9c5-9c3b29639428@suse.de>
 <SN6PR02MB4157871127ED95AD24EDF96DD46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <9a93813c-4d7c-45ef-b5a2-0ad37e7a078a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a93813c-4d7c-45ef-b5a2-0ad37e7a078a@suse.de>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, Jun 04, 2025 at 10:12:45AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.06.25 um 19:50 schrieb Michael Kelley:
> > From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Monday, June 2, 2025 11:25 PM
> > > Hi
> > > 
> > > Am 03.06.25 um 03:49 schrieb Michael Kelley:
> > > [...]
> > > > > Will the VMA have VM_PFNMAP or VM_MIXEDMAP set? PFN_SPECIAL is a
> > > > > horrible hack.
> > > > > 
> > > > > In another thread, you mention that you use PFN_SPECIAL to bypass the
> > > > > check in vm_mixed_ok(), so VM_MIXEDMAP is likely not set?
> > > > The VMA has VM_PFNMAP set, not VM_MIXEDMAP.  It seemed like
> > > > VM_MIXEDMAP is somewhat of a superset of VM_PFNMAP, but maybe that's
> > > > a wrong impression. vm_mixed_ok() does a thorough job of validating the
> > > > use of __vm_insert_mixed(), and since what I did was allowed, I thought
> > > > perhaps it was OK. Your feedback has set me straight, and that's what I
> > > > needed. :-)
> > > > 
> > > > But the whole approach is moot with Alistair Popple's patch set that
> > > > eliminates pfn_t. Is there an existing mm API that will do mkwrite on a
> > > > special PTE in a VM_PFNMAP VMA? I didn't see one, but maybe I missed
> > > > it. If there's not one, I'll take a crack at adding it in the next version of my
> > > > patch set.
> > > What is the motivation behind this work? The driver or fbdev as a whole
> > > does not have much of a future anyway.
> > > 
> > > I'd like to suggest removing hyperv_fb entirely in favor of hypervdrm?
> > > 
> > Yes, I think that's the longer term direction. A couple months ago I had an
> > email conversation with Saurabh Sengar from the Microsoft Linux team where
> > he raised this idea. I think the Microsoft folks will need to drive the deprecation
> > process, as they need to coordinate with the distro vendors who publish
> > images for running on local Hyper-V and in the Azure cloud. And my
> > understanding is that the Linux kernel process would want the driver to
> > be available but marked "deprecated" for a year or so before it actually
> > goes away.
> 
> We (DRM upstream) recently considered moving some fbdev drivers to
> drivers/staging or marking them with !DRM if a DRM driver is available.
> Hyverv_fb would be a candidate.
> 
> At least at SUSE, we ship hypervdrm instead of hyperv_fb. This works well on
> the various generations of the hyperv system. Much of our userspace would
> not be able to use hyperv_fb anyway.

Yeah investing into fbdev drivers, especially when some mm surgery seems
needed, does not sound like a good idea to me overall.

> > I do have some concerns about the maturity of the hyperv_drm driver
> > "around the edges". For example, somebody just recently submitted a
> > patch to flush output on panic. I have less familiarity hyperv_drm vs.
> > hyperv_fb, so some of my concern is probably due to that. We might
> > need to do review of hyperv_drm and see if there's anything else to
> > deal with before hyperv_fb goes away.
> 
> The panic output is a feature that we recently added to the kernel. It
> allows a DRM driver to display a final error message in the case of a kernel
> panic (think of blue screens on Windows). Drivers require a minimum of
> support to make it work. That's what the hypervdrm patches were about.

I'm also happy to help with any other issues and shortfalls of drm vs
fbdev. There are some, but I thought it was mostly around some of the low
bit color formats that really old devices want, and not anything that
hyperv would need.

Cheers, Sima
> 
> Best regards
> Thomas
> 
> > 
> > This all got started when I was looking at a problem with hyperv_fb,
> > and I found several other related problems, some of which also existed
> > in hyperv_drm. You've seen several small'ish fixes from me and Saurabh
> > as a result, and this issue with mmap()'ing /dev/fb0 is the last one of that
> > set. This fix is definitely a bit bigger, but it's the right fix. On the flip side,
> > if we really get on a path to deprecate hyperv_fb, there are hack fixes for
> > the mmap problem that are smaller and contained to hyperv_fb. I would
> > be OK with a hack fix in that case.
> > 
> > Michael
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
