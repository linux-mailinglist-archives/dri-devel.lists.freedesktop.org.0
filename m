Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CFAA61A14
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 20:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C1210E286;
	Fri, 14 Mar 2025 19:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Py5z2ZGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0C010E305
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 19:06:12 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so349835e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741979170; x=1742583970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIoPbweeHXZ8jSMzIt/eB2E0Gri/NMU0G6vQgDoXF0o=;
 b=Py5z2ZGuKGf8WbeTnzckbAsC0ROomPobjoi+/uUmBcHQOngmnVP6DDwfVrQ/E2wOno
 zd+/Vg00AiFT6D/qMSCje0lhbPUkDu2X1/vNX4QNbq0Oa4S0ppneyifwhD0jx2lsLtPV
 It+QI2RpQpaW2tDHaHPEp25F8ShFibsHHaQZWr/OyM3Cu65ck1myUaB46APk+ji2EfYy
 svN2a28bilM5IgOWPf6q/HcrJqAqcaGp/FnlwBT1/WJTKIwYh8dll4HVX7paotLsjO3B
 zhkpFYPJjLuHC6woX1ck+yV8WeNuzFVJbnGm0Gcgrh4hrbxuAGMAbbA+WRkQrX+rx0NQ
 9JWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741979170; x=1742583970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EIoPbweeHXZ8jSMzIt/eB2E0Gri/NMU0G6vQgDoXF0o=;
 b=MRPTIuVQ5nD+SbvMg0pawi1uuaCRbu19NAX7QWA2XWhNFttizcMPND/X/R9NuwPZHZ
 C7Bs2sfi0tPre1dobxhOERCpr6rfOblXVlm6zwZ1RNUn3aPREM3ryzn6RBxzr299FefP
 kW3J2ig6rnBN9JOcWCrz2hMCiM2t3K/i7Hu9mJLFb0pxBAv1tzNIUwp+QkgYvFjhEC92
 jrjqsPejQobyOVjCEIVT+TGv1NAWnL/8m6egH1h9LLNO93iMsnoKAknFHea8gHh5tvV5
 AmXuDgFf1K9JEvWjx5osmya8R5OUxA6QjM5nQx/tSfQ3zDMtcFsQHlMtjPopZkFUx5YX
 SoJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAbrUSz810SHUwbJfn0voFiseRtAe/5Yb7igLK8ckO9dFSV2/AsFSj4rIO+zeLX/zc86cAfET5EJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXYzjdaJDIzeSl/Jq2jry4xfn1x6Dxfp5LW0ef5KWIFoqIPzd2
 tD+xlzwW1MwH0/pKc5EkHixrbORU8StFznKw70eQY5m2rADNhrmk
X-Gm-Gg: ASbGncvoJssqb1DPmTNTB8ypsa4Tv8EdI0waoRKebckAr9bGjge1mPgCkk9uBAepDY+
 Gf0HLro2dvAPpebfVarJItf61U1e5VAOKSg44is4CDTysYoz2nhqpILUuRYI8l2Aju4XL841I1O
 KKQOwVDXRSHun5QMhAUbI7dDAkJQcR06VG1Fn1syitUJ0De6Xl65yB4QoiGz3ek6r7eyaLKe6NO
 tHfG6ek2MXfrmFqJIszwz6DL6ToWMMIzomPaKd+PTgnyI1mhYCeHuFJM3GrGLrzDChtIC3MSpU3
 ZVv8od/JRPzoju/be4HzkUbLe+M0O2lCPN1UqCoTt7VhXzt5zQTBDv+owfEiuoNw534mU5JxiDN
 Rf9W8STk=
X-Google-Smtp-Source: AGHT+IEjEm1NLGYF77AUJiqADkJJt9c0HAwrROWKW9ldaOHP/gE/432Db9RpHAyqooeI7TNtApdt1Q==
X-Received: by 2002:a05:600c:4447:b0:43c:eea9:f45a with SMTP id
 5b1f17b1804b1-43d1ec646demr47176475e9.4.1741979169941; 
 Fri, 14 Mar 2025 12:06:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d200fae32sm25534355e9.31.2025.03.14.12.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 12:06:09 -0700 (PDT)
Date: Fri, 14 Mar 2025 19:06:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Yury Norov <yury.norov@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@kernel.org>, Kuan-Wei
 Chiu <visitorckw@gmail.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
 <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>,
 <awalls@md.metrocast.net>, <hverkuil@xs4all.nl>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
 <edumazet@google.com>, <pabeni@redhat.com>,
 <parthiban.veerasooran@microchip.com>, <arend.vanspriel@broadcom.com>,
 <johannes@sipsolutions.net>, <gregkh@linuxfoundation.org>,
 <akpm@linux-foundation.org>, <alistair@popple.id.au>,
 <linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>,
 <dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <oss-drivers@corigine.com>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>,
 <brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>,
 <bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, Yu-Chun Lin
 <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <20250314190604.53470966@pumpkin>
In-Reply-To: <b2b632cc-ca69-497f-9cf9-782bd02cac79@intel.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <20250307193643.28065d2d@pumpkin>
 <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
 <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>
 <Z9MGxknjluvbX19w@thinkpad>
 <795281B1-9B8A-477F-8012-DECD14CB53E5@zytor.com>
 <b2b632cc-ca69-497f-9cf9-782bd02cac79@intel.com>
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

On Thu, 13 Mar 2025 14:09:24 -0700
Jacob Keller <jacob.e.keller@intel.com> wrote:

> On 3/13/2025 9:36 AM, H. Peter Anvin wrote:
> > On March 13, 2025 9:24:38 AM PDT, Yury Norov <yury.norov@gmail.com> wrote:  
> >> On Wed, Mar 12, 2025 at 05:09:16PM -0700, H. Peter Anvin wrote:  
> >>> On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob.e.keller@intel.com> wrote:  
> >>
> >> [...]
> >>  
> >>>> This is really a question of whether you expect odd or even parity as
> >>>> the "true" value. I think that would depend on context, and we may not
> >>>> reach a good consensus.
> >>>>
> >>>> I do agree that my brain would jump to "true is even, false is odd".
> >>>> However, I also agree returning the value as 0 for even and 1 for odd
> >>>> kind of made sense before, and updating this to be a bool and then
> >>>> requiring to switch all the callers is a bit obnoxious...  
> >>>
> >>> Odd = 1 = true is the only same definition. It is a bitwise XOR, or sum mod 1.  
> >>
> >> The x86 implementation will be "popcnt(val) & 1", right? So if we
> >> choose to go with odd == false, we'll have to add an extra negation.
> >> So because it's a purely conventional thing, let's just pick a simpler
> >> one?
> >>
> >> Compiler's builtin parity() returns 1 for odd.
> >>
> >> Thanks,
> >> Yury  
> > 
> > The x86 implementation, no, but there will be plenty of others having that exact definition.  
> 
> Makes sense to stick with that existing convention then. Enough to
> convince me.

There is the possibility that the compiler will treat the builtin as having
an 'int' result without the constraint of it being zero or one.
In which case the conversion to bool will be a compare.
This doesn't happen on x86-64 (gcc or clang) - but who knows elsewhere.

For x86 popcnt(val) & 1 is best (except for parity8) but requires a non-archaic cpu.
(Probably Nehelem or K10 or later - includes Sandy bridge and all the 'earth movers'.)
Since performance isn't critical the generic C code is actually ok.
(The 'parity' flag bit is only set on the low 8 bits.)

	David


