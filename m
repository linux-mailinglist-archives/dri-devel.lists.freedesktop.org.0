Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06BA81BC7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 06:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55B610E7C3;
	Wed,  9 Apr 2025 04:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Z/Wzxxpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CEB10E7C3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 04:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KMy80c3f8tEJeFyo9se2EyPspzDN/qpz4L/88YxV2ng=; b=Z/WzxxpyINanl2EsfIlsyFuev5
 SIbAThSmAa9X21F0nhcUC1N0hxDY0QhCj2+G4w/ENuHe3y0HRsTp37pk7nGsa3bvnnkdzZLeOweVO
 +L+F1RQRGPvyFHqzdGgNm51jbAsSTGAxUxR+WqgrPx4K4vnv/V2XtpMYnPFO9L13C7iASIgkPQtyr
 1+7QzAnVi6cGgHWoQNliHWE/ED832NhzHZo7gqBhgOEWfIC2TqBO7yQAFl0FR+rGhm0Xj2JCd2fkk
 daIZu1ZL9ZsFt0qWyDLIeAZwJ47YHCSazcWsdJLQ4BuXgJWxerkOMhyKwQIcdLgMXeyo4M8aD6FEa
 V6xVQ/Zw==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u2MfV-00Dmp4-Tt; Wed, 09 Apr 2025 06:04:06 +0200
Message-ID: <1d7eac7c-e0ab-4208-b003-26b818478709@igalia.com>
Date: Wed, 9 Apr 2025 01:03:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm: Fix potential overflow issue in event_string array
To: jiangfeng@kylinos.cn
Cc: mripard@kernel.org, christian.koenig@amd.com, rodrigo.vivi@intel.com,
 dri-devel@lists.freedesktop.org, raag.jadav@intel.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, airlied@gmail.com
References: <20250409014633.31303-1-jiangfeng@kylinos.cn>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250409014633.31303-1-jiangfeng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Em 08/04/2025 22:46, jiangfeng@kylinos.cn escreveu:
> From: Feng Jiang <jiangfeng@kylinos.cn>
> 
> When calling scnprintf() to append recovery method to event_string,
> the second argument should be `sizeof(event_string) - len`, otherwise
> there is a potential overflow problem.
> 
> Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Reviewed-by: André Almeida <andrealmeid@igalia.com>
