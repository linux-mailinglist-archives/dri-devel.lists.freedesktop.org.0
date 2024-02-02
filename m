Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16503846A54
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 09:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BE310E19C;
	Fri,  2 Feb 2024 08:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nbkCFvYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A644810E19C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 08:15:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10238C000C;
 Fri,  2 Feb 2024 08:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706861711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IELpse5tL7jxLQ50n/erAXQJmF3PhIHOp+iVjw6RjuA=;
 b=nbkCFvYx/0abOwR4f/l/xf/UAj+v47faf2e5yKK6aMe6eNo8sAKnNA6wOuL1e+J68SjOHx
 VT3eAHbcH7rG34TCFkZfpeizDKFXzU9k5T3PoWaltYntFjU0gTVTgNGpxmln5Gy+sMlRf/
 3Xg9uBkPZkmftuenYCmNSyiDB6ajEXIPGhYb8CpQugEU4klP6io8HmlJfLR0cNB03ZrRKL
 IpNIrDSEQw6DihD0PesQ9VBWI0r6w77qUybXlSWYp9FrCjj/1+zPH9zi0V6CmZF1hVDsw4
 QYX6paApyTwAwt1W1e325ML5/geNrxOqzVrjTsDPfADU1KVrmwYId3E9V0WLrg==
Date: Fri, 2 Feb 2024 09:15:07 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maira Canal <mcanal@igalia.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, marcheu@google.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com
Subject: Re: [PATCH 0/2] Better support for complex pixel formats
Message-ID: <Zbyki1szIFvotn71@localhost.localdomain>
Mail-Followup-To: Maira Canal <mcanal@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, marcheu@google.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <d7959499-c0cf-4454-b9f9-8436d8818095@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7959499-c0cf-4454-b9f9-8436d8818095@igalia.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 01/02/24 - 19:07, Maira Canal a écrit :
> Hi Louis,
> 
> Thanks for your patches! Could you please rebase them on top of
> drm-misc-next? It would make it easier for me to review and test the
> patches.
> 
> Best Regards,
> - Maíra

Hi Maíra,

Do you want me to rebase the whole YUV [1] series or should I extract and 
make my two patches independent?

[1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net/

Best regards,
Louis Chauvet
 
> On 2/1/24 14:31, Louis Chauvet wrote:
> > This patchset aims to solve issues I found in [1], and at the same time
> > simplify the composition algorithm.
> > 
> > I sent more igt-gpu-tools test [2] to cover more things and detect the
> > issues in [1].
> > 
> > This patchset is based on [1].
> > 
> > Patch 1/2: This patch is a no-op, but make the code more readable
> > regarding the pixel_read functions.
> > 
> > Patch 2/2: This patch is more complex. My main target was to solve issues
> > I found in [1], but as it was very complex to do it "in place", I choose
> > to rework the composition function.
> > The main two advantages are:
> > - It's now possible to create conversion function for packed & grouped
> > pixels. Some pixel formats need absolute x/y position and not only an
> > offset in the buffer to extract the correct value. This part also solve
> > the issues I found in [1].
> > - The rotation management is now way easier to understand, there is no
> > more switch case in different places and instead of copy/pasting rotation
> > formula I used drm_rect_* helpers.
> > 
> > [1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net/
> > [2]: https://lore.kernel.org/igt-dev/20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com/T/#t
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> > Louis Chauvet (2):
> >        drm/vkms: Create a type to check a function pointer validity
> >        drm/vkms: Use a simpler composition function
> > 
> >   drivers/gpu/drm/vkms/vkms_composer.c |  97 ++++++++-----
> >   drivers/gpu/drm/vkms/vkms_drv.h      |  32 ++++-
> >   drivers/gpu/drm/vkms/vkms_formats.c  | 254 ++++++++++++++++++-----------------
> >   drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
> >   drivers/gpu/drm/vkms/vkms_plane.c    |  13 +-
> >   5 files changed, 236 insertions(+), 162 deletions(-)
> > ---
> > base-commit: 5d189d57bb335a87ec38ea26fe43a5f3ed31ced7
> > change-id: 20240201-yuv-1337d90d9576
> > 
> > Best regards,
