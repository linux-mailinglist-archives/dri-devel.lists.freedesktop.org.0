Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 607F769C6E2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 09:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4286310E613;
	Mon, 20 Feb 2023 08:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AAD10E613
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 08:41:23 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id y140so431061iof.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 00:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YhM9RK9cD4AJ2RC/Ap9FHaybKTgjkZHb1g/aRuA4Axw=;
 b=kswMQz3WeBc+8ATmnrQxgtpi2uoiitfpiI6qLlhxmEW+okOgzNEZd7Ke8wWQuK5H01
 4EBxEo8W6zH8VVrNVvpvc7EUMJSk6J+ju69ff40ih0nDzLEFCKH38gaNGNvdMwcbuDci
 Zd9RRimOPvzIdACIqY/06mZYOEoPBaSoZex1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YhM9RK9cD4AJ2RC/Ap9FHaybKTgjkZHb1g/aRuA4Axw=;
 b=yFfzJF3ExtqN7ojKwoXII/cHhhGqWVXfii5IczaiKDXAdmCnfRKkemx+AbV0ds4tV9
 XxdpVvsRYUbEguABNn9Klyp2ozVlmUsFr8jkks7ye9zTAbvRKWrlUyDTWbVWRM8GG5EQ
 NV5nakci5tGQlnGH6+pZTyCkhWmoPsdK68cvSxmay6y24ofXUO5lmP85POTojqe/5FW9
 7X1WLjO26aWszk3VaIQ5Pd4sivBdShTYNOQhhWyCjPssT7qUJRigXEtorcd03JNyttek
 CfHuO5cOmyJBvCQxnjXeguyvOyDWaYBRQA0kR1byEN5bGDegVRKzJSfr9kzBG7XWJlpY
 cnTw==
X-Gm-Message-State: AO0yUKWm/xVrvhBnf0hnir8lP/0EOyhUSrVi/opcxlI1CHCzIDgXPDgj
 JaRT2ctDVh2twEX5JFVhlMCw7bVf31xhNU+dBRd9iQ==
X-Google-Smtp-Source: AK7set+BxDCEXvEcpWN6BMD+/231nrKE1Igfho3xtBe9qZTQnQjj5IWzOAp6kv3gzbg47MAGtikfQ50iFLLkSm7XZAg=
X-Received: by 2002:a02:a990:0:b0:3c4:d689:3e7 with SMTP id
 q16-20020a02a990000000b003c4d68903e7mr734277jam.2.1676882483085; Mon, 20 Feb
 2023 00:41:23 -0800 (PST)
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-4-treapking@chromium.org>
 <Y+LBzkP+/j6RQ5Jy@ashyti-mobl2.lan>
In-Reply-To: <Y+LBzkP+/j6RQ5Jy@ashyti-mobl2.lan>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 20 Feb 2023 16:41:12 +0800
Message-ID: <CAEXTbpfxJVyL_TT7j1J0tbEjWnzj6JYOrEJZLa14OdHZQhYopg@mail.gmail.com>
Subject: Re: [PATCH v11 3/9] drm/display: Add Type-C switch helpers
To: Andi Shyti <andi.shyti@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000bc203905f51da007"
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
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000bc203905f51da007
Content-Type: text/plain; charset="UTF-8"

Hi Andi,

Thanks for the review.

On Wed, Feb 8, 2023 at 5:25 AM Andi Shyti <andi.shyti@linux.intel.com>
wrote:

> Hi Pin-yen,
>
> [...]
>
> > +static int drm_dp_register_mode_switch(struct device *dev,
> > +                                    struct fwnode_handle *fwnode,
> > +                                    struct drm_dp_typec_switch_desc
> *switch_desc,
> > +                                    void *data, typec_mux_set_fn_t
> mux_set)
> > +{
> > +     struct drm_dp_typec_port_data *port_data;
> > +     struct typec_mux_desc mux_desc = {};
> > +     char name[32];
> > +     u32 port_num;
> > +     int ret;
> > +
> > +     ret = fwnode_property_read_u32(fwnode, "reg", &port_num);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to read reg property: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     port_data = &switch_desc->typec_ports[port_num];
> > +     port_data->data = data;
> > +     port_data->port_num = port_num;
> > +     port_data->fwnode = fwnode;
> > +     mux_desc.fwnode = fwnode;
> > +     mux_desc.drvdata = port_data;
> > +     snprintf(name, sizeof(name), "%pfwP-%u", fwnode, port_num);
> > +     mux_desc.name = name;
> > +     mux_desc.set = mux_set;
> > +
> > +     port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> > +     if (IS_ERR(port_data->typec_mux)) {
> > +             ret = PTR_ERR(port_data->typec_mux);
> > +             dev_err(dev, "Mode switch register for port %d failed:
> %d\n",
> > +                     port_num, ret);
> > +
> > +             return ret;
>
> you don't need this return here...
>
> > +     }
> > +
> > +     return 0;
>
> Just "return ret;" here.


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
> > + * This function registers USB Type-C switches for DP bridges that can
> switch
> > + * the output signal between their output pins.
> > + *
> > + * Currently only mode switches are implemented, and the function
> assumes the
> > + * given @port device node has endpoints with "mode-switch" property.
> > + * The port number is determined by the "reg" property of the endpoint.
> > + */
> > +int drm_dp_register_typec_switches(struct device *dev, struct
> fwnode_handle *port,
> > +                                struct drm_dp_typec_switch_desc
> *switch_desc,
> > +                                void *data, typec_mux_set_fn_t mux_set)
> > +{
> > +     struct fwnode_handle *sw;
> > +     int ret;
> > +
> > +     fwnode_for_each_child_node(port, sw) {
> > +             if (fwnode_property_present(sw, "mode-switch"))
> > +                     switch_desc->num_typec_switches++;
> > +     }
>
> no need for brackets here
>
> > +
> > +     if (!switch_desc->num_typec_switches) {
> > +             dev_dbg(dev, "No Type-C switches node found\n");
>
> dev_warn()?
>

I used dev_dbg here because the users might call this without checking if
there are mode switch endpoints present, and this is the case for the
current users (it6505 and anx7625). If we use dev_warn here, there will be
warnings every time even on use cases without Type-C switches.

Thanks and regards,
Pin-yen

>
> > +             return 0;
> > +     }
> > +
> > +     switch_desc->typec_ports = devm_kcalloc(
> > +             dev, switch_desc->num_typec_switches,
> > +             sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
> > +
> > +     if (!switch_desc->typec_ports)
> > +             return -ENOMEM;
> > +
> > +     /* Register switches for each connector. */
> > +     fwnode_for_each_child_node(port, sw) {
> > +             if (!fwnode_property_present(sw, "mode-switch"))
> > +                     continue;
> > +             ret = drm_dp_register_mode_switch(dev, sw, switch_desc,
> data, mux_set);
> > +             if (ret)
> > +                     goto err_unregister_typec_switches;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_unregister_typec_switches:
> > +     fwnode_handle_put(sw);
> > +     drm_dp_unregister_typec_switches(switch_desc);
> > +     dev_err(dev, "Failed to register mode switch: %d\n", ret);
>
> there is a bit of dmesg spamming. Please choose where you want to
> print the error, either in this function or in
> drm_dp_register_mode_switch().
>
> Andi
>
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(drm_dp_register_typec_switches);
>
> [...]
>

--000000000000bc203905f51da007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Andi,<div><br></div><div>Thanks for th=
e review.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 8, 2023 at 5:25 AM Andi Shyti &lt;<a href=3D"ma=
ilto:andi.shyti@linux.intel.com">andi.shyti@linux.intel.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Pin-yen,<br>
<br>
[...]<br>
<br>
&gt; +static int drm_dp_register_mode_switch(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct fwnode_hand=
le *fwnode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_dp_type=
c_switch_desc *switch_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data, typec_=
mux_set_fn_t mux_set)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_dp_typec_port_data *port_data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct typec_mux_desc mux_desc =3D {};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char name[32];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 port_num;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D fwnode_property_read_u32(fwnode, &quot;re=
g&quot;, &amp;port_num);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to read reg property: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port_data =3D &amp;switch_desc-&gt;typec_ports[po=
rt_num];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port_data-&gt;data =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port_data-&gt;port_num =3D port_num;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port_data-&gt;fwnode =3D fwnode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mux_desc.fwnode =3D fwnode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mux_desc.drvdata =3D port_data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snprintf(name, sizeof(name), &quot;%pfwP-%u&quot;=
, fwnode, port_num);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0<a href=3D"http://mux_desc.name" rel=3D"noreferre=
r" target=3D"_blank">mux_desc.name</a> =3D name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mux_desc.set =3D mux_set;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port_data-&gt;typec_mux =3D typec_mux_register(de=
v, &amp;mux_desc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(port_data-&gt;typec_mux)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(port_=
data-&gt;typec_mux);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Mo=
de switch register for port %d failed: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0port_num, ret);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
you don&#39;t need this return here...<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
<br>
Just &quot;return ret;&quot; here.=C2=A0</blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * drm_dp_register_typec_switches() - register Type-C switches<br>
&gt; + * @dev: Device that registers Type-C switches<br>
&gt; + * @port: Device node for the switch<br>
&gt; + * @switch_desc: A Type-C switch descriptor<br>
&gt; + * @data: Private data for the switches<br>
&gt; + * @mux_set: Callback function for typec_mux_set<br>
&gt; + *<br>
&gt; + * This function registers USB Type-C switches for DP bridges that ca=
n switch<br>
&gt; + * the output signal between their output pins.<br>
&gt; + *<br>
&gt; + * Currently only mode switches are implemented, and the function ass=
umes the<br>
&gt; + * given @port device node has endpoints with &quot;mode-switch&quot;=
 property.<br>
&gt; + * The port number is determined by the &quot;reg&quot; property of t=
he endpoint.<br>
&gt; + */<br>
&gt; +int drm_dp_register_typec_switches(struct device *dev, struct fwnode_=
handle *port,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_dp_typec_switch_desc =
*switch_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data, typec_mux_set_fn_t m=
ux_set)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct fwnode_handle *sw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fwnode_for_each_child_node(port, sw) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fwnode_property_p=
resent(sw, &quot;mode-switch&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0switch_desc-&gt;num_typec_switches++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
no need for brackets here<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!switch_desc-&gt;num_typec_switches) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(dev, &quot;No=
 Type-C switches node found\n&quot;);<br>
<br>
dev_warn()?<br></blockquote><div><br></div><div>I used dev_dbg here because=
 the users might call this without checking if there are mode switch endpoi=
nts present, and this is the case for the current users (it6505 and anx7625=
). If we use dev_warn here, there will be warnings every time even on use c=
ases without Type-C switches.</div><div><br></div><div>Thanks and regards,<=
/div><div>Pin-yen</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch_desc-&gt;typec_ports =3D devm_kcalloc(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev, switch_desc-&gt;=
num_typec_switches,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(struct drm_dp_=
typec_port_data), GFP_KERNEL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!switch_desc-&gt;typec_ports)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Register switches for each connector. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fwnode_for_each_child_node(port, sw) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fwnode_property_=
present(sw, &quot;mode-switch&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_dp_regist=
er_mode_switch(dev, sw, switch_desc, data, mux_set);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto err_unregister_typec_switches;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_unregister_typec_switches:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fwnode_handle_put(sw);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dp_unregister_typec_switches(switch_desc);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Failed to register mode switch=
: %d\n&quot;, ret);<br>
<br>
there is a bit of dmesg spamming. Please choose where you want to<br>
print the error, either in this function or in<br>
drm_dp_register_mode_switch().<br>
<br>
Andi<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(drm_dp_register_typec_switches);<br>
<br>
[...]<br>
</blockquote></div></div>

--000000000000bc203905f51da007--
