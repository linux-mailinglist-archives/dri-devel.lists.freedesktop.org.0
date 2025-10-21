Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F0BF5A54
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 11:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3723A10E5B1;
	Tue, 21 Oct 2025 09:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eaTUWinI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0054610E2E6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:52:10 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-33bbc4e81dfso5466417a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761040330; x=1761645130; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K8jwCSDNhGwJHggzSQN1M2tcia9PBWtTMzqgZ2U6K50=;
 b=eaTUWinIzQxqY7aiRT6ulqdkyQgJh0PB8Qx8Ws4n7ubhZJvYOWTETiFH5ozgqEg3F5
 mDRD3RvfOZOWn9hHzHmDfzx06ZSW2L96JpUX3lmd/sQ59gBDCh9JG9nrnCLP55soiOwV
 nMEpQ4JG+/55uqb5UnNJoHM92x93zp1k6q6n586zUxVmxu3oX3tFwxJHsnk+rcUhJvGH
 8onlKJLA8sjymbBF7WFBmt6mLQn8qcct3CNV3u2uNtlMnYKN0lgdi+oV6+9384dUYXPv
 njusAXbv2CB5FOZQ/G4pETw5wIQAAPYlw7cR2QGtd3QlLMUPI8JxxTKQeJWpBSSdPvYG
 K4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761040330; x=1761645130;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K8jwCSDNhGwJHggzSQN1M2tcia9PBWtTMzqgZ2U6K50=;
 b=OUBHj4e/3ezcUY3IQB5BvzeZobx1D5ihbzgXpNfQH4aimLiCS4YwyM5P4QGwS18Ech
 sknxinSwxZ4jLi7eJcDLEs6Hjvk1mxOVE9TKg39To1/3SGUKMbHyS288yvfWcj0fScZp
 dScn+ifRC/TMccFCcKEXBxtEVLymHo359OigcYwN2lMnDW+FqYruy2oT5XosRndFnhBq
 dGi7NFMxbre0EL68WDKykkhjCphI7rKLWggxwuHOLdsjI8nZq/aovJvffZ7VwJZfg3Wg
 8Q+N1mDE0cnemyD86JOw12r/KtWXv1+shpDLDUkb/RUYTsXkIa+uxO8XC53zqoqpxEmH
 R27w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF3gLxZE2yzDuiVXM3BvXDavQ+E3BAV3btXxJMUkOSlmmV2WaqJGaKPgCzHEBjXqK6rtCU3sf6PJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw51tCizmwjwDa7b/RgnG6XdJNY0i7EXTslTqhU/DV9/WQXa1Wb
 miIRzpszQq/2cLETpVbM31FGloaxqO+fF8PNrRcoov2nwXLeZ6XYFKNuQMCp2izmJ45z04+GaZs
 8+A8tMwqjc7RP7iVlxb3pTU3bY54oXgs=
X-Gm-Gg: ASbGncuXsnCKZNRejpeo9bc7C5AakCelKAGb8FOwurxonFiEOnrel7SWV420me8LAOU
 T3xPJbFVajIywXM+RHRyXMwSC3A7rMmmjC/JSApDTIdigqkVPCPfn04YAz7O+D7U5xM/cODf+lH
 9HOWWsCSJtRb+1e2CkK4bZO3NFvhmvflG/zQtowjoP7hp7W7bByRWWtysHQPEPFphQ9rOqyfL+t
 9Wwn0HDYYST0o16pXXxrH7YYxIB5oI76plnML0J0Ni9qynFFrBW7QGPyMmH3cT3Exr8Gw==
X-Google-Smtp-Source: AGHT+IG23FxeOHCoMqTfhFgLarGEk0iZCA29r/9imOIOPJUHrjyHV2ZDMGJ7QYTK8sEdU0yOMeCneV8tQoishg1dTC4=
X-Received: by 2002:a17:90b:248f:b0:33b:cfae:3621 with SMTP id
 98e67ed59e1d1-33bcfae47d8mr12840569a91.32.1761040330410; Tue, 21 Oct 2025
 02:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251021093723.3887980-1-l.stach@pengutronix.de>
In-Reply-To: <20251021093723.3887980-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 21 Oct 2025 11:51:58 +0200
X-Gm-Features: AS18NWD4zdSyZ7dAT--Q7ATUT1K_RvSYXFdN1uFlkuPoTveP-glb9vojpIzg8po
Message-ID: <CAH9NwWfEYJLF2L4=uXs0Dv61TkYsGsGLHohRrgPRi6c3n99YQA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/etnaviv: fix flush sequence logic
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
> From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>
> The current logic uses the flush sequence from the current address
> space. This is harmless when deducing the flush requirements for the
> current submit, as either the incoming address space is the same one
> as the currently active one or we switch context, in which case the
> flush is unconditional.
>
> However, this sequence is also stored as the current flush sequence
> of the GPU. If we switch context the stored flush sequence will no
> longer belong to the currently active address space. This incoherency
> can then cause missed flushes, resulting in translation errors.
>
> Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
