Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75931BDE622
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 14:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70FD10E795;
	Wed, 15 Oct 2025 12:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="FjT2tTY1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7FB10E79B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:04:06 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-85e76e886a0so728334785a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1760529845; x=1761134645;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X3tSr4HAvbS0zz40z1XcCEFjgrGlF3qXMnfs2AVWb3Y=;
 b=FjT2tTY1likXYrsS9/NRmwLnHrYQxO4FXckVp1djxQM8DEeFO+p0ZgzkvtWcGpjU8E
 qbM63jgDQwYSTSh39qNkJeFJ+1NHOdZ8BgcDNdbhxvt0B8mu+Zd1ePHMVMeAcWblFjn6
 Hw9WlC1dcs5sOl2tI5FnGf7vUEluIYA0Pf3A+WWH+LAthphRswfYMdw2dC1vTFvIr6GE
 ZwFzCohv4BZ+xGkBrb11EhvmV8isnfyYcvimkrjcdELhca1H4XEuNnqlo9ocadv6rqC+
 ojbY7UVCMAz191V6sbILbYwEJtnLEB3ICgnssKtZ/erpMIV8UQtXxrjxOoZTygBL+3TJ
 jWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760529845; x=1761134645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3tSr4HAvbS0zz40z1XcCEFjgrGlF3qXMnfs2AVWb3Y=;
 b=YCxqcA21x1L0+wF2I/OkxRmWgtsraaPGaFWIzKLyiAc5YoexQu55tAScvlAAUsGs4X
 ns4jUNeZ+EOfwsNOFaNMYo7BuxayG2yJZ5HSxaoTo+0sGtVkrMSHT39OE+GZRaIhb1Nu
 GhO5Sh2bE0CvPsqB87zq5nmhOstOZbrEvWTxH8mw7IYl8y5DlVs1QkTwzQgp96q0cYB+
 T6heElOBDjWOQGSjVuQOOTBZE7x5ikBXg5FwnMJX8YW3tR3FAirRKUUZE0bQnowvxc80
 VOHljZ/Nw84JYHMu++JgIj+gj7QE6u0PNSW9k0Qrdk3NWHZdZ/005s5h29lWrcE+eOzz
 ngHQ==
X-Gm-Message-State: AOJu0YyiIbAIh4m2DfGA82Q31GJBKthVZzRcUyehaSry+zyROmC61hZV
 2MiPASxjOx6OmmVkKb+KIqYRvczg775HkDGeY3xGsaoUchy2aPWtmIT6XfqzCA42wqZr3vqDh+f
 llv0lqyzS9aBhdX8f43GKlwiNtsl/28dLsqAlq0045w==
X-Gm-Gg: ASbGncvChb+J3IWoZVWNXEO8Yb3rSr3TnsfFfDbYppvUplftHt4Q8phwZQeBL6DB5vM
 AJ4BeRmePTsooMiA05aAtL+F0g1E1z0RcmMHIbt6/qrIHOS7XqFEtMfY9w3FrLL8KYqMdTZToQq
 LMpfZd7fDApzLbAyl1HQixiDJrsc72w2Cz+ZxMFWSGUOYKypXWzq57tkhTnxHi3GHVvp2iw57Ba
 QAxikPg8clbOFxgZ0VSZ0kWP1+cZf6KMg==
X-Google-Smtp-Source: AGHT+IHqCTndsaW9mNNOpEoxqpK+g671TVftkJwHJncfJRnISWrovh6jkW0GrLsJk4LzlYEdY/SfnIetRnQxqll+9N8=
X-Received: by 2002:a05:620a:d89:b0:859:7e5d:efb0 with SMTP id
 af79cd13be357-883521dbdb5mr3978297485a.43.1760529845105; Wed, 15 Oct 2025
 05:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Oct 2025 13:03:53 +0100
X-Gm-Features: AS18NWCXawAF8rrUemNB4cY6pOyINS36FA1C_QZssu58BBI9i4GnKsHpaQ9lquo
Message-ID: <CAPj87rMRKdm4BvfD8gMmSF3jjeMK4nurzTKPOFY15V0tBr4pyw@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] drm/ci: add new jobs, uprev IGT and mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 lumag@kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org
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

Hi VIgnesh,

On Fri, 18 Jul 2025 at 11:54, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> This series introduces new jobs to drm-ci for testing the following
> devices:
> - rk3588-rock-5b
> - mt8192-asurada-spherion-r0
>
> Other updates include:
> - Uprev IGT and updating test expectations accordingly.
> - Adapting to recent changes in Mesa CI, such as:
>    - LAVA overlay-based firmware handling
>    - Container/job rule separation
>    - Removal of the python-artifacts job
>    - Use of the Alpine container for LAVA jobs
>    - Various other CI improvements
> - Disabling bare-metal jobs for apq8016 and apq8096, as these devices
>   are being migrated to LAVA.
> - Updating the runner tag for i915: cml (switching from hatch to puff)
>   to improve device availability.
> - Adjusting parallelism in jobs (sm8350-hdk, amly) to better utilize
>   test resources.

Series is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
