Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E73D219FBC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 14:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEF36EA4D;
	Thu,  9 Jul 2020 12:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9466E077
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 12:11:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id j18so1530234wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=76Pr5Imry6Y6+NQUV46pzWGDfBUpjBEUH8MLbXYDtq8=;
 b=PoAXES+V23Wh8eM1RMa1gjv7mPdB9CHvXYOhFE06xOw/lMwbG/HZ53PABoY8YaxIgs
 /ROsDCtb7CcSWl99Acc2lIZyw7vhas2ZIGL3Ki1AJDgM2rGMRUCDI/AexHfuV+OrjnL9
 topSv19nW8QIm2JsuBwLzSSpnHvj8hrxQXpLFQxSMcLqXF+fDV3ORupMLNE5TMh+r0OA
 Trg8XRN/fVokthVccXXppm7BJJEK3Jz9QMSYfIc/fW3D04yKmMZTU52iAFdp/4EmW3zi
 HGAW53jITOccHxT8InC62n+akeJnp3riy7+EacBJAzuqWSCYVf+xDufoR7bXUJg6y/oD
 z3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=76Pr5Imry6Y6+NQUV46pzWGDfBUpjBEUH8MLbXYDtq8=;
 b=Y59oLsVPwHmSAc0P+IJzP02+aRu9IL1WV2ko+RMWDOcMRoCPZAua2qs3ToW3bG8JKF
 urckWony9y6CXm8zkTYgH2pXzX4KeaKY+wTayY/6GB0wnr213Gwz9l/512TCKlSKdGJI
 493iwjQkgerRd4pUDwxH6mYl3hWJ/L9ltVy4j8sJ7v+kuSBZO72qEn1MtoRaaTy3qeZk
 6ZicBKg2qDbBKyFX037LV8BbneUZ3+yDtxVLAHW3r1f+uQGiv4KCGlsKUthmb31PpPtu
 P+Uyc8c/xfNoe1kDxnWZNx5juf7lkUY6c7fgp93D7XXi3PMJucbtF4Hz0QE15WYh27kc
 GY4w==
X-Gm-Message-State: AOAM532KkJgjoL/SpsEHssuICzlhO3Fgn/OIpimUZSjPeJpDDFeyn9Wj
 CLPTOqRD10pYtkC1mONr4eWL0B4oTzh3AbVTqrwkMg==
X-Google-Smtp-Source: ABdhPJxv2bOOBtwBiOGYgL5OIERVoKiGIkkOEtt5HovOBMNjbTSQatsMIYv39pPFy2HfkEl1IbeCaLvATVq/PpV25+k=
X-Received: by 2002:a1c:bdc3:: with SMTP id n186mr13815672wmf.84.1594296683336; 
 Thu, 09 Jul 2020 05:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <CAPj87rO4mm-+sQbP07cgM8-=b6Q8Jbh5G0FsV8rwYx2hnEzPkA@mail.gmail.com>
 <20200709080458.GO3278063@phenom.ffwll.local>
In-Reply-To: <20200709080458.GO3278063@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 9 Jul 2020 13:11:12 +0100
Message-ID: <CAPj87rPtD04099=sBzL2jKN6NNFNnM-hH3qfOLL10nPoF==VbA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/25] dma-buf.rst: Document why idenfinite
 fences are a bad idea
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Jul 2020 at 09:05, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Jul 09, 2020 at 08:36:43AM +0100, Daniel Stone wrote:
> > On Tue, 7 Jul 2020 at 21:13, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > Comes up every few years, gets somewhat tedious to discuss, let's
> > > write this down once and for all.
> >
> > Thanks for writing this up! I wonder if any of the notes from my reply
> > to the previous-version thread would be helpful to more explicitly
> > encode the carrot of dma-fence's positive guarantees, rather than just
> > the stick of 'don't do this'. ;) Either way, this is:
>
> I think the carrot should go into the intro section for dma-fence, this
> section here is very much just the "don't do this" part. The previous
> patches have an attempt at encoding this a bit, maybe see whether there's
> a place for your reply (or parts of it) to fit?

Sounds good to me.

> > Acked-by: Daniel Stone <daniels@collabora.com>
> >
> > > What I'm not sure about is whether the text should be more explicit in
> > > flat out mandating the amdkfd eviction fences for long running compute
> > > workloads or workloads where userspace fencing is allowed.
> >
> > ... or whether we just say that you can never use dma-fence in
> > conjunction with userptr.
>
> Uh userptr is entirely different thing. That one is ok. It's userpsace
> fences or gpu futexes or future fences or whatever we want to call them.
> Or is there some other confusion here?.

I mean generating a dma_fence from a batch which will try to page in
userptr. Given that userptr could be backed by absolutely anything at
all, it doesn't seem smart to allow fences to rely on a pointer to an
mmap'ed NFS file. So it seems like batches should be mutually
exclusive between arbitrary SVM userptr and generating a dma-fence?

Speaking of entirely different things ... the virtio-gpu bit really
doesn't belong in this patch.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
