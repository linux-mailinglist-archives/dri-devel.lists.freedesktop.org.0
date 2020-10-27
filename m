Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7A029C7A9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 19:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF9A6E202;
	Tue, 27 Oct 2020 18:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFEF6E202
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 18:44:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t3so116504wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=yq3mNzKnnS784nsQFC2uDIJSO3VSvUZkuyXz2yHmGdg=;
 b=IACCIP29UjFLYDYxCaky7/HBTtI2UNwwbCcpjcks7uKU4tAvtd5mGAnvGHmjidVDwH
 zP9iwtcti5gtYzQkactAV1pPQ4L2E0iotqMM1GS/1KXB6pzebnPe1RL7UfhRVRcHl7GD
 X8AcNVcDBhj3fsVeK3Wxl5L2lGS2fr21qPFWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=yq3mNzKnnS784nsQFC2uDIJSO3VSvUZkuyXz2yHmGdg=;
 b=X1iLbaPQAgyo5f7AT1ldGJuO+5buktW2syYBTaQ57icQ6jShuxKrCNrriYzKDj5l7N
 pTnf5PDCNtiJjxFwS18ZUk0M0R2r3gTfATRrBKR6Or39d0NeNPKihUbJVyatZ3KlSUYO
 iwCOqzIScZOVsqqfl9Q7TRFschA1xgMOEVXGrezXpFtamCM5BdNZH4M/JwWSLrhEIJ6B
 t1saSgXHS96xBc6TY/6VPW5rqoH04GM6TerhahCQCOYlF2ggOaDG0PD3GMc+V1Ek5Zu8
 wAmeiBkbWev7FDWrdmyoZ+UoZctC6HZxfcXgZKDVpHuh3GVvpCoY2JUMpyOxg8/f5DlA
 02Hw==
X-Gm-Message-State: AOAM531GK0wgrIwzyCa4+g/jPFkMsU6WVvlM2p4hYV8TdszBEMR0d5Z8
 5A7bigP34sDGCZsSpwUJxp4I1A==
X-Google-Smtp-Source: ABdhPJyNv9utLUbtl13nhVFLMe2DbQzNiipDgdzSnVahx9c+HevjO+Z5XoZ2J7OZUBZRFF03CNYYtg==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr4109018wmh.93.1603824285879;
 Tue, 27 Oct 2020 11:44:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l26sm2755765wmi.41.2020.10.27.11.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:44:44 -0700 (PDT)
Date: Tue, 27 Oct 2020 19:44:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH 1/5] fbdev/atafb: Remove unused extern variables
Message-ID: <20201027184442.GL401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 12:31:08PM -0400, Peilin Ye wrote:
> Remove 6 unused extern variables to reduce confusion. It is worth
> mentioning that lib/fonts/font_8x8.c and lib/fonts/font_8x16.c also
> declare `fontdata_8x8` and `fontdata_8x16` respectively, and this file
> has nothing to do with them.
> 
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

This was unused ever since this driver was merged into 2.1.67 (I looked at
historical linux git trees quickly). Save to delete I'd say, probably just
copypasted from some outdated driver template that was even older.

Applied to drm-misc-next.
-Daniel
> ---
> $ # Build-tested (Ubuntu 20.04)
> $ sudo apt install gcc-m68k-linux-gnu
> $ cp arch/m68k/configs/atari_defconfig .config
> $ make ARCH=m68k menuconfig
> $ make ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- -j`nproc` all
> 
>  drivers/video/fbdev/atafb.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
> index f253daa05d9d..e3812a8ff55a 100644
> --- a/drivers/video/fbdev/atafb.c
> +++ b/drivers/video/fbdev/atafb.c
> @@ -240,14 +240,6 @@ static int *MV300_reg = MV300_reg_8bit;
>  
>  static int inverse;
>  
> -extern int fontheight_8x8;
> -extern int fontwidth_8x8;
> -extern unsigned char fontdata_8x8[];
> -
> -extern int fontheight_8x16;
> -extern int fontwidth_8x16;
> -extern unsigned char fontdata_8x16[];
> -
>  /*
>   * struct fb_ops {
>   *	* open/release and usage marking
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
