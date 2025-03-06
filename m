Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD558A54FA0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7F210E9DB;
	Thu,  6 Mar 2025 15:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="bSBiMXog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC2610E9DB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 15:52:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43bcb1a9890so14111485e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 07:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741276332; x=1741881132; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=65Y7a4qK+Y/6ES6G6BlQKGj/GPIU9m2PJUgZAs9+KOM=;
 b=bSBiMXogLY+36NHPvg1TcKFR9Z2sya7MaP6szEYblKVQh3+Md6xLCYXPzIwqhpYmi5
 NUwSmmQyntOzgkG9fKlkxh+RPM+s7Vu5WkYf3nf9D9c7p9P2J+m5jamB5D1bdbEbI3sL
 MwfmHcleAo6eysvGfwBaaRt7a4eWVmLG0yYg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741276332; x=1741881132;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=65Y7a4qK+Y/6ES6G6BlQKGj/GPIU9m2PJUgZAs9+KOM=;
 b=EupOTAiJq3t7VJ7iBmA5y+tyjp23AHKtLS8rjOGV5WFoPRUUl1fxOsWP1YDfWY9jza
 19c5PohYTrBGkm0536BKlGCdYj6DWgG5zCIt8tPZRLoEFPOz0JStedHA7zZUfwfSXzWH
 JmXtwiC0WrpczEAV5cCYAWb5gUw8Zxkic0SN/2XEZAVL/QOYW4JmsTqS5SAdsH/5yoOr
 JM0r6kd7gXMVSA8DBcl73oY5dDETE263H526LP1tDG71RotnGH3hnx57Gm940bNrBEyy
 PBa2N43xSDieiGdGBgzlmXzlxY9peNDv6Zc0ssN+WFXQUWbyIOOzE/ackvpUFB8dLFLN
 u1uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5EgoYZ0Pbh+BD/aLmO0XJdQiN0KuQM2g4jFsHGCLok6AWUPaEi22Heew4pGAlGEZLRoBfcDb+X2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7mDGJ3fqHFNBpRPKUF9do7TPbk3djdm5GtHj6IJGohVC+Lqve
 BMJq0K4Ido0S2FgyukOzmrFjFNioPwixFQHjHey3oU5YDjwcHJfOqhtQUYxaY64=
X-Gm-Gg: ASbGnctCzaW8hb07ys2qIPhcYDh3F1dHJ+nCkK796Xo/4mJgEQKQcXt3z7GHlwbT35D
 7AZZwau1UlCbiZPDxOTSCNq2adbHngtX3dsl946gGfdZ+G3dIaZSUneABT32IsXfvQAKfkv+Smn
 A/m5uK0hFwlAJBWqIls1sl4lSI+AU2Dp7XazhSgJMCJbCSHy790SLPIznjX2iO87I9EC9I4nOrz
 eOIzfe6x+LohGjcoS0bDTsEvONEQVsFdtZNDwhJwxJK2QIM/zBkn9vor1QflrLCE359aQQjfYkL
 4+3EgO3LhtgX/tK+YnpTDalUap34+QVRw7JObyE7RTLaLClFXFaN67FJ
X-Google-Smtp-Source: AGHT+IHeuGIWVWKb5j99SUKnlkK36tGpar1+KKK0aAa1IuGT6GpOgqR53OExqVvUKbkpEbvf2dKyFQ==
X-Received: by 2002:a05:600c:3b17:b0:43b:c857:e9d7 with SMTP id
 5b1f17b1804b1-43c5a6014b5mr36395e9.5.1741276332172; 
 Thu, 06 Mar 2025 07:52:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bcc135676sm65178565e9.1.2025.03.06.07.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 07:52:10 -0800 (PST)
Date: Thu, 6 Mar 2025 16:52:08 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 dmitry.osipenko@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-mm@kvack.org
Subject: Re: [PATCH drm-next 1/2] vmalloc: Add atomic_vmap
Message-ID: <Z8nEqDQhjU-Ly8Js@phenom.ffwll.local>
Mail-Followup-To: Jocelyn Falempe <jfalempe@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 dmitry.osipenko@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-mm@kvack.org
References: <20250305152555.318159-1-ryasuoka@redhat.com>
 <20250305152555.318159-2-ryasuoka@redhat.com>
 <Z8kp9Z9VgTpQmV9d@casper.infradead.org>
 <3bfd4238-6954-41a3-a5a3-8515a3ac9dce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bfd4238-6954-41a3-a5a3-8515a3ac9dce@redhat.com>
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

On Thu, Mar 06, 2025 at 02:24:51PM +0100, Jocelyn Falempe wrote:
> On 06/03/2025 05:52, Matthew Wilcox wrote:
> > On Thu, Mar 06, 2025 at 12:25:53AM +0900, Ryosuke Yasuoka wrote:
> > > Some drivers can use vmap in drm_panic, however, vmap is sleepable and
> > > takes locks. Since drm_panic will vmap in panic handler, atomic_vmap
> > > requests pages with GFP_ATOMIC and maps KVA without locks and sleep.
> > 
> > In addition to the implicit GFP_KERNEL allocations Vlad mentioned, how
> > is this supposed to work?
> > 
> > > +	vn = addr_to_node(va->va_start);
> > > +
> > > +	insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
> > 
> > If someone else is holding the vn->busy.lock because they're modifying the
> > busy tree, you'll corrupt the tree.  You can't just say "I can't take a
> > lock here, so I won't bother".  You need to figure out how to do something
> > safe without taking the lock.  For example, you could preallocate the
> > page tables and reserve a vmap area when the driver loads that would
> > then be usable for the panic situation.  I don't know that we have APIs
> > to let you do that today, but it's something that could be added.
> > 
> Regarding the lock, it should be possible to use the trylock() variant, and
> fail if the lock is already taken. (In the panic handler, only 1 CPU remain
> active, so it's unlikely the lock would be released anyway).
> 
> If we need to pre-allocate the page table and reserve the vmap area, maybe
> it would be easier to just always vmap() the primary framebuffer, so it can
> be used in the panic handler?

Yeah I really don't like the idea of creating some really brittle one-off
core mm code just so we don't have to vmap a buffer unconditionally. I
think even better would be if drm_panic can cope with non-linear buffers,
it's entirely fine if the drawing function absolutely crawls and sets each
individual byte ...

The only thing you're allowed to do in panic is try_lock on a raw spinlock
(plus some really scare lockless tricks), imposing that on core mm sounds
like a non-starter to me.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
