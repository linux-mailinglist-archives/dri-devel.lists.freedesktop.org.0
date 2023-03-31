Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D530D6D15B4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 04:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CDE10E2E3;
	Fri, 31 Mar 2023 02:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF7D10E2E3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:40:28 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id h187so7454605iof.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 19:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680230428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQrwpcibujJqlmTEza2DfA5ZE4Qe7gVkHrwLff0ClFU=;
 b=IhgmJV7RavCOET87gb8RKOmKoudDGEX2zj6gR3iopZl0Bmv6IfgQ/ibbPL0KU83UY6
 gJkL4k45v6qA2nWZ6nxnZsOhRjtw9g4wyhYzTZWpXAq0BejD8cnPw2qIAdUUuPjrZivI
 Y/I1ZTDnRWEIGguWztnIYSiIY2DfpQzgRrEjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680230428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iQrwpcibujJqlmTEza2DfA5ZE4Qe7gVkHrwLff0ClFU=;
 b=j6ioBHk0cyIH/YPZZaBeExJDIMgugrrkj3RE7WYSsYAsoeRCrM1MIbORsgWCoJ9o61
 RCi6Hn9j5XaD9gxKV9NWKGiZzNIgVAe5vt52BlYsdxqYa+roVSHQYkTUnwUqZcNbnvlG
 0HGmnmUGrY2aQGRGQ3/NHq1mjikksc4HNuFElE80PodZGjzfe4Ee7t49kdX/eS7Y2C7X
 fJAo8Lz60jHfKuk3YNvFCzXQAC10GGCRau41G3D3NVIoOMxY2eb2T37aqcOl7vgMM5Ni
 r4dAG0wUNN+zdD7y11+6ctZOhGGiTTn2jThoQ0VLJU/WJwHjpBbXrCc2+jcnWRlZUNT4
 58FA==
X-Gm-Message-State: AO0yUKV7VFA3BCGpJ4OmoFwwX/wTseVr/UouSN7W2099rlgW7V0Unj/8
 rEbLMMtfrlcR3GOPHXZm3kleOR/sk2+2uwANQ1aN5sE4rY3qp5js58XFaw==
X-Google-Smtp-Source: AK7set8PW/rmF4EecdA4hthe2v5SIisdg/Q+7FqP3P4IiAKgrK1r/tfAbNqXZZ9Oi0/saOdscwawRnNnF6Dkwgcrc7k=
X-Received: by 2002:a5e:d60b:0:b0:752:cba8:a2fa with SMTP id
 w11-20020a5ed60b000000b00752cba8a2famr9398024iom.2.1680230428034; Thu, 30 Mar
 2023 19:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-4-treapking@chromium.org>
 <CAA8EJpqFuhAtTaTJNMmfaQoYaKF_t6N2QMgbOS1c9XVey8Jf3w@mail.gmail.com>
In-Reply-To: <CAA8EJpqFuhAtTaTJNMmfaQoYaKF_t6N2QMgbOS1c9XVey8Jf3w@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 31 Mar 2023 11:40:16 +0900
Message-ID: <CAEXTbpfML_V=m5=F0yVac=vo=1Lipc+7cquZjgexitJHHrr-eA@mail.gmail.com>
Subject: Re: [PATCH v14 03/10] drm/display: Add Type-C switch helpers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thanks for the review.

On Thu, Mar 23, 2023 at 7:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 22 Mar 2023 at 12:47, Pin-yen Lin <treapking@chromium.org> wrote:
> >
> > Add helpers to register and unregister Type-C "switches" for bridges
> > capable of switching their output between two downstream devices.
> >
> > The helper registers USB Type-C mode switches when the "mode-switch"
> > and the "reg" properties are available in Device Tree.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v14:
> > - Introduce a new Kconfig becuase it didn't build when CONFIG_TYPEC=3Dm
> > - Add comments about devm_* usage
> > - Fix style issues
> >
> > Changes in v13:
> > - Add typec_mode_switch_node_count helper
> > - Fix style issues
> >
> > Changes in v12:
> > - Add fwnode_for_each_typec_mode_switch macro
> > - Remove a duplicated dmesg in the helper
> > - Used IS_REACHABLE instead to guard the function signatures
> >
> > Changes in v11:
> > - Use fwnode helpers instead of DT
> > - Moved the helpers to a new file
> > - Use "reg" instead of "data-lanes" to determine the port number
> > - Dropped collected tags due to new changes
> >
> > Changes in v10:
> > - Collected Reviewed-by and Tested-by tags
> > - Replaced "void *" with "typec_mux_set_fn_t" for mux_set callbacks
> > - Print out the node name when errors on parsing DT
> > - Use dev_dbg instead of dev_warn when no Type-C switch nodes available
> > - Made the return path of drm_dp_register_mode_switch clearer
> >
> > Changes in v8:
> > - Fixed the build issue when CONFIG_TYPEC=3Dm
> > - Fixed some style issues
> >
> > Changes in v7:
> > - Extracted the common codes to a helper function
> > - New in v7
> >
> >  drivers/gpu/drm/display/Kconfig               |   8 ++
> >  drivers/gpu/drm/display/Makefile              |   2 +
> >  drivers/gpu/drm/display/drm_dp_typec_helper.c | 105 ++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h           |  46 ++++++++
> >  4 files changed, 161 insertions(+)
> >  create mode 100644 drivers/gpu/drm/display/drm_dp_typec_helper.c
> >
> > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/=
Kconfig
> > index 09712b88a5b8..d61076947a1c 100644
> > --- a/drivers/gpu/drm/display/Kconfig
> > +++ b/drivers/gpu/drm/display/Kconfig
> > @@ -29,6 +29,14 @@ config DRM_DISPLAY_HDMI_HELPER
> >         help
> >           DRM display helpers for HDMI.
> >
> > +config DRM_DISPLAY_DP_TYPEC_HELPER
> > +       bool
> > +       default y
> > +       depends on DRM_DISPLAY_HELPER
> > +       depends on DRM_DISPLAY_HELPER=3DTYPEC || TYPEC=3Dy
>
> If it is a select'able option, it doesn't make sense to use "depends"
> here. Select will override depends.
>
I'm not very familiar with the practices of Kconfigs, but I'll keep
this in the next version per Andy's comment.

> > +       help
> > +         DRM display helpers for USB Type-C Displayport Alternate mode=
.
> > +
> >  config DRM_DP_AUX_CHARDEV
> >         bool "DRM DP AUX Interface"
> >         depends on DRM && DRM_DISPLAY_HELPER
> > diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display=
/Makefile
> > index 17ac4a1006a8..2202a6aea38e 100644
> > --- a/drivers/gpu/drm/display/Makefile
> > +++ b/drivers/gpu/drm/display/Makefile
> > @@ -8,6 +8,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) +=3D=
 \
> >         drm_dp_helper.o \
> >         drm_dp_mst_topology.o \
> >         drm_dsc_helper.o
> > +drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER) +=3D \
> > +       drm_dp_typec_helper.o
> >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) +=3D drm_hdcp_hel=
per.o
> >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) +=3D \
> >         drm_hdmi_helper.o \
> > diff --git a/drivers/gpu/drm/display/drm_dp_typec_helper.c b/drivers/gp=
u/drm/display/drm_dp_typec_helper.c
> > new file mode 100644
> > index 000000000000..1562a9ccdaf2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/display/drm_dp_typec_helper.c
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/usb/typec_mux.h>
> > +#include <drm/display/drm_dp_helper.h>
> > +
> > +static int drm_dp_register_mode_switch(struct device *dev,
> > +                                      struct fwnode_handle *fwnode,
> > +                                      struct drm_dp_typec_switch_desc =
*switch_desc,
> > +                                      void *data, typec_mux_set_fn_t m=
ux_set)
> > +{
> > +       struct drm_dp_typec_port_data *port_data;
> > +       struct typec_mux_desc mux_desc =3D {};
> > +       char name[32];
>
> Why 32?

This is just a random length that is probably sufficiently large. I
see other users use the pointer from `fwnode_get_name` directly, but
we want to append the port number to ensure the names are unique.
>
> > +       u32 port_num;
> > +       int ret;
> > +
> > +       ret =3D fwnode_property_read_u32(fwnode, "reg", &port_num);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to read reg property: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       port_data =3D &switch_desc->typec_ports[port_num];
> > +       port_data->data =3D data;
> > +       port_data->port_num =3D port_num;
> > +       port_data->fwnode =3D fwnode;
> > +       mux_desc.fwnode =3D fwnode;
> > +       mux_desc.drvdata =3D port_data;
> > +       snprintf(name, sizeof(name), "%pfwP-%u", fwnode, port_num);
>
> I think it makes more sense to use dev_name here instead of fwnode.

Thanks for the suggestions. I'll update this in the next version.
>
> > +       mux_desc.name =3D name;
> > +       mux_desc.set =3D mux_set;
> > +
> > +       port_data->typec_mux =3D typec_mux_register(dev, &mux_desc);
> > +       ret =3D PTR_ERR_OR_ZERO(port_data->typec_mux);
> > +       if (ret)
> > +               dev_err(dev, "Mode switch register for port %d failed: =
%d\n",
> > +                       port_num, ret);
> > +
> > +       return ret;
> > +}
> > +
> > +/**
> > + * drm_dp_register_typec_switches() - register Type-C switches
> > + * @dev: Device that registers Type-C switches
> > + * @port: Device node for the switch
> > + * @switch_desc: A Type-C switch descriptor
> > + * @data: Private data for the switches
> > + * @mux_set: Callback function for typec_mux_set
> > + *
> > + * This function registers USB Type-C switches for DP bridges that can=
 switch
> > + * the output signal between their output pins. This function uses dev=
m_kcalloc
> > + * to allocate memory, so it is expected to only call this in the driv=
er probe
> > + * functions.
> > + *
> > + * Currently only mode switches are implemented, and the function assu=
mes the
> > + * given @port device node has endpoints with "mode-switch" property.
> > + * The port number is determined by the "reg" property of the endpoint=
.
> > + */
> > +int drm_dp_register_typec_switches(struct device *dev, struct fwnode_h=
andle *port,
> > +                                  struct drm_dp_typec_switch_desc *swi=
tch_desc,
> > +                                  void *data, typec_mux_set_fn_t mux_s=
et)
> > +{
> > +       struct fwnode_handle *sw;
> > +       int ret;
> > +
> > +       switch_desc->num_typec_switches =3D typec_mode_switch_node_coun=
t(port);
> > +       if (!switch_desc->num_typec_switches) {
> > +               dev_dbg(dev, "No Type-C switches node found\n");
> > +               return 0;
> > +       }
> > +
> > +       switch_desc->typec_ports =3D devm_kcalloc(dev, switch_desc->num=
_typec_switches,
> > +                                               sizeof(struct drm_dp_ty=
pec_port_data),
> > +                                               GFP_KERNEL);
> > +       if (!switch_desc->typec_ports)
> > +               return -ENOMEM;
> > +
> > +       /* Register switches for each connector. */
> > +       for_each_typec_mode_switch_node(port, sw) {
> > +               ret =3D drm_dp_register_mode_switch(dev, sw, switch_des=
c, data, mux_set);
> > +               if (ret)
> > +                       goto err_unregister_typec_switches;
> > +       }
> > +
> > +       return 0;
> > +
> > +err_unregister_typec_switches:
> > +       fwnode_handle_put(sw);
> > +       drm_dp_unregister_typec_switches(switch_desc);
> > +       return ret;
> > +}
> > +EXPORT_SYMBOL(drm_dp_register_typec_switches);
> > +
> > +/**
> > + * drm_dp_unregister_typec_switches() - unregister Type-C switches
> > + * @switch_desc: A Type-C switch descriptor
> > + */
> > +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc =
*switch_desc)
> > +{
> > +       unsigned int i;
> > +
> > +       for (i =3D 0; i < switch_desc->num_typec_switches; i++)
> > +               typec_mux_unregister(switch_desc->typec_ports[i].typec_=
mux);
> > +}
> > +EXPORT_SYMBOL(drm_dp_unregister_typec_switches);
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/=
drm_dp_helper.h
> > index ab55453f2d2c..0fe56586d7bc 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -25,6 +25,7 @@
> >
> >  #include <linux/delay.h>
> >  #include <linux/i2c.h>
> > +#include <linux/usb/typec_mux.h>
> >
> >  #include <drm/display/drm_dp.h>
> >  #include <drm/drm_connector.h>
> > @@ -763,4 +764,49 @@ bool drm_dp_downstream_rgb_to_ycbcr_conversion(con=
st u8 dpcd[DP_RECEIVER_CAP_SIZ
> >                                                const u8 port_cap[4], u8=
 color_spc);
> >  int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_=
spc);
> >
> > +struct drm_dp_typec_port_data {
> > +       struct typec_mux_dev *typec_mux;
> > +       int port_num;
> > +       struct fwnode_handle *fwnode;
> > +       void *data;
> > +};
> > +
> > +struct drm_dp_typec_switch_desc {
> > +       int num_typec_switches;
> > +       struct drm_dp_typec_port_data *typec_ports;
> > +};
> > +
> > +#define for_each_typec_mode_switch_node(port, sw)      \
> > +       fwnode_for_each_child_node((port), (sw))        \
> > +               for_each_if(fwnode_property_present((sw), "mode-switch"=
))
> > +
> > +static inline unsigned int typec_mode_switch_node_count(struct fwnode_=
handle *port)
> > +{
> > +       struct fwnode_handle *sw;
> > +       unsigned int count =3D 0;
> > +
> > +       for_each_typec_mode_switch_node(port, sw)
> > +               count++;
> > +
> > +       return count;
> > +}
> > +
> > +#ifdef CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER
> > +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc =
*switch_desc);
> > +int drm_dp_register_typec_switches(struct device *dev, struct fwnode_h=
andle *port,
> > +                                  struct drm_dp_typec_switch_desc *swi=
tch_desc,
> > +                                  void *data, typec_mux_set_fn_t mux_s=
et);
> > +#else
> > +static inline void drm_dp_unregister_typec_switches(struct drm_dp_type=
c_switch_desc *switch_desc)
> > +{
> > +}
> > +static inline int drm_dp_register_typec_switches(
> > +               struct device *dev, struct fwnode_handle *port,
> > +               struct drm_dp_typec_switch_desc *switch_desc, void *dat=
a,
> > +               typec_mux_set_fn_t mux_set)
> > +{
> > +       return -EOPNOTSUPP;
> > +}
> > +#endif
> > +
> >  #endif /* _DRM_DP_HELPER_H_ */
> > --
> > 2.40.0.rc1.284.g88254d51c5-goog
> >
>
>
> --
> With best wishes
> Dmitry

Best regards,
Pin-yen
