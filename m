Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF7B02689
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 23:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7650310E2E7;
	Fri, 11 Jul 2025 21:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="X1OUWwSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2AA10EAC1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 21:52:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-455b00283a5so5940845e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752270768; x=1752875568; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8RRcJnGL7VYeTaYAkj6SgjU8fJ+4S8aRG1AWN+AY7A=;
 b=X1OUWwSyufA3fpUSnkqFCJWyc5iBenFP9M79ihfjmowtT9ZLvCLahCGG9kRR1BDzIV
 Zw5sIex8TAhMgN/XchllgWkTxe4BJSv/R7FCX+HuqdpWxGPXL0IBMAOlzcPOo86A/amM
 tfXVQZdSnU9FkEb1plNmM7A9t4rOa2JxejYjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752270768; x=1752875568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q8RRcJnGL7VYeTaYAkj6SgjU8fJ+4S8aRG1AWN+AY7A=;
 b=arxSBatEZWNLxIdg/H7CYVoheGFe6kh8BGYV18aknaJ9KV80nBwjgUfkGApla9FbEU
 IaKGo4SsiYmYE7kSRLRkcf10shRTFQK5sI8x9o1YHEIIDgLWHkAr0BqWHmTID3EMVkHp
 WWL4HkN/6x/TjaDx2WRvMk9g6yG5se0llrRmEsJ6qnhHhaVNIuKmxe0mpS6UQAoYrAXi
 AeiDBLJ7bAKVtdlNeaqPuTetxFgcZHpH2UkulLyDYpGbCiNRcTRVoKtBH5Xtgh11rj07
 koMsKgNmQMROxjo67MepE7QinB06HVD/fOnqGY32FD3Dz/tHkezJJuFGlA+r8ncU++QF
 PRDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Q2YrN76ryUUaaArAe0RfTTkt0JZgUdyKrqyw4EpXlOOTWhsbksBI+oB0BWtpu0ZyTLWNedEUOrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2rQxU3m0zUfoGXrgCVKH4b2Y9wdKtQyC0/hAAHPWmfgW37Cjf
 CEfmMBg2VATzWwMipos4H/4cZqa3HfFmQnmROjtPeUweE9LEbv4I+MZfyIfU3cnENWM=
X-Gm-Gg: ASbGncsK2/BOypH81irDXHYitBsON2tb+MsgQCBaZCyMg0J1DxkGAnL4j0486nYdfru
 hekdr1CGKND69Dp94eJV3d4e0whhtJPYO4q2bqwyQMD7AGSNKyxqXKklyJ5Lr5OELlup43bDkr2
 pnkq3r2jCQO5hFIOzK6ynne/5b0b79LpBqhH/ZWBZTvQdUpLNUJ17WNUTnlSqT2Sqp9qVogmIHI
 O8Ba+y8yHmbyrL5egxIQfVtwcaRxe6nMGOIHbNAyMN4TrF8GhV/FW3p/cvHAfiSHhk8vyYJ//Rg
 UpoWrx553GC9rpayAF7NEYFsQ3BFXE0jmkSBqsDq4nzbGL1qRwTK9g1kdf1w2ktAopvEezzlurB
 D+v/64/DW0R5SY6Us2RuYyfksTP7kLUCYlQ==
X-Google-Smtp-Source: AGHT+IFN19WMRiUUdCkB96tSscJeaW1XzTJqoWGFT70YkkmatxtYFIYZq8faZzHYKBK1l+DS/8d3rw==
X-Received: by 2002:a05:600c:c0c1:b0:455:ed0f:e8ec with SMTP id
 5b1f17b1804b1-455ed0fec5dmr32188645e9.9.1752270767429; 
 Fri, 11 Jul 2025 14:52:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e1e8cfsm5387021f8f.80.2025.07.11.14.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 14:52:46 -0700 (PDT)
Date: Fri, 11 Jul 2025 23:52:44 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, christian.koenig@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
Message-ID: <aHGHrNVtupuOHODi@phenom.ffwll.local>
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
 <CAHk-=wif6u3C4gk7BtR1M+0SvHruXZ7xycP5oDdg-SF1D=ELqQ@mail.gmail.com>
 <CAHk-=wi3Fbiii2K9fgmoAgoJYoLuRyWfOZhh57FmREE15RbiUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi3Fbiii2K9fgmoAgoJYoLuRyWfOZhh57FmREE15RbiUg@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Fri, Jul 11, 2025 at 11:37:30AM -0700, Linus Torvalds wrote:
> On Fri, 11 Jul 2025 at 10:35, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I'm hoping the login time timeout / hang ends up being due to a known
> > netlink regression, and it just happened to look like a drm issue
> > because it exposes itself as a hang at the first graphical login
> >
> > A netlink regression *might* fit the pattern, in that it might just
> > cause first login dependency issues and resulting timeouts.
> 
> Well, considering the random timing behavior of this bug, it's hard to
> be really sure, but two boots with the alleged "fix" for the netlink
> issue made the behavior worse, so it does look like my problems on
> this machine were a combination of the drm refcounting issue and the
> netlink thing.
> 
> I guess I'll have to do a lot more rebooting to be sure, since the
> hangs and timeouts have been so random. But the netlink "fixes" did
> give me a hang that was very different from the previous ones I've
> seen, so I think the drm code is off the hook on this one.

Ok sounds good, I won't include the drm reverts then. I do think the
change from ->import_attach.dmabuf to ->dma_buf is still suspect, and the
handle_count reference change for fb won't cover all the other places this
might blow up (just less likely since the most common multi-gpu use-cases
are sharing render buffers to a display driver). But better we take
another week to really think this through before rushing things.

The handle_count changes do look reasonable to me too, but for an entirely
different bug around bo import/export. And I think we'll want a testcase
for that to make sure, and evaluate options properly.

But now I'll just type the pr summary and then w/e for me.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
