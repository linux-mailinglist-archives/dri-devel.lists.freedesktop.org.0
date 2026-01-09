Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0535DD07901
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 08:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E9F10E102;
	Fri,  9 Jan 2026 07:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=0x0f.com header.i=@0x0f.com header.b="bReNOxzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA26B10E102
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 07:28:32 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-34c565c3673so1343536a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 23:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1767943712; x=1768548512; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z4zdMgkF80Daz5JaXcAIXXKM0qk/WNZUzdY7NnN+H2A=;
 b=bReNOxzYfRfVNBx3plwEb27WNsulAutChF86RaW9sg5u9PhVy0VNao6KSF1wZfyyPu
 NndOh7HDnSdkbwEd85pqsQzfmIvWt64+jIfRTvbKKDbwTDt7+f1IuMPWyshGS5mcN+Z8
 RPJ66ZZNfJt2V3V+5opoc84/moe+hCxuqVsxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767943712; x=1768548512;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4zdMgkF80Daz5JaXcAIXXKM0qk/WNZUzdY7NnN+H2A=;
 b=byNtbEcLtoBCMRYvDW/3mJel0xEfyC1lHHGx/lknqTKSClnRZdSnKu/g+o60aNZNIz
 xaxQS9mYKYy5JPlRGINm6w7PSAZtRxu/wsXY3c0Ivzt1fYDEuw1uGYW1HbEcuBd5BpDT
 Skfj8Y081FcuauxK04uxh0dd9BvZhiAy1hnFEXJ1xP68qVpfEq5B7rbmN+otGgstzyjt
 U7oCb/qcDehn0Kmtb0BVnIjOvquP/GpE51XRbpf361YtiA7ceYu3CHVcnqlLPaldJudg
 l6miQpiFIpXkx9uNmshN6B+7e0jxGFsmwCdL+zr20F8lX4vvxhPi8pCKSW4elEb41nST
 sP8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVADMbfQ8bAsFRuNC+dHXfWAMA6wlxdBNU1oh4WjLC9XfoIX6q8eco37duT56OKvv30/RgkFYIrBKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywnwklyx0ZWTVR8Jc/G/m5/tXr5a+jeTdsoNg7bflE2Sqxwcuis
 E3IJYan8EarLAzKoDIqwBKmYhSOuasDN7yLaVP6FQmXksAxpRltyX2AvFw8IRmMVgBOHruLlWLz
 lse9VrFHoGMhrJjgGIEm5epOxQq0r5otQHjcB5EvIAw==
X-Gm-Gg: AY/fxX4Tj2AxWWS9fXZktf5kPZfM1P3D5LEULD40gDQ1FEsRmgGKAp4QP9xN0AfXBpj
 R0Ht93pzMR1rL2YSL2NBwq+zXXs6SwjQwWfamtZDUMccUSzhjUbU3iGtoWcyZRHjt8Qs0PV2SwP
 D1PuHZ4Hws7a8at5YAOT3+stnNbnE3Kw4eIdG/61hnKh2kEN7td7DMbraFvJcY685LI/OCSjFaF
 0iDk0AvIVogNw5XrSLydUfD0LJNnYg8xLUwndb2u0if+JTqGnITn4Mg66fhKticOaN8A1RjRRgZ
 T8hi5WA=
X-Google-Smtp-Source: AGHT+IGhY024567WzIfV7SQyZniYkmhCoMDXSKq8EUCc6rVKifO3Af8TaSrLk2X1FvkcDFG9K8f9sjPRQu55hlxX9Jc=
X-Received: by 2002:a17:90b:4c0c:b0:34a:be93:72ee with SMTP id
 98e67ed59e1d1-34f68b64e1fmr8314764a91.8.1767943712031; Thu, 08 Jan 2026
 23:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
 <20260108-custom-logo-v3-6-5a7aada7a6d4@kernel.org>
In-Reply-To: <20260108-custom-logo-v3-6-5a7aada7a6d4@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 9 Jan 2026 16:28:21 +0900
X-Gm-Features: AQt7F2qucaTCcxw87Ptbiuf4h1j-D8sMO9Oi1oo6s6YL0yzRkC93FMC01A59Z3s
Message-ID: <CAFr9PXkbkxKzT=p7xrz3Ti9+1S5B=qfNanw31hs9rbNuOZb=jA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] video/logo: remove logo_mac_clut224
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org
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

Hi Vincent,

On Fri, 9 Jan 2026 at 04:08, Vincent Mailhol <mailhol@kernel.org> wrote:
> Considering that the logo_mac_clut224 is only used by the Macintosh
> 68k, a machine whose sales ended some thirty years ago and which thus
> represents a very small user base

I guess I'm one of the few people that has actually seen that logo on
real hardware in a long time...
This change seems fine to me.

Bit off-topic but despite the 68k mac not being sold for 30 years
there is still a very active following around it.
This year might be the year of a 100MHz 68060 powered classic mac[0].

0 - https://68kmla.org/bb/threads/new-project-prodigy-040-060-card.51381/
