Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F690BFD44F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D5710E808;
	Wed, 22 Oct 2025 16:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l/WRi5Z4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F286710E80A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:37:31 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98CB98FA;
 Wed, 22 Oct 2025 18:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761150946;
 bh=c6iXq2CXhRSiU/zyPKgk/97y67GG3wPx5D49DMmb4mA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l/WRi5Z4ycRNSf9pqsvs2Q3ABA2mElozQDXLWHcQUvbKhIaYza2AnUZ6PmTon8Hj4
 A/ayI/sIpY6c9PClpYHGQSYXigtRWYvY7MC6G9MXtyqVXgtatcs/OKX5Lhnce4XBYx
 6EGQGGXReu6M24rqCa8mvK0HIerqDAQ9lyvmHVvc=
Message-ID: <7ebf501a-68f5-4644-9419-49e391caacd8@ideasonboard.com>
Date: Wed, 22 Oct 2025 19:37:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/tidss: Add some support for splash-screen
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Devarsh Thakkar <devarsht@ti.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
References: <20250908-tidss-splash-v2-1-e388b0581dfa@ideasonboard.com>
 <348086ac-b5bc-4ca9-9e5b-82106d319eeb@ti.com>
 <qljdrluxqi3abg7opwvp24ki7255jxrpowf47rpumzlcbnlnon@pccj5wm2kbxt>
 <0d1affe1-1e3c-452a-9052-104acaabef62@suse.de>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <0d1affe1-1e3c-452a-9052-104acaabef62@suse.de>
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

Hi,

On 22/10/2025 17:59, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.10.25 um 16:06 schrieb Maxime Ripard:
>> Hi,
>>
>> On Wed, Oct 22, 2025 at 07:25:10PM +0530, Devarsh Thakkar wrote:
>>> On 08/09/25 14:43, Tomi Valkeinen wrote:
>>>> Currently when the driver's probe is called, we do a full DSS reset. If
>>>> the bootloader has set up a splash-screen, the reset will disable the
>>>> video output, and after that it may still take time until the
>>>> display is
>>>> usable (all the kernel modules have been loaded) and even more time
>>>> until the userspace is able to use the display.
>>>>
>>>> If fbdev is enabled, in a perfect case tidss would take over the fb
>>>> memory set up by the bootloader, and use that memory for tidss's fbdev,
>>>> thus retaining the splash-screen. However, we're not there yet.
>>>>
>>>> As a partial solution, this patch changes the driver so that the driver
>>>> will not reset (or change) the DSS registers until tidss_runtime_get()
>>>> is called when the display is being set up (because of fbdev
>>>> modesetting
>>>> or modesetting from the userspace).
>>>>
>>>> This is achieved in two parts:
>>>>
>>>> 1. Probe
>>>>
>>>> At probe time, in dispc_init_hw(), we check if the DSS is idle
>>>> (videoports disabled). If yes, do a reset and continue as before. If
>>>> not, we know that there's a splash-screen, and we set the
>>>> 'tidss->boot_enabled_vp_mask' field to reflect the enabled VPs.
>>>>
>>>> We then enable the corresponding VP clocks (to ensure they stay on),
>>>> set
>>>> the IRQENABLE to 0 to make sure we won't get any interrupts, and then
>>>> exit leaving the fclk and VP clocks enabled, and the runtime PM status
>>>> active.
>>>>
>>>> 2. Runtime get
>>>>
>>>> Later, when the tidss_runtime_get() is called the first time, we check
>>>> the 'boot_enabled_vp_mask'. If set, we know that we have the
>>>> splash-screen showing on the screen, and thus the clocks are enabled
>>>> and
>>>> runtime PM status is active. This indicates that
>>>> pm_runtime_resume_and_get() call just before in tidss_runtime_get() did
>>>> not cause a runtime_resume callback to get called, so we need to do
>>>> that
>>>> manually.
>>>>
>>>> We call dispc_splash_fini() which essentially returns the DSS into the
>>>> state where it would be in a non-splash-screen case:
>>>> dispc_splash_fini()
>>>> will do a DSS reset, manually call the runtime_resume callback, and
>>>> then
>>>> call clk_disable_unprepare() and pm_runtime_put_noidle() to counter the
>>>> actions at probe time.
>>>>
>>>> Finally 'boot_enabled_vp_mask' is set to zero to mark that we're no
>>>> longer in the "splash-screen mode".
>>>>
>>>> A note about fbdev emulation:
>>>>
>>>> If fbdev emulation is enabled in the DRM, tidss will set up an fbdev.
>>>> This will cause a modeset, and the blank framebuffer from tidss's fbdev
>>>> will be shown instead of the splash-screen.
>>>>
>>>> I see two improvements to this: either we should memcpy the pixel data
>>>> from the bootloader's splash-screen to the new fbdev buffer, or the
>>>> fbdev could use the splash-screen directly as its buffer. I have done
>>>> some hacks for the former, but I'm not sure how to implement either of
>>>> these properly.
>> I still think it's not the kind of driver-specific driver behaviour we
>> want to have.
>>
>> Even more so when we have a generic solution to this problem in the
>> works.
> 
> I agree with that sentiment. We want atomic-state readout plus a
> bootsplash DRM client. This would give us flicker-free booting with
> smooth transitions across drivers and user space.

I like the sound of it. What does a bootsplash DRM client do? Would this
give us the ability for the userspace to do some small modifications to
the fb (e.g. progress bar), and would it work with a built-in dummy
driver (simpledrm), and the main DRM driver as a module?

 Tomi

