Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9243726CF
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 09:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9786EA9B;
	Tue,  4 May 2021 07:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6356EA97;
 Tue,  4 May 2021 07:52:45 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id h11so6667562pfn.0;
 Tue, 04 May 2021 00:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=C6xDgSKwAEMFW6cgeFzEmNUx0V+QvFoolLSf/Ha4YVE=;
 b=lI9xixUR34GHGW7PXzAeqzrojKJ+oA/aO9z1SfEqAoRaZggLt/TdMTfQNrdSF7OgV+
 Spb8zW7C+OnlTK8lg3M2eDuNKNqdmzelbF6mcJUGouQrihc8efsbZK1UaRmWTggzMrn/
 9LPwjuqFKJMl9WiV2hkJgsmz3EZQTzl+SP+ZmkZnRKS0PJ4MkvyA1wCbvYXYxnxE0yH0
 KMZn9Q0XnASxdEEEYXrypmmYofsGqzrmrj+AH2hhebCKYem5LzOw9p2D7ueucgm82erz
 ivxqdKpJd+HcodqfLRzQ4Gi7PnVdVMkFdyouyFrSprLWAZU1V0QTc19ewkAGges1Nt2W
 paVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=C6xDgSKwAEMFW6cgeFzEmNUx0V+QvFoolLSf/Ha4YVE=;
 b=OAk7jDq3IRw1yCVZAXYc1kIAwP712ithaiEMbjCLTvPBTXaHQbRfxp7nHhl3t8U08/
 Z6c6Iaoc40HH5ZJ3NGgo43hIBMloa2grsiqAGAyLBAdavphWVH9G6zcgu7QtUxMjk6p/
 T9VSVBPSi6O+VP/K4qER+f8u6zjlWm8iy2OgTT2QCeOqnUhu3RqZxn9f/HqVV/9fx/j7
 XcSfEGPk8q9lUftj19Bgndaz8vbubIn6Bva6vdIMKSiANzX4WoX5fdRPx0A8gIb0sImk
 tExgKX9XbhEr9TyFooYyE0wpxmdMGpn1L31+KJki0ueZ9SRg4Dlke6upjqi+fXPgOPr/
 eU9w==
X-Gm-Message-State: AOAM530wva54bIxyPIxYdG+A91n9iHlOmMLkv4NEY9dbJMu+GRiQpJ7F
 WBuI3KlTbeHamsDqmxr0+NGPdsc0JW6Og/MMOqSROMfd2dI0cQ==
X-Google-Smtp-Source: ABdhPJwKhI602N2YYCJOLpwo2AgsEWnL+yelgZ6NIJ3wCQVY1t5wGr03pxnrYhOLpSQ0DFN9R4DBo4QRPtFtyr4RC0g=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr21878702pgg.74.1620114765225; 
 Tue, 04 May 2021 00:52:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:d81:0:0:0:0 with HTTP; Tue, 4 May 2021 00:52:44
 -0700 (PDT)
In-Reply-To: <20210503154647.142551-6-hdegoede@redhat.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-6-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 May 2021 10:52:44 +0300
Message-ID: <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/mixed; boundary="===============2137592303=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2137592303==
Content-Type: multipart/alternative; boundary="00000000000013a29105c17c5de9"

--00000000000013a29105c17c5de9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com> wrote:

> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>
> On Intel platforms we know that the ACPI connector device
> node order will follow the order the driver (i915) decides.
> The decision is made using the custom Intel ACPI OpRegion
> (intel_opregion.c), though the driver does not actually know
> that the values it sends to ACPI there are used for
> associating a device node for the connectors, and assigning
> address for them.
>
> In reality that custom Intel ACPI OpRegion actually violates
> ACPI specification (we supply dynamic information to objects
> that are defined static, for example _ADR), however, it
> makes assigning correct connector node for a connector entry
> straightforward (it's one-on-one mapping).
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> [hdegoede@redhat.com: Move intel_acpi_assign_connector_fwnodes() to
>  intel_acpi.c]
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_acpi.c    | 40 ++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_acpi.h    |  3 ++
>  drivers/gpu/drm/i915/display/intel_display.c |  1 +
>  3 files changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c
> b/drivers/gpu/drm/i915/display/intel_acpi.c
> index 833d0c1be4f1..9f266dfda7dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -263,3 +263,43 @@ void intel_acpi_device_id_update(struct
> drm_i915_private *dev_priv)
>         }
>         drm_connector_list_iter_end(&conn_iter);
>  }
> +
> +/* NOTE: The connector order must be final before this is called. */
> +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
> +{
> +       struct drm_connector_list_iter conn_iter;
> +       struct drm_device *drm_dev =3D &i915->drm;
> +       struct device *kdev =3D &drm_dev->pdev->dev;
> +       struct fwnode_handle *fwnode =3D NULL;
> +       struct drm_connector *connector;
> +       struct acpi_device *adev;
> +
> +       drm_connector_list_iter_begin(drm_dev, &conn_iter);
> +       drm_for_each_connector_iter(connector, &conn_iter) {
> +               /* Always getting the next, even when the last was not
> used. */
> +               fwnode =3D device_get_next_child_node(kdev, fwnode);
> +               if (!fwnode)
> +                       break;



Who is dropping reference counting on fwnode ?

I=E2=80=99m in the middle of a pile of fixes for fwnode refcounting when
for_each_child or get_next_child is used. So, please double check you drop
a reference.


> +
> +               switch (connector->connector_type) {
> +               case DRM_MODE_CONNECTOR_LVDS:
> +               case DRM_MODE_CONNECTOR_eDP:
> +               case DRM_MODE_CONNECTOR_DSI:
> +                       /*
> +                        * Integrated displays have a specific address
> 0x1f on
> +                        * most Intel platforms, but not on all of them.
> +                        */
> +                       adev =3D acpi_find_child_device(ACPI_
> COMPANION(kdev),
> +                                                     0x1f, 0);
> +                       if (adev) {
> +                               connector->fwnode =3D
> acpi_fwnode_handle(adev);
> +                               break;
> +                       }
> +                       fallthrough;
> +               default:
> +                       connector->fwnode =3D fwnode;
> +                       break;
> +               }
> +       }
> +       drm_connector_list_iter_end(&conn_iter);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h
> b/drivers/gpu/drm/i915/display/intel_acpi.h
> index e8b068661d22..d2435691f4b5 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.h
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.h
> @@ -12,11 +12,14 @@ struct drm_i915_private;
>  void intel_register_dsm_handler(void);
>  void intel_unregister_dsm_handler(void);
>  void intel_acpi_device_id_update(struct drm_i915_private *i915);
> +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915);
>  #else
>  static inline void intel_register_dsm_handler(void) { return; }
>  static inline void intel_unregister_dsm_handler(void) { return; }
>  static inline
>  void intel_acpi_device_id_update(struct drm_i915_private *i915) {
> return; }
> +static inline
> +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
> { return; }
>  #endif /* CONFIG_ACPI */
>
>  #endif /* __INTEL_ACPI_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 828ef4c5625f..87cad549632c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -14970,6 +14970,7 @@ int intel_modeset_init_nogem(struct
> drm_i915_private *i915)
>
>         drm_modeset_lock_all(dev);
>         intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
> +       intel_acpi_assign_connector_fwnodes(i915);
>         drm_modeset_unlock_all(dev);
>
>         for_each_intel_crtc(dev, crtc) {
> --
> 2.31.1
>
>

--=20
With Best Regards,
Andy Shevchenko

--00000000000013a29105c17c5de9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, May 3, 2021, Hans de Goede &lt;<a href=3D"mailto:hdegoed=
e@redhat.com">hdegoede@redhat.com</a>&gt; wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">From: Heikki Krogerus &lt;<a href=3D"mailto:heikki.krogerus@linux.i=
ntel.com">heikki.krogerus@linux.intel.<wbr>com</a>&gt;<br>
<br>
On Intel platforms we know that the ACPI connector device<br>
node order will follow the order the driver (i915) decides.<br>
The decision is made using the custom Intel ACPI OpRegion<br>
(intel_opregion.c), though the driver does not actually know<br>
that the values it sends to ACPI there are used for<br>
associating a device node for the connectors, and assigning<br>
address for them.<br>
<br>
In reality that custom Intel ACPI OpRegion actually violates<br>
ACPI specification (we supply dynamic information to objects<br>
that are defined static, for example _ADR), however, it<br>
makes assigning correct connector node for a connector entry<br>
straightforward (it&#39;s one-on-one mapping).<br>
<br>
Signed-off-by: Heikki Krogerus &lt;<a href=3D"mailto:heikki.krogerus@linux.=
intel.com">heikki.krogerus@linux.intel.<wbr>com</a>&gt;<br>
[<a href=3D"mailto:hdegoede@redhat.com">hdegoede@redhat.com</a>: Move intel=
_acpi_assign_connector_<wbr>fwnodes() to<br>
=C2=A0intel_acpi.c]<br>
Signed-off-by: Hans de Goede &lt;<a href=3D"mailto:hdegoede@redhat.com">hde=
goede@redhat.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/i915/display/<wbr>intel_acpi.c=C2=A0 =C2=A0 | 40 ++++=
++++++++++++++++<br>
=C2=A0drivers/gpu/drm/i915/display/<wbr>intel_acpi.h=C2=A0 =C2=A0 |=C2=A0 3=
 ++<br>
=C2=A0drivers/gpu/drm/i915/display/<wbr>intel_display.c |=C2=A0 1 +<br>
=C2=A03 files changed, 44 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/i915/<wbr>display/intel_acpi.c b/drivers/gpu/d=
rm/i915/<wbr>display/intel_acpi.c<br>
index 833d0c1be4f1..9f266dfda7dd 100644<br>
--- a/drivers/gpu/drm/i915/<wbr>display/intel_acpi.c<br>
+++ b/drivers/gpu/drm/i915/<wbr>display/intel_acpi.c<br>
@@ -263,3 +263,43 @@ void intel_acpi_device_id_update(<wbr>struct drm_i915_=
private *dev_priv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_connector_list_iter_end(&amp;<wbr>conn_iter=
);<br>
=C2=A0}<br>
+<br>
+/* NOTE: The connector order must be final before this is called. */<br>
+void intel_acpi_assign_connector_<wbr>fwnodes(struct drm_i915_private *i91=
5)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector_list_iter conn_iter;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm_dev =3D &amp;i915-&gt;dr=
m;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *kdev =3D &amp;drm_dev-&gt;pdev-&=
gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct fwnode_handle *fwnode =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct acpi_device *adev;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_connector_list_iter_begin(<wbr>drm_dev, &am=
p;conn_iter);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_for_each_connector_iter(<wbr>connector, &am=
p;conn_iter) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Always getting t=
he next, even when the last was not used. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwnode =3D device_g=
et_next_child_node(<wbr>kdev, fwnode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fwnode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;</blockquote><div><br></div><div><br></div><div>Who is drop=
ping reference counting on fwnode ?</div><div><br></div><div>I=E2=80=99m in=
 the middle of a pile of fixes for fwnode refcounting when for_each_child o=
r get_next_child is used. So, please double check you drop a reference.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (connector-&=
gt;connector_type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_CONNE=
CTOR_LVDS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_CONNE=
CTOR_eDP:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_CONNE=
CTOR_DSI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * Integrated displays have a specific address 0x1f on<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * most Intel platforms, but not on all of them.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0adev =3D acpi_find_child_device(ACPI_<wbr>COMPANION(kdev),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1f, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (adev) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connector-&gt;fwnode =3D acpi_fwnode_=
handle(adev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fallthrough;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0connector-&gt;fwnode =3D fwnode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_connector_list_iter_end(&amp;<wbr>conn_iter=
);<br>
+}<br>
diff --git a/drivers/gpu/drm/i915/<wbr>display/intel_acpi.h b/drivers/gpu/d=
rm/i915/<wbr>display/intel_acpi.h<br>
index e8b068661d22..d2435691f4b5 100644<br>
--- a/drivers/gpu/drm/i915/<wbr>display/intel_acpi.h<br>
+++ b/drivers/gpu/drm/i915/<wbr>display/intel_acpi.h<br>
@@ -12,11 +12,14 @@ struct drm_i915_private;<br>
=C2=A0void intel_register_dsm_handler(<wbr>void);<br>
=C2=A0void intel_unregister_dsm_handler(<wbr>void);<br>
=C2=A0void intel_acpi_device_id_update(<wbr>struct drm_i915_private *i915);=
<br>
+void intel_acpi_assign_connector_<wbr>fwnodes(struct drm_i915_private *i91=
5);<br>
=C2=A0#else<br>
=C2=A0static inline void intel_register_dsm_handler(<wbr>void) { return; }<=
br>
=C2=A0static inline void intel_unregister_dsm_handler(<wbr>void) { return; =
}<br>
=C2=A0static inline<br>
=C2=A0void intel_acpi_device_id_update(<wbr>struct drm_i915_private *i915) =
{ return; }<br>
+static inline<br>
+void intel_acpi_assign_connector_<wbr>fwnodes(struct drm_i915_private *i91=
5) { return; }<br>
=C2=A0#endif /* CONFIG_ACPI */<br>
<br>
=C2=A0#endif /* __INTEL_ACPI_H__ */<br>
diff --git a/drivers/gpu/drm/i915/<wbr>display/intel_display.c b/drivers/gp=
u/drm/i915/<wbr>display/intel_display.c<br>
index 828ef4c5625f..87cad549632c 100644<br>
--- a/drivers/gpu/drm/i915/<wbr>display/intel_display.c<br>
+++ b/drivers/gpu/drm/i915/<wbr>display/intel_display.c<br>
@@ -14970,6 +14970,7 @@ int intel_modeset_init_nogem(<wbr>struct drm_i915_p=
rivate *i915)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_lock_all(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 intel_modeset_setup_hw_state(<wbr>dev, dev-&gt;=
mode_config.acquire_ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0intel_acpi_assign_connector_<wbr>fwnodes(i915);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_modeset_unlock_all(dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for_each_intel_crtc(dev, crtc) {<br>
-- <br>
2.31.1<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--00000000000013a29105c17c5de9--

--===============2137592303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2137592303==--
