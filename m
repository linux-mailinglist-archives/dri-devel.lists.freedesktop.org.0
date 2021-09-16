Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1978E40D883
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC836ECE1;
	Thu, 16 Sep 2021 11:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Thu, 16 Sep 2021 11:27:43 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BA56ECEA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 11:27:43 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com
 [159.100.248.207])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 0171C2020D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 11:19:30 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.66.162])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id EB6B8260EB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 11:19:26 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id AD5F73EDFC;
 Thu, 16 Sep 2021 13:19:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 8B6C32A514;
 Thu, 16 Sep 2021 13:19:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1631791164;
 bh=c0cxHUOunQ7UqVHmtLLuSnBhU/nmnvkIbtapLtavi7I=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=HDs3113Q4GwcksJ4lqz8Px1YGq5AfrSfZEQGGLma0lro+GyNFiJ7udH2XZ1y7q8M6
 ht0PWQsx1nbhg7YjXxlW6R6ATzdr/hMdJK9JieBUDPhXD1CAn26ajpCSSo/omzbDOs
 NlWLEMoECCBunaucYvq11GOkNMl9z0+07G66NySg=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1J677zBbw3Oy; Thu, 16 Sep 2021 13:19:23 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Thu, 16 Sep 2021 13:19:23 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 9096440496;
 Thu, 16 Sep 2021 11:19:22 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=aosc.io header.i=@aosc.io header.b="LUbFn9PH"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.163.223])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id CC86E41A61;
 Thu, 16 Sep 2021 11:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1631791134; bh=c0cxHUOunQ7UqVHmtLLuSnBhU/nmnvkIbtapLtavi7I=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=LUbFn9PHSPjdS3qoTcbqHBsUTuajtu+RJph7RHT0ajGsIHXFKcJCCzsRJ5WrIcFLC
 /lzDNaP9zWgzh4G58vzxj4y0lX/hv2uVOtqcWJfTd0yyJ+k4xjIg8aNuqz77zz39SV
 uHjoE4VqXQX2567yPDjslIAvUGrntMtnXgyUrdzc=
Message-ID: <21f916800a8852d4e7fd60480403270e146f065e.camel@aosc.io>
Subject: Re: [PATCH] drm/panel: k101-im2ba02: Make use of the helper
 function dev_err_probe()
From: Icenowy Zheng <icenowy@aosc.io>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>,  David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 16 Sep 2021 19:18:43 +0800
In-Reply-To: <20210916104247.11270-1-caihuoqing@baidu.com>
References: <20210916104247.11270-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9096440496
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[aosc.io:s=default];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DMARC_NA(0.00)[aosc.io];
 R_SPF_SOFTFAIL(0.00)[~all];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
 ML_SERVERS(-3.10)[213.133.102.83]; DKIM_TRACE(0.00)[aosc.io:+];
 RCPT_COUNT_SEVEN(0.00)[7];
 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.163.223:received];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 FREEMAIL_CC(0.00)[gmail.com,ravnborg.org,linux.ie,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 SUSPICIOUS_RECIPS(1.50)[]; RCVD_COUNT_TWO(0.00)[2]
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

在 2021-09-16星期四的 18:42 +0800，Cai Huoqing写道：
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> And using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Looks good to me, and thanks for pointing out this helper.

Acked-by: Icenowy Zheng <icenowy@aosc.io>

> ---
>  drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> index 2a602aee61c3..cb0bb3076099 100644
> --- a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> +++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> @@ -456,16 +456,13 @@ static int k101_im2ba02_dsi_probe(struct
> mipi_dsi_device *dsi)
>  
>         ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(ctx-
> >supplies),
>                                       ctx->supplies);
> -       if (ret < 0) {
> -               dev_err(&dsi->dev, "Couldn't get regulators\n");
> -               return ret;
> -       }
> +       if (ret < 0)
> +               return dev_err_probe(&dsi->dev, ret, "Couldn't get
> regulators\n");
>  
>         ctx->reset = devm_gpiod_get(&dsi->dev, "reset",
> GPIOD_OUT_LOW);
> -       if (IS_ERR(ctx->reset)) {
> -               dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
> -               return PTR_ERR(ctx->reset);
> -       }
> +       if (IS_ERR(ctx->reset))
> +               return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
> +                                    "Couldn't get our reset
> GPIO\n");
>  
>         drm_panel_init(&ctx->panel, &dsi->dev, &k101_im2ba02_funcs,
>                        DRM_MODE_CONNECTOR_DSI);

