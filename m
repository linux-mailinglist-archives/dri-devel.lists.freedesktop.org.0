Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2496568DEF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2606D11B039;
	Wed,  6 Jul 2022 15:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1A511B01A;
 Wed,  6 Jul 2022 15:48:48 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x10so12467678edd.13;
 Wed, 06 Jul 2022 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=00PsEcFRen9hQVc5J36/2xhprKBUXZ2hnp6jcmTfM4w=;
 b=pNXn7TgzsCEm/pHTxWSPmtbN7IRdsA9BW/X0mOqzxpyXhEA83+pdsT0vK29YfnciIQ
 sZ7V6TIXe/zoYx9KLNvKLtd5mGEK3p3q+Z3kMnAhD8AzjDq9gN0PQm728q5MCwLsu7ML
 J/AI2PFIVxVzc9uuCMchCNxUPl3BVwMspju1Bv4nqXFyOx43M3rMxFvoA5GxyPvUWtJz
 7w5N5xmC+jmUslNTsEhsXfFXgzK3GZ6fHqpqQRyx5McVPFA0gkOopSPmfHRJ4vg8UiPT
 n9Vu97o6JYGYb40mNuiO+byqZjVJ/M97EqRyK90BwycxBN+CoIyvrotwsI0kxRDLb05O
 uTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00PsEcFRen9hQVc5J36/2xhprKBUXZ2hnp6jcmTfM4w=;
 b=l8aAdV2EzugX3+GBa+BGsesGlrR7qPu0uzJUCsUktM8asQdSwm0zWFCeTsIBeevdHi
 rvZL9/+8FbuG0vFtIlJpHERiop4J+r3+JSZiw5iM6iKBXZYYjLLmq7f5g76H6M6O13uQ
 OJuc9eQTmJsIm2RskvnPY4ybn/Nd8fXxB8PQOLYr7yJM3tYWHI7JrRayTsqaQ1A2Rsqi
 h6uPxDkxZfS0Pj0HgqQ32X3lbZ1gjkqr0enlKb9Bl3p6OqrX6A/aWMOFy2MKcXPrC20+
 Vi/+dIKRt+PExpLK3FRFWzGlQUEJkgmEyH2/QlRjbzZiLj+AsS8Li7gsW6HFtm/hXc4w
 rM9Q==
X-Gm-Message-State: AJIora+O5idAMIVpYswqc/VfQnEtzncpSs9ioD+0c4GLu6b96/tJWbJY
 ELfUrwNrHN/erGUJlhqsVZyp4esFvPdAYg2i7b8Yp73b
X-Google-Smtp-Source: AGRyM1tB0NAdoSnEuojTwit1peoREjx9nSZ+7zzDEGX3zBIahqBsrEIZ7Ikq39RHS0L39MfpGQKW8Vs4aGbTClM6clQ=
X-Received: by 2002:a05:6402:28c3:b0:43a:6d78:1b64 with SMTP id
 ef3-20020a05640228c300b0043a6d781b64mr19326670edb.93.1657122527099; Wed, 06
 Jul 2022 08:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220706045712.19930-1-hbut_tan@163.com>
In-Reply-To: <20220706045712.19930-1-hbut_tan@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Jul 2022 11:48:35 -0400
Message-ID: <CADnq5_MjpC988eDN8ODb_Lg5n1uLexWyQKEu=B+Cc0bRgvhAxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: Remove duplicated argument to ||
To: Zhongjun Tan <hbut_tan@163.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, Zhongjun Tan <tanzhongjun@coolpad.com>,
 Chandan Vurdigere Nataraj <chandan.vurdigerenataraj@amd.com>,
 Dave Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jul 6, 2022 at 3:41 AM Zhongjun Tan <hbut_tan@163.com> wrote:
>
> From: Zhongjun Tan <tanzhongjun@coolpad.com>
>
> Remove duplicated argument to ||
>
> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> index 07f3a85f8edf..5a701d9df0f7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> @@ -275,7 +275,7 @@ void dml32_CalculateBytePerPixelAndBlockSizes(
>                 *BytePerPixelDETC = 0;
>                 *BytePerPixelY = 4;
>                 *BytePerPixelC = 0;
> -       } else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
> +       } else if (SourcePixelFormat == dm_444_16) {
>                 *BytePerPixelDETY = 2;
>                 *BytePerPixelDETC = 0;
>                 *BytePerPixelY = 2;
> --
> 2.29.0
>
