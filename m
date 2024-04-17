Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D3D8A878F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 17:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B089410F5BA;
	Wed, 17 Apr 2024 15:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="P1Ufu0Bl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF7910F5BA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 15:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=HVzZeJ247p1V1u0rlIku8RLkTZYvH0Jt2c8PrKArliw=; b=P1Ufu0BleuygiAAjzsdXeY0gjD
 cs/q4bZh88qdyH8ZAX1siqDGKWdn+gTgHw16ztJtlMSBTmAU8ikWXkh248nwqbe2aInFWxTXZQwd1
 UAgrpM5ZOghUf28YStNto2US9RsYOq0vhi/3DEMYwPDipsYpScBWenO4101ggIznXsmPaNd/VB2Lj
 YwjA8an0XER3gYOoLkNW6BQEzPH1jhWQTEH5bWa6fxz9nXkCcB4dKhp8vlKmfx4iLgs6hPzgz20n8
 cEPxfF2ihHIakEB7hvC6FgPpOZ20b6LXgWiBsO1knFNCzJf65MNkSKrcVMegFaPRfdkc+4Ndkmr6E
 H+6wDNEA==;
Received: from 239.81-166-173.customer.lyse.net ([81.166.173.239]:54210
 helo=[192.168.10.99]) by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1rx7Aq-000HI7-8U;
 Wed, 17 Apr 2024 17:26:12 +0200
Message-ID: <a34be968-74ac-4bd3-9b67-ede2ff96ee28@tronnes.org>
Date: Wed, 17 Apr 2024 17:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] drm/gud: switch to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1713273659.git.jani.nikula@intel.com>
 <c519a9b9d3c3c9a413de33b99b97a1120f774f2d.1713273659.git.jani.nikula@intel.com>
Content-Language: en-US
Cc: noralf@tronnes.org
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <c519a9b9d3c3c9a413de33b99b97a1120f774f2d.1713273659.git.jani.nikula@intel.com>
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



On 4/16/24 15:22, Jani Nikula wrote:
> Prefer struct drm_edid based functions over struct edid.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 

Thanks,

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
