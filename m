Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD5492C2B0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 19:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDF010E5EA;
	Tue,  9 Jul 2024 17:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=craftyguy.net header.i=@craftyguy.net header.b="pHkrWwuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 336 seconds by postgrey-1.36 at gabe;
 Tue, 09 Jul 2024 17:42:32 UTC
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E9C10E5EA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 17:42:32 +0000 (UTC)
X-Envelope-To: dri-devel@lists.freedesktop.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
 s=key1; t=1720546614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYBxWLGAcmWENoCeTH9h/MtmyY+1EsHX0Wj4th9Aeo4=;
 b=pHkrWwukLyYUSK7GGSk+goRA0Jke/r2TS15T7SSb749f7NPcXZg3cdDAa5NvUT1f+q8UMY
 qAcOMxnPg0SCAbVQv1cPxVngsCBHqvYOTxJcMdZh4OP4OTYZMW7vLJcu5SfocjkS69zcxE
 NIuFI/hIubY6rlVSG26Z59PMEZ01/gYqkuScQJBwo3/x62jOUUxbJNyM3ZK4FImBHW+BSH
 AEvc47rKHCgWFDMDY0xsmK1VCbPHN41rJks/v5pK7C27i5ayueDWbYR7B1qJm1CXf43Ar7
 s3SxfMbKblJVlJPJ7Gw/5Uc+O4vBn1fw+cFL4vtkP8KZB13fjpG6wYHzZ3PWNw==
Date: Tue, 9 Jul 2024 10:36:30 -0700
Message-ID: <20240709103630.GC13955@craftyguy.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Clayton Craft <clayton@craftyguy.net>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/panel-edp: Add entry for BOE NV133WUM-N63 panel
In-Reply-To: <20240520221836.16031-1-clayton@craftyguy.net>
References: <20240520221836.16031-1-clayton@craftyguy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

On Mon, 20 May 2024 15:18:36 -0700 Clayton Craft <clayton@craftyguy.net> wrote:
> This panel is found on some laptops e.g., variants of the Thinkpad X13s.
> 
> Signed-off-by: Clayton Craft <clayton@craftyguy.net>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 6db277efcbb7..f75db9917667 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2047,6 +2047,7 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
> +	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a1b, &delay_200_500_e50, "NV133WUM-N63"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
> -- 
> 2.45.1
> 

Any chance this can get picked up soon? Is there something else wrong with it?

Thanks! Clayton
