Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627C13D36A4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A78D6F3AD;
	Fri, 23 Jul 2021 08:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5F36F3AD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:27:12 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id l13so2574296ejo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 01:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iFpK+T9+raPLxD+yxquAoKkiFMyk8CjZ/tSZDv72n2o=;
 b=ZVJXefECKmKkO0h9sYZ9RR58AL+LWdFA77aSbDvdI+zrMQ1A6P5FjdcTwjZyEjFUMT
 dhw2K7Qaq+0Sc8B1FqcOpWv7fAmBt9R5PeYi3O6uSOM0LrQd8Z5eI7QRZ0Gi6eQKlIAW
 6KA5HNR69yUmOgsScu9ArA9ZZrhpJIoY5Ov9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iFpK+T9+raPLxD+yxquAoKkiFMyk8CjZ/tSZDv72n2o=;
 b=kSNYNqdNzAfbX/2GR0R/9f1RJaEcfoHZu/fmVtvPbiZBlKqbiti3CLuq8lNqnx9A9t
 AA0xlOH/Qc1iNdYfGzWvyHf6KFGrhQSKsge79Zc+KNNOkINF+nqFhB8h5tqL1/U6brRe
 RdIZXFWz+TsVOMWHR+o7bELV/mWpYE6Quc9ii/P71xBXhIkumesdHoOJFqMVWiJZFTmE
 ZBGJtWgxd9Ga/P27RuBx+6erz1mt9LjxqXPLiQbW18YYOqbWVijGOWL54Q/PUZfNAUP/
 mSUOUJN+/5b06/1NxspavHqyqClsiPGOwyeCn4wBqmF84fu6cdq+BzS4Rz65xQ5RRbEO
 j5gA==
X-Gm-Message-State: AOAM530/mfUOaFyRrh3XFaKlZEoVxcZ5ObanDd+/re6vZLbPLo3DXu+f
 qzr+b3oLBVPgQWdTbxGDj6+RNw==
X-Google-Smtp-Source: ABdhPJyzWM4G9HcIWpk6UZ8YFodYmP7Y4vSG+XIakxaW8WUjB18orefvqugOUHJXwuBXOz5wWBjYxQ==
X-Received: by 2002:a17:907:d09:: with SMTP id
 gn9mr3619982ejc.447.1627028830842; 
 Fri, 23 Jul 2021 01:27:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m12sm10376485ejd.21.2021.07.23.01.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 01:27:10 -0700 (PDT)
Date: Fri, 23 Jul 2021 10:27:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 0/9] PCI/VGA: Rework default VGA device selection
Message-ID: <YPp9XCa+1kS/s3wK@phenom.ffwll.local>
References: <20210722212920.347118-1-helgaas@kernel.org>
 <YPpY/zRTYK3xI6rK@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPpY/zRTYK3xI6rK@infradead.org>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 06:51:59AM +0100, Christoph Hellwig wrote:
> On Thu, Jul 22, 2021 at 04:29:11PM -0500, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > This is a little bit of rework and extension of Huacai's nice work at [1].
> > 
> > It moves the VGA arbiter to the PCI subsystem, fixes a few nits, and breaks
> > a few pieces off Huacai's patch to make the main patch a little smaller.
> > 
> > That last patch is still not very small, and it needs a commit log, as I
> > mentioned at [2].
> 
> FYI, I have a bunch of changes to this code that the drm maintainers
> picked up.  They should show up in the next linux-next I think.

Yeah I think for merging I think there'll be two options:

- We also merge this series through drm-misc-next to avoid conflicts, but
  anything after that will (i.e. from 5.16-rc1 onwards) will go in through
  the pci tree.

- You also merge Christoph's series, and we tell Linus to ignore the
  vgaarb changes that also come in through drm-next pull.

It's a non-rebasing tree so taking them out isn't an option, and reverting
feels silly. Either of the above is fine with me.

Also I just noticed that the scrip has gone wrong for drm-misc-next and
it's not actually yet in linux-next. I'll sort that out. Ok I just did
sort that out while I forgot this reply draft here, one of our committers
pushed a patch to the wrong branch. Luckily it was a broken one and the
right fix is in the right branch (and already in Linus' tree), so a hard
reset was all it took. So should be all in linux-next on the next update.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
