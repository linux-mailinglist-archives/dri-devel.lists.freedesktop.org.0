Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD472285F7E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 14:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4D36E059;
	Wed,  7 Oct 2020 12:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1B46E059
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 12:48:11 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id ce10so2753958ejc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DgUuIRfcHlPhdxgua6tbSE2mebG0xHkllja1Sz9A+A=;
 b=OwAuf7F2NQb/bsfTM2qcO5DjrhllMR1QqFDtj/L3iekZAReq3qsqXSiEABTatoXxTB
 rDETHWmgxlHX7z4dhuSD2d4gWdOO/SQlLd1ksmCUxOY435tx1KNZZq94LRBlSVJGBKWq
 DO8qOQ4lkUnHLmdS85byS9GsBNdfVMiJquDxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DgUuIRfcHlPhdxgua6tbSE2mebG0xHkllja1Sz9A+A=;
 b=Ytlpba3TUglQi1aXyRXgqPFlO10CjIJIRMBVU8Ffd1c1Vn8NF49S8wCy4y4BfMqgjD
 IrHNRMBI66HGu/LZiMi1buPiazivCxR4Odwo40cIqPJ8oSIrKBuFmTUWdogZXbnn0Yyn
 Qy4eGjfgdezGzUtpm33JsgVHjLygln4U4EaRyXhpy7fiRv8sdd1yYsAB65GChPl0p1dt
 je9sF4CpSGd5wV4KVhHvyJnqi+Gp9sK7JIx/3csUPxEGxWb53OscGht+RaqW0mVbRg1y
 0AoVMoDkG5aa5h3sTjazJ6ila03DsjU2bOJYsg7jJ7CZWTWRnBxYbLpaV0ltV5w449JY
 VavQ==
X-Gm-Message-State: AOAM530WmWfNOYNnzRUQsS1UsSFoosrOipdNeNLAXQdUh4BCa0/+i+KR
 VaFv418V723iUaSfssAWKa8lPqYddibfXQ==
X-Google-Smtp-Source: ABdhPJzD38GAkq+A2Tu3V45whrIwlg2O/GrVggawfx+XthxbsqC5eyr+qUGliltaQuLgwL+f07kmsA==
X-Received: by 2002:a17:907:72c5:: with SMTP id
 du5mr3287855ejc.469.1602074889061; 
 Wed, 07 Oct 2020 05:48:09 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54])
 by smtp.gmail.com with ESMTPSA id f10sm1410716edu.68.2020.10.07.05.48.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 05:48:07 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id l11so2175063wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 05:48:07 -0700 (PDT)
X-Received: by 2002:a1c:4904:: with SMTP id w4mr2925784wma.99.1602074886765;
 Wed, 07 Oct 2020 05:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
 <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
 <20201007124409.GN5177@ziepe.ca>
In-Reply-To: <20201007124409.GN5177@ziepe.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 7 Oct 2020 14:47:55 +0200
X-Gmail-Original-Message-ID: <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
Message-ID: <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
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
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 7, 2020 at 2:44 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 07, 2020 at 02:33:56PM +0200, Marek Szyprowski wrote:
> > Well, it was in vb2_get_vma() function, but now I see that it has been
> > lost in fb639eb39154 and 6690c8c78c74 some time ago...
>
> There is no guarentee that holding a get on the file says anthing
> about the VMA. This needed to check that the file was some special
> kind of file that promised the VMA layout and file lifetime are
> connected.
>
> Also, cloning a VMA outside the mm world is just really bad. That
> would screw up many assumptions the drivers make.
>
> If it is all obsolete I say we hide it behind a default n config
> symbol and taint the kernel if anything uses it.
>
> Add a big comment above the follow_pfn to warn others away from this
> code.

Sadly it's just verbally declared as deprecated and not formally noted
anyway. There are a lot of userspace applications relying on user
pointer support.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
