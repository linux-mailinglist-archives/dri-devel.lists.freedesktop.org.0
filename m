Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C779478E17C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 23:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28E910E14D;
	Wed, 30 Aug 2023 21:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B9110E163
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 21:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693431140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muYS3JTdtl5ij4HfFLRfXrr71LVNj5k2IECcY5Q/I/Q=;
 b=flHf96J3sra60ZvXhJUTEwd7KQTQqejkkZA4fuJqCTicG4ex4vRowEfo5kqJTR/yAqVSY+
 VWh2HmwEtKNPW3QkMFSRBDWrtLDeYlQY7NfpHKww+ruylDOe38Wbw/phRm2ktxJb8RIuMS
 cDV8ueu0qDO/3lwxdaAxvy+8jmJLcfg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-XoZGwqNPM5CXMnlYhbfcDg-1; Wed, 30 Aug 2023 17:32:19 -0400
X-MC-Unique: XoZGwqNPM5CXMnlYhbfcDg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-76f0b7e3879so21267785a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693431139; x=1694035939;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KDXOTCugmWwzlMtneetPJwGDPlqzAsl8vZFdxtx5l00=;
 b=QEsXxwgy1TMQugpqJ4nK34WZye3pYqxUuYq+h1sFSW3z7g2ZwXO6tZIxmFsq/tNzMm
 5crLuSPC4pN9YPu/wU7TC6zJWteIktUTtp+FiCComj9MayNLjzIYo8XPhH9kh+28PlTq
 lWNWrBP2jUdEcqRDY0sUV8z6lwV+6cetxbCX7ZAFwHAbcNLHdtYOUWiCoyVIL0kM8txW
 nDpZrwnyXDSPzkGbI3Fvz8WIjwu20StoMeWewwCDymgj+K+8bGqu6NoTgDBPb65NUJhK
 YnCrO63RGVpSOHS1WcIDwxfBFUxQyGGrJR3YRljrjuMJ5SXlASZcIGFFFiq8btZoB2lo
 X7Hw==
X-Gm-Message-State: AOJu0YyMliu97Q0rDQEq7H7OqcHv1G7yv4SBW1Ot2CCDfc6AhMFwAnAL
 A7n8AWdLwinpSjcdgOK92bqR0kVwXF6RHh593HjupIwD4Z8mgtTiubWM+C84TLYLhAWxWObJdMr
 fDI9KLFslVtMX0dP2HEWSg4fSb4h/xalsCy9Q
X-Received: by 2002:a05:620a:b04:b0:76c:97a9:8ff0 with SMTP id
 t4-20020a05620a0b0400b0076c97a98ff0mr821853qkg.77.1693431138764; 
 Wed, 30 Aug 2023 14:32:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuj0y2dliYKqj6ukTLeiCw0z5f+0ujpYgtl/Ewjx6vV54tP1wbw65s3GP9+11SUKZzgT5HdA==
X-Received: by 2002:a05:620a:b04:b0:76c:97a9:8ff0 with SMTP id
 t4-20020a05620a0b0400b0076c97a98ff0mr821843qkg.77.1693431138514; 
 Wed, 30 Aug 2023 14:32:18 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00::feb? ([2600:4040:5c7d:5f00::feb])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a05620a145900b007671b599cf5sm29163qkl.40.2023.08.30.14.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 14:32:18 -0700 (PDT)
Message-ID: <56e130b5f3c22790ea54cac7cb7281675290d4a2.camel@redhat.com>
Subject: Re: [PATCH v4 3/6] drm/dp_mst: Add
 drm_dp_set_mst_topology_link_status()
From: Lyude Paul <lyude@redhat.com>
To: Gil Dekel <gildekel@chromium.org>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Wed, 30 Aug 2023 17:32:17 -0400
In-Reply-To: <20230824205335.500163-4-gildekel@chromium.org>
References: <20230824205335.500163-1-gildekel@chromium.org>
 <20230824205335.500163-4-gildekel@chromium.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: seanpaul@chromium.org, navaremanasi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2023-08-24 at 16:50 -0400, Gil Dekel wrote:
> Unlike SST, MST can support multiple displays connected to a single
> connector. However, this also means that if the DisplayPort link to the
> top-level MST branch device becomes unstable, then every single branch
> device has an unstable link.
>=20
> Since there are multiple downstream ports per connector, setting the
> link status of the parent mstb's port to BAD is not enough. All of the
> downstream mstb ports must also have their link status set to BAD.
>=20
> This aligns to how the DP link status logic in DRM works. We notify
> userspace that all of the mstb ports need retraining and apply new lower
> bandwidth constraints to all future atomic commits on the topology that
> follow.
>=20
> Since any driver supporting MST needs to figure out which connectors
> live downstream on an MST topology and update their link status in order
> to retrain MST links properly, we add the
> drm_dp_set_mst_topology_link_status() helper. This helper simply marks
> the link status of all connectors living in that topology as bad. We
> will make use of this helper in i915 later in this series.
>=20
> Credit: this patch is a refactor of Lyude Pual's original patch:
> https://patchwork.kernel.org/project/dri-devel/patch/20180308232421.14049=
-5-lyude@redhat.com/

s/Pual/Paul/ (probably want to fix this on the other patches in the series =
as
well)

>=20
> Signed-off-by: Gil Dekel <gildekel@chromium.org>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 +++++++++++++++++++
>  include/drm/display/drm_dp_mst_helper.h       |  3 ++
>  2 files changed, 42 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index ed96cfcfa304..17cbadfb6ccb 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3566,6 +3566,45 @@ int drm_dp_get_vc_payload_bw(const struct drm_dp_m=
st_topology_mgr *mgr,
>  }
>  EXPORT_SYMBOL(drm_dp_get_vc_payload_bw);
>=20
> +/**
> + * drm_dp_set_mst_topology_link_status() - set all downstream MST ports'=
 link status
> + * @mgr: MST topology manager to set state for
> + * @status: The new status to set the MST topology to
> + *
> + * Set all downstream ports' link-status within the topology to the give=
n status.
> + */
> +void drm_dp_set_mst_topology_link_status(struct drm_dp_mst_topology_mgr =
*mgr,
> +=09=09=09=09=09 enum drm_link_status status)
> +{
> +=09struct drm_dp_mst_port *port;
> +=09struct drm_dp_mst_branch *rmstb;
> +=09struct drm_dp_mst_branch *mstb =3D
> +=09=09drm_dp_mst_topology_get_mstb_validated(mgr, mgr->mst_primary);
> +
> +=09list_for_each_entry_reverse(port, &mstb->ports, next) {
> +=09=09struct drm_connector *connector =3D port->connector;
> +
> +=09=09if (connector) {
> +=09=09=09mutex_lock(&connector->dev->mode_config.mutex);
> +=09=09=09drm_dbg_kms(
> +=09=09=09=09connector->dev,
> +=09=09=09=09"[MST-CONNECTOR:%d:%s] link status %d -> %d\n",
> +=09=09=09=09connector->base.id, connector->name,
> +=09=09=09=09connector->state->link_status, status);
> +=09=09=09connector->state->link_status =3D status;
> +=09=09=09mutex_unlock(&connector->dev->mode_config.mutex);
> +=09=09}
> +
> +=09=09rmstb =3D drm_dp_mst_topology_get_mstb_validated(mstb->mgr,
> +=09=09=09=09=09=09=09       port->mstb);
> +=09=09if (rmstb) {
> +=09=09=09drm_dp_set_mst_topology_link_status(rmstb->mgr, status);
> +=09=09=09drm_dp_mst_topology_put_mstb(rmstb);
> +=09=09}
> +=09}
> +}
> +EXPORT_SYMBOL(drm_dp_set_mst_topology_link_status);
> +
>  /**
>   * drm_dp_read_mst_cap() - check whether or not a sink supports MST
>   * @aux: The DP AUX channel to use
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/displa=
y/drm_dp_mst_helper.h
> index ed5c9660563c..855d488bf364 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -832,6 +832,9 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector=
 *connector,
>  int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09     int link_rate, int link_lane_count);
>=20
> +void drm_dp_set_mst_topology_link_status(struct drm_dp_mst_topology_mgr =
*mgr,
> +=09=09=09=09=09 enum drm_link_status status);
> +
>  int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
>=20
>  void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state=
, uint8_t link_encoding_cap);
> --
> Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

