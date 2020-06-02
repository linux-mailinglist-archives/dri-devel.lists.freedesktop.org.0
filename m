Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F3F1EC417
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 22:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742686E46B;
	Tue,  2 Jun 2020 20:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637166E479
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 20:56:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 20B6180511;
 Tue,  2 Jun 2020 22:56:55 +0200 (CEST)
Date: Tue, 2 Jun 2020 22:56:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for KOE
 TX26D202VM0BWA panel
Message-ID: <20200602205653.GC56418@ravnborg.org>
References: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
 <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=8AirrxEcAAAA:8 a=yWwjhyuKAAAA:8 a=nC4w6PE1AAAA:8
 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=rqLoeK0XAFqiYc_KYMYA:9
 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=Af9y4jXI75YbyZfcaVTS:22
 a=6x2acwxlnJam7TDHjV8g:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Liu Ying <victor.liu@nxp.com>, devicetree <devicetree@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.

On Tue, Jun 02, 2020 at 01:46:19PM +0100, Emil Velikov wrote:
> On Tue, 2 Jun 2020 at 08:17, Liu Ying <victor.liu@nxp.com> wrote:
> >
> > This patch adds support for Kaohsiung Opto-Electronics Inc.
> > 10.1" TX26D202VM0BWA WUXGA(1920x1200) TFT LCD panel with LVDS interface.
> > The panel has dual LVDS channels.
> >
> > My panel is manufactured by US Micro Products(USMP).  There is a tag at
> > the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
> > and it's made by KOE in Taiwan.
> >
> > The panel spec from USMP can be found at:
> > https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf
> >
> > The below panel spec from KOE is basically the same to the one from USMP.
> > However, the panel type 'TX26D202VM0BAA' is a little bit different.
> > It looks that the two types of panel are compatible with each other.
> > http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf
> >
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index b6ecd15..7c222ec 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2200,6 +2200,37 @@ static const struct panel_desc koe_tx14d24vm1bpa = {
> >         },
> >  };
> >
> > +static const struct display_timing koe_tx26d202vm0bwa_timing = {
> > +       .pixelclock = { 151820000, 156720000, 159780000 },
> > +       .hactive = { 1920, 1920, 1920 },
> > +       .hfront_porch = { 105, 130, 142 },
> > +       .hback_porch = { 45, 70, 82 },
> > +       .hsync_len = { 30, 30, 30 },
> > +       .vactive = { 1200, 1200, 1200},
> > +       .vfront_porch = { 3, 5, 10 },
> > +       .vback_porch = { 2, 5, 10 },
> > +       .vsync_len = { 5, 5, 5 },
> > +};
> > +
> > +static const struct panel_desc koe_tx26d202vm0bwa = {
> > +       .timings = &koe_tx26d202vm0bwa_timing,
> > +       .num_timings = 1,
> > +       .bpc = 8,
> > +       .size = {
> > +               .width = 217,
> > +               .height = 136,
> > +       },
> > +       .delay = {
> > +               .prepare = 1000,
> > +               .enable = 1000,
> > +               .unprepare = 1000,
> > +               .disable = 1000,
> Ouch 1s for each delay is huge. Nevertheless it matches the specs so,
> the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> Sam, Thierry I assume you'll merge the series. Let me know if I should
> pick it up.
I am quite busy with non-linux stuff these days so fine if you can pick
them up. I like that simple panel patches are processed fast.

I expect to have some hours for linux work friday or saturday, but no
promises...

	Sam


> 
> -Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
