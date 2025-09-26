Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E874BA33F0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A308F10EA10;
	Fri, 26 Sep 2025 09:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="E6ExbpZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94CB10E3C9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:52:45 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1FC8F3FCFE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1758880363;
 bh=KjxkHtlh8gdhXK0J3a2nTcQMmVYIomCeNsXStovmAzs=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=E6ExbpZoCAVe+qocl5QkmKdOno4KQ5PJdM+E6SrduuQ3UmydUf07dsRD714B+hTeP
 pzQ45E8ry8VPy/h9HODRpYOnJ2B2S/GkQHstn42pwgfKZplWJRaJIbPNUWKoodh7Qr
 KDtpDoiZZoApzunROgGRy5KXy4dIFQygxxdX++iFmIzWq+FUv/AmknWxJhDwigc9oX
 hZjfgxBkn6y1Ox2wqSiwrr3cnhZ+Ah+NqMB4PVYwWRSO5Totpr4pjCwgVCXwb09zmD
 x8Ybdy5sffOC97JATJ99n73Wwup7lcvqu6zIN/ZWJRJrgb+DRzkvRpO9eefWXkd9qT
 chXS56qoEuZPw==
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2699ed6d43dso21806765ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 02:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758880362; x=1759485162;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjxkHtlh8gdhXK0J3a2nTcQMmVYIomCeNsXStovmAzs=;
 b=Ay8j0jMQMntzHlp44WRntEI4c/2KWAjz8PbrzFsuhwIGVyNyVeUzBG6R1oQeSCdQTk
 mWYcdTw/5riNbM1hlLUUSZQErnjLaHd0dzRiUb29f5e69jfXDMekn/5IhRhFvdanA+CI
 53tpp0mmwlHrQclQf4NAfcsIr5FLb5Lrpx2Ftc2o/lJaOa99siHXOYUvebVryP3zkilP
 9bwIvkfiEsSibTegdwczFCsBdKFQgI/P7SXDdEIcz1TceFXesDeUJPRJGlq25stO7BYa
 dpMHWoRWhLgZKElyXwkoNdvyfRK3RZcuxIc9PqgNrnpN/V8W997LsWO/cCCXfaLOAxX1
 oyZQ==
X-Gm-Message-State: AOJu0YxcqiLmChtptl4N/YfuuFjnFkCR2Uv//Gx+wzqHHUucGwpTKeeC
 4BVEWsnGA7IKP9RUb5/dzZLB3hnAribzV2ml+kBVLJr/EB6Qv0MWuBOpf50zP6qwGGJL0FrXpwm
 t66ZFu9LwW1UsaC9Yky049e2g7LIUXi7RR5WCUIYWDCPDg1VBA8ynzl9UYzkFarQ8IYnM7AuYYH
 Nb7ofbXRZUenYQGN3KuaB5mcSTlfa3PfMAanV6ZPM78mffyXiuPRv0q9fvsbku
X-Gm-Gg: ASbGncvF9s8q9WWuGknl2lx+Qym+OaN0dX77TXB0m9kWW06RyS3bsH42pK5gBwx2BtP
 tAOju9q6FvLYt3Rk5l0ZBoTV2acC6J8R5Q8ZCKIlu9uPS1U5LWQwhd7YaBqLpWtlgbu88GrStQD
 jT2S/wOXPTRWNI4N+WR4OJ
X-Received: by 2002:a17:90b:4d06:b0:32e:749d:fcb7 with SMTP id
 98e67ed59e1d1-3342a259dc1mr6033333a91.13.1758880361600; 
 Fri, 26 Sep 2025 02:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG19X6EA1H4jTvN4dWxU7JwY59cVgbi9j3iHNtYFvs9tRTwaozQ+7e2npfpIa6NgiwV+5bpU1kR4Blrn0wvi64=
X-Received: by 2002:a17:90b:4d06:b0:32e:749d:fcb7 with SMTP id
 98e67ed59e1d1-3342a259dc1mr6033303a91.13.1758880361055; Fri, 26 Sep 2025
 02:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250926085401.2808634-1-aaron.ma@canonical.com>
 <20250926085401.2808634-2-aaron.ma@canonical.com>
 <DM3PPF208195D8DD3E38CF770DE7A86EFB9E31EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DD3E38CF770DE7A86EFB9E31EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Fri, 26 Sep 2025 17:52:30 +0800
X-Gm-Features: AS18NWC6usbrrUqzksFFGYtVP1qOZ-zX_mvOsIOG8F6S9mHmeRBbjWjSAl71ZfE
Message-ID: <CAJ6xRxU1B0wh9eNO8x62+HH_SS_H-eR-Sco9cAeH9fKrTQ+kMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915/backlight: Add get brightness support of
 DPCD via AUX
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Deak, Imre" <imre.deak@intel.com>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 26, 2025 at 5:26=E2=80=AFPM Kandpal, Suraj <suraj.kandpal@intel=
.com> wrote:
>
> > Subject: [PATCH 2/2] drm/i915/backlight: Add get brightness support of =
DPCD
> > via AUX
> >
> > Use drm common helper to read brightness from both luminance and AUX
> > mode to support get_brightness from DPCD via AUX.
> >
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
> >  .../drm/i915/display/intel_dp_aux_backlight.c | 20 ++++++-------------
> >  1 file changed, 6 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index 0a3a3f6a5f9d8..0ee6fd0f41ef0 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -454,24 +454,16 @@ static u32 intel_dp_aux_vesa_get_backlight(struct
> > intel_connector *connector, en  {
> >       struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder)=
;
> >       struct intel_panel *panel =3D &connector->panel;
> > -     u8 buf[3];
> > -     u32 val =3D 0;
> > -     int ret;
> >
> > -     if (panel->backlight.edp.vesa.luminance_control_support) {
> > -             ret =3D drm_dp_dpcd_read(&intel_dp->aux,
> > DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
> > -                                    sizeof(buf));
> > -             if (ret < 0) {
> > -                     drm_err(intel_dp->aux.drm_dev,
> > -                             "[CONNECTOR:%d:%s] Failed to read
> > Luminance from DPCD\n",
> > -                             connector->base.base.id, connector-
> > >base.name);
> > -                     return 0;
> > -             }
> > +     if (!panel->backlight.edp.vesa.info.aux_set) {
> > +             u32 pwm_level =3D panel->backlight.pwm_funcs->get(connect=
or,
> > unused);
> >
> > -             val |=3D buf[0] | buf[1] << 8 | buf[2] << 16;
> > -             return val / 1000;
> > +             return intel_backlight_level_from_pwm(connector,
> > pwm_level);
> >       }
> >
> > +     connector->panel.backlight.level =3D
> > +             drm_edp_backlight_get_level(&intel_dp->aux,
> > +&panel->backlight.edp.vesa.info);
> > +
>
> Just call the intel_dp_aux_vesa_get_backlight here and call the drm_edp_b=
acklight get level in there
>

Do you mean no call of  pwm get?

I thought it should be aligned with set_level when aux_set =3D=3D 0.

Thanks,
Aaron

> Regards,
> Suraj Kandpal
>
>
> >       return connector->panel.backlight.level;  }
> >
> > --
> > 2.43.0
>
