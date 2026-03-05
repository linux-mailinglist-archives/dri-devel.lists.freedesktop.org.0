Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOiQDz+mqWnwBgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:50:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39C214D92
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4786D10E2BA;
	Thu,  5 Mar 2026 15:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kCqUzDf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085CB10E2BA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:50:19 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-439b9b1900bso3365444f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 07:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772725817; cv=none;
 d=google.com; s=arc-20240605;
 b=juglM/+YokpL5nTWbIOEaFvnWhStN7i+CaEQ1Q2htB8P7FnUychWqelH7u2bpJWNJ7
 nbhDVhrBiWWjnjAlcQbFN0vEHtgxZmyUlZZclYLMh81nNB2MM7ry/V3sMWTuyjyOCMxa
 dltdXIxwmMYmWthdcBU3/tz5WeihGgovaJV1XkCyEiZKqZYrbCOrXx+QiOkXrNBr21ew
 VS18lhMeURetDv0jfh42h5JDUyY740ULPZUxpgOgOv3Ds9gaMP0h10YJ5FwDBO9uPnO6
 m0ZGSHDWBQAhtYgGuhaXWcXrI2zXSaCPLIO0oKsyPKgv/K63M30XfMmJB7cIZS3b0Xr1
 1olQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1PH46tNzcbUu3o7RvcJd4Yy5jYTA3vxe5hzUK7gP3mI=;
 fh=e0cJOoSpiXGHxhskGGpoAl8VZFFYuD/kVKU2vyNhjfM=;
 b=PC8LE2vzYp402XS7t4WriJlliN3LwPmbvf4p0xxEVbJnLXKhM3TXYVWVk5l2Sme7XT
 mIsrAeuZtAmLqD8MNsLDAlZV3HAle0aLi7sP13v5y56aI3sTvTseP8/qal1Kwy//62jR
 le85IfoTNh8WG2m3I2AA9ahOm1t+f7NnQktPoI0xmz2Sv9Q8vbs/zfbH7cBF5bFm4zzA
 a053OXBYpbBZhLw/GSnTXp2PlwYz21892XHrg0laj1KfIWcGO0SF3rB5oOPl8pnPsR8L
 lC/C9jm55j6KoI480BqeJMPWTkf61BpG+EHy23tHwLIWfMeDI0cFXOfyORBekdNZIOPB
 TE/g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772725817; x=1773330617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1PH46tNzcbUu3o7RvcJd4Yy5jYTA3vxe5hzUK7gP3mI=;
 b=kCqUzDf1Onb04HyN/xJ0FVs5XQZhmBIKLqTkjoyUJ0PhTN/pQG0p6sYXQRi2UoZPYc
 94+rTbfe9Y4qzBNwG/yWX7YgQl5o9L60e9Ft223eum7Nr8KRtMlMls2LlP7BTl7TSy3a
 4PfEzSv63hdUgZ/bOn81Rykc09zGm7n4VPxgaEqHiajgZeiCA05y+LqzXfwhj2AxNmMC
 X3tuMUBzb3qDHSd5pt7u0AnJDFOSzEfdDzNmio+WhxUkfCluAIHV7dRHX9KK2Azb/UPC
 JGvcOs7tp0FMPXZVc6JU/QoZPXixwWTB+ZIfcKXgFGh5UUcftiJ4qPzAin6iNhnbSFvN
 JhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772725817; x=1773330617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1PH46tNzcbUu3o7RvcJd4Yy5jYTA3vxe5hzUK7gP3mI=;
 b=BTN3nDx2tvFgpUoF6agBEPIhWp/1iJMIRSFwhZE4HCoXdUrScz0OYtht3WQIUUXzJz
 IBgk7GuLX2CvPMLvCqCd14KN0xOHCWhGyutYT2OkAkqgpPE1M65zOoSDiZf4CpeGIgQJ
 xZ7y76PDZqZj4OAUQWI97/gj4gLrRC5yeskg/vabUjdu5cRx1v1Fue+w+CHwKYq6qNfO
 Dd7kkqxEJptwEnrQAUrezMsVfvQl+57pFVdkApEudSh2l+3Nu0DeBp56tMPoT/Ap/63f
 Ef3YMjyJR0Zh7x+CyCxd2O+HDWv53Kpnco9P5r8iQe/q+52tBmfFNFqYcf154Tu0txDe
 qbcw==
X-Gm-Message-State: AOJu0YxrP2r57n/1jbUeO5pKTHAql67aduStEFQn92NjANL+Zm2gjCsq
 zfIekgcrFJI1gGkehnjulZdfIa9AqP2BMA64ji/eKy60/C6qd1S9aTfIXDh0x2L7XqvqUcg+By6
 MQY6knoDFISEH7veN5F+cC+J3DVRCc9c=
X-Gm-Gg: ATEYQzwE2wGEdoqM4pUu9J/hMncSVnM++MeLGLp5w4C+OfnwUcHZ82hIjhIu4SAX7DE
 qceI4qEfs4H++VILeUo05WF8KmFu90DW9UYCTJZteoPGH2qW4ZW2Ju16CcGr0d6AfYQMB6MjhVZ
 Ehykl1p6bMnj+HkTF5Vb9wSlqg5974nhhHEWeAUiRyVs+tSY3lWDqXF3Pfk6o4Nd+IfH+reXRLH
 +mYskJHrcB68bZXD71MZhjpzLLb02pCjoFiQJGX8YORwH3cdXADUik5t/NhWudByQBLCHTJFDcS
 uwNo/M6z
X-Received: by 2002:a05:6000:609:b0:439:af25:e4ea with SMTP id
 ffacd0b85a97d-439c7fb73b9mr11949295f8f.25.1772725817347; Thu, 05 Mar 2026
 07:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20260125131323.45108-1-clamor95@gmail.com>
 <20260125131323.45108-2-clamor95@gmail.com>
 <CAPVz0n3FXMZOEhJCw_ajQudWfHMcg9-y32pFiejgphH5_Q7nug@mail.gmail.com>
In-Reply-To: <CAPVz0n3FXMZOEhJCw_ajQudWfHMcg9-y32pFiejgphH5_Q7nug@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Mar 2026 17:50:05 +0200
X-Gm-Features: AaiRm503-z2GyN7tR097bCSEJFPg05xfdEkXmVkRdfGeB9zms-4jtXuG4YxPcM4
Message-ID: <CAPVz0n1Jf=rNyNu-M9Zp0aUTWm61yo_VLXJ9QHTvAV77ZGn+9g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpu/drm: tegra: dsi: add support for
 Tegra20/Tegra30
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
X-Rspamd-Queue-Id: 8B39C214D92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:diogo.ivo@tecnico.ulisboa.pt,m:clamor95@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,tecnico.ulisboa.pt];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

=D1=87=D1=82, 5 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:21 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BD=D0=B4, 25 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 15:13 Sv=
yatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Tegra20 and Tegra30 are fully compatible with existing Tegra DSI driver
> > apart from clock configuration and pad calibration which are addressed =
by
> > this patch.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c |   2 +
> >  drivers/gpu/drm/tegra/dsi.c | 107 +++++++++++++++++++++++++-----------
> >  drivers/gpu/drm/tegra/dsi.h |  10 ++++
> >  3 files changed, 88 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 4596073fe28f..5d64cd57e764 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops, hos=
t1x_drm_suspend,
> >
> >  static const struct of_device_id host1x_drm_subdevs[] =3D {
> >         { .compatible =3D "nvidia,tegra20-dc", },
> > +       { .compatible =3D "nvidia,tegra20-dsi", },
> >         { .compatible =3D "nvidia,tegra20-hdmi", },
> >         { .compatible =3D "nvidia,tegra20-gr2d", },
> >         { .compatible =3D "nvidia,tegra20-gr3d", },
> >         { .compatible =3D "nvidia,tegra30-dc", },
> > +       { .compatible =3D "nvidia,tegra30-dsi", },
> >         { .compatible =3D "nvidia,tegra30-hdmi", },
> >         { .compatible =3D "nvidia,tegra30-gr2d", },
> >         { .compatible =3D "nvidia,tegra30-gr3d", },
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 02a661d86751..ebc78dceaee6 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -53,6 +53,11 @@ to_dsi_state(struct drm_connector_state *state)
> >         return container_of(state, struct tegra_dsi_state, base);
> >  }
> >
> > +struct tegra_dsi_config {
> > +       bool has_multiple_pad_controls;
> > +       bool has_mux_parent_clk;
> > +};
> > +
> >  struct tegra_dsi {
> >         struct host1x_client client;
> >         struct tegra_output output;
> > @@ -82,6 +87,8 @@ struct tegra_dsi {
> >         /* for ganged-mode support */
> >         struct tegra_dsi *master;
> >         struct tegra_dsi *slave;
> > +
> > +       const struct tegra_dsi_config *config;
> >  };
> >
> >  static inline struct tegra_dsi *
> > @@ -663,39 +670,46 @@ static int tegra_dsi_pad_enable(struct tegra_dsi =
*dsi)
> >  {
> >         u32 value;
> >
> > -       value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_P=
DIO(0);
> > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +       if (dsi->config->has_multiple_pad_controls) {
> > +               /*
> > +                * XXX Is this still needed? The module reset is deasse=
rted right
> > +                * before this function is called.
> > +                */
> > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > +
> > +               value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTR=
OL_VS1_PDIO(0);
> > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +
> > +               value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> > +                       DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > +                       DSI_PAD_OUT_CLK(0x0);
> > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > +
> > +               value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_P=
U_CLK(0x3) |
> > +                       DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3=
);
> > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > +       } else {
> > +               value =3D DSI_PAD_CONTROL_LPUPADJ(0x1) | DSI_PAD_CONTRO=
L_LPDNADJ(0x1) |
> > +                       DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTRO=
L_SLEWDNADJ(0x6) |
> > +                       DSI_PAD_CONTROL_SLEWUPADJ(0x6) | DSI_PAD_CONTRO=
L_PDIO(0) |
> > +                       DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_P=
ULLDN_ENAB(0);
> > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > +       }
> >
> >         return 0;
> >  }
> >
> >  static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
> >  {
> > -       u32 value;
> >         int err;
> >
> > -       /*
> > -        * XXX Is this still needed? The module reset is deasserted rig=
ht
> > -        * before this function is called.
> > -        */
> > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > -
> >         /* start calibration */
> >         tegra_dsi_pad_enable(dsi);
> >
> > -       value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> > -               DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > -               DSI_PAD_OUT_CLK(0x0);
> > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > -
> > -       value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x=
3) |
> > -               DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > -
> >         err =3D tegra_mipi_start_calibration(dsi->mipi);
> >         if (err < 0)
> >                 return err;
> > @@ -1568,6 +1582,7 @@ static int tegra_dsi_probe(struct platform_device=
 *pdev)
> >         if (!dsi)
> >                 return -ENOMEM;
> >
> > +       dsi->config =3D of_device_get_match_data(&pdev->dev);
> >         dsi->output.dev =3D dsi->dev =3D &pdev->dev;
> >         dsi->video_fifo_depth =3D 1920;
> >         dsi->host_fifo_depth =3D 64;
> > @@ -1606,7 +1621,7 @@ static int tegra_dsi_probe(struct platform_device=
 *pdev)
> >                 goto remove;
> >         }
> >
> > -       dsi->clk_lp =3D devm_clk_get(&pdev->dev, "lp");
> > +       dsi->clk_lp =3D devm_clk_get_optional(&pdev->dev, "lp");
> >         if (IS_ERR(dsi->clk_lp)) {
> >                 err =3D dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
> >                                     "cannot get low-power clock\n");
> > @@ -1627,10 +1642,12 @@ static int tegra_dsi_probe(struct platform_devi=
ce *pdev)
> >                 goto remove;
> >         }
> >
> > -       err =3D tegra_dsi_setup_clocks(dsi);
> > -       if (err < 0) {
> > -               dev_err(&pdev->dev, "cannot setup clocks\n");
> > -               goto remove;
> > +       if (dsi->config->has_mux_parent_clk) {
> > +               err =3D tegra_dsi_setup_clocks(dsi);
> > +               if (err < 0) {
> > +                       dev_err(&pdev->dev, "cannot setup clocks\n");
> > +                       goto remove;
> > +               }
> >         }
> >
> >         dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > @@ -1694,11 +1711,39 @@ static void tegra_dsi_remove(struct platform_de=
vice *pdev)
> >         tegra_mipi_free(dsi->mipi);
> >  }
> >
> > +static const struct tegra_dsi_config tegra20_dsi_config =3D {
> > +       .has_multiple_pad_controls =3D false,
> > +       .has_mux_parent_clk =3D false,
> > +};
> > +
> > +/*
> > + * Tegra30 allows DSIA/DSIB to be muxed to either PLL_D or PLL_D2; thi=
s is
> > + * simply not modeled in the clock driver yet. If this functionality i=
s
> > + * required, the has_mux_parent_clk flag can be set to true once the c=
lock
> > + * driver is patched.
> > + */
> > +static const struct tegra_dsi_config tegra30_dsi_config =3D {
> > +       .has_multiple_pad_controls =3D false,
> > +       .has_mux_parent_clk =3D false,
> > +};
> > +
> > +static const struct tegra_dsi_config tegra114_dsi_config =3D {
> > +       .has_multiple_pad_controls =3D true,
> > +       .has_mux_parent_clk =3D true,
> > +};
> > +
> > +static const struct tegra_dsi_config tegra124_dsi_config =3D {
> > +       .has_multiple_pad_controls =3D true,
> > +       .has_mux_parent_clk =3D false,
> > +};
>
> Mikko, I have an update regarding Tegra124 config. If
> tegra_dsi_setup_clocks is not called for Tegra124 (has_mux_parent_clk
> =3D false) DSI will not work. I cannot say for sure what is going on
> with clocks since my tegra124 device has broken usb in mainline Linux
> and without panel is no go. I would like to address this before this
> series is picked.
>

Ok, from what I can tell, tegra_dsi_setup_clocks ensures that the
Tegra124 DSI parent gate clock is properly configured. I propose
setting has_mux_parent_clk to true for Tegra124, and I will add a
comment to explain why.

Smth like this: "Tegra124 and Tegra210 don't have an actual mux parent
for DSI clocks, but the gate parent clock they use requires the same
setup."

Or flag name can be changed to has_mux_gate_parent_clk or any other
name which fits.

> > +
> >  static const struct of_device_id tegra_dsi_of_match[] =3D {
> > -       { .compatible =3D "nvidia,tegra210-dsi", },
> > -       { .compatible =3D "nvidia,tegra132-dsi", },
> > -       { .compatible =3D "nvidia,tegra124-dsi", },
> > -       { .compatible =3D "nvidia,tegra114-dsi", },
> > +       { .compatible =3D "nvidia,tegra210-dsi", .data =3D &tegra124_ds=
i_config },
> > +       { .compatible =3D "nvidia,tegra132-dsi", .data =3D &tegra124_ds=
i_config },
> > +       { .compatible =3D "nvidia,tegra124-dsi", .data =3D &tegra124_ds=
i_config },
> > +       { .compatible =3D "nvidia,tegra114-dsi", .data =3D &tegra114_ds=
i_config },
> > +       { .compatible =3D "nvidia,tegra30-dsi", .data =3D &tegra30_dsi_=
config },
> > +       { .compatible =3D "nvidia,tegra20-dsi", .data =3D &tegra20_dsi_=
config },
> >         { },
> >  };
> >  MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
> > diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
> > index f39594e65e97..d834ac0c47ab 100644
> > --- a/drivers/gpu/drm/tegra/dsi.h
> > +++ b/drivers/gpu/drm/tegra/dsi.h
> > @@ -95,6 +95,16 @@
> >  #define DSI_TALLY_LRX(x)               (((x) & 0xff) <<  8)
> >  #define DSI_TALLY_HTX(x)               (((x) & 0xff) <<  0)
> >  #define DSI_PAD_CONTROL_0              0x4b
> > +/* Tegra20/Tegra30 */
> > +#define DSI_PAD_CONTROL_PULLDN_ENAB(x) (((x) & 0x1) << 28)
> > +#define DSI_PAD_CONTROL_SLEWUPADJ(x)   (((x) & 0x7) << 24)
> > +#define DSI_PAD_CONTROL_SLEWDNADJ(x)   (((x) & 0x7) << 20)
> > +#define DSI_PAD_CONTROL_PREEMP_EN(x)   (((x) & 0x1) << 19)
> > +#define DSI_PAD_CONTROL_PDIO_CLK(x)    (((x) & 0x1) << 18)
> > +#define DSI_PAD_CONTROL_PDIO(x)                (((x) & 0x3) << 16)
> > +#define DSI_PAD_CONTROL_LPUPADJ(x)     (((x) & 0x3) << 14)
> > +#define DSI_PAD_CONTROL_LPDNADJ(x)     (((x) & 0x3) << 12)
> > +/* Tegra114+ */
> >  #define DSI_PAD_CONTROL_VS1_PDIO(x)    (((x) & 0xf) <<  0)
> >  #define DSI_PAD_CONTROL_VS1_PDIO_CLK   (1 <<  8)
> >  #define DSI_PAD_CONTROL_VS1_PULLDN(x)  (((x) & 0xf) << 16)
> > --
> > 2.51.0
> >
