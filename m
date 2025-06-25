Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9B8AE83F8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADF710E729;
	Wed, 25 Jun 2025 13:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HH/mZH6A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23C210E726
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 13:11:27 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-31306794b30so831492a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 06:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750857087; x=1751461887; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqgQcm5/3IMzcTD0bKmloa11ar+Lfpo5bH7jPzMrrvE=;
 b=HH/mZH6AEFXTXEvip8oGaMfxQ+xg5tbcH6bTxRHwarJ90yLW1dMShvRqkGjWzs0Npy
 kmX0IZNyZMSvp+5H+DTf8BkQHIZSZQhe+JjGPBQybAGjD+YjQuXVcDYB0qOlRrypqmdT
 is07tvXtxLX1N0bZ7VasCfDA5Zf7ujbwHKPqjhlYb87AlvKATjlmLoc1hN9ugcWPmVPB
 Ly0BBwYteopFjwEQ52O03aDWiGGnlMgHeVVtVssNbQzVBV0cONRRID00WxWGay/3ep1C
 CEcQlZbLwieyMGIES2mAz4aV/NU9o4D2WJIXYraYzdIpEQL8RcJfoCfbH4ywy7/8ADEI
 X3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750857087; x=1751461887;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqgQcm5/3IMzcTD0bKmloa11ar+Lfpo5bH7jPzMrrvE=;
 b=KOPBP3Zm2r7CZCsvUsHSdR4Fm8pXHXKT42S0Tx7btTm+dVk+jPuWAPRBMLYWbu6rfC
 78MbJ+LM2tU88kLCzIUjXmSKTEupZQzwGQDNmqySD6clrZYDwPXhxoedWP9g/FuVaGse
 cgsovJqNEOJWJuBoM91oEgZH7bduThFg/wuL7BRiKnaZeyys2joQoo5xJDMHNeg4NzA+
 mVGNYAKXxKW3woor4/HTTphRDvjS+FfU7MjKN/XmG0oyAduMywDM/0WTfPc/8jg4jrwL
 bszh+o0BCwZhp69AZiQW+IoWo1RQhcBZ0OtvleujMjuIq18Uxz7FOcWhOYwE31yiiwwj
 TNAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHIn6h5SnE70eT+rC4yHfbJ5NteARlbwk9BCM+6hhFaquTVVRamF94hs4edCinN9M3/JzEbgQ75Fo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDjmoMAWtPzu08VjdkeiOLHvHoWrFgGQQn10dNde0x0uJKwi47
 CwE74T/7uq5RaFnbA+2J2n/rns6I/ZH4jYER9xcIVcU4AZy4/Gtel4MAsr5YwwYxIpnY1edDL9R
 QYBVNtA9Em00/xcRyOlg2guaEPF+wpHE=
X-Gm-Gg: ASbGncvKjribBC2AOwlY6VfANRsKoJLMkUSG0y9nJGnJlDDaVgmNvfaXQU9ANRtkO1e
 tbjG6ScgIgqurQxtIUAPX50ChIhX41gDEOjlblEU76esc+D/CIivvEoRVrPfpGYyfv3MJOKO0Kk
 CZiMyyZ47pHy44JAmJwkCQF4Gv7QobLPkljmV4yWL4QWpv
X-Google-Smtp-Source: AGHT+IFEvjrvvVsZcYjO0kquYQeUKaQ5Fxv9q9253+tjz70+k2fFYXIejEtnBmEgsK8q7SkYHeAaA13UMUFQwlWlUT4=
X-Received: by 2002:a17:90b:2c84:b0:310:cf92:7899 with SMTP id
 98e67ed59e1d1-315f269c9a3mr1753425a91.3.1750857086969; Wed, 25 Jun 2025
 06:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250625112411.4123-1-hansg@kernel.org>
In-Reply-To: <20250625112411.4123-1-hansg@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Jun 2025 09:11:15 -0400
X-Gm-Features: AX0GCFtjo05o2RBQ4eaNIUKDROPuEf-cz0Y2VkvfTmVbbyTM_qw4gFWXeri5Hs8
Message-ID: <CADnq5_P1SNLhVi11F55nm6bcJj31sayLQWSFoiNM2qg6ZCwEAQ@mail.gmail.com>
Subject: Re: [PATCH] agp/amd64: Only try host-bridges when agp_try_unsupported
 is set
To: Hans de Goede <hansg@kernel.org>, 
 "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>,
 Vasant Hegde <vasant.hegde@amd.com>
Cc: David Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
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

+ Suravee and Vasant

On Wed, Jun 25, 2025 at 7:24=E2=80=AFAM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> On modern AMD Ryzen systems the IOMMU code initializes early on adding
> resources to the "00:00.2 IOMMU" PCI-device without binding a driver to
> it (because it needs to run early).
>
> Subsequently trying to bind a driver to it will then fail with -EBUSY
> because of this check in drivers/base/dd.c: really_probe():
>
>         dev_dbg(dev, "bus: '%s': %s: probing driver %s with device\n",
>                 drv->bus->name, __func__, drv->name);
>         if (!list_empty(&dev->devres_head)) {
>                 dev_crit(dev, "Resources present before probing\n");
>                 ret =3D -EBUSY;
>                 goto done;
>         }
>
> Notice the dev_crit() logging here, this is a problem because anything
> logged at critical or higher level will actually get logged to the consol=
e
> even when quiet is present breaking flicker free boot and this is happeni=
ng
> on most AMD Ryzen systems, e.g. :
>
> [    1.141358] pci 0000:00:00.0: bus: 'pci': really_probe: probing driver=
 agpgart-amd64 with device
> [    1.141441] pci 0000:00:00.2: bus: 'pci': really_probe: probing driver=
 agpgart-amd64 with device
> [    1.141444] pci 0000:00:00.2: Resources present before probing
> [    1.141450] pci 0000:00:01.0: bus: 'pci': really_probe: probing driver=
 agpgart-amd64 with device
> [    1.141496] pci 0000:00:02.0: bus: 'pci': really_probe: probing driver=
 agpgart-amd64 with device
>
> The real issue here is that the agpgart-amd64 driver is probing all
> PCI-devices because the match in agp_amd64_pci_promisc_table[] matches al=
l
> PCI-devices.
>
> As can be seen from the class matches in agp_amd64_pci_table[], AGP suppo=
rt
> is always part of the host-bridge. Change the match in
> agp_amd64_pci_promisc_table[] to only match on host-bridges, so that
> the IOMMU will no longer get probed with the agpgart-amd64 driver.
>
> This not only fixes the troublesome dev_crit() logging it should also spe=
ed
> up things in general.
>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
> Given how old AGP is I would expect the agp_amd64_pci_table[] to be
> complete and I wonder if maybe we should not change the default of
> the AMD specific agp_try_unsupported to 0? Note the global non AMD
> specific agp_try_unsupported_boot flag already defaults to 0.

No objections from me.

Alex

> ---
>  drivers/char/agp/amd64-agp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
> index bf490967241a..3f9f4fa3a3f5 100644
> --- a/drivers/char/agp/amd64-agp.c
> +++ b/drivers/char/agp/amd64-agp.c
> @@ -721,7 +721,7 @@ static const struct pci_device_id agp_amd64_pci_table=
[] =3D {
>  MODULE_DEVICE_TABLE(pci, agp_amd64_pci_table);
>
>  static const struct pci_device_id agp_amd64_pci_promisc_table[] =3D {
> -       { PCI_DEVICE_CLASS(0, 0) },
> +       { PCI_DEVICE_CLASS((PCI_CLASS_BRIDGE_HOST << 8), ~0) },
>         { }
>  };
>
> --
> 2.49.0
>
