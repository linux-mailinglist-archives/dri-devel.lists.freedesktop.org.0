Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AB39B3173
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C05D10E146;
	Mon, 28 Oct 2024 13:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IJD44X+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7760889CCE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:16:08 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fb49510250so41225611fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 06:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730121366; x=1730726166; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JQj2u/EUMKp1RSMJyz02F9DUDwEFhFZUuvyibq9d3rg=;
 b=IJD44X+H0fHRkwxM2RH70dUm43lxBEXDDLrGMU1xsAU/x6Wrjme7WBORVRsmDLbY65
 NhOS3/i4839KB8SGw6eILJUORI6I7Tft7FK99IA/IyFXcueT9nbRS4N5DERp1TWVfMk/
 cbNASdVdlao4zKrrHo6mi24qZW74uhzfcxc591jJdGKC2B0DkBaLdD/ic6lfkjk6eUQb
 4yeRg8+gYgUE6qfNil8u3Bs1O4Sp2Ag8e/R0Xh4wF7gQwY7PMr3g8PGXE83FcHevzCuX
 RCo3KiwPt3sr7U1Nu7V9itkq2+wQrLR6MEdx5mITy62hPPIg5eWjNwUcC5Ln2A2ubH8F
 jiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730121366; x=1730726166;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JQj2u/EUMKp1RSMJyz02F9DUDwEFhFZUuvyibq9d3rg=;
 b=tjmMlqkc7oJ16nV+N6l62wBGHqLXoyYo/g2iNgwJK/pjEU7xDCflb7gqKyOdquruim
 AY2xvT11qB//0gJPZB1Lv6e6pGUUgKC4o6+mvwJ1P8VlsK43CqFVMcrYMEJcN57K20zT
 rHNv4z4CTHP0qthbPYNfO0CQpa2HsKayFOp1htpLDzP7qpasQhrpZ6mNZh5HLt2lTZTd
 HK0+TFe7oxUaGCsUwZmIAHwbUmFq9Gc3fnftZtb7+wtdxf+p8GkOZC7+RknvXLFxX5cr
 7dVLrHmbXPbi6UZ8Ica02XUMScXC0QNYoVvdo2Boz+lWBTsRd/MU7pk38LzOx1T7YkgP
 Wq9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9iOZq5TDNB2caM0plnD3eVBuu3+eEsps+mb3S1kX24kcdLjwSSZts8tQE6t1M0xhFxzHgRQudQBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbx54W0x7Iw29YyWxRZzZAPJNo5d/VeF6oOxyHN1rG1k/thHMO
 lUUjLRGhFbVUWiXtu03iiK+iDGy+Z5SFgG0mvE4vzEbq70Ct/Ws/IoX+CKZTTP0=
X-Google-Smtp-Source: AGHT+IGQ7S8hq2lRtSSOBdtmbOV8iimSsRBc14mXyCXrbAnhffIB8VwNLDv0WkdYHbRoHFHZoYlCzQ==
X-Received: by 2002:a05:651c:211a:b0:2fb:266b:e3b2 with SMTP id
 38308e7fff4ca-2fcbe088a17mr30036131fa.36.1730121366357; 
 Mon, 28 Oct 2024 06:16:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb45d1e56sm11546431fa.89.2024.10.28.06.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 06:16:05 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:16:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm: Remove unused
 drm_atomic_helper_commit_planes_on_crtc
Message-ID: <267fqxxhxyxihheex577dji5yjmggxxorcferqtyn2y5j3rg3w@d7j6a4klqmlw>
References: <20241022232934.238124-1-linux@treblig.org>
 <20241022232934.238124-2-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022232934.238124-2-linux@treblig.org>
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

On Wed, Oct 23, 2024 at 12:29:30AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> The last use of drm_atomic_helper_commit_planes_on_crtc() was removed
> in 2018 by
> commit 6c246b81f938 ("drm/i915: Replace call to commit_planes_on_crtc with
> internal update, v2.")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 72 -----------------------------
>  include/drm/drm_atomic_helper.h     |  1 -
>  2 files changed, 73 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
