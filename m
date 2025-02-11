Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8E5A30DFC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 15:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F1C10E6C6;
	Tue, 11 Feb 2025 14:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="D/4Ey+3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C271A10E6C6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202412;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MIH+Qt/I9LD0chnB4J+lbV92eo3vViC6oSROdQt6ba4=; b=D
 /4Ey+3olG2BeKv37mJEme3irIv1YP4ccIAvY8M8gHQ8olFj6qYpG7JFU/Lr7NKb7VlznB2C3CYmEJ
 g22ghj4XO/HRn30IVaTWsnEG7WcpRdPbOfmG6thhEVbtlFF4SI2fZR3ravAobbl5nEijwg9Y9R1ey
 741QsVOfN/UgIWmwFug7bWnCB+Ghh6oO3TwhuWNO9mW9tSaDFIQrbxf3TwQdhZI/jn30pVbu9bMso
 0zqDgE7pFD/BxG01Eqwfk79GBxu8wQyexnuOo5m8YuGIFO+fwelIrcYdtfIBzxNn3AwmMz3oQ7Si8
 15ukF515EYQvDZGqOVilBmk8FpCEr+RNA==;
Received: from smtp by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 id 1thr43-003msR-Gj; Tue, 11 Feb 2025 15:16:39 +0100
Message-ID: <221ad1f2-307a-4ead-84e2-4b6c4331a20f@tronnes.org>
Date: Tue, 11 Feb 2025 15:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update maintainer of repaper and mi0283qt
To: Alex Lanzano <lanzano.alex@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org
References: <20250210233232.3995143-1-lanzano.alex@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20250210233232.3995143-1-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 11.02.2025 00:32, Alex Lanzano wrote:
> Add myself as the maintainer of the recently orphaned repaper and
> mi0283qt drivers.
> 
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> ---

Thanks for picking these up:

Acked-by: Noralf Trønnes <noralf@tronnes.org>


>  MAINTAINERS | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1c5b22f00434..b5e46f23d1ba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7352,7 +7352,8 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/mgag200/
>  
>  DRM DRIVER FOR MI0283QT
> -S:	Orphan
> +M:	Alex Lanzano <lanzano.alex@gmail.com>
> +S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
>  F:	drivers/gpu/drm/tiny/mi0283qt.c
> @@ -7455,7 +7456,8 @@ F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml
>  F:	drivers/gpu/drm/bridge/parade-ps8640.c
>  
>  DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
> -S:	Orphan
> +M:	Alex Lanzano <lanzano.alex@gmail.com>
> +S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/repaper.txt
>  F:	drivers/gpu/drm/tiny/repaper.c

