Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BAF692335
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 17:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0CE10ED7F;
	Fri, 10 Feb 2023 16:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D3010ED77;
 Fri, 10 Feb 2023 16:22:51 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-16dcb07b805so745208fac.0; 
 Fri, 10 Feb 2023 08:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zcvhD+W01cKPWtjRgVJx47Hu+OFKg9Xbqk1oO6EqrmQ=;
 b=lMPccPrUHXBPGQ57J6Ii1/N9Om/nJ97Wpn8HS0VowTIo8Cp+eHDe2euRHsdx2elh47
 AgCUeHjqSm/NFGCVJ6XPrptR40qCdQYz8IOuabhvuFqV6jcQjJRZOebW01wQpcjpDb7X
 vtklF/NR7bwJd3S260OcUoA8yMw0VEx/wKinxyUTbzCyn0PzeTp3J+Zc2W+a/X4XEaSk
 Ol7pu9Y3kiYtfkP+01ZzePRu42e9QiDp737V5Y46XFg9xeveournuLnGWM8tpXZQXF7d
 UJ75wKskPswrfaI2LtQqkiXIHVvfGy2hmwdly1UAtTxpnpuSgvsPXOy11am2OqoVGbVd
 YWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zcvhD+W01cKPWtjRgVJx47Hu+OFKg9Xbqk1oO6EqrmQ=;
 b=DcUE2owSUB5UqHtsUjTb324r+NX+b3ySHoF5RQQc/aS1b0A9v7mIjvBwtQJ5rW2W+b
 RyZI7KLczcn74Jg6O8rTV52OHvkFT4KjORHISedGkxGYJQDv24ZO2s8paI1EzXoFKx5T
 wyVjoJrNGydVjjkM/jYzrW6h12zj6y0OBDvLAFNW2ot+zyHBm6ApdUdW3c1fHXR2wxpO
 ODebzubzlhR1zc7OsfOqRXkjPbHETyUjELc5OAjI3Ogc5z6tU2+eW2hxi688cnx8khg9
 5Uvv1FFayQuF8cxulkm8LpCAtytTHkSnDepxr2ABO6SX/fZzfye/a2peQ8m0obUdCD4O
 tQoA==
X-Gm-Message-State: AO0yUKWb/7pzKMIfo2mwjZ6CKVtP/1DZ6uRftKcXoSsrJYo4wgIL9RWT
 mDpxAyiYaWH90HeaWUa9wuyubmgdU/kaUkbp5Oc=
X-Google-Smtp-Source: AK7set9+mUrJgSH/PZ3V8KVvQa9VlzOFWaL5J6cYtruJ4ukPDlH5Ydb5brCfGV3F6EfrDI1hQ2G1yvZFLUpxXvGaQww=
X-Received: by 2002:a05:6870:ac09:b0:16d:bc33:b941 with SMTP id
 kw9-20020a056870ac0900b0016dbc33b941mr278599oab.46.1676046170503; Fri, 10 Feb
 2023 08:22:50 -0800 (PST)
MIME-Version: 1.0
References: <0779deb4-7eea-e1b2-2394-7e5dd5e30d3f@infradead.org>
In-Reply-To: <0779deb4-7eea-e1b2-2394-7e5dd5e30d3f@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Feb 2023 11:22:39 -0500
Message-ID: <CADnq5_Mj-QqsRr8RyB67Pm+wBSVSd7iK1Joa59M9=HW0V3FVQw@mail.gmail.com>
Subject: Re: error: 'const struct dc_dsc_config' has no member named 'is_frl'
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 9, 2023 at 11:38 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> The 'is_frl' struct field is conditional:
>
> #if defined(CONFIG_DRM_AMD_DC_DCN)
>         bool is_frl; /* indicate if DSC is applied based on HDMI FRL sink's capability */
> #endif
>
> so code that uses it should be careful, otherwise build errors may happen:
>
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c: In function 'dp_active_dongle_validate_timing':
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:126:66: error: 'const struct dc_dsc_config' has no member named 'is_frl'
>   126 |                         if (timing->flags.DSC && !timing->dsc_cfg.is_frl)
>       |
>
> Seen on arch=um and arch=riscv (RV64).

We got a fix from Arnd earlier in the week:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/474876bac2333fcc41b10db61571219e2f990a8a

Alex

>
> --
> ~Randy
