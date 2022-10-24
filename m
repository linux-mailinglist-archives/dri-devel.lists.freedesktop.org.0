Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DD460AECA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3556810E847;
	Mon, 24 Oct 2022 15:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5B910E83D;
 Mon, 24 Oct 2022 15:15:09 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id 1so8166465vsx.1;
 Mon, 24 Oct 2022 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MEsL7GbLrX3WUEBmKekLTRaPE8tL9JC4qHnSEJvzbHY=;
 b=kbNzdGO1P0H9Vp7815DR3Ru36Md2jLdOFQaNkVS5lx5q5mRltCIan9YxjpJbudtBst
 50/9ewHrzS7KmPmJqEnCRKJS1W6Lj4KQOe9wdQgRm9bjtAPty/peHeoMh5LtJik67LYa
 RsLobPc3yV60dp2X61Lr0+/NBHQigQmjueBNsMvkHGuXH9dsfUPtmwFqNHTCum53qm9h
 3VO+r+JNPpxta8OOQXbuI7ZfjzPPPLrJcOTyGuvIKByMjKfe2ltzx/e6IDtYpMKlU+tT
 pE+Ec6d9kAiq9rBqPVGy4Rk5KIuSjfRng8aHkCv6aQZPl9US9a0xcST7BUQQ9hFOHNfJ
 zKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MEsL7GbLrX3WUEBmKekLTRaPE8tL9JC4qHnSEJvzbHY=;
 b=0Z5TabKgmsagqYWkIM5Eq9rO9uJ3uVS8D/aYrDq5TEhSB9osH7ssNxFwTIewS7125p
 ATCLw7KL2ej7zPxW3nUsnjpHkw6pOyBACK8w1ONqhYCdssdNNSI22I0Q3s6yNoJWmwU6
 rHYH+ChcMtmoa0xMjiakLwASXnnMa4hhTAa0vZm4o0E1IpODOrNHPpOKYBtuQkefU8Nv
 c+PlbpaZkc5+x4xEggmv6d1ZPcQQP+rTUuAImz02I2Pu/6ZOXeRY9GgkrLQZoHO3AZVV
 u9XVMydNaEtGD0A1IPCf5YtB0s+ItWHa8cM6OB4bEODKHhbVdFeZWE5PnrC9RC+NU0xM
 Azhw==
X-Gm-Message-State: ACrzQf2q25taDmfgY5wdv5pNUUOgCyzulETppRL4dZkHsaqcBHCfQAUT
 +eEsgOb45qvMkP5vFuqch9Ggwo+xhCVU3eF73HI=
X-Google-Smtp-Source: AMsMyM5o70JuycrOFnPPgJBHTwneEZBvQyg1y9bHbhYLTowaDWTNmWA2QueVCe0nZeUEVWrSmau+fRc0ZNRjBHkpmz4=
X-Received: by 2002:a05:6102:224d:b0:3a7:68fc:9163 with SMTP id
 e13-20020a056102224d00b003a768fc9163mr17666133vsb.74.1666624508640; Mon, 24
 Oct 2022 08:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221022060417.55166-1-wangjianli@cdjrlc.com>
In-Reply-To: <20221022060417.55166-1-wangjianli@cdjrlc.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Oct 2022 11:14:56 -0400
Message-ID: <CADnq5_PYbzXMptt8KebWuO5d8VErTkAB070Cp1AG88jHC8Xf+A@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: fix repeated words in comments
To: wangjianli <wangjianli@cdjrlc.com>
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sat, Oct 22, 2022 at 2:06 AM wangjianli <wangjianli@cdjrlc.com> wrote:
>
> Delete the redundant word 'the'.
>
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/gpu/drm/radeon/radeon_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 15692cb241fc..ff52b5f4c1e6 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1206,7 +1206,7 @@ static void radeon_check_arguments(struct radeon_device *rdev)
>   * @pdev: pci dev pointer
>   * @state: vga_switcheroo state
>   *
> - * Callback for the switcheroo driver.  Suspends or resumes the
> + * Callback for the switcheroo driver.  Suspends or resumes
>   * the asics before or after it is powered up using ACPI methods.
>   */
>  static void radeon_switcheroo_set_state(struct pci_dev *pdev, enum vga_switcheroo_state state)
> --
> 2.36.1
>
