Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D0CCD11E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB76910EA64;
	Thu, 18 Dec 2025 18:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qaXzUB/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B643B10EA64
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:00:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A59821A22D5;
 Thu, 18 Dec 2025 18:00:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7471C60715;
 Thu, 18 Dec 2025 18:00:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D9ADC102F0B52; Thu, 18 Dec 2025 19:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766080850; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NiVoi+M8qO/I/Ju9YOlhfK4FUtabWy/e5OhxAn7IcBk=;
 b=qaXzUB/CqkZ8vwDkHMM3y4NfStLMgvR8/Shng1MSlidZn1D1HgO+Gw0lNHrFRruwL9x7p9
 7U0SLaWibDoMRQ3wtgCr+34WqIensWQPrgx+GV991FP8oUn/jpJSr/tdfMebehZj/ngp9D
 8bgCLOelY++7B6sTc2865WvIOzQYuOsvbVKH0Ewfcbe2SG2REZbmp6P1tgm8FhjunZP3yk
 3Lpj1kXCF1yPqweqjAvYyMxxR5qrS1NvfUDfVwMqwIgupxGH/L1NQLIljNB/4T0oK3mNEl
 hUda+z6j7+Tb9VaFaoJR1F3IdjOyHNJ8dVHqx2/eueUTX6hSb9RudmqNvpuGxA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 19:00:48 +0100
Message-Id: <DF1JETBGEUFA.EK2SDN9BJMB6@bootlin.com>
Subject: Re: [PATCH RESEND v2 15/32] drm/vkms: Introduce configfs for plane
 color range
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-15-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-15-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> To allows the userspace to test many hardware configuration, introduce a
> new interface to configure the available color ranges per planes. VKMS
> supports multiple color ranges, so the userspace can choose any
> combination.
>
> The supported color ranges are configured by writing a color range bitmas=
k
> to the file `supported_color_ranges` and the default color range is
> chosen by writing a color encoding bitmask to `default_color_range`.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/=
vkms_configfs.c
> index ee2e8d141f9e..3f658dd41272 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -439,6 +439,91 @@ static ssize_t plane_default_rotation_store(struct c=
onfig_item *item,
>  	return count;
>  }
>
> +static ssize_t plane_supported_color_ranges_show(struct config_item *ite=
m, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int supported_color_range;
                     supported_color_ranges

> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);

As for previous patches, set this on declaration for consistency (same belo=
w).

> +static ssize_t plane_supported_color_ranges_store(struct config_item *it=
em,
> +						  const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane=
(item);
> +	int ret, val =3D 0;
> +
> +	ret =3D kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) =3D=3D 0)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation=
 */

Oh no, that comment again! :-)

> +static ssize_t plane_default_color_range_store(struct config_item *item,
> +					       const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane=
(item);
> +	int ret, val =3D 0;
> +
> +	ret =3D kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) =3D=3D 0)
> +		return -EINVAL;

As in patch 12, replace this with is_power_of_2() to check that exactly one
bit is set.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
