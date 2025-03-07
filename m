Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17154A56878
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31F410EA1D;
	Fri,  7 Mar 2025 13:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="kIntLYTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7997E10EA1D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 13:09:17 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43bd5644de8so20603525e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 05:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741352955; x=1741957755; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLXbK1kB32hdkos1OXYsIkc5qxoXTv1ZW+nI08u1/9M=;
 b=kIntLYTT/FjSBOveIdRrzfHFWMEyOMCgiHcUh7XS0dl0homuWBf0zkWPdSm6bfD+1Z
 xnQalYAPi+/PXRLXqqu0VRTYgrJflg0WviZov75JuzVjxu2rMpz6/7HRNUmTLzuhdmmv
 Kv8+k5thjKHCFU4iRY/+8MOV3oMAQ1BR6T/OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741352955; x=1741957755;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fLXbK1kB32hdkos1OXYsIkc5qxoXTv1ZW+nI08u1/9M=;
 b=H/thdfiw6BQzME8bPOcmNp7FF94mBFouUoghEdSluS7ayU5AbFPi7iZKu7xzE009SA
 VhNT1haAIE7x/bMhJx4Uu+FkO03rlfsVBp9d71/d/vvYQPCijWTUhnYoWKoJVvX8Pd6b
 FhGKbjIZV05Rcwl4Rgo1TNFu/zDda/MfeorST/L/MQaVfiUALPvcR7o1iST4GcmzXHqE
 /iPLVWhaYqhGnns4LO7v0ox5kKBAjLryJsEFSJn1pLcK6Fs+ZW2YrbOQC49ebvxrJIYF
 Xuf1rw9n8UZIMGtiRnKO6EbYZh7jVXKYEOiGFC/tn6vX7M+cPWms6/G+rbIQIk1KrM7H
 /E6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJZKTx1Jy37Tmko4BNXK6S322jxhJhYzgdWgbEUjmqamwqtyqKxM8//JwDE0oYqaADp/jw3IPErx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2ZnMghdLUIAGSYMr2wiwHxOIOM4s9rtaSGbgn+8I2T43QQZm0
 A4ZGgVs+xz56dHFhhEVlI6RWemTHE2J2w4OpFb9cprXs70a0TC4ff2sjleBTYqw=
X-Gm-Gg: ASbGnctg4zCPgfUASiPO7a4WjJ1EUkhHHER0MLqjyqdUnFFt6PaF/CnuUoZU6rEQhkA
 HPjmw00iUq1ia7q2aXRcDiP4Bq+K8pXgmfRcZn7yKjW+iQWefF526zoCW8ptdsFH2dtJ4CtuDww
 z5n5B1a9kS9wJX39+9vA4V9vaDoK5MwQBVGsS6sq/4PwWm/gQiSUhg28XYoiFffDKQuzssadHP4
 vlU7pu1528pSNcnAJErrNqO/T7flPDI1ef9J2vDsrZMMlkVs0lz7HYvUbt5iHZbGIkL0tA+mIXh
 9HPocTdvLj+XMZv8tGvjNRHKmss7haKFrxir2XxIcPHbjXJxt3259YGj
X-Google-Smtp-Source: AGHT+IGXKnB7QtBKk8gCa+TlzYNbGzQEnm9bXI6Rnch3Ew5gX/H5UMUN/1g1KPRfZAkAjvrureRPLg==
X-Received: by 2002:a5d:6c63:0:b0:390:f0f3:138a with SMTP id
 ffacd0b85a97d-39132d5b4bfmr3104340f8f.27.1741352954934; 
 Fri, 07 Mar 2025 05:09:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfcb8sm5384143f8f.33.2025.03.07.05.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 05:09:14 -0800 (PST)
Date: Fri, 7 Mar 2025 14:09:12 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z8rv-DQuGdxye28N@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
References: <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307123255.GK354511@nvidia.com>
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

On Fri, Mar 07, 2025 at 08:32:55AM -0400, Jason Gunthorpe wrote:
> On Fri, Mar 07, 2025 at 11:28:37AM +0100, Simona Vetter wrote:
> 
> > > I wouldn't say it is wrong. It is still the correct thing to do, and
> > > following down the normal cleanup paths is a good way to ensure the
> > > special case doesn't have bugs. The primary difference is you want to
> > > understand the device is dead and stop waiting on it faster. Drivers
> > > need to consider these things anyhow if they want resiliency against
> > > device crashes, PCI link wobbles and so on that don't involve
> > > remove().
> > 
> > Might need to revisit that discussion, but Greg didn't like when we asked
> > for a pci helper to check whether the device is physically gone (at least
> > per the driver model). Hacking that in drivers is doable, but feels
> > icky.
> 
> I think Greg is right here, the driver model has less knowledge than
> the driver if the device is alive.

Maybe I misremember, but iirc he was fairly fundamentally opposed to
trying to guess whether the hw is gone or not in the ->remove callback.
But maybe that's more from the usb world, where all the hotremove race
conditions are handled in the subsystem and you only have to deal with
errno from calling into usb functions and unwind. So much, much easier
situation.

> The resiliency/fast-failure issue is not just isolated to having
> observed a proper hot-unplug, but there are many classes of failure
> that cause the device HW to malfunction that a robust driver can
> detect and recover from. mlx5 attempts to do this for instance.
> 
> It turns out when you deploy clusters with 800,000 NICs in them there
> are weird HW fails constantly and you have to be resilient on the SW
> side and try to recover from them when possible.
> 
> So I'd say checking for a -1 read return on PCI is a sufficient
> technique for the driver to use to understand if it's device is still
> present. mlx5 devices further have an interactive register operation
> "health check" that proves the device and it's PCI path is alive.
> 
> Failing health checks trigger recovery, which shoot downs sleeps,
> cleanly destroys stuff, resets the device, and starts running
> again. IIRC this is actually done with a rdma hot unplug/plug sequence
> autonomously executed inside the driver.
> 
> A driver can do a health check immediately in remove() and make a
> decision if the device is alive or not to speed up removal in the
> hostile hot unplug case.

Hm ... I guess when you get an all -1 read you check with a specific
register to make sure it's not a false positive? Since for some registers
that's a valid value.

But yeah maybe this approach is more solid. The current C approach we have
with an srcu revoceable section is definitely a least worse attempt from a
very, very bad starting point.

I think maybe we should also have two levels here:

- Ideal driver design, probably what you've outlined above. This will need
  some hw/driver specific thought to get the optimal design most likely.
  This part is probably more bus and subsystem specific best practices
  documentation than things we enforce with the rust abstractions.

- The "at least we don't blow up with memory safety issues" bare minimum
  that the rust abstractions should guarantee. So revocable and friends.

And I think the latter safety fallback does not prevent you from doing the
full fancy design, e.g. for revocable resources that only happens after
your explicitly-coded ->remove() callback has finished. Which means you
still have full access to the hw like anywhere else.

Does this sounds like a possible conclusion of this thread, or do we need
to keep digging?

Also now that I look at this problem as a two-level issue, I think drm is
actually a lot better than what I explained. If you clean up driver state
properly in ->remove (or as stack automatic cleanup functions that run
before all the mmio/irq/whatever stuff disappears), then we are largely
there already with being able to fully quiescent driver state enough to
make sure no new requests can sneak in. As an example
drm_atomic_helper_shutdown does a full kernel modesetting commit across
all resources, which guarantees that all preceeding in-flight commits have
finished (or timed out, we should probably be a bit smarter on this so the
timeouts are shorter when the hw is gone for good). And if you do that
after drm_dev_unplug then nothing new should have been able to sneak in I
think, at least conceptually. In practice we might have a bunch of funny
races that are worth plugging I guess.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
