Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2ECA22DC5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0EA10E969;
	Thu, 30 Jan 2025 13:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="gELzBhjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FE310E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:29:25 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so9201275e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 05:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738243764; x=1738848564; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CwN17MyPFKvtC6C01wmuj8jHUuL8qlluAzeR7k1VHs=;
 b=gELzBhjP5rj9u0V3C3KxvU1RPhE1C3tEK4B5kyz4ACcUljKWwZuFhPZZCPQLF1HiP0
 kWJM6i9nqdm4t5qoLsplKzNKMe9DMJZjYbkfj7r+N18RbSp6UBNpcQKqNz+5anBiCGxl
 yUGtdjXq0LWYngu0zIEFcFCeRp3AyWo37fKMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738243764; x=1738848564;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6CwN17MyPFKvtC6C01wmuj8jHUuL8qlluAzeR7k1VHs=;
 b=wAa7eUfctVhFmauXr4L9BIlCR7dnFgBCoeEntSqhkmvBPixMiStLnUGDQXCP+h9xdV
 tcvGP+WbPHcY/vFBZJLa/sgQw+VyOVDjECg0C3sEXcCTsu557KKRDtFv3rVpRMobCuDt
 wTNhLzBwrUK0lIcX6yR6/UnoivhWBkbYVxAtClR2Tkm4bdJ7pj5NSoiWAPG85yk6hd6x
 RN+vWLWAwAwd6U2D3DRLLDekr2hdeBqgCvzPxbTgTbKT4308DASGtx7tdGyGw7Xt7mGk
 9Yk2ZYb7zJFOjxM8gzv4KTTeL5lAEhD3rL1POB4NxeuifjdPANWkiF/efy1jjGSu1nJJ
 cUAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKiAUQDTkpwRwSvxvhTbY98W3St6RqxPXD8UbQtL0GVYOWy5f9hOw/Fwzgq4AEMQ/5U7QxZg3ibNg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFyZw6Nlo11nsD9Uo67MkdI3SKyA2EkLg3ouNRcaEWURLPOab9
 CTnS2FbauI8D6zi5QwjdQ8IPu+sXs1EoF5CzeW3t/OW2l9VYiUCGYm1MM8twp4U=
X-Gm-Gg: ASbGncuo11iMG8sGAHffyY9UWdisgrQ2djt3hSQfkBPNCG5KhYPF95p3Ldo6TnJ02Kx
 q6vbTEiN/kL00oHi0EO0G6qBqdGndo54yJYl63dCMWL+LKbvG8ON2kv0q4j110NyOSlU7bHSfBF
 rm2A4GgYiqjAeozyC5/y/i8khElhiANr1ZiZqQyFeaj07IqrX7PGMFv91MByWL7Yq5u4ZhH34TR
 dTXGSCBGKvEDAt1+gF8xWvzbVybJ4Oq/1UndlgK4uHTI8cwFmn3yWM8vVNv6DyCN++H4vNLClSX
 Se0mexf6X5TnqVJzhbNJW37Pt8M=
X-Google-Smtp-Source: AGHT+IHdrFYxzPnGyvPL9diVxB5aO5ood/KWzCJUp9hx1GIy5lqLPzKFdL5gi+Wc6C+yM8JgD/EQ9Q==
X-Received: by 2002:a05:6000:2ce:b0:38c:3eab:2e13 with SMTP id
 ffacd0b85a97d-38c52093f22mr6600046f8f.46.1738243764347; 
 Thu, 30 Jan 2025 05:29:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c13a0efsm2028563f8f.60.2025.01.30.05.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 05:29:23 -0800 (PST)
Date: Thu, 30 Jan 2025 14:29:20 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 2/4] mm/mmu_notifier: drop owner from
 MMU_NOTIFY_EXCLUSIVE
Message-ID: <Z5t-sFymrz5kFafV@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-3-david@redhat.com>
 <h4dnoixvp2kjeao6mzcpze4zx6t34ebpltqadkjl5zxcjhddkf@lbzo2yhzu5sz>
 <eab05949-efc8-4c04-ace1-b4435ec894e6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eab05949-efc8-4c04-ace1-b4435ec894e6@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Jan 30, 2025 at 10:28:00AM +0100, David Hildenbrand wrote:
> On 30.01.25 06:34, Alistair Popple wrote:
> > Looking at hmm_test I see that doesn't use the sequence counter to ensure
> > the PTE remains valid whilst it is mapped. I think that is probably wrong, so
> > apologies if that lead you astray.
> 
> Yes, the hmm_test does not completely follow the same model the nouveau
> implementation does; so it might not be completely correct.

But unrelated but just crossed my mind:

I guess another crucial difference is that the hw (probably, not sure)
will restart the fault if we don't repair it to its liking. So the
hmm-test does need some kind of retry loop too somewhere to match that.
But might be good to also still land some of the other improvements
discussed in these threads to make make_device_exclusive a bit more
reliable instead of relying on busy-looping throug the hw fault handler
for everything.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
