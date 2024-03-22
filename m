Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18277886B1E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 12:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F6410E107;
	Fri, 22 Mar 2024 11:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="PtMU3Q0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7614D10E107
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 11:14:16 +0000 (UTC)
Message-ID: <7835e928-7d09-446e-91dd-13a0fa549bc2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711106049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVrZlsfAwR9SjnoRF84YRfe9+qscAKx0nrI06ciuH9c=;
 b=PtMU3Q0cvYRQSQ6fk18jXYKy3ve8Mbjtd9mf2dz9UKl4mud33fmF/ENJr/CzbKp7d26ZdJ
 qnW8UuW8jmd28bzqyVNqHsB/S1TGAzHgUsi87OOXbPjUVf47Fmw3yuw3Hz7U2xntYvHIe/
 rbWZnZjx0V3TfxXvN0Eekge4UzQtCP4=
Date: Fri, 22 Mar 2024 19:13:54 +0800
MIME-Version: 1.0
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
 <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
 <20240322-loose-resourceful-bullmastiff-92cfaf@houat>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240322-loose-resourceful-bullmastiff-92cfaf@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/3/22 18:31, Maxime Ripard wrote:
> Which default config are you talking about? This compiles fine with all
> drm-misc defconfig, x86 defconfig and allmodconfig.

The drm_hdmi_avi_infoframe_colorimetry() function is belong to the drm_display_helper.ko
kernel module, it get called from hdmi_generate_avi_infoframe() in drm_atomic_state_helper.c.
While drm_atomic_state_helper.c belongs to drm_kms_helper.ko. Therefore drm_kms_helper.ko
is dependent on drm_display_helper.ko implicitly. So we probably should select it.



-- 
Best regards,
Sui

