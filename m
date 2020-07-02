Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C8212468
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 15:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9A76E98D;
	Thu,  2 Jul 2020 13:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7726E98D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 13:18:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a6so20494778wmm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cuvm4PH9ymZejClh9/IRJruxX3XybrluMfPe5pcP0ik=;
 b=eGu8Bzdjv2Xqb78qCTzwgtJgVA38HsDO3DGT9ZmJH3Q+H8c4RcNNutL98+WSuTQbu9
 KEsOqEyXvy5AJTLhH7zsr6WVXJ/2xkTTcxjU/AKDadOCUJ+MfKid0+RVbgqG9/2wBZ0l
 4Cy9lOPEBPLmQ33W40GnOmEgKAZ8Mt8Y5cXII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Cuvm4PH9ymZejClh9/IRJruxX3XybrluMfPe5pcP0ik=;
 b=qy+3EjlnvblEnKjRhoT2fzZFT8kiEODQLcL/xVJFfalvM0dY4bZrXdFL1uj/81rZRU
 R/fsAb7+FEPsQQ9wCx6OKS3KTDTgMYDiTgx9kng+Jmb1bBpILTdA8h7F64kHT8zE3n29
 pJaHXNkkH1XODp90NFU0WNdNZrEIPgSko654sr4nd/h+1vr8kf+KonfHQv6LyNcGbGMg
 WNSP4dv8OuAbh+sVc2myOMFu7eVivDKwcxtl0vlw+QyDFTeQ3pIfWTJAHWt421Dw0sm3
 uBGKPeeOBkXcikbjwcMujyLx33XBLiORMwqqF6+cGJC6wZZ1u58pEDbRzvpmcvAPqqNe
 I5Ng==
X-Gm-Message-State: AOAM5300PHgk89y4HjHANgmRsx6NU8sg4gqGekAEM15Nn1w54DxJGmIh
 8STfoaIn6vnHL41VkQ1eWy0zpA==
X-Google-Smtp-Source: ABdhPJws7m0llQgCQ3WJpZXwOAgYwXtJKDNub/jxlHaBemJ1pVcESAzqOIr1Y2qhVoHzQpn8e5986g==
X-Received: by 2002:a1c:2183:: with SMTP id h125mr33648435wmh.83.1593695917752; 
 Thu, 02 Jul 2020 06:18:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v5sm10646766wre.87.2020.07.02.06.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 06:18:36 -0700 (PDT)
Date: Thu, 2 Jul 2020 15:18:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v8 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <20200702131834.GZ3278063@phenom.ffwll.local>
Mail-Followup-To: Simon Ser <contact@emersion.fr>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
 <20200702074759.32356-2-narmstrong@baylibre.com>
 <8cBfZpkc4pHBLhihlvJMD_Hq1DEsNRcSY4Y8JaGwklMWcxiYzUMVEx7wH9f_DuCBMVUhXvOR0PcHVslILtKI2wdw79Nfih0N3VnrxfMQd08=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cBfZpkc4pHBLhihlvJMD_Hq1DEsNRcSY4Y8JaGwklMWcxiYzUMVEx7wH9f_DuCBMVUhXvOR0PcHVslILtKI2wdw79Nfih0N3VnrxfMQd08=@emersion.fr>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 02, 2020 at 09:23:11AM +0000, Simon Ser wrote:
> On Thursday, July 2, 2020 9:47 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
> > Finally is also adds the Scatter Memory layout, meaning the header contains IOMMU
> > references to the compressed frames content to optimize memory access
> > and layout.
> >
> > In this mode, only the header memory address is needed, thus the content
> > memory organization is tied to the current producer execution and cannot
> > be saved/dumped neither transferrable between Amlogic SoCs supporting this
> > modifier.
> 
> Still not sure how to handle this one, since this breaks fundamental
> assumptions about modifiers.

I wonder whether we should require special allocations for these, and then
just outright reject mmap on these buffers. mmap on dma-buf isn't a
required feature.

That would make sure that userspace cannot look at them.

Also I'm kinda suspecting that there's not unlimited amounts of this magic
invisible storage available anyway.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
