Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0118A0F7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 17:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068F76E929;
	Wed, 18 Mar 2020 16:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12006E929
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 16:54:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 6so4232855wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=euLF9uKukhUVYesx9HtjGcg8xZuMjIswB0B2088zXNE=;
 b=JJ6/OpCLtKTqtB6uxm2hMHagpXJXdLC17tZFROgOO4zpKBlJOHIOYPgtfRxdxIQNCv
 bRIzKfaZtyCPMyLzY5e3i/zf1En0YslFxsY0iiFHQuVdf2WXP+yUJzsbTOujoto6aBLd
 /E5oVXjUFqSxSalML/Qb23Bcf9c90LFDw33kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=euLF9uKukhUVYesx9HtjGcg8xZuMjIswB0B2088zXNE=;
 b=T5PtTjCS5hymn5WyTkJyTP6w5MMJA16ewNFDMHKntIdQ5wAXFnqAPp9FvjmZ11pqej
 jYZNc8zPteqPW/dtKK1ERN6/JaOIhMbOeDEwYdacN0t7LzGVUHIIpuxxK7qWZXI3YO3H
 i1d7iYJKythck3iRGpmt1cU9Ht3MGdRq43hVyHDAEtejI7Rvaor+oo69g8x0PYbLaA/M
 zUf2IIrMlzQOz5L6vELcJXhCtrmwwYcGNh23ck8tJEOhpjbGCvzddnFexJxmfyQcU3Ox
 Rajeiv6wRjDdDe+fhtknxPcSHjuimfcSkOG1r909jNYqcWPxw65ilLk2nTSUedqaLJJI
 Aj7A==
X-Gm-Message-State: ANhLgQ2hyqy0zHpFqYlshc1WL8OL5blgbNTbnWVxwzNiNOxwJtWoTn8q
 bFHsvmEWoZTHfcJyzzHeM2nuaQ==
X-Google-Smtp-Source: ADFU+vtH3o1yPclrHIEiwrUHDrQwsqLe9vEypWjkSC/b3CYYmEykMBPLH06LmomqF5G282GjOoJo2g==
X-Received: by 2002:a05:600c:20c9:: with SMTP id
 y9mr6431143wmm.83.1584550484128; 
 Wed, 18 Mar 2020 09:54:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i12sm10245729wro.46.2020.03.18.09.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 09:54:43 -0700 (PDT)
Date: Wed, 18 Mar 2020 17:54:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 00/17] drm: subsytem-wide debugfs functions refactor
Message-ID: <20200318165441.GA2363188@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310143307.GA3376131@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310143307.GA3376131@kroah.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 03:33:07PM +0100, Greg KH wrote:
> On Tue, Mar 10, 2020 at 04:31:04PM +0300, Wambui Karuga wrote:
> > This series includes work on various debugfs functions both in drm/core
> > and across various drivers in the subsystem.
> > Since commit 987d65d01356 (drm: debugfs: make drm_debugfs_create_files()
> > never fail), drm_debugfs_create_files() does not fail and only returns
> > zero. This series therefore removes the left over error handling and
> > checks for its return value across drm drivers.
> > 
> > As a result of these changes, most drm_debugfs functions are converted
> > to return void in this series. This also enables the
> > drm_driver, debugfs_init() hook to be changed to return void. 
> > 
> > v2: individual driver patches have been converted to have debugfs
> > functions return 0 instead of void to prevent breaking individual driver
> > builds.
> > The last patch then converts the .debugfs_hook() and its users across
> > all drivers to return void.
> 
> This looks much better to me, nice job:

Yup, really nice all!

> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for the patches (and the review), everything queued up in
drm-misc-next. But missed the 5.7 feature freeze in drm unfortunately, so
heading for 5.8. Apologies for being a bit too distracted past week and
not merging this a bit more timely.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
