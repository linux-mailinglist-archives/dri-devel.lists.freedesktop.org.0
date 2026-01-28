Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEEKACLxeWnT1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:21:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A056A0375
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7600310E20E;
	Wed, 28 Jan 2026 11:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZZvEAQpV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F87D10E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:21:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso68717235e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 03:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769599260; x=1770204060;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wosS8gSZQwNatY59Tw5xbh3t7QOl2V3ezMLzg/qyqP0=;
 b=ZZvEAQpVoqQXuQCv2p/I75c59mhD97kTxvHTDqiKKIpdxklb2hJmp1d+zBA3SAo+eQ
 6JolIL8hboFQ0iRuleKJ/qKQdJSbT8pfey62a1s+5Y7aqJnOQhBA9LJMX9JLHV2WS3xJ
 G+HVW+l7Ov5ku0EhYnTIvEoNLkAb/1fmqO8YzP20VXfBNVsaW5aK8XA/cNxxi2nEkEu4
 ltmY/yEpKUaHixqTb4Fn8Fo8KzDNAwEsMCEazrajy+o9rwCwxXE4BxPn/M6YT4eaj7FJ
 Wb7MMre4NnxHEOhhppAChuTdBgw0IwvxwgSCW9fdn2OBSVbzbYykLoOs9KdNiLyiA5WO
 MQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769599260; x=1770204060;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wosS8gSZQwNatY59Tw5xbh3t7QOl2V3ezMLzg/qyqP0=;
 b=n0E+v9JOOV+DdF7dsM4DZsPru0py2KS547pBSvfLuTieKSj85KoPM3RpLTYm2878b2
 Qxu1MPITnI8ajuTDD4GrXIEYTb6iAwsKZDTGpGmdPD69Oa40aLHpehHTxu2tYGSpTvIs
 VWqX4dHqzWG87GGJWKB1vRVIZpWL596Np/eDk4Fjb9IhIG84I3qaU/Hru2dhF3QQjRAK
 osZJH/dPHEbOyf2rcuZdo1g3R3e5y3dEJ/NvWe8msgam6BIxWajHI3ZVbxcKRq4tSDDa
 HrG6B+rdMH9MJ3jqGzwiQiVZeKL6/5H0dbQD0yVofCCwmuKtigQj134qnMycf2w8IynD
 PgIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhtqS5TO4wVI3Y8/2SVuKUvouK/5aGTICjPRn1etONguJjyvQr19aN/VPzFlo1+PvIn9wisf7IBW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu+q6Urc7pV9nwlDYetpy91TmXv7lLb1fUb1AKmBbD/GX8zTWc
 tVkEMZa6K9Z+Xq1ywgaRky1xKmxTawiVo/swprlBMTeuWL4zZY9IO6SwP7zvS4XcYC8rYkM5o0a
 Jn/Ap
X-Gm-Gg: AZuq6aJDJh+bPrpUgF3KvC7WMHZUizfe099QQ+3gGR7wo5eO4pjdkRHP5WAcO0bhMet
 SwEPKk19Uul4oq3IGvKhAtHAxYZgL6t2X89eljRl7aeYFEaCcvXCQWJs32BW7mu2RVG33Hc9CHB
 VPHoZJdIGY85zNXiVCKuXZ7Hn1i/WjbrEeC1tJYPrq1djSvqDaZCJMjbGNty5vU85FmDmZOmH1F
 EvySYTVGOCHeVlW12UEPAR+iEFepZIsSPzbPqjwNfBD3AMpISgKiuelh/LxaR1x4f1LJXBiCbB9
 u/e4MdDywINA22+cjiypvEEtJOYfQEg47rDY7io9IHDsftzZFrrCraiYqndsgwYxzzpgT+t6//E
 o3+2BVNQaKzZ3qw4orzEObrK6kkBbYgW9jLYjnl1+BoFLCapf7mtnjNQFxGGb5ZSU2bVwM9TUIP
 XaCVPDvtxYp+LEN3iB9is2/p8EyxMgDCttfnxx/F1UIbcNbcgj1ejYy+sh2xsZgL/pj/LgZTS8g
 O+hoR32dt/pOj7AEGSwb4jvj/rSG4dO67raT9gockjrRmon9cgaICFaYNfBgALPvnz5147O
X-Received: by 2002:a05:600c:8b61:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-48069bfad7fmr63503125e9.7.1769599259657; 
 Wed, 28 Jan 2026 03:20:59 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806e2e5ffcsm4307315e9.18.2026.01.28.03.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 03:20:59 -0800 (PST)
Date: Wed, 28 Jan 2026 11:20:56 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tessolveupstream@gmail.com, lee@kernel.org, danielt@kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, pavel@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
Message-ID: <aXnxGPNtk5BwoJOu@aspen.lan>
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
 <20260120125036.2203995-2-tessolveupstream@gmail.com>
 <3f3c47ea-1660-4bd4-ab89-3bdf58217995@kernel.org>
 <54d156ba-e177-4059-a808-2505983b4e2e@gmail.com>
 <500b603d-5abc-4c45-8d56-bbc88fc85b83@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <500b603d-5abc-4c45-8d56-bbc88fc85b83@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20230601.gappssmtp.com:s=20230601];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:tessolveupstream@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@riscstar.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,gmx.de,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspen.lan:mid]
X-Rspamd-Queue-Id: 6A056A0375
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:11:33AM +0100, Krzysztof Kozlowski wrote:
> On 23/01/2026 12:11, tessolveupstream@gmail.com wrote:
> >
> >
> > On 20-01-2026 20:01, Krzysztof Kozlowski wrote:
> >> On 20/01/2026 13:50, Sudarshan Shetty wrote:
> >>> Update the gpio-backlight binding to support configurations that require
> >>> more than one GPIO for enabling/disabling the backlight.
> >>
> >>
> >> Why? Which devices need it? How a backlight would have three enable
> >> GPIOs? I really do not believe, so you need to write proper hardware
> >> justification.
> >>
> >
> > To clarify our hardware setup:
> > the panel requires one GPIO for the backlight enable signal, and it
> > also has a PWM input. Since the QCS615 does not provide a PWM controller
> > for this use case, the PWM input is connected to a GPIO that is driven
> > high to provide a constant 100% duty cycle, as explained in the link
> > below.
> > https://lore.kernel.org/all/20251028061636.724667-1-tessolveupstream@gmail.com/T/#m93ca4e5c7bf055715ed13316d91f0cd544244cf5
>
> That's not an enable gpio, but PWM.
>
> You write bindings for this device, not for something else - like your
> board.

Sudarshan: I believe at one point the intent was to model this hardware
as a pwm-backlight (using enables GPIOs to drive the enable pin)
attached to a pwm-gpio (to drive the PWM pin). Did this approach work?


Daniel.
