Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62116AAC29
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 20:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5350410E2CE;
	Sat,  4 Mar 2023 19:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD2010E2C7;
 Sat,  4 Mar 2023 19:45:13 +0000 (UTC)
Received: from [192.168.2.210] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9EFB2660225B;
 Sat,  4 Mar 2023 19:45:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677959112;
 bh=oNy76EzJeGgxK1TeAyTVp1ut3oUXg+wGkT9fvttRTTE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=B0DMh0suit6szFIKFA28VMo7feyaARdf8lpnha4jTjEYf5AEGXvCKpWgQPosOBE5B
 w/py0e6i8ORVM4PiPDL3q6WsbaRdkOwSwDiWcwQIRmHx5n1cQyDdE8JNiuJc9ORE1T
 HENVeaxMeYpnaR5/4V39Kgs3fCkgJhxtK1DXYbw0DBJKDC5qzIH/CV/ToIqHbgNxw6
 R0EH/ksLvQYTEMu+YwqgsXly1uUmXFpUD5HoHc7NGhceA8RDjL+7BNNIgAciew2Nl7
 4hHzQgbcQP4wBtvqwms9FfCImJx2iP9u1K1q0+UQ33QhF1mjG9EXr45C8W3samKMUa
 DG3uzqT8JK//Q==
Message-ID: <5206f15f-f214-c908-c088-60231d50cae2@collabora.com>
Date: Sat, 4 Mar 2023 22:45:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/etnaviv: fix reference leak when mmaping imported
 buffer
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
References: <20230228165552.760988-1-l.stach@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230228165552.760988-1-l.stach@pengutronix.de>
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/28/23 19:55, Lucas Stach wrote:
> drm_gem_prime_mmap() takes a reference on the GEM object, but before that
> drm_gem_mmap_obj() already takes a reference, which will be leaked as only
> one reference is dropped when the mapping is closed. Drop the extra
> reference when dma_buf_mmap() succeeds.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Fixes tag missing

-- 
Best regards,
Dmitry

