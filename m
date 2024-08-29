Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5265964B67
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 18:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA6510E731;
	Thu, 29 Aug 2024 16:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mg67JLS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3855D10E727;
 Thu, 29 Aug 2024 16:19:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CFCD3CE1C05;
 Thu, 29 Aug 2024 16:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5047EC4CEC1;
 Thu, 29 Aug 2024 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1724948344;
 bh=IzY8cnr3y3J+5JXmGEIO7/jD3TY5go9gwhXmQCYhAF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mg67JLS1FEbXy+FK/Ntlfj0GLuXwKrtvTY+zUkwba4Vx2/HnmBZv20OAUHLNd4AJd
 sCZT54c7gZayu7tztKidd2GYk376TWHQC/nQeQck2CBqaKQIrksM2JUxIGskcNNipr
 Gj5FjUR5TW4blw9KPDm53WttRy5nVsQge7ZIfekQ=
Date: Thu, 29 Aug 2024 18:19:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vamsi Krishna Brahmajosyula <vamsi-krishna.brahmajosyula@broadcom.com>
Cc: stable@vger.kernel.org, jesse.zhang@amd.com, alexander.deucher@amd.com,
 sashal@kernel.org, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 vasavi.sirnapalli@broadcom.com
Subject: Re: [PATCH v4.19-v6.1] drm/amdgpu: Using uninitialized value *size
 when calling
Message-ID: <2024082955-luxury-agreed-36e6@gregkh>
References: <20240828151607.448360-2-vamsi-krishna.brahmajosyula@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240828151607.448360-2-vamsi-krishna.brahmajosyula@broadcom.com>
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

On Wed, Aug 28, 2024 at 10:15:56AM -0500, Vamsi Krishna Brahmajosyula wrote:
> From: Jesse Zhang <jesse.zhang@amd.com>
> 
> [ Upstream commit 88a9a467c548d0b3c7761b4fd54a68e70f9c0944 ]
> 
> Initialize the size before calling amdgpu_vce_cs_reloc, such as case 0x03000001.
> V2: To really improve the handling we would actually
>    need to have a separate value of 0xffffffff.(Christian)
> 
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Signed-off-by: Vamsi Krishna Brahmajosyula <vamsi-krishna.brahmajosyula@broadcom.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Now queued up, thanks.

greg k-h
