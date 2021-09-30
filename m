Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4D41DDC5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 17:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF3D6E430;
	Thu, 30 Sep 2021 15:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F016E430
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 15:40:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC22B617E6;
 Thu, 30 Sep 2021 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633016440;
 bh=tBrFpWHv+RFng1Nnh9PCJomQIzoau7SxgaKh8lwDiek=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=XaWPFpb+jLfQfp4BpqZJ5BjSjnCG9EpqXYIWNNgj0ezi/9xstwibJfhEUDv78I87/
 uN5yh+CQaDyHzQ/uJzCU+4YRUzSf3p8P6PxITybsSF3sCQT05tCOwazzdpbZ53e1LU
 i28ZMPriWuBQ5WpHMhB+x96iR4d5sKjxPuzGEfKrOWiCCTNX+lA5IV7Ue2JnoQY1c9
 wkj47ngrVWQ0dhPKmQPWlhKCjDTFJ1JsnB7A/l98X5kCnSk4ZM1CllQe0RscM6iPsK
 BJgcm9gFfx+oaXRUJJZdb1vEhhw5YeUD160k1h7odQV0kByuu0eB2CseqAyd0rcsGF
 EJdzxRMbbpgWg==
Message-ID: <464685469b9e96a23a3cf180c82d0b7134ca36bd.camel@kernel.org>
Subject: Re: [PATCH] drm/vc4: crtc: Make sure the HDMI controller is powered
 when disabling
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  Daniel Vetter <daniel.vetter@intel.com>, David
 Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, 
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 30 Sep 2021 17:40:36 +0200
In-Reply-To: <20210923185013.826679-1-maxime@cerno.tech>
References: <20210923185013.826679-1-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
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

On Thu, 2021-09-23 at 20:50 +0200, Maxime Ripard wrote:
> Since commit 875a4d536842 ("drm/vc4: drv: Disable the CRTC at boot
> time"), during the initial setup of the driver we call into the VC4 HDMI
> controller hooks to make sure the controller is properly disabled.
> 
> However, we were never making sure that the device was properly powered
> while doing so. This never resulted in any (reported) issue in practice,
> but since the introduction of commit 4209f03fcb8e ("drm/vc4: hdmi: Warn
> if we access the controller while disabled") we get a loud complaint
> when we do that kind of access.
> 
> Let's make sure we have the HDMI controller properly powered while
> disabling it.
> 
> Fixes: 875a4d536842 ("drm/vc4: drv: Disable the CRTC at boot time")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Tested-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

