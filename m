Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A12B1D62F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 12:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCE610E3E4;
	Thu,  7 Aug 2025 10:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GK4Di79w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A1010E3E4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 10:58:29 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3e3f1e69090so4223235ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754564308; x=1755169108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8tWMOA3+MxqIET7zOeogQlZpQrCQ4ulH5geagIzb9wU=;
 b=GK4Di79w3H7HJvN1FP0vpuTdcigL8Oo7bcD2B/dTIc2fEIhV9DEmE+O4P5Te+1fEv4
 9cEi1r5JtDy4LCT11pFCoQ8PvsgppUHEo1R45TXO+SIMUM9a7TL1ZfJ1lkfG8R1prEhd
 UhNL3uqxPOUSEDCp1zT12GAxdbV9dWpa5TvuEwAKKmsppGP3Nt8NwK0APaurTZfIbqXl
 QI61WJXrP9fPnFeBQYEp+Mt5z/elfBts1msbQvvI9Ssobp1+NGtbAk9zZAl6/TCTWIXP
 /mzqBC5QQ2gqLB2yGbOttMpFXfsQ70z7+ZWCG1Yssuo1h3YcT6uvhY1495OX5kElYuBn
 qw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754564308; x=1755169108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8tWMOA3+MxqIET7zOeogQlZpQrCQ4ulH5geagIzb9wU=;
 b=PA+qI8kmHM5cUQKtH22BEechlASHphF0E26iRMPvjCQCcFXI1RPmWDDq1ld//eI8lq
 Gt4R+APzboydCkN3iHUuOVafhPxg5wB3SqDeqHdC1sGPyF5MmLmul//+7EguDdzoEI0c
 OhXj+fIxdBBK/r8lQaJAQK7by3jmt7ZJr3kNrDIMRlSgwXFsKFJUdWI35DXof9Y1ch/F
 2YIof/HQ9rIyIJPZR6AtTG4XtHIe7mmqn4bkZCa53mt9XaJi4hahKQIvHqDZib/c25qS
 eQeaJ7GxHXkZB92tojfy1RzvRATQsLSuzGqAiZoFZe95MFADabSEGZoyUtgIFun/LO8t
 /2qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlRrMqcMnlt7LiMYzveMS+RmG51UuK6pb7mLQ39VnpUu1w+oVzsdcdezc4MYQr5IYCxMmlTaY5r/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa1FRuih6Kgfp58XeCeby4Ikq45l5QFDU7LMMO5gbIU1hj1MBj
 svMRdZRPaprQKbjezq7OpB/Tqmk4ftFN8+4MXHDnwYPF4mCtOiFevzG+aTsaToEZjm+nm/0i70u
 5PCudSSaJZsCmg6Z6HN4iG9eJM20HxhI=
X-Gm-Gg: ASbGncsk5Rpx39YYeormIUvM4S6hM9/4XtLXJUd7fVoa5O2t+zA8BxF0kwyq5GSXUKb
 Ux7OC1N+XHST2+m1yIDSVg2+l9Yj4M2464wmmc5ljtizjFJihKyfIq6pBnB0BiRZ6z9c6HOMGH6
 zqjINNqbeRZy5ksu2+wwCo1hEyxCzB0A+N3hehd90AWrkG2gOOAcJTvYO9dc3Z5YvIZja5Ch/9T
 //W8fU=
X-Google-Smtp-Source: AGHT+IHFyEqQlwA4nzQRnsXvPUsGwZOgKB36m7+Ke65jmW1lXiVYvMW77eXhUFaYX4r2OmzVe+1dFNu46sXVYvnzZ80=
X-Received: by 2002:a05:6e02:18c7:b0:3df:3598:7688 with SMTP id
 e9e14a558f8ab-3e51b93cc8dmr120096585ab.21.1754564308346; Thu, 07 Aug 2025
 03:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com>
 <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
 <CAA+D8AN4n0H6M_0EqX4z_37ViSCyThKbmtMgqPmipintJ8Wtwg@mail.gmail.com>
 <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com>
In-Reply-To: <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Aug 2025 18:58:15 +0800
X-Gm-Features: Ac12FXwUPM-Znt5cq2SUHVDzi6o3wmoQ462FD5iaVLkULQVZBddMO5yf_2W0GwQ
Message-ID: <CAA+D8AN3VzFx1g=8wyxJROw96xS2-qoVs3X4vUfFnJtUCqFj_w@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
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

On Wed, Aug 6, 2025 at 2:52=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On 08/06/2025, Shengjiu Wang wrote:
> > On Tue, Aug 5, 2025 at 4:55=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wr=
ote:
> >>
> >> On 08/04/2025, Shengjiu Wang wrote:
>
> [...]
>
> >>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *m=
aster, void *data)
> >>> +{
> >>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_da=
ta *)data;
> >>> +     struct imx8mp_hdmi_pai *hdmi_pai;
> >>> +
> >>> +     hdmi_pai =3D dev_get_drvdata(dev);
> >>> +
> >>> +     plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> >>> +     plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> >>> +     plat_data->priv_audio =3D hdmi_pai;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct device=
 *master, void *data)
> >>> +{
> >>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_da=
ta *)data;
> >>> +
> >>> +     plat_data->enable_audio =3D NULL;
> >>> +     plat_data->disable_audio =3D NULL;
> >>> +     plat_data->priv_audio =3D NULL;
> >>
> >> Do you really need to set these ptrs to NULL?
> >
> > yes.  below code in dw-hdmi.c use the pdata->enable_audio as condition.
>
> Note that this is all about tearing down components.
> If this is done properly as the below snippet of pseudo-code, then
> hdmi->{enable,disable}_audio() and pdata->{enable,disable}_audio() won't =
be
> called after audio device is removed by dw_hdmi_remove().  So, it's unnec=
essary
> to set these pointers to NULL here.
>
> imx8mp_dw_hdmi_unbind()
> {
>    dw_hdmi_remove(); // platform_device_unregister(hdmi->audio);
>    component_unbind_all(); //imx8mp_hdmi_pai_unbind()
> }
>
> BTW, I suggest the below snippet[1] to bind components.
>
> imx8mp_dw_hdmi_bind()
> {
>    component_bind_all(); // imx8mp_hdmi_pai_bind()
>                          //   set pdata->{enable,disable}_audio
>    dw_hdmi_probe(); // hdmi->audio =3D platform_device_register_full(&pde=
vinfo);
> }

Looks like we should use dw_hdmi_bind() here to make unbind -> bind work.
But can't get the encoder pointer.  the encoder pointer is from lcdif_drv.c=
,
the probe sequence of lcdif, pvi, dw_hdmi should be dw_hdmi first, then pvi=
,
then lcdif, because current implementation in lcdif and pvi driver.

Should the lcdif and pvi driver be modified to use component helper?
This seems out of the scope of this patch set.

Best regards
Shengjiu Wang
>
> >
> >         if (pdata->enable_audio)
> >                 pdata->enable_audio(hdmi,
> >                                     hdmi->channels,
> >                                     hdmi->sample_width,
> >                                     hdmi->sample_rate,
> >                                     hdmi->sample_non_pcm,
> >                                     hdmi->sample_iec958);
> >
> >
> >>
>
> [...]
>
> >>> +     return component_add(dev, &imx8mp_hdmi_pai_ops);
> >>
> >> Imagine that users could enable this driver without enabling imx8mp-hd=
mi-tx
> >> driver, you may add the component in this probe() callback only and mo=
ve all
> >> the other stuff to bind() callback to avoid unnecessary things being d=
one here.
> >
> > component helper functions don't have such dependency that the aggregat=
e
> > driver or component driver must be probed or not.  if imx8mp-hdmi-tx is=
 not
> > enabled, there is no problem, just the bind() callback is not called.
>
> I meant I'd write imx8mp_hdmi_pai_probe() as below snippet and do all the
> other stuff in imx8mp_hdmi_pai_bind().  This ensures minimum things are d=
one
> in imx8mp_hdmi_pai_probe() if imx8mp-hdmi-tx doesn't probe.
>
> static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
> {
>         return component_add(&pdev->dev, &imx8mp_hdmi_pai_ops);
> }
>
> >
> >>
> >>> +}
> >>> +
> >>> +static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
> >>> +{
> >>> +     component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
> >>> +}
> >>> +
> >>> +static const struct of_device_id imx8mp_hdmi_pai_of_table[] =3D {
> >>> +     { .compatible =3D "fsl,imx8mp-hdmi-pai" },
> >>> +     { /* Sentinel */ }
> >>> +};
> >>> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
> >>> +
> >>> +static struct platform_driver imx8mp_hdmi_pai_platform_driver =3D {
> >>> +     .probe          =3D imx8mp_hdmi_pai_probe,
> >>> +     .remove         =3D imx8mp_hdmi_pai_remove,
> >>> +     .driver         =3D {
> >>> +             .name   =3D "imx8mp-hdmi-pai",
> >>> +             .of_match_table =3D imx8mp_hdmi_pai_of_table,
> >>> +     },
> >>> +};
> >>> +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
> >>> +
> >>> +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
> >>> +MODULE_LICENSE("GPL");
> >>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gp=
u/drm/bridge/imx/imx8mp-hdmi-tx.c
> >>> index 1e7a789ec289..ee08084d2394 100644
> >>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >>> @@ -5,11 +5,13 @@
> >>>   */
> >>>
> >>>  #include <linux/clk.h>
> >>> +#include <linux/component.h>
> >>>  #include <linux/mod_devicetable.h>
> >>>  #include <linux/module.h>
> >>>  #include <linux/platform_device.h>
> >>>  #include <drm/bridge/dw_hdmi.h>
> >>>  #include <drm/drm_modes.h>
> >>> +#include <drm/drm_of.h>
> >>>
> >>>  struct imx8mp_hdmi {
> >>>       struct dw_hdmi_plat_data plat_data;
> >>> @@ -79,11 +81,46 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_p=
hy_ops =3D {
> >>>       .update_hpd     =3D dw_hdmi_phy_update_hpd,
> >>>  };
> >>>
> >>> +static int imx8mp_dw_hdmi_bind(struct device *dev)
> >>> +{
> >>> +     struct dw_hdmi_plat_data *plat_data;
> >>> +     struct imx8mp_hdmi *hdmi;
> >>> +     int ret;
> >>> +
> >>> +     hdmi =3D dev_get_drvdata(dev);
> >>> +     plat_data =3D &hdmi->plat_data;
> >>> +
> >>> +     ret =3D component_bind_all(dev, plat_data);
> >>> +     if (ret)
> >>> +             return dev_err_probe(dev, ret, "component_bind_all fail=
ed!\n");
> >>
> >> As component_bind_all() would bind imx8mp-hdmi-pai and hence set
> >> {enable,disable}_audio callbacks, you need to call dw_hdmi_probe() aft=
er
> >> component_bind_all() instead of too early in probe() callback.
> >
> > There is no such dependency.
> > Maybe you mixed the hdmi->enable_audio() with pdata->enable_audio().
>
> As the above snippet[1] shows, once dw_hdmi_probe() registers audio devic=
e,
> the audio device could be functional soon after audio driver probes, henc=
e
> hdmi->enable_audio() would be called and hence pdata->enable_audio() woul=
d
> be called. So, you need to set pdata->enable_audio() before dw_hdmi_probe=
()
> is called, otherwise pdata->enable_audio could be NULL when is called by
> audio driver.
>
> [...]
>
> >>> +     remote =3D of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> >>> +     if (remote && of_device_is_available(remote)) {
> >>
> >> Doesn't of_graph_get_remote_node() ensure that remote is avaiable?
> >
> > No.  'remote' is the node,  not the 'device'.
>
> See of_device_is_available() is called by of_graph_get_remote_node():
>
> struct device_node *of_graph_get_remote_node(const struct device_node *no=
de,
>                                              u32 port, u32 endpoint)
> {
>         struct device_node *endpoint_node, *remote;
>
>         endpoint_node =3D of_graph_get_endpoint_by_regs(node, port, endpo=
int);
>         if (!endpoint_node) {
>                 pr_debug("no valid endpoint (%d, %d) for node %pOF\n",
>                          port, endpoint, node);
>                 return NULL;
>         }
>
>         remote =3D of_graph_get_remote_port_parent(endpoint_node);
>         of_node_put(endpoint_node);
>         if (!remote) {
>                 pr_debug("no valid remote node\n");
>                 return NULL;
>         }
>
>         if (!of_device_is_available(remote)) {
>              ^~~~~~~~~~~~~~~~~~~~~~
>                 pr_debug("not available for remote node\n");
>                 of_node_put(remote);
>                 return NULL;
>         }
>
>         return remote;
> }
> EXPORT_SYMBOL(of_graph_get_remote_node);
>
> >
> >>
> >>> +             drm_of_component_match_add(dev, &match, component_compa=
re_of, remote);
> >>> +
> >>> +             of_node_put(remote);
> >>> +
> >>> +             ret =3D component_master_add_with_match(dev, &imx8mp_dw=
_hdmi_ops, match);
> >>> +             if (ret)
> >>> +                     dev_warn(dev, "Unable to register aggregate dri=
ver\n");
> >>> +             /*
> >>> +              * This audio function is optional for avoid blocking d=
isplay.
> >>> +              * So just print warning message and no error is return=
ed.
> >>
> >> No, since PAI node is available here, it has to be bound.  Yet you sti=
ll need
> >> to properly handle the case where PAI node is inavailable.
> >
> > This is for aggregate driver registration,  not for bind()
> >
> > The bind() is called after both drivers have been registered.  again th=
ere is no
> > dependency for both aggregate driver and component driver should be
> > registered or probed.
>
> Sorry for not being clear about my previous wording.  I meant since PAI n=
ode is
> available here, component_master_add_with_match() must be called to regis=
ter
> the master and if it fails to register it, imx8mp_dw_hdmi_probe() should =
return
> proper error code, not 0.
>
> --
> Regards,
> Liu Ying
