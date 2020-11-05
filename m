Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70E2A9183
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA816EE18;
	Fri,  6 Nov 2020 08:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490DE6E098
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:49:52 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id p12so925498qtp.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 04:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c/75nGkQrQ26C3oLWTOAYAjfB1zI6lLeh7OxDvBkYU4=;
 b=ey9/JXPqLzTLqSC0JUXYcVxUXf6bgAVzYD4I4rO+pMYwL+MZhAaGFEUE/+P8Locz8v
 LJ+RhibI0qf9gLCV/mRJ83hORIvqSMnJCg5JZJzCh+xHF7VIlIbjuRPAp0C63CSZuqsG
 vYgc5f9BkYulbWJWSx8NN3DJBDW1+TKWxoIWvVybUSqXDpV2fkacRRICo8Tgpy2bpeGk
 Ltiq/5WP3OM3AF7WaYqeeBRq6dKQGJ/PL2Qyomfzz0Quj8y3hj/F49F0vpFao5oEjJKE
 yviSyey2jqX+EBs1TWKrdjoCX5L1qgaPHh/4yTZi2biI/4T2G6/5ZjvS2T05bvZ3lDtu
 PdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c/75nGkQrQ26C3oLWTOAYAjfB1zI6lLeh7OxDvBkYU4=;
 b=MEY/oT3AU5w0fQcv0CDXxajP7GsavF+KiEsMfKPmPftRRTlM1vIqMFO+9VW5Xg9Bz/
 NMGsRp2MJmXrVY8SonGSv2Xb/JYyhmYThW93+EtmnH2MXQBFRIDtvKjRLaYIbyU6+gYN
 I5xdj0NQLtL0zfWMeLA63JlIP7jR/CZtTd7ALJCvhoFVi+H2r6VxGYW7iIFjBGBB13f1
 4BYrtKUXuAG+vcUloZ/IdbLPEQITM3XKGkIUzm++xLBaz+hfRmZVBk7Y1HTaUYwtemSh
 J9dDvbb27Jn/2/mQicgFaYdHbrHmy6BwrK6kvrv/2L929e6/6W798zXNZ6/dFjrId2//
 XqVg==
X-Gm-Message-State: AOAM531XqlB3Vjn7OWD02ub42H2TVvLqxBNjJsaIoACqiEMgiEuSGo/F
 sf0kwnlycnh7/pOssSURgNgqVg==
X-Google-Smtp-Source: ABdhPJyp3xdvhiGf3T//L8CChJ12FUSiNzGQbei5PswIE841BlFiQ3KzgYdb3JVW6KR7+PP7QIWQow==
X-Received: by 2002:ac8:46c1:: with SMTP id h1mr1733189qto.361.1604580591377; 
 Thu, 05 Nov 2020 04:49:51 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id u31sm763588qtu.87.2020.11.05.04.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 04:49:50 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kaei6-00H0yJ-2m; Thu, 05 Nov 2020 08:49:50 -0400
Date: Thu, 5 Nov 2020 08:49:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 J??r??me Glisse <jglisse@redhat.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
 KVM list <kvm@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201105124950.GZ36674@ziepe.ca>
References: <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca>
 <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
 <20201104162125.GA13007@infradead.org>
 <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org>
 <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
 <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
 <20201105092524.GQ401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105092524.GQ401619@phenom.ffwll.local>
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 10:25:24AM +0100, Daniel Vetter wrote:
> > /*
> >  * If we can't determine whether or not a pte is special, then fail immediately
> >  * for ptes. Note, we can still pin HugeTLB and THP as these are guaranteed not
> >  * to be special.
> >  *
> >  * For a futex to be placed on a THP tail page, get_futex_key requires a
> >  * get_user_pages_fast_only implementation that can pin pages. Thus it's still
> >  * useful to have gup_huge_pmd even if we can't operate on ptes.
> >  */
> 
> We support hugepage faults in gpu drivers since recently, and I'm not
> seeing a pud_mkhugespecial anywhere. So not sure this works, but probably
> just me missing something again.

It means ioremap can't create an IO page PUD, it has to be broken up.

Does ioremap even create anything larger than PTEs?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
