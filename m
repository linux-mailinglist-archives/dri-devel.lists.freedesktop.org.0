Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B1286F34
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7BF6EA2C;
	Thu,  8 Oct 2020 07:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634736E0E9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 18:47:08 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c62so4133200qke.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 11:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=blJZdod8zk/hTt6aNFQh+ol0gh1a78kUUXD+guPskI4=;
 b=FXhd/ekfXs6fh3cll2LP8DfZTMZ6v7gCpfAUIVVfE1B0U7VAQPIBKxkhfc1dFnYq82
 Kn+0XgvAM0ZBWredbpGcw0ytLSBsmbdkDGp0d+KMnNGmIEd0csrhxJ9+3u41TCl493tC
 qoy8IibKfAQBUMznmwxuOWwggfytiLaCOIvMZb5U54saVhW+IJeIoldKHp1JhktgI1fb
 dTZmieJYDuht9kp7PCFRN7wXqTnaAEzHkQzHVBm8ar/Bjnd8Q7KMUa8aVJVvWcZ/h3MJ
 RvoONyk7Z54SWNZEGjCpat5nQxlJo0thAT/kABWJLN0ZoyCZkh1K7GW3tSI0B90Pau7f
 OT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=blJZdod8zk/hTt6aNFQh+ol0gh1a78kUUXD+guPskI4=;
 b=lNs4hHwAn6iinc+lEgQ31SXQS3gnt/m5UBZYGjgcCLpxW1MU+RlPUyuNDhjmlbVHOT
 algmsePCeqe5O6tPQB9UBs8VinLoIYwQRxa7PsP5sSf/CYFZg9g6tgUY2uojkujK9HIG
 +dzNTQVqWmejYTDeaP4vUw6nouTHwEI75Lt69s6cGdvqecIz3rM/pngqS5AvhH6OUTx6
 fVi31f9Za2lm/91ckHBo+JJT4KBieEqYWz5+K77B1qK+wqtV+MzOI876qVjxEheGv5uR
 eWx+T/aiHmlwnD5Q9PTX758EBnFvEJNXRM1sD2ZrWOAf34KWRYdPUH5bou8EjSgcTBhG
 uZMA==
X-Gm-Message-State: AOAM5339Ep6Zz60jQ3Lk9CXNdzh3p/6QGLDKSXDGPlibw3dcu6ZXbdV3
 8XaTf1NxbSxnR3Xrt7tQ+LUHiA==
X-Google-Smtp-Source: ABdhPJyI7YrbswPfVJyHh3D9zECw9J/wTcosoBEFRYUxMgJHlEqE+dKTaCija+ZxTihrZ+KRv+csgQ==
X-Received: by 2002:a05:620a:244e:: with SMTP id
 h14mr4456465qkn.348.1602096427480; 
 Wed, 07 Oct 2020 11:47:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id o2sm2032427qkk.42.2020.10.07.11.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 11:47:06 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQESv-001Elc-Ob; Wed, 07 Oct 2020 15:47:05 -0300
Date: Wed, 7 Oct 2020 15:47:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 13/13] vfio/type1: Mark follow_pfn as unsafe
Message-ID: <20201007184705.GY5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-14-daniel.vetter@ffwll.ch>
 <20201007173911.GX5177@ziepe.ca>
 <CAKMK7uEbAAJPPmv1yM_-V24Xg=S=NWxs2Yhi51kb-4AZLbFTTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEbAAJPPmv1yM_-V24Xg=S=NWxs2Yhi51kb-4AZLbFTTg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Cc: linux-s390@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 08:14:06PM +0200, Daniel Vetter wrote:

> Hm, but wouldn't need that the semi-nasty vma_open trick to make sure
> that vma doesn't untimely disappear? Or is the idea to look up the
> underlying vfio object, and refcount that directly?

Ah, the patches Alex was working on had the refcount I think, it does
need co-ordination across multiple VFIO instances IIRC.

At least a simple check would guarentee we only have exposed PCI BAR
pages which is not as bad security wise as the other stuff.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
