Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023496DD73F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 11:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EA610E02A;
	Tue, 11 Apr 2023 09:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4B710E02A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 09:55:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2ef70620b9dso594270f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681206923;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qjwT/tg0Il9N/eZxuQXGAWsNmLhCbQOBOXoq9lsOf/U=;
 b=LhR2tDt6FPotjaySQ6Sf6tz9AG58+vuUcuM1yAZgHkm1xiEQJEHBRofim1m6IDozXv
 VI57GGn+P7smvIJg1ibAhWImNuu+0ChlA3+Q/1cNs3y/ZP+RcJBoiDNuZfGklAtqnP9v
 JkVBhuPRD66yy7XkwBawBfXNfPQUiNNhIMddg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681206923;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qjwT/tg0Il9N/eZxuQXGAWsNmLhCbQOBOXoq9lsOf/U=;
 b=yqxTFGrmT0NRjQFiCQOnqibI3gE/Ny/FtzvE319nPtKDx55L0lOhS8jbrF4Aj8XCba
 gRSofoQeqCfUkwDS0ve54GDyuKMkq3W1wy8riDqS3bY2qhFfIlGmbhzCaAfDd7q8XsFe
 rqLDpDjH/HuhICmxJmq/PgtxXH63YcgMz04MeEMM/O+u1vXGp+XAWjl83NM/dYiVPdvk
 fJ9wgW8IUXNMe41Df1W4JPFjYWiYRnnFUsQ9awrKPdz3x455n2Ik9Q2jWbWUmZRCHSCA
 2vBqwvEOggA/AIAlJNeF5NyHd1p9nthzQXfvdahr7xTii2W0dg3nebKj8WgU3zuRY2Zq
 u1vA==
X-Gm-Message-State: AAQBX9dZUV5znHaM5McevF+N+kCVS5qAUby/5ww2XF/8dhzPOcYJ7V++
 aBCSYFRrQl23u0G+t11xkcrLfw==
X-Google-Smtp-Source: AKy350ZXTk4qisD5Dt7crpTUypd1u94LzlFsvk6oecu9nShltuKwhWFouDQ/FBGSmrfdK/RUJbOObw==
X-Received: by 2002:a05:600c:1991:b0:3f0:80fe:25be with SMTP id
 t17-20020a05600c199100b003f080fe25bemr6991447wmq.3.1681206923005; 
 Tue, 11 Apr 2023 02:55:23 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b003ed29189777sm20723241wmb.47.2023.04.11.02.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 02:55:22 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:55:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <ZDUuiB+E1tIJ95LY@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Greg KH <greg@kroah.com>, Dave Airlie <airlied@redhat.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
References: <20230411143812.11a4b00d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411143812.11a4b00d@canb.auug.org.au>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Greg KH <greg@kroah.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 02:38:12PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/linkage.h:7,
>                  from include/linux/kernel.h:17,
>                  from drivers/accel/qaic/mhi_qaic_ctrl.c:4:
> drivers/accel/qaic/mhi_qaic_ctrl.c: In function 'mhi_qaic_ctrl_init':
> include/linux/export.h:27:22: error: passing argument 1 of 'class_create' from incompatible pointer type [-Werror=incompatible-pointer-types]
>    27 | #define THIS_MODULE (&__this_module)
>       |                     ~^~~~~~~~~~~~~~~
>       |                      |
>       |                      struct module *
> drivers/accel/qaic/mhi_qaic_ctrl.c:544:38: note: in expansion of macro 'THIS_MODULE'
>   544 |         mqc_dev_class = class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
>       |                                      ^~~~~~~~~~~
> In file included from include/linux/device.h:31,
>                  from include/linux/mhi.h:9,
>                  from drivers/accel/qaic/mhi_qaic_ctrl.c:5:
> include/linux/device/class.h:229:54: note: expected 'const char *' but argument is of type 'struct module *'
>   229 | struct class * __must_check class_create(const char *name);
>       |                                          ~~~~~~~~~~~~^~~~
> drivers/accel/qaic/mhi_qaic_ctrl.c:544:25: error: too many arguments to function 'class_create'
>   544 |         mqc_dev_class = class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
>       |                         ^~~~~~~~~~~~
> include/linux/device/class.h:229:29: note: declared here
>   229 | struct class * __must_check class_create(const char *name);
>       |                             ^~~~~~~~~~~~
> 
> Caused by commit
> 
>   1aaba11da9aa ("driver core: class: remove module * from class_create()")
> 
> interacting with commit
> 
>   566fc96198b4 ("accel/qaic: Add mhi_qaic_cntl")
> 
> from the drm tree.
> 
> I have applied the following merge fix patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 11 Apr 2023 14:16:57 +1000
> Subject: [PATCH] fixup for "driver core: class: remove module * from class_create()"
> 
> interacting with "accel/qaic: Add mhi_qaic_cntl"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks for the fixup. Since Dave is out I've made a note about this in my
handover mail so it won't get lost in the drm-next merge window pull. I
don't think we need any other coordination than mention it in each pull to
Linus, topic tree seems overkill for this. Plus there's no way I can
untangle the drm tree anyway :-).
-Daniel

> ---
>  drivers/accel/qaic/mhi_qaic_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/mhi_qaic_ctrl.c b/drivers/accel/qaic/mhi_qaic_ctrl.c
> index 0c7e571f1f12..96db1580c72d 100644
> --- a/drivers/accel/qaic/mhi_qaic_ctrl.c
> +++ b/drivers/accel/qaic/mhi_qaic_ctrl.c
> @@ -541,7 +541,7 @@ int mhi_qaic_ctrl_init(void)
>  		return ret;
>  
>  	mqc_dev_major = ret;
> -	mqc_dev_class = class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
> +	mqc_dev_class = class_create(MHI_QAIC_CTRL_DRIVER_NAME);
>  	if (IS_ERR(mqc_dev_class)) {
>  		ret = PTR_ERR(mqc_dev_class);
>  		goto unregister_chrdev;
> -- 
> 2.39.2
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
