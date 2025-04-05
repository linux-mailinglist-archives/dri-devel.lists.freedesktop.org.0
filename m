Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E2A7CB27
	for <lists+dri-devel@lfdr.de>; Sat,  5 Apr 2025 20:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E1A10E363;
	Sat,  5 Apr 2025 18:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jLrHuQhG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4AB10E16D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Apr 2025 18:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6qIyleONiLSSPKKgUjjASa5DayAR0eM92TEDLOf7Z7A=; b=jLrHuQhG9Rj0wGejx3thobwiMs
 jZWXL9Y2pJo7r1dO3s+22uk2vwk67hSpN/VeEfCDLXVfT3G3TfIiPSqseYnK8JqGRLJQAMBv6GFGH
 FaDfzL01xUxjamIak0Nm3g17KTcUxQe/Ic9C9Us+l++6NcM4peIBRzn1dbgecyr8oWLY1yZvKrw5n
 ZXr4X8a6O9X4x4/siKKMBphsSQkHopHyw4cy7RYyfjhYNwR8QDRyc7cQBel13B+TgfYYRs/aPUtvI
 UB1FA++kycOdD3RvblyxPrzMf9eXUqtcDIPAFT0N5QlGjRQYD+ZsFfF3TDWBH/0hKaXyFMVDsxeT9
 HLpD4PEg==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u17w0-00C0Re-Ko; Sat, 05 Apr 2025 20:08:00 +0200
Message-ID: <161cd38b-2119-43f2-bc2c-494e9e60de41@igalia.com>
Date: Sat, 5 Apr 2025 15:07:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/vc4: tests: Document output handling functions
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
 <20250403-drm-vc4-kunit-failures-v2-2-e09195cc8840@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250403-drm-vc4-kunit-failures-v2-2-e09195cc8840@kernel.org>
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

Hi Maxime,

On 03/04/25 10:33, Maxime Ripard wrote:
> vc4_mock_atomic_add_output() and vc4_mock_atomic_del_output() are public
> but aren't documented. Let's provide the documentation.
> 
> In particular, special care should be taken to deal with EDEADLK.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> index f0ddc223c1f839e8a14f37fdcbb72e7b2c836aa1..577d9a9563696791632aec614c381a214886bf27 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> @@ -59,10 +59,23 @@ struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
>   
>   static const struct drm_display_mode default_mode = {
>   	DRM_SIMPLE_MODE(640, 480, 64, 48)
>   };
>   
> +/**
> + * vc4_mock_atomic_add_output() - Enables an output in a state
> + * @test: The test context object
> + * @state: Atomic state to enable the output in.
> + * @type: Type of the output encoder
> + *
> + * Adds an output CRTC and connector to a state, and enables them.
> + *
> + * Returns:
> + * 0 on success, a negative error code on failure. If the error is
> + * EDEADLK, the entire atomic sequence must be restarted. All other
> + * errors are fatal.
> + */
>   int vc4_mock_atomic_add_output(struct kunit *test,
>   			       struct drm_atomic_state *state,
>   			       enum vc4_encoder_type type)
>   {
>   	struct drm_device *drm = state->dev;
> @@ -103,10 +116,23 @@ int vc4_mock_atomic_add_output(struct kunit *test,
>   	crtc_state->active = true;
>   
>   	return 0;
>   }
>   
> +/**
> + * vc4_mock_atomic_del_output() - Disables an output in a state
> + * @test: The test context object
> + * @state: Atomic state to disable the output in.
> + * @type: Type of the output encoder
> + *
> + * Adds an output CRTC and connector to a state, and disables them.
> + *
> + * Returns:
> + * 0 on success, a negative error code on failure. If the error is
> + * EDEADLK, the entire atomic sequence must be restarted. All other
> + * errors are fatal.
> + */
>   int vc4_mock_atomic_del_output(struct kunit *test,
>   			       struct drm_atomic_state *state,
>   			       enum vc4_encoder_type type)
>   {
>   	struct drm_device *drm = state->dev;
> 

