Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1BE467783
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 13:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325F87A321;
	Fri,  3 Dec 2021 12:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615C97A321
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 12:37:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b1so6109303lfs.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 04:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fizL/hy9yXJ6JRH7+VgywLalW2LftVVfT2yuS4CxqNU=;
 b=Y93nYHfixS2aqgzp9oqGpRkvTO+vKZ4sA0hcu5TPnaZI5RnNWEwu0TRtjRSiTp3N43
 y3sybZOyU0c4RuLFBYOtIVujQ6q+g1AarOxI/e2E99DFUmFyYTruPj9ZO+/50q7As89+
 /chQdxlA2myIMM5/fKQEoH9dwsiZGeI8lNSQmQ9d8dPA0EQW2qU+6mtZ29UpnT0NUId3
 Qop+XVlzktCSRe7/V/vkIQrH2oGm7gK/EzdWJLr1vkd0630LfzxPDK+IIgFCCuFeHmGh
 r75Qpk9fZkv9OSU5R5w83y/9JJ71ZLkp222biZtVlUaxHlWdIJBUX33pMA+A8wWFU68d
 dVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fizL/hy9yXJ6JRH7+VgywLalW2LftVVfT2yuS4CxqNU=;
 b=lVHwoF6uMIKH3y76fUeFfBFO6z/WRfXSq6xbLsXD+TtH/lXoqu+8ac8lhsideMHdxD
 zf1eA9MmErb40pTPazVw5OlGnWeg1C1d1h3FgDJwAIjUvFZ121/YF2w1NYMB84INdw9D
 JdtxdcWVAGVqwrfUyoGtdws4WeWG5c49dExMICFVHMQQOBNhXlJTvgJ1ckLgZOBsb0XW
 MXlhNTzCPHz+UXYlQc8HSVcWXsTdL8NtTxikV9QmChuTrpaFWrji6WTS1GTL9z69GY2k
 E5JsIoRMEDL2IAX+GOEpg/RzFNqE5mYJcnGcFLM7fDNaUEtQmdVQr8JpbJYp13sKvGSM
 5VTA==
X-Gm-Message-State: AOAM533zCsYgt9sC7B9JyhEC0c+XSmJ58Kd6UBDznOuuyRSmwdBoX5Nv
 OxFlpovdHrYF9iYTxlUN00UjB/U0tdfXOp0CPCY=
X-Google-Smtp-Source: ABdhPJzUKtVqoTURMIvGt/wtjNsdrTX42pOkbo6NYV/K+6YXQkmbh3wUuinmxAvR0u4XkEaN1KbnoPgiV3eCzhKThp4=
X-Received: by 2002:a05:6512:3a93:: with SMTP id
 q19mr17615388lfu.105.1638535066362; 
 Fri, 03 Dec 2021 04:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20211025093418.20545-1-kevin3.tang@gmail.com>
 <20211025093418.20545-7-kevin3.tang@gmail.com>
 <20211203103841.vkl3sjsbaohsviou@houat>
In-Reply-To: <20211203103841.vkl3sjsbaohsviou@houat>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Fri, 3 Dec 2021 20:34:50 +0800
Message-ID: <CAFPSGXbWv94vShNAQ9xfkDZRKgZTdjRzH9i60ak1NYaPW-OKgA@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 pony1.wu@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, zhang.lyra@gmail.com,
 orsonzhai@gmail.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B412=E6=9C=883=E6=97=
=A5=E5=91=A8=E4=BA=94 18:38=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Oct 25, 2021 at 05:34:18PM +0800, Kevin Tang wrote:
> > @@ -618,9 +619,25 @@ static void sprd_crtc_mode_set_nofb(struct drm_crt=
c *crtc)
> >  {
> >       struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> >       struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> > +     struct drm_encoder *encoder;
> > +     struct mipi_dsi_device *slave;
> > +     struct sprd_dsi *dsi;
> >
> >       drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
> >
> > +     drm_for_each_encoder(encoder, crtc->dev) {
> > +             if (encoder->crtc !=3D crtc)
> > +                     continue;
>
> encoder->crtc is deprecated. You should be using
> encoder->drm_for_each_encoder_mask, using the encoder_mask in
> encoder->drm_crtc_state.

Use drm_for_each_encoder_mask to replace drm_for_each_encoder? like this:
drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
    dsi =3D encoder_to_dsi(encoder);
    slave =3D dsi->slave;

    if (slave->mode_flags & MIPI_DSI_MODE_VIDEO)
        dpu->ctx.if_type =3D SPRD_DPU_IF_DPI;
    else
         dpu->ctx.if_type =3D SPRD_DPU_IF_EDPI;
}

>
> > +static int sprd_dsi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct sprd_dsi *dsi;
> > +
> > +     dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> > +     if (!dsi)
> > +             return -ENOMEM;
> > +
> > +     dev_set_drvdata(dev, dsi);
> > +
> > +     dsi->host.ops =3D &sprd_dsi_host_ops;
> > +     dsi->host.dev =3D dev;
> > +     mipi_dsi_host_register(&dsi->host);
> > +
> > +     return component_add(&pdev->dev, &dsi_component_ops);
>
> component_add must be run in the mipi_dsi_host.attach hook.
Got it, will be fixed on patch v8.
>
> Maxime
