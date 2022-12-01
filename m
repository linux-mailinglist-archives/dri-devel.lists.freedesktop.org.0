Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A663EAFE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F43B10E144;
	Thu,  1 Dec 2022 08:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0A310E144
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:26:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93138B81E5D;
 Thu,  1 Dec 2022 08:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0E3C433C1;
 Thu,  1 Dec 2022 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1669883190;
 bh=dGT/GVf3mSAKxaqt9pZa5vRYe7VO1uBv54gKbJHA68A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UPWMGpyARNMhdBUuXg5y5vNdXnBbNjmf1kbDDbJWdj+k1Z2QK4mLlk8jrcR0pjNXh
 5CjZ2UrM3jzR2teQ3LdcFdX4nAKuBjBpxzh338ImpyXPJdESt3bjbsYjmKicmIFWOG
 DBUI/cx+M+X31vwEI5YySYogk+k/OkaV3h+6T8q0=
Date: Thu, 1 Dec 2022 06:55:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: noralf@tronnes.org
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
Message-ID: <Y4hB5odv9IGaq3Di@kroah.com>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 08:26:48PM +0100, Noralf Trønnes via B4 Submission Endpoint wrote:
> Hi,
> 
> I have started to look at igt for testing and want to use CRC tests. To
> implement support for this I need to move away from the simple kms
> helper.
> 
> When looking around for examples I came across Thomas' nice shadow
> helper and thought, yes this is perfect for drm/gud. So I'll switch to
> that before I move away from the simple kms helper.
> 
> The async framebuffer flushing code path now uses a shadow buffer and
> doesn't touch the framebuffer when it shouldn't. I have also taken the
> opportunity to inline the synchronous flush code path and make this the
> default flushing stategy.
> 
> Noralf.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> 
> ---
> Changes in v2:
> - Drop patch (Thomas):
>   drm/gem: shadow_fb_access: Prepare imported buffers for CPU access
> - Use src as variable name for iosys_map (Thomas)
> - Prepare imported buffer for CPU access in the driver (Thomas)
> - New patch: make sync flushing the default (Thomas)
> - Link to v1: https://lore.kernel.org/r/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
