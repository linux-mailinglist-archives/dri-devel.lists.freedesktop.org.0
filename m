Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1F51A090E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214276E7F5;
	Tue,  7 Apr 2020 08:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A58C6E525
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 06:58:26 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i7so2717884edq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 23:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PTus1HhmAwjgtZusz47Cocd0rsgHoslXEjkAB1idN5Y=;
 b=LmLVHk5Rma0Nob96e5PCxTU6PBnIl0GKYt6IMfMuzeXl+Cn+IpD0cHqvZKFogzUDYb
 20M8qavHrZJ/oppK4Axr2ZxPsKYyRwS0c3r0ClLn+V3m9cUxz43hoiwh8Ht9t01HGuIl
 aTvN0D+uzaCS6c8K3uVAILkdncJrNCXRr0W8N/zyEbrU3KaZJ+VpZW9yxL+oCRJgW69+
 K11w5iz8ViJuSUUq72JQ5h3Pbs0q7pOUytT47Eg77EbM/Xa5HwkRuGX3Wk+6w7VR2E1a
 OLZfq1v08YKU5Ya3f3ks/YBeH3UN9VPl7oQ5xHXJ2252OPK+Wf2jSoIFIVdGG9EZ3nqd
 TiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PTus1HhmAwjgtZusz47Cocd0rsgHoslXEjkAB1idN5Y=;
 b=JTpPVfWA00rTzCTJgAGZknimBmFuoWfMh6SyU+UXflNtri0bTnt0LLqy77W2IbinRV
 L2rNZ8GmLVXnazA1r0GWtfSVomXfUjiUskzPSyLNhzcgGj5gdi89GG+9DDw0/aTjpDRd
 6xR5OGfCNUGhai5Xc24MuC5flfZi6VIHcL+GNi4r2bHtiGePK4BoPJQkpTz+d40EKIK3
 tzk7Lz+0VLdvrb/whUQYjb5V542UX1w1fH8o+7MCkN5CEpF4gQMoQwMdHOfsWG30fGNz
 Qt3OcTOemoz16q24AX9gUQ6WB1DfnP7oIoWwUWOLalHy/XjJMduNJ6Leq9g16qnashfe
 VXDw==
X-Gm-Message-State: AGi0PuYlLQyeUzUQVQMxZBy8BlvIUOjfPosIEiM1wUcvGKIPTo+WxbQR
 /fzyNwXIbQaipqnPHUtqFNK1vAjgA218CJp2wFQ=
X-Google-Smtp-Source: APiQypLmjti+xb31CgGzLznKFFYtZ/CxeWVSEz3Rp3EHyb3R54c8nNJYU4UbSOv1BVwI4hIJZ78v77nix3e9VQlpHQk=
X-Received: by 2002:a50:fa88:: with SMTP id w8mr617737edr.183.1586242705221;
 Mon, 06 Apr 2020 23:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
 <CAP-HsdQtdSeiSe3O8P6Pe587PYAqO48pGJLwf+Tvq20sY_nh=A@mail.gmail.com>
In-Reply-To: <CAP-HsdQtdSeiSe3O8P6Pe587PYAqO48pGJLwf+Tvq20sY_nh=A@mail.gmail.com>
From: Adrian Pop <pop.adrian61@gmail.com>
Date: Tue, 7 Apr 2020 09:58:14 +0300
Message-ID: <CAP-HsdRaSBrFHvVM1onwB1nj7P6k9Qwdpp547tNN9XZvXapqoQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: dw-mipi-dsi.c: Add VPG runtime config
 through debugfs
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 airlied@linux.ie, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 philippe.cornu@st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, yannick.fertre@st.com, alexandre.torgue@st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-by: Adrian Pop <pop.adrian61@gmail.com>
Tested OK on STM32F769i-DISCO, DSI v1.30, on next-20200406.

On Mon, Apr 6, 2020 at 8:45 PM Adrian Pop <pop.adrian61@gmail.com> wrote:
>
> Hello Angelo,
>
> Tested OK on STM32F769i-DISCO, DSI v1.30, on next-20200406. I guess
> there is no horizontal for BER.
>
> Regards,
> Adrian
>
> On Mon, Apr 6, 2020 at 4:49 PM Angelo Ribeiro
> <Angelo.Ribeiro@synopsys.com> wrote:
> >
> > Add support for the video pattern generator (VPG) BER pattern mode and
> > configuration in runtime.
> >
> > This enables using the debugfs interface to manipulate the VPG after
> > the pipeline is set.
> > Also, enables the usage of the VPG BER pattern.
> >
> > Changes in v2:
> >   - Added VID_MODE_VPG_MODE
> >   - Solved incompatible return type on __get and __set
> >
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Adrian Pop <pop.adrian61@gmail.com>
> > Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> > Cc: Joao Pinto <jpinto@synopsys.com>
> > Cc: Jose Abreu <jose.abreu@synopsys.com>
> > Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 98 ++++++++++++++++++++++++---
> >  1 file changed, 90 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > index b18351b..9de3645 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > @@ -91,6 +91,7 @@
> >  #define VID_MODE_TYPE_BURST                    0x2
> >  #define VID_MODE_TYPE_MASK                     0x3
> >  #define VID_MODE_VPG_ENABLE            BIT(16)
> > +#define VID_MODE_VPG_MODE              BIT(20)
> >  #define VID_MODE_VPG_HORIZONTAL                BIT(24)
> >
> >  #define DSI_VID_PKT_SIZE               0x3c
> > @@ -221,6 +222,21 @@
> >  #define PHY_STATUS_TIMEOUT_US          10000
> >  #define CMD_PKT_STATUS_TIMEOUT_US      20000
> >
> > +#ifdef CONFIG_DEBUG_FS
> > +#define VPG_DEFS(name, dsi) \
> > +       ((void __force *)&((*dsi).vpg_defs.name))
> > +
> > +#define REGISTER(name, mask, dsi) \
> > +       { #name, VPG_DEFS(name, dsi), mask, dsi }
> > +
> > +struct debugfs_entries {
> > +       const char                              *name;
> > +       bool                                    *reg;
> > +       u32                                     mask;
> > +       struct dw_mipi_dsi                      *dsi;
> > +};
> > +#endif /* CONFIG_DEBUG_FS */
> > +
> >  struct dw_mipi_dsi {
> >         struct drm_bridge bridge;
> >         struct mipi_dsi_host dsi_host;
> > @@ -238,9 +254,12 @@ struct dw_mipi_dsi {
> >
> >  #ifdef CONFIG_DEBUG_FS
> >         struct dentry *debugfs;
> > -
> > -       bool vpg;
> > -       bool vpg_horizontal;
> > +       struct debugfs_entries *debugfs_vpg;
> > +       struct {
> > +               bool vpg;
> > +               bool vpg_horizontal;
> > +               bool vpg_ber_pattern;
> > +       } vpg_defs;
> >  #endif /* CONFIG_DEBUG_FS */
> >
> >         struct dw_mipi_dsi *master; /* dual-dsi master ptr */
> > @@ -530,9 +549,11 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
> >                 val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
> >
> >  #ifdef CONFIG_DEBUG_FS
> > -       if (dsi->vpg) {
> > +       if (dsi->vpg_defs.vpg) {
> >                 val |= VID_MODE_VPG_ENABLE;
> > -               val |= dsi->vpg_horizontal ? VID_MODE_VPG_HORIZONTAL : 0;
> > +               val |= dsi->vpg_defs.vpg_horizontal ?
> > +                      VID_MODE_VPG_HORIZONTAL : 0;
> > +               val |= dsi->vpg_defs.vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
> >         }
> >  #endif /* CONFIG_DEBUG_FS */
> >
> > @@ -961,6 +982,68 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
> >
> >  #ifdef CONFIG_DEBUG_FS
> >
> > +int dw_mipi_dsi_debugfs_write(void *data, u64 val)
> > +{
> > +       struct debugfs_entries *vpg = data;
> > +       struct dw_mipi_dsi *dsi;
> > +       u32 mode_cfg;
> > +
> > +       if (!vpg)
> > +               return -ENODEV;
> > +
> > +       dsi = vpg->dsi;
> > +
> > +       *vpg->reg = (bool)val;
> > +
> > +       mode_cfg = dsi_read(dsi, DSI_VID_MODE_CFG);
> > +
> > +       if (*vpg->reg)
> > +               mode_cfg |= vpg->mask;
> > +       else
> > +               mode_cfg &= ~vpg->mask;
> > +
> > +       dsi_write(dsi, DSI_VID_MODE_CFG, mode_cfg);
> > +
> > +       return 0;
> > +}
> > +
> > +int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
> > +{
> > +       struct debugfs_entries *vpg = data;
> > +
> > +       if (!vpg)
> > +               return -ENODEV;
> > +
> > +       *val = *vpg->reg;
> > +
> > +       return 0;
> > +}
> > +
> > +DEFINE_DEBUGFS_ATTRIBUTE(fops_x32, dw_mipi_dsi_debugfs_show,
> > +                        dw_mipi_dsi_debugfs_write, "%llu\n");
> > +
> > +static void debugfs_create_files(void *data)
> > +{
> > +       struct dw_mipi_dsi *dsi = data;
> > +       struct debugfs_entries debugfs[] = {
> > +               REGISTER(vpg, VID_MODE_VPG_ENABLE, dsi),
> > +               REGISTER(vpg_horizontal, VID_MODE_VPG_HORIZONTAL, dsi),
> > +               REGISTER(vpg_ber_pattern, VID_MODE_VPG_MODE, dsi),
> > +       };
> > +       int i;
> > +
> > +       dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
> > +       if (!dsi->debugfs_vpg)
> > +               return;
> > +
> > +       memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
> > +
> > +       for (i = 0; i < ARRAY_SIZE(debugfs); i++)
> > +               debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
> > +                                   dsi->debugfs, &dsi->debugfs_vpg[i],
> > +                                   &fops_x32);
> > +}
> > +
> >  static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
> >  {
> >         dsi->debugfs = debugfs_create_dir(dev_name(dsi->dev), NULL);
> > @@ -969,14 +1052,13 @@ static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
> >                 return;
> >         }
> >
> > -       debugfs_create_bool("vpg", 0660, dsi->debugfs, &dsi->vpg);
> > -       debugfs_create_bool("vpg_horizontal", 0660, dsi->debugfs,
> > -                           &dsi->vpg_horizontal);
> > +       debugfs_create_files(dsi);
> >  }
> >
> >  static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi)
> >  {
> >         debugfs_remove_recursive(dsi->debugfs);
> > +       kfree(dsi->debugfs_vpg);
> >  }
> >
> >  #else
> > --
> > 2.7.4
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
