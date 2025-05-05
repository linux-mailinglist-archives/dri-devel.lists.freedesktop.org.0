Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB10AA9B2A
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 20:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E4410E11D;
	Mon,  5 May 2025 18:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pYZ93YyZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F4410E11D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 18:03:31 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A27936DE;
 Mon,  5 May 2025 20:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1746468196;
 bh=LDjkdwIxXFL8YYvCMFDHn+XOhuYLpfnrJwHRsgUIH0w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pYZ93YyZ/A/fi/KdbL8DgwAH5FerehQ3VmeFsVSsMT8XN6IR5RxnOIKJRTLrY9+UV
 pV/LeoJnpJK5h6mNyfp5H+u++83laI+EADKKJPEinfshOKIMd4sGQu3TU0ECY8So2w
 rM2qsmZdf6UAaplR9wJNjFbp66M1TThCGyLScbAk=
Message-ID: <de4cacee-56ad-4700-b329-7853abc77ea5@ideasonboard.com>
Date: Mon, 5 May 2025 21:03:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/bridge: cdns-dsi: Replace deprecated
 UNIVERSAL_DEV_PM_OPS()
To: Vitor Soares <ivitro@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Jayesh Choudhary <j-choudhary@ti.com>, stable@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250428094048.1459620-1-ivitro@gmail.com>
 <fbde0659-78f3-46e4-98cf-d832f765a18b@ideasonboard.com>
 <ec35d40dcd06ddbcfc0409ffa01aaee22c601716.camel@gmail.com>
 <a1cf67da-a0cb-46c5-b22b-10ecca8ab383@ideasonboard.com>
 <33ff9db89056a683e393de09c41d7c98bdbc045e.camel@gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <33ff9db89056a683e393de09c41d7c98bdbc045e.camel@gmail.com>
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

Hi,

On 05/05/2025 20:47, Vitor Soares wrote:
> On Mon, 2025-05-05 at 18:30 +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 05/05/2025 17:45, Vitor Soares wrote:
>>> On Tue, 2025-04-29 at 09:32 +0300, Tomi Valkeinen wrote:
>>>> Hi,
>>>>
>>>> On 28/04/2025 12:40, Vitor Soares wrote:
>>>>> From: Vitor Soares <vitor.soares@toradex.com>
>>>>>
>>>>> The deprecated UNIVERSAL_DEV_PM_OPS() macro uses the provided callbacks
>>>>> for both runtime PM and system sleep. This causes the DSI clocks to be
>>>>> disabled twice: once during runtime suspend and again during system
>>>>> suspend, resulting in a WARN message from the clock framework when
>>>>> attempting to disable already-disabled clocks.
>>>>>
>>>>> [   84.384540] clk:231:5 already disabled
>>>>> [   84.388314] WARNING: CPU: 2 PID: 531 at /drivers/clk/clk.c:1181
>>>>> clk_core_disable+0xa4/0xac
>>>>> ...
>>>>> [   84.579183] Call trace:
>>>>> [   84.581624]  clk_core_disable+0xa4/0xac
>>>>> [   84.585457]  clk_disable+0x30/0x4c
>>>>> [   84.588857]  cdns_dsi_suspend+0x20/0x58 [cdns_dsi]
>>>>> [   84.593651]  pm_generic_suspend+0x2c/0x44
>>>>> [   84.597661]  ti_sci_pd_suspend+0xbc/0x15c
>>>>> [   84.601670]  dpm_run_callback+0x8c/0x14c
>>>>> [   84.605588]  __device_suspend+0x1a0/0x56c
>>>>> [   84.609594]  dpm_suspend+0x17c/0x21c
>>>>> [   84.613165]  dpm_suspend_start+0xa0/0xa8
>>>>> [   84.617083]  suspend_devices_and_enter+0x12c/0x634
>>>>> [   84.621872]  pm_suspend+0x1fc/0x368
>>>>>
>>>>> To address this issue, replace UNIVERSAL_DEV_PM_OPS() with
>>>>> DEFINE_RUNTIME_DEV_PM_OPS(), which avoids redundant suspend/resume calls
>>>>> by checking if the device is already runtime suspended.
>>>>>
>>>>> Cc: <stable@vger.kernel.org> # 6.1.x
>>>>> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
>>>>> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
>>>>> ---
>>>>>     drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 +++++-----
>>>>>     1 file changed, 5 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>>> b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>>> index b022dd6e6b6e..62179e55e032 100644
>>>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>>> @@ -1258,7 +1258,7 @@ static const struct mipi_dsi_host_ops cdns_dsi_ops
>>>>> = {
>>>>>           .transfer = cdns_dsi_transfer,
>>>>>     };
>>>>>     
>>>>> -static int __maybe_unused cdns_dsi_resume(struct device *dev)
>>>>> +static int cdns_dsi_resume(struct device *dev)
>>>>>     {
>>>>>           struct cdns_dsi *dsi = dev_get_drvdata(dev);
>>>>>     
>>>>> @@ -1269,7 +1269,7 @@ static int __maybe_unused cdns_dsi_resume(struct
>>>>> device *dev)
>>>>>           return 0;
>>>>>     }
>>>>>     
>>>>> -static int __maybe_unused cdns_dsi_suspend(struct device *dev)
>>>>> +static int cdns_dsi_suspend(struct device *dev)
>>>>>     {
>>>>>           struct cdns_dsi *dsi = dev_get_drvdata(dev);
>>>>>     
>>>>> @@ -1279,8 +1279,8 @@ static int __maybe_unused cdns_dsi_suspend(struct
>>>>> device *dev)
>>>>>           return 0;
>>>>>     }
>>>>>     
>>>>> -static UNIVERSAL_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend,
>>>>> cdns_dsi_resume,
>>>>> -                           NULL);
>>>>> +static DEFINE_RUNTIME_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend,
>>>>> +                                cdns_dsi_resume, NULL);
>>>>
>>>> I'm not sure if this, or the UNIVERSAL_DEV_PM_OPS, is right here. When
>>>> the system is suspended, the bridge drivers will get a call to the
>>>> *_disable() hook, which then disables the device. If the bridge driver
>>>> would additionally do something in its system suspend hook, it would
>>>> conflict with normal disable path.
>>>>
>>>> I think bridges/panels should only deal with runtime PM.
>>>>
>>>>     Tomi
>>>>
>>>
>>> In the proposed change, we make use of pm_runtime_force_suspend() during
>>> system-wide suspend. If the device is already suspended, this call is a
>>> no-op and disables runtime PM to prevent spurious wakeups during the
>>> suspend period. Otherwise, it triggers the device’s runtime_suspend()
>>> callback.
>>>
>>> I briefly reviewed other bridge drivers, and those that implement runtime
>>> PM appear to follow a similar approach, relying solely on runtime PM
>>> callbacks and using pm_runtime_force_suspend()/resume() to handle
>>> system-wide transitions.
>>
>> Yes, I see such a solution in some of the bridge and panel drivers. I'm
>> probably missing something here, as I don't think it's correct.
>>
>> Why do we need to set the system suspend/resume hooks? What is the
>> scenario where those will be called, and the
>> pm_runtime_force_suspend()/resume() do something that's not already done
>> via the normal DRM pipeline enable/disable?
>>
>>    Tomi
>>
> 
> I'm not a DRM expert, but my understanding is that there might be edge cases
> where the system suspend sequence occurs without the DRM core properly disabling
> the bridge — for example, due to a bug or if the bridge is not bound to an
> active pipeline. In such cases, having suspend/resume callbacks ensures that the
> device is still properly suspended and resumed.
> 
> Additionally, pm_runtime_force_suspend() disables runtime PM for the device
> during system suspend, preventing unintended wakeups (e.g., via IRQs, delayed
> work, or sysfs access) until pm_runtime_force_resume() is invoked.
> 
>  From my perspective, the use of pm_runtime_force_suspend() and
> pm_runtime_force_resume() serves as a safety mechanism to guarantee a well-
> defined and race-free state during system suspend.

But then we must be sure that the suspend sequence is just right.

At least in tidss's case, tidss_drv.c has tidss_suspend() which calls 
drm_mode_config_helper_suspend(), which, if I recall right, will then 
disable the pipeline. This must happen before the bridge's system 
suspend call, otherwise the bridge might go to suspend while the 
pipeline is still running, which might cause errors on the still-running 
pipeline entities, and probably crash the bridge's disable() call. If a 
bridge is a platform device, I don't think there's any ordering between 
the tidss's and the bridge's suspend calls.

If the bridge is not bound to a pipeline, why would it be enabled in the 
first place?

For the bug case... We're in random territory, then. If the driver is 
bugging, are you sure it's safe and useful to suspend it? Or would it be 
better to not do anything...

I'm not nacking the patch, as this approach seems to be used in multiple 
drivers. It just rings multiple alarm bells here, and I don't understand 
how exactly it's supposed to work. That said, the driver is using 
UNIVERSAL_DEV_PM_OPS(), so I think switching to 
DEFINE_RUNTIME_DEV_PM_OPS() is at least not worse (well, I can't be 
quite sure even about that =).

  Tomi

