Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CBA96D5A0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 12:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3304A10E855;
	Thu,  5 Sep 2024 10:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="htBiISGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A06710E84F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 10:16:36 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e04196b7603so706266276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1725531395; x=1726136195;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xd6tRDcBI6nT0vpG0+47dCoixHmT48y9ZIC4bv5qVFY=;
 b=htBiISGElkQQwgK1SQoF/+qPjmAgVpRBZ3gLBuVkIckzW1XdVkeProqo/m/11NDoTh
 F81k9ZqYsq0eqFa/340NBGFp3NjNLSf48QpLhaVnhreL8XPKeSbaYmH1qMYiWUZl60jN
 Jq6j/VBDjqTP+vjCmHS5bhz3wo5D/eS17K8r7B8KPry/q2itnybvO4pJEey37nzX26nA
 ePcHnBli29Mo77rbsyZwn8xmDTHBZ0f/lYZ0l4GqQERfEbxaHDnAmz+cvXL47zAQpr/o
 K2YlHvC26r5kx8ixmf43xoHCq7r2AScRtgeoA/PelThrkRQrs1nby7LHmREoR1iNFaMu
 DX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725531395; x=1726136195;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xd6tRDcBI6nT0vpG0+47dCoixHmT48y9ZIC4bv5qVFY=;
 b=JlG72WvC25hrMsmLywqrIcs/D04XS7zd3GaKVpIbQq3u/q4aLcgpv3z+DUaW8+pRK1
 SxI1PO6VNMTYs/y92ZBzUNZT2oHdCldbrt7GkpPSaIHHwMojxN21jaX2rXgPekZL58XN
 Qk5/l1nTbY9ZJRbLUsyMIB0+BIMFsPMwLnZ4qdBhDesDy1PUAhxnWKcSe2Zsn823ndPq
 jkmISh253AOe7nB/leP8Aoy5Qk558RYXTlA36DXP4x+lw4KMlrUmredfSGdGOhVQc2HD
 zhG32xiAfpEVIUT26go7WXPuu2XiL5huzr7ImtmJ2I8VdNN0x/7F5f6RR0+3Mt+TphUc
 8Wuw==
X-Gm-Message-State: AOJu0YwbmRO1sHU/RTzdunedHcsHHNrxFv7UIIkS3nVunKU38VU3/Ksb
 5+1ewjiC9wtLXwEePo28FOA1Fk10BzW4rP/7Tgv9/MmLc5hikgVBIQrIVLZPCwSpfsn/F4lKB9A
 cPHIObfM9K86nikp1Il0ju9f0PWMJ0NZI54MYkg==
X-Google-Smtp-Source: AGHT+IHOAa2WnFWM0m3QmtHGwmSzixacJsCBpWRBvguStq1YD37bVLj0/P6F5Iapvjw7xs8jP/X43ydPbq380G1rQQ4=
X-Received: by 2002:a05:6902:1547:b0:e1d:1b8a:ac4 with SMTP id
 3f1490d57ef6-e1d1b8a0cbemr3960625276.11.1725531395247; Thu, 05 Sep 2024
 03:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240905093935.2780632-1-vignesh.raman@collabora.com>
In-Reply-To: <20240905093935.2780632-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Sep 2024 11:16:23 +0100
Message-ID: <CAPj87rPCctE=iJKfQXR-PJdUHR+5f-t2bRA5Daq2fzUTNekzcg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: uprev IGT and deqp-runner
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
 robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
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

Hi Vignesh,

On Thu, 5 Sept 2024 at 10:41, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Uprev IGT to the latest version and deqp-runner
> to v0.20.0. Also update expectation files.

Thanks! This is:
Reviewed-by: Daniel Stone <daniels@collabora.com>
