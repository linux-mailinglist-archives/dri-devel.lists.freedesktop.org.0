Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC7F3373A1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 14:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DA86EC74;
	Thu, 11 Mar 2021 13:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF3F6EC74
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:20:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id l19so1295093wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 05:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xBjxNp/kAr268sKmaIcFjfsF9e2LS6E+sV/NsvlV4qQ=;
 b=THQ2cKdOJhdTQ8EJtslP9r8+5yz6DpjRnSMccVS1sSZ+2xfU9yeJt0NsHok5Cm4fzk
 yghDvilmfAWrHVLFSFRp64YLuRiPugegQ/3qxnLfV35oUeWIs2Q/2kSWb+KLBqTuNhl/
 p8b/BBtIGAPYIlWteLfCZwTlpHdJPjOw/zWhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xBjxNp/kAr268sKmaIcFjfsF9e2LS6E+sV/NsvlV4qQ=;
 b=clgz0paOwOgh8yKbfitlC9lBlJq4SGqssQ/VsHunomLlkhXxXitlB7WCvcV7HQRe3i
 bM6MoGD6yrIESXF+XKM2qvqFzOhCrzdlc9PAB6HL1AhBuA5N1A+cZg35dPC8TbymBw/S
 8rslihLzbj08u45EPycJNQ8hbd1o3q68sEpX7lIj2iUv4Jx4UNM5sgiZ7AmtvQFPgOGn
 ONk3fhC44prXkuAJQQ2yKQZbTM1+0s0RQ4e692nPffQAIsedI/SDO2NEN16RNuSv0T18
 16KlLnpHbSrTZL4WZv0tWnbeuMwQtR0TcBKS9hZslz/KCX8vNmCQa6wssJHJPKN6CLbZ
 vUgw==
X-Gm-Message-State: AOAM533fCgnKUNodLtvRxhifI73piyj7tF3Zi/K8N35RjN4XfduNsFHn
 Uhwwp8d7X+aKp0mIayngWSVI4Q==
X-Google-Smtp-Source: ABdhPJzNh0mM8efMvi4o2HOEZaPfcEhmZC+4psAECTDrqOj6rKS+mKDVTg8/UR+BE1eWxvDQLRCSkw==
X-Received: by 2002:a1c:f708:: with SMTP id v8mr8041845wmh.25.1615468810566;
 Thu, 11 Mar 2021 05:20:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s3sm3601715wmd.21.2021.03.11.05.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:20:10 -0800 (PST)
Date: Thu, 11 Mar 2021 14:20:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] drm/vboxvideo: Use managed VRAM-helper initialization
Message-ID: <YEoZCHUs6sNehW9/@phenom.ffwll.local>
References: <1614735587-6621-1-git-send-email-tiantao6@hisilicon.com>
 <YEoW68A+Y1AehVPP@phenom.ffwll.local>
 <297ec5e4-4729-5cf9-1697-2f2892d3bc40@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <297ec5e4-4729-5cf9-1697-2f2892d3bc40@redhat.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, Tian Tao <tiantao6@hisilicon.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 02:13:57PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/11/21 2:11 PM, Daniel Vetter wrote:
> > On Wed, Mar 03, 2021 at 09:39:46AM +0800, Tian Tao wrote:
> >> updated to use drmm_vram_helper_init().
> >>
> >> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> > 
> > Hans, do you plan to pick this up?
> 
> The drm patch-workflow falls outside my daily kernel-work workflow,
> so it is always a bit of a task-switch for me to switch to dealing
> with the "dim" workflow. ATM I don't have any other drm work pending,
> so I would appreciate it if someone else can pick this up.
> 
> The change does look good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll push, thanks for reviewing.
-Daniel

> 
> Regards,
> 
> Hans
> 
>  
> 
> > -Daniel
> > 
> >> ---
> >>  drivers/gpu/drm/vboxvideo/vbox_ttm.c | 7 ++-----
> >>  1 file changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> >> index 0066a3c..fd8a53a 100644
> >> --- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> >> +++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> >> @@ -12,15 +12,13 @@
> >>  
> >>  int vbox_mm_init(struct vbox_private *vbox)
> >>  {
> >> -	struct drm_vram_mm *vmm;
> >>  	int ret;
> >>  	struct drm_device *dev = &vbox->ddev;
> >>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
> >>  
> >> -	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(pdev, 0),
> >> +	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
> >>  				       vbox->available_vram_size);
> >> -	if (IS_ERR(vmm)) {
> >> -		ret = PTR_ERR(vmm);
> >> +	if (ret) {
> >>  		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
> >>  		return ret;
> >>  	}
> >> @@ -33,5 +31,4 @@ int vbox_mm_init(struct vbox_private *vbox)
> >>  void vbox_mm_fini(struct vbox_private *vbox)
> >>  {
> >>  	arch_phys_wc_del(vbox->fb_mtrr);
> >> -	drm_vram_helper_release_mm(&vbox->ddev);
> >>  }
> >> -- 
> >> 2.7.4
> >>
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
