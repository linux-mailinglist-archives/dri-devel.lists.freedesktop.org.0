Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ACBA99826
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 20:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6620910E225;
	Wed, 23 Apr 2025 18:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SeuaYYDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9610810E225
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=me2zQfOMtr0IzB1wW01DnjY95ZOpk1z1IE3Ehm7bRR0=; b=SeuaYYDiGwXZpLo0gpuCrg3Al1
 QDusqd/lb/ZJj2TKNhc02gQOOEKXzIfrL8qG6u58UgfZfvLvNKRuHmxAQbSs31prEP4QKPiAjBr6K
 fLZMubS8jkoF4mikZnfi0uWGPvEhqvvTxWmgnOBHohskQqZJwHInUZfGVvDAErJ9UxUDJP2/C9Xoc
 RfricAD7Lb+KIAmYnrW8Co3WxRqPeJGogrgsouLicAjk2f0cqS+k85GDY5/LE/DkTG+IEchdyqlCw
 NR7hsNLHIkZaux8ac+GTGMF+oBvtJknSsRJuLqVummAXmdk0jEH1K4L34bgCrYBLR7zp71M8H5dqz
 B57UOBwQ==;
Received: from [177.98.23.232] (helo=[192.168.68.130])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u7fBe-007320-4F; Wed, 23 Apr 2025 20:51:10 +0200
Message-ID: <b7795d63-ca8c-4746-84aa-49793d1b6852@igalia.com>
Date: Wed, 23 Apr 2025 15:51:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm/ci: Add devicetree validation and KUnit tests
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250417030439.737924-1-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20250417030439.737924-1-vignesh.raman@collabora.com>
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

Thanks for this version, please see my comments below.

On 17/04/2025 00:04, Vignesh Raman wrote:
> Add jobs to validate devicetrees and run KUnit tests.
> 
> Pipeline link,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1407489

I see this message:

WARNING: Running pip as the 'root' user can result in broken permissions 
and conflicting behaviour with the system package manager. It is 
recommended to use a virtual environment instead: 
https://pip.pypa.io/warnings/venv


It would be nice to fix this at some point.

With or without this, for the entire series:

Acked-by: Helen Koike <helen.fornazier@gmail.com>

Thanks
Helen

> 
> Link to v1,
> https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/
> 
> Link to v2,
> https://lore.kernel.org/all/20250409061543.311184-1-vignesh.raman@collabora.com/
> 
> Vignesh Raman (2):
>    drm/ci: Add jobs to validate devicetrees
>    drm/ci: Add jobs to run KUnit tests
> 
>   drivers/gpu/drm/ci/check-devicetrees.yml | 44 ++++++++++++++++++++++++
>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 ++++++++++
>   drivers/gpu/drm/ci/gitlab-ci.yml         |  4 +++
>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>   drivers/gpu/drm/ci/kunit.yml             | 33 ++++++++++++++++++
>   6 files changed, 127 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
> 

