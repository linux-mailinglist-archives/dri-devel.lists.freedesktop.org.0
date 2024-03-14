Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239FC87B6E6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 04:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D88810F8A4;
	Thu, 14 Mar 2024 03:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H2fExyZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B84F10F8A4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 03:39:14 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d27fef509eso5297551fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 20:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710387552; x=1710992352; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pzfB/zx1rMXFiN5xVYxoTP9vNrcpsloQVQWggT/ee1M=;
 b=H2fExyZZdFQcmSHJUOkzvk1O7pLpKz113EYt1vPv1IbCU07mo3xTQZUy3HpgabcNtn
 RAZQGhDgu0eMM4MwSKExTPUAI67cDsEOwEwh4rVC/Z/fDMi8P9t33gz8ShkDRAfVJfpv
 TpGRh+R/YIk0cevXRQLVUozSahU21xml555wf8P3zYC7qKqz5bJu80L+ktwAdHnzlSkB
 /pSFKb/eK9fRF5CIRIr9vd2yXu7ebwlUWmOIphc6/Nf4vMrws/IlET6ifQdufIvT58cE
 iK+1ccOdIjK6T+VK0hIBFuTo+aS4RhgexQRaN7V6yPwBeiElAARM749Iu+IVdPmqpLoG
 5XAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710387552; x=1710992352;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pzfB/zx1rMXFiN5xVYxoTP9vNrcpsloQVQWggT/ee1M=;
 b=vbtN6J9vOYm254hCoHq0PPyTfiEbsc0lOm8dKgMPPjj1kBHkP2qC5g71uS8CgZQOna
 yYM6ppLi9QegykoKrUfW8HdZESwoiSmOVLS7seZI9NfmWROFCrHKATvJ426kOLHStlHX
 da6uQqFlZFUBCkrya1BvZR5OFG2tXxXoreopeXsKI8ze+3NQyLqZ1B1a9Zg/cRjyDaPx
 UB9AvK44+Gr77HRV9TEtnZpC55Q0NtLO+LO3E4/my8jUAJRqTRGt+vaPMneHfr6RcDQ4
 qCwJrf07Qrz43dxCct5p+4jbRRTv/L2+TpA5I4bfrN0hjmlVMaW14L44FJFzXjpQy8ar
 018Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu9td82+uxhQ7rV/RD4cYAEqshL+8BSAfexGkOH8suOno4k8undsGMgr4ozVr6VmP6eAVeLxWKzGYV9pbr1ovbQKbipHYiONd/tGcBcGxo
X-Gm-Message-State: AOJu0Yxb+GiAuzTN7zhQsDmX6D+dkmgiN0CuBYzluIj91jUERJ5I9eGJ
 6RcW5B0WmOsj4hp9ob1rI25x4xJJrOdGp+vixmMj/Y6GAQctBS5AXkAeX8ftbBOyRvrGzoQDNVh
 wdTgKU1k2pfbsDzmwI8TfPvggnmU=
X-Google-Smtp-Source: AGHT+IFU7eMwlTFR5WfSDoIvTFz0pq0Wqj+p6dNE4PgtQyYt1KURs26skGTJXhIZ1vwCI7FP3a7rUPZXADl2pnbFfq0=
X-Received: by 2002:a05:6512:32b7:b0:513:c9d2:e1e1 with SMTP id
 q23-20020a05651232b700b00513c9d2e1e1mr263956lfe.66.1710387551954; Wed, 13 Mar
 2024 20:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twR+WnE3GGqyeh1cuGVmpADPTwDPK10625RP--rLrqkxA@mail.gmail.com>
 <CAHk-=wiTWLKkg0Hht4ofDTVsebD2Zq-m4UP-DsiZjM+w4b7qug@mail.gmail.com>
In-Reply-To: <CAHk-=wiTWLKkg0Hht4ofDTVsebD2Zq-m4UP-DsiZjM+w4b7qug@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 14 Mar 2024 13:39:00 +1000
Message-ID: <CAPM=9twwZ-u7_8sRRRf5kRnuRa44ixzM8dHZUs6f5wLnQi90Zw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.9-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Animesh Manna <animesh.manna@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, 14 Mar 2024 at 11:49, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 12 Mar 2024 at 21:07, Dave Airlie <airlied@gmail.com> wrote:
> >
> > I've done a trial merge into your tree from a few hours ago, there
> > are definitely some slighty messy conflicts, I've pushed a sample
> > branch here:
>
> I appreciate your sample merges since I like verifying my end result,
> but I think your merge is wrong.
>
> I got two differences when I did the merge. The one in
> intel_dp_detect() I think is just syntactic - I ended up placing the
>
>         if (!intel_dp_is_edp(intel_dp))
>                 intel_psr_init_dpcd(intel_dp);
>
> differently than you did (I did it *after* the tunnel_detect()).
>
> I don't _think,_ that placement matters, but somebody more familiar
> with the code should check it out. Added Animesh and Jani to the
> participants.
>
> But I think your merge gets the TP_printk() for the xe_bo_move trace
> event is actively wrong. You don't have the destination for the move
> in the printk.
>
> Or maybe I got it wrong. Our merges end up _close_, but not identical.

You are right, I lost a line there, I've repushed mine just for
prosperity with that fixed.

The other one I'm not sure on and will defer to the i915 maintainers
if ordering matters.

Dave.
