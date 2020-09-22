Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC59E2742D1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 15:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67426E865;
	Tue, 22 Sep 2020 13:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACAA6E86D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 13:20:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s12so17039300wrw.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=PDxFBsdzhqglAsjtf28c/y3OAG0uxodhHBxS0E/7Jd8=;
 b=Q8ohkniG1biUWmKbxmcgW6iu6A0ozWJ/wHbh5EdHbq6YPm1Yqokf5Smqn2f95gloMG
 rz59LDzWOW5FyxiGvmOxb09m3asZZ+c8dE4v6Da7LR43jnsTcohAjfHekidB265iA1i4
 q7ehVTT6jRwetK5Bl/gV5z11+qR3EmSw2/9wU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=PDxFBsdzhqglAsjtf28c/y3OAG0uxodhHBxS0E/7Jd8=;
 b=kwkNqB3LkKtHkIjBJ6QPy/Sha/ESy4hB8I8/kAiym9ccPVFOYCzQI5wEhjxOE53qip
 tHhE69EiLPIBxiWqP14e3dWf8X3jNFLxSGRjQT+NDnzsR8hEK8Ncg55WrwNtfkmUlTV7
 pD2aOnpGqKMStEjqcrelC8pNc/OlSOUFBqZSaEUnfqr40PEPx4GvYXaDBfijTLugit3p
 S40kJcInFfN9UUd6+icde/pje0MHYDijpfJ8GYyMoftjRlR4yDue4o5v0PTimxf/MoAr
 5RQfswbX1A5mAER+Cc0QxrHgCHneMPnBXl3+1/oei6soep0w4ZZj6pXO/OoAAzFtjaP+
 vOrw==
X-Gm-Message-State: AOAM532/knIf8w+OnqOS1PKFAYO5xPnEGsGYl/QxAaNOXNrHl23HSyAY
 IDMybgloXXR8Qn1/uZMS7sYtGEoMjd01SMY/
X-Google-Smtp-Source: ABdhPJweoQg7bZ8uxspQfUQZW9VTW/MLMSfQJQqzN87TEoP+S1zXqDNPAKFWlHYxU6MMPyWrf4dpoQ==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr5121626wrp.387.1600780848571; 
 Tue, 22 Sep 2020 06:20:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n3sm4461810wmn.28.2020.09.22.06.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 06:20:47 -0700 (PDT)
Date: Tue, 22 Sep 2020 15:20:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] vga_switcheroo: simplify the return expression of
 vga_switcheroo_runtime_resume
Message-ID: <20200922132045.GN438822@phenom.ffwll.local>
Mail-Followup-To: Qinglang Miao <miaoqinglang@huawei.com>,
 Lukas Wunner <lukas@wunner.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200921131110.93365-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921131110.93365-1-miaoqinglang@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 09:11:10PM +0800, Qinglang Miao wrote:
> Simplify the return expression.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Pushed to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/vga/vga_switcheroo.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> index 087304b1a..1401fd52f 100644
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -1034,17 +1034,12 @@ static int vga_switcheroo_runtime_suspend(struct device *dev)
>  static int vga_switcheroo_runtime_resume(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
> -	int ret;
>  
>  	mutex_lock(&vgasr_mutex);
>  	vga_switcheroo_power_switch(pdev, VGA_SWITCHEROO_ON);
>  	mutex_unlock(&vgasr_mutex);
>  	pci_wakeup_bus(pdev->bus);
> -	ret = dev->bus->pm->runtime_resume(dev);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return dev->bus->pm->runtime_resume(dev);
>  }
>  
>  /**
> -- 
> 2.23.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
