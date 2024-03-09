Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D58770E1
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 12:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9A910E3AC;
	Sat,  9 Mar 2024 11:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mqw/Fo2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202B210E3AC
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 11:58:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2D521BF203;
 Sat,  9 Mar 2024 11:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709985518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeJuGxy7IMp2CtzAyuorWvkKuxtOwV9FaaLvZ5RlJaQ=;
 b=mqw/Fo2gmyLahOaZ3SozUt8O5PlHBXFjoVVfpAARskZd/VWkFBe4x+XmkaLjfJYgHyXWrL
 /IXkANV6aKoqD0HHaJA9DSGsTsoE0OamW+mmiT4kc6g/Afnfh348G1ycgjQja9dm4pfA7f
 ixZ3MD+NmdISNQxEiaPAID+mXiW+4MQkgIUMoos9uO0RwqvsxtHs81d8/lf1/8M+t8bAEh
 fEC+XFitRxfneaISR+sjsYfXTc02xIsVxSdNAWQCXwXjIolap2zGCJP/XWCPoXk9upY4GJ
 2G5mQ17W2cakOZx9SSWbcnN2/ZYmizLN6hQTR+yTZW9VDB/zz+k0q3KswJNVjA==
Date: Sat, 9 Mar 2024 12:58:33 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH 0/7] Additions to "Reimplement line-per-line pixel
 conversion for plane reading" series
Message-ID: <ZexO6SOeQFnYMl_G@localhost.localdomain>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
 <4b01ba61-9184-4a17-9fe6-59eb88a21214@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b01ba61-9184-4a17-9fe6-59eb88a21214@igalia.com>
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

Le 08/03/24 - 17:38, Maíra Canal a écrit :
> Hi Arthur,

Hi Maíra,

> Would it be possible for you to coordinate with Louis and create a
> single series with all the modification?

This is already the case, [1] contains all our work. But as there were a 
lot of things to change in the YUV part, it was easier for Arthur to send 
a "real" series over [1]. I've already merged everything, and it'll all be 
in v5 (probably Monday or Tuesday).

Kind regards,
Louis Chauvet

> I don't see a reason to submit fixes to a series that it is still
> on review.
>
> Best Regards,
> - Maíra
> 
> On 3/6/24 17:03, Arthur Grillo wrote:
> > These are some patches that add some fixes/features to the series by
> > Louis Chauvet[1], it was based on top of the patches from v4.
> > 
> > Patches #2 and #3 should be amended to "[PATCH v4 11/14] drm/vkms: Add
> > YUV support". To make patch #3 work, we need patch #1. So, please, add
> > it before the patch that #2 and #3 amend to.
> > 
> > Patches #4 to #6 should be amended to "[PATCH v4 14/14] drm/vkms: Create
> > KUnit tests for YUV conversions". While doing the additions, I found
> > some compilation issues, so I fixed them (patch #4). That's when I
> > thought that it would be good to add some documentation on how to run
> > them (patch #7), this patch should be added to the series as new patch.
> > 
> > [1]: https://lore.kernel.org/r/20240304-yuv-v4-0-76beac8e9793@bootlin.com
> > 
> > To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > To: Melissa Wen <melissa.srw@gmail.com>
> > To: Maíra Canal <mairacanal@riseup.net>
> > To: Haneen Mohammed <hamohammed.sa@gmail.com>
> > To: Daniel Vetter <daniel@ffwll.ch>
> > To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > To: Maxime Ripard <mripard@kernel.org>
> > To: Thomas Zimmermann <tzimmermann@suse.de>
> > To: David Airlie <airlied@gmail.com>
> > To: arthurgrillo@riseup.net
> > To: Jonathan Corbet <corbet@lwn.net>
> > To: pekka.paalanen@haloniitty.fi
> > To: Louis Chauvet <louis.chauvet@bootlin.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: jeremie.dautheribes@bootlin.com
> > Cc: miquel.raynal@bootlin.com
> > Cc: thomas.petazzoni@bootlin.com
> > Cc: seanpaul@google.com
> > Cc: marcheu@google.com
> > Cc: nicolejadeyee@google.com
> > 
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > ---
> > Arthur Grillo (7):
> >        drm: Fix drm_fixp2int_round() making it add 0.5
> >        drm/vkms: Add comments
> >        drm/vkmm: Use drm_fixed api
> >        drm/vkms: Fix compilation issues
> >        drm/vkms: Add comments to format tests
> >        drm/vkms: Change the gray RGB representation
> >        drm/vkms: Add how to run the Kunit tests
> > 
> >   Documentation/gpu/vkms.rst                    |  11 +++
> >   drivers/gpu/drm/vkms/tests/vkms_format_test.c |  81 +++++++++++++++++++--
> >   drivers/gpu/drm/vkms/vkms_drv.h               |   4 +
> >   drivers/gpu/drm/vkms/vkms_formats.c           | 101 +++++++++++++++++++-------
> >   include/drm/drm_fixed.h                       |   2 +-
> >   5 files changed, 165 insertions(+), 34 deletions(-)
> > ---
> > base-commit: 9658aba38ae9f3f3068506c9c8e93e85b500fcb4
> > change-id: 20240306-louis-vkms-conv-61362ff12ab8
> > 
> > Best regards,

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
