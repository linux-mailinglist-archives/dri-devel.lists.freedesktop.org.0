Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99F0A1A6A9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D940D10E0A5;
	Thu, 23 Jan 2025 15:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KWdCV3WM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417E110E206
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 15:08:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so11244305e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 07:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737644899; x=1738249699; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vnvF918MExGqpW1JhPiFqDMhjdc3YrQOLeaZRhdmR1k=;
 b=KWdCV3WMC9xRLdi20guqKEi05oRWqnEo0mfpK4wPHRhLlTZlrsNnlk6z+dxY0kMnNc
 0nHZf//t8NNp5Tg5rw/12Or5TqxPV6khTHfS52JbrwUJrLhMdvDOlDyM2+uEFhOtzMr/
 dWo5A1hpEU0y2s5IdWMTIRe7hb4LW5GLBP1yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737644899; x=1738249699;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vnvF918MExGqpW1JhPiFqDMhjdc3YrQOLeaZRhdmR1k=;
 b=l1BZ035YkCXu8OVIzAP87nDzHPF0HUUQDTYFKec6sNmNHg5JowmcSp1mb2tt3AKbeL
 JgXi/8j+EHT2paNNVpR3uUY3BVQ+O+6u++EYbiYVWT87sZq3vyE+DrrcAUO93W4t1gR6
 feSW2vKwiJCYiA5CoxZnKjggT8aos0noosHpIveWRWQEDWz5QF1k9/bM/kidmnFDE1CW
 xOl9GuUPkFLh/Sf5lnGI6ye6TP1L7Mmpt1/To8n3hbKLidvgX15LTyYHDMOzMTgpEybT
 fqINm38cqLTYkKeT42rGZMKKjnkxWtJB5JPBxs5PWR/07EyUVhWQqRYMSPL0eTzOTXYg
 LuLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSET6y4hiAP6glvwdRWIpLPTMc4p+rP2SF+WIi9Jy5UYyEM5irlMKhm1FMu3WjMxkD+brKqx7sxPw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy83Cy1UMleGvAYT/zTEjtpoGjA0SrU6gJRVSFF/sNb6N01r5ux
 3AV1LR+Fhs0a67UbvsSimnv4CBU/OSxTt/0y7KN9yyXXthQ+G6IH1fGi6MIFqDQ=
X-Gm-Gg: ASbGncsasyD0hgsZ+VGTxml6yAcJn+IBzUMrdqw9005hP285CGUld30vK2DcZLYl7ad
 hSjDvJHXgsalEQlHf9GQayYI+5/jzNkTugClxBbW1oKZSi1prE1qnKSZCTuZH87tA/LtkvK8ju2
 JF/FOLR0eYMnxRpnRcFkh6MpEomAqlS/iUQUGzIOKoArnnVaLfOymWhsN6aeEFBzmsMBqz8Zj8f
 AUUiAyq/zrHF4WjPwqgbd7mO6+ukM0iHdXi6Uc4r9D6isQJzKAgKawnMSOk+SnGdIgXbSp0pjg1
 JEYqQ2vTqcI4Gs8l
X-Google-Smtp-Source: AGHT+IFe5bvrufD5E2WCU0xgHozwkEfe52bL8rsuxcBOdIdAdnpMPzPUDgbaIWl03oauCdgHt4m7yA==
X-Received: by 2002:a05:600c:4e06:b0:434:fddf:5c0c with SMTP id
 5b1f17b1804b1-438913c60e1mr250217565e9.4.1737644898467; 
 Thu, 23 Jan 2025 07:08:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31ae155sm64915825e9.20.2025.01.23.07.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 07:08:18 -0800 (PST)
Date: Thu, 23 Jan 2025 16:08:16 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM
 atomics in Nouveau" still getting used in practice?
Message-ID: <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Jan 23, 2025 at 11:20:37AM +0100, David Hildenbrand wrote:
> Hi,
> 
> I keep finding issues in our implementation of "device exclusive non-swap
> entries", and the way it messes with mapcounts is disgusting.
> 
> As a reminder, what we do here is to replace a PTE pointing to an anonymous
> page by a "device exclusive non-swap entry".
> 
> As long as the original PTE is in place, the only CPU can access it, as soon
> as the "device exclusive non-swap entry" is in place, only the device can
> access it. Conversion back and forth is triggered by CPU / device faults.
> 
> I have fixes/reworks/simplifications for most things, but as there is only a
> "real" single user in-tree of make_device_exclusive():
> 
> 	drivers/gpu/drm/nouveau/nouveau_svm.c
> 
> to "support SVM atomics in Nouveau [1]"
> 
> naturally I am wondering: is this still a thing on actual hardware, or is it
> already stale on recent hardware and not really required anymore?
> 
> 
> [1] https://lore.kernel.org/linux-kernel//6621654.gmDyfcmpjF@nvdebian/T/

As long as you don't have a coherent interconnect it's needed. On intel
discrete device atomics require device memory, so they need full hmm
migration (and hence wont use this function even once we land intel gpu
svm code in upstream). On integrated the gpu is tied into the coherency
fabric, so there it's not needed.

I think the more fundamental question with both this function here and
with forced migration to device memory is that there's no guarantee it
will work out. At least that's my understanding. And for this gpu device
atomics without coherent interconnect idea to work, we'd need to be able
to guarantee that we can make any page device exclusive. So from my side I
have some pretty big question marks on this entire thing overall.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
