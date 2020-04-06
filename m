Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A641B19FE8B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ADB6E49D;
	Mon,  6 Apr 2020 19:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69226E49C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:56:54 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id j9so737617ilr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fnZ6pExW/U6h46wgY9rWZOzZT0GV3QCI6s9Mlxp3WgU=;
 b=KFkem/LC1MPyOeQ8gprhr2bwARr/FErtNsI8vnaEJg/xiylixuShCm0Ero8GENGAsc
 Mjvz0FEyzb0Q0x6uu5M+rvUGojWDq9DmsJBb8rNBukP+rUHsEMoEvehWbqu0YJQtARrc
 0oml0hoZShhDVCDQZBfly+LOX9wpcFaqe0SM9dS+yUGlHZD+PrxNAZVM39yKjbBfqG4w
 FFZoJx8bXsbqQXzuHrzkgTLkWXe2A0HD7A59uMnqWwu0RyQrZMdROAojng2++SBPplZ2
 kV+33A4M1BXdXn3gOImbPTLaxDBbzQIUGbBGy/uHAgB8tbI9F/yBHhdS0arYwhJ0vIux
 K/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fnZ6pExW/U6h46wgY9rWZOzZT0GV3QCI6s9Mlxp3WgU=;
 b=ivwwYxi+85l9M27Nh9KAZWpio1ixg1ANB5D26M8TMFwN0jcg3p9aYMcqpPDiw3xQx2
 u3JGuecc+2w/O0wfYFM5dhaFuvHS7RoQvqKumTTDa8o6CNWRww+nOmYqpYHGyFz+MdD/
 c5W1J347rgtdO6bJ6Ftgzu881/ZQJA+hHW2p69dnhSCgaXfFctJcja73sA/q+ejOKG3l
 u6+EQkwoSclj2mcNjdXxPzwxjcr7DdHFDro1kVskcZk96G25+oGId4afpBcS2JULJjkN
 1H/iBSo+rV4eTJtvHIao4RHS+2Yxmt6H9ptfs9hKRjWynsvSgqh9750qscQ0FI3Uqi9k
 YbsQ==
X-Gm-Message-State: AGi0PuZNC1u+BBAQ+tVT/AhdccRJsFj09a4ZwDEBicoYZZLq0xs84pEo
 qLUR2n8qI0npRaVdQDKEMyu9u2P9GB5PkIXngxgo0w==
X-Google-Smtp-Source: APiQypK9acCe47XaSYdZCjI/gE8nQ+1Lo1fLbrq/jUyLE1JNTsHe/R+oDJmP1D8tA9K9/PU93xjVdykoWrqHRNxl4Lc=
X-Received: by 2002:a92:9f9c:: with SMTP id z28mr1094973ilk.71.1586203014176; 
 Mon, 06 Apr 2020 12:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200403222251.937740-1-lyude@redhat.com>
In-Reply-To: <20200403222251.937740-1-lyude@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Mon, 6 Apr 2020 15:56:18 -0400
Message-ID: <CAMavQKKXVuvcU=TjA8MZpjLDmLC6nga+uDu8zcX5Ps9wFQoyMw@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Remove drm_dp_mst_has_audio()
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, "Lee,
 Shawn C" <shawn.c.lee@intel.com>, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 6:23 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Drive-by fix I noticed the other day - drm_dp_mst_has_audio() only ever
> made sense back when we still had to validate ports before accessing
> them in order to (attempt to) avoid NULL dereferences. Since we have
> proper reference counting that guarantees we always can safely access
> the MST port, there's no use in keeping this function around as all it
> does is validate the port pointer before checking the audio status.
>
> Note - drm_dp_mst_port->has_audio is technically protected by
> drm_device->mode_config.connection_mutex, since it's only ever updated
> from drm_dp_mst_get_edid(). Additionally, we change the declaration for
> port in struct intel_connector to be properly typed, so we can directly
> access it.
>

This is kind of burying the lede. I'd almost prefer a 2 patch series:

drm/i915: Allow connectors to directly access drm_dp_mst_port
drm/dp_mst: Remove unused drm_dp_mst_port_has_audio()

That way if anyone objects to the idea of accessing mst_port directly
from i915 driver, it's more obvious from the patch subject.

Nitpicks aside, the code looks good to me, it's a nice cleanup!

Reviewed-by: Sean Paul <sean@poorly.run>

> Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 21 -------------------
>  .../drm/i915/display/intel_display_debugfs.c  | 10 ++-------
>  .../drm/i915/display/intel_display_types.h    |  2 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +--
>  include/drm/drm_dp_mst_helper.h               |  2 --
>  5 files changed, 4 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 1ff49547b2e8..129126091e90 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4063,27 +4063,6 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_dp_mst_detect_port);
>
> -/**
> - * drm_dp_mst_port_has_audio() - Check whether port has audio capability or not
> - * @mgr: manager for this port
> - * @port: unverified pointer to a port.
> - *
> - * This returns whether the port supports audio or not.
> - */
> -bool drm_dp_mst_port_has_audio(struct drm_dp_mst_topology_mgr *mgr,
> -                                       struct drm_dp_mst_port *port)
> -{
> -       bool ret = false;
> -
> -       port = drm_dp_mst_topology_get_port_validated(mgr, port);
> -       if (!port)
> -               return ret;
> -       ret = port->has_audio;
> -       drm_dp_mst_topology_put_port(port);
> -       return ret;
> -}
> -EXPORT_SYMBOL(drm_dp_mst_port_has_audio);
> -
>  /**
>   * drm_dp_mst_get_edid() - get EDID for an MST port
>   * @connector: toplevel connector to get EDID for
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 424f4e52f783..9f736420d83f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -631,15 +631,9 @@ static void intel_dp_info(struct seq_file *m,
>  }
>
>  static void intel_dp_mst_info(struct seq_file *m,
> -                         struct intel_connector *intel_connector)
> +                             struct intel_connector *intel_connector)
>  {
> -       struct intel_encoder *intel_encoder = intel_attached_encoder(intel_connector);
> -       struct intel_dp_mst_encoder *intel_mst =
> -               enc_to_mst(intel_encoder);
> -       struct intel_digital_port *intel_dig_port = intel_mst->primary;
> -       struct intel_dp *intel_dp = &intel_dig_port->dp;
> -       bool has_audio = drm_dp_mst_port_has_audio(&intel_dp->mst_mgr,
> -                                       intel_connector->port);
> +       bool has_audio = intel_connector->port->has_audio;
>
>         seq_printf(m, "\taudio support: %s\n", yesno(has_audio));
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 2bedd626c686..1de7bef0a49b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -436,7 +436,7 @@ struct intel_connector {
>            state of connector->polled in case hotplug storm detection changes it */
>         u8 polled;
>
> -       void *port; /* store this opaque as its illegal to dereference it */
> +       struct drm_dp_mst_port *port;
>
>         struct intel_dp *mst_port;
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 61605eb8c2af..c35efc9e628d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -114,8 +114,7 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
>
>         if (intel_conn_state->force_audio == HDMI_AUDIO_AUTO)
>                 pipe_config->has_audio =
> -                       drm_dp_mst_port_has_audio(&intel_dp->mst_mgr,
> -                                                 connector->port);
> +                       connector->port->has_audio;
>         else
>                 pipe_config->has_audio =
>                         intel_conn_state->force_audio == HDMI_AUDIO_ON;
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index 7af51c947b81..2d7c26592c05 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -732,8 +732,6 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
>                        struct drm_dp_mst_topology_mgr *mgr,
>                        struct drm_dp_mst_port *port);
>
> -bool drm_dp_mst_port_has_audio(struct drm_dp_mst_topology_mgr *mgr,
> -                                       struct drm_dp_mst_port *port);
>  struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
>
>
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
