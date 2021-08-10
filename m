Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BDC3E5A18
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 14:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E91A89E39;
	Tue, 10 Aug 2021 12:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FE989E39
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 12:39:29 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 y14-20020a4acb8e0000b029028595df5518so4682764ooq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ww4lecu94JFzIEYqvV9wG7CxGy+w0GGJNoOyQcE+rlc=;
 b=ffiSBfSdQpFtWh7sQOjXNBnszBrgvX6rNORPzYxTX+tvrunJaBXxCrum0ZMT5f9l2k
 zyqH+vsUOSNGCL17xPZRTerBTSJYWxCte6Roaedn0wbufD49iFAARtF040ezK7Zgr3iy
 3h8MgKpfFJ+t2iFewQj98iYZOtPAn8i01ALs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ww4lecu94JFzIEYqvV9wG7CxGy+w0GGJNoOyQcE+rlc=;
 b=Av9EZXRxHRjN1VJNBXve91jHfDR02vDZV+/R2t9y/tz+zpiAwbIJJvgbXxoRM6G+8t
 VnqRHMZ+in12sC7gZii3bVkrTtzE8nmxY+blarbb3qahki/IhQP0e2K9wZr6mxDZxQzz
 FTGBzYaDE56kEBt5G6NM45QVh8VyVKZu3tQxqYnIl39nrYiRbgD+CGOromkG18GI99y1
 9x7PoinEwlNCH0IRVLZvgeR6cQhMxU4dmC6cSGaAUxcOTKT0mX8Qow5JHYDPKHZr4wVL
 M7rZk1Qil255GY6TImd5Rk4yq+kdf4RbffQQu1C9kXXCFy/h8Z46icjkgbR0lS0bp5Af
 SDIw==
X-Gm-Message-State: AOAM533ViK5jvYO8ItIFZkNfWe3l1ktg/5g/J7MAIgYX9xJAFey8f6Hq
 WhIsZKfX2b4djNkhvDfKbwqrNGyEkbj3hdHA6OphtXCJIgY=
X-Google-Smtp-Source: ABdhPJzkbH9UZquu28KHT62dWS3UnyJcbbKQgX0h6vB//foTcVEs6gPGNyoiQPrtmrJTNpUd49l4Pb/NsVxqVCikPIY=
X-Received: by 2002:a4a:b402:: with SMTP id y2mr16540156oon.89.1628599168467; 
 Tue, 10 Aug 2021 05:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210603193242.1ce99344@canb.auug.org.au>
 <20210708122048.534c1c4d@canb.auug.org.au>
 <20210810192636.625220ae@canb.auug.org.au>
 <YRJRju/zo5YiF1EB@phenom.ffwll.local>
 <20210810203859.128649fc@canb.auug.org.au>
 <YRJaD51xR8rQ2ga+@phenom.ffwll.local>
 <20210810210129.03b3fba5@canb.auug.org.au>
In-Reply-To: <20210810210129.03b3fba5@canb.auug.org.au>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 10 Aug 2021 14:39:17 +0200
Message-ID: <CAKMK7uHyUbc5StULAgawYZUtZqyYxfud5CMh3MaGJ5KS0FeXRQ@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 10, 2021 at 1:01 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Daniel,
>
> On Tue, 10 Aug 2021 12:50:55 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Uh that's not good, I missed that. I'll look into it.
>
> Thanks.

Doc build is taking absolutely forever here, but I think I have the
right patch for you. t-b/ack would be great if you can give it a spin,
I cc'ed you.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
