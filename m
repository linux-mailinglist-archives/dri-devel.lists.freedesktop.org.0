Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E70CED89F
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 00:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E758110E040;
	Thu,  1 Jan 2026 23:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wp79Mbpp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79AE10E040
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 23:13:23 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so7645025f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jan 2026 15:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767309202; x=1767914002; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XX9HKgNtdlmWfrvLY2GB/fq8FDIfRuG0UCvzUof1dYc=;
 b=Wp79MbppueySOU0LXU9Wx4IG+homOYq4qHTLUq0bWZ80ZmwHU8fjIJ1e/F3TtEtIul
 ZzJoDaj9IsNPZ3SSgjfAip/Ku0HnXKSW2izdVyDwzcz34S5flobOG5RB2aLJ9WFw3z1b
 Ck+caP+57D7aQ+1Idv4w+agMm/phfGXCxgGpvy7J7T5HNmL5qPkB7zOHYGqJYCH35N3Y
 nRdMS/itHADAHSGcoiRjzsDXgB43XAThixg/ARiAiyOfWPvKA4yhTyqCgK6wUfwVeUoT
 6iYeh1PP48ZYnlCtiAnbjQhUGUsyGWIUZb/3UFEqSwMFgX/rtIG6JSo/mjBbnCzLIuVf
 Szkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767309202; x=1767914002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XX9HKgNtdlmWfrvLY2GB/fq8FDIfRuG0UCvzUof1dYc=;
 b=EXSV2Wrh4GqOnbvRWgBPcAPVomEWhCH2PDqIHBiv60/+7WP/wjT6xQcRk4M+6yCgvr
 G1GhCayBdKmjl6OhpJ2rdiJjOiHsQymxRmcP2rPCgM0XJAqpK7eybOzLg3NFy9Ms62NT
 9R8x23UuMTCZJXEIybSSjrjxK5r1jQl30IvLTlLgt+z0f+oGinZD0QN4ge5+IhMdLLVr
 h5vYQw62aTmDzRB6o0W8PF5cLoVX9H5ckJu8pWBSMWlhycfOmcM0p23SbB3LFrZXfMR9
 JW7RzEWZ/EsDaJK4LXVURChfJFjQXhEERlKvawhcDuVB37BczpPYY1vxDZdvsTPTv0Uu
 QIfw==
X-Gm-Message-State: AOJu0YzHp2kJEDNvc/Dwm6dtl+5AKIj6Hao5BRFsP5Wbnr1ZfHzZ6UEH
 Ak5q2DqpY2PPvGGHITSMOT3URNoGoxas69qM2cNC/+COvlXDW0If6paj
X-Gm-Gg: AY/fxX7/kh457cbdfFyXtxyxkW3LH7TCJqY/L4+flpdNcdS6o41ayxDmIgRZicnH/8N
 wQL8/1Rc6vT6UOKwPPRKLGox1h6uMLnGAKWxfp9ZmYjtKVI63o9EBCYLLLfuK0xeyGw29dHV3AL
 OXi3S39Lw6yRQDAQlVCMtNSsWaCoG27Awl+BvI+p/fj8LwD6wEWJONKGLLokHNQe1KRsxU5bLUF
 A+luNuxT9cyCdj4GouIE8IGBbbKZ/ir6P2nLbN/pchMOccxy7V8V7dtUmuCDPG7bNyeI9Dj7r+T
 w/YrF+disfVTTBGsl5RlCFu5LOAmOrS351nvO7JQAnGxNum5wF/lcu/uVIHgOsbe5ZZ9q439JvC
 aQIM705qLOndhwn525Zr76V7TfLwDMFGM1TcyuIrSxk9fsJgeb4GX2TDrcQgkOFgNODiIpRtbyp
 5v7+TMRG84BX5bRpcU6YA6gqHUC1wwjq3Dy5UAek/0LyQH6iqVI4gQ
X-Google-Smtp-Source: AGHT+IGRdJAwC31J1FgOs4yAwsXAwWHqkwrMGWpNW8TLxnN+r0x0jJ2mKENNBTKFctDl0fT7gW7U/g==
X-Received: by 2002:a05:6000:1843:b0:431:327:5dcc with SMTP id
 ffacd0b85a97d-4324e50ebcamr47059470f8f.43.1767309202163; 
 Thu, 01 Jan 2026 15:13:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea82f6asm83437898f8f.27.2026.01.01.15.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jan 2026 15:13:21 -0800 (PST)
Date: Thu, 1 Jan 2026 23:13:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
Message-ID: <20260101231320.16766226@pumpkin>
In-Reply-To: <15e7f0e9-9862-4606-83d2-d95e0cb6e821@mailbox.org>
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
 <20260101114221.6a401790@pumpkin>
 <15e7f0e9-9862-4606-83d2-d95e0cb6e821@mailbox.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 1 Jan 2026 22:26:34 +0100
Marek Vasut <marek.vasut@mailbox.org> wrote:

> On 1/1/26 12:42 PM, David Laight wrote:
> 
> Hello David,
> 
> >>   static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
> >>   				   unsigned long fin_rate,
> >>   				   unsigned long fout_target,
> >> -				   struct dsi_setup_info *setup_info)
> >> +				   struct dsi_setup_info *setup_info,
> >> +				   u16 vclk_divider)  
> > 
> > There is no need for this to be u16, unsigned int will generate better code.  
> 
> Can you please elaborate on the "better code" part ?

Basically the compiler has to generate extra code to ensure the value
doesn't exceed 65535.
So there will be a mask of the function parameter (passes in a 32bit register).
Any arithmetic needs similar masking of the result.
You won't see the latter (as much) on x86 (or m68k) because the compiler
can use the C 'as if' rule and use the cpu's 8/16 bit registers and alu.
But pretty much no other cpu can do that, so extra instructions are needed
to stop the value (in a 32bit register) exceeding the limit for the variable.

Remember that while C variables can be char/short the values they contain
are promoted to 'signed int' before (pretty much) anything is done with
the value, any calculated value is then truncated before being assigned back.
For on-stack values this is fine - but modern compilers was to keep values
in registers as much as possible.

> 
> >>   {
> >>   	unsigned int best_err = -1;
> >>   	const struct rcar_mipi_dsi_device_info *info = dsi->info;
> >> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
> >>   			if (fout < info->fout_min || fout > info->fout_max)
> >>   				continue;
> >>   
> >> -			fout = div64_u64(fout, setup_info->vclk_divider);
> >> +			fout = div64_u64(fout, vclk_divider);  
> > 
> > Since vclk_divider is BIT_U32(div [+ 1]) this is just a shift right.
> > So pass the bit number instead.  
> 
> While I agree this is a shift in the end, it also makes the code harder 
> to understand. I can add the following change into V2, but I would like 
> input from Tomi/Laurent on whether we should really push the 
> optimization in that direction:

The shift really is a lot faster.
Even on 64bit x86 cpus it can be slow - 35-88 clocks prior to 'Cannon Lake'.
AMD cpu get better with Zen3, and using a 64bit divide with 32bits values
doesn't slow things down (it does on the Intel cpu).
Don't even think about what happens on 32bit cpus.
I don't know about other architectures.
Just comment as 'x >> n' rather than 'x / (1 << n)'

	David
