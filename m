Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3CC24230A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 02:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F2D6E875;
	Wed, 12 Aug 2020 00:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45C76E873;
 Wed, 12 Aug 2020 00:13:46 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id x10so381244ybj.13;
 Tue, 11 Aug 2020 17:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ebsHfoPVNGyXMrTkuHjA53YYYGdAsPwpEIUxxBmOE5U=;
 b=KMwbVIHY6RQinyFbgj+S+JbWFu5Hz8CkOf0IpHfoV7byPdoFpi7iyd+3RPzPeint2A
 cdWYuHUf3IBLzJ1+gxBKQ0QaEjSmhuwvJubViwJbC8aHG9KVs+7hE2eJBXwJfoK6ctrk
 QfqFl6WlQouM4UrZO3UMwmYQ5f1Y2ROUbSr4izzpN5hhsHOFcLuHfdELWXTyn/FbBkq0
 kyVJzp63jXUBGbXLlBCCrvKHlfmIvnygJD2W+EhiBwCF255rr/WIN89NbJcClnEOaTKo
 wMcRgwscBPXLkoQjgOmYPFCBhRWYXYkEh5DMd6sMg/QqSVnF/v97S4UxE8tLsxf1Y0np
 50QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ebsHfoPVNGyXMrTkuHjA53YYYGdAsPwpEIUxxBmOE5U=;
 b=GNckjZbhyrCKvZx9ems4tTpIpttlcLX0/JaxB+o7yAodvqX9IDMEhZfq7AHfWzd8fP
 7202THlZPPVhKDMDBC/Z4x+IxKnZ6hMKOkTKpISmfDc0cvUe1jT7gxx4/aENCqpUMUNy
 5kMEQwryhMtOEfdwMsJoJtzctIq09Ts6/66axnB6sV3rMfyUl78DkjmHfwFxMYQkAE+/
 uMg0bQRfYQUDw0IKcBUySpC1adpnj/vViXNReCHOcyHpnGAi9xN8UEI8VrKMM8Q7URiB
 fvlFwEuxQKeGRgT7UlmgffzHLZ6rG6qH1PIvtoX40xQAUz/dILfTdlqbYAFrRFPvrEv1
 +A4Q==
X-Gm-Message-State: AOAM5322Sx0dWlj3wlnRAGNv+dlSMvHdJ8+na3ow2MNfQ0Jmfe82Q0SD
 tR+X7a+HzxFg99CEORLlpGBQCmTcp7QpokyGNQhtiFWt
X-Google-Smtp-Source: ABdhPJxe0XSsaIztI9QzAt/GPKTs1l02Z9HdJLOKtL/GZEPcf7TDtTfw3LMoiyCjQpm57qHO7bNIU364fDuWX15ZTYE=
X-Received: by 2002:a25:cbc5:: with SMTP id
 b188mr48035429ybg.268.1597191226039; 
 Tue, 11 Aug 2020 17:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-18-lyude@redhat.com>
In-Reply-To: <20200811200457.134743-18-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 12 Aug 2020 10:13:34 +1000
Message-ID: <CACAvsv40EOqf9pB16vPrRySm3BRP61ZeD09PDNKDWOuy_sCfmQ@mail.gmail.com>
Subject: Re: [RFC 17/20] drm/nouveau/kms/nv50-: Add support for DP_SINK_COUNT
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Aug 2020 at 06:06, Lyude Paul <lyude@redhat.com> wrote:
>
> This is another bit that we never implemented for nouveau: dongle
> detection. When a "dongle", e.g. an active display adaptor, is hooked up
> to the system and causes an HPD to be fired, we don't actually know
> whether or not there's anything plugged into the dongle without checking
> the sink count. As a result, plugging in a dongle without anything
> plugged into it currently results in a bogus EDID retrieval error in the kernel log.
>
> Additionally, most dongles won't send another long HPD signal if the
> user suddenly plugs something in, they'll only send a short HPD IRQ with
> the expectation that the source will check the sink count and reprobe
> the connector if it's changed - something we don't actually do. As a
> result, nothing will happen if the user plugs the dongle in before
> plugging something into the dongle.
>
> So, let's fix this by checking the sink count in both
> nouveau_dp_probe_dpcd() and nouveau_dp_irq(), and reprobing the
> connector if things change.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c      | 54 ++++++++++++++++++++---
>  drivers/gpu/drm/nouveau/nouveau_encoder.h |  2 +
>  2 files changed, 51 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index f6950a62138ca..f41fa513023fd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -36,12 +36,22 @@ MODULE_PARM_DESC(mst, "Enable DisplayPort multi-stream (default: enabled)");
>  static int nouveau_mst = 1;
>  module_param_named(mst, nouveau_mst, int, 0400);
>
> +static bool
> +nouveau_dp_has_sink_count(struct drm_connector *connector,
> +                         struct nouveau_encoder *outp)
> +{
> +       return drm_dp_has_sink_count(connector, outp->dp.dpcd,
> +                                    &outp->dp.desc);
> +}
> +
>  static enum drm_connector_status
>  nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>                       struct nouveau_encoder *outp)
>  {
> +       struct drm_connector *connector = &nv_connector->base;
>         struct drm_dp_aux *aux = &nv_connector->aux;
>         struct nv50_mstm *mstm = NULL;
> +       enum drm_connector_status status = connector_status_disconnected;
>         int ret;
>         u8 *dpcd = outp->dp.dpcd;
>
> @@ -50,9 +60,9 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>                 ret = drm_dp_read_desc(aux, &outp->dp.desc,
>                                        drm_dp_is_branch(dpcd));
>                 if (ret < 0)
> -                       return connector_status_disconnected;
> +                       goto out;
>         } else {
> -               return connector_status_disconnected;
> +               goto out;
>         }
>
>         if (nouveau_mst) {
> @@ -61,12 +71,33 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>                         mstm->can_mst = drm_dp_has_mst(aux, dpcd);
>         }
>
> +       if (nouveau_dp_has_sink_count(connector, outp)) {
> +               ret = drm_dp_get_sink_count(aux);
> +               if (ret < 0)
> +                       goto out;
> +
> +               outp->dp.sink_count = ret;
> +
> +               /*
> +                * Dongle connected, but no display. Don't bother reading
> +                * downstream port info
> +                */
> +               if (!outp->dp.sink_count)
> +                       return connector_status_disconnected;
> +       }
> +
>         ret = drm_dp_downstream_read_info(aux, dpcd,
>                                           outp->dp.downstream_ports);
>         if (ret < 0)
> -               return connector_status_disconnected;
> +               goto out;
>
> -       return connector_status_connected;
> +       status = connector_status_connected;
> +out:
> +       if (status != connector_status_connected) {
> +               /* Clear any cached info */
> +               outp->dp.sink_count = 0;
> +       }
> +       return status;
>  }
>
>  int
> @@ -161,6 +192,8 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
>         struct drm_connector *connector = &nv_connector->base;
>         struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
>         struct nv50_mstm *mstm;
> +       int ret;
> +       bool send_hpd = false;
>
>         if (!outp)
>                 return;
> @@ -172,12 +205,23 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
>
>         if (mstm && mstm->is_mst) {
>                 if (!nv50_mstm_service(drm, nv_connector, mstm))
> -                       nouveau_connector_hpd(connector);
> +                       send_hpd = true;
>         } else {
>                 drm_dp_cec_irq(&nv_connector->aux);
> +
> +               if (nouveau_dp_has_sink_count(connector, outp)) {
> +                       ret = drm_dp_get_sink_count(&nv_connector->aux);
> +                       if (ret != outp->dp.sink_count)
> +                               send_hpd = true;
> +                       if (ret >= 0)
> +                               outp->dp.sink_count = ret;
> +               }
>         }
>
>         mutex_unlock(&outp->dp.hpd_irq_lock);
> +
> +       if (send_hpd)
> +               nouveau_connector_hpd(connector);
>  }
>
>  /* TODO:
> diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
> index c1924a4529a7b..21937f1c7dd90 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
> @@ -74,6 +74,8 @@ struct nouveau_encoder {
>                         u8 dpcd[DP_RECEIVER_CAP_SIZE];
>                         u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
>                         struct drm_dp_desc desc;
> +
> +                       u8 sink_count;
>                 } dp;
>         };
>
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
