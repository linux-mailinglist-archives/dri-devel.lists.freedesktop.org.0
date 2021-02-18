Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E3B31EE80
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 19:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438386EA44;
	Thu, 18 Feb 2021 18:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3119F6E5A5;
 Thu, 18 Feb 2021 18:40:46 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id o10so2758832ote.13;
 Thu, 18 Feb 2021 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lKc7ZspagPR2F1k2fhzcSExhZXGUtyluR76nOC+AMmU=;
 b=MPSrTvgmuhmGRFVaprGSkR/fjPIL6wO9YDZX+esMkvv2liwxxbRN6Y8/YEkXcdZPum
 OV28GaadKDtRe6SHfgFyIhW7GFuIcHbhkZSagqQqoB7btr6trc5ZfEWdnbxYFZkRwCtk
 pAmW4gyTYHbCAjisATpdmFDhXb2dSRrObP4iI2igsbTEOVQeCCvxRTs3gPtbYsbA5S9N
 Ecok0m41skRBDeKft6BCmZ8qsX+Npv0tx3wrNRYvT9pv/eD2U1R8WqI2l1lGiecNk9fT
 YNLfNMtSQFyIZk74HhYlQi4MHcj8T41dyy7vSeCodjSNXvIepHax72HsKRLGyCHEPoLV
 WXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lKc7ZspagPR2F1k2fhzcSExhZXGUtyluR76nOC+AMmU=;
 b=kurbV0sWlVUV/pWsnBphGByUAUJeG/dab5AwHvwt8u2Zo+3vq/ksvWo3xIYTysa2WK
 kECLhkCDLN1M9MuRiIwd3YwMbUiHT/pd1/cKgk+co82D61Zfgc8DEQa6jUErhm68OxY4
 f1b5iechcRt9bcEnvzKJEnVD84NneVHRag6QEakLn1V20c/J65TcWPR2QFLsRF4oukg8
 iHh5gcsmwTBbPD4JQCKl5prCVyTsFN4IGKbAxSXVsq6ugJ8nPbxOqrYNQhX8oCJkDMwL
 tvhKY9g0OBoVXSLA9h6zIilhWSevKXQjFfM1Wlbrn5CE7C82gVWRFnNULy/NFfmUYzpR
 zXTA==
X-Gm-Message-State: AOAM533awl4iNq31OOZYLMt0dXtPRy4hh04QXrweJ2YJc6HTvlDJt+cK
 XFBP9fDR70f92f2lp2OfNGUIRJkxZMZpNPRaRCk=
X-Google-Smtp-Source: ABdhPJyA35NN7DMVZeaKjW1bfa4oI1GShogpGaEoB30n2A6mojiKd25eT0cjrMQjlPUHAcKuaTiZYagn4wlV2Chlzis=
X-Received: by 2002:a9d:760a:: with SMTP id k10mr3972185otl.23.1613673645475; 
 Thu, 18 Feb 2021 10:40:45 -0800 (PST)
MIME-Version: 1.0
References: <1613633644-52961-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1613633644-52961-1-git-send-email-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Feb 2021 13:40:34 -0500
Message-ID: <CADnq5_Nva6t5RrDzLPr60jc+nA8KpQCudnm+AyaoosSEvZzh3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Simplify bool conversion
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Feb 18, 2021 at 9:23 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:8142:16-21: WARNING:
> conversion to bool not needed here
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 961abf1..f163e54 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8138,8 +8138,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>                         hdcp_update_display(
>                                 adev->dm.hdcp_workqueue, aconnector->dc_link->link_index, aconnector,
>                                 new_con_state->hdcp_content_type,
> -                               new_con_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED ? true
> -                                                                                                        : false);
> +                               new_con_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED);
>         }
>  #endif
>
> --
> 1.8.3.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
