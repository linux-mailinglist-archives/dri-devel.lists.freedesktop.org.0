Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C9B32637B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 14:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA316E14B;
	Fri, 26 Feb 2021 13:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF6E6EDEB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 13:45:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id 7so8652309wrz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 05:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3o8PI97/pmH5gUIyy1yCJ9JJhjS0lOlwnNAt2sS3mtY=;
 b=N2RrOw8qQC/y23HcCQINU1brdy1piWrBoMGXTw4gIFP6C9xUskWtAMzjnUFog1WiHE
 bS642ClMKw7KEMNMS0phES3R90H/tWp2qzN3ht1uOKNamg/2SKHBfiywC4jqNr/XrzS5
 hlzYdsaeFOnXTTpTl2Izh4EaPFkx3gGxaNKDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3o8PI97/pmH5gUIyy1yCJ9JJhjS0lOlwnNAt2sS3mtY=;
 b=OD+9bL9wQZ1w+4Xflhj82fdDpsJ7P6hUwzT3gxoEh3sDqwz6/Pw0+JehvJUXX5Cv4L
 1x9HKozRtMRdYGWxtZStaHl2qWkl+RsoGmBnQiIGJWtQ/Ro0nBqwyMtyScsnI2Ol17an
 0GhhaeZg0avkvN6/TtDSrh8DjJv7XyOHjxLq33yaeapDeJ85iADgo0mlHi1A86t4ACFk
 I8ncqDhD1V7/ruGmffiJiDYN8ImR7aRMgWqdD48Yj9fuj2nWjcvWoVMtgr9Thoj6ZrQj
 Z/WbmzowdnwwPm4xla4pvuGIXFA8Q9JYdzheY5mK3OW382NrowAGhSB9gT9AixFZPW6w
 oivA==
X-Gm-Message-State: AOAM532/tUDAsvQEEs3nTQZYuv43Nl5SBZZgqUJlzCrRrfPI9lJPASUk
 m9ZdGnc3jkw0ws+RndL0hPjCtw==
X-Google-Smtp-Source: ABdhPJySKPz73gO2bHinBihw6kNSB8EOYy5fJ4JmqzTuebQ2u7fzKxIKRgrubiheZdoAwKaVYlm2vw==
X-Received: by 2002:a5d:4fca:: with SMTP id h10mr3435679wrw.70.1614347147021; 
 Fri, 26 Feb 2021 05:45:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m24sm13077341wmc.18.2021.02.26.05.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:45:46 -0800 (PST)
Date: Fri, 26 Feb 2021 14:45:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/compat: Clear bounce structures
Message-ID: <YDj7iE4PNBRHx0fS@phenom.ffwll.local>
References: <20210222100643.400935-1-daniel.vetter@ffwll.ch>
 <20210225164911.k2bwswyivied36i5@gilmour>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225164911.k2bwswyivied36i5@gilmour>
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
Cc: syzbot+620cf21140fc7e772a5d@syzkaller.appspotmail.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 05:49:11PM +0100, Maxime Ripard wrote:
> On Mon, Feb 22, 2021 at 11:06:43AM +0100, Daniel Vetter wrote:
> > Some of them have gaps, or fields we don't clear. Native ioctl code
> > does full copies plus zero-extends on size mismatch, so nothing can
> > leak. But compat is more hand-rolled so need to be careful.
> > 
> > None of these matter for performance, so just memset.
> > 
> > Also I didn't fix up the CONFIG_DRM_LEGACY or CONFIG_DRM_AGP ioctl, those
> > are security holes anyway.
> > 
> > Reported-by: syzbot+620cf21140fc7e772a5d@syzkaller.appspotmail.com # vblank ioctl
> > Cc: syzbot+620cf21140fc7e772a5d@syzkaller.appspotmail.com
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>

Merged to drm-misc-next, thanks for taking a look.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
