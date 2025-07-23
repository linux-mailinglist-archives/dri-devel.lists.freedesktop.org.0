Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22AB0E958
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 05:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1223810E098;
	Wed, 23 Jul 2025 03:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="iSAETgyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E7010E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:51:46 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-748e378ba4fso7245725b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 20:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1753242706; x=1753847506; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r0yhqhfmgcWd4Boy+yEMxc9KNWgoVjI2gD67+Le01vg=;
 b=iSAETgypmrizabcldGMRXIuOKBbJEAgGEcK5gh/3qHa4ZBW4y6nIOy0yjG6eJCa9NO
 7ASj8XuKGnE5ZRzLB9Sbzs3+65tE54J9bWZHa6FCf+QyLbYQihDtFhpWY4aqus/hmdVu
 bpvAcsC7YYzok4xPRvN0r9pMQJ+wMp1XWgkMQrjyDQySpPWzZ6+0aNJId4xjCE/E+cpN
 lzNLLKp8Z9OZUDaA4vdN0CbgCsqqWWleS2tjHvUJCtCjVB2SSMWm2jou+6i2nFzC+BYT
 AnsgOdl56R+46UZ2XaUN4Ud35wtk1gMwLZKIf/2wNwx1SwzmNyWVTS4JxqMkIZQYhauB
 CBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753242706; x=1753847506;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0yhqhfmgcWd4Boy+yEMxc9KNWgoVjI2gD67+Le01vg=;
 b=VrZuHc2CB2EZA+mJnS1oEeue6pmnV7M8RYhAkoECkJYD1O0jD9PY5IQrLiDnUHxlSm
 FBNu1wJ1Xuiq/oN65V3GM/oQ0lekeTL2B7S32Y+iZqqr1EU1TTiVzPcxv5H4PVlNoczl
 vuAbfG7hfxfhBHH0w22yzd4U7FXMjPEYhVMUvbCmOYncA1v4EMSFZ8CVEfDK0bpGF7l1
 Xy/nmKL2LiXJlm8Cbfb58s2rd4NlL/0MAEygu0xiwUjAAi76khVQJEkikOUBXbjlzB0g
 Arek7Prf2Q4vy5BhsOsXOjJpAP0dK551aXHU4Mh8CncPtTqyC0ptoujCac0fKoiUTLtr
 6tPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp/nVortrDw77N2RugFrkFPQAjZo4WkMFaONSEo05Kw+r+VBIZBzYYh7/TNvt2U2CLq89RFNNeAko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMAgFH7KeN7dB7cxLpm83F/TEgYkog+txIj/HlsOUIF9N93Aa1
 gIcQqesb02ysw9jyMAVIHbAM2m0UdipzahKz844hzXHx/e57g6BzwhnVCB5jfpF69gA=
X-Gm-Gg: ASbGncsp0XK8V1gtQZwDvgpoR8URnmx412WbDPEzInOagszLNxbW5ZNEj5OSmY7uICa
 lyTm90BRWAHvdTEl3uUcU1DqXSfHp0onF2/6feX4R+Ph6v+7fv4Tli522DXSw5hSUesXf9ReRw+
 BlXhztPfNCqMwNKxGc6D05pK1jYuiwXWDY0bt2cUBZysIcbizm+FFt2JEITHNxW8SikNieU60Yu
 Bs7F1thrqpdSKAkKJBpfLaPmWS7QfwfG6A0jPeXSMY6TvUh/wPt2h8KFiQiXk9cTIdf4ukbSfib
 4r5jch9r0R7Bt9xJEoF2WPv8KyEhiAAvdUq/RG32dYbHChkNMzF9OWxMhWQGDbwBiMfCS0YGp7+
 GEcxGSHyFwT6mQ8joVcusLO4AuBMDrO5aDQI=
X-Google-Smtp-Source: AGHT+IFhuc9YoswnVjbx+w6CW5AJc04rjosHA7fJ9MRqxxtRH8l6eukiOU6gxLlrv7CiSglvAulz8g==
X-Received: by 2002:a05:6a00:1491:b0:748:f406:b09 with SMTP id
 d2e1a72fcca58-760367de539mr2440550b3a.23.1753242705935; 
 Tue, 22 Jul 2025 20:51:45 -0700 (PDT)
Received: from ziepe.ca (S010670037e345dea.cg.shawcable.net. [68.146.128.183])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d3190sm8518497b3a.39.2025.07.22.20.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 20:51:43 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ueQW6-0003Fi-CT;
 Wed, 23 Jul 2025 00:51:42 -0300
Date: Wed, 23 Jul 2025 00:51:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <aIBcTpC9Te7YIe4J@ziepe.ca>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org>
 <20250718144442.GG2206214@ziepe.ca>
 <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
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

On Tue, Jul 22, 2025 at 10:49:10AM +1000, Alistair Popple wrote:
> > So what is it?
> 
> IMHO a hack, because obviously we shouldn't require real physical addresses for
> something the CPU can't actually address anyway and this causes real
> problems

IMHO what DEVICE PRIVATE really boils down to is a way to have swap
entries that point to some kind of opaque driver managed memory.

We have alot of assumptions all over about pfn/phys to page
relationships so anything that has a struct page also has to come with
a fake PFN today..

> (eg. it doesn't actually work on anything other than x86_64). There's no reason
> the "PFN" we store in device-private entries couldn't instead just be an index
> into some data structure holding pointers to the struct pages. So instead of
> using pfn_to_page()/page_to_pfn() we would use device_private_index_to_page()
> and page_to_device_private_index().

It could work, but any of the pfn conversions would have to be tracked
down.. Could be troublesome.

Jason
