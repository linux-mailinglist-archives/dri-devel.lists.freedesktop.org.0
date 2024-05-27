Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBCC8D0612
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F27E88CFA;
	Mon, 27 May 2024 15:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="FfgPGAoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B6110FB5C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:27:35 +0000 (UTC)
X-Envelope-To: mripard@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716823652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vsw4ZGatsr0eZbdbPVbaiC9GTnbbEm5u3nRWlw+hGUc=;
 b=FfgPGAoHB1qlQWojPKPbc3dqBZe+TrUH4BSedSn814UMa4siCJ0fTL/3BQ2TGlKsDjfXHM
 5Y9klSvpPbdA23gk4DwM/9zAoaIfAXh1ELhXijHvf9FSzUNt0hDVBjkpojFdAEUePklnFY
 qvmpTQ9v8Z3A6HOiYnsXGLu5kOJRqyE=
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: corbet@lwn.net
X-Envelope-To: hjc@rock-chips.com
X-Envelope-To: heiko@sntech.de
X-Envelope-To: wens@csie.org
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: samuel@sholland.org
X-Envelope-To: andy.yan@rock-chips.com
X-Envelope-To: hverkuil@xs4all.nl
X-Envelope-To: sebastian.wick@redhat.com
X-Envelope-To: ville.syrjala@linux.intel.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-media@vger.kernel.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-sunxi@lists.linux.dev
X-Envelope-To: dave.stevenson@raspberrypi.com
X-Envelope-To: dmitry.baryshkov@linaro.org
Message-ID: <50622688-c1ab-4dde-8735-0456722fab14@linux.dev>
Date: Mon, 27 May 2024 23:27:21 +0800
MIME-Version: 1.0
Subject: Re: [v15,06/29] drm/tests: Add output bpc tests
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dave Stevenson
 <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240527-kms-hdmi-connector-state-v15-6-c5af16c3aae2@kernel.org>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-6-c5af16c3aae2@kernel.org>
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


On 5/27/24 21:57, Maxime Ripard wrote:
> Now that we're tracking the output bpc count in the connector state,
> let's add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Tested-by: Sui Jingfeng <sui.jingfeng@linux.dev>
