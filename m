Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588D2FA36F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 15:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD396E2C7;
	Mon, 18 Jan 2021 14:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D636E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 14:46:46 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q18so16736605wrn.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 06:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=OFCYur2p1RG6wq2GuEDBaWE0Jb4tQR4iZ3ZSFGTYM3Q=;
 b=MORI3SlYIrEkdmnCv+sjKCAmt9E08uuQb12loXc/lT36i7Bm4U3JdKozMG0qxvUrzw
 IMVXaOFnQZAzmhic3tx7YaB0IcMjXKAl8lA802YdXPEMuzut8sXnLwFwdIp6dUMmqUjx
 um9R3CaD5IRuDrSAgDos6Nn2Lt9/Q1M2fhjAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=OFCYur2p1RG6wq2GuEDBaWE0Jb4tQR4iZ3ZSFGTYM3Q=;
 b=ChXnnOHNThjTLpwaEfK96j7rKTC+gGVuXSb1Ck7X4QAZxx0Cj4+AAwRFlSBi1W0RS7
 W7jw+GsFAIP8D1XULT5CnY/Gh7FXv3rYbmcjAbrK6t3kEMsUoSJ2LkH+kS0i3oUxLvt0
 H5VSwWjdf5NoVqKvSQtaVXftnLyNbIaI0jbWfiKOryN1oyCpzkyTj4zSny3jlQjypcFl
 pdx5bJ2Bl+F4m/j2J95udLKzsw3N3odiFU00+p+7aerfPYiy9LIML5mE72YBvdKvYPlQ
 oqYUUwv2V38RVjYAfRO9BC23HKh7ktRsPiEhXALHKZdmYlThu3bWf36D5I6TEEbfPDmo
 gDTw==
X-Gm-Message-State: AOAM53345mWtvWVJzGADpdrH5Oul9OM/s4jr+TFlRF16ime4cadWQsor
 fo+e8ucoxq2Fx2RO2xno/tgvIQ==
X-Google-Smtp-Source: ABdhPJyDCDO+1fmc1K2ew5LzU7f8vg/ienWX3/ewHzh+gElcHa7lnFCJ1WZ1SRCLGxPa5q6k2ZRqsw==
X-Received: by 2002:a5d:4491:: with SMTP id j17mr25684833wrq.78.1610981205075; 
 Mon, 18 Jan 2021 06:46:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r1sm31249890wrl.95.2021.01.18.06.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 06:46:44 -0800 (PST)
Date: Mon, 18 Jan 2021 15:46:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 00/40] [Set 14] Rid W=1 warnings from GPU
Message-ID: <YAWfUl56zsi18/Y+@phenom.ffwll.local>
Mail-Followup-To: Zack Rusin <zackr@vmware.com>,
 Lee Jones <lee.jones@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alan Cox <alan@linux.intel.com>,
 Benjamin Defnet <benjamin.r.defnet@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eric Anholt <eric@anholt.net>,
 Jesse Barnes <jesse.barnes@intel.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rajesh Poornachandran <rajesh.poornachandran@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
 <328B978C-0A69-4220-BE63-7C4E4D627225@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <328B978C-0A69-4220-BE63-7C4E4D627225@vmware.com>
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
Cc: Rajesh Poornachandran <rajesh.poornachandran@intel.com>,
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Benjamin Defnet <benjamin.r.defnet@intel.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Jesse Barnes <jesse.barnes@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alan Cox <alan@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 06:22:23PM +0000, Zack Rusin wrote:
> 
> > On Jan 15, 2021, at 13:12, Lee Jones <lee.jones@linaro.org> wrote:
> > 
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > Penultimate set, promise. :)
> 
> 
> Thank you for all that work. For all the vmwgfx bits:
> Reviewed-by: Zack Rusin <zackr@vmware.com>

I pulled all the non-vmxgfx patches to drm-misc-next, I'll leave the vmw
stuff to Zack.

Thanks for your work here!
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
