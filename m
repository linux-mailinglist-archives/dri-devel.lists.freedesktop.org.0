Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CC46A35B4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 00:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB5D10E161;
	Sun, 26 Feb 2023 23:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4266C10E161
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 23:51:38 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9EBC06602DCD;
 Sun, 26 Feb 2023 23:51:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677455497;
 bh=j42W91BDA/HzPgVKrySGK5CNdsmZZvukLN7V+IbXt3c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Pgopsf0TFxrJjOQ+I+Dl166lURpTZha1/EBXUIt8mnCUcOL1kvRaxCHiyzMariZDs
 AZ+/20pmGsNRzu6wWpdS3Pnm5DMf2FdVafWleLGAWUjGCj47Y1GnK0q38VavwWAsvm
 c9aGkOP4MtFzojEH4VtoQWzN7sTZI3JY9Jf3BL6/9Lg/DNO314ffYJsi1iA9iEx9Jq
 nK9oh+ctmVPqAJWeesdaMJOuUVtEiMHbEDEtixVq1Tlue0i1eNY8xG+DaTFATG/L3E
 2kzvaTb7UoAF0ZPO0XfdM1GVNvedI0QHpA2lQQotnI1mGQLc0McepyLl8Bz5PiYZg+
 j2yful4OGUDVQ==
Message-ID: <74ae7a91-1dd3-06f1-2199-5c1a18ab7d50@collabora.com>
Date: Mon, 27 Feb 2023 02:51:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] drm/shmem-helper: Remove another errant put in error
 path
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230108211311.3950107-1-dmitry.osipenko@collabora.com>
 <CAF6AEGtU_Af=2TJiZytTx3GHryFiefJNkmKzwk569RcJKD+9BA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGtU_Af=2TJiZytTx3GHryFiefJNkmKzwk569RcJKD+9BA@mail.gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/16/23 18:35, Rob Clark wrote:
> On Sun, Jan 8, 2023 at 1:13 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> drm_gem_shmem_mmap() doesn't own reference in error code path, resulting
>> in the dma-buf shmem GEM object getting prematurely freed leading to a
>> later use-after-free.
>>
>> Fixes: f49a51bfdc8e ("drm/shme-helpers: Fix dma_buf_mmap forwarding bug")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Applied to misc-fixes

-- 
Best regards,
Dmitry

