Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F61121118B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 19:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB4A6E966;
	Wed,  1 Jul 2020 17:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04126E963;
 Wed,  1 Jul 2020 17:05:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o8so23183065wmh.4;
 Wed, 01 Jul 2020 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6x/eshQOaZbRwbvxCznlVv+GRJKSzuX5jSo3FaCtmSU=;
 b=bKulzeyyYunFIKmQMOT2guE7blzLGwaJ8xZl+1LMJz0phsVMJhCFr+Klw58atX7WYl
 zIGwQ6MHSTvERrEQFMR/jT/Foaa6ApGYo+Q7SyK7ZH3dEZqQ6wO7QNbKowaoYJ2SeOgj
 QYtPEL7XnXTfRzZ1cwpCd5qdOwrmmWBvUE0BszIHfIQqfM/wVPJqNC5B2dvzVcX6Jb2x
 c4ymmKu1IEpaAtKJGMXncWtGOsnmQRKLH0Qypk6/tfXcvJMvBnl9wJ6QyekHVxV1YnMI
 rtXagRsR3yFqCakOzeHczcbUMfIXrTs5j2imhlgps+oKSb7WRjdWa+ejxQbA9KipgtxJ
 nHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6x/eshQOaZbRwbvxCznlVv+GRJKSzuX5jSo3FaCtmSU=;
 b=Hrq4MU4HlwHvm/eHWqyWPnGhDwrCE1cOj0W6hBzpOs8Qp3aHXc+iqQOoSuLVc+YnYu
 iFdmRHyYqv0iI4PPWZM+lXudlluUa1HpSo407klNf7Z/J8JyyCsHtxMKldWkQHJf3zGP
 fbKRD5UwWC/oXagjn+EXnDtbq5AhcZG5YNNbEuAqr024XMz/RVFqeW86vDTduh6+dnr8
 3o+ejE+5ZnDdMEtSH2bq++wF5RVQ7wYFxzA0pGtG9udC3XsHkId6WNgw/+WdMa+em2Ng
 IJey0w05r9p3/jAHiZ9oFPU3EMANXZrFCkUnoD8MyWU/CXd0Bv6Ers6wq9JjW15HfcBH
 m+hw==
X-Gm-Message-State: AOAM532qRWyWWBigeJ/V/NbV86WJy/5n3vBcArLNRiGCGT6QipiGpCxe
 NDflbqLUx/L9T2aRgKsOeNMcwGXfrBdupEV2jZ0=
X-Google-Smtp-Source: ABdhPJzxshgznKeS4OzcUe9yhgpPkkzhjMItFOKqHWiAf1fbcSA6G3c357AQw5Fllq4uBWnABuvA9/6nOcmnYDmGQ7Q=
X-Received: by 2002:a1c:dd09:: with SMTP id u9mr26470612wmg.70.1593623134431; 
 Wed, 01 Jul 2020 10:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200701145905.551367-1-colin.king@canonical.com>
In-Reply-To: <20200701145905.551367-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 1 Jul 2020 13:05:23 -0400
Message-ID: <CADnq5_PFzyvzCSkj3wHEfyu+yGavbsXuMEsiz+UD5tDeNfavuw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove redundant initialization of
 variable result
To: Colin King <colin.king@canonical.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 1, 2020 at 10:59 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable result is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
> index 1b3474aa380d..d0a23b72e604 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
> @@ -151,7 +151,8 @@ bool edp_receiver_ready_T9(struct dc_link *link)
>         unsigned int tries = 0;
>         unsigned char sinkstatus = 0;
>         unsigned char edpRev = 0;
> -       enum dc_status result = DC_OK;
> +       enum dc_status result;
> +
>         result = core_link_read_dpcd(link, DP_EDP_DPCD_REV, &edpRev, sizeof(edpRev));
>
>       /* start from eDP version 1.2, SINK_STAUS indicate the sink is ready.*/
> @@ -177,7 +178,7 @@ bool edp_receiver_ready_T7(struct dc_link *link)
>  {
>         unsigned char sinkstatus = 0;
>         unsigned char edpRev = 0;
> -       enum dc_status result = DC_OK;
> +       enum dc_status result;
>
>         /* use absolute time stamp to constrain max T7*/
>         unsigned long long enter_timestamp = 0;
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
