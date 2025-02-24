Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751FA42636
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E2710E3C1;
	Mon, 24 Feb 2025 15:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P5wiWvuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FCB10E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:27:16 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-220c665ef4cso78434635ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 07:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740410836; x=1741015636; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NVMni6CCCY2us6Xo8mKZ2xt3KdSK/Spp1dIxAZpVn4s=;
 b=P5wiWvuhCabN2aH6oQG/OPTnWE38x/YTzwRsaTY128TmNnV+sbVeufU8OKtUtU/kMA
 aE3VXZALJbdttAjbL6Nu0Lalie2EZdmfXZiPTydCNUcm0o+W8KfHpaB+vAIVmw6qK5O8
 +zdTxcLAnYdy/JfJV7ueHLLtFAw8jvKjzNSlgN+GO4mwdr8Wn/JlUq/G0vFAMU0F9P4K
 DJ9Hq3OZJGOHeitu7kS4EjXz/SO9BmKK+43FgLf0Dnnk4WeaW73gDTNxiNbgRd874LiM
 I5pY9Kx5PsDPSpE47F5KvlyCvmnAJD5Hk3DFMzSLVVNQC4H89lRq4wqaJAmD7nrv0tCD
 MO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740410836; x=1741015636;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVMni6CCCY2us6Xo8mKZ2xt3KdSK/Spp1dIxAZpVn4s=;
 b=awRRvXchJ5fd778BJ7FwGsaANTbUO1nHHEmGJUo4tBE3gLQfSD4mbom/p65Ad49jR+
 jlKcByu/Kydx1upVm2Q0FepD32fO3KebjB/V/+gZcRBe+7gp7Suh0wdb49ZkIPo2oSLK
 h0CZewh9qMcMjbml0ctnFR3sKTl7xwmXfL46AagLra6VgT9D5uOeKKFmopDbcbNhGNvD
 jVE7ICN0SRzHIjxA0YcCs9Trso7Ub3sWMv1c2FUN4y1xgZJ+CEbajEa2IQNgsULUFrYQ
 M/ocl/GdwR39MKDOzRQ5QkTQ7ouNhsbHfNDC5Tdj+OmJrEr7ZF1H9z7aUCPdgsw70zt9
 c5GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoLBxOlQs1ev0jMdQmyJ3s7C3hZMw12nsgWiYgHPRH7UZ1bJb+1xBimCDjk5ckZSy0k/2ksWFEBVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv1LyHlAmhZ4j0FBc2p1T6Rzm4S3MnrvYN98ft1uHIXhXLvs/t
 sGJ4Ul7K2d8wRdY717A5t82OT6/TQk7onfYC805BoNH7Q+nejdry
X-Gm-Gg: ASbGncsHQyufZ7yNhbL/0PAHPm3Jb3N4nSAO2Dfbw2J0M9By7BQW5ijbBq2kpU8/JXR
 QWBsD4Jxn3NrpgHf4dMIVRFOrc6Y0ZxRan+AHzffBr+PR+6ca0p6Pv8bHOdU63sgmrevJhmMN3p
 fv2pmVenJhN7lFenh2WCxXtpIGohzVKTtzn9rEP56hfO+cR/GWSooSlj3RZPpQt2hEW5sx2NbxU
 yTIJMaCUEtBknBEVRwpX8a8ylpdbO2QbsOyQpbWPvJuURD3uy8CwueNb6CDFwOoj+J7SvFWv9ab
 ZRlAG9HirAYHDcKIERdGP3pDcefB
X-Google-Smtp-Source: AGHT+IFl+fmLe2Snker6fx4GB6SiAhwknYLzw9iuDcRtyo7AdhlkRr95Yy6wYLAjG0rHC6oLfbqCGA==
X-Received: by 2002:a05:6a00:cce:b0:732:6214:35f5 with SMTP id
 d2e1a72fcca58-73426c8d21fmr17154986b3a.1.1740410835401; 
 Mon, 24 Feb 2025 07:27:15 -0800 (PST)
Received: from eleanor-wkdl ([140.116.96.203])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7346d9b1af1sm1359758b3a.71.2025.02.24.07.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 07:27:14 -0800 (PST)
Date: Mon, 24 Feb 2025 23:27:01 +0800
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
Message-ID: <Z7yPxdiLLXlsWSQN@eleanor-wkdl>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <602e03fd-ce4b-feef-5053-e95834ab35d7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <602e03fd-ce4b-feef-5053-e95834ab35d7@gmail.com>
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

On Sun, Feb 23, 2025 at 09:25:42PM +0100, Uros Bizjak wrote:
> 
> Please note that GCC (and clang) provide __builtin_parity{,l,ll}() family of
> builtin functions. Recently, I have tried to use this builtin in a couple of
> places [1], [2], but I had to retract the patches, because __builtin
> functions aren't strictly required to be inlined and can generate a library
> call [3].
> 
> As explained in [2], the compilers are able to emit optimized
> target-dependent code (also automatically using popcnt insn when avaialble),
> so ideally the generic parity64() and parity32() would be implemented using
> __builtin_parity(), where the generic library would provide a fallback
> __paritydi2() and __paritysi2() functions, otherwise provided by the
> compiler support library.
> 
> For x86, we would like to exercise the hardware parity calculation or
> optimized code sequences involving HW parity calculation, as shown in [1]
> and [2].
> 
> [1] https://lore.kernel.org/lkml/20250129205746.10963-1-ubizjak@gmail.com/
> 
> [2] https://lore.kernel.org/lkml/20250129154920.6773-2-ubizjak@gmail.com/
> 
> [3] https://lore.kernel.org/linux-mm/CAKbZUD0N7bkuw_Le3Pr9o1V2BjjcY_YiLm8a8DPceubTdZ00GQ@mail.gmail.com/

Hi Uros,
Thanks for your information.

We originally planned to implement hardware optimizations after this
patch series. However, for V2, We will incorporate __builtin_parity(),
while keeping our current implementation as the fallback function.

Best regards,
Yu-Chun Lin
