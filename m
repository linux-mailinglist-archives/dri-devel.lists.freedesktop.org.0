Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D91C9B47
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 21:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6566E1B6;
	Thu,  7 May 2020 19:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0970C6E1B6;
 Thu,  7 May 2020 19:42:46 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id y4so7799718wrm.11;
 Thu, 07 May 2020 12:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gckpwq9UyhdYM7Snuci6fAgZatJZQE5/xPkNXtAqPXU=;
 b=FfblUmOZXnlJN7hCY+NKlWXlXO24/IXplyKaWph6ieK2NVQDlzMlM3g2CYtfwTHdfL
 ztEmLuU6qUGvsHMXuyHy9pTnpDKrNKu4fy5L4z5ghG2WOstzt8+p3cR4X7T/Um/omBSQ
 OaaRpAVDiN1DN4OZPc5YNK9rcHz93V2MBdXgQ15+4U9NXB1aHBoo6+Lm3WLKIDgyNqbq
 aH8nt8y3caCzE4pPMEEBJj9sNQBjJ4/VjNyxOzjUu24+Cs51JRnMFkCDInclzLva8fF8
 EyUIJPRenaZ8+GW0sGe9jYuFdNUKcdK6tWGsKNOzre69ELk/Qo3MS0uE3gOzJ2/ISwYN
 cRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gckpwq9UyhdYM7Snuci6fAgZatJZQE5/xPkNXtAqPXU=;
 b=TSdQR9KplFVkhqIhQUjEgszXdAW4QsOoefqAmvFu17IT/QU9xn3LimMocj1dHNGkmN
 Y3zeSP2XxHBXiYgl7i3tUv8yqUXCgV0QqICiFBMWWjEaSPcZRFOrSHBGyI6E1JtJiikS
 NY8suAq+94ifHbsRzD7qz7EkgBLfJwHHTZfkWRg7k1D5R7VHcxofYjb5TT0iPTvZGZJd
 We3eTN0WWoevemx/ysGftI9QHtSkt4OEctRHgOZifpRLjteWOnd9WlWEZjyW7g5xJdus
 l4oY+3ImhtjrrsBYxFlHfgPm0BRWeIIpLNheiwWz9Qrl00rNB+xwvUL2Wh6b2n2uZFaV
 +DjQ==
X-Gm-Message-State: AGi0Pua7L+5M6iMeQwprufdIT5W4vz9sK2guQoG+kAd0qTQzNaXsmYgG
 jVROnXozWNMtvjGgL0CmWRY8zTF5hhgi/H307yU=
X-Google-Smtp-Source: APiQypL+8STjCF7ijbtEAlezcdp9vJ09CwLfmp0u9W0uVql+wV3veMDwYgsVGQiJW9eEMtjCo9WaAXWBE7ce29TPt6I=
X-Received: by 2002:adf:fa91:: with SMTP id h17mr664269wrr.111.1588880564696; 
 Thu, 07 May 2020 12:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200507135023.33073-1-chenzhou10@huawei.com>
In-Reply-To: <20200507135023.33073-1-chenzhou10@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 May 2020 15:42:33 -0400
Message-ID: <CADnq5_M89XN26AwzRr+F0DJAP7Xz_2FWcO09iUrS2ArkFbK1cQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove duplicate headers
To: Chen Zhou <chenzhou10@huawei.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, May 7, 2020 at 11:27 AM Chen Zhou <chenzhou10@huawei.com> wrote:
>
> Remove duplicate headers which are included twice.
>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index 9ef9e50a34fa..1db592372435 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -13,7 +13,6 @@
>  #include "core_status.h"
>  #include "dpcd_defs.h"
>
> -#include "resource.h"
>  #define DC_LOGGER \
>         link->ctx->logger
>
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
