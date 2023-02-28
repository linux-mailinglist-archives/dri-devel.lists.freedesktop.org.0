Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301B6A5BE6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E3C10E4DF;
	Tue, 28 Feb 2023 15:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15B810E4D9;
 Tue, 28 Feb 2023 15:28:19 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F33E7660217A;
 Tue, 28 Feb 2023 15:28:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677598098;
 bh=ZcQtHQ8M1pG4xQmzUXs4WmURPGqO/fS5L8Oyw9xYqmA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VhT1hHGwlt9EPVzmEOHVZnxHEhVLTYm4WPp3g5kdoF+lV2VawEdbxUMCzyY4ZTPcX
 l0wHCf2U0EO6uCCcvFVExG6r//eesP5sNaktaEQNnoxpa1bWF1Dq/0uNne0Q7FMjzj
 bMPqYai7mnTqmD1/dd4nQjVMTr9BUjy0RDCC8xLoz021r0YiqzxyEFF9qf8V0ohwWb
 6vi1VfRiHXZxS+STkWx8FFOGaFFJ2u3Eqls9OLxwnvcsS2GmDVBYD+5y1IonGTUwV1
 WVSyq9ZP2O7aZfhjF7wSG+eKLnpaRQIUgDf53GsypG5QGXDGewTjW5pGD+TYmDbUYh
 cf4Xh4wb1MQhw==
Message-ID: <d48476f0-3c00-047d-c3cc-511b95fede5d@collabora.com>
Date: Tue, 28 Feb 2023 18:28:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Revert "drm/shmem-helper: Switch to reservation lock"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@intel.com
References: <20230228152612.19971-1-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230228152612.19971-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/28/23 18:26, Thomas Zimmermann wrote:
> This reverts commit 67b7836d4458790f1261e31fe0ce3250989784f0.
> 
> The locking appears incomplete. A caller of SHMEM helper's pin
> function never acquires the dma-buf reservation lock. So we get
> 
>   WARNING: CPU: 3 PID: 967 at drivers/gpu/drm/drm_gem_shmem_helper.c:243 drm_gem_shmem_pin+0x42/0x90 [drm_shmem_helper]
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Thanks Thomas,

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

