Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B347FEDD7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 12:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3813410E0E2;
	Thu, 30 Nov 2023 11:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 951AC10E0E2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 11:29:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 853301042;
 Thu, 30 Nov 2023 03:29:51 -0800 (PST)
Received: from [10.1.34.23] (e122027.cambridge.arm.com [10.1.34.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91CB93F6C4;
 Thu, 30 Nov 2023 03:29:02 -0800 (PST)
Message-ID: <871c4b6d-fb37-41ae-9dcf-b98345e70c77@arm.com>
Date: Thu, 30 Nov 2023 11:29:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Panfrost devfreq and GEM status fixes
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20231125205438.375407-1-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231125205438.375407-1-adrian.larumbe@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2023 20:52, Adrián Larumbe wrote:
> During recent development of the Mali CSF GPU Panthor driver, a user
> noticed that GPU frequency values as reported by fdinfo were
> incorrect. This was traced back to incorrect handling of frequency value
> updates. The same problem was seen in Panfrost.
> 
> Also one should consider GEM objects from a dma-buf import as being
> resident in system memory, so that this can be reflected on fdinfo.
> 
> Adrián Larumbe (2):
>   drm/panfrost: Consider dma-buf imported objects as resident
>   drm/panfrost: Fix incorrect updating of current device frequency
> 
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 17 +++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c     |  2 +-
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 38f922a563aac3148ac73e73689805917f034cb5

Pushed to drm-misc-fixes

Thanks,

Steve
