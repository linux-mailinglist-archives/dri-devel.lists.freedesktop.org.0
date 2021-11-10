Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3472A44C898
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 20:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45076E329;
	Wed, 10 Nov 2021 19:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7778C6E105
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 19:09:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i5so5821316wrb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 11:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pqTtvsJvFDR96EKSx1b5ZcJqIA6TjVY8DfdfVOQQVkg=;
 b=OraYSJLA7D1e+oAnvKBTUMG0wtMZ2I6D8QLv9+XaEhce03siSYaxzm58bn5DazpP2t
 f1exfW7FSxxnV/vfFJAcG8QbcZRMrwxX9qYJEtdu9fYqQSVFe5PNjb1fszlRu5dRGnL3
 shMm+rMdH0A77Mlfi/dy0SOdoZnbFOQO1uQFU86iFHA1GQMJgVQ7Piw3/PJYtM2X8sYS
 AvC6Ox5AqpxJ1VaKdYVTUYXIQbkYo6Ox8mVeYeF/dSSSGt+GzDOv3rsZNvT2czw1RXCb
 IGjoqmhnsrTkJlJNnWKecTYMIXewmDT0Gs68F7Kbne4QOdGFvVUJ62mJUuU4QrcX2iwf
 ZCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pqTtvsJvFDR96EKSx1b5ZcJqIA6TjVY8DfdfVOQQVkg=;
 b=gAndztZ51NxHzSP0ORGnPlXXuU44TbAxLKDL9Rh0ztzHvAZzvKaWDqcTdgAZl65L8P
 GbVbQiYrax70Rd60Hn2oAN2mm4DNwasf+c0L0A09913s4G0cuLhSkkJ3psJZjC+KGZsK
 ma44hSqtgv8jtso0n7PfmRV/E+HCC4ZmZir47knHIdA+1AYLhqDYwUyZlLF52wngtWpX
 i1Fsbtt3CyF0YVT2UoCdy+YCfbpb7/iKKdAou+d5i8R5cikOVK8YKkGRppODHKrJ+JKr
 53Sb9RCM1F2iNo8NrS92GjQjmUjjHUb2yPG/JERLp32sTVGLiDxYWps8nNg7mp+KOTpk
 d8og==
X-Gm-Message-State: AOAM531hnkZgjxDGUC71vWebX/sxF9VuZacm4rklT3PRoosCtfMQxgSw
 vXCJ3Uyf5DrAmX98BkEP6+0=
X-Google-Smtp-Source: ABdhPJyCmpq9lwW4IvHHyGzr8+6vKj4LGQQ8kLz7wGpBXQJHt+QjAVGJT6iIUpyLzITJtdy/87iWRQ==
X-Received: by 2002:adf:e38d:: with SMTP id e13mr1632784wrm.402.1636571370063; 
 Wed, 10 Nov 2021 11:09:30 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id k8sm659793wrn.91.2021.11.10.11.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:09:29 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, wens@csie.org, mripard@kernel.org,
 Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] [PATCH v2] drm/sun4i: fix unmet dependency on
 RESET_CONTROLLER for PHY_SUN6I_MIPI_DPHY
Date: Wed, 10 Nov 2021 20:09:27 +0100
Message-ID: <2602978.mvXUDI8C0e@kista>
In-Reply-To: <20211109032351.43322-1-julianbraha@gmail.com>
References: <20211109032351.43322-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-kernel@vger.kernel.org, fazilyildiran@gmail.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Julian,

Dne torek, 09. november 2021 ob 04:23:51 CET je Julian Braha napisal(a):
> When PHY_SUN6I_MIPI_DPHY is selected, and RESET_CONTROLLER
> is not selected, Kbuild gives the following warning:
> 
> WARNING: unmet direct dependencies detected for PHY_SUN6I_MIPI_DPHY
>   Depends on [n]: (ARCH_SUNXI [=n] || COMPILE_TEST [=y]) && HAS_IOMEM [=y] 
&& COMMON_CLK [=y] && RESET_CONTROLLER [=n]
>   Selected by [y]:
>   - DRM_SUN6I_DSI [=y] && HAS_IOMEM [=y] && DRM_SUN4I [=y]
> 
> This is because DRM_SUN6I_DSI selects PHY_SUN6I_MIPI_DPHY
> without selecting or depending on RESET_CONTROLLER, despite
> PHY_SUN6I_MIPI_DPHY depending on RESET_CONTROLLER.
> 
> These unmet dependency bugs were detected by Kismet,
> a static analysis tool for Kconfig. Please advise if this
> is not the appropriate solution.
> 
> v2:
> Fixed indentation to match the rest of the file.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


