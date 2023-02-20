Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EA369C736
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 10:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5BD10E61B;
	Mon, 20 Feb 2023 09:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6535D10E61B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 09:03:02 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id 76so175204iou.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 01:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vK8cWtmG3hyaLbDRLFgpGqrS4p5hCk6+ikOOD3341A=;
 b=BT2ud7sxoolXPSVz5YqHI7AD9RUl8N77zxnGMFNIRbnYZ5NkGNX9t15jb4JPaWA0gx
 RjgNyOP62hyyw3LtDM51WRaeDbSW+gmOyX365JR1nV/4MS/DGuN+CxjtV2S82wMFZDkJ
 APJfi8WJHRCCVh7BpaS6YJFgaYSTVJLIbJWYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6vK8cWtmG3hyaLbDRLFgpGqrS4p5hCk6+ikOOD3341A=;
 b=rL0hEHP1YUVqUwZlNtCDTbE3A3Gy+dVjhRn4RiDXaB6UMki/DXBKLLZduuaHj8m1bd
 o3uwOFX6X/h37oJi+zf9YJ/m2izg0mspGnnF9AkybiR3BCYMOEA//GBy/OJZ/MWGK5rx
 YD4YvwmYBm8UJzj/jc8GvjxIH1OjeB5GROtXyxO0TEgS1Dn1yquYtBxGpeBMr1XsTuKc
 obAEz2XtwR6KAIzk5x4SZvRat/WqrkmNPt94kVPEQZPp4CLnnWGg1yktNYQSChfZWHzT
 3FUl0LPXIXnFJvL5D3E49vRs+NcvlHqgyaVpgSxuu8XsAXBfWmJQ4TnVKAvPfT5XWaWI
 8RWQ==
X-Gm-Message-State: AO0yUKXKcD/8Foq+QCgT4TAcUa52dz+svdCG+BFhN+LXRAd6DAdshZll
 r6a1EKRicTX7+rGjQvf7+bu5CRokr8TeJmyX9bqjvA==
X-Google-Smtp-Source: AK7set/kfz8hhDABr4DJ+44LUPCJEAg1cYsDPb4PwPecz9RynTAejbvde/9b9DWWLC1U8dNQIeThAlbfMv3O8bnKttg=
X-Received: by 2002:a05:6638:1342:b0:3c2:c1c9:8bca with SMTP id
 u2-20020a056638134200b003c2c1c98bcamr1153386jad.2.1676883781590; Mon, 20 Feb
 2023 01:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-4-treapking@chromium.org>
 <Y+LBzkP+/j6RQ5Jy@ashyti-mobl2.lan>
 <CAEXTbpfxJVyL_TT7j1J0tbEjWnzj6JYOrEJZLa14OdHZQhYopg@mail.gmail.com>
In-Reply-To: <CAEXTbpfxJVyL_TT7j1J0tbEjWnzj6JYOrEJZLa14OdHZQhYopg@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 20 Feb 2023 17:02:50 +0800
Message-ID: <CAEXTbpe_DGzF+M6Cm041Qkec-FZTXn5G8oCa_P-1cU355MA0JA@mail.gmail.com>
Subject: Re: [PATCH v11 3/9] drm/display: Add Type-C switch helpers
To: Andi Shyti <andi.shyti@linux.intel.com>
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
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Robert Foss <rfoss@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
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
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think I accidentally used HTML mode for the previous email. Sorry about t=
hat.

On Mon, Feb 20, 2023 at 4:41 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> Hi Andi,
>
> Thanks for the review.
>
> On Wed, Feb 8, 2023 at 5:25 AM Andi Shyti <andi.shyti@linux.intel.com> wr=
ote:
>>
>> Hi Pin-yen,
>>
>> [...]
>>
>> > +static int drm_dp_register_mode_switch(struct device *dev,
>> > +                                    struct fwnode_handle *fwnode,
>> > +                                    struct drm_dp_typec_switch_desc *=
switch_desc,
>> > +                                    void *data, typec_mux_set_fn_t mu=
x_set)
>> > +{
>> > +     struct drm_dp_typec_port_data *port_data;
>> > +     struct typec_mux_desc mux_desc =3D {};
>> > +     char name[32];
>> > +     u32 port_num;
>> > +     int ret;
>> > +
>> > +     ret =3D fwnode_property_read_u32(fwnode, "reg", &port_num);
>> > +     if (ret) {
>> > +             dev_err(dev, "Failed to read reg property: %d\n", ret);
>> > +             return ret;
>> > +     }
>> > +
>> > +     port_data =3D &switch_desc->typec_ports[port_num];
>> > +     port_data->data =3D data;
>> > +     port_data->port_num =3D port_num;
>> > +     port_data->fwnode =3D fwnode;
>> > +     mux_desc.fwnode =3D fwnode;
>> > +     mux_desc.drvdata =3D port_data;
>> > +     snprintf(name, sizeof(name), "%pfwP-%u", fwnode, port_num);
>> > +     mux_desc.name =3D name;
>> > +     mux_desc.set =3D mux_set;
>> > +
>> > +     port_data->typec_mux =3D typec_mux_register(dev, &mux_desc);
>> > +     if (IS_ERR(port_data->typec_mux)) {
>> > +             ret =3D PTR_ERR(port_data->typec_mux);
>> > +             dev_err(dev, "Mode switch register for port %d failed: %=
d\n",
>> > +                     port_num, ret);
>> > +
>> > +             return ret;
>>
>> you don't need this return here...
>>
>> > +     }
>> > +
>> > +     return 0;
>>
>> Just "return ret;" here.

This was actually suggested by Angelo in [1]. I personally don't have
a strong opinion on either approach.

[1]https://lore.kernel.org/all/023519eb-0adb-3b08-71b9-afb92a6cceaf@collabo=
ra.com/

Pin-yen
>>
>>
>> > +}
>> > +
>> > +/**
>> > + * drm_dp_register_typec_switches() - register Type-C switches
>> > + * @dev: Device that registers Type-C switches
>> > + * @port: Device node for the switch
>> > + * @switch_desc: A Type-C switch descriptor
>> > + * @data: Private data for the switches
>> > + * @mux_set: Callback function for typec_mux_set
>> > + *
>> > + * This function registers USB Type-C switches for DP bridges that ca=
n switch
>> > + * the output signal between their output pins.
>> > + *
>> > + * Currently only mode switches are implemented, and the function ass=
umes the
>> > + * given @port device node has endpoints with "mode-switch" property.
>> > + * The port number is determined by the "reg" property of the endpoin=
t.
>> > + */
>> > +int drm_dp_register_typec_switches(struct device *dev, struct fwnode_=
handle *port,
>> > +                                struct drm_dp_typec_switch_desc *swit=
ch_desc,
>> > +                                void *data, typec_mux_set_fn_t mux_se=
t)
>> > +{
>> > +     struct fwnode_handle *sw;
>> > +     int ret;
>> > +
>> > +     fwnode_for_each_child_node(port, sw) {
>> > +             if (fwnode_property_present(sw, "mode-switch"))
>> > +                     switch_desc->num_typec_switches++;
>> > +     }
>>
>> no need for brackets here
>>
>> > +
>> > +     if (!switch_desc->num_typec_switches) {
>> > +             dev_dbg(dev, "No Type-C switches node found\n");
>>
>> dev_warn()?
>
>
> I used dev_dbg here because the users might call this without checking if=
 there are mode switch endpoints present, and this is the case for the curr=
ent users (it6505 and anx7625). If we use dev_warn here, there will be warn=
ings every time even on use cases without Type-C switches.
>
> Thanks and regards,
> Pin-yen
>>
>>
>> > +             return 0;
>> > +     }
>> > +
>> > +     switch_desc->typec_ports =3D devm_kcalloc(
>> > +             dev, switch_desc->num_typec_switches,
>> > +             sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
>> > +
>> > +     if (!switch_desc->typec_ports)
>> > +             return -ENOMEM;
>> > +
>> > +     /* Register switches for each connector. */
>> > +     fwnode_for_each_child_node(port, sw) {
>> > +             if (!fwnode_property_present(sw, "mode-switch"))
>> > +                     continue;
>> > +             ret =3D drm_dp_register_mode_switch(dev, sw, switch_desc=
, data, mux_set);
>> > +             if (ret)
>> > +                     goto err_unregister_typec_switches;
>> > +     }
>> > +
>> > +     return 0;
>> > +
>> > +err_unregister_typec_switches:
>> > +     fwnode_handle_put(sw);
>> > +     drm_dp_unregister_typec_switches(switch_desc);
>> > +     dev_err(dev, "Failed to register mode switch: %d\n", ret);
>>
>> there is a bit of dmesg spamming. Please choose where you want to
>> print the error, either in this function or in
>> drm_dp_register_mode_switch().
>>
>> Andi
>>
>> > +     return ret;
>> > +}
>> > +EXPORT_SYMBOL(drm_dp_register_typec_switches);
>>
>> [...]
