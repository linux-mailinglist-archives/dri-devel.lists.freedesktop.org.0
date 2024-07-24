Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C2593AE40
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9D610E0D9;
	Wed, 24 Jul 2024 09:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="uJT4O6gX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D0110E65B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721811810;
 bh=OJBjcORicXMgqQr2wkkkceeE9D1kAAb+ffbZMaOnLWM=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=uJT4O6gXnTOqwHmu4Jry9ABRfunIvxna3bbUGScRjEb0t9oi7uhEosy5LAFToXQWY
 eqaEOHLjn1htc0ruypgaYAxFuK387ae16e9Gi6GNhtemgsZIEXB8aXUgNmfoo9b9mt
 so/QJTIMbnJjSSjPnOenvMrCQY6LGOrq8Ujdt/cPsYOGmuw1qQLS/wjeniRbhEmfdR
 xQZC2/g4sg3i/012up1L0FY+sT18Y1a7v9KNv98EJZHiwq9it6ydUO8uyRTR1vjzvE
 bwK9GAe/Kb/+ahIqygnBAud9PiC6UpHOFdPCQlXiLGQU9KrrNxpEls36nja/8xGjGo
 ZjK3jLgFZRhGw==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 21E533780BC2;
 Wed, 24 Jul 2024 09:03:27 +0000 (UTC)
Message-ID: <61c39125-9906-4b5e-8a83-8e0aa2c3ac0d@collabora.com>
Date: Wed, 24 Jul 2024 14:33:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for mediatek driver testing
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com, daniel@ffwll.ch, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
References: <0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com>
In-Reply-To: <0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com>
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

Hi Maintainers,

On 28/05/24 10:55, Vignesh Raman wrote:
> Hi Maintainers,
> 
> There are some flaky tests reported for mediatek driver testing in drm-ci.
> 
> # Board Name: mt8173-elm-hana
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> core_setmaster_vs_auth
> dumb_buffer@create-clear
> fbdev@unaligned-write
> fbdev@write
> kms_cursor_legacy@cursor-vs-flip-atomic-transitions
> kms_prop_blob@invalid-set-prop
> 
> Will add these tests in 
> drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt 
> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
> 
> Please could you have a look at these test results and let us know if 
> you need more information. Thank you.

There are some flaky tests reported for mediatek driver testing for the 
mt8183,

# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
# Failure Rate: 100
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_bw@linear-tiling-1-displays-2560x1440p
kms_cursor_legacy@cursor-vs-flip-atomic-transitions

Will add these tests in
drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if
you need more information. Thank you.

Regards,
Vignesh
