Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3676A34E641
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 13:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E4E6E8B1;
	Tue, 30 Mar 2021 11:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027AC6E8AC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 11:19:42 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id s11so5870483pfm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nEiq5VYqidlia0rfaVKXey2aQI1J0UOeUfwbZ7SzFqw=;
 b=qIay2yJaGw8H+hG15KImlYeu0r6L9MLLcQDEnZF2qFdTW2zSpQ40IXg+/vxlnJQz4o
 TKzi5YqlKrIHttRWaLvFbdM20gKQ/igZVcwm8SFzdsf0/GzVTOyvvDeB6kqpBolWhn33
 iI+TCXiaVJhMe/oW7DCLEON36LzdAAwFwyEShryYOFQyky1isZ0YY5RVfN5W3oiAYvwy
 8+KnWX/nQwEbJaqACWTSuM18VOAT1ks9X9zr7SchWYDgwTLwBD/knap1CJ7Ca9tlGG8b
 sFpNlx44sNZxtyb4faahEv9qJLV1qWz1e1po03itPLigsO5ao0DVK7AqSPfVLMue7R6H
 nwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nEiq5VYqidlia0rfaVKXey2aQI1J0UOeUfwbZ7SzFqw=;
 b=RmmYewwbH4psKYpbenjJmBG0UJ3cP7pWPxoSpuYLY3CSsLvYT0o1p8lZwvP5T87yAl
 t9Ie3uEymwweW0jpZjomHG6K5dxLIXtc/VoMOOVHw2c5XSmXV9Wqeg+l4ZEKjzB1d33Z
 UB9/bzmoRsKmUv5lcAEIY6sRuElzVlmJy5TDt2e8Lw/t3zA8Fxc7vcevVPFUYBZVCmsj
 GWvxyf4yYdPAv4lb7R3urcG9h/pb74tvqrLMlyc8S6m75dELfgANdqGbgyUIyFKCPfxc
 A1q6qd4DQiIcnE2hJxNTGkziD52OoVsrZ2VPLaqQcfR96e5ZrEw6KiALhYjaE1/YFHV3
 h1Eg==
X-Gm-Message-State: AOAM530qZBWnTbPJXGrmihFuzu76v5yvzg3WiMSJF4vQYHgu0JWd4M/y
 dH6mxpLEhdh2ZNNLEKErPE+biH8cRXCl9tPH7G//DA==
X-Google-Smtp-Source: ABdhPJxq5q/aaT+6jdvgQQdbDwMNlvYfZjAmKD/2J/yR3c6DqBDMvry2T/Awy6EWGZ+THIsQHdyfhPbS801PyKVA3nE=
X-Received: by 2002:a05:6a00:b54:b029:207:2a04:7b05 with SMTP id
 p20-20020a056a000b54b02902072a047b05mr29651828pfo.12.1617103182535; Tue, 30
 Mar 2021 04:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210326203807.105754-1-lyude@redhat.com>
 <20210326203807.105754-21-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-21-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 30 Mar 2021 13:19:31 +0200
Message-ID: <CAG3jFyvEvb=YWopYUmi1bf=fe3ZX7VmtvnnmT5dHcNjLhHvsQg@mail.gmail.com>
Subject: Re: [PATCH v2 20/20] drm/dp_mst: Convert drm_dp_mst_topology.c to
 drm_err()/drm_dbg*()
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Lyude,

This patch looks good, but I have one question below. With it
addressed, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

>
> -static bool drm_dp_sideband_parse_req(struct drm_dp_sideband_msg_rx *raw,
> +static bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
> +                                     struct drm_dp_sideband_msg_rx *raw,
>                                       struct drm_dp_sideband_msg_req_body *msg)
>  {
>         memset(msg, 0, sizeof(*msg));
> @@ -1117,12 +1125,12 @@ static bool drm_dp_sideband_parse_req(struct drm_dp_sideband_msg_rx *raw,
>
>         switch (msg->req_type) {
>         case DP_CONNECTION_STATUS_NOTIFY:
> -               return drm_dp_sideband_parse_connection_status_notify(raw, msg);
> +               return drm_dp_sideband_parse_connection_status_notify(mgr, raw, msg);
>         case DP_RESOURCE_STATUS_NOTIFY:
> -               return drm_dp_sideband_parse_resource_status_notify(raw, msg);
> +               return drm_dp_sideband_parse_resource_status_notify(mgr, raw, msg);
>         default:
> -               DRM_ERROR("Got unknown request 0x%02x (%s)\n", msg->req_type,
> -                         drm_dp_mst_req_type_str(msg->req_type));
> +               drm_err(mgr->dev, "Got unknown request 0x%02x (%s)\n",
> +                       msg->req_type, drm_dp_mst_req_type_str(msg->req_type));
>                 return false;
>         }
>  }
>

.. snip ..

> @@ -4118,12 +4121,12 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
>
>         INIT_LIST_HEAD(&up_req->next);
>
> -       drm_dp_sideband_parse_req(&mgr->up_req_recv, &up_req->msg);
> +       drm_dp_sideband_parse_req(mgr, &mgr->up_req_recv, &up_req->msg);

drm_dp_sideband_parse_req() is only called here, and the function
arguments could probably stand to have `&mgr->up_req_recv` removed
(here and in the func. declaration) since the same data structure is
accessible through the `mgr` pointer inside of
drm_dp_sideband_parse_req(). I guess this is a matter of taste, so
feel free to do what you want with this.

>
>         if (up_req->msg.req_type != DP_CONNECTION_STATUS_NOTIFY &&
>             up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY) {
> -               DRM_DEBUG_KMS("Received unknown up req type, ignoring: %x\n",
> -                             up_req->msg.req_type);
> +               drm_dbg_kms(mgr->dev, "Received unknown up req type, ignoring: %x\n",
> +                           up_req->msg.req_type);
>                 kfree(up_req);
>                 goto out;
>         }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
