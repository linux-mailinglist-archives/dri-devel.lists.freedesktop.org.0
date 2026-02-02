Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MToNF98gGnE8wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:28:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B3CAECB
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C6410E418;
	Mon,  2 Feb 2026 10:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="UoAzXhEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5672010E418
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 10:28:44 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so43083755e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 02:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770028123; x=1770632923;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CGixetDr5XeqnxjJDvhNpPyZj8eg9DUKX5ATtM82gGg=;
 b=UoAzXhEqlC/j/CCb8tJTCg8iApo/C9QgSU7sILLk+4vxWMg9y4Apgl2N2SB3jOahws
 PVcQ6NWxd9Uo2p83Wm0RCk4KaPWoAryqaECBMHNYKyF2YT2a8N3C3hgCabmSucxoaNiz
 r0Brp4KYNLxVQkh4t/hNnS2rEIounFytjYBehGLmVgU1lOuYjpaTdoag9rMl8KmorLDi
 6IeXiLhP2jrGvg/JC2RhFnZOFooBdNDQByZiox7iAh97nq86PmJrlPuf354ml6F+6//9
 2KNrwAp6xlxzdJ+5oq9TwE20JJHlLkXGeiR3YB8CkULEt3ESOZG+0ZTPubVNrhugAfIK
 bSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770028123; x=1770632923;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CGixetDr5XeqnxjJDvhNpPyZj8eg9DUKX5ATtM82gGg=;
 b=rkPuTQrijbm9R/BmCXu6mHDLCX2mkPv+yGIBf5X3/Ko/FXYWZGqir/kc6/5FQDWg1Y
 vBHWiifF/AVnb184OxXFgv2n+f/Xzhw7roGHT6A/cwyWM+iQVs3ajQPC59UykNlCOKmM
 VVHFLEX13NT1Nbyz+tD9SrqCYYxv8uoK/6+LkS5RNIPTfcncs01RmwRRUO95ZsGBneGm
 k6GVWAbBbG20gLmoePyc1OMsf7nfKbgfES1ek8Af7WA4Xpv40CpTMcB2XKzMV7DZwFR2
 BkpMn1kDIV73oJBOHy1HvpKtivBl8kL7/1fIkRUNJF6Z7H7jW+Sy0bljGdWTmbZ4WooQ
 njyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcKeXSiO5Ju0PiOA1Rn+PVkvSXfxif3N0uEsOXkPuxMgtSXYxeqSIM+Z8zovZ5aiWWNmlDxP3gRpI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/63eIvnL89/Oxb5dhXoBn+pT/qwO9ZYGWwEGDvOchFkzKz1ri
 AUb9TkWdOXk487fSi7atOlrLQhb9bZmLa5EezWP/boFa/cLT9XxwNvuVHJuczSwrxuk=
X-Gm-Gg: AZuq6aIwR7YD26jualakbOvLJKcChLRAKlfz1glIlUIhPjlx+2ESc5BQijwujcjaszQ
 eUFzAhZVnfKonFLHsBDvmsjSt/ixQwzEFpXtO5dIpayAYN+uId7goXfbB6RE3obTdYURg4bowNZ
 f0mPjnXdOoeGadVMTeo8A1MQl3EkQmq+SFrDle6T2xH8OT941d8yu8W3hbnZhq1vE8lvzb8Ey3E
 rCS/61krxf8fPzx020ZHT9RwdlRe/Hf3cpolXE5rAHyAEX3WuEAFbUh2jL+0Ea7+TvAe2LREiJN
 p6svpwEUYSM/Qayf68qfCIZCO6xDG5fj7x/anMr9HlxVAY0aL+S9URR/nnuzCHgWqyGMlV5v1PS
 7BDE7c38Gf3ogsWHGIPaeuOZP0TrpiaqM/HkK5bLegI265W8DCtVK1ctFABdE8HAnYxxu4xZ8EP
 RxmrKnPjKygG1UadLANqWIWXSUpdC9/zzAY8cEjfzLLuSE7uIq55CM/Qxccvj/F/EbzIuNXl8OT
 SmCNOTBpQ/KOqFz+a+jmqIACNJqzrXYmqH+fjbntudMT7h0ziiouvO+CR7O+ywgEBxW/72WebNi
 VjvnX98=
X-Received: by 2002:a05:600c:34ca:b0:480:3b4e:41ba with SMTP id
 5b1f17b1804b1-482db48d595mr129371045e9.18.1770028122637; 
 Mon, 02 Feb 2026 02:28:42 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480705956f1sm350132565e9.11.2026.02.02.02.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 02:28:42 -0800 (PST)
Date: Mon, 2 Feb 2026 10:28:40 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: tessolveupstream@gmail.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
Message-ID: <aYB8WPTUXHqfZpyH@aspen.lan>
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
 <20260120125036.2203995-2-tessolveupstream@gmail.com>
 <3f3c47ea-1660-4bd4-ab89-3bdf58217995@kernel.org>
 <54d156ba-e177-4059-a808-2505983b4e2e@gmail.com>
 <500b603d-5abc-4c45-8d56-bbc88fc85b83@kernel.org>
 <aXnxGPNtk5BwoJOu@aspen.lan>
 <304ef935-e82b-4556-be3c-6ec4f57cf68c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <304ef935-e82b-4556-be3c-6ec4f57cf68c@gmail.com>
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
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tessolveupstream@gmail.com,m:krzk@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[daniel@riscstar.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,riscstar-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 457B3CAECB
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 11:11:34AM +0530, tessolveupstream@gmail.com wrote:
> On 28-01-2026 16:50, Daniel Thompson wrote:
> > On Wed, Jan 28, 2026 at 11:11:33AM +0100, Krzysztof Kozlowski wrote:
> >> On 23/01/2026 12:11, tessolveupstream@gmail.com wrote:
> >>>
> >>>
> >>> On 20-01-2026 20:01, Krzysztof Kozlowski wrote:
> >>>> On 20/01/2026 13:50, Sudarshan Shetty wrote:
> >>>>> Update the gpio-backlight binding to support configurations that require
> >>>>> more than one GPIO for enabling/disabling the backlight.
> >>>>
> >>>>
> >>>> Why? Which devices need it? How a backlight would have three enable
> >>>> GPIOs? I really do not believe, so you need to write proper hardware
> >>>> justification.
> >>>>
> >>>
> >>> To clarify our hardware setup:
> >>> the panel requires one GPIO for the backlight enable signal, and it
> >>> also has a PWM input. Since the QCS615 does not provide a PWM controller
> >>> for this use case, the PWM input is connected to a GPIO that is driven
> >>> high to provide a constant 100% duty cycle, as explained in the link
> >>> below.
> >>> https://lore.kernel.org/all/20251028061636.724667-1-tessolveupstream@gmail.com/T/#m93ca4e5c7bf055715ed13316d91f0cd544244cf5
> >>
> >> That's not an enable gpio, but PWM.
> >>
> >> You write bindings for this device, not for something else - like your
> >> board.
> >
> > Sudarshan: I believe at one point the intent was to model this hardware
> > as a pwm-backlight (using enables GPIOs to drive the enable pin)
> > attached to a pwm-gpio (to drive the PWM pin). Did this approach work?
> >
>
> Yes, the original plan was to model this using pwm‑gpio, and that
> setup worked. But on the SOC there’s no actual PWM controller available
> for this path— the LED_PWM line is just tied to a GPIO that’s driven
> high (effectively a fixed 100% duty cycle). Because of that, describing
> it as a PWM in DT was flagged as incorrect.
>
> As pointed out during the SoC DTS review, the correct path forward is
> to extend gpio‑backlight to handle multiple GPIOs, rather than
> representing them as multiple separate backlight devices.

That not quite what I got from the link above. There is a suggestion to
use gpio-backlight, but the reason it was flagged is because pwm-gpio
was unused... it was not referenced by a pwm-backlight.

Having said that I suspect it is better to model this backlight controller
on this board as a gpio-backlight because from a backlight controller
point of this that is physically what the controller is composed of
(assuming there is not sufficient capacitance on the signal for a
software PWM to work at anything other than 0% and 100%). Even if those
GPIO signals are connected to the panel's PWM input I'm not sure that's
relevant because none of the backlight controller bindings model the
panel anyway.

Whatever route you select, you do need to make it clear in the patch
description *why* it is correct to model the system as a gpio-backlight.
Deferring to (potentially ambiguous) review comments is not sufficient
to explain why changing the gpio-backlight bindings are an improvement.


Daniel.
