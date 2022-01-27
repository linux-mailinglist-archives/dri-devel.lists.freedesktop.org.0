Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B61F49EC23
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD94810E38A;
	Thu, 27 Jan 2022 20:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965E310E271;
 Thu, 27 Jan 2022 20:06:07 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id s127so8138074oig.2;
 Thu, 27 Jan 2022 12:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EbKovafJqxrxwXPbGoli47dYNTXZx5if0xOvJbes1n4=;
 b=WfsqeZeB8+li+mdCAXmE+EF4ZRqHlHrJzP2yutjB+v6HxVpxELeq+TMjgrbMGR3zEI
 +8x0msUyys1XPwGqa3fdLHzvWscjB3u0wupX4CCRp03rQ3hi4nPKleTA0ptfwtnLHbRe
 hAk24ujnHHi7GQq98BUvHXMXD7RHGQrVV9QOq7EkM43SKDznN2X+U3rgZ6P+Nu6f7zMW
 7w7gB78qJ8nx/LX2+GPB45H52puMqCdCn4PMq/Y951J39wBhUeYndJQP9J09E0MCgfTc
 d3/ueGUTCAJ+xwUxdYbO4bzhIfJyKE661DoWt1xW9RhpaR/rrACuniPtY4N+D6ixUfz7
 6hKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EbKovafJqxrxwXPbGoli47dYNTXZx5if0xOvJbes1n4=;
 b=0HbxL3IBZZjEw1NvqcRZ/nWGFXLvuYN9FEHN57+82WrjcsCVQf1nNvrVGx8NzKpS4r
 f9gQ6WfxoVqt1M6jbVTRJRPD+HhE1Ah/gJDWXNEVEcGf+vn7kvXDJkKrKO11pEKLtx2T
 fWBnlLb4letdRySA/Go2sZjt/RMrbMHNC+10xSsQZUD2UXiPgsIZKDjGcQ5k93APScnx
 eyK4Rg/yuLrn64X2KdYz2jnd0QiB4IbEjtSfZg+HkmtUDDWsNnsxo19RMiADYF/Xri0w
 w96GC+XmyqX57SXr1sEKbyTFnUzcjL39HF2jVNepiToO8QQPzX+O2TBA1vnsLtbMkDV+
 s+4g==
X-Gm-Message-State: AOAM532tn2le1i5vYu7YMChCOOZXYVABs1YTDN1Tr0s9IPYq1GbCBTbX
 eCRpR9XOZViXqOzMVoToEZ1+k+PKh+gIGMCexwI=
X-Google-Smtp-Source: ABdhPJxHBpcoUFN1+scsDxMoRLl4j1oxUKa7K+WMYr5203HWdFDjlL8IAsQAu0hWcYb6baNdXROmNcUwivxZk2AYsQc=
X-Received: by 2002:a05:6808:2189:: with SMTP id
 be9mr8099468oib.93.1643313966887; 
 Thu, 27 Jan 2022 12:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20220127071239.30487-1-tangmeng@uniontech.com>
In-Reply-To: <20220127071239.30487-1-tangmeng@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Jan 2022 15:05:55 -0500
Message-ID: <CADnq5_NR_=FACtfo_V22gK_nhBOcnp=Y-8NQooKtkKzJULeN3A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: fix spelling mistake "disbale" ->
 "disable"
To: tangmeng <tangmeng@uniontech.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jan 27, 2022 at 3:45 AM tangmeng <tangmeng@uniontech.com> wrote:
>
> There is a spelling mistake. Fix it.
>
> Signed-off-by: tangmeng <tangmeng@uniontech.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> index aef9d059ae52..a642c04cf17d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> @@ -544,7 +544,7 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
>  {
>         int r;
>
> -       /* trigger gpu-reset by hypervisor only if TDR disbaled */
> +       /* trigger gpu-reset by hypervisor only if TDR disabled */
>         if (!amdgpu_gpu_recovery) {
>                 /* see what event we get */
>                 r = xgpu_vi_mailbox_rcv_msg(adev, IDH_FLR_NOTIFICATION);
> --
> 2.20.1
>
>
>
