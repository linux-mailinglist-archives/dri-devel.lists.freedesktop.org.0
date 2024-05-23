Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ECC8CD121
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 13:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD75E10E079;
	Thu, 23 May 2024 11:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EPjkbOWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875AB10E079
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 11:20:45 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2bd9284dd31so1798024a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 04:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716463245; x=1717068045; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mVKrWD1+hs54Ysm29wmclGMln507I8zNnZdMjqmgtmU=;
 b=EPjkbOWCB//oCTmsqYMoFuPEjTnFKZXb5qE0bsisVoQqik7Yt3ZGT1lsFV9i1sb+/G
 TavnUXxhKKM3SFJl/UC66OvC5l4x5akNFqwMSdDbKDGHIO+uPOJ4NWMejrVlIIJGiRdF
 GAYEE8KXdGgXGh8WWWYDE4Tgmrn3OlI7aQg+uK4nCXi6iHuUl+fm1LUbMb5ndKciJAcP
 K2zhn3XiTxzXphnMQ9HJOhhP6r5QOeO6ZvAmY6dA2Jow4KQ330fZgnGf+rd+3lKPdZlY
 XwvLKzhcsvxlF8qzclVdtkp11zZ7es045kqdQzJIwnzITEutCAVvQEjNWRhhvzjC8wHK
 b0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716463245; x=1717068045;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mVKrWD1+hs54Ysm29wmclGMln507I8zNnZdMjqmgtmU=;
 b=MlhkDpx0UyfKB8ANECW82OVPq/U21br8bggDaC6PRyWUTpmlNyzEvEjF25IGEU3TVF
 Z7ir0mGUgS8i8eiOc/J8EF1+Gh6YlIPIwfuc45K68oo/UhtataykmQNC4IMxLQrCG9zs
 sPl14pmCrqhfcwlBYxMQPtC0Kh/n9MHV2yCAbnwywcJECrH89m0G34ULQ6Rt7fRhj0pk
 HBgBUweuJMi3PfM+AJlInBbd8I1w5U5OG2hk9xYwytnTyquKrcH+yBqIIBNZp/BxCGsC
 R1WApFgDPYl6SPry2wVyJdOS2jngVbSjhx+Wgr9UZgI6dtB3jfl8dH2PQTW+tR3sEtfi
 n6mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZuotVZf8WGz8pYyd754Ach/0O+eX3lSMunt1MpHb+MLScEzLUVDlmT/RkL/qwXRR2MNbO6sQFCYBpS1gG2FFk0MojXt/YSzWK4wFvCy1x
X-Gm-Message-State: AOJu0YwZrIlS9FcWig3dDusNCFGOzHHwWYvqaqo3zDLuVyW6B+143gyQ
 LGBbSdnszm0QbzedHTmTvOiI2ARFUNGWm/H0/D+Y1OP+yKKkXzF9FvkinZV53/XVl7l6SezX4HR
 7tKeDcA0Gc7b9K3/uJCduj1XN8/c=
X-Google-Smtp-Source: AGHT+IGmRNgsC3Uu0Fv9bEsWqLDN0AjJMJ2TjfW5eO6n+9BO10gRLroJHtMsHfZ2mVxNWYdjKdOkzA+/IGb6/KZR3b0=
X-Received: by 2002:a17:90a:2dcb:b0:2ae:78cd:59fe with SMTP id
 98e67ed59e1d1-2bd9f5a1821mr4938555a91.31.1716463244826; Thu, 23 May 2024
 04:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-19-51950db4fedb@kernel.org>
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-19-51950db4fedb@kernel.org>
From: Luc Ma <onion0709@gmail.com>
Date: Thu, 23 May 2024 19:20:33 +0800
Message-ID: <CAB3Z9RLJT9gJk3HCsHOXsQ0PhUT_TrKkOOcw4X43Ktd_WJSgaw@mail.gmail.com>
Subject: Re: [PATCH v14 19/28] drm/connector: hdmi: Add RGB Quantization Range
 to the connector state
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/alternative; boundary="000000000000fa606f06191d3d96"
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

--000000000000fa606f06191d3d96
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 21 May 2024 at 18:52, Maxime Ripard <mripard@kernel.org> wrote:
>
> HDMI controller drivers will need to figure out the RGB range they need
> to configure based on a mode and property values. Let's expose that in
> the HDMI connector state so drivers can just use that value.
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 29
+++++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                    |  1 +
>  include/drm/drm_connector.h                     |  6 +++++
>  3 files changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 888fe1fe9594..6d30c47fca65 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -49,10 +49,37 @@ connector_state_get_mode(const struct
drm_connector_state *conn_state)
>                 return NULL;
>
>         return &crtc_state->mode;
>  }
>
> +static bool hdmi_is_limited_range(const struct drm_connector *connector,
> +                                 const struct drm_connector_state
*conn_state)
> +{
> +       const struct drm_display_info *info = &connector->display_info;
> +       const struct drm_display_mode *mode =
> +               connector_state_get_mode(conn_state);
> +
> +       /*
> +        * The Broadcast RGB property only applies to RGB format, and
> +        * i915 just assumes limited range for YCbCr output, so let's
> +        * just do the same.
> +        */
> +       if (conn_state->hdmi.output_format != HDMI_COLORSPACE_RGB)
> +               return true;
> +
> +       if (conn_state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_FULL)
> +               return false;
> +
> +       if (conn_state->hdmi.broadcast_rgb ==
DRM_HDMI_BROADCAST_RGB_LIMITED)
> +               return true;
> +
> +       if (!info->is_hdmi)
> +               return false;
> +
> +       return drm_default_rgb_quant_range(mode) ==
HDMI_QUANTIZATION_RANGE_LIMITED;
> +}
> +
>  static bool
>  sink_supports_format_bpc(const struct drm_connector *connector,
>                          const struct drm_display_info *info,
>                          const struct drm_display_mode *mode,
>                          unsigned int format, unsigned int bpc)
> @@ -315,10 +342,12 @@ int drm_atomic_helper_connector_hdmi_check(struct
drm_connector *connector,
>                 drm_atomic_get_new_connector_state(state, connector);
>         const struct drm_display_mode *mode =
>                 connector_state_get_mode(new_conn_state);
>         int ret;
>
> +       new_conn_state->hdmi.is_limited_range =
hdmi_is_limited_range(connector, new_conn_state);
> +
>         ret = hdmi_compute_config(connector, new_conn_state, mode);
>         if (ret)
>                 return ret;
>
>         if (old_conn_state->hdmi.broadcast_rgb !=
new_conn_state->hdmi.broadcast_rgb ||
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 3e57d98d8418..07b4b394e3bf 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1145,10 +1145,11 @@ static void
drm_atomic_connector_print_state(struct drm_printer *p,
>
>         if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
>             connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
>                 drm_printf(p, "\tbroadcast_rgb=%s\n",
>
 drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
> +               drm_printf(p, "\tis_limited_range=%c\n",
state->hdmi.is_limited_range ? 'y' : 'n');
>                 drm_printf(p, "\toutput_bpc=%u\n",
state->hdmi.output_bpc);
>                 drm_printf(p, "\toutput_format=%s\n",
>
 drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
>                 drm_printf(p, "\ttmds_char_rate=%llu\n",
state->hdmi.tmds_char_rate);
>         }
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index a40eaf3a8ce4..1fca26d51218 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1068,10 +1068,16 @@ struct drm_connector_state {
>                  * @broadcast_rgb: Connector property to pass the
>                  * Broadcast RGB selection value.
>                  */
>                 enum drm_hdmi_broadcast_rgb broadcast_rgb;
>
> +               /**
> +                * @is_full_range: Is the output supposed to use a full

s/full/limited/g ?

> +                * RGB Quantization Range or not?
> +                */
> +               bool is_limited_range;
> +
>                 /**
>                  * @output_bpc: Bits per color channel to output.
>                  */
>                 unsigned int output_bpc;
>
>
> --
> 2.45.0
>


-- 
Luc

--000000000000fa606f06191d3d96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<br><br>On Tue, 21 May 2024 at 18:52, Maxime Ripa=
rd &lt;<a href=3D"mailto:mripard@kernel.org">mripard@kernel.org</a>&gt; wro=
te:<br>&gt;<br>&gt; HDMI controller drivers will need to figure out the RGB=
 range they need<br>&gt; to configure based on a mode and property values. =
Let&#39;s expose that in<br>&gt; the HDMI connector state so drivers can ju=
st use that value.<br>&gt;<br>&gt; Reviewed-by: Dave Stevenson &lt;<a href=
=3D"mailto:dave.stevenson@raspberrypi.com">dave.stevenson@raspberrypi.com</=
a>&gt;<br>&gt; Signed-off-by: Maxime Ripard &lt;<a href=3D"mailto:mripard@k=
ernel.org">mripard@kernel.org</a>&gt;<br>&gt; ---<br>&gt; =C2=A0drivers/gpu=
/drm/display/drm_hdmi_state_helper.c | 29 +++++++++++++++++++++++++<br>&gt;=
 =C2=A0drivers/gpu/drm/drm_atomic.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>&gt; =C2=A0include/drm/drm_co=
nnector.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A06 +++++<br>&gt; =C2=A03 files changed, 36 insertions(+)<br>&=
gt;<br>&gt; diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/=
drivers/gpu/drm/display/drm_hdmi_state_helper.c<br>&gt; index 888fe1fe9594.=
.6d30c47fca65 100644<br>&gt; --- a/drivers/gpu/drm/display/drm_hdmi_state_h=
elper.c<br>&gt; +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c<br>&g=
t; @@ -49,10 +49,37 @@ connector_state_get_mode(const struct drm_connector_=
state *conn_state)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return NULL;<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &am=
p;crtc_state-&gt;mode;<br>&gt; =C2=A0}<br>&gt;<br>&gt; +static bool hdmi_is=
_limited_range(const struct drm_connector *connector,<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct drm_connector_state *conn_state)<b=
r>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 const struct drm_display_info *inf=
o =3D &amp;connector-&gt;display_info;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 const=
 struct drm_display_mode *mode =3D<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 connector_state_get_mode(conn_state);<br>&gt; +<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* The Broa=
dcast RGB property only applies to RGB format, and<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0* i915 just assumes limited range for YCbCr output, so let&#39=
;s<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* just do the same.<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (conn_state-&g=
t;hdmi.output_format !=3D HDMI_COLORSPACE_RGB)<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>&gt; +<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 if (conn_state-&gt;hdmi.broadcast_rgb =3D=3D DRM_HDMI_BROADCAST_=
RGB_FULL)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 false;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (conn_state-&gt;hdmi.br=
oadcast_rgb =3D=3D DRM_HDMI_BROADCAST_RGB_LIMITED)<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>&gt; +<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 if (!info-&gt;is_hdmi)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return false;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0=
 return drm_default_rgb_quant_range(mode) =3D=3D HDMI_QUANTIZATION_RANGE_LI=
MITED;<br>&gt; +}<br>&gt; +<br>&gt; =C2=A0static bool<br>&gt; =C2=A0sink_su=
pports_format_bpc(const struct drm_connector *connector,<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const struct drm_display_info *info,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const str=
uct drm_display_mode *mode,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int format, un=
signed int bpc)<br>&gt; @@ -315,10 +342,12 @@ int drm_atomic_helper_connect=
or_hdmi_check(struct drm_connector *connector,<br>&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_atomic_get_new_connector_state(stat=
e, connector);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct drm_display=
_mode *mode =3D<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 connector_state_get_mode(new_conn_state);<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int ret;<br>&gt;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 new_conn_state-&=
gt;hdmi.is_limited_range =3D hdmi_is_limited_range(connector, new_conn_stat=
e);<br>&gt; +<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D hdmi_compute_conf=
ig(connector, new_conn_state, mode);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (ret)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn ret;<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (old_conn_state-&gt;=
hdmi.broadcast_rgb !=3D new_conn_state-&gt;hdmi.broadcast_rgb ||<br>&gt; di=
ff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c<br>&=
gt; index 3e57d98d8418..07b4b394e3bf 100644<br>&gt; --- a/drivers/gpu/drm/d=
rm_atomic.c<br>&gt; +++ b/drivers/gpu/drm/drm_atomic.c<br>&gt; @@ -1145,10 =
+1145,11 @@ static void drm_atomic_connector_print_state(struct drm_printer=
 *p,<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (connector-&gt;connecto=
r_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 connector-&gt;connector_type =3D=3D DRM_MODE_CONNECTOR_HD=
MIB) {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_=
printf(p, &quot;\tbroadcast_rgb=3D%s\n&quot;,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0drm_hdmi_connector_get_broadcast_rgb_name(state-&gt;hdmi.broadcast_rgb))=
;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_printf(p, =
&quot;\tis_limited_range=3D%c\n&quot;, state-&gt;hdmi.is_limited_range ? &#=
39;y&#39; : &#39;n&#39;);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 drm_printf(p, &quot;\toutput_bpc=3D%u\n&quot;, state-&gt;hdm=
i.output_bpc);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 drm_printf(p, &quot;\toutput_format=3D%s\n&quot;,<br>&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_hdmi_connector_get_output_format_name(state-&gt;hdmi.output_f=
ormat));<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dr=
m_printf(p, &quot;\ttmds_char_rate=3D%llu\n&quot;, state-&gt;hdmi.tmds_char=
_rate);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; diff --git a/include/=
drm/drm_connector.h b/include/drm/drm_connector.h<br>&gt; index a40eaf3a8ce=
4..1fca26d51218 100644<br>&gt; --- a/include/drm/drm_connector.h<br>&gt; ++=
+ b/include/drm/drm_connector.h<br>&gt; @@ -1068,10 +1068,16 @@ struct drm_=
connector_state {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0* @broadcast_rgb: Connector property to pass the<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Broadcast RGB =
selection value.<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*/<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 enum drm_hdmi_broadcast_rgb broadcast_rgb;<br>&gt;<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* @is_full_range: Is the output suppo=
sed to use a full<div><br></div><div>s/full/limited/g ?</div><div><br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* RGB Quantization=
 Range or not?<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is=
_limited_range;<br>&gt; +<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /**<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0* @output_bpc: Bits per color channel to output.<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int output_bp=
c;<br>&gt;<br>&gt;<br>&gt; --<br>&gt; 2.45.0<br>&gt;<br><br><br>-- <br>Luc<=
/div></div>

--000000000000fa606f06191d3d96--
