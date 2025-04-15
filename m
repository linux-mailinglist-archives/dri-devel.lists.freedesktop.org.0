Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD01A89E50
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54F010E370;
	Tue, 15 Apr 2025 12:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="IsYJEXg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6556D10E370
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 12:40:01 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4769bbc21b0so48336991cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 05:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1744720800; x=1745325600;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SZ/wgmr3HEC5rBX6rG/fWLXLNXyDKWbYYxJoycgkDog=;
 b=IsYJEXg3khWbD02gFxzA0fsSepGUwL80q/YEBnC4rFB178oxsC1/pB7eYZZCBJQZA6
 LblWZ6WqtbuR4TUMaNZuOgxqI7iqz6FRahqTAHeovZduE9c86aJEgTkXgIplEg+1yjNu
 NltMdAb85GoEHvVbxcwnoFOGWBuqPlF38xYG4ZiIejq62DexheMLK/6FN+8NE0cfNXeK
 xErbPrQpWjVWn/cWuk1N6Oe3sd3h3wAeveny+qVbkRJN/5mT01rg2LqSLjWREuz2i8IJ
 GrvLC6HpCOvNncYAo/LISyB1qDEu5K0TCPvTkytz6KtrLhxPz67RMG2ruG0TywP/YmRj
 FJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744720800; x=1745325600;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SZ/wgmr3HEC5rBX6rG/fWLXLNXyDKWbYYxJoycgkDog=;
 b=HBdZvSTXsmeUc7X3UmG+M4WHtdD3RQLNnS26JgFGqtew6qEHyd6ETr6HM7uA0L30RN
 9RUeIgRMi878vdIUUYOktZX+U4kBcGXSwtdid6c3R7watkUE4TMcpNGgdTu8Dg+RSRL/
 koqFbXXq1mbeb/ezoa18Wdg99dNX9GmvAZvg6TGp5/SzxpPKqhWWrubjaoW5dXyXOwze
 gDQArJ6jvmZarshq/vcEj02KM41ogBtzXHOTCBczpURgto/XbhoeYCpjvKTPr4fbeF8J
 Q6VtKKftl8slFWynRHxnL69Pucz0+Ol2eymWrgKx3Ma+qsx6IDfkGowG9eeZnshDEcNj
 FXtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxEJSF6LM/NGSiogu1zZwfQWf8k4QwSv5YFU6oahq/RTch+SRX0UgokHchWB1ZROY8baDd4olhn74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyew3Qr8Rgj/phHUydTEBztukDFNlY4J28JqGQ6UCZIs87dq6+c
 nuRu2rE/essZUmWM2Ikhn+GsiimDPdt8vecoObAhq9nc49xeIKizppA9mUHJfz8ruwvK7c9t2sC
 ZKwBkpiGPRpEPcnUfkJndClP1h0NaFyZoRnD7eg==
X-Gm-Gg: ASbGnctdvKA1r27jtvifZFYsG3pTOvOfmj9c/e7O6rZJ3IgyJhy9qu+k1ndObPafYjb
 1z9f4ACiw7nLi5EB877x7TMDZXEqVaqBxE4eooXPXVGfcfGIjVAd4KCD2Bj7yTzE3SZdbVgPrvR
 3JkPHSJFirHx16x6I+uao=
X-Google-Smtp-Source: AGHT+IGh33nmZhPham8bGdl5LkZbWdfEQMmCk2VZIajuw8cWn6Vp8rDkzxQOQgCuBWjvyjvKUF6OTYWuargUrDherzs=
X-Received: by 2002:a05:622a:1354:b0:476:b13f:56a2 with SMTP id
 d75a77b69052e-47977553337mr240451711cf.18.1744720800394; Tue, 15 Apr 2025
 05:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
 <20250411103837.753cd92e@collabora.com>
 <9fd6fb8c-7dbb-467d-a759-eec852e1f006@amd.com>
 <20250411140254.042f9862@collabora.com>
 <73a28f35-9576-4089-8976-07cd1aa64432@amd.com>
 <20250411150056.62cb7042@collabora.com>
 <c15cef68-bab5-4e09-89ae-52266ab1e4dd@amd.com>
 <20250411163902.1d0db9da@collabora.com>
 <20250414144714.6372738b@collabora.com>
 <1b9b8795-5f5c-4831-ad6b-29b88f21b621@arm.com>
In-Reply-To: <1b9b8795-5f5c-4831-ad6b-29b88f21b621@arm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 15 Apr 2025 13:39:48 +0100
X-Gm-Features: ATxdqUHhv6F381ZMXQ6SbXVANOvyWTRDYGkXDupjW_j99_TEIb6wR5vsWqTyIb0
Message-ID: <CAPj87rNawEPDp-6hwyHr0TH34Zhe2NN_1Krt0cNTN=ENfr3Gdg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com, 
 Faith Ekstrand <faith.ekstrand@collabora.com>
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

Hi,

On Mon, 14 Apr 2025 at 16:34, Steven Price <steven.price@arm.com> wrote:
> On 14/04/2025 13:47, Boris Brezillon wrote:
> > Hm, I might have been too prompt at claiming this was doable. In
> > practice, doing that might regress Lima and Panfrost in situations
> > where trying harder than GFP_NOWAIT would free up some memory. Not
> > saying this was right to use GFP_KERNEL in the first place, but some
> > expectations were set by this original mistake, so I'll probably need
> > Lima developers to vouch in for this change after they've done some
> > testing on a system under high memory pressure, and I'd need to do the
> > same kind of testing for Panfrost and ask Steve if he's okay with that
> > too.
>
> It's a tricky one. The ideal would be to teach user space how to recover
> from the memory allocation failure (even on older GPUs it's still in
> theory possible to break up the work and do incremental rendering). But
> that ship sailed long ago so this would be a regression.

Yeah. Vulkan clients are a little better in this regard, but GL
clients are pretty useless at dealing with device loss across the
board.

Cheers,
Daniel
