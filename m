Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10281601079
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 15:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7B610E076;
	Mon, 17 Oct 2022 13:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F25D10E076
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 13:49:03 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id n7so10839676plp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kdalp8f0L1WyfE8iwsIyZD97N2UyllSuIR0TDYyi5RA=;
 b=ChdqEXysbzPGMXUXcHx9FTSj1SkoY6FSgdidMWv6J8K420r/0/Ni2Sbxa6WADZVUy6
 nkPPuphFbcGfZGUTH+LbU3QWC250aIHpxrorZ9sh5ReSulPSiu2xPotiKC+Mr60Xoyx9
 lTKK3253b96YecknuBE2ABk+NfPN592u0sEnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kdalp8f0L1WyfE8iwsIyZD97N2UyllSuIR0TDYyi5RA=;
 b=H4Y5ViDOsFhqvfjBNdyjM/jkl5VFuBqexmJNf2Yrt7FD67X+TqYSoLqR7VggqXbEj1
 ElT+8bg9sR6UtrSEiuRSzSsPN4kinyTVbzm0F1Qb5M4yK0rChTV2AMDR40YaLXFMZU0a
 bXoU93WUkt4s7CTIzPfi8HlxEc9o65XeOj0ZXrvz5WN2FNphoR6owD5XFmFYtykoDGSQ
 7fiGnzWJKfRFFnxHSzzpw0gynGxCJX3krdq/vD1t8JaXEk2qJaMBtuuu1kG5iThjSw7t
 81jg+aTPms9mtnfzUfQEocm4/U/fZXTHtsEie8AHYnLeZEldkMlVFrwJPnEW/t4TWv96
 fcDg==
X-Gm-Message-State: ACrzQf30n1BdQF69RSvr/BdkMawzvrNuclbs7P80oSc3kFr7DO6BVXfj
 Mti41BxHhoqB6/jRkVs2+0c9D4jP0ZgYABdk74XiFQ==
X-Google-Smtp-Source: AMsMyM5RaU/7tX9JSnbejiUQl8YV/sBu8DEjw4uUYFmmiXkTsmCvZEp/MVFS6CsYgM2Ms8PYDXMSjVdC9eLLpoFPmgk=
X-Received: by 2002:a17:903:22c7:b0:185:b0c:e150 with SMTP id
 y7-20020a17090322c700b001850b0ce150mr12431757plg.138.1666014543010; Mon, 17
 Oct 2022 06:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221012042030.573466-1-hsinyi@chromium.org>
In-Reply-To: <20221012042030.573466-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 17 Oct 2022 21:48:37 +0800
Message-ID: <CAJMQK-i1GFP_5NsH7MLYS17xacrYZf1u6bjVYBkW-qHMbuh2_w@mail.gmail.com>
Subject: Re: [PATCH v2] drm_bridge: register content protect property
To: Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 12, 2022 at 12:20 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Some bridges are able to update HDCP status from userspace request if
> they support HDCP.
>
> HDCP property is the same as other connector properties that need to be
> created after the connecter is initialized and before the connector is
> registered.
>
anx7625 is a user for this.


> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> v2: Fix compile error when config is not set.
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 3 +++
>  include/drm/display/drm_hdcp_helper.h  | 8 ++++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 1c7d936523df5..a3b9ef8dc3f0b 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>
> +#include <drm/display/drm_hdcp_helper.h>
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
> @@ -398,6 +399,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>         if (panel_bridge)
>                 drm_panel_bridge_set_orientation(connector, panel_bridge);
>
> +       drm_connector_attach_content_protection_property(connector, true);
> +
>         return connector;
>  }
>  EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> diff --git a/include/drm/display/drm_hdcp_helper.h b/include/drm/display/drm_hdcp_helper.h
> index 8aaf87bf27351..c65d9f06a2532 100644
> --- a/include/drm/display/drm_hdcp_helper.h
> +++ b/include/drm/display/drm_hdcp_helper.h
> @@ -15,8 +15,16 @@ struct drm_device;
>  struct drm_connector;
>
>  int drm_hdcp_check_ksvs_revoked(struct drm_device *dev, u8 *ksvs, u32 ksv_count);
> +#if defined(CONFIG_DRM_DISPLAY_HDCP_HELPER)
>  int drm_connector_attach_content_protection_property(struct drm_connector *connector,
>                                                      bool hdcp_content_type);
> +#else
> +static inline int drm_connector_attach_content_protection_property(struct drm_connector *connector,
> +                                                                  bool hdcp_content_type)
> +{
> +       return 0;
> +}
> +#endif
>  void drm_hdcp_update_content_protection(struct drm_connector *connector, u64 val);
>
>  #endif
> --
> 2.38.0.rc1.362.ged0d419d3c-goog
>
