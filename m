Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E0A3DECD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1FA10E9A2;
	Thu, 20 Feb 2025 15:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="U1WhYni7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF4410E9A2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:37:54 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6e66b4607d2so4968576d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 07:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1740065873; x=1740670673;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CIhju5VbOnCPzyQKlcCT5jMfOJKAXyz0TX6VSDMcljc=;
 b=U1WhYni7d63qutwV9y3lcv6iOjnj2b7SmP4zv6yuQZBT9zORbKLukNk7VSdtHQhJAK
 9K4M2GdrB5pcckhHTyOqcj3Asj1ufFxgxbnINkxnG23jXh/5AuONcTzuiK4YeVpLGagT
 lfPWU8lxrovwHtR5sGVS7XSX1bzrxjphzpv1O8RLCyZfHTLJdNosSpTOjPJXw5NUOSoh
 cOT641WLE68Olb4FpjCSro2bsiwBmYVIqAPf6grM0bsI6kVDGWhm1jaWgazIqnNrWon0
 8iaGb7hIcKwrPdHfHMycOkqSsCUlf9/HDfWQUPaYPSIv39Z/HpBiZcUyDTm0we2j+734
 7sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740065873; x=1740670673;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CIhju5VbOnCPzyQKlcCT5jMfOJKAXyz0TX6VSDMcljc=;
 b=ZRqeWL7X6+R/zVRXDSItHmahWRIFL5tx3CBllde506xsoSBJaXVaId3f/oz5nBMmjG
 bBygxOum5fphZfexjEEvRW8vqu26tZuoCy2E5bU2heO1XPaHjcOa2bMGcXPXXFv9Ew6X
 V/HTjp35uM+rZuuNBR/H9Gumd0VP2B+OUVEATzcfcsSi2rvLNmW1jAEyueueVT9iylK7
 +jaNEvyUTswk8CzccQF2Y7QY4n1sIIiyVNtR/UwlI7yyRJc97FN44jsbaSIaqLkIDMpf
 uAEyHPuSo8Rv8ZtBuuvrapXCN2IhnY7TiqMIyMKSDZWr77pMW2+ulPXmeFzipwfHuLQa
 /IKw==
X-Gm-Message-State: AOJu0YxzsxnCVHsQkMDC48AWDalQNQctH45ctNYytW2t0SwKkeBba9Fe
 0WWX/dNC/u8qXNXfEh6JQRxbRRljkxGfhWjkNboTHg+se6+vNA1BzCvr+f1pT0s=
X-Gm-Gg: ASbGnctji657WTtgBbQe6EwZe1MZGC/1hxyCBnc21ttJt93cIJ5h/CIWOplFPUHLwJt
 pazmcGO+BB0ON9nDiO960f2sh9QyBTltLZLB5RmkaB8KoR9lWORFRPsHDfYOKuJVXFpDK0e/iHx
 SeMBupn6LhEQDu+9DtnJTERK5hBpqaCTglik/Gy/HQ5zekbc4kH2zz8o4q8JxP2FN0HpxRdpejr
 57nDUntNO1/Dw0jYJwp5pVlH3QanZJ3tqYYZMsld69U2kQANYchro08Zni9z8WL4PX6Tof+gzxU
 auPgcws3AB0QpA==
X-Google-Smtp-Source: AGHT+IFcIm7KN2/kYyHI5w4jBjyHNX4kq0DRfJRG5JubjcBZrPYm8p9wZWeE5aKd+xtJNfQyZ49tZg==
X-Received: by 2002:a05:6214:29e1:b0:6e2:55b5:91d1 with SMTP id
 6a1803df08f44-6e697413d1fmr120862276d6.0.1740065873655; 
 Thu, 20 Feb 2025 07:37:53 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6e65d9f3498sm86868896d6.84.2025.02.20.07.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 07:37:52 -0800 (PST)
Date: Thu, 20 Feb 2025 10:37:51 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org,
 Tejun Heo <tj@kernel.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>
Subject: Re: [PATCH] MAINTAINERS: Add entry for DMEM cgroup controller
Message-ID: <20250220153751.GA1276171@cmpxchg.org>
References: <20250220140757.16823-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220140757.16823-1-dev@lankhorst.se>
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

On Thu, Feb 20, 2025 at 03:07:57PM +0100, Maarten Lankhorst wrote:
> The cgroups controller is currently maintained through the
> drm-misc tree, so lets add add Maxime Ripard, Natalie Vock
> and me as specific maintainers for dmem.
> 
> We keep the cgroup mailing list CC'd on all cgroup specific patches.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Natalie Vock <natalie.vock@gmx.de>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
