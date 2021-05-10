Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E163792CA
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 17:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7C989F8B;
	Mon, 10 May 2021 15:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD87689F8B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 15:34:14 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id l19so8515825qvu.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Kbo2+rSch+wM5JArQf3gDIi84RZdBPSju4RgHGRm0v8=;
 b=jInoHJDR26ARTH6tGpwVeeJogGk+P6na2ViO2DUIC+bGbMTDUi+8QZzkitdl3HzqhO
 qhzxVKEpk3y84tIr+YEon8WcnwbvCYIcrIg25Aj/b7Aw/UGidjezNDFr5jegnVEzomGc
 4efhSEvakB8sIdWnv6WdpTzrvm1E0Gx8lRr9GLBLLiIA4Ukwc+AzQ9ZD3NCYX5hM1Sd/
 ccEc+Vt5pnW3H8LiiDb5+QVBE1suwmzlBV6rdcmBxTtb5gWnK/b/QGiuyH818XA3RJ/w
 eI2Btdv2pxaao9VxPBbC4GWZvh6jQaHr7aGphsI2afnyj+BjF4p6gyMYvMUkwP1w7Elb
 RnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kbo2+rSch+wM5JArQf3gDIi84RZdBPSju4RgHGRm0v8=;
 b=g0dFVzzUGR8PP/Tq8Emm3RWoPZvcKHjT4pa8qSMi5nVN1RwQnsSQDcBxWl252j+NuI
 X0i+kj3CPh/yVESZB3PJLf1eO93nT6eWpWeWwCgUr0s24ed0ztH7R1ahb86RoJUjz7wZ
 PYtzsOne7kyjtVTQymjPOVbcWRW5bdeP4VQIRrVZdOuMBLhKsGqLXUYxbckSKxlaB4mN
 OFAMR1ub1sQ+QR5SYM55pbkJ7JRVOkUesUrV7MXToaMW78f9Luz4QpvHQ2BtYtnc+MyZ
 i+uIz/WcHZn0RYdxdidtfP+VKaDMJRqqVtXoptHy+vVdI364bkxsVAMGUmTZQ0AR2wi6
 d1Iw==
X-Gm-Message-State: AOAM532LH4YZxLHZXZAoiZSAB6xxTbFXENHqPk3PqeNlINEc80Jq6TXQ
 oA5QN/t2oBq4RVrqkku8q2TWtw==
X-Google-Smtp-Source: ABdhPJyla2vALn9Ej+6umiMQDx3D5VWVB5hGHAU2fINWGaZnoagvIFv9v7XEtwXflVpOpTyJSRO84Q==
X-Received: by 2002:a05:6214:9aa:: with SMTP id
 du10mr24525830qvb.37.1620660853797; 
 Mon, 10 May 2021 08:34:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id t128sm11479176qkh.50.2021.05.10.08.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:34:13 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lg7vA-004b0w-PZ; Mon, 10 May 2021 12:34:12 -0300
Date: Mon, 10 May 2021 12:34:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <20210510153412.GG2047089@ziepe.ca>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <20210510135031.GF2047089@ziepe.ca>
 <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux-MM <linux-mm@kvack.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 04:55:39PM +0200, Daniel Vetter wrote:

> yeah vfio is still broken for the case I care about. I think there's
> also some questions open still about whether kvm really uses
> mmu_notifier in all cases correctly, 

IIRC kvm doesn't either.

> > Daniel I suppose we missed this relation to follow_pte(), so I agree
> > that keeping a unsafe_follow_pfn() around is not good.
> 
> tbh I never really got the additional issue with the missing write
> checks. That users of follow_pfn (or well follow_pte + immediate lock
> dropping like vfio) don't subscribe to the pte updates in general is
> the bug I'm seeing. That v4l also glosses over the read/write access
> stuff is kinda just the icing on the cake :-) It's pretty well broken
> even if it would check that.

It is just severity. Exploiting the use after free bug is somewhat
harder, exploiting the 'you can write to non-page write protected
memory' bug is not so hard.

Jason
