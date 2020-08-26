Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3474125314F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 16:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15DC6E9B3;
	Wed, 26 Aug 2020 14:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3C76E12A;
 Wed, 26 Aug 2020 14:29:16 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id h19so606365ual.10;
 Wed, 26 Aug 2020 07:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E88h3RmsBvKYXoZRsq+cDVgANRnxBQsiFKASaXcdMv8=;
 b=lUZotO/DoKQhpfbMVaw3go0F2mWSLrR0WH9smvuyr2NwRoumZeer2IerLN8LxpNuYv
 B01ZBedR3ENYeXt5qQsWtyOqf5M4DgmR61sc2zCoOfdIGhlKXSMA702IX3aJyOiaovRK
 tc1ebmJAlP2z6tJtG9yitEJEA36NmvaVF7xbCf2OkQOGt5kYqkBia9+elyQQa6NUX18c
 rMSFWrxykWTjLvDSGtBR4ezZC0VkpLsPoMLvIudiN8DXUwgOV441oq2Ps2VUjQusrHBk
 zbM5Mymz1gWdrXONUyn1JXa9C55LObYNesTDLtOZtDp7SbGe9bcBn4vNtmSuqVURitan
 BcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E88h3RmsBvKYXoZRsq+cDVgANRnxBQsiFKASaXcdMv8=;
 b=reF08MetqSop9f+/DVFF5V1e+oZfHGvU/A5WyhVKTbqqqN6zFAPmzwJbKY69XlmSZ7
 s0QUH24/JtdXYE5bIBhOK0sqdfLQBQi9gVAJWcO++bJTssgVl5d1R038Hcs8OMOweCrj
 gXNZQcs66/w3KOKpnNrXTZUKB/hqXDY732WluaLgJ72FmuC9e1E84cgRorhXqRhOZ5Mv
 KzZXHGWhsPFXX7qN92baQX/JCCwmQPC1eNuhBX4b8077QGR31MVFqTE0e/7/jdDH7wIU
 PgmY0MBew44TEdvGdsTHYz7vbCRbY1AcO8AJVq/3VeAl8cXs0Jak0pVBwGINd9VVb4pE
 TLmw==
X-Gm-Message-State: AOAM531Ck0f6HlDZ3bdlq4BaorUV05nbeW0WGlXmNgdmR/DCCfyOHGDU
 Wl8dWfHT9gKI57Zh1meKC2mP4hPOUW6gaLg4D7GNH/8AKT4=
X-Google-Smtp-Source: ABdhPJxVGwAiFVon7ICEHDf6gJV5Kr9pR0pMo2BZ200R0vXSNIso/xx5roxWJBP9veF3Uw719GdON6X4IMhCbiVAyq4=
X-Received: by 2002:a9f:2190:: with SMTP id 16mr8197979uac.19.1598452155390;
 Wed, 26 Aug 2020 07:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200130043901.571143-1-keithp@keithp.com>
In-Reply-To: <20200130043901.571143-1-keithp@keithp.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 26 Aug 2020 15:23:32 +0100
Message-ID: <CACvgo50e9BHg4UWMt--BFXX4nsbSg29BHnchTAkVFb3nD3TKbw@mail.gmail.com>
Subject: Re: [PATCH] vulkan: Add VK_GOOGLE_display_timing extension
 (x11+display, anv+radv) [v8]
To: Keith Packard <keithp@keithp.com>
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Keith,

Most of the cool kids prefer gitlab MR, can you open one going forward?
That aside, here is some long overdue input on the patch itself.

My biggest concern that we expose the extension, even when it's not implemented.
The rest are rather minor - more documentation/comments, style fixes
and nitpicks.

On Thu, 30 Jan 2020 at 04:48, Keith Packard <keithp@keithp.com> wrote:

> v5:
>         Squash core bits and anv/radv wrappers into a single patch
>
We have more Vulkan drivers than anv/radv these days, with a few
others in the works.

For posterity sake, it might be worth keeping core + driver enablement
separate patches.
As an added bonus, this way the respective teams can test, review,
merge or even revert (please no) completely independently from each
other.


> --- a/src/amd/vulkan/radv_extensions.py
> +++ b/src/amd/vulkan/radv_extensions.py
> @@ -166,6 +166,7 @@ EXTENSIONS = [
>      Extension('VK_AMD_shader_trinary_minmax',             1, True),
>      Extension('VK_GOOGLE_decorate_string',                1, True),
>      Extension('VK_GOOGLE_hlsl_functionality1',            1, True),
> +    Extension('VK_GOOGLE_display_timing',                 1, True),
Nit: sort?


> --- a/src/amd/vulkan/radv_wsi.c
> +++ b/src/amd/vulkan/radv_wsi.c
> @@ -316,3 +316,36 @@ VkResult radv_GetPhysicalDevicePresentRectanglesKHR(
>                                                  surface,
>                                                  pRectCount, pRects);
>  }
> +
> +/* VK_GOOGLE_display_timing */
> +VkResult
> +radv_GetRefreshCycleDurationGOOGLE(
> +       VkDevice _device,
> +       VkSwapchainKHR swapchain,
> +       VkRefreshCycleDurationGOOGLE *pDisplayTimingProperties)
Nit: inconsistent indentation (follow GetPastPresentationTiming example below).


> --- a/src/intel/vulkan/anv_extensions.py
> +++ b/src/intel/vulkan/anv_extensions.py
> @@ -170,6 +170,7 @@ EXTENSIONS = [
>      Extension('VK_ANDROID_external_memory_android_hardware_buffer', 3, 'ANDROID'),
>      Extension('VK_ANDROID_native_buffer',                 7, 'ANDROID'),
>      Extension('VK_GOOGLE_decorate_string',                1, True),
> +    Extension('VK_GOOGLE_display_timing',                 1, True),
The dummy true will always advertise the extension. The extension
depends on VK_KHR_swapchain which uses DRV_HAS_SURFACE guard, which is
a good start.
Although there is no Wayland implementation, so how does the extension
work there? We really should not advertise it in said case.

Same applies for radv as well, obviously.


> --- a/src/vulkan/wsi/wsi_common.c
> +++ b/src/vulkan/wsi/wsi_common.c

> @@ -54,6 +55,7 @@ wsi_device_init(struct wsi_device *wsi,
>     WSI_GET_CB(GetPhysicalDeviceProperties2);
>     WSI_GET_CB(GetPhysicalDeviceMemoryProperties);
>     WSI_GET_CB(GetPhysicalDeviceQueueFamilyProperties);
> +   WSI_GET_CB(GetPhysicalDeviceProperties);
Nit: sort

> @@ -94,11 +104,15 @@ wsi_device_init(struct wsi_device *wsi,
>     WSI_GET_CB(GetImageMemoryRequirements);
>     WSI_GET_CB(GetImageSubresourceLayout);
>     WSI_GET_CB(GetMemoryFdKHR);
> +   WSI_GET_CB(GetPhysicalDeviceProperties);
>     WSI_GET_CB(GetPhysicalDeviceFormatProperties);
>     WSI_GET_CB(GetPhysicalDeviceFormatProperties2KHR);
Nit: sort - DeviceProperties should be here.


> @@ -210,6 +224,8 @@ wsi_swapchain_init(const struct wsi_device *wsi,
>     chain->device = device;
>     chain->alloc = *pAllocator;
>     chain->use_prime_blit = false;
> +   chain->timing_insert = 0;
> +   chain->timing_count = 0;
>
Not needed we memset(0) at the top of the function.


> +static VkResult
> +wsi_image_init_timestamp(const struct wsi_swapchain *chain,
> +                         struct wsi_image *image)
> +{
> +   const struct wsi_device *wsi = chain->wsi;
> +   VkResult result;
> +   /* Set up command buffer to get timestamp info */
> +
> +   result = wsi->CreateQueryPool(
> +      chain->device,
> +      &(const VkQueryPoolCreateInfo) {
> +         .sType = VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO,
> +            .queryType = VK_QUERY_TYPE_TIMESTAMP,
> +            .queryCount = 1,
> +            },
> +      NULL,
> +      &image->query_pool);
> +
Current code prefers using local variables. Bonus - it will ease
fixing the indentation. Comments apply for the whole patch.

> +static struct wsi_timing *
> +wsi_next_timing(struct wsi_swapchain *chain, int image_index)
Unused image_index. Left over from earlier revision, or incomplete code?

> +{
> +   uint32_t j = chain->timing_insert;
> +   ++chain->timing_insert;
Please use post increments through the patch.

> +   if (chain->timing_insert >= WSI_TIMING_HISTORY)
> +      chain->timing_insert = 0;
> +   if (chain->timing_count < WSI_TIMING_HISTORY)
> +      ++chain->timing_count;
> +   struct wsi_timing *timing = &chain->timing[j];
> +   memset(timing, '\0', sizeof (*timing));
The memset here is rather misleading. Since the caller already
(re)sets some of the fields one might as well just expand that.


> +void
> +wsi_present_complete(struct wsi_swapchain *swapchain,
> +                     struct wsi_image *image,
> +                     uint64_t ust,
> +                     uint64_t msc)
> +{
> +   const struct wsi_device *wsi = swapchain->wsi;
> +   struct wsi_timing *timing = image->timing;
> +
> +   if (!timing)
> +      return;
> +
> +   uint64_t render_timestamp;
> +
> +   VkResult result = wsi->GetQueryPoolResults(
> +      swapchain->device, image->query_pool,
> +      0, 1, sizeof(render_timestamp), &render_timestamp,
> +      sizeof (uint64_t),
> +      VK_QUERY_RESULT_64_BIT|VK_QUERY_RESULT_WAIT_BIT);
Rewrap this and any other parts to use 80 columns as suggested earlier.


> +   static const VkCalibratedTimestampInfoEXT    timestampInfo[2] = {

> +   uint64_t     timestamps[2];
> +   uint64_t     maxDeviation;
Drop the space alignment when declaring variables.

> +
> +   result = wsi->GetCalibratedTimestampsEXT(swapchain->device,
> +                                            2,
ARRAY_SIZE(), rewrap.

> +                                            timestampInfo,
> +                                            timestamps,
> +                                            &maxDeviation);


> @@ -1125,11 +1328,14 @@ wsi_common_queue_present(const struct wsi_device *wsi,
>
>     const VkPresentRegionsKHR *regions =
>        vk_find_struct_const(pPresentInfo->pNext, PRESENT_REGIONS_KHR);
> +   const VkPresentTimesInfoGOOGLE *present_times_info =
> +      vk_find_struct_const(pPresentInfo->pNext, PRESENT_TIMES_INFO_GOOGLE);
>
>     for (uint32_t i = 0; i < pPresentInfo->swapchainCount; i++) {
>        WSI_FROM_HANDLE(wsi_swapchain, swapchain, pPresentInfo->pSwapchains[i]);
>        uint32_t image_index = pPresentInfo->pImageIndices[i];
>        VkResult result;
> +      struct wsi_timing *timing = NULL;
Move the declaration where it is used.

>
>        if (swapchain->fences[image_index] == VK_NULL_HANDLE) {
>           const VkFenceCreateInfo fence_info = {
> @@ -1164,9 +1370,12 @@ wsi_common_queue_present(const struct wsi_device *wsi,
>           .memory = image->memory,
>        };
>
> +      VkCommandBuffer submit_buffers[2];
>        VkSubmitInfo submit_info = {
>           .sType = VK_STRUCTURE_TYPE_SUBMIT_INFO,
>           .pNext = &mem_signal,
> +         .pCommandBuffers = submit_buffers,
> +         .commandBufferCount = 0
>        };
>
>        VkPipelineStageFlags *stage_flags = NULL;
> @@ -1197,10 +1406,47 @@ wsi_common_queue_present(const struct wsi_device *wsi,
>           /* If we are using prime blits, we need to perform the blit now.  The
>            * command buffer is attached to the image.
>            */
> -         submit_info.commandBufferCount = 1;
> -         submit_info.pCommandBuffers =
> -            &image->prime.blit_cmd_buffers[queue_family_index];
>           mem_signal.memory = image->prime.memory;
> +         submit_buffers[submit_info.commandBufferCount++] =
> +            image->prime.blit_cmd_buffers[queue_family_index];
> +      }
> +
> +      /* Set up GOOGLE_display_timing bits */
> +      if (present_times_info &&
> +          present_times_info->pTimes != NULL &&
> +          i < present_times_info->swapchainCount)
The spec says "swapchainCount must be the same value as
VkPresentInfoKHR::swapchainCount".
Thus we should be safe to drop this - we already check the
VkPresentInfoKHR one (pPresentInfo->swapchainCount) at the top of the
loop.

> +      {
The if opening brace should be trailing on the previous line.

> +         const VkPresentTimeGOOGLE *present_time =
> +            &present_times_info->pTimes[i];
> +
> +         timing = wsi_next_timing(swapchain, pPresentInfo->pImageIndices[i]);
> +         timing->timing.presentID = present_time->presentID;
> +         timing->timing.desiredPresentTime = present_time->desiredPresentTime;
> +         timing->target_msc = 0;
> +         image->timing = timing;
> +
> +         if (present_time->desiredPresentTime != 0)
> +         {
Ditto

> +            int64_t delta_nsec = (int64_t) (present_time->desiredPresentTime -
> +                                            swapchain->frame_ust);
> +
> +            /* Set the target msc only if it's no more than two seconds from
> +             * now, and not stale
The specification does not say anything about the above two seconds.
Please document how and why it was chosen.


> @@ -1235,3 +1481,52 @@ wsi_common_get_current_time(void)
>     clock_gettime(CLOCK_MONOTONIC, &current);
>     return current.tv_nsec + current.tv_sec * 1000000000ull;
>  }
> +
> +VkResult
> +wsi_common_get_refresh_cycle_duration(
> +   const struct wsi_device *wsi,
> +   VkDevice device_h,
> +   VkSwapchainKHR _swapchain,
> +   VkRefreshCycleDurationGOOGLE *pDisplayTimingProperties)
Nit: unusual indent


> +VkResult
> +wsi_common_get_past_presentation_timing(
> +   const struct wsi_device *wsi,
> +   VkDevice device_h,
> +   VkSwapchainKHR _swapchain,
> +   uint32_t *count,
> +   VkPastPresentationTimingGOOGLE *timings)
Ditto


> @@ -150,11 +155,15 @@ struct wsi_device {
>     WSI_CB(GetImageMemoryRequirements);
>     WSI_CB(GetImageSubresourceLayout);
>     WSI_CB(GetMemoryFdKHR);
> +   WSI_CB(GetPhysicalDeviceProperties);
>     WSI_CB(GetPhysicalDeviceFormatProperties);
>     WSI_CB(GetPhysicalDeviceFormatProperties2KHR);
>     WSI_CB(GetPhysicalDeviceImageFormatProperties2);
Nit: DeviceProperties should be here.

> +   WSI_CB(GetPhysicalDeviceQueueFamilyProperties);
> +   WSI_CB(GetQueryPoolResults);
>     WSI_CB(ResetFences);
>     WSI_CB(QueueSubmit);
> +   WSI_CB(GetCalibratedTimestampsEXT);
>     WSI_CB(WaitForFences);
>  #undef WSI_CB
>


> @@ -1145,17 +1156,38 @@ wsi_display_page_flip_handler2(int fd,
>  {
>     struct wsi_display_image *image = data;
>     struct wsi_display_swapchain *chain = image->chain;
> +   VkIcdSurfaceDisplay *surface = chain->surface;
> +   wsi_display_mode *display_mode =
> +      wsi_display_mode_from_handle(surface->displayMode);
> +   wsi_display_connector *connector = display_mode->connector;
> +   uint64_t nsec = (uint64_t) sec * 1000000000ull + (uint64_t) usec * 1000;
Let's add an inline helper (like the widen) and use in both handlers.


> @@ -2555,9 +2701,14 @@ wsi_get_swapchain_counter(VkDevice device,
>        return VK_SUCCESS;
>     }
>
> -   int ret = drmCrtcGetSequence(wsi->fd, connector->crtc_id, value, NULL);
> -   if (ret)
> +   uint64_t nsec;
> +   int ret = drmCrtcGetSequence(wsi->fd, connector->crtc_id, value, &nsec);
> +   if (ret) {
>        *value = 0;
Using "return VK_ERROR_DEVICE_LOST;" seems perfectly reasonable here.
Although that should really be a separate patch.


> +#define WSI_TIMING_HISTORY      16
> +
Please add some comments why we have a fixed timing set in the
swapchain and how 16 was chosen.

> @@ -859,8 +862,39 @@ x11_handle_dri3_present_event(struct x11_swapchain *chain,
>
>     case XCB_PRESENT_EVENT_COMPLETE_NOTIFY: {
>        xcb_present_complete_notify_event_t *complete = (void *) event;
> -      if (complete->kind == XCB_PRESENT_COMPLETE_KIND_PIXMAP)
> +      if (complete->kind == XCB_PRESENT_COMPLETE_KIND_PIXMAP) {
> +         uint64_t frames = complete->msc - chain->last_present_msc;
> +         uint64_t present_nsec = complete->ust * 1000;
> +
> +         /*
> +          * Well, this is about as good as we can do -- measure the refresh
> +          * instead of asking for the current mode and using that. Turns out,
> +          * for eDP panels, this works better anyways as they use the builtin
> +          * fixed mode for everything
> +          */
What is wrong with checking the current mode and using the data? Let's
document that reasoning.
Apart from the initial 60Hz, the refresh period returned will vary
during the initial 10 frames. Are we confident that either of those
assumptions won't back-fire with applications?


> @@ -1480,6 +1543,8 @@ x11_surface_create_swapchain(VkIcdSurfaceBase *icd_surface,

> +   chain->threaded = false;
Unrelated, yet again it's missing all together in master.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
