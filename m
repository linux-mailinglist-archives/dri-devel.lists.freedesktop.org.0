Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFFA3726D6
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 09:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF99C6EAA0;
	Tue,  4 May 2021 07:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D956EAA0;
 Tue,  4 May 2021 07:57:32 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id y32so6043917pga.11;
 Tue, 04 May 2021 00:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+SP8CeLsodZQj565/7S5ByPMTG68wUnnuM5s34RU2M8=;
 b=OoKgqG9tor4k+JlO7f2I8e20TTohLSzHAJgkemhmCZ+yBuM80qzn5dxTdIShy+TTWo
 v0OCyxVj0p6aJBIvFUHIZFnFczi39L2Am/BK1GmCco5AQWlrS8WqMeB/dp5Mgto7s8mo
 Ym+mBokp7Q/oZojyfyimm5/sho++VDh4s9tBa4ACXmo3QpPfM+YQdiZPFG+d8WDRnnB7
 FGWbuG+nLBJp5Th0SP4AWlB+LrLOdvNPDaXAApx9o6C0XyrBu0s9DhgNkdxj/JtKB96U
 T+6bcEMITfikELE/qQNkxAd41qWn5uu0yJoaEMdjwD6qlhi8Szk7QKkEGfd6Ixw8LEWH
 Vl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+SP8CeLsodZQj565/7S5ByPMTG68wUnnuM5s34RU2M8=;
 b=GuKznmLCPhmIh/FCFMYsGk+wH6phXYtwARy/Tk4FWG8sDAfWlD8Su3rtEZ412rVZtH
 RxEOzyJdVvTidvwDi633XKxvU4pfmqbLQBDFQ5+CielF+vBowqC1HZSGQKIMIO8zWyRM
 IQh9vm9AKptj+qcf9PMYrc/5MxSe1/RzhkhoIrLDXjYXlrAJZ/FWBAxLHCdUKyBx86JU
 0KizlKINIAoMuync6WFAWaJ3fZGrqgFE3ZEcSVaFd/Z7XLaa9tTGp9ZSvr3aoZSCKWi2
 XndqZl1m2ITmdP2J6KKlckyK4wiVej4FseKp/Hy6KrsDqjJnRdbTkkLMas3CTVpgBNLC
 J8vg==
X-Gm-Message-State: AOAM531Lyh++Slm2Dh8jZfHKIegEPkzzz+RihprD13DcdX+5JQsAmUeF
 G7DirH0YQDS6xxiG8+jQ0bpNbkck4JB4h1EYKZJYpqSp1QvdzA==
X-Google-Smtp-Source: ABdhPJwS1M+Mw12KtiTt5mxThssbsQ9ZrheTQVCVrfSPgVASn9Yww9o6SX/vdxgDjhjMogguJsxnvmgecugQYDK1gas=
X-Received: by 2002:a62:5c6:0:b029:24d:e97f:1b1d with SMTP id
 189-20020a6205c60000b029024de97f1b1dmr23368343pff.40.1620115051943; Tue, 04
 May 2021 00:57:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:d81:0:0:0:0 with HTTP; Tue, 4 May 2021 00:57:31
 -0700 (PDT)
In-Reply-To: <20210503154647.142551-3-hdegoede@redhat.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 May 2021 10:57:31 +0300
Message-ID: <CAHp75Vf-tX5_q+QR5Tec-zEKoEvXynz9b57waz=vrHZJGi=S+Q@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/connector: Add a fwnode pointer to drm_connector
 and register with ACPI
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
Content-Type: multipart/mixed; boundary="===============0720991107=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0720991107==
Content-Type: multipart/alternative; boundary="0000000000002a9bfa05c17c6e73"

--0000000000002a9bfa05c17c6e73
Content-Type: text/plain; charset="UTF-8"

On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com> wrote:

> Add a fwnode pointer to struct drm_connector and register an acpi_bus_type
> for the connectors with the ACPI subsystem (when CONFIG_ACPI is enabled).
>
> The adding of the fwnode pointer allows drivers to associate a fwnode
> that represents a connector with that connector.
>
> When the new fwnode pointer points to an ACPI-companion, then the new
> acpi_bus_type will cause the ACPI subsys to bind the device instantiated
> for the connector with the fwnode by calling acpi_bind_one(). This will
> result in a firmware_node symlink under /sys/class/card#-<connecter-name>/
> which helps to verify that the fwnode-s and connectors are properly
> matched.
>
> Co-authored-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>



Official tag is Co-developed-by


> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 37 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h |  2 ++
>  2 files changed, 39 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 553024bcda8a..12cc649c44f0 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -10,6 +10,7 @@
>   * Copyright (c) 2003-2004 IBM Corp.
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> @@ -56,6 +57,39 @@ static struct device_type drm_sysfs_device_connector = {
>
>  struct class *drm_class;
>
> +#ifdef CONFIG_ACPI
> +static bool drm_connector_acpi_bus_match(struct device *dev)
> +{
> +       return dev->type == &drm_sysfs_device_connector;
> +}
> +
> +static struct acpi_device *drm_connector_acpi_find_companion(struct
> device *dev)
> +{
> +       struct drm_connector *connector = to_drm_connector(dev);
> +
> +       return to_acpi_device_node(connector->fwnode);
> +}
> +
> +static struct acpi_bus_type drm_connector_acpi_bus = {
> +       .name = "drm_connector",
> +       .match = drm_connector_acpi_bus_match,
> +       .find_companion = drm_connector_acpi_find_companion,
> +};
> +
> +static void drm_sysfs_acpi_register(void)
> +{
> +       register_acpi_bus_type(&drm_connector_acpi_bus);
> +}
> +
> +static void drm_sysfs_acpi_unregister(void)
> +{
> +       unregister_acpi_bus_type(&drm_connector_acpi_bus);
> +}
> +#else
> +static void drm_sysfs_acpi_register(void) { }
> +static void drm_sysfs_acpi_unregister(void) { }
> +#endif
> +
>  static char *drm_devnode(struct device *dev, umode_t *mode)
>  {
>         return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
> @@ -89,6 +123,8 @@ int drm_sysfs_init(void)
>         }
>
>         drm_class->devnode = drm_devnode;
> +
> +       drm_sysfs_acpi_register();
>         return 0;
>  }
>
> @@ -101,6 +137,7 @@ void drm_sysfs_destroy(void)
>  {
>         if (IS_ERR_OR_NULL(drm_class))
>                 return;
> +       drm_sysfs_acpi_unregister();
>         class_remove_file(drm_class, &class_attr_version.attr);
>         class_destroy(drm_class);
>         drm_class = NULL;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 0261801af62c..d20bfd7576ed 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1254,6 +1254,8 @@ struct drm_connector {
>         struct device *kdev;
>         /** @attr: sysfs attributes */
>         struct device_attribute *attr;
> +       /** @fwnode: associated fwnode supplied by platform firmware */
> +       struct fwnode_handle *fwnode;
>
>         /**
>          * @head:
> --
> 2.31.1
>
>

-- 
With Best Regards,
Andy Shevchenko

--0000000000002a9bfa05c17c6e73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, May 3, 2021, Hans de Goede &lt;<a href=3D"mailto:hdegoed=
e@redhat.com">hdegoede@redhat.com</a>&gt; wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Add a fwnode pointer to struct drm_connector and register an acpi_b=
us_type<br>
for the connectors with the ACPI subsystem (when CONFIG_ACPI is enabled).<b=
r>
<br>
The adding of the fwnode pointer allows drivers to associate a fwnode<br>
that represents a connector with that connector.<br>
<br>
When the new fwnode pointer points to an ACPI-companion, then the new<br>
acpi_bus_type will cause the ACPI subsys to bind the device instantiated<br=
>
for the connector with the fwnode by calling acpi_bind_one(). This will<br>
result in a firmware_node symlink under /sys/class/card#-&lt;connecter-<wbr=
>name&gt;/<br>
which helps to verify that the fwnode-s and connectors are properly<br>
matched.<br>
<br>
Co-authored-by: Heikki Krogerus &lt;<a href=3D"mailto:heikki.krogerus@linux=
.intel.com">heikki.krogerus@linux.intel.<wbr>com</a>&gt;</blockquote><div><=
br></div><div><br></div><div>Official tag is Co-developed-by</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Heikki Krogerus &lt;<a href=3D"mailto:heikki.krogerus@linux.=
intel.com">heikki.krogerus@linux.intel.<wbr>com</a>&gt;<br>
Signed-off-by: Hans de Goede &lt;<a href=3D"mailto:hdegoede@redhat.com">hde=
goede@redhat.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_sysfs.c | 37 ++++++++++++++++++++++++++++++<wbr>+=
++++++<br>
=C2=A0include/drm/drm_connector.h |=C2=A0 2 ++<br>
=C2=A02 files changed, 39 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c<br>
index 553024bcda8a..12cc649c44f0 100644<br>
--- a/drivers/gpu/drm/drm_sysfs.c<br>
+++ b/drivers/gpu/drm/drm_sysfs.c<br>
@@ -10,6 +10,7 @@<br>
=C2=A0 * Copyright (c) 2003-2004 IBM Corp.<br>
=C2=A0 */<br>
<br>
+#include &lt;linux/acpi.h&gt;<br>
=C2=A0#include &lt;linux/device.h&gt;<br>
=C2=A0#include &lt;linux/err.h&gt;<br>
=C2=A0#include &lt;linux/export.h&gt;<br>
@@ -56,6 +57,39 @@ static struct device_type drm_sysfs_device_connector =3D=
 {<br>
<br>
=C2=A0struct class *drm_class;<br>
<br>
+#ifdef CONFIG_ACPI<br>
+static bool drm_connector_acpi_bus_match(<wbr>struct device *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev-&gt;type =3D=3D &amp;drm_sysfs_devic=
e_connector;<br>
+}<br>
+<br>
+static struct acpi_device *drm_connector_acpi_find_<wbr>companion(struct d=
evice *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector =3D to_drm_conn=
ector(dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return to_acpi_device_node(connector-<wbr>&gt;f=
wnode);<br>
+}<br>
+<br>
+static struct acpi_bus_type drm_connector_acpi_bus =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;drm_connector&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.match =3D drm_connector_acpi_bus_match,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.find_companion =3D drm_connector_acpi_find_<wb=
r>companion,<br>
+};<br>
+<br>
+static void drm_sysfs_acpi_register(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0register_acpi_bus_type(&amp;drm_<wbr>connector_=
acpi_bus);<br>
+}<br>
+<br>
+static void drm_sysfs_acpi_unregister(<wbr>void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_acpi_bus_type(&amp;drm_<wbr>connecto=
r_acpi_bus);<br>
+}<br>
+#else<br>
+static void drm_sysfs_acpi_register(void) { }<br>
+static void drm_sysfs_acpi_unregister(<wbr>void) { }<br>
+#endif<br>
+<br>
=C2=A0static char *drm_devnode(struct device *dev, umode_t *mode)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return kasprintf(GFP_KERNEL, &quot;dri/%s&quot;=
, dev_name(dev));<br>
@@ -89,6 +123,8 @@ int drm_sysfs_init(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_class-&gt;devnode =3D drm_devnode;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_sysfs_acpi_register();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
@@ -101,6 +137,7 @@ void drm_sysfs_destroy(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR_OR_NULL(drm_class))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_sysfs_acpi_unregister();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 class_remove_file(drm_class, &amp;class_attr_ve=
rsion.attr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 class_destroy(drm_class);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_class =3D NULL;<br>
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h<br>
index 0261801af62c..d20bfd7576ed 100644<br>
--- a/include/drm/drm_connector.h<br>
+++ b/include/drm/drm_connector.h<br>
@@ -1254,6 +1254,8 @@ struct drm_connector {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *kdev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** @attr: sysfs attributes */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @fwnode: associated fwnode supplied by plat=
form firmware */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct fwnode_handle *fwnode;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* @head:<br>
-- <br>
2.31.1<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--0000000000002a9bfa05c17c6e73--

--===============0720991107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0720991107==--
