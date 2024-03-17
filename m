Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5878187DFC5
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 20:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C69E10E06A;
	Sun, 17 Mar 2024 19:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="jRfeZ9jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1240 seconds by postgrey-1.36 at gabe;
 Sun, 17 Mar 2024 19:44:12 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67C710E093
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J3rmugwOBqmFCeFyr0Zq+TggeSH2clrkfuPS4qvEykI=; b=jRfeZ9jz7BCQwAjeWxqiHzCmuy
 tG+mi++H6GCvv4BsixXRgsUb0m8M9O+uhbvJOhEgT6LsobxFXafX36u0ZV5ct8aGq8R9RXWI9TN01
 EWHrQEYIBLIilmSkagD184HJvil+Sah3ejBKBOdseNTLZM6UNQgFNrKQBNPw5k90UU5ckaf93rarr
 Pmpf96MaizDICLWBhyrWvPNljqffU2ZZvr/15zeL6cfzOHMDruRW6botEdjIrWBw7UvxUdNrU2Avq
 V78vqKwZqjiBC/HixE0adYrS20ap6cTJv/cNz4HxMwuhEbSMFw8y4V7MvOUcVl1V7HkLp3a7zzJSx
 W46zdywQ==;
Received: from [2a01:799:950:4300:268a:bbd3:738c:c4c6] (port=39794)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1rlw5n-00HYIi-25;
 Sun, 17 Mar 2024 20:22:47 +0100
Message-ID: <d56769a1-e96f-42ab-b38d-b8d6525da288@tronnes.org>
Date: Sun, 17 Mar 2024 20:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 39/43] drm/tiny/repaper: Use fbdev-dma
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 noralf@tronnes.org
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-40-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20240312154834.26178-40-tzimmermann@suse.de>
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



On 3/12/24 16:45, Thomas Zimmermann wrote:
> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by repaper. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/tiny/repaper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Noralf Trønnes <noralf@tronnes.org>
