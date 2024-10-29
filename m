Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EDE9B53F2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 21:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E13310E6FA;
	Tue, 29 Oct 2024 20:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="z4r5ifv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F21510E6FA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 20:38:40 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6cbcc2bd800so2465676d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 13:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1730234319; x=1730839119;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UHhE7+FsFDchxD8LtVUn2ccYddeUr5QRSaFaIZpCbLM=;
 b=z4r5ifv+uETYA9Xxzbl8zdRMZajrKOhGx6mYqdlwIbRGXyNmG9xfdycMhyZNtZLJ5A
 X103fuRQ7dasM1ODoLVEcwq7uxh0MFqPFyFIkHDXECF1cfvpYwzh3S5AXcYuGuwtujAf
 yofGis3bkKtFQPjf26uPTNFKo4Ob6mUqD/if1ezr7ZdRjUbWiKOejV9gKBttpQ5O9npm
 ATLYucdg0X2xpYfzbLBkPD1pG4Ei5x6L26ehygJAuZb8z71eoP+WAOH0rEnDS1Zqx68e
 uNu1dvPaQHKpS8CAZ2FaMsEVpWOVg/GZauYA2xGoosCdnk4tUjwjNGfYB/Y150hKYiWG
 sAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730234319; x=1730839119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHhE7+FsFDchxD8LtVUn2ccYddeUr5QRSaFaIZpCbLM=;
 b=H99+vlEjCWZwCA0+viNt90wROj5ssy1BU7CmE0z0riKBDgdEqfobfo+fWrSPsk48O2
 N0rT32iadwEaUYjnIZE1+c7cea6ekdxpw6GkA+qreSH6pA5nwwe92d763dHixN7zWYjY
 kUDXh4kx0OS5ii6SQTC2l2funTpiBrSFt5y/AymZxu36mm+9k71WaXxdVLQP37ATSOPO
 upAsDO802JicLcjntZZqT0e68lg5/wyiO0drHj/DtQ4t55EbU9bNvTq3MWnW3oQl6P5G
 9V0QuHsT6g9MKl8i8ai4bi2+F9LgX95NscM+DouaXiSZ1Ut+mkGj1B3KA2QIXA27Rugq
 DTeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcv+Aly/23GaSruaoemCDHcwX03MhG95uvViNJP8yBTKrvmY06T5RymFSaCrsSWJ0GdUmGZV++qA4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpDT1BB+tBVKuK0oOA8Ovyw+1cXTFOYmTWBZDfqGl1SNogXLnU
 oHBzlE8vPjDhjHEnAqdTbrB9CN9XBKwbm+4/XOrGcTIf/pWVmANHBzWVmZz+ASU=
X-Google-Smtp-Source: AGHT+IGIGf+fLyqvRxEZUSRr0al4OL6PJFH2Lr2FvVUL+VpF7BsP3nR5JjnLPEDC4jbvktWXK39Ngg==
X-Received: by 2002:a05:6214:5d8f:b0:6d1:7455:9b0d with SMTP id
 6a1803df08f44-6d2e7225ddcmr51294016d6.16.1730234319248; 
 Tue, 29 Oct 2024 13:38:39 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d1798a838fsm45773516d6.30.2024.10.29.13.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:38:38 -0700 (PDT)
Date: Tue, 29 Oct 2024 16:38:34 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Tejun Heo <tj@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zefan Li <lizefan.x@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 0/7] kernel/cgroups: Add "dev" memory accounting cgroup.
Message-ID: <20241029203834.GA636494@cmpxchg.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <ZxlRLMwkabTaOrjc@slm.duckdns.org>
 <20241024-beautiful-spaniel-of-youth-f75b61@houat>
 <Zxp-nLXOJXoSy8BN@slm.duckdns.org>
 <20241028-meaty-mega-nuthatch-3d74b1@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-meaty-mega-nuthatch-3d74b1@houat>
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

On Mon, Oct 28, 2024 at 11:05:48AM +0100, Maxime Ripard wrote:
> On Thu, Oct 24, 2024 at 07:06:36AM -1000, Tejun Heo wrote:
> > Hello,
> > 
> > On Thu, Oct 24, 2024 at 09:20:43AM +0200, Maxime Ripard wrote:
> > ...
> > > > Yeah, let's not use "dev" name for this. As Waiman pointed out, it conflicts
> > > > with the devices controller from cgroup1. While cgroup1 is mostly
> > > > deprecated, the same features are provided through BPF in systemd using the
> > > > same terminologies, so this is going to be really confusing.
> > > 
> > > Yeah, I agree. We switched to dev because we want to support more than
> > > just DRM, but all DMA-able memory. We have patches to support for v4l2
> > > and dma-buf heaps, so using the name DRM didn't feel great either.
> > > 
> > > Do you have a better name in mind? "device memory"? "dma memory"?
> > 
> > Maybe just dma (I think the term isn't used heavily anymore, so the word is
> > kinda open)? But, hopefully, others have better ideas.
> > 
> > > > What happened with Tvrtko's weighted implementation? I've seen many proposed
> > > > patchsets in this area but as far as I could see none could establish
> > > > consensus among GPU crowd and that's one of the reasons why nothing ever
> > > > landed. Is the aim of this patchset establishing such consensus?
> > > 
> > > Yeah, we have a consensus by now I think. Valve, Intel, Google, and Red
> > > Hat have been involved in that series and we all agree on the implementation.
> > 
> > That's great to hear.
> > 
> > > Tvrtko aims at a different feature set though: this one is about memory
> > > allocation limits, Tvrtko's about scheduling.
> > > 
> > > Scheduling doesn't make much sense for things outside of DRM (and even
> > > for a fraction of all DRM devices), and it's pretty much orthogonal. So
> > > i guess you can expect another series from Tvrtko, but I don't think
> > > they should be considered equivalent or dependent on each other.
> > 
> > Yeah, I get that this is about memory and that is about processing capacity,
> > so the plan is going for separate controllers for each? Or would it be
> > better to present both under the same controller interface? Even if they're
> > going to be separate controllers, we at least want to be aligned on how
> > devices and their configurations are presented in the two controllers.
> 
> It's still up in the air, I think.
> 
> My personal opinion is that there's only DRM (and accel) devices that
> really care about scheduling constraints anyway, so it wouldn't (have
> to) be as generic as this one.

If they represent different resources that aren't always controlled in
conjunction, it makes sense to me to have separate controllers as well.

Especially if a merged version would have separate control files for
each resource anyway (dev.region.*, dev.weight etc.)

> And if we would call it dma, then the naming becomes a bit weird since
> DMA doesn't have much to do with scheduling.
> 
> But I guess it's just another instance of the "naming is hard" problem :)

Yes it would be good to have something catchy, easy on the eyes, and
vaguely familiar. devcomp(ute), devproc, devcpu, devcycles all kind of
suck. drm and gpu seem too specific for a set that includes npus and
potentially other accelerators in the future.

I don't think we want to go full devspace & devtime, either, though.

How about dmem for this one, and dpu for the other one. For device
memory and device processing unit, respectively.
