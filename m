Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D427F8D0615
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFAC10FB62;
	Mon, 27 May 2024 15:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="i615Y8vL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D8F10FB62
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:29:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RDRf0H030322;
 Mon, 27 May 2024 17:28:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 i+7AfMovLzF2bNEht1wnwdgHNoNpV4Ekv7u2xky9FxA=; b=i615Y8vLDvhlpi/z
 iAdj/4ieNKY2XnppaxWAT3QMinPuCCd1GQ6ERSAN265rkyNGbAjJcc4jzaB/ZBT7
 VNN6Ai043nkOz09D504NSaiutB47Zm9JIHRhva3pzvkBw5SaeYVgTjjaovXmpS9I
 K1RHzHLEfCtcFOzOXBwb9no/5imLZsqZmdUeWfuS/eXLxlOAgzsq5/0YUe9n9Dll
 3b+R8XX4uEkIEsPpottnoplkw41xcEtFGtTCFJolF+ETtu9giNZ1lqmYOyVQzIRO
 7b+3rzfUvRi1K5Z+BwGDpDbDEUW5e+OHmgPv8vru+Rs3GZKpc5VlvDsQ5vQInbTN
 ksfXoQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yba51qjtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 May 2024 17:28:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0E9F14002D;
 Mon, 27 May 2024 17:28:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF69C221EAE;
 Mon, 27 May 2024 17:28:41 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 27 May
 2024 17:28:41 +0200
Date: Mon, 27 May 2024 17:28:36 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 06/21] drm/sti: Include linux/io.h for devm_ioremap()
Message-ID: <20240527152836.GA714350@gnbcxd0016.gnb.st.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408170426.9285-7-ville.syrjala@linux.intel.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-27_04,2024-05-27_01,2024-05-17_01
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

Hi Ville,

thank you for your patch.

On Mon, Apr 08, 2024 at 08:04:11PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Include linux/io.h for devm_ioremap().
> 
> When built on x86_64 w/ COMPILE_TEST=y:
> ../drivers/gpu/drm/sti/sti_dvo.c:531:21: error: implicit declaration of function ‘devm_ioremap’ [-Werror=implicit-function-declaration]
>   531 |         dvo->regs = devm_ioremap(dev, res->start,
>       |                     ^~~~~~~~~~~~
> ../drivers/gpu/drm/sti/sti_dvo.c:531:19: error: assignment to ‘void *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
>   531 |         dvo->regs = devm_ioremap(dev, res->start,
>       |                   ^
> 
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/sti/sti_dvo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index fd1df4ce3852..48a5d49fc131 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/debugfs.h>
> +#include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> -- 
> 2.43.2
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Alain
