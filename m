Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D02A4C06
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 17:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6A66ECDD;
	Tue,  3 Nov 2020 16:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C1A6E8E7;
 Tue,  3 Nov 2020 16:53:36 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a65so13033168qkg.13;
 Tue, 03 Nov 2020 08:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2rOoP2fWtBXqSw4r+2p1MaKzqZjSJnhx6ffXaf9QlVk=;
 b=idUuY1I/7/Dsp/4V6KdBy9e68cpsernin93UYfooKQagDBRrwQ0KaQ+9GJTmtvv/mG
 ulgBnE42Wr+iSUmVIuUzN3/ysFAaXO8xltucoFfH1diTuBWjpKtk+P0pbKrZZ0qdbqQj
 RyLjefqx/uzE+yRAHEH096sLCNoi8g71eiqO4/07JhRWriWTrDUmsovBz04G+Vq9cSF5
 S6GScFHctzEQlaSnrCG6G/5+xB5VB5LcnVOJbpY+2KSuCr0wTxjF1msZC0afrkApwS3+
 +uAvoyOBf9Sp8n5AUmsEtgaS8HXlkVuHxeQClMIEjVVr4atNPefQCReKjZ+iCpmsDFKX
 rLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2rOoP2fWtBXqSw4r+2p1MaKzqZjSJnhx6ffXaf9QlVk=;
 b=WSTV0iFuVjErAKk+8O8oaaLLFEacVi79LQpQA+GClVKGMgvSYOs9X8AFqRuBBlWo8D
 gd/+hLxSp6q9vlNsdwuNFLDvFtz5pyf/fDJoLFcfLjd/+KCEiwTcHWJjha9ZYp6A/Fxd
 xVQ/H/2r0WtwyDfgodOCiPygI1tQQDXl8TpRSmPWkELUcHdJHK9ZVaA16SFtGS4ztEDg
 HeQfTrh8Y48+uxbcnyuIlBm/30ZILqo8IB6edVoTIaBz7+1C2VtH+wJUAJWa/0vPAc6N
 o1lLNpqVJ64lCkFV/sQXYXRl8KV8nhEYm0Lz+G8jkfGMbXt4Zhmp0vRMRaUJsG7CE7/P
 RiIA==
X-Gm-Message-State: AOAM532g/+jGZix+3P4lmuuvoTv45GwiyLql2TZPMv/y1vixS9tQOFIQ
 4mFV7AbR5BlejFNfNvhHyJ5bfQxmI950FRMBYQQ=
X-Google-Smtp-Source: ABdhPJwHZQ/SuWWjX2a7/T2uWhTDgyqi0D7QJ327tEhGpJR6MJSjoTNFKlerViL4vMV6iTYKSx3eZqV9iBL7TFnY5UY=
X-Received: by 2002:a37:664a:: with SMTP id a71mr15022946qkc.370.1604422415844; 
 Tue, 03 Nov 2020 08:53:35 -0800 (PST)
MIME-Version: 1.0
References: <CAKWwwMhUPk3hAs6oPKHxvV7jVgHh4WP3bvZGYOkPaSF9fRRh9Q@mail.gmail.com>
In-Reply-To: <CAKWwwMhUPk3hAs6oPKHxvV7jVgHh4WP3bvZGYOkPaSF9fRRh9Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 3 Nov 2020 08:53:24 -0800
Message-ID: <CAF6AEGt_tNO2uPZk_rA=q-haUSgvcvbHE53gyrOjpdVOqr1J0g@mail.gmail.com>
Subject: Re: [PATCH] drivers: drm: fix msm_drv.h warning
To: dev god <g0d3ph@gmail.com>
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
Cc: Zheng Bin <zhengbin13@huawei.com>, trivial@kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Vara Reddy <varar@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Should be fixed by:

https://patchwork.freedesktop.org/patch/397039/?series=83038&rev=1

On Mon, Nov 2, 2020 at 7:44 PM dev god <g0d3ph@gmail.com> wrote:
>
> Hi
>
> fix implicit declaration of function error.
>
> >> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1229:7: error: implicit declaration of function 'msm_dp_display_pre_disable' [-Werror,-Wimplicit-function-declaration]
>                    if (msm_dp_display_pre_disable(priv->dp, drm_enc))
>                        ^
>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1229:7: note: did you mean 'msm_dp_display_disable'?
>    drivers/gpu/drm/msm/msm_drv.h:420:19: note: 'msm_dp_display_disable' declared here
>    static inline int msm_dp_display_disable(struct msm_dp *dp,
>                      ^
>    1 error generated.
>
> Signed-off-by: Gah0 <g0d3ph@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f7f5c258b553..52d9a82fb64f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -14,7 +14,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
>
> -#include "msm_drv.h"
> +#include "../../msm_drv.h"
>  #include "dpu_kms.h"
>  #include "dpu_hwio.h"
>  #include "dpu_hw_catalog.h"
> --
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
