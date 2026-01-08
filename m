Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A86D03FE2
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 16:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D0C10E78D;
	Thu,  8 Jan 2026 15:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Eg1BStXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7FC10E78D;
 Thu,  8 Jan 2026 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767887191;
 bh=cp2ct3+OOQ7yv51DocsUkBhukuWC78A6FxPrzXMk3+o=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Eg1BStXImtL2AFBPaYKzNqY0haOWIi+u3HGmSK3mmm4/2le1vcHjnpI7V93eE0skV
 MTLQ5sy5H75LQ08TI+7aRRPk82n1BimgFDIDDaP1qvrNzXivZXXaL0fxbCL/fC8v0a
 dqeh3TqYjqcYLZw5vl06KJT7svQvs7C1QsSEzaIGJcM3s/UIVum3AoBMkQk/mN5aWs
 2VbZ7Ch0DlTh0qzfQ/A4xfu4/yrL2GKXyFb19pxk894hgPMh9mhyj1PzP72ZVuLduq
 qZk9d0BkWNB2rn2y4B/hblKpxwBgl1LKjoFDEbVY02lL8AH+NILIgeeD11MuJqv9jQ
 EZtQFeGeBOldQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B5E817E0251;
 Thu,  8 Jan 2026 16:46:31 +0100 (CET)
Message-ID: <1abc87e2-3b2d-47e7-a965-9b174a324e44@collabora.com>
Date: Thu, 8 Jan 2026 17:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: Fix kernel-doc comments for some LUT
 properties
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251111-amdgpu-fix-kdoc-lut-v2-1-bcfcc82e962d@collabora.com>
Content-Language: en-US
In-Reply-To: <20251111-amdgpu-fix-kdoc-lut-v2-1-bcfcc82e962d@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/25 10:52 AM, Cristian Ciocaltea wrote:
> The following members of struct amdgpu_mode_info do not have valid
> references in the related kernel-doc sections:
> 
>  - plane_shaper_lut_property
>  - plane_shaper_lut_size_property,
>  - plane_lut3d_size_property
> 
> Correct all affected comment blocks.
> 
> Fixes: f545d82479b4 ("drm/amd/display: add plane shaper LUT and TF driver-specific properties")
> Fixes: 671994e3bf33 ("drm/amd/display: add plane 3D LUT driver-specific properties")
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

This seems to have slipped through the cracks.  Can we get it applied, please?

Thanks,
Cristian
