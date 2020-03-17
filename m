Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC72B188B13
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 17:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EEE6E24D;
	Tue, 17 Mar 2020 16:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7D26E24D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 16:49:45 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 25so22017wmk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 09:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=mMiEl9L2S4tlLAiIN1V5kcZjzOStOhhL2zNGzs+Vouc=;
 b=R6oowquvlxrvUCOrWAkR8nSqdDRskytPZj1t+oqMPZIXIdEaqaxrZausO30q5v2cij
 Ta9XPGU0jQaKg5rNB49TK7FEHpqSy2S5b/6hMjglyIwqWn6CM31M2MK33qUQn6/uT7et
 S8yBm+Y4yH5ujfReYwesuo5IRj0cN9DkeDzDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=mMiEl9L2S4tlLAiIN1V5kcZjzOStOhhL2zNGzs+Vouc=;
 b=KiWZGKgGSShaTEVV9VpUcf63john4afs32Ze2WBLvZBfTCS2KXTOm5qeDzUU8zNnIR
 zcWkkV4nNMh/gT5C4C/ATD8C1bFXvD9PIOk8OXDzZSX1RUTxAyqNxAtVBdaLR4u7QMHj
 1jaIuVzGfr8IfVNClUxxzWjJp8KMwmXCf/zbjoinVggU+4AMn3QCVZ5BKAVNatHWGduC
 lloQXeYH8qdB+HjLSpCFS52GxXjFm/3DiUemP7BSi9wGIqExOOicInNDmPbsxHhZ36GD
 KCSFtFxJokQz+AndaMwNjNLjytTjGvLOHKcZGvm2od8R4mCaCJu5ZeXfezL8CEZfg3CM
 xMBA==
X-Gm-Message-State: ANhLgQ3XFD1OrKK7kKnIOnrWp4QHQNYwIl/ENWDNYsvbDWebw6dlzEsg
 BpJP0XihFzq+noebS3ialbs9oA==
X-Google-Smtp-Source: ADFU+vt8dNlSMJCThKrf5v17M3aD/fp8xVTQ3Zc/gPBrkJ6TA++okOS+dztloBcqbCNdk++CpJkLog==
X-Received: by 2002:a1c:5684:: with SMTP id k126mr163852wmb.181.1584463784547; 
 Tue, 17 Mar 2020 09:49:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n10sm5554069wro.14.2020.03.17.09.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 09:49:43 -0700 (PDT)
Date: Tue, 17 Mar 2020 17:49:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] drm/bochs: downgrade pci_request_region failure from
 error to warning
Message-ID: <20200317164941.GP2363188@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, marmarek@invisiblethingslab.com,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200313084152.2734-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313084152.2734-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, marmarek@invisiblethingslab.com,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 13, 2020 at 09:41:52AM +0100, Gerd Hoffmann wrote:
> Shutdown of firmware framebuffer has a bunch of problems.  Because
> of this the framebuffer region might still be reserved even after
> drm_fb_helper_remove_conflicting_pci_framebuffers() returned.

Is that still the fbdev lifetime fun where the cleanup might be delayed if
the char device node is still open?
-Daniel

> =

> Don't consider pci_request_region() failure for the framebuffer
> region as fatal error to workaround this issue.
> =

> Reported-by: Marek Marczykowski-G=F3recki <marmarek@invisiblethingslab.co=
m>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/bochs/bochs_hw.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/boc=
hs_hw.c
> index 952199cc0462..dce4672e3fc8 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -157,10 +157,8 @@ int bochs_hw_init(struct drm_device *dev)
>  		size =3D min(size, mem);
>  	}
>  =

> -	if (pci_request_region(pdev, 0, "bochs-drm") !=3D 0) {
> -		DRM_ERROR("Cannot request framebuffer\n");
> -		return -EBUSY;
> -	}
> +	if (pci_request_region(pdev, 0, "bochs-drm") !=3D 0)
> +		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
>  =

>  	bochs->fb_map =3D ioremap(addr, size);
>  	if (bochs->fb_map =3D=3D NULL) {
> -- =

> 2.18.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
