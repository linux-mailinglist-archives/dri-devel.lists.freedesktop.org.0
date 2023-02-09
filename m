Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F8F690BD8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 15:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7909710EB0A;
	Thu,  9 Feb 2023 14:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A3F10EB03;
 Thu,  9 Feb 2023 14:32:37 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-16aaa20f516so2780668fac.1; 
 Thu, 09 Feb 2023 06:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LKj6y9Z9IvpBl0jxMUlOB98r+8XwPKm+/9oH/+jgH+A=;
 b=IVDPMcPlukIfsCfo145XvWKWae7B04hhyFiWBRq9J+K6aWc+cyQh85M/m5/2zmAOkG
 OLC6Akt28l95cibrdjMYdYpex34u9PyPw4TtJYy6lRygGxsbG/0fHcpAcqGSWPn2fItQ
 o6YAsZ5sN2//jS4bMg3QZCXoVBPxwTDUm8li0L8cnTe1HwtznWrpTAHf1n/rP6T6X2H2
 ef7xbl41/mFGCXsWpeYqU71AlU2DziUXhGYDNYmaBlVSMfJLYarlVBxIKo234lYN0quM
 dZTsMBjur/UststIY4hWvDhvCiny5o1ZnHoGxB6HqtSf6Sju9GssX040shZAwThUkyVt
 5ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LKj6y9Z9IvpBl0jxMUlOB98r+8XwPKm+/9oH/+jgH+A=;
 b=S/3em0blcSr//Sn7mMCUV6/28UMZI0iG5gTn3TUj1FIlfYW90GSctxH8iVnX+1WJMo
 itPfz7eUc4KNmkVDHtKW5hnl4idtaVlrzq7Hq9i3SQX+nFmS+zlaWGTuoBvdza4BWseY
 fA+KR6cco5uowTDZ48OE0Flv6xaCZlRmSaMsckLqw0dpNRs+yW9n/x1Mmu8Sx5I+q7xm
 GL4Yf0xEniDpXDNbLxiuSFI+fZ+VyDL8RixdWvmEQV7OzhMUy63/zee3lmXkzlR1TNei
 9bQk/WJsbxQIjPbFTicPcz5nS52lQZv0rge7GMFmI9mpqaxt9qU7uRy1kjnq6aRj3zMM
 k91g==
X-Gm-Message-State: AO0yUKWooKBBw1mgfAiAo5qmGWfowrtO1HSJRYj0uG8szX9A9ulx+tbd
 STwkc8VxPDXhiSrDQ6rX/MrwgionYQ4WBNkhRHY=
X-Google-Smtp-Source: AK7set+3USxeqX4PBZMGHOkvS2plp2YCQOH/qwTDyDN1wGmHqvN/vX1MIptJN9ZicpG4pHKkIqnl3xdCoWzhtmkbTaw=
X-Received: by 2002:a05:6871:29c:b0:163:8cc6:86a with SMTP id
 i28-20020a056871029c00b001638cc6086amr1084007oae.46.1675953156618; Thu, 09
 Feb 2023 06:32:36 -0800 (PST)
MIME-Version: 1.0
References: <202302091847543326041@zte.com.cn>
In-Reply-To: <202302091847543326041@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Feb 2023 09:32:25 -0500
Message-ID: <CADnq5_MLTxWSVwdd9=WuV63HLRHqfYqos-Myn6VLdSM5Q0FymQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: remove duplicate include header
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
Cc: sunpeng.li@amd.com, wenjing.liu@amd.com, qingqing.zhuo@amd.com,
 xinhui.pan@amd.com, rodrigo.siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 george.shen@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Feb 9, 2023 at 5:48 AM <ye.xingchen@zte.com.cn> wrote:
>
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
>
> link_hwss.h is included more than once in link_dpms.c .
>
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
> v1 -> v2
> Fix the U+00A0 non-breaking space in the subject line.
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> index 9cdfa7f7dc77..0c26b3589608 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> @@ -51,7 +51,6 @@
>  #include "link_enc_cfg.h"
>  #include "resource.h"
>  #include "dsc.h"
> -#include "link_hwss.h"
>  #include "dccg.h"
>  #include "clk_mgr.h"
>  #include "atomfirmware.h"
> --
> 2.25.1
