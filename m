Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4413C3992CE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795E889191;
	Wed,  2 Jun 2021 18:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168AB6EDF0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:48:19 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h8so3287867wrz.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=F6gQcd+qTlqkWsY+lbSteha4KL5f4gwPP7np80DTFoM=;
 b=a2AMHAHVEgwldzVWOsLdVU8+7pWgoeA5TfGfYuxBH6gnFq21+FBx5zpp1pyTxd1hjW
 gHApIJ6698FmTld1K/VddKsBfoM34bbHUnH+Os874ltp/TiDqp77g71pL4D3M5gLESMf
 ym+CgwDwSk7NjOQhEaw2s64oH/8+XfsWIaq4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=F6gQcd+qTlqkWsY+lbSteha4KL5f4gwPP7np80DTFoM=;
 b=LzY7VwWfLpV00s+f7TDbsHO1ifka1/lbZ4+jlxQ5Xf1lrwn2Kxpew7G/A9tdSSapLR
 bR9mv8xpRzrUmGGjDw3zqop6WNUxjnvtvZhcTqmkt0BRvUbz1sIYnsAKqLMSAkzmL5Z2
 jDQhxIcTkRenKvSAkzdjMLQZRJWVS1jheGrQU3z8NUBQIBweVIrARXR95stt4BfP3OUZ
 lTDqAh0IIns8seY8Px4cIplseFnYugkskNI+lxa1TA6kRIQ24a/PPNABOo6IQ33Nk18t
 iGwJf646NF7vngwTQrcLA3wiEUVPKSarGm0Eiq9fCOGqRooMEKa1DiJ/bgyL4dF+sldn
 Tk8g==
X-Gm-Message-State: AOAM531R5bIerk3wxkpaG9iMA1/SgdQPetzjivewPpIeuB5mAjsZS5p5
 v9FW5oNoQQ2N5tDofrNJ1jQTHFAKKIT/sg==
X-Google-Smtp-Source: ABdhPJw3gNEdfSaLqE/zhUnrAKIkqn6LMsfMyTRpzEOjRHdOTEIyyyqM2ebNHNDmzJnMNixHHj5/QQ==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr34375943wrp.172.1622659697809; 
 Wed, 02 Jun 2021 11:48:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s1sm3562332wmj.8.2021.06.02.11.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:48:17 -0700 (PDT)
Date: Wed, 2 Jun 2021 20:48:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
Message-ID: <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Olšák wrote:
> On Wed, Jun 2, 2021 at 5:34 AM Marek Olšák <maraeo@gmail.com> wrote:
> 
> > Yes, we can't break anything because we don't want to complicate things
> > for us. It's pretty much all NAK'd already. We are trying to gather more
> > knowledge and then make better decisions.
> >
> > The idea we are considering is that we'll expose memory-based sync objects
> > to userspace for read only, and the kernel or hw will strictly control the
> > memory writes to those sync objects. The hole in that idea is that
> > userspace can decide not to signal a job, so even if userspace can't
> > overwrite memory-based sync object states arbitrarily, it can still decide
> > not to signal them, and then a future fence is born.
> >
> 
> This would actually be treated as a GPU hang caused by that context, so it
> should be fine.

This is practically what I proposed already, except your not doing it with
dma_fence. And on the memory fence side this also doesn't actually give
what you want for that compute model.

This seems like a bit a worst of both worlds approach to me? Tons of work
in the kernel to hide these not-dma_fence-but-almost, and still pain to
actually drive the hardware like it should be for compute or direct
display.

Also maybe I've missed it, but I didn't see any replies to my suggestion
how to fake the entire dma_fence stuff on top of new hw. Would be
interesting to know what doesn't work there instead of amd folks going of
into internal again and then coming back with another rfc from out of
nowhere :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
