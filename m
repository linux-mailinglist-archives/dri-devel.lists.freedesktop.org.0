Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAEDACE213
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 18:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC90F10E770;
	Wed,  4 Jun 2025 16:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="ajVj0jux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634E310E770
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 16:18:42 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4a5a196f057so30177921cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1749053921; x=1749658721;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P8AKCIoAa/d1XSYeACl75HYH/kq79WoVL90DxYrmfW4=;
 b=ajVj0juxZtW/Y60+9JWWQDDJppF8DyzJa0qBhvbXaIREKBz0iconqD8dCITjSqGjUE
 59jCjH6StT3WFkdUqXA/GVom/ArGdHameS8++M2bL29cGvXEmHtFR937bDZhfBXSpYHw
 whHAU8VoUt7CF2RED30wdM2EEHVWAJKOlIZ0ftNdGrbHSI84yIcIk9hYbPtyGg8FvPSs
 n+q0BuqaEJQVwtkG7uVLvpWhmTXVeNNXeVM1salPA5zm5XV7v0aO9nEKQI07s2gSxQep
 vTF5QiQyJhXkJxmk1BqApH2g9EGhLlRudJPc4uKaY1XHlgoZhAO3lPJqqd4MrQ9+v1OP
 8pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749053921; x=1749658721;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P8AKCIoAa/d1XSYeACl75HYH/kq79WoVL90DxYrmfW4=;
 b=OcX5yWKWRLfQNfsEAIrbshumjuSO6ew+3a/n8x4E5+I7FuEttpfcxW64VfatckkUK2
 EACChfT6P/Wefmn+aWmyYhrRla4bwU2/ZHveeYgJX3asoHV3WAbdTqfC2ukrabRYj75b
 uHFL+3mqys6qJE8DknyQ0f7RmCg1Lhcomd+rqBlefyOJHnGJmcsrjtTUFRwhiP6mXdDC
 Le3lWXYTCOE61BPavPPQsxE8ERjRBZTOGEtyqBKlkDeqJ5awj1hDxWJ798Klwp6HqEXJ
 vx7DaIZ26Gj9nl1yKNss5PaR6rD90zsfEMt1cCZ+DVbKIdE1VxTCccgtFjxjHR6zKp/I
 beYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfHyMnhZn0agwfX/72MpCcY8JpH/G4mchxlATRETWHRmE15p4KtQzxtTr/EtFnULUKOeqAltP/cck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB5fWCAITU0hl3p4/2RhLjp7zVgOmS+g9+ssxHwswepEZg/g8C
 ugr6/BHIZqfnhXu0dvTdzk+qeQBuBwQNCgcrJ8Z8SQI7h3ADIl+qHhbKuSoGQshdogavHc0BwzV
 SvAAk/gM2oC4pdSUapcxgD+g/e+2HKZKBveBpzjlzmw==
X-Gm-Gg: ASbGncvQICocrDWUbROlnz4TatywoCEFTESKScTNzg9RS1Fg+J7STG0iYmgsUNholJK
 Ji2jQ8CRJlE8fZBHn/TqWWoRAN6xZ+iYaLB1eixsj22G+0Lq2TN81w7Lzap69/Ji/qWRAWwObDf
 uWDAj9LHUQ2btR/1WWDCcj6JbSKPhTENeaWfNlG0Ghg9MT+Lh+FBLC3d6qyYYm1vIQHTdtNFCd3
 gFSow==
X-Google-Smtp-Source: AGHT+IHKumrpYp7KXj3Oppwg97YrZ8QLTUdlX7sch68BDDJcICEIYXc2OCGtCAc7AHX04x4oGqNiMhls5e1iB1AyII0=
X-Received: by 2002:a05:622a:4d44:b0:48b:4f9b:fcfc with SMTP id
 d75a77b69052e-4a5a57559e0mr54446431cf.22.1749053921456; Wed, 04 Jun 2025
 09:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 4 Jun 2025 17:18:29 +0100
X-Gm-Features: AX0GCFspq72tjQe2nH9NHC6pMzIvIPvg3yffH3OtDe0wEz2aVsnXcTNMk1xSlik
Message-ID: <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Robin Murphy <robin.murphy@arm.com>
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

Hi Tomeu,
I have some bad news ...

On Wed, 4 Jun 2025 at 08:57, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +       [...]
> +
> +       /* This will map the pages to the IOMMU linked to core 0 */
> +       sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
> +       if (IS_ERR(sgt)) {
> +               ret = PTR_ERR(sgt);
> +               goto err;
> +       }
> +
> +       /* Map the pages to the IOMMUs linked to the other cores, so all cores can access this BO */

So, uh, this is not great.

We only have a single IOMMU context (well, one per core, but one
effective VMA) for the whole device. Every BO that gets created, gets
mapped into the IOMMU until it's been destroyed. Given that there is
no client isolation and no CS validation, that means that every client
has RW access to every BO created by any other client, for the
lifetime of that BO.

I really don't think that this is tractable, given that anyone with
access to the device can exfiltrate anything that anyone else has
provided to the device.

I also don't think that CS validation is tractable tbh.

So I guess that leaves us with the third option: enforcing context
separation within the kernel driver.

The least preferable option I can think of is that rkt sets up and
tears down MMU mappings for each job, according to the BO list
provided for it. This seems like way too much overhead - especially
with RK IOMMU ops having been slow enough within DRM that we expended
a lot of effort in Weston doing caching of DRM BOs to avoid doing this
unless completely necessary. It also seems risky wrt allocating memory
in drm_sched paths to ensure forward progress.

Slightly more preferable than this would be that rkt kept a
per-context list of BOs and their VA mappings, and when switching
between different contexts, would tear down all MMU mappings from the
old context and set up mappings from the new. But this has the same
issues with drm_sched.

The most preferable option from where I sit is that we could have an
explicit notion of driver-managed IOMMU contexts, such that rkt could
prepare the IOMMU for each context, and then switching contexts at
job-run time would be a matter of changing the root DTE pointer and
issuing a flush. But I don't see that anywhere in the user-facing
IOMMU API, and I'm sure Robin (CCed) will be along shortly to explain
why it's not possible ...

Either way, I wonder if we have fully per-context mappings, userspace
should not manage IOVAs in the VM_BIND style common to newer drivers,
rather than relying on the kernel to do VA allocation and inform
userspace of them?

I'm really sorry this has come so late in the game.

Cheers,
Daniel
