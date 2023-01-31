Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B0A68339F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 18:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF6410E152;
	Tue, 31 Jan 2023 17:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C0B10E2A4;
 Tue, 31 Jan 2023 17:18:31 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id r205so13407906oib.9;
 Tue, 31 Jan 2023 09:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3NoU1EXovLnFLevH5+dru1O1RM5oa8IccUfESnUe7Q8=;
 b=MpgLmRdf4UpdmRw6C1M2N73PBlyKKVVdoyrSaCTLUHwPkUxnfQ7vzoggNfm4nM3JYu
 5BM4MJfgOpsD/5EZ552iW/0xenZduj7kNYpREOM3WqBc7fs1rPN5OHg5/giLGl1rTPwt
 e/xNy0KxeTn6fzIaD6/WIfcCm7gD2A4bGV4g8FyfEXtGvLsyD4Y3aeee48Ui15U1q7id
 dbtaLzRgGpbqMjfKwqzsmn9YFEHW3iEh1OHrBa6iJAbQyJvaZWuUWA3NRVPej3A64vgm
 mkJUuln7McItNBp5jJqmwOEL9Rw3aXT5fSGauhpyG4mRQZpWVayDv8dFnhEGBhVXHbgm
 5nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3NoU1EXovLnFLevH5+dru1O1RM5oa8IccUfESnUe7Q8=;
 b=cl9DgV57TfrnWdP05ZC7CtFeEKdX7TzqgEQDv5sZi7sTz0ILyZw2flRT1sgrJ2mK5B
 KQPkqxR7aSdBNvdyPnITNiutUlFuH5izxomqYRd4QiMydsCCkp3ilVtymsXX805Uw8IP
 cMF5nfUosRqoE1OPxWK9bgmD/0N/7SRn4Cu2pQln9vd3gXWCY23we560HX/XHvfxCBZU
 Ly4kch+RQClh8uToCnNcJ0XhtRcXtN+DRhIpxLJym097y+LIbat9uS0fNSqAkvli/wrY
 S//Rlf5wdVq8DSDNN6ip8SfRpvolgDfZ9qRD2UPjrOg5CFFyxKMHpdWt41/mx/mh07ae
 +qEA==
X-Gm-Message-State: AFqh2kpzbgWyMT6IYzNKsh97Fchc0jR85V3lDsZ5UX1QrjETeDEMcr7d
 tl4nk1O+WwSXLtvSMmP17aXpbKaMhgdPsKvXr/k=
X-Google-Smtp-Source: AMrXdXtq9ETxjTpquXp6xMOCFLNGsDfdhQgYEHycqqdimQWIi+k0o73I+TMPM6JUs6ufmAIcvMZj4jdA3+gNyB/Lewo=
X-Received: by 2002:a05:6808:4387:b0:35b:d93f:cbc4 with SMTP id
 dz7-20020a056808438700b0035bd93fcbc4mr3059225oib.96.1675185505458; Tue, 31
 Jan 2023 09:18:25 -0800 (PST)
MIME-Version: 1.0
References: <202301280939083976293@zte.com.cn>
In-Reply-To: <202301280939083976293@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Jan 2023 12:18:14 -0500
Message-ID: <CADnq5_NhqLdLxvFXjNgD1oLz-yzf_ozqoM4HjxRVzMZPJCaFDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: remove duplicate include header in
 files
To: ye.xingchen@zte.com.cn
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
Cc: haoping.liu@amd.com, ian.chen@amd.com, dingchen.zhang@amd.com,
 sunpeng.li@amd.com, wenjing.liu@amd.com, xinhui.pan@amd.com,
 rodrigo.siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 george.shen@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jan 27, 2023 at 8:39 PM <ye.xingchen@zte.com.cn> wrote:
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> opp.h is included more than once.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index 6475664baa8a..1a2ab934b4bd 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -46,7 +46,6 @@
>  #include "dpcd_defs.h"
>  #include "dmcu.h"
>  #include "dsc.h"
> -#include "opp.h"
>  #include "hw/clk_mgr.h"
>  #include "dce/dmub_psr.h"
>  #include "dmub/dmub_srv.h"
> --
> 2.25.1
