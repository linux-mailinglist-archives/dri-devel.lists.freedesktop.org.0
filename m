Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D508F8674ED
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFE510F141;
	Mon, 26 Feb 2024 12:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nO7o1mql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2D710F141
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6uiBS+Qi7asaIxy6/7a5MSyWBWL8eWW6sZvNhsKqAP4=; b=nO7o1mql1l5uhE1TZDI6i2tAQ0
 wyfpn30zdIhLWSm7LAnvxgSFa2K1lK+j8MYcjGXa3TeWtoyonvn57BTBA9m+ETkCt6ZIvqsghfzW4
 QAkfqgbBwiJk6xewHIkjbf5mFTN6T3aHAdhW3Y83KUgbhQtVNSRTgrXyQWMm9kq+mNSD53P++KVhj
 ZNMqKZl7GrmXWMRIT6+EryKM0uK4yq1WzsKmahmk+zfy22KNPxpv9a7uSSI4bexip7spal8O/YBHm
 eVHrLna8RfH0FyG5WHfJ8TqABMatDf2YBgl8JDX89I05n3kSdljjUpE3jYhLzD+JTP31KV9ZKYzqQ
 4yOKJ0pQ==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rea72-003YnI-Sh; Mon, 26 Feb 2024 13:29:41 +0100
Message-ID: <244fe6b9-f295-4c85-908a-014ada0033fa@igalia.com>
Date: Mon, 26 Feb 2024 09:29:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 29/36] drm/vc4: tests: Remove vc4_dummy_plane structure
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-29-8f4af575fce2@kernel.org>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-29-8f4af575fce2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 2/22/24 15:14, Maxime Ripard wrote:
> The vc4_dummy_plane structure is an exact equivalent to vc4_plane, so we

Maybe I understood incorrectly, but isn't the vc4_dummy_plane structure 
equivalent to drm_plane?

Best Regards,
- Maíra

> don't need it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/vc4/tests/vc4_mock.c       |  6 ++----
>   drivers/gpu/drm/vc4/tests/vc4_mock.h       |  9 ++-------
>   drivers/gpu/drm/vc4/tests/vc4_mock_plane.c | 14 +++++---------
>   3 files changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
> index becb3dbaa548..0731a7d85d7a 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
> @@ -109,16 +109,14 @@ static const struct vc4_mock_desc vc5_mock =
>   static int __build_one_pipe(struct kunit *test, struct drm_device *drm,
>   			    const struct vc4_mock_pipe_desc *pipe)
>   {
> -	struct vc4_dummy_plane *dummy_plane;
>   	struct drm_plane *plane;
>   	struct vc4_dummy_crtc *dummy_crtc;
>   	struct drm_crtc *crtc;
>   	unsigned int i;
>   
> -	dummy_plane = vc4_dummy_plane(test, drm, DRM_PLANE_TYPE_PRIMARY);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
> +	plane = vc4_dummy_plane(test, drm, DRM_PLANE_TYPE_PRIMARY);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
>   
> -	plane = &dummy_plane->plane.base;
>   	dummy_crtc = vc4_mock_pv(test, drm, plane, pipe->data);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_crtc);
>   
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.h b/drivers/gpu/drm/vc4/tests/vc4_mock.h
> index 2d0b339bd9f3..002b6218960c 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock.h
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock.h
> @@ -21,13 +21,8 @@ struct drm_crtc *vc4_find_crtc_for_encoder(struct kunit *test,
>   	return NULL;
>   }
>   
> -struct vc4_dummy_plane {
> -	struct vc4_plane plane;
> -};
> -
> -struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
> -					struct drm_device *drm,
> -					enum drm_plane_type type);
> +struct drm_plane *vc4_dummy_plane(struct kunit *test, struct drm_device *drm,
> +				  enum drm_plane_type type);
>   
>   struct vc4_dummy_crtc {
>   	struct vc4_crtc crtc;
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
> index 62b18f5f41db..973f5f929097 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
> @@ -22,15 +22,12 @@ static const uint32_t vc4_dummy_plane_formats[] = {
>   	DRM_FORMAT_XRGB8888,
>   };
>   
> -struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
> -					struct drm_device *drm,
> -					enum drm_plane_type type)
> +struct drm_plane *vc4_dummy_plane(struct kunit *test, struct drm_device *drm,
> +				  enum drm_plane_type type)
>   {
> -	struct vc4_dummy_plane *dummy_plane;
>   	struct drm_plane *plane;
>   
> -	dummy_plane = drmm_universal_plane_alloc(drm,
> -						 struct vc4_dummy_plane, plane.base,
> +	plane = __drmm_universal_plane_alloc(drm, sizeof(struct drm_plane), 0,
>   						 0,
>   						 &vc4_dummy_plane_funcs,
>   						 vc4_dummy_plane_formats,
> @@ -38,10 +35,9 @@ struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
>   						 NULL,
>   						 DRM_PLANE_TYPE_PRIMARY,
>   						 NULL);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
>   
> -	plane = &dummy_plane->plane.base;
>   	drm_plane_helper_add(plane, &vc4_dummy_plane_helper_funcs);
>   
> -	return dummy_plane;
> +	return plane;
>   }
> 
