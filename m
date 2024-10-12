Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB83599B21F
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 10:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD7B10E311;
	Sat, 12 Oct 2024 08:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="SsG54UIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871B210E311
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7H7HriavVy9q67V4FTRCUBXFAfBPXeCcnNQQukIV0y8=; b=S
 sG54UIuvtgOKBwJksGegGSdiLJ+dgZP39g3IyNt0c8i4xJHsT5FGQsOmYStl5I/Jkpg3rXqA6fy5v
 6E61lcCBK7rpY+sGBelSPLqzA/hOhCGyETvL8TyMoBz72Kf/NkhYjMkNxXjPFEjPqOJu6jOV8QAGB
 Y7fSzg/lcJFsqb1sdZUcPe7hTKQj+U4xjG6LXOxjnR2EsImJf9Jq3TzuQsEyWbNtdwSXVJXCqLM6r
 bs/Hj/n3ghylqaSlRCy04LnLcc20rMRA8DBtL2qeP/R1ShOPhRglffBGrSME3dJEW/ydLzB/YBGFk
 jlrdYWAD7fBEG//Tkv3XwNW5WvJKTBlHw==;
Received: from [2a01:799:967:5000:f018:451c:38b1:f937] (port=40558)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1szXTt-008Zfu-5w;
 Sat, 12 Oct 2024 10:28:09 +0200
Message-ID: <64d6c7c5-8097-49ad-92dd-43eadab7a918@tronnes.org>
Date: Sat, 12 Oct 2024 10:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/tiny: panel-mipi-dbi: Include <linux/of.h>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
References: <20241011144632.90434-1-tzimmermann@suse.de>
 <20241011144632.90434-7-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20241011144632.90434-7-tzimmermann@suse.de>
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



On 11.10.2024 16:41, Thomas Zimmermann wrote:
> Include <linux/of.h> directly to get of_property_read_string_index().
> Avoids the proxy include via <linux/backlight.h>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

