Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E69AD5ECA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 21:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBE710E714;
	Wed, 11 Jun 2025 19:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HHpcOQBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ADB10E70E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 19:07:07 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e812ed38d02so143422276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749668826; x=1750273626; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1MF1dHTik4WYDT1dqFKnZOlAFt0Xaso+/EljV+ZdGk8=;
 b=HHpcOQBXsF2SIC7t2b+ducYiuwV1O1Q0U1je7yHlxa7ZTcsc+Mh4XFRnUnbQRvEjQ2
 5aZsOfHaLU4on7RsvUH/rnyIqz+i2EF8v1oJxnL1btJrV6dvzzGv2wK0Sq0b2iyf3Ztt
 hsxkirjp97pGsRS9rpQ+yDQPpGSmrTTG00b8nbDNRvtNom2Ks3j0sshSSXOuUIGPhwqD
 rG5tqubtKy0OYnj1JrWtxqeeo7h8ocTraNPXbPxqTB4Se0Xlbar/ULD2Wlj33/uy5h7v
 uriBzuqhQn+HlCnFWcpMUkzLHetu36VGu1xBkxQ/L1EWOszARYD8X2Mc3/354hjRuJoo
 NNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749668826; x=1750273626;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1MF1dHTik4WYDT1dqFKnZOlAFt0Xaso+/EljV+ZdGk8=;
 b=L3U+8ZWwYHaR6M5qoww6WL6lKnHesPUhs5a6EJAzq7jZn6Cixk6md6dD+tbER+axs6
 mkkorx4NKWSx19GZHLqN+nchX4Wz8bLE9nAmIQR2K0R1+2URLxqgzNi0SMyTG5rrnMh7
 cRg+z5/or7AnSH8IFSPJjRAedpG/Liq6kQIAeulhHVn+3qqTogPGk2VCGy3a4SP54HTH
 IxT7WScijoFAiONCu9a600fXz0ecjXz1ycyJVQtvwPcsOIhoxEXtWKHsKwgcXYrNOa6a
 toNMp2WK5sDZLrXPrdRB1YQqCVfGDTtIujTS3oMxjOlzNx8N1vi208S6GdsqfrcShLJ6
 FyBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViPYaPsByfJDExVZVyEuzjRPcpKMRkGZcak5v9XjRlQTBRffO2/VyR6OaFgl9Dwme7MilqjAfheoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKwu8r+hrAz3ZTjP/fPnUVNHQOUNExxz0DZ98bWzm//bUaddNn
 rP1eJrvMIQBxfoeY8A1j4SnLlfQ1MGMqG6jjd/St8EmFr1iJCbcjy3JaD51JG6FWu3MDyB77JPA
 knYh4yUyNMToDkZ8G94f1nXQcJjdtJOY=
X-Gm-Gg: ASbGncsgSR2HJdnaB8UbA3wQQjyfKdl9eevllZ8kmu4+zzRntYzEGh5/OEn7okNXOYk
 FR6reoy00qLNrt0bLGo2B2TcTD9QRnSoCcjWEMJX7guWmddmUfuG8ytTjpL90XhXhZnClHAWYyB
 iAkQvET4gXmizn4McIM0HNAW70aLDw2ScmGQJv63mbgNaKyg7Eagk/xFQ=
X-Google-Smtp-Source: AGHT+IFsZ3UIOk9VseJbWKxt8KvtKbfGOyN+aFYnhFj7EA+lzwyye2nE75imMRB1Spn6prKv90Mi/kjbFVIWTts4th0=
X-Received: by 2002:a05:6902:250b:b0:e81:99cd:9be with SMTP id
 3f1490d57ef6-e820b64d1a3mr1175425276.14.1749668826227; Wed, 11 Jun 2025
 12:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
 <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
In-Reply-To: <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 11 Jun 2025 21:06:55 +0200
X-Gm-Features: AX0GCFvMeV5Ol-Irt1s6ubsKN_ZZGACBjoQJdDOoAp2hIzH0XLvrHdYRqZQPnT0
Message-ID: <CAMT+MTRYybR=tFJrcUn43UK3iW-fqEH3rmCLUezq2eTrEK=nQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Neal Gompa <neal@gompa.dev>,
 Maxime Ripard <mripard@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 11 Jun 2025 at 20:44, Sven Peter <sven@kernel.org> wrote:
> > +      - description: Driver-opaque calibration blob
> > +      - description: Calibration blob
>
> Like Alyssa mentioned, this description also raises more questions than
> it answers for me. Do we know what these two blobs contain or why they
> are two separate blobs?

At some point in the gpu initialization process we give the firmware a bag
of pointers to various stuff it needs. HwCalA and HwCalB are separate
pointers, and they use separate gpu allocations. We do not fully know
what is in there, but we know what some of the fields do and how to
create the blobs based on data from apple device tree.
