Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A82AB1E26E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 08:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB4710E4CB;
	Fri,  8 Aug 2025 06:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HKsh8JJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC7F10E4CB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 06:45:41 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3e3f378ea68so15881275ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 23:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754635540; x=1755240340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfJ96l0L79uC3QqMW/tKUozVfcbzbbqgdHMrzI/pgq0=;
 b=HKsh8JJoStvlRqHcFjxKcC3383OULrFC8hHK7olH7hYmJi2ELz95oPRijp4urHYQAe
 SstcHyAoCscjOYVSE7xWRB6q5RUBmcuOoLrojGAbnfu0WyWumVYA+GwshxJjU6v7X1LS
 1Q8mvhARON7pz7Mp/HXj3pM3gIvGACDa8spQp2A0trRl6UouCZ5KgpJ41Emof050Eram
 gvBG8FlYPD9+XcKpCrx0hSfRnAqHSJRAlIKGU/cidB7NlYV2RNlPqIoOccJs7B/RY6cM
 fUKGxN8esQQcitvCkkgL2IUfkXzkt0c6JIdxeqMzg2ZSNjZZWNXf5+l4Fc9FT1Ocr6EQ
 7wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754635540; x=1755240340;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfJ96l0L79uC3QqMW/tKUozVfcbzbbqgdHMrzI/pgq0=;
 b=JWw8BtDA8IH+4Ma8+I67DQBCCDmI6dqfbsLcJPWpO6WSkFl2M+a4N9t/NIAgLQM8yz
 t64hoTvRtsOJwvfUo7OuFSb4acN2bTQUcdnZZj/E2wiF11YLCAa55zUWkCahC2Uf+ign
 sxiXgf73IBruzl6PyWSCXiUKRJDuksIf0doa0BpEo+puoNOyLinOntt15Uiga34W0RPe
 /NTcdwsens7G/bP7DvGC/hF+pH8inN95ZNSFHnbsbQZRF7yue6R0Vdnq488fvk2+a3dd
 /aDH6J5RMgNon4/CfhIoHk1gXWU87YzeOt41r0jzfuWAUTrvNHXKOFv42cOTm0ubBD7G
 Lb/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUayWtqSgDmNKXUYjVBrvB8yyNjG4p0u5Blfn0sXFLHxQ3T4xeLwVGW5z+FX3HFE6Jbx7205hQGfkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylak7/0oXIL2hrrF6O8NSY398cYHbTV1Hnh7JN/VLU5kLNGLYt
 IoGDmfzjwOedyhCk+xYBFides/VVJ4HF1ZKDsmBbY7uGYtzjKhdCjzmF6scZk/RmR+9jBnoiLnZ
 ufWPLJkdHNf8uwPb+sHKqQo2XmIqTx90=
X-Gm-Gg: ASbGncuRj4c1kPbuMrL1Hf15K5VWp9H7fZCBogTYjCkk2kefF1JWSi40NDGHYJ6J5Rn
 yMXRa1odfkk4oK1h67HxQugW9p5JFecgDzF8tnmlL4pmMV/lC3U/CsIq9Dg2Ms0gvn46NEgnL3P
 e9o9vmdpvlTsK+2qggl7CYPEFU50Sso2UH4o3u6hChkye7uzsQI6yc7jmD06NY1fN6dzaNg4qsJ
 jN9+G8=
X-Google-Smtp-Source: AGHT+IGltElZVlwhxw9uDPM97pmJeDSJgwVBwjLX4g172vFNLkOj72zAp9AwhEXJbpTGZUTj/wZcUv/NAwx9DgBOto4=
X-Received: by 2002:a05:6e02:1a07:b0:3e3:a49a:917b with SMTP id
 e9e14a558f8ab-3e53306e84fmr37599135ab.2.1754635540083; Thu, 07 Aug 2025
 23:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com>
 <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
 <CAA+D8AN4n0H6M_0EqX4z_37ViSCyThKbmtMgqPmipintJ8Wtwg@mail.gmail.com>
 <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com>
 <CAA+D8AN3VzFx1g=8wyxJROw96xS2-qoVs3X4vUfFnJtUCqFj_w@mail.gmail.com>
 <481c4a38-e638-49ea-88d4-765e581afca7@nxp.com>
In-Reply-To: <481c4a38-e638-49ea-88d4-765e581afca7@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Aug 2025 14:45:26 +0800
X-Gm-Features: Ac12FXwPBbMoH09jFjYWwfKVloaD-hbqz3Zq3uo6wZJ3wJC3FWnXebP2M-e4hG8
Message-ID: <CAA+D8AMmQo=TgaJTubLL6xRp0NV3GpeE0JKwhBjmhZjtBnBQjA@mail.gmail.com>
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

On Fri, Aug 8, 2025 at 2:32=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On 08/07/2025, Shengjiu Wang wrote:
> > On Wed, Aug 6, 2025 at 2:52=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wr=
ote:
> >>
> >> On 08/06/2025, Shengjiu Wang wrote:
> >>> On Tue, Aug 5, 2025 at 4:55=E2=80=AFPM Liu Ying <victor.liu@nxp.com> =
wrote:
> >>>>
> >>>> On 08/04/2025, Shengjiu Wang wrote:
> >>
> >> [...]
> >>
> >>>>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device =
*master, void *data)
> >>>>> +{
> >>>>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_=
data *)data;
> >>>>> +     struct imx8mp_hdmi_pai *hdmi_pai;
> >>>>> +
> >>>>> +     hdmi_pai =3D dev_get_drvdata(dev);
> >>>>> +
> >>>>> +     plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> >>>>> +     plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> >>>>> +     plat_data->priv_audio =3D hdmi_pai;
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct devi=
ce *master, void *data)
> >>>>> +{
> >>>>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_=
data *)data;
> >>>>> +
> >>>>> +     plat_data->enable_audio =3D NULL;
> >>>>> +     plat_data->disable_audio =3D NULL;
> >>>>> +     plat_data->priv_audio =3D NULL;
> >>>>
> >>>> Do you really need to set these ptrs to NULL?
> >>>
> >>> yes.  below code in dw-hdmi.c use the pdata->enable_audio as conditio=
n.
> >>
> >> Note that this is all about tearing down components.
> >> If this is done properly as the below snippet of pseudo-code, then
> >> hdmi->{enable,disable}_audio() and pdata->{enable,disable}_audio() won=
't be
> >> called after audio device is removed by dw_hdmi_remove().  So, it's un=
necessary
> >> to set these pointers to NULL here.
> >>
> >> imx8mp_dw_hdmi_unbind()
> >> {
> >>    dw_hdmi_remove(); // platform_device_unregister(hdmi->audio);
> >>    component_unbind_all(); //imx8mp_hdmi_pai_unbind()
> >> }
> >>
> >> BTW, I suggest the below snippet[1] to bind components.
> >>
> >> imx8mp_dw_hdmi_bind()
> >> {
> >>    component_bind_all(); // imx8mp_hdmi_pai_bind()
> >>                          //   set pdata->{enable,disable}_audio
> >>    dw_hdmi_probe(); // hdmi->audio =3D platform_device_register_full(&=
pdevinfo);
> >> }
> >
> > Looks like we should use dw_hdmi_bind() here to make unbind -> bind wor=
k.
>
> I don't get your idea here.
>
> What are you trying to make work?
> Why dw_hdmi_probe() can't be used?
> How does dw_hdmi_bind() help here?

bind() is ok.  but unbind(),  then bind() there is an issue.

>
> > But can't get the encoder pointer.  the encoder pointer is from lcdif_d=
rv.c,
> > the probe sequence of lcdif, pvi, dw_hdmi should be dw_hdmi first, then=
 pvi,
> > then lcdif, because current implementation in lcdif and pvi driver.
>
> We use deferral probe to make sure the probe sequence is
> DW_HDMI -> PVI -> LCDIF.
>
> LCDIF driver would call devm_drm_of_get_bridge() to get the next bridge P=
VI
> and it defers probe if devm_drm_of_get_bridge() returns ERR_PTR(-EPROBE_D=
EFER).
> Same to PVI driver, it would call of_drm_find_bridge() to get the next br=
idge
> DW_HDMI and defers probe if needed.

right, probe is no problem,  but after probe,  if unbind pai, hdmi_tx,
 then bind
them again,  there is a problem,  because no one call the
drm_bridge_attach() again.

>
> >
> > Should the lcdif and pvi driver be modified to use component helper?
>
> Why should they use component helper?
>
> BTW, I've tried testing the snippets suggested by me on i.MX8MP EVK and
> the components bind successfully:

right, probe is no problem. but if try to unbind() then bind, there is issu=
e.

best regards
shengjiu Wang
>
> cat /sys/kernel/debug/device_component/32fd8000.hdmi
> aggregate_device name                                            status
> -----------------------------------------------------------------------
> 32fd8000.hdmi                                                     bound
>
> device name                                                      status
> -----------------------------------------------------------------------
> 32fc4800.audio-bridge                                             bound
>
> > This seems out of the scope of this patch set.
> >
> > Best regards
> > Shengjiu Wang
>
> [...]
>
> --
> Regards,
> Liu Ying
