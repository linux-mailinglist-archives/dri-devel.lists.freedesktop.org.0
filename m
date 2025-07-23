Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705DBB0EC3E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D455110E76D;
	Wed, 23 Jul 2025 07:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AiuwUJnx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857EC10E767
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:36:32 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3e2c683524fso4457085ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753256191; x=1753860991; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/S3cclAsN9hIgRcEo1wMY4GsJTg8hhVdaN6QhaC45E=;
 b=AiuwUJnxejJ31o5K/RfNU5OlhqEO/2jqpmUyEvmiYBuWC9VnDTYizPBTEKCKmXAjSa
 AQarjISjMU2hZHWydcuTP8TJUeGtzCTGwbXRDlLD6ae43ehU9giyAaaIoNhmDRqHz2Yw
 3I4F5BlLN0YXhM0gLzTQDjIIzI8xT3IirfjC8UQJaQXNEXwKwvqPHHW23oqig5cvRYDH
 XMeM2EACYvao4q4b0/zpXERlJ1CJhTb+iM/vqVrlNX7oQ4xTQsObr/i+w0EwOKVkF1HA
 nUNgPnG5JgvKd1vSZ4Pq6HY17EaLxC41GEvfjNhCfnVOpT59/TPzqlwMoNiq1bc9DRAH
 l79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753256191; x=1753860991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/S3cclAsN9hIgRcEo1wMY4GsJTg8hhVdaN6QhaC45E=;
 b=Ysmmz6Sp940pnD6QDBJ8zZa7DDnXRzxUekWm6oM1T5W1ND/MEWUab1b7MN0qG5k2Ct
 eJnN9/jMmgqu1qr++HPZ6z5ElFIyd9rJtf7i1GUwnWj4zLS10y8HNPlFoCwzMPWySqDs
 cPNVNZPYEajYVmH2/Qhnd4LdGSuy8fgz9PUja4rrVllk3a1YF50Ztm1p/BusVt6uomb+
 AmK7qyfz1jqfTv5NpL71da66pHuSqAz/YlL6QQ2fXF5fNvHQ/bSgcNrjXSG5Kbklc3J4
 paTX3ciqbO4Bb2ILHH4/9swX7owTRKR5zYS5fLJsebagTPXGFhXpqBqoi7T6w+XYfdEA
 jzuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn9tDbvUSG8NB2UFXtbhPU5VmTmSp/h+6b8siAz73mPrVdCZdiuYE+Bb0ebktFqPnQfgN3ZPLumWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5xYmg53sZ3Y9yfxPRd3F7WFQSHYaYnFjEq5xLFXK/DczoxOCA
 axiAZX9fxt8HW5HNhCsmS3s24w418BPGO/r5ecTR0rFQLGyhkP0FucURFYSbJXe0ysQspzgb5As
 7aQ2KOI8shyxtxhsuarnNRp7kDXcDlBE=
X-Gm-Gg: ASbGncvMVT2KtCaZv304SCTlYr0wD55/fUZtclPrGwTTyaEp7yZsSIU4qvwwV67vc4o
 ybn2Wd9WniZ+W12OMjh2vv+EjdEQzH+CCU03Xvs/4qCMUpAkMvW6GNDMdTfm067AHZHfS5Qn5ES
 57YbKrP6TfDr6J5UDSU0i6aBR3WL7eGxXjU/E3IPj2899sYigb0x1palEuwIYUKU2OyRFfNC4XG
 /bDme8=
X-Google-Smtp-Source: AGHT+IHYow0XlvdEpZbbLeYgBBO2y4gBFRlSOQ97MzENf9ZWPixLLuVk3gzT14yo44EQSarqRYKCLdWkxl7mB1g6H/s=
X-Received: by 2002:a05:6e02:1a22:b0:3e2:c5de:5ff with SMTP id
 e9e14a558f8ab-3e33eabdbadmr33868505ab.3.1753256191292; Wed, 23 Jul 2025
 00:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-2-shengjiu.wang@nxp.com>
 <4731eb9b-9a29-4065-8dac-06f558e78e02@nxp.com>
In-Reply-To: <4731eb9b-9a29-4065-8dac-06f558e78e02@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Jul 2025 15:36:17 +0800
X-Gm-Features: Ac12FXwK3jsd_JjUkeN-4HVNavY2uEVLQxHw3AgCqwKwIWwQEHZUSbjiR65_C0c
Message-ID: <CAA+D8AOkOV0850yH+96deZ-haFSsNCw=hE+G7m+svSJBsz3c6Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: dw-hdmi: Add function to get plat_data
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
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 23 Jul 2025 07:46:33 +0000
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

On Tue, Jul 22, 2025 at 3:38=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On 07/18/2025, Shengjiu Wang wrote:
> > The enable_audio() and disable_audio() callback pointers are in
> > plat_data structure, and the audio device driver needs to get plat_data
> > for assign these pointers. So add a function to export plat_data
>
> {enable,disable}_audio pointers are directly assigned to plat_data in pat=
ch 2,
> instead of using dw_hdmi_to_plat_data().  dw_hdmi_to_plat_data() is only
> used in patch 2 to get hdmi_pai pointer through pdata->priv_audio.
>
> const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw_hdmi);
> struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pdata->pri=
v_audio;
>

will update this commit message.

> > structure.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
> >  include/drm/bridge/dw_hdmi.h              | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-hdmi.c
> > index 76c6570e2a85..3dfa42178f6c 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -198,6 +198,12 @@ struct dw_hdmi {
> >       enum drm_connector_status last_connector_result;
> >  };
> >
> > +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *h=
dmi)
> > +{
> > +     return hdmi->plat_data;
> > +}
> > +EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
> > +
> >  #define HDMI_IH_PHY_STAT0_RX_SENSE \
> >       (HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
> >        HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.=
h
> > index 6a46baa0737c..a56a3519a22a 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -208,4 +208,5 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, vo=
id *data);
> >
> >  bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
> >
> > +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *h=
dmi);
>
> Nit: Add a blank line as it was here.

will add blank line

best regards
Shengjiu Wang
>
> >  #endif /* __IMX_HDMI_H__ */
>
> --
> Regards,
> Liu Ying
