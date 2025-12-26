Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72233CDEAEF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 13:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE10110FBB5;
	Fri, 26 Dec 2025 12:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KuQHGclL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446B610FBB5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 12:19:25 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477cf25ceccso80311635e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 04:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766751564; x=1767356364;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+W1bv3m3GSUdPTDj1JCdFEpo2xwyf2MGFejhwecAMMI=;
 b=KuQHGclLEe+jzJgE2PZdDGKZh55zI1OUleQ6jwYPoBW2ELOFlWsNpikvDR2FuIFHnj
 ViE2xJ2iuzihnBUNoGmwUBPQLxtAhk+zEnCOR7N1aRXLlCseI2w6rDWI8v4SgyYpMueU
 KMpJCu2hWFWtjIDfiXIOuIQH5myDFC6fSqGDvyGS5DTSRt8rDzXgXqmIAaGrQYeoH4Ed
 qzzuOPLzUVC6XXB6w5e5FCWZwe5CPP+78pl7lzfrzPESu7HSl77LJ7f0O26I83xy1hCF
 +KyRIFu/TAC0VN6meNEpvOQBmfRU5kjQR8iD1shmBHfj3boDLRrWoY+pCa9UYiejr3ZV
 80Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766751564; x=1767356364;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+W1bv3m3GSUdPTDj1JCdFEpo2xwyf2MGFejhwecAMMI=;
 b=atmGk6IYsl1ZtpWdxsXJ8K4Kqw5iq+ec2rdjUdNUWljtEcZOtjpkQBktKTON4EBZhu
 DGVwXZj6PwsJ5vfoj42FtNdQ9VkGBUKxt1BHhT57hgtlWUiRBSHD4yt/JbcfzpZqs0kA
 tI9TLS4752FyFWp60BzPsXQiq8EKKxDKpM7EPRelIBVVLmRCB69Fisf4kFFwUNOZtMDd
 5lcB/MwJPC6d+02VLdfCMbncTyWNMDJQe+q95/DBuquNf1cxmwZw9bNbMl2ibNBy8Z/x
 xsRSoFECmW0giLyG421l7YC2Anzv80n6SpfL9NGdEQvZoOz+D2XMz/JurbvUn1MmbZB4
 pyAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhikhu8JTAxfREtqY5qzNIqqvdcckNNo5kUEhUYPUknJCvkq83yKOImZaSWgcZdtDKlxszhwsALCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4KC19wqdsRZUcQJkmodK3KD00wSJA74tTyKoWD/YNayPrkfa4
 tzr9CMBTQ2B/xpuhqtI/qxLrB/KOgD5KwpBaTP1G2HyIF2PeyMQd5DzjnTwx1bxCb2oC1yc6iJV
 Lt3Gh3MB/4xTdFHLKww==
X-Google-Smtp-Source: AGHT+IHfYRBsdxYx8A+M6deC5zdbNM/+BrSSUp5hMyDaov75DGi0YM7QWmPujdqLb70RNtyX5B4BR6gvTl7eCRg=
X-Received: from wmbgz11.prod.google.com
 ([2002:a05:600c:888b:b0:46e:4c7c:5162])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348b:b0:477:a36f:1a57 with SMTP id
 5b1f17b1804b1-47d276f8aeemr191388885e9.3.1766751563790; 
 Fri, 26 Dec 2025 04:19:23 -0800 (PST)
Date: Fri, 26 Dec 2025 12:19:22 +0000
In-Reply-To: <20251223115949.32531-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20251223115949.32531-1-dakr@kernel.org>
Message-ID: <aU59Si4Syv6TzP5c@google.com>
Subject: Re: [PATCH] MAINTAINERS: fix typo in TYR DRM driver entry
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, tamird@kernel.org, 
 boris.brezillon@collabora.com, carsten.haitzler@foss.arm.com, 
 beata.michalska@arm.com, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Tue, Dec 23, 2025 at 12:59:47PM +0100, Danilo Krummrich wrote:
> Fix a missing ':' in the ARM MALI TYR DRM DRIVER entry, which does
> prevent script/get_maintainer.pl to properly work and pick up the
> corresponding maintainers.
> 
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
> Reported-by: Tamir Duberstein <tamird@kernel.org>
> Closes: https://lore.kernel.org/lkml/CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_ramNY-oh-0X+ayA@mail.gmail.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-fixes. Thanks!

