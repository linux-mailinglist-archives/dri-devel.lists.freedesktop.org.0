Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858123A1EA2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107326E0AC;
	Wed,  9 Jun 2021 21:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9778189E3B;
 Wed,  9 Jun 2021 21:11:46 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 l15-20020a05683016cfb02903fca0eacd15so1472111otr.7; 
 Wed, 09 Jun 2021 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VH3rwwEOTBktsGW6P22ZTU/VUmL/IO3btE6cu1C80Ps=;
 b=kkU8TwJT5Id3fmh2Sl2AH46PuradhB/XrIpeCemrg1wM3W3A/OtXodSG93fS3OjxLL
 kWEu50ukBGLnA5jjapnwcylXCBaRiQ4hB3jrrRVi7FLrp9yq0SEIzKxZKcqtsuC6uc4t
 jAvX2SJsPg5ZWvbkWPul+CguSHF2Jl9WVNdA1QoExuGRNT6me8n0T0xye3QdOyY+vMXI
 OgZI+pLZCT4YhnUtrS8uyMDWBy6sv1RXLpLwPSvG2GXaEz+LYM16LT9K6yUi7AFe809Z
 WoR/Wijb5vII9zLDf9Eqeu+QLCRA7uXv1kx5ewn46P5X1z5Dy4/OWLHujX1FrF7bfSif
 rPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VH3rwwEOTBktsGW6P22ZTU/VUmL/IO3btE6cu1C80Ps=;
 b=Qug9Ghu1cjITjCvSpzCNJ50WtFkYeN7ig8R3Ywfe1BlimD61+DtEZsYsArjn8jZqDr
 vwaTYkJbs/1/Q5c6I066qA/mA4ISflECVrCYlAGwxNA7C+WE47P3qyzhHRKSXi7ZUhDC
 ZMtPFK3Jr4STyg0rdgX3stdyC/2JQ06nQSYmOJ74kYSB1QRYVg3aJ7jmxnVAkzoyVWtd
 e3kUZBJvFiX2joVswcRcbjlW2xiP+kWrBc0TO3nMJs65mPbpcjoc13ap2LEeM7aRG48x
 AWXc9pP2C2EqtsSpUmf9r14dXIuIdRUnVBC8behYr+R1XY1otNBnmOaJTJfmvspMDN0g
 tIQQ==
X-Gm-Message-State: AOAM531ycEjEMxWlvrb37wC+O8QrKSQcTK4spvaZx9MqPPtOKmxI9lBZ
 /XXEjlVta11+QLdXPMfMMRaoZ6VJWoEjiZ6/GwY=
X-Google-Smtp-Source: ABdhPJx4hEe6VVvmHzsO68zFInP3sXE1cld9nPHUn2tZYKdEegzAInUO59dC9UylbBKhZ5PheSO/1VpfZWGQJfhKTnc=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr1146711otl.311.1623273105948; 
 Wed, 09 Jun 2021 14:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <1623233121-97926-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1623233121-97926-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Jun 2021 17:11:34 -0400
Message-ID: <CADnq5_Pe0Vkr8geptXv-NW1h-q7UXGPsveZXudr9BX576-f0-A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix duplicate included clk_mgr.h
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jun 9, 2021 at 6:05 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Clean up the following includecheck warning:
>
> ./drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c: clk_mgr.h is
> included more than once.
>
> No functional change.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
> index c0e544d..1007051 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
> @@ -33,7 +33,6 @@
>  #include "clk_mgr.h"
>  #include "reg_helper.h"
>  #include "abm.h"
> -#include "clk_mgr.h"
>  #include "hubp.h"
>  #include "dchubbub.h"
>  #include "timing_generator.h"
> --
> 1.8.3.1
>
