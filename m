Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729569F4543
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 08:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C287810E869;
	Tue, 17 Dec 2024 07:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="le6+j9Up";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1070 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2024 07:39:29 UTC
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CCF10E00B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tD0w9hGE0HHz3hp3Nt0ft5ye3qwggV6ir0MMxdx6g+8=; b=le6+j9UpKB5XBjVYLVyHZ4HtRB
 tMarVuf71hL0pP/kLHxvv4c+Y1/+2dpKIps9GKlI88Gm3odi1Bas3kIEz/kXw1GAE1bzvI+jTBeAu
 7eST2E3guutYIJL3tQe/Z2JlaLhgwxx7aIGxY3VTHBNXBoaOUsbaV1VJ5NYCUA//itPnhVaEgOTqs
 lSgm1nAX3m/P9sJRIY90bOShfPVUws/4+aRgg6G2pZAK6a7kveGqAOs1UTbgst6cio1LIMZ4movPE
 6VuGrBl7/4OfRA7PecPBcz3d9NTmceelHNZeo6QOY7YbPRF8SqyyrjPKyNCMbv/CRJ/mrkgwVAjml
 8luSOoiw==;
Received: from [2404:7a80:b960:1a00:1b57:df18:efe3:20c1]
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1tNRtb-009eYK-1I;
 Tue, 17 Dec 2024 09:21:32 +0200
Message-ID: <0036ecec-8476-4617-ac40-8ff90fb33c07@kapsi.fi>
Date: Tue, 17 Dec 2024 16:24:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
To: linux@treblig.org, thierry.reding@gmail.com, mperttunen@nvidia.com,
 linux-tegra@vger.kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241215214750.448209-1-linux@treblig.org>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20241215214750.448209-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:1b57:df18:efe3:20c1
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

On 12/16/24 6:47 AM, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> host1x_debug_dump_syncpts() has been unused since
> commit f0fb260a0cdb ("gpu: host1x: Implement syncpoint wait using DMA
> fences")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   drivers/gpu/host1x/debug.c | 9 ---------
>   drivers/gpu/host1x/debug.h | 1 -
>   2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
> index a18cc8d8caf5..6433c00d5d7e 100644
> --- a/drivers/gpu/host1x/debug.c
> +++ b/drivers/gpu/host1x/debug.c
> @@ -216,12 +216,3 @@ void host1x_debug_dump(struct host1x *host1x)
>   
>   	show_all(host1x, &o, true);
>   }
> -
> -void host1x_debug_dump_syncpts(struct host1x *host1x)
> -{
> -	struct output o = {
> -		.fn = write_to_printk
> -	};
> -
> -	show_syncpts(host1x, &o, false);
> -}
> diff --git a/drivers/gpu/host1x/debug.h b/drivers/gpu/host1x/debug.h
> index 62bd8a091fa7..c43c61d876a9 100644
> --- a/drivers/gpu/host1x/debug.h
> +++ b/drivers/gpu/host1x/debug.h
> @@ -41,6 +41,5 @@ extern unsigned int host1x_debug_trace_cmdbuf;
>   void host1x_debug_init(struct host1x *host1x);
>   void host1x_debug_deinit(struct host1x *host1x);
>   void host1x_debug_dump(struct host1x *host1x);
> -void host1x_debug_dump_syncpts(struct host1x *host1x);
>   
>   #endif

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
