Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18FA3880B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADB010E507;
	Mon, 17 Feb 2025 15:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KbFwb9Gz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352B910E512
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:48:18 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43962f7b0e4so27294495e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 07:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739807297; x=1740412097; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kFPS7jWerxORL3qYOvf7GvgH3VVFrmdTXhBMeC3dyLU=;
 b=KbFwb9Gzjs2DFzTKcs9mkkXdCNVpwhzBT8EVc6WC3RuaozydsE5yuh6Pvh0DJRVS27
 4QTdQe/cPsWVC7QUo5CXDhe2xnEIR4nj4onYB48cs3iAoT9dX5XPDzgIAud3sMUny0fq
 qz1RD45TAczDCdUY64eszEFgNkGN1I8gUXAao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739807297; x=1740412097;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFPS7jWerxORL3qYOvf7GvgH3VVFrmdTXhBMeC3dyLU=;
 b=b6EOk1cqw2XFo8qR17z3FqCyl6eUcfOfNi8IYkiQL019V1HPO6WJo2gQPwdRDZFf+d
 ct2rj3Ne+wXUuGNBCAgItSXvYMTAPoSdfx0o8PnQozm2zwJZT8I39nQGvubLz2akbBJM
 6LvNPV6MY0a7nbk0maU9Ioau9+HEH1u6k7fDXb66QWbhbNU0ZagE27aN8oytGUwrgekC
 oXIcDTEoMVsc4KSFGGN0EOna9p46bT8Tl0ncpQRBrsF7cw5CJ+OCZmdiS2Es5W7hwdEe
 4GiMvRnK8vqftfxixLTxsduEU/E6Su0NiY80ARTJAg4SX+MqtN5Sw2DPlPiMg3DbA2y1
 6GMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsEV5YVapcD2BMKv4bV+TQxHiaXESH2qR0AZoN3yKh/ML8s/RWF8EGoBX2Pk8Uh2ogsi/Om97bu2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu54u2FKu1coM1cYMB3yhoru6DhrAq8LSs914/ZcGO1CjJLh+7
 rAhAkuGRHcPEjeJxA2/yjXRnint4tuQl4fPIn0IvMxZvS/WLN08rIqBj7yU3f+g=
X-Gm-Gg: ASbGncs09Jrjw5oMEcbLM4947JyM0gWfNGzlYgm7WSK+phBd/OQgek0MJ43WL3oPIJQ
 WfTYBQcAHKjOrFwRbLH+okOBHE8T5auyNFMmGe0AMv3do9SLH6fAUkW+/KP/dv8kzPQPArfaX45
 36Q9bcijFhrXZcBw8q86PMiRv2x/VpJNM4BVnCZdkrObbKklssEdch6/1dYk1Fv3c/6jyKEbxJx
 TSU7X7+l7i2pML1Hl7JHD5Su2+tebN1D6oKvHUIWKIgf/p201HtZQjlM8aBInv92VtrbHA38jSg
 tDr3sxQlHdlIOGQlfh7dO63SedI=
X-Google-Smtp-Source: AGHT+IGSPCdUDCd1o/i4T/qnIV8TpHBkXWunEDUWfKiArJRtbwbNRix+QBABPgefm77mFrNCuPLfcg==
X-Received: by 2002:a05:600c:4688:b0:439:89e9:4eff with SMTP id
 5b1f17b1804b1-43989e951bbmr23616275e9.10.1739807296485; 
 Mon, 17 Feb 2025 07:48:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43961645422sm75891405e9.2.2025.02.17.07.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 07:48:15 -0800 (PST)
Date: Mon, 17 Feb 2025 16:48:13 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z7NaPYvuRF11uxnM@phenom.ffwll.local>
Mail-Followup-To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
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

On Mon, Feb 17, 2025 at 11:04:45PM +0900, Alexandre Courbot wrote:
> Hi everyone,
> 
> This short RFC is based on top of Danilo's initial driver stub series
> [1] and has for goal to initiate discussions and hopefully some design
> decisions using the simplest subdevice of the GPU (the timer) as an
> example, before implementing more devices allowing the GPU
> initialization sequence to progress (Falcon being the logical next step
> so we can get the GSP rolling).
> 
> It is kept simple and short for that purpose, and to avoid bumping into
> a wall with much more device code because my assumptions were incorrect.
> 
> This is my first time trying to write Rust kernel code, and some of my
> questions below are probably due to me not understanding yet how to use
> the core kernel interfaces. So before going further I thought it would
> make sense to raise the most obvious questions that came to my mind
> while writing this draft:
> 
> - Where and how to store subdevices. The timer device is currently a
>   direct member of the GPU structure. It might work for GSP devices
>   which are IIUC supposed to have at least a few fixed devices required
>   to bring the GSP up ; but as a general rule this probably won't scale
>   as not all subdevices are present on all GPU variants, or in the same
>   numbers. So we will probably need to find an equivalent to the
>   `subdev` linked list in Nouveau.
> 
> - BAR sharing between subdevices. Right now each subdevice gets access
>   to the full BAR range. I am wondering whether we could not split it
>   into the relevant slices for each-subdevice, and transfer ownership of
>   each slice to the device that is supposed to use it. That way each
>   register would have a single owner, which is arguably safer - but
>   maybe not as flexible as we will need down the road?
> 
> - On a related note, since the BAR is behind a Devres its availability
>   must first be secured before any hardware access using try_access().
>   Doing this on a per-register or per-operation basis looks overkill, so
>   all methods that access the BAR take a reference to it, allowing to
>   call try_access() from the highest-level caller and thus reducing the
>   number of times this needs to be performed. Doing so comes at the cost
>   of an extra argument to most subdevice methods ; but also with the
>   benefit that we don't need to put the BAR behind another Arc and share
>   it across all subdevices. I don't know which design is better here,
>   and input would be very welcome.
> 
> - We will probably need sometime like a `Subdevice` trait or something
>   down the road, but I'll wait until we have more than one subdevice to
>   think about it.

It might make sense to go with a full-blown aux bus. Gives you a lot of
structures and answers to these questions, but also might be way too much.

So just throwing this a consideration in here.
-Sima

> 
> The first 2 patches are small additions to the core Rust modules, that
> the following patches make use of and which might be useful for other
> drivers as well. The last patch is the naive implementation of the timer
> device. I don't expect it to stay this way at all, so please point out
> all the deficiencies in this very early code! :)
> 
> [1] https://lore.kernel.org/nouveau/20250209173048.17398-1-dakr@kernel.org/
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Alexandre Courbot (3):
>       rust: add useful ops for u64
>       rust: make ETIMEDOUT error available
>       gpu: nova-core: add basic timer device
> 
>  drivers/gpu/nova-core/driver.rs    |  4 +-
>  drivers/gpu/nova-core/gpu.rs       | 35 ++++++++++++++-
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 43 ++++++++++++++++++
>  drivers/gpu/nova-core/timer.rs     | 91 ++++++++++++++++++++++++++++++++++++++
>  rust/kernel/error.rs               |  1 +
>  rust/kernel/lib.rs                 |  1 +
>  rust/kernel/num.rs                 | 32 ++++++++++++++
>  8 files changed, 206 insertions(+), 2 deletions(-)
> ---
> base-commit: 6484e46f33eac8dd42aa36fa56b51d8daa5ae1c1
> change-id: 20250216-nova_timer-c69430184f54
> 
> Best regards,
> -- 
> Alexandre Courbot <acourbot@nvidia.com>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
