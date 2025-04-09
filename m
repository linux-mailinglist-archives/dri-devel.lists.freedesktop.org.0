Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2FA82E95
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 20:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0597610E71E;
	Wed,  9 Apr 2025 18:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oWcRTEMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B05510E71E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 18:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Be095vzPhvPLdfLrTZ/oiCbSUE2aRlT1cmy2Deak7g=; b=oWcRTEMOUXJebl93WOFm9Y/hrr
 tdIHWIEvgq4wK4Vft8IEJszgM7JZZoTO90ZsnykeUoAMh0oWEI4FM0PkPrLodByW9JWvnE1MAfCnX
 bR3pC42qwnf6syUNs9qhCcko6wmkKNEMKN7J6d6OUhbWsBouYZZppqrI5WK2E1FoAUg6tywDebcII
 7zP1Lc4yRZ9t+Km1qfEC3ASfgtO5/AC0ni7f8zNXu6rv4GjdAv2oupCxrHoT+oOx0/XZda6oyHVsh
 bcjPZK0h/dRHaDQ7Tqs0kariN/08I0asQlwrnDQ+UXFFCo9Yck7jYf9QnWqCKL7+nEFgixHYTomaz
 px4K34Ww==;
Received: from [177.134.103.112] (helo=[192.168.68.130])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u2a5e-00EGFA-49; Wed, 09 Apr 2025 20:23:58 +0200
Message-ID: <ef5b7030-c38a-44b9-b0bd-28ea6adb17c2@igalia.com>
Date: Wed, 9 Apr 2025 15:23:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/ci: Add devicetree validation and KUnit tests
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20250409061543.311184-1-vignesh.raman@collabora.com>
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

Hi Vignesh,

Thank you for your patch.

On 09/04/2025 03:15, Vignesh Raman wrote:
> Add jobs to validate devicetrees and run KUnit tests.
> 
> Pipeline link,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1400550

I see the checks are in the same stage as build, does it make sense to 
create another stage? Similar to what was proposed on kci-gitlab?

Also, I don't think it make sense for kunit to be in the build stage. 
Maybe in software-driver? Since kunit runs on a qemu.

Helen

> 
> Link to v1,
> https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/
> 
> Vignesh Raman (2):
>    drm/ci: Add jobs to validate devicetrees
>    drm/ci: Add jobs to run KUnit tests
> 
>   drivers/gpu/drm/ci/check-devicetrees.yml | 43 ++++++++++++++++++++++++
>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 +++++++++++
>   drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>   drivers/gpu/drm/ci/kunit.yml             | 32 ++++++++++++++++++
>   6 files changed, 123 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
> 

