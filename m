Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE9B8543E5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AE110E32F;
	Wed, 14 Feb 2024 08:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xZ3uOlr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09C10E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:15:39 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dcd7c526cc0so834025276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 00:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707898538; x=1708503338; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EKXGtE0o7nACfq6pe512roREe48CDHHUhw9NIs9DgqY=;
 b=xZ3uOlr8GM+Qp7uGyglB+XlL4GsUz3k0hefFBVNf/Si73TG8c8MU48EWuNTOUKIl9T
 L44HsKktvM+1/Q3T2lJgL5f0BQx+xT1ukUyXMKDILZbNfGmqiXdOrW+NTJZetfrcV5j7
 P64Rz/Zl8njNpt+vOXJjAQiQgjB/dDukSZdJs2BKeN4J05WutknzjDDYOoylTRhb9qAW
 UlIEK9tuKaBQrt8fo5tKxdUnP6Anrm/XVvOGiXx7EuqchIrKk1Zr756H7H2Sz4/Yl34t
 XgwSYam0kVKuqnDqs4n1KZmanQsup/iifAoPRpeQNx+DckQ4XHtfYBDaxpsTWvOP8wBN
 WY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707898538; x=1708503338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EKXGtE0o7nACfq6pe512roREe48CDHHUhw9NIs9DgqY=;
 b=MyW/YrIx1JBdajmk8MI8BIylW6LGmS7JTEAExqruh0YPZz/r1lxOITk/cc1eMLSurM
 F+97ZfVUgm+K5A1JtmxyJMpE0JT/H568b+bxwizg2cUR3gp6lM1aUe3iNcMB9Duy4yUg
 QT0rhr1Dcx+C0xolaDyoE8si2cWAS9JWNVv75lbMftMABVHYNioZJvJgHNQ20Md5kyIq
 u4mKoOoZfjgbyAcjFQh3lLjPOgSMXqhFL1iCsKIgBGAk3MGNqSvNbxu2U6xq5X+o1ncR
 Ob/I7Fr+4eOyS4VRt0S2lL37KJEUwb6l6x4Gz4q7enHVwHfGnOFHPs10uv8oidmxNkaV
 bFVQ==
X-Gm-Message-State: AOJu0YzQgMEt020CRmVnywGbeZIfhHd6MJxxmyL2CB7jO3nzMfsXmtp1
 KEzEHgQ86+pHjP5UoxP10MFtqjq0pKB8mC4Zb+O968U9QoV8CPBXClx3zES73SrHjyg344SO3dX
 Tdoi3fxsLJcunfwi/xeUJoDOinmvD/SeQ5ytwPQ==
X-Google-Smtp-Source: AGHT+IFI6XgUc51w44SGa4dFJZmddk/Aj01+ufuewKBsrzYVS9b+Kup4A4AKPQTJHjDr+FyB9b7AIUFcQMO+GV9FPR8=
X-Received: by 2002:a5b:dc6:0:b0:dcd:36c1:ecb7 with SMTP id
 t6-20020a5b0dc6000000b00dcd36c1ecb7mr1383363ybr.54.1707898537795; Wed, 14 Feb
 2024 00:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20240213234513.2411604-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240213234513.2411604-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 10:15:27 +0200
Message-ID: <CAA8EJpo0yeLyCkVvLFX7wUEV4+i+ORbaCB2qxN0izaWLdFqCrA@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, robdclark@gmail.com, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, quic_jesszhan@quicinc.com, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Feb 2024 at 01:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
> Lets move this to drm_dp_helper to achieve this.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

My preference would be to have packing functions in
drivers/video/hdmi.c, as we already have
hdmi_audio_infoframe_pack_for_dp() there.

> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 78 +++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c | 73 +----------------------
>  include/drm/display/drm_dp_helper.h     |  3 +
>  3 files changed, 84 insertions(+), 70 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index b1ca3a1100da..066cfbbf7a91 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2916,6 +2916,84 @@ void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
>  }
>  EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>
> +/**
> + * drm_dp_vsc_sdp_pack() - pack a given vsc sdp into generic dp_sdp
> + * @vsc: vsc sdp initialized according to its purpose as defined in
> + *       table 2-118 - table 2-120 in DP 1.4a specification
> + * @sdp: valid handle to the generic dp_sdp which will be packed
> + * @size: valid size of the passed sdp handle
> + *
> + * Returns length of sdp on success and error code on failure
> + */
> +ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
> +                           struct dp_sdp *sdp, size_t size)

I know that you are just moving the function. Maybe there can be
patch#2, which drops the size argument? The struct dp_sdp already has
a defined size. The i915 driver just passes sizeof(sdp), which is more
or less useless.

> +{
> +       size_t length = sizeof(struct dp_sdp);
> +
> +       if (size < length)
> +               return -ENOSPC;
> +
> +       memset(sdp, 0, size);
> +
> +       /*
> +        * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
> +        * VSC SDP Header Bytes
> +        */
> +       sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
> +       sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
> +       sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
> +       sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
> +
> +       if (vsc->revision == 0x6) {
> +               sdp->db[0] = 1;
> +               sdp->db[3] = 1;
> +       }
> +
> +       /*
> +        * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
> +        * Format as per DP 1.4a spec and DP 2.0 respectively.
> +        */
> +       if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
> +               goto out;
> +
> +       /* VSC SDP Payload for DB16 through DB18 */
> +       /* Pixel Encoding and Colorimetry Formats  */
> +       sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
> +       sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
> +
> +       switch (vsc->bpc) {
> +       case 6:
> +               /* 6bpc: 0x0 */
> +               break;
> +       case 8:
> +               sdp->db[17] = 0x1; /* DB17[3:0] */
> +               break;
> +       case 10:
> +               sdp->db[17] = 0x2;
> +               break;
> +       case 12:
> +               sdp->db[17] = 0x3;
> +               break;
> +       case 16:
> +               sdp->db[17] = 0x4;
> +               break;
> +       default:
> +               WARN(1, "Missing case %d\n", vsc->bpc);
> +               return -EINVAL;
> +       }
> +
> +       /* Dynamic Range and Component Bit Depth */
> +       if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
> +               sdp->db[17] |= 0x80;  /* DB17[7] */
> +
> +       /* Content Type */
> +       sdp->db[18] = vsc->content_type & 0x7;
> +
> +out:
> +       return length;
> +}
> +EXPORT_SYMBOL(drm_dp_vsc_sdp_pack);
> +
>  /**
>   * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
>   * @dpcd: DisplayPort configuration data
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index f5ef95da5534..e94db51aeeb7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4110,73 +4110,6 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>         return false;
>  }
>
> -static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
> -                                    struct dp_sdp *sdp, size_t size)
> -{
> -       size_t length = sizeof(struct dp_sdp);
> -
> -       if (size < length)
> -               return -ENOSPC;
> -
> -       memset(sdp, 0, size);
> -
> -       /*
> -        * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
> -        * VSC SDP Header Bytes
> -        */
> -       sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
> -       sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
> -       sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
> -       sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
> -
> -       if (vsc->revision == 0x6) {
> -               sdp->db[0] = 1;
> -               sdp->db[3] = 1;
> -       }
> -
> -       /*
> -        * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
> -        * Format as per DP 1.4a spec and DP 2.0 respectively.
> -        */
> -       if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
> -               goto out;
> -
> -       /* VSC SDP Payload for DB16 through DB18 */
> -       /* Pixel Encoding and Colorimetry Formats  */
> -       sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
> -       sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
> -
> -       switch (vsc->bpc) {
> -       case 6:
> -               /* 6bpc: 0x0 */
> -               break;
> -       case 8:
> -               sdp->db[17] = 0x1; /* DB17[3:0] */
> -               break;
> -       case 10:
> -               sdp->db[17] = 0x2;
> -               break;
> -       case 12:
> -               sdp->db[17] = 0x3;
> -               break;
> -       case 16:
> -               sdp->db[17] = 0x4;
> -               break;
> -       default:
> -               MISSING_CASE(vsc->bpc);
> -               break;
> -       }
> -       /* Dynamic Range and Component Bit Depth */
> -       if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
> -               sdp->db[17] |= 0x80;  /* DB17[7] */
> -
> -       /* Content Type */
> -       sdp->db[18] = vsc->content_type & 0x7;
> -
> -out:
> -       return length;
> -}
> -
>  static ssize_t
>  intel_dp_hdr_metadata_infoframe_sdp_pack(struct drm_i915_private *i915,
>                                          const struct hdmi_drm_infoframe *drm_infoframe,
> @@ -4269,8 +4202,8 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>
>         switch (type) {
>         case DP_SDP_VSC:
> -               len = intel_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
> -                                           sizeof(sdp));
> +               len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
> +                                         sizeof(sdp));
>                 break;
>         case HDMI_PACKET_TYPE_GAMUT_METADATA:
>                 len = intel_dp_hdr_metadata_infoframe_sdp_pack(dev_priv,
> @@ -4297,7 +4230,7 @@ void intel_write_dp_vsc_sdp(struct intel_encoder *encoder,
>         struct dp_sdp sdp = {};
>         ssize_t len;
>
> -       len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
> +       len = drm_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
>
>         if (drm_WARN_ON(&dev_priv->drm, len < 0))
>                 return;
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 863b2e7add29..f8db34a2f7a5 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -813,4 +813,7 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>                        int bpp_x16, unsigned long flags);
>  int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
>
> +ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
> +                           struct dp_sdp *sdp, size_t size);
> +
>  #endif /* _DRM_DP_HELPER_H_ */
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
