Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA566CE15
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 18:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B13D10E479;
	Mon, 16 Jan 2023 17:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B9B10E0B4;
 Mon, 16 Jan 2023 17:55:59 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1322d768ba7so29569608fac.5; 
 Mon, 16 Jan 2023 09:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hmr/4EGVT6Movw4Gw2eBDFQeNgD1pGHhChAaxlPCJsU=;
 b=SfTnM2vVsOQnrYLrQD9H+RG2EW9ZSkr0xjOPTijmu0aGqrobYsidOwmjAWl+UKjvYp
 u5Qel07zihwL3o7ogRlLfYtYLm9CQ39KoEN54v5dBoL9AcWzj/NKt2rJSx82+K1fXdUH
 kwq1u0PKUTd0iqtVB2XV+N3JgSQlwsfdxrne2dtY+DNLtRwzb4CCs/HMic+3OY7NxxAp
 61E3JU+1SewSBPbs89B2q3R/A1wm9TQDV1VohQ+ygim0h4CXkBW8taXnDh4ySXm5H3c5
 r1b1gN1WO0kd2rh25bsyQl3A4QGXc2FyOEBSZVNq9MTM8OJuvt0KOilwPvvOzD1dmL5I
 W9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hmr/4EGVT6Movw4Gw2eBDFQeNgD1pGHhChAaxlPCJsU=;
 b=iOcyey2DGKdLid7b/MrYX4hT0qwCDo/ci2fhfF+Xf1GtXq/EwWE/Zp9Z75h/NLky3c
 Sw41dwkRql9/HNi4/xgqi93lBJp6UL5x64EoxGQq/13uNC/K1xriSQovzVUiBFIGRtih
 PhG1eqFTaMlLJvgasIbPoJOHhXC21WVDeYCfktLuOnxHJBLjsOLJnJrylAWbqAWHTWOJ
 FNE1Cz7rQzhCZpXYzAn4OOdElQd+sDuO1kkkYppraMw7WBvOyy9vHRmaypu5HSMvaGx6
 g9aiPbkwBtAp64a+CKUynzPEcPKwY5oEVkhVtfWyXFjwjuTcMp21Yd60oBzhjaQ0vkSj
 AN9A==
X-Gm-Message-State: AFqh2kq3jf2V+MqFNnsslRE8FW97v7q8SUUytardI6nTZ5N2lhkdy+hB
 VVTZ6qLyKCr8/P6suXhDtipB3MS1vF6WGEg2b/0=
X-Google-Smtp-Source: AMrXdXtsyr3fZssneo+m+TaFDxl8UcCwFPa0HZ9ecIR2snIjS8XHBcWS8ZqbYDjLLr2NyLRnUaMRQxi7OAUj8r8E+KM=
X-Received: by 2002:a05:6870:7a18:b0:15f:5509:9a0d with SMTP id
 hf24-20020a0568707a1800b0015f55099a0dmr52425oab.46.1673891758551; Mon, 16 Jan
 2023 09:55:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673766696.git.drv@mailo.com>
 <DM6PR12MB2619EF8DBE956A8F79A579DCE4C19@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2619EF8DBE956A8F79A579DCE4C19@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 12:55:47 -0500
Message-ID: <CADnq5_NuNYcgK1K-5J-cU7ZSNuMrkEMuO_ZkcNzWsESSKH-SaA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amd/pm/powerplay: use bitwise or for bitmasks
 addition
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>,
 Deepak R Varma <drv@mailo.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Jan 15, 2023 at 9:27 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
> Series is reviewed-by: Evan Quan <evan.quan@amd.com>
>
> > -----Original Message-----
> > From: Deepak R Varma <drv@mailo.com>
> > Sent: Sunday, January 15, 2023 3:16 PM
> > To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> > Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; amd-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Cc: Saurabh Singh Sengar <ssengar@microsoft.com>; Praveen Kumar
> > <kumarpraveen@linux.microsoft.com>
> > Subject: [PATCH 0/3] drm/amd/pm/powerplay: use bitwise or for bitmasks
> > addition
> >
> > The patch series proposes usage of bitwise or "|" operator for addition of
> > bitmasks instead of using numerial additions. The former is quicker and
> > cleaner.
> >
> > The proposed change is compile tested.
> >
> > Deepak R Varma (3):
> >   drm/amd/pm/powerplay/smumgr: use bitwise or for addition
> >   drm/amd/pm/powerplay/hwmgr: use bitwise or for bitmasks addition
> >   drm/amd/pm/powerplay/smumgr/ci: use bitwise or for bitmasks addition
> >
> >  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c      | 8 ++++---
> > -
> >  drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c      | 2 +-
> >  drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c | 2 +-
> >  drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c   | 2 +-
> >  4 files changed, 7 insertions(+), 7 deletions(-)
> >
> > --
> > 2.34.1
> >
> >
