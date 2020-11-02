Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2059D2A3370
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 19:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5966E25B;
	Mon,  2 Nov 2020 18:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07E66E25B;
 Mon,  2 Nov 2020 18:58:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 33so5060012wrl.7;
 Mon, 02 Nov 2020 10:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XxeRfZAIWbudLvp9kWivxncFadrsvxo56vZJQ20jKs4=;
 b=kOusrNgTcZm1MxA3iSkro72CMD3oLdxo8P3rycLbCduVu8veVm0Za2ckbpRMXgneNS
 t0jAYOqI7qTcxjAbWh1edM/wwKBrnQVG0pEqHbK5AXtsQtNn2FH01tkDKBQuth2FHmES
 1BLS7z9rEV8/45Df9hWoCjIpdKYTDYoD/OgjAsmv+udkLzBYvOHhzn4fUeHhZLhszA56
 5oYxXxKI86lgXMqPyA2qC5+e6lkz/cQtUo+6y3RZgK5AOTJ8GnqXLMTaRtPqwc4HKm1q
 WaoE72ypwkyIN8H9zt/dpOTz8lQeDuqulJqnCyfmCuJPMipsIqEfEHkm9ThmeiVeNWk+
 hlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XxeRfZAIWbudLvp9kWivxncFadrsvxo56vZJQ20jKs4=;
 b=FDIaO9CSSp+TuKbc4NY7FlIj0/QR4XV31rOS3BHgMAFCucX9uvbWmqer498XNwDfdF
 JMBrV/ZENY74WnmetzQPsTFtCQccyj+aKmBZgF2OVNw5IoitIxJ4ceHE3o+j+jSTNAzg
 LKImvFTWJeCUersLNBX11Y0Qcl38Bmygo/xs9sN+EjAb8AZ80coosF1mzoZfV3LnyVSh
 rG3OOKs0ZJiiSiU/iQzjymaxIavjY4NVZUTNAvGzGnDDRcua3bZfpnoch5IC/PumO3P0
 2vzCGSQqlIeen0Rcg5K9O5K3z6UnNBUi+QAAfViUN7q05DPWWTqB+2M5NLFf8WWHW/YZ
 7ODg==
X-Gm-Message-State: AOAM531dgp9SeT3Pr48KNANmtzobvJJoH1D5xOaZQ7a+qdFNw82+1UIW
 RmCJdMspBVTUhqyVyc92jh8KAPqltX7tfaqAgYc=
X-Google-Smtp-Source: ABdhPJxvq18UhGQenFga2zX3xGzDEm+8E1qLSRDidKYDfnqifZoOx6NvrWF8WShy3ONm0wckJIZeC2DOkSqQ6RsC+og=
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr23253688wrl.124.1604343487472; 
 Mon, 02 Nov 2020 10:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20201102125747.6420-1-bernard@vivo.com>
In-Reply-To: <20201102125747.6420-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2020 13:57:56 -0500
Message-ID: <CADnq5_PwBLibCGs_feeUGnJrTs1=2ezW_kyev=-aXm3V15QNUg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: fix typoes
To: Bernard Zhao <bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, zhengbin <zhengbin13@huawei.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Nov 2, 2020 at 8:43 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> Fix typoes.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> index 2c6db379afae..e994d233aa21 100644
> --- a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> @@ -1980,7 +1980,7 @@ static void calculate_bandwidth(
>         else {
>                 data->latency_for_non_mcifwr_clients = bw_int_to_fixed(0);
>         }
> -       /*dmif mc urgent latency suppported in high sclk and yclk*/
> +       /*dmif mc urgent latency supported in high sclk and yclk*/
>         data->dmifmc_urgent_latency_supported_in_high_sclk_and_yclk = bw_div((bw_sub(data->min_read_buffer_size_in_time, data->dmif_burst_time[high][s_high])), data->total_dmifmc_urgent_trips);
>         /*dram speed/p-state change margin*/
>         /*in the multi-display case the nb p-state change watermark cannot exceed the average lb size plus the dmif size or the cursor dcp buffer size*/
> --
> 2.29.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
