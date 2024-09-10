Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C59727C0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 06:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0795210E6EA;
	Tue, 10 Sep 2024 04:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="TIqCd6Z9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8138E10E6EA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 04:00:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1725940809; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fOLWoiqRpJJzDPuCEgm+pcjdBnvLeZCYRpz9mx49sY7EKvQieaHe7evU/AxfCl46Eyx+YSqR8BDuXPWko9xeeybdKHx2N17EUIC75OQvxbR8IJHkPp02gdVend73vJhURpWZY9E97uo5e187D3dlhgsHFcHSFUQprMkal/Oxw+Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725940809;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6Tc/mF2U2wzvf3mrYJCr0yMdRenMZYLzl0u+t98aPv8=; 
 b=Ucfvrw77y8T7j8PLscpLldfpSQMDL49UdKhuWZtXaRTR+T7T7W1A9OYRNj0CKkZ/PQZYW3aoqvHzcGJI0122vDjKtIdq6nUrz5DXRC/V606OTLVJyk4KOi9UqatDu6UriH1THZ3ik1YSF9LAqrj+lDBkQpvlEfuhMZIKZX2kEoQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
 dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725940809; 
 s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=6Tc/mF2U2wzvf3mrYJCr0yMdRenMZYLzl0u+t98aPv8=;
 b=TIqCd6Z9Cr0IjSYbrIUaKb49af0hUHGUlBXWiUbbOnvENcSzwHVkgUrzqzpfsU0e
 imf16ANSPWBZ0SAqxOAP0Fzf5+XQzGmpVA5FofFzWPzedtmSFs106Giw/ulQf7Vfgdt
 f9k6jpbv+r7xog2cw4cQT0et9P/t8S9djAA+H3A4=
Received: by mx.zohomail.com with SMTPS id 1725940808393866.7829529888131;
 Mon, 9 Sep 2024 21:00:08 -0700 (PDT)
Message-ID: <7505ac00-29ef-4ad9-8904-94b4c024c02b@collabora.com>
Date: Tue, 10 Sep 2024 09:30:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for rockchip driver testing
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-rockchip@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Deborah Brouwer <deborah.brouwer@collabora.com>
References: <3e267d0c-fde4-4533-b001-6ab7d7c03546@collabora.com>
Content-Language: en-US
In-Reply-To: <3e267d0c-fde4-4533-b001-6ab7d7c03546@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 24/07/24 14:22, Vignesh Raman wrote:
> Hi Maintainers,
> 
> There are some flaky tests reported for rockchip driver testing
> in drm-ci.
> 
> === rockchip rk3288 ===
> # Board Name: rk3288-veyron-jaq
> # Failure Rate: 100
> # IGT Version: 1.28-gf13702b8e
> # Linux Version: 6.10.0-rc5
> kms_cursor_legacy@flip-vs-cursor-atomic
> 
> === rockchip rk3399 ===
> # Board Name: rk3399-gru-kevin
> # Failure Rate: 50
> # IGT Version: 1.28-gf13702b8e
> # Linux Version: 6.10.0-rc5
> kms_bw@linear-tiling-1-displays-2560x1440p
> kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic
> kms_flip@dpms-vs-vblank-race-interruptible
> kms_flip@flip-vs-absolute-wf_vblank-interruptible
> kms_flip@flip-vs-wf_vblank-interruptible
> kms_setmode@basic
> kms_bw@connected-linear-tiling-1-displays-2560x1440p
> 
> Will add these tests in 
> drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt and 
> drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt 
> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
> 
> Please could you have a look at these test results and let us know if 
> you need more information. Thank you.

There are some flaky tests reported for rockchip driver testing
in drm-ci.

=== rockchip rk3288 ===
# Board Name: rk3288-veyron-jaq
# Failure Rate: 100
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc2
kms_cursor_crc@cursor-offscreen-32x10
kms_cursor_edge_walk@64x64-left-edge
kms_flip@plain-flip-ts-check
kms_cursor_crc@cursor-alpha-opaque

=== rockchip rk3399 ===
# Board Name: rk3399-gru-kevin
# Failure Rate: 50
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc2
kms_flip@wf_vblank-ts-check

# Board Name: rk3399-gru-kevin
# Failure Rate: 100
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc5
kms_flip@dpms-vs-vblank-race
kms_bw@linear-tiling-2-displays-2160x1440p
kms_flip@flip-vs-expired-vblank


Will add these tests in 
drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt and 
drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
