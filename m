Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3542B622D19
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 15:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A7110E5D7;
	Wed,  9 Nov 2022 14:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FE210E5D7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:03:19 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ud5so46903718ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 06:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rZPfTkW4opYQ4IdXXjLm2tEI/ZZERgUuI2xu9GdLAJ4=;
 b=EV5xCkylkPoCYiU7P4dwvPebDzIvRC49lNGiom7QMqlNhRrSQSIjMAqMjURmrVCunk
 kBOOu5ZXiYJO1a2jh665H8t9jPMW9SpNP5/j9L9pwu53Z7fvBS+2LfZx2II7dPYwZ80W
 9uLXq0CRTNVH6ZYAUgcQsJJ/2ejfoUY3rXH4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZPfTkW4opYQ4IdXXjLm2tEI/ZZERgUuI2xu9GdLAJ4=;
 b=1Iy7y9N67/vahNGbV4xSKCjSFtALlHmAIzkPnXgUHPspMTbUksgJr3+1e5mF/dxv6O
 IjSjlzDhkfjvuVo66kSuTUCedMff3kmCcyxYEio1rdYUQ/vw9Cuu7zYfAWRXPpKY7Gs7
 2oIxQCAznBhHAdNxk4TGA8k/TgnFOdrNvXpGpSiv7D2Hvc4hXflU3+CfTeBsapZYwg+S
 LSUH+bnt44ASG0jP0BDG3mxK7NJTCNVGvmqnArr+PL1VaTavpOJ9jF5tYdvjug+C3wdI
 hX2XKpya6cK6g5H9Rx4WbWx/5VUPwQWgb6cGVQBGIxu1ySYZPjAJznReXLp+N/mpIAv4
 UtCA==
X-Gm-Message-State: ACrzQf21cDm1H4panUBlr0DwSVcSjM6HXel1PGPYJKHkuAJ5W/MzaNRf
 HXebL+jBf3tnxb00CLJzEgS6oA==
X-Google-Smtp-Source: AMsMyM5gurKnTiaLaTVnnlaZi5p140Pa+hUMbOdNOAqGGvB2GpWer4ZvKKuU2ixnYhtWf3rcnR/F8w==
X-Received: by 2002:a17:907:1c8a:b0:782:1a0d:3373 with SMTP id
 nb10-20020a1709071c8a00b007821a0d3373mr55011246ejc.135.1668002597577; 
 Wed, 09 Nov 2022 06:03:17 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 19-20020a170906309300b0079800b8173asm5945390ejv.158.2022.11.09.06.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 06:03:16 -0800 (PST)
Date: Wed, 9 Nov 2022 15:03:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH v2] drm: fix crash in drm_minor_alloc_release
Message-ID: <Y2uzInZ0Wdo52OQQ@phenom.ffwll.local>
References: <20221108183823.314121-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108183823.314121-1-stanislaw.gruszka@linux.intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 07:38:23PM +0100, Stanislaw Gruszka wrote:
> If drm_sysfs_minor_alloc() fail in drm_minor_alloc() we can end up
> freeing invalid minor->kdev pointer and drm_minor_alloc_release()
> will crash like below:
> 
> RIP: 0010:kobject_put+0x19/0x1c0
> RSP: 0018:ffffbc7001637c38 EFLAGS: 00010282
> RAX: ffffffffa8d6deb0 RBX: 00000000ffffffff RCX: ffff9cb5912d4540
> RDX: ffffffffa9c45ec5 RSI: ffff9cb5902f2b68 RDI: fffffffffffffff4
> RBP: fffffffffffffff4 R08: ffffffffa9c40dec R09: 0000000000000008
> R10: ffffffffaa81f7d2 R11: 00000000aa81f7ca R12: ffff9cb5912d4540
> R13: ffff9cb5912d4540 R14: dead000000000122 R15: dead000000000100
> FS:  00007f56b06e6740(0000) GS:ffff9cb728b40000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000030 CR3: 000000011285b004 CR4: 0000000000170ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  drm_minor_alloc_release+0x19/0x50
>  drm_managed_release+0xab/0x150
>  drm_dev_init+0x21f/0x2f0
>  __devm_drm_dev_alloc+0x3c/0xa0
>  ivpu_probe+0x59/0x797 [intel_vpu 127058409b05eb2f99dcdecd3330bee28d6b3e76]
>  pci_device_probe+0xa4/0x160
>  really_probe+0x164/0x340
>  __driver_probe_device+0x10d/0x190
>  device_driver_attach+0x26/0x50
>  bind_store+0x9f/0x120
>  kernfs_fop_write_iter+0x12d/0x1c0
>  new_sync_write+0x106/0x180
>  vfs_write+0x216/0x2a0
>  ksys_write+0x65/0xe0
>  do_syscall_64+0x35/0x80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Fix this crash by returning NULL minor->kdev on error.
> 
> Fixes: f96306f9892b ("drm: manage drm_minor cleanup with drmm_")
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

On the entire drmm thing, you can avoid these if you do a drmm for every
little thing, that way you never get stuff that might or might not be set
up in the cleanup handler. But for one-off internal things that's a bit
overkill, and C utterly sucks at taking care of the boilerplate.
-Daniel

> ---
> v2: return minor->kdev NULL pointer instead of checking for IS_ERR in
>     drm_minor_alloc_release()
> 
>  drivers/gpu/drm/drm_drv.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8214a0b1ab7f..8d70b634d008 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -142,8 +142,11 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
>  		return r;
>  
>  	minor->kdev = drm_sysfs_minor_alloc(minor);
> -	if (IS_ERR(minor->kdev))
> -		return PTR_ERR(minor->kdev);
> +	if (IS_ERR(minor->kdev)) {
> +		r = PTR_ERR(minor->kdev);
> +		minor->kdev = NULL;
> +		return r;
> +	}
>  
>  	*drm_minor_get_slot(dev, type) = minor;
>  	return 0;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
