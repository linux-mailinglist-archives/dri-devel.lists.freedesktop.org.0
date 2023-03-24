Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1DD6C8601
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B1110EC5F;
	Fri, 24 Mar 2023 19:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1624B10EC5C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:34:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m2so2858686wrh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679686471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwoWnM+P+5Y3vSdidrB72dW9vMS9M1fQSJiKvYZ9s5Y=;
 b=MCQcpgjzNCArQPm5Ell4HKvVZsdRrLxAmrETb4EeZfHE50PPhrauL4J79bEW7feeaN
 kdbi84Vx6R0YchhMFNFBQNjSX3g0HvTWI8Fac4AoA6pp9NqZmGtoReSiWHyFQsGxC9Sl
 1tQUf+4pK8g0mzn7eF0JZkodXPqtkYxDuJALE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679686471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hwoWnM+P+5Y3vSdidrB72dW9vMS9M1fQSJiKvYZ9s5Y=;
 b=1J24ocQ3s9vKjNL71LnpqUL/lEwLDnh9+ARQK15mhtC31lXDDGkUIs8tZYrKVdurQz
 UC3UqrLugXPUBktRYp7i88JTEyUs0s+6WRlBGQcIqCWi0WomNn3rH0B2gpPoSo8nhuBi
 CtxzF4MBzoSEXFkhQ/GA8M0vmTlvek1lpszGy0PXe6NxdhCpVRG7IWtbpWciU7NXvceN
 E2kvJidPlJQAa4IUbdgiLz+a4n9ib2ozutbsEDeZ505VQR0WeutZ8NFzUyyBbQmdXy/b
 koTLFSM2zTyAz/1d8jsACR1+Vpt+MTmyAwEsGZmLGG9i55kED8A7gtBAn6HK14TCItnX
 CwBQ==
X-Gm-Message-State: AAQBX9fuPq30SCs3uiDS19+2WMkGJZZZodPPTeIGlUYc+TTSD0O8ZrvY
 Lah+6wWi9fMPcf8p1C/k+u3X3fBDx8S5ylffOpdO6A==
X-Google-Smtp-Source: AKy350aBuDG/vWYL2La7siXuTlCHrgbTjc/R6Cyaq0y8M6yQLHuZnTd5DTPGnHE/NRCgYSnZvYEtsHGaAbx3wP/ZPko=
X-Received: by 2002:a05:6000:1a8d:b0:2cf:e75a:eaf0 with SMTP id
 f13-20020a0560001a8d00b002cfe75aeaf0mr2897620wry.0.1679686470968; Fri, 24 Mar
 2023 12:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-8-markyacoub@google.com>
 <MWHPR11MB17418C6511128F91BB71E5EDE3BE9@MWHPR11MB1741.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB17418C6511128F91BB71E5EDE3BE9@MWHPR11MB1741.namprd11.prod.outlook.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 24 Mar 2023 15:34:19 -0400
Message-ID: <CAJUqKUoJOFHy+kjLENFfke12-G-fvA5v2RajjAsj4wBP9RmA3Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v6 07/10] drm/i915/hdcp: Use HDCP helpers for
 i915
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
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
Cc: "quic_sbillaka@quicinc.com" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "hbh25y@gmail.com" <hbh25y@gmail.com>, "Vasut, Marek" <marex@denx.de>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "quic_khsieh@quicinc.com" <quic_khsieh@quicinc.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "abhinavk@codeaurora.org" <abhinavk@codeaurora.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "maxime@cerno.tech" <maxime@cerno.tech>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "johan+linaro@kernel.org" <johan+linaro@kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 1:54=E2=80=AFAM Kandpal, Suraj <suraj.kandpal@intel=
.com> wrote:
>
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Now that all of the HDCP 1.x logic has been migrated to the central HDC=
P
> > helpers, use it in the i915 driver.
> >
> > The majority of the driver code for HDCP 1.x will live in intel_hdcp.c,
> > however there are a few helper hooks which are connector-specific and
> > need to be partially or fully implemented in the intel_dp_hdcp.c or
> > intel_hdmi.c.
> >
> > We'll leave most of the HDCP 2.x code alone since we don't have another
> > implementation of HDCP 2.x to use as reference for what should and
> > should not live in the drm helpers. The helper will call the overly
> > general enable/disable/is_capable HDCP 2.x callbacks and leave the
> > interesting stuff for the driver. Once we have another HDCP 2.x
> > implementation, we should do a similar migration.
> >
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-8-
> > sean@poorly.run #v1
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-8-
> > sean@poorly.run #v2
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-8-
> > sean@poorly.run #v3
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-
> > 8-sean@poorly.run #v4
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-
> > 8-sean@poorly.run #v5
> >
> > Changes in v2:
> > -Fix mst helper function pointer reported by 0-day
> > Changes in v3:
> > -Add forward declaration for drm_atomic_state in intel_hdcp.h identifie=
d
> >  by 0-day
> > Changes in v4:
> > -None
> > Changes in v5:
> > -None
> > Changes in v6:
> > -Rebased.
> >
> > ---
> >  drivers/gpu/drm/i915/display/intel_ddi.c      |  32 +-
> >  .../drm/i915/display/intel_display_debugfs.c  |   6 +-
> >  .../drm/i915/display/intel_display_types.h    |  60 +-
> >  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 348 +++----
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  16 +-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     | 952 +++---------------
> >  drivers/gpu/drm/i915/display/intel_hdcp.h     |  31 +-
> >  drivers/gpu/drm/i915/display/intel_hdmi.c     | 270 ++---
> >  8 files changed, 445 insertions(+), 1270 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> > b/drivers/gpu/drm/i915/display/intel_ddi.c
> > index 69ecf2a3d6c6..a4397f066a3e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/string_helpers.h>
> >
> >  #include <drm/display/drm_scdc_helper.h>
> > +#include <drm/display/drm_hdcp_helper.h>
> >  #include <drm/drm_privacy_screen_consumer.h>
> >
> >  #include "i915_drv.h"
> > @@ -2909,6 +2910,10 @@ static void intel_enable_ddi(struct
> > intel_atomic_state *state,
> >                            const struct intel_crtc_state *crtc_state,
> >                            const struct drm_connector_state *conn_state=
)
> >  {
> > +     struct intel_connector *connector =3D
> > +             to_intel_connector(conn_state->connector);
> > +     struct intel_digital_port *dig_port =3D enc_to_dig_port(encoder);
> > +
> >       drm_WARN_ON(state->base.dev, crtc_state->has_pch_encoder);
> >
> >       if (!intel_crtc_is_bigjoiner_slave(crtc_state))
> > @@ -2925,12 +2930,10 @@ static void intel_enable_ddi(struct
> > intel_atomic_state *state,
> >       else
> >               intel_enable_ddi_dp(state, encoder, crtc_state,
> > conn_state);
> >
> > -     /* Enable hdcp if it's desired */
> > -     if (conn_state->content_protection =3D=3D
> > -         DRM_MODE_CONTENT_PROTECTION_DESIRED)
> > -             intel_hdcp_enable(to_intel_connector(conn_state-
> > >connector),
> > -                               crtc_state,
> > -                               (u8)conn_state->hdcp_content_type);
> > +     if (connector->hdcp_helper_data)
> > +             drm_hdcp_helper_atomic_commit(connector-
> > >hdcp_helper_data,
> > +                                           &state->base,
> > +                                           &dig_port->hdcp_mutex);
> >  }
> >
> >  static void intel_disable_ddi_dp(struct intel_atomic_state *state,
> > @@ -2976,7 +2979,14 @@ static void intel_disable_ddi(struct
> > intel_atomic_state *state,
> >                             const struct intel_crtc_state *old_crtc_sta=
te,
> >                             const struct drm_connector_state
> > *old_conn_state)
> >  {
> > -     intel_hdcp_disable(to_intel_connector(old_conn_state-
> > >connector));
> > +     struct intel_connector *connector =3D
> > +             to_intel_connector(old_conn_state->connector);
> > +     struct intel_digital_port *dig_port =3D enc_to_dig_port(encoder);
> > +
> > +     if (connector->hdcp_helper_data)
> > +             drm_hdcp_helper_atomic_commit(connector-
> > >hdcp_helper_data,
> > +                                           &state->base,
> > +                                           &dig_port->hdcp_mutex);
> >
> >       if (intel_crtc_has_type(old_crtc_state, INTEL_OUTPUT_HDMI))
> >               intel_disable_ddi_hdmi(state, encoder, old_crtc_state,
> > @@ -3004,13 +3014,19 @@ void intel_ddi_update_pipe(struct
> > intel_atomic_state *state,
> >                          const struct intel_crtc_state *crtc_state,
> >                          const struct drm_connector_state *conn_state)
> >  {
> > +     struct intel_connector *connector =3D
> > +             to_intel_connector(conn_state->connector);
> > +     struct intel_digital_port *dig_port =3D enc_to_dig_port(encoder);
> >
> >       if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) &&
> >           !intel_encoder_is_mst(encoder))
> >               intel_ddi_update_pipe_dp(state, encoder, crtc_state,
> >                                        conn_state);
> >
> > -     intel_hdcp_update_pipe(state, encoder, crtc_state, conn_state);
> > +     if (connector->hdcp_helper_data)
> > +             drm_hdcp_helper_atomic_commit(connector-
> > >hdcp_helper_data,
> > +                                           &state->base,
> > +                                           &dig_port->hdcp_mutex);
> >  }
> >
> >  static void
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > index 13a4153bb76e..2e67cca0151c 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > @@ -7,6 +7,7 @@
> >
> >  #include <drm/drm_debugfs.h>
> >  #include <drm/drm_fourcc.h>
> > +#include <drm/display/drm_hdcp_helper.h>
> >
> >  #include "i915_debugfs.h"
> >  #include "intel_de.h"
> > @@ -500,10 +501,11 @@ static void intel_hdcp_info(struct seq_file *m,
> >               goto out;
> >       }
> >
> > -     ret =3D intel_hdcp_capable(intel_connector, &hdcp_cap);
> > +     ret =3D drm_hdcp_helper_hdcp1_capable(intel_connector-
> > >hdcp_helper_data,
> > +                                         &hdcp_cap);
> >       if (ret)
> >               hdcp_cap =3D false;
> > -     ret =3D intel_hdcp2_capable(intel_connector, &hdcp2_cap);
> > +     ret =3D intel_hdcp2_capable(&intel_connector->base, &hdcp2_cap);
> >       if (ret)
> >               hdcp2_cap =3D false;
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 298d00a11f47..6260a40586ae 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -416,71 +416,14 @@ enum check_link_response {
> >   *           The offsets of the registers are different for DP vs. HDM=
I
> >   *   - Receiver register masks/offsets
> >   *           For instance, the ready bit for the KSV fifo is in a diff=
erent
> > - *           place on DP vs HDMI
> > - *   - Receiver register names
> > - *           Seriously. In the DP spec, the 16-bit register containing
> > - *           downstream information is called BINFO, on HDMI it's call=
ed
> > - *           BSTATUS. To confuse matters further, DP has a BSTATUS
> > register
> > - *           with a completely different definition.
> > - *   - KSV FIFO
> > - *           On HDMI, the ksv fifo is read all at once, whereas on DP =
it
> > must
> > - *           be read 3 keys at a time
> > - *   - Aksv output
> > - *           Since Aksv is hidden in hardware, there's different
> > procedures
> > - *           to send it over DP AUX vs DDC
>
> I really think we can keep the comment as its mentioning the ways that th=
e two busses differ
>
Reverted the change.
> > + *           place on DP vs HDMI.
> >   */
> >  struct intel_hdcp_shim {
> > -     /* Outputs the transmitter's An and Aksv values to the receiver. =
*/
> > -     int (*write_an_aksv)(struct intel_digital_port *dig_port, u8 *an)=
;
> > -
> > -     /* Reads the receiver's key selection vector */
> > -     int (*read_bksv)(struct intel_digital_port *dig_port, u8 *bksv);
> > -
> > -     /*
> > -      * Reads BINFO from DP receivers and BSTATUS from HDMI
> > receivers. The
> > -      * definitions are the same in the respective specs, but the name=
s
> > are
> > -      * different. Call it BSTATUS since that's the name the HDMI spec
> > -      * uses and it was there first.
> > -      */
> > -     int (*read_bstatus)(struct intel_digital_port *dig_port,
> > -                         u8 *bstatus);
> > -
> > -     /* Determines whether a repeater is present downstream */
> > -     int (*repeater_present)(struct intel_digital_port *dig_port,
> > -                             bool *repeater_present);
> > -
> > -     /* Reads the receiver's Ri' value */
> > -     int (*read_ri_prime)(struct intel_digital_port *dig_port, u8 *ri)=
;
> > -
> > -     /* Determines if the receiver's KSV FIFO is ready for consumption=
 */
> > -     int (*read_ksv_ready)(struct intel_digital_port *dig_port,
> > -                           bool *ksv_ready);
> > -
> > -     /* Reads the ksv fifo for num_downstream devices */
> > -     int (*read_ksv_fifo)(struct intel_digital_port *dig_port,
> > -                          int num_downstream, u8 *ksv_fifo);
> > -
> > -     /* Reads a 32-bit part of V' from the receiver */
> > -     int (*read_v_prime_part)(struct intel_digital_port *dig_port,
> > -                              int i, u32 *part);
> > -
> >       /* Enables HDCP signalling on the port */
> >       int (*toggle_signalling)(struct intel_digital_port *dig_port,
> >                                enum transcoder cpu_transcoder,
> >                                bool enable);
> >
> > -     /* Enable/Disable stream encryption on DP MST Transport Link */
> > -     int (*stream_encryption)(struct intel_connector *connector,
> > -                              bool enable);
> > -
> > -     /* Ensures the link is still protected */
> > -     bool (*check_link)(struct intel_digital_port *dig_port,
> > -                        struct intel_connector *connector);
> > -
> > -     /* Detects panel's hdcp capability. This is optional for HDMI. */
> > -     int (*hdcp_capable)(struct intel_digital_port *dig_port,
> > -                         bool *hdcp_capable);
> > -
> >       /* HDCP adaptation(DP/HDMI) required on the port */
> >       enum hdcp_wired_protocol protocol;
> >
> > @@ -610,6 +553,7 @@ struct intel_connector {
> >       struct work_struct modeset_retry_work;
> >
> >       struct intel_hdcp hdcp;
> > +     struct drm_hdcp_helper_data *hdcp_helper_data;
> >  };
> >
> >  struct intel_digital_connector_state {
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > index 88689124c013..d61ac8d69951 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > @@ -55,17 +55,24 @@ static void intel_dp_hdcp_wait_for_cp_irq(struct
> > intel_hdcp *hdcp, int timeout)
> >               DRM_DEBUG_KMS("Timedout at waiting for CP_IRQ\n");
> >  }
> >
> > -static
> > -int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
> > -                             u8 *an)
> > +static int intel_dp_hdcp1_send_an_aksv(struct drm_connector
> > *drm_connector)
> >  {
>
> I think the name intel_dp_hdcp_send_an_aksv should be enough as this step
> is done only for hdcp 1.x and not hdcp 2.x.
>
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> >       struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > +     struct drm_hdcp_an an;
> >       u8 aksv[DRM_HDCP_KSV_LEN] =3D {};
> >       ssize_t dpcd_ret;
> > +     int ret;
> >
> >       /* Output An first, that's easy */
> > +     ret =3D intel_hdcp1_read_an(drm_connector, &an);
> > +     if (ret)
> > +             return ret;
> > +
> >       dpcd_ret =3D drm_dp_dpcd_write(&dig_port->dp.aux,
> > DP_AUX_HDCP_AN,
> > -                                  an, DRM_HDCP_AN_LEN);
> > +                                  an.bytes, DRM_HDCP_AN_LEN);
> >       if (dpcd_ret !=3D DRM_HDCP_AN_LEN) {
> >               drm_dbg_kms(&i915->drm,
> >                           "Failed to write An over DP/AUX (%zd)\n",
> > @@ -91,158 +98,6 @@ int intel_dp_hdcp_write_an_aksv(struct
> > intel_digital_port *dig_port,
> >       return 0;
> >  }
> >
> > -static int intel_dp_hdcp_read_bksv(struct intel_digital_port *dig_port=
,
> > -                                u8 *bksv)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     ssize_t ret;
> > -
> > -     ret =3D drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BKSV,
> > bksv,
> > -                            DRM_HDCP_KSV_LEN);
> > -     if (ret !=3D DRM_HDCP_KSV_LEN) {
> > -             drm_dbg_kms(&i915->drm,
> > -                         "Read Bksv from DP/AUX failed (%zd)\n", ret);
> > -             return ret >=3D 0 ? -EIO : ret;
> > -     }
> > -     return 0;
> > -}
> > -
> > -static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *dig_p=
ort,
> > -                                   u8 *bstatus)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     ssize_t ret;
> > -
> > -     /*
> > -      * For some reason the HDMI and DP HDCP specs call this register
> > -      * definition by different names. In the HDMI spec, it's called
> > BSTATUS,
> > -      * but in DP it's called BINFO.
> > -      */
> > -     ret =3D drm_dp_dpcd_read(&dig_port->dp.aux,
> > DP_AUX_HDCP_BINFO,
> > -                            bstatus, DRM_HDCP_BSTATUS_LEN);
> > -     if (ret !=3D DRM_HDCP_BSTATUS_LEN) {
> > -             drm_dbg_kms(&i915->drm,
> > -                         "Read bstatus from DP/AUX failed (%zd)\n", re=
t);
> > -             return ret >=3D 0 ? -EIO : ret;
> > -     }
> > -     return 0;
> > -}
> > -
> > -static
> > -int intel_dp_hdcp_read_bcaps(struct intel_digital_port *dig_port,
> > -                          u8 *bcaps)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     ssize_t ret;
> > -
> > -     ret =3D drm_dp_dpcd_read(&dig_port->dp.aux,
> > DP_AUX_HDCP_BCAPS,
> > -                            bcaps, 1);
> > -     if (ret !=3D 1) {
> > -             drm_dbg_kms(&i915->drm,
> > -                         "Read bcaps from DP/AUX failed (%zd)\n", ret)=
;
> > -             return ret >=3D 0 ? -EIO : ret;
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> > -static
> > -int intel_dp_hdcp_repeater_present(struct intel_digital_port *dig_port=
,
> > -                                bool *repeater_present)
> > -{
> > -     ssize_t ret;
> > -     u8 bcaps;
> > -
> > -     ret =3D intel_dp_hdcp_read_bcaps(dig_port, &bcaps);
> > -     if (ret)
> > -             return ret;
> > -
> > -     *repeater_present =3D bcaps & DP_BCAPS_REPEATER_PRESENT;
> > -     return 0;
> > -}
> > -
> > -static
> > -int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *dig_port,
> > -                             u8 *ri_prime)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     ssize_t ret;
> > -
> > -     ret =3D drm_dp_dpcd_read(&dig_port->dp.aux,
> > DP_AUX_HDCP_RI_PRIME,
> > -                            ri_prime, DRM_HDCP_RI_LEN);
> > -     if (ret !=3D DRM_HDCP_RI_LEN) {
> > -             drm_dbg_kms(&i915->drm, "Read Ri' from DP/AUX failed
> > (%zd)\n",
> > -                         ret);
> > -             return ret >=3D 0 ? -EIO : ret;
> > -     }
> > -     return 0;
> > -}
> > -
> > -static
> > -int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *dig_port,
> > -                              bool *ksv_ready)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     ssize_t ret;
> > -     u8 bstatus;
> > -
> > -     ret =3D drm_dp_dpcd_read(&dig_port->dp.aux,
> > DP_AUX_HDCP_BSTATUS,
> > -                            &bstatus, 1);
> > -     if (ret !=3D 1) {
> > -             drm_dbg_kms(&i915->drm,
> > -                         "Read bstatus from DP/AUX failed (%zd)\n", re=
t);
> > -             return ret >=3D 0 ? -EIO : ret;
> > -     }
> > -     *ksv_ready =3D bstatus & DP_BSTATUS_READY;
> > -     return 0;
> > -}
> > -
> > -static
> > -int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *dig_port,
> > -                             int num_downstream, u8 *ksv_fifo)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     ssize_t ret;
> > -     int i;
> > -
> > -     /* KSV list is read via 15 byte window (3 entries @ 5 bytes each)=
 */
> > -     for (i =3D 0; i < num_downstream; i +=3D 3) {
> > -             size_t len =3D min(num_downstream - i, 3) *
> > DRM_HDCP_KSV_LEN;
> > -             ret =3D drm_dp_dpcd_read(&dig_port->dp.aux,
> > -                                    DP_AUX_HDCP_KSV_FIFO,
> > -                                    ksv_fifo + i * DRM_HDCP_KSV_LEN,
> > -                                    len);
> > -             if (ret !=3D len) {
> > -                     drm_dbg_kms(&i915->drm,
> > -                                 "Read ksv[%d] from DP/AUX failed
> > (%zd)\n",
> > -                                 i, ret);
> > -                     return ret >=3D 0 ? -EIO : ret;
> > -             }
> > -     }
> > -     return 0;
> > -}
> > -
> > -static
> > -int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *dig_por=
t,
> > -                                 int i, u32 *part)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     ssize_t ret;
> > -
> > -     if (i >=3D DRM_HDCP_V_PRIME_NUM_PARTS)
> > -             return -EINVAL;
> > -
> > -     ret =3D drm_dp_dpcd_read(&dig_port->dp.aux,
> > -                            DP_AUX_HDCP_V_PRIME(i), part,
> > -                            DRM_HDCP_V_PRIME_PART_LEN);
> > -     if (ret !=3D DRM_HDCP_V_PRIME_PART_LEN) {
> > -             drm_dbg_kms(&i915->drm,
> > -                         "Read v'[%d] from DP/AUX failed (%zd)\n", i, =
ret);
> > -             return ret >=3D 0 ? -EIO : ret;
> > -     }
> > -     return 0;
> > -}
> > -
> >  static
> >  int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *dig_por=
t,
> >                                   enum transcoder cpu_transcoder,
> > @@ -252,40 +107,6 @@ int intel_dp_hdcp_toggle_signalling(struct
> > intel_digital_port *dig_port,
> >       return 0;
> >  }
> >
> > -static
> > -bool intel_dp_hdcp_check_link(struct intel_digital_port *dig_port,
> > -                           struct intel_connector *connector)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     ssize_t ret;
> > -     u8 bstatus;
> > -
> > -     ret =3D drm_dp_dpcd_read(&dig_port->dp.aux,
> > DP_AUX_HDCP_BSTATUS,
> > -                            &bstatus, 1);
> > -     if (ret !=3D 1) {
> > -             drm_dbg_kms(&i915->drm,
> > -                         "Read bstatus from DP/AUX failed (%zd)\n", re=
t);
> > -             return false;
> > -     }
> > -
> > -     return !(bstatus & (DP_BSTATUS_LINK_FAILURE |
> > DP_BSTATUS_REAUTH_REQ));
> > -}
> > -
> > -static
> > -int intel_dp_hdcp_capable(struct intel_digital_port *dig_port,
> > -                       bool *hdcp_capable)
> > -{
> > -     ssize_t ret;
> > -     u8 bcaps;
> > -
> > -     ret =3D intel_dp_hdcp_read_bcaps(dig_port, &bcaps);
> > -     if (ret)
> > -             return ret;
> > -
> > -     *hdcp_capable =3D bcaps & DP_BCAPS_HDCP_CAPABLE;
> > -     return 0;
> > -}
> > -
> >  struct hdcp2_dp_errata_stream_type {
> >       u8      msg_id;
> >       u8      stream_type;
> > @@ -628,13 +449,19 @@ int intel_dp_hdcp2_check_link(struct
> > intel_digital_port *dig_port,
> >       return ret;
> >  }
> >
> > -static
> > -int intel_dp_hdcp2_capable(struct intel_digital_port *dig_port,
> > -                        bool *capable)
> > +static int intel_dp_hdcp2_capable(struct drm_connector *drm_connector,
> > +                               bool *capable)
> >  {
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> >       u8 rx_caps[3];
> >       int ret;
> >
> > +     ret =3D intel_hdcp2_capable(drm_connector, capable);
> > +     if (ret || !capable)
> > +             return ret;
> > +
> >       *capable =3D false;
> >       ret =3D drm_dp_dpcd_read(&dig_port->dp.aux,
> >                              DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
> > @@ -650,22 +477,11 @@ int intel_dp_hdcp2_capable(struct
> > intel_digital_port *dig_port,
> >  }
> >
> >  static const struct intel_hdcp_shim intel_dp_hdcp_shim =3D {
> > -     .write_an_aksv =3D intel_dp_hdcp_write_an_aksv,
> > -     .read_bksv =3D intel_dp_hdcp_read_bksv,
> > -     .read_bstatus =3D intel_dp_hdcp_read_bstatus,
> > -     .repeater_present =3D intel_dp_hdcp_repeater_present,
> > -     .read_ri_prime =3D intel_dp_hdcp_read_ri_prime,
> > -     .read_ksv_ready =3D intel_dp_hdcp_read_ksv_ready,
> > -     .read_ksv_fifo =3D intel_dp_hdcp_read_ksv_fifo,
> > -     .read_v_prime_part =3D intel_dp_hdcp_read_v_prime_part,
> >       .toggle_signalling =3D intel_dp_hdcp_toggle_signalling,
> > -     .check_link =3D intel_dp_hdcp_check_link,
> > -     .hdcp_capable =3D intel_dp_hdcp_capable,
> >       .write_2_2_msg =3D intel_dp_hdcp2_write_msg,
> >       .read_2_2_msg =3D intel_dp_hdcp2_read_msg,
> >       .config_stream_type =3D intel_dp_hdcp2_config_stream_type,
> >       .check_2_2_link =3D intel_dp_hdcp2_check_link,
> > -     .hdcp_2_2_capable =3D intel_dp_hdcp2_capable,
> >       .protocol =3D HDCP_PROTOCOL_DP,
> >  };
> >
> > @@ -721,6 +537,46 @@ intel_dp_mst_hdcp_stream_encryption(struct
> > intel_connector *connector,
> >       return 0;
> >  }
> >
> > +static int
> > +intel_dp_mst_hdcp1_post_encryption(struct drm_connector
> > *drm_connector)
> > +{
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     int ret;
> > +
> > +     ret =3D intel_hdcp1_post_encryption(drm_connector);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return intel_dp_mst_hdcp_stream_encryption(connector, true);
> > +}
> > +
> > +static int intel_dp_mst_hdcp1_disable(struct drm_connector
> > *drm_connector)
> > +{
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> > +     struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> > +     int ret;
> > +
> > +     ret =3D intel_dp_mst_hdcp_stream_encryption(connector, true);
> > +     if (ret) {
> > +             drm_err(&i915->drm,
> > +                     "[%s:%d] Failed to disable HDCP 1.4 stream enc\n"=
,
> > +                     connector->base.name, connector->base.base.id);
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * If there are other connectors on this port using HDCP,
> > +      * don't disable it until it disabled HDCP encryption for
> > +      * all connectors in MST topology.
> > +     */
> > +     if (dig_port->num_hdcp_streams > 0)
> > +             return 0;
> > +
> > +     return intel_hdcp1_disable(drm_connector);
> > +}
> > +
> >  static int
> >  intel_dp_mst_hdcp2_stream_encryption(struct intel_connector
> > *connector,
> >                                    bool enable)
> > @@ -779,45 +635,85 @@ int intel_dp_mst_hdcp2_check_link(struct
> > intel_digital_port *dig_port,
> >  }
> >
> >  static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim =3D {
> > -     .write_an_aksv =3D intel_dp_hdcp_write_an_aksv,
> > -     .read_bksv =3D intel_dp_hdcp_read_bksv,
> > -     .read_bstatus =3D intel_dp_hdcp_read_bstatus,
> > -     .repeater_present =3D intel_dp_hdcp_repeater_present,
> > -     .read_ri_prime =3D intel_dp_hdcp_read_ri_prime,
> > -     .read_ksv_ready =3D intel_dp_hdcp_read_ksv_ready,
> > -     .read_ksv_fifo =3D intel_dp_hdcp_read_ksv_fifo,
> > -     .read_v_prime_part =3D intel_dp_hdcp_read_v_prime_part,
> >       .toggle_signalling =3D intel_dp_hdcp_toggle_signalling,
> > -     .stream_encryption =3D intel_dp_mst_hdcp_stream_encryption,
> > -     .check_link =3D intel_dp_hdcp_check_link,
> > -     .hdcp_capable =3D intel_dp_hdcp_capable,
> >       .write_2_2_msg =3D intel_dp_hdcp2_write_msg,
> >       .read_2_2_msg =3D intel_dp_hdcp2_read_msg,
> >       .config_stream_type =3D intel_dp_hdcp2_config_stream_type,
> >       .stream_2_2_encryption =3D intel_dp_mst_hdcp2_stream_encryption,
> >       .check_2_2_link =3D intel_dp_mst_hdcp2_check_link,
> > -     .hdcp_2_2_capable =3D intel_dp_hdcp2_capable,
> >       .protocol =3D HDCP_PROTOCOL_DP,
> >  };
> >
> > +static const struct drm_hdcp_helper_funcs intel_dp_hdcp_helper_funcs =
=3D {
> > +     .setup =3D intel_hdcp_setup,
> > +     .load_keys =3D intel_hdcp_load_keys,
> > +     .hdcp2_capable =3D intel_dp_hdcp2_capable,
> > +     .hdcp2_enable =3D intel_hdcp2_enable,
> > +     .hdcp2_check_link =3D intel_hdcp2_check_link,
> > +     .hdcp2_disable =3D intel_hdcp2_disable,
> > +     .hdcp1_send_an_aksv =3D intel_dp_hdcp1_send_an_aksv,
> > +     .hdcp1_store_receiver_info =3D intel_hdcp1_store_receiver_info,
> > +     .hdcp1_enable_encryption =3D intel_hdcp1_enable_encryption,
> > +     .hdcp1_wait_for_r0 =3D intel_hdcp1_wait_for_r0,
> > +     .hdcp1_match_ri =3D intel_hdcp1_match_ri,
> > +     .hdcp1_post_encryption =3D intel_hdcp1_post_encryption,
> > +     .hdcp1_store_ksv_fifo =3D intel_hdcp1_store_ksv_fifo,
> > +     .hdcp1_disable =3D intel_hdcp1_disable,
> > +};
> > +
> > +static const struct drm_hdcp_helper_funcs
> > intel_dp_mst_hdcp_helper_funcs =3D {
> > +     .setup =3D intel_hdcp_setup,
> > +     .load_keys =3D intel_hdcp_load_keys,
> > +     .hdcp2_capable =3D intel_dp_hdcp2_capable,
> > +     .hdcp2_enable =3D intel_hdcp2_enable,
> > +     .hdcp2_check_link =3D intel_hdcp2_check_link,
> > +     .hdcp2_disable =3D intel_hdcp2_disable,
> > +     .hdcp1_send_an_aksv =3D intel_dp_hdcp1_send_an_aksv,
> > +     .hdcp1_store_receiver_info =3D intel_hdcp1_store_receiver_info,
> > +     .hdcp1_enable_encryption =3D intel_hdcp1_enable_encryption,
> > +     .hdcp1_wait_for_r0 =3D intel_hdcp1_wait_for_r0,
> > +     .hdcp1_match_ri =3D intel_hdcp1_match_ri,
> > +     .hdcp1_post_encryption =3D intel_dp_mst_hdcp1_post_encryption,
> > +     .hdcp1_store_ksv_fifo =3D intel_hdcp1_store_ksv_fifo,
> > +     .hdcp1_disable =3D intel_dp_mst_hdcp1_disable,
> > +};
> > +
> >  int intel_dp_hdcp_init(struct intel_digital_port *dig_port,
> > -                    struct intel_connector *intel_connector)
> > +                    struct intel_connector *connector)
> >  {
> > -     struct drm_device *dev =3D intel_connector->base.dev;
> > -     struct drm_i915_private *dev_priv =3D to_i915(dev);
> > +     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> >       struct intel_encoder *intel_encoder =3D &dig_port->base;
> >       enum port port =3D intel_encoder->port;
> >       struct intel_dp *intel_dp =3D &dig_port->dp;
> > +     struct drm_hdcp_helper_data *data;
> > +     const struct drm_hdcp_helper_funcs *helper_funcs;
> > +     const struct intel_hdcp_shim *intel_shim;
> > +     int ret;
> >
> > -     if (!is_hdcp_supported(dev_priv, port))
> > +     if (!is_hdcp_supported(dev_priv, port) ||
> > intel_dp_is_edp(intel_dp))
> >               return 0;
> >
> > -     if (intel_connector->mst_port)
> > -             return intel_hdcp_init(intel_connector, dig_port,
> > -                                    &intel_dp_mst_hdcp_shim);
> > -     else if (!intel_dp_is_edp(intel_dp))
> > -             return intel_hdcp_init(intel_connector, dig_port,
> > -                                    &intel_dp_hdcp_shim);
> > +     if (connector->mst_port) {
> > +             helper_funcs =3D &intel_dp_mst_hdcp_helper_funcs;
> > +             intel_shim =3D &intel_dp_mst_hdcp_shim;
> > +     } else {
> > +             helper_funcs =3D &intel_dp_hdcp_helper_funcs;
> > +             intel_shim =3D &intel_dp_hdcp_shim;
> > +     }
> > +
> > +     data =3D drm_hdcp_helper_initialize_dp(
> > +             &connector->base, &dig_port->dp.aux, helper_funcs, true);
>
> The alignment here needs fixing
>
> > +     if (IS_ERR(data)) {
> > +             drm_dbg_kms(&dev_priv->drm, "HDCP init failed,
> > skipping.\n");
> > +             return PTR_ERR(data);
> > +     }
> > +
> > +     ret =3D intel_hdcp_init(connector, dig_port, intel_shim);
> > +     if (ret) {
> > +             drm_hdcp_helper_destroy(data);
> > +             return ret;
> > +     }
> >
> > +     connector->hdcp_helper_data =3D data;
> >       return 0;
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 03604a37931c..ececb7aa4b90 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -27,6 +27,7 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_probe_helper.h>
> > +#include <drm/display/drm_hdcp_helper.h>
> >
> >  #include "i915_drv.h"
> >  #include "intel_atomic.h"
> > @@ -40,7 +41,6 @@
> >  #include "intel_dp_hdcp.h"
> >  #include "intel_dp_mst.h"
> >  #include "intel_dpio_phy.h"
> > -#include "intel_hdcp.h"
> >  #include "intel_hotplug.h"
> >  #include "skl_scaler.h"
> >
> > @@ -371,7 +371,10 @@ static void intel_mst_disable_dp(struct
> > intel_atomic_state *state,
> >       drm_dbg_kms(&i915->drm, "active links %d\n",
> >                   intel_dp->active_mst_links);
> >
> > -     intel_hdcp_disable(intel_mst->connector);
> > +     if (connector->hdcp_helper_data)
> > +             drm_hdcp_helper_atomic_commit(connector-
> > >hdcp_helper_data,
> > +                                           &state->base,
> > +                                           &dig_port->hdcp_mutex);
> >
> >       drm_dp_remove_payload(&intel_dp->mst_mgr, mst_state,
> >                             drm_atomic_get_mst_payload_state(mst_state,
> > connector->port));
> > @@ -579,11 +582,10 @@ static void intel_mst_enable_dp(struct
> > intel_atomic_state *state,
> >       intel_audio_codec_enable(encoder, pipe_config, conn_state);
> >
> >       /* Enable hdcp if it's desired */
> > -     if (conn_state->content_protection =3D=3D
> > -         DRM_MODE_CONTENT_PROTECTION_DESIRED)
> > -             intel_hdcp_enable(to_intel_connector(conn_state-
> > >connector),
> > -                               pipe_config,
> > -                               (u8)conn_state->hdcp_content_type);
> > +     if (connector->hdcp_helper_data)
> > +             drm_hdcp_helper_atomic_commit(connector-
> > >hdcp_helper_data,
> > +                                           &state->base,
> > +                                           &dig_port->hdcp_mutex);
> >  }
> >
> >  static bool intel_dp_mst_enc_get_hw_state(struct intel_encoder *encode=
r,
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index 61a862ae1f28..f09afbc9567b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -140,67 +140,10 @@ static int intel_hdcp_prepare_streams(struct
> > intel_connector *connector)
> >       return 0;
> >  }
> >
> > -static
> > -bool intel_hdcp_is_ksv_valid(u8 *ksv)
> > -{
> > -     int i, ones =3D 0;
> > -     /* KSV has 20 1's and 20 0's */
> > -     for (i =3D 0; i < DRM_HDCP_KSV_LEN; i++)
> > -             ones +=3D hweight8(ksv[i]);
> > -     if (ones !=3D 20)
> > -             return false;
> > -
> > -     return true;
> > -}
> > -
> > -static
> > -int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
> > -                            const struct intel_hdcp_shim *shim, u8 *bk=
sv)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     int ret, i, tries =3D 2;
> > -
> > -     /* HDCP spec states that we must retry the bksv if it is invalid =
*/
> > -     for (i =3D 0; i < tries; i++) {
> > -             ret =3D shim->read_bksv(dig_port, bksv);
> > -             if (ret)
> > -                     return ret;
> > -             if (intel_hdcp_is_ksv_valid(bksv))
> > -                     break;
> > -     }
> > -     if (i =3D=3D tries) {
> > -             drm_dbg_kms(&i915->drm, "Bksv is invalid\n");
> > -             return -ENODEV;
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> > -/* Is HDCP1.4 capable on Platform and Sink */
> > -int intel_hdcp_capable(struct intel_connector *connector, bool *capabl=
e)
> > -{
> > -     struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> > -     const struct intel_hdcp_shim *shim =3D connector->hdcp.shim;
> > -     u8 bksv[5];
> > -
> > -     *capable =3D false;
> > -
> > -     if (!shim)
> > -             return 0;
> > -
> > -     if (shim->hdcp_capable)
> > -             return shim->hdcp_capable(dig_port, capable);
> > -
> > -     if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
> > -             *capable =3D true;
> > -
> > -     return 0;
> > -}
> > -
> >  /* Is HDCP2.2 capable on Platform and Sink */
> > -int intel_hdcp2_capable(struct intel_connector *connector, bool *capab=
le)
> > +int intel_hdcp2_capable(struct drm_connector *drm_connector, bool
> > *capable)
> >  {
> > -     struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> >       struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> >       struct intel_hdcp *hdcp =3D &connector->hdcp;
> >
> > @@ -218,16 +161,26 @@ int intel_hdcp2_capable(struct intel_connector
> > *connector, bool *capable)
> >       }
> >       mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
> >
> > -     /* Sink's capability for HDCP2.2 */
> > -     return hdcp->shim->hdcp_2_2_capable(dig_port, capable);
>
> Did you miss adding the drm hdcp helper  here to check sink capability
>
Hey,
As the flow change and the protocol was split away from the full
implementation, the function here only checks if the driver supports
it. the call to sync happens in the helper.
> > +     return 0;
> >  }
> >
> > -static bool intel_hdcp_in_use(struct drm_i915_private *dev_priv,
> > -                           enum transcoder cpu_transcoder, enum port
> > port)
> > +int intel_hdcp1_check_link(struct drm_connector *drm_connector)
> >  {
> > -     return intel_de_read(dev_priv,
> > -                          HDCP_STATUS(dev_priv, cpu_transcoder, port))=
 &
> > -            HDCP_STATUS_ENC;
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> > +     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > +     enum transcoder cpu_transcoder =3D connector-
> > >hdcp.cpu_transcoder;
> > +     enum port port =3D dig_port->base.port;
> > +     u32 val;
> > +
> > +     val =3D intel_de_read(dev_priv,
> > +                         HDCP_STATUS(dev_priv, cpu_transcoder, port));
> > +
> > +     if (val & HDCP_STATUS_ENC)
> > +             return 0;
> > +
> > +     return -EINVAL;
> >  }
> >
> >  static bool intel_hdcp2_in_use(struct drm_i915_private *dev_priv,
> > @@ -238,27 +191,6 @@ static bool intel_hdcp2_in_use(struct
> > drm_i915_private *dev_priv,
> >              LINK_ENCRYPTION_STATUS;
> >  }
> >
> > -static int intel_hdcp_poll_ksv_fifo(struct intel_digital_port *dig_por=
t,
> > -                                 const struct intel_hdcp_shim *shim)
> > -{
> > -     int ret, read_ret;
> > -     bool ksv_ready;
> > -
> > -     /* Poll for ksv list ready (spec says max time allowed is 5s) */
> > -     ret =3D __wait_for(read_ret =3D shim->read_ksv_ready(dig_port,
> > -                                                      &ksv_ready),
> > -                      read_ret || ksv_ready, 5 * 1000 * 1000, 1000,
> > -                      100 * 1000);
> > -     if (ret)
> > -             return ret;
> > -     if (read_ret)
> > -             return read_ret;
> > -     if (!ksv_ready)
> > -             return -ETIMEDOUT;
> > -
> > -     return 0;
> > -}
> > -
> >  static bool hdcp_key_loadable(struct drm_i915_private *dev_priv)
> >  {
> >       enum i915_power_well_id id;
> > @@ -294,11 +226,18 @@ static void intel_hdcp_clear_keys(struct
> > drm_i915_private *dev_priv)
> >                      HDCP_KEY_LOAD_DONE | HDCP_KEY_LOAD_STATUS |
> > HDCP_FUSE_IN_PROGRESS | HDCP_FUSE_ERROR | HDCP_FUSE_DONE);
> >  }
> >
> > -static int intel_hdcp_load_keys(struct drm_i915_private *dev_priv)
> > +int intel_hdcp_load_keys(struct drm_connector *drm_connector)
> >  {
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> >       int ret;
> >       u32 val;
> >
> > +     if (!hdcp_key_loadable(dev_priv)) {
> > +             drm_err(&dev_priv->drm, "HDCP key Load is not
> > possible\n");
> > +             return -ENXIO;
> > +     }
> > +
> >       val =3D intel_de_read(dev_priv, HDCP_KEY_STATUS);
> >       if ((val & HDCP_KEY_LOAD_DONE) && (val &
> > HDCP_KEY_LOAD_STATUS))
> >               return 0;
> > @@ -308,8 +247,11 @@ static int intel_hdcp_load_keys(struct
> > drm_i915_private *dev_priv)
> >        * out of reset. So if Key is not already loaded, its an error st=
ate.
> >        */
> >       if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv))
> > -             if (!(intel_de_read(dev_priv, HDCP_KEY_STATUS) &
> > HDCP_KEY_LOAD_DONE))
> > -                     return -ENXIO;
> > +             if (!(intel_de_read(dev_priv, HDCP_KEY_STATUS) &
> > +                   HDCP_KEY_LOAD_DONE)) {
> > +                     ret =3D -ENXIO;
> > +                     goto err;
> > +             }
> >
> >       /*
> >        * Initiate loading the HDCP key from fuses.
> > @@ -325,7 +267,7 @@ static int intel_hdcp_load_keys(struct
> > drm_i915_private *dev_priv)
> >                       drm_err(&dev_priv->drm,
> >                               "Failed to initiate HDCP key load (%d)\n"=
,
> >                               ret);
> > -                     return ret;
> > +                     goto err;
> >               }
> >       } else {
> >               intel_de_write(dev_priv, HDCP_KEY_CONF,
> > HDCP_KEY_LOAD_TRIGGER);
> > @@ -335,15 +277,21 @@ static int intel_hdcp_load_keys(struct
> > drm_i915_private *dev_priv)
> >       ret =3D __intel_wait_for_register(&dev_priv->uncore,
> > HDCP_KEY_STATUS,
> >                                       HDCP_KEY_LOAD_DONE,
> > HDCP_KEY_LOAD_DONE,
> >                                       10, 1, &val);
> > -     if (ret)
> > -             return ret;
> > -     else if (!(val & HDCP_KEY_LOAD_STATUS))
> > -             return -ENXIO;
> > +     if (ret) {
> > +             goto err;
> > +     } else if (!(val & HDCP_KEY_LOAD_STATUS)) {
> > +             ret =3D -ENXIO;
> > +             goto err;
> > +     }
> >
> >       /* Send Aksv over to PCH display for use in authentication */
> >       intel_de_write(dev_priv, HDCP_KEY_CONF,
> > HDCP_AKSV_SEND_TRIGGER);
> >
> >       return 0;
> > +
> > +err:
> > +     intel_hdcp_clear_keys(dev_priv);
> > +     return ret;
> >  }
> >
> >  /* Returns updated SHA-1 index */
> > @@ -399,25 +347,21 @@ u32 intel_hdcp_get_repeater_ctl(struct
> > drm_i915_private *dev_priv,
> >       }
> >  }
> >
> > -static
> > -int intel_hdcp_validate_v_prime(struct intel_connector *connector,
> > -                             const struct intel_hdcp_shim *shim,
> > -                             u8 *ksv_fifo, u8 num_downstream, u8
> > *bstatus)
> > +int intel_hdcp1_store_ksv_fifo(struct drm_connector *drm_connector,
> > +                            u8 *ksv_fifo, u8 num_downstream, u8 *bstat=
us,
> > +                            u32 *v_prime)
> >  {
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> >       struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >       struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> >       enum transcoder cpu_transcoder =3D connector-
> > >hdcp.cpu_transcoder;
> >       enum port port =3D dig_port->base.port;
> > -     u32 vprime, sha_text, sha_leftovers, rep_ctl;
> > +     u32 sha_text, sha_leftovers, rep_ctl;
> >       int ret, i, j, sha_idx;
> >
> >       /* Process V' values from the receiver */
> > -     for (i =3D 0; i < DRM_HDCP_V_PRIME_NUM_PARTS; i++) {
> > -             ret =3D shim->read_v_prime_part(dig_port, i, &vprime);
> > -             if (ret)
> > -                     return ret;
> > -             intel_de_write(dev_priv, HDCP_SHA_V_PRIME(i), vprime);
> > -     }
> > +     for (i =3D 0; i < DRM_HDCP_V_PRIME_NUM_PARTS; i++)
> > +             intel_de_write(dev_priv, HDCP_SHA_V_PRIME(i),
> > v_prime[i]);
> >
> >       /*
> >        * We need to write the concatenation of all device KSVs, BINFO (=
DP)
> > ||
> > @@ -642,131 +586,38 @@ int intel_hdcp_validate_v_prime(struct
> > intel_connector *connector,
> >       return 0;
> >  }
> >
> > -/* Implements Part 2 of the HDCP authorization procedure */
> > -static
> > -int intel_hdcp_auth_downstream(struct intel_connector *connector)
> > +int intel_hdcp1_store_receiver_info(struct drm_connector
> > *drm_connector,
> > +                                 u32 *ksv, u32 status, u8 caps,
> > +                                 bool repeater_present)
> >  {
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> >       struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >       struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > -     const struct intel_hdcp_shim *shim =3D connector->hdcp.shim;
> > -     u8 bstatus[2], num_downstream, *ksv_fifo;
> > -     int ret, i, tries =3D 3;
> > -
> > -     ret =3D intel_hdcp_poll_ksv_fifo(dig_port, shim);
> > -     if (ret) {
> > -             drm_dbg_kms(&dev_priv->drm,
> > -                         "KSV list failed to become ready (%d)\n", ret=
);
> > -             return ret;
> > -     }
> > -
> > -     ret =3D shim->read_bstatus(dig_port, bstatus);
> > -     if (ret)
> > -             return ret;
> > -
> > -     if (DRM_HDCP_MAX_DEVICE_EXCEEDED(bstatus[0]) ||
> > -         DRM_HDCP_MAX_CASCADE_EXCEEDED(bstatus[1])) {
> > -             drm_dbg_kms(&dev_priv->drm, "Max Topology Limit
> > Exceeded\n");
> > -             return -EPERM;
> > -     }
> > -
> > -     /*
> > -      * When repeater reports 0 device count, HDCP1.4 spec allows
> > disabling
> > -      * the HDCP encryption. That implies that repeater can't have its=
 own
> > -      * display. As there is no consumption of encrypted content in th=
e
> > -      * repeater with 0 downstream devices, we are failing the
> > -      * authentication.
> > -      */
> > -     num_downstream =3D DRM_HDCP_NUM_DOWNSTREAM(bstatus[0]);
> > -     if (num_downstream =3D=3D 0) {
> > -             drm_dbg_kms(&dev_priv->drm,
> > -                         "Repeater with zero downstream devices\n");
> > -             return -EINVAL;
> > -     }
> > -
> > -     ksv_fifo =3D kcalloc(DRM_HDCP_KSV_LEN, num_downstream,
> > GFP_KERNEL);
> > -     if (!ksv_fifo) {
> > -             drm_dbg_kms(&dev_priv->drm, "Out of mem: ksv_fifo\n");
> > -             return -ENOMEM;
> > -     }
> > -
> > -     ret =3D shim->read_ksv_fifo(dig_port, num_downstream, ksv_fifo);
> > -     if (ret)
> > -             goto err;
> > -
> > -     if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, ksv_fifo,
> > -                                     num_downstream) > 0) {
> > -             drm_err(&dev_priv->drm, "Revoked Ksv(s) in ksv_fifo\n");
> > -             ret =3D -EPERM;
> > -             goto err;
> > -     }
> > +     enum transcoder cpu_transcoder =3D connector-
> > >hdcp.cpu_transcoder;
> > +     enum port port =3D dig_port->base.port;
> >
> > -     /*
> > -      * When V prime mismatches, DP Spec mandates re-read of
> > -      * V prime atleast twice.
> > -      */
> > -     for (i =3D 0; i < tries; i++) {
> > -             ret =3D intel_hdcp_validate_v_prime(connector, shim,
> > -                                               ksv_fifo, num_downstrea=
m,
> > -                                               bstatus);
> > -             if (!ret)
> > -                     break;
> > -     }
> > +     intel_de_write(dev_priv, HDCP_BKSVLO(dev_priv, cpu_transcoder,
> > port),
> > +                    ksv[0]);
> > +     intel_de_write(dev_priv, HDCP_BKSVHI(dev_priv, cpu_transcoder,
> > port),
> > +                    ksv[1]);
> >
> > -     if (i =3D=3D tries) {
> > -             drm_dbg_kms(&dev_priv->drm,
> > -                         "V Prime validation failed.(%d)\n", ret);
> > -             goto err;
> > -     }
> > +     if (repeater_present)
> > +             intel_de_write(dev_priv, HDCP_REP_CTL,
> > +                            intel_hdcp_get_repeater_ctl(
> > +                                    dev_priv, cpu_transcoder, port));
> >
> > -     drm_dbg_kms(&dev_priv->drm, "HDCP is enabled (%d downstream
> > devices)\n",
> > -                 num_downstream);
> > -     ret =3D 0;
> > -err:
> > -     kfree(ksv_fifo);
> > -     return ret;
> > +     return 0;
> >  }
> >
> > -/* Implements Part 1 of the HDCP authorization procedure */
> > -static int intel_hdcp_auth(struct intel_connector *connector)
> > +int intel_hdcp1_read_an(struct drm_connector *drm_connector,
> > +                     struct drm_hdcp_an *an)
> >  {
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> >       struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >       struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > -     struct intel_hdcp *hdcp =3D &connector->hdcp;
> > -     const struct intel_hdcp_shim *shim =3D hdcp->shim;
> >       enum transcoder cpu_transcoder =3D connector-
> > >hdcp.cpu_transcoder;
> >       enum port port =3D dig_port->base.port;
> > -     unsigned long r0_prime_gen_start;
> > -     int ret, i, tries =3D 2;
> > -     union {
> > -             u32 reg[2];
> > -             u8 shim[DRM_HDCP_AN_LEN];
> > -     } an;
> > -     union {
> > -             u32 reg[2];
> > -             u8 shim[DRM_HDCP_KSV_LEN];
> > -     } bksv;
> > -     union {
> > -             u32 reg;
> > -             u8 shim[DRM_HDCP_RI_LEN];
> > -     } ri;
> > -     bool repeater_present, hdcp_capable;
> > -
> > -     /*
> > -      * Detects whether the display is HDCP capable. Although we check
> > for
> > -      * valid Bksv below, the HDCP over DP spec requires that we check
> > -      * whether the display supports HDCP before we write An. For HDMI
> > -      * displays, this is not necessary.
> > -      */
> > -     if (shim->hdcp_capable) {
> > -             ret =3D shim->hdcp_capable(dig_port, &hdcp_capable);
> > -             if (ret)
> > -                     return ret;
> > -             if (!hdcp_capable) {
> > -                     drm_dbg_kms(&dev_priv->drm,
> > -                                 "Panel is not HDCP capable\n");
> > -                     return -EINVAL;
> > -             }
> > -     }
> > +     int i;
> >
> >       /* Initialize An with 2 random values and acquire it */
> >       for (i =3D 0; i < 2; i++)
> > @@ -784,92 +635,81 @@ static int intel_hdcp_auth(struct intel_connector
> > *connector)
> >               return -ETIMEDOUT;
> >       }
> >
> > -     an.reg[0] =3D intel_de_read(dev_priv,
> > -                               HDCP_ANLO(dev_priv, cpu_transcoder,
> > port));
> > -     an.reg[1] =3D intel_de_read(dev_priv,
> > -                               HDCP_ANHI(dev_priv, cpu_transcoder,
> > port));
> > -     ret =3D shim->write_an_aksv(dig_port, an.shim);
> > -     if (ret)
> > -             return ret;
> > +     an->words[0] =3D intel_de_read(dev_priv,
> > +                                  HDCP_ANLO(dev_priv, cpu_transcoder,
> > port));
> > +     an->words[1] =3D intel_de_read(dev_priv,
> > +                                  HDCP_ANHI(dev_priv, cpu_transcoder,
> > port));
> >
> > -     r0_prime_gen_start =3D jiffies;
> > -
> > -     memset(&bksv, 0, sizeof(bksv));
> > -
> > -     ret =3D intel_hdcp_read_valid_bksv(dig_port, shim, bksv.shim);
> > -     if (ret < 0)
> > -             return ret;
> > -
> > -     if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, bksv.shim, 1) >
> > 0) {
> > -             drm_err(&dev_priv->drm, "BKSV is revoked\n");
> > -             return -EPERM;
> > -     }
> > -
> > -     intel_de_write(dev_priv, HDCP_BKSVLO(dev_priv, cpu_transcoder,
> > port),
> > -                    bksv.reg[0]);
> > -     intel_de_write(dev_priv, HDCP_BKSVHI(dev_priv, cpu_transcoder,
> > port),
> > -                    bksv.reg[1]);
> > -
> > -     ret =3D shim->repeater_present(dig_port, &repeater_present);
> > -     if (ret)
> > -             return ret;
> > -     if (repeater_present)
> > -             intel_de_write(dev_priv, HDCP_REP_CTL,
> > -                            intel_hdcp_get_repeater_ctl(dev_priv,
> > cpu_transcoder, port));
> > +     return 0;
> > +}
> >
> > -     ret =3D shim->toggle_signalling(dig_port, cpu_transcoder, true);
> > -     if (ret)
> > -             return ret;
> > +int intel_hdcp1_enable_encryption(struct drm_connector
> > *drm_connector)
> > +{
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> > +     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > +     enum transcoder cpu_transcoder =3D connector-
> > >hdcp.cpu_transcoder;
> > +     enum port port =3D dig_port->base.port;
> >
> >       intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder,
> > port),
> >                      HDCP_CONF_AUTH_AND_ENC);
> >
> > +     return 0;
> > +}
> > +
> > +int intel_hdcp1_wait_for_r0(struct drm_connector *drm_connector)
> > +{
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> > +     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > +     enum transcoder cpu_transcoder =3D connector-
> > >hdcp.cpu_transcoder;
> > +     enum port port =3D dig_port->base.port;
> > +
> >       /* Wait for R0 ready */
> > -     if (wait_for(intel_de_read(dev_priv, HDCP_STATUS(dev_priv,
> > cpu_transcoder, port)) &
> > -                  (HDCP_STATUS_R0_READY | HDCP_STATUS_ENC), 1)) {
> > +     if (wait_for((intel_de_read(dev_priv,
> > +                                 HDCP_STATUS(dev_priv, cpu_transcoder,
> > +                                             port))) &
> > +                          (HDCP_STATUS_R0_READY | HDCP_STATUS_ENC),
> > +                  1)) {
>
> Alignment here seem wrong
>
> >               drm_err(&dev_priv->drm, "Timed out waiting for R0
> > ready\n");
> >               return -ETIMEDOUT;
> >       }
> >
> > -     /*
> > -      * Wait for R0' to become available. The spec says 100ms from Aks=
v,
> > but
> > -      * some monitors can take longer than this. We'll set the timeout=
 at
> > -      * 300ms just to be sure.
> > -      *
> > -      * On DP, there's an R0_READY bit available but no such bit
> > -      * exists on HDMI. Since the upper-bound is the same, we'll just =
do
> > -      * the stupid thing instead of polling on one and not the other.
> > -      */
> > -     wait_remaining_ms_from_jiffies(r0_prime_gen_start, 300);
> > -
> > -     tries =3D 3;
> > +     return 0;
> > +}
> >
> > -     /*
> > -      * DP HDCP Spec mandates the two more reattempt to read R0,
> > incase
> > -      * of R0 mismatch.
> > -      */
> > -     for (i =3D 0; i < tries; i++) {
> > -             ri.reg =3D 0;
> > -             ret =3D shim->read_ri_prime(dig_port, ri.shim);
> > -             if (ret)
> > -                     return ret;
> > -             intel_de_write(dev_priv,
> > -                            HDCP_RPRIME(dev_priv, cpu_transcoder, port=
),
> > -                            ri.reg);
> > +int intel_hdcp1_match_ri(struct drm_connector *drm_connector, u32
> > ri_prime)
> > +{
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> > +     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > +     enum transcoder cpu_transcoder =3D connector-
> > >hdcp.cpu_transcoder;
> > +     enum port port =3D dig_port->base.port;
> >
> > -             /* Wait for Ri prime match */
> > -             if (!wait_for(intel_de_read(dev_priv,
> > HDCP_STATUS(dev_priv, cpu_transcoder, port)) &
> > -                           (HDCP_STATUS_RI_MATCH |
> > HDCP_STATUS_ENC), 1))
> > -                     break;
> > -     }
> > +     intel_de_write(dev_priv, HDCP_RPRIME(dev_priv, cpu_transcoder,
> > port),
> > +                    ri_prime);
> >
> > -     if (i =3D=3D tries) {
> > -             drm_dbg_kms(&dev_priv->drm,
> > -                         "Timed out waiting for Ri prime match (%x)\n"=
,
> > -                         intel_de_read(dev_priv, HDCP_STATUS(dev_priv,
> > -                                       cpu_transcoder, port)));
> > +     /* Wait for Ri prime match */
> > +     if (wait_for(intel_de_read(dev_priv,
> > +                                HDCP_STATUS(dev_priv, cpu_transcoder,
> > port)) &
> > +                          (HDCP_STATUS_RI_MATCH |
> > HDCP_STATUS_ENC),
> > +                  1))
> >               return -ETIMEDOUT;
> > -     }
> > +
> > +     return 0;
> > +}
> > +
> > +int intel_hdcp1_post_encryption(struct drm_connector *drm_connector)
> > +{
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> > +     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > +     enum transcoder cpu_transcoder =3D connector-
> > >hdcp.cpu_transcoder;
> > +     enum port port =3D dig_port->base.port;
> >
> >       /* Wait for encryption confirmation */
> >       if (intel_de_wait_for_set(dev_priv,
> > @@ -880,56 +720,22 @@ static int intel_hdcp_auth(struct intel_connector
> > *connector)
> >               return -ETIMEDOUT;
> >       }
> >
> > -     /* DP MST Auth Part 1 Step 2.a and Step 2.b */
> > -     if (shim->stream_encryption) {
> > -             ret =3D shim->stream_encryption(connector, true);
> > -             if (ret) {
> > -                     drm_err(&dev_priv->drm, "[%s:%d] Failed to enable
> > HDCP 1.4 stream enc\n",
> > -                             connector->base.name, connector-
> > >base.base.id);
> > -                     return ret;
> > -             }
> > -             drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s
> > stream encrypted\n",
> > -                         transcoder_name(hdcp->stream_transcoder));
> > -     }
> > -
> > -     if (repeater_present)
> > -             return intel_hdcp_auth_downstream(connector);
> > -
> > -     drm_dbg_kms(&dev_priv->drm, "HDCP is enabled (no repeater
> > present)\n");
> >       return 0;
> >  }
> >
> > -static int _intel_hdcp_disable(struct intel_connector *connector)
> > +int intel_hdcp1_disable(struct drm_connector *drm_connector)
> >  {
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> >       struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >       struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> >       struct intel_hdcp *hdcp =3D &connector->hdcp;
> >       enum port port =3D dig_port->base.port;
> >       enum transcoder cpu_transcoder =3D hdcp->cpu_transcoder;
> >       u32 repeater_ctl;
> > -     int ret;
> >
> >       drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being
> > disabled...\n",
> >                   connector->base.name, connector->base.base.id);
> >
> > -     if (hdcp->shim->stream_encryption) {
> > -             ret =3D hdcp->shim->stream_encryption(connector, false);
> > -             if (ret) {
> > -                     drm_err(&dev_priv->drm, "[%s:%d] Failed to disabl=
e
> > HDCP 1.4 stream enc\n",
> > -                             connector->base.name, connector-
> > >base.base.id);
> > -                     return ret;
> > -             }
> > -             drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s
> > stream encryption disabled\n",
> > -                         transcoder_name(hdcp->stream_transcoder));
> > -             /*
> > -              * If there are other connectors on this port using HDCP,
> > -              * don't disable it until it disabled HDCP encryption for
> > -              * all connectors in MST topology.
> > -              */
> > -             if (dig_port->num_hdcp_streams > 0)
> > -                     return 0;
> > -     }
> > -
> >       hdcp->hdcp_encrypted =3D false;
> >       intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder,
> > port), 0);
> >       if (intel_de_wait_for_clear(dev_priv,
> > @@ -945,190 +751,9 @@ static int _intel_hdcp_disable(struct
> > intel_connector *connector)
> >       intel_de_write(dev_priv, HDCP_REP_CTL,
> >                      intel_de_read(dev_priv, HDCP_REP_CTL) &
> > ~repeater_ctl);
> >
> > -     ret =3D hdcp->shim->toggle_signalling(dig_port, cpu_transcoder,
> > false);
> > -     if (ret) {
> > -             drm_err(&dev_priv->drm, "Failed to disable HDCP
> > signalling\n");
> > -             return ret;
> > -     }
> > -
> > -     drm_dbg_kms(&dev_priv->drm, "HDCP is disabled\n");
> >       return 0;
> >  }
> >
> > -static int _intel_hdcp_enable(struct intel_connector *connector)
> > -{
> > -     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > -     struct intel_hdcp *hdcp =3D &connector->hdcp;
> > -     int i, ret, tries =3D 3;
> > -
> > -     drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being
> > enabled...\n",
> > -                 connector->base.name, connector->base.base.id);
> > -
> > -     if (!hdcp_key_loadable(dev_priv)) {
> > -             drm_err(&dev_priv->drm, "HDCP key Load is not
> > possible\n");
> > -             return -ENXIO;
> > -     }
> > -
> > -     for (i =3D 0; i < KEY_LOAD_TRIES; i++) {
> > -             ret =3D intel_hdcp_load_keys(dev_priv);
> > -             if (!ret)
> > -                     break;
> > -             intel_hdcp_clear_keys(dev_priv);
> > -     }
> > -     if (ret) {
> > -             drm_err(&dev_priv->drm, "Could not load HDCP keys,
> > (%d)\n",
> > -                     ret);
> > -             return ret;
> > -     }
> > -
> > -     /* Incase of authentication failures, HDCP spec expects reauth. *=
/
> > -     for (i =3D 0; i < tries; i++) {
> > -             ret =3D intel_hdcp_auth(connector);
> > -             if (!ret) {
> > -                     hdcp->hdcp_encrypted =3D true;
> > -                     return 0;
> > -             }
> > -
> > -             drm_dbg_kms(&dev_priv->drm, "HDCP Auth failure (%d)\n",
> > ret);
> > -
> > -             /* Ensuring HDCP encryption and signalling are stopped. *=
/
> > -             _intel_hdcp_disable(connector);
> > -     }
> > -
> > -     drm_dbg_kms(&dev_priv->drm,
> > -                 "HDCP authentication failed (%d tries/%d)\n", tries, =
ret);
> > -     return ret;
> > -}
> > -
> > -static struct intel_connector *intel_hdcp_to_connector(struct intel_hd=
cp
> > *hdcp)
> > -{
> > -     return container_of(hdcp, struct intel_connector, hdcp);
> > -}
> > -
> > -static void intel_hdcp_update_value(struct intel_connector *connector,
> > -                                 u64 value, bool update_property)
> > -{
> > -     struct drm_device *dev =3D connector->base.dev;
> > -     struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> > -     struct intel_hdcp *hdcp =3D &connector->hdcp;
> > -
> > -     drm_WARN_ON(connector->base.dev, !mutex_is_locked(&hdcp-
> > >mutex));
> > -
> > -     if (hdcp->value =3D=3D value)
> > -             return;
> > -
> > -     drm_WARN_ON(dev, !mutex_is_locked(&dig_port->hdcp_mutex));
> > -
> > -     if (hdcp->value =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > -             if (!drm_WARN_ON(dev, dig_port->num_hdcp_streams =3D=3D
> > 0))
> > -                     dig_port->num_hdcp_streams--;
> > -     } else if (value =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > -             dig_port->num_hdcp_streams++;
> > -     }
> > -
> > -     hdcp->value =3D value;
> > -     if (update_property) {
> > -             drm_connector_get(&connector->base);
> > -             schedule_work(&hdcp->prop_work);
> > -     }
> > -}
> > -
> > -/* Implements Part 3 of the HDCP authorization procedure */
> > -static int intel_hdcp_check_link(struct intel_connector *connector)
> > -{
> > -     struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> > -     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > -     struct intel_hdcp *hdcp =3D &connector->hdcp;
> > -     enum port port =3D dig_port->base.port;
> > -     enum transcoder cpu_transcoder;
> > -     int ret =3D 0;
> > -
> > -     mutex_lock(&hdcp->mutex);
> > -     mutex_lock(&dig_port->hdcp_mutex);
> > -
> > -     cpu_transcoder =3D hdcp->cpu_transcoder;
> > -
> > -     /* Check_link valid only when HDCP1.4 is enabled */
> > -     if (hdcp->value !=3D DRM_MODE_CONTENT_PROTECTION_ENABLED
> > ||
> > -         !hdcp->hdcp_encrypted) {
> > -             ret =3D -EINVAL;
> > -             goto out;
> > -     }
> > -
> > -     if (drm_WARN_ON(&dev_priv->drm,
> > -                     !intel_hdcp_in_use(dev_priv, cpu_transcoder,
> > port))) {
> > -             drm_err(&dev_priv->drm,
> > -                     "%s:%d HDCP link stopped encryption,%x\n",
> > -                     connector->base.name, connector->base.base.id,
> > -                     intel_de_read(dev_priv, HDCP_STATUS(dev_priv,
> > cpu_transcoder, port)));
> > -             ret =3D -ENXIO;
> > -             intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_DESIRED,
> > -                                     true);
> > -             goto out;
> > -     }
> > -
> > -     if (hdcp->shim->check_link(dig_port, connector)) {
> > -             if (hdcp->value !=3D
> > DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> > -                     intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_ENABLED, true);
> > -             }
> > -             goto out;
> > -     }
> > -
> > -     drm_dbg_kms(&dev_priv->drm,
> > -                 "[%s:%d] HDCP link failed, retrying authentication\n"=
,
> > -                 connector->base.name, connector->base.base.id);
> > -
> > -     ret =3D _intel_hdcp_disable(connector);
> > -     if (ret) {
> > -             drm_err(&dev_priv->drm, "Failed to disable hdcp (%d)\n",
> > ret);
> > -             intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_DESIRED,
> > -                                     true);
> > -             goto out;
> > -     }
> > -
> > -     ret =3D _intel_hdcp_enable(connector);
> > -     if (ret) {
> > -             drm_err(&dev_priv->drm, "Failed to enable hdcp (%d)\n",
> > ret);
> > -             intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_DESIRED,
> > -                                     true);
> > -             goto out;
> > -     }
> > -
> > -out:
> > -     mutex_unlock(&dig_port->hdcp_mutex);
> > -     mutex_unlock(&hdcp->mutex);
> > -     return ret;
> > -}
> > -
> > -static void intel_hdcp_prop_work(struct work_struct *work)
> > -{
> > -     struct intel_hdcp *hdcp =3D container_of(work, struct intel_hdcp,
> > -                                            prop_work);
> > -     struct intel_connector *connector =3D intel_hdcp_to_connector(hdc=
p);
> > -     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > -
> > -     drm_modeset_lock(&dev_priv-
> > >drm.mode_config.connection_mutex, NULL);
> > -     mutex_lock(&hdcp->mutex);
> > -
> > -     /*
> > -      * This worker is only used to flip between ENABLED/DESIRED. Eith=
er
> > of
> > -      * those to UNDESIRED is handled by core. If value =3D=3D UNDESIR=
ED,
> > -      * we're running just after hdcp has been disabled, so just exit
> > -      */
> > -     if (hdcp->value !=3D
> > DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
> > -             drm_hdcp_update_content_protection(&connector->base,
> > -                                                hdcp->value);
> > -
> > -     mutex_unlock(&hdcp->mutex);
> > -     drm_modeset_unlock(&dev_priv-
> > >drm.mode_config.connection_mutex);
> > -
> > -     drm_connector_put(&connector->base);
> > -}
> > -
> >  bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port
> > port)
> >  {
> >       return RUNTIME_INFO(dev_priv)->has_hdcp &&
> > @@ -1961,8 +1586,9 @@ static int hdcp2_authenticate_and_encrypt(struct
> > intel_connector *connector)
> >       return ret;
> >  }
> >
> > -static int _intel_hdcp2_enable(struct intel_connector *connector)
> > +int intel_hdcp2_enable(struct drm_connector *drm_connector)
> >  {
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> >       struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> >       struct intel_hdcp *hdcp =3D &connector->hdcp;
> >       int ret;
> > @@ -2024,9 +1650,15 @@ _intel_hdcp2_disable(struct intel_connector
> > *connector, bool hdcp2_link_recovery
> >       return ret;
> >  }
> >
> > +int intel_hdcp2_disable(struct drm_connector *drm_connector)
> > +{
> > +     return _intel_hdcp2_disable(to_intel_connector(drm_connector),
> > false);
> > +}
> > +
> >  /* Implements the Link Integrity Check for HDCP2.2 */
> > -static int intel_hdcp2_check_link(struct intel_connector *connector)
> > +int intel_hdcp2_check_link(struct drm_connector *drm_connector)
> >  {
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> >       struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> >       struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> >       struct intel_hdcp *hdcp =3D &connector->hdcp;
> > @@ -2034,109 +1666,39 @@ static int intel_hdcp2_check_link(struct
> > intel_connector *connector)
> >       enum transcoder cpu_transcoder;
> >       int ret =3D 0;
> >
> > -     mutex_lock(&hdcp->mutex);
> > -     mutex_lock(&dig_port->hdcp_mutex);
> >       cpu_transcoder =3D hdcp->cpu_transcoder;
> >
> >       /* hdcp2_check_link is expected only when HDCP2.2 is Enabled */
> > -     if (hdcp->value !=3D DRM_MODE_CONTENT_PROTECTION_ENABLED
> > ||
> > -         !hdcp->hdcp2_encrypted) {
> > -             ret =3D -EINVAL;
> > -             goto out;
> > -     }
> > +     if (!hdcp->hdcp2_encrypted)
> > +             return -EINVAL;
> >
> >       if (drm_WARN_ON(&dev_priv->drm,
> >                       !intel_hdcp2_in_use(dev_priv, cpu_transcoder,
> > port))) {
> >               drm_err(&dev_priv->drm,
> >                       "HDCP2.2 link stopped the encryption, %x\n",
> >                       intel_de_read(dev_priv, HDCP2_STATUS(dev_priv,
> > cpu_transcoder, port)));
> > -             ret =3D -ENXIO;
> > -             _intel_hdcp2_disable(connector, true);
> > -             intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_DESIRED,
> > -                                     true);
> > -             goto out;
> > +             return -ENXIO;
> >       }
> >
> >       ret =3D hdcp->shim->check_2_2_link(dig_port, connector);
> > -     if (ret =3D=3D HDCP_LINK_PROTECTED) {
> > -             if (hdcp->value !=3D
> > DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> > -                     intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_ENABLED,
> > -                                     true);
> > -             }
> > -             goto out;
> > -     }
> > +     if (ret =3D=3D HDCP_LINK_PROTECTED)
> > +             return 0;
> >
> >       if (ret =3D=3D HDCP_TOPOLOGY_CHANGE) {
> > -             if (hdcp->value =3D=3D
> > DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
> > -                     goto out;
> > -
> >               drm_dbg_kms(&dev_priv->drm,
> >                           "HDCP2.2 Downstream topology change\n");
> >               ret =3D hdcp2_authenticate_repeater_topology(connector);
> > -             if (!ret) {
> > -                     intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_ENABLED,
> > -                                     true);
> > -                     goto out;
> > -             }
> > -             drm_dbg_kms(&dev_priv->drm,
> > -                         "[%s:%d] Repeater topology auth failed.(%d)\n=
",
> > -                         connector->base.name, connector->base.base.id=
,
> > -                         ret);
> > -     } else {
> > -             drm_dbg_kms(&dev_priv->drm,
> > -                         "[%s:%d] HDCP2.2 link failed, retrying auth\n=
",
> > -                         connector->base.name, connector->base.base.id=
);
> > -     }
> > -
> > -     ret =3D _intel_hdcp2_disable(connector, true);
> > -     if (ret) {
> > -             drm_err(&dev_priv->drm,
> > -                     "[%s:%d] Failed to disable hdcp2.2 (%d)\n",
> > -                     connector->base.name, connector->base.base.id,
> > ret);
> > -             intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_DESIRED, true);
> > -             goto out;
> > -     }
> > +             if (!ret)
> > +                     return 0;
> >
> > -     ret =3D _intel_hdcp2_enable(connector);
> > -     if (ret) {
> >               drm_dbg_kms(&dev_priv->drm,
> > -                         "[%s:%d] Failed to enable hdcp2.2 (%d)\n",
> > -                         connector->base.name, connector->base.base.id=
,
> > -                         ret);
> > -             intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_DESIRED,
> > -                                     true);
> > -             goto out;
> > +                         "[%s:%d] Repeater topology auth failed.(%d)\n=
",
> > +                         connector->base.name, connector->base.base.id=
,
> > ret);
> >       }
> >
> > -out:
> > -     mutex_unlock(&dig_port->hdcp_mutex);
> > -     mutex_unlock(&hdcp->mutex);
> >       return ret;
> >  }
>
> Wouldn't it be better if we used that value in drm_hdcp_helper_data rathe=
r than getting rid of all these checks
> As they are needed same thing for other places where the checks are remov=
ed because value isn't present in
> Intel_hdcp structure
>
I'm not 100% sure I get what you're referring to, but basically the
work has been split between the helper and the driver. the intel
specific protocol is what remains in the driver. Everything else is
handled in the helper.
> >
> > -static void intel_hdcp_check_work(struct work_struct *work)
> > -{
> > -     struct intel_hdcp *hdcp =3D container_of(to_delayed_work(work),
> > -                                            struct intel_hdcp,
> > -                                            check_work);
> > -     struct intel_connector *connector =3D intel_hdcp_to_connector(hdc=
p);
> > -
> > -     if (drm_connector_is_unregistered(&connector->base))
> > -             return;
> > -
> > -     if (!intel_hdcp2_check_link(connector))
> > -             schedule_delayed_work(&hdcp->check_work,
> > -                                   DRM_HDCP2_CHECK_PERIOD_MS);
> > -     else if (!intel_hdcp_check_link(connector))
> > -             schedule_delayed_work(&hdcp->check_work,
> > -                                   DRM_HDCP_CHECK_PERIOD_MS);
> > -}
> > -
> >  static int i915_hdcp_component_bind(struct device *i915_kdev,
> >                                   struct device *mei_kdev, void *data)
> >  {
> > @@ -2189,22 +1751,28 @@ static enum mei_fw_tc
> > intel_get_mei_fw_tc(enum transcoder cpu_transcoder)
> >       }
> >  }
> >
> > -static int
> > -_intel_hdcp_setup(struct intel_connector *connector,
> > -               const struct intel_crtc_state *pipe_config, u8 content_=
type)
> > +int intel_hdcp_setup(struct drm_connector *connector,
> > +                  struct drm_atomic_state *state)
> >  {
> > -     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > -     struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> > -     struct intel_hdcp *hdcp =3D &connector->hdcp;
> > +     struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
> > +     struct intel_connector *intel_connector =3D
> > to_intel_connector(connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(intel_connector);
> > +     struct drm_connector_state *conn_state;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct intel_crtc_state *pipe_config;
> > +     struct intel_hdcp *hdcp =3D &intel_connector->hdcp;
> >       int ret =3D 0;
> >
> > -     if (!connector->encoder) {
> > +     if (!intel_connector->encoder) {
> >               drm_err(&dev_priv->drm, "[%s:%d] encoder is not
> > initialized\n",
> > -                     connector->base.name, connector->base.base.id);
> > +                     connector->name, connector->base.id);
> >               return -ENODEV;
> >       }
> >
> > -     hdcp->content_type =3D content_type;
> > +     conn_state =3D drm_atomic_get_new_connector_state(state,
> > connector);
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state-
> > >crtc);
> > +     pipe_config =3D to_intel_crtc_state(crtc_state);
> >
> >       if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST)) {
> >               hdcp->cpu_transcoder =3D pipe_config-
> > >mst_master_transcoder;
> > @@ -2321,7 +1889,6 @@ int intel_hdcp_init(struct intel_connector
> > *connector,
> >  {
> >       struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> >       struct intel_hdcp *hdcp =3D &connector->hdcp;
> > -     int ret;
> >
> >       if (!shim)
> >               return -EINVAL;
> > @@ -2329,174 +1896,12 @@ int intel_hdcp_init(struct intel_connector
> > *connector,
> >       if (is_hdcp2_supported(dev_priv))
> >               intel_hdcp2_init(connector, dig_port, shim);
> >
> > -     ret =3D
> > -     drm_connector_attach_content_protection_property(&connector-
> > >base,
> > -                                                      hdcp-
> > >hdcp2_supported);
> > -     if (ret) {
> > -             hdcp->hdcp2_supported =3D false;
> > -             kfree(dig_port->hdcp_port_data.streams);
> > -             return ret;
> > -     }
> > -
> >       hdcp->shim =3D shim;
> > -     mutex_init(&hdcp->mutex);
>
> I don't think removing mutex is a good idea
>
The mutex is just moved to the drm hdpc helper. Is there any race
condition that you might be missing?
> Regards,
> Suraj Kandpal
> > -     INIT_DELAYED_WORK(&hdcp->check_work,
> > intel_hdcp_check_work);
> > -     INIT_WORK(&hdcp->prop_work, intel_hdcp_prop_work);
> >       init_waitqueue_head(&hdcp->cp_irq_queue);
> >
> >       return 0;
> >  }
> >
> > -int intel_hdcp_enable(struct intel_connector *connector,
> > -                   const struct intel_crtc_state *pipe_config, u8
> > content_type)
> > -{
> > -     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > -     struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> > -     struct intel_hdcp *hdcp =3D &connector->hdcp;
> > -     unsigned long check_link_interval =3D
> > DRM_HDCP_CHECK_PERIOD_MS;
> > -     bool capable;
> > -     int ret =3D -EINVAL;
> > -
> > -     if (!hdcp->shim)
> > -             return -ENOENT;
> > -
> > -     mutex_lock(&hdcp->mutex);
> > -     mutex_lock(&dig_port->hdcp_mutex);
> > -     drm_WARN_ON(&dev_priv->drm,
> > -                 hdcp->value =3D=3D
> > DRM_MODE_CONTENT_PROTECTION_ENABLED);
> > -
> > -     ret =3D _intel_hdcp_setup(connector, pipe_config, content_type);
> > -     if (ret)
> > -             goto out;
> > -
> > -     /*
> > -      * Considering that HDCP2.2 is more secure than HDCP1.4, If the
> > setup
> > -      * is capable of HDCP2.2, it is preferred to use HDCP2.2.
> > -      */
> > -     ret =3D intel_hdcp2_capable(connector, &capable);
> > -     if (capable) {
> > -             ret =3D _intel_hdcp2_enable(connector);
> > -             if (!ret) {
> > -                     check_link_interval =3D
> > DRM_HDCP2_CHECK_PERIOD_MS;
> > -                     goto out;
> > -             }
> > -     }
> > -
> > -     /*
> > -      * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
> > -      * be attempted.
> > -      */
> > -     ret =3D intel_hdcp_capable(connector, &capable);
> > -     if (ret)
> > -             goto out;
> > -
> > -     if (capable && hdcp->content_type !=3D
> > DRM_MODE_HDCP_CONTENT_TYPE1)
> > -             ret =3D _intel_hdcp_enable(connector);
> > -
> > -out:
> > -     if (!ret) {
> > -             schedule_delayed_work(&hdcp->check_work,
> > check_link_interval);
> > -             intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_ENABLED,
> > -                                     true);
> > -     }
> > -
> > -     mutex_unlock(&dig_port->hdcp_mutex);
> > -     mutex_unlock(&hdcp->mutex);
> > -     return ret;
> > -}
> > -
> > -int intel_hdcp_disable(struct intel_connector *connector)
> > -{
> > -     struct intel_digital_port *dig_port =3D
> > intel_attached_dig_port(connector);
> > -     struct intel_hdcp *hdcp =3D &connector->hdcp;
> > -     int ret =3D 0;
> > -
> > -     if (!hdcp->shim)
> > -             return -ENOENT;
> > -
> > -     mutex_lock(&hdcp->mutex);
> > -     mutex_lock(&dig_port->hdcp_mutex);
> > -
> > -     if (hdcp->value =3D=3D
> > DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
> > -             goto out;
> > -
> > -     intel_hdcp_update_value(connector,
> > -
> >       DRM_MODE_CONTENT_PROTECTION_UNDESIRED, false);
> > -     if (hdcp->hdcp2_encrypted)
> > -             ret =3D _intel_hdcp2_disable(connector, false);
> > -     else if (hdcp->hdcp_encrypted)
> > -             ret =3D _intel_hdcp_disable(connector);
> > -
> > -out:
> > -     mutex_unlock(&dig_port->hdcp_mutex);
> > -     mutex_unlock(&hdcp->mutex);
> > -     cancel_delayed_work_sync(&hdcp->check_work);
> > -     return ret;
> > -}
> > -
> > -void intel_hdcp_update_pipe(struct intel_atomic_state *state,
> > -                         struct intel_encoder *encoder,
> > -                         const struct intel_crtc_state *crtc_state,
> > -                         const struct drm_connector_state *conn_state)
> > -{
> > -     struct intel_connector *connector =3D
> > -                             to_intel_connector(conn_state->connector)=
;
> > -     struct intel_hdcp *hdcp =3D &connector->hdcp;
> > -     bool content_protection_type_changed, desired_and_not_enabled
> > =3D false;
> > -
> > -     if (!connector->hdcp.shim)
> > -             return;
> > -
> > -     content_protection_type_changed =3D
> > -             (conn_state->hdcp_content_type !=3D hdcp->content_type
> > &&
> > -              conn_state->content_protection !=3D
> > -              DRM_MODE_CONTENT_PROTECTION_UNDESIRED);
> > -
> > -     /*
> > -      * During the HDCP encryption session if Type change is requested=
,
> > -      * disable the HDCP and reenable it with new TYPE value.
> > -      */
> > -     if (conn_state->content_protection =3D=3D
> > -         DRM_MODE_CONTENT_PROTECTION_UNDESIRED ||
> > -         content_protection_type_changed)
> > -             intel_hdcp_disable(connector);
> > -
> > -     /*
> > -      * Mark the hdcp state as DESIRED after the hdcp disable of type
> > -      * change procedure.
> > -      */
> > -     if (content_protection_type_changed) {
> > -             mutex_lock(&hdcp->mutex);
> > -             hdcp->value =3D
> > DRM_MODE_CONTENT_PROTECTION_DESIRED;
> > -             drm_connector_get(&connector->base);
> > -             schedule_work(&hdcp->prop_work);
> > -             mutex_unlock(&hdcp->mutex);
> > -     }
> > -
> > -     if (conn_state->content_protection =3D=3D
> > -         DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > -             mutex_lock(&hdcp->mutex);
> > -             /* Avoid enabling hdcp, if it already ENABLED */
> > -             desired_and_not_enabled =3D
> > -                     hdcp->value !=3D
> > DRM_MODE_CONTENT_PROTECTION_ENABLED;
> > -             mutex_unlock(&hdcp->mutex);
> > -             /*
> > -              * If HDCP already ENABLED and CP property is DESIRED,
> > schedule
> > -              * prop_work to update correct CP property to user space.
> > -              */
> > -             if (!desired_and_not_enabled &&
> > !content_protection_type_changed) {
> > -                     drm_connector_get(&connector->base);
> > -                     schedule_work(&hdcp->prop_work);
> > -             }
> > -     }
> > -
> > -     if (desired_and_not_enabled || content_protection_type_changed)
> > -             intel_hdcp_enable(connector,
> > -                               crtc_state,
> > -                               (u8)conn_state->hdcp_content_type);
> > -}
> > -
> >  void intel_hdcp_component_fini(struct drm_i915_private *dev_priv)
> >  {
> >       mutex_lock(&dev_priv->display.hdcp.comp_mutex);
> > @@ -2518,33 +1923,8 @@ void intel_hdcp_cleanup(struct intel_connector
> > *connector)
> >       if (!hdcp->shim)
> >               return;
> >
> > -     /*
> > -      * If the connector is registered, it's possible userspace could =
kick
> > -      * off another HDCP enable, which would re-spawn the workers.
> > -      */
> > -     drm_WARN_ON(connector->base.dev,
> > -             connector->base.registration_state =3D=3D
> > DRM_CONNECTOR_REGISTERED);
> > -
> > -     /*
> > -      * Now that the connector is not registered, check_work won't be
> > run,
> > -      * but cancel any outstanding instances of it
> > -      */
> > -     cancel_delayed_work_sync(&hdcp->check_work);
> > -
> > -     /*
> > -      * We don't cancel prop_work in the same way as check_work since =
it
> > -      * requires connection_mutex which could be held while calling th=
is
> > -      * function. Instead, we rely on the connector references grabbed
> > before
> > -      * scheduling prop_work to ensure the connector is alive when
> > prop_work
> > -      * is run. So if we're in the destroy path (which is where this
> > -      * function should be called), we're "guaranteed" that prop_work =
is
> > not
> > -      * active (tl;dr This Should Never Happen).
> > -      */
> > -     drm_WARN_ON(connector->base.dev, work_pending(&hdcp-
> > >prop_work));
> > -
> > -     mutex_lock(&hdcp->mutex);
> > +     drm_hdcp_helper_destroy(connector->hdcp_helper_data);
> >       hdcp->shim =3D NULL;
> > -     mutex_unlock(&hdcp->mutex);
> >  }
> >
> >  /* Handles the CP_IRQ raised from the DP HDCP sink */
> > @@ -2558,5 +1938,5 @@ void intel_hdcp_handle_cp_irq(struct
> > intel_connector *connector)
> >       atomic_inc(&connector->hdcp.cp_irq_count);
> >       wake_up_all(&connector->hdcp.cp_irq_queue);
> >
> > -     schedule_delayed_work(&hdcp->check_work, 0);
> > +     drm_hdcp_helper_schedule_hdcp_check(connector-
> > >hdcp_helper_data);
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h
> > b/drivers/gpu/drm/i915/display/intel_hdcp.h
> > index f06f6e5a2b1a..49b9d79eb30a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> > @@ -10,8 +10,10 @@
> >
> >  #define HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS        50
> >
> > +struct drm_atomic_state;
> >  struct drm_connector;
> >  struct drm_connector_state;
> > +struct drm_hdcp_an;
> >  struct drm_i915_private;
> >  struct intel_atomic_state;
> >  struct intel_connector;
> > @@ -25,16 +27,29 @@ enum transcoder;
> >  int intel_hdcp_init(struct intel_connector *connector,
> >                   struct intel_digital_port *dig_port,
> >                   const struct intel_hdcp_shim *hdcp_shim);
> > -int intel_hdcp_enable(struct intel_connector *connector,
> > -                   const struct intel_crtc_state *pipe_config, u8
> > content_type);
> > -int intel_hdcp_disable(struct intel_connector *connector);
> > -void intel_hdcp_update_pipe(struct intel_atomic_state *state,
> > -                         struct intel_encoder *encoder,
> > -                         const struct intel_crtc_state *crtc_state,
> > -                         const struct drm_connector_state *conn_state)=
;
> > +int intel_hdcp_setup(struct drm_connector *drm_connector,
> > +                  struct drm_atomic_state *state);
> > +int intel_hdcp_load_keys(struct drm_connector *drm_connector);
> >  bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port
> > port);
> >  int intel_hdcp_capable(struct intel_connector *connector, bool *capabl=
e);
> > -int intel_hdcp2_capable(struct intel_connector *connector, bool *capab=
le);
> > +int intel_hdcp2_capable(struct drm_connector *drm_connector, bool
> > *capable);
> > +int intel_hdcp2_enable(struct drm_connector *drm_connector);
> > +int intel_hdcp2_disable(struct drm_connector *drm_connector);
> > +int intel_hdcp2_check_link(struct drm_connector *drm_connector);
> > +int intel_hdcp1_store_receiver_info(struct drm_connector
> > *drm_connector,
> > +                                 u32 *ksv, u32 status, u8 caps,
> > +                                 bool repeater_present);
> > +int intel_hdcp1_read_an(struct drm_connector *drm_connector,
> > +                     struct drm_hdcp_an *an);
> > +int intel_hdcp1_enable_encryption(struct drm_connector
> > *drm_connector);
> > +int intel_hdcp1_wait_for_r0(struct drm_connector *drm_connector);
> > +int intel_hdcp1_match_ri(struct drm_connector *drm_connector, u32
> > ri_prime);
> > +int intel_hdcp1_post_encryption(struct drm_connector *drm_connector);
> > +int intel_hdcp1_store_ksv_fifo(struct drm_connector *drm_connector,
> > +                            u8 *ksv_fifo, u8 num_downstream, u8 *bstat=
us,
> > +                            u32 *v_prime);
> > +int intel_hdcp1_check_link(struct drm_connector *drm_connector);
> > +int intel_hdcp1_disable(struct drm_connector *drm_connector);
> >  void intel_hdcp_component_init(struct drm_i915_private *dev_priv);
> >  void intel_hdcp_component_fini(struct drm_i915_private *dev_priv);
> >  void intel_hdcp_cleanup(struct intel_connector *connector);
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > index 7816b2a33fee..c33cfedb2e19 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > @@ -1324,17 +1324,24 @@ static int intel_hdmi_hdcp_write(struct
> > intel_digital_port *dig_port,
> >       return ret;
> >  }
> >
> > -static
> > -int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
> > -                               u8 *an)
> > +static int intel_hdmi_hdcp1_send_an_aksv(struct drm_connector
> > *drm_connector)
> >  {
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> >       struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> >       struct intel_hdmi *hdmi =3D &dig_port->hdmi;
> >       struct i2c_adapter *adapter =3D intel_gmbus_get_adapter(i915,
> >                                                             hdmi->ddc_b=
us);
> > +     struct drm_hdcp_an an;
> >       int ret;
> >
> > -     ret =3D intel_hdmi_hdcp_write(dig_port, DRM_HDCP_DDC_AN, an,
> > +     /* Output An first, that's easy */
> > +     ret =3D intel_hdcp1_read_an(drm_connector, &an);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D intel_hdmi_hdcp_write(dig_port, DRM_HDCP_DDC_AN,
> > an.bytes,
> >                                   DRM_HDCP_AN_LEN);
> >       if (ret) {
> >               drm_dbg_kms(&i915->drm, "Write An over DDC failed
> > (%d)\n",
> > @@ -1350,120 +1357,6 @@ int intel_hdmi_hdcp_write_an_aksv(struct
> > intel_digital_port *dig_port,
> >       return 0;
> >  }
> >
> > -static int intel_hdmi_hdcp_read_bksv(struct intel_digital_port *dig_po=
rt,
> > -                                  u8 *bksv)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -
> > -     int ret;
> > -     ret =3D intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_BKSV, bksv,
> > -                                DRM_HDCP_KSV_LEN);
> > -     if (ret)
> > -             drm_dbg_kms(&i915->drm, "Read Bksv over DDC failed
> > (%d)\n",
> > -                         ret);
> > -     return ret;
> > -}
> > -
> > -static
> > -int intel_hdmi_hdcp_read_bstatus(struct intel_digital_port *dig_port,
> > -                              u8 *bstatus)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -
> > -     int ret;
> > -     ret =3D intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_BSTATUS,
> > -                                bstatus, DRM_HDCP_BSTATUS_LEN);
> > -     if (ret)
> > -             drm_dbg_kms(&i915->drm, "Read bstatus over DDC failed
> > (%d)\n",
> > -                         ret);
> > -     return ret;
> > -}
> > -
> > -static
> > -int intel_hdmi_hdcp_repeater_present(struct intel_digital_port *dig_po=
rt,
> > -                                  bool *repeater_present)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     int ret;
> > -     u8 val;
> > -
> > -     ret =3D intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_BCAPS,
> > &val, 1);
> > -     if (ret) {
> > -             drm_dbg_kms(&i915->drm, "Read bcaps over DDC failed
> > (%d)\n",
> > -                         ret);
> > -             return ret;
> > -     }
> > -     *repeater_present =3D val &
> > DRM_HDCP_DDC_BCAPS_REPEATER_PRESENT;
> > -     return 0;
> > -}
> > -
> > -static
> > -int intel_hdmi_hdcp_read_ri_prime(struct intel_digital_port *dig_port,
> > -                               u8 *ri_prime)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -
> > -     int ret;
> > -     ret =3D intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_RI_PRIME,
> > -                                ri_prime, DRM_HDCP_RI_LEN);
> > -     if (ret)
> > -             drm_dbg_kms(&i915->drm, "Read Ri' over DDC failed
> > (%d)\n",
> > -                         ret);
> > -     return ret;
> > -}
> > -
> > -static
> > -int intel_hdmi_hdcp_read_ksv_ready(struct intel_digital_port *dig_port=
,
> > -                                bool *ksv_ready)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     int ret;
> > -     u8 val;
> > -
> > -     ret =3D intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_BCAPS,
> > &val, 1);
> > -     if (ret) {
> > -             drm_dbg_kms(&i915->drm, "Read bcaps over DDC failed
> > (%d)\n",
> > -                         ret);
> > -             return ret;
> > -     }
> > -     *ksv_ready =3D val & DRM_HDCP_DDC_BCAPS_KSV_FIFO_READY;
> > -     return 0;
> > -}
> > -
> > -static
> > -int intel_hdmi_hdcp_read_ksv_fifo(struct intel_digital_port *dig_port,
> > -                               int num_downstream, u8 *ksv_fifo)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     int ret;
> > -     ret =3D intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_KSV_FIFO,
> > -                                ksv_fifo, num_downstream *
> > DRM_HDCP_KSV_LEN);
> > -     if (ret) {
> > -             drm_dbg_kms(&i915->drm,
> > -                         "Read ksv fifo over DDC failed (%d)\n", ret);
> > -             return ret;
> > -     }
> > -     return 0;
> > -}
> > -
> > -static
> > -int intel_hdmi_hdcp_read_v_prime_part(struct intel_digital_port
> > *dig_port,
> > -                                   int i, u32 *part)
> > -{
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     int ret;
> > -
> > -     if (i >=3D DRM_HDCP_V_PRIME_NUM_PARTS)
> > -             return -EINVAL;
> > -
> > -     ret =3D intel_hdmi_hdcp_read(dig_port,
> > DRM_HDCP_DDC_V_PRIME(i),
> > -                                part, DRM_HDCP_V_PRIME_PART_LEN);
> > -     if (ret)
> > -             drm_dbg_kms(&i915->drm, "Read V'[%d] over DDC failed
> > (%d)\n",
> > -                         i, ret);
> > -     return ret;
> > -}
> > -
> >  static int kbl_repositioning_enc_en_signal(struct intel_connector
> > *connector,
> >                                          enum transcoder cpu_transcoder=
)
> >  {
> > @@ -1532,50 +1425,40 @@ int intel_hdmi_hdcp_toggle_signalling(struct
> > intel_digital_port *dig_port,
> >       return 0;
> >  }
> >
> > -static
> > -bool intel_hdmi_hdcp_check_link_once(struct intel_digital_port *dig_po=
rt,
> > -                                  struct intel_connector *connector)
> > +static int
> > +intel_hdmi_hdcp1_enable_encryption(struct drm_connector
> > *drm_connector)
> >  {
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     enum port port =3D dig_port->base.port;
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> >       enum transcoder cpu_transcoder =3D connector-
> > >hdcp.cpu_transcoder;
> >       int ret;
> > -     union {
> > -             u32 reg;
> > -             u8 shim[DRM_HDCP_RI_LEN];
> > -     } ri;
> >
> > -     ret =3D intel_hdmi_hdcp_read_ri_prime(dig_port, ri.shim);
> > +     ret =3D intel_hdmi_hdcp_toggle_signalling(dig_port, cpu_transcode=
r,
> > true);
> >       if (ret)
> > -             return false;
> > -
> > -     intel_de_write(i915, HDCP_RPRIME(i915, cpu_transcoder, port),
> > ri.reg);
> > +             return ret;
> >
> > -     /* Wait for Ri prime match */
> > -     if (wait_for((intel_de_read(i915, HDCP_STATUS(i915,
> > cpu_transcoder, port)) &
> > -                   (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC)) =3D=3D
> > -                  (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC), 1)) {
> > -             drm_dbg_kms(&i915->drm, "Ri' mismatch detected (%x)\n",
> > -                     intel_de_read(i915, HDCP_STATUS(i915,
> > cpu_transcoder,
> > -                                                     port)));
> > -             return false;
> > -     }
> > -     return true;
> > +     return intel_hdcp1_enable_encryption(drm_connector);
> >  }
> >
> > -static
> > -bool intel_hdmi_hdcp_check_link(struct intel_digital_port *dig_port,
> > -                             struct intel_connector *connector)
> > +static int intel_hdmi_hdcp1_disable(struct drm_connector
> > *drm_connector)
> >  {
> > -     struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev=
);
> > -     int retry;
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> > +     enum transcoder cpu_transcoder =3D connector-
> > >hdcp.cpu_transcoder;
> > +     struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> > +     int ret;
> >
> > -     for (retry =3D 0; retry < 3; retry++)
> > -             if (intel_hdmi_hdcp_check_link_once(dig_port, connector))
> > -                     return true;
> > +     ret =3D intel_hdcp1_disable(drm_connector);
> > +     if (ret) {
> > +             drm_err(&i915->drm, "[%s:%d] Failed to disable HDCP 1.4\n=
",
> > +                     connector->base.name, connector->base.base.id);
> > +             return ret;
> > +     }
> >
> > -     drm_err(&i915->drm, "Link check failed\n");
> > -     return false;
> > +     return intel_hdmi_hdcp_toggle_signalling(dig_port, cpu_transcoder=
,
> > +                                              false);
> >  }
> >
> >  struct hdcp2_hdmi_msg_timeout {
> > @@ -1718,9 +1601,8 @@ int intel_hdmi_hdcp2_read_msg(struct
> > intel_digital_port *dig_port,
> >       return ret;
> >  }
> >
> > -static
> > -int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_port,
> > -                             struct intel_connector *connector)
> > +static int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_=
port,
> > +                                    struct intel_connector *connector)
> >  {
> >       u8 rx_status[HDCP_2_2_HDMI_RXSTATUS_LEN];
> >       int ret;
> > @@ -1741,13 +1623,19 @@ int intel_hdmi_hdcp2_check_link(struct
> > intel_digital_port *dig_port,
> >       return ret;
> >  }
> >
> > -static
> > -int intel_hdmi_hdcp2_capable(struct intel_digital_port *dig_port,
> > -                          bool *capable)
> > +static int intel_hdmi_hdcp2_capable(struct drm_connector
> > *drm_connector,
> > +                                 bool *capable)
> >  {
> > +     struct intel_connector *connector =3D
> > to_intel_connector(drm_connector);
> > +     struct intel_digital_port *dig_port =3D
> > +             intel_attached_dig_port(connector);
> >       u8 hdcp2_version;
> >       int ret;
> >
> > +     ret =3D intel_hdcp2_capable(drm_connector, capable);
> > +     if (ret || !capable)
> > +             return ret;
> > +
> >       *capable =3D false;
> >       ret =3D intel_hdmi_hdcp_read(dig_port,
> > HDCP_2_2_HDMI_REG_VER_OFFSET,
> >                                  &hdcp2_version, sizeof(hdcp2_version))=
;
> > @@ -1758,23 +1646,30 @@ int intel_hdmi_hdcp2_capable(struct
> > intel_digital_port *dig_port,
> >  }
> >
> >  static const struct intel_hdcp_shim intel_hdmi_hdcp_shim =3D {
> > -     .write_an_aksv =3D intel_hdmi_hdcp_write_an_aksv,
> > -     .read_bksv =3D intel_hdmi_hdcp_read_bksv,
> > -     .read_bstatus =3D intel_hdmi_hdcp_read_bstatus,
> > -     .repeater_present =3D intel_hdmi_hdcp_repeater_present,
> > -     .read_ri_prime =3D intel_hdmi_hdcp_read_ri_prime,
> > -     .read_ksv_ready =3D intel_hdmi_hdcp_read_ksv_ready,
> > -     .read_ksv_fifo =3D intel_hdmi_hdcp_read_ksv_fifo,
> > -     .read_v_prime_part =3D intel_hdmi_hdcp_read_v_prime_part,
> >       .toggle_signalling =3D intel_hdmi_hdcp_toggle_signalling,
> > -     .check_link =3D intel_hdmi_hdcp_check_link,
> >       .write_2_2_msg =3D intel_hdmi_hdcp2_write_msg,
> >       .read_2_2_msg =3D intel_hdmi_hdcp2_read_msg,
> > -     .check_2_2_link =3D intel_hdmi_hdcp2_check_link,
> > -     .hdcp_2_2_capable =3D intel_hdmi_hdcp2_capable,
> > +     .check_2_2_link =3D intel_hdmi_hdcp2_check_link,
> >       .protocol =3D HDCP_PROTOCOL_HDMI,
> >  };
> >
> > +static const struct drm_hdcp_helper_funcs intel_hdmi_hdcp_helper_funcs
> > =3D {
> > +     .setup =3D intel_hdcp_setup,
> > +     .load_keys =3D intel_hdcp_load_keys,
> > +     .hdcp2_capable =3D intel_hdmi_hdcp2_capable,
> > +     .hdcp2_enable =3D intel_hdcp2_enable,
> > +     .hdcp2_check_link =3D intel_hdcp2_check_link,
> > +     .hdcp2_disable =3D intel_hdcp2_disable,
> > +     .hdcp1_send_an_aksv =3D intel_hdmi_hdcp1_send_an_aksv,
> > +     .hdcp1_store_receiver_info =3D intel_hdcp1_store_receiver_info,
> > +     .hdcp1_enable_encryption =3D intel_hdmi_hdcp1_enable_encryption,
> > +     .hdcp1_wait_for_r0 =3D intel_hdcp1_wait_for_r0,
> > +     .hdcp1_match_ri =3D intel_hdcp1_match_ri,
> > +     .hdcp1_post_encryption =3D intel_hdcp1_post_encryption,
> > +     .hdcp1_store_ksv_fifo =3D intel_hdcp1_store_ksv_fifo,
> > +     .hdcp1_disable =3D intel_hdmi_hdcp1_disable,
> > +};
> > +
> >  static int intel_hdmi_source_max_tmds_clock(struct intel_encoder
> > *encoder)
> >  {
> >       struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
> > @@ -2922,6 +2817,37 @@ void intel_infoframe_init(struct intel_digital_p=
ort
> > *dig_port)
> >       }
> >  }
> >
> > +static void intel_hdmi_hdcp_init(struct intel_digital_port *dig_port,
> > +                              struct intel_connector *connector)
> > +{
> > +     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > +     struct intel_encoder *intel_encoder =3D &dig_port->base;
> > +     enum port port =3D intel_encoder->port;
> > +     struct drm_hdcp_helper_data *data;
> > +     int ret;
> > +
> > +     if (!is_hdcp_supported(dev_priv, port))
> > +             return;
> > +
> > +     data =3D drm_hdcp_helper_initialize_hdmi(
> > +             &connector->base, &intel_hdmi_hdcp_helper_funcs, true);
> > +     if (IS_ERR(data)) {
> > +             drm_dbg_kms(&dev_priv->drm, "HDCP init failed
> > ret=3D%ld\n",
> > +                         PTR_ERR(data));
> > +             return;
> > +     }
> > +
> > +     ret =3D intel_hdcp_init(connector, dig_port, &intel_hdmi_hdcp_shi=
m);
> > +     if (ret) {
> > +             drm_hdcp_helper_destroy(data);
> > +             drm_dbg_kms(&dev_priv->drm, "Intel HDCP init failed
> > ret=3D%d\n",
> > +                         ret);
> > +             return;
> > +     }
> > +
> > +     connector->hdcp_helper_data =3D data;
> > +}
> > +
> >  void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
> >                              struct intel_connector *intel_connector)
> >  {
> > @@ -2975,13 +2901,7 @@ void intel_hdmi_init_connector(struct
> > intel_digital_port *dig_port,
> >       intel_connector_attach_encoder(intel_connector, intel_encoder);
> >       intel_hdmi->attached_connector =3D intel_connector;
> >
> > -     if (is_hdcp_supported(dev_priv, port)) {
> > -             int ret =3D intel_hdcp_init(intel_connector, dig_port,
> > -                                       &intel_hdmi_hdcp_shim);
> > -             if (ret)
> > -                     drm_dbg_kms(&dev_priv->drm,
> > -                                 "HDCP init failed, skipping.\n");
> > -     }
> > +     intel_hdmi_hdcp_init(dig_port, intel_connector);
> >
> >       /* For G4X desktop chip, PEG_BAND_GAP_DATA 3:0 must first be
> > written
> >        * 0xd.  Failure to do so will result in spurious interrupts bein=
g
> > --
> > 2.39.0.246.g2a6d74b583-goog
>
I send v7 which should have the comments addressed. Thanks a lot!
