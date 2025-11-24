Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEBFC7FA6C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 10:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DEE10E1F2;
	Mon, 24 Nov 2025 09:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xnT9u+/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C4710E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 09:31:42 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-429c95fdba8so1919201f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1763976701; x=1764581501;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tgq0F/GpwjDAB+nXr4KktACLDYM4+/4E/B2rlxoQ3II=;
 b=xnT9u+/a+7Vle02cDLOFsXwKHZ/4AYdrVz96Mz5vJVDaOSwmwoAO6MS2z1yki7N57c
 v4Bj+C4x/GFFTDvimgSsEDqyMX405W5v8kkmPgTDYQbTvsW5A4N2T3wThuHNy/ByVcmw
 N134ZgHlLlh/MndK33QQSiIYzDCwmpZSteM/YekOd3tZlWHMNbRAtmurv11qE7KZ5DIa
 J7tXSQ8MKN9VQ4IauiiSGycgu8ukgN8/9aj7K9eiBIVow7LCujSeCiE84z32Sm3HiA3Z
 qmP5+E0Efpxuiwn1x1nwlHC2vTV2kQlwNGVClw+twttIzX5q0prlgwkNfBOwPZfC5A6q
 19/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763976701; x=1764581501;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tgq0F/GpwjDAB+nXr4KktACLDYM4+/4E/B2rlxoQ3II=;
 b=CiOv/CmvL4VqlxwlWJMKb7QK3za0knoY8s85u7DVaCfQ0HjuVfwnAoSxADu3RieNv6
 NwjWvi/Vv/v77AUSdxjvk//E54cxUTWy8/reGRrabo6Ruq1gqTULmM3Wp1gRS3Vo+sGI
 mS8GfHAiKk4UTN2Yj+UWEtm6CjNv0UQ1xIdRmhhHCSkAa+oUAcBPdhgWUa5iwPMSiovL
 2hmbcs+O0U3HKO4drF13fJjtZUPZ+/vy9sy3lU02B7WLshgzHJp/lT6XKehEVH+8PbuK
 4S2PIMAn6wmMrz+XG+vaj4QpTUE8Ng8h6YVYouwzLFpr40wZb2O/UbNfmvtOvjsUNiZO
 RXtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlvAt2ZO2coVJDyzrhh/ivINltA8NX04LSKPI2nrAgBP7rrmdkcGAJuxzeqiUd0nCiehjE+BM2W3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYKQ5Xfem7MjjUO6cXfKluTJaQD/P8Wz6aLOzyAx2nh7w3EOL7
 P9WA5dfyD2ZDb6rY5J6AB+Vbur17Y5ZMqQX/o6xbiERRp5P0H0xIq7Ex6ukRz8PV1lmL9L4SOga
 lnoDfjVX1exVLhluCUw==
X-Google-Smtp-Source: AGHT+IHqNPkwGUM9B6wCxGEJJsVYSnMOs9NT9NJUIzBZveXimHTlZN8zmUWWB1Q2EDOpGMlfuU7W1c2020SnO1M=
X-Received: from wrof8.prod.google.com ([2002:adf:f588:0:b0:42b:2edb:9e83])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26cb:b0:42b:3ee9:4772 with SMTP id
 ffacd0b85a97d-42cc1d525b7mr11180670f8f.52.1763976700950; 
 Mon, 24 Nov 2025 01:31:40 -0800 (PST)
Date: Mon, 24 Nov 2025 09:31:39 +0000
In-Reply-To: <b8234f181d35b21a3319b95a54b21bdba11b8001.camel@redhat.com>
Mime-Version: 1.0
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-4-phasta@kernel.org>
 <b8234f181d35b21a3319b95a54b21bdba11b8001.camel@redhat.com>
Message-ID: <aSQl-83Ny3seL2XK@google.com>
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Alexandre Courbot <acourbot@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, 
 Peter Colberg <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Fri, Nov 21, 2025 at 06:03:22PM -0500, Lyude Paul wrote:
> I haven't gone through this fully yet. I meant to today, but I ended up
> needing way more time to explain some of my review comments w/r/t some
> ww_mutex bindings for rust then I was expecting. But I do already have some
> comments worth reading below:
> 
> On Tue, 2025-11-18 at 14:25 +0100, Philipp Stanner wrote:
> > 
> > +
> > +/// Container for driver data which the driver gets back in its callback once the fence gets
> > +/// signalled.
> > +#[pin_data]
> > +pub struct DmaFenceCb<T: DmaFenceCbFunc> {
> > +    /// C struct needed for the backend.
> > +    #[pin]
> > +    inner: Opaque<bindings::dma_fence_cb>,
> > +    /// Driver data.
> > +    #[pin]
> > +    pub data: T,
> 
> It's entirely possible I've just never seen someone do this before but - is
> are we actually able to make pinned members of structs `pub`? I would have
> thought that wouldn't be allowed (especially if `data` was exposed as just
> `T`, since a user could then move it pretty easily and break the pinning
> guarantee).

It should be ok. If `data` is pinned, so is the entire struct meaning
that you cannot obtain a `&mut DmaFenceCb<T>`, so you cannot in turn
obtain a `&mut T`.

Alice
