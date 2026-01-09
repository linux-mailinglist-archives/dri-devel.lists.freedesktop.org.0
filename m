Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FABD07C6A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E6510E809;
	Fri,  9 Jan 2026 08:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sUayzPK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B78310E808
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:23:54 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-431026b6252so3309952f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767947033; x=1768551833;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Bz6XZoZwTVNk1kaS460BdgY2+XDbKdduhK2aC7bHOvY=;
 b=sUayzPK2amOPXRBB1w6TYRaebC/hrarCEg6k+bgmhFbrExrNuGD3gNq7frZhkAlFW5
 Faj6Yj5zeA38wqawXdh3JHNydNzc9pDb1Xn41sNokbXvjMTP4yB24c4GLohbf25tylCC
 9XD+oilbdn/PXOCFAi90hQ6GH5LpuBQ5ecX7qO5FZWDuFdPD9JOOos5LwoxwwCLvwD5X
 IzhUuqWnswqmWaxbaZZ1hFnO7TVkCWMEuhTUVEkJJitxPAaSJRrR/+o5jUR7iT7VGiou
 gapvL6SiXPyCKv2/9COnqfmQy5OHTpF0kBe+wPJNAoJRPq1goBIKmNtOxCyuSjrI+KWF
 9m+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767947033; x=1768551833;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bz6XZoZwTVNk1kaS460BdgY2+XDbKdduhK2aC7bHOvY=;
 b=ld4gsCFlmZPexJrgKBdF2sRbl47sF0ZxJqj5uu0HpcyT9/nzq3TkcAZnA7wUl8qGjT
 8XXZQxNDE8W7lYGMJ9D9VZKK4J84UoE3/v6KtVLi50baqYxIU80W98cY0jwZNgJTuGOC
 3zHr6yV9tDmpvtqoJ3P6XJkk35PcI7uaStZCkxY0QfMo3Nh0lEXYCDdIEvGmj+wEWsag
 GXlV+x2PkJ1sW+EZ5ENb4n337+M5rNV7M1uci+6vUKgbF9mlFqrNyGJij/DigR4hXnsM
 F/wlXDAmAGkFdx7FqkAq5uUZLWyBZj5LAcM9uhT2z/razO4vvvRhuEedpgiiJwRHhUu6
 GeLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjdcEryfAH85sE6HYQlrerR6lGSrCS9gxaqKYWQ+JIlI+z5LqELOM629WYSAqtwIVTINQx4uuZPTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo+KZOWvuz5OxOAjnmZ5QdVHVirinqDb0Fm9IcC+zd2629I7eZ
 9jLG/2rm3+LAc3xBQ6BafJJvm3F6Ay8BTiuVgMTa1/um1lcZIBxu5HnYqu/l3m+dWK+TMuOYDtf
 mfdaPutXO/N4lr+50KA==
X-Google-Smtp-Source: AGHT+IEORxBIBX+gxAwgYCUgmsBm4kcmdt3wMvqlRa+ow6HYY7tuSd6AdQ6sTWBCwLoPH+xaT8wwKwsFL/ro6+I=
X-Received: from wrp30.prod.google.com ([2002:a05:6000:41fe:b0:430:f692:a94e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:240f:b0:432:5b81:480 with SMTP id
 ffacd0b85a97d-432c3774163mr10272579f8f.24.1767947032905; 
 Fri, 09 Jan 2026 00:23:52 -0800 (PST)
Date: Fri, 9 Jan 2026 08:23:52 +0000
In-Reply-To: <20260109135438.5b4f463d@canb.auug.org.au>
Mime-Version: 1.0
References: <20260109135438.5b4f463d@canb.auug.org.au>
Message-ID: <aWC7GKcOB6m4LFGz@google.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Fri, Jan 09, 2026 at 01:54:38PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> WARNING: drivers/gpu/drm/drm_gpuvm.c:1855 expecting prototype for drm_gpuvm_bo_obtain(). Prototype was for drm_gpuvm_bo_obtain_locked() instead
> 
> Introduced by commit
> 
>   9bf4ca1e699c ("drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode")
> 
> -- 
> Cheers,
> Stephen Rothwell

Thanks, here is the fix:
https://lore.kernel.org/all/20260109082019.3999814-1-aliceryhl@google.com/

Alice
