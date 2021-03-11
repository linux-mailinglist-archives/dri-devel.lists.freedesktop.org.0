Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A433737E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 14:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FC26EC68;
	Thu, 11 Mar 2021 13:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6866EC68
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:11:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso12748193wmi.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 05:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8kVlvJ2pP4cf2hoG65hQ4YRnKBJPbaEN5bJkJbPzFEk=;
 b=bBzLiFiVOuTXnXr+Z2s+5vhb6ZpNbNkRpKAlvO3DKKGdpne1enfFwKUMyMBb0WwL3P
 tOtTf3H9wBJ1lvgopO0Fp8wG1tVL9Rjm7EgkvwT1bDqKfqv8exsPvxLYjDwiDeN5iODS
 Y6P+zD2zFJhukWEpXEdZqtnxjXHWjuerO/PJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8kVlvJ2pP4cf2hoG65hQ4YRnKBJPbaEN5bJkJbPzFEk=;
 b=stPynUCcsx4N9qJS+sNqynF0MYoS99TLe4vdrtlG4nlHTIFbSnDqUDHubQEbJoDioc
 AtZuA3SVuUJPngEjI8vm8jz9Gh5tTVyJ4eHUs+ldAkbZboDX2CGiIsEAGFwOTLAl5l+Q
 RG9cOIMf391r+vLiOkSAnazsMWsiB8rq1BAcdlX45tQhQvtUmkrHOg1P+lxlvNquRnc8
 JoG1KrjOWFk8PzSY3KEkdm/rbW6a/hXMTRRRuOruKtSh3IAyl731fxBjoZRH8pcJW2B5
 csaKMD7gVr0R1jIxhI4PhqIS1F5RtVWGe68BKxbQuXx2o5TH8DJzKbz1112ovg7IjSOb
 3iAg==
X-Gm-Message-State: AOAM532mvzhpg+YpAh+IlH3vmR3g8A31ITIsBRHHYnWQt9dgFMMJ19EB
 eH/9LqlZQ4dA7iW9U1/VTb9mFw==
X-Google-Smtp-Source: ABdhPJwDJcayin5TVW7slFcyKtlYxQQWT2GxXC4TrNKPGmWWNkuTnX+5ubZwXjjG3rq6xvpcrkXpzQ==
X-Received: by 2002:a05:600c:4154:: with SMTP id
 h20mr8319519wmm.149.1615468269390; 
 Thu, 11 Mar 2021 05:11:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z13sm3743613wrh.65.2021.03.11.05.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:11:08 -0800 (PST)
Date: Thu, 11 Mar 2021 14:11:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/vboxvideo: Use managed VRAM-helper initialization
Message-ID: <YEoW68A+Y1AehVPP@phenom.ffwll.local>
References: <1614735587-6621-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614735587-6621-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 03, 2021 at 09:39:46AM +0800, Tian Tao wrote:
> updated to use drmm_vram_helper_init().
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Hans, do you plan to pick this up?
-Daniel

> ---
>  drivers/gpu/drm/vboxvideo/vbox_ttm.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> index 0066a3c..fd8a53a 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> @@ -12,15 +12,13 @@
>  
>  int vbox_mm_init(struct vbox_private *vbox)
>  {
> -	struct drm_vram_mm *vmm;
>  	int ret;
>  	struct drm_device *dev = &vbox->ddev;
>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
>  
> -	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(pdev, 0),
> +	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
>  				       vbox->available_vram_size);
> -	if (IS_ERR(vmm)) {
> -		ret = PTR_ERR(vmm);
> +	if (ret) {
>  		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
>  		return ret;
>  	}
> @@ -33,5 +31,4 @@ int vbox_mm_init(struct vbox_private *vbox)
>  void vbox_mm_fini(struct vbox_private *vbox)
>  {
>  	arch_phys_wc_del(vbox->fb_mtrr);
> -	drm_vram_helper_release_mm(&vbox->ddev);
>  }
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
