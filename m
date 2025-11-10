Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E40C47B48
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCC910E3EC;
	Mon, 10 Nov 2025 15:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="drV8FAAn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F1210E06F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:55:07 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3436d6bdce8so2531330a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 07:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762790106; x=1763394906; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6R6wcVAFeAUcZ6mJYKCCW0Bji6CCIjd7Ps1e8q5bT4A=;
 b=drV8FAAnKNTpB+3NlfJd8TsUSa8HR9lZRXMBkrNAzhbe0bBKZRHQR/0oB+gVDgyHmz
 tTagkODH/uVPjAIRP388aSZVk0cpxXvR3enGiRCF9z500Nnuuog18Ql350ylIXo6gVxT
 RNtOJPoY4d9n/7cENNUaLnYg2mFKaGWhQS5q+f5/WtbCLineyjZHx8GnV+vHU1qyahdU
 tEXjBhKTzvynEglL5768+8pbrvV+1tlPJW3Qd1+La1PPhEdaf2EKXGcBbEIbTjwUhjLO
 8MmGmkuAw91Xa5X81m+dNL/DS4F0oaK4Jb2HikaCZoLZFRnlCleGAY2GVFqzgoWPEENh
 UJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762790106; x=1763394906;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6R6wcVAFeAUcZ6mJYKCCW0Bji6CCIjd7Ps1e8q5bT4A=;
 b=g3YRrSbH9oYeXXBYjH3D6ClMOlH0f8wWdgZLaB/ZCqOD0G5ZXxligA2SnGDHKSj1Lf
 vSihRExQcBa13xrJY8AKIPQ0OeyPEYdIaYtH0wE8AjhGhJj5undDFtn7R0DaY+Qtk/hv
 d+HMj6T8oQVIEdB247owsTU8UEzOuOdPjpfzBQdnQH1sDINJYEf+3wAhoe0BYKguN5B7
 Xr2au/HGtAcrqIagRd+sXJZcyqkDtNrZ8XlL0XDCgksEkCah7Q06tKx/fJGK7hn0nahH
 bBfDn1GUgfEsEvS97mFar11pOpXVoI/G9meSydKPPdJCgIBEowrNzv3/ZkTmuedWQrmA
 ca/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOcqWq9NZ0kunp7LKOZzQamYsvz2/A5SUsDKJZApNtsWNrR4bClCG0gEuNGNr4cJsv75DEt7dQ4Rk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzCQ+dvCFIM0XCZG1wyNnPxeJOhrOQ9ZED77yVfWVHa/Y33N4G
 vd5++Ox+vgEO/HKgwiLTRbm09tsBmDU2yJxRwcOyCitPmAZiHYz1s6H9zhEkiwHG1nGIhGBsVRz
 RuE8GGdyRa40qtPNCiMC1s2MQ2req3IA=
X-Gm-Gg: ASbGncvsvKh88zTvaiRvFpinnFoYAx7x4jNrNFAmyp0xCQincTutLeYuA4yDCyDIRhe
 70y9ekIRTyYROB4CHys+27sTHbN7nH4JSStkU9soY+5+Lks/uTZKy+7SLU2Ev6gxnsN5AFiWGV6
 ZFYrnBgrcSJxuI0kcvJH3DPgCnuBnCsAHXB/UsmJD+p4yOCs1RHWYBGvkEwOYhmrUOQfS39SPsE
 CgUCOtpCPlyqFrYwweDnES0MmJwPRerODA6REHFcHycl/i9o3YsXkHazlA=
X-Google-Smtp-Source: AGHT+IHCrQU0UlElplZd+YPzXUqH9miCN+y+iRChbMn/h7fN73CjNrmEf5PFWQKDUy/hBQwfC1VOyq54JxIn8cvEg2E=
X-Received: by 2002:a17:90b:54c3:b0:33e:2334:ef05 with SMTP id
 98e67ed59e1d1-3436cd06506mr9221689a91.28.1762790106437; Mon, 10 Nov 2025
 07:55:06 -0800 (PST)
MIME-Version: 1.0
References: <20250630202703.13844-1-gert.wollny@collabora.com>
 <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251110144625.18653-2-gert.wollny@collabora.com>
In-Reply-To: <20251110144625.18653-2-gert.wollny@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 10 Nov 2025 16:54:54 +0100
X-Gm-Features: AWmQ_bm2wmrOPItOxwhoBd9H4sTLBEoxQE9s611ak2i40wnU7FFtiRLd5trLVSQ
Message-ID: <CAH9NwWcYOfrjbL==PBZ8z-Ta-C9EVQSypovqturj4=ROCfxpqQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/etnaviv: Add command stream definitions
 required for a PPU flop reset
To: gert.wollny@collabora.com
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

>
> From: Gert Wollny <gert.wollny@collabora.com>
>
> v2: move some defines that resided in etnaviv_flop_reset.c
>     into the header as well
>
> v3: fix spacing/tab stops
>
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
