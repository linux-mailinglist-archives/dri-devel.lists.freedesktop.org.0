Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E759E315D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 03:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F5F10E0AA;
	Wed,  4 Dec 2024 02:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="A0gvFFur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABC510E0AA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 02:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733278994;
 bh=hVPWjxDf3J62Z7wnIqQWbdoImqDsRWqpTgW/qaZa0BY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A0gvFFurp2Dn6uAuJi/e5zdcYYEKkJJtQlu4JFEHpWCPvSr5lsqsuH2ju7XfY2iTU
 K+RA40TbSdIXfFTIBaaR55eHenhPEU9YMBzkWuHoEYSU82f6JQyXHIW/48oku0zhXo
 BSgPE+MSGBzmokhsalyTQXp/K8C888UWi0J4+D3LFv1hOlMQC3lxZnDYaCd5ZHMmO/
 +wganKwSZNmPAkNP7MTX6ttSkPzCNTx8+RKtCUdnIc6NRcdr0Rxd+tBbVBxhdNZmnI
 V8hJfQ0+4a1zoVZB67UlJ9zsUWBCErDBmWM7UvxyiAcNNmZ2P/f7T5FZ9Tij93Eaxz
 lnAg1wwCv2PcA==
Received: from [192.168.50.250] (unknown [171.76.86.133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 916CC17E0F8A;
 Wed,  4 Dec 2024 03:23:11 +0100 (CET)
Message-ID: <a9a956b7-55da-4b90-bf82-92def097a63a@collabora.com>
Date: Wed, 4 Dec 2024 07:53:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] drm/ci: uprev mesa and modify gitlab rules
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 daniels <daniels@collabora.com>, airlied <airlied@gmail.com>,
 daniel <daniel@ffwll.ch>, robdclark <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "jani.nikula" <jani.nikula@linux.intel.com>,
 "dmitry.baryshkov" <dmitry.baryshkov@linaro.org>,
 mripard <mripard@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
References: <20241128042025.611659-1-vignesh.raman@collabora.com>
 <1938cdd3a4b.10ab98f77527721.7719837795987945098@collabora.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <1938cdd3a4b.10ab98f77527721.7719837795987945098@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helen,

On 03/12/24 19:42, Helen Mae Koike Fornazier wrote:
> Hi Vignesh,
> 
> Thanks for your patchset.
> 
> 
> 
> ---- On Thu, 28 Nov 2024 01:20:19 -0300 Vignesh Raman  wrote ---
> 
>   > Uprev mesa to adapt to the latest changes in mesa-ci,
>   > including new container jobs and stages. Update the
>   > lava-submit script to align with recent mesa-ci changes
>   > for using LAVA rootfs overlays. Modify gitLab rules
>   > to include scheduled pipelines.
>   >
>   > Pipeline link,
>   > https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1318024
> 
> I see this pipeline has a few failures, most of them are because outdated xfails files and timeouts.
> Could we fix that first? So when we test this patchset we can verify if it introduces any issues or not.

Yes. The expectation files are not updated. I will uprev IGT and rerun 
the tests and update xfails.

Regards,
Vignesh

> 
> Thanks
> Helen
> 
>   >
>   > Vignesh Raman (2):
>   >  drm/ci: uprev mesa
>   >  drm/ci: update gitlab rules
>   >
>   >  drivers/gpu/drm/ci/build.sh       |   2 +-
>   >  drivers/gpu/drm/ci/build.yml      | 104 ++++++++++++++++-
>   >  drivers/gpu/drm/ci/container.yml  |  22 ++--
>   >  drivers/gpu/drm/ci/gitlab-ci.yml  | 185 ++++++++++++++++--------------
>   >  drivers/gpu/drm/ci/image-tags.yml |  11 +-
>   >  drivers/gpu/drm/ci/lava-submit.sh |  99 +++++++++++-----
>   >  drivers/gpu/drm/ci/test.yml       |  33 +++---
>   >  7 files changed, 314 insertions(+), 142 deletions(-)
>   >
>   > --
>   > 2.43.0
>   >
>   >
> 
