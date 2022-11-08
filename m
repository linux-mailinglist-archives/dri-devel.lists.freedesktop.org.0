Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0D56211F7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557D110E0C7;
	Tue,  8 Nov 2022 13:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A4610E0C7;
 Tue,  8 Nov 2022 13:06:50 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id i9so8981114qki.10;
 Tue, 08 Nov 2022 05:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LI5tKvQ3xbrBkw4pUpaVa/1GYtcIna1PWM17WCwqkc4=;
 b=GBpp36WjmE4kGMUUhxp84WyeKTn5LRcR6znluXB1o2CQlhorvQXAdhVlWKkSfgM3TG
 tSoMhTcnSx+pv+o6fIZzTPgazb05XggoVmya0ZPVO8R62iEXJXFmb2l9vPHhTPSsLLIz
 gHfWppGhePiDcgswLU1J/yD90/fXFtuUtsINKP70hQIui7Vky+uS0iks4r8eKDYGjYQL
 ePafWa+kE24V+OZPZq517KxG4t5fLNuOGdQn/iU3gLVf47/UR5+/9cL69tuxoCvy6LFl
 cbJK3NsnT50LeLc9ni3RioWOY9uKKVMvIG+X7Rv6wtSWYu3gC4RRLS5kYdAadJqS5WVX
 GJiw==
X-Gm-Message-State: ACrzQf0R+t7DD3x2LQFbtTF3ud2vOT7JrE4Ta9/V2pzJ2toEb4bdNRDd
 uzs4nOMr68Qlt+3S8AaiDAJS2m2ey6RJNj1esHk=
X-Google-Smtp-Source: AMsMyM6mWnv7hmiQNfBMlQvN6ojeFaZNX36NmVT47vgzqWz5SZt+WPWZwPyHGmH0W/MgDOOVPQhecxo4I04uf7M7HcI=
X-Received: by 2002:a05:620a:d89:b0:6cf:c98b:744c with SMTP id
 q9-20020a05620a0d8900b006cfc98b744cmr38188547qkl.443.1667912809286; Tue, 08
 Nov 2022 05:06:49 -0800 (PST)
MIME-Version: 1.0
References: <7ce6bd54.f8.184570dd1b6.Coremail.wangkailong@jari.cn>
In-Reply-To: <7ce6bd54.f8.184570dd1b6.Coremail.wangkailong@jari.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 8 Nov 2022 14:06:36 +0100
Message-ID: <CAJZ5v0iv5FP=RKjyvS6Yaq7JvvxmQnz0LKZj5HmOFDbn2VvS2g@mail.gmail.com>
Subject: Re: [PATCH] ACPICA: Fix return
To: wangkailong@jari.cn
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Li <sunpeng.li@amd.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Siqueira <Rodrigo.Siqueira@amd.com>, Moore <robert.moore@intel.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 8, 2022 at 12:48 PM <wangkailong@jari.cn> wrote:
>
> return is not a function, parentheses are not required
>
> Signed-off-by: KaiLong Wang <wangkailong@jari.cn>

ACPICA material is to be submitted to the upstream project at GitHub
(please see MAINTAINERS for the link).

You may notice, however, that your changes do not align with the
coding style there.

Moreover, the patch contains non-ACPICA changes that are not mentioned
in the changelog.

> ---
>  drivers/acpi/acpica/evsci.c                     | 12 +++++-------
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 17 +++++++----------
>  2 files changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/acpi/acpica/evsci.c b/drivers/acpi/acpica/evsci.c
> index 3915ff61412b..63dd2aa2d16a 100644
> --- a/drivers/acpi/acpica/evsci.c
> +++ b/drivers/acpi/acpica/evsci.c
> @@ -38,9 +38,8 @@ u32 acpi_ev_sci_dispatch(void)
>
>         /* Are there any host-installed SCI handlers? */
>
> -       if (!acpi_gbl_sci_handler_list) {
> -               return (int_status);
> -       }
> +       if (!acpi_gbl_sci_handler_list)
> +               return int_status;
>
>         flags = acpi_os_acquire_lock(acpi_gbl_gpe_lock);
>
> @@ -57,7 +56,7 @@ u32 acpi_ev_sci_dispatch(void)
>         }
>
>         acpi_os_release_lock(acpi_gbl_gpe_lock, flags);
> -       return (int_status);
> +       return int_status;
>  }
>
>  /*******************************************************************************
> @@ -193,9 +192,8 @@ acpi_status acpi_ev_remove_all_sci_handlers(void)
>             acpi_os_remove_interrupt_handler((u32) acpi_gbl_FADT.sci_interrupt,
>                                              acpi_ev_sci_xrupt_handler);
>
> -       if (!acpi_gbl_sci_handler_list) {
> -               return (status);
> -       }
> +       if (!acpi_gbl_sci_handler_list)
> +               return status;
>
>         flags = acpi_os_acquire_lock(acpi_gbl_gpe_lock);
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index 38d71b5c1f2d..66661a20117b 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -29,7 +29,6 @@
>  #include "core_types.h"
>  #include "resource.h"
>  #include "ipp.h"
> -#include "timing_generator.h"
>  #include "dc_dmub_srv.h"
>
>  #define DC_LOGGER dc->ctx->logger
> @@ -152,9 +151,8 @@ static void dc_stream_free(struct kref *kref)
>
>  void dc_stream_release(struct dc_stream_state *stream)
>  {
> -       if (stream != NULL) {
> +       if (stream != NULL)
>                 kref_put(&stream->refcount, dc_stream_free);
> -       }
>  }
>
>  struct dc_stream_state *dc_create_stream_for_sink(
> @@ -316,11 +314,11 @@ bool dc_stream_set_cursor_attributes(
>         struct dc  *dc;
>         bool reset_idle_optimizations = false;
>
> -       if (NULL == stream) {
> +       if (stream == NULL) {
>                 dm_error("DC: dc_stream is NULL!\n");
>                 return false;
>         }
> -       if (NULL == attributes) {
> +       if (attributes == NULL) {
>                 dm_error("DC: attributes is NULL!\n");
>                 return false;
>         }
> @@ -399,12 +397,12 @@ bool dc_stream_set_cursor_position(
>         struct dc  *dc = stream->ctx->dc;
>         bool reset_idle_optimizations = false;
>
> -       if (NULL == stream) {
> +       if (stream == NULL) {
>                 dm_error("DC: dc_stream is NULL!\n");
>                 return false;
>         }
>
> -       if (NULL == position) {
> +       if (position == NULL) {
>                 dm_error("DC: cursor position is NULL!\n");
>                 return false;
>         }
> @@ -468,9 +466,8 @@ bool dc_stream_add_writeback(struct dc *dc,
>                 }
>         }
>
> -       if (!isDrc) {
> +       if (!isDrc)
>                 stream->writeback_info[stream->num_wb_info++] = *wb_info;
> -       }
>
>         if (dc->hwss.enable_writeback) {
>                 struct dc_stream_status *stream_status = dc_stream_get_status(stream);
> @@ -526,7 +523,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
>         /* remove writeback info for disabled writeback pipes from stream */
>         for (i = 0, j = 0; i < stream->num_wb_info; i++) {
>                 if (stream->writeback_info[i].wb_enabled) {
> -                       if (j < i)
> +                       if (i != j)
>                                 /* trim the array */
>                                 stream->writeback_info[j] = stream->writeback_info[i];
>                         j++;
> --
> 2.36.1
