Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85707AC6EBA
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 19:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E422510E61E;
	Wed, 28 May 2025 17:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="iTIBxoug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BF610E68F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:05:45 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4768f90bf36so114401cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 10:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1748451944; x=1749056744;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MjN3DeO7RN6Mtg+Ma+91ASlzL4kT4/NFZVHo/75DdS4=;
 b=iTIBxougsz0JN3HR8QUrigtUVQlu26ZtVmhMVfH8SzyDs7IN5PKr7NK6yKc6Y2noVg
 m9pwxzjAPPFuiBZo/lMHe1XBACNdgKz0XPXPUG9N2GsQlOJLwTU94TbrGRR3ZmR1UtYf
 5rQs4iICFsdGqgcM0vDXF2Pb+0UTOhdJmPCViU/VDH/DcpmTj+7KFRyKH24qPz2gR5tv
 /AK4vAA+wSCNY4u+LfYGJk+NBdXbkrarPKodyw2HHnJ+2z+iC7Zv+CY1Iiv9j3Rwu/lA
 TFZ5XwwbIQHzI3CcpSLpU3tCH7dGMncY/p8bsBCZ+xfalewHjitW8/45aRo6EURWoMpY
 Qc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748451944; x=1749056744;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MjN3DeO7RN6Mtg+Ma+91ASlzL4kT4/NFZVHo/75DdS4=;
 b=sZo49XX9KXK89EejxIP/P1rYGUPAHeEGPZfNQcB9K7lP/KDozGnIsZFkgPDz91pxgG
 WZmcCSpdRPbRz59/c0U+T+IW/0w2o4IT3W+fkDOu45bAycLEdYt+KuiRc3peopHaY3Km
 5QK8JalPunfThDSsNcZcIQ3038ZMnKvJzIyfDE81aqgF8VxMxNjtO+1TGH4XI/G4wWt8
 4vuci8rtZdQsG/TAJ0BAP7Z/hrkP8VxwjlIKSm3wDnOFlDbPH6cStCWdyGujzgjqQHET
 85AS8ZauGy3Mw/cdRbl6HdKTQjhh4UkPFo0GMF4PFyXrhC6SA6+s9ww5oML+zlJj/48K
 GrZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXrL1IORdg0jHcok+102E2ZmFD1MT+9jxy/HKw44iGbm1wsOCFWf0ARR6XUd2ZeaDxsaKpiKwp4y0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXETVf8llnWzLIFLCZtbZoe/rRyxizazGGjpRTC9UiqNISx6y2
 9k2R/px8Z25Ldp8TpCS3IjWcPYvm7ZNsoP/BHGkumnDD9GqquSjFsFaQDBvnq87BSiat8MTX7AG
 hltdzZSlv+Xd8ycmvn+5iBUpE15Izu/F+WfXrfgxemQ==
X-Gm-Gg: ASbGncv6p9Mn2MRA5V7NVuDv/h/rYOtmk/j7wyraxEafoLJl0/hR6HUP6EPYYgqdju5
 sVdzLy05daJOQUOWJZ7FcNqjp0vpPgVcEdaBJlu7V+ShG3mIytibsrWQLV/CIrrYn24xIXTQzU9
 0pcNV5EF3txjP/Qu1pNIf2VNmYGlhXSA==
X-Google-Smtp-Source: AGHT+IEm0ejvPbwrNrqDkZXRJHIE7U5qRPKrsu+TZQu2HF/RoG0QL+BHmiqMQvBwLiCrtZT5dzW9XHwkZ3YcoQoZDUU=
X-Received: by 2002:a05:622a:22a2:b0:476:a713:f783 with SMTP id
 d75a77b69052e-49f47de7e8amr310623321cf.47.1748451943943; Wed, 28 May 2025
 10:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250523150815.3066081-1-ashley.smith@collabora.com>
 <CAPj87rOw2UrabPVHBw0ymJEV3LZ29vzL5KK9T2K0znoEyDYeaw@mail.gmail.com>
 <20250526091646.7020bcff@collabora.com>
In-Reply-To: <20250526091646.7020bcff@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 28 May 2025 18:05:32 +0100
X-Gm-Features: AX0GCFv3czEaeWL4c-hEA86xSpuMEGadqYNvEfZwMV6awSY6zHBdvHknCd_zQJA
Message-ID: <CAPj87rP=HEfPDX8dDM_-BptLmt054x+WHZdCBZOtdMX=X4VkjA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/panthor: Make the timeout per-queue instead of
 per-job
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Ashley Smith <ashley.smith@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, 
 kernel@collabora.com, Daniel Stone <daniels@collabora.com>, 
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

On Mon, 26 May 2025 at 08:16, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Sat, 24 May 2025 16:03:37 +0100
> Daniel Stone <daniel@fooishbar.org> wrote:
> > Unfortunately I have to revoke my T-b as we're seeing a pile of
> > failures in a CI stress test with this, e.g.
> > https://gitlab.freedesktop.org/daniels/mesa/-/jobs/77004047
>
> Note that you need [1] too, which I don't see in your tree. Ashley, a
> note for next time: when you have dependencies between patches, like is
> the case here, it's usually better to post them in the same patchset,
> so that:
>
> 1. They are applied in the right order
> 2. Cherry-pickers/reviewers know that they need to consider both to
> have a working branch.

Oh, sorry I hadn't spotted that. Yeah, with that applied, you can keep
my Tb, as it looks entirely solid in CI.

Cheers,
Daniel
