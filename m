Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A96A02106
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 09:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A4510E5D7;
	Mon,  6 Jan 2025 08:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579DB10E5C0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 08:42:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B8090A4128C;
 Mon,  6 Jan 2025 08:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DB6C4CEE0;
 Mon,  6 Jan 2025 08:42:46 +0000 (UTC)
Message-ID: <38646958-6031-4cd6-96b4-3f8469fb0f6d@xs4all.nl>
Date: Mon, 6 Jan 2025 09:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i2c: move TDA drivers under drivers/gpu/drm/bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
 <20241215-drm-move-tda998x-v1-2-7817122b1d73@linaro.org>
 <20241215123805.GB25852@pendragon.ideasonboard.com>
 <7wbji44qivubkwrbvrdck7fxsl5oaljugzy4td6xywr2p5ug7p@snrr6en5cuh7>
 <20250105232018.GB21164@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20250105232018.GB21164@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
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

On 06/01/2025 00:20, Laurent Pinchart wrote:
> (CC'ing Hans Verkuil)
> 
> On Mon, Jan 06, 2025 at 12:52:55AM +0200, Dmitry Baryshkov wrote:
>> On Sun, Dec 15, 2024 at 02:38:05PM +0200, Laurent Pinchart wrote:
>>> Hi Dmitry,
>>>
>>> Thank you for the patch.
>>>
>>> On Sun, Dec 15, 2024 at 01:09:08PM +0200, Dmitry Baryshkov wrote:
>>>> TDA998x is the HDMI bridge driver, incorporating drm_connector and
>>>> optional drm_encoder (created via the component bind API by the TICLDC
>>>> and HDLCD drivers). Thus it should be residing together with the other
>>>> DRM bridge drivers under drivers/gpu/drm/bridge/.
>>>>
>>>> TDA9950 is an I2C-CEC translator, being present on-die on the TDA9989
>>>> and TDA19989 chips, so it is being instantiated by the TDA998x driver.
>>>> Move it together with the TDA998x under bridge drivers subdir.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>  MAINTAINERS                                       |  2 +-
>>>>  drivers/gpu/drm/arm/Kconfig                       |  1 +
>>>>  drivers/gpu/drm/bridge/Kconfig                    |  2 ++
>>>>  drivers/gpu/drm/bridge/Makefile                   |  1 +
>>>>  drivers/gpu/drm/bridge/tda/Kconfig                | 13 +++++++++++++
>>>>  drivers/gpu/drm/bridge/tda/Makefile               |  4 ++++
>>>>  drivers/gpu/drm/{i2c => bridge/tda}/tda9950.c     |  0
>>>>  drivers/gpu/drm/{i2c => bridge/tda}/tda998x_drv.c |  0
>>>
>>> I probably wouldn't have created a tda/ subdirectory in bridge/, but I
>>> don't mind much either way.
>>
>> A possibly better option is to move tsa9950.c to drivers/media/cec/i2c/
>> next to ch7332 CEC driver. WDYT?
> 
> I think that's a question for Hans. I don't mind much either way.

I agree, moving it to media/cec/i2c makes sense.

Regards,

	Hans

> 
>> If I don't get any response from Russell within the next few days, I
>> think I'll post v2 performing these two moves: tda9950 to
>> drivers/media/cec/i2c and tda998x to drivers/gpu/drm/bridge without the
>> tda/ subdir.
>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

