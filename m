Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMj/BdJyrmkCEgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:12:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E59234ADA
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E00710E48C;
	Mon,  9 Mar 2026 07:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GzHKDI6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E92110E48C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 07:12:12 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so3175725e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 00:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773040331; cv=none;
 d=google.com; s=arc-20240605;
 b=BMbryPWOG5fj1VI26Utt0bKpRCut4BEoqEyVnZ5e5GQO+1wTmxgIv8u8pnfwK1pNCI
 HolfFvx3/tYWBo5UXGZZ0wwufdnTr/vKe7OSHdfV4HXBhku9tZvjYKe0Xk5juRfmXvPo
 mcS4d5c3SHVcfYhtK/GPHilgB+p2+PLrXRNVk9oEyHFAJ7PcLzkcXocujSzgDjxd16ex
 ydBgX+K2rZzjgFUKwn34WJSb4v/ZZv4hvnxRuzHH5JPzLaEr2jF7IExBRfxrwaTgYqER
 HwZmCNH3RkUkS0iksqz3/1TlchNbqzRVdbQ4cxpB64ryY98SBPASxGrUkg+DffT/ZrY5
 UZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=03443dTqeAHAAj77YpAeSyMA97ePpWH1nHHn5egmzGs=;
 fh=hIUwCwF7WTxGrXM38QLb4bcU5L8dLRk0LmbO7cS0zLY=;
 b=f+yJxnWTBoV6thBC1zSBvMTx8lVv6NJLyImkl2p3JAzBqxLjo+ywoSZEaHUEaYWgZV
 yvq9+3HKh24Nf5uJ98MCS7/E9Zps1hYiZtAJVawD0GvvFfzxGnrqUJwCIkhm8UFcKfwR
 lg8MnxuUntcgtwWT9sO8Av84ObxcQfwv63Yu+dL8anjhFszN1qPYna4DsF3RCLcQvl1O
 pycgpyQTpxmuSv0ZI7dUTF4lgQ9xy22iRjlaLZantRfSKXO9RDztnZXXoGBfHusqhO9M
 UkWTwTKAV6pLlyvmVN8n0VlnFfiJ4edxP+lozOLTBZHhWsVqwJKC9+mEaSA5ZzL22UkI
 ZH5g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773040331; x=1773645131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03443dTqeAHAAj77YpAeSyMA97ePpWH1nHHn5egmzGs=;
 b=GzHKDI6V7M25+jURfpPcsov01bbFms2UhYO43R+w3h2VErIcD5d03F+dKyxJ6+fNiQ
 4C5TJI56dopgbDNihATmakRRGerATj0nl91y5x1REGmaUPRkx3zkYM2ACtLfclPXrc7k
 bwamHkKxg6tcBC/2O5JvkQaRISvR7+4gLIGRFSppMM4+9tshjRn0mKsBkCZ2GcB/Xf+O
 th1bWAsPrLOvhVpJWWMyw617mCBI7GtoDMeGtySSUbKrcwvoeeupGGnG1TYNOTnVX8hL
 7oUYhR0myapbLYHPmK+IdqYAOstiD/fQU1y/qS3RAE9YAWfra3AYtx3lpK5tABI4LwHW
 v1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773040331; x=1773645131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=03443dTqeAHAAj77YpAeSyMA97ePpWH1nHHn5egmzGs=;
 b=Qjry/BORRuIJMOFB2epqVZWNCKLfj9iqRu9RCJugjBCx2FTj8OF4x4ZTp8QXj5ir6V
 uoS56eIYAa5NfE6gPZW7KCuskaYy27iXkTifwEN1zJLoLo0YYDz166448l8nxz1KZzgm
 wkRauPayBEiRDiBAPeB6cdk8IEM5NoTf7DDr8Zv+iRJVmYldDNhqoNNzzHneeDlYCifT
 kMWUpPfBJC2DhyMIKboCtdPzx5UIT62tuPqjmpnTSDNuhg5Lej6oGvTb3nKuS4s3Q98X
 AwxxTQEavRSKz+H7+ognXTIQ0uA4z0BoHJ126Pc3ekGR8pddat1VnvZCL/RhAm+ThzMY
 OIfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrkobXuN5Ax4Y6GhA+QxxRwRX6VBUzkRY7OZaIrbJoKIbxs3VUFIu5u8X6XtdpXpz1wExMR58XCtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyYWv0sLAfLOH2Hn254A1EKKDWZpkA9YWiuZnya5Nzq0YzjmHI
 UwWUb+YBbAQ5T/1R7uR9s6xByepNvOmqcJzwsYcgXSgk2HoewV+w20DVPxNMZ9TIScP8uSczg9U
 UgNCB667wQCB9k55H+8zO1SmH0T1qo1o=
X-Gm-Gg: ATEYQzyLpCMd48E32aU+frRhNTOwo1Xx89VcL5i1hvw7wWqEVmAfFdfadb+heZ8BH1i
 I+BkJC9+nA+UBlFTbRAUjWSJ7zCQZdVlZHFZgzXVnITxoay+56AKya865ZlyBYua4TaKvmvLaLm
 vhlwPdaLc1Be8BJqi+Q3g92KHGR3gVsPa/vYf5RjcZKUyPk7Sm/CAc/3jEFvlL/OXa30FLnMZFh
 rrlRvBmOr43DMCD04xfd5Hjdkeqi9PhyMP6HwjPHWXyeZsNcShTrp3GYxHk6hQKDmUI+CPkYZT1
 jl7XbZhW
X-Received: by 2002:a05:600c:1c0d:b0:485:39d4:2dd9 with SMTP id
 5b1f17b1804b1-48539d42ea2mr56493295e9.33.1773040330593; Mon, 09 Mar 2026
 00:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260125131323.45108-1-clamor95@gmail.com>
 <CAPVz0n3FXMZOEhJCw_ajQudWfHMcg9-y32pFiejgphH5_Q7nug@mail.gmail.com>
 <CAPVz0n1Jf=rNyNu-M9Zp0aUTWm61yo_VLXJ9QHTvAV77ZGn+9g@mail.gmail.com>
 <11698628.CDJkKcVGEf@senjougahara>
In-Reply-To: <11698628.CDJkKcVGEf@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Mar 2026 09:11:59 +0200
X-Gm-Features: AaiRm53tEh8OilsdhhGNDpH24piM2g1MTdF72EIyftzunYlWOMmLwKFbvW4PYuM
Message-ID: <CAPVz0n05UaLVDFCiNqTo6TWU0RrNVe5eQhMm3duTCisXJC0_KQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpu/drm: tegra: dsi: add support for
 Tegra20/Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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
X-Rspamd-Queue-Id: 61E59234ADA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mperttunen@nvidia.com,m:thierry.reding@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:diogo.ivo@tecnico.ulisboa.pt,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,nvidia.com,tecnico.ulisboa.pt,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,nvidia.com:email]
X-Rspamd-Action: no action

=D0=BF=D0=BD, 9 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 07:21 Mikko=
 Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, March 6, 2026 12:50=E2=80=AFAM Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 5 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:21 S=
vyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > =D0=BD=D0=B4, 25 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 15:1=
3 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > Tegra20 and Tegra30 are fully compatible with existing Tegra DSI dr=
iver
> > > > apart from clock configuration and pad calibration which are addres=
sed
> > > > by
> > > > this patch.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/tegra/drm.c |   2 +
> > > >  drivers/gpu/drm/tegra/dsi.c | 107 +++++++++++++++++++++++++-------=
----
> > > >  drivers/gpu/drm/tegra/dsi.h |  10 ++++
> > > >  3 files changed, 88 insertions(+), 31 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/dr=
m.c
> > > > index 4596073fe28f..5d64cd57e764 100644
> > > > --- a/drivers/gpu/drm/tegra/drm.c
> > > > +++ b/drivers/gpu/drm/tegra/drm.c
> > > > @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops,
> > > > host1x_drm_suspend,> >
> > > >  static const struct of_device_id host1x_drm_subdevs[] =3D {
> > > >
> > > >         { .compatible =3D "nvidia,tegra20-dc", },
> > > >
> > > > +       { .compatible =3D "nvidia,tegra20-dsi", },
> > > >
> > > >         { .compatible =3D "nvidia,tegra20-hdmi", },
> > > >         { .compatible =3D "nvidia,tegra20-gr2d", },
> > > >         { .compatible =3D "nvidia,tegra20-gr3d", },
> > > >         { .compatible =3D "nvidia,tegra30-dc", },
> > > >
> > > > +       { .compatible =3D "nvidia,tegra30-dsi", },
> > > >
> > > >         { .compatible =3D "nvidia,tegra30-hdmi", },
> > > >         { .compatible =3D "nvidia,tegra30-gr2d", },
> > > >         { .compatible =3D "nvidia,tegra30-gr3d", },
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/ds=
i.c
> > > > index 02a661d86751..ebc78dceaee6 100644
> > > > --- a/drivers/gpu/drm/tegra/dsi.c
> > > > +++ b/drivers/gpu/drm/tegra/dsi.c
> > > > @@ -53,6 +53,11 @@ to_dsi_state(struct drm_connector_state *state)
> > > >
> > > >         return container_of(state, struct tegra_dsi_state, base);
> > > >
> > > >  }
> > > >
> > > > +struct tegra_dsi_config {
> > > > +       bool has_multiple_pad_controls;
> > > > +       bool has_mux_parent_clk;
> > > > +};
> > > > +
> > > >
> > > >  struct tegra_dsi {
> > > >
> > > >         struct host1x_client client;
> > > >         struct tegra_output output;
> > > >
> > > > @@ -82,6 +87,8 @@ struct tegra_dsi {
> > > >
> > > >         /* for ganged-mode support */
> > > >         struct tegra_dsi *master;
> > > >         struct tegra_dsi *slave;
> > > >
> > > > +
> > > > +       const struct tegra_dsi_config *config;
> > > >
> > > >  };
> > > >
> > > >  static inline struct tegra_dsi *
> > > >
> > > > @@ -663,39 +670,46 @@ static int tegra_dsi_pad_enable(struct tegra_=
dsi
> > > > *dsi)> >
> > > >  {
> > > >
> > > >         u32 value;
> > > >
> > > > -       value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) |
> > > > DSI_PAD_CONTROL_VS1_PDIO(0); -       tegra_dsi_writel(dsi, value,
> > > > DSI_PAD_CONTROL_0);
> > > > +       if (dsi->config->has_multiple_pad_controls) {
> > > > +               /*
> > > > +                * XXX Is this still needed? The module reset is
> > > > deasserted right +                * before this function is called.
> > > > +                */
> > > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > > > +
> > > > +               value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) |
> > > > DSI_PAD_CONTROL_VS1_PDIO(0); +               tegra_dsi_writel(dsi,
> > > > value, DSI_PAD_CONTROL_0);
> > > > +
> > > > +               value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x=
7) |
> > > > +                       DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > > > +                       DSI_PAD_OUT_CLK(0x0);
> > > > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > > > +
> > > > +               value =3D DSI_PAD_PREEMP_PD_CLK(0x3) |
> > > > DSI_PAD_PREEMP_PU_CLK(0x3) | +
> > > > DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3); +
> > > > tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > > > +       } else {
> > > > +               value =3D DSI_PAD_CONTROL_LPUPADJ(0x1) |
> > > > DSI_PAD_CONTROL_LPDNADJ(0x1) | +
> > > > DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_SLEWDNADJ(0x6) | +
> > > >                   DSI_PAD_CONTROL_SLEWUPADJ(0x6) |
> > > > DSI_PAD_CONTROL_PDIO(0) | +
> > > > DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PULLDN_ENAB(0); +
> > > >       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > > > +       }
> > > >
> > > >         return 0;
> > > >
> > > >  }
> > > >
> > > >  static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
> > > >  {
> > > >
> > > > -       u32 value;
> > > >
> > > >         int err;
> > > >
> > > > -       /*
> > > > -        * XXX Is this still needed? The module reset is deasserted
> > > > right
> > > > -        * before this function is called.
> > > > -        */
> > > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > > > -
> > > >
> > > >         /* start calibration */
> > > >         tegra_dsi_pad_enable(dsi);
> > > >
> > > > -       value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> > > > -               DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > > > -               DSI_PAD_OUT_CLK(0x0);
> > > > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > > > -
> > > > -       value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CL=
K(0x3)
> > > > |
> > > > -               DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> > > > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > > > -
> > > >
> > > >         err =3D tegra_mipi_start_calibration(dsi->mipi);
> > > >         if (err < 0)
> > > >
> > > >                 return err;
> > > >
> > > > @@ -1568,6 +1582,7 @@ static int tegra_dsi_probe(struct platform_de=
vice
> > > > *pdev)> >
> > > >         if (!dsi)
> > > >
> > > >                 return -ENOMEM;
> > > >
> > > > +       dsi->config =3D of_device_get_match_data(&pdev->dev);
> > > >
> > > >         dsi->output.dev =3D dsi->dev =3D &pdev->dev;
> > > >         dsi->video_fifo_depth =3D 1920;
> > > >         dsi->host_fifo_depth =3D 64;
> > > >
> > > > @@ -1606,7 +1621,7 @@ static int tegra_dsi_probe(struct platform_de=
vice
> > > > *pdev)> >
> > > >                 goto remove;
> > > >
> > > >         }
> > > >
> > > > -       dsi->clk_lp =3D devm_clk_get(&pdev->dev, "lp");
> > > > +       dsi->clk_lp =3D devm_clk_get_optional(&pdev->dev, "lp");
> > > >
> > > >         if (IS_ERR(dsi->clk_lp)) {
> > > >
> > > >                 err =3D dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_=
lp),
> > > >
> > > >                                     "cannot get low-power clock\n")=
;
> > > >
> > > > @@ -1627,10 +1642,12 @@ static int tegra_dsi_probe(struct
> > > > platform_device *pdev)> >
> > > >                 goto remove;
> > > >
> > > >         }
> > > >
> > > > -       err =3D tegra_dsi_setup_clocks(dsi);
> > > > -       if (err < 0) {
> > > > -               dev_err(&pdev->dev, "cannot setup clocks\n");
> > > > -               goto remove;
> > > > +       if (dsi->config->has_mux_parent_clk) {
> > > > +               err =3D tegra_dsi_setup_clocks(dsi);
> > > > +               if (err < 0) {
> > > > +                       dev_err(&pdev->dev, "cannot setup clocks\n"=
);
> > > > +                       goto remove;
> > > > +               }
> > > >
> > > >         }
> > > >
> > > >         dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > > >
> > > > @@ -1694,11 +1711,39 @@ static void tegra_dsi_remove(struct
> > > > platform_device *pdev)> >
> > > >         tegra_mipi_free(dsi->mipi);
> > > >
> > > >  }
> > > >
> > > > +static const struct tegra_dsi_config tegra20_dsi_config =3D {
> > > > +       .has_multiple_pad_controls =3D false,
> > > > +       .has_mux_parent_clk =3D false,
> > > > +};
> > > > +
> > > > +/*
> > > > + * Tegra30 allows DSIA/DSIB to be muxed to either PLL_D or PLL_D2;=
 this
> > > > is
> > > > + * simply not modeled in the clock driver yet. If this functionali=
ty is
> > > > + * required, the has_mux_parent_clk flag can be set to true once t=
he
> > > > clock
> > > > + * driver is patched.
> > > > + */
> > > > +static const struct tegra_dsi_config tegra30_dsi_config =3D {
> > > > +       .has_multiple_pad_controls =3D false,
> > > > +       .has_mux_parent_clk =3D false,
> > > > +};
> > > > +
> > > > +static const struct tegra_dsi_config tegra114_dsi_config =3D {
> > > > +       .has_multiple_pad_controls =3D true,
> > > > +       .has_mux_parent_clk =3D true,
> > > > +};
> > > > +
> > > > +static const struct tegra_dsi_config tegra124_dsi_config =3D {
> > > > +       .has_multiple_pad_controls =3D true,
> > > > +       .has_mux_parent_clk =3D false,
> > > > +};
> > >
> > > Mikko, I have an update regarding Tegra124 config. If
> > > tegra_dsi_setup_clocks is not called for Tegra124 (has_mux_parent_clk
> > > =3D false) DSI will not work. I cannot say for sure what is going on
> > > with clocks since my tegra124 device has broken usb in mainline Linux
> > > and without panel is no go. I would like to address this before this
> > > series is picked.
> >
> > Ok, from what I can tell, tegra_dsi_setup_clocks ensures that the
> > Tegra124 DSI parent gate clock is properly configured. I propose
> > setting has_mux_parent_clk to true for Tegra124, and I will add a
> > comment to explain why.
> >
> > Smth like this: "Tegra124 and Tegra210 don't have an actual mux parent
> > for DSI clocks, but the gate parent clock they use requires the same
> > setup."
>
> Have you found something that tegra_dsi_setup_clocks is doing that could
> affect it, or is it just because it doesn't work without?
>

I have not found anything that tegra_dsi_setup_clocks that could
affect configuration. It just does not work without.

> I looked at the code for clk_get_parent and clk_set_parent, and there
> shouldn't be any effect if the requested parent was already the parent.
>
> I don't have a Tegra124 board available to me right now, but if we can't
> figure out why this is necessary, I'd put a /* TODO: figure out why this =
is
> necessary on Tegra124 */ in the code.
>
> Perhaps you could check (with the clk_set_parent in place so you can boot=
)
> what the parent is according to the clock framework before we call
> clk_set_parent.
>

Yes I can, I have checked clock hierarchy and it seems to be identical
pre and post setup.

tegra_dsi_setup_clocks takes dsi clock parent and sets its parent
according to dt definition.

pre call it is pll_d_out0 > pll_d_dsi_out > dsia/b and after call it
remains the same.


> Mikko
>
> >
> > Or flag name can be changed to has_mux_gate_parent_clk or any other
> > name which fits.
> >
> > > > +
> > > >
> > > >  static const struct of_device_id tegra_dsi_of_match[] =3D {
> > > >
> > > > -       { .compatible =3D "nvidia,tegra210-dsi", },
> > > > -       { .compatible =3D "nvidia,tegra132-dsi", },
> > > > -       { .compatible =3D "nvidia,tegra124-dsi", },
> > > > -       { .compatible =3D "nvidia,tegra114-dsi", },
> > > > +       { .compatible =3D "nvidia,tegra210-dsi", .data =3D
> > > > &tegra124_dsi_config }, +       { .compatible =3D "nvidia,tegra132-=
dsi",
> > > > .data =3D &tegra124_dsi_config }, +       { .compatible =3D
> > > > "nvidia,tegra124-dsi", .data =3D &tegra124_dsi_config }, +       {
> > > > .compatible =3D "nvidia,tegra114-dsi", .data =3D &tegra114_dsi_conf=
ig }, +
> > > >      { .compatible =3D "nvidia,tegra30-dsi", .data =3D &tegra30_dsi=
_config
> > > > }, +       { .compatible =3D "nvidia,tegra20-dsi", .data =3D
> > > > &tegra20_dsi_config },> >
> > > >         { },
> > > >
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/ds=
i.h
> > > > index f39594e65e97..d834ac0c47ab 100644
> > > > --- a/drivers/gpu/drm/tegra/dsi.h
> > > > +++ b/drivers/gpu/drm/tegra/dsi.h
> > > > @@ -95,6 +95,16 @@
> > > >
> > > >  #define DSI_TALLY_LRX(x)               (((x) & 0xff) <<  8)
> > > >  #define DSI_TALLY_HTX(x)               (((x) & 0xff) <<  0)
> > > >  #define DSI_PAD_CONTROL_0              0x4b
> > > >
> > > > +/* Tegra20/Tegra30 */
> > > > +#define DSI_PAD_CONTROL_PULLDN_ENAB(x) (((x) & 0x1) << 28)
> > > > +#define DSI_PAD_CONTROL_SLEWUPADJ(x)   (((x) & 0x7) << 24)
> > > > +#define DSI_PAD_CONTROL_SLEWDNADJ(x)   (((x) & 0x7) << 20)
> > > > +#define DSI_PAD_CONTROL_PREEMP_EN(x)   (((x) & 0x1) << 19)
> > > > +#define DSI_PAD_CONTROL_PDIO_CLK(x)    (((x) & 0x1) << 18)
> > > > +#define DSI_PAD_CONTROL_PDIO(x)                (((x) & 0x3) << 16)
> > > > +#define DSI_PAD_CONTROL_LPUPADJ(x)     (((x) & 0x3) << 14)
> > > > +#define DSI_PAD_CONTROL_LPDNADJ(x)     (((x) & 0x3) << 12)
> > > > +/* Tegra114+ */
> > > >
> > > >  #define DSI_PAD_CONTROL_VS1_PDIO(x)    (((x) & 0xf) <<  0)
> > > >  #define DSI_PAD_CONTROL_VS1_PDIO_CLK   (1 <<  8)
> > > >  #define DSI_PAD_CONTROL_VS1_PULLDN(x)  (((x) & 0xf) << 16)
> > > >
> > > > --
> > > > 2.51.0
>
>
>
>
